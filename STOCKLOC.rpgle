F*******************************************************
F* STOCK BY LOCATION MAINTENANCE
F*******************************************************
FSTKLOC  CF   E             WORKSTN
FSTKLOC   UF A E           K DISK
 
D ITEMID        S              5  0
D LOCID         S              5
D QTY           S              9  0
 
/FREE
   *INLR = *OFF;
   EXSR $INITSTOCK;
 
   DOU *IN03 = *ON;
 
      EXFMT STKSCREEN;
 
      IF *IN05 = *ON;
         EXSR $ADDSTOCK;
      ELSEIF *IN06 = *ON;
         EXSR $CHGSTOCK;
      ELSEIF *IN12 = *ON;
         EXSR $DELSTOCK;
      ELSE;
         EXSR $LOADSTOCK;
      ENDIF;
 
   ENDDO;
 
   *INLR = *ON;
   RETURN;
/END-FREE
 
C*******************************************************
C* $INIT Clear variables
C*******************************************************
C     $INITSTOCK         BEGSR
C                   Z-ADD0        ITEMID
C                   MOVE *BLANK   LOCID
C                   Z-ADD0        QTY
C                   ENDSR
 
C*******************************************************
C* $LOAD Load existing item/location
C*******************************************************
C     $LOADSTOCK         BEGSR
C                   IF %FOUND(STKLOC)
C                   MOVE QTY           QTY
C                   ENDIF
C                   ENDSR
 
C*******************************************************
C* $ADD Add New Stock Record
C*******************************************************
C     $ADDSTOCK          BEGSR
C                   MOVELQTY          QTY
C                   ENDSR
 
C*******************************************************
C* $CHG Update Existing Stock
C*******************************************************
C     $CHGSTOCK          BEGSR
C                   IF %FOUND
C                   MOVELQTY           QTY
C                   UPDATESTKREC
C                   ENDIF
C                   ENDSR
 
C*******************************************************
C* $DEL Delete Stock Record
C*******************************************************
C     $DELSTOCK          BEGSR
C                   IF %FOUND
C                   DELETESTKREC
C                   ENDIF
C                   ENDSR
