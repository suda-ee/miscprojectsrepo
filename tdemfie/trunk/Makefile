# $URL$
# $Id$
F90	=	ifort
LARGS	=	-L/opt/intel/cmkl/8.0/lib/32 -lmkl_lapack -lmkl_ia32 -lsvml
#CARGS	=	-u -warn all -debug extended -inline-debug-info -g
CARGS	=	-ftz -ip -ipo -O3 -xW -align all -prof-use #-prof-genx
DEFS	=	define.F90
OBJS	=	common.o ome_gen.o psi_func.o tran.o vform.o v_wave_gen.o zform.o I_ij_func.o amnij_func.o bmnij_func.o Is_Same_Triangle.o tdemfie.o main.o rcs_cal.o cal_est.o mymod.o ilasrt.o
MODS	=	mymod.mod
EXES	=	tdemfie

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
