     FWRDLWORDS UF A E           K DISK
     FWRDLMAIN  CF   E             WORKSTN
     DPUZZLE           S              5A
     DPZLVALID         S              5A
     DWRDARR           S              1A   DIM(5)
     DGUESSARR         S              1A   DIM(5)
     DDSPARR           S              1A   DIM(5)
     DALWEXIT          S              1P 0
     DNUMGUESS         S              1P 0
     DTEMP             S              1P 0
     DPZLCOUNT         S              4P 0
     DVLDCHECK         S              1P 0
     DWIN              C                   CONST('U WIN')
     DWRONG            C                   CONST('?')
     DFAIL             C                   CONST('#')
     DSTRGAME          C                   CONST('.')
      *--------------------------------------
     C                   EXSR      GAMEPICK
     C
     C                   DOW       ALWEXIT = *ZERO
     C                   EXFMT     GAME
     C
     C                   IF        *IN03 = *ON
     C                   EXSR      DIE
     C                   ENDIF
     C
     C                   IF        *IN05 = *ON
     C                   EXSR      GAMEPICK
     C                   ENDIF
     C
     C                   EXSR      CHKVALID
     C                   IF        VLDCHECK = 1
     C                   EXSR      PARSEWRD
     C                   ENDIF
     C                   ENDDO
     C                   EXSR      DIE
     C*-----------------------------------------------------------------
     C     PARSEWRD      BEGSR
     C                   IF        INWORD = PUZZLE
     C                   EXSR      GAMEWIN
     C                   ELSE
     C                   EVAL      GUESSARR(1) = %SUBST (INWORD:1:1)
     C                   EVAL      GUESSARR(2) = %SUBST (INWORD:2:1)
     C                   EVAL      GUESSARR(3) = %SUBST (INWORD:3:1)
     C                   EVAL      GUESSARR(4) = %SUBST (INWORD:4:1)
     C                   EVAL      GUESSARR(5) = %SUBST (INWORD:5:1)
     C
     C                   EVAL      TEMP = %SCAN(GUESSARR(1):PUZZLE)
     C     TEMP          IFEQ      0
     C                   MOVEL     FAIL          DSPARR(1)
     C                   ELSE
     C                   MOVEL     WRONG         DSPARR(1)
     C                   ENDIF
     C
     C                   EVAL      TEMP = %SCAN(GUESSARR(2):PUZZLE)
     C     TEMP          IFEQ      0
     C                   MOVEL     FAIL          DSPARR(2)
     C                   ELSE
     C                   MOVEL     WRONG         DSPARR(2)
     C                   ENDIF
     C
     C                   EVAL      TEMP = %SCAN(GUESSARR(3):PUZZLE)
     C     TEMP          IFEQ      0
     C                   MOVEL     FAIL          DSPARR(3)
     C                   ELSE
     C                   MOVEL     WRONG         DSPARR(3)
     C                   ENDIF
     C
     C                   EVAL      TEMP = %SCAN(GUESSARR(4):PUZZLE)
     C     TEMP          IFEQ      0
     C                   MOVEL     FAIL          DSPARR(4)
     C                   ELSE
     C                   MOVEL     WRONG         DSPARR(4)
     C                   ENDIF
     C
     C                   EVAL      TEMP = %SCAN(GUESSARR(5):PUZZLE)
     C     TEMP          IFEQ      0
     C                   MOVEL     FAIL          DSPARR(5)
     C                   ELSE
     C                   MOVEL     WRONG         DSPARR(5)
     C                   ENDIF
     C
     C                   IF        GUESSARR(1) = WRDARR(1)
     C                   EVAL      DSPARR(1) = WRDARR(1)
     C                   ENDIF
     C
     C                   IF        GUESSARR(2) = WRDARR(2)
     C                   EVAL      DSPARR(2) = WRDARR(2)
     C                   ENDIF
     C
     C                   IF        GUESSARR(3) = WRDARR(3)
     C                   EVAL      DSPARR(3) = WRDARR(3)
     C                   ENDIF
     C
     C                   IF        GUESSARR(4) = WRDARR(4)
     C                   EVAL      DSPARR(4) = WRDARR(4)
     C                   ENDIF
     C
     C                   IF        GUESSARR(5) = WRDARR(5)
     C                   EVAL      DSPARR(5) = WRDARR(5)
     C                   ENDIF
     C
     C                   EXSR      UPDSCR
     C                   ENDIF
     C                   ENDSR
     C*-----------------------------------------------------------------
     C     CHKVALID      BEGSR
     C     *LOVAL        SETLL     WORDREC
     C                   DOU       %EOF(WRDLWORDS)
     C                   READ      WORDREC
     C                   MOVEL     DBWORD        PZLVALID
     C
     C     INWORD        IFEQ      PZLVALID
     C                   EVAL      VLDCHECK = 1
     C                   MOVEL     *ON           *IN98
     C                   LEAVE
     C                   ELSE
     C                   EVAL      VLDCHECK = 0
     C                   MOVEL     *OFF          *IN98
     C                   ENDIF
     C                   ENDDO
     C                   ENDSR
     C*-----------------------------------------------------------------
     C     UPDSCR        BEGSR
     C                   IF        NUMGUESS = 1
     C                   MOVEL     GUESSARR(1)   CG11
     C                   MOVEL     GUESSARR(2)   CG12
     C                   MOVEL     GUESSARR(3)   CG13
     C                   MOVEL     GUESSARR(4)   CG14
     C                   MOVEL     GUESSARR(5)   CG15
     C                   ENDIF
     C
     C                   IF        NUMGUESS = 2
     C                   MOVEL     GUESSARR(1)   CG21
     C                   MOVEL     GUESSARR(2)   CG22
     C                   MOVEL     GUESSARR(3)   CG23
     C                   MOVEL     GUESSARR(4)   CG24
     C                   MOVEL     GUESSARR(5)   CG25
     C                   ENDIF
     C
     C                   IF        NUMGUESS = 3
     C                   MOVEL     GUESSARR(1)   CG31
     C                   MOVEL     GUESSARR(2)   CG32
     C                   MOVEL     GUESSARR(3)   CG33
     C                   MOVEL     GUESSARR(4)   CG34
     C                   MOVEL     GUESSARR(5)   CG35
     C                   ENDIF
     C
     C                   IF        NUMGUESS = 4
     C                   MOVEL     GUESSARR(1)   CG41
     C                   MOVEL     GUESSARR(2)   CG42
     C                   MOVEL     GUESSARR(3)   CG43
     C                   MOVEL     GUESSARR(4)   CG44
     C                   MOVEL     GUESSARR(5)   CG45
     C                   ENDIF
     C
     C                   IF        NUMGUESS = 5
     C                   MOVEL     GUESSARR(1)   CG51
     C                   MOVEL     GUESSARR(2)   CG52
     C                   MOVEL     GUESSARR(3)   CG53
     C                   MOVEL     GUESSARR(4)   CG54
     C                   MOVEL     GUESSARR(5)   CG55
     C                   ENDIF
     C
     C                   IF        NUMGUESS = 6
     C                   MOVEL     GUESSARR(1)   CG61
     C                   MOVEL     GUESSARR(2)   CG62
     C                   MOVEL     GUESSARR(3)   CG63
     C                   MOVEL     GUESSARR(4)   CG64
     C                   MOVEL     GUESSARR(5)   CG65
     C                   ENDIF

     C                   IF        NUMGUESS = 7
     C                   EXSR      GAMELOSE
     C                   ENDIF

     C                   EXSR      COLORSCR
     C                   ADD       1             NUMGUESS
     C
     C                   ENDSR
     C*-----------------------------------------------------------------
     C     COLORSCR      BEGSR
     C                   IF        NUMGUESS = 1
     C
     C                   IF        DSPARR(1) = WRONG
     C                   MOVEL     *ON           *IN11
     C                   ENDIF
     C                   IF        DSPARR(1) = FAIL
     C                   MOVEL     *ON           *IN10
     C                   ENDIF
     C                   IF        DSPARR(2) = WRONG
     C                   MOVEL     *ON           *IN12
     C                   ENDIF
     C                   IF        DSPARR(2) = FAIL
     C                   MOVEL     *ON           *IN19
     C                   ENDIF
     C                   IF        DSPARR(3) = WRONG
     C                   MOVEL     *ON           *IN13
     C                   ENDIF
     C                   IF        DSPARR(3) = FAIL
     C                   MOVEL     *ON           *IN18
     C                   ENDIF
     C                   IF        DSPARR(4) = WRONG
     C                   MOVEL     *ON           *IN14
     C                   ENDIF
     C                   IF        DSPARR(4) = FAIL
     C                   MOVEL     *ON           *IN17
     C                   ENDIF
     C                   IF        DSPARR(5) = WRONG
     C                   MOVEL     *ON           *IN15
     C                   ENDIF
     C                   IF        DSPARR(5) = FAIL
     C                   MOVEL     *ON           *IN16
     C                   ENDIF
     C
     C                   ENDIF

     C                   IF        NUMGUESS = 2
     C
     C                   IF        DSPARR(1) = WRONG
     C                   MOVEL     *ON           *IN21
     C                   ENDIF
     C                   IF        DSPARR(1) = FAIL
     C                   MOVEL     *ON           *IN20
     C                   ENDIF
     C                   IF        DSPARR(2) = WRONG
     C                   MOVEL     *ON           *IN22
     C                   ENDIF
     C                   IF        DSPARR(2) = FAIL
     C                   MOVEL     *ON           *IN29
     C                   ENDIF
     C                   IF        DSPARR(3) = WRONG
     C                   MOVEL     *ON           *IN23
     C                   ENDIF
     C                   IF        DSPARR(3) = FAIL
     C                   MOVEL     *ON           *IN28
     C                   ENDIF
     C                   IF        DSPARR(4) = WRONG
     C                   MOVEL     *ON           *IN24
     C                   ENDIF
     C                   IF        DSPARR(4) = FAIL
     C                   MOVEL     *ON           *IN27
     C                   ENDIF
     C                   IF        DSPARR(5) = WRONG
     C                   MOVEL     *ON           *IN25
     C                   ENDIF
     C                   IF        DSPARR(5) = FAIL
     C                   MOVEL     *ON           *IN26
     C                   ENDIF
     C
     C                   ENDIF

     C                   IF        NUMGUESS = 3
     C
     C                   IF        DSPARR(1) = WRONG
     C                   MOVEL     *ON           *IN31
     C                   ENDIF
     C                   IF        DSPARR(1) = FAIL
     C                   MOVEL     *ON           *IN30
     C                   ENDIF
     C                   IF        DSPARR(2) = WRONG
     C                   MOVEL     *ON           *IN32
     C                   ENDIF
     C                   IF        DSPARR(2) = FAIL
     C                   MOVEL     *ON           *IN39
     C                   ENDIF
     C                   IF        DSPARR(3) = WRONG
     C                   MOVEL     *ON           *IN33
     C                   ENDIF
     C                   IF        DSPARR(3) = FAIL
     C                   MOVEL     *ON           *IN38
     C                   ENDIF
     C                   IF        DSPARR(4) = WRONG
     C                   MOVEL     *ON           *IN34
     C                   ENDIF
     C                   IF        DSPARR(4) = FAIL
     C                   MOVEL     *ON           *IN37
     C                   ENDIF
     C                   IF        DSPARR(5) = WRONG
     C                   MOVEL     *ON           *IN35
     C                   ENDIF
     C                   IF        DSPARR(5) = FAIL
     C                   MOVEL     *ON           *IN36
     C                   ENDIF
     C
     C                   ENDIF

     C                   IF        NUMGUESS = 4
     C
     C                   IF        DSPARR(1) = WRONG
     C                   MOVEL     *ON           *IN41
     C                   ENDIF
     C                   IF        DSPARR(1) = FAIL
     C                   MOVEL     *ON           *IN40
     C                   ENDIF
     C                   IF        DSPARR(2) = WRONG
     C                   MOVEL     *ON           *IN42
     C                   ENDIF
     C                   IF        DSPARR(2) = FAIL
     C                   MOVEL     *ON           *IN49
     C                   ENDIF
     C                   IF        DSPARR(3) = WRONG
     C                   MOVEL     *ON           *IN43
     C                   ENDIF
     C                   IF        DSPARR(3) = FAIL
     C                   MOVEL     *ON           *IN48
     C                   ENDIF
     C                   IF        DSPARR(4) = WRONG
     C                   MOVEL     *ON           *IN44
     C                   ENDIF
     C                   IF        DSPARR(4) = FAIL
     C                   MOVEL     *ON           *IN47
     C                   ENDIF
     C                   IF        DSPARR(5) = WRONG
     C                   MOVEL     *ON           *IN45
     C                   ENDIF
     C                   IF        DSPARR(5) = FAIL
     C                   MOVEL     *ON           *IN46
     C                   ENDIF
     C
     C                   ENDIF

     C                   IF        NUMGUESS = 5
     C
     C                   IF        DSPARR(1) = WRONG
     C                   MOVEL     *ON           *IN51
     C                   ENDIF
     C                   IF        DSPARR(1) = FAIL
     C                   MOVEL     *ON           *IN50
     C                   ENDIF
     C                   IF        DSPARR(2) = WRONG
     C                   MOVEL     *ON           *IN52
     C                   ENDIF
     C                   IF        DSPARR(2) = FAIL
     C                   MOVEL     *ON           *IN59
     C                   ENDIF
     C                   IF        DSPARR(3) = WRONG
     C                   MOVEL     *ON           *IN53
     C                   ENDIF
     C                   IF        DSPARR(3) = FAIL
     C                   MOVEL     *ON           *IN58
     C                   ENDIF
     C                   IF        DSPARR(4) = WRONG
     C                   MOVEL     *ON           *IN54
     C                   ENDIF
     C                   IF        DSPARR(4) = FAIL
     C                   MOVEL     *ON           *IN57
     C                   ENDIF
     C                   IF        DSPARR(5) = WRONG
     C                   MOVEL     *ON           *IN55
     C                   ENDIF
     C                   IF        DSPARR(5) = FAIL
     C                   MOVEL     *ON           *IN56
     C                   ENDIF
     C
     C                   ENDIF

     C                   IF        NUMGUESS = 6
     C
     C                   IF        DSPARR(1) = WRONG
     C                   MOVEL     *ON           *IN61
     C                   ENDIF
     C                   IF        DSPARR(1) = FAIL
     C                   MOVEL     *ON           *IN60
     C                   ENDIF
     C                   IF        DSPARR(2) = WRONG
     C                   MOVEL     *ON           *IN62
     C                   ENDIF
     C                   IF        DSPARR(2) = FAIL
     C                   MOVEL     *ON           *IN69
     C                   ENDIF
     C                   IF        DSPARR(3) = WRONG
     C                   MOVEL     *ON           *IN63
     C                   ENDIF
     C                   IF        DSPARR(3) = FAIL
     C                   MOVEL     *ON           *IN68
     C                   ENDIF
     C                   IF        DSPARR(4) = WRONG
     C                   MOVEL     *ON           *IN64
     C                   ENDIF
     C                   IF        DSPARR(4) = FAIL
     C                   MOVEL     *ON           *IN67
     C                   ENDIF
     C                   IF        DSPARR(5) = WRONG
     C                   MOVEL     *ON           *IN65
     C                   ENDIF
     C                   IF        DSPARR(5) = FAIL
     C                   MOVEL     *ON           *IN66
     C                   ENDIF
     C
     C                   ENDIF

     C                   IF        NUMGUESS = 7
     C                   SUB       1             NUMGUESS
     C                   ENDIF

     C                   ENDSR
     C*----------------------------------------------------------------
     C     GETALLPZL     BEGSR
     C                   SUB       PZLCOUNT      PZLCOUNT
     C     *LOVAL        SETLL     WORDREC                            90
     C                   READ      WORDREC
     C                   DOU       %EOF(WRDLWORDS)
     C                   READ      WORDREC
     C                   ADD       1             PZLCOUNT
     C                   ENDDO
     C                   SUB       1             PZLCOUNT
     C                   ENDSR
     C*----------------------------------------------------------------
     C     GAMEPICK      BEGSR
     C                   EXSR      GETALLPZL
     C
     C                   IF        *IN03 = *ON
     C                   EXSR      DIE
     C                   ENDIF
     C
     C                   MOVEL     PZLCOUNT      OUTPZLS
     C                   EXFMT     SELPZL
     C     INPZL         SETLL     WORDREC
     C                   READ      WRDLWORDS
     C                   EXSR      GAMEGO
     C                   ENDSR
     C*-----------------------------------------------------------------
     C     GAMEGO        BEGSR
     C                   MOVEL     0             NUMGUESS
     C                   EXSR      CLEARSCR
     C
     C                   MOVEL     DBWORD        PUZZLE
     C                   MOVEL     DBWORD        DEBUG
     C                   MOVEL     PZLNUM        OUTPZLNUM
     C                   MOVEL     HSNAME        OUTHSNAME
     C                   MOVEL     HSGUESS       OUTGUESS
     C
     C                   EVAL      WRDARR(1) = %SUBST (PUZZLE:1:1)
     C                   EVAL      WRDARR(2) = %SUBST (PUZZLE:2:1)
     C                   EVAL      WRDARR(3) = %SUBST (PUZZLE:3:1)
     C                   EVAL      WRDARR(4) = %SUBST (PUZZLE:4:1)
     C                   EVAL      WRDARR(5) = %SUBST (PUZZLE:5:1)
     C
     C                   MOVEL     1             NUMGUESS
     C                   ENDSR
     C*-----------------------------------------------------------------
     C     GAMEWIN       BEGSR
     C                   MOVEL     PUZZLE        WINWORD
     C                   MOVEL     NUMGUESS      WINSCORE
     C
     C                   EXFMT     YOUWIN
     C
     C                   IF        NUMGUESS < HSGUESS
     C                   EXFMT     HIGHSCORE
     C                   EXSR      SAVEHS
     C                   ENDIF
     C
     C                   DOW       ALWEXIT = *ZERO
     C                   EXFMT     GAMEOVER
     C
     C                   IF        *IN03 = *ON
     C                   EXSR      DIE
     C                   ENDIF
     C
     C                   IF        *IN05 = *ON
     C                   EXSR      GAMEPICK
     C                   LEAVE
     C                   ENDIF
     C                   ENDDO
     C
     C                   ENDSR
     C*-----------------------------------------------------------------
     C     GAMELOSE      BEGSR
     C                   MOVEL     PUZZLE        LOSEWORD
     C
     C                   DOW       ALWEXIT = *ZERO
     C                   EXFMT     YOULOSE2
     C
     C                   IF        *IN03 = *ON
     C                   EXSR      DIE
     C                   ENDIF
     C
     C                   IF        *IN05 = *ON
     C                   EXSR      GAMEPICK
     C                   LEAVE
     C                   ENDIF
     C                   ENDDO
     C
     C                   SUB       1             NUMGUESS
     C                   ENDSR
     C*-----------------------------------------------------------------
     C     SAVEHS        BEGSR
     C                   MOVEL     WINNAME       HSNAME
     C                   MOVEL     NUMGUESS      HSGUESS
     C                   UPDATE    WORDREC
     C                   ENDSR
     C*-----------------------------------------------------------------
     C     CLEARSCR      BEGSR
     C                   MOVEL     *ON           *IN98
     C                   MOVEL     *OFF          *IN11
     C                   MOVEL     *OFF          *IN12
     C                   MOVEL     *OFF          *IN13
     C                   MOVEL     *OFF          *IN14
     C                   MOVEL     *OFF          *IN15
     C                   MOVEL     *OFF          *IN21
     C                   MOVEL     *OFF          *IN22
     C                   MOVEL     *OFF          *IN23
     C                   MOVEL     *OFF          *IN24
     C                   MOVEL     *OFF          *IN25
     C                   MOVEL     *OFF          *IN31
     C                   MOVEL     *OFF          *IN32
     C                   MOVEL     *OFF          *IN33
     C                   MOVEL     *OFF          *IN34
     C                   MOVEL     *OFF          *IN35
     C                   MOVEL     *OFF          *IN41
     C                   MOVEL     *OFF          *IN42
     C                   MOVEL     *OFF          *IN43
     C                   MOVEL     *OFF          *IN44
     C                   MOVEL     *OFF          *IN45
     C                   MOVEL     *OFF          *IN51
     C                   MOVEL     *OFF          *IN52
     C                   MOVEL     *OFF          *IN53
     C                   MOVEL     *OFF          *IN54
     C                   MOVEL     *OFF          *IN55
     C                   MOVEL     *OFF          *IN61
     C                   MOVEL     *OFF          *IN62
     C                   MOVEL     *OFF          *IN63
     C                   MOVEL     *OFF          *IN64
     C                   MOVEL     *OFF          *IN65

     C                   MOVEL     *OFF          *IN10
     C                   MOVEL     *OFF          *IN19
     C                   MOVEL     *OFF          *IN18
     C                   MOVEL     *OFF          *IN17
     C                   MOVEL     *OFF          *IN16
     C                   MOVEL     *OFF          *IN20
     C                   MOVEL     *OFF          *IN29
     C                   MOVEL     *OFF          *IN28
     C                   MOVEL     *OFF          *IN27
     C                   MOVEL     *OFF          *IN26
     C                   MOVEL     *OFF          *IN30
     C                   MOVEL     *OFF          *IN39
     C                   MOVEL     *OFF          *IN38
     C                   MOVEL     *OFF          *IN37
     C                   MOVEL     *OFF          *IN36
     C                   MOVEL     *OFF          *IN40
     C                   MOVEL     *OFF          *IN49
     C                   MOVEL     *OFF          *IN48
     C                   MOVEL     *OFF          *IN47
     C                   MOVEL     *OFF          *IN46
     C                   MOVEL     *OFF          *IN50
     C                   MOVEL     *OFF          *IN59
     C                   MOVEL     *OFF          *IN58
     C                   MOVEL     *OFF          *IN57
     C                   MOVEL     *OFF          *IN56
     C                   MOVEL     *OFF          *IN60
     C                   MOVEL     *OFF          *IN69
     C                   MOVEL     *OFF          *IN68
     C                   MOVEL     *OFF          *IN67
     C                   MOVEL     *OFF          *IN66

     C                   MOVEL     STRGAME       CG11
     C                   MOVEL     STRGAME       CG12
     C                   MOVEL     STRGAME       CG13
     C                   MOVEL     STRGAME       CG14
     C                   MOVEL     STRGAME       CG15
     C                   MOVEL     STRGAME       CG21
     C                   MOVEL     STRGAME       CG22
     C                   MOVEL     STRGAME       CG23
     C                   MOVEL     STRGAME       CG24
     C                   MOVEL     STRGAME       CG25
     C                   MOVEL     STRGAME       CG31
     C                   MOVEL     STRGAME       CG32
     C                   MOVEL     STRGAME       CG33
     C                   MOVEL     STRGAME       CG34
     C                   MOVEL     STRGAME       CG35
     C                   MOVEL     STRGAME       CG41
     C                   MOVEL     STRGAME       CG42
     C                   MOVEL     STRGAME       CG43
     C                   MOVEL     STRGAME       CG44
     C                   MOVEL     STRGAME       CG45
     C                   MOVEL     STRGAME       CG51
     C                   MOVEL     STRGAME       CG52
     C                   MOVEL     STRGAME       CG53
     C                   MOVEL     STRGAME       CG54
     C                   MOVEL     STRGAME       CG55
     C                   MOVEL     STRGAME       CG61
     C                   MOVEL     STRGAME       CG62
     C                   MOVEL     STRGAME       CG63
     C                   MOVEL     STRGAME       CG64
     C                   MOVEL     STRGAME       CG65
     C                   ENDSR
     C*-----------------------------------------------------------------
     C     DIE           BEGSR
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C                   ENDSR
