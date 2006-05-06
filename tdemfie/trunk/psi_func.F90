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
real laguerre_t(-1:i_rank) ! -1 阶是为了方便使用
! Excutives
laguerre_t(-1)=0; laguerre_t(0)=1; laguerre_t(1)=1-t
do j=2, i_rank
    laguerre_t(j)=((2*j-1-t)*laguerre_t(j-1)-(j-1)*laguerre_t(j-2))/j
end do
psi_func = exp(-t/2)*laguerre_t(i_rank)
end function psi_func
