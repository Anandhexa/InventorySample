**FREE
ctl-opt dftactgrp(*NO) actgrp(*NEW);
 
dcl-f TRANDSP3 workstn;
dcl-f TRANSP  keyed usage(*input);
dcl-f TRANPRT3 printer(132);
 
dcl-s frmdate date;
dcl-s todate  date;
 
// Show display
write MAINREC3;
read  MAINREC3;
 
frmdate = FRMDATE;
todate  = TODATE;
 
// Print header
write TRNHEAD;
 
// Read all transactions within date range
read TRANSP;
dow not %eof(TRANSP);
   read TRANSP;

   if TRANDATE >= frmdate;
 
      DDATE = TRANDATE;
      DITEM = ITEMID;
      DTYPE = TRANTYPE;
      DQTY  = QTY;
 
      write TRNDET;
 
      // CALL CL after each transaction
      callp(e) LogCL(ITEMID);
 
   endif;
 
enddo;
 
*inlr = *on;
return;
 

dcl-proc LogCL;
 
   dcl-pi *n;
      pItemID packed(5:0) const;
   end-pi;
 
   call 'INVENTLIB/LOGTRNCL' pItemID;
 
end-proc;