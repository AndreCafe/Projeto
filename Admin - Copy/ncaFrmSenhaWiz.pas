unit ncaFrmSenhaWiz;
{
    ResourceString: Dario 11/03/13
}

interface                                                                          

uses
  Windows, Messages, ncErros, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, StdCtrls,
  cxLookAndFeelPainters, cxButtons, Menus, pngimage, ExtCtrls, cxGraphics,
  cxLookAndFeels, LMDPNGImage, LMDSimplePanel, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomPanelFill,
  LMDPanelFill;

type
  TFrmSenhaWiz = class(TForm)
    edNova: TcxTextEdit;
    lbNovaSenha: TcxLabel;
    edConfirma: TcxTextEdit;
    lbConfirmarSenha: TcxLabel;
    cxLabel4: TcxLabel;
    btnAlterar: TcxButton;
    btnCancelar: TcxButton;
    Timer1: TTimer;
    LMDPanelFill1: TLMDPanelFill;
    Image3: TImage;
    cxLabel1: TcxLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDSimplePanel11: TLMDSimplePanel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
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

uses ncaFrmPri, ncaDM;

// START resource string wizard section
resourcestring
  SAsSenhasNãoEstãoIguais = 'As senhas não estão iguais.';

// END resource string wizard section


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
  if not Sametext(edNova.Text, edConfirma.Text) then begin      
    edNova.SetFocus;
    Raise Exception.Create(SAsSenhasNãoEstãoIguais);
  end;
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
  Timer1.Enabled := SameText(ParamStr(1), 'afterinst'); // do not localize
  edNova.SetFocus;
end;

procedure TFrmSenhaWiz.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  try
    ForceForegroundWindow(Handle);
  finally
    Timer1.Interval := 5000;
    Timer1.Enabled := True;
  end;
end;

procedure TFrmSenhaWiz.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Key_Enter) then 
    Perform(WM_NEXTDLGCTL,0,0);
end;

end.














