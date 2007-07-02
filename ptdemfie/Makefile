# $URL: svn://172.16.1.1/projects/tdemfie/trunk/Makefile $
# $Id: Makefile 57 2007-05-21 08:08:11Z cai $
F90	=	mpiifort
LARGS	=	-L/opt/intel/cmkl/9.0/lib/32 -lmkl_scalapack -lmkl_blacs_intelmpi20 -lmkl_lapack -lmkl_ia32 -lmkl_lapack32 -lmkl -lsvml
#CARGS	=	-u -warn all -debug extended -inline-debug-info -g
CARGS	=	-warn all -ftz -ip -ipo -O3 -xW -align all #-prof-use #-prof-genx
DEFS	=	define.F90
OBJS	=	common.o ome_gen.o psi_func.o tran.o vform.o v_wave_gen.o zform.o Is_Same_Triangle.o ptdemfie.o main.o cal_est.o mymod.o ilasrt.o plapro.o
MODS	=	mymod.mod
EXES	=	ptdemfie

RM	=	rm -f

.SUFFIXES: .o .f90 .F90 .for .mod .f

all:	${EXES}

${EXES}	:	mod obj
	${F90} -o ${.TARGET} ${OBJS} ${LARGS}

mod:	${MODS}

obj:	${OBJS}

.F90.o .f90.o .for.o .F90.mod .f90.mod .f.o:
	${F90} -c ${.IMPSRC} ${CARGS}

clean:
	${RM} ${EXES} ${OBJS} ${MODS}
