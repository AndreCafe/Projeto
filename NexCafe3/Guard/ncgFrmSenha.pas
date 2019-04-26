unit ncgFrmSenha;

interface                                                                          

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, StdCtrls,
  cxLookAndFeelPainters, cxButtons, Menus, pngimage, ExtCtrls, Buttons,
  PngSpeedButton, LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseLabel, LMDCustomSimpleLabel, LMDSimpleLabel, cxPC,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill, PngBitBtn;

type
  TFrmAlteraSenha = class(TForm)
    LMDPanelFill1: TLMDPanelFill;
    Image1: TImage;
    Paginas: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    LMDSimpleLabel2: TLMDSimpleLabel;
    edSenha1: TEdit;
    btnOk1: TPngBitBtn;
    edSenha2: TEdit;
    lbPrompt2: TLMDSimpleLabel;
    edSenha3: TEdit;
    LMDSimpleLabel4: TLMDSimpleLabel;
    btnOk3: TPngBitBtn;
    btnCancelar1: TPngBitBtn;
    btnCancelar2: TPngBitBtn;
    btnOk2: TPngBitBtn;
    btnCancelar3: TPngBitBtn;
    lbInstr: TLMDSimpleLabel;
    lbInstr2: TLMDSimpleLabel;
    lbOperacao: TLMDSimpleLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelar3Click(Sender: TObject);
    procedure btnOk1Click(Sender: TObject);
    procedure btnOk2Click(Sender: TObject);
    procedure btnOk3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FSenha: String;
  public
    function Editar(aSenha: String; aPag: Integer): String;
    { Public declarations }
  end;

var
  FrmAlteraSenha: TFrmAlteraSenha;

implementation

uses ncErros;

{$R *.dfm}

{ TFrmAlteraSenha }

function TFrmAlteraSenha.Editar(aSenha: String; aPag: Integer): String;
begin
  case aPag of 
    0 : begin
      lbOperacao.Caption := 'Alterar Senha';
      Height := 262;
    end;  
    1 : begin
      lbOperacao.Caption := 'Criar Senha';
      lbInstr2.Visible := True;
    end;  
    2 : begin
      lbOperacao.Caption := 'Confirmar Senha';
      edSenha2.Text := aSenha;
    end;  
  end; 
  lbInstr.Visible := (aPag=2);
  FSenha := aSenha;
  Paginas.ActivePageIndex := aPag;
  ShowModal;
  Result := FSenha;
end;

procedure TFrmAlteraSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAlteraSenha.FormCreate(Sender: TObject);
begin
  FrmAlteraSenha := Self;
end;

procedure TFrmAlteraSenha.FormDestroy(Sender: TObject);
begin
  FrmAlteraSenha := nil;
end;

procedure TFrmAlteraSenha.btnCancelar3Click(Sender: TObject);
begin
  FSenha := '';
  Close;
end;

procedure TFrmAlteraSenha.btnOk1Click(Sender: TObject);
begin
  if FSenha <> edSenha1.Text then
    Raise ENexCafe.Create('Você digitou sua senha ATUAL incorretamente. Certifique-se que está digitando 100% igual a senha original, '+
                          'respeitando letras maiúsculas e minúsculas e também espaços.');
  Paginas.ActivePageIndex := 1; 
  edSenha2.SetFocus;                            
end;

procedure TFrmAlteraSenha.btnOk2Click(Sender: TObject);
begin
  Paginas.ActivePageIndex := 2;
  edSenha3.Text := '';
  edSenha3.SetFocus;
  lbInstr.Visible := False;
end;

procedure TFrmAlteraSenha.btnOk3Click(Sender: TObject);
begin
  if edSenha3.Text <> edSenha2.Text then 
  try
    Raise ENexCafe.Create('As senhas tem que ser digitadas exatamente iguais respeitando letras maiúsculas e minúsculas e também espaços');
  finally
    Paginas.ActivePageIndex := 1;
    edSenha2.Text := '';
    edSenha2.SetFocus;
  end;

  FSenha := edSenha3.Text;
  Close;
end;

procedure TFrmAlteraSenha.FormShow(Sender: TObject);
begin
  case Paginas.ActivePageIndex of
    0 : edSenha1.SetFocus;
    1 : edSenha2.SetFocus;
    2 : edSenha3.SetFocus;
  end;  
end;

end.













