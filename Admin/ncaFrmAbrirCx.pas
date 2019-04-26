unit ncaFrmAbrirCx;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxLabel, LMDPNGImage, ExtCtrls, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxTextEdit, cxCurrencyEdit, cxGraphics, cxLookAndFeels;

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
    btnConfig: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure AplicaConfig;
  public
    { Public declarations }
    function Abrir(var Saldo: Currency): Boolean;
  end;

var
  FrmAbrirCaixa: TFrmAbrirCaixa;

implementation

uses ncDMCaixa, ncClassesBase, ncaDM, ncIDRecursos, ncaFrmPri,
  ncaFrmConfigCaixaAbertura;

// START resource string wizard section
resourcestring
  SDesejaRealmenteAbrirOCaixa = 'Deseja realmente abrir o caixa?';

// END resource string wizard section


{$R *.dfm}

procedure TFrmAbrirCaixa.AplicaConfig;
begin
  edSaldoI.Enabled := (not gConfig.ManterSaldoCaixa) and gConfig.PedirSaldoI;
end;

procedure TFrmAbrirCaixa.btnConfigClick(Sender: TObject);
begin
  if TFrmConfigCaixaAbertura.Create(Self).Editar then begin
    AplicaConfig;
    edSaldoI.EditValue := Dados.SaldoInicialCx;
    if edSaldoI.Enabled then edSaldoI.SetFocus;
  end;
end;

procedure TFrmAbrirCaixa.btnOkClick(Sender: TObject);
begin
  edSaldoI.PostEditValue;

  if not SimNao(SDesejaRealmenteAbrirOCaixa) then Exit;

  ModalResult := mrOk;
end;

function TFrmAbrirCaixa.Abrir(var Saldo: Currency): Boolean;
begin
  edSaldoI.EditValue := Dados.SaldoInicialCx;
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

procedure TFrmAbrirCaixa.FormCreate(Sender: TObject);
begin
  btnConfig.Enabled := Dados.CM.UA.Admin;
end;

procedure TFrmAbrirCaixa.FormShow(Sender: TObject);
begin
  AplicaConfig;
end;

end.

