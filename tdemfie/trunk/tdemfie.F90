!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! to calculate the coefficients c_{nj} and the RCS in time domain.
subroutine tdemfie(freq, this, phis, scaling_s, max_rank, nrmfile, &
    mono, thss, phss, outfile)
use mymod
implicit none
! subroutine arguments
! nrmfile for: 已配对转换完毕的数据，或者本次转换要存储的文件名
integer max_rank
logical mono
real freq, scaling_s, this(:), phis(:), thss(:), phss(:)
character*64 nrmfile, outfile
    ! interfaces
    interface
        subroutine zform(z, amnij, bmnij, edge, triangle, scaling_s, &
            max_rank)
            use mymod
            integer max_rank
            real z(:), scaling_s
            real amnij(0:, :), bmnij(0:, :)
            type(t_edge) edge(:)
            type(t_triangle) triangle(:)
        end subroutine zform
        subroutine vform(dim_z, edge, triangle, scaling_s, out_cni, &
            num_dir, amnij, bmnij, v_rhs, i_rank, freq, max_r, &
            inc_wave)
            use mymod
            integer dim_z, num_dir, i_rank
            real scaling_s, out_cni(:, :, 0:), amnij(0:,:), &
                bmnij(0:,:), v_rhs(dim_z, 2*num_dir), freq, max_r, &
                inc_wave(3, 3, num_dir)
            type(t_edge) edge(:)
            type(t_triangle) triangle(:)
        end subroutine vform
        function cal_est(num_time, step, direction, i_dir, polar, out_cni, &
            scaling_s, max_rank, triangle, edge)
            use mymod
            integer i_dir, polar, max_rank, num_time
            real cal_est(3,0:num_time), direction(3), out_cni(:,:,0:), &
                scaling_s, step
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
    real max_r, maxtime, p_dir(3), step, t0_delay, time_cut
    integer, allocatable :: ipiv(:)
    real, allocatable :: point(:,:), z(:), out_cni(:,:,:), &
        inc_wave(:,:,:), s_direction(:,:), amnij(:, :), bmnij(:, :)
    integer i_dir, s_dir, n_i_dir, n_s_dir, polar, time, k_var
    real, allocatable :: e_s_rt(:,:), rcs(:,:,:,:)
    type(t_edge), allocatable :: edge(:)
    type(t_triangle), allocatable :: triangle(:)
    ! Excutives
    n_i_dir=ubound(phis, 1)
    open(unit=1445,file=nrmfile,form="unformatted",status='old', action='read')
    read(1445) num_edges, num_triangles, num_points
    close(1445)
    allocate(point(3,num_points),edge(num_edges), triangle(num_triangles))
    open(unit=1445,file=nrmfile,form="unformatted",status='old', action='read')
    read(1445) num_edges, num_triangles, num_points, edge, triangle, point
    close(1445)
    max_r=max(abs(maxval(point)),abs(minval(point)))*sqrt(3._DKIND)
    deallocate(point)
    ! z if packed stored.
    allocate(z(num_edges*(num_edges+1)/2))
    allocate(amnij(0:max_rank, num_edges*(num_edges+1)/2), &
        bmnij(0:max_rank, num_edges*(num_edges+1)/2))
    call zform(z, amnij, bmnij, edge, triangle, scaling_s, max_rank)
#ifdef VERBOSE
    call date_and_time(my_date, my_time)
    write(*,*) my_time, ': zform have done.'
#endif
    allocate(ipiv(num_edges))
    ! Computes the Bunch-Kaufman factorization of a symmetric matrix using
    ! packed storage.
    call SPTRF('U', num_edges, z, ipiv, info)
#ifdef VERBOSE
    call date_and_time(my_date, my_time)
    write(*,*) my_time, ': The matrix have been factorized.'
#endif
    allocate(out_cni(num_edges, 2*n_i_dir, 0:max_rank))
    allocate(inc_wave(3, 3, n_i_dir))
    inc_wave(1,1,:)= -sin(this)*cos(phis) ! 入射波矢量 k
    inc_wave(2,1,:)= -sin(this)*sin(phis)
    inc_wave(3,1,:)= -cos(this)
    inc_wave(1,2,:)= cos(this)*cos(phis) ! 入射波 theta 极化方向矢量
    inc_wave(2,2,:)= cos(this)*sin(phis)
    inc_wave(3,2,:)= -sin(this)
    inc_wave(1,3,:)= -sin(phis) ! 入射波 phi 极化方向矢量
    inc_wave(2,3,:)= cos(phis)
    inc_wave(3,3,:)= 0._DKIND
    call vform(num_edges, edge, triangle, scaling_s, out_cni, n_i_dir, &
        amnij, bmnij, out_cni(:,:,0), 0, freq, max_r, inc_wave)
    call SPTRS('U', num_edges, 2*n_i_dir, z, ipiv, out_cni(:,:,0), &
        num_edges, info)
    do i_rank=1,max_rank
        call vform(num_edges, edge, triangle, scaling_s, out_cni, n_i_dir, &
            amnij, bmnij, out_cni(:,:,i_rank), i_rank, freq, max_r, &
            inc_wave)
#ifdef VERBOSE
        call date_and_time(my_date, my_time)
        write(*,*) my_time, ': vform i_rank', i_rank, 'have done.'
#endif
        call SPTRS('U', num_edges, 2*n_i_dir, z, ipiv, out_cni(:,:,i_rank), &
            num_edges, info)
#ifdef VERBOSE
        call date_and_time(my_date, my_time)
        write(*,*) my_time, ': The solver i_rank', i_rank, 'have done.'
#endif
    end do
    deallocate(z, amnij, bmnij)
    ! 下面开始计算时域的 RCS 信号
    if (mono) then
        n_s_dir=1
    else
        n_s_dir=ubound(phss,1)
    end if
    step=CC_0/(2.55234*freq)/TIME_STEP
    time_cut=CC_0*0.695324/freq
    t0_delay = 3. !time_cut + max_r
    !maxtime=t0_delay+max_r+time_cut+WAIT_TIMES*2.*time_cut
    maxtime=t0_delay+time_cut+WAIT_TIMES*2.*time_cut
    num_time=maxtime/step
    allocate(s_direction(3, n_s_dir))
    s_direction(1,:)= sin(thss)*cos(phss)
    s_direction(2,:)= sin(thss)*sin(phss)
    s_direction(3,:)= cos(thss)
    allocate(e_s_rt(3,0:num_time))
    allocate(rcs(0:num_time, n_s_dir, n_i_dir, 2))
    do i_rank=max_rank, 0, -1
        out_cni(:,:,i_rank)=out_cni(:,:,i_rank)*.25_DKIND
        do k_var=0, i_rank-1
            out_cni(:,:,i_rank)=out_cni(:,:,i_rank)+(i_rank-k_var)* &
                out_cni(:,:,k_var)
        end do
    end do
    if (mono) then
        do i_dir=1, n_i_dir
        do polar=1, 2 ! ploar 1 for theta polarization, 2 for phi.
            e_s_rt=cal_est(num_time, step, -inc_wave(:,1,i_dir), i_dir, &
                polar, out_cni, scaling_s, max_rank, triangle, edge)
            if (polar==1) then
                p_dir=inc_wave(:,2,i_dir)
            else
                p_dir=inc_wave(:,3,i_dir)
            end if
            rcs(:, 1, i_dir,polar)=one_multi_dot(3, p_dir, e_s_rt, num_time+1)
        end do
        end do
    else
        do i_dir=1, n_i_dir
        do s_dir=1, n_s_dir
        do polar=1, 2 ! ploar 1 for theta polarization, 2 for phi.
            e_s_rt=cal_est(num_time, step, s_direction(:,s_dir), i_dir, &
                polar, out_cni, scaling_s, max_rank, triangle, edge)
            if (polar==1) then
                p_dir(1)=cos(thss(s_dir))*cos(phss(s_dir))
                p_dir(2)=cos(thss(s_dir))*sin(phss(s_dir))
                p_dir(3)=-sin(thss(s_dir))
            else
                p_dir(1)=-sin(phss(s_dir))
                p_dir(2)=cos(phss(s_dir))
                p_dir(3)=0._DKIND
            end if
            rcs(:, s_dir, i_dir,polar)=one_multi_dot(3, p_dir, &
                e_s_rt, num_time+1)
        end do
        end do
        end do
    end if
    deallocate(out_cni, triangle, edge, e_s_rt)
    ! 写入时域 RCS 信号
    open(unit=1552,file=outfile,form='formatted')
    if (mono) then
    ! 头：列数；垂直极化；水平极化
    write(1552,1937) 2*n_i_dir*n_s_dir+1, &
        (/(1, time=1,n_i_dir*n_s_dir)/), (/(2, time=1,n_i_dir*n_s_dir)/), &
        ! 0; 入射角 theta. 0; 入射角phi
        0._DKIND,(/((this(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/),(/((this(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/), &
        0._DKIND,(/((phis(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/),(/((phis(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/), &
        ! 散射角theta, phi
        0._DKIND,(/((this(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/),(/((this(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/), &
        0._DKIND,(/((phis(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/),(/((phis(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/), &
        (time*step/CC_0,rcs(time, :, :, :), time=0,num_time) ! 时间输出单位为 ns
    else
    ! 头：列数；垂直极化；水平极化
    write(1552,1937) 2*n_i_dir*n_s_dir+1, &
        (/(1, time=1,n_i_dir*n_s_dir)/), (/(2, time=1,n_i_dir*n_s_dir)/), &
        ! 0; 入射角 theta. 0; 入射角phi
        0._DKIND,(/((this(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/),(/((this(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/), &
        0._DKIND,(/((phis(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/),(/((phis(i_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/), &
        ! 散射角theta, phi
        0._DKIND,(/((thss(s_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/),(/((thss(s_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/), &
        0._DKIND,(/((phss(s_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/),(/((phss(s_dir)*180._DKIND/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/), &
        (time*step/CC_0,rcs(time, :, :, :), time=0,num_time) ! 时间输出单位为 ns
    end if
    close(1552)
    deallocate(rcs)
1937    format(<2*n_i_dir*n_s_dir+1>G15.7)
end subroutine tdemfie
