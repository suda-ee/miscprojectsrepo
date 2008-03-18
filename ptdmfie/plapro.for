* $Name:  $
* $Id: plapro.for 69 2007-07-18 05:15:54Z cai $
      SUBROUTINE PCLAFENFA( GLBA, A, DESCA, IRPUT, ICPUT )
*
* 
*     由 pdlaread 改造而来
*
*     .. Scalar Arguments ..
      INTEGER            ICPUT, IRPUT
*     ..
*     .. Array Arguments ..
      INTEGER            DESCA( * )
      COMPLEX   A( * ), GLBA(*)
*     ..
*
*  Purpose
*  =======
*
*
*  Only the process of coordinates {IRPUT, ICPUT} read the file.
*
*  WORK must be of size >= MB_ = DESCA( MB_ ).
*
*  =====================================================================
*
*     .. Parameters ..
      INTEGER            BLOCK_CYCLIC_2D, CSRC_, CTXT_, DLEN_, DT_,
     $                   LLD_, MB_, M_, NB_, N_, RSRC_
      PARAMETER          ( BLOCK_CYCLIC_2D = 1, DLEN_ = 9, DT_ = 1,
     $                     CTXT_ = 2, M_ = 3, N_ = 4, MB_ = 5, NB_ = 6,
     $                     RSRC_ = 7, CSRC_ = 8, LLD_ = 9 )
*     ..
*     .. Local Scalars ..
      INTEGER            H, I, IB, ICTXT, ICURCOL, ICURROW, II, J, JB,
     $                   JJ, K, LDA, M, MYCOL, MYROW, N, NPCOL, NPROW,
     $                   IDXGLB
*     ..
*     .. Local Arrays ..
      COMPLEX WORK( DESCA( MB_ ) )
*     ..
*     .. External Subroutines ..
      EXTERNAL           BLACS_GRIDINFO, INFOG2L,
     $                   IGEBS2D, IGEBR2D
*     ..
*     .. Executable Statements ..
*
*     Get grid parameters
*
      ICTXT = DESCA( CTXT_ )
      CALL BLACS_GRIDINFO( ICTXT, NPROW, NPCOL, MYROW, MYCOL )
*
      M=DESCA( M_ )
      N=DESCA( N_ )
*
      II = 1
      JJ = 1
      ICURROW = DESCA( RSRC_ )
      ICURCOL = DESCA( CSRC_ )
      LDA = DESCA( LLD_ )
      IDXGLB=1
*
*     Loop over column blocks
*
      DO 50 J = 1, N, DESCA( NB_ )
         JB = MIN(  DESCA( NB_ ), N-J+1 )
         DO 40 H = 0, JB-1
*
*           Loop over block of rows
*
            DO 30 I = 1, M, DESCA( MB_ )
               IB = MIN( DESCA( MB_ ), M-I+1 )
               IF( ICURROW.EQ.IRPUT .AND. ICURCOL.EQ.ICPUT ) THEN
                  IF( MYROW.EQ.IRPUT .AND. MYCOL.EQ.ICPUT ) THEN
                     DO 10 K = 0, IB-1
                        A( II+K+(JJ+H-1)*LDA ) = GLBA( IDXGLB )
                        IDXGLB = IDXGLB + 1
   10                CONTINUE
                  END IF
               ELSE
                  IF( MYROW.EQ.ICURROW .AND. MYCOL.EQ.ICURCOL ) THEN
                     CALL CGERV2D( ICTXT, IB, 1, A( II+(JJ+H-1)*LDA ),
     $                             LDA, IRPUT, ICPUT )
                   ELSE IF( MYROW.EQ.IRPUT .AND. MYCOL.EQ.ICPUT ) THEN
                     DO 20 K = 1, IB
                        WORK( K ) = GLBA( IDXGLB )
                        IDXGLB = IDXGLB + 1
   20                CONTINUE
                     CALL CGESD2D( ICTXT, IB, 1, WORK, DESCA( MB_ ),
     $                             ICURROW, ICURCOL )
                  END IF
               END IF
               IF( MYROW.EQ.ICURROW )
     $            II = II + IB
               ICURROW = MOD( ICURROW+1, NPROW )
   30       CONTINUE
*
            II = 1
            ICURROW = DESCA( RSRC_ )
   40    CONTINUE
*
         IF( MYCOL.EQ.ICURCOL )
     $      JJ = JJ + JB
         ICURCOL = MOD( ICURCOL+1, NPCOL )
*
   50 CONTINUE
*
      RETURN
*
*
      END
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
      SUBROUTINE PCLAHEBING( GLBA, M, N, A, IA, JA, DESCA, IRGET,
     $                      ICGET )
*
*     由 pdlawrite 改造而来
*
*     .. Scalar Arguments ..
      INTEGER            IA, ICGET, IRGET, JA, M, N
*     ..
*     .. Array Arguments ..
      INTEGER            DESCA( * )
      COMPLEX   A( * ), GLBA( * )
*     ..
*
*  Purpose
*  =======
*
*
*  WORK must be of size >= MB_ = DESCA( MB_ ).
*
*  =====================================================================
*
*     .. Parameters ..
      INTEGER            BLOCK_CYCLIC_2D, CSRC_, CTXT_, DLEN_, DT_,
     $                   LLD_, MB_, M_, NB_, N_, RSRC_
      PARAMETER          ( BLOCK_CYCLIC_2D = 1, DLEN_ = 9, DT_ = 1,
     $                     CTXT_ = 2, M_ = 3, N_ = 4, MB_ = 5, NB_ = 6,
     $                     RSRC_ = 7, CSRC_ = 8, LLD_ = 9 )
*     ..
*     .. Local Scalars ..
      INTEGER            H, I, IACOL, IAROW, IB, ICTXT, ICURCOL,
     $                   ICURROW, II, IIA, IN, J, JB, JJ, JJA, JN, K,
     $                   LDA, MYCOL, MYROW, NPCOL, NPROW, IDXGLB
*     ..
*     .. External Subroutines ..
      EXTERNAL           BLACS_BARRIER, BLACS_GRIDINFO, INFOG2L
      COMPLEX WORK( DESCA( MB_ ) )
*     ..
*     .. Executable Statements ..
*
*     Get grid parameters
*
      ICTXT = DESCA( CTXT_ )
      CALL BLACS_GRIDINFO( ICTXT, NPROW, NPCOL, MYROW, MYCOL )
*
      CALL INFOG2L( IA, JA, DESCA, NPROW, NPCOL, MYROW, MYCOL,
     $              IIA, JJA, IAROW, IACOL )
      ICURROW = IAROW
      ICURCOL = IACOL
      II = IIA
      JJ = JJA
      LDA = DESCA( LLD_ )
*
*     Handle the first block of column separately
*
      IDXGLB=1
      JN = MIN( ICEIL( JA, DESCA( NB_ ) ) * DESCA( NB_ ), JA+N-1 )
      JB = JN-JA+1
      DO 60 H = 0, JB-1
         IN = MIN( ICEIL( IA, DESCA( MB_ ) ) * DESCA( MB_ ), IA+M-1 )
         IB = IN-IA+1
         IF( ICURROW.EQ.IRGET .AND. ICURCOL.EQ.ICGET ) THEN
            IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
               DO 10 K = 0, IB-1
                  GLBA( IDXGLB ) = A( II+K+(JJ+H-1)*LDA )
                  IDXGLB = IDXGLB + 1
   10          CONTINUE
            END IF
         ELSE
            IF( MYROW.EQ.ICURROW .AND. MYCOL.EQ.ICURCOL ) THEN
               CALL CGESD2D( ICTXT, IB, 1, A( II+(JJ+H-1)*LDA ), LDA,
     $                       IRGET, ICGET )
            ELSE IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
               CALL CGERV2D( ICTXT, IB, 1, WORK, DESCA( MB_ ),
     $                       ICURROW, ICURCOL )
               DO 20 K = 1, IB
                  GLBA( IDXGLB ) = WORK( K )
                  IDXGLB = IDXGLB + 1
   20          CONTINUE
            END IF
         END IF
         IF( MYROW.EQ.ICURROW )
     $      II = II + IB
         ICURROW = MOD( ICURROW+1, NPROW )
         CALL BLACS_BARRIER( ICTXT, 'All' )
*
*        Loop over remaining block of rows
*
         DO 50 I = IN+1, IA+M-1, DESCA( MB_ )
            IB = MIN( DESCA( MB_ ), IA+M-I )
            IF( ICURROW.EQ.IRGET .AND. ICURCOL.EQ.ICGET ) THEN
               IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                  DO 30 K = 0, IB-1
                     GLBA( IDXGLB ) = A( II+K+(JJ+H-1)*LDA )
                     IDXGLB = IDXGLB + 1
   30             CONTINUE
               END IF
            ELSE
               IF( MYROW.EQ.ICURROW .AND. MYCOL.EQ.ICURCOL ) THEN
                  CALL CGESD2D( ICTXT, IB, 1, A( II+(JJ+H-1)*LDA ),
     $                          LDA, IRGET, ICGET )
               ELSE IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                  CALL CGERV2D( ICTXT, IB, 1, WORK, DESCA( MB_ ),
     $                          ICURROW, ICURCOL )
                  DO 40 K = 1, IB
                     GLBA( IDXGLB ) = WORK( K )
                     IDXGLB = IDXGLB + 1
   40             CONTINUE
               END IF
            END IF
            IF( MYROW.EQ.ICURROW )
     $         II = II + IB
            ICURROW = MOD( ICURROW+1, NPROW )
            CALL BLACS_BARRIER( ICTXT, 'All' )
   50    CONTINUE
*
        II = IIA
        ICURROW = IAROW
   60 CONTINUE
*
      IF( MYCOL.EQ.ICURCOL )
     $   JJ = JJ + JB
      ICURCOL = MOD( ICURCOL+1, NPCOL )
      CALL BLACS_BARRIER( ICTXT, 'All' )
*
*     Loop over remaining column blocks
*
      DO 130 J = JN+1, JA+N-1, DESCA( NB_ )
         JB = MIN(  DESCA( NB_ ), JA+N-J )
         DO 120 H = 0, JB-1
            IN = MIN( ICEIL( IA, DESCA( MB_ ) ) * DESCA( MB_ ), IA+M-1 )
            IB = IN-IA+1
            IF( ICURROW.EQ.IRGET .AND. ICURCOL.EQ.ICGET ) THEN
               IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                  DO 70 K = 0, IB-1
                     GLBA( IDXGLB ) = A( II+K+(JJ+H-1)*LDA )
                     IDXGLB = IDXGLB + 1
   70             CONTINUE
               END IF
            ELSE
               IF( MYROW.EQ.ICURROW .AND. MYCOL.EQ.ICURCOL ) THEN
                  CALL CGESD2D( ICTXT, IB, 1, A( II+(JJ+H-1)*LDA ),
     $                          LDA, IRGET, ICGET )
               ELSE IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                  CALL CGERV2D( ICTXT, IB, 1, WORK, DESCA( MB_ ),
     $                          ICURROW, ICURCOL )
                  DO 80 K = 1, IB
                     GLBA( IDXGLB ) = WORK( K )
                     IDXGLB = IDXGLB + 1
   80             CONTINUE
               END IF
            END IF
            IF( MYROW.EQ.ICURROW )
     $         II = II + IB
            ICURROW = MOD( ICURROW+1, NPROW )
            CALL BLACS_BARRIER( ICTXT, 'All' )
*
*           Loop over remaining block of rows
*
            DO 110 I = IN+1, IA+M-1, DESCA( MB_ )
               IB = MIN( DESCA( MB_ ), IA+M-I )
               IF( ICURROW.EQ.IRGET .AND. ICURCOL.EQ.ICGET ) THEN
                  IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                     DO 90 K = 0, IB-1
                        GLBA( IDXGLB ) = A( II+K+(JJ+H-1)*LDA )
                        IDXGLB = IDXGLB + 1
   90                CONTINUE
                  END IF
               ELSE
                  IF( MYROW.EQ.ICURROW .AND. MYCOL.EQ.ICURCOL ) THEN
                     CALL CGESD2D( ICTXT, IB, 1, A( II+(JJ+H-1)*LDA ),
     $                             LDA, IRGET, ICGET )
                   ELSE IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                     CALL CGERV2D( ICTXT, IB, 1, WORK, DESCA( MB_ ),
     $                             ICURROW, ICURCOL )
                     DO 100 K = 1, IB
                        GLBA( IDXGLB ) = WORK( K )
                        IDXGLB = IDXGLB + 1
  100                CONTINUE
                  END IF
               END IF
               IF( MYROW.EQ.ICURROW )
     $            II = II + IB
               ICURROW = MOD( ICURROW+1, NPROW )
               CALL BLACS_BARRIER( ICTXT, 'All' )
  110       CONTINUE
*
            II = IIA
            ICURROW = IAROW
  120    CONTINUE
*
         IF( MYCOL.EQ.ICURCOL )
     $      JJ = JJ + JB
         ICURCOL = MOD( ICURCOL+1, NPCOL )
         CALL BLACS_BARRIER( ICTXT, 'All' )
*
  130 CONTINUE
*
      RETURN
*
*
      END
************************************************************************
!
      SUBROUTINE PSLAHEBING( GLBA, M, N, A, IA, JA, DESCA, IRGET,
     $                      ICGET )
*
*     由 pdlawrite 改造而来
*
*     .. Scalar Arguments ..
      INTEGER            IA, ICGET, IRGET, JA, M, N
*     ..
*     .. Array Arguments ..
      INTEGER            DESCA( * )
      REAL   A( * ), GLBA( * )
*     ..
*
*  Purpose
*  =======
*
*
*  WORK must be of size >= MB_ = DESCA( MB_ ).
*
*  =====================================================================
*
*     .. Parameters ..
      INTEGER            BLOCK_CYCLIC_2D, CSRC_, CTXT_, DLEN_, DT_,
     $                   LLD_, MB_, M_, NB_, N_, RSRC_
      PARAMETER          ( BLOCK_CYCLIC_2D = 1, DLEN_ = 9, DT_ = 1,
     $                     CTXT_ = 2, M_ = 3, N_ = 4, MB_ = 5, NB_ = 6,
     $                     RSRC_ = 7, CSRC_ = 8, LLD_ = 9 )
*     ..
*     .. Local Scalars ..
      INTEGER            H, I, IACOL, IAROW, IB, ICTXT, ICURCOL,
     $                   ICURROW, II, IIA, IN, J, JB, JJ, JJA, JN, K,
     $                   LDA, MYCOL, MYROW, NPCOL, NPROW, IDXGLB
*     ..
*     .. External Subroutines ..
      EXTERNAL           BLACS_BARRIER, BLACS_GRIDINFO, INFOG2L
      REAL WORK( DESCA( MB_ ) )
*     ..
*     .. Executable Statements ..
*
*     Get grid parameters
*
      ICTXT = DESCA( CTXT_ )
      CALL BLACS_GRIDINFO( ICTXT, NPROW, NPCOL, MYROW, MYCOL )
*
      CALL INFOG2L( IA, JA, DESCA, NPROW, NPCOL, MYROW, MYCOL,
     $              IIA, JJA, IAROW, IACOL )
      ICURROW = IAROW
      ICURCOL = IACOL
      II = IIA
      JJ = JJA
      LDA = DESCA( LLD_ )
*
*     Handle the first block of column separately
*
      IDXGLB=1
      JN = MIN( ICEIL( JA, DESCA( NB_ ) ) * DESCA( NB_ ), JA+N-1 )
      JB = JN-JA+1
      DO 60 H = 0, JB-1
         IN = MIN( ICEIL( IA, DESCA( MB_ ) ) * DESCA( MB_ ), IA+M-1 )
         IB = IN-IA+1
         IF( ICURROW.EQ.IRGET .AND. ICURCOL.EQ.ICGET ) THEN
            IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
               DO 10 K = 0, IB-1
                  GLBA( IDXGLB ) = A( II+K+(JJ+H-1)*LDA )
                  IDXGLB = IDXGLB + 1
   10          CONTINUE
            END IF
         ELSE
            IF( MYROW.EQ.ICURROW .AND. MYCOL.EQ.ICURCOL ) THEN
               CALL SGESD2D( ICTXT, IB, 1, A( II+(JJ+H-1)*LDA ), LDA,
     $                       IRGET, ICGET )
            ELSE IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
               CALL SGERV2D( ICTXT, IB, 1, WORK, DESCA( MB_ ),
     $                       ICURROW, ICURCOL )
               DO 20 K = 1, IB
                  GLBA( IDXGLB ) = WORK( K )
                  IDXGLB = IDXGLB + 1
   20          CONTINUE
            END IF
         END IF
         IF( MYROW.EQ.ICURROW )
     $      II = II + IB
         ICURROW = MOD( ICURROW+1, NPROW )
         CALL BLACS_BARRIER( ICTXT, 'All' )
*
*        Loop over remaining block of rows
*
         DO 50 I = IN+1, IA+M-1, DESCA( MB_ )
            IB = MIN( DESCA( MB_ ), IA+M-I )
            IF( ICURROW.EQ.IRGET .AND. ICURCOL.EQ.ICGET ) THEN
               IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                  DO 30 K = 0, IB-1
                     GLBA( IDXGLB ) = A( II+K+(JJ+H-1)*LDA )
                     IDXGLB = IDXGLB + 1
   30             CONTINUE
               END IF
            ELSE
               IF( MYROW.EQ.ICURROW .AND. MYCOL.EQ.ICURCOL ) THEN
                  CALL SGESD2D( ICTXT, IB, 1, A( II+(JJ+H-1)*LDA ),
     $                          LDA, IRGET, ICGET )
               ELSE IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                  CALL SGERV2D( ICTXT, IB, 1, WORK, DESCA( MB_ ),
     $                          ICURROW, ICURCOL )
                  DO 40 K = 1, IB
                     GLBA( IDXGLB ) = WORK( K )
                     IDXGLB = IDXGLB + 1
   40             CONTINUE
               END IF
            END IF
            IF( MYROW.EQ.ICURROW )
     $         II = II + IB
            ICURROW = MOD( ICURROW+1, NPROW )
            CALL BLACS_BARRIER( ICTXT, 'All' )
   50    CONTINUE
*
        II = IIA
        ICURROW = IAROW
   60 CONTINUE
*
      IF( MYCOL.EQ.ICURCOL )
     $   JJ = JJ + JB
      ICURCOL = MOD( ICURCOL+1, NPCOL )
      CALL BLACS_BARRIER( ICTXT, 'All' )
*
*     Loop over remaining column blocks
*
      DO 130 J = JN+1, JA+N-1, DESCA( NB_ )
         JB = MIN(  DESCA( NB_ ), JA+N-J )
         DO 120 H = 0, JB-1
            IN = MIN( ICEIL( IA, DESCA( MB_ ) ) * DESCA( MB_ ), IA+M-1 )
            IB = IN-IA+1
            IF( ICURROW.EQ.IRGET .AND. ICURCOL.EQ.ICGET ) THEN
               IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                  DO 70 K = 0, IB-1
                     GLBA( IDXGLB ) = A( II+K+(JJ+H-1)*LDA )
                     IDXGLB = IDXGLB + 1
   70             CONTINUE
               END IF
            ELSE
               IF( MYROW.EQ.ICURROW .AND. MYCOL.EQ.ICURCOL ) THEN
                  CALL SGESD2D( ICTXT, IB, 1, A( II+(JJ+H-1)*LDA ),
     $                          LDA, IRGET, ICGET )
               ELSE IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                  CALL SGERV2D( ICTXT, IB, 1, WORK, DESCA( MB_ ),
     $                          ICURROW, ICURCOL )
                  DO 80 K = 1, IB
                     GLBA( IDXGLB ) = WORK( K )
                     IDXGLB = IDXGLB + 1
   80             CONTINUE
               END IF
            END IF
            IF( MYROW.EQ.ICURROW )
     $         II = II + IB
            ICURROW = MOD( ICURROW+1, NPROW )
            CALL BLACS_BARRIER( ICTXT, 'All' )
*
*           Loop over remaining block of rows
*
            DO 110 I = IN+1, IA+M-1, DESCA( MB_ )
               IB = MIN( DESCA( MB_ ), IA+M-I )
               IF( ICURROW.EQ.IRGET .AND. ICURCOL.EQ.ICGET ) THEN
                  IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                     DO 90 K = 0, IB-1
                        GLBA( IDXGLB ) = A( II+K+(JJ+H-1)*LDA )
                        IDXGLB = IDXGLB + 1
   90                CONTINUE
                  END IF
               ELSE
                  IF( MYROW.EQ.ICURROW .AND. MYCOL.EQ.ICURCOL ) THEN
                     CALL SGESD2D( ICTXT, IB, 1, A( II+(JJ+H-1)*LDA ),
     $                             LDA, IRGET, ICGET )
                   ELSE IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                     CALL SGERV2D( ICTXT, IB, 1, WORK, DESCA( MB_ ),
     $                             ICURROW, ICURCOL )
                     DO 100 K = 1, IB
                        GLBA( IDXGLB ) = WORK( K )
                        IDXGLB = IDXGLB + 1
  100                CONTINUE
                  END IF
               END IF
               IF( MYROW.EQ.ICURROW )
     $            II = II + IB
               ICURROW = MOD( ICURROW+1, NPROW )
               CALL BLACS_BARRIER( ICTXT, 'All' )
  110       CONTINUE
*
            II = IIA
            ICURROW = IAROW
  120    CONTINUE
*
         IF( MYCOL.EQ.ICURCOL )
     $      JJ = JJ + JB
         ICURCOL = MOD( ICURCOL+1, NPCOL )
         CALL BLACS_BARRIER( ICTXT, 'All' )
*
  130 CONTINUE
*
      RETURN
*
*
      END
************************************************************************
!
      SUBROUTINE PDLAHEBING( GLBA, M, N, A, IA, JA, DESCA, IRGET,
     $                      ICGET )
*
*     由 pdlawrite 改造而来
*
*     .. Scalar Arguments ..
      INTEGER            IA, ICGET, IRGET, JA, M, N
*     ..
*     .. Array Arguments ..
      INTEGER            DESCA( * )
      REAL(8)   A( * ), GLBA( * )
*     ..
*
*  Purpose
*  =======
*
*
*  WORK must be of size >= MB_ = DESCA( MB_ ).
*
*  =====================================================================
*
*     .. Parameters ..
      INTEGER            BLOCK_CYCLIC_2D, CSRC_, CTXT_, DLEN_, DT_,
     $                   LLD_, MB_, M_, NB_, N_, RSRC_
      PARAMETER          ( BLOCK_CYCLIC_2D = 1, DLEN_ = 9, DT_ = 1,
     $                     CTXT_ = 2, M_ = 3, N_ = 4, MB_ = 5, NB_ = 6,
     $                     RSRC_ = 7, CSRC_ = 8, LLD_ = 9 )
*     ..
*     .. Local Scalars ..
      INTEGER            H, I, IACOL, IAROW, IB, ICTXT, ICURCOL,
     $                   ICURROW, II, IIA, IN, J, JB, JJ, JJA, JN, K,
     $                   LDA, MYCOL, MYROW, NPCOL, NPROW, IDXGLB
*     ..
*     .. External Subroutines ..
      EXTERNAL           BLACS_BARRIER, BLACS_GRIDINFO, INFOG2L
      REAL(8) WORK( DESCA( MB_ ) )
*     ..
*     .. Executable Statements ..
*
*     Get grid parameters
*
      ICTXT = DESCA( CTXT_ )
      CALL BLACS_GRIDINFO( ICTXT, NPROW, NPCOL, MYROW, MYCOL )
*
      CALL INFOG2L( IA, JA, DESCA, NPROW, NPCOL, MYROW, MYCOL,
     $              IIA, JJA, IAROW, IACOL )
      ICURROW = IAROW
      ICURCOL = IACOL
      II = IIA
      JJ = JJA
      LDA = DESCA( LLD_ )
*
*     Handle the first block of column separately
*
      IDXGLB=1
      JN = MIN( ICEIL( JA, DESCA( NB_ ) ) * DESCA( NB_ ), JA+N-1 )
      JB = JN-JA+1
      DO 60 H = 0, JB-1
         IN = MIN( ICEIL( IA, DESCA( MB_ ) ) * DESCA( MB_ ), IA+M-1 )
         IB = IN-IA+1
         IF( ICURROW.EQ.IRGET .AND. ICURCOL.EQ.ICGET ) THEN
            IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
               DO 10 K = 0, IB-1
                  GLBA( IDXGLB ) = A( II+K+(JJ+H-1)*LDA )
                  IDXGLB = IDXGLB + 1
   10          CONTINUE
            END IF
         ELSE
            IF( MYROW.EQ.ICURROW .AND. MYCOL.EQ.ICURCOL ) THEN
               CALL DGESD2D( ICTXT, IB, 1, A( II+(JJ+H-1)*LDA ), LDA,
     $                       IRGET, ICGET )
            ELSE IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
               CALL DGERV2D( ICTXT, IB, 1, WORK, DESCA( MB_ ),
     $                       ICURROW, ICURCOL )
               DO 20 K = 1, IB
                  GLBA( IDXGLB ) = WORK( K )
                  IDXGLB = IDXGLB + 1
   20          CONTINUE
            END IF
         END IF
         IF( MYROW.EQ.ICURROW )
     $      II = II + IB
         ICURROW = MOD( ICURROW+1, NPROW )
         CALL BLACS_BARRIER( ICTXT, 'All' )
*
*        Loop over remaining block of rows
*
         DO 50 I = IN+1, IA+M-1, DESCA( MB_ )
            IB = MIN( DESCA( MB_ ), IA+M-I )
            IF( ICURROW.EQ.IRGET .AND. ICURCOL.EQ.ICGET ) THEN
               IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                  DO 30 K = 0, IB-1
                     GLBA( IDXGLB ) = A( II+K+(JJ+H-1)*LDA )
                     IDXGLB = IDXGLB + 1
   30             CONTINUE
               END IF
            ELSE
               IF( MYROW.EQ.ICURROW .AND. MYCOL.EQ.ICURCOL ) THEN
                  CALL DGESD2D( ICTXT, IB, 1, A( II+(JJ+H-1)*LDA ),
     $                          LDA, IRGET, ICGET )
               ELSE IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                  CALL DGERV2D( ICTXT, IB, 1, WORK, DESCA( MB_ ),
     $                          ICURROW, ICURCOL )
                  DO 40 K = 1, IB
                     GLBA( IDXGLB ) = WORK( K )
                     IDXGLB = IDXGLB + 1
   40             CONTINUE
               END IF
            END IF
            IF( MYROW.EQ.ICURROW )
     $         II = II + IB
            ICURROW = MOD( ICURROW+1, NPROW )
            CALL BLACS_BARRIER( ICTXT, 'All' )
   50    CONTINUE
*
        II = IIA
        ICURROW = IAROW
   60 CONTINUE
*
      IF( MYCOL.EQ.ICURCOL )
     $   JJ = JJ + JB
      ICURCOL = MOD( ICURCOL+1, NPCOL )
      CALL BLACS_BARRIER( ICTXT, 'All' )
*
*     Loop over remaining column blocks
*
      DO 130 J = JN+1, JA+N-1, DESCA( NB_ )
         JB = MIN(  DESCA( NB_ ), JA+N-J )
         DO 120 H = 0, JB-1
            IN = MIN( ICEIL( IA, DESCA( MB_ ) ) * DESCA( MB_ ), IA+M-1 )
            IB = IN-IA+1
            IF( ICURROW.EQ.IRGET .AND. ICURCOL.EQ.ICGET ) THEN
               IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                  DO 70 K = 0, IB-1
                     GLBA( IDXGLB ) = A( II+K+(JJ+H-1)*LDA )
                     IDXGLB = IDXGLB + 1
   70             CONTINUE
               END IF
            ELSE
               IF( MYROW.EQ.ICURROW .AND. MYCOL.EQ.ICURCOL ) THEN
                  CALL DGESD2D( ICTXT, IB, 1, A( II+(JJ+H-1)*LDA ),
     $                          LDA, IRGET, ICGET )
               ELSE IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                  CALL DGERV2D( ICTXT, IB, 1, WORK, DESCA( MB_ ),
     $                          ICURROW, ICURCOL )
                  DO 80 K = 1, IB
                     GLBA( IDXGLB ) = WORK( K )
                     IDXGLB = IDXGLB + 1
   80             CONTINUE
               END IF
            END IF
            IF( MYROW.EQ.ICURROW )
     $         II = II + IB
            ICURROW = MOD( ICURROW+1, NPROW )
            CALL BLACS_BARRIER( ICTXT, 'All' )
*
*           Loop over remaining block of rows
*
            DO 110 I = IN+1, IA+M-1, DESCA( MB_ )
               IB = MIN( DESCA( MB_ ), IA+M-I )
               IF( ICURROW.EQ.IRGET .AND. ICURCOL.EQ.ICGET ) THEN
                  IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                     DO 90 K = 0, IB-1
                        GLBA( IDXGLB ) = A( II+K+(JJ+H-1)*LDA )
                        IDXGLB = IDXGLB + 1
   90                CONTINUE
                  END IF
               ELSE
                  IF( MYROW.EQ.ICURROW .AND. MYCOL.EQ.ICURCOL ) THEN
                     CALL DGESD2D( ICTXT, IB, 1, A( II+(JJ+H-1)*LDA ),
     $                             LDA, IRGET, ICGET )
                   ELSE IF( MYROW.EQ.IRGET .AND. MYCOL.EQ.ICGET ) THEN
                     CALL DGERV2D( ICTXT, IB, 1, WORK, DESCA( MB_ ),
     $                             ICURROW, ICURCOL )
                     DO 100 K = 1, IB
                        GLBA( IDXGLB ) = WORK( K )
                        IDXGLB = IDXGLB + 1
  100                CONTINUE
                  END IF
               END IF
               IF( MYROW.EQ.ICURROW )
     $            II = II + IB
               ICURROW = MOD( ICURROW+1, NPROW )
               CALL BLACS_BARRIER( ICTXT, 'All' )
  110       CONTINUE
*
            II = IIA
            ICURROW = IAROW
  120    CONTINUE
*
         IF( MYCOL.EQ.ICURCOL )
     $      JJ = JJ + JB
         ICURCOL = MOD( ICURCOL+1, NPCOL )
         CALL BLACS_BARRIER( ICTXT, 'All' )
*
  130 CONTINUE
*
      RETURN
*
*
      END
