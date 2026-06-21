{$I NEX.INC}

unit ncServAtualizaLic_Indy;
{
    ResourceString: Dario 13/03/13
}

interface

uses
  SysUtils,  DateUtils, ncErros, Classes, 
  Variants, nxDB, SyncObjs,
  Windows, Messages, ExtCtrls, uLicEXECryptor,
  DB, nxllComponent,
  IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

type

  TdmAtualizaLic = class(TDataModule)
    Timer1: TTimer;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
//    FReg : TRegistro;
    { Private declarations }
    FRes: TStrings;
  public
    function GetApp: Boolean;
  
    function ChecaConta(RaiseEx: Boolean = False): String;

    { Public declarations }
  end;

  TThreadAtualizaLic = class ( TThread )
  protected
    procedure Execute; override;
  public 
    constructor Create;   
  end;

  TDadosAutoconn = class
  private
    FCS : TCriticalSection;
    FComputerName : String;
    FIPs : String;
    function GetComputerName: String;
    function GetIPs: String;
    procedure SetComputerName(const Value: String);
    procedure SetIPs(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;

    property ComputerName: String
      read GetComputerName write SetComputerName;

    property IPs: String
      read GetIPs write SetIPs;   
  end;

  procedure PostAppUpdate(sl: TStrings; aIsServerTimer: Boolean = False);

  function GetApp(const aFromAdmin: Boolean = True): String;

  // Sinaliza ao thread de ChecaConta para rodar imediatamente (thread-safe via PostThreadMessage)
  procedure ForceChecaConta;

var
  dmAtualizaLic: TdmAtualizaLic;
  hndNotify    : HWND = 0;
  gDadosAutoconn : TDadosAutoconn;
  SendAutoConnInfo : Boolean = True;
  gAtualizaLicThreadID: DWORD;
  
implementation

uses
  JTimer, ncClassesBase, ncSyncLic, ncDebug, ncMsgCom, md5, nexUrls,
  ncLicenseLib_Import,  // NCLIC2: Para validação de licenças modernas
  uHMAC_sha256, ComObj, ActiveX;  // Novo servidor HTTPS + HMAC-SHA256 (WinHTTP via COM)

{$R *.dfm}

const
  TempoTimer = 5{m}* 60{s} * 1000{ms};

const
  NEXCAFE_LIC_URL = 'https://nexcafe.api.br/api/v1/lic'; // do not localize
  NEXCAFE_APP_KEY = 'df0c41f50a7c5b7c2cfe5626fcc9ff7014fbc75d7324561547666c104f4652a3'; // do not localize
  NEXCAFE_LIC_VER = 215;
  NEXCAFE_REG_URL = 'https://nexcafe.api.br/api/v1/register'; // do not localize

threadvar  
  NextAppTime : Cardinal;  
  
function GetApp(const aFromAdmin: Boolean = True): String;
var DM : TdmAtualizaLic;
begin
  DM := TdmAtualizaLic.Create(nil);
  try
    if DM.GetApp then
      Result := DM.FRes.Text else
      Result := '';
  finally
    DM.Free;
  end;
end;

procedure ForceChecaConta;
begin
  // WM_USER+500: mensagem privada para o thread de ChecaConta
  // PostThreadMessage e non-bloqueante e thread-safe
  if gAtualizaLicThreadID <> 0 then
    PostThreadMessage(gAtualizaLicThreadID, WM_USER + 500, 0, 0); // do not localize
end;

function YYYYMMDDToDate(S: String): TDateTime;
var D, M, Y: Word;
begin
  Result := 0;
  Y := StrToIntDef(Copy(S, 1, 4), 0);
  M := StrToIntDef(Copy(S, 6, 2), 0);
  D := StrToIntDef(Copy(S, 9, 2), 0);
  if Y<1 then Exit;
  if (M<1) or (M>12) then Exit;
  if (D<1) or (DaysInAMonth(Y, M)<D) then Exit;
  try
    Result := EncodeDate(Y, M, D);
  except
  end;
end;

function GetUnixTimestampSecs: Int64;
var
  ST: TSystemTime;
  DT: TDateTime;
begin
  GetSystemTime(ST);
  DT := SystemTimeToDateTime(ST);
  Result := Round((DT - EncodeDate(1970, 1, 1)) * 86400);
end;

function BuildLicSignature(const CodLoja: string; Timestamp: Int64): string;
begin
  Result := tHmac_sha256.calc(NEXCAFE_APP_KEY,
    CodLoja + '|' + IntToStr(Timestamp)); // do not localize
end;

function RegisterLoja(const aLoja, aConta, aCodEquip, aVencimento: string): Boolean; forward;

// Chama o novo servidor de licencas, com auto-registro se loja nao encontrada.
// Funcao separada para garantir que BuildLicSignature rode FORA de bloco crypt.
function ObtemNCLIC2(const aLoja, aConta, aCodEquip, aVencimento, aLicS: string): string;
var
  aTS: Int64;
  aSig: String;
  aHttp: OleVariant;
begin
  Result := '';
  try
    aTS := GetUnixTimestampSecs;
    aSig := BuildLicSignature(aLoja, aTS);
    DebugMsg('ObtemNCLIC2 - ts:' + IntToStr(aTS) + ' siglen:' + IntToStr(Length(aSig))); // do not localize
    aHttp := CreateOleObject('WinHttp.WinHttpRequest.5.1'); // do not localize
    aHttp.Open('GET', NEXCAFE_LIC_URL + '?' + aLicS, False); // do not localize
    aHttp.SetRequestHeader('X-NexCafe-Key', NEXCAFE_APP_KEY); // do not localize
    aHttp.SetRequestHeader('X-Timestamp', IntToStr(aTS)); // do not localize
    aHttp.SetRequestHeader('X-Signature', aSig); // do not localize
    aHttp.Send('');
    Result := Trim(aHttp.ResponseText);
    DebugMsg('ObtemNCLIC2 - resposta1: ' + Result); // do not localize
    // Auto-registro: loja nao existe no novo servidor -> registrar e tentar novamente
    if Result = 'ERROR-LOJA-NOT-FOUND' then begin // do not localize
      DebugMsg('ObtemNCLIC2 - loja nao encontrada, registrando...'); // do not localize
      if RegisterLoja(aLoja, aConta, aCodEquip, aVencimento) then begin
        aTS := GetUnixTimestampSecs;
        aSig := BuildLicSignature(aLoja, aTS);
        DebugMsg('ObtemNCLIC2 retry - ts:' + IntToStr(aTS) + ' siglen:' + IntToStr(Length(aSig))); // do not localize
        aHttp := CreateOleObject('WinHttp.WinHttpRequest.5.1'); // do not localize
        aHttp.Open('GET', NEXCAFE_LIC_URL + '?' + aLicS, False); // do not localize
        aHttp.SetRequestHeader('X-NexCafe-Key', NEXCAFE_APP_KEY); // do not localize
        aHttp.SetRequestHeader('X-Timestamp', IntToStr(aTS)); // do not localize
        aHttp.SetRequestHeader('X-Signature', aSig); // do not localize
        aHttp.Send('');
        Result := Trim(aHttp.ResponseText);
        DebugMsg('ObtemNCLIC2 - resposta2: ' + Result); // do not localize
      end;
    end;
  except
    on E: Exception do
      DebugMsg('ObtemNCLIC2 - erro: ' + E.Message); // do not localize
  end;
end;

function RegisterLoja(const aLoja, aConta, aCodEquip, aVencimento: string): Boolean;
var
  aTS: Int64;
  aSig: String;
  aHttp: OleVariant;
  aRegS, aResp: String;
begin
  Result := False;
  try
    aTS := GetUnixTimestampSecs;
    aSig := BuildLicSignature(aLoja, aTS);
    aRegS := Format('loja=%s&conta=%s&codequip=%s&vencimento=%s&tipo=5&vplano=3&versao=%d', // do not localize
      [aLoja, aConta, aCodEquip, aVencimento, NEXCAFE_LIC_VER]);
    aHttp := CreateOleObject('WinHttp.WinHttpRequest.5.1'); // do not localize
    aHttp.Open('GET', NEXCAFE_REG_URL + '?' + aRegS, False); // do not localize
    aHttp.SetRequestHeader('X-NexCafe-Key', NEXCAFE_APP_KEY); // do not localize
    aHttp.SetRequestHeader('X-Timestamp', IntToStr(aTS)); // do not localize
    aHttp.SetRequestHeader('X-Signature', aSig); // do not localize
    aHttp.Send('');
    aResp := Trim(aHttp.ResponseText);
    DebugMsg('RegisterLoja - resposta: ' + aResp); // do not localize
    Result := (aResp = 'OK') or (aResp = 'ALREADY-REGISTERED'); // do not localize
  except
    on E: Exception do
      DebugMsg('RegisterLoja - erro: ' + E.Message); // do not localize
  end;
end;

procedure PostAppUpdate(sl: TStrings; aIsServerTimer: Boolean = False);
var
  P : TmsgPubPar;
  I : Integer;
  D : TDateTime;
  B : Boolean;
  s : String;
  aChaves: String;
  LicLib: TncLicenseLibrary;
  ValidationResult: TValidationResult;
  LicenseValid: Boolean;
  IsNCLIC2: Boolean;
  aCE, aSN: String;
  sLicPath: String;
  slLic: TStringList;
  sExistingNCLIC2: String;
begin
  aChaves := sl.Values['Chaves'];
  LicenseValid := False;
  IsNCLIC2 := False;

  try
    LicLib := TncLicenseLibrary.Create;
    try
      IsNCLIC2 := LicLib.IsLoaded and LicLib.IsNewFormat(aChaves);
      if IsNCLIC2 then begin
        RegistroGlobal.CodEquipSerial(aCE, aSN);
        // NCLIC2 usa IDLoja, nao CodLoja (legado)
        ValidationResult := LicLib.ValidateLicense(aChaves, IntToStr(RegistroGlobal.IDLoja), aCE);
        LicenseValid := ValidationResult.Valid;
        if LicenseValid then
          DebugMsg('ncServAtualizaLic_Indy.PostAppUpdate - Licença NCLIC2 válida'); // do not localize
      end else begin
        LicenseValid := RegistroGlobal.ChavesOk(aChaves);
        if LicenseValid then
          DebugMsg('ncServAtualizaLic_Indy.PostAppUpdate - Licença legada válida'); // do not localize
      end;
    finally
      LicLib.Free;
    end;
  except
    // DLL ausente: usar validação legada
    IsNCLIC2 := False;
    LicenseValid := RegistroGlobal.ChavesOk(aChaves);
  end;

  if LicenseValid then begin
    DebugMsg('ncServAtualizaLic_Indy.PostAppUpdate - App Text: ' + sl.Text); // do not localize
    // SetStringChaves só aceita chaves legadas de 24 chars; NCLIC2 é gravado direto no arquivo
    if not IsNCLIC2 then
      RegistroGlobal.StringChaves := aChaves;
    RegistroGlobal.BoletosPendentes := StrToIntDef(sl.Values['BP'], 0); // do not localize
    RegistroGlobal.JaFoiPremium := SameText(sl.Values['JFP'], 'S'); // do not localize
    if RegistroGlobal.Conta='' then
      RegistroGlobal.Conta := sl.Values['conta']; // do not localize
    // Nao sobrescreve IDLoja existente com zero (preserva IDLoja de clientes novos)
    if (sl.Values['idloja'] <> '') and // do not localize
       (StrToIntDef(sl.Values['idloja'], 0) > 0) then begin // do not localize
      RegistroGlobal.SetIDLoja(sl.Values['idloja']); // do not localize
      RegistroGlobal.SetIDLojaKey(getIDLojaKey(sl.Values['idloja'], RegistroGlobal.Conta)); // do not localize
    end;
    // Preservar NCLIC2 existente antes de SalvaArqPadrao sobrescrever o arquivo
    sExistingNCLIC2 := '';
    if not IsNCLIC2 then begin
      try
        sLicPath := ExtractFilePath(ParamStr(0)) + 'LicArq.txt'; // do not localize
        if not FileExists(sLicPath) then
          sLicPath := ExtractFilePath(ParamStr(0)) + 'Lic.txt'; // do not localize
        if FileExists(sLicPath) then begin
          slLic := TStringList.Create;
          try
            slLic.LoadFromFile(sLicPath);
            if Copy(slLic.Values['Chaves'], 1, 6) = 'NCLIC2' then // do not localize
              sExistingNCLIC2 := slLic.Values['Chaves']; // do not localize
          finally
            slLic.Free;
          end;
        end;
      except
      end;
    end;
    RegistroGlobal.SalvaArqPadrao;
    // Restaurar NCLIC2 se SalvaArqPadrao sobrescreveu com chave legada
    if sExistingNCLIC2 <> '' then begin
      try
        sLicPath := ExtractFilePath(ParamStr(0)) + 'LicArq.txt'; // do not localize
        if not FileExists(sLicPath) then
          sLicPath := ExtractFilePath(ParamStr(0)) + 'Lic.txt'; // do not localize
        slLic := TStringList.Create;
        try
          if FileExists(sLicPath) then
            slLic.LoadFromFile(sLicPath);
          slLic.Values['Chaves'] := sExistingNCLIC2; // do not localize
          slLic.SaveToFile(sLicPath);
          DebugMsg('PostAppUpdate - NCLIC2 preservada apos SalvaArqPadrao: ' + sExistingNCLIC2); // do not localize
        finally
          slLic.Free;
        end;
      except
        on E: Exception do
          DebugMsg('PostAppUpdate - erro ao preservar NCLIC2: ' + E.Message); // do not localize
      end;
    end;
    // Gravar chave NCLIC2 diretamente no arquivo (bypassa SetStringChaves)
    if IsNCLIC2 then begin
      try
        sLicPath := ExtractFilePath(ParamStr(0)) + 'LicArq.txt'; // do not localize
        if not FileExists(sLicPath) then
          sLicPath := ExtractFilePath(ParamStr(0)) + 'Lic.txt'; // do not localize
        slLic := TStringList.Create;
        try
          if FileExists(sLicPath) then
            slLic.LoadFromFile(sLicPath);
          slLic.Values['Chaves'] := aChaves; // do not localize
          slLic.SaveToFile(sLicPath);
          DebugMsg('PostAppUpdate - NCLIC2 gravada em: ' + sLicPath + ' - ' + aChaves); // do not localize
        finally
          slLic.Free;
        end;
      except
        on E: Exception do
          DebugMsg('PostAppUpdate - erro ao gravar NCLIC2: ' + E.Message); // do not localize
      end;
    end;
    PostMessage(handleFrmPri, wm_user+1, 0, 0);
  end else if aIsServerTimer and (RegistroGlobal.IDLoja = 0) then begin
    // contas_app_server nao retornou chave valida para este equipamento (maquina nao registrada).
    // Limpar qualquer NCLIC2 obsoleta do Lic.txt para que DadosLicenca retorne scOutroHD.
    // NOTA: so executar quando vier do timer do servidor (contas_app_server e autoritativo).
    // O caminho do Admin (contas_app_admin) nao retorna Chaves e nao deve limpar o Lic.txt.
    // GUARD: cliente do novo servidor (IDLoja>0) -> servidor antigo NAO e autoritativo, nao limpar.
    try
      sLicPath := ExtractFilePath(ParamStr(0)) + 'LicArq.txt'; // do not localize
      if not FileExists(sLicPath) then
        sLicPath := ExtractFilePath(ParamStr(0)) + 'Lic.txt'; // do not localize
      if FileExists(sLicPath) then begin
        slLic := TStringList.Create;
        try
          slLic.LoadFromFile(sLicPath);
          if Copy(slLic.Values['Chaves'], 1, 6) = 'NCLIC2' then begin // do not localize
            slLic.Values['Chaves'] := ''; // do not localize
            slLic.SaveToFile(sLicPath);
            DebugMsg('PostAppUpdate - NCLIC2 obsoleta removida do Lic.txt (maquina nao registrada no servidor)'); // do not localize
            PostMessage(handleFrmPri, wm_user+1, 0, 0);
          end;
        finally
          slLic.Free;
        end;
      end;
    except
      on E: Exception do
        DebugMsg('PostAppUpdate - erro ao limpar NCLIC2 obsoleta: ' + E.Message); // do not localize
    end;
  end;


  if hndNotify>0 then begin
    P := TmsgPubPar.Create;

    try
      if (Trim(sl.Values['BRT'])>'') then begin // do not localize
        I := StrToIntDef(sl.Values['BRT'], 0); // do not localize
        if (I>0) or (I<>gConfig.BRT) then
          P.pbBRT := I;
      end;

      if (Trim(sl.Values['DTol'])>'') then begin // do not localize
        I := StrToIntDef(sl.Values['DTol'], 0); // do not localize
        if (I>0) or (I<>gConfig.DTol) then
          P.pbDTol := I;
      end;

      if (Trim(sl.Values['PreLib'])>'') then begin // do not localize
        B := StrToBool(sl.Values['PreLib']);
        if (B<>gConfig.PreLib) then
          P.pbPreLib := B;
      end;  

      if (Trim(sl.Values['AlertaAss'])>'') then begin // do not localize
        B := StrToBool(sl.Values['AlertaAss']);
        if (B<>gConfig.AlertaAssinatura) then
          P.pbAlertaAss := B;
      end;        

      D := YYYYMMDDToDate(sl.Values['DVA']);
      if (D<>gConfig.DVA) then
        P.pbDVA := D;
      
      if (Trim(sl.Values['ExCookie'])>'') then begin // do not localize
        B := StrToBool(sl.Values['ExCookie']);
        if (B<>gConfig.ExCookie) then
          P.pbExCookie := B;
      end;
  
      if (Trim(sl.Values['HPOpenBef'])>'') then begin // do not localize
        B := SameText(sl.Values['HPOpenBef'], 'S'); // do not localize
        if (B<>gConfig.HPOpenBef) then
          P.pbHPOpenBef := B;
      end;

      if not SameText(sl.Values['HPUrl'], gConfig.HomePage_Url) then  // do not localize
        P.pbHPURL := sl.Values['HPUrl']; // do not localize

      if not SameText(sl.Values['TbUrl'], gConfig.Toolbar_Url) then  // do not localize
        P.pbTbUrl := sl.Values['TbUrl']; // do not localize

      if not SameText(sl.Values['SkyUrl'], gConfig.Sky_Url) then  // do not localize
        P.pbSkyUrl := sl.Values['SkyUrl']; // do not localize

      if not SameText(sl.Values['banners'], gConfig.Banners) then
        P.pbBanners := sl.Values['banners'];

      if not SameText(sl.Values['botoes'], gConfig.Botoes) then
        P.pbBotoes := sl.Values['botoes'];
          
      B := not SameText(sl.Values['HPTab'], 'N'); // do not localize
      if B<>gConfig.HomePage_Tab then 
        P.pbHPTab := B;
    finally
      if P.AllNull then
        P.Free 
      else
        PostMessage(hndNotify, wm_user+2, Integer(P), 0);
    end;
  end;

end;



function LinhasPV(S: String): String;
var 
  I : Integer;

procedure Add(aLinha: String);
begin
  aLinha := Trim(aLinha);
  if aLinha='' then Exit;
  if Result>'' then
    Result := Result +';';
  Result := Result + aLinha;
end;

begin
  Result := '';
  with TStringList.Create do 
  try
    Text := S;
    for I := 0 to Count - 1 do Add(Strings[I]);
  finally
    Free;
  end;
end;  

procedure TdmAtualizaLic.DataModuleCreate(Sender: TObject);
begin
  FRes := TStringList.Create;
end;

procedure TdmAtualizaLic.DataModuleDestroy(Sender: TObject);
begin
  FRes.Free;
end;

function TdmAtualizaLic.GetApp: Boolean;
var
  aCE, aSN, aKey, aUrl: String;
  H : TIdHttp;
  S: String;
  s1, s2: String;

procedure Add(aPar, aValue: String);
begin
  if S>'' then S := S + '&';
  S := S + aPar+'='+aValue;
end;
  
begin
{$I crypt_start.inc}
  Result := False;
  S := '';

  DebugMsg('TdmAtualizaLic.GetApp - 1'); // do not localize
    
  if LadoServidor then begin
    RegistroGlobal.CodEquipSerial(aCE, aSN);
    Add('conta', RegistroGlobal.Conta);
    Add('codequip', aCE);
    Add('loja', IntToStr(RegistroGlobal.CodLoja));
    if SendAutoConnInfo then begin
      Add('ComputerName', gDadosAutoconn.ComputerName);
      Add('IPLocal', LinhasPV(gDadosAutoconn.IPs));
    end;
    aUrl := 'contas_app_server';
  end else begin
    Add('conta', gConfig.Conta);
    Add('fromadmin', '1');
    aUrl := 'contas_app_admin';
  end;  
    
  Add('versao', VerProg);
  aKey := IntToStr(Random(99999999));
  Add('key', aKey);
  Add('sw', '0');
  
  H := TidHttp.Create(nil);
  try
    H.HandleRedirects := True;
    DebugMsg('TdmAtualizaLic.GetApp - Par�metros: '+S);
    try
      FRes.Text := H.Get(gUrls.Url(aUrl, S));
      NextAppTime := gUrls.AppTimeMS;
    except
      NextAppTime := gUrls.AppRetryMS;
      raise;
    end;
    S := FRes.Text;
    DebugMsg('TdmAtualizaLic.GetApp - Resposta:'+S);
  finally
    H.Free;
  end;
  s1 := GetMD5Str(aKey+'aksdjhWEIUYWAEKjhDfsdfzOIasdm');
  s2 := FRes.Values['key'];
  Result := SameText(s1, s2);
  if not Result then
    DebugMsg('TdmAtualizaLic.GetApp - key invalida - servidor: '+s2+' - programa: '+s1);

{$I crypt_end.inc}
end;

function TdmAtualizaLic.ChecaConta(RaiseEx: Boolean): String;
var
  aChaves, aDVA, aLicS, aLicChaves, aLojaUsar: String;
  aDate: TDateTime;
  sLicPath: String;
  slLic: TStringList;
  aCE, aSN: String;
  aGetAppOk: Boolean;
  aBloqueado: Boolean;
begin
{$I crypt_start.inc}
  try
    aGetAppOk := Self.GetApp;
    aBloqueado := False;
    if aGetAppOk then
      Result := FRes.Values['Chaves'];

    // Loja efetiva: prefere idloja do servidor antigo; senao usa IDLoja armazenado (cliente novo)
    aLojaUsar := '';
    if aGetAppOk then aLojaUsar := FRes.Values['idloja']; // do not localize
    if StrToIntDef(aLojaUsar, 0) <= 0 then
      aLojaUsar := IntToStr(RegistroGlobal.IDLoja);

    if StrToIntDef(aLojaUsar, 0) > 0 then begin
      // Cliente do novo servidor: busca NCLIC2 autoritativa via /lic.
      // vencimento: usa DVA do servidor antigo se valido, senao placeholder (servidor e autoritativo)
      aDVA := '';
      if aGetAppOk then aDVA := FRes.Values['DVA']; // do not localize
      aDate := YYYYMMDDToDate(aDVA);
      if aDate <= Now then
        aDate := Now + 3650; // placeholder; servidor novo ignora e retorna a licenca real
      RegistroGlobal.CodEquipSerial(aCE, aSN);
      aLicS := Format('vencimento=%s&codequip=%s&tipo=5&vplano=3&loja=%s&versao=%d', // do not localize
        [FormatDateTime('dd/mm/yyyy', aDate), aCE, aLojaUsar, NEXCAFE_LIC_VER]);
      // ObtemNCLIC2 roda FORA do bloco crypt para garantir HMAC correto
      aLicChaves := ObtemNCLIC2(aLojaUsar, RegistroGlobal.Conta, aCE,
        FormatDateTime('dd/mm/yyyy', aDate), aLicS);
      if aLicChaves = 'BLOQUEADO' then begin // do not localize  (sinal de bloqueio do servidor)
        aBloqueado := True;
        sLicPath := ExtractFilePath(ParamStr(0)) + 'LicArq.txt'; // do not localize
        if not FileExists(sLicPath) then
          sLicPath := ExtractFilePath(ParamStr(0)) + 'Lic.txt'; // do not localize
        slLic := TStringList.Create;
        try
          if FileExists(sLicPath) then slLic.LoadFromFile(sLicPath);
          slLic.Values['Chaves'] := 'BLOQUEADO'; // do not localize
          slLic.SaveToFile(sLicPath);
        finally
          slLic.Free;
        end;
        DebugMsg('ChecaConta - loja BLOQUEADA pelo servidor'); // do not localize
        PostMessage(handleFrmPri, wm_user+1, 0, 0);
      end else if Copy(aLicChaves, 1, 6) = 'NCLIC2' then begin // do not localize
        sLicPath := ExtractFilePath(ParamStr(0)) + 'LicArq.txt'; // do not localize
        if not FileExists(sLicPath) then
          sLicPath := ExtractFilePath(ParamStr(0)) + 'Lic.txt'; // do not localize
        slLic := TStringList.Create;
        try
          if FileExists(sLicPath) then slLic.LoadFromFile(sLicPath);
          slLic.Values['Chaves'] := aLicChaves; // do not localize
          slLic.SaveToFile(sLicPath);
        finally
          slLic.Free;
        end;
        DebugMsg('ChecaConta - NCLIC2 atualizada via novo servidor: ' + aLicChaves); // do not localize
        PostMessage(handleFrmPri, wm_user+1, 0, 0); // dispara DadosLicenca
      end else
        DebugMsg('ChecaConta - novo servidor nao retornou NCLIC2: ' + aLicChaves); // do not localize
    end;

    if aGetAppOk and (not aBloqueado) then
      PostAppUpdate(FRes, True);  // bloqueado nao chama PostAppUpdate (evita sobrescrever o marcador)
  except
    if RaiseEx then
      Raise;
  end;
{$I crypt_end.inc}
end;

function StrToBool(S: String): Boolean;
begin
  Result := SameText(S, 'S') or (StrToIntDef(S, 0)>0) or SameText(S, 'Y');
end;

{ TThreadAtualizaLic }

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

constructor TThreadAtualizaLic.Create;
begin
  inherited Create(False);
  FreeOnTerminate := True;
end;

procedure TThreadAtualizaLic.Execute;
var
  DM : TdmAtualizaLic;
  Dummy: Integer;
  Msg2: TMsg;
begin
  CoInitialize(nil); // WinHTTP via COM requer CoInitialize na thread
  try
    gAtualizaLicThreadID := GetCurrentThreadId;
    DM := TdmAtualizaLic.Create(nil);
    try
      DM.Timer1Timer(nil);
      while not Terminated do begin
        MsgWaitForMultipleObjects(0, Dummy, False, 200, QS_ALLINPUT);
        // Captura mensagem de forca-ChecaConta postada via ForceChecaConta()
        // HWND($FFFFFFFF) = filtro somente para thread messages (PostThreadMessage)
        while PeekMessage(Msg2, HWND($FFFFFFFF), WM_USER+500, WM_USER+500, PM_REMOVE) do
          DM.ChecaConta;
        try
          ProcessMessages;
        except
        end;
      end;
    finally
      DM.Free;
      gAtualizaLicThreadID := 0;
    end;
  except
    on E: Exception do
      DebugMsgEsp('TThreadAtualizaLic.Execute - E.message: ' + E.Message, False, True); // do not localize
  end;
  CoUninitialize;
end;

procedure TdmAtualizaLic.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  try
    try
      NextAppTime := gUrls.AppTimeMS;
      ChecaConta;
    except
      On E: Exception do 
        DebugMsgEsp('TdmAtualizaLic.Timer1Timer - Exception: '+E.Message, False, True);
    end;
  finally
    Timer1.Interval := NextAppTime;
    DebugMsg('TdmAtualizaLic.Timer1.Interval: ' + IntToStr(Timer1.Interval));
    Timer1.Enabled := True;
  end;  
end;

{ TDadosAutoconn }

constructor TDadosAutoconn.Create;
begin
  FCS := TCriticalSection.Create;
  FComputerName := '';
  FIPs := '';
end;

destructor TDadosAutoconn.Destroy;
begin
  FCS.Free;
  inherited;
end;

function TDadosAutoconn.GetComputerName: String;
begin
  FCS.Enter;
  try
    Result := FComputerName;
  finally
    FCS.Leave;
  end;
end;

function TDadosAutoconn.GetIPs: String;
begin
  FCS.Enter;
  try
    Result := FIPs;
  finally
    FCS.Leave;
  end;
end;

procedure TDadosAutoconn.SetComputerName(const Value: String);
begin
  FCS.Enter;
  try
    FComputerName := Value;
  finally
    FCS.Leave;
  end;
end;

procedure TDadosAutoconn.SetIPs(const Value: String);
begin
  FCS.Enter;
  try
    FIPs := Value;
  finally
    FCS.Leave;
  end;
end;

initialization
  gDadosAutoconn := TDadosAutoconn.Create;

finalization
  gDadosAutoconn.Free;  

end.

