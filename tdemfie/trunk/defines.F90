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
#define DOT ddot
#define NRM2 dnrm2
#define SORT dlasrt
#define SPTRF dsptrf
#define SPTRS dsptrs
#else
#define DOT sdot
#define NRM2 snrm2
#define SORT slasrt
#define SPTRF ssptrf
#define SPTRS ssptrs
#endif
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Constants macros
#define PI 3.1415926535897932
! the velocity of light in vacuum
#define VECL_C 299792458 
! the permittivity of vacuum
#define EPSILON_0 8.854187818e-12
! the permeability of vacuum
#define MU_0 0.1256637061435917e-4
! eta
#define ETA_0 376.9911184307752
! Gaussian 积分时的精度
#define EPS 1e-6
! Gaussian 积分时的最大迭代步数
#define MAX_STP 1000
! TIME_STEP is used in the DFT, 最高频率信号周期划分几步
#define TIME_STEP 20
! 脉冲结束后的在等几个脉冲的时间
#define WAIT_TIMES 10
! default configuration file name
#define CONF 'tdemfie.conf'
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
