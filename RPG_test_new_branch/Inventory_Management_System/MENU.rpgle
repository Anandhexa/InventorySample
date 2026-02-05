F*******************************************************
F* MENU PROGRAM - MIXED FORMAT RPGLE
F*******************************************************
FMENU      CF   E             WORKSTN
 
D*******************************************************
D* Fields
D*******************************************************
D OPTION          S              1A
 
/FREE
   *INLR = *OFF;
   EXSR $INITMENU;
 
   DOU *IN03 = *ON;
 
      EXFMT MENUSCRN;
 
      OPTION = OPTION;
 
      SELECT;
        WHEN OPTION = '1';
           EXSR $ITEMS;
 
        WHEN OPTION = '2';
           EXSR $LOCSTK;
 
        WHEN OPTION = '3';
           EXSR $POSTMENU;
 
        WHEN OPTION = '4';
           EXSR $RPT;
 
        WHEN OPTION = '5';
           LEAVE;
      ENDSL;
 
   ENDDO;
 
   *INLR = *ON;
   RETURN;
/END-FREE
 
C*******************************************************
C*******************************************************
C     $INITMENU         BEGSR
C                   Z-ADD0         OPTION
C                   ENDSR
 
C*******************************************************
C*******************************************************
C     $ITEMS        BEGSR
C                   CALL      'WRKITEMS'
C                   ENDSR
 
C*******************************************************
C*******************************************************
C     $LOCSTK       BEGSR
C                   CALL      'LOCSTOCK'
C                   ENDSR
 
C*******************************************************
C*******************************************************
C     $POSTMENU         BEGSR
C                   CALL      'POSTTRAN'
C                   ENDSR
 
C*******************************************************
C*******************************************************
C     $RPT          BEGSR
C                   CALL      'RPTMENU'
C                   ENDSR
