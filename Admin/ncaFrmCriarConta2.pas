unit ncaFrmCriarConta2;
{
    ResourceString: Dario 11/03/13
    Nada para para fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncFrmCriarConta, cxPCdxBarPopupMenu, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Menus,
  LMDCustomComponent, LMDSysInfo, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ImgList, cxClasses, StdCtrls, cxButtons, cxDropDownEdit,
  cxCheckBox, cxMaskEdit, cxTextEdit, cxLabel, LMDPNGImage, ExtCtrls,
  cxRadioGroup, cxPC, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, DB, kbmMemTable, LMDStrList,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxBarBuiltInMenu;

type
  TFrmCriarConta2 = class(TFrmCriarConta)
  private
    { Private declarations }
  protected
    procedure showAtivar; override;
    procedure aposAtivar; override;
    procedure salvaLic(aConta, aChaves: String); override;
  public
    { Public declarations }
  end;

var
  FrmCriarConta2: TFrmCriarConta2;

implementation

uses ncaFrmPanTopo, ncaDM;

{$R *.dfm}

{ TFrmCriarConta2 }

procedure TFrmCriarConta2.aposAtivar;
begin
  inherited;
  FrmPanTopo.Mostrar(nil);
end;

procedure TFrmCriarConta2.salvaLic(aConta, aChaves: String);
begin
  inherited;
  Dados.CM.SalvaLic(aConta, aChaves);
end;

procedure TFrmCriarConta2.showAtivar;
begin
  inherited;
  FrmPanTopo.Mostrar(FrmPanTopo.panNaoAtivou);
end;

end.
