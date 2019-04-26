unit ncaFrmImp;

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxDropDownEdit, cxCurrencyEdit,
  cxMaskEdit, cxRadioGroup, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBLookupComboBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, DB, kbmMemTable, dxBar,
  dxBarExtItems, cxVGrid, cxDBVGrid, cxInplaceContainer, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxSpinEdit, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  ncImpressao, ncafbPesqCli, cxContainer, cxCheckBox, ExtCtrls;

type
  TFrmImp = class(TForm)
    panCab2: TLMDSimplePanel;
    vgH: TcxDBVerticalGrid;
    vgHCliCad: TcxDBEditorRow;
    vgHDebitoCli: TcxDBEditorRow;
    vgHObs: TcxDBEditorRow;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    panTotais: TLMDSimplePanel;
    vgT: TcxVerticalGrid;
    vgTTotal: TcxEditorRow;
    vgTDesconto: TcxEditorRow;
    vgTTotalF: TcxEditorRow;
    vgTPagTotal: TcxEditorRow;
    vgTPago: TcxEditorRow;
    LMDSimplePanel5: TLMDSimplePanel;
    BarMgr: TdxBarManager;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    MT: TkbmMemTable;
    MTCliente: TIntegerField;
    MTNomeCliente: TStringField;
    MTObs: TStringField;
    dsMT: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridTableView;
    TVQuant: TcxGridColumn;
    TVTotal: TcxGridColumn;
    GL: TcxGridLevel;
    TVTipo: TcxGridColumn;
    MTQuantidade: TIntegerField;
    vgHQuant: TcxDBEditorRow;
    LMDLabel1: TLMDLabel;
    MTImpressora: TStringField;
    MTMaq: TIntegerField;
    vgHImpressora: TcxDBEditorRow;
    vgHMaq: TcxDBEditorRow;
    cmRecibo: TdxBarControlContainerItem;
    cbRecibo: TcxCheckBox;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmCancelarClick(Sender: TObject);
    procedure TVTotalGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure vgTPagTotalEditPropertiesChange(Sender: TObject);
    procedure vgTEdited(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);
    procedure vgTItemChanged(Sender: TObject; AOldRow: TcxCustomRow;
      AOldCellIndex: Integer);
    procedure vgHCliCadEditPropertiesInitPopup(Sender: TObject);
    procedure vgHCliCadEditPropertiesCloseUp(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TVQuantPropertiesEditValueChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure vgTDescontoPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
  private
    FImp : TncImpressao;
    FRes : Boolean;
    FNovo : Boolean;
    FLoading : Boolean;
    FDadosCli : TDadosCliente;
    FCliAnt : Integer;
    FDebAnt : Currency;
    { Private declarations }
    procedure LeTipos;
    procedure AtualizaTotais;
  public
    function Editar(aNovo: Boolean; aSalvar: Boolean; aImp: TncImpressao): Boolean;
    { Public declarations }
  end;

var
  FrmImp: TFrmImp;

implementation

uses ncaDM, ncIDRecursos, ncaFrmPri;

{$R *.dfm}

{ TFrmImp }

procedure TFrmImp.AtualizaTotais;
begin
  vgTTotal.Properties.Value := FImp.Total;
  if vgTDesconto.Properties.Value > vgTTotal.Properties.Value then
    vgTDesconto.Properties.Value := vgTTotal.Properties.Value;
  vgTTotalF.Properties.Value := vgTTotal.Properties.Value - vgTDesconto.Properties.Value;
  if vgTPago.Properties.Value>vgTTotalF.Properties.Value then
    vgTPago.Properties.Value := vgTTotalF.Properties.Value;
  if vgTPagTotal.Properties.Value then
    vgTPago.Properties.Value := vgTTotalF.Properties.Value;
  vgT.HideEdit;
end;

procedure TFrmImp.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmImp.cmGravarClick(Sender: TObject);
var Debitar, V : Currency;
begin
  vgH.DataController.PostEditingData;
  FImp.impCliente := MTCliente.Value;
  FImp.impMaquina := MTMaq.Value;
  FImp.impImpressora := MTImpressora.Value;
  FImp.impPago := vgTPago.Properties.Value;
  FImp.impDesconto := vgTDesconto.Properties.Value;
  FImp._Recibo := cbRecibo.Checked;
  if FNovo or FImp.impManual then 
    FImp.impPaginas := FImp.TotQuant;

  if (FImp.Debito>0.009) then begin
    if (FImp.impCliente=0) then
      Raise ENexCafe.Create('Para ficar em débito é necessário selecionar um cliente');
    if FImp.impCliente <> FCliAnt then FDebAnt := 0;
    Debitar := FImp.Debito-FDebAnt;
    with Dados do
    if Debitar>0.009 then begin
      tbCli.Locate('ID', FImp.impCliente, []);
      if LimiteDebito(tbCliLimiteDebito) <  (tbCliDebito.Value + Debitar) then
        Raise ENexCafe.Create('O limite máximo de débito permitido para esse cliente foi ultrapassado');
    end;
  end;


  Close;
  FRes := True;
end;

function TFrmImp.Editar(aNovo, aSalvar: Boolean; aImp: TncImpressao): Boolean;
begin
  with Dados.CM.Config do begin
    if RecImprimir>0 then
      cmRecibo.Visible := ivAlways else
      cmRecibo.Visible := ivNever;
      
    cbRecibo.Checked := aNovo and (RecImprimir=2);
  end;
    
  MTCliente.Value := aImp.impCliente;
  MTMaq.Value := aImp.impMaquina;
  MTQuantidade.Value := aImp.impPaginas;
  MTImpressora.Value := aImp.impImpressora;
  FNovo := aNovo;
  cmGravar.Enabled := aSalvar and (aNovo or Permitido(daTraAlterar));
  FImp := aImp;
  Result := FRes;
//  vgHQuant.Visible := not FImp.impManual;
  vgHCliCad.Properties.EditProperties.ReadOnly := (FImp.impSessao>0);
  vgHImpressora.Properties.EditProperties.ReadOnly := not FImp.impManual;
  vgHMaq.Properties.EditProperties.ReadOnly := (FImp.impSessao>0);
  LeTipos;
  vgTTotal.Properties.Value := FImp.Total;
  vgTDesconto.Properties.Value := FImp.impDesconto;
  vgTTotalF.Properties.Value := vgTTotal.Properties.Value - FImp.impDesconto;
  vgTPago.Properties.Value := FImp.impPago;
  if aNovo then
    vgTPagTotal.Properties.Value := Dados.CM.Config.PgImp else
    vgTPagTotal.Properties.Value := (Abs(FImp.Total - FImp.impDesconto - FImp.impPago)<0.01);
    
  if (not aNovo) and (not FImp.impManual) and (not Permitido(daAlteraImpressao)) then
    cmGravar.Enabled := False;
     
  ShowModal;
  Result := FRes;
end;

procedure TFrmImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmImp.FormCreate(Sender: TObject);
begin
  with Dados, TcxComboBoxProperties(vgHImpressora.Properties.EditProperties) do begin
    Items.Clear;
    tbTipoImp.First;
    while not tbTipoImp.Eof do begin
      if tbTipoImpImpressora.Value > '' then
        Items.Add(tbTipoImpImpressora.Value);
      tbTipoImp.Next;
    end;
  end;
  FDadosCli.dcCodigo := 0;
  FDadosCli.dcNome := '';
  FRes := False;
  FLoading := False;
  MT.Open;
  MT.Insert;
end;

procedure TFrmImp.FormShow(Sender: TObject);
begin
  FCliAnt := FImp.impCliente;
  FDebAnt := FImp.Debito;
  if (Screen.Width=640) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
end;

procedure TFrmImp.LeTipos;
begin
  FLoading := True;
  try
    with TV.DataController, Dados do begin
      tbTipoImp.First;
      while not tbTipoImp.Eof do begin
        if tbTipoImpID.Value in [1..10] then begin
          AppendRecord;
//          if FNovo then
            FImp.impValor[tbTipoImpID.Value] := tbTipoImpValor.Value;
          Values[RecordCount-1, 0] := tbTipoImpID.Value;
          Values[RecordCount-1, 1] := FImp.QuantPorTipo(tbTipoImpID.Value);
          Values[RecordCount-1, 2] := FImp.TotalPorTipo(tbTipoImpID.Value);
        end;
        tbTipoImp.Next;
      end;
    end;
  finally
    FLoading := False;
  end;
end;

procedure TFrmImp.Timer1Timer(Sender: TObject);
var 
  T, Q: Variant;
  I: Integer;
begin
  Timer1.Enabled := False;
  with TV.DataController do begin
    Q := Values[FocusedRecordIndex, 1];
    T := Values[FocusedRecordIndex, 0];
    if T<>null then begin
      I := T;
      FImp.impQuant[I] := Q;
      Values[FocusedRecordIndex, 2] := FImp.TotalPorTipo(I);
      AtualizaTotais;
    end;
  end;
end;

procedure TFrmImp.TVQuantPropertiesEditValueChanged(Sender: TObject);
begin
  if FLoading then Exit;
  Timer1.Enabled := True;
end;

procedure TFrmImp.TVTotalGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  if (AText='R$ 0') or (AText='R$ 0,00') then AText := '';
end;

procedure TFrmImp.vgHCliCadEditPropertiesCloseUp(Sender: TObject);
begin
  if MT.State<>dsEdit then MT.Edit;
  mtCliente.Value := FDadosCli.dcCodigo;
  FImp.impCliente := mtCliente.Value;
  TcxCustomDropDownEdit(Sender).Text := FDadosCli.dcNome;
end;

procedure TFrmImp.vgHCliCadEditPropertiesInitPopup(Sender: TObject);
begin
  TcxPopupEdit(Sender).Properties.PopupControl := fbPesqCli;
  FDadosCli.dcCodigo := MTCliente.Value;
  FDadosCli.dcNome := MTNomeCliente.Value;
  fbPesqCli.PreparaBusca(@FDadosCli, TcxCustomDropDownEdit(Sender));
end;

procedure TFrmImp.vgTDescontoPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daTraDesconto);
end;

procedure TFrmImp.vgTEdited(Sender: TObject;
  ARowProperties: TcxCustomEditorRowProperties);
begin
  AtualizaTotais;
end;

procedure TFrmImp.vgTItemChanged(Sender: TObject; AOldRow: TcxCustomRow;
  AOldCellIndex: Integer);
begin
  AtualizaTotais;
end;

procedure TFrmImp.vgTPagTotalEditPropertiesChange(Sender: TObject);
begin
  if vgTPagTotal.Properties.Value then
    vgTPago.Properties.Value := vgTTotalF.Properties.Value else
    vgTPago.Properties.Value := 0;
end;

end.
