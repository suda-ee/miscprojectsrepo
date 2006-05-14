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
    end interface
    ! local variables
    integer n_var, time, dir_index, j_var, k_var, tri_idx, &
        p_idx
    real temp, s_integral(3), DOT, psi_func
    ! Excutives
    if (polar==1) then
        dir_index=i_dir
    else
        dir_index=i_dir+ubound(out_cni, 2)/2
    end if
    cal_est=0.
    do time=0, num_time
    do n_var=1, ubound(edge, 1)
    do j_var=0, max_rank
        temp=out_cni(n_var,dir_index,j_var)/4.
        do k_var=0, j_var-1
            temp=temp+(j_var-k_var)*out_cni(n_var,dir_index,k_var)
        end do
        s_integral=0.
        do tri_idx=1,2
            do p_idx=1,3
                s_integral=s_integral+edge(n_var)%rho(:,p_idx,tri_idx)* &
                    psi_func(j_var, scaling_s*(time*step + &
                        DOT(3,triangle(edge(n_var)%tri(tri_idx))%tri_point(:,p_idx),1,direction,1)/VECL_C))
            end do
            s_integral=s_integral*edge(n_var)%len*(3-2*tri_idx)/6
        end do
        cal_est(:,time)=cal_est(:,time)+temp*s_integral
    end do
    end do
    end do
    cal_est=cal_est*scaling_s*scaling_s*ETA_0/4./PI/VECL_C
end function cal_est
