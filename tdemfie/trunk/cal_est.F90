!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL: svn://cai.wireless/projects/tdemfie/trunk/rcs_cal.F90 $
! $Id: rcs_cal.F90 17 2006-05-08 07:21:38Z cai $
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! 计算某个极化、某个方向上的电场随时间变化
function cal_est(num_time, step, direction, i_dir, polar, out_cni, &
    scaling_s, max_rank, point, edge)
implicit none
! arguments
real cal_est(3,0:num_time), direction(3), out_cni(:,:,0:), scaling_s, point(:,:), &
    step
integer i_dir, edge(:,:), polar, max_rank, num_time
    ! interfaces
    interface
        subroutine seg_triangle_pair(num, edge, point, triangle, tri_point, rho, &
            area, len_seg)
            integer num, edge(:,:), triangle(3,2)
            real point(:,:), tri_point(3,3,2), rho(3,3,2), area(2), len_seg
        end subroutine seg_triangle_pair
    end interface
    ! local variables
    integer n_var, time, dir_index, j_var, k_var, triangle(3,2), tri_idx, &
        p_idx
    real temp, s_integral(3), tri_point(3,3,2), rho(3,3,2),area(2), len_seg,&
        DOT, psi_func
    ! Excutives
    if (polar==1) then
        dir_index=i_dir
    else
        dir_index=i_dir+ubound(out_cni, 2)/2
    end if
    cal_est=0
    do time=0, num_time
    do n_var=1, ubound(edge, 2)
    call seg_triangle_pair(n_var, edge, point, triangle, &
                tri_point, rho, area, len_seg)
    do j_var=0, max_rank
        temp=out_cni(n_var,dir_index,j_var)/4
        do k_var=0, j_var-1
            temp=temp+(j_var-k_var)*out_cni(n_var,dir_index,k_var)
        end do
        s_integral=0
        do tri_idx=1,2
            do p_idx=1,3
                s_integral=s_integral+rho(:,p_idx,tri_idx)* &
                    psi_func(j_var, scaling_s*(time*step + &
                        DOT(3,tri_point(:,p_idx,tri_idx),1,direction,1)/VECL_C))
            end do
            s_integral=s_integral*len_seg*(-1)**(tri_idx-1)/6
        end do
        cal_est(:,time)=cal_est(:,time)+temp*s_integral
    end do
    end do
    end do
    cal_est=cal_est*scaling_s**2*ETA_0/4/PI/VECL_C
end function cal_est
