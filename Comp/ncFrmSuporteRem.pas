unit ncFrmSuporteRem;
{
    ResourceString: Dario 12/03/13
    Nada para fazer
}


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxDropDownEdit, cxLabel, ExtCtrls, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxImageComboBox, ncClassesBase, ShellApi, registry,
  LMDControl, cxLookAndFeels, PngImage, LMDPNGImage;

type
  TFrmSuporte = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    LMDSimplePanel2: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    btnOk: TcxButton;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
  private
    FRes: Boolean;
    function URLEncode(const S: String): String;

    { Private declarations }
  public
    { Public declarations }
    function ObterSuporte(var aMaq: Integer; aAlteraMaq: Boolean; aMaqs: TncListaMaquinas): Boolean;
  end;

var
  FrmSuporte: TFrmSuporte;

const
  Portas : Array[0..1] of Integer = (1975, 1974);  

implementation

{$R *.dfm}

procedure TFrmSuporte.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSuporte.btnOkClick(Sender: TObject);
var
  link, mensagem: String;
begin
  link     := 'https://api.whatsapp.com/send?phone=554896077121';
  mensagem := 'Olá meu email de registro é: ';

  ShellExecute(0, 'open',
    PChar(link + '&text=' + URLEncode(mensagem + gConfig.Conta)),
    nil, nil, SW_SHOWNORMAL);

  Close;
end;

function TFrmSuporte.URLEncode(const S: String): String;
var
  UTF8: AnsiString;
  I: Integer;
  C: Byte;
begin
  Result := '';
  // Converte ANSI (Windows-1252) ? WideString ? UTF-8
  UTF8 := UTF8Encode(WideString(S));
  for I := 1 to Length(UTF8) do begin
    C := Byte(UTF8[I]);
    // Caracteres seguros (RFC 3986): letras, dígitos e - _ . ~
    if C in [Ord('A')..Ord('Z'), Ord('a')..Ord('z'), Ord('0')..Ord('9'),
             Ord('-'), Ord('_'), Ord('.'), Ord('~')] then
      Result := Result + Char(C)
    else
      Result := Result + '%' + IntToHex(C, 2);
  end;
end;

procedure TFrmSuporte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TFrmSuporte.ObterSuporte(var aMaq: Integer; aAlteraMaq: Boolean;
  aMaqs: TncListaMaquinas): Boolean;
var I: Integer;
begin
  ShowModal;
  Result := FRes;
  if FRes then 
    aMaq := 0;
end;

end.



