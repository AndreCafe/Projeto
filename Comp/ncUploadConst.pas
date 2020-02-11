unit ncUploadConst;

interface

uses
    IdHTTP;                           

const
     MethodString: array[TIdHTTPMethod] of String = ('HEAD', 'GET', 'POST', 'OPTIONS', 'TRACE', 'PUT', 'DELETE', 'CONNECT'); {do not localize}

     //kDefActive = false;
     kDefVersion = 1;

     kDefIniDelayM = 0;
     kDefMainDelayM = 30;
     kDefRecordsByRequest = 500;
     kDefMaxRecords = 2500;
     kDefInterBlockDelayM = 30;


     kMongodbStichWebhooksPayloadSecret = 'qkyH8e5PCWJDvvr';
     kMongodbStichWebhooksHost = 'webhooks.mongodb-stitch.com';

     kMongodbStichWebhooksUrl = '/api/client/v2.0/app/upcafe-mysmu/service/svc1/incoming_webhook/';

     kWebHookGetQueries = 'webhookGetQueries';
     kWebhookPostResults = 'webhookPostResults';

     kWebHookPostRecords = '/api/client/v2.0/app/upcafe-mysmu/service/svc1/incoming_webhook/webhook0';
     kWebHookGetParams = '/api/client/v2.0/app/upcafe-mysmu/service/svc1/incoming_webhook/webhook1';


implementation

end.
