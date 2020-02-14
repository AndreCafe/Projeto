unit ncUploadConst;

interface

uses
    IdHTTP;                           

const
     MethodString: array[TIdHTTPMethod] of String = ('HEAD', 'GET', 'POST', 'OPTIONS', 'TRACE', 'PUT', 'DELETE', 'CONNECT'); {do not localize}

     //kIndentStep =  0;    // tab value for uggly json
     kIndentStep =  4;    // tab value for pretty json
     //kNewLine = '';       // newline valur for uggly json
     kNewLine = #13#10;       // newline valur for pretty json


     //kDefActive = false;
     kDefVersion = 1;

     kDefIniDelayS = 0;
     kDefMainDelayS = 30;
     kDefRecordsByRequest = 500;
     kDefMaxRecords = 2500;
     kDefInterBlockDelayS = 30;


     kMongodbStichWebhooksPayloadSecret = 'qkyH8e5PCWJDvvr';
     kMongodbStichWebhooksHost = 'webhooks.mongodb-stitch.com';

     kMongodbStichWebhooksUrl = '/api/client/v2.0/app/upcafe-mysmu/service/svc1/incoming_webhook/';

     kWebHookGetQueries = 'queries';
     kWebhookPostResults = 'results';

     kWebHookPostRecords = '/api/client/v2.0/app/upcafe-mysmu/service/svc1/incoming_webhook/webhook0';
     kWebHookGetParams = '/api/client/v2.0/app/upcafe-mysmu/service/svc1/incoming_webhook/webhook1';


implementation

end.
