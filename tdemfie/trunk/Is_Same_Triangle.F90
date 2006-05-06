!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! to find if they are the same triangle
function Is_Same_Triangle(tri_a, tri_b)
implicit none
! subroutine arguments
logical Is_Same_Triangle
integer tri_a(3), tri_b(3)
! Local variables
integer i_var
! Excutives
Is_Same_Triangle=.true.
do i_var=1,3
    if (tri_a(i_var)/=tri_b(i_var)) then
        Is_Same_Triangle=.false.
        exit
    end if
end do
end function Is_Same_Triangle
