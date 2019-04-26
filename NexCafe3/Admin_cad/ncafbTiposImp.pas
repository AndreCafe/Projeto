unit ncafbTiposImp;

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
  cxMaskEdit, cxSpinEdit;

type
  TfbTiposImp = class(TFrmBase)
    Tab: TnxTable;
    dsTab: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    TabID: TWordField;
    TabImpressora: TStringField;
    TabValor: TCurrencyField;
    TabNome: TStringField;
    TVNome: TcxGridDBColumn;
    TVImpressora: TcxGridDBColumn;
    TVValor: TcxGridDBColumn;
    TabContador: TIntegerField;
    TVContador: TcxGridDBColumn;
    cmZerarContador: TdxBarLargeButton;
    procedure cmApagarClick(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmZerarContadorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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
  ncaDM, ncaFrmTipoImp;

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

procedure TfbTiposImp.cmApagarClick(Sender: TObject);
begin
  inherited;
  if not Tab.IsEmpty then
  if SimNaoH('Deseja realmente apagar a Tarifa de Impressão ' + TabNome.Value + '?', Handle) then
    Tab.Delete;
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
    Raise Exception.Create('O NexCafé não aceita mais que 10 tipos de impressões diferentes');
  if TFrmTipoImp.Create(nil).Editar(@DI) then begin
    CalcProxCod;
    Tab.Insert;
    TabID.Value := ProxCod;
    TabNome.Value := DI.tiNome;
    TabImpressora.Value := DI.tiImp;
    TabValor.Value := DI.tiValor;
    Tab.Post;
  end;
end;

procedure TfbTiposImp.cmZerarContadorClick(Sender: TObject);
begin
  inherited;
  if SimNaoH('Deseja realmente zerar o contador de impressões de ' + TabNome.Value + '?', Handle) then
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
