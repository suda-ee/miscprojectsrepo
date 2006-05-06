!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL:  $
! $Id: common.f90,v 1.9 2004/08/30 02:49:58 i Exp $
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! generate a_{mnij}
function bmnij_func(m, n, i, j, edge, point, scaling_s)
implicit none
! subroutine arguments
real bmnij_func
integer m, n, i, j, edge(:,:)
real point(:,:), scaling_s
! Local variables
integer triangle_m(3,2), triangle_n(3,2), p, q, p_p, p_q
real tri_point_m(3,3,2), tri_point_n(3,3,2), rho_m(3,3,2), rho_n(3,3,2), &
    len_seg_m, len_seg_n, area_m(2), area_n(2), R, dist, I_ij_func
logical Is_Same_Triangle
! Excutives
call seg_triangle_pair(m, edge, point, triangle_m, &
            tri_point_m, rho_m, area_m, len_seg_m)
call seg_triangle_pair(n, edge, point, triangle_n, &
            tri_point_n, rho_n, area_n, len_seg_n)
bmnij_func=0
do q=1,2
do p=1,2
if (Is_Same_Triangle(triangle_m(:, p), triangle_n(:, q))) then
    do p_q=1,3
    do p_p=1,3
    if (p_p==p_q) then
        bmnij_func=bmnij_func-scaling_s/VECL_C/9
    else
        R=dist(tri_point_m(:,p_p,p), tri_point_n(:,p_q,q))
        bmnij_func=bmnij_func+I_ij_func(i, j, scaling_s*R/VECL_C)/R/9
    end if
    end do
    end do
else
    do p_q=1,3
    do p_p=1,3
        R=dist(tri_point_m(:,p_p,p), tri_point_n(:,p_q,q))
        bmnij_func=bmnij_func+I_ij_func(i, j, scaling_s*R/VECL_C)/R/9
    end do
    end do
end if
bmnij_func=bmnij_func*len_seg_m*len_seg_n*(-1)**(p-1)*(-1)**(q-1)/16/PI
end do
end do
end function bmnij_func
