unit uCMGLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, Buttons, jpeg, 
  cmClassesBase, cmServRemoto, cmCompCliente, LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDCustomComponent, LMDIniCtrl, 
  OvcPF, Menus, 
  ImgList, ShellAPI,
  Db, 
  LMDBaseGraphicControl, LMDGraphicControl, LMDFill, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, oxBtns, dxPageControl, LMDVersionInfo;

type
  TFrmLogin = class(TForm)
    panLoginMaq: TLMDSimplePanel;
    TimerOnTop: TTimer;
    LMDFill1: TLMDFill;
    imFundo: TImage;
    LMDFill3: TLMDFill;
    Paginas: TdxPageControl;
    tsLogin: TdxTabSheet;
    tsErro: TdxTabSheet;
    LMDLabel2: TLMDLabel;
    lbNumMaq: TLMDLabel;
    Image1: TImage;
    LMDFill2: TLMDFill;
    LMDSimplePanel1: TLMDSimplePanel;
    lbFechar: TLMDLabel;
    Label3: TLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    Label2: TLabel;
    Label1: TLabel;
    btnOk: ToxButton;
    edSenha: TEdit;
    edUsername: TEdit;
    panTipoAcesso: TLMDSimplePanel;
    Label4: TLabel;
    cbTipoAcesso: TComboBox;
    BitBtn1: TBitBtn;
    LMDSimplePanel3: TLMDSimplePanel;
    LMDLabel1: TLMDLabel;
    lbMsg: TLMDLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    lbVersao: TLabel;
    Version: TLMDVersionInfo;
    procedure FormResize(Sender: TObject);
    procedure lbFecharMouseEnter(Sender: TObject);
    procedure lbFecharMouseExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure TimerOnTopTimer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FPodeFechar : Boolean;
    { Private declarations }
    procedure RefreshTipoAcesso;
    procedure OnException(Sender: TObject; E: Exception);
  public
    procedure FecharLogin;
    procedure MostraErro(S: String);
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses uCMGPri, CMListaID, cmIDRecursos;

{$R *.DFM}

procedure TFrmLogin.FormResize(Sender: TObject);
begin
  panLoginMaq.Left := ((Width-panLoginMaq.Width) div 2) - 5; 
  panLoginMaq.Top  := ((Height-panLoginMaq.Height) div 2) - 20;
end;

procedure TFrmLogin.OnException(Sender: TObject; E: Exception);
begin
  MostraErro(E.Message);
end;    

procedure TFrmLogin.lbFecharMouseEnter(Sender: TObject);
begin
  lbFechar.Font.Style := [fsUnderline];  
  lbFechar.Font.Color := clNavy;
end;

procedure TFrmLogin.lbFecharMouseExit(Sender: TObject);
begin
  lbFechar.Font.Style := [];  
  lbFechar.Font.Color := clBlack;
end;

procedure TFrmLogin.RefreshTipoAcesso;
var I : Integer;
begin
  with FrmPri, CM, TiposAcesso do
  for I := 0 to pred(Count) do with Itens[I] do
    cbTipoAcesso.Items.AddObject(Nome, TObject(Codigo));
    
  panTipoAcesso.Visible := (cbTipoAcesso.Items.Count>1);
  cbTipoAcesso.ItemIndex := 0;
  btnOk.Enabled := (cbTipoAcesso.Items.Count>0);
end;

procedure TFrmLogin.FormDestroy(Sender: TObject);
begin
  FrmPri.FDesligaAviso := False;
  Application.OnException := nil;
  FrmLogin := nil;
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TimerOnTop.Enabled := False;
  Action := caFree;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
var S : String;
begin
  BorderStyle := bsNone;  
  WindowState := wsMaximized;
  with FrmPri do begin
    lbNumMaq.Caption := IntToStr(CM.Maquina);
    S := slRecursos.Values['FundoTela'];
    if FileExists(S) then
    try
      imFundo.Picture.LoadFromFile(S);
      imFundo.Stretch := (slRecursos.Values['Stretch']='T');
    except
    end;    
  end;  
  edUsername.SetFocus;
end;

procedure TFrmLogin.btnOkClick(Sender: TObject);
var U: TCMUsuario;  
begin
  with FrmPri do
  if Trim(edUsername.Text)>'' then 
  try
{    U := CM.Usuarios.PorUsername[edUsername.Text];
    if (U<>nil) and (edSenha.Text=U.Senha) then 
      Status := stConfig
    else }
      CM.LoginMaq(CM.Maquina, 0, edUsername.Text, edSenha.Text, '', '', 0, 0, 
                  Integer(cbTipoAcesso.Items.Objects[cbTipoAcesso.ItemIndex])); 
      
  except
    on E: Exception do 
      MostraErro(E.Message);
  end;  
end;

procedure TFrmLogin.TimerOnTopTimer(Sender: TObject);
begin
  Left := 0;
  Top := 0;
  Width := Screen.Width;
  Height := Screen.Height;
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, (SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE));
end;

procedure TFrmLogin.BitBtn1Click(Sender: TObject);
begin
  Paginas.ActivePage := tsLogin;
end;

procedure TFrmLogin.MostraErro(S: String);
begin
  Beep;
  lbMsg.Caption := S;
  Paginas.ActivePage := tsErro;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  lbVersao.Caption := 'Versão '+Version.FileVersion;
  FPodeFechar := False;
  RefreshTipoAcesso;
  Paginas.ActivePage := tsLogin;
  Application.OnException := OnException;
end;

procedure TFrmLogin.lbFecharClick(Sender: TObject);
var U: TCMUsuario;  
begin
  with FrmPri do
  if Trim(edUsername.Text)>'' then 
  try
    U := CM.Usuarios.PorUsername[edUsername.Text];
    if (CM.Usuarios.Count=0) or 
       ((U<>nil) and (edSenha.Text=U.Senha) and CM.Permitido(U, reMaquinas, taMaqFecharCMGuard)) then 
      if CM.Ativo then
        CM.Ativo := False
      else
        FecharCMGuard;  
  except
  end;  
end;

procedure TFrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := FPodeFechar;
end;

procedure TFrmLogin.FecharLogin;
begin
  FPodeFechar := True;
  Close;
end;

Initialization
  FrmLogin := nil;

end.
