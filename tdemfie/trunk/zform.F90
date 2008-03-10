!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! This subroutine is to generate the big Z_{mn} matrix which is the sum
! of \frac{\mu s^2}{4}\alpha_{mn} + \frac{1}{\epsilon}\beta_{mn}
subroutine zform(z, amnij, bmnij, edge, triangle, scaling_s, &
    max_rank)
use mymod
implicit none
! subroutine arguments
! z: the matrix will be generated, packed by columns in a 1-d array (U).
! dim_z: row/column number of matrix z.
! edge: an integer matrix edge(4, num_edges)
! point: a real matrix point(3, num_points)
! scaling_s: the scaling factor for time.
integer max_rank
real z(:), scaling_s
real amnij(0:, :), bmnij(0:, :)
type(t_edge) edge(:)
type(t_triangle) triangle(:)
    ! interfaces
    ! Local variables
    integer dim_z, row, col, col_offset, pack_position, p, q, p_p, p_q, &
        ij_pos
    real R, DOT, dist, rhodot, gint, psi_vall, psi_valr, psi_val, sr
    ! Excutives
    dim_z=ubound(edge, 1)
    amnij=0._DKIND; bmnij=0._DKIND
    do col=1, dim_z
        col_offset=col*(col-1)/2
        do row=1, col
            pack_position=row+col_offset
    ! compute the alpha_{mn}, \iint \vec{f}_m (\vec{r})\dot\vec{f}_n(\vec{r}') 
    ! \Delta S'_n\Delta S_m
            do q=1, 2 ! col 对的两个三角形
            do p=1, 2 ! row 对的两个三角形
            If (edge(row)%tri(p)==edge(col)%tri(q)) then
                do p_q=1, 3 ! q 三角形中的三点
                do p_p=1, 3 ! p 三角形中的三点
                rhodot=DOT(3, edge(row)%rho(:, p_p, p), 1, &
                        edge(col)%rho(:, p_q, q), 1)
                if (p_p==p_q) then
                    do ij_pos=0, max_rank
                    amnij(ij_pos, pack_position)=amnij(ij_pos, pack_position)- &
                        rhodot*(3-2*p)*(3-2*q)*(.5_DKIND+ij_pos)*scaling_s
                    bmnij(ij_pos, pack_position)=bmnij(ij_pos, pack_position)- &
                        (.5_DKIND+ij_pos)*scaling_s
                    end do
                    gint=3.545/sqrt(triangle(edge(row)%tri(p))%area/3._DKIND)
                    amnij(:, pack_position)=amnij(:, pack_position)+ &
                        rhodot*(3-2*p)*(3-2*q)*gint
                    bmnij(:, pack_position)=bmnij(:, pack_position)+gint
                else
                    R=dist(triangle(edge(row)%tri(p))%tri_point(:,p_p), &
                        triangle(edge(col)%tri(q))%tri_point(:,p_q))
                    sr=scaling_s*R
                    psi_vall=exp(-sr/2._DKIND)
                    psi_valr=(1._DKIND-sr)*psi_vall
                    amnij(0, pack_position)=amnij(0, pack_position)+ &
                        rhodot*psi_vall*(3-2*p)*(3-2*q)/R
                    bmnij(0, pack_position)=bmnij(0, pack_position)+ &
                        psi_vall/R
                    amnij(1, pack_position)=amnij(1, pack_position)+ &
                        rhodot*psi_valr*(3-2*p)*(3-2*q)/R
                    bmnij(1, pack_position)=bmnij(1, pack_position)+ &
                        psi_valr/R
                    do ij_pos=2, max_rank
                    psi_val=((2*ij_pos-1-sr)*psi_valr-(ij_pos-1)* &
                        psi_vall)/ij_pos
                    amnij(ij_pos, pack_position)=amnij(ij_pos, pack_position)+ &
                        rhodot*psi_val*(3-2*p)*(3-2*q)/R
                    bmnij(ij_pos, pack_position)=bmnij(ij_pos, pack_position)+ &
                        psi_val/R
                    psi_vall=psi_valr
                    psi_valr=psi_val
                    end do
                end if
                end do
                end do
            else
                do p_q=1,3
                do p_p=1,3
                    rhodot=DOT(3, edge(row)%rho(:, p_p, p), 1, &
                            edge(col)%rho(:, p_q, q), 1)
                    R=dist(triangle(edge(row)%tri(p))%tri_point(:,p_p), &
                        triangle(edge(col)%tri(q))%tri_point(:,p_q))
                    sr=scaling_s*R
                    psi_vall=exp(-sr/2._DKIND)
                    psi_valr=(1._DKIND-sr)*psi_vall
                    amnij(0, pack_position)=amnij(0, pack_position)+ &
                        rhodot*psi_vall*(3-2*p)*(3-2*q)/R
                    bmnij(0, pack_position)=bmnij(0, pack_position)+ &
                        psi_vall/R
                    amnij(1, pack_position)=amnij(1, pack_position)+ &
                        rhodot*psi_valr*(3-2*p)*(3-2*q)/R
                    bmnij(1, pack_position)=bmnij(1, pack_position)+ &
                        psi_valr/R
                    do ij_pos=2, max_rank
                    psi_val=((2*ij_pos-1-sr)*psi_valr-(ij_pos-1)* &
                        psi_vall)/ij_pos
                    amnij(ij_pos, pack_position)=amnij(ij_pos, pack_position)+ &
                        rhodot*psi_val*(3-2*p)*(3-2*q)/R
                    bmnij(ij_pos, pack_position)=bmnij(ij_pos, pack_position)+ &
                        psi_val/R
                    psi_vall=psi_valr
                    psi_valr=psi_val
                    end do
                end do
                end do
            end if
            end do
            end do
    ! now the z_mn is get.
            amnij(:, pack_position)=amnij(:, pack_position)*edge(row)%len* &
                edge(col)%len/(144.*PI)
            bmnij(:, pack_position)=bmnij(:, pack_position)*edge(row)%len* &
                edge(col)%len/(36.*PI)
            z(pack_position)=.25*scaling_s*scaling_s* &
                amnij(0,pack_position) + bmnij(0,pack_position)/EPSILON_R
            z(pack_position) = ETA_0 * z(pack_position)
            do ij_pos=max_rank, 1, -1
                amnij(ij_pos, pack_position)=amnij(ij_pos, pack_position)- &
                    amnij(ij_pos-1, pack_position)
                bmnij(ij_pos, pack_position)=bmnij(ij_pos, pack_position)- &
                    bmnij(ij_pos-1, pack_position)
            end do
        end do
    end do
end subroutine zform
