unit ncafbTipoPass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxMaskEdit, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, nxdb, dxPSCore,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems, ExtCtrls,
  cxCalendar, cxTextEdit, cxCheckBox, cxTimeEdit, cxDBLookupComboBox, ncPassaportes,
  cxSpinEdit, cxImageComboBox, ImgList;

type
  TfbTiposPass = class(TFrmBase)
    dsTab: TDataSource;
    Tab: TnxTable;
    TabID: TAutoIncField;
    TabNome: TStringField;
    TabValor: TCurrencyField;
    TabTipoAcesso: TIntegerField;
    TabTipoExp: TWordField;
    TabExpirarEm: TDateTimeField;
    TabMaxSegundos: TIntegerField;
    TabObs: TMemoField;
    TabDia1: TIntegerField;
    TabDia2: TIntegerField;
    TabDia3: TIntegerField;
    TabDia4: TIntegerField;
    TabDia5: TIntegerField;
    TabDia6: TIntegerField;
    TabDia7: TIntegerField;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVNome1: TcxGridDBColumn;
    TVValor1: TcxGridDBColumn;
    GL: TcxGridLevel;
    dxBarButton1: TdxBarButton;
    TabFidelidade: TBooleanField;
    TabFidPontos: TIntegerField;
    TVFidelidade: TcxGridDBColumn;
    cxImageList1: TcxImageList;
    TVRelogio: TcxGridDBColumn;
    TVTempoStr: TcxGridDBColumn;
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure TVValor1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVTempoStrGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FiltraDados; override;
    procedure AtualizaDireitos; override;
    class function Descricao: String; override;
    
  end;

var
  fbTiposPass: TfbTiposPass;

implementation

uses 
  ncaDM, 
  ncaFrmPri, 
  ncClassesBase, 
  ncaFrmPass, 
  ncaFrmImpPrePago, 
  ncIDRecursos,
  ncafbPass;

{$R *.dfm}

{ TfbTiposPass }

class function TfbTiposPass.Descricao: String;
begin
  Result := 'Passaportes';
end;

procedure TfbTiposPass.FiltraDados;
begin
  if not Tab.Active then
    Tab.Open else
    Tab.Refresh;  
end;

procedure TfbTiposPass.TVValor1CustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  ACanvas.Font.Style := [fsBold];
end;

procedure TfbTiposPass.TVTempoStrGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  inherited;
  V := ARecord.Values[TVTempoStr.Index];
  if V=null then Exit;
  AText := MinutosToHMSStr(V/60);
end;

procedure TfbTiposPass.cmEditarClick(Sender: TObject);
var P : TncPassaporte;
begin
  if Tab.IsEmpty  then Exit;

  P := TncPassaporte.Create;
  try
    if Tab.RecordCount > 0 then begin
      P.LoadFromDataset(Tab);
      if TFrmPassaporte.Create(Self).Editar(False, P) then begin
        Tab.Edit;
        P.SaveToDataset(Tab);
        Tab.Post;
      end;  
    end;
  finally
    P.Free;
  end;
end;

procedure TfbTiposPass.cmNovoClick(Sender: TObject);
var P : TncPassaporte;
begin
  P := TncPassaporte.Create;
  try
    if TFrmPassaporte.Create(Self).Editar(True, P) then begin
      Tab.Insert;
      P.SaveToDataset(Tab);
      Tab.Post;
    end;
  finally
    P.Free;
  end;
end;

procedure TfbTiposPass.cmApagarClick(Sender: TObject);
begin
  inherited;
  if not Tab.IsEmpty then
  if SimNaoH('Deseja realmente apagar esse crédito promocional?', Handle) then
    Tab.Delete;
end;

procedure TfbTiposPass.AtualizaDireitos;
begin
  inherited;
  cmApagar.Enabled := Permitido(daCFGPrecos);
end;

end.
