unit Password;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons,Dialogs,dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxBar, DBCtrls, Db,
  dxEditor, dxExEdtr, dxDBEdtr, dxDBELib, kbmMemTable, dxEdLib, ExtCtrls,
  lmdcctrl, lmdctrl;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edSenha: TdxEdit;
    MenUser: TkbmMemTable;
    EdUser: TdxDBLookupEdit;
    MenUserusu: TStringField;
    MenUserUsuario: TStringField;
    DataSource1: TDataSource;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswordDlg: TPasswordDlg;

implementation

uses DDados,Principal;

{$R *.DFM}

procedure TPasswordDlg.FormShow(Sender: TObject);
begin
   dados.tbUsuario.IndexName:= 'IUserName';
   edUser.SetFocus;
end;

procedure TPasswordDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FPrincipal.Caption := 'IDTel - [Usuario: '+Usuario+']';
  Action:= CaFree;
  MenUser.close;
end;

procedure TPasswordDlg.btnOkClick(Sender: TObject);
begin
  if Trim(EdUser.Text) = '' then
  begin
    MessageDlg('O usuário deve ser informado.', mtWarning, [mbok], 0);
    edUser.Setfocus;
    Exit;
  end;
  
  if (edSenha.text = dados.tbUsuario.fieldbyname('senha').AsString)  then
  begin
    Usuario := dados.tbUsuario['UserName'];
    Close;
  end else begin
    Showmessage('Senha inválida');
    edSenha.SetFocus;
  end;  
end;

procedure TPasswordDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
  var i: integer;
begin
  if (edSenha.text = dados.tbUsuario.fieldbyname('senha').AsString) then 
    Usuario := dados.tbUsuario['UserName']
  else
    Usuario := '';
end;

procedure TPasswordDlg.FormCreate(Sender: TObject);
begin
  MenUser.Open;
end;

procedure TPasswordDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and 
     (not btnOk.Focused) and 
     (not btnCancelar.Focused) then 
  begin
    SelectNext(ActiveControl as TWinControl, True, True);
    Key := #0;
  end;
end;

end.

