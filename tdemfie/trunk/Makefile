# $URL$
# $Id$
F90	=	ifort
LARGS	=	-L/opt/intel/cmkl/8.0/lib/32 -lmkl_lapack -lmkl_ia32
CARGS	=	-warn all -debug extended -g #-fast#-O3 -align -tpp7 -xW
DEFS	=	define.F90
OBJS	=	common.o ome_gen.o psi_func.o seg_triangle_pair.o tran.o vform.o v_wave_gen.o zform.o I_ij_func.o amnij_func.o bmnij_func.o Is_Same_Triangle.o tdemfie.o main.o
EXES	=	tdemfie

RM	=	rm -f

.SUFFIXES: .o .f90 .F90 .for

all:	${EXES}

${EXES}	:	${OBJS}
	${F90} -o ${.TARGET} ${OBJS} ${LARGS}

obj:	${OBJS} ${DEFS}

.F90.o .f90.o .for.o:
	${F90} -c ${.IMPSRC} ${CARGS}

clean:
	${RM} ${EXES} ${OBJS}
