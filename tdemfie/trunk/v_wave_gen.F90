!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! solve the \vec{V}_i(\vec{r}) integration.
function v_wave_gen(point, i_rank, scaling_s, freq, &
            max_r, k_uvec_wave, num_dir)
implicit none
! arguments
! max_r is the maxmium Abs(r)
! v_wave_gen(3, 1:num_dir) for theta polarization
integer i_rank, num_dir
real v_wave_gen(3,2*num_dir), point(3), scaling_s, freq, max_r, &
    k_uvec_wave(3,num_dir)
    ! interfaces
    interface
        function multicrossuni(x1, x2, nums)
            integer nums
            real x1(3, nums), x2(3, nums), multicrossuni(3, nums)
        end function
    end interface
    ! local variables
    integer flag, dir, time_step, i, j
    real r, tpr, bwr, tv, time_cut, t0_delay, delta ! in dB
    real v_scalar(num_dir), t(5), a1(5), lb, ub, c, &
        q, h, rg, x, s, delay
    real theta_vec(3,num_dir), phi_vec(3,num_dir), DOT, psi_func, &
        zunivec(3, num_dir)
    data t/-0.9061798459,-0.5384693101,0.,0.5384693101,0.9061798459/
    data a1/0.2369268851,0.4786286705,0.568888889,0.4786286705,0.2369268851/
    ! Excutives
    tpr = -60.; bwr= -6.
    ! Determine Gaussian mean and variance in the
    ! frequency domain to match specifications:
    r = 10.**(bwr/20.);             ! Ref level (fraction of max peak)
    !omegav = -(2.*PI*freq)*(2.*PI*freq)/(2.*log(r)); ! variance is fv
    ! Determine corresponding time-domain parameters:
    tv = -log(r)/(2.*PI*freq)/(PI*freq);  ! variance is tv, mean is 0

    ! Determine extent (pulse length) of time-domain envelope:
    delta = 10.**(tpr/20.);        ! Ref level (fraction of max peak)
    time_cut = sqrt(-2.*tv*log(delta)); ! Pulse cutoff time
    t0_delay = time_cut + max_r/VECL_C
    ! Compute time-domain pulse envelope, normalized by sqrt(2*pi*tv):
    ! 用高斯积分，5 阶
    v_scalar = 0.
    do dir=1, num_dir
        delay = t0_delay+DOT(3,k_uvec_wave(:,dir),1,point,1)/VECL_C
        lb=delay-time_cut
        ub=delay+time_cut
        time_step=1; c = abs(lb) + abs(ub); q = 0.; flag = -1
        do while(flag==-1)
            v_scalar(dir)=0.
            h=(ub-lb)/time_step
            do i=1,time_step
                rg=lb+h*(i-1)
                s=lb+h*i
                do j=1, 5
                    x=0.5*((s-rg)*t(j)+(s+rg))
                    v_scalar(dir)=v_scalar(dir)+a1(j)* &
                        exp(-(x-delay)*(x-delay)/(2.*tv))* &
                            psi_func(i_rank, scaling_s*x)
                end do
            end do
            v_scalar(dir)=0.5*v_scalar(dir)*h
            if (EPS-abs(v_scalar(dir)-q)/(abs(v_scalar(dir))+.001)<0) then
                q=v_scalar(dir)
                time_step=time_step+1
                if (time_step>MAX_STP) then
                    flag=0
                elseif (c+h/=c) then
                    flag=-1
                end if
            else
                flag=1
            end if
        end do
#ifdef VERBOSE
        if (flag==0) then ! flag 为零，积分达到最大迭代次数
            write(*,*) '高斯积分退出标志', flag
        end if
#endif
    end do
    v_scalar=v_scalar*scaling_s
    zunivec=reshape((/((/0.,0.,1./),dir=1,num_dir)/),(/3,num_dir/))
    phi_vec=multicrossuni(k_uvec_wave, zunivec, num_dir)
    theta_vec=multicrossuni(phi_vec, k_uvec_wave, num_dir)
    v_wave_gen(1,1:num_dir)=theta_vec(1,:)*v_scalar
    v_wave_gen(2,1:num_dir)=theta_vec(2,:)*v_scalar
    v_wave_gen(3,1:num_dir)=theta_vec(3,:)*v_scalar
    v_wave_gen(1,num_dir+1:2*num_dir)=phi_vec(1,:)*v_scalar
    v_wave_gen(2,num_dir+1:2*num_dir)=phi_vec(2,:)*v_scalar
    v_wave_gen(3,num_dir+1:2*num_dir)=phi_vec(3,:)*v_scalar
end function v_wave_gen
