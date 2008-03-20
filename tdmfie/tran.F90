!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! transform the Hypermesh data to point(3, :) and edge(4, :), then save
! them in a file.
subroutine tran(point, triangle, edge)
use mymod
implicit none
real :: point(:,:)
type(t_edge) edge(:)
type(t_triangle) triangle(:)
    interface
        real function cross(x1,x2)
        implicit none
        dimension x1(3),x2(3),cross(3)
        real x1,x2
        end function cross
    end interface
    ! local variables
    real NRM2
    integer num_triangles, num_points, num_edges, iloop
    ! ¿ªÊ¼¼ÆËã¡£
    num_points=ubound(point, 2)
    num_triangles=ubound(triangle, 1)
    num_edges=ubound(edge, 1)
    do iloop=1, num_triangles
        triangle(iloop)%center=(point(:,triangle(iloop)%poi(1))+ &
            point(:,triangle(iloop)%poi(2))+point(:,triangle(iloop)%poi(3)))/3.
        call cal_area(point(:,triangle(iloop)%poi(1)), &
            point(:,triangle(iloop)%poi(2)),point(:,triangle(iloop)%poi(3)), &
            triangle(iloop)%area)
        triangle(iloop)%tri_point(:,1)=(triangle(iloop)%center+ &
            point(:,triangle(iloop)%poi(1)))/2.
        triangle(iloop)%tri_point(:,2)=(triangle(iloop)%center+ &
            point(:,triangle(iloop)%poi(2)))/2.
        triangle(iloop)%tri_point(:,3)=(triangle(iloop)%center+ &
            point(:,triangle(iloop)%poi(3)))/2.
    end do
    do iloop=1, num_edges
        edge(iloop)%poi(2)=triangle(edge(iloop)%tri(1))%poi(1) + &
            triangle(edge(iloop)%tri(1))%poi(2) + &
            triangle(edge(iloop)%tri(1))%poi(3) - &
            edge(iloop)%poi(1) - edge(iloop)%poi(3)
        edge(iloop)%poi(4)=triangle(edge(iloop)%tri(2))%poi(1) + &
            triangle(edge(iloop)%tri(2))%poi(2) + &
            triangle(edge(iloop)%tri(2))%poi(3) - &
            edge(iloop)%poi(1) - edge(iloop)%poi(3)
        edge(iloop)%len=NRM2(3, point(:,edge(iloop)%poi(1))- &
            point(:,edge(iloop)%poi(3)),1)
        triangle(edge(iloop)%tri(1))%norm=cross(point(:,edge(iloop)%poi(3))- &
            point(:,edge(iloop)%poi(2)), point(:,edge(iloop)%poi(1))- &
            point(:,edge(iloop)%poi(2)))
        triangle(edge(iloop)%tri(2))%norm=cross(point(:,edge(iloop)%poi(1))- &
            point(:,edge(iloop)%poi(4)), point(:,edge(iloop)%poi(3))- &
            point(:,edge(iloop)%poi(4)))
        triangle(edge(iloop)%tri(1))%norm=triangle(edge(iloop)%tri(1))%norm/ &
            NRM2(3,triangle(edge(iloop)%tri(1))%norm,1)
        triangle(edge(iloop)%tri(2))%norm=triangle(edge(iloop)%tri(2))%norm/ &
            NRM2(3,triangle(edge(iloop)%tri(2))%norm,1)
        edge(iloop)%rho(:,1,1)=triangle(edge(iloop)%tri(1))%tri_point(:,1)- &
            point(:,edge(iloop)%poi(2))
        edge(iloop)%rho(:,2,1)=triangle(edge(iloop)%tri(1))%tri_point(:,2)- &
            point(:,edge(iloop)%poi(2))
        edge(iloop)%rho(:,3,1)=triangle(edge(iloop)%tri(1))%tri_point(:,3)- &
            point(:,edge(iloop)%poi(2))
        edge(iloop)%rho(:,1,2)=triangle(edge(iloop)%tri(2))%tri_point(:,1)- &
            point(:,edge(iloop)%poi(4))
        edge(iloop)%rho(:,2,2)=triangle(edge(iloop)%tri(2))%tri_point(:,2)- &
            point(:,edge(iloop)%poi(4))
        edge(iloop)%rho(:,3,2)=triangle(edge(iloop)%tri(2))%tri_point(:,3)- &
            point(:,edge(iloop)%poi(4))
    end do
end subroutine tran
