!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! to calculate the coefficients c_{nj} and the RCS in time domain.
subroutine ptdemfie(freq, this, phis, scaling_s, max_rank, &
    mono, thss, phss, filebasename, ictxt)
use mymod
implicit none
! subroutine arguments
integer max_rank, ictxt
logical mono
real freq, scaling_s, this(:), phis(:), thss(:), phss(:)
character*64 filebasename
    ! interfaces
    interface
        subroutine tran(point, triangle, edge)
            use mymod
            implicit none
            real :: point(:,:)
            type(t_edge) edge(:)
            type(t_triangle) triangle(:)
        end subroutine tran
        subroutine zform(z, amnij, bmnij, descz, edge, triangle, scaling_s, &
            max_rank, ictxt)
            use mymod
            implicit none
            integer max_rank, ictxt, descz(DLEN_)
            real z(:,:), scaling_s
            real amnij(:,:,0:), bmnij(:,:,0:)
            type(t_edge) edge(:)
            type(t_triangle) triangle(:)
        end subroutine zform
        subroutine vform(edge, triangle, scaling_s, out_cni, &
            amnij, bmnij, descz, v_rhs, descv, i_rank, freq, max_r, &
            inc_wave, ictxt)
            use mymod
            implicit none
            integer i_rank, descz(DLEN_), descv(DLEN_), ictxt
            real scaling_s, out_cni(:, :, 0:), amnij(:,:,0:), &
                bmnij(:,:,0:), v_rhs(:, :), freq, max_r, inc_wave(:, :, :)
            type(t_edge) edge(:)
            type(t_triangle) triangle(:)
        end subroutine vform
        function cal_est(num_time, step, direction, out_cni, &
            scaling_s, max_rank, triangle, edge, ictxt, descv, nqrhs, &
            descrcs)
            use mymod
            implicit none
            real cal_est(3,0:num_time,nqrhs), direction(3), &
                out_cni(:,:,0:), scaling_s, step
            integer max_rank, num_time, ictxt, descv(DLEN_), &
                nqrhs, descrcs(DLEN_)
            type(t_edge) edge(:)
            type(t_triangle) triangle(:)
        end function cal_est
        function one_multi_dot(dimen, one, multi, num)
            integer dimen, num
            real one_multi_dot(num), one(dimen), multi(dimen, num)
        end function one_multi_dot
    end interface
    ! Local variables
    integer num_triangles, num_points, num_edges, info, i_rank, num_time
    real max_r, maxtime, step, t0_delay, time_cut, tv, p_dir(3)
    integer, allocatable :: ipiv(:)
    real, allocatable :: point(:,:), z(:,:), out_cni(:,:,:), &
        inc_wave(:,:,:), s_direction(:,:), amnij(:,:,:), bmnij(:,:,:)
    integer i_dir, s_dir, n_i_dir, n_s_dir, time, k_var
    real, allocatable :: e_s_rt(:,:,:), rcs(:,:,:), grcs(:,:,:)
    type(t_edge), allocatable :: edge(:)
    type(t_triangle), allocatable :: triangle(:)
    !
    integer iam, nprocs, nprow, npcol, myrow, mycol, lcrow, numroc, &
        lccol, nqrhs, lcol, col, indxl2g
!     .. parameters ..
    integer            descz( DLEN_ ), descv( DLEN_ ), descrcs(DLEN_)
    character*64 bujianming
    ! Excutives
    !   get starting information
    call blacs_pinfo( iam, nprocs )
    call blacs_gridinfo( ictxt, nprow, npcol, myrow, mycol )

    n_i_dir=ubound(phis, 1)
    open(unit=1455+iam,file=trim(filebasename)//'.tri',status='old', action='read')
    read(1455+iam,*) num_triangles, num_points
    read(1455+iam,*) max_r ! 这行为部件数，在本子程序中暂时无用，跳过
    read(1455+iam,*) bujianming ! 部件名跳过
    !read(1455+iam,*) bujianming ! 颜色索引跳过 新 emsys 程序要把这行删除
    read(1455+iam,*) bujianming ! 部件最后面元的总序号，跳过
    allocate(point(3, num_points), triangle(num_triangles))
    read(1455+iam,*) (max_r, point(:,time), time=1, num_points)
    read(1455+iam,*) (max_r,triangle(time)%poi, time=1, num_triangles)
    close(1455+iam)
    open(unit=1503+iam,file=trim(filebasename)//'.part',status='old', action='read')
    read(1503+iam,*) num_edges
    allocate(edge(num_edges))
    read(1503+iam,*) (edge(time)%tri(1), edge(time)%tri(2), edge(time)%poi(1), &
        edge(time)%poi(3), edge(time)%res_angle, time=1, num_edges)
    close(1503+iam)
    call tran(point, triangle, edge)
#ifdef VERBOSE
    if (iam == 0) then
        call date_and_time(my_date, my_time)
        write(*,*) my_time, ': tran data have done.'
    end if
#endif
    max_r=maxval(sqrt(point(1,:)*point(1,:)+point(2,:)*point(2,:)+ &
        point(3,:)*point(3,:)))
    deallocate(point)
    lcrow= numroc( num_edges, BLOCKSIZE, myrow, 0, nprow )
    lccol= numroc( num_edges, BLOCKSIZE, mycol, 0, npcol )
    nqrhs= numroc( 2*n_i_dir, max(int(2*n_i_dir/npcol),1), mycol, 0, npcol )
    call descinit( descz, num_edges, num_edges, BLOCKSIZE, BLOCKSIZE, 0, &
        0, ictxt, max(lcrow,1),  info )
    call descinit( descv, num_edges, 2*n_i_dir, BLOCKSIZE, max(int(2*n_i_dir/npcol),1), &
        0, 0, ictxt, max(lcrow,1), info )
    ! z is generally distributed stored.
    allocate(z(lcrow, lccol))
    allocate(amnij(lcrow, lccol, 0:max_rank), &
        bmnij(lcrow, lccol, 0:max_rank))
    call zform(z, amnij, bmnij, descz, edge, triangle, scaling_s, max_rank, &
        ictxt)
#ifdef VERBOSE
    if(iam==0) then
        call date_and_time(my_date, my_time)
        write(*,*) my_time, ': zform have done.'
    end if
#endif
    allocate(ipiv(lcrow+BLOCKSIZE))
    !Computes the LU factorization of a general m-by-n distributed matrix.
    call PGETRF( num_edges, num_edges, z, 1, 1, descz, ipiv, info )
#ifdef VERBOSE
    if(iam==0) then
        call date_and_time(my_date, my_time)
        write(*,*) my_time, ': The matrix have been factorized.'
    end if
#endif
    allocate(out_cni(lcrow, nqrhs, 0:max_rank))
    allocate(inc_wave(3, 3, nqrhs))
    do lcol=1, nqrhs
        col=indxl2g( lcol, descv(NB_), mycol, descv(CSRC_), npcol )
        if (col > n_i_dir) then
            col=col-n_i_dir
        end if
        inc_wave(1,1,lcol)= -sin(this(col))*cos(phis(col)) ! 入射波矢量 k
        inc_wave(2,1,lcol)= -sin(this(col))*sin(phis(col))
        inc_wave(3,1,lcol)= -cos(this(col))
        inc_wave(1,2,lcol)= cos(this(col))*cos(phis(col)) ! 入射波 theta 极化方向矢量
        inc_wave(2,2,lcol)= cos(this(col))*sin(phis(col))
        inc_wave(3,2,lcol)= -sin(this(col))
        inc_wave(1,3,lcol)= -sin(phis(col)) ! 入射波 phi 极化方向矢量
        inc_wave(2,3,lcol)= cos(phis(col))
        inc_wave(3,3,lcol)= 0._DKIND
    end do
    call vform(edge, triangle, scaling_s, out_cni, &
        amnij, bmnij, descz, out_cni(:,:,0), descv, 0, freq, max_r, &
        inc_wave, ictxt)
    call PGETRS('N', num_edges, descv(N_), z, 1, 1, descz, ipiv, &
        out_cni(:,:,0), 1, 1, descv, info)
    do i_rank=1,max_rank
        call vform(edge, triangle, scaling_s, out_cni, &
            amnij, bmnij, descz, out_cni(:,:,i_rank), descv, &
            i_rank, freq, max_r, inc_wave, ictxt)
#ifdef VERBOSE
        if(iam==0) then
            call date_and_time(my_date, my_time)
            write(*,*) my_time, ': vform i_rank', i_rank, 'have done.'
        end if
#endif
        call PGETRS('N', num_edges, descv(N_), z, 1, 1, descz, ipiv, &
            out_cni(:,:,i_rank), 1, 1, descv, info)
#ifdef VERBOSE
        if(iam==0) then
            call date_and_time(my_date, my_time)
            write(*,*) my_time, ': The solver i_rank', i_rank, 'have done.'
        end if
#endif
    end do
    deallocate(z, amnij, bmnij)
    ! 下面开始计算时域的 RCS 信号
    n_s_dir=ubound(phss,1)
    ! Determine corresponding time-domain parameters:
    tv = -log(10.**(BWR/20.))/(2.*PI*freq)/(PI*freq)*CC_0*CC_0
    time_cut = sqrt(-2.*tv*log(10.**(TPR/20.))); ! Pulse cutoff time
    t0_delay = time_cut + max_r
    maxtime=t0_delay+time_cut+WAIT_TIMES*2.*time_cut
    step=CC_0/freq/TIME_STEP
    num_time=maxtime/step
    allocate(s_direction(3, n_s_dir))
    s_direction(1,:)= sin(thss)*cos(phss)
    s_direction(2,:)= sin(thss)*sin(phss)
    s_direction(3,:)= cos(thss)
    call descinit( descrcs, 1, 2*n_i_dir, BLOCKSIZE, max(int(2*n_i_dir/npcol),1), &
        0, 0, ictxt, 1, info )
    allocate(e_s_rt(3,0:num_time,nqrhs))
    allocate(rcs(0:num_time, n_s_dir, nqrhs))
    do i_rank=max_rank, 0, -1
        out_cni(:,:,i_rank)=out_cni(:,:,i_rank)*.5_DKIND
        do k_var=0, i_rank-1
            out_cni(:,:,i_rank)=out_cni(:,:,i_rank)+out_cni(:,:,k_var)
        end do
    end do
    do s_dir=1, n_s_dir
        e_s_rt=cal_est(num_time, step, s_direction(:,s_dir), &
            out_cni, scaling_s, max_rank, triangle, edge, ictxt, &
            descv, nqrhs, descrcs)
        do lcol=1, nqrhs
            col=indxl2g( lcol, descv(NB_), mycol, descv(CSRC_), npcol )
            if (col>n_i_dir) then
                p_dir(1)=-sin(phss(s_dir))
                p_dir(2)=cos(phss(s_dir))
                p_dir(3)=0._DKIND
            else
                p_dir(1)=cos(thss(s_dir))*cos(phss(s_dir))
                p_dir(2)=cos(thss(s_dir))*sin(phss(s_dir))
                p_dir(3)=-sin(thss(s_dir))
            end if
            rcs(:, s_dir, lcol)=one_multi_dot(3, p_dir, &
                e_s_rt(:,:,lcol), num_time+1)
        end do
    end do
    deallocate(out_cni, triangle, edge, e_s_rt)
    call blacs_barrier( ictxt, 'All' )
    allocate(grcs(0:num_time, n_s_dir, 2*n_i_dir))
    do s_dir=1, n_s_dir
    do time=0, num_time
        call PLAHEBING(grcs(time,s_dir,:), 1, 2*n_i_dir, &
            rcs(time, s_dir, :), 1, 1, descrcs, 0, 0)
    end do
    end do
    ! 写入时域 RCS 信号
    if (iam==0) then
    open(unit=1552,file=trim(filebasename)//'.rcst',form='formatted')
    if (mono) then
        n_s_dir=1
        do i_dir=2, n_i_dir
            grcs(:,1,i_dir)=grcs(:,i_dir,i_dir)
            grcs(:,1,i_dir+n_i_dir)=grcs(:,i_dir,i_dir+n_i_dir)
        end do
    ! 头：列数；垂直极化；水平极化
    write(1552,1937) 2*n_i_dir*n_s_dir+1, 0._DKIND, &
        (/(1, time=1,n_i_dir*n_s_dir)/), (/(2, time=1,n_i_dir*n_s_dir)/), &
        ! 0; 入射角 theta. 0; 入射角phi
        0._DKIND,0._DKIND,(/((this(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/),(/((this(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/), &
        0._DKIND,0._DKIND,(/((phis(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/),(/((phis(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/), &
        ! 散射角theta, phi
        0._DKIND,0._DKIND,(/((this(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/),(/((this(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/), &
        0._DKIND,0._DKIND,(/((phis(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/),(/((phis(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/), &
        (time*step/CC_0,exp(-(time*step-t0_delay)*(time*step-t0_delay)/ &
        (tv*2._DKIND)),grcs(time, 1, :), time=0,num_time) ! 时间输出单位为 ns
    else
    ! 头：列数；垂直极化；水平极化
    write(1552,1937) 2*n_i_dir*n_s_dir+1, 0._DKIND, &
        (/(1, time=1,n_i_dir*n_s_dir)/), (/(2, time=1,n_i_dir*n_s_dir)/), &
        ! 0; 入射角 theta. 0; 入射角phi
        0._DKIND,0._DKIND,(/((this(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/),(/((this(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/), &
        0._DKIND,0._DKIND,(/((phis(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/),(/((phis(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/), &
        ! 散射角theta, phi
        0._DKIND,0._DKIND,(/((thss(s_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/),(/((thss(s_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/), &
        0._DKIND,0._DKIND,(/((phss(s_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/),(/((phss(s_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/), &
        (time*step/CC_0,exp(-(time*step-t0_delay)*(time*step-t0_delay)/ &
        (tv*2._DKIND)),grcs(time, :, :), time=0,num_time) ! 时间输出单位为 ns
    end if
    close(1552)
1937    format(<2*n_i_dir*n_s_dir+2>G15.7)
    end if
    deallocate(rcs)
    call blacs_barrier( ictxt, 'All' )
end subroutine ptdemfie
