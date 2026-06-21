unit uFrmLogin;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons,Dialogs, 
  dxBar, DBCtrls, Db,
  kbmMemTable, ExtCtrls,
  OvcBase, OvcEF, OvcSF, {wwdblook,} LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, pngimage, LMDControl;

type
  TFrmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    OvcController1: TOvcController;
    edSenha: TOvcSimpleField;
    Panel1: TPanel;
    edUser: TEdit;
    lbVer: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edSenhaChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses uDTDM, uDTFrmPri;

{$R *.DFM}

procedure TFrmLogin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //FrmPri.Caption := 'Diário do Técnico | '+ NomeTecnico;
  Action:= CaFree;
end;

procedure TFrmLogin.btnOkClick(Sender: TObject);
begin
  if Trim(EdUser.Text) = '' then
  begin
    Beep;
    Panel1.Caption := 'O usuário deve ser informado.';
    edUser.Setfocus;
    Exit;
  end;

  with DM do
  if not tTec.FindKey([edUser.Text]) then begin
    Beep;
    Panel1.Caption := 'Usuário inexistente.';
    edUser.Setfocus;
    Exit;
  end;

  with DM do
  if (UpperCase(edSenha.text) = UpperCase(tTecSenha.Value)) then
  begin
    IDTecnico := tTecID.Value;
    NomeTecnico := tTecNome.Value;
    FrmPri.Caption := 'Diário do Técnico ['+NomeTecnico+']';
    Close;
  end else begin
    Panel1.Caption := 'Senha inválida';
    edSenha.SetFocus;
  end;
end;

procedure TFrmLogin.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := (NomeTecnico > '') or lAbort;
end;

procedure TFrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and
     (not btnOk.Focused) and 
     (not btnCancelar.Focused) then 
  begin
    SelectNext(ActiveControl as TWinControl, True, True);
    Key := #0;
  end;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  lbVer.Caption := DM.GetVer;
  IDTecnico := '';
  NomeTecnico := '';
end;

procedure TFrmLogin.edSenhaChange(Sender: TObject);
begin
  SenhaTec := edSenha.AsString;
end;

procedure TFrmLogin.btnCancelarClick(Sender: TObject);
begin
   lAbort := True;
   Close;
end;

end.

