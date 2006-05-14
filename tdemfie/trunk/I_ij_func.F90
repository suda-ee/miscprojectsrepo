!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! solve the I_{ij}(y) function.
function I_ij_func(i, j, t)
implicit none
! arguments
integer i, j ! i and j should greater than 0
real t, I_ij_func
    ! local variables
    real psi_func
    ! Excutives
    if (j<i) then
        I_ij_func = psi_func(i-j, t) - psi_func(i-j-1, t)
    else if (j==i) then
        I_ij_func = exp(-t/2.)
    else
        I_ij_func = 0.
    end if
end function I_ij_func
