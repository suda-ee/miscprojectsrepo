!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! generate b_{mnij}
function bmnij_func(m, n, i, j, edge, triangle, scaling_s)
use mymod
implicit none
! subroutine arguments
real bmnij_func
integer m, n, i, j
real scaling_s
type(t_edge) edge(:)
type(t_triangle) triangle(:)
    ! interfaces
    ! Local variables
    integer p, q, p_p, p_q
    real R, dist, I_ij_func
    logical Is_Same_Triangle
    ! Excutives
    bmnij_func=0.
    do q=1,2
    do p=1,2
    if (Is_Same_Triangle(triangle(edge(m)%tri(p))%poi, &
        triangle(edge(n)%tri(q))%poi)) then
        do p_q=1,3
        do p_p=1,3
        if (p_p==p_q) then
            bmnij_func=bmnij_func-scaling_s*(3-2*p)*(3-2*q)/VECL_C
        else
            R=dist(triangle(edge(m)%tri(p))%tri_point(:,p_p), &
                triangle(edge(n)%tri(q))%tri_point(:,p_q))
            bmnij_func=bmnij_func+I_ij_func(i, j, scaling_s*R/VECL_C)* &
                (3-2*p)*(3-2*q)/R
        end if
        end do
        end do
    else
        do p_q=1,3
        do p_p=1,3
            R=dist(triangle(edge(m)%tri(p))%tri_point(:,p_p), &
                triangle(edge(n)%tri(q))%tri_point(:,p_q))
            bmnij_func=bmnij_func+I_ij_func(i, j, scaling_s*R/VECL_C)* &
                (3-2*p)*(3-2*q)/R
        end do
        end do
    end if
    end do
    end do
    bmnij_func=bmnij_func*edge(m)%len*edge(n)%len/(36.*PI)
end function bmnij_func
