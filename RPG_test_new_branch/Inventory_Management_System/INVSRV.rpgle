**FREE

// Procedure prototype (declaration)
dcl-pr GETMSG char(50);
   itemid packed(5:0) const;
   msg    char(50);
end-pr;

// Procedure definition (implementation)
dcl-proc GETMSG;

   dcl-pi GETMSG char(50);
      itemid packed(5:0) const;
      msg    char(50);
   end-pi;
   
   // Local variables for calculations
   dcl-s totalQty packed(7:0);
   dcl-s unitPrice packed(9:2);
   dcl-s totalCost packed(11:2);
   dcl-s status char(10);
   
   // Perform calculations
   totalQty = itemid * 10;
   unitPrice = 25.50;
   totalCost = totalQty * unitPrice;
   
   // Determine status based on itemid
   if itemid > 100;
      status = 'HIGH';
   elseif itemid > 50;
      status = 'MEDIUM';
   else;
      status = 'LOW';
   endif;
   
   return;
end-proc;
