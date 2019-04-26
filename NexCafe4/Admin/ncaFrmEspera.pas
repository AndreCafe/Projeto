unit ncaFrmEspera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, ncListaEspera, cxTextEdit, cxContainer,
  cxEdit, cxLabel, cxPC, cxControls, StdCtrls, cxRadioGroup, cxMaskEdit,
  cxDropDownEdit, ncafbPesqCli, ExtCtrls, cxClasses, LMDControl;

type
  TFrmEspera = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    BarMgr: TdxBarManager;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    LMDSimplePanel2: TLMDSimplePanel;
    panTipoCli: TLMDSimplePanel;
    rbAvulso: TcxRadioButton;
    rbCad: TcxRadioButton;
    Paginas: TcxPageControl;
    tsAvulso: TcxTabSheet;
    tsCad: TcxTabSheet;
    cxLabel1: TcxLabel;
    edAvulso: TcxTextEdit;
    cxLabel2: TcxLabel;
    edCartao: TcxTextEdit;
    cxLabel3: TcxLabel;
    edCad: TcxPopupEdit;
    lbObs: TcxLabel;
    edObs: TcxTextEdit;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edCadPropertiesInitPopup(Sender: TObject);
    procedure edCadPropertiesCloseUp(Sender: TObject);
    procedure rbAvulsoClick(Sender: TObject);
    procedure rbCadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edCadEnter(Sender: TObject);
  private
    FNovo : Boolean;
    FEsp  : TncItemListaEspera;
    FRes  : Boolean;
    FDC   : TDadosCliente;

    procedure SetCliente(Value: Integer);
    { Private declarations }
  public
    function Editar(aNovo: Boolean; aEsp: TncItemListaEspera): Boolean;
    { Public declarations }
  end;

var
  FrmEspera: TFrmEspera;

implementation

uses ncaDM, ncaFrmPri;

{$R *.dfm}

procedure TFrmEspera.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEspera.cmGravarClick(Sender: TObject);
begin
  FRes := True;
  if rbAvulso.Checked then begin
    FEsp.ilCliente := 0;
    FEsp.ilNomeCliente := edAvulso.Text;
  end else begin
    FEsp.ilCliente := FDC.dcCodigo;
    FEsp.ilNomeCliente := edCad.Text;
  end;
  FEsp.ilCartao := edCartao.Text;
  FEsp.ilObs    := edObs.Text;
  Close;
end;

procedure TFrmEspera.edCadEnter(Sender: TObject);
begin
  edCad.DroppedDown := True;
end;

procedure TFrmEspera.edCadPropertiesCloseUp(Sender: TObject);
begin
  SetCliente(FDC.dcCodigo);
end;

procedure TFrmEspera.edCadPropertiesInitPopup(Sender: TObject);
begin
  edCad.Properties.PopupControl := fbPesqCli;
  fbPesqCli.PreparaBusca(@FDC, edCad);
end;

function TFrmEspera.Editar(aNovo: Boolean; aEsp: TncItemListaEspera): Boolean;
begin
  FNovo := aNovo;
  FEsp := aEsp;
  FRes := False;
  FDC.dcCodigo := FEsp.ilCliente;
  edCartao.Text := FEsp.ilCartao;
  edAvulso.Text := FEsp.ilNomeCliente;
  edObs.Text := FEsp.ilObs;
  SetCliente(FDC.dcCodigo);

  if not FNovo then
    rbCad.Checked := (FEsp.ilCliente>0) else
    rbCad.Checked := Dados.CM.Config.CliCadPadrao;
  rbAvulso.Checked := not rbCad.Checked;  
  ShowModal;
  Result := FRes;
end;

procedure TFrmEspera.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmEspera.FormShow(Sender: TObject);
begin
  if rbCad.Checked then
    rbCadClick(nil) else
    rbAvulsoClick(nil);
end;

procedure TFrmEspera.rbAvulsoClick(Sender: TObject);
begin
  Paginas.ActivePageIndex := 0;
  Timer1.Enabled := True;
end;

procedure TFrmEspera.rbCadClick(Sender: TObject);
begin
  Paginas.ActivePageIndex := 1;
  Timer1.Enabled := True;
end;

procedure TFrmEspera.SetCliente(Value: Integer);
var V: Variant;
begin
//  if Value = FEsp.ilCliente then Exit;
  FEsp.ilCliente := Value;
  with Dados do 
  if Value=0 then
    edCad.Text := '' 
  else
  if tbCli.Locate('ID', Value, []) then
    edCad.Text := tbCliNome.Value else
    edCad.Text := '** ERRO: Cliente não encontrado';
end;

procedure TFrmEspera.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if rbCad.Checked then
    edCad.SetFocus else
    edAvulso.SetFocus;
end;

end.
