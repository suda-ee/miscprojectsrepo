!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! to find if they are the same triangle
subroutine tdemfie(freq, k_uvec_wave, scaling_s, max_rank, nrmfile, &
    outfile)
implicit none
! subroutine arguments
! nrmfile for: 已配对转换完毕的数据，或者本次转换要存储的文件名
integer max_rank
real freq, k_uvec_wave(:,:), scaling_s
character*64 nrmfile, outfile
! interfaces
interface
    subroutine zform(z, alpha, dim_z, edge, point, scaling_s)
        real z(:), alpha(:), point(:, :), scaling_s
        integer dim_z, edge(:, :)
    end subroutine zform
    subroutine vform(dim_z, edge, point, scaling_s, out_cni, num_dir, alpha, &
        v_rhs, i_rank, freq, max_r, k_uvec_wave)
        integer dim_z, edge(:,:), num_dir, i_rank
        real point(:,:), scaling_s, out_cni(:, :, :), alpha(:), &
            v_rhs(dim_z, 2*num_dir), freq, max_r, k_uvec_wave(3, num_dir)
    end subroutine vform
end interface
! Local variables
integer num_dir, num_points, num_edges, info, i_rank
real max_r
integer, allocatable :: edge(:,:), ipiv(:)
real, allocatable :: point(:,:), z(:), alpha(:), out_cni(:,:,:)
! Excutives
num_dir=ubound(k_uvec_wave, 2)
open(unit=1445,file=nrmfile,form="unformatted",status='old', action='read')
read(1445) num_points, num_edges
close(1445)
allocate(point(3,num_points),edge(4,num_edges))
open(unit=1445,file=nrmfile,form="unformatted",status='old', action='read')
read(1445) num_points, num_edges, point, edge
close(1445)
max_r=max(abs(maxval(point)),abs(minval(point)))
! z if packed stored.
allocate(z(num_edges*(num_edges+1)/2),alpha(num_edges*(num_edges+1)/2))
call zform(z, alpha, num_edges, edge, point, scaling_s)
allocate(ipiv(num_edges))
! Computes the Bunch-Kaufman factorization of a symmetric matrix using
! packed storage.
call SPTRF('U', num_edges, z, ipiv, info)
allocate(out_cni(num_edges, 2*num_dir, 0:max_rank))
call vform(num_edges, edge, point, scaling_s, out_cni, num_dir, alpha, &
    out_cni(:,:,0), 0, freq, max_r, k_uvec_wave)
call SPTRS('U', num_edges, 2*num_dir, z, ipiv, out_cni(:,:,0), num_edges, info)
do i_rank=1,max_r
    call vform(num_edges, edge, point, scaling_s, out_cni, num_dir, alpha, &
        out_cni(:,:,i_rank), i_rank, freq, max_r, k_uvec_wave)
    call SPTRS('U', num_edges, 2*num_dir, z, ipiv, out_cni(:,:,i_rank), &
        num_edges, info)
end do
deallocate(point, edge, z, alpha)
! 将所有系数 c_{nj} 写入文件
open(unit=1552,file=outfile,form="unformatted",status='unknown', action='write')
write(1552) out_cni
close(1552)
deallocate(out_cni)
end subroutine tdemfie
