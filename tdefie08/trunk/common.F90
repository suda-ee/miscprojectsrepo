!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function one_multi_dot(dimen, one, multi, num)
implicit none
! one and multiple vectors dot.
! arguments
integer dimen, num
real one_multi_dot(num), one(dimen), multi(dimen, num), DOT
    ! local variables
    integer column
    do column=1, num
        one_multi_dot(column)=DOT(dimen, one, 1, multi(:, column), 1)
    end do
end function
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!���������
function dist(x1,x2)
implicit none
real dist, x1(3),x2(3), NRM2
dist=NRM2(3, x1-x2, 1)
end function dist
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
subroutine cal_area(point1,point2,point3,area)
implicit none
! arguments
real point1(3), point2(3), point3(3), area
    ! local variable
    real l1, l2, l3, p, dist
    ! exectives
    l1=dist(point1,point2)
    l2=dist(point2,point3)
    l3=dist(point3,point1)
    p=(l1+l2+l3)/2.0
    area=sqrt(p*(p-l1)*(p-l2)*(p-l3))
end subroutine cal_area
