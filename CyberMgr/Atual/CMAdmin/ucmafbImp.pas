unit ucmafbImp;

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
    TabIDSeq: TAutoIncField;
    TabDataHora: TDateTimeField;
    TabComputador: TStringField;
    TabMaquina: TWordField;
    TabPaginas: TIntegerField;
    TabImpressora: TStringField;
    TabDocumento: TMemoField;
    TabAcesso: TIntegerField;
    TabResultado: TWordField;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVDataHora1: TcxGridDBColumn;
    TVMaquina1: TcxGridDBColumn;
    TVIDSeq1: TcxGridDBColumn;
    TVPaginas1: TcxGridDBColumn;
    TVResultado1: TcxGridDBColumn;
    TVImpressora1: TcxGridDBColumn;
    TVDocumento1: TcxGridDBColumn;
    TVAcesso1: TcxGridDBColumn;
    TVComputador1: TcxGridDBColumn;
    GL: TcxGridLevel;
  private
    { Private declarations }
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  fbImp: TfbImp;

implementation

uses ucmaDM, ucmaPri;

{$R *.dfm}

{ TfbImp }

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
