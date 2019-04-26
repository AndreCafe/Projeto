unit ncaFrmAbrirCx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxLabel, LMDPNGImage, ExtCtrls, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxTextEdit, cxCurrencyEdit;

type
  TFrmAbrirCaixa = class(TForm)
    panReiniciar: TLMDSimplePanel;
    Image2: TImage;
    LMDSimplePanel6: TLMDSimplePanel;
    lbOperacao: TcxLabel;
    btnCancelar: TcxButton;
    btnOk: TcxButton;
    cxLabel1: TcxLabel;
    edSaldoI: TcxCurrencyEdit;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Abrir(var Saldo: Currency): Boolean;
  end;

var
  FrmAbrirCaixa: TFrmAbrirCaixa;

implementation

uses ncDMCaixa, ncClassesBase, ncaDM, ncIDRecursos, ncaFrmPri;

{$R *.dfm}

procedure TFrmAbrirCaixa.btnOkClick(Sender: TObject);
begin
  edSaldoI.PostEditValue;

  if not SimNao('Deseja realmente abrir o caixa?') then Exit;

  ModalResult := mrOk;
end;

function TFrmAbrirCaixa.Abrir(var Saldo: Currency): Boolean;
begin
  ShowModal;
  if ModalResult=mrOk then begin
    Saldo := edSaldoI.EditValue;
    Result := True;
  end else
    Result := False;
end;

procedure TFrmAbrirCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
