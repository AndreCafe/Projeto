unit ncaFrmSenhaWiz;

interface                                                                          

uses
  Windows, Messages, ncErros, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, StdCtrls,
  cxLookAndFeelPainters, cxButtons, Menus, pngimage, ExtCtrls, cxGraphics,
  cxLookAndFeels, LMDPNGImage;

type
  TFrmSenhaWiz = class(TForm)
    edNova: TcxTextEdit;
    lbNovaSenha: TcxLabel;
    edConfirma: TcxTextEdit;
    lbConfirmarSenha: TcxLabel;
    cxLabel4: TcxLabel;
    btnAlterar: TcxButton;
    btnCancelar: TcxButton;
    Image1: TImage;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
  private                                                       
    { Private declarations }
    FSenha : String;
  public
    function Editar(var aSenha: String): Boolean;
    { Public declarations }
  end;

var
  FrmSenhaWiz: TFrmSenhaWiz;

implementation

uses ncaFrmPri;

{$R *.dfm}

{ TFrmAlteraSenha }

function TFrmSenhaWiz.Editar(var aSenha: String): Boolean;
begin
  aSenha := '';
  ShowModal;
  Result := (ModalResult=mrOk);
  if Result then 
    aSenha := FSenha;
end;

procedure TFrmSenhaWiz.btnAlterarClick(Sender: TObject);
begin
  if not Sametext(edNova.Text, edConfirma.Text) then       
    Raise Exception.Create('As senhas não estão iguais.');
  FSenha := edNova.Text;
  ModalResult := mrOk;
end;

procedure TFrmSenhaWiz.btnCancelarClick(Sender: TObject);
begin
  FSenha := '';
  ModalResult := mrOk;
end;

procedure TFrmSenhaWiz.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmSenhaWiz.FormShow(Sender: TObject);
begin
  edNova.SetFocus;  
end;

procedure TFrmSenhaWiz.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Key_Enter) then 
    Perform(WM_NEXTDLGCTL,0,0);
end;

end.













