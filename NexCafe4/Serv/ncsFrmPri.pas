unit ncsFrmPri;

interface       

uses                 
  Windows, Messages, dxBar, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LMDCustomComponent, LMDWndProcComponent, StdCtrls,
  ExtCtrls, LMDControl, Variants, Winsock,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, Menus, lmdcont, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomSimpleLabel, LMDSimpleLabel, LMDCustomStatusBar, LMDStatusBar,
  LMDIniCtrl, ncClassesBase, ncServBase, jpeg,
  LMDCustomLabel, LMDLabel, cxLookAndFeelPainters, cxControls, cxContainer,
  cxEdit, cxLabel, cxButtons, cxPC, cxStyles, cxGraphics, cxMaskEdit,
  cxMemo, cxVGrid, cxInplaceContainer, cxSpinEdit, cxRadioGroup, pngimage,
  nxllComponent, nxdb, nxdbBackupController, Buttons, PngBitBtn, PngSpeedButton,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, kbmMemTable,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGridBandedTableView,
  cxGridDBBandedTableView, cxButtonEdit, ImgList, PngImageList, cxTextEdit,
  cxDropDownEdit, cxCalendar, cxGridStrs, UDPAdvertiser, cxGroupBox,
  dxsbar, ncsFrmBackup, ShellApi, LMDSysInfo, AppEvnts,
  cxCheckBox, LMDDockSpeedButton, dmGateConnUnit, rdServer, LMDPNGImage,
  LMDTrayIcon, LMDBaseController, LMDCustomContainer, LMDGenericList,
  cxLookAndFeels, OleServer, ActiveX, AOSMTPLib_TLB;

type
  TfrmPri = class(TForm)
    ImageErro: TImage;
    ImageOk: TImage;
    Timer1: TTimer;
    LMDSimplePanel1: TLMDSimplePanel;
    Timer2: TTimer;
    btnFechar: TcxButton;
    btnMinimizar: TcxButton;
    TimerTempo: TTimer;
    cxStyleRepository1: TcxStyleRepository;
    cxsNegrito: TcxStyle;
    cxsAmarelo: TcxStyle;
    cxsVerde: TcxStyle;
    cxsVermelho: TcxStyle;
    LMDSimplePanel2: TLMDSimplePanel;
    mtChaves: TkbmMemTable;
    mtChavesChave: TStringField;
    mtChavesTipo: TStringField;
    mtChavesVencimento: TStringField;
    dsChaves: TDataSource;
    mtChavesMaquinas: TIntegerField;
    PngImageList1: TPngImageList;
    TimerLic: TTimer;
    PopupMenu1: TPopupMenu;
    Encerrar1: TMenuItem;
    N1: TMenuItem;
    Minimizar1: TMenuItem;
    Abrir1: TMenuItem;
    LMDSimplePanel6: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    Paginas: TcxPageControl;
    tsBD: TcxTabSheet;
    tsLog: TcxTabSheet;
    meLog: TMemo;
    ilGrandes: TPngImageList;
    PngImageList3: TPngImageList;
    tsAssistencia: TcxTabSheet;
    SysInfo: TLMDSysInfo;
    UDPAdv: TUDPAdvertiser;
    panBD: TLMDSimplePanel;
    LMDSimplePanel9: TLMDSimplePanel;
    Image3: TImage;
    cxLabel11: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel12: TcxLabel;
    LMDDockSpeedButton1: TLMDDockSpeedButton;
    cxLabel3: TcxLabel;
    edPasta: TcxTextEdit;
    btnAssistenciaRemota: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edNomeComp: TcxTextEdit;
    edIPs: TcxMemo;
    cxPageControl1: TcxPageControl;
    SB: TdxSideBar;
    ImageIconeGrande: TImage;
    Image1: TImage;
    cxTabSheet2: TcxTabSheet;
    pgConta: TcxPageControl;
    tsSemConta: TcxTabSheet;
    tsAtivar: TcxTabSheet;
    btnAtivar: TcxButton;
    cxLabel8: TcxLabel;
    btnOkConta: TcxButton;
    lbContaAtivar: TcxLabel;
    tsContaOK: TcxTabSheet;
    cxLabel19: TcxLabel;
    edCodEquip: TcxTextEdit;
    tsRegistroAnt: TcxTabSheet;
    LMDSimplePanel3: TLMDSimplePanel;
    btnDownloadKey: TPngSpeedButton;
    btnApagaKey: TPngSpeedButton;
    btnAddKey: TPngSpeedButton;
    VG: TcxVerticalGrid;
    irCodLoja: TcxEditorRow;
    irEquip: TcxEditorRow;
    irMaq: TcxEditorRow;
    irManut: TcxEditorRow;
    LMDSimplePanel5: TLMDSimplePanel;
    LMDSimplePanel4: TLMDSimplePanel;
    Grid: TcxGrid;
    TV: TcxGridDBBandedTableView;
    TVChave: TcxGridDBBandedColumn;
    TVTipo: TcxGridDBBandedColumn;
    TVVencimento: TcxGridDBBandedColumn;
    TVMaquinas: TcxGridDBBandedColumn;
    GL: TcxGridLevel;
    lbMsgExp: TcxLabel;
    Image2: TImage;
    lbAtivacao: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    Image4: TImage;
    tsOutroHD: TcxTabSheet;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    Image6: TImage;
    lbErroDB: TcxLabel;
    LMDSimplePanel8: TLMDSimplePanel;
    cxButton5: TcxButton;
    Image5: TImage;
    cxLabel14: TcxLabel;
    edContaOk: TcxTextEdit;
    cxLabel16: TcxLabel;
    edAssinante: TcxTextEdit;
    tsBloqueada: TcxTabSheet;
    lbDetalhesBloq: TcxLabel;
    cxLabel22: TcxLabel;
    Image7: TImage;
    tnOkBloq: TcxButton;
    rbBloqUsarOutra: TcxRadioButton;
    rbBloqCriarConta: TcxRadioButton;
    tsIniciaConta: TcxTabSheet;
    cxLabel10: TcxLabel;
    LMDSimplePanel10: TLMDSimplePanel;
    lbVersao: TcxLabel;
    lbFree: TcxLabel;
    pmConta: TPopupMenu;
    Criarumanovaconta1: TMenuItem;
    Editarosdadosdessaconta1: TMenuItem;
    Alterarasenhadaminhaconta1: TMenuItem;
    tsCybermgr: TcxTabSheet;
    lbBoletosPend: TcxLabel;
    btnEmitirBoleto: TcxButton;
    lbVantagens2: TcxLabel;
    lbVantagens1: TcxLabel;
    N2: TMenuItem;
    ComprarAssinatura1: TMenuItem;
    tsTipoLicInvalida: TcxTabSheet;
    btnOk_Inv: TcxButton;
    rbOutraConta_Inv: TcxRadioButton;
    rbCriarConta_Inv: TcxRadioButton;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    edConta_Inv: TcxTextEdit;
    cxLabel25: TcxLabel;
    Image9: TImage;
    UsaroutracontaNexCaf1: TMenuItem;
    N4: TMenuItem;
    pmAnt: TPopupMenu;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    lbEmailErrado: TcxLabel;
    ApplicationEvents1: TApplicationEvents;
    Tray: TLMDTrayIcon;
    edCodAtivacao: TcxMaskEdit;
    lbOutraConta: TcxLabel;
    lbCriarConta: TcxLabel;
    lbTransferir: TcxLabel;
    edContaOutroHD: TcxTextEdit;
    cxLabel9: TcxLabel;
    cxLabel30: TcxLabel;
    cxLabel20: TcxLabel;
    btnInformarConta: TcxButton;
    lbCriarContaCM: TcxLabel;
    lbUsarOutraContaCM: TcxLabel;
    lbAtivarCM: TcxLabel;
    cxLabel24: TcxLabel;
    cxLabel26: TcxLabel;
    edContaCM: TcxTextEdit;
    cxLabel27: TcxLabel;
    Image8: TImage;
    genList: TLMDGenericList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrayDblClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure TimerTempoTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCodLojaClick(Sender: TObject);
    procedure irCodLojaEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnAddKeyClick(Sender: TObject);
    procedure btnApagaKeyClick(Sender: TObject);
    procedure TimerLicTimer(Sender: TObject);
    procedure TrayMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure SBChangeSelectedItem(Sender: TObject);
    procedure imBDClick(Sender: TObject);
    procedure imRegistroClick(Sender: TObject);
    procedure btnDownloadKeyClick(Sender: TObject);
    procedure btnAssistenciaRemotaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LMDDockSpeedButton1Click(Sender: TObject);
    procedure ImageIconeGrandeDblClick(Sender: TObject);
    procedure btnCriarContaClick(Sender: TObject);
    procedure btnOkContaClick(Sender: TObject);
    procedure btnAtivarClick(Sender: TObject);
    procedure rbBloqCriarContaClick(Sender: TObject);
    procedure rbBloqUsarOutraClick(Sender: TObject);
    procedure tnOkBloqClick(Sender: TObject);
    procedure btnEmitirBoleto2Click(Sender: TObject);
    procedure Usaroutracontanessecomputador1Click(Sender: TObject);
    procedure Alterarasenhadaminhaconta1Click(Sender: TObject);
    procedure Editarosdadosdessaconta1Click(Sender: TObject);
    procedure lbBoletosPendClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnOk_InvClick(Sender: TObject);
    procedure lbEmailErradoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure lbCriarContaClick(Sender: TObject);
    procedure lbOutraContaClick(Sender: TObject);
    procedure lbTransferirClick(Sender: TObject);
    procedure btnInformarContaClick(Sender: TObject);
    procedure lbAtivarCMClick(Sender: TObject);
    procedure UsaroutracontaNexCaf1Click(Sender: TObject);
  private
    { Private declarations }
    FInicio : Cardinal;
    FPrimeiro : Boolean;
    FVerPri : Word;
    FSL : TStrings;
    procedure VeSePode(S: String);
    procedure AddLog(S: String);
    procedure RetiraReadOnly;
    procedure SetVerPri(const Value: Word);
    procedure ChecaAOSMTP;
    
    procedure WMQueryEndSession(var Msg: TMessage);
      message WM_QUERYENDSESSION;

    procedure WMEndSession(var Msg: TMessage);
      message WM_ENDSESSION;

    procedure WMDadosLicenca(var Msg: TMessage);
      message WM_User + 1;  

    procedure WMParPub(var Msg: TMessage);
      message WM_User + 2; 

    function VersaoStr: String;  

    procedure On_Error(const s:string);

  public
    Serv : TncServidor;
    SRV:TrdServerModule;
    CON:TdmConn;
    FFechar: Boolean;
    
    procedure DadosLicenca;

    procedure FreeCaption(S: String);
    
    procedure Ativar;
    procedure Desativar;

    procedure CriarConta;
    procedure ComprarAss;
    procedure TrocaHD(aCM: Boolean = False);
    procedure ChecarConta;
    procedure UsarOutraConta;
  
    procedure AjustaIconeTray;
    procedure RecriaTray;
    property VerPri: Word
      read FVerPri write SetVerPri;
    { Public declarations }
  end;

var
  frmPri: TfrmPri = nil;
  hndFrmPri : HWND;

  MessageID: Integer;
  

implementation

uses 
  uLicExeCryptor, 
  ncIDRecursos, 
  ncsFrmLogin,
  uFrmCodLoja, 
  uFrmDadosReg,
  uFrmChave, 
  ncVersoes, 
  ncServAtualizaLic, 
  uFrmTransfReg, ncFrmSuporteRem, ncIPAddr, ncSyncLic, ncDebug,
  ncsFrmSemRegistro, ncVersionInfo, ncShellStart, ncFrmProgress, uFrmSenhaConta,
  uFrmLojaNex, uRSAss, uFrmAlteraSenhaConta, uFrmDadosConta, uDMBol,
  uFrmConsultaBoletos, ncPrintMon, ncMsgCom;

const
  SegMS = 1000;
  MinMS = SegMS * 60;
  HorMS = MinMS * 60;
  DiaMS = HorMS * 24;
  TempoLic = 10000;

  promptConta = 'Informe seu e-mail ou código de loja e clique em OK';

{$R *.DFM}

procedure TfrmPri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (not FFechar) and Tray.Active then begin
    Action := caNone;
    PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
  end else 
    Desativar;
end;

procedure TfrmPri.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := FFechar;
end;

procedure TfrmPri.btnAddKeyClick(Sender: TObject);
var S: String;
begin
  S := '';
  if TFrmChave.Create(self).Editar(S) then begin
    RegistroGlobal.AddChave(S);
    RegistroGlobal.SalvaArqPadrao;
    DadosLicenca;
  end;
end;

procedure TfrmPri.btnApagaKeyClick(Sender: TObject);
begin
  if mtChaves.RecordCount>0 then
  if MessageDlg('Deseja realmente remover sua autorização de uso?', mtConfirmation, [mbYes, mbNo], 0, mbNo)=mrYes then
  if MessageDlg('Só realize essa operação a pedido do suporte técnico do NexCafé. Confirma remoção da autorização de uso?', 
     mtConfirmation, [mbYes, mbNo], 0, mbNo)=mrYes then
  begin   
    RegistroGlobal.RemoveChave(mtChavesChave.Value);
    RegistroGlobal.SalvaArqPadrao;
    mtChaves.Delete;
    DadosLicenca;
  end;
end;

procedure TfrmPri.btnCodLojaClick(Sender: TObject);
begin
  if TFrmCodLoja.Create(nil).Editar then 
    ChecarConta;
end;

procedure TfrmPri.btnCriarContaClick(Sender: TObject);
begin
  CriarConta;
end;

procedure TfrmPri.btnDownloadKeyClick(Sender: TObject);
var 
  dmLic : TdmAtualizaLic;
begin
{$I crypt_start.inc}
  dmLic := TdmAtualizaLic.Create(Self);
  try
    dmLic.ChecaConta((Sender<>nil));
    DadosLicenca;
  finally
    dmLic.Free;
  end;
{$I crypt_end.inc}
end;

procedure TfrmPri.btnEmitirBoleto2Click(Sender: TObject);
begin
  ComprarAss;
end;

procedure TfrmPri.btnFecharClick(Sender: TObject);
begin
  FFechar := True;
  VeSePode('Encerrar Servidor NexCafé');
end;

procedure TfrmPri.btnInformarContaClick(Sender: TObject);
var aCE, aSN: String;
begin
  if TFrmCodLoja.Create(Self).Editar then begin
    DadosLicenca;
    RegistroGlobal.CodEquipSerial(aCE, aSN);
    ShellStart('http://contas.nextar.com.br/transferir?conta='+RegistroGlobal.Conta+'&codequip='+aCE);
  end;
end;

procedure TfrmPri.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;                 
end;

procedure TfrmPri.Timer1Timer(Sender: TObject);
begin
  if InFrmProgress then Exit;

  Timer1.Enabled := False;
  try
    if not Serv.Ativo then Ativar;
  finally
    DadosLicenca;
  end;

  Tray.Active := True;

  if Serv.Ativo and (pgConta.ActivePageIndex in [2, 4]) then 
    PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

function INIFName: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'nexserv.ini';
  DeleteFile(ExtractFilePath(ParamStr(0))+'ncserv.ini');
end;

function SoDig(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
    if S[I] in ['0'..'9'] then
      Result := Result + S[I];
end;

procedure TfrmPri.FormCreate(Sender: TObject);
var S: String;
begin
  MessageID := RegisterWindowMessage('TaskbarCreated');

  FreeCaption('');
  Paginas.ActivePageIndex := 0;
  pgConta.ActivePage := tsIniciaConta;
  Serv := TncServidor.Create(Self);

  ncFrmProgress.FormPri := Self;

  CON:=TdmConn.Create(nil);
  CON.AutoSyncEvents:=True;
  CON.OnError:=On_Error;

  SRV:=TrdServerModule.Create(nil);
  SRV.AutoSyncEvents:=True;
  SRV.ServerModule.Server:=CON.HttpServer;
  // Time after which the request should return even if no data.
  SRV.ResponseTimeout:=20000;
  SRV.ServerModule.ModuleFileName:='/$rdgate';
  
  
  FPrimeiro := True;
  NomeCompServ := SysInfo.Computername;
  RegistroGlobal.LeArqPadrao(True);
  gConfig.Conta := RegistroGlobal.Conta;
  edPasta.Text    := ExtractFileDir(ParamStr(0));
  edCodEquip.Text := RegistroGlobal.GetCodEquip(RegistroGlobal.GetSerialHD);
  gConfig.CodEquip := edCodEquip.Text;
  gConfig.FreePremium := False;
  gConfig.AssinaturaVenceEm := 0;
  gConfig.Conta := RegistroGlobal.Conta;
  gConfig.VerPri := Versoes.Versao;
  
  S := ExtractFilePath(ParamStr(0))+'ncserv.exe';
  if FileExists(S) then
    DeleteFile(S);

  S := ExtractFilePath(ParamStr(0))+'atualiza\ncguard.exe';
  if FileExists(S) then
    DeleteFile(S);

  FSL := TStringList.Create;
  if FileExists(IniFName) then begin
    FSL.LoadFromFile(IniFName);
    UDPAdv.Active := SameText(FSL.Values['DesativaAutoServ'], 'S');
  end else begin
    UDPAdv.Active := True;
    FSL.Values['DesativaAutoServ'] := 'N';
    FSL.SaveToFile(IniFName);
  end;
  
  if SameText(FSL.Values['Debug'], 'S') then begin
    DebugAtivo := True;
    lbVersao.Style.BorderColor := clBlack;
    lbVersao.Style.TextColor := clBlack;
  end;
  
  RetiraReadOnly;
  FrmCopia := TFrmCopia.Create(Self);
  FrmCopia.panPri.Parent := panBD;
  SB.SelectedItem := SB.Groups[0].Items[0];
  VerProg := SelfVersion;
  FVerPri := 0;
  VerPri := StrToIntDef(Copy(SoDig(SelfVersion), 1, 3), 0); 
  AddLog('Iniciado');
  FInicio := GetTickCount;
end;

procedure TfrmPri.TrayDblClick(Sender: TObject);
begin
  Application.Restore;
  Application.BringToFront;
  Visible := True;
end;

procedure TfrmPri.TrayMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then
    TrayDblClick(nil);
end;

procedure TfrmPri.TrocaHD(aCM: Boolean = False);
var aCE, aSN: String;
begin
  RegistroGlobal.CodEquipSerial(aCE, aSN);
  if aCM then
    ShellStart('http://contas.nextar.com.br/transferir?conta='+RegistroGlobal.Conta+'&codequip='+aCE+'&fromcm=yes') else
    ShellStart('http://contas.nextar.com.br/transferir?conta='+RegistroGlobal.Conta+'&codequip='+aCE);
end;

procedure TfrmPri.UsarOutraConta;
var aCE, aSN, sAnt: String;
begin
  sAnt := RegistroGlobal.Conta;
  if TFrmCodLoja.Create(Self).Editar and (RegistroGlobal.Conta <> sAnt) then begin
    RegistroGlobal.CodEquipSerial(aCE, aSN);
    ShellStart('http://contas.nextar.com.br/transferir?conta='+RegistroGlobal.Conta+'&codequip='+aCE);
    DadosLicenca;
  end;
end;

procedure TfrmPri.Usaroutracontanessecomputador1Click(Sender: TObject);
begin
  UsarOutraConta;
end;

procedure TfrmPri.UsaroutracontaNexCaf1Click(Sender: TObject);
begin
  UsarOutraConta;
end;

procedure TfrmPri.LMDDockSpeedButton1Click(Sender: TObject);
begin
  ShellStart(edPasta.Text);
end;

procedure TfrmPri.On_Error(const s: string);
begin
  DebugMsg('ERRO Remote Control: '+s);
end;

procedure TfrmPri.rbBloqCriarContaClick(Sender: TObject);
begin
  rbBloqCriarConta.Font.Style := [fsBold];
  rbBloqUsarOutra.Font.Style := [];
end;

procedure TfrmPri.rbBloqUsarOutraClick(Sender: TObject);
begin
  rbBloqCriarConta.Font.Style := [];
  rbBloqUsarOutra.Font.Style := [fsBold];
end;

function TfrmPri.VersaoStr: String;
begin
  Result := IntToStr(FVerPri);
  Result := Result[1] + '.' + Result[2] + '.' + Result[3] + Copy(SelfVersion, 6, 20);
end;

procedure TfrmPri.VeSePode(S: String);
var I : Integer;
begin
  if Serv.Ativo then begin
    I := TFrmLogin.Create(nil).PodeFechar(not Serv.TodosPerm(daMaqFecharCMServer), S);
    DebugMsg('TFrmPri.VeSePode 1');
    if I<0 then FFechar := False;
    if I=1 then begin
      DebugMsg('TFrmPri.VeSePode 2');
      Serv.Lock;
      try
        Serv.ShutdownMaq(0, 2);
      finally
        Serv.Unlock;
      end;
      DebugMsg('TFrmPri.VeSePode 3');
    end;
  end;
  Timer2.Enabled := (not Serv.Ativo) or (I>=0);
end;

procedure TfrmPri.wmParPub(var Msg: TMessage);
var P : PmsgPubPar;
begin
  P := PmsgPubPar(Msg.WParam);
  try
    Serv.Lock;
    try
      if Serv.Ativo then
        Serv.AtualizaPubPar(P);
    finally
      Serv.Unlock;
    end;
  finally
    Dispose(P);  
  end;
end;

procedure TfrmPri.WMDadosLicenca(var Msg: TMessage);
begin
  DadosLicenca;
end;

procedure TfrmPri.WMEndSession(var Msg: TMessage);
begin
  DebugMsg('WMEndSession 1');
//  if TWMEndSession(Msg).EndSession then begin
    FFechar := True;
    DebugMsg('WMEndSession 2');
    Close;
//  end;
end;

procedure TfrmPri.WMQueryEndSession(var Msg: TMessage);
begin
  Msg.Result := Integer(True);
  TWMQUERYEndSession(Msg).Result := Integer(True);
  FFechar := True;
  Close;
  DebugMsg('WMQueryEndSession');
end;

procedure TfrmPri.Timer2Timer(Sender: TObject);
begin
  DebugMsg('TFrmPri.Timer2Timer - 1');
  if InFrmProgress then Exit;
  DebugMsg('TFrmPri.Timer2Timer - 2');

  Timer2.Enabled := False;
  if FFechar then begin
    DebugMsg('TFrmPri.Timer2Timer - 3');
    Tray.Active := False;
    DebugMsg('TFrmPri.Timer2Timer - 4');
    Close;
    DebugMsg('TFrmPri.Timer2Timer - 5');
  end else begin
    DebugMsg('TFrmPri.Timer2Timer - 6');
    Desativar;
    DebugMsg('TFrmPri.Timer2Timer - 7');
  end;
end;

procedure TfrmPri.TimerLicTimer(Sender: TObject);
begin
  if InFrmProgress then Exit;
  
  TimerLic.Enabled := False;
  TimerLic.Interval := TempoLic;
  TimerLic.Enabled := True;
  try
    DadosLicenca;
  except
  end;
end;

procedure TfrmPri.Ativar;
var S: String;
begin
  try
    S := ExtractFilePath(ParamStr(0)) + 'Dados';
    if not DirectoryExists(S) then MkDir(S);
    S := S + '\Nomes.nx1';
    if not FileExists(S) then
      genList[0].SaveToFile(S);

    S := ExtractFilePath(ParamStr(0))+'aosmtp.dll';

    if not FileExists(S) then
      genList[1].SaveToFile(S);

    ChecaAOSMTP;  
      
    Serv.Ativo := True;
    UDPAdv.Active := True;
    CON.Connect;
  finally
    AjustaIconeTray;
  end;
end;

procedure TfrmPri.btnMinimizarClick(Sender: TObject);
begin
  Application.Minimize;
  PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TfrmPri.btnOkContaClick(Sender: TObject);
begin
  CriarConta;
end;

procedure TfrmPri.btnOk_InvClick(Sender: TObject);
begin
  if rbCriarConta_Inv.Checked then
    CriarConta
  else
  if rbOutraConta_Inv.Checked then
    UsarOutraConta;
end;

procedure TfrmPri.ChecaAOSMTP;
var 
  M: TMail;
  V, S: String;
begin
  try
    M := TMail.Create(nil);
    M.FromAddr := 'teste';
    M.Free;
  except
    if Win32MajorVersion>5 then
      V := 'runas' else
      V := 'open';

    S := ExtractFilePath(ParamStr(0));
      
    ShellStartCustom('regsvr32', 'aosmtp.dll /s', S, 0, 1, V);    
  end;
end;

procedure TfrmPri.ChecarConta;
var dmLic: TdmAtualizaLic;
begin
  dmLic := TdmAtualizaLic.Create(Self);
  try
    dmLic.ChecaConta(True);
    DadosLicenca;
    if RegistroGlobal.Inexistente then begin
      Beep;
      ShowMessage('Conta inexistente');
    end;

  finally
    dmLic.Free;
  end;
end;

procedure TfrmPri.ComprarAss;
begin
  ShellStart('http://contas.nextar.com.br/assinar?conta='+RegistroGlobal.Conta);
end;

procedure TfrmPri.CriarConta;
var aCE, aSN: String;
begin
  RegistroGlobal.CodEquipSerial(aCE, aSN);
  ShellStart('http://contas.nextar.com.br/criarconta?codequip='+aCE);
//  TFrmDadosReg.Create(Self).Editar('');
end;

procedure TfrmPri.cxButton2Click(Sender: TObject);
begin
  TFrmDadosConta.Create(Self).ShowModal;
end;

procedure TfrmPri.lbOutraContaClick(Sender: TObject);
begin
  UsarOutraConta;
end;

procedure TfrmPri.lbCriarContaClick(Sender: TObject);
begin
  CriarConta;
end;

procedure TfrmPri.lbTransferirClick(Sender: TObject);
begin
  TrocaHD;
end;

procedure TfrmPri.btnAssistenciaRemotaClick(Sender: TObject);
begin
  ChamaSuporte('NexServ', VersaoStr);
end;

procedure TfrmPri.btnAtivarClick(Sender: TObject);
var 
  S: String;
  dmLic: TdmAtualizaLic;
begin
  if SoDig(edCodAtivacao.Text)='' then begin
    Beep;
    ShowMessage('É necessário digitar o código de ativação');
    Exit;
  end;
  
  dmLic := TdmAtualizaLic.Create(Self);
  try
    dmLic.Ativar(RegistroGlobal.Conta, edCodAtivacao.Text);
    DadosLicenca;
  finally
    dmLic.Free;
  end;
end;

procedure TfrmPri.TimerTempoTimer(Sender: TObject);
var 
  Tempo : Cardinal;
  D, H, M, S : Word;
  St : String;
begin
  if InFrmProgress then Exit;
  
  Tempo := GetTickCount - FInicio;
  D := Tempo div DiaMS;
  Tempo := Tempo mod DiaMS;
  H := Tempo div HorMS;
  Tempo := Tempo mod HorMS;
  M := Tempo div MinMS;
  Tempo := Tempo mod MinMS;
  S := Tempo div SegMS;
  St := '';
  if D > 0 then 
  if D > 1 then
    St := IntToStr(D) + ' dias, ' else
    St := '1 dia, ';
    
  St := St + IntToStr(H) + 'h, ' +
        IntToStr(M) + 'm, ' +
        IntToStr(S) + 's';
        
//  lbTempo.Caption := 'Tempo Execução: ' + St;
end;

procedure TfrmPri.tnOkBloqClick(Sender: TObject);
begin
  if rbBloqCriarConta.Checked then
    CriarConta
  else
  if rbBloqUsarOutra.Checked then 
    UsarOutraConta;
end;

procedure TfrmPri.DadosLicenca;
var 
  I, Q, T : Integer;
  Ant : Byte;
  TC : TTipoChave;
  Direito, aVenc : TDateTime;
  aCE, aSN: String;
  S : String;
  Chaves : TArrayChaveLiberacao;
  SC : TStatusConta;
begin
{$I crypt_start.inc}
  T := 0;
  Direito := EncodeDate(2050, 1, 1);
  RegistroGlobal.CodEquipSerial(aCE, aSN);
  SC := RegistroGlobal.Status;
  aVenc := 0;

//  lbBoletosPend.Visible := (RegistroGlobal.BoletosPendentes>0);

  Chaves := RegistroGlobal.CloneChaves;
  try
    if Trim(RegistroGlobal.Conta)='' then 
      SC := scSemConta else
      SC := Chaves.Status(RegistroGlobal.CodLoja, aCE, aSN, aVenc);
      
    lbVantagens1.Visible := ((SC=scFree) and (RegistroGlobal.BoletosPendentes=0));
    lbVantagens2.Visible := lbVantagens1.Visible;
      
    with RegistroGlobal do 
    case SC of
      scBloqueada : begin
        FreeCaption('');
        lbDetalhesBloq.Caption := 'A conta NexCafé "'+RegistroGlobal.Conta+
                                  '" está bloqueada. Para maiores informações faça contato com a Nextar.';
        pgConta.ActivePage := tsBloqueada;
        T := 0;
        Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
        
      end;
      scSemConta : begin
        FreeCaption('');
        pgConta.ActivePageIndex := 0;
        S := '';
        S := S + 'N'; S := S + 'e'; S := S + 'n'; S := S + 'h'; S := S + 'u'; S := S + 'm'; S := S + 'a';
        irMaq.Properties.Value := S;
        Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
      end;
      scAtivar : begin
        FreeCaption('FREE');
        pgConta.ActivePage := tsAtivar;
        lbContaAtivar.Caption := RegistroGlobal.Conta;
        lbAtivacao.Caption := 'O código de ativação da sua conta NexCafé foi enviado para o seu e-mail "'+
                              RegistroGlobal.Conta + '".  Verifique sua caixa de Lixo Eletrônico / SPAM.';
        Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
        edCodAtivacao.SetFocus;                            
      end;
      scOutroHD : begin
        FreeCaption('');
        edContaOutroHD.Text := RegistroGlobal.Conta;
        pgConta.ActivePage := tsOutroHD;
        Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
      end;
      scCybermgr : begin
        FreeCaption('');
        edContaCM.Text := RegistroGlobal.Conta;
        pgConta.ActivePage := tsCybermgr;
        Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
      end;
      scTipoLicInvalida : begin
        FreeCaption('');
        edConta_Inv.Text := RegistroGlobal.Conta;
        pgConta.ActivePage := tsTipoLicInvalida;
        Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
      end;
      scFree, scPremium, scPremiumVenc : begin
        T := 1;
        if SC=scPremium then
          FreeCaption('PREMIUM') else
          FreeCaption('FREE');
        edContaOk.Text := RegistroGlobal.Conta;
        pgConta.ActivePage := tsContaOK;
        case SC of
          scFree: edAssinante.Text := 'Não.';
          scPremium: edAssinante.Text := 'Sim. Assinatura vence em ' + FormatDateTime('dd/mm/yyyy', aVenc);
          scPremiumVenc: edAssinante.Text := 'Não. Sua assinatura venceu';
        end;
        Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
      end;
      scAnt : begin
        FreeCaption('');
        irCodLoja.Properties.Value := RegistroGlobal.CodLojaAsString;
        pgConta.ActivePage := tsRegistroAnt;
        mtChaves.Active := True;
        mtChaves.EmptyTable;
        lbMsgExp.Visible := (RegistroGlobal.NumChaves<1);
        btnApagaKey.Enabled := not lbMsgExp.Visible; 
        for I := 0 to Chaves.Count-1 do begin
          Q := Chaves[I].ChaveValida(CodLoja, aCE, aSN, TC);
          if (Q<1) or (Q>2000) or (not (TC in [tcTemporaria, tcDefinitiva, tcTeste, tcLocacao])) then Q := 0;
          mtChaves.Insert;
          mtChavesChave.Value := Chaves[I].AsString;
          if Q = 0  then
            mtChavesTipo.Value := 'Inválida'
          else begin
            mtChavesTipo.Value := TipoChaveStr[TC];
            if TC=tcDefinitiva then begin
              mtChavesVencimento.Value := 'Nunca';
              if (Chaves[I].Vencimento<Direito) then
                Direito := Chaves[I].Vencimento;
              T := T + Q;
            end else begin
              mtChavesVencimento.Value := FormatDateTime('dd/mm/yyyy', Chaves[I].Vencimento);
              if not Chaves[I].Venceu then begin
                T := T + Q;
                if (Chaves[I].Vencimento<Direito) then
                  Direito := Chaves[I].Vencimento;
              end;
            end;  
          end;
          mtChavesMaquinas.Value := Q;
          mtChaves.Post;
        end;
        irEquip.Properties.Value := aCE;
    
        if T > 0 then begin
          irMaq.Properties.Value := IntToStr(T);
          irMaq.Styles.Content := cxsVerde;
          irManut.Properties.Value := 'Vigente até ' + FormatDateTime('dd/mm/yyyy', Direito);
          Versoes.AjustaVersaoAtual(Direito);
        end else begin
          irMaq.Properties.Value := 'Nenhuma';
          irMaq.Styles.Content := cxsVermelho;
          irManut.Properties.Value := 'sem plano de manutenção';
          Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
        end;
      end;
    end;
  finally
    Chaves.Free;
  end;
  
  Serv.Lock;
  try
    if ((T>Serv.Maquinas.Count) or 
        (gConfig.Conta <> RegistroGlobal.Conta) or 
        (gConfig.CodEquip<>aCE)) and Serv.BDAtivo then  
      try Serv.ChecaNumMaq(T, RegistroGlobal.Conta, aCE); except end;
      
    with Serv do 
    for I := 0 to Maquinas.Count-1 do with Maquinas[I] do begin
      Ant := Direito;
      AtualizaCache;
      case SC of
        scBloqueada, 
        scSemConta, 
        scAtivar, 
        scOutroHD: Direito := dmNenhum;
        
        scFree, scPremiumVenc: begin
          Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
          Direito := dmFree;
        end;
        
        scPremium: begin
          Direito := dmPremium;
          Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
        end;
        scAnt: begin
          if T>0 then
            Direito := dmDef 
          else
          if T>-2 then
            Direito := dmParcial else
            Direito := dmNenhum;
          Dec(T);
        end;
      end;
      if Ant<>Direito then
        Notificar(tnAlteracao);
    end;
  finally
    Serv.Unlock;
  end;
  Versoes.AjustaVersaoAtual(Direito);
  VerPri := Versoes.Versao;
  if (gConfig.VerPri<>Versoes.Versao) or 
     (gConfig.Conta<>RegistroGlobal.Conta) or
     (gConfig.FreePremium<>(SC in [scFree, scPremium, scPremiumVenc])) or
     (gConfig.JaFoiPremium<>RegistroGlobal.JaFoiPremium) or
     (gConfig.AssinaturaVenceEm<>aVenc) 
  then begin
    gConfig.AtualizaCache;
    gConfig.VerPri := Versoes.Versao;
    gConfig.JaFoiPremium := RegistroGlobal.JaFoiPremium or (SC=scPremiumVenc);
    gConfig.AssinaturaVenceEm := aVenc;
    gConfig.FreePremium := (SC in [scFree, scPremium, scPremiumVenc]);
    gConfig.Conta := RegistroGlobal.Conta;
    gConfig.Notificar(tnAlteracao);
  end;

{$I crypt_end.inc}
end;

procedure TfrmPri.Desativar;
begin
  DebugMsg('TfrmPri.Desativar 1');
  try
    CON.Stop;
    DebugMsg('TfrmPri.Desativar 2');
    UDPAdv.Active := False;
    DebugMsg('TfrmPri.Desativar 3');
    Serv.Ativo := False;
    DebugMsg('TfrmPri.Desativar 4');
  finally
    AjustaIconeTray;
  end;
end;

procedure TfrmPri.Editarosdadosdessaconta1Click(Sender: TObject);
begin
  ShellStart('http://contas.nextar.com.br/atualizardados?conta='+RegistroGlobal.Conta);
end;

procedure TfrmPri.SBChangeSelectedItem(Sender: TObject);
begin
  FrmCopia.Paginas.ActivePageIndex := SB.SelectedItem.Index;
end;

procedure TfrmPri.SetVerPri(const Value: Word);
begin
  if Value=FVerPri then Exit;
  FVerPri := Value;
  lbVersao.Caption := 'Versão ' + VersaoStr;
end;

procedure TfrmPri.AddLog(S: String);
begin
  meLog.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss - ', Now) + S);
end;

procedure TfrmPri.AjustaIconeTray;
begin
  if Serv.Ativo then  begin
    lbErroDB.Caption := '';
    lbErroDB.Visible := False;
  end
  else begin
    if Serv.ErroBD>'' then begin
      lbErroDB.Caption := 'Erro no banco de dados: '+'"'+Serv.ErroBD+'"';
      lbErroDB.Visible := True;
    end;
  end;
end;

procedure TfrmPri.Alterarasenhadaminhaconta1Click(Sender: TObject);
begin
  ShellStart('http://contas.nextar.com.br/alterasenha?conta='+RegistroGlobal.Conta);
end;


procedure TfrmPri.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  Handled := False;
  if Msg.message = MessageID then begin
    RecriaTray;
    DebugMsg('TASKBAR RECREATED');
  end;
end;

procedure TfrmPri.FormDestroy(Sender: TObject);
begin
  FSL.Free;
  frmPri := nil;
end;

procedure TfrmPri.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F8 then
    btnAssistenciaRemotaClick(nil);
end;

procedure TfrmPri.FormShow(Sender: TObject);
var 
  IP: TLocalIPObj;
  I : Integer;
begin
  CoInitialize(nil);
  hndFrmPri := Handle;
  hndNotify := Handle;
  
  Timer1.Enabled := FPrimeiro;
  FPrimeiro := False;
  IP := TLocalIPObj.Create;
  try
    edNomeComp.Text := IP.HostName;
    gNaoPausar.SetEsteComp(IP.HostName);
    edIPS.Lines.Text := '';
    for I := 0 to IP.IPCount-1 do
      edIPs.Lines.Add(IP.GetIPFromList(I))
  finally
    IP.Free;
  end;
  Paginas.ActivePageIndex := 0;
end;

procedure TfrmPri.FreeCaption(S: String);
begin
  lbFree.Caption := S;
  if SameText(S, 'PREMIUM') then
    lbFree.Style.TextColor := clGreen else
    lbFree.Style.TextColor := $00595959;
end;

procedure TfrmPri.ImageIconeGrandeDblClick(Sender: TObject);
begin
  DebugAtivo := not DebugAtivo;
  if not DebugAtivo then DesativaDebug;
  if DebugAtivo then begin
    lbVersao.Style.BorderColor := clBlack;
    lbVersao.Style.TextColor := clBlack;
  end else begin
    lbVersao.Style.BorderColor := $00ACACAC;
    lbVersao.Style.TextColor := $00595959;
  end;
end;

procedure TfrmPri.imBDClick(Sender: TObject);
begin
  Paginas.ActivePageIndex := 2;
end;

procedure TfrmPri.imRegistroClick(Sender: TObject);
begin
  Paginas.ActivePageIndex := 1;
end;

procedure TfrmPri.irCodLojaEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  pmAnt.Popup(VG.InplaceEditor.ClientOrigin.X, VG.InplaceEditor.ClientOrigin.Y+VG.InplaceEditor.Height);
//  btnCodLojaClick(nil);
  VG.HideEdit;
end;

procedure TfrmPri.lbAtivarCMClick(Sender: TObject);
begin
  TrocaHD(True);
end;

procedure TfrmPri.lbBoletosPendClick(Sender: TObject);
begin
  TFrmConsultaBol.Create(Self).ShowModal;
end;

procedure TfrmPri.lbEmailErradoClick(Sender: TObject);
begin
  RegistroGlobal.Conta := '';
  RegistroGlobal.SalvaArqPadrao;
  CriarConta;
end;

procedure TfrmPri.RecriaTray;
//var A, S: Boolean;
begin
{  A := Tray.Active;
  S := Tray.ShowMinimizedIcon;
  Tray.Free;
  Tray := TLMDTrayIcon.Create(Self);
  Tray.OnClick := TrayDblClick;
  Tray.OnDblClick := TrayDblClick;
  Tray.NoClose := False;
  Tray.Hint := 'Cyber Manager - CM-Server';
  AjustaIconeTray;
  Tray.ShowMinimizedIcon := S;
  Tray.Active := A;}
//  Application.Restore;


  Tray.Active := False;
  Tray.Active := True;
  PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TfrmPri.RetiraReadOnly;
var 
  SR : TSearchRec;
  S: String;
begin
  S := ExtractFilePath(ParamStr(0))+'dados\';
  if FindFirst(S+'*.nx1', SysUtils.faReadOnly, SR) = 0 then
  try
    repeat
      if (SR.Attr and SysUtils.faReadOnly) = SysUtils.faReadOnly then
        SetFileAttributes(Pchar(S+SR.Name), SR.Attr-SysUtils.faReadOnly);
    until FindNext(SR)<>0;
  finally
    FindClose(SR);
  end;
end;

initialization
  cxSetResourceString(@scxGridNoDataInfoText, '');


end.


01RAM:1116730, SEQ:151, COD:9013220000,:3SAO MARCOS,PAC:SARAH CARLA NASCIMEN[CR][LF]TORUA PROF MILTON SANTOS[CR][LF]BL 179/APT 203/CJ VALE DOS LAGOS/APOS SHOPPING[CR][LF]MOT: VOMITOS
01RAM:1116726, SEQ:147, COD:9010926986,:20PARALELA,PAC:RAMANA SANTOS VASCONC[CR][LF]ELOAVENIDA GOVERNADOR LUIS VIANA FILHO[CR][LF]CD.PQ LAGOA VERDE AP 102 BL-E / LD FACULDADE JORGE[CR][LF]MOT: VOMITOS[CR][LF]AT: 22/07/09, VOMITOS[EOT]
