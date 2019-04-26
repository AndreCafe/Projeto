unit ncafbImp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems,
  ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCalendar, cxMaskEdit,
  cxImageComboBox, cxMemo, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, nxdb;

type
  TfbImp = class(TFrmBase)
    DataSource1: TDataSource;
    Tab: TnxTable;
    TabDataHora: TDateTimeField;
    TabComputador: TStringField;
    TabMaquina: TWordField;
    TabPaginas: TIntegerField;
    TabImpressora: TStringField;
    TabDocumento: TMemoField;
    TabResultado: TWordField;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVDataHora1: TcxGridDBColumn;
    TVMaquina1: TcxGridDBColumn;
    TVID: TcxGridDBColumn;
    TVPaginas1: TcxGridDBColumn;
    TVResultado1: TcxGridDBColumn;
    TVImpressora1: TcxGridDBColumn;
    TVDocumento1: TcxGridDBColumn;
    TVAcesso1: TcxGridDBColumn;
    TVComputador1: TcxGridDBColumn;
    GL: TcxGridLevel;
    TabID: TAutoIncField;
    TabTran: TIntegerField;
    TabCaixa: TIntegerField;
    TabManual: TBooleanField;
    TabSessao: TIntegerField;
    Tabq1: TWordField;
    Tabq2: TWordField;
    Tabq3: TWordField;
    Tabq4: TWordField;
    Tabq5: TWordField;
    Tabq6: TWordField;
    Tabq7: TWordField;
    Tabq8: TWordField;
    Tabq9: TWordField;
    Tabq10: TWordField;
    Tabv1: TCurrencyField;
    Tabv2: TCurrencyField;
    Tabv3: TCurrencyField;
    Tabv4: TCurrencyField;
    Tabv5: TCurrencyField;
    Tabv6: TCurrencyField;
    Tabv7: TCurrencyField;
    Tabv8: TCurrencyField;
    Tabv9: TCurrencyField;
    Tabv10: TCurrencyField;
    TabTotal: TCurrencyField;
    TabDesconto: TCurrencyField;
    TabPagoPost: TCurrencyField;
    TabDescPost: TCurrencyField;
    TabPago: TCurrencyField;
    TabFunc: TStringField;
    TabCliente: TIntegerField;
    TabCancelado: TBooleanField;
    TVCaixa: TcxGridDBColumn;
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;
    
    { Public declarations }
  end;

var
  fbImp: TfbImp;

implementation

uses 
  ncaDM, 
  ncaFrmPri, ncaFrmImp, ncImpressao, ncClassesBase;

{$R *.dfm}

{ TfbImp }

procedure TfbImp.AtualizaDireitos;
begin
  inherited;
  if Tab.Active then Tab.Refresh;
end;

procedure TfbImp.cmEditarClick(Sender: TObject);
var Imp, Ant: TncImpressao;
begin
  Imp := TncImpressao.Create;
  Ant := TncImpressao.Create;
  try
    Imp.LoadFromDataset(Tab);
    Ant.AssignFrom(Imp);
    if TFrmImp.Create(nil).Editar(False, (Imp.impCaixa=NumAberto), Imp) and (not Imp.Igual(Ant)) then
    begin
      Imp._Operacao := osAlterar;
      Dados.CM.SalvaImpressao(Imp);
      Tab.Refresh;
    end;
  finally
    Imp.Free;
    Ant.Free;
  end;
end;

procedure TfbImp.cmNovoClick(Sender: TObject);
var Imp: TncImpressao;
begin
  inherited;
  ChecaCaixa;
  Imp := TncImpressao.Create;
  try
    Imp.impManual := True;
    if TFrmImp.Create(nil).Editar(True, True, Imp) then begin
      Imp._Operacao := osIncluir;
      Dados.CM.SalvaImpressao(Imp);
      Tab.Refresh;
    end;
  finally
    Imp.Free;
  end;
end;

class function TfbImp.Descricao: String;
begin
  Result := 'Impressões';
end;

procedure TfbImp.FiltraDados;
begin
  if not Tab.Active then
    Tab.Open
  else
    Tab.Refresh;  
end;

end.
