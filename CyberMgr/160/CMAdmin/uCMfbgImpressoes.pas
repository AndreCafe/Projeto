unit uCMfbgImpressoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  dxDBTLCl, dxGrClms, Db, nxdb, ExtCtrls, dxExEdtr, Menus, am2000menuitem,
  am2000utils, am2000popupmenu, am2000, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  am2000mainmenu;
  

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

uses uCMDados, uCMFrmGrupo, cmClassesBase, cmCompCliente;

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
