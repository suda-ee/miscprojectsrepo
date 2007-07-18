!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! show time module
module mymod
    type t_triangle
        integer poi(3) ! 三点顶点的编号；升序
        real center(3) ! 重心坐标
        real area       ! 面积
        real tri_point(3, 3) ! 三点积分三点，第二维为序号，与三顶点对应
    end type t_triangle
    type t_edge
        integer tri(2)  ! 两个三角形的编号，先左，后右。边的指向向上
        integer poi(4)  ! 四个点的编号
        real len        ! 边的长度
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
