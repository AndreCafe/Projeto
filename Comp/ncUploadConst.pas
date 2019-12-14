unit ncUploadConst;

interface

uses
    IdHTTP;                           

const
     MethodString: array[TIdHTTPMethod] of String = ('HEAD', 'GET', 'POST', 'OPTIONS', 'TRACE', 'PUT', 'DELETE', 'CONNECT'); {do not localize}

     kDefActive = false;
     kDefVersion = 1;

     kDefIniDelayM = 0;
     kDefMainDelayM = 30;
     kDefRecordsByRequest = 500;
     kDefMaxRecords = 2500;
     kDefInterBlockDelayM = 30;

implementation

end.
