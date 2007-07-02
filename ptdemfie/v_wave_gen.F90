!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL: svn://172.16.1.1/projects/tdemfie/trunk/v_wave_gen.F90 $
! $Id: v_wave_gen.F90 56 2007-05-18 12:17:20Z cai $
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! solve the \vec{V}_i(\vec{r}) integration.
function v_wave_gen(dimcol, point, i_rank, scaling_s, freq, &
            max_r, inc_wave, ictxt, descv)
implicit none
! arguments
! max_r is the maxmium Abs(r)
! v_wave_gen(3, 1:num_dir) for theta polarization
integer i_rank, dimcol, ictxt, descv(DLEN_)
real v_wave_gen(3,dimcol), point(3), scaling_s, freq, max_r, &
    inc_wave(3,3,dimcol)
    ! local variables
    integer dir, i, iam, nprocs, nprow, npcol, myrow, mycol, col, &
        indxl2g
    real r, tpr, bwr, tv, time_cut, t0_delay, delta ! in dB
    real v_scalar(dimcol), lb, ub, h, delay
    real DOT, psi_func
    ! Excutives
    !   get starting information
    call blacs_pinfo( iam, nprocs )
    call blacs_gridinfo( ictxt, nprow, npcol, myrow, mycol )
    tpr = -60.; bwr= -6.
    ! Determine Gaussian mean and variance in the
    ! exp(-t**2 /tv/2) -> sqrt(tv)*exp(-omega**2 *tv/2)
    ! frequency domain to match specifications:
    r = 10.**(bwr/20.);             ! Ref level (fraction of max peak)
    !omegav = -(2.*PI*freq)*(2.*PI*freq)/(2.*log(r)); ! variance is fv
    ! Determine corresponding time-domain parameters:
    tv = -log(r)/(2.*PI*freq)/(PI*freq)*CC_0*CC_0;  ! variance is tv, mean is 0

    ! Determine extent (pulse length) of time-domain envelope:
    delta = 10.**(tpr/20.);        ! Ref level (fraction of max peak)
    time_cut = sqrt(-2.*tv*log(delta)); ! Pulse cutoff time
    t0_delay = time_cut + max_r
    ! Compute time-domain pulse envelope, normalized by sqrt(2*pi*tv):
    v_scalar = 0.
    do dir=1, dimcol
        delay = t0_delay+DOT(3,inc_wave(:,1,dir),1,point,1)
        lb=delay-time_cut
        ub=delay+time_cut
        h=time_cut/MAX_STP
        v_scalar(dir)=0.5*(exp(-(lb-delay)*(lb-delay)/(2.*tv))* &
                    psi_func(i_rank, scaling_s*lb)- &
                    exp(-(ub-delay)*(ub-delay)/(2.*tv))* &
                    psi_func(i_rank, scaling_s*ub))
        do i=1, MAX_STP
            v_scalar(dir)=v_scalar(dir)+2.* &
                exp(-(lb+(2*i-1)*h-delay)*(lb+(2*i-1)*h-delay)/(2.*tv))* &
                    psi_func(i_rank, scaling_s*(lb+(2*i-1)*h)) + &
                    exp(-(lb+2.*h*i-delay)*(lb+2.*h*i-delay)/(2.*tv))* &
                    psi_func(i_rank, scaling_s*(lb+2.*h*i))
        end do
        v_scalar(dir)=(ub-lb)*v_scalar(dir)/(3.*MAX_STP)
    end do
    v_scalar=v_scalar*scaling_s
    do dir=1, dimcol
        col=indxl2g( dir, descv(NB_), mycol, descv(CSRC_), npcol )
        if (col<=descv(N_)/2) then
            v_wave_gen(:,dir)=inc_wave(:,2,dir)*v_scalar(dir)
        else
            v_wave_gen(:,dir)=inc_wave(:,3,dir)*v_scalar(dir)
        end if
    end do
end function v_wave_gen
