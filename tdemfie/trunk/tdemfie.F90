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
        subroutine zform(z, alpha, dim_z, edge, point, scaling_s)
            real z(:), alpha(:), point(:, :), scaling_s
            integer dim_z, edge(:, :)
        end subroutine zform
        subroutine vform(dim_z, edge, point, scaling_s, out_cni, n_i_dir, &
            alpha, v_rhs, i_rank, freq, max_r, k_uvec_wave)
            integer dim_z, edge(:,:), n_i_dir, i_rank
            real point(:,:), scaling_s, out_cni(:, :, 0:), alpha(:), &
                v_rhs(dim_z, 2*n_i_dir), freq, max_r, k_uvec_wave(3, n_i_dir)
        end subroutine vform
        function cal_est(num_time, step, direction, i_dir, polar, out_cni, &
            scaling_s, max_rank, point, edge)
            integer i_dir, edge(:,:), polar, max_rank, num_time
            real cal_est(3,0:num_time), direction(3), out_cni(:,:,0:), &
                scaling_s, point(:,:), step
        end function cal_est
        function crossuni(x1, x2)
            real x1(3), x2(3), crossuni(3)
        end function crossuni
        function one_multi_dot(dimen, one, multi, num)
            integer dimen, num
            real one_multi_dot(num), one(dimen), multi(dimen, num)
        end function one_multi_dot
    end interface
    ! Local variables
    integer num_points, num_edges, info, i_rank, num_time
    real max_r, maxtime, p_dir(3), step, t0_delay, time_cut
    integer, allocatable :: edge(:,:), ipiv(:)
    real, allocatable :: point(:,:), z(:), alpha(:), out_cni(:,:,:), &
        k_uvec_wave(:,:), s_direction(:,:)
    integer i_dir, s_dir, n_i_dir, n_s_dir, polar, time
    real, allocatable :: e_s_rt(:,:), rcs(:,:,:,:)
    real z_uni(3)
    ! Excutives
    n_i_dir=ubound(phis, 1)
    open(unit=1445,file=nrmfile,form="unformatted",status='old', action='read')
    read(1445) num_points, num_edges
    close(1445)
    allocate(point(3,num_points),edge(4,num_edges))
    open(unit=1445,file=nrmfile,form="unformatted",status='old', action='read')
    read(1445) num_points, num_edges, point, edge
    close(1445)
    max_r=max(abs(maxval(point)),abs(minval(point)))
    ! z if packed stored.
    allocate(z(num_edges*(num_edges+1)/2),alpha(num_edges*(num_edges+1)/2))
    call zform(z, alpha, num_edges, edge, point, scaling_s)
    allocate(ipiv(num_edges))
    ! Computes the Bunch-Kaufman factorization of a symmetric matrix using
    ! packed storage.
    call SPTRF('U', num_edges, z, ipiv, info)
    allocate(out_cni(num_edges, 2*n_i_dir, 0:max_rank))
    allocate(k_uvec_wave(3, n_i_dir))
    k_uvec_wave(1,:)= -sin(this)*cos(phis)
    k_uvec_wave(2,:)= -sin(this)*sin(phis)
    k_uvec_wave(3,:)= -cos(this)
    call vform(num_edges, edge, point, scaling_s, out_cni, n_i_dir, alpha, &
        out_cni(:,:,0), 0, freq, max_r, k_uvec_wave)
    call SPTRS('U', num_edges, 2*n_i_dir, z, ipiv, out_cni(:,:,0), &
        num_edges, info)
    do i_rank=1,max_rank
        call vform(num_edges, edge, point, scaling_s, out_cni, n_i_dir, alpha, &
            out_cni(:,:,i_rank), i_rank, freq, max_r, k_uvec_wave)
        call SPTRS('U', num_edges, 2*n_i_dir, z, ipiv, out_cni(:,:,i_rank), &
            num_edges, info)
#ifdef VERBOSE
        call date_and_time(my_date, my_time)
        write(*,*) my_time, ': vform SPTRS i_rank', i_rank, 'have done.'
#endif
    end do
    deallocate(z, alpha)
    ! 下面开始计算时域的 RCS 信号
    if (mono) then
        n_s_dir=1
    else
        n_s_dir=ubound(phss,1)
    end if
    step=1/freq/TIME_STEP
    time_cut=0.695324/freq
    t0_delay = time_cut + max_r/VECL_C
    maxtime=t0_delay+max_r/VECL_C+time_cut+WAIT_TIMES*2*time_cut
    num_time=maxtime/step
    allocate(s_direction(3, n_s_dir))
    s_direction(1,:)= sin(thss)*cos(phss)
    s_direction(2,:)= sin(thss)*sin(phss)
    s_direction(3,:)= cos(thss)
    allocate(e_s_rt(3,0:num_time))
    allocate(rcs(0:num_time, n_s_dir, n_i_dir, 2))
    z_uni=(/0,0,1/)
    do polar=1, 2 ! ploar 1 for theta polarization, 2 for phi.
    do i_dir=1, n_i_dir
    if (mono) then
        e_s_rt=cal_est(num_time, step, -k_uvec_wave(:,i_dir), i_dir, &
            polar, out_cni, scaling_s, max_rank, point, edge)
        p_dir= crossuni(k_uvec_wave(:,i_dir),z_uni)
        if (polar==1) then
            p_dir=crossuni(p_dir,k_uvec_wave(:,i_dir))
        end if
        rcs(:, 1, i_dir,polar)=one_multi_dot(3, p_dir, e_s_rt, num_time+1)
    else
        do s_dir=1, n_s_dir
            e_s_rt=cal_est(num_time, step, s_direction(:,s_dir), i_dir, &
                polar, out_cni, scaling_s, max_rank, point, edge)
            p_dir= crossuni(z_uni,s_direction(:,s_dir))
            if (polar==1) then
                p_dir=crossuni(s_direction(:,s_dir),p_dir)
            end if
            rcs(:, s_dir, i_dir,polar)=one_multi_dot(3, p_dir, &
                e_s_rt, num_time+1)
        end do
    end if
    end do
    end do
    deallocate(out_cni, point, edge, e_s_rt)
    ! 写入时域 RCS 信号
    open(unit=1552,file=outfile,status='unknown', action='write')
    write(1552,*) 0.,(/(1, time=1,n_i_dir*n_s_dir)/), &
        (/(2, time=1,n_i_dir*n_s_dir)/)
    write(1552,*) 0.,(/((this(i_dir)*180/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/),(/((this(i_dir)*180/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/)
    write(1552,*) 0.,(/((phis(i_dir)*180/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/),(/((phis(i_dir)*180/PI,s_dir=1,n_s_dir), &
        i_dir=1,n_i_dir)/)
    if (mono) then
        write(1552,*) 0.,(/((this(i_dir)*180/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/),(/((this(i_dir)*180/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/)
        write(1552,*) 0.,(/((phis(i_dir)*180/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/),(/((phis(i_dir)*180/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/)
    else
        write(1552,*) 0.,(/((thss(s_dir)*180/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/),(/((thss(s_dir)*180/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/)
        write(1552,*) 0.,(/((phss(s_dir)*180/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/),(/((phss(s_dir)*180/PI,s_dir=1,n_s_dir), &
            i_dir=1,n_i_dir)/)
    end if
    do time=0, num_time
        write(1552,*) time*step*1e9,rcs(time, :, :, :) ! 时间输出单位为 ns
    end do
    close(1552)
    deallocate(rcs)
end subroutine tdemfie
