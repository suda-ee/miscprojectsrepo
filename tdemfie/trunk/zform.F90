!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! This subroutine is to generate the big Z_{mn} matrix which is the sum
! of \frac{\mu s^2}{4}\alpha_{mn} + \frac{1}{\epsilon}\beta_{mn}
subroutine zform(z, alpha, edge, triangle, scaling_s)
use mymod
implicit none
! subroutine arguments
! z: the matrix will be generated, packed by columns in a 1-d array (U).
! alpha: packed by columns in a 1-d array (U).
! dim_z: row/column number of matrix z.
! edge: an integer matrix edge(4, num_edges)
! point: a real matrix point(3, num_points)
! scaling_s: the scaling factor for time.
real z(:), alpha(:), scaling_s
type(t_edge) edge(:)
type(t_triangle) triangle(:)
    ! interfaces
    ! Local variables
    integer dim_z, row, col, col_offset, pack_position, p, q, p_p, p_q
    real beta, rho_center_row(3), rho_center_col(3), R, DOT, dist
    logical Is_Same_Triangle
    ! Excutives
    dim_z=ubound(edge, 1)
    do col=1, dim_z
        col_offset=col*(col-1)/2
        do row=1, col
            pack_position=row+col_offset
    ! compute the alpha_{mn}, \iint \vec{f}_m (\vec{r})\dot\vec{f}_n(\vec{r}') 
    ! \Delta S'_n\Delta S_m
            alpha(pack_position)=0.; beta=0.
            do q=1, 2 ! col 对的两个三角形
            do p=1, 2 ! row 对的两个三角形
            If (Is_Same_Triangle(triangle(edge(row)%tri(p))%poi, &
                triangle(edge(col)%tri(q))%poi)) then
                do p_q=1, 3 ! q 三角形中的三点
                do p_p=1, 3 ! p 三角形中的三点
                if (p_p==p_q) then
                    alpha(pack_position)=alpha(pack_position)-DOT( &
                        3, edge(row)%rho(:, p_p, p), 1, &
                            edge(col)%rho(:, p_q, q), 1)*(3-2*p)*(3-2*q)* &
                        scaling_s/2.
                    beta=beta-scaling_s*(3-2*p)*(3-2*q)/2.
                else
                    R=dist(triangle(edge(row)%tri(p))%tri_point(:,p_p), &
                        triangle(edge(col)%tri(q))%tri_point(:,p_q))
                    alpha(pack_position)=alpha(pack_position)+DOT( &
                        3, edge(row)%rho(:, p_p, p), 1, &
                        edge(col)%rho(:, p_q, q), 1)* &
                        (exp(-scaling_s*R/2.)-1.)*(3-2*p)*(3-2*q)/R
                    beta=beta+(exp(-scaling_s*R/2.)-1.)*(3-2*p)*(3-2*q)/R
                end if
                end do
                end do
                rho_center_row=(edge(row)%rho(:,1,p)+edge(row)%rho(:,2,p)+ &
                    edge(row)%rho(:,3,p))/3.
                rho_center_col=(edge(col)%rho(:,1,q)+edge(col)%rho(:,2,q)+ &
                    edge(col)%rho(:,3,q))/3.
                alpha(pack_position)=alpha(pack_position)+DOT(3, &
                    rho_center_row, 1, rho_center_col, 1)*(3-2*p)*(3-2*q)* &
                    3.545/sqrt(triangle(edge(row)%tri(p))%area)*9.
                beta=beta+3.545*(3-2*p)*(3-2*q)/sqrt(triangle(edge(row)%tri(p))%area)*9.
            else
                do p_q=1,3
                do p_p=1,3
                    R=dist(triangle(edge(row)%tri(p))%tri_point(:,p_p), &
                        triangle(edge(col)%tri(q))%tri_point(:,p_q))
                    alpha(pack_position)=alpha(pack_position)+DOT(3, &
                        edge(row)%rho(:, p_p, p), 1, edge(col)%rho(:, p_q, q), &
                        1)*exp(-scaling_s*R/2.)*(3-2*p)*(3-2*q)/R
                    beta=beta+exp(-scaling_s*R/2.)*(3-2*p)*(3-2*q)/R
                end do
                end do
            end if
            end do
            end do
            alpha(pack_position)=alpha(pack_position)*edge(row)%len* &
                edge(col)%len/(144.*PI)
            beta=beta*edge(row)%len*edge(col)%len/(36.*PI)
    ! now the z_mn is get.
            z(pack_position)=.25*scaling_s*scaling_s* &
                alpha(pack_position) + beta/sqrt(EPSILON_R)
            z(pack_position) = ETA_0 * z(pack_position)
        end do
    end do
end subroutine zform
