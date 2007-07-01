!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! 计算某个极化、某个方向上的电场随时间变化
function cal_est(num_time, step, direction, i_dir, polar, out_cni, &
    scaling_s, max_rank, triangle, edge)
use mymod
implicit none
! arguments
real cal_est(3,0:num_time), direction(3), out_cni(:,:,0:), scaling_s, &
    step
integer i_dir, polar, max_rank, num_time
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
    integer n_var, time, dir_index, j_var, tri_idx, &
        p_idx, dimen
    real DOT, psi_val, t_cal
    real, allocatable :: itmat(:,:)
    ! Excutives
    if (polar==1) then
        dir_index=i_dir
    else
        dir_index=i_dir+ubound(out_cni, 2)/2
    end if
    cal_est=0.
    allocate(itmat(ubound(edge, 1), 3))
    do j_var=0, max_rank
        do time=0, num_time
            itmat=0._DKIND
            do n_var=1, ubound(edge, 1)
                do tri_idx=1,2
                    do p_idx=1,3
                        t_cal=scaling_s*time*step + &
                            scaling_s*DOT(3,triangle(edge(n_var)%tri(tri_idx))% &
                            tri_point(:,p_idx),1,direction,1)
                        psi_val=psi_func(j_var, t_cal)
                        itmat(n_var,:)=itmat(n_var,:)+ &
                            edge(n_var)%rho(:,p_idx,tri_idx)* &
                            psi_val*(3-2*tri_idx)
                    end do
                end do
                itmat(n_var,:)=itmat(n_var,:)*edge(n_var)%len/6
            end do
            do dimen=1,3
                cal_est(dimen,time)=cal_est(dimen, time)+ &
                    DOT( ubound(edge, 1), out_cni(:,dir_index,j_var), &
                    1, itmat(:,dimen), 1 )
            end do
        end do
    end do
    cal_est=cal_est*scaling_s*scaling_s*ETA_0/(-4.*PI)
end function cal_est
