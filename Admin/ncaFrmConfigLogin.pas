unit ncaFrmConfigLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, 
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Menus, cxTextEdit, StdCtrls,
  cxButtons, cxLabel, cxRadioGroup, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, LMDPNGImage, ExtCtrls;

type
  TFrmConfigLogin = class(TForm)
    rbLocal: TcxRadioButton;
    rbAuto: TcxRadioButton;
    rbManual: TcxRadioButton;
    btnOk: TcxButton;
    cxButton1: TcxButton;
    edManual: TcxTextEdit;
    LMDSimplePanel1: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    panAlerta: TLMDSimplePanel;
    Img: TImage;
    lbMensagem: TcxLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    Image3: TImage;
    procedure rbManualClick(Sender: TObject);
    procedure rbLocalClick(Sender: TObject);
    procedure rbAutoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Update;
  public
    function Mostrar(aMostraAlerta: Boolean): Boolean;
    { Public declarations }
  end;

resourcestring
  rsInformarServidor = 'É necessário informar o nome ou ip do servidor que você deseja conectar ou utilizar a opção de detectar automaticamente';

var
  FrmConfigLogin: TFrmConfigLogin;

implementation

uses ncaConnMgr;

{$R *.dfm}

procedure TFrmConfigLogin.rbLocalClick(Sender: TObject);
begin
  edManual.Visible := False;
  Update;
end;

function TFrmConfigLogin.Mostrar(aMostraAlerta: Boolean): Boolean;
var FSaveServ: String;
begin
  Result := False;
  FrmConfigLogin := Self;
  try
    FSaveServ := gConnMgr.Servidor;
    panAlerta.Visible := aMostraAlerta;
    if SameText(gConnMgr.Servidor, '127.0.0.1') then
      rbLocal.Checked := True
    else
    if SameText(gConnMgr.Servidor, 'auto') then
      rbAuto.Checked := True
    else begin
      rbManual.Checked := True;
      edManual.Visible := True;
      edManual.Text := gConnMgr.Servidor;
    end;
    ShowModal;
    Result := (FSaveServ<>gConnMgr.Servidor);
  finally
    FrmConfigLogin := nil;
  end;
end;

procedure TFrmConfigLogin.rbAutoClick(Sender: TObject);
begin
  edManual.Visible := False;
  Update;
end;

procedure TFrmConfigLogin.rbManualClick(Sender: TObject);
begin
  Update;
  edManual.Visible := True;
  if rbManual.Focused then
    edManual.SetFocus;
end;

procedure TFrmConfigLogin.Update;

function Cor(aChecked: Boolean): TColor;
begin
  if aChecked then
    Result := clBlue else
    Result := $00515151;
end;

begin
  rbLocal.Font.Color := Cor(rbLocal.Checked);
  rbAuto.Font.Color := Cor(rbAuto.Checked);
  rbManual.Font.Color := Cor(rbManual.Checked);
end;

procedure TFrmConfigLogin.btnOkClick(Sender: TObject);
begin
  if rbManual.Checked and (Trim(edManual.Text)='') then 
    raise exception.Create(rsInformarServidor);

  if rbLocal.Checked then
    gConnMgr.Servidor := '127.0.0.1'
  else
  if rbAuto.Checked then
    gConnMgr.Servidor := 'auto'
  else
    gConnMgr.Servidor := Trim(edManual.Text);

  gConnMgr.SaveConfig;
  Close;
end;

procedure TFrmConfigLogin.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfigLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmConfigLogin.FormShow(Sender: TObject);
begin
  Update;
end;

end.


























