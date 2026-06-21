unit uCMSPri;

interface       

uses                 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LMDCustomComponent, LMDWndProcComponent, LMDTrayIcon, StdCtrls,
  ExtCtrls, LMDControl, 
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, Menus, lmdcont, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomSimpleLabel, LMDSimpleLabel, LMDCustomStatusBar, LMDStatusBar,
  LMDIniCtrl, cmClassesBase, cmServBase, cmServCom, jpeg,
  LMDOneInstance, LMDVersionInfo,
  LMDCustomLabel, LMDLabel, cxLookAndFeelPainters, cxControls, cxContainer,
  cxEdit, cxLabel, cxButtons, cxPC, cxStyles, cxGraphics, cxMaskEdit,
  cxMemo, cxVGrid, cxInplaceContainer, cxSpinEdit, cxRadioGroup, pngimage,
  nxllComponent, nxdb, nxdbBackupController, Buttons, PngBitBtn, PngSpeedButton,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, kbmMemTable,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGridBandedTableView,
  cxGridDBBandedTableView, cxButtonEdit, ImgList, PngImageList, cxTextEdit,
  cxDropDownEdit, cxCalendar, LMDStarter, cxGridStrs;

type
  TfrmPri = class(TForm)
    Tray: TLMDTrayIcon;
    ImageErro: TImage;
    ImageOk: TImage;
    ServCom: TCMServComunicacao;
    Serv: TCMServidor;
    Timer1: TTimer;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDOneInstance1: TLMDOneInstance;
    VI: TLMDVersionInfo;
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
    ImageIconeGrande: TImage;
    Label1: TLabel;
    lbTempo: TcxLabel;
    mtChaves: TkbmMemTable;
    mtChavesChave: TStringField;
    mtChavesTipo: TStringField;
    mtChavesVencimento: TStringField;
    dsChaves: TDataSource;
    mtChavesMaquinas: TIntegerField;
    lbVersao: TcxLabel;
    Paginas: TcxPageControl;
    tsRegistro: TcxTabSheet;
    tsLog: TcxTabSheet;
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
    tsNaoReg: TcxTabSheet;
    cxLabel6: TcxLabel;
    btnTesteGratuito: TcxButton;
    btnCodLoja: TcxButton;
    VG: TcxVerticalGrid;
    irCodLoja: TcxEditorRow;
    irEquip: TcxEditorRow;
    irMaq: TcxEditorRow;
    LMDSimplePanel5: TLMDSimplePanel;
    meLog: TMemo;
    PngImageList1: TPngImageList;
    tsBD: TcxTabSheet;
    pagBD: TcxPageControl;
    tsBackup: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    StartFirewall: TLMDStarter;
    Timer3: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrayDblClick(Sender: TObject);
    procedure Backup1Click(Sender: TObject);
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
    procedure Timer3Timer(Sender: TObject);
  private
    { Private declarations }
    FFechar: Boolean;
    FInicio : Cardinal;
    procedure AjustaIconeTray;
    procedure VeSePode(S: String);
    procedure AtivaDesativa;
    procedure DadosLicenca;
    procedure AddLog(S: String);
  public
    procedure RecriaTray;
    { Public declarations }
  end;

var
  frmPri: TfrmPri = nil;

  MessageID: Integer;
  WProc: TFNWndProc = Nil;

implementation

uses uLicExeCryptor, uCMSrvCfgBackup, cmIDRecursos, uCMSFrmLogin,
  uCMSBackup, uFrmCodLoja, uFrmDadosReg, uFrmChave;

const
  SegMS = 1000;
  MinMS = SegMS * 60;
  HorMS = MinMS * 60;
  DiaMS = HorMS * 24;

{$R *.DFM}

procedure TfrmPri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Tray.Active then begin
    Action := caNone;
    PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
  end else begin
    ServCom.Ativo := False;
    Serv.Ativo := False;
    Sleep(500);
  end;    
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
  if mtChaves.RecordCount>0 then begin
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
  end;
end;

procedure TfrmPri.btnFecharClick(Sender: TObject);
begin
  FFechar := True;
  VeSePode('Encerrar CM-Server');
end;

procedure TfrmPri.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TfrmPri.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Tray.Active := True;
  if not Serv.Ativo then
    AtivaDesativa;
  DadosLicenca;  
  if Serv.Ativo then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
  TFrmCopia.Create(Self).panPri.Parent := tsBackup;
end;

procedure TfrmPri.FormCreate(Sender: TObject);
begin
  Timer1.Enabled := True;
  VersaoCMServer := VI.FileVersion;
  lbVersao.Caption := 'Versão'+sLineBreak+VI.FileVersion;
  AddLog('Iniciado');
  FInicio := GetTickCount;
end;

procedure TfrmPri.TrayDblClick(Sender: TObject);
begin
  Application.Restore;
  Application.BringToFront;
  Visible := True;
end;

procedure TfrmPri.Backup1Click(Sender: TObject);
begin
  TFrmBackup.Create(Self).ShowModal;
end;

procedure TfrmPri.LMDOneInstance1Custom(Sender: TObject);
begin
  Timer1.Enabled := False;
  Beep;
  ShowMessage('Já existe um servidor Cyber Manager sendo executado!');
  Application.Terminate;
end;

procedure TfrmPri.VeSePode(S: String);
var I : Integer;
begin
  if Serv.Ativo then begin
    I := TFrmLogin.Create(nil).PodeFechar(not Serv.TodosPerm(daMaqFecharCMServer), S);
    if I=1 then
      Serv.ShutdownMaq(0, 2);
  end;
  Timer2.Enabled := (not Serv.Ativo) or (I>=0);
end;

procedure TfrmPri.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  if FFechar then begin
    Tray.Active := False;
    Close;
  end else
    AtivaDesativa;
end;

procedure TfrmPri.Timer3Timer(Sender: TObject);
begin
  Timer3.Enabled := False;
  Timer3.Interval := 120000;
  Timer3.Enabled := True;
  StartFirewall.Execute;
end;

procedure TfrmPri.AtivaDesativa;
begin
  ServCom.Ativo := not ServCom.Ativo;
  Serv.Ativo := ServCom.Ativo;
  AjustaIconeTray;
end;

procedure TfrmPri.btnMinimizarClick(Sender: TObject);
begin
  Application.Minimize;
  PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TfrmPri.btnTesteGratuitoClick(Sender: TObject);
begin
  TFrmDadosReg.Create(Self).ShowModal;
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
    St := IntToStr(D) + ' dias, '
  else
    St := '1 dia, ';
  St := St + IntToStr(H) + 'h, ' +
        IntToStr(M) + 'm, ' +
        IntToStr(S) + 's';
  lbTempo.Caption := 'Tempo Execução: ' + St;
//  DadosLicenca;
end;

procedure TfrmPri.DadosLicenca;
var 
  I, Q, T : Integer;
  TC : TTipoChave;
begin
{$I crypt_start.inc}
  irEquip.Properties.Value := RegistroGlobal.CodigoEquip;
  with RegistroGlobal do 
  if (CodLoja < 1) or (CodLoja>9999) then begin
    pgRegistro.ActivePageIndex := 1;
    irCodLoja.Properties.Value := '';
    irMaq.Properties.Value := 'Nenhuma';
    tsRegistro.ImageIndex := 2;
    T := 2;
  end else begin
    irCodLoja.Properties.Value := RegistroGlobal.CodLojaAsString;
    pgRegistro.ActivePageIndex := 0;
    mtChaves.Active := True;
    mtChaves.EmptyTable;
    T := 0;
    lbMsgExp.Visible := (RegistroGlobal.NumChaves<1);
    btnApagaKey.Enabled := not lbMsgExp.Visible; 
    with RegistroGlobal do
    for I := 0 to NumChaves-1 do begin
      Q := Chaves[I].ChaveValida(CodLoja, CodigoEquip, TC);
      if (Q<1) or (Q>2000) or (not (TC in [tcTemporaria, tcDefinitiva, tcTeste, tcLocacao])) then 
        Q := 0;
      
      mtChaves.Insert;
      mtChavesChave.Value := Chaves[I].AsString;
      if Q = 0  then
        mtChavesTipo.Value := 'Inválida'
      else begin
        mtChavesTipo.Value := TipoChaveStr[TC];
        if TC=tcDefinitiva then begin
          mtChavesVencimento.Value := 'Nunca';
          T := T + Q;
        end else begin
          mtChavesVencimento.Value := FormatDateTime('dd/mm/yyyy', Chaves[I].Vencimento);
          if not Chaves[I].Venceu then
            T := T + Q;
        end;  
      end;
      mtChavesMaquinas.Value := Q;
      mtChaves.Post;
    end;
    
    if T > 0 then begin
      irMaq.Properties.Value := IntToStr(T);
      irMaq.Styles.Content := cxsVerde;
      tsRegistro.ImageIndex := 0;
    end else begin
      irMaq.Properties.Value := 'Nenhuma';
      irMaq.Styles.Content := cxsVermelho;
      tsRegistro.ImageIndex := 1;
    end;
    if T<2 then T := 2;
  end;

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
{$I crypt_end.inc}
end;

procedure TfrmPri.AddLog(S: String);
begin
  meLog.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss - ', Now) + S);
end;

procedure TfrmPri.AjustaIconeTray;
begin
  if Serv.Ativo then
    Tray.Icon.Assign(ImageOk.Picture.Icon)
  else   
    Tray.Icon.Assign(ImageErro.Picture.Icon);
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
  end
  { Otherwise, pass message on to old window proc }
  else
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
  frmPri := nil;
end;

procedure TfrmPri.irCodLojaEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  btnCodLojaClick(nil);
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
