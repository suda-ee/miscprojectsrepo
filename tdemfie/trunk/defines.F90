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
! the velocity of light in vacuum, 频率单位GHz, 所以这里除以 1e9
#define CC_0 .299792458_DKIND
! the permittivity of vacuum
#define EPSILON_0 8.854187817e-12_DKIND
! the permeability of vacuum
#define MU_0 12.566370614e-7_DKIND
! eta
#define ETA_0 376.730313461_DKIND
! 积分时的最大迭代步数
#define MAX_STP 100
! TIME_STEP is used in the DFT, 最高频率信号周期划分几步
#define TIME_STEP 20.
! 脉冲结束后的在等几个脉冲的时间
#define WAIT_TIMES 10.
! default configuration file name
#define CONF 'tdemfie.conf'
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
