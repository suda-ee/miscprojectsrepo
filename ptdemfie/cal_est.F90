!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL: svn://cai.wireless/projects/tdemfie/trunk/cal_est.F90 $
! $Id: cal_est.F90 37 2006-06-11 03:05:23Z cai $
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! 计算某个极化、某个方向上的电场随时间变化
function cal_est(num_time, step, direction, out_cni, &
    scaling_s, max_rank, triangle, edge, ictxt, descv, nqrhs, descrcs)
use mymod
implicit none
! arguments
real cal_est(3,0:num_time,nqrhs), direction(3), out_cni(:,:,0:), scaling_s, &
    step
integer max_rank, num_time, ictxt, descv(DLEN_), &
    nqrhs, descrcs(DLEN_)
type(t_edge) edge(:)
type(t_triangle) triangle(:)
    ! interfaces
    interface
        function psi_func(i_rank, t)
            implicit none
            integer i_rank
            real t, psi_func
        end function psi_func
    end interface
    ! local variables
    integer n_var, time, j_var, tri_idx, &
        p_idx, iam, nprocs, nprow, npcol, myrow, mycol, itlcrow, &
        numroc, indxl2g, descit(DLEN_), info, lcrow, &
        dimen
    real DOT, psi_val, t_cal
    real, allocatable :: itmat(:,:)
    ! Excutives
    call blacs_pinfo( iam, nprocs )
    call blacs_gridinfo( ictxt, nprow, npcol, myrow, mycol )
    itlcrow= numroc( descv(M_), BLOCKSIZE, myrow, 0, nprow )
    call descinit( descit, descv(M_), 1, BLOCKSIZE, descv(NB_), &
        0, 0, ictxt, max(itlcrow,1), info )
    cal_est=0.
    allocate(itmat(itlcrow, 3))
    do j_var=0,max_rank
        do time=0, num_time
            itmat=0._DKIND
            do lcrow=1, itlcrow
                n_var=indxl2g( lcrow, descit(MB_), myrow, descit(RSRC_), nprow )
                do tri_idx=1,2
                    do p_idx=1,3
                        t_cal=scaling_s*time*step + &
                            scaling_s*DOT(3,triangle(edge(n_var)%tri(tri_idx))% &
                            tri_point(:,p_idx),1,direction,1)
                        psi_val=psi_func(j_var, t_cal)
                        itmat(lcrow,:)=itmat(lcrow,:)+ &
                            edge(n_var)%rho(:,p_idx,tri_idx)* &
                            psi_val*(3-2*tri_idx)
                    end do
                end do
                itmat(lcrow,:)=itmat(lcrow,:)*edge(n_var)%len/6
            end do
            do dimen=1,3
            call PGEMV( 'T', descv(M_), descv(N_), 1._DKIND, &
                out_cni(:,:,j_var), 1, 1, descv, itmat(:,dimen), &
                1, 1, descit, 1, 1._DKIND, cal_est(dimen,time,:), 1, 1, &
                descrcs, 1 )
            end do
        end do
    end do
    cal_est=cal_est*scaling_s*scaling_s*ETA_0/(-4.*PI)
end function cal_est
