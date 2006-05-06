!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! This subroutine is to generate the big Z_{mn} matrix which is the sum
! of \frac{\mu s^2}{4}\alpha_{mn} + \frac{1}{\epsilon}\beta_{mn}
subroutine zform(z, alpha, dim_z, edge, point, scaling_s)
implicit none
! subroutine arguments
! z: the matrix will be generated, packed by columns in a 1-d array (U).
! alpha: packed by columns in a 1-d array (U).
! dim_z: row/column number of matrix z.
! edge: an integer matrix edge(4, num_edges)
! point: a real matrix point(3, num_points)
! scaling_s: the scaling factor for time.
real z(:), alpha(:), point(:, :), scaling_s
integer dim_z, edge(:, :)
! Local variables
integer row, col, col_offset, pack_position, triangle_row(3,2), &
    triangle_col(3,2), p, q, p_p, p_q
real beta, tri_point_row(3,3,2), tri_point_col(3,3,2), rho_row(3,3,2), &
    rho_col(3,3,2), len_seg_row, len_seg_col, area_row(2), area_col(2), &
    rho_center_row(3), rho_center_col(3), R, DOT, dist
logical Is_Same_Triangle
! Excutives
do col=1, dim_z
    col_offset=col*(col-1)/2
    do row=1, col
        pack_position=row+col_offset
! 计算三角面元对有关数据
        call seg_triangle_pair(row, edge, point, triangle_row, &
            tri_point_row, rho_row, area_row, len_seg_row)
        call seg_triangle_pair(col, edge, point, triangle_col, &
            tri_point_col, rho_col, area_col, len_seg_col)
! compute the alpha_{mn}, \iint \vec{f}_m (\vec{r})\dot\vec{f}_n(\vec{r}') 
! \Delta S'_n\Delta S_m
        alpha(pack_position)=0; beta=0
        do q=1, 2 ! col 对的两个三角形
        do p=1, 2 ! row 对的两个三角形
        If (Is_Same_Triangle(triangle_row(:, p), triangle_col(:, q))) then
            do p_q=1, 3 ! q 三角形中的三点
            do p_p=1, 3 ! p 三角形中的三点
            if (p_p==p_q) then
                alpha(pack_position)=alpha(pack_position)-1/9*DOT( &
                    3, rho_row(:, p_p, p), 1, rho_col(:, p_q, q), 1)* &
                    scaling_s/2/VECL_C
                beta=beta-1/9*scaling_s/2/VECL_C
            else
                R=dist(tri_point_row(:,p_p,p), tri_point_col(:,p_q,q))
                alpha(pack_position)=alpha(pack_position)-1/9*DOT( &
                    3, rho_row(:, p_p, p), 1, rho_col(:, p_q, q), 1)* &
                    (exp(-scaling_s*R/2/VECL_C)-1)/R
                beta=beta-1/9*(exp(-scaling_s*R/2/VECL_C)-1)/R
            end if
            end do
            end do
            rho_center_row=(rho_row(:,1,p)+rho_row(:,2,p)+rho_row(:,3,p))/3
            rho_center_col=(rho_col(:,1,q)+rho_col(:,2,q)+rho_col(:,3,q))/3
            alpha(pack_position)=alpha(pack_position)+DOT(3, &
                rho_center_row, 1, rho_center_col, 1)*3.545/ &
                sqrt(area_row(p))
            beta=beta+3.545/sqrt(area_row(p))
        else
            do p_q=1,3
            do p_p=1,3
                R=dist(tri_point_row(:,p_p,p), tri_point_col(:,p_q,q))
                alpha(pack_position)=alpha(pack_position)+1/9*DOT(3, &
                    rho_row(:, p_p, p), 1, rho_col(:, p_q, q), &
                    1)*exp(-scaling_s*R/2/VECL_C)/R
                beta=beta+1/9*exp(-scaling_s*R/2/VECL_C)/R
            end do
            end do
        end if
        alpha(pack_position)=alpha(pack_position)*len_seg_row*len_seg_col* &
            (-1)**(p-1)*(-1)**(q-1)/16/PI
        beta=beta*len_seg_row*len_seg_col*(-1)**(p-1)*(-1)**(q-1)/4/PI
        end do
        end do
! now the z_mn is get.
        z(pack_position)=MU_0*scaling_s**2*alpha(pack_position) &
                                         + beta/EPSILON_0
    end do
end do
end subroutine zform
