!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! transform the Hypermesh data to point(3, :) and edge(4, :), then save
! them in a file.
subroutine tran(databasename)
use mymod
implicit none
character :: databasename*64
    interface
        real function cross(x1,x2)
        implicit none
        dimension x1(3),x2(3),cross(3)
        real x1,x2
        end function cross
    end interface
    ! local variables
    character :: bujianming*64
    real NRM2
    type(t_triangle), allocatable :: triangle(:)
    type(t_edge), allocatable :: edge(:)
    integer num_triangles, num_points, num_edges, nouse, iloop
    real, allocatable :: point(:,:)
    open(unit=1455,file=trim(databasename)//'.tri',status='old', action='read')
    read(1455,*) num_triangles, num_points
    read(1455,*) nouse ! 这行为部件数，在本子程序中暂时无用，跳过
    read(1455,*) bujianming ! 部件名跳过
    !read(10,*) bujianming ! 颜色索引跳过 新 emsys 程序要把这行删除
    read(1455,*) bujianming ! 部件最后面元的总序号，跳过
    allocate(point(3, num_points), triangle(num_triangles))
    read(1455,*) (nouse, point(:,iloop), iloop=1, num_points)
    read(1455,*) (nouse,triangle(iloop)%poi, iloop=1, num_triangles)
    close(1455)
    open(unit=1503,file=trim(databasename)//'.part',status='old', action='read')
    read(1503,*) num_edges
    allocate(edge(num_edges))
    read(1503,*) (edge(iloop)%tri(1), edge(iloop)%tri(2), edge(iloop)%poi(1), &
        edge(iloop)%poi(3), nouse, iloop=1, num_edges)
    close(1503)
    ! 开始计算。
    do iloop=1, num_triangles
        triangle(iloop)%center=(point(:,triangle(iloop)%poi(1))+ &
            point(:,triangle(iloop)%poi(2))+point(:,triangle(iloop)%poi(3)))/3.
        call cal_area(point(:,triangle(iloop)%poi(1)), &
            point(:,triangle(iloop)%poi(2)),point(:,triangle(iloop)%poi(3)), &
            triangle(iloop)%area)
        triangle(iloop)%tri_point(:,1)=(triangle(iloop)%center+ &
            point(:,triangle(iloop)%poi(1)))/2.
        triangle(iloop)%tri_point(:,2)=(triangle(iloop)%center+ &
            point(:,triangle(iloop)%poi(2)))/2.
        triangle(iloop)%tri_point(:,3)=(triangle(iloop)%center+ &
            point(:,triangle(iloop)%poi(3)))/2.
    end do
    do iloop=1, num_edges
        edge(iloop)%poi(2)=triangle(edge(iloop)%tri(1))%poi(1) + &
            triangle(edge(iloop)%tri(1))%poi(2) + &
            triangle(edge(iloop)%tri(1))%poi(3) - &
            edge(iloop)%poi(1) - edge(iloop)%poi(3)
        edge(iloop)%poi(4)=triangle(edge(iloop)%tri(2))%poi(1) + &
            triangle(edge(iloop)%tri(2))%poi(2) + &
            triangle(edge(iloop)%tri(2))%poi(3) - &
            edge(iloop)%poi(1) - edge(iloop)%poi(3)
        edge(iloop)%len=NRM2(3, point(:,edge(iloop)%poi(1))- &
            point(:,edge(iloop)%poi(3)),1)
        triangle(edge(iloop)%tri(1))%norm=cross(point(:,edge(iloop)%poi(3))- &
            point(:,edge(iloop)%poi(2)), point(:,edge(iloop)%poi(1))- &
            point(:,edge(iloop)%poi(2)))
        triangle(edge(iloop)%tri(2))%norm=cross(point(:,edge(iloop)%poi(1))- &
            point(:,edge(iloop)%poi(4)), point(:,edge(iloop)%poi(3))- &
            point(:,edge(iloop)%poi(4)))
        triangle(edge(iloop)%tri(1))%norm=triangle(edge(iloop)%tri(1))%norm/ &
            NRM2(3,triangle(edge(iloop)%tri(1))%norm,1)
        triangle(edge(iloop)%tri(2))%norm=triangle(edge(iloop)%tri(2))%norm/ &
            NRM2(3,triangle(edge(iloop)%tri(2))%norm,1)
        edge(iloop)%rho(:,1,1)=triangle(edge(iloop)%tri(1))%tri_point(:,1)- &
            point(:,edge(iloop)%poi(2))
        edge(iloop)%rho(:,2,1)=triangle(edge(iloop)%tri(1))%tri_point(:,2)- &
            point(:,edge(iloop)%poi(2))
        edge(iloop)%rho(:,3,1)=triangle(edge(iloop)%tri(1))%tri_point(:,3)- &
            point(:,edge(iloop)%poi(2))
        edge(iloop)%rho(:,1,2)=triangle(edge(iloop)%tri(2))%tri_point(:,1)- &
            point(:,edge(iloop)%poi(4))
        edge(iloop)%rho(:,2,2)=triangle(edge(iloop)%tri(2))%tri_point(:,2)- &
            point(:,edge(iloop)%poi(4))
        edge(iloop)%rho(:,3,2)=triangle(edge(iloop)%tri(2))%tri_point(:,3)- &
            point(:,edge(iloop)%poi(4))
    end do
    open(unit=10,file=trim(databasename)//'.nrm',form="unformatted")
    ! 边数目；三角形数目；点数目
    write(10) num_edges, num_triangles, num_points, &
        edge, triangle, point
    close(10)
end subroutine tran
