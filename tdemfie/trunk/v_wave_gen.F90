!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL:  $
! $Id: common.f90,v 1.9 2004/08/30 02:49:58 i Exp $
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
! local variables
integer int_inc, dir
real r, omegav, tpr, bwr, tv, time_cut, t0_delay, delta ! in dB
real time_step, hight1, hight2, current_pos, v_scalar(num_dir)
real theta_vec(3,num_dir), phi_vec(3,num_dir), DOT, psi_func, multicrossuni
! Excutives
tpr = -60; bwr= -6
! Determine Gaussian mean and variance in the
! frequency domain to match specifications:
r = 10.**(bwr/20);             ! Ref level (fraction of max peak)
omegav = -(2*PI*freq)**2/(2*log(r)); ! variance is fv
! Determine corresponding time-domain parameters:
tv = 1/omegav;  ! variance is tv, mean is 0

! Determine extent (pulse length) of time-domain envelope:
delta = 10.**(tpr/20);        ! Ref level (fraction of max peak)
time_cut = sqrt(-2*tv*log(delta)); ! Pulse cutoff time
t0_delay = time_cut + max_r/VECL_C
! Compute time-domain pulse envelope, normalized by sqrt(2*pi*tv):

time_step=time_cut/NUM_SEG
do dir=1, num_dir
    current_pos=t0_delay-DOT(3,k_uvec_wave(:,dir),1,point,1)/VECL_C-time_cut
    hight1=exp(-current_pos/(2*tv))*psi_func(i_rank, scaling_s*current_pos)
    v_scalar=0
    do int_inc=1, 2*NUM_SEG
        current_pos = current_pos + time_step
        hight2=exp(-current_pos/(2*tv))*psi_func(i_rank, scaling_s*current_pos)
        v_scalar(dir)=v_scalar(dir)+(hight1+hight2)/2*time_step
        hight1=hight2
    end do
end do
v_scalar=v_scalar*scaling_s
phi_vec=multicrossuni(k_uvec_wave, (/((/0,0,1/),dir=1,num_dir)/),num_dir)
theta_vec=multicrossuni(phi_vec, k_uvec_wave, num_dir)
v_wave_gen(1,1:num_dir)=theta_vec(1,:)*v_scalar
v_wave_gen(2,1:num_dir)=theta_vec(2,:)*v_scalar
v_wave_gen(3,1:num_dir)=theta_vec(3,:)*v_scalar
v_wave_gen(1,num_dir+1:2*num_dir)=phi_vec(1,:)*v_scalar
v_wave_gen(2,num_dir+1:2*num_dir)=phi_vec(2,:)*v_scalar
v_wave_gen(3,num_dir+1:2*num_dir)=phi_vec(3,:)*v_scalar
end function v_wave_gen
