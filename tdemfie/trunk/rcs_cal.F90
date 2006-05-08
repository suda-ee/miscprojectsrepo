!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! to calculate the RCS
subroutine rcs_cal(mono, frqs, this, phis, thss, phss, &
    nrmfile, coeffile, resultfile)
implicit none
! subroutine arguments
logical mono
real frqs(:), this(:), phis(:), thss(:), phss(:)
character*64 nrmfile, coeffile, resultfile
! interfaces
interface
    function cal_est(direction, i_dir, polar, out_cni, scaling_s, max_rank, &
        maxtime, point, edge)
        real cal_est(3,0:TIME_STEP), direction(3), out_cni(:,:,0:), scaling_s, point(:,:), &
            maxtime
        integer i_dir, edge(:,:), polar, max_rank
    end function cal_est
end interface
! Local variables
real freq, scaling_s, max_r, maxtime
integer max_rank, num_points, num_edges, i_dir, s_dir, n_i_dir, n_s_dir, &
    polar
integer, allocatable :: edge(:,:)
real, allocatable :: point(:,:), out_cni(:,:,:), e_s_rt(:,:,:,:,:), &
    s_direction(:, :), inc_dir_r(:,:)
! Excutives
n_i_dir=ubound(phis,1)
if (mono) then
    n_s_dir=1
else
    n_s_dir=ubound(phss,1)
end if
allocate(s_direction(3, n_s_dir),inc_dir_r(3,n_i_dir))
s_direction(1,:)= sin(thss)*cos(phss)
s_direction(2,:)= sin(thss)*sin(phss)
s_direction(3,:)= cos(thss)
inc_dir_r(1,:)= sin(this)*cos(phis)
inc_dir_r(2,:)= sin(this)*sin(phis)
inc_dir_r(3,:)= cos(this)
open(unit=1421,file=nrmfile,form="unformatted",status='old', action='read')
read(1421) num_points, num_edges
close(1421)
allocate(point(3, num_points), edge(4, num_edges))
open(unit=1424,file=nrmfile,form="unformatted",status='old', action='read')
read(1424) num_points, num_edges, point, edge
close(1424)
! 读出信息来。与 tdemfie.F90 中保持一致
open(unit=1433,file=coeffile,form="unformatted",status='old', action='read')
read(1433) freq, scaling_s, max_rank
close(1433)
allocate(out_cni(num_edges, 2*n_i_dir, 0:max_rank))
open(unit=1419,file=coeffile,form="unformatted",status='old', action='read')
read(1419) freq, scaling_s, max_rank, max_r, out_cni
close(1419)
allocate(e_s_rt(3,0:TIME_STEP, n_s_dir, n_i_dir, 2))
do polar=1, 2 ! ploar 1 for theta polarization, 2 for phi.
do i_dir=1, n_i_dir
if (mono) then
    e_s_rt(:,:, 1, i_dir, polar)=cal_est(inc_dir_r(:,i_dir), i_dir, &
        polar, out_cni, scaling_s, max_rank, maxtime, point, edge)
else
    do s_dir=1, n_s_dir
        e_s_rt(:,:, s_dir, i_dir, polar)=cal_est(s_direction(:,s_dir), i_dir, &
            polar, out_cni, scaling_s, max_rank, maxtime, point, edge)
    end do
end if
end do
end do
end subroutine rcs_cal
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! 计算某个极化、某个方向上的电场随时间变化
function cal_est(direction, i_dir, polar, out_cni, scaling_s, max_rank, &
    maxtime, point, edge)
implicit none
! arguments
real cal_est(3,0:TIME_STEP), direction(3), out_cni(:,:,0:), scaling_s, point(:,:), &
    maxtime
integer i_dir, edge(:,:), polar, max_rank
! interfaces
interface
    subroutine seg_triangle_pair(num, edge, point, triangle, tri_point, rho, &
        area, len_seg)
        integer num, edge(:,:), triangle(3,2)
        real point(:,:), tri_point(3,3,2), rho(3,3,2), area(2), len_seg
    end subroutine seg_triangle_pair
end interface
! local variables
integer n_var, time, dir_index, j_var, k_var, triangle(3,2), tri_idx, &
    p_idx
real temp, s_integral(3), tri_point(3,3,2), rho(3,3,2),area(2), len_seg,&
    DOT, psi_func
! Excutives
if (polar==1) then
    dir_index=i_dir
else
    dir_index=i_dir+ubound(out_cni, 2)/2
end if
cal_est=0
do time=0, TIME_STEP
do n_var=1, ubound(point, 2)
call seg_triangle_pair(n_var, edge, point, triangle, &
            tri_point, rho, area, len_seg)
do j_var=0, max_rank
    temp=out_cni(n_var,dir_index,j_var)/4
    do k_var=0, j_var-1
        temp=temp+(j_var-k_var)*out_cni(n_var,dir_index,k_var)
    end do
    s_integral=0
    do tri_idx=1,2
        do p_idx=1,3
            s_integral=s_integral+rho(:,p_idx,tri_idx)* &
                psi_func(j_var, scaling_s*time*maxtime/TIME_STEP + &
                    DOT(3,tri_point(:,p_idx,tri_idx),1,direction,1)/VECL_C)
        end do
        s_integral=s_integral*len_seg*(-1)**(tri_idx-1)/3
    end do
    cal_est(:,time)=cal_est(:,time)+temp*s_integral
end do
end do
end do
cal_est=cal_est*scaling_s**2*ETA_0/4/PI/VECL_C
end function cal_est
