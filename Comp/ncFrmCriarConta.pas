unit ncFrmCriarConta;
{
    ResourceString: Dario 12/03/13
}

interface

{$I nex.inc}
                           
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxMaskEdit, cxTextEdit, cxLabel, LMDPNGImage, ExtCtrls,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, httpApp,
  LMDSimplePanel, Menus, StdCtrls, cxButtons, cxDropDownEdit,
  cxPCdxBarPopupMenu, cxRadioGroup, cxPC, cxCheckBox, cxClasses, ImgList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, rtcInfo, Countries, LMDCustomComponent, LMDSysInfo, LMDControl,
  LMDStrList, DB, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, kbmMemTable,
  dxBarBuiltInMenu;

type
  TFrmCriarConta = class(TForm)
    panPri: TLMDSimplePanel;
    Paginas: TcxPageControl;
    tsCriar1: TcxTabSheet;
    tsCriar2: TcxTabSheet;
    tsCriarInformar: TcxTabSheet;
    rgCriar: TcxRadioButton;
    rgInformar: TcxRadioButton;
    edEmail: TcxTextEdit;
    edSenha2: TcxTextEdit;
    cxLabel7: TcxLabel;
    edSenha: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel5: TcxLabel;
    cxEditStyleController1: TcxEditStyleController;
    edLoja: TcxTextEdit;
    cxLabel9: TcxLabel;
    edProp: TcxTextEdit;
    cxLabel8: TcxLabel;
    lbAtividade: TcxLabel;
    cxLabel1: TcxLabel;
    edTel: TcxMaskEdit;
    Logos: TcxImageList;
    tsAtivar: TcxTabSheet;
    rgNaoCriar: TcxRadioButton;
    panAtivar: TLMDSimplePanel;
    Image1: TImage;
    lbTopo1: TcxLabel;
    lbTopo2: TcxLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    Image2: TImage;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    Image3: TImage;
    cxLabel4: TcxLabel;
    cxLabel11: TcxLabel;
    Image4: TImage;
    LMDSimplePanel4: TLMDSimplePanel;
    Image5: TImage;
    cxLabel12: TcxLabel;
    cxLabel14: TcxLabel;
    edCod: TcxTextEdit;
    cxButton1: TcxButton;
    cxLabel13: TcxLabel;
    lbReenviar: TcxLabel;
    tsInformarRegistro: TcxTabSheet;
    Image6: TImage;
    edEmailReg: TcxTextEdit;
    rbEmail: TcxRadioButton;
    lbEsqueci: TcxLabel;
    rbCodLoja: TcxRadioButton;
    edChave: TcxMaskEdit;
    LMDSimplePanel2: TLMDSimplePanel;
    Image7: TImage;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    LMDSimplePanel5: TLMDSimplePanel;
    lbCorrigir: TcxLabel;
    lbEmail: TcxLabel;
    panRodape: TLMDSimplePanel;
    btnAvancar: TcxButton;
    btnVoltar: TcxButton;
    H: TIdHTTP;
    tsTransferirReg: TcxTabSheet;
    LMDSimplePanel6: TLMDSimplePanel;
    Image8: TImage;
    cxLabel15: TcxLabel;
    lbTransfTopo: TcxLabel;
    lbTransfPrompt: TcxLabel;
    edSenhaT: TcxTextEdit;
    cxLabel21: TcxLabel;
    lbEsqueciSenha: TcxLabel;
    cbOptin: TcxCheckBox;
    edAtividade: TcxTextEdit;
    cxLabel16: TcxLabel;
    LMDSysInfo1: TLMDSysInfo;
    strPaises: TLMDStrList;
    mtPaises: TkbmMemTable;
    edPais: TcxLookupComboBox;
    mtPaisesCod: TStringField;
    mtPaisesNome: TStringField;
    dsPaises: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure rbEmailClick(Sender: TObject);
    procedure rbCodLojaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure lbReenviarClick(Sender: TObject);
    procedure lbCorrigirClick(Sender: TObject);
    procedure lbEsqueciSenhaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FShowing : Boolean;
    FPagMostrar : Integer;
    FPreReg     : TStrings;
    FPreRegOk   : Boolean;
    procedure MudouPagina;
    procedure AtualizaBotoes;
    function ValidaNomeTel: Boolean;
    function ValidaEmailSenha: Boolean;

    procedure CriarConta;

    procedure PreenchePreReg;

    procedure ObtemRegistro;
    procedure TransferirRegistro;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CriarContaNovo;
    procedure salvaLicNovo(aConta, aChaves, aIDLoja: String); virtual;

    procedure showAtivar; virtual;
    procedure aposAtivar; virtual;
    procedure salvaLic(aConta, aChaves: String); virtual;
  public
    { Public declarations }
    procedure Mostrar(aPag: Integer);
  end;

  function ObtemRegistroNex(sConta: String = ''): String;

var
  FrmCriarConta: TFrmCriarConta;

implementation

uses ncClassesBase, ncaFrmObrigado, uLicEXECryptor,
  ncaFrmConfirmarReg, uNR_chaveseg, ncaFrmCorrigeEmail, ncDMServ, ncDebug,
  ncKiteApi, ncGuidUtils, ncaDM, nexUrls,
  uHMAC_sha256, ComObj;

const
  cNexcafeAppKey = 'df0c41f50a7c5b7c2cfe5626fcc9ff7014fbc75d7324561547666c104f4652a3'; // do not localize
  cNexcafeRegUrl = 'https://nexcafe.api.br/api/v1/register'; // do not localize
  cNexcafeLicUrl = 'https://nexcafe.api.br/api/v1/lic'; // do not localize
  cNexcafeCreateAccountUrl  = 'https://nexcafe.api.br/api/v1/create-account'; // do not localize
  cNexcafeConfirmAccountUrl = 'https://nexcafe.api.br/api/v1/confirm-account'; // do not localize
  cNexcafeResendConfirmUrl  = 'https://nexcafe.api.br/api/v1/resend-confirmation'; // do not localize
  cNexcafeForgotPasswordUrl = 'https://nexcafe.api.br/api/v1/forgot-password'; // do not localize
  cNclic2PendingKey         = 'NCLIC2:PENDING'; // do not localize
// START resource string wizard section
resourcestring
  SAvancar = '&Avançar >>';
  SRegistrarMinhaLoja = 'Registrar Minha Loja!';
  STransferirRegistro = 'Transferir Registro!';
  SFalhaDeConexaoComOServidorDeRegi = 'Falha de conexão com o servidor de registros Nextar';
  SJaFoiRealizadoUmRegistroNexCafeC = 'Já foi realizado um registro NexCafé com e-mail informado.';
  SErroNoProcessamentoDoSeuRegistro = 'Erro no processamento do seu registro (';
  SPorFavorFavoContatoComAEquipeDeA = '). Por favor faça contato com a equipe de atendimento Nextar.';
  SParaUsarONEXaNecessarioRegistrar = 'Para usar o NEX é necessário registrar sua loja.';
  SSeuNEXEstaRegistradoParaUsoEmOut = 'Seu NEX está registrado para uso em outro computador';
  SEnviamosSuaSenhaPara = 'Enviamos sua senha para ';
  SConfirmarRegistro = 'Confirmar registro';
  SRegistroNexCafe = 'Registro NexCafé';
  STransferirRegistro_1 = 'Transferir registro';
  SSeuRegistroFoiRecuperadoComSuces = 'Seu registro foi recuperado com sucesso!';
  SRegistroTransferidoComSucesso = 'Registro transferido com sucesso!';
  SPorFavorInformeCorretamenteSeuEM = 'Por favor, informe corretamente seu e-mail';
  SPorFavorInformeUmaSenha = 'Por favor, informe uma senha';
  SVoceInformouSenhasDiferentesPorF = 'Você informou senhas diferentes. Por favor informe novamente sua senha';
  SPorFavorInformeONomeDaLoja = 'Por favor informe o nome da loja';
  SPorFavorInformeONomeDoProprietar = 'Por favor informe o nome do proprietário da loja';

// END resource string wizard section
// Extrai valor de string JSON: "key":"value"
function ExtractJsonStr(const aJson, aKey: String): String;
var P: Integer; sKey: String;
begin
  Result := '';
  sKey := '"' + aKey + '":"';           // do not localize
  P := Pos(sKey, aJson);
  if P = 0 then Exit;
  Inc(P, Length(sKey));
  while (P <= Length(aJson)) and (aJson[P] <> '"') do
    begin Result := Result + aJson[P]; Inc(P); end;
end;

// Extrai valor numerico JSON: "key":12345
function ExtractJsonNum(const aJson, aKey: String): String;
var P: Integer; sKey: String; C: Char;
begin
  Result := '';
  sKey := '"' + aKey + '":';            // do not localize
  P := Pos(sKey, aJson);
  if P = 0 then Exit;
  Inc(P, Length(sKey));
  while (P <= Length(aJson)) and (aJson[P] = ' ') do Inc(P);
  while P <= Length(aJson) do begin
    C := aJson[P];
    if not (C in ['0'..'9']) then Break;
    Result := Result + C; Inc(P);
  end;
end;

// Escape minimo para valores dentro de JSON string
function EscapeJsonStr(const S: String): String;
var I: Integer; C: Char;
begin
  Result := '';
  for I := 1 to Length(S) do begin
    C := S[I];
    if C = '"'  then Result := Result + '\"'
    else if C = '\' then Result := Result + '\\'
    else Result := Result + C;
  end;
end;

{$R *.dfm}

procedure TFrmCriarConta.aposAtivar;
begin

end;

procedure TFrmCriarConta.AtualizaBotoes;
begin
  btnVoltar.Enabled := (Paginas.ActivePageIndex>FPagMostrar);
  btnVoltar.Visible := (Paginas.ActivePageIndex <> tsAtivar.PageIndex);
  case Paginas.ActivePageIndex of
    0, 1 : btnAvancar.Caption := SAvancar;
    2 : btnAvancar.Caption := SRegistrarMinhaLoja;
    3 : panRodape.Visible := False;
    4 : btnAvancar.Caption := SAvancar;
    5 : btnAvancar.Caption := STransferirRegistro;
  end;
end;

procedure TFrmCriarConta.btnAvancarClick(Sender: TObject);
begin
  case Paginas.ActivePageIndex of
    0 : begin
      if rgNaoCriar.Checked then begin
        Close;
        Exit;
      end else
      if rgInformar.Checked then begin
        Paginas.ActivePage := tsInformarRegistro;
        Exit;
      end;
    end;
    1 : if not ValidaNomeTel then Exit;
    2 : begin
      if not ValidaEmailSenha then Exit;
      CriarConta;
      Exit;
    end;
    4 : begin
      ObtemRegistro;
      Exit;
    end;
    5 : begin
      TransferirRegistro;
      Exit;
    end;
  end;
  if Paginas.ActivePageIndex < (Paginas.TabCount-1) then
    Paginas.ActivePageIndex := Paginas.ActivePageIndex + 1;
end;

procedure TFrmCriarConta.btnVoltarClick(Sender: TObject);
begin
  if Paginas.ActivePage=tsInformarRegistro then
    Paginas.ActivePageIndex := 0
  else
  if Paginas.ActivePageIndex>0 then
    Paginas.ActivePageIndex := Paginas.ActivePageIndex - 1;
end;

function get_prereg: String;
var sl: TStrings;
begin
  sl := TStringList.Create;
  try
    sl.Text := kapi_obtemprereg;
    Result := sl.Values['email']; // do not localize
  finally
    sl.Free;
  end;
end;

procedure TFrmCriarConta.CreateParams(var Params: TCreateParams);
begin
  inherited;
  if Owner is TWinControl then begin
    params.ExStyle := params.ExStyle or WS_EX_APPWINDOW;
    params.WndParent := TCustomForm(Owner).Handle;
  end;
end;

procedure TFrmCriarConta.CriarConta;
var
  aBody: String;
  aResp: String;
  aTS  : Int64;
  aSig : String;
  aHttp    : OleVariant;
  aSysTime : TSystemTime;
  sStatus, sMsg, sOptin: String;
begin
  if edTel.Text = '' then begin
    ShowMessage('Por favor, informe o telefone de contato.');
    Exit;
  end;

  if cbOptin.Checked then sOptin := 'true' else sOptin := 'false'; // do not localize

  aBody :=
    '{"email":"'   + EscapeJsonStr(edEmail.Text)                + '",' + // do not localize
    '"senha":"'    + EscapeJsonStr(AnsiToUTF8(edSenha.Text))    + '",' + // do not localize
    '"nome":"'     + EscapeJsonStr(AnsiToUTF8(edProp.Text))     + '",' + // do not localize
    '"loja":"'     + EscapeJsonStr(AnsiToUTF8(edLoja.Text))     + '",' + // do not localize
    '"tel":"'      + EscapeJsonStr(edTel.Text)                  + '",' + // do not localize
    '"pais":"'     + EscapeJsonStr(AnsiToUTF8(edPais.EditValue))+ '",' + // do not localize
    '"codequip":"' + EscapeJsonStr(gConfig.CodEquip)            + '",' + // do not localize
    '"optin":'     + sOptin                                     + ','  + // do not localize
{$ifdef LOJA}
    '"tipo":1,'                                                          + // do not localize
    '"atividade":"'+ EscapeJsonStr(AnsiToUTF8(edAtividade.Text))+ '"}';  // do not localize
{$else}
    '"tipo":0,'                                                          + // do not localize
    '"atividade":""}';                                                     // do not localize
{$endif}

  DebugMsg('CriarConta - body: ' + aBody); // do not localize

  GetSystemTime(aSysTime);
  aTS  := Round((SystemTimeToDateTime(aSysTime) - EncodeDate(1970, 1, 1)) * 86400);
  aSig := tHmac_sha256.calc(cNexcafeAppKey, gConfig.CodEquip + '|' + IntToStr(aTS)); // do not localize

  aHttp := CreateOleObject('WinHttp.WinHttpRequest.5.1');    // do not localize
  aHttp.Open('POST', cNexcafeCreateAccountUrl, False);        // do not localize
  aHttp.SetRequestHeader('Content-Type', 'application/json'); // do not localize
  aHttp.SetRequestHeader('X-NexCafe-Key', cNexcafeAppKey);    // do not localize
  aHttp.SetRequestHeader('X-Timestamp',   IntToStr(aTS));      // do not localize
  aHttp.SetRequestHeader('X-Signature',   aSig);               // do not localize
  aHttp.Send(aBody);
  aResp := Trim(aHttp.ResponseText);
  DebugMsg('CriarConta - resposta: ' + aResp); // do not localize

  if aResp = '' then
    raise Exception.Create(SFalhaDeConexaoComOServidorDeRegi);

  sStatus := ExtractJsonStr(aResp, 'status');  // do not localize
  sMsg    := ExtractJsonStr(aResp, 'message'); // do not localize

  if sStatus = 'OK' then begin // do not localize
    salvaLic(edEmail.Text, cNclic2PendingKey);
    showAtivar;
    TFrmConfirmarReg.Create(Self).ShowModal;
    Paginas.ActivePage := tsAtivar;
  end else begin
    if sMsg <> '' then raise Exception.Create(sMsg)
    else if sStatus = 'EMAIL-EXISTS' then // do not localize
      raise Exception.Create(SJaFoiRealizadoUmRegistroNexCafeC)
    else
      raise Exception.Create(SErroNoProcessamentoDoSeuRegistro +
        sStatus + SPorFavorFavoContatoComAEquipeDeA); // do not localize
  end;
end;

procedure TFrmCriarConta.CriarContaNovo;
var
  aParams , aResp, aStatus, aCodLoja, aLicChaves, aRest: String;
  aTS2: Int64;
  aSig2: String;
  aHttp2: OleVariant;
  aSysTime: TSystemTime;
  P1, P2: Integer;
begin
  // Monta query string
  aParams  := 'conta=' + URL_Encode(edEmail.Text) + // do not localize
        '&nome=' + URL_Encode(AnsiToUTF8(edProp.Text + ' ' + edLoja.Text)) + // do not localize
        '&codequip=' + URL_Encode(gConfig.CodEquip) + // do not localize
        '&versao=215'; // do not localize

  // HMAC com payload = conta|timestamp (loja ainda nao existe)
  GetSystemTime(aSysTime);
  aTS2 := Round((SystemTimeToDateTime(aSysTime) - EncodeDate(1970, 1, 1)) * 86400);
  aSig2 := tHmac_sha256.calc(cNexcafeAppKey,
    edEmail.Text + '|' + IntToStr(aTS2)); // do not localize

  aHttp2 := CreateOleObject('WinHttp.WinHttpRequest.5.1'); // do not localize
  aHttp2.Open('GET', cNexcafeCreateUrl + '?' + aParams, False); // do not localize
  aHttp2.SetRequestHeader('X-NexCafe-Key', cNexcafeAppKey); // do not localize
  aHttp2.SetRequestHeader('X-Timestamp', IntToStr(aTS2)); // do not localize
  aHttp2.SetRequestHeader('X-Signature', aSig2); // do not localize
  aHttp2.Send('');
  aResp := Trim(aHttp2.ResponseText);
  DebugMsg('CriarContaNovo - resposta: ' + aResp); // do not localize

  // Parse: OK:100001:NCLIC2-... ou ALREADY-EXISTS:100001:NCLIC2-...
  P1 := Pos(':', aResp);
  if P1 = 0 then
    raise Exception.Create('Resposta invalida do servidor de licencas'); // do not localize
  aStatus := Copy(aResp, 1, P1 - 1);
  aRest   := Copy(aResp, P1 + 1, Length(aResp));

  if (aStatus = 'OK') or (aStatus = 'ALREADY-EXISTS') then begin // do not localize
    P2 := Pos(':', aRest);
    if P2 = 0 then
      raise Exception.Create('Resposta invalida: falta codLoja/NCLIC2'); // do not localize
    aCodLoja    := Copy(aRest, 1, P2 - 1);        // '100001'
    aLicChaves  := Copy(aRest, P2 + 1, Length(aRest)); // 'NCLIC2-...'
    DebugMsg('CriarContaNovo - codLoja:' + aCodLoja + ' lic:' + Copy(aLicChaves,1,20)); // do not localize
    salvaLicNovo(edEmail.Text, aLicChaves, aCodLoja);
    aposAtivar;
    TFrmObrigado.Create(Self).Mostrar(SRegistroTransferidoComSucesso);
    Close;
  end else if aStatus = 'ERROR-UPDATE-REQUIRED' then // do not localize
    raise Exception.Create('Versao desatualizada. Atualize o programa.')
  else
    raise Exception.Create('Erro no servidor de licencas: ' + aResp); // do not localize
end;

procedure TFrmCriarConta.cxButton1Click(Sender: TObject);
var
  aBody: String;
  aResp: String;
  aTS  : Int64;
  aSig : String;
  aHttp    : OleVariant;
  aSysTime : TSystemTime;
  sStatus, sMsg, sChaves, sIDLoja: String;
begin
  aBody :=
    '{"email":"'      + EscapeJsonStr(gConfig.Conta)     + '",' + // do not localize
    '"codativacao":"' + EscapeJsonStr(edCod.Text)         + '",' + // do not localize
    '"codequip":"'    + EscapeJsonStr(gConfig.CodEquip)   + '"}';  // do not localize

  GetSystemTime(aSysTime);
  aTS  := Round((SystemTimeToDateTime(aSysTime) - EncodeDate(1970, 1, 1)) * 86400);
  aSig := tHmac_sha256.calc(cNexcafeAppKey, gConfig.CodEquip + '|' + IntToStr(aTS)); // do not localize

  aHttp := CreateOleObject('WinHttp.WinHttpRequest.5.1');    // do not localize
  aHttp.Open('POST', cNexcafeConfirmAccountUrl, False);       // do not localize
  aHttp.SetRequestHeader('Content-Type', 'application/json'); // do not localize
  aHttp.SetRequestHeader('X-NexCafe-Key', cNexcafeAppKey);    // do not localize
  aHttp.SetRequestHeader('X-Timestamp',   IntToStr(aTS));      // do not localize
  aHttp.SetRequestHeader('X-Signature',   aSig);               // do not localize
  aHttp.Send(aBody);
  aResp := Trim(aHttp.ResponseText);
  DebugMsg('ConfirmAccount - resposta: ' + aResp); // do not localize

  sStatus  := ExtractJsonStr(aResp, 'status');  // do not localize
  sMsg     := ExtractJsonStr(aResp, 'message'); // do not localize
  sChaves  := ExtractJsonStr(aResp, 'chaves');  // do not localize
  sIDLoja  := ExtractJsonNum(aResp, 'idloja');  // numero, sem aspas no JSON

  if sStatus = 'OK' then begin // do not localize
    salvaLicNovo(gConfig.Conta, sChaves, sIDLoja);
    aposAtivar;
    TFrmObrigado.Create(Self).ShowModal;
    Close;
  end else begin
    // message do servidor ja tem texto amigavel para todos os casos
    // (INVALID-CODE, EXPIRED-CODE, TOO-MANY-ATTEMPTS, ACCOUNT-NOT-FOUND, LICENSE-ERROR)
    if sMsg <> '' then raise Exception.Create(sMsg)
    else raise Exception.Create(sStatus); // do not localize
  end;
end;

function SoDig(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
    if S[I] in ['0'..'9'] then
      Result := Result + S[I];
end;

procedure TFrmCriarConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCriarConta.FormCreate(Sender: TObject);
var I : Integer;
begin
  mtPaises.DisableControls;
  mtPaises.Active := True;
  try
    for I := 0 to strPaises.Items.Count-1 do begin
      mtPaises.Append;
      mtPaisesCod.Value := strPaises.Items.Names[I];
      mtPaisesNome.Value := strPaises.Items.ValueFromIndex[I];
      mtPaises.Post;
    end;
  finally
    mtPaises.EnableControls;
  end;

  dsPaises.Dataset := mtPaises;

  edPais.EditValue := 'BR'; // do not localize

  FPreReg := TStringList.Create;
  FPreRegOk := False;
  {$ifdef LOJA}
  rbCodLoja.Visible := False;
  edChave.Visible := False;
  lbEsqueci.Visible := False;
  lbTopo2.Caption := SParaUsarONEX�Necess�rioRegistrar;
  lbTransfTopo.Caption := SSeuNEXEst�RegistradoParaUsoEmOut;
  {$else}
  lbAtividade.Visible := False;
  edAtividade.Visible := False;
  {$endif}
  FPagMostrar := 0;
  lbEmail.Caption := gConfig.Conta;
  FShowing := False;
  Paginas.HideTabs := True;
  Paginas.ActivePageIndex := 0;
  AtualizaBotoes;
end;

procedure TFrmCriarConta.FormDestroy(Sender: TObject);
begin
  FPreReg.Free;
end;

procedure TFrmCriarConta.FormShow(Sender: TObject);
begin
  PreenchePreReg;
  Fshowing := true;
  MudouPagina;
end;

procedure TFrmCriarConta.lbCorrigirClick(Sender: TObject);
var S: String;
begin
  S := TFrmCorrigeEmail.Create(Self).EditarEmail(lbEmail.Caption);
  if S>'' then begin
    lbEmail.Caption := S;
    salvaLic(S, cNclic2PendingKey);
  end;
end;

procedure TFrmCriarConta.lbEsqueciSenhaClick(Sender: TObject);
var
  aBody: String;
  aResp: String;
  aTS  : Int64;
  aSig : String;
  aHttp    : OleVariant;
  aSysTime : TSystemTime;
  sMsg: String;
begin
  aBody :=
    '{"email":"'   + EscapeJsonStr(gConfig.Conta)   + '",' + // do not localize
    '"codequip":"' + EscapeJsonStr(gConfig.CodEquip) + '"}';  // do not localize

  GetSystemTime(aSysTime);
  aTS  := Round((SystemTimeToDateTime(aSysTime) - EncodeDate(1970, 1, 1)) * 86400);
  aSig := tHmac_sha256.calc(cNexcafeAppKey, gConfig.CodEquip + '|' + IntToStr(aTS)); // do not localize

  aHttp := CreateOleObject('WinHttp.WinHttpRequest.5.1');    // do not localize
  aHttp.Open('POST', cNexcafeForgotPasswordUrl, False);       // do not localize
  aHttp.SetRequestHeader('Content-Type', 'application/json'); // do not localize
  aHttp.SetRequestHeader('X-NexCafe-Key', cNexcafeAppKey);    // do not localize
  aHttp.SetRequestHeader('X-Timestamp',   IntToStr(aTS));      // do not localize
  aHttp.SetRequestHeader('X-Signature',   aSig);               // do not localize
  aHttp.Send(aBody);
  aResp := Trim(aHttp.ResponseText);
  DebugMsg('ForgotPassword - resposta: ' + aResp); // do not localize

  sMsg := ExtractJsonStr(aResp, 'message'); // do not localize
  if sMsg <> '' then
    TFrmObrigado.Create(Self).Mostrar(sMsg)
  else
    TFrmObrigado.Create(Self).Mostrar(SEnviamosSuaSenhaPara + gConfig.Conta);
end;

procedure TFrmCriarConta.lbReenviarClick(Sender: TObject);
var
  aBody: String;
  aResp: String;
  aTS  : Int64;
  aSig : String;
  aHttp    : OleVariant;
  aSysTime : TSystemTime;
begin
  aBody :=
    '{"email":"'   + EscapeJsonStr(gConfig.Conta)   + '",' + // do not localize
    '"codequip":"' + EscapeJsonStr(gConfig.CodEquip) + '"}';  // do not localize

  GetSystemTime(aSysTime);
  aTS  := Round((SystemTimeToDateTime(aSysTime) - EncodeDate(1970, 1, 1)) * 86400);
  aSig := tHmac_sha256.calc(cNexcafeAppKey, gConfig.CodEquip + '|' + IntToStr(aTS)); // do not localize

  aHttp := CreateOleObject('WinHttp.WinHttpRequest.5.1');    // do not localize
  aHttp.Open('POST', cNexcafeResendConfirmUrl, False);        // do not localize
  aHttp.SetRequestHeader('Content-Type', 'application/json'); // do not localize
  aHttp.SetRequestHeader('X-NexCafe-Key', cNexcafeAppKey);    // do not localize
  aHttp.SetRequestHeader('X-Timestamp',   IntToStr(aTS));      // do not localize
  aHttp.SetRequestHeader('X-Signature',   aSig);               // do not localize
  aHttp.Send(aBody);
  aResp := Trim(aHttp.ResponseText);
  DebugMsg('ResendConfirmation - resposta: ' + aResp); // do not localize

  // Resposta sempre OK (anti-enumeracao) — apenas reexibe tela do codigo
  TFrmConfirmarReg.Create(Self).ShowModal;
end;

procedure TFrmCriarConta.Mostrar(aPag: Integer);
begin
  FPagMostrar := aPag;
  Paginas.ActivePageIndex := aPag;
  ShowModal;
end;

procedure TFrmCriarConta.MudouPagina;
begin
  AtualizaBotoes;
  case Paginas.ActivePageIndex of
    1 : edLoja.SetFocus;
    2 : edEmail.SetFocus;
    3 : begin
      Caption := SConfirmarRegistro;
      edCod.SetFocus;
      Height := 286;
    end;
    4 : begin
      Caption := SRegistroNexCafe;
      edEmailReg.SetFocus;
    end;
    5 : begin
      Caption := STransferirRegistro_1;
      edSenhaT.SetFocus;
    end;
  end;
end;

function ObtemRegistroNex(sConta: String = ''): String;
var 
  S: String;
  sl : TStrings;
  H : TidHttp;
begin
  if sConta='' then sConta := gConfig.Conta;
  
  S := 'conta='+httpEncode(sConta) + '&' +  // do not localize
        'codequip='+httpEncode(gConfig.CodEquip) + '&' +
        'random='+TGuidEx.ToString(TGuidEx.NewGuid);

  sl := tStringList.Create;
  H := TidHttp.Create(nil);
  try
    H.HandleRedirects := True;
    sl.Text := h.Get(gUrls.Url('contas_obtemregistro', S)); // do not localize
    if sl.Values['erro']='0' then begin  // do not localize
      Dados.CM.salvaLic(sl.Values['conta'], sl.Values['chaves']); // do not localize
      Result := '';
    end else
      Result := sl.Values['erro']; // do not localize
  finally
    sl.Free;
    H.Free;
  end;
end;

procedure TFrmCriarConta.ObtemRegistro;
var 
  sConta,
  S: String;
begin
   if rbEmail.Checked then 
     sConta := edEmailReg.Text else
     sConta := edChave.Text;
     
   S := 'conta='+httpEncode(sConta) + '&' +  // do not localize
        'codequip='+httpEncode(gConfig.CodEquip); // do not localize

   S := ObtemRegistroNEX(sConta);

   if S='' then begin
      TFrmObrigado.Create(Self).Mostrar(SSeuRegistroFoiRecuperadoComSuces);
      Close;
   end else
     raise exception.Create(S);
end;

procedure TFrmCriarConta.PaginasChange(Sender: TObject);
begin
  if Fshowing then MudouPagina;
end;

procedure TFrmCriarConta.PreenchePreReg;
var S: String;
begin
  if FPreRegOk then Exit;
  FPreRegOk := True;
  FPreReg.Text := kapi_ObtemPreReg;
  edEmail.Text := Trim(FPreReg.Values['email']); // do not localize
  edLoja.Text  := Trim(FPreReg.Values['nome_loja']); // do not localize
  edProp.Text  := Trim(FPreReg.Values['nome_prop']); // do not localize
  edTel.Text   := Trim(FPreReg.Values['tel']); // do not localize
  edAtividade.Text := Trim(FPreReg.Values['atividade']); // do not localize
end;

procedure TFrmCriarConta.rbCodLojaClick(Sender: TObject);
begin
  edChave.Visible := True;
  lbEsqueci.Visible := True;
  edChave.SetFocus;
end;

procedure TFrmCriarConta.rbEmailClick(Sender: TObject);
begin
  edChave.Visible := False;
  lbEsqueci.Visible := False;
  edEmailReg.SetFocus;
end;

procedure TFrmCriarConta.salvaLic(aConta, aChaves: String);
begin

end;

procedure TFrmCriarConta.salvaLicNovo(aConta, aChaves, aIDLoja: String);
begin
    // override nos descendentes
end;

procedure TFrmCriarConta.showAtivar;
begin

end;

procedure TFrmCriarConta.TransferirRegistro;
var
  ChaveSeg : String;
  S : String;
  SL : TStrings;
  aChaves, aLicVenc, aLicS, aLicChaves: String;
  aTS2: Int64;
  aSig2: String;
  aHttp2: OleVariant;
  aSysTime: TSystemTime;
begin
  SL := tStringList.Create;
  try
    ChaveSeg := H.Get(gUrls.Url('contas_obtemchaveseg'));

    S := 'conta='+gConfig.Conta+ // do not localize
         '&senha='+URL_Encode(edSenhaT.Text)+ // do not localize
         '&ret=nohtml'+ // do not localize
         '&codequip='+URL_Encode(gConfig.CodEquip)+ // do not localize
         '&chaveseg='+URL_Encode(ChaveSeg)+ // do not localize
         '&senhaseg='+URL_Encode(GeraSenhaSeg(ChaveSeg)); // do not localize

    Sl.Text := H.Get(gUrls.Url('contas_transferir', S)); // do not localize
    DebugMsg('TransferirRegistro - contas_transferir resposta: ' + Sl.Text); // do not localize
    if Sl.Values['erro']<>'0' then begin // do not localize
      Beep;
      ShowMessage(Sl.Values['erro']); // do not localize
      edSenhaT.SetFocus;
    end else begin
      aChaves := sl.Values['chaves']; // do not localize
      // NCLIC2: busca nova chave no novo servidor de licencas
      if gConfig.DVA > 0 then
        aLicVenc := FormatDateTime('dd/mm/yyyy', gConfig.DVA)
      else if gConfig.AssinaturaVenceEm > 0 then
        aLicVenc := FormatDateTime('dd/mm/yyyy', gConfig.AssinaturaVenceEm)
      else if sl.Values['DVA'] <> '' then begin // do not localize
        // converte YYYY-MM-DD para dd/mm/yyyy
        aLicVenc := Copy(sl.Values['DVA'], 9, 2) + '/' + // do not localize
                    Copy(sl.Values['DVA'], 6, 2) + '/' + // do not localize
                    Copy(sl.Values['DVA'], 1, 4); // do not localize
      end else
        aLicVenc := '';
      if aLicVenc <> '' then begin
        aLicS := Format('vencimento=%s&codequip=%s&tipo=5&vplano=3&loja=%d&versao=215', // do not localize
          [aLicVenc, gConfig.CodEquip, RegistroGlobal.IDLoja]);
        try
          GetSystemTime(aSysTime);
          aTS2 := Round((SystemTimeToDateTime(aSysTime) - EncodeDate(1970, 1, 1)) * 86400);
          aSig2 := tHmac_sha256.calc(cNexcafeAppKey,
            IntToStr(RegistroGlobal.IDLoja) + '|' + IntToStr(aTS2)); // do not localize
          aHttp2 := CreateOleObject('WinHttp.WinHttpRequest.5.1'); // do not localize
          aHttp2.Open('GET', cNexcafeLicUrl + '?' + aLicS, False); // do not localize
          aHttp2.SetRequestHeader('X-NexCafe-Key', cNexcafeAppKey); // do not localize
          aHttp2.SetRequestHeader('X-Timestamp', IntToStr(aTS2)); // do not localize
          aHttp2.SetRequestHeader('X-Signature', aSig2); // do not localize
          aHttp2.Send('');
          aLicChaves := Trim(aHttp2.ResponseText);
          DebugMsg('TransferirRegistro - novo servidor resposta: ' + aLicChaves); // do not localize
          // Auto-registro: loja nao existe no novo servidor -> registrar e tentar novamente
          if aLicChaves = 'ERROR-LOJA-NOT-FOUND' then begin // do not localize
            DebugMsg('TransferirRegistro - registrando loja no novo servidor...'); // do not localize
            GetSystemTime(aSysTime);
            aTS2 := Round((SystemTimeToDateTime(aSysTime) - EncodeDate(1970, 1, 1)) * 86400);
            aSig2 := tHmac_sha256.calc(cNexcafeAppKey,
              IntToStr(RegistroGlobal.IDLoja) + '|' + IntToStr(aTS2)); // do not localize
            aHttp2 := CreateOleObject('WinHttp.WinHttpRequest.5.1'); // do not localize
            aHttp2.Open('GET', cNexcafeRegUrl + '?' + // do not localize
              Format('loja=%d&conta=%s&codequip=%s&vencimento=%s&tipo=5&vplano=3&versao=215', // do not localize
                [RegistroGlobal.IDLoja, gConfig.Conta, gConfig.CodEquip, aLicVenc]),
              False);
            aHttp2.SetRequestHeader('X-NexCafe-Key', cNexcafeAppKey); // do not localize
            aHttp2.SetRequestHeader('X-Timestamp', IntToStr(aTS2)); // do not localize
            aHttp2.SetRequestHeader('X-Signature', aSig2); // do not localize
            aHttp2.Send('');
            aLicChaves := Trim(aHttp2.ResponseText);
            DebugMsg('TransferirRegistro - registro resposta: ' + aLicChaves); // do not localize
            if (aLicChaves = 'OK') or (aLicChaves = 'ALREADY-REGISTERED') then begin // do not localize
              GetSystemTime(aSysTime);
              aTS2 := Round((SystemTimeToDateTime(aSysTime) - EncodeDate(1970, 1, 1)) * 86400);
              aSig2 := tHmac_sha256.calc(cNexcafeAppKey,
                IntToStr(RegistroGlobal.IDLoja) + '|' + IntToStr(aTS2)); // do not localize
              aHttp2 := CreateOleObject('WinHttp.WinHttpRequest.5.1'); // do not localize
              aHttp2.Open('GET', cNexcafeLicUrl + '?' + aLicS, False); // do not localize
              aHttp2.SetRequestHeader('X-NexCafe-Key', cNexcafeAppKey); // do not localize
              aHttp2.SetRequestHeader('X-Timestamp', IntToStr(aTS2)); // do not localize
              aHttp2.SetRequestHeader('X-Signature', aSig2); // do not localize
              aHttp2.Send('');
              aLicChaves := Trim(aHttp2.ResponseText);
              DebugMsg('TransferirRegistro - retry apos registro: ' + aLicChaves); // do not localize
            end;
          end;
          if Copy(aLicChaves, 1, 6) = 'NCLIC2' then // do not localize
            aChaves := aLicChaves;
        except
          on E: Exception do
            DebugMsg('TransferirRegistro - erro no servidor de licencas: ' + E.Message); // do not localize
        end;
      end;
      salvaLic(gConfig.Conta, aChaves);
      aposAtivar;
      TFrmObrigado.Create(Self).Mostrar(SRegistroTransferidoComSucesso);
      Close;
    end;
  finally
    Sl.Free;
  end;
end;

function TFrmCriarConta.ValidaEmailSenha: Boolean;
var 
  P : Integer;
  S : String;
begin
  Result := False;

  P := Pos('@', edEmail.Text);
  if (P<1) then 
    S := '' else 
    S := Copy(edEmail.Text, P+1, 300);

  if Trim(Copy(S, Pos('.', S)+1, 300))='' then begin
    Beep;
    edEmail.SetFocus;
    ShowMessage(SPorFavorInformeCorretamenteSeuEM);
    Exit;
  end;

  if Trim(edSenha.Text)='' then begin
    Beep;
    edEmail.SetFocus;
    ShowMessage(SPorFavorInformeUmaSenha);
    Exit;
  end;

  if edSenha.Text<>edSenha2.Text then begin
    Beep;
    edEmail.SetFocus;
    ShowMessage(SVoceInformouSenhasDiferentesPorF);
    Exit;
  end;

  lbEmail.Caption := edEmail.Text;
  
  Result := True;
end;

function TFrmCriarConta.ValidaNomeTel: Boolean;
begin
  Result := False;

  if Trim(edLoja.Text)='' then begin
    Beep;
    edLoja.SetFocus;
    ShowMessage(SPorFavorInformeONomeDaLoja);
    Exit;
  end;

  if Trim(edProp.Text)='' then begin
    Beep;
    edProp.SetFocus;
    ShowMessage(SPorFavorInformeONomeDoProprietar);
    Exit;
  end;

  Result := True;
end;

end.


