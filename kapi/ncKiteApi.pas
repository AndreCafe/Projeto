unit ncKiteApi;
{
    ResourceString: Dario 13/03/13
}

interface

{$I NEX.INC}

uses
  sysutils, syncobjs, idHttp, ncDebug, classes, Registry, Windows, IdMultipartFormData, DCPcrypt2, DCPsha256, nexUrls;

const
  kapi_quote = '&quot;';
  kapi_enter = '&enter;';

function kapi_EncodeQuoteEnter(S: String): String;
function kapi_DecodeQuoteEnter(S: String): String;

function  kapi_Get(aFunc: String): String;

procedure kapi_DownloadPreReg;
function  kapi_ObtemPreReg: String;

function kapi_Esqueceu_Senha(aEmail: String; aUsuarios: TStrings): Boolean;

function kapi_genHash(S: String): String;

function kapi_reg_Criar(aEmail, aEmailChave, aNomeProp, aNomeLoja, aRamo, aTel, aOptin: String): Boolean;
function kapi_reg_Confirmar(aEmail: String): Boolean;

function kapi_Post(
  aParams: TStrings;
  aAPI: String; 
  aArq: String = '';
  aArqField: String = '';
  aArqContentType: String = ''): String;

function PostURL(
  aParams: TStrings;
  aURL: String; 
  aArq: String='';
  aArqField: String='';
  aArqContentType: String = ''): String;

const
  kapi_motivo_reg_criar = 'criar';
  kapi_motivo_reg_confirmar = 'confirmar';
  kapi_motivo_reg_assinar = 'assinar';
  kapi_motivo_reg_atualizar = 'atualizar';

threadvar 
  kapi_last_except : String;


implementation

uses ncHash, nxdb;

type

  TThread_DownloadPreReg = class ( TThread )
  protected
    constructor Create;
    procedure Execute; override;
  end;


function kapi_EncodeQuoteEnter(S: String): String;
var 
  sl: TStrings;
  P: Integer;
  I: Integer;

function TemAspas: Boolean;
begin
  P := Pos('"', S);
  Result := (P>0);
end;  

begin
  sl := TStringList.Create;
  try
    sl.Text := S;
    Result := '';
    for I := 0 to sl.Count-1 do begin
      if I>0 then
        Result := Result + kapi_Enter;
      S := sl[I];  
      while TemAspas do
        S := copy(S, 1, P-1) + kapi_Quote + copy(S, P+1, High(I));
      Result := Result + S;
    end;
  finally
    sl.Free;
  end;
end;

function kapi_DecodeQuoteEnter(S: String): String;
var P : Integer;

function Tem(Str: String): Boolean;
begin
  P := Pos(Str, S);
  Result := (P>0);
end;

begin
  while Tem(kapi_Quote) do
    S := Copy(S, 1, P-1) + '"' + Copy(S, P+Length(kapi_Quote), High(Integer));

  while Tem(kapi_Enter) do
    S := Copy(S, 1, P-1) + sLineBreak + Copy(S, P+Length(kapi_Quote), High(Integer));

  Result := S;  
end;
  


function _kitesecr: String;
begin
  Result := '';
  Result := Result + 'd';
  Result := Result + 'o';
  Result := Result + 'q';
  Result := Result + 'e';
  Result := Result + 'k';
  Result := Result + 'D';
  Result := Result + 'C';
  Result := Result + 'Q';
  Result := Result + 'd';
  Result := Result + '-';
  Result := Result + ')';
  Result := Result + 'J';
  Result := Result + '%';
  Result := Result + 'X';
  Result := Result + 'Z';
  Result := Result + 'g';
  Result := Result + '0';
  Result := Result + 'm';
  Result := Result + '1';
  Result := Result + 'S';
  Result := Result + 'T';
  Result := Result + '~';
  Result := Result + 'o';
  Result := Result + 'o';
  Result := Result + '?';
  Result := Result + '[';
  Result := Result + 'Y';
  Result := Result + '7';
  Result := Result + '+';
  Result := Result + '`';
  Result := Result + 'E';
  Result := Result + '@';
  Result := Result + '!';
  Result := Result + '!';
  Result := Result + 'Q';
  Result := Result + ',';
  Result := Result + 'f';
  Result := Result + '6';
  Result := Result + '&';
  Result := Result + 'E';
  Result := Result + '*';
  Result := Result + 'D';
  Result := Result + '-';
  Result := Result + 'u';
  Result := Result + '>';
  Result := Result + '$';
  Result := Result + 'j';
  Result := Result + 'b';
  Result := Result + 'l';
  Result := Result + 'y';
  Result := Result + '1';
  Result := Result + '|';
  Result := Result + '!';
  Result := Result + 'm';
  Result := Result + 'v';
  Result := Result + 'y';
  Result := Result + 'M';
  Result := Result + '@';
  Result := Result + 'T';
  Result := Result + 'Q';
  Result := Result + '_';
  Result := Result + '}';
  Result := Result + 't';
  Result := Result + '+';
end;

function ArqPreReg: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'prereg.txt'; // do not localize
end;  

function GetURL(aURL: String): String;
var h: TidHttp;
begin
  Result := '';
  kapi_last_except := '';
  try
    H := TidHttp.Create(nil);
    try
      H.HandleRedirects := True;
      Result := H.Get(aURL);
    finally
      H.Free;
    end;
  except
    on E: Exception do begin
      kapi_last_except := E.Message;
      DebugMsg('GetUrl: ' + aURL + ' - Exception: '+Result); // do not localize
      raise;
    end;
  end;
end;

function kapi_Get(aFunc: String): String;
var h: TidHttp;
begin
  Result := '';
  kapi_last_except := '';
  try
    H := TidHttp.Create(nil);
    try
      H.HandleRedirects := True;
      DebugMsg('kapi_Get 1 - aFunc: ' + aFunc); // do not localize
      Result := H.Get(gUrls.Url(aFunc));
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
    sl.Text := kapi_Get('kapi_consultaip');
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

function PostURL(
  aParams: TStrings;
  aURL: String; 
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
    H.HandleRedirects := True;
    try
      if Assigned(aParams) then
        for i := 0 to aParams.Count-1 do 
          ms.AddFormField(aParams.Names[i], aParams.ValueFromIndex[i]);
      if aArq>'' then
        ms.AddFile(aArqField, aArq, aArqContentType);
//      H.Host := kapi_Host;
      ms.Seek(0,0);
      result := h.Post(aURL, ms);
      DebugMsg('ncKiteApi.PostUrl: '+result); // do not localize
    except
      on e:exception do begin
        result := e.Message;
        DebugMsg('ncKiteApi.PostUrl - Exception: '+e.Message); // do not localize
      end;
    end;
  finally
    h.free;
    ms.Free;
  end;
end;

function kapi_Post(
  aParams: TStrings;
  aAPI: String; 
  aArq: String='';
  aArqField: String='';
  aArqContentType: String = ''): String;
begin
  PostURL(aParams, gUrls.Url(aAPI), aArq, aArqField, aArqContentType);
end;


function genHashKey(S: String): String;
var 
  H: TDCP_sha256;
  I: Integer;
  Digest : Array[0..63] of Byte;
begin
  H := TDCP_sha256.Create(nil);
  try
    H.Init;
    H.UpdateStr(S);
    H.Final(Digest);
    Result := '';
    for I := 0 to 31 do 
      Result := Result + IntToHex(Digest[I], 2);
    Result := LowerCase(result);  
  finally
    H.Free;
  end;
end;

function kapi_genHash(S: String): String;
begin
  Result := genHashKey(_kitesecr+S);
end;

function kapi_Esqueceu_Senha(aEmail: String; aUsuarios: TStrings): Boolean;
var 
  token, hashstr: String;
  I : Integer;
  S: String;
  Params: TStrings;
begin
  token := GetUrl(gUrls.Url('kapi_token'));
  hashstr := genHashKey(_kitesecr+token);
  
  Params := TStringList.Create;
  try
{$IFDEF LAN}
    Params.Values['tipo'] := '0';
{$ELSE}
    Params.Values['tipo'] := '1';
{$ENDIF}          
    S := '';
    for I := 0 to aUsuarios.Count - 1 do begin
      if I>0 then S := s + sLineBreak;
      S := S + aUsuarios.Names[i] + '{%SEP%}' + aUsuarios.ValueFromIndex[i];
    end;
    Params.Values['email'] := aEmail;
    Params.Values['senhas'] := S;

    DebugMsg('kapi_Esqueceu_Senha - aEmail: '+aEmail+S);

    PostURL(Params, gUrls.Url('kapi_employeepass', 'key='+hashstr+'&token_kite='+token));
    Result := True;
  finally                                                                                     
    Params.Free;
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
    kapi_Post(sl, 'kapi_registro');
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
    kapi_Post(sl, 'kapi_registro');
    Result := true;
  finally
    sl.Free;
  end;

end;


end.










