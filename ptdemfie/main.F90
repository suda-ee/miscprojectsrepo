!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL: svn://cai.wireless/projects/tdemfie/trunk/main.F90 $
! $Id: main.F90 29 2006-05-25 03:28:52Z cai $
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! main program
program main
use mymod
implicit none
    ! interfaces
    interface
        subroutine ptdemfie(freq, this, phis, scaling_s, max_rank, nrmfile, &
            mono, thss, phss, outfile, ictxt)
            integer max_rank, ictxt
            logical mono
            real freq, scaling_s, this(:), phis(:), thss(:), phss(:)
            character*64 nrmfile, outfile
        end subroutine ptdemfie
    end interface
    ! Local variables
    integer nthi, nphi, nths, nphs, max_rank, dir_p, dir_t
    real freq, scaling_s, s_thi, dthi, s_phi, dphi, s_ths, dths, s_phs, &
        dphs
    character*64 trifile, nrmfile, trcsffile
    logical re_tran, mono
    ! k_uvec_wave(3, num_dir) 入射方向单位矢量
    real, allocatable :: this(:), phis(:), &
        thss(:), phss(:)
    ! needed for parallel computing
    integer iam, nprocs, nprow, npcol, ictxt, myrow, mycol
    ! Excutives
    !   get starting information
    call blacs_pinfo( iam, nprocs )
#ifdef VERBOSE
    if (iam==0) then
        call date_and_time(my_date, my_time)
        write(*,*) my_date, my_time, ': Start Now!'
    end if
#endif
    open(unit=1602+iam,file=CONF,status='old', action='read')
    read(1602+iam,*) nprow, npcol
    read(1602+iam,*) freq, scaling_s, max_rank
    read(1602+iam,*) s_thi, nthi, dthi
    read(1602+iam,*) s_phi, nphi, dphi
    read(1602+iam,*) s_ths, nths, dths
    read(1602+iam,*) s_phs, nphs, dphs
    read(1602+iam,*) mono
    read(1602+iam,*) trifile
    read(1602+iam,*) re_tran, nrmfile
    read(1602+iam,*) trcsffile
    close(1602+iam)
!
!   define process grid
!
    call blacs_get( -1, 0, ictxt )
    call blacs_gridinit( ictxt, 'row-major', nprow, npcol )
    call blacs_gridinfo( ictxt, nprow, npcol, myrow, mycol )

    s_thi=s_thi*PI/180.; s_phi=s_phi*PI/180. ! 转为弧度，文件中为度
    dthi=dthi*PI/180.; dphi=dphi*PI/180.
    s_ths=s_ths*PI/180.; s_phs=s_phs*PI/180.
    dths=dths*PI/180.; dphs=dphs*PI/180.
    if (re_tran .and. iam==0) then
        call tran(trifile, nrmfile)
#ifdef VERBOSE
    call date_and_time(my_date, my_time)
    write(*,*) my_time, ': tran data Finished!'
#endif
    end if
    call blacs_barrier(ictxt, 'All')
    allocate(this(nthi*nphi), phis(nthi*nphi), thss(nths*nphs), &
        phss(nths*nphs))
    this = (/ ((s_thi+dir_t*dthi, dir_p=0, nphi-1), dir_t=0,nthi-1) /)
    phis = (/ ((s_phi+dir_p*dphi, dir_p=0, nphi-1), dir_t=0,nthi-1) /)
    thss = (/ ((s_ths+dir_t*dths, dir_p=0, nphs-1), dir_t=0,nths-1) /)
    phss = (/ ((s_phs+dir_p*dphs, dir_p=0, nphs-1), dir_t=0,nths-1) /)
    call ptdemfie(freq, this, phis, scaling_s, max_rank, nrmfile, &
        mono, thss, phss, trcsffile, ictxt)
    deallocate(this, phis)
!
#ifdef VERBOSE
    if (iam==0) then
        call date_and_time(my_date, my_time)
        write(*,*) my_date, my_time, ': Finished!'
    end if
#endif
    call blacs_gridexit( ictxt )
    call blacs_exit( 0 )
end program main
