!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! This subroutine is to generate the big Z_{mn} matrix which is the sum
! of \frac{\mu s^2}{4}\alpha_{mn} + \frac{1}{\epsilon}\beta_{mn}
subroutine zform(z, amnij, bmnij, descz, edge, triangle, scaling_s, &
    max_rank, ictxt)
use mymod
implicit none
! subroutine arguments
! edge: an integer matrix edge(4, num_edges)
! point: a real matrix point(3, num_points)
! scaling_s: the scaling factor for time.
integer max_rank, ictxt, descz(DLEN_)
real z(:,:), scaling_s
real amnij(:,:,0:), bmnij(:,:,0:)
type(t_edge) edge(:)
type(t_triangle) triangle(:)
    ! interfaces
    ! Local variables
    integer row, col, p, q, p_p, p_q, ij_pos
    real rho_center_row(3), rho_center_col(3), R, DOT, dist, &
        rhodot, gint, psi_vall, psi_valr, psi_val, sr
    integer iam, nprocs, nprow, npcol, myrow, mycol, dimrow, dimcol, &
        lcol, lrow, indxl2g
    ! Excutives
    !   get starting information
    call blacs_pinfo( iam, nprocs )
    call blacs_gridinfo( ictxt, nprow, npcol, myrow, mycol )
    dimrow=ubound(z, 1)
    dimcol=ubound(z, 2)
    amnij=0._DKIND; bmnij=0._DKIND
    do lcol=1, dimcol
        col=indxl2g( lcol, descz(NB_), mycol, descz(CSRC_), npcol )
        do lrow=1, dimrow
            row=indxl2g( lrow, descz(MB_), myrow, descz(RSRC_), nprow )
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
                    amnij(lrow,lcol,ij_pos)=amnij(lrow,lcol,ij_pos)- &
                        rhodot*(3-2*p)*(3-2*q)*(.5_DKIND+ij_pos)*scaling_s
                    bmnij(lrow,lcol,ij_pos)=bmnij(lrow,lcol,ij_pos)- &
                        (.5_DKIND+ij_pos)*scaling_s
                    end do
                else
                    R=dist(triangle(edge(row)%tri(p))%tri_point(:,p_p), &
                        triangle(edge(col)%tri(q))%tri_point(:,p_q))
                    sr=scaling_s*R
                    psi_vall=exp(-sr/2._DKIND)
                    psi_valr=(1._DKIND-sr)*psi_vall
                    amnij(lrow,lcol,0)=amnij(lrow,lcol,0)+ &
                        rhodot*(psi_vall-1.)*(3-2*p)*(3-2*q)/R
                    bmnij(lrow,lcol,0)=bmnij(lrow,lcol,0)+ &
                        (psi_vall-1.)/R
                    amnij(lrow,lcol,1)=amnij(lrow,lcol,1)+ &
                        rhodot*(psi_valr-1.)*(3-2*p)*(3-2*q)/R
                    bmnij(lrow,lcol,1)=bmnij(lrow,lcol,1)+ &
                        (psi_valr-1.)/R
                    do ij_pos=2, max_rank
                    psi_val=((2*ij_pos-1-sr)*psi_valr-(ij_pos-1)* &
                        psi_vall)/ij_pos
                    amnij(lrow,lcol,ij_pos)=amnij(lrow,lcol,ij_pos)+ &
                        rhodot*(psi_val-1._DKIND)*(3-2*p)*(3-2*q)/R
                    bmnij(lrow,lcol,ij_pos)=bmnij(lrow,lcol,ij_pos)+ &
                        (psi_val-1._DKIND)/R
                    psi_vall=psi_valr
                    psi_valr=psi_val
                    end do
                end if
                end do
                end do
                rho_center_row=(edge(row)%rho(:,1,p)+edge(row)%rho(:,2,p)+ &
                    edge(row)%rho(:,3,p))/3.
                rho_center_col=(edge(col)%rho(:,1,q)+edge(col)%rho(:,2,q)+ &
                    edge(col)%rho(:,3,q))/3.
                rhodot=DOT(3,rho_center_row, 1, rho_center_col, 1)
                gint=3.545/sqrt(triangle(edge(row)%tri(p))%area)*9.
                amnij(lrow,lcol,:)=amnij(lrow,lcol,:)+rhodot* &
                    (3-2*p)*(3-2*q)*gint
                bmnij(lrow,lcol,:)=bmnij(lrow,lcol,:)+gint
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
                    amnij(lrow,lcol,0)=amnij(lrow,lcol,0)+ &
                        rhodot*psi_vall*(3-2*p)*(3-2*q)/R
                    bmnij(lrow,lcol,0)=bmnij(lrow,lcol,0)+ &
                        psi_vall/R
                    amnij(lrow,lcol,1)=amnij(lrow,lcol,1)+ &
                        rhodot*psi_valr*(3-2*p)*(3-2*q)/R
                    bmnij(lrow,lcol,1)=bmnij(lrow,lcol,1)+ &
                        psi_valr/R
                    do ij_pos=2, max_rank
                    psi_val=((2*ij_pos-1-sr)*psi_valr-(ij_pos-1)* &
                        psi_vall)/ij_pos
                    amnij(lrow,lcol,ij_pos)=amnij(lrow,lcol,ij_pos)+ &
                        rhodot*psi_val*(3-2*p)*(3-2*q)/R
                    bmnij(lrow,lcol,ij_pos)=bmnij(lrow,lcol,ij_pos)+ &
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
            amnij(lrow,lcol,:)=amnij(lrow,lcol,:)*edge(row)%len* &
                edge(col)%len/(144.*PI)
            bmnij(lrow,lcol,:)=bmnij(lrow,lcol,:)*edge(row)%len* &
                edge(col)%len/(36.*PI)
            z(lrow,lcol)=.25*scaling_s*scaling_s* &
                amnij(lrow,lcol,0) + bmnij(lrow,lcol,0)/EPSILON_R
            z(lrow,lcol) = ETA_0 * z(lrow,lcol)
            do ij_pos=max_rank, 1, -1
                amnij(lrow,lcol,ij_pos)=amnij(lrow,lcol,ij_pos)- &
                    amnij(lrow,lcol,ij_pos-1)
                bmnij(lrow,lcol,ij_pos)=bmnij(lrow,lcol,ij_pos)- &
                    bmnij(lrow,lcol,ij_pos-1)
            end do
        end do
    end do
end subroutine zform
