!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! show time module
module mymod
    character*8 my_date
    character*10 my_time
    interface sort
        subroutine ilasrt( id, n, d, info )
            character          id
            integer            info, n
            integer               d( * )
        end subroutine ilasrt
        subroutine LASRT( id, n, d, info )
            character          id
            integer            info, n
            real               d( * )
        end subroutine LASRT
    end interface sort
end module mymod
