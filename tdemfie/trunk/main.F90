!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL:  $
! $Id: common.f90,v 1.9 2004/08/30 02:49:58 i Exp $
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! to find if they are the same triangle
program main
implicit none
! Local variables
integer nthi, nphi, nths, nphs, nfri, max_rank, dir_p, dir_t
real freq, scaling_s, s_thi, dthi, s_phi, dphi, s_ths, dths, s_phs, dphs, s_fri, &
    dfri
character*64 trifile, nrmfile, coeffile, resultfile
logical re_tran, re_cal
! k_uvec_wave(3, num_dir) 入射方向单位矢量
real, allocatable :: k_uvec_wave(:, :), this(:), phis(:)
! Excutives
open(unit=1602,file=CONF,status='old', action='read')
read(1602,*) freq, scaling_s, max_rank
read(1602,*) s_fri, nfri, dfri
read(1602,*) s_thi, nthi, dthi
read(1602,*) s_phi, nphi, dphi
read(1602,*) s_ths, nths, dths
read(1602,*) s_phs, nphs, dphs
read(1602,*) trifile
read(1602,*) re_tran, nrmfile
read(1602,*) re_cal, coeffile
read(1602,*) resultfile
close(1602)
if (re_tran) then
    call tran(trifile, nrmfile)
end if
if (re_cal) then
    allocate(k_uvec_wave(3, nthi*nphi),  this(nthi*nphi), phis(nthi*nphi))
    this = (/ ((s_thi+dir_t*dthi, dir_p=0, nphi-1), dir_t=0,nthi-1) /)
    phis = (/ ((s_phi+dir_p*dphi, dir_p=0, nphi-1), dir_t=0,nthi-1) /)
    k_uvec_wave(1,:)= -sin(this)*cos(phis)
    k_uvec_wave(2,:)= -sin(this)*sin(phis)
    k_uvec_wave(3,:)= -cos(this)
    deallocate(this, phis)
    call tdemfie(freq, k_uvec_wave, scaling_s, max_rank, nrmfile, &
        coeffile)
    deallocate(k_uvec_wave)
end if
!frqs = (/ (inifrq+i*dfrq, i=0, nf-1) /)
!thss = (/ ((ths+j*dths, i=0, nphs-1), j=0,nths-1) /)
!phss = (/ ((phs+i*dphs, i=0, nphs-1), j=0,nths-1) /)
end program main
