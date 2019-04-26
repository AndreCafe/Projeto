unit ncafbCartoes;

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
  LMDCustomBevelPanel, LMDSimplePanel, LMDControl, 
  cxImageComboBox, ImgList;

type
  TfbCartoes = class(TFrmBase)
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
    TabID: TAutoIncField;
    TabTran: TIntegerField;
    TabSessao: TIntegerField;
    cmImprimeCartao: TdxBarLargeButton;
    LMDSimplePanel1: TLMDSimplePanel;
    bdcGrid: TdxBarDockControl;
    BarMgrBar2: TdxBar;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVSenha: TcxGridDBColumn;
    TVPrimeiroUso: TcxGridDBColumn;
    TVAcessos: TcxGridDBColumn;
    TVTempoTotal: TcxGridDBColumn;
    TVTempoUsado: TcxGridDBColumn;
    GL: TcxGridLevel;
    cmEditar2: TdxBarButton;
    cmExpirar: TdxBarButton;
    cmSubMostrar: TdxBarSubItem;
    cmMostrar: TdxBarListItem;
    edSenha: TcxTextEdit;
    cmContEdBusca: TdxBarControlContainerItem;
    cmEncontrar: TdxBarStatic;
    cxImageList1: TcxImageList;
    TabStatus: TWordField;
    TVStatus: TcxGridDBColumn;
    BarMgrBar3: TdxBar;
    TVNome: TcxGridDBColumn;
    TabNome: TStringField;
    dxBarDockControl2: TdxBarDockControl;
    TabCartao: TBooleanField;
    cmLegenda: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure cmMostrarChange(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure FrmBasePaiClose(Sender: TObject; var Action: TCloseAction);
    procedure edSenhaPropertiesChange(Sender: TObject);
    procedure cmExpirarClick(Sender: TObject);
    procedure cmMostrarClick(Sender: TObject);
    procedure cmImprimeCartaoClick(Sender: TObject);
    procedure TVTempoTotalGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVTempoUsadoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVTempoTotalCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVTempoUsadoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    FOpMostrar: Integer;
    { Private declarations }
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;
    procedure AjustaBotoes;
    { Public declarations }
  end;

var
  fbCartoes: TfbCartoes;

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
  ncIDRecursos, umsg, ncSessao, ncaFrmImpPrePago;

{$R *.dfm}

{ TfbPassaportes }

procedure TfbCartoes.FiltraDados;
begin
  inherited;
  try
    if not Tab.Active then Tab.Open;

    case cmMostrar.ItemIndex of
      0 : cmSubMostrar.Caption := 'Mostrar: Não Expirados';
      1 : cmSubMostrar.Caption := 'Mostrar: Expirados';
      2 : cmSubMostrar.Caption := 'Mostrar: Todos';
    end;

    if (edSenha.Text>'') then begin
      Tab.IndexName := 'ISenha';
      Tab.SetRange([edSenha.Text], [edSenha.Text+'zzzzzzzzzzzzzzzz']);
      Tab.Refresh;
    end else
      case cmMostrar.ItemIndex of 
        0 : 
        begin
          Tab.IndexName := 'ICartaoExpID';
          Tab.SetRange([True, False], [True, False]);
        end;  
    
        1 : 
        begin
          Tab.IndexName := 'ICartaoExpID';
          Tab.SetRange([True, True], [True, True]);
        end;
    
        2 :
        begin
          Tab.IndexName := 'ICartaoID';
          Tab.SetRange([True], [True]);
          Tab.Last;
        end;
      end; 
      AjustaBotoes;
  finally
    TV.DataController.DataModeController.GridMode := True;
    TV.DataController.DataModeController.SyncMode := True;
    TV.DataController.DataSource := dsTab;
  end;
end;

procedure TfbCartoes.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  TV.DataController.DataSource := nil;
end;

procedure TfbCartoes.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  TabTempoTotal.Value := TabMaxSegundos.Value / SegundosPorDia;
  TabTempoUsado.Value := TabSegundos.Value / SegundosPorDia;

  if TabExpirou.Value then
    TabStatus.Value := 1
  else
  if not TabValido.Value then
    TabStatus.Value := 2
  else
    TabStatus.Value := 0;  
end;

procedure TfbCartoes.cmMostrarChange(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbCartoes.cmMostrarClick(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbCartoes.AjustaBotoes;
begin
  cmEditar2.Enabled := not Tab.IsEmpty;
  cmExpirar.Enabled := cmEditar2.Enabled;
  cmSubMostrar.Enabled := cmEditar2.Enabled;
  cmEncontrar.Enabled := cmEditar2.Enabled;
  cmLegenda.Enabled := cmEditar2.Enabled;
end;

procedure TfbCartoes.AtualizaDireitos;
begin
  inherited;
  cmExpirar.Enabled := Permitido(daCliDebitarTempo);
  cmImprimeCartao.Enabled := Permitido(daPPGImpPPInvalido) or Permitido(daPPGImpPPValido);
  TVSenha.Hidden := not Permitido(daVerSenhaPassaporte);
  TVSenha.Visible := not TVSenha.Hidden;
end;

procedure TfbCartoes.TVTempoTotalCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  ACanvas.Font.Style := [fsBold];
end;

procedure TfbCartoes.TVTempoTotalGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  inherited;
  V := ARecord.Values[TVTempoTotal.Index];
  if V=null then Exit;
  AText := MinutosToHMSStr(V/60);
end;

procedure TfbCartoes.TVTempoUsadoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  with AViewInfo do
    if (Value=null) or (Value=0) then
      ACanvas.Font.Color := clSilver;
end;

procedure TfbCartoes.TVTempoUsadoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  inherited;
  V := ARecord.Values[TVTempoUsado.Index];
  if (V=null) or (V=0) then 
    AText := 'Não foi utilizado' else
    AText := MinutosToHoraStr(V/60) + ' utilizados';
end;

procedure TfbCartoes.cmEditarClick(Sender: TObject);
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

procedure TfbCartoes.cmExpirarClick(Sender: TObject);
var S: TncSessao;
begin
  inherited;

  if Tab.IsEmpty then Exit;
  
  
  if TabExpirou.Value then begin
    ShowMessage('Não é possível cancelar um cartão expirado');
    Exit;
  end else
  if not NaoSim('Deseja realmente cancelar esse cartão de tempo?') then begin
    Tab.Edit;
    TabExpirou.Value := True;
    Tab.Post;
    S := Dados.CM.Sessoes.PorPassaporte[TabID.Value];
    if S<>nil then
      Dados.CM.ForceRefreshSessao(S.ID);
  end;
end;

class function TfbCartoes.Descricao: String;
begin
  Result := 'Cartões de Tempo';
end;

procedure TfbCartoes.cmImprimeCartaoClick(Sender: TObject);
begin
  inherited;
  TFrmImpPrePago.Create(Self).ShowModal;
end;

procedure TfbCartoes.edSenhaPropertiesChange(Sender: TObject);
begin
  inherited;
  if Trim(edSenha.Text)>'' then begin
    Tab.IndexName := 'ISenha';
    Tab.SetRange([edSenha.Text], [edSenha.Text+'zzzzzzzzzzzzz']);
    AjustaBotoes;
  end else
    FiltraDados;
end;

procedure TfbCartoes.FrmBasePaiClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
