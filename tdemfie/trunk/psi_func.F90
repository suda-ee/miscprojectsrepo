!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! solve the \psi_i(t) function with Laguerre polynomail.
function psi_func(i_rank, t)
implicit none
! arguments
integer i_rank
real t, psi_func
    ! local variables
    integer j
    real laguerre_t(0:i_rank)
    ! Excutives
    laguerre_t(0)=exp(-t/2._DKIND)
    if (i_rank>=1) then
        laguerre_t(1)=(1._DKIND-t)*laguerre_t(0)
    end if
    do j=2, i_rank
        laguerre_t(j)=((2*j-1-t)*laguerre_t(j-1)-(j-1)*laguerre_t(j-2))/j
    end do
    psi_func = laguerre_t(i_rank)
end function psi_func
