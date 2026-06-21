unit uCMfbgImpressoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  dxDBTLCl, dxGrClms, Db, nxdb, ExtCtrls, dxExEdtr, Menus, am2000menuitem,
  am2000utils, am2000popupmenu, am2000, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  am2000mainmenu, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxCalendar, cxMaskEdit, cxImageComboBox,
  cxMemo, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGridLevel, cxGrid;
  

type
  TfbgImpressoes = class(TFrmBaseGrid)
    Tab: TnxTable;
    TabIDSeq: TAutoIncField;
    TabDataHora: TDateTimeField;
    TabComputador: TStringField;
    TabMaquina: TWordField;
    TabPaginas: TIntegerField;
    TabImpressora: TStringField;
    TabDocumento: TMemoField;
    TabAcesso: TIntegerField;
    DataSource1: TDataSource;
    GridIDSeq: TdxDBGridMaskColumn;
    GridDataHora: TdxDBGridDateColumn;
    GridComputador: TdxDBGridMaskColumn;
    GridMaquina: TdxDBGridMaskColumn;
    GridPaginas: TdxDBGridMaskColumn;
    GridImpressora: TdxDBGridMaskColumn;
    GridDocumento: TdxDBGridMemoColumn;
    GridAcesso: TdxDBGridMaskColumn;
    TabResultado: TWordField;
    GridResultado: TdxDBGridImageColumn;
    Timer1: TTimer;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DataHora1: TcxGridDBColumn;
    cxGrid1DBTableView1Maquina1: TcxGridDBColumn;
    cxGrid1DBTableView1IDSeq1: TcxGridDBColumn;
    cxGrid1DBTableView1Paginas1: TcxGridDBColumn;
    cxGrid1DBTableView1Resultado1: TcxGridDBColumn;
    cxGrid1DBTableView1Impressora1: TcxGridDBColumn;
    cxGrid1DBTableView1Documento1: TcxGridDBColumn;
    cxGrid1DBTableView1Acesso1: TcxGridDBColumn;
    cxGrid1DBTableView1Computador1: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FiltraDados; override;
    procedure Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant); override;
    
    { Public declarations }
  end;

var
  fbgImpressoes: TfbgImpressoes;

implementation

uses uCMDados, cmClassesBase, cmCompCliente;

{$R *.DFM}

{ TfbgImpressoes }

procedure TfbgImpressoes.FiltraDados;
begin
  inherited;
  Fim := Int(Fim) + 0.9999999;
  if not Tab.Active then Tab.Open;
  Tab.SetRange([Fim], [Inicio]);
  Tab.Refresh;
end;

procedure TfbgImpressoes.Inicializar(DentroTab: Boolean; aTipoFiltro: Byte;
  aFiltro: Variant);
begin
  inherited;
  cmSubPeriodo.Visible := ivAlways;
  cmHojeClick(cmHoje);
end;

procedure TfbgImpressoes.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  FiltraDados;
end;

end.
