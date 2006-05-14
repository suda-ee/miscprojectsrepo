!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
subroutine seg_triangle_pair(num, edge, point, triangle, tri_point, rho, &
    area, len_seg)
use mymod
implicit none
! gives the three point
! arguments
! triangle(3,2) the index of node of two triangle. increasement
! tri_point(3, 3, 2), rho(3,3,2): the second dimension is the index of three
! points
! in the second dimension: 1 for plus, 2 for minus
integer num, edge(:,:), triangle(3,2)
real point(:,:), tri_point(3,3,2), rho(3,3,2), area(2), len_seg
    ! local variables
    integer info
    real weight_center(3,2), NRM2
    ! Excutives
    weight_center(:,1)=(point(:,edge(1,num))+point(:,edge(2,num))+ &
        point(:,edge(3,num)))/3.
    weight_center(:,2)=(point(:,edge(1,num))+point(:,edge(3,num))+ &
        point(:,edge(4,num)))/3.
    len_seg=NRM2(3, point(:,edge(1,num))-point(:,edge(3,num)),1)
    triangle(:,1)=edge(1:3,num)
    triangle(:,2)=edge((/1,3,4/),num)
    call sort('I', 3, triangle(:,1), info)
    call sort('I', 3, triangle(:,2), info)
    call cal_area(point(:,triangle(1,1)),point(:,triangle(2,1)), &
        point(:,triangle(3,1)),area(1))
    call cal_area(point(:,triangle(1,2)),point(:,triangle(2,2)), &
        point(:,triangle(3,2)),area(2))
    tri_point(:,1,1)=(weight_center(:,1)+point(:,triangle(1,1)))/2.
    tri_point(:,2,1)=(weight_center(:,1)+point(:,triangle(2,1)))/2.
    tri_point(:,3,1)=(weight_center(:,1)+point(:,triangle(3,1)))/2.
    rho(:,1,1)=tri_point(:,1,1)-point(:,edge(2,num))
    rho(:,2,1)=tri_point(:,2,1)-point(:,edge(2,num))
    rho(:,3,1)=tri_point(:,3,1)-point(:,edge(2,num))
    tri_point(:,1,2)=(weight_center(:,2)+point(:,triangle(1,2)))/2.
    tri_point(:,2,2)=(weight_center(:,2)+point(:,triangle(2,2)))/2.
    tri_point(:,3,2)=(weight_center(:,2)+point(:,triangle(3,2)))/2.
    rho(:,1,2)=tri_point(:,1,2)-point(:,edge(4,num))
    rho(:,2,2)=tri_point(:,2,2)-point(:,edge(4,num))
    rho(:,3,2)=tri_point(:,3,2)-point(:,edge(4,num))
end subroutine seg_triangle_pair
