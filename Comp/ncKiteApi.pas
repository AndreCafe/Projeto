unit ncKiteApi;
{
    ResourceString: Dario 13/03/13
}

interface

{$I NEX.INC}

uses
  sysutils, syncobjs, idHttp, ncDebug, classes, Registry, Windows, IdMultipartFormData;


function  kapi_Get(aFunc: String): String;

procedure kapi_DownloadPreReg;
function  kapi_ObtemPreReg: String;

function kapi_reg_Criar(aEmail, aEmailChave, aNomeProp, aNomeLoja, aRamo, aTel, aOptin: String): Boolean;
function kapi_reg_Confirmar(aEmail: String): Boolean;

function kapi_Post(
  aParams: TStrings;
  aAPI: String; 
  aArq: String = '';
  aArqField: String = '';
  aArqContentType: String = ''): String;

const
  kapi_host = 'kite.api.nextar.com.br';
 
  kapi_url_base = 'http://'+kapi_host;
  kapi_api_registro_consulta_ip = '/registro/consulta/ip';
  kapi_api_registro = '/registro';

  kapi_motivo_reg_criar = 'criar';
  kapi_motivo_reg_confirmar = 'confirmar';
  kapi_motivo_reg_assinar = 'assinar';
  kapi_motivo_reg_atualizar = 'atualizar';

threadvar 
  kapi_last_except : String;


implementation

type
  TThread_DownloadPreReg = class ( TThread )
  protected
    constructor Create;
    procedure Execute; override;
  end;

function ArqPreReg: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'prereg.txt'; // do not localize
end;  
  
function kapi_Get(aFunc: String): String;
var h: TidHttp;
begin
  Result := '';
  kapi_last_except := '';
  try
    H := TidHttp.Create(nil);
    try
      DebugMsg('kapi_Get 1 - aFunc: ' + aFunc); // do not localize
      Result := H.Get(kapi_url_base+aFunc);
      DebugMsg('kapi_Get 2 - aFunc: ' + aFunc + ' - Result: '+Result); // do not localize
    finally
      H.Free;
    end;
  except
    on E: Exception do begin
      kapi_last_except := E.Message;
      DebugMsg('kapi_Get 3 - aFunc: ' + aFunc + ' - Exception: '+Result); // do not localize
      raise;
    end;
  end;
end;

{ TThread_Registro_Consulta_IP_Registry }

constructor TThread_DownloadPreReg.Create;
begin
  inherited Create(True);
  FreeOnTerminate := True;
  Resume;
end;

procedure TThread_DownloadPreReg.Execute;
var sl : TStrings;
begin
  sl := TStringList.Create;
  try
    sl.Text := kapi_Get(kapi_api_registro_consulta_ip);
    if sl.Text>'' then 
      sl.SaveToFile(ArqPreReg);
  except
  end;
  sl.Free;
end;

procedure kapi_DownloadPreReg;
begin
  if not FileExists(ArqPreReg) then 
    TThread_DownloadPreReg.Create;
end;

function  kapi_ObtemPreReg: String;
var sl : TStrings;
begin
  if FileExists(ArqPreReg) then begin
    sl := TStringList.Create;
    try
      sl.LoadFromFile(ArqPreReg);
      Result := sl.Text;
    finally
      sl.Free;
    end;
  end else
    Result := '';
end;

function kapi_Post(
  aParams: TStrings;
  aAPI: String; 
  aArq: String='';
  aArqField: String='';
  aArqContentType: String = ''): String;
var
    h: TIdHTTP;
    ms : TIdMultiPartFormDataStream;
    i : integer;
begin
  result := '';
  h := TIdHTTP.create(nil);
  ms := TIdMultiPartFormDataStream.Create;
  try
    try
      for i := 0 to aParams.Count-1 do 
        ms.AddFormField(aParams.Names[i], aParams.ValueFromIndex[i]);
      if aArq>'' then
        ms.AddFile(aArqField, aArq, aArqContentType);
      H.Host := kapi_Host;
      ms.Seek(0,0);
      result := h.Post(kapi_url_Base+aAPI, ms);
      DebugMsg('kapi_Post: '+result); // do not localize
    except
      on e:exception do begin
        DebugMsg('kapi_Post - Exception: '+e.Message); // do not localize
        result := e.Message;
      end;
    end;
  finally
    h.free;
    ms.Free;
  end;
end;

function kapi_reg_Criar(aEmail, aEmailChave, aNomeProp, aNomeLoja, aRamo, aTel, aOptin: String): Boolean;
var sl: TStrings;
begin
  sl := TStringList.Create;
  try
    sl.Values['email'] := aEmail; // do not localize
    sl.Values['email_chave'] := aEmailChave; // do not localize
    sl.Values['nome_prop'] := aNomeProp; // do not localize
    sl.Values['nome_loja'] := aNomeLoja; // do not localize
    sl.Values['ramo'] := aRamo; // do not localize
    sl.Values['tel'] := aTel; // do not localize
    sl.Values['motivo'] := kapi_motivo_reg_criar; // do not localize
    sl.Values['optin'] := aOptin; // do not localize
{$ifdef LAN}
    sl.Values['software'] := 'NEXCAFE'; // do not localize
{$endif}  

{$ifdef LOJA}
    sl.Values['software'] := 'NEX'; // do not localize
{$endif}
    kapi_Post(sl, kapi_api_registro);
    Result := true;
  finally
    sl.Free;
  end;

end;

function kapi_reg_Confirmar(aEmail: String): Boolean;
var sl: TStrings;
begin
  sl := TStringList.Create;
  try
    sl.Values['email'] := aEmail; // do not localize
    sl.Values['email_chave'] := aEmail; // do not localize
    sl.Values['motivo'] := kapi_motivo_reg_confirmar; // do not localize
{$ifdef LAN}
    sl.Values['software'] := 'NEXCAFE'; // do not localize
{$endif}  

{$ifdef LOJA}
    sl.Values['software'] := 'NEX'; // do not localize
{$endif}    
    kapi_Post(sl, kapi_api_registro);
    Result := true;
  finally
    sl.Free;
  end;

end;


end.










