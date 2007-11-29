!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! show time module
module mymod
    type t_triangle
        integer poi(3) ! ���㶥��ı�ţ�����
        real center(3) ! ��������
        real area       ! ���
        real tri_point(3, 3) ! ����������㣬�ڶ�άΪ��ţ����������Ӧ
    end type t_triangle
    type t_edge
        integer tri(2)  ! ���������εı�ţ����󣬺��ҡ��ߵ�ָ������
        integer poi(4)  ! �ĸ���ı��
        real len        ! �ߵĳ���
        real rho(3,3,2)
    end type t_edge
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