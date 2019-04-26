unit ncsFrmPri;

interface       

uses                 
  Windows, Messages, dxBar, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LMDCustomComponent, LMDWndProcComponent, LMDTrayIcon, StdCtrls,
  ExtCtrls, LMDControl, Variants, Winsock, 
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, Menus, lmdcont, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomSimpleLabel, LMDSimpleLabel, LMDCustomStatusBar, LMDStatusBar,
  LMDIniCtrl, ncClassesBase, ncServBase, jpeg,
  LMDOneInstance, 
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
  cxCheckBox, LMDDockSpeedButton;

type
  TfrmPri = class(TForm)
    ImageErro: TImage;
    ImageOk: TImage;
    Timer1: TTimer;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDOneInstance1: TLMDOneInstance;
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
    Label1: TLabel;
    Paginas: TcxPageControl;
    tsRegistro: TcxTabSheet;
    pgRegistro: TcxPageControl;
    tsReg: TcxTabSheet;
    lbMsgExp: TcxLabel;
    Grid: TcxGrid;
    TV: TcxGridDBBandedTableView;
    TVChave: TcxGridDBBandedColumn;
    TVTipo: TcxGridDBBandedColumn;
    TVVencimento: TcxGridDBBandedColumn;
    TVMaquinas: TcxGridDBBandedColumn;
    GL: TcxGridLevel;
    LMDSimplePanel4: TLMDSimplePanel;
    LMDSimplePanel3: TLMDSimplePanel;
    btnDownloadKey: TPngSpeedButton;
    btnApagaKey: TPngSpeedButton;
    btnAddKey: TPngSpeedButton;
    btnAjuda: TPngSpeedButton;
    VG: TcxVerticalGrid;
    irCodLoja: TcxEditorRow;
    irEquip: TcxEditorRow;
    irMaq: TcxEditorRow;
    LMDSimplePanel5: TLMDSimplePanel;
    tsNaoReg: TcxTabSheet;
    cxLabel6: TcxLabel;
    btnTesteGratuito: TcxButton;
    btnCodLoja: TcxButton;
    tsBD: TcxTabSheet;
    tsLog: TcxTabSheet;
    meLog: TMemo;
    lbVersao: TcxLabel;
    LMDSimplePanel8: TLMDSimplePanel;
    UDPAdv: TUDPAdvertiser;
    ImageIconeGrande: TImage;
    cxTabSheet1: TcxTabSheet;
    ilGrandes: TPngImageList;
    cxPageControl1: TcxPageControl;
    SB: TdxSideBar;
    PngImageList3: TPngImageList;
    cxch: TLMDSimplePanel;
    cxGroupBox1: TcxGroupBox;
    imRegistro: TImage;
    cxGroupBox2: TcxGroupBox;
    imBD: TImage;
    lbTempo: TcxLabel;
    Label2: TLabel;
    edCodEquip: TcxTextEdit;
    irManut: TcxEditorRow;
    tsAssistencia: TcxTabSheet;
    btnAssistenciaRemota: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edNomeComp: TcxTextEdit;
    edIPs: TcxMemo;
    SysInfo: TLMDSysInfo;
    cxLabel3: TcxLabel;
    edPasta: TcxTextEdit;
    cxLabel4: TcxLabel;
    Tray: TLMDTrayIcon;
    lbErroDB: TcxLabel;
    LMDDockSpeedButton1: TLMDDockSpeedButton;
    cxLabel12: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel11: TcxLabel;
    Image3: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrayDblClick(Sender: TObject);
    procedure LMDOneInstance1Custom(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure TimerTempoTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCodLojaClick(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
    procedure irCodLojaEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnTesteGratuitoClick(Sender: TObject);
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
    procedure TrayQueryEndSession(Sender: TObject; var Res: Integer);
    procedure LMDDockSpeedButton1Click(Sender: TObject);
    procedure ImageIconeGrandeDblClick(Sender: TObject);
  private
    { Private declarations }
    FFechar: Boolean;
    FInicio : Cardinal;
    FPrimeiro : Boolean;
    FVerPri : Word;
    FSL : TStrings;
    procedure VeSePode(S: String);
    procedure DadosLicenca;
    procedure AddLog(S: String);
    procedure RetiraReadOnly;
    procedure SetVerPri(const Value: Word);
    procedure WMQueryEndSession(var Msg: TMessage);
      message WM_QUERYENDSESSION;

    function VersaoStr: String;  
  public
    Serv : TncServidor;
    
    procedure Ativar;
    procedure Desativar;
  
    procedure AjustaIconeTray;
    procedure RecriaTray;
    property VerPri: Word
      read FVerPri write SetVerPri;
    { Public declarations }
  end;

var
  frmPri: TfrmPri = nil;

  MessageID: Integer;
  WProc: TFNWndProc = Nil;

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
  ncsFrmSemRegistro, ncVersionInfo, ncShellStart;

const
  SegMS = 1000;
  MinMS = SegMS * 60;
  HorMS = MinMS * 60;
  DiaMS = HorMS * 24;
  TempoLic = 10000;

{$R *.DFM}

procedure TfrmPri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (not FFechar) and Tray.Active then begin
    Action := caNone;
    PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
  end else 
    Desativar;
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

procedure TfrmPri.btnBackupClick(Sender: TObject);
begin
  TFrmCopia.Create(nil).ShowModal;
end;
  
procedure TfrmPri.btnCodLojaClick(Sender: TObject);
var S: String;
begin
  S := RegistroGlobal.CodLojaAsString;
  if TFrmCodLoja.Create(nil).Editar(S) then begin
    RegistroGlobal.CodLojaAsString := S;
    RegistroGlobal.SalvaArqPadrao;
    DadosLicenca;
    btnDownloadKeyClick(nil);
  end;
end;

procedure TfrmPri.btnDownloadKeyClick(Sender: TObject);
var 
  S: String;
  dmLic : TdmAtualizaLic;
begin
{$I crypt_start.inc}
  dmLic := TdmAtualizaLic.Create(Self);
  try
    S := dmLic.ObtemNovaLic(True);
    if (S<>'OUTROHD') and (not RegistroGlobal.ChavesOk(S)) then Exit;
    RegistroGlobal.StringChaves := S;
    DadosLicenca;
  
    if S='OUTROHD' then begin
      S := TFrmTransfReg.Create(Self).Transferir(0, dmLic);
      if (S>'') then 
        DadosLicenca;
      Exit;
    end;
  
    if Pos(ChaveCybermgr, S)>0 then begin
      S := TFrmTransfReg.Create(Self).Transferir(1, dmLic);
      if (S>'') then 
        DadosLicenca;
      Exit;
    end;
      
  finally
    dmLic.Free;
  end;
{$I crypt_end.inc}
end;

procedure TfrmPri.btnFecharClick(Sender: TObject);
begin
  FFechar := True;
  VeSePode('Encerrar Servidor NexCafé');
end;

procedure TfrmPri.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;                 
end;

procedure TfrmPri.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  try
    if not Serv.Ativo then Ativar;
  finally
    DadosLicenca;
  end;

  if RegistroGlobal.CodLoja=0 then
  case TFrmSemReg.Create(nil).OpcaoRegistro of
    1 : btnTesteGratuitoClick(nil);
    2 : btnCodLojaClick(nil);
  end;
  
  Tray.Active := True;

  if Serv.Ativo then
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
  Serv := TncServidor.Create(Self);
  FPrimeiro := True;
  NomeCompServ := SysInfo.Computername;
  RegistroGlobal.LeArqPadrao(True);
  gConfig.CodLoja := RegistroGlobal.CodLojaAsString;
  edPasta.Text    := ExtractFileDir(ParamStr(0));
  edCodEquip.Text := RegistroGlobal.GetCodEquip(RegistroGlobal.GetSerialHD);
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
  FrmCopia.panPri.Parent := tsBD;
  SB.SelectedItem := SB.Groups[0].Items[0];
  VersaoCMServer := SelfVersion;
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

procedure TfrmPri.TrayQueryEndSession(Sender: TObject; var Res: Integer);
begin
  Res := 1;
  FFechar := True;
  Tray.Active := False;
  Desativar;
  Close;
end;

procedure TfrmPri.LMDDockSpeedButton1Click(Sender: TObject);
begin
  ShellStart(edPasta.Text);
end;

procedure TfrmPri.LMDOneInstance1Custom(Sender: TObject);
begin
  Timer1.Enabled := False;
  Beep;
  ShowMessage('Já existe um servidor NexCafé sendo executado!');
  Application.Terminate;
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
    if I<0 then FFechar := False;
    if I=1 then
      Serv.ShutdownMaq(0, 2);
  end;
  Timer2.Enabled := (not Serv.Ativo) or (I>=0);
end;

procedure TfrmPri.WMQueryEndSession(var Msg: TMessage);
begin
  TWMQUERYEndSession(Msg).Result := 1;
  msg.WParam := 1;
  FFechar := True;
  Tray.Active := False;
  UDPadv.Active := False;
  Serv.Ativo := False;
  Close;
end;

procedure TfrmPri.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  if FFechar then begin
    Tray.Active := False;
    Close;
  end else
    Desativar;
end;

procedure TfrmPri.TimerLicTimer(Sender: TObject);
begin
  TimerLic.Enabled := False;
  TimerLic.Interval := TempoLic;
  TimerLic.Enabled := True;
  try
    DadosLicenca;
  except
  end;
end;

procedure TfrmPri.Ativar;
begin
  try
    Serv.Ativo := True;
    UDPAdv.Active := True;
  finally
    AjustaIconeTray;
  end;
end;

procedure TfrmPri.btnMinimizarClick(Sender: TObject);
begin
  Application.Minimize;
  PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TfrmPri.btnTesteGratuitoClick(Sender: TObject);
var 
  S: String;
  dmLic: TdmAtualizaLic;
begin
  S := TFrmDadosReg.Create(Self).Editar('');
  if S='' then Exit;
  dmLic := TdmAtualizaLic.Create(Self);
  try
    dmLic.RegistraTesteGratuito(S);
    DadosLicenca;
  finally
    dmLic.Free;
  end;
end;                  

procedure TfrmPri.btnAssistenciaRemotaClick(Sender: TObject);
begin
  ChamaSuporte('NexServ', VersaoStr);
end;

procedure TfrmPri.TimerTempoTimer(Sender: TObject);
var 
  Tempo : Cardinal;
  D, H, M, S : Word;
  St : String;
begin
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
  lbTempo.Caption := 'Tempo Execução: ' + St;
end;

procedure TfrmPri.DadosLicenca;
var 
  I, Q, T : Integer;
  TC : TTipoChave;
  Direito : TDateTime;
  aCE, aSN: String;
  Chaves : TArrayChaveLiberacao;
begin
{$I crypt_start.inc}
  gConfig.CodLoja := RegistroGlobal.CodLojaAsString;
  T := 0;
  Direito := EncodeDate(2050, 1, 1);
  RegistroGlobal.CodEquipSerial(aCE, aSN);
  with RegistroGlobal do 
  if (CodLoja < 1) or (CodLoja>99999) then begin
    pgRegistro.ActivePageIndex := 1;
    irCodLoja.Properties.Value := '';
    irMaq.Properties.Value := 'Nenhuma';
    tsRegistro.ImageIndex := 2;
    imRegistro.Picture.Assign(ilGrandes.PngImages[2].PngImage);
  end else begin
    irCodLoja.Properties.Value := RegistroGlobal.CodLojaAsString;
    pgRegistro.ActivePageIndex := 0;
    mtChaves.Active := True;
    mtChaves.EmptyTable;
    lbMsgExp.Visible := (RegistroGlobal.NumChaves<1);
    btnApagaKey.Enabled := not lbMsgExp.Visible; 
    Chaves := RegistroGlobal.CloneChaves;
    try
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
    finally
      Chaves.Free;
    end;
    irEquip.Properties.Value := aCE;
  
    if T > 0 then begin
      irMaq.Properties.Value := IntToStr(T);
      irMaq.Styles.Content := cxsVerde;
      imRegistro.Picture.Assign(ilGrandes.PngImages[0].PngImage);
      irManut.Properties.Value := 'Vigente até ' + FormatDateTime('dd/mm/yyyy', Direito);
    end else begin
      irMaq.Properties.Value := 'Nenhuma';
      irMaq.Styles.Content := cxsVermelho;
      imRegistro.Picture.Assign(ilGrandes.PngImages[1].PngImage);
      irManut.Properties.Value := 'sem plano de manutenção';
    end;
  end;
  
  if T<2 then T := 2;
  
  Serv.Lock;
  try
    if (T>Serv.Maquinas.Count) and Serv.BDAtivo then  
      try Serv.ChecaNumMaq(T, RegistroGlobal.CodLojaAsString, aCE); except end;
      
    with Serv do 
    for I := 0 to Maquinas.Count-1 do with Maquinas[I] do begin
      if T>0 then
        Level := 2 
      else
      if T>-2 then
        Level := 1 else
        Level := 0;
      Dec(T);
    end;
  finally
    Serv.Unlock;
  end;
  Versoes.AjustaVersaoAtual(Direito);
  VerPri := Versoes.Versao;
{$I crypt_end.inc}
end;

procedure TfrmPri.Desativar;
begin
  try
    UDPAdv.Active := False;
    Serv.Ativo := False;
  finally
    AjustaIconeTray;
  end;
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
    imBD.Picture.Assign(ilGrandes.PngImages[3].PngImage);
    lbErroDB.Caption := '';
    lbErroDB.Visible := False;
    Tray.Icon.Assign(ImageOk.Picture.Icon)
  end
  else begin
    imBD.Picture.Assign(ilGrandes.PngImages[4].PngImage);
    if Serv.ErroBD>'' then begin
      lbErroDB.Caption := 'Erro no banco de dados:'+sLineBreak+sLineBreak+'"'+Serv.ErroBD+'"';
      lbErroDB.Visible := True;
    end;
    Tray.Icon.Assign(ImageErro.Picture.Icon);
  end;
end;

function NewWndProc(Handle: HWND; Msg: Integer; wParam, lParam:
Longint): Longint; stdcall;
begin
  { If this is the registered message... }
  if Msg = MessageID then
  begin
    try
      frmPri.RecriaTray;
    except  
      Result := 0;
    end;  
  end else
  { Otherwise, pass message on to old window proc }
    Result := CallWindowProc(WProc, Handle, Msg, wParam, lParam);
end;

procedure SubClassApplication;
begin
  { We subclass Application window procedure so that }
  { Application.OnMessage remains available for user. }
  WProc := TFNWndProc(SetWindowLong(Application.Handle, GWL_WNDPROC,
    Longint(@NewWndProc)));
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
  Timer1.Enabled := FPrimeiro;
  FPrimeiro := False;
  IP := TLocalIPObj.Create;
  try
    edNomeComp.Text := IP.HostName;
    edIPS.Lines.Text := '';
    for I := 0 to IP.IPCount-1 do
      edIPs.Lines.Add(IP.GetIPFromList(I))
  finally
    IP.Free;
  end;
  Paginas.ActivePageIndex := 0;
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
  btnCodLojaClick(nil);
  VG.HideEdit;
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

  MessageID := RegisterWindowMessage('TaskbarCreated');
  if MessageID <>0 then 
    SubClassApplication;
    
finalization
  if WProc <> Nil then
    { Restore old window procedure }
    SetWindowLong(Application.Handle, GWL_WNDPROC, LongInt(WProc));
end.


01RAM:1116730, SEQ:151, COD:9013220000,:3SAO MARCOS,PAC:SARAH CARLA NASCIMEN[CR][LF]TORUA PROF MILTON SANTOS[CR][LF]BL 179/APT 203/CJ VALE DOS LAGOS/APOS SHOPPING[CR][LF]MOT: VOMITOS
01RAM:1116726, SEQ:147, COD:9010926986,:20PARALELA,PAC:RAMANA SANTOS VASCONC[CR][LF]ELOAVENIDA GOVERNADOR LUIS VIANA FILHO[CR][LF]CD.PQ LAGOA VERDE AP 102 BL-E / LD FACULDADE JORGE[CR][LF]MOT: VOMITOS[CR][LF]AT: 22/07/09, VOMITOS[EOT]
