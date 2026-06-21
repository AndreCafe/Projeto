unit uCMfbgLog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, Db, nxdb, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, dxDBTLCl, dxGrClms,
  ExtCtrls, StdCtrls, Buttons, dxExEdtr, Menus, am2000menuitem,
  am2000utils, am2000popupmenu, am2000, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  am2000mainmenu;

type
  TfbgLog = class(TFrmBaseGrid)
    Tab: TnxTable;
    dsTab: TDataSource;
    TabNumSeq: TAutoIncField;
    TabDiaHora: TDateTimeField;
    TabMaquina: TWordField;
    TabUsuario: TStringField;
    TabPrograma: TWordField;
    TabOperacao: TStringField;
    GridNumSeq: TdxDBGridMaskColumn;
    GridDiaHora: TdxDBGridDateColumn;
    GridMaquina: TdxDBGridMaskColumn;
    GridOperacao: TdxDBGridMaskColumn;
    GridPrograma: TdxDBGridImageColumn;
    GridHoras: TdxDBGridTimeColumn;
    TabHoras: TDateTimeField;
    TabDias: TWordField;
    GridDias: TdxDBGridSpinColumn;
    procedure GridFilterChanged(Sender: TObject; ADataSet: TDataSet;
      const AFilterText: String);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant); override;
    procedure FiltraDados; override;
  end;

var
  fbgLog: TfbgLog;

implementation

uses uCMDados, uCMFrmPri, uCMFrmCaixa, cmIDRecursos;

{$R *.DFM}

{ TfbgCaixa }


procedure TfbgLog.FiltraDados;
begin
  Tab.DisableControls;
  Fim := Int(Fim) + 0.9999999;
  try
    if not Tab.Active then Tab.Open;

    Tab.IndexName := 'IDiaHora';
    Tab.SetRange([Inicio], [Fim]);

    Tab.Refresh;
    Tab.Filtered := True;
    Tab.Filter := Grid.Filter.FilterText;
    Tab.Last;

    if Grid.DataSource = nil then
      Grid.Datasource := dsTab;
  finally
    Tab.EnableControls;
  end;
end;

procedure TfbgLog.Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant);
begin
  Grid.DataSource := nil;
  inherited;
  
  cm2DiasClick(cm1Semana);
  cmSubPeriodo.Visible := ivAlways;  
end;

procedure TfbgLog.GridFilterChanged(Sender: TObject; ADataSet: TDataSet;
  const AFilterText: String);
begin
  FiltraDados;
end;

end.
