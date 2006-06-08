!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! solve the I_{ij}(y) function.
function I_ij_func(diff_ij, t)
implicit none
! arguments
integer diff_ij ! i and j should greater than 0
real t, I_ij_func
    ! local variables
    real psi_func
    ! Excutives
    ! Only j<i is possible
    I_ij_func = psi_func(diff_ij, t) - psi_func(diff_ij-1, t)
end function I_ij_func
