unit ncaFrmLimiteDebPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, cxLabel, LMDPNGImage, ExtCtrls, StdCtrls, cxButtons,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, cxTextEdit, cxCurrencyEdit;

type
  TFrmLimiteDeb = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    btnOk: TcxButton;
    cxButton2: TcxButton;
    Image1: TImage;
    cxLabel1: TcxLabel;
    edLimite: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLimiteDeb: TFrmLimiteDeb;

implementation

uses ncClassesBase, ncaDM;

{$R *.dfm}

procedure TFrmLimiteDeb.btnOkClick(Sender: TObject);
begin
  edLimite.PostEditValue;
  if edLimite.Value <> gConfig.LimitePadraoDebito then begin
    gConfig.AtualizaCache;
    gConfig.LimitePadraoDebito := edLimite.Value;
    Dados.CM.SalvaAlteracoesObj(gConfig, False);
  end;
  Close;
end;

procedure TFrmLimiteDeb.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmLimiteDeb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmLimiteDeb.FormCreate(Sender: TObject);
begin
  edLimite.Value := gConfig.LimitePadraoDebito;
end;

end.
