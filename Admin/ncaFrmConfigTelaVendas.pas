unit ncaFrmConfigTelaVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmBaseOpcaoImgTxt, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Menus, cxTextEdit, cxMaskEdit,
  cxSpinEdit, StdCtrls, cxRadioGroup, cxButtons, cxLabel, PngImage, ExtCtrls,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, cxCheckBox;

type
  TFrmConfigTelaVendas = class(TFrmBaseOpcaoImgTxt)
    rbComecarPorProduto: TcxRadioButton;
    rbComecarPorQtd: TcxRadioButton;
    cbNaoPassarQtd: TcxCheckBox;
    cbDesligaBuscaAuto: TcxCheckBox;
    procedure rbComecarPorQtdClick(Sender: TObject);
  private
    { Private declarations }
    procedure AjustaNaoPassar;
  public
    { Public declarations }
    procedure Ler; override;
    procedure Salvar; override;
    function Alterou: Boolean; override;

    procedure Renumera; override;

    function NumItens: Integer; override;
  end;

var
  FrmConfigTelaVendas: TFrmConfigTelaVendas;

implementation

uses ncaFrmPri, ncaDM;

{$R *.dfm}

{ TFrmConfigTelaVendas }

procedure TFrmConfigTelaVendas.AjustaNaoPassar;
begin
  cbNaoPassarQtd.Visible := rbComecarPorProduto.Checked;
end;

function TFrmConfigTelaVendas.Alterou: Boolean;
begin
  Result := True;
  if StrToIntDef(slConfig.Values['ComecarPor'], 0) <> Byte(rbComecarPorQtd.Checked) then Exit;
  if (slConfig.Values['NaoPassarQtd']='1') <> cbNaoPassarQtd.Checked then Exit;
  if (slConfig.Values['DesligaBuscaAuto']='1') <> cbDesligaBuscaAuto.Checked then Exit;
  
  Result := False;
end;

procedure TFrmConfigTelaVendas.Ler;
begin
  inherited;
  if slConfig.Values['ComecarPor']='1' then
    rbComecarPorQtd.Checked := True else
    rbComecarPorProduto.Checked := True;
  cbNaoPassarQtd.Checked := (slConfig.Values['NaoPassarQtd']='1');
  cbDesligaBuscaAuto.Checked := (slConfig.Values['DesligaBuscaAuto']='1');
  AjustaNaoPassar;
end;

function TFrmConfigTelaVendas.NumItens: Integer;
begin
  Result := 3;
end;

procedure TFrmConfigTelaVendas.rbComecarPorQtdClick(Sender: TObject);
begin
  inherited;
  AjustaNaoPassar;
end;

procedure TFrmConfigTelaVendas.Renumera;
begin
  inherited;
  RenumRB(rbComecarPorProduto, 0);
  RenumRB(rbComecarPorQtd, 1);
  RenumCB(cbDesligaBuscaAuto, 2);
end;

procedure TFrmConfigTelaVendas.Salvar;
begin
  inherited;
  if rbComecarPorProduto.Checked then
    slConfig.Values['ComecarPor'] := '0' else
    slConfig.Values['ComecarPor'] := '1';
  slConfig.Values['NaoPassarQtd'] := IntToStr(Byte(cbNaoPassarQtd.Checked));
  slConfig.Values['DesligaBuscaAuto'] := IntToStr(Byte(cbDesligaBuscaAuto.Checked));
  SaveConfig;
end;

end.
