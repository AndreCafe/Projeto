unit ncaFrmFechar;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxLabel, LMDPNGImage, ExtCtrls, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxTextEdit, cxCurrencyEdit, cxMemo, cxGraphics, cxLookAndFeels;

type
  TFrmFecharCaixa = class(TForm)
    panReiniciar: TLMDSimplePanel;
    Image2: TImage;
    LMDSimplePanel6: TLMDSimplePanel;
    lbOperacao: TcxLabel;
    cxLabel1: TcxLabel;
    edSaldoF: TcxCurrencyEdit;
    lbSaldoC: TcxLabel;
    edSaldoC: TcxCurrencyEdit;
    lbQuebra: TcxLabel;
    edQuebra: TcxCurrencyEdit;
    lbCalc: TcxLabel;
    Timer1: TTimer;
    LMDSimplePanel1: TLMDSimplePanel;
    btnCancelar: TcxButton;
    btnOk: TcxButton;
    edObs: TcxMemo;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edIDLoja: TcxTextEdit;
    btnConfig: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure edSaldoFPropertiesChange(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Fechar(var Saldo: Currency; var Obs, IDLoja: String): Boolean;
  end;

var
  FrmFecharCaixa: TFrmFecharCaixa;

implementation

uses ncDMCaixa, ncClassesBase, ncaDM, ncIDRecursos, ncaFrmPri,
  ncaFrmConfigCaixaFechamento, ufmImagens;

// START resource string wizard section
resourcestring
  SSeuCaixaN„oEst·BatendoEst·Sobran = 'Seu caixa n„o est· batendo. Est· sobrando ';
  SDesejaRealmenteFecharComEssaDife = '. Deseja realmente fechar com essa diferenÁa?';
  SSeuCaixaN„oEst·BatendoEst·Faltan = 'Seu caixa n„o est· batendo. Est· faltando ';
  SDesejaRealmenteFecharOCaixa = 'Deseja realmente fechar o caixa?';
  SQuebraDeCaixaEst·Sobrando = 'Quebra de caixa. Est· sobrando:';
  SQuebraDeCaixaEst·Faltando = 'Quebra de caixa. Est· faltando:';

// END resource string wizard section


{$R *.dfm}

procedure TFrmFecharCaixa.btnConfigClick(Sender: TObject);
begin
  TFrmConfigCaixaFechamento.Create(Self).ShowModal;
end;

procedure TFrmFecharCaixa.btnOkClick(Sender: TObject);
begin
  if lbSaldoC.Visible then begin
    if (edQuebra.EditValue<>null) and ((edQuebra.Value>0) or (edQuebra.Value<0)) then
      if edQuebra.Value>0 then begin
        if not SimNao(SSeuCaixaN„oEst·BatendoEst·Sobran + edQuebra.EditingText +SDesejaRealmenteFecharComEssaDife) then
          Exit;
      end else
        if not SimNao(SSeuCaixaN„oEst·BatendoEst·Faltan + edQuebra.EditingText +SDesejaRealmenteFecharComEssaDife) then
          Exit;
  end;

  if not SimNao(SDesejaRealmenteFecharOCaixa) then Exit;

  ModalResult := mrOk;
end;

procedure TFrmFecharCaixa.edSaldoFPropertiesChange(Sender: TObject);
begin
  edSaldoF.PostEditValue;
  if (edSaldoF.EditValue=null) or (edSaldoC.EditValue=null) then
    edQuebra.EditValue := null 
  else begin
    edQuebra.Value := edSaldoF.Value - edSaldoC.Value;
    if edQuebra.Value>0 then begin
      lbQuebra.Caption := SQuebraDeCaixaEst·Sobrando;
      lbQuebra.Style.TextColor := clNavy;
    end else 
    if edQuebra.Value<0 then begin
      lbQuebra.Caption := SQuebraDeCaixaEst·Faltando;
      lbQuebra.Style.TextColor := clRed;
    end;
    lbQuebra.Visible := (edQuebra.Value>0) or (edQuebra.Value<0);
    edQuebra.Visible := lbQuebra.Visible;
      
    edQuebra.Style.TextColor := lbQuebra.Style.TextColor;
  end;
end;

function TFrmFecharCaixa.Fechar(var Saldo: Currency; var Obs, IDLoja: String): Boolean;
begin
  ShowModal;
  edIDLoja.PostEditValue;
  if ModalResult=mrOk then begin
    Result := True;
    Saldo := edSaldoF.Value;
    Obs := edObs.Text;
    IDLoja := edIDLoja.Text;
  end else
    Result := False;
end;

procedure TFrmFecharCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmFecharCaixa.FormCreate(Sender: TObject);
begin
  btnConfig.Enabled := Dados.CM.UA.Admin;
  if (not gConfig.PedirSaldoF) or (not Permitido(daCaiVerAtual)) then begin
    lbSaldoC.visible := False;
    lbCalc.Visible := False;
    lbQuebra.Visible := False;
    edQuebra.Visible := False;
    edSaldoC.Visible := False;
  end;
end;

procedure TFrmFecharCaixa.FormShow(Sender: TObject);
begin
  Timer1.Enabled := lbSaldoC.Visible;
end;

procedure TFrmFecharCaixa.Timer1Timer(Sender: TObject);
var DMC: TdmCaixa;
begin
  Timer1.Enabled := False;
    DMC := TdmCaixa.Create(Self);
    try
      DMC.nxSession.ServerEngine := Dados.RSE;
      DMC.AbreConn;
      edSaldoC.Value := DMC.Processa(ncaDM.NumAberto, False, 0, 0);
      Self.edSaldoFPropertiesChange(nil);
    finally
      lbCalc.Visible := False;
      DMC.Free;
    end;
end;

end.

