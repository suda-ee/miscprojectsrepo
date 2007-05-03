!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! This subroutine is to generate the right-hand side
subroutine vform(dim_z, edge, triangle, scaling_s, out_cni, num_dir, alpha, &
    amnij, bmnij, v_rhs, i_rank, freq, max_r, inc_wave)
use mymod
implicit none
! subroutine arguments
! out_cni(dim_z, 2*num_dir, :) 最后一维为 Laguerre 多项式阶数
integer dim_z, num_dir, i_rank
real scaling_s, out_cni(:, :, 0:), alpha(:), amnij(0:,:), bmnij(0:,:), &
    v_rhs(dim_z, 2*num_dir), freq, max_r, inc_wave(3, 3, num_dir)
type(t_edge) edge(:)
type(t_triangle) triangle(:)
    ! interfaces
    interface
            function ome_gen(dim_z, i_rank, freq, max_r, inc_wave, num_dir, &
                edge, triangle, scaling_s)
                use mymod
                implicit none
                integer dim_z, i_rank, num_dir
                real ome_gen(dim_z, 2*num_dir), freq, max_r, &
                    inc_wave(3,3,num_dir), scaling_s
                type(t_edge) edge(:)
                type(t_triangle) triangle(:)
        end function ome_gen
    end interface
    ! Local variables
    ! temp for: \sum_{k=0}^{j-1}(j-k)c_{nk} + \frac{\mu s^2}{4}c_{nj}
    integer n_var, k_var, j_var, row, col_offset, m_offset, mn_pos
    real temp(2*num_dir)
    ! Excutives
    v_rhs=ome_gen(dim_z, i_rank, freq, max_r, inc_wave, num_dir, edge, &
        triangle, scaling_s)
    if (i_rank/=0) then
    do row=1, dim_z
    m_offset=row*(row-1)/2
    do n_var=1, dim_z
    col_offset=n_var*(n_var-1)/2
    if (n_var>row) then
        mn_pos = row + col_offset
    else
        mn_pos = n_var + m_offset
    end if
    do j_var=0, i_rank-1
        v_rhs(row, :)=v_rhs(row, :)-(i_rank-j_var)*out_cni(row,:,j_var)* &
            alpha(mn_pos)*ETA_0*scaling_s*scaling_s
        temp=0.
        do k_var=0, j_var-1
            temp=temp+(j_var-k_var)*out_cni(n_var,:,k_var)
        end do
        temp=temp*ETA_0*scaling_s*scaling_s
        temp=temp+out_cni(n_var,:,j_var)*ETA_0*scaling_s*scaling_s*.25
        v_rhs(row, :)=v_rhs(row, :) - temp*amnij(i_rank-j_var, mn_pos) - &
            out_cni(n_var,:,j_var)* &
            bmnij(i_rank-j_var, mn_pos)/sqrt(EPSILON_R)*ETA_0
    end do
    end do
    end do
    end if
end subroutine vform
