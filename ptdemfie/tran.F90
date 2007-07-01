!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL: svn://cai.wireless/projects/tdemfie/trunk/tran.F90 $
! $Id: tran.F90 23 2006-05-14 09:53:33Z cai $
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include "defines.F90"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! transform the Hypermesh data to point(3, :) and edge(4, :), then save
! them in a file.
subroutine tran(dataname, outfilename)
use mymod
implicit none
character :: dataname*64, outfilename*64;
    ! local variables
    dimension rp(:,:),nedge(:,:),ntri(:,:),nedge1(:,:),nflag(:),ndk(4),ndj(4)
    character :: bujianming*64
    allocatable  ntri,nedge1,nflag, rp, nedge
    integer j, ntk12, ntk11, mflag, nodk1, nodk2, nodk3, m, k, nflag, nedge, &
        nedge1, n, mn, mt, ii, nx1, jj, ncx, jflag, mnj2, ndj, mnk2, mg, &
        ndk, mn0, nq0, nt, ntj12, ntj11, nodj1, nodj2, nodj3, nq, ng, ntri, &
        info
    integer node(3)
    real rp, NRM2
    type(t_triangle), allocatable :: triangle(:)
    type(t_edge), allocatable :: edge(:)
    logical Is_Same_Triangle
    open(unit=10,file=dataname,status='old', action='read')
    read(10,*) mt,mn
    read(10,*) n ! 这行为部件数，在本子程序中暂时无用，跳过
    read(10,*) bujianming ! 部件名跳过
    read(10,*) bujianming ! 颜色索引跳过
    read(10,*) bujianming ! 部件最后面元的总序号，跳过
    allocate(rp(3,mn),ntri(3,mt),nedge1(4,4*mt),nedge(4,2*mt),nflag(4*mt))
    read(10,*) (n,rp(:,k),k=1,mn)
    read(10,*) (n,ntri(:,k),k=1,mt)
    close(10)
    !先两两配对
    nq=1    
    do k=1,mt
        do m=1,3
            if(m==1) then 
                nodk1=ntri(1,k)
                nodk2=ntri(2,k)
                nodk3=ntri(3,k)
                mflag=1 
            elseif(m==2) then
                nodk1=ntri(2,k)
                nodk2=ntri(3,k)
                nodk3=ntri(1,k)
                mflag=1 
            else
                nodk1=ntri(3,k)
                nodk2=ntri(1,k)
                nodk3=ntri(2,k)
                mflag=1 
            end if
            ntk11=abs(nodk1-nodk2)
            ntk12=nodk1+nodk2
            do j=1,mt
                if(mflag==1) then
                    if(k==j) then 
                        ng=0
                    else
                        do n=1,3
                            if(n==1) then 
                                nodj1=ntri(1,j)
                                nodj2=ntri(2,j)
                                nodj3=ntri(3,j)
                            elseif(n==2) then
                                nodj1=ntri(2,j)
                                nodj2=ntri(3,j)
                                nodj3=ntri(1,j)
                            else
                                nodj1=ntri(3,j)
                                nodj2=ntri(1,j)
                                nodj3=ntri(2,j)
                            end if 
                            ntj11=abs(nodj1-nodj2)
                            ntj12=nodj1+nodj2
                            nt=abs(ntk11-ntj11)+abs(ntk12-ntj12)
                            if(nt==0) then
                                mflag=0
                                nedge1(1,nq)=nodk1
                                nedge1(2,nq)=nodj3
                                nedge1(3,nq)=nodk2
                                nedge1(4,nq)=nodk3
                                nq=nq+1 
                            endif 
                        end do
                    end if
                end if
            end do 
        end do
    end do
    nq0=nq-1
    ! 取其中的一半即可
    do k=1,nq0
        mn0=1
        ndk=nedge1(:,k)
        mnk2=ndk(1)+ndk(3)+ndk(2)+ndk(4)
        nflag(k)=0
        j=1
        do while (j<=nq0)
            if(j==k) then
                mg=0
            else
                ndj=nedge1(:,j)
                mnj2=ndj(1)+ndj(3)+ndj(2)+ndj(4)
                mn0=abs(mnk2-mnj2)
                jflag=0
                if(mn0==0) then
                    do jj=1,4
                        nx1=ndk(jj)
                        do ii=1,4
                            ncx=nx1-ndj(ii)
                            if(ncx==0) then
                                jflag=jflag+1
                            end if
                        end do
                    end do
                endif
            endif
            if(jflag==4) then
                nflag(k)=j 
                exit
            else
                j=j+1
            end if
        end do 
    end do
    nq=1
    do k=1,nq0
        if(k<=nflag(k)) then
            nedge(:,nq)=nedge1(:,k)
            nq=nq+1
        end if            
    end do
    nq0=nq-1
    deallocate(nedge1,nflag)
    ! 开始计算。 rp 就是 point
    allocate(edge(nq0), triangle(mt))
    do k=1, nq0
        edge(k)%poi=nedge(:,k)
    end do
    do k=1, mt
        call sort('I', 3, ntri(:,k), info)
        triangle(k)%poi=ntri(:,k)
    end do
    deallocate(nedge,ntri)
    do k=1, mt
        triangle(k)%center=(rp(:,triangle(k)%poi(1))+ &
            rp(:,triangle(k)%poi(2))+rp(:,triangle(k)%poi(3)))/3.
        call cal_area(rp(:,triangle(k)%poi(1)), &
            rp(:,triangle(k)%poi(2)),rp(:,triangle(k)%poi(3)), &
            triangle(k)%area)
        triangle(k)%tri_point(:,1)=(triangle(k)%center+ &
            rp(:,triangle(k)%poi(1)))/2.
        triangle(k)%tri_point(:,2)=(triangle(k)%center+ &
            rp(:,triangle(k)%poi(2)))/2.
        triangle(k)%tri_point(:,3)=(triangle(k)%center+ &
            rp(:,triangle(k)%poi(3)))/2.
    end do
    do j=1, nq0
        node=edge(j)%poi(1:3)
        call sort('I', 3, node, info)
        do k=1, mt
            if (Is_Same_Triangle(node, triangle(k)%poi)) then
                edge(j)%tri(1)=k
                exit
            end if
        end do
        node=edge(j)%poi((/1,3,4/))
        call sort('I', 3, node, info)
        do k=1, mt
            if (Is_Same_Triangle(node, triangle(k)%poi)) then
                edge(j)%tri(2)=k
                exit
            end if
        end do
        edge(j)%len=NRM2(3, rp(:,edge(j)%poi(1))-rp(:,edge(j)%poi(3)),1)
        edge(j)%rho(:,1,1)=triangle(edge(j)%tri(1))%tri_point(:,1)- &
            rp(:,edge(j)%poi(2))
        edge(j)%rho(:,2,1)=triangle(edge(j)%tri(1))%tri_point(:,2)- &
            rp(:,edge(j)%poi(2))
        edge(j)%rho(:,3,1)=triangle(edge(j)%tri(1))%tri_point(:,3)- &
            rp(:,edge(j)%poi(2))
        edge(j)%rho(:,1,2)=triangle(edge(j)%tri(2))%tri_point(:,1)- &
            rp(:,edge(j)%poi(4))
        edge(j)%rho(:,2,2)=triangle(edge(j)%tri(2))%tri_point(:,2)- &
            rp(:,edge(j)%poi(4))
        edge(j)%rho(:,3,2)=triangle(edge(j)%tri(2))%tri_point(:,3)- &
            rp(:,edge(j)%poi(4))
    end do
    open(unit=10,file=outfilename,form="unformatted")
    ! 边数目；三角形数目；点数目
    write(10) nq0, mt, mn, &
        edge, triangle, rp
    close(10)
end subroutine tran
