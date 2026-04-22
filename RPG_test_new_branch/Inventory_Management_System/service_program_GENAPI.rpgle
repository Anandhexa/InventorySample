**FREE
ctl-opt dftactgrp(*no) actgrp(*caller)
        option(*srcstmt:*nodebugio);

/copy HTTPAPI_H

//--------------------------------------------------
dcl-proc CallAPI export;

  dcl-pi *n varchar(32767);
    method      varchar(10)  const;
    url         varchar(512) const;
    requestBody varchar(32767) const;
    authToken   varchar(512) const;
  end-pi;

  dcl-s response varchar(32767);
  dcl-s mth      varchar(10);

  mth = %upper(%trim(method));

  //------------------------------------------------
  // Headers
  //------------------------------------------------
  http_setHeader('Accept': 'application/json');
  http_setHeader('Content-Type': 'application/json');

  if %len(%trim(authToken)) > 0;
     http_setHeader('Authorization':
                    'Bearer ' + %trim(authToken));
  endif;

  //------------------------------------------------
  // Method Routing
  //------------------------------------------------
  select;

    when mth = 'GET';
       response = http_get(url);

    when mth = 'POST';
       response = http_post(url: requestBody);

    when mth = 'PUT';
       response = http_put(url: requestBody);

    when mth = 'DELETE';
       response = http_delete(url);

    other;
       response = '{ "error": "Unsupported Method" }';

  endsl;

  //------------------------------------------------
  // Basic Error Handling
  //------------------------------------------------
  if %len(response) = 0;
     response = '{ "error": "No response" }';
  endif;

  return response;

end-proc;
