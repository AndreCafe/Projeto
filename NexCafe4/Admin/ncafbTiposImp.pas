unit ncafbTiposImp;

interface

uses
  Windows, Messages, ncErros, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, nxdb, dxPSCore,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems, ExtCtrls,
  cxMaskEdit, cxSpinEdit, cxImageComboBox,
  ImgList, cxContainer, cxLabel, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel;

type
  TfbTiposImp = class(TFrmBase)
    Tab: TnxTable;
    dsTab: TDataSource;
    TabID: TWordField;
    TabImpressora: TStringField;
    TabValor: TCurrencyField;
    TabNome: TStringField;
    TabContador: TIntegerField;
    cmZerarContador: TdxBarLargeButton;
    TabShowImp: TBooleanField;
    cxImageList1: TcxImageList;
    LMDSimplePanel1: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVValor: TcxGridDBColumn;
    TVNome: TcxGridDBColumn;
    TVShowImp: TcxGridDBColumn;
    TVImpressora: TcxGridDBColumn;
    GL: TcxGridLevel;
    VColumn1: TcxGridDBColumn;
    procedure cmApagarClick(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmZerarContadorClick(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure TVValorGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVValorCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
    procedure RefreshPMValorMinMax;
  public
    { Public declarations }
    function  GetGrid: TcxGrid; override;
    
    procedure FiltraDados; override;
    procedure AtualizaDireitos; override;
    class function Descricao: String; override;
  end;

var
  fbTiposImp: TfbTiposImp;

implementation

uses 
  ncaFrmPri, 
  ncIDRecursos, 
  ncaDM, ncaFrmTipoImp, ncDMServ, ncClassesBase;

{$R *.dfm}

{ TfbPacotes }

class function TfbTiposImp.Descricao: String;
begin
  Result := 'Tarifas de Impressão';
end;

procedure TfbTiposImp.FiltraDados;
begin
  inherited;
  if not Tab.Active then
    Tab.Open
  else
    Tab.Refresh;
end;

function TfbTiposImp.GetGrid: TcxGrid;
begin
  Result := nil;
end;

procedure TfbTiposImp.RefreshPMValorMinMax;
var aMin, aMax: Currency;
begin
  DM.ObtemValorMinMaxImp(aMin, aMax);
  if (gConfig.PMValorMin<>aMin) or (gConfig.PMValorMax<>aMax) then begin
    gConfig.AtualizaCache;
    gConfig.PMValorMin := aMin;
    gConfig.PMValorMax := aMax;
    Dados.CM.SalvaAlteracoesObj(gConfig, False);
  end;
end;

procedure TfbTiposImp.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  TabShowImp.Value := (Trim(TabImpressora.Value)>'');
end;

procedure TfbTiposImp.TVValorCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  ACanvas.Font.Style :=[fsBold];
end;

procedure TfbTiposImp.TVValorGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if Trim(AText)='' then
    AText := Trim(FloatToStrF(0, ffCurrency, 10, 2));
end;

procedure TfbTiposImp.cmApagarClick(Sender: TObject);
begin
  inherited;
  if not Tab.IsEmpty then
  if SimNaoH('Deseja realmente apagar a Tarifa de Impressão ' + TabNome.Value + '?', Handle) then
  begin
    Tab.Delete;
    RefreshPMValorMinMax;
  end;
end;

procedure TfbTiposImp.cmEditarClick(Sender: TObject);
var DI : TDadosTipoImp;
begin
  inherited;
  DI.tiNome := TabNome.Value;
  DI.tiImp := TabImpressora.Value;
  DI.tiValor := TabValor.Value;
  if TFrmTipoImp.Create(nil).Editar(@DI) then begin
    Tab.Edit;
    TabNome.Value := DI.tiNome;
    TabImpressora.Value := DI.tiImp;
    TabValor.Value := DI.tiValor;
    Tab.Post;
    RefreshPMValorMinMax;
  end;
end;

procedure TfbTiposImp.cmNovoClick(Sender: TObject);
var 
  DI : TDadosTipoImp;
  ProxCod : Integer;

procedure CalcProxCod;
var Ant: Integer;
begin
  Tab.IndexName := 'IID';
  Tab.First;
  Ant := 0;
  while (not Tab.Eof) and ((TabID.Value-Ant)=1) do begin
    Ant := TabID.Value;
    Tab.Next;
  end;
  ProxCod := Ant + 1;
end;
  
begin
  inherited;
  Fillchar(DI, SizeOf(DI), 0);
  if Tab.RecordCount>10 then
    Raise ENexCafe.Create('O NexCafé não aceita mais que 10 tipos de impressões diferentes');
  if TFrmTipoImp.Create(nil).Editar(@DI) then begin
    CalcProxCod;
    Tab.Insert;
    TabID.Value := ProxCod;
    TabNome.Value := DI.tiNome;
    TabImpressora.Value := DI.tiImp;
    TabValor.Value := DI.tiValor;
    Tab.Post;

    RefreshPMValorMinMax;
  end;
end;

procedure TfbTiposImp.cmZerarContadorClick(Sender: TObject);
begin
  inherited;
  if SimNaoH('Deseja realmente zerar o contador de impressões "' + TabNome.Value + '" ?', Handle) then
  begin
    Tab.Edit;
    TabContador.Value := 0;
    Tab.Post;
  end;  
end;

procedure TfbTiposImp.AtualizaDireitos;
begin
  inherited;
  cmApagar.Enabled := Permitido(daCFGPrecos);
  cmZerarContador.Enabled := Dados.CM.UA.Admin;
  if Tab.Active then Tab.Refresh;
  
end;

end.
