unit ncaFrmConfigCaixaAbertura;
{
    ResourceString: Dario 11/03/13
    Nada para para fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmBaseOpcao, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxControls, cxContainer, cxEdit, StdCtrls, cxRadioGroup, cxLabel,
  LMDPNGImage, ExtCtrls, cxButtons, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmConfigCaixaAbertura = class(TFrmBaseOpcao)
    img: TImage;
    lbDescr: TcxLabel;
    rbUsuario: TcxRadioButton;
    rbZero: TcxRadioButton;
    rbSaldoAnterior: TcxRadioButton;
  private
    { Private declarations }
    function Op: Integer;
    function OpConfig: Integer;
  public
    procedure Ler; override;
    procedure Salvar; override;
    function Alterou: Boolean; override;

    procedure Renumera; override;
  
    { Public declarations }
  end;

var
  FrmConfigCaixaAbertura: TFrmConfigCaixaAbertura;

implementation

uses ncClassesBase;

{$R *.dfm}

{ TFrmConfigCaixaAbertura }

function TFrmConfigCaixaAbertura.Alterou: Boolean;
begin
  Result := (Op<>OpConfig);
end;

procedure TFrmConfigCaixaAbertura.Ler;
begin
  inherited;
  case OPConfig of
    0 : rbUsuario.Checked := True;
    1 : rbZero.Checked := True;
    2 : rbSaldoAnterior.Checked := True;  
  end;
end;

function TFrmConfigCaixaAbertura.Op: Integer;
begin
  if rbUsuario.Checked then
    Result := 0
  else
  if rbZero.Checked then
    Result := 1
  else
    Result := 2;
end;

function TFrmConfigCaixaAbertura.OpConfig: Integer;
begin
  if gConfig.ManterSaldoCaixa then
    Result := 2 
  else
  if gConfig.PedirSaldoI then
    Result := 0
  else
    Result := 1;
end;

procedure TFrmConfigCaixaAbertura.Renumera;
begin
  inherited;
  lbDescr.Caption := IntToStr(InicioNumItem) + '. ' + lbDescr.Caption;
end;

procedure TFrmConfigCaixaAbertura.Salvar;
begin
  inherited;
  gConfig.ManterSaldoCaixa := (Op=2);
  gConfig.PedirSaldoI := (Op=0);
end;

end.
