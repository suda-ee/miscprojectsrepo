# $URL: svn://land/projects/tdefie08/trunk/Makefile $
# $Id: Makefile 84 2008-03-10 10:38:12Z cai $
F90	=	ifort
#LARGS	=	-lmkl_lapack -lmkl_ia32 -lmkl_core -lguide -lpthread -lsvml
LARGS	=	-lmkl_intel -lmkl_intel_thread -lmkl_core -lguide -lpthread -lsvml
#CARGS	=	-u -warn all -debug extended -inline-debug-info -g
CARGS	=	-warn all -ftz -ip -ipo -O3 -xT -align all -parallel -prof-use #-prof-genx
DEFS	=	define.F90
OBJS	=	common.o ome_gen.o psi_func.o tran.o vform.o v_wave_gen.o zform.o tdemfie.o main.o cal_est.o mymod.o
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
