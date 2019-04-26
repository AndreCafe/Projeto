unit ncaFrmConfigComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmBaseOpcaoImgTxt, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Menus, cxMaskEdit, cxDropDownEdit,
  cxTextEdit, cxCurrencyEdit, StdCtrls, cxButtons, cxLabel, dxGDIPlusClasses,
  ExtCtrls, LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel;

type
  TFrmConfigComissao = class(TFrmBaseOpcaoImgTxt)
    LMDSimplePanel6: TLMDSimplePanel;
    edComissaoPerc: TcxCurrencyEdit;
    lbComissao: TcxLabel;
    lbComissaoSobre: TcxLabel;
    edComissaoLucro: TcxComboBox;
    btnPremium: TcxButton;
    procedure btnPremiumClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Ler; override;
    procedure Salvar; override;
    function Alterou: Boolean; override;

    procedure Renumera; override;

    function NumItens: Integer; override; 
    { Public declarations }
  end;

var
  FrmConfigComissao: TFrmConfigComissao;

implementation

uses ncaFrmPri, ncClassesBase, ncaDM;

{$R *.dfm}

{ TFrmConfigComissao }

function TFrmConfigComissao.Alterou: Boolean;
begin
  Result := (gConfig.ComissaoPerc <> edComissaoPerc.Value) or
            (gConfig.ComissaoLucro <> (edComissaoLucro.ItemIndex=1));
end;

procedure TFrmConfigComissao.btnPremiumClick(Sender: TObject);
begin
  inherited;
  OpenPremium('comissao');
end;

procedure TFrmConfigComissao.FormCreate(Sender: TObject);
begin
  inherited;
  lbComissao.Enabled := gConfig.IsPremium;
  edComissaoPerc.Enabled := gConfig.IsPremium;
  lbComissaoSobre.Enabled := gConfig.IsPremium;
  edComissaoLucro.Enabled := gConfig.IsPremium;
  btnPremium.Visible := not gConfig.IsPremium;
end;

procedure TFrmConfigComissao.Ler;
begin
  inherited;
  edComissaoPerc.Value := gConfig.ComissaoPerc;
  edComissaoLucro.ItemIndex := Byte(gConfig.ComissaoLucro);
end;

function TFrmConfigComissao.NumItens: Integer;
begin
  Result := 1;
end;

procedure TFrmConfigComissao.Renumera;
begin
  RenumLB(lbComissao, 0);
end;

procedure TFrmConfigComissao.Salvar;
begin
  inherited;
  gConfig.ComissaoPerc := edComissaoPerc.Value;
  gConfig.ComissaoLucro := (edComissaoLucro.ItemIndex=1);
end;

end.
