**FREE
//==============================================================
// Program  : LOGCL2RPG
// Purpose  : Called from CL program LOGCL2
//            Receives ItemID, reads ITEMS PF,
//            and logs audit entry into LOGRPT PF.
//==============================================================
ctl-opt dftactgrp(*NO) actgrp(*NEW) option(*SRCSTMT:*NODEBUGIO);

// ---------------------------------------------
// PF used in IMS
// ---------------------------------------------
dcl-f ITEMS  keyed usage(*input);
dcl-f LOGRPT keyed usage(*output);

// ---------------------------------------------
// Parameter list received from CL
// ---------------------------------------------
dcl-pi *n;
   pItemID packed(5:0);
end-pi;

// ---------------------------------------------
// Variables
// ---------------------------------------------
dcl-s Msg       char(50);

// ---------------------------------------------
// Read Item
// ---------------------------------------------
chain pItemID ITEMS;

if not %found(ITEMS);
   Msg = 'Item not found';
else;
   Msg = 'Logged OK for item ' + %char(pItemID);
endif;



LOGMSG  = Msg;                     // Message

write LOGREC;

// ---------------------------------------------
// End program
// ---------------------------------------------
*inlr = *on;
return;