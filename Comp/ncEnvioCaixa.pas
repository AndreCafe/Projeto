unit ncEnvioCaixa;

interface

uses
   sysutils, classes, IdHTTP, IdBaseComponent, IdComponent, IdTCPConnection,
   IdTCPClient, IdMultipartFormData;

   function httpPost(
    aParams: TStrings;
    aArq, aHost, aUrl : String): String;

implementation

uses
   uLogs;

function httpPost(aParams: TStrings; aArq, aHost, AUrl : String): String;
var
    h: TIdHTTP;
    ms : TIdMultiPartFormDataStream;
    i : integer;
    s : string;
begin
    result := '';
    h := TIdHTTP.create(nil);
    ms := TIdMultiPartFormDataStream.Create;
    try
      h.HandleRedirects := True;
        try
          for i := 0 to aParams.Count-1 do 
            ms.AddFormField(aParams.Names[i], aParams.ValueFromIndex[i]);
            ms.AddFile('pdf', aArq, 'application/pdf');
            H.Host := aHost;
            ms.Seek(0,0);
            result := h.Post(aUrl, ms);
            glog.Log(nil, [lcTrace], 'httpPost: '+result);
        except
            on e:exception do begin
                glog.Log(nil, [lcExcept], 'httpPost - Exception: '+e.Message);
                result := e.Message;
            end;
        end;

    finally
        h.free;
        ms.Free;
    end;

end;

end.

