unit uConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxButtons, cxTextEdit, cxLabel;

type
  TFrmConfig = class(TForm)
    cxLabel6: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel7: TcxLabel;
    edRFixo: TcxTextEdit;
    edRTim: TcxTextEdit;
    edROi: TcxTextEdit;
    edRVivo: TcxTextEdit;
    edRClaro: TcxTextEdit;
    edROutros: TcxTextEdit;
    edOOutros: TcxTextEdit;
    edOClaro: TcxTextEdit;
    edOVivo: TcxTextEdit;
    edOOi: TcxTextEdit;
    edOTim: TcxTextEdit;
    edOFixo: TcxTextEdit;
    cxLabel8: TcxLabel;
    btnSalvar: TcxButton;
    btnCancelar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfig: TFrmConfig;

implementation

uses uFrmPri;

{$R *.dfm}

procedure TFrmConfig.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfig.btnSalvarClick(Sender: TObject);
begin
  slConfig.Values['oper_fixo'] := edOFixo.Text;
  slConfig.Values['oper_vivo'] := edOvivo.Text;
  slConfig.Values['oper_tim'] := edOtim.Text;
  slConfig.Values['oper_claro'] := edOClaro.Text;
  slConfig.Values['oper_oi'] := edOoi.Text;
  slConfig.Values['oper_outros'] := edOoutros.Text;
  
  slConfig.Values['rota_fixo'] := edRfixo.Text;
  slConfig.Values['rota_vivo'] := edRvivo.Text;
  slConfig.Values['rota_tim'] := edRtim.Text;
  slConfig.Values['rota_claro'] := edRclaro.Text;
  slConfig.Values['rota_oi'] := edRoi.Text;
  slConfig.Values['rota_outros'] := edRoutros.Text;

  SaveConfig;

  Close;
end;

procedure TFrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmConfig.FormShow(Sender: TObject);
begin
  edOFixo.Text   := Operadora(0);
  edOVivo.Text   := Operadora(1);
  edOClaro.Text  := Operadora(3);
  edOTim.Text    := Operadora(2);
  edOOi.Text     := Operadora(4);
  edOOutros.Text := Operadora(5);

  edRFixo.Text   := Rota(0);
  edRVivo.Text   := Rota(1);
  edRClaro.Text  := Rota(3);
  edRTim.Text    := Rota(2);
  edROi.Text     := Rota(4);
  edROutros.Text := Rota(5);
end;

end.
