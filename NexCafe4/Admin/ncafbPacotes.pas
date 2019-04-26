unit ncafbPacotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, nxdb, dxPSCore,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems, ExtCtrls,
  cxMaskEdit, cxSpinEdit, cxImageComboBox,
  ImgList;

type
  TfbPacotes = class(TFrmBase)
    dsTab: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVCodigo1: TcxGridDBColumn;
    TVHoras1: TcxGridDBColumn;
    TVValorTotal1: TcxGridDBColumn;
    GL: TcxGridLevel;
    TVNome: TcxGridDBColumn;
    TabID: TAutoIncField;
    TabMinutos: TIntegerField;
    TabValor: TCurrencyField;
    TabDescr: TStringField;
    TabFidelidade: TBooleanField;
    TabFidPontos: TIntegerField;
    Tab: TnxTable;
    TVRelogio: TcxGridDBColumn;
    cxImageList1: TcxImageList;
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure TVHoras1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVHoras1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FiltraDados; override;
    procedure AtualizaDireitos; override;
    class function Descricao: String; override;
  end;

var
  fbPacotes: TfbPacotes;

implementation

uses 
  ncaFrmPri, 
  ncaFrmPacote, 
  ncIDRecursos, 
  ncaDM, ncClassesBase;

{$R *.dfm}

{ TfbPacotes }

class function TfbPacotes.Descricao: String;
begin
  Result := 'Pacotes';
end;

procedure TfbPacotes.FiltraDados;
begin
  inherited;
  if not Tab.Active then
    Tab.Open
  else
    Tab.Refresh  ;
end;

procedure TfbPacotes.TVHoras1CustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  ACanvas.Font.Style := [fsBold];
end;

procedure TfbPacotes.TVHoras1GetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  V := ARecord.Values[TVHoras1.Index];
  if V=null then Exit;
  AText := MinutosToHMSStr(V);
end;

procedure TfbPacotes.cmNovoClick(Sender: TObject);
begin
  inherited;
  TFrmPacote.Create(Self).Novo(Tab);
end;

procedure TfbPacotes.cmEditarClick(Sender: TObject);
begin
  inherited;
  TFrmPacote.Create(Self).Editar(Tab);
end;

procedure TfbPacotes.cmApagarClick(Sender: TObject);
begin
  inherited;
  if SimNaoH('Deseja realmente apagar esse pacote', Handle) then
    Tab.Delete;
end;

procedure TfbPacotes.AtualizaDireitos;
begin
  inherited;
  cmApagar.Enabled := Permitido(daCFGPrecos);
end;

end.
