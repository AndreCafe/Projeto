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
  am2000menuitem, am2000utils, am2000popupmenu, am2000, am2000options,
  am2000skin, am2000mainmenu, LMDOneInstance, LMDVersionInfo,
  LMDCustomLabel, LMDLabel;

type
  TfrmPri = class(TForm)
    Tray: TLMDTrayIcon;
    Image1: TImage;
    Image2: TImage;
    LMDBitmapList1: TLMDBitmapList;
    ServCom: TCMServComunicacao;
    Serv: TCMServidor;
    Timer1: TTimer;
    LMDSimplePanel1: TLMDSimplePanel;
    btnAtivar: TLMDSpeedButton;
    Image3: TImage;
    PopupMenu20001: TPopupMenu2000;
    Mostrar3: TMenuItem2000;
    Ativar1: TMenuItem2000;
    N2: TMenuItem2000;
    ConfigurarBackupAutomtico2: TMenuItem2000;
    Fechar3: TMenuItem2000;
    LiberarUso1: TMenuItem2000;
    N3: TMenuItem2000;
    AnimatedSkin20001: TAnimatedSkin2000;
    btnFechar: TLMDSpeedButton;
    MainMenu20001: TMainMenu2000;
    miAtivar: TMenuItem2000;
    MenuItem1: TMenuItem2000;
    MenuItemConfigurarbackupautomtico1: TMenuItem2000;
    MenuItemLiberaruso1: TMenuItem2000;
    N1: TMenuItem2000;
    MenuItemFechar1: TMenuItem2000;
    LMDOneInstance1: TLMDOneInstance;
    VI: TLMDVersionInfo;
    lbVersao: TLMDLabel;
    Timer2: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAtivarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrayDblClick(Sender: TObject);
    procedure miLiberarUsoClick(Sender: TObject);
    procedure Backup1Click(Sender: TObject);
    procedure LMDOneInstance1Custom(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
    FFechar: Boolean;
    procedure LiberarUso;
    procedure VeSePode(S: String);
    procedure AtivaDesativa;
  public
    { Public declarations }
  end;

var
  frmPri: TfrmPri;

implementation

uses uCMFrmChave, uCMSrvCfgBackup, cmIDRecursos, uCMSFrmLogin;

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

procedure TfrmPri.btnAtivarClick(Sender: TObject);
begin
  if not Serv.Ativo then
    AtivaDesativa
  else
    VeSePode('Desativar CM-Server');
end;

procedure TfrmPri.btnFecharClick(Sender: TObject);
begin
  FFechar := True;
  VeSePode('Fechar CM-Server');
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
  btnAtivarClick(nil);
  if Serv.Ativo then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TfrmPri.FormCreate(Sender: TObject);
begin
  Timer1.Enabled := True;
  lbVersao.Caption := 'Versão ' + VI.FileVersion;
end;

procedure TfrmPri.TrayDblClick(Sender: TObject);
begin
  Application.Restore;
  Application.BringToFront;
end;

procedure TfrmPri.LiberarUso;
var S: String;
begin
  S := TFrmChave.Create(Self).Liberar(LicencaGlobal.AsString);
  if LicencaGlobal.AsString <> S then
    Serv.SalvaLicenca(S);
//  LiberarUso1.Enabled := (Serv.ModoDemo<>mdLiberado) or (Serv.NumMaq<>5000);
end;

procedure TfrmPri.miLiberarUsoClick(Sender: TObject);
begin
  LiberarUso;
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
    I := TFrmLogin.Create(nil).PodeFechar(not Serv.TodosPerm(reMaquinas, taMaqFecharCMServer), S);
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

  if Serv.Ativo then begin
    Color := clGreen;
    btnAtivar.Caption := '&Desativar';
    btnAtivar.Font.Color := clGreen;
    btnAtivar.ListIndex := 0;
    Tray.Icon.Assign(Image2.Picture.Icon);
  end else begin
    Color := clRed;
    btnAtivar.Caption := 'A&tivar';
    btnAtivar.Font.Color := clRed;
    btnAtivar.ListIndex := 1;
    Tray.Icon.Assign(Image1.Picture.Icon);
  end;
  Ativar1.Caption := btnAtivar.Caption;
end;

end.
