!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! this function generates the \Omega_{mi} of the right-hand side.
function ome_gen(dimrow, dimcol, i_rank, freq, max_r, inc_wave, &
    edge, triangle, scaling_s, ictxt, descv)
use mymod
implicit none
! subroutine arguments
! inc_wave(3,3,num_dir): the unit vector in the direction of wave progation.
! (multiple angles)
! fld_stren(2): the field strength of theta and phi polarization.
integer dimrow, dimcol, i_rank, ictxt, descv(DLEN_)
real ome_gen(dimrow, dimcol), freq, max_r, inc_wave(3,3,dimcol), scaling_s
type(t_edge) edge(:)
type(t_triangle) triangle(:)
! interfaces
interface
    function one_multi_dot(dimen, onearray, multiarray, dim_multi)
    integer dimen, dim_multi
    real one_multi_dot(dim_multi), onearray(dimen), &
         multiarray(dimen,dim_multi)
    end function
    function v_wave_gen(dimcol, point, i_rank, scaling_s, freq, &
        max_r, inc_wave, ictxt, descv)
        implicit none
        integer i_rank, dimcol, ictxt, descv(DLEN_)
        real v_wave_gen(3,dimcol), point(3), scaling_s, freq, max_r, &
            inc_wave(3,3,dimcol)
    end function v_wave_gen
end interface
! Local variables
! 
integer m_row, a_point, iam, nprocs, nprow, npcol, myrow, &
    mycol, lrow, indxl2g
! Excutives
! 
    !   get starting information
    call blacs_pinfo( iam, nprocs )
    call blacs_gridinfo( ictxt, nprow, npcol, myrow, mycol )
ome_gen=0.
do lrow=1, dimrow
    m_row=indxl2g( lrow, descv(MB_), myrow, descv(RSRC_), nprow )
    do a_point=1, 3
        ome_gen(lrow,:)=ome_gen(lrow,:)+ &
            one_multi_dot(3,edge(m_row)%rho(:,a_point,1), &
                v_wave_gen(dimcol, triangle(edge(m_row)%tri(1))%tri_point(:,a_point), &
                i_rank, scaling_s, freq, max_r, inc_wave, ictxt, descv), &
                dimcol) &
            -one_multi_dot(3,edge(m_row)%rho(:,a_point,2), &
                v_wave_gen(dimcol, triangle(edge(m_row)%tri(2))%tri_point(:,a_point), &
                i_rank, scaling_s, freq, max_r, inc_wave, ictxt, descv), &
                dimcol)
    end do
    ome_gen(lrow,:)=ome_gen(lrow,:)*edge(m_row)%len/6.
end do
end function ome_gen
