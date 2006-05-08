!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! main program
program main
implicit none
! interfaces
interface
    subroutine tdemfie(freq, k_uvec_wave, scaling_s, max_rank, nrmfile, &
        outfile)
        integer max_rank
        real freq, k_uvec_wave(:,:), scaling_s
        character*64 nrmfile, outfile
    end subroutine tdemfie
    subroutine rcs_cal(mono, frqs, this, phis, thss, phss, &
        nrmfile, coeffile, resultfile)
        logical mono
        real frqs(:), this(:), phis(:), thss(:), phss(:)
        character*64 nrmfile, coeffile, resultfile
    end subroutine rcs_cal
end interface
! Local variables
integer nthi, nphi, nths, nphs, nfri, max_rank, dir_p, dir_t
real freq, scaling_s, s_thi, dthi, s_phi, dphi, s_ths, dths, s_phs, &
    dphs, s_fri, dfri
character*64 trifile, nrmfile, coeffile, resultfile
logical re_tran, re_cal, mono
! k_uvec_wave(3, num_dir) 入射方向单位矢量
real, allocatable :: k_uvec_wave(:, :), this(:), phis(:), frqs(:), &
    thss(:), phss(:)
! Excutives
open(unit=1602,file=CONF,status='old', action='read')
read(1602,*) freq, scaling_s, max_rank
read(1602,*) s_fri, nfri, dfri
read(1602,*) s_thi, nthi, dthi
read(1602,*) s_phi, nphi, dphi
read(1602,*) s_ths, nths, dths
read(1602,*) s_phs, nphs, dphs
read(1602,*) mono
read(1602,*) trifile
read(1602,*) re_tran, nrmfile
read(1602,*) re_cal, coeffile
read(1602,*) resultfile
close(1602)
freq=freq*1e9; s_fri=s_fri*1e9; dfri=dfri*1e9 ! 配置文件中频率单位为 GHz
if (re_tran) then
    call tran(trifile, nrmfile)
end if
allocate(this(nthi*nphi), phis(nthi*nphi))
this = (/ ((s_thi+dir_t*dthi, dir_p=0, nphi-1), dir_t=0,nthi-1) /)
phis = (/ ((s_phi+dir_p*dphi, dir_p=0, nphi-1), dir_t=0,nthi-1) /)
if (re_cal) then
    allocate(k_uvec_wave(3, nthi*nphi))
    k_uvec_wave(1,:)= -sin(this)*cos(phis)
    k_uvec_wave(2,:)= -sin(this)*sin(phis)
    k_uvec_wave(3,:)= -cos(this)
    call tdemfie(freq, k_uvec_wave, scaling_s, max_rank, nrmfile, &
        coeffile)
    deallocate(k_uvec_wave)
end if
allocate(frqs(nfri), thss(nths*nphs), phss(nths*nphs))
frqs = (/ (s_fri+dir_t*dfri, dir_t=0, nfri-1) /)
thss = (/ ((s_ths+dir_t*dths, dir_p=0, nphs-1), dir_t=0,nths-1) /)
phss = (/ ((s_phs+dir_p*dphs, dir_p=0, nphs-1), dir_t=0,nths-1) /)
call rcs_cal(mono, frqs, this, phis, thss, phss, nrmfile, coeffile, resultfile)
deallocate(this, phis)
end program main
