unit uCadastros_FrmCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxLabel, StdCtrls;

type
  TFrmCidade = class(TForm)
    Button1: TButton;
    Button2: TButton;
    lbCidade: TcxLabel;
    cxLabel1: TcxLabel;
    edCidade: TcxTextEdit;
    edUF: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    function LeCidadeUF(var aCidade, aUF: String): Boolean;
    { Public declarations }
  end;

var
  FrmCidade: TFrmCidade;

implementation

{$R *.dfm}

procedure TFrmCidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TFrmCidade.LeCidadeUF(var aCidade, aUF: String): Boolean;
begin
  edCidade.Text := aCidade;
  edUF.Text := aUF;

  ShowModal;

  Result := (ModalResult=mrOk) and (
            (edCidade.Text <> aCidade) or
            (edUF.Text <> aUF));
  if Result then begin
    aCidade := edCidade.Text;
    aUF := edUF.Text;
  end;            
end;

end.
