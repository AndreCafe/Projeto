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
  cxMemo, cxVGrid, cxInplaceContainer, cxSpinEdit, cxRadioGroup, pngimage;

type
  TfrmPri = class(TForm)
    Tray: TLMDTrayIcon;
    ImageErro: TImage;
    ImageOk: TImage;
    ServCom: TCMServComunicacao;
    Serv: TCMServidor;
    Timer1: TTimer;
    LMDSimplePanel1: TLMDSimplePanel;
    Image3: TImage;
    VI: TLMDVersionInfo;
    Timer2: TTimer;
    btnFechar: TcxButton;
    btnMinimizar: TcxButton;
    TimerTempo: TTimer;
    Paginas: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    btnAlteraLic: TcxButton;
    cxLabel3: TcxLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxsNegrito: TcxStyle;
    cxsAmarelo: TcxStyle;
    cxsVerde: TcxStyle;
    cxsVermelho: TcxStyle;
    VG: TcxVerticalGrid;
    irVersao: TcxEditorRow;
    irIniciado: TcxEditorRow;
    irTempo: TcxEditorRow;
    irCodLoja: TcxEditorRow;
    irLicenca: TcxEditorRow;
    ImageIconeGrande: TImage;
    btnBackup: TcxButton;
    LMDOneInstance1: TLMDOneInstance;
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
    procedure btnAlteraLicClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
  private
    { Private declarations }
    FFechar: Boolean;
    FInicio : Cardinal;
    procedure AjustaIconeTray;
    procedure LiberarUso;
    procedure VeSePode(S: String);
    procedure AtivaDesativa;
    procedure DadosLicenca;
  public
    procedure RecriaTray;
    { Public declarations }
  end;

var
  frmPri: TfrmPri = nil;

  MessageID: Integer;
  WProc: TFNWndProc = Nil;

implementation

uses uLicenca, uFrmRegistro, uCMSrvCfgBackup, cmIDRecursos, uCMSFrmLogin,
  uCMSBackup;

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
  
  if LicencaGlobal.EmModoDemo then LiberarUso;
  
  Tray.Active := True;
  if not Serv.Ativo then
    AtivaDesativa;
  DadosLicenca;  
  if Serv.Ativo then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TfrmPri.FormCreate(Sender: TObject);
begin
  LicencaGlobal.LeArquivoPadrao;
  Timer1.Enabled := True;
  VersaoCMServer := VI.FileVersion;
  irVersao.Properties.Value := VI.FileVersion;
  irIniciado.Properties.Value := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
  FInicio := GetTickCount;
end;

procedure TfrmPri.TrayDblClick(Sender: TObject);
begin
  Application.Restore;
  Application.BringToFront;
end;

procedure TfrmPri.LiberarUso;
var 
  S: String;
  L: TLicenca;
begin
  S := TFrmRegistro.Create(nil).EditaLicenca(LicencaGlobal.AsString, False);
  if LicencaGlobal.AsString <> S then
    Serv.SalvaLicenca(S);
//  LiberarUso1.Enabled := (Serv.ModoDemo<>mdLiberado) or (Serv.NumMaq<>5000);
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

procedure TfrmPri.AtivaDesativa;
begin
  ServCom.Ativo := not ServCom.Ativo;
  Serv.Ativo := ServCom.Ativo;
  AjustaIconeTray;
end;

procedure TfrmPri.btnMinimizarClick(Sender: TObject);
begin
  PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
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
  irTempo.Properties.Value := St;
  DadosLicenca;      
end;

procedure TfrmPri.DadosLicenca;
begin
  Paginas.ActivePageIndex := 1;
  with LicencaGlobal do begin
    irCodLoja.Properties.Value := CodLojaAsString;
    if SenhaOk then begin
      case liTipo of
        tlTemporaria : begin
          if (Now - liVencimento) >= 1 then begin
            irLicenca.Properties.Value := 'Temporária. Expirou. Funcionando em Modo Demonstração';
            irLicenca.Styles.Content := cxsVermelho;
          end else begin
            irLicenca.Properties.Value := IntToStr(liMaquinas) + ' máquinas. Temporária. Expira em ' + FormatDateTime('dd/mm/yyyy', liVencimento);
            irLicenca.Styles.Content := cxsAmarelo;
          end;  
        end;  
        tlDefinitiva : begin
          irLicenca.Properties.Value := IntToStr(liMaquinas) + ' máquinas. Definitiva. Nunca Expira';
          irLicenca.Styles.Content := cxsVerde;
        end;  
        tlTeste      : begin
          irLicenca.Properties.Value := IntToStr(liMaquinas) + ' máquinas. Teste Gratuito. Expira em ' + FormatDateTime('dd/mm/yyyy', liVencimento);
          irLicenca.Styles.Content := cxsAmarelo;
        end;  
      else
        irLicenca.Properties.Value := 'Não Licenciado. Funcionando em Modo Demonstração';
        irLicenca.Styles.Content := cxsVermelho;
      end;  
    end else begin
      irLicenca.Properties.Value := 'Não Licenciado. Funcionando em Modo Demonstração';
      irLicenca.Styles.Content := cxsVermelho;
    end;
  end;    
end;

procedure TfrmPri.btnAlteraLicClick(Sender: TObject);
begin
  LiberarUso;
end;

procedure TfrmPri.btnBackupClick(Sender: TObject);
begin
  TFrmCopia.Create(nil).ShowModal;
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

procedure TfrmPri.RecriaTray;
var A, S: Boolean;
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
  MessageID := RegisterWindowMessage('TaskbarCreated');
  if MessageID <>0 then 
    SubClassApplication;
    
finalization
  if WProc <> Nil then
    { Restore old window procedure }
    SetWindowLong(Application.Handle, GWL_WNDPROC, LongInt(WProc));
end.
