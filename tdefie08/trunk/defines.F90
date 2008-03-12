!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#define VERBOSE
! define macro 'DOUBLE' if you want double precision default.
#undef DOUBLE
! Please always use lower-case letters in your source files but macros.
#ifdef DOUBLE
#define real real(8)
#define complex complex(8)
#define DKIND 8
#define DOT ddot
#define NRM2 dnrm2
#define LASRT dlasrt
#define SPTRF dsptrf
#define SPTRS dsptrs
#else
#define DKIND 4
#define DOT sdot
#define NRM2 snrm2
#define LASRT slasrt
#define SPTRF ssptrf
#define SPTRS ssptrs
#endif
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Constants macros
#define PI 3.1415926535897932_DKIND
! the velocity of light in vacuum, Ƶ�ʵ�λGHz, ����������� 1e9
#define CC_0 .299792458_DKIND
! the relative permittivity of vacuum
#define EPSILON_R 1._DKIND
! eta of vacuum
#define ETA_0 376.730313461_DKIND
! ����ʱ������������
#define MAX_STP 100
! TIME_STEP is used in the DFT, ���Ƶ���ź����ڻ��ּ���
#define TIME_STEP 20.
! �����������ڵȼ��������ʱ��
#define WAIT_TIMES 5._DKIND
! default configuration file name
#define CONF 'tdemfie.conf'
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!