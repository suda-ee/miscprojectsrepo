!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! this function generates the \Omega_{mi} of the right-hand side.
function ome_gen(dim_z, i_rank, freq, max_r, k_uvec_wave, num_dir, edge, triangle, scaling_s)
use mymod
implicit none
! subroutine arguments
! k_uvec_wave(:,3): the unit vector in the direction of wave progation.
! (multiple angles)
! fld_stren(2): the field strength of theta and phi polarization.
integer dim_z, i_rank, num_dir
real ome_gen(dim_z, 2*num_dir), freq, max_r, k_uvec_wave(3,num_dir), scaling_s
type(t_edge) edge(:)
type(t_triangle) triangle(:)
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
end interface
! Local variables
! 
integer m_row, a_point
! Excutives
! 
ome_gen=0.
do m_row=1, dim_z
    do a_point=1, 3
        ome_gen(m_row,:)=ome_gen(m_row,:)+ &
            one_multi_dot(3,edge(m_row)%rho(:,a_point,1), &
                v_wave_gen(triangle(edge(m_row)%tri(1))%tri_point(:,a_point), &
                i_rank, scaling_s, freq, max_r, k_uvec_wave, num_dir), &
                2*num_dir) &
            -one_multi_dot(3,edge(m_row)%rho(:,a_point,2), &
                v_wave_gen(triangle(edge(m_row)%tri(2))%tri_point(:,a_point), &
                i_rank, scaling_s, freq, max_r, k_uvec_wave, num_dir), &
                2*num_dir)
    end do
    ome_gen(m_row,:)=ome_gen(m_row,:)*edge(m_row)%len/6.
end do
end function ome_gen
