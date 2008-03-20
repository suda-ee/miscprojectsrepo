!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! main program
program main
use mymod
implicit none
    ! interfaces
    interface
        subroutine tdemfie(freq, this, phis, scaling_s, max_rank, &
            mono, thss, phss, filebasename)
            integer max_rank
            logical mono
            real freq, scaling_s, this(:), phis(:), thss(:), phss(:)
            character*64 filebasename
        end subroutine tdemfie
    end interface
    ! Local variables
    integer nthi, nphi, nths, nphs, max_rank, dir_p, dir_t
    real freq, scaling_s, s_thi, dthi, s_phi, dphi, s_ths, dths, s_phs, &
        dphs
    character*64 filebasename
    logical mono
    ! k_uvec_wave(3, num_dir) 入射方向单位矢量
    real, allocatable :: this(:), phis(:), &
        thss(:), phss(:)
    ! Excutives
#ifdef VERBOSE
    call date_and_time(my_date, my_time)
    write(*,*) my_date, my_time, ': Start Now!'
#endif
    open(unit=1602,file=CONF,status='old', action='read')
    read(1602,*) freq, scaling_s, max_rank
    read(1602,*) s_thi, nthi, dthi
    read(1602,*) s_phi, nphi, dphi
    read(1602,*) s_ths, nths, dths
    read(1602,*) s_phs, nphs, dphs
    read(1602,*) mono
    read(1602,*) filebasename
    close(1602)
    s_thi=s_thi*PI/180.; s_phi=s_phi*PI/180. ! 转为弧度，文件中为度
    dthi=dthi*PI/180.; dphi=dphi*PI/180.
    s_ths=s_ths*PI/180.; s_phs=s_phs*PI/180.
    dths=dths*PI/180.; dphs=dphs*PI/180.
    allocate(this(nthi*nphi), phis(nthi*nphi), thss(nths*nphs), &
        phss(nths*nphs))
    this = (/ ((s_thi+dir_t*dthi, dir_p=0, nphi-1), dir_t=0,nthi-1) /)
    phis = (/ ((s_phi+dir_p*dphi, dir_p=0, nphi-1), dir_t=0,nthi-1) /)
    thss = (/ ((s_ths+dir_t*dths, dir_p=0, nphs-1), dir_t=0,nths-1) /)
    phss = (/ ((s_phs+dir_p*dphs, dir_p=0, nphs-1), dir_t=0,nths-1) /)
        call tdemfie(freq, this, phis, scaling_s, max_rank, &
            mono, thss, phss, filebasename)
    deallocate(this, phis)
#ifdef VERBOSE
    call date_and_time(my_date, my_time)
    write(*,*) my_date, my_time, ': Finished!'
#endif
end program main
