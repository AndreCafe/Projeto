unit ncafbCaixasA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, DB, nxdb, cxGridCustomPopupMenu, cxGridPopupMenu,
  dxBar, dxBarExtItems, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxMaskEdit, cxCalendar,
  cxCurrencyEdit, cxTextEdit, cxDBLookupComboBox, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore;

type
  TfbCaixasA = class(TFrmBase)
    Tab: TnxTable;
    dsTab: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    VNumero1: TcxGridDBColumn;
    VUsuario1: TcxGridDBColumn;
    VAbertura1: TcxGridDBColumn;
    VFechamento1: TcxGridDBColumn;
    TVSaldoFinal: TcxGridDBColumn;
    cmTotalizar: TdxBarLargeButton;
    TabID: TAutoIncField;
    TabAberto: TBooleanField;
    TabUsuario: TStringField;
    TabAbertura: TDateTimeField;
    TabFechamento: TDateTimeField;
    TabTotalFinal: TCurrencyField;
    TabDescontos: TCurrencyField;
    TabCancelamentos: TCurrencyField;
    TabSaldoAnt: TCurrencyField;
    TabObs: TMemoField;
    cmCorrigeDataHora: TdxBarLargeButton;
    TabSaldoFinal: TCurrencyField;
    TVSaldoAnt: TcxGridDBColumn;
    TVTotal: TcxGridDBColumn;
    TVSupr: TcxGridDBColumn;
    TabSangria: TCurrencyField;
    TabSupr: TCurrencyField;
    TVSangria: TcxGridDBColumn;
    pmCaixa: TdxBarPopupMenu;
    cmReprocessar: TdxBarButton;
    cmVerDet: TdxBarButton;
    TabReproc: TDateTimeField;
    TVReproc: TcxGridDBColumn;
    procedure cmEditarClick(Sender: TObject);
    procedure cmTotalizarClick(Sender: TObject);
    procedure cmCorrigeDataHoraClick(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure TVTotalCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cmExportarClick(Sender: TObject);
    procedure TVSangriaGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure pmCaixaPopup(Sender: TObject);
    procedure cmReprocessarClick(Sender: TObject);
  private
    { Private declarations }
    function GetIndexName: String;
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;
    { Public declarations }
  end;

var
  fbCaixasA: TfbCaixasA;

implementation

uses 
  ncaFrmPri, 
  ncaFrmCaixa, 
  ncaDM, 
  ncIDRecursos, ncDMCaixa, ncaFrmCorrigeDataCaixa, ncDMServ;

{$R *.dfm}

class function TfbCaixasA.Descricao: String;
begin
  Result := 'Caixas Anteriores';
end;

procedure TfbCaixasA.FiltraDados;
begin
  if not Tab.Active then begin
    DataI := 1;
    DataF := EncodeDate(3000, 1, 1);
    cmPeriodo.Caption := 'Período: Tudo';
    Tab.Active := True;
    Tab.Last;
  end;  
  Tab.IndexName := GetIndexName;
  if Tab.IndexName = 'IUsuario' then
    Tab.SetRange([Dados.CM.Username], [Dados.CM.Username])
  else
    Tab.CancelRange;  
  Tab.Refresh;  
end;

procedure TfbCaixasA.cmCorrigeDataHoraClick(Sender: TObject);
var A, F: TDateTime;
begin
  inherited;
  A := TabAbertura.Value;
  F := TabFechamento.Value;
  if TFrmCorrigeDataCaixa.Create(nil).Editar(TabID.Value, A, F) then 
    Dados.CM.CorrigeDataCaixa(TabID.Value, A, F);
  Tab.Refresh;  
end;

procedure TfbCaixasA.cmEditarClick(Sender: TObject);
begin
  Application.CreateForm(TdmCaixa, dmCaixa);
  try
    TFrmCaixa.Create(Self).Editar(Tab);
  finally
    dmCaixa.Free;
  end;
end;

procedure TfbCaixasA.cmExportarClick(Sender: TObject);
begin
  DM.CorrigeTemposOcupacao;
  inherited;
end;

procedure TfbCaixasA.cmReprocessarClick(Sender: TObject);
begin
  inherited;
  if SimNao('Deseja realmente reprocessar o caixa n.'+TabID.AsString+
            ' de ' + TabAbertura.AsString + ' ?') then 
  begin
    Application.CreateForm(TdmCaixa, dmCaixa);
    try
      dmCaixa.nxSession.ServerEngine := Dados.RSE;
      dmCaixa.AbreConn;
      dmCaixa.FechaCaixa(Dados.CM.Username, TabID.Value, True);
      Tab.Refresh;
    finally
      dmCaixa.Free;
    end;
  end;
end;

procedure TfbCaixasA.cmTotalizarClick(Sender: TObject);
begin
  Application.CreateForm(TdmCaixa, dmCaixa);
  try
    TFrmCaixa.Create(Self).CaixaPeriodo;
  finally
    dmCaixa.Free;
  end;
end;

procedure TfbCaixasA.AtualizaDireitos;
begin
  inherited;
  TVSaldoAnt.Visible := Dados.CM.Config.ManterSaldoCaixa;
  cmTotalizar.Enabled := Permitido(daCaiVerAntesOutros);
  if GetIndexName <> Tab.IndexName then FiltraDados;
end;

function TfbCaixasA.GetIndexName: String;
begin
  if Permitido(daCaiVerAntesOutros) then 
    Result := 'IAbertura'
  else
    Result := 'IUsuario';
end;

procedure TfbCaixasA.pmCaixaPopup(Sender: TObject);
begin
  inherited;
  cmReprocessar.Enabled := Dados.CM.UA.Admin;
end;

procedure TfbCaixasA.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  TabSaldoFinal.Value := TabTotalFinal.Value + TabSaldoAnt.Value + TabSupr.Value - TabSangria.Value;
end;

procedure TfbCaixasA.TVSangriaGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V:Variant;  
begin
  inherited;
  V := ARecord.Values[Sender.Index];
  if (V=null) or (V=0) then AText := '';
end;

procedure TfbCaixasA.TVTotalCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  ACanvas.Canvas.Font.Style := [fsBold];
end;

end.
