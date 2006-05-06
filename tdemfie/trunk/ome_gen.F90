!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL:  $
! $Id: common.f90,v 1.9 2004/08/30 02:49:58 i Exp $
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! this function generates the \Omega_{mi} of the right-hand side.
function ome_gen(dim_z, i_rank, freq, max_r, k_uvec_wave, num_dir, edge, point, scaling_s)
implicit none
! subroutine arguments
! k_uvec_wave(:,3): the unit vector in the direction of wave progation.
! (multiple angles)
! fld_stren(2): the field strength of theta and phi polarization.
integer dim_z, i_rank, edge(:,:), num_dir
real ome_gen(dim_z, 2*num_dir), freq, max_r, k_uvec_wave(3,num_dir), point(:,:), scaling_s
! interfaces
interface
    function one_multi_dot(dimen, onearray, multiarray, dim_multi)
    integer dimen, dim_multi
    real one_multi_dot(dim_multi), onearray(dimen), &
         multiarray(dimen,dim_multi)
    end function
    function v_wave_gen(point, i_rank, scaling_s, freq, &
                max_r, k_uvec_wave, num_dir)
    integer i_rank, num_dir
    real v_wave_gen(3,2*num_dir), point(3), scaling_s, freq, max_r, &
        k_uvec_wave(3,num_dir)
    end function v_wave_gen
    subroutine seg_triangle_pair(num, edge, point, triangle, tri_point, rho, &
        area, len_seg)
        integer num, edge(:,:), triangle(3,2)
        real point(:,:), tri_point(3,3,2), rho(3,3,2), area(2), &
            len_seg
    end subroutine seg_triangle_pair
end interface
! Local variables
! 
real tri_point(3,3,2), rho(3,3,2), len_seg, area(2)
integer m_row, a_point, triangle(3,2)
! Excutives
! 
ome_gen=0
do m_row=1, dim_z
    call seg_triangle_pair(m_row, edge, point, triangle, tri_point, rho, &
        area, len_seg)
    do a_point=1, 3
        ome_gen(m_row,:)=ome_gen(m_row,:)+ &
            one_multi_dot(3,rho(:,a_point,1), &
                v_wave_gen(tri_point(:,a_point,1), i_rank, &
                scaling_s, freq, max_r, k_uvec_wave, num_dir), &
                2*num_dir) &
            -one_multi_dot(3,rho(:,a_point,2), &
                v_wave_gen(tri_point(:,a_point,2), i_rank, &
                scaling_s, freq, max_r, k_uvec_wave, num_dir), &
                2*num_dir)
    end do
    ome_gen(m_row,:)=ome_gen(m_row,:)*len_seg/6
end do
end function ome_gen
