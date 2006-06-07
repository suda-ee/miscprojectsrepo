!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! generate a_{mnij}
subroutine amnij_sub(dim_z, max_rank, edge, triangle, scaling_s, amnij)
use mymod
implicit none
! subroutine arguments
integer dim_z, max_rank
! (j, i, n, m) packed storage
real amnij(max_rank*(max_rank+1)/2, dim_z*(dim_z+1)/2)
real scaling_s
type(t_edge) edge(:)
type(t_triangle) triangle(:)
    ! interfaces
    ! Local variables
    integer p, q, p_p, p_q, m, n, i, j, m_offset, mn_pos, i_offset, &
        ij_pos
    real R, DOT, dist, I_ij_func
    logical Is_Same_Triangle
    ! Excutives
    amnij=0._DKIND
    do m=1, dim_z
    m_offset=m*(m-1)/2
    do n=1, m
    mn_pos=n+m_offset
    do i=1, max_rank
    i_offset=i*(i-1)/2
    do j=0, i-1
        ij_pos = i_offset + j + 1
        do q=1,2
        do p=1,2
        if (Is_Same_Triangle(triangle(edge(m)%tri(p))%poi, &
            triangle(edge(n)%tri(q))%poi)) then
            do p_q=1,3
            do p_p=1,3
            if (p_p==p_q) then
                amnij(ij_pos, mn_pos)=amnij(ij_pos, mn_pos)- &
                    DOT(3,edge(m)%rho(:,p_p,p),1, &
                    edge(n)%rho(:,p_q,q),1)*scaling_s*(3-2*p)*(3-2*q)
            else
                R=dist(triangle(edge(m)%tri(p))%tri_point(:,p_p), &
                    triangle(edge(n)%tri(q))%tri_point(:,p_q))
                amnij(ij_pos, mn_pos)=amnij(ij_pos, mn_pos)+ &
                    DOT(3,edge(m)%rho(:,p_p,p),1, &
                    edge(n)%rho(:,p_q,q),1)* &
                    I_ij_func(i, j, scaling_s*R)*(3-2*p)*(3-2*q)/R
            end if
            end do
            end do
        else
            do p_q=1,3
            do p_p=1,3
                R=dist(triangle(edge(m)%tri(p))%tri_point(:,p_p), &
                    triangle(edge(n)%tri(q))%tri_point(:,p_q))
                amnij(ij_pos, mn_pos)=amnij(ij_pos, mn_pos)+ &
                    DOT(3,edge(m)%rho(:,p_p,p),1, &
                    edge(n)%rho(:,p_q,q),1)* &
                    I_ij_func(i, j, scaling_s*R)*(3-2*p)*(3-2*q)/R
            end do
            end do
        end if
        end do
        end do
        amnij(ij_pos, mn_pos)=amnij(ij_pos, mn_pos)*edge(m)%len* &
            edge(n)%len/(144.*PI)
    end do
    end do
    end do
    end do
end subroutine amnij_sub
