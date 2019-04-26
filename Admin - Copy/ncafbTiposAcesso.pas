unit ncafbTiposAcesso;
{
    ResourceString: Dario 10/03/13
}

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
  cxMaskEdit, cxColorComboBox, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxLookAndFeels,
  cxLookAndFeelPainters, uParentedPanel, cxNavigator, dxPScxPivotGridLnk;

type
  TfbTiposAcesso = class(TFrmBase)
    Tab: TnxTable;
    dsTab: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    TabNome: TStringField;
    VNome1: TcxGridDBColumn;
    TabID: TWordField;
    TabTarifaPadrao: TIntegerField;
    TabTarifa: TIntegerField;
    TVTarifa: TcxGridDBColumn;
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FiltraDados; override;
    procedure AtualizaDireitos; override;
    class function Descricao: String; override;
  end;

var
  fbTiposAcesso: TfbTiposAcesso;

implementation

uses 
  ncaFrmPri, 
  ncaFrmTipoAcesso, 
  ncIDRecursos, 
  ncaDM, gifimage, ncClassesBase, ufmImagens;

// START resource string wizard section
resourcestring
  SGruposDeTarifa = 'Grupos de Tarifa';
  SNãoéPossívelApagarTodosGruposDeT = 'Não é possível apagar todos grupos de tarifas';
  SDesejaRealmenteApagarOGrupo = 'Deseja realmente apagar o grupo ';

// END resource string wizard section


{$R *.dfm}

{ TfbPacotes }

class function TfbTiposAcesso.Descricao: String;
begin
  Result := SGruposDeTarifa;
end;

procedure TfbTiposAcesso.FiltraDados;
begin
  inherited;
  if not Tab.Active then
    Tab.Open
  else
    Tab.Refresh  ;
end;

procedure TfbTiposAcesso.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  
  if gTarifas.Count > 0  then
  if gTarifas.PorCor[TabTarifaPadrao.Value]=nil then begin
    if gTarifas.PorCor[gConfig.TarifaPadrao]=nil then
      TabTarifa.Value := gConfig.TarifaPadrao else
      TabTarifa.Value := gTarifas[0].Cor;
  end else
    TabTarifa.Value := TabTarifaPadrao.Value;
end;

procedure TfbTiposAcesso.cmNovoClick(Sender: TObject);
begin
  inherited;
  TFrmTipoAcesso.Create(Self).Novo;
  Tab.Refresh;
end;

procedure TfbTiposAcesso.cmEditarClick(Sender: TObject);
var T : TncTipoAcesso;
begin
  inherited;

  T := gTiposAcesso.PorCodigo[TabID.Value];
  if T<>nil then begin
    TFrmTipoAcesso.Create(Self).Editar(T);
    Tab.Refresh;
  end;
end;

procedure TfbTiposAcesso.cmApagarClick(Sender: TObject);
var T : TncTipoAcesso;
begin
  inherited;
  if Tab.IsEmpty then Exit;
  if Tab.RecordCount=1 then begin
    ShowMessage(SNãoéPossívelApagarTodosGruposDeT);
    Exit;
  end;
  T := gTiposAcesso.PorCodigo[TabID.Value];
  if T<>nil then
  if SimNaoH(SDesejaRealmenteApagarOGrupo + TabNome.Value + '?', Handle) then
  begin
    Dados.CM.ApagaObj(T);
    Tab.Refresh;
  end;
end;

procedure TfbTiposAcesso.AtualizaDireitos;
begin
  inherited;
  cmApagar.Enabled := Permitido(daCFGPrecos);
  Tab.Refresh;
end;

end.

