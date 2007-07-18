!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! $URL$
! $Id$
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#define VERBOSE
! define macro 'DOUBLE' if you want double precision default.
#define DOUBLE
! Please always use lower-case letters in your source files but macros.
#ifdef DOUBLE
#define real real(8)
#define complex complex(8)
#define DKIND 8
#define DOT ddot
#define NRM2 dnrm2
#define LASRT dlasrt
#define PGETRF pdgetrf
#define PGETRS pdgetrs
#define PGEMM pdgemm
#define PGEMV pdgemv
#define PLAHEBING PDLAHEBING
#else
#define DKIND 4
#define DOT sdot
#define NRM2 snrm2
#define LASRT slasrt
#define PGETRF psgetrf
#define PGETRS psgetrs
#define PGEMV psgemv
#define PLAHEBING PSLAHEBING
#endif
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Constants macros
#define PI 3.1415926535897932_DKIND
! the velocity of light in vacuum, 频率单位GHz, 所以这里除以 1e9
#define CC_0 .299792458_DKIND
! the relative permittivity of vacuum
#define EPSILON_R 1._DKIND
! eta of vacuum
#define ETA_0 376.730313461_DKIND
! 积分时的最大迭代步数
#define MAX_STP 100
! TIME_STEP is used in the DFT, 最高频率信号周期划分几步(3*sigma)
#define TIME_STEP 20.
! 脉冲结束后的在等几个脉冲的时间
#define WAIT_TIMES 5._DKIND
! default configuration file name
#define CONF 'ptdemfie.conf'
! default block size for distributed matrix
#define BLOCKSIZE 64
! macros for scaLapack
#define DLEN_ 9
#define DT_ 1
#define CTXT_ 2
#define M_ 3
#define N_ 4
#define MB_ 5
#define NB_ 6
#define RSRC_ 7
#define CSRC_ 8
#define LLD_ 9
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
