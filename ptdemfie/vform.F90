!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL: svn://172.16.1.1/projects/tdemfie/trunk/vform.F90 $
! $Id: vform.F90 56 2007-05-18 12:17:20Z cai $
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! This subroutine is to generate the right-hand side
subroutine vform(edge, triangle, scaling_s, out_cni, &
    amnij, bmnij, descz, v_rhs, descv, i_rank, freq, max_r, inc_wave, &
    ictxt)
use mymod
implicit none
! subroutine arguments
! out_cni(dim_z, 2*num_dir, :) 最后一维为 Laguerre 多项式阶数
integer i_rank, descz(DLEN_), descv(DLEN_), ictxt
real scaling_s, out_cni(:, :, 0:), amnij(:,:,0:), bmnij(:,:,0:), &
    v_rhs(:, :), freq, max_r, inc_wave(:, :, :)
type(t_edge) edge(:)
type(t_triangle) triangle(:)
    ! interfaces
    interface
        function ome_gen(dimrow, dimcol, i_rank, freq, max_r, inc_wave, &
            edge, triangle, scaling_s, ictxt, descv)
            use mymod
            implicit none
            integer dimrow, dimcol, i_rank, ictxt, descv(DLEN_)
            real ome_gen(dimrow, dimcol), freq, max_r, &
                inc_wave(3,3,dimcol), scaling_s
            type(t_edge) edge(:)
            type(t_triangle) triangle(:)
        end function ome_gen
    end interface
    ! Local variables
    ! temp for: \sum_{k=0}^{j-1}(j-k)c_{nk} + \frac{\mu s^2}{4}c_{nj}
    integer k_var, j_var, iam, nprocs, nprow, npcol, myrow, &
        mycol, dimrow, dimcol
    ! Excutives
    !   get starting information
    call blacs_pinfo( iam, nprocs )
    call blacs_gridinfo( ictxt, nprow, npcol, myrow, mycol )
    dimrow=ubound(v_rhs, 1)
    dimcol=ubound(v_rhs, 2)
    v_rhs=ome_gen(dimrow, dimcol, i_rank, freq, max_r, inc_wave, &
        edge, triangle, scaling_s, ictxt, descv)
    if (i_rank/=0) then
    do j_var=0, i_rank-1
        call PGEMM( 'N', 'N', descz(M_), descv(N_), descv(M_), &
            -ETA_0*scaling_s*scaling_s*(i_rank-j_var), &
            amnij(:,:,0), 1, 1, descz, out_cni(:,:,j_var), &
                1, 1, descv, 1._DKIND, v_rhs, 1, 1, descv )
        call PGEMM( 'N', 'N', descz(M_), descv(N_), descv(M_), &
            -ETA_0*scaling_s*scaling_s*.25_DKIND, &
            amnij(:,:,i_rank-j_var), 1, 1, descz, out_cni(:,:,j_var), &
                1, 1, descv, 1._DKIND, v_rhs, 1, 1, descv )
        call PGEMM( 'N', 'N', descz(M_), descv(N_), descv(M_), &
            -ETA_0/EPSILON_R, bmnij(:,:,i_rank-j_var), 1, 1, &
            descz, out_cni(:,:,j_var), 1, 1, descv, 1._DKIND, &
            v_rhs, 1, 1, descv )
        do k_var=0, j_var-1
            call PGEMM( 'N', 'N', descz(M_), descv(N_), descv(M_), &
                -ETA_0*scaling_s*scaling_s*(j_var-k_var), &
                amnij(:,:,i_rank-j_var), 1, 1, descz, out_cni(:,:,k_var), &
                1, 1, descv, 1._DKIND, v_rhs, 1, 1, descv )
        end do
    end do
    end if
end subroutine vform
