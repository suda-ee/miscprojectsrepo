!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! This subroutine is to generate the right-hand side
subroutine vform(dim_z, edge, point, scaling_s, out_cni, num_dir, alpha, &
    v_rhs, i_rank, freq, max_r, k_uvec_wave)
implicit none
! subroutine arguments
! out_cni(dim_z, 2*num_dir, :) 最后一维为 Laguerre 多项式阶数
integer dim_z, edge(:,:), num_dir, i_rank
real point(:,:), scaling_s, out_cni(:, :, 0:), alpha(:), &
    v_rhs(dim_z, 2*num_dir), freq, max_r, k_uvec_wave(3, num_dir)
! interfaces
interface
    function ome_gen(dim_z, i_rank, freq, max_r, k_uvec_wave, num_dir, &
        edge, point, scaling_s)
        integer dim_z, i_rank, edge(:,:), num_dir
        real ome_gen(dim_z, 2*num_dir), freq, max_r, k_uvec_wave(3,num_dir), &
            point(:,:), scaling_s
    end function ome_gen
    function amnij_func(m, n, i, j, edge, point, scaling_s)
        real amnij_func
        integer m, n, i, j, edge(:,:)
        real point(:,:), scaling_s
    end function amnij_func
    function bmnij_func(m, n, i, j, edge, point, scaling_s)
        real bmnij_func
        integer m, n, i, j, edge(:,:)
        real point(:,:), scaling_s
    end function bmnij_func
end interface
    ! Local variables
    ! temp for: \sum_{k=0}^{j-1}(j-k)c_{nk} + \frac{\mu s^2}{4}c_{nj}
    integer n_var, k_var, j_var, row, col_offset
    real temp(2*num_dir), amnij, bmnij
    ! Excutives
    v_rhs=ome_gen(dim_z, i_rank, freq, max_r, k_uvec_wave, num_dir, edge, &
        point, scaling_s)
    if (i_rank/=0) then
    do row=1, dim_z
    do n_var=1, dim_z
    col_offset=n_var*(n_var-1)/2
    do j_var=0, i_rank-1
        v_rhs(row, :)=v_rhs(row, :)-(i_rank-j_var)*out_cni(row,:,j_var)* &
            alpha(row+col_offset)*MU_0*scaling_s*scaling_s
        temp=0.
        do k_var=0, j_var-1
            temp=temp+(j_var-k_var)*out_cni(n_var,:,k_var)
        end do
        temp=temp+out_cni(n_var,:,j_var)*MU_0*scaling_s*scaling_s / 4.
        amnij = amnij_func(row, n_var, i_rank, j_var, edge, point, scaling_s)
        bmnij = bmnij_func(row, n_var, i_rank, j_var, edge, point, scaling_s)
        v_rhs(row, :)=v_rhs(row, :) - temp*amnij - out_cni(n_var,:,j_var)* &
            bmnij/EPSILON_0
    end do
    end do
    end do
    end if
end subroutine vform
