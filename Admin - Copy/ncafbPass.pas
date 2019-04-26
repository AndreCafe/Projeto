unit ncafbPass;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, ncPassaportes, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxBar, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxTextEdit, cxMaskEdit, cxCheckBox, cxCalendar, cxTimeEdit,
  cxDBLookupComboBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, nxdb,
  cxCurrencyEdit, cxGridCustomPopupMenu, cxGridPopupMenu, dxBarExtItems,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, cxContainer,
  cxLabel, StdCtrls, cxRadioGroup, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, LMDControl, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxLookAndFeels,
  cxLookAndFeelPainters, uParentedPanel, cxNavigator, dxPScxPivotGridLnk;

type
  TfbPassaportes = class(TFrmBase)
    Tab: TnxTable;
    TabTipoPass: TIntegerField;
    TabCliente: TIntegerField;
    TabExpirou: TBooleanField;
    TabSenha: TStringField;
    TabPrimeiroUso: TDateTimeField;
    TabTipoAcesso: TIntegerField;
    TabTipoExp: TWordField;
    TabExpirarEm: TDateTimeField;
    TabMaxSegundos: TIntegerField;
    TabSegundos: TIntegerField;
    TabAcessos: TIntegerField;
    TabDia1: TIntegerField;
    TabDia2: TIntegerField;
    TabDia3: TIntegerField;
    TabDia4: TIntegerField;
    TabDia5: TIntegerField;
    TabDia6: TIntegerField;
    TabDia7: TIntegerField;
    TabDataCompra: TDateTimeField;
    TabValido: TBooleanField;
    TabValor: TCurrencyField;
    TabTempoTotal: TTimeField;
    TabTempoUsado: TTimeField;
    dsTab: TDataSource;
    Timer2: TTimer;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVExpirou: TcxGridDBColumn;
    TVDataCompra: TcxGridDBColumn;
    TVPrimeiroUso: TcxGridDBColumn;
    TVAcessos: TcxGridDBColumn;
    TVTempoTotal: TcxGridDBColumn;
    TVTempoUsado: TcxGridDBColumn;
    TVNomePass: TcxGridDBColumn;
    GL: TcxGridLevel;
    TabID: TAutoIncField;
    TabTran: TIntegerField;
    TabSessao: TIntegerField;
    panFiltro: TLMDSimplePanel;
    cmExpirar: TdxBarLargeButton;
    TabNome: TStringField;
    TabCartao: TBooleanField;
    rgTodos: TcxRadioButton;
    rgExpirados: TcxRadioButton;
    rgValidos: TcxRadioButton;
    lbOpMostrar: TcxLabel;
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure cmMostrarChange(Sender: TObject);
    procedure TVPrimeiroUsoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure cmEditarClick(Sender: TObject);
    procedure FrmBasePaiClose(Sender: TObject; var Action: TCloseAction);
    procedure rgValidosClick(Sender: TObject);
    procedure cmExpirarClick(Sender: TObject);
  private
    FOpMostrar: Integer;
    { Private declarations }
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;

    { Public declarations }
  end;

var
  fbPassaportes: TfbPassaportes;

const
  fpass_Nenhum  = 0;
  fpass_Cliente = 1;  

implementation

uses 
  ncaFrmPri, 
  ncaFrmPass, 
  ncClassesBase, 
  ncaDM, 
  ncAuxPassaporte, 
  ncIDRecursos, umsg, ncSessao, ncDMServ, ufmImagens;

// START resource string wizard section
resourcestring
  SSemUso = 'Sem Uso';
  SDesejaRealmenteCancelarEsseCrédi = 'Deseja realmente cancelar esse crédito ?';
  SCréditosPromocionais = 'Créditos Promocionais';

// END resource string wizard section


{$R *.dfm}

{ TfbPassaportes }

procedure TfbPassaportes.FiltraDados;
begin
  inherited;
  try
    if not Tab.Active then Tab.Open;
    
    case FOpMostrar of 
      0 : 
      if Operacao=fpass_Cliente then begin
        Tab.IndexName := 'ICliExpID'; // do not localize
        Tab.SetRange([Filtro, False], [Filtro, False]);
      end else begin
        Tab.IndexName := 'IExpID'; // do not localize
        Tab.SetRange([False], [False]);
      end;  
  
      1 : 
      if Operacao=fpass_Cliente then begin
        Tab.IndexName := 'ICliExpID'; // do not localize
        Tab.SetRange([Filtro, True], [Filtro, True]);
      end else begin
        Tab.IndexName := 'IExpID'; // do not localize
        Tab.SetRange([True], [True]);
      end;
  
      2 :
      if Operacao=fpass_Cliente then begin
        Tab.IndexName := 'ICliExpID'; // do not localize
        Tab.SetRange([Filtro], [Filtro]);
      end else begin
        Tab.IndexName := 'ISenha'; // do not localize
        Tab.CancelRange;
        Tab.Last;
      end;
    end; 
    cmEditar.Enabled := not Tab.IsEmpty;
    cmExpirar.Enabled := Permitido(daCliDebitarTempo) and (not Tab.IsEmpty);
  finally
    TV.DataController.DataModeController.GridMode := True;
    TV.DataController.DataModeController.SyncMode := True;
    TV.DataController.DataSource := dsTab;
  end;
end;

procedure TfbPassaportes.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  FOpMostrar := 0;
end;

procedure TfbPassaportes.rgValidosClick(Sender: TObject);
begin
  inherited;
  FOpMostrar := TControl(Sender).Tag;
  FiltraDados;
end;

procedure TfbPassaportes.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  TabTempoTotal.Value := TabMaxSegundos.Value / SegundosPorDia;
  TabTempoUsado.Value := TabSegundos.Value / SegundosPorDia;
end;

procedure TfbPassaportes.cmMostrarChange(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbPassaportes.AtualizaDireitos;
begin
  inherited;
  cmExpirar.Enabled := Permitido(daCliDebitarTempo) and Tab.Active and (not Tab.IsEmpty);
end;

procedure TfbPassaportes.TVPrimeiroUsoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  if AText='30/12/1899' then // do not localize
    AText := SSemUso;
end;

procedure TfbPassaportes.cmEditarClick(Sender: TObject);
var P : TncPassaporte;
begin
  if Tab.IsEmpty then Exit;
  
  P := TncPassaporte.Create;
  try
    P.LoadFromDataset(Tab);
    P.pcNome := TabNome.Value;
    TFrmPassaporte.Create(Self).Editar(False, P);
  finally
    P.Free;
  end; 
end;

procedure TfbPassaportes.cmExpirarClick(Sender: TObject);
var 
  S: TncSessao;
  I: Integer;
  Ok: Boolean;
begin
  inherited;

  if Tab.IsEmpty then Exit;
  
  
  if not NaoSim(SDesejaRealmenteCancelarEsseCrédi) then begin
    S := Dados.CM.Sessoes.PorPassaporte[TabID.Value];
    I := TabCliente.Value;
    Tab.Edit;
    TabExpirou.Value := True;
    Tab.Post;
    if S<>nil then
      Dados.CM.ForceRefreshSessao(S.ID);
    if (I>0) then begin
      Ok := DM.tCli.Locate('ID', I, []); // do not localize
      if Ok then
        DM.RecalcPass;
    end; 
  end;
end;

class function TfbPassaportes.Descricao: String;
begin
  Result := SCréditosPromocionais;
end;

procedure TfbPassaportes.FrmBasePaiClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.

