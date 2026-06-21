unit uNRfbTitulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxContainer, cxLabel, kbmMemTable,
  kbmMWCustomConnectionPool, kbmMWCustomDataset, kbmMWClientDataset,
  dxBar, cxCalendar, cxCurrencyEdit, cxMemo, cxGridCustomPopupMenu,
  cxGridPopupMenu, dxBarExtItems, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxNavigator, nxdb, cxSpinEdit, cxCheckBox,
  Buttons, PngSpeedButton, cxImageComboBox, cxRichEdit, cxDBRichEdit, cxPC,
  LMDCustomScrollBox, LMDScrollBox, lmdsplt, LMDControl, cxLookAndFeels,
  cxLookAndFeelPainters;

type
  TfbTitulos = class(TFrmBase)
    cmMostrar: TdxBarCombo;
    cmBaixar: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    panFiltro: TLMDSimplePanel;
    Q: TnxQuery;
    dsQ: TDataSource;
    btnEncontrar: TPngSpeedButton;
    LMDSimplePanel2: TLMDSimplePanel;
    cbCodLoja: TcxCheckBox;
    cbNomeLoja: TcxCheckBox;
    cbNumTit: TcxCheckBox;
    cbSitPag: TcxCheckBox;
    cbPag: TcxComboBox;
    edNumTit: TcxSpinEdit;
    edNomeLoja: TcxTextEdit;
    edCodLoja: TcxSpinEdit;
    cmTodosCli: TdxBarLargeButton;
    LMDSimplePanel1: TLMDSimplePanel;
    cbValor: TcxCheckBox;
    edValor: TcxCurrencyEdit;
    Grid: TcxGrid;
    tvFin: TcxGridDBTableView;
    tvFinID: TcxGridDBColumn;
    tvFinNomedaLoja: TcxGridDBColumn;
    tvFinSituacaoCobr: TcxGridDBColumn;
    tvFinVencimento: TcxGridDBColumn;
    tvFinPagamento: TcxGridDBColumn;
    tvFinValor: TcxGridDBColumn;
    tvFinValorPago: TcxGridDBColumn;
    tvFinObs: TcxGridDBColumn;
    tvFinDoc: TcxGridDBColumn;
    tvFinDescricao: TcxGridDBColumn;
    tvFinLancamento: TcxGridDBColumn;
    tvFinTipo: TcxGridDBColumn;
    tvFinPC: TcxGridDBColumn;
    glFin: TcxGridLevel;
    QCodLoja: TIntegerField;
    tFin: TnxTable;
    tFinID: TAutoIncField;
    tFinLoja: TIntegerField;
    tFinVencimento: TDateField;
    tFinPagamento: TDateField;
    tFinValor: TCurrencyField;
    tFinValorPago: TCurrencyField;
    tFinObs: TMemoField;
    tFinDoc: TStringField;
    tFinDescricao: TStringField;
    tFinLancamento: TDateTimeField;
    LMDSimplePanel3: TLMDSimplePanel;
    tvFinBloqueado: TcxGridDBColumn;
    tFinClienteLancou: TBooleanField;
    tFinPremium: TBooleanField;
    tFinPremiumDias: TWordField;
    tFinCancelado: TBooleanField;
    tFinCanceladoEm: TDateTimeField;
    tFinCanceladoPor: TStringField;
    tFinBaixou: TBooleanField;
    QID: TIntegerField;
    QLoja: TIntegerField;
    QVencimento: TDateField;
    QPagamento: TDateField;
    QValor: TCurrencyField;
    QValorPago: TCurrencyField;
    QObs: TnxMemoField;
    QDoc: TStringField;
    QDescricao: TStringField;
    QLancamento: TDateTimeField;
    QClienteLancou: TBooleanField;
    QPremium: TBooleanField;
    QPremiumDias: TWordField;
    QCancelado: TBooleanField;
    QCanceladoEm: TDateTimeField;
    QCanceladoPor: TStringField;
    QBaixou: TBooleanField;
    QNomeLoja: TStringField;
    QBloqueado: TBooleanField;
    cbBaixar: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnEncontrarClick(Sender: TObject);
    procedure cbSitPagClick(Sender: TObject);
    procedure cbNumTitClick(Sender: TObject);
    procedure cbNomeLojaClick(Sender: TObject);
    procedure cbCodLojaClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure cmTodosCliClick(Sender: TObject);
    procedure cbValorClick(Sender: TObject);
    procedure QCalcFields(DataSet: TDataSet);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure tvFinBloqueadoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
    FContato : Variant;
    FTitAnt : Integer;
  protected
    procedure QueryTitulos;
  public
    procedure FiltraDados; override;

    class function Descricao: String; override;
    
  
    { Public declarations }
  end;

var
  fbTitulos: TfbTitulos;

implementation


uses uNexRegPri, uNRFrmTitulo, uNexRegDM, uNRFrmCli, uFrmHC, uFrmTar;

{$R *.dfm}


procedure TfbTitulos.FiltraDados;
begin
  inherited;
  QueryTitulos;
end;

procedure TfbTitulos.FormCreate(Sender: TObject);
begin
  inherited;
  FContato := Null;
  FTitAnt := -1;
  tFin.Active := True;
end;

class function TfbTitulos.Descricao: String;
begin
  Result := 'Títulos a Receber';
end;

procedure TfbTitulos.dxBarLargeButton1Click(Sender: TObject);
begin
  inherited;
  if not DM.tCli.FindKey([QLoja.Value]) then begin
    Free;
    Raise Exception.Create('Cliente não encontrado');
  end;

  TFrmCli.Create(Self).Editar(DM.tCli, 0);
end;

procedure TfbTitulos.cmApagarClick(Sender: TObject);
begin
  inherited;
  if tFin.FindKey([QID.Value]) then
  if MessageDlg('Deseja realmente apagar essa parcela ?', mtConfirmation, [mbYes, mbNo], 0, mbNo)=mrYes then
  if MessageDlg('Confirma ?', mtConfirmation, [mbYes, mbNo], 0, mbNo)=mrYes then
  if TFrmTitulo.Create(Self).Editar(QLoja.Value, tFin) then begin
    tFin.Delete;
    Q.Active := False;
    Q.Active := True;
  end;
end;

procedure TfbTitulos.cmEditarClick(Sender: TObject);
begin
  inherited;
  if tFin.FindKey([QID.Value]) then
  if TFrmTitulo.Create(Self).Editar(QLoja.Value, tFin) then begin
    Q.Active := False;
    Q.Active := True;
    Q.Locate('ID', tFin.FieldByName('ID').AsInteger, []);
  end;
end;

procedure TfbTitulos.cmTodosCliClick(Sender: TObject);
begin
  inherited;
  if cmTodosCli.Down then
    FTitAnt := QID.Value;
  panFiltro.Enabled := not cmTodosCli.Down;
  btnEncontrar.Enabled := panFiltro.Enabled;
  QueryTitulos;
end;

procedure TfbTitulos.btnEncontrarClick(Sender: TObject);
begin
  inherited;
  QueryTitulos;
end;

procedure TfbTitulos.cbCodLojaClick(Sender: TObject);
begin
  inherited;
  edCodLoja.Enabled := cbCodLoja.Checked;
  edCodLoja.Value := 0;
  if cbCodLoja.Checked then
    edCodLoja.SetFocus;
end;

procedure TfbTitulos.cbNomeLojaClick(Sender: TObject);
begin
  inherited;
  edNomeLoja.Enabled := cbNomeLoja.Checked;
  edNomeLoja.Text := '';
  if edNomeLoja.Enabled then
    edNomeLoja.SetFocus;
end;

procedure TfbTitulos.cbNumTitClick(Sender: TObject);
begin
  inherited;
  edNumTit.Enabled := cbNumTit.Checked;
  edNuMTit.Value := 0;
  if edNumTit.Enabled then
    edNumTit.SetFocus;
end;

procedure TfbTitulos.cbSitPagClick(Sender: TObject);
begin
  inherited;
  cbPag.Enabled := cbSitPag.Checked;
  if cbPag.Enabled then
    cbPag.SetFocus;
end;

procedure TfbTitulos.cbValorClick(Sender: TObject);
begin
  edValor.Enabled := cbValor.Checked;
  edValor.Value := 0;
  if cbValor.Checked then
    edValor.SetFocus;
end;

procedure TfbTitulos.QCalcFields(DataSet: TDataSet);
begin
  inherited;
  QCodLoja.Value := QLoja.Value;
end;

procedure TfbTitulos.QueryTitulos;
var 
  S, Str, SValor: String;
  I: Integer;
  Valor: Currency;
  

procedure AddCond(sCond: String);
begin
  if S>'' then
    S := S + ' AND ';
  S := S + '('+sCond+')';
end;

procedure AddCondEsp(aCampo, aValor: String);
begin
  if Trim(aValor)>'' then
    AddCond('Upper('+aCampo+') like '+QuotedStr('%'+UpperCase(aValor)+'%'));
end;

begin
  FrmPri.DisableDatasets;
  try
    S := '';
    Str := '';
  
    if cmTodosCli.Down then begin
      AddCond('C.Codigo = R.Loja');
      AddCond('R.Loja = '+QLoja.AsString);
      Q.Active := False;
      Q.SQL.Text := 'select r.*, c.Loja as NomeLoja, c.Bloqueado from receber r, cliente c where '+S+sLineBreak+' order by Vencimento';
      Q.Active := True;
      Q.Locate('ID', FTitAnt, []);
      Exit;
    end;
  
    Q.Active := False;
  
    if cbSitPag.Checked then
    case cbPag.ItemIndex of
      0 : begin
        AddCond('R.Pagamento is Null');
        AddCond('R.Vencimento < DATE '+QuotedStr(FormatDateTime('yyyy-mm-dd', Date+1)));
      end;
  
      1 : begin
        AddCond('R.Pagamento is Null');
        AddCond('R.Vencimento > DATE '+QuotedStr(FormatDateTime('yyyy-mm-dd', Date)));
      end;
  
      2 : AddCond('R.Pagamento is Null');
    end;
  
    if cbNumTit.Checked then begin
      I := edNumTit.Value;
      AddCond('R.ID = '+IntToStr(I));
    end;
  
    if cbNomeLoja.Checked then 
      AddCondEsp('C.Loja', edNomeLoja.Text);
  
    if cbCodLoja.Checked then begin
      I := edCodLoja.Value;
      AddCond('R.Loja = '+IntToStr(I));
    end;
  
    if cbValor.Checked then begin
      Valor := edValor.Value;
      System.Str(Valor:0:0, SValor);
      AddCond('R.Valor = ' + SValor);
    end;
  
    if S='' then
      Q.SQL.Text := 'select r.*, c.Loja as NomeLoja, c.Bloqueado from receber r, cliente c where id = 0'
    else begin
      AddCond('C.Codigo = R.Loja');
      Q.SQL.Text := 'select r.*, c.Loja as NomeLoja, c.Bloqueado from receber r, cliente c where '+S+sLineBreak+' order by Vencimento';
    end;

    Q.Active := true;
  
    if FTitAnt>0 then
      Q.Locate('ID', FTitAnt, []);
  
    cmTodosCli.Down := False;
    if Q.IsEmpty then
      cmTodosCli.Visible := ivNever else
      cmTodosCli.Visible := ivAlways;
  finally
    FrmPri.EnableDatasets;
  end;
  if cbNumTit.Checked then 
    if cbBaixar.Checked then 
       FrmPri.BaixarBoleto(edNumTit.Value);
end;

procedure TfbTitulos.tvFinBloqueadoCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if (AViewInfo.Value<>null) and (AViewInfo.Value=True) then begin
    ACanvas.Brush.Color := clBlack;
    ACanvas.Font.Color := clWhite;
    ACanvas.Font.Style := [fsBold];
  end;

end;

end.







                                                                  