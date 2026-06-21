unit uAFrmFecha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDControl, LMDBaseControl, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, 
  cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxMaskEdit,
  cxCalendar, cxDBLookupComboBox, cxTextEdit, cxImageComboBox,
  cxCurrencyEdit, cxTimeEdit, cxCheckBox, cxMemo, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGridLevel, cxGrid;

type
  TFrmRAF = class(TForm)
    panPri: TLMDSimplePanel;
    LMDSimplePanel1: TLMDSimplePanel;
    btnDetalhamentoCli: TLMDSpeedButton;
    btnCriar: TLMDSpeedButton;
    btnEnviaProtheus: TLMDSpeedButton;
    btnFecharCli: TLMDSpeedButton;
    btnFecharTec: TLMDSpeedButton;
    btnAprovTec: TLMDSpeedButton;
    btnAprovCli: TLMDSpeedButton;
    Grid: TcxGrid;
    glGrid: TcxGridLevel;
    tvGrid: TcxGridDBBandedTableView;
    tvGridID1: TcxGridDBBandedColumn;
    tvGridDHCriacao1: TcxGridDBBandedColumn;
    tvGridDHFechaCli1: TcxGridDBBandedColumn;
    tvGridDHFechaTec1: TcxGridDBBandedColumn;
    tvGridDataI1: TcxGridDBBandedColumn;
    tvGridDataF1: TcxGridDBBandedColumn;
    btnItens: TLMDSpeedButton;
    procedure btnDetalhamentoCliClick(Sender: TObject);
    procedure btnItensClick(Sender: TObject);
    procedure btnEnviaProtheusClick(Sender: TObject);
    procedure btnCriarClick(Sender: TObject);
    procedure btnFecharCliClick(Sender: TObject);
    procedure btnFecharTecClick(Sender: TObject);
    procedure btnAprovCliClick(Sender: TObject);
    procedure btnAprovTecClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRAF: TFrmRAF;

implementation

uses uDMA, uAFrmData, uAFrmItemRA, uDiatecAdmin, uDTSyncDef, uAFrmExp, uDMARels,
  uAFrmRel;

{$R *.dfm}

procedure TFrmRAF.btnCriarClick(Sender: TObject);
var Dia: TDateTime;
begin
  with DM do begin
    if not TFrmData.Create(nil).ObtemData(Dia) then Exit;
    DM.kbmCli.Request('DOWNLOADSVC', '', 'CRIARAF', [Dia]);
    tRAF.Refresh;
  end;
end;

procedure TFrmRAF.btnDetalhamentoCliClick(Sender: TObject);
begin
  Application.CreateForm(TdmRels, dmRels);
  try
    case TFrmTipoRel.Create(nil).ObtemTipoRel of
      0 : dmRels.DetalhamentoCli(DM.tRAFID.Value);
      1 : dmRels.ResumoIntegraCli(Dm.tRAFID.Value);
      2 : dmRels.ResumoIntegraTec(Dm.tRAFID.Value);
    end;
  finally
    dmRels.Free;
  end;
end;

procedure TFrmRAF.btnEnviaProtheusClick(Sender: TObject);
begin
  TFrmExp.Create(Self).ShowModal;
end;

function SimNao(S: String): Boolean;
begin
  Result := (MessageDlg(S, mtConfirmation, [mbYes, mbNo], 0)=mrYes);
end;

procedure TFrmRAF.btnFecharCliClick(Sender: TObject);
begin
  with DM do 
    if SimNao('Deseja realizar o fechamento de clientes ?') and
       SimNao('Apos realizar o fechamento não é mais possível realizar modificações. Deseja continuar?') then
    begin   
      kbmCli.Request('DOWNLOADSVC', '', 'FECHARAF', [tRAFID.Value, True]);
      tRAF.Refresh;
    end;
end;

procedure TFrmRAF.btnFecharTecClick(Sender: TObject);
begin
  with DM do 
    if SimNao('Deseja realizar o fechamento de técnicos?') and
       SimNao('Apos realizar o fechamento não é mais possível realizar modificações. Deseja continuar?') then
    begin   
      kbmCli.Request('DOWNLOADSVC', '', 'FECHARAF', [tRAFID.Value, False]);
      tRAF.Refresh;
      tRAItem.Refresh;
      tRAOS.Refresh;
    end;
end;

procedure TFrmRAF.btnItensClick(Sender: TObject);
begin
  FrmRA.cbCon.Checked := True;
  FrmRA.edCon.Text := DM.tRAFID.AsString;
  FrmRA.cbStatusCli.Checked := False;
  FrmRA.cbStatusTec.Checked := False;
  FrmRA.AplicarFiltro;
  FrmRA.btnNenhumClick(nil);
  FrmPri.Paginas.ActivePageIndex := 3;
end;

procedure TFrmRAF.btnAprovCliClick(Sender: TObject);
begin
  FrmRA.cbCon.Checked := True;
  FrmRA.edCon.Text := DM.tRAFID.AsString;
  FrmRA.cbStatusCli.Checked := True;
  FrmRA.edStatusCli.ItemIndex := sfracPendente;
  FrmRA.cbStatusTec.Checked := False;
  FrmRA.AplicarFiltro;
  FrmRA.btnAgrupaClienteRAClick(nil);
  FrmPri.Paginas.ActivePageIndex := 3;
end;

procedure TFrmRAF.btnAprovTecClick(Sender: TObject);
begin
  FrmRA.cbCon.Checked := True;
  FrmRA.edCon.Text := DM.tRAFID.AsString;
  FrmRA.cbStatusTec.Checked := True;
  FrmRA.edStatusTec.ItemIndex := sfratPendente;
  FrmRA.cbStatusCli.Checked := False;
  FrmRA.AplicarFiltro;
  FrmRA.btnAgrupaTecRAClick(nil);
  FrmPri.Paginas.ActivePageIndex := 3;
end;

end.
