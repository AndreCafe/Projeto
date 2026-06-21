unit uCMFrmBaseGrid2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxDBTLCl, dxGrClms, dxDBGrid, dxTL, dxDBCtrl,
  dxCntner, lmdcctrl, dxBar, dxBarExtItems, 
  dxPSCore, 
  uFrmDadosTot,
  LMDSimplePanel, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  dxExEdtr, LMDControl, LMDBaseControl, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton, TB97Tlbr, TB97Ctls, TB97,
  am2000options, am2000skin, am2000, SubMenu2000, Menus, am2000menuitem,
  am2000utils, am2000popupmenu;

type
  TFrmBaseGrid2 = class(TForm)
    BarMgr: TdxBarManager;
    cmSubPeriodo: TdxBarSubItem;
    cmHoje: TdxBarButton;
    cmEstaSemana: TdxBarButton;
    cmPeriodoTudo: TdxBarButton;
    cmEsteMes: TdxBarButton;
    cmEsteAno: TdxBarButton;
    cmInicio: TdxBarDateCombo;
    cmFim: TdxBarDateCombo;
    cmPreviewObs: TdxBarLargeButton;
    cmDias: TdxBarSubItem;
    cm2dias: TdxBarButton;
    cm3dias: TdxBarButton;
    cm4dias: TdxBarButton;
    cm5dias: TdxBarButton;
    cm6dias: TdxBarButton;
    cm1semana: TdxBarButton;
    cm1Mes: TdxBarButton;
    cm1ano: TdxBarButton;
    cmImprimir: TdxBarButton;
    cmExportar: TdxBarButton;
    cmLayout: TdxBarSubItem;
    cmCustomizar: TdxBarButton;
    cmLayoutSalvar: TdxBarButton;
    cmLayouts: TdxBarListItem;
    cmAno: TdxBarSubItem;
    cmAnos: TdxBarListItem;
    cmMes: TdxBarSubItem;
    cmMeses: TdxBarListItem;
    cmSalvarAtual: TdxBarButton;
    cmAno1: TdxBarSubItem;
    cmAno2: TdxBarSubItem;
    cmAno3: TdxBarSubItem;
    cmAno4: TdxBarSubItem;
    cmAno5: TdxBarSubItem;
    cmAno6: TdxBarSubItem;
    cmAno7: TdxBarSubItem;
    cmAno8: TdxBarSubItem;
    cmAno9: TdxBarSubItem;
    cmAno10: TdxBarSubItem;
    cmSalvarPadrao: TdxBarButton;
    cmOpcoes: TdxBarSubItem;
    cmRestaurar: TdxBarButton;
    cmTotalizar: TdxBarButton;
    cmResetarLayout: TdxBarButton;
    cmGrafico: TdxBarLargeButton;
    cmArquivo: TdxBarSubItem;
    cmRefresh: TdxBarLargeButton;
    cmFechar: TdxBarLargeButton;
    pmLocalizar: TdxBarPopupMenu;
    cmLocalizar: TdxBarSubItem;
    cmColunas: TdxBarListItem;
    cmSubEditar: TdxBarSubItem;
    cmNovo: TdxBarLargeButton;
    cmApagar: TdxBarLargeButton;
    cmEditar: TdxBarLargeButton;
    cmSubExibir: TdxBarSubItem;
    panPri: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    Grid: TdxDBGrid;
    BarDockControl: TdxBarDockControl;
    procedure cmPreviewObsClick(Sender: TObject);
    procedure cmRefreshClick(Sender: TObject);
    procedure cmHojeClick(Sender: TObject);
    procedure cmPeriodoTudoClick(Sender: TObject);
    procedure cmEstaSemanaClick(Sender: TObject);
    procedure cmEsteMesClick(Sender: TObject);
    procedure cmEsteAnoClick(Sender: TObject);
    procedure cm2diasClick(Sender: TObject);
    procedure cmInicioChange(Sender: TObject);
    procedure cmFimChange(Sender: TObject);
    procedure cmImprimirClick(Sender: TObject);
    procedure cmCustomizarClick(Sender: TObject);
    procedure cmLayoutSalvarClick(Sender: TObject);
    procedure cmLayoutsClick(Sender: TObject);
    procedure cmExportarClick(Sender: TObject);
    procedure cmAnosClick(Sender: TObject);
    procedure cmSalvarAtualClick(Sender: TObject);
    procedure cmMesesClick(Sender: TObject);
    procedure cmAno1Click(Sender: TObject);
    procedure GridCustomDrawFooter(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      var AText: String; var AColor: TColor; AFont: TFont;
      var AAlignment: TAlignment; var ADone: Boolean);
    procedure GridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cmSalvarPadraoClick(Sender: TObject);
    procedure cmRestaurarClick(Sender: TObject);
    procedure GridCustomDrawFooterNode(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      AFooterIndex: Integer; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure cmResetarLayoutClick(Sender: TObject);
    procedure cmGraficoClick(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridEndColumnsCustomizing(Sender: TObject);
    procedure GridColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure GridHideColumn(Sender: TObject; Column: TdxDBTreeListColumn);
    procedure cmColunasClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function GridPath: String;
    procedure RefreshLocalizar;
  public
    { Public declarations }
    Inicio, 
    Fim        : TDateTime;
    TipoFiltro : Byte;
    Filtro     : Variant;
    AnoMenu    : Integer;
    TotInfo    : TTotInfo;
    BarraPri   : TdxBar;
    procedure FiltraDados; virtual;
    procedure Atualizar; virtual;
    procedure SetFiltro(aTipoFiltro: Byte; aFiltro: Variant); virtual;
    procedure Inicializar(BM: TdxBarManager; aParent: TWinControl; aTipoFiltro: Byte; aFiltro: Variant); virtual;
    procedure RefreshLayouts;
    procedure SalvaUltimo;
    procedure SalvaLayout(Nome: String);
    procedure LeLayout(Nome: String);
    function FrmSeparado: Boolean;

    procedure AjustaVisiblePeriodo(V: Boolean);

    constructor Create(AOwner: TComponent); override;

    procedure Novo; virtual;
    procedure Editar; virtual;
    procedure Apagar; virtual;

    procedure AplicaDireitosUsuario; virtual;
    function IDRecurso: Integer; virtual; abstract;
  end;

var
  FrmBaseGrid2: TFrmBaseGrid2;

implementation

uses uCMDados, uCMFrmPri, dxGridMenus, uTotGrid, DevExUtil;

{$R *.DFM}

function LayoutInvisivel(Nome: String): Boolean;
begin
  Nome := UpperCase(Nome);
  Result := (Pos('ULTIMO', Nome)>0) or
            (Pos('PADRAO', Nome)>0) or
            (Pos('ORIGINAL', Nome)>0);
end;

function ForceExt(Nome, Ext: String): String;
begin
  if Pos('.', Nome) > 0 then
    Result := Copy(Nome, 1, Pos('.', Nome)-1)
  else 
    Result := Nome;  
  if Ext > '' then  
    Result := Result + '.' + Ext;  
end;

procedure TFrmBaseGrid2.SetFiltro(aTipoFiltro: Byte; aFiltro: Variant);
begin
  TipoFiltro := aTipoFiltro;
  Filtro := aFiltro;
  FiltraDados;
end;

procedure TFrmBaseGrid2.FiltraDados;
begin
end;

procedure TFrmBaseGrid2.Atualizar;
begin
  FiltraDados;
end;

procedure TFrmBaseGrid2.cmPreviewObsClick(Sender: TObject);
begin
  if cmPreviewObs.Down then 
    Grid.OptionsView := Grid.OptionsView + [edgoPreview]
  else
    Grid.OptionsView := Grid.OptionsView - [edgoPreview];
end;

procedure TFrmBaseGrid2.cmRefreshClick(Sender: TObject);
begin
  FiltraDados;
end;

function Minutos(Tempo: TDateTime): Integer;
var H, M, S, MS: Word;
begin
  DecodeTime(Tempo, H, M, S, MS);
  Result := M + (H*60);
end;

procedure TFrmBaseGrid2.cmHojeClick(Sender: TObject);
begin
  Inicio := Date;
  Fim    := Date;

  cmInicio.Date := Inicio;
  cmFim.Date    := Fim;
  cmSubPeriodo.Caption := 'Hoje';
  FiltraDados; 
end;

procedure TFrmBaseGrid2.cmPeriodoTudoClick(Sender: TObject);
begin
  Inicio := 0;
  Fim := Date+300000;
  cmInicio.Date := Inicio;
  cmFim.Date    := Fim;
  cmSubPeriodo.Caption := 'Tudo';
  FiltraDados;
end;

procedure TFrmBaseGrid2.cmEstaSemanaClick(Sender: TObject);
begin
  Fim := Date;
  Inicio := Date - (DayOfWeek(Date)-1);
  cmFim.Date := Fim;
  cmInicio.Date := Inicio;
  cmSubPeriodo.Caption := 'Esta Semana';
  FiltraDados;
end;

procedure TFrmBaseGrid2.cmEsteMesClick(Sender: TObject);
var D, M, Y : Word;
begin
  Fim := Date;
  cmFim.Date := Fim;
  
  DecodeDate(Date, Y, M, D);
  Inicio := EncodeDate(Y, M, 1);
  
  cmInicio.Date := Inicio;
  cmSubPeriodo.Caption := 'Este Mês';
  FiltraDados;
end;

procedure TFrmBaseGrid2.cmEsteAnoClick(Sender: TObject);
var D, M, Y : Word;
begin
  Fim := Date;
  cmFim.Date := Fim;
  
  DecodeDate(Date, Y, M, D);
  Inicio := EncodeDate(Y, 1, 1);
  cmInicio.Date := Inicio;
  cmSubPeriodo.Caption := 'Este Ano';
  FiltraDados;
end;

procedure TFrmBaseGrid2.cm2diasClick(Sender: TObject);
begin
  with TComponent(Sender) do begin
    Fim := Date;
    cmFim.Date := Fim;
    Inicio := Date - Tag;
    cmInicio.Date := Inicio;
    
    if Tag < 7 then
      cmSubPeriodo.Caption := IntToStr(Tag) + ' Dias'
    else case Tag of
      7 : cmSubPeriodo.Caption := '1 Semana';
      30 : cmSubPeriodo.Caption := '1 Mês';
      365 : cmSubPeriodo.Caption := '1 Ano';
    end;  
  end;  
  FiltraDados;
end;

procedure TFrmBaseGrid2.cmInicioChange(Sender: TObject);
begin
  if cmInicio.FocusedItemLink=nil then Exit;
  if Inicio=cmInicio.CurDate then Exit;
  Inicio := cmInicio.CurDate;
  FiltraDados;
  cmSubPeriodo.Caption := 'De ' + FormatDateTime('dd/mm/yyyy', Inicio) +
                          ' a ' + FormatDateTime('dd/mm/yyyy', Fim);
end;

procedure TFrmBaseGrid2.cmFimChange(Sender: TObject);
begin
  if cmFim.FocusedItemLink=nil then Exit;
  if Fim=cmFim.CurDate then Exit;
  Fim := cmFim.CurDate;
  FiltraDados;
  cmSubPeriodo.Caption := 'De ' + FormatDateTime('dd/mm/yyyy', Inicio) +
                          ' a ' + FormatDateTime('dd/mm/yyyy', Fim);
end;

procedure TFrmBaseGrid2.SalvaUltimo;
begin
  SalvaLayout('Ultimo.pes');
end;

procedure TFrmBaseGrid2.SalvaLayout(Nome: String);
var S : TMemoryStream;
begin
  with Dados do begin
    if tbLayout.FindKey([False, Copy(Self.ClassName, 5, 100), CM.Username, Nome]) then
      tbLayout.Edit
    else
      tbLayout.Insert;

    tbLayoutUsuario.Value := CM.Username;
    tbLayoutGrid.Value := Copy(Self.ClassName, 5, 100);
    tbLayoutPublico.Value := False;
    tbLayoutNome.Value := Nome; 

    SaveLayoutToDataset(tbLayout, 'Layout', Grid, panPri.Parent);
    S := TMemoryStream.Create;
    try
      SaveDBGridFilterToStream(S, Grid.Filter);
      tbLayoutFiltro.LoadFromStream(S);
    finally
      S.Free;
    end;  

    tbLayout.Post;

    if not LayoutInvisivel(Nome) then begin
      cmSalvarAtual.Caption := 'Salvar ' + ForceExt(Nome, '');
      cmSalvarAtual.Visible := ivAlways;
    end else
      cmSalvarAtual.Visible := ivNever;
      
    RefreshLayouts;
  end;
end;

procedure TFrmBaseGrid2.AjustaVisiblePeriodo(V: Boolean);
begin
  if V then
    cmSubPeriodo.Visible := ivAlways
  else
    cmSubPeriodo.Visible := ivNever;  
end;

procedure TFrmBaseGrid2.LeLayout(Nome: String);
var 
  I : Integer;
  S : TMemoryStream;
  NomeGrid : String;
begin
  NomeGrid := Copy(ClassName, 5, 100);
  with Dados do begin
    if not tbLayout.FindKey([False, NomeGrid, CM.Username, Nome]) then Exit;

    with Grid do
    for I := 0 to pred(ColumnCount) do 
      TdxDBGridColumn(Columns[I]).GroupIndex := -1;

    LoadLayoutFromDataset(tbLayout, 'Layout', Grid, panPri.Parent);

    S := TMemoryStream.Create;
    try
      tbLayoutFiltro.SaveToStream(S);
      S.Position := 0;
      LoadDBGridFilterFromStream(S, Grid.Filter);
    finally
      S.Free;
    end;
    
    if not LayoutInvisivel(Nome) then begin
      cmSalvarAtual.Caption := 'Salvar ' + ForceExt(Nome, '');
      cmSalvarAtual.Visible := ivAlways;
    end else
      cmSalvarAtual.Visible := ivNever; 
  end;     
end;

function TFrmBaseGrid2.FrmSeparado: Boolean;
begin
  Result := (panPri.Parent=Self);
end;

procedure TFrmBaseGrid2.Inicializar(BM: TdxBarManager; aParent: TWinControl; aTipoFiltro: Byte; aFiltro: Variant);
var D, M, Y : Word;
begin
  cmArquivo.Visible := ivNever;
  
  {$I-}
  MkDir(GridPath);
  {$I+}
  
  SalvaLayout('Original');
  
  Grid.OptionsBehavior := Grid.OptionsBehavior + [edgoStoreToIniFile];
  RefreshLayouts;
  cmPreviewObs.Down := (edgoPreview in Grid.OptionsView);
  Fim := Date;
  DecodeDate(Date, Y, M, D);
  Inicio := EncodeDate(Y, M, 1);
  cmFim.Date := Fim;
  cmInicio.Date := Inicio;
  cmSubPeriodo.Caption := 'Este Mês';
  
  panPri.Visible := False;  
  panPri.Parent := aParent;
  panPri.Left := 0;
  panPri.Top := 0;
  panPri.Bevel.BorderWidth := 0;
  
  BarMgr.BarByName('Barra2').Free;
  BarMgr.BarByName('barMenu').Free;
  
  BarDockControl.BarManager := BM;

  BarraPri := BM.Bars.Add;
  with BarraPri do begin
    Assign(BarMgr.BarByName('barFiltro'));
    DockControl := BarDockControl;
    DockedDockControl := BarDockControl;
    AllowClose := False;
    AllowCustomizing := False;
    BorderStyle := bbsNone;
    Visible := True;
  end;
  BarMgr.BarByName('barFiltro').Free;
  panPri.Visible := True;

  TipoFiltro := aTipoFiltro;
  Filtro := aFiltro;

  if cmSubPeriodo.Visible=ivAlways then
    cmHojeClick(nil)
  else
    FiltraDados;  

  LeLayout('Padrao');
end;


procedure TFrmBaseGrid2.cmImprimirClick(Sender: TObject);
begin
  FrmPri.ImprimirGrid(Grid);
end;

procedure TFrmBaseGrid2.cmCustomizarClick(Sender: TObject);
begin
  Grid.ColumnsCustomizing;
end;

function ObtemNomeArq(var Nome: String): Boolean;
begin
  Nome := '';
  Result := InputQuery(Application.Title, 
                       'Digite um nome para este layout:', Nome);
end;

procedure TFrmBaseGrid2.cmLayoutSalvarClick(Sender: TObject);
var NomeArq: String;
begin
  if ObtemNomeArq(NomeArq) and (NomeArq>'') then 
    SalvaLayout(NomeArq);
  RefreshLayouts;
end;

procedure TFrmBaseGrid2.RefreshLayouts;
var NomeGrid: String;
begin
  cmLayouts.Items.Clear;
  with Dados do begin
    NomeGrid := Copy(Self.ClassName, 5, 100);
    tbLayout.SetRange([False, NomeGrid, CM.Username], 
                      [False, NomeGrid, CM.Username]);
    try                      
      tbLayout.First;
      while not tbLayout.Eof do begin
        if not LayoutInvisivel(tbLayoutNome.Value) then
          cmLayouts.Items.Add(tbLayoutNome.Value);
        tbLayout.Next;
      end;                      
    finally
      tbLayout.CancelRange;
    end;    
  end; 
end;

procedure TFrmBaseGrid2.cmLayoutsClick(Sender: TObject);
begin
  LeLayout(cmLayouts.Items[cmLayouts.ItemIndex]);
  cmPreviewObs.Down := (edgoPreview in Grid.OptionsView);
end;

procedure TFrmBaseGrid2.cmExportarClick(Sender: TObject);
begin
  FrmPri.ExportarGrid(Grid);
end;

constructor TFrmBaseGrid2.Create(AOwner: TComponent);
var Dia, Mes, Ano, I : Word;
begin
  inherited;
  TotInfo.Limpa;
  cmAnos.Items.Clear;
  DecodeDate(Date, Ano, Mes, Dia);
  for I := 1 to 10 do 
  cmAnos.Items.AddObject(IntToStr(Ano-I), TObject(Ano-I));
  cmAno1.Caption := IntToStr(Ano);
  cmAno2.Caption := IntToStr(Ano-1);
  cmAno3.Caption := IntToStr(Ano-2);
  cmAno4.Caption := IntToStr(Ano-3);
  cmAno5.Caption := IntToStr(Ano-4);
  cmAno6.Caption := IntToStr(Ano-5);
  cmAno7.Caption := IntToStr(Ano-6);
  cmAno8.Caption := IntToStr(Ano-7);
  cmAno9.Caption := IntToStr(Ano-8);
  cmAno10.Caption := IntToStr(Ano-9);
end;

procedure TFrmBaseGrid2.cmAnosClick(Sender: TObject);
begin
  with cmAnos do begin
    Inicio := EncodeDate(Integer(Items.Objects[ItemIndex]), 1, 1);
    Fim    := EncodeDate(Integer(Items.Objects[ItemIndex]), 12, 31);
    cmInicio.Date := Inicio;
    cmFim.Date := Fim;
    cmSubPeriodo.Caption := Items[ItemIndex];
    FiltraDados;
  end;  
end;

procedure TFrmBaseGrid2.cmSalvarAtualClick(Sender: TObject);
begin
  SalvaLayout(Copy(cmSalvarAtual.Caption, 8, 300));
end;

procedure TFrmBaseGrid2.cmMesesClick(Sender: TObject);
begin
  Inicio := EncodeDate(AnoMenu, cmMeses.ItemIndex+1, 1);
  Fim    := EncodeDate(AnoMenu, cmMeses.ItemIndex+2, 1)-1;
  cmInicio.Date := Inicio;
  cmFim.Date := Fim;
  cmSubPeriodo.Caption := IntToStr(cmMeses.ItemIndex+1) + '/' + IntToStr(AnoMenu);
  FiltraDados;
end;

procedure TFrmBaseGrid2.cmAno1Click(Sender: TObject);
begin
  AnoMenu := StrToInt(TdxBarSubItem(Sender).Caption);
end;

procedure TFrmBaseGrid2.GridCustomDrawFooter(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; var AText: String; var AColor: TColor;
  AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
begin
  if AText > '' then begin
    if Pos('=', AText)>0 then Delete(AText, 1, Pos('=', AText));
    AText := Trim(AText);
    case TdxDBTreeListColumn(AColumn).SummaryFooterType of
      cstMin : AText := 'Min = ' + AText;
      cstMax : AText := 'Max = ' + AText;
      cstSum : AText := 'Tot = ' + AText;
      cstAvg : AText := 'Med = ' + AText;
    end;  
  end;  
end;

procedure TFrmBaseGrid2.GridMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button <> mbRight then exit;
  // show popup
  TdxDBGridPopupMenuManager.Instance.ShowGridPopupMenu(TdxDBGrid(Sender));
end;

function TFrmBaseGrid2.GridPath: String;
begin
  Result := Application.ExeName;
  while Result[Length(Result)] <> '\' do
    Delete(Result, Length(Result), 1);
  Result := Result + 'Pesquisa\' + Copy(ClassName, 5, 100) + '\';
end;

procedure TFrmBaseGrid2.cmSalvarPadraoClick(Sender: TObject);
begin
  SalvaLayout('Padrao');
end;

procedure TFrmBaseGrid2.cmRestaurarClick(Sender: TObject);
begin
  LeLayout('Original');
  SalvaLayout('Padrao');
end;

procedure TFrmBaseGrid2.GridCustomDrawFooterNode(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; AFooterIndex: Integer; var AText: String;
  var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
  var ADone: Boolean);
begin
  if AText > '' then begin
    if Pos('=', AText)>0 then Delete(AText, 1, Pos('=', AText));
    AText := Trim(AText);
    case TdxDBGridColumn(AColumn).SummaryType of
      cstMin : AText := 'Min = ' + AText;
      cstMax : AText := 'Max = ' + AText;
      cstSum : AText := 'Tot = ' + AText;
      cstAvg : AText := 'Med = ' + AText;
    end;  
  end;  
end;

procedure TFrmBaseGrid2.cmResetarLayoutClick(Sender: TObject);
begin
  if not Dados.tbLayout.FindKey([False, Copy(ClassName, 5, 100), Dados.CM.Username, 'Padrao']) then
    cmRestaurarClick(nil)
  else  
    LeLayout('Padrao');
end;

procedure TFrmBaseGrid2.cmGraficoClick(Sender: TObject);
begin
  with TotInfo do
  if (tiChave>'') and (Grid.FindColumnByFieldName(tiChave)=nil) then
    TotInfo.tiChave := '';
    
  if TotInfo.tiChave='' then begin
    TotInfo.LoadDefOptions(grid);
    with TFrmDadosTot.Create(Self) do
    if not Mostra(Self.Grid, @TotInfo) then Exit;
  end;  
  
  if TotInfo.tiChave>'' then
  with TFrmTotGrid.Create(Self) do
    Totalizar(Self.Grid, TotInfo);
end;

procedure TFrmBaseGrid2.Apagar;
begin
  {-----}
end;

procedure TFrmBaseGrid2.Editar;
begin
  {-----}
end;

procedure TFrmBaseGrid2.Novo;
begin
  {-----}
end;

procedure TFrmBaseGrid2.cmNovoClick(Sender: TObject);
begin
  Novo;
end;

procedure TFrmBaseGrid2.cmApagarClick(Sender: TObject);
begin
  Apagar;
end;

procedure TFrmBaseGrid2.cmEditarClick(Sender: TObject);
begin
  pmLayout.Items2000.A
  Editar;
end;

procedure TFrmBaseGrid2.cmFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBaseGrid2.RefreshLocalizar;
var I : Integer;
begin
  cmColunas.Items.Clear;
  with Grid do begin
    for I := 0 to pred(ColumnCount) do
    with Columns[I] do
    if Visible then
      cmColunas.Items.AddObject(Caption, Columns[I]);
    cmColunas.ItemIndex := 0;  
    cmColunas.ItemIndex := cmColunas.Items.IndexOfObject(Columns[0]);
    cmLocalizar.Enabled := True;
    EndSearch;
  end;
end;

procedure TFrmBaseGrid2.FormCreate(Sender: TObject);
begin
  BarraPri := nil;
  RefreshLocalizar;
end;

procedure TFrmBaseGrid2.GridEndColumnsCustomizing(Sender: TObject);
begin
  RefreshLocalizar;
end;

procedure TFrmBaseGrid2.GridColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  RefreshLocalizar;
end;

procedure TFrmBaseGrid2.GridHideColumn(Sender: TObject;
  Column: TdxDBTreeListColumn);
begin
  RefreshLocalizar;
end;

procedure TFrmBaseGrid2.cmColunasClick(Sender: TObject);
begin
  with cmColunas, Items do
  with TdxDBTreeListColumn(Objects[ItemIndex]) do begin
    Index := 0;
    Sorted := csUp;
  end;  
  Grid.SetFocus;
  Grid.EndSearch;
end;

procedure TFrmBaseGrid2.FormDestroy(Sender: TObject);
begin
  BarraPri.Free;
end;

procedure TFrmBaseGrid2.GridDblClick(Sender: TObject);
begin
  Editar;
end;

procedure TFrmBaseGrid2.FormShow(Sender: TObject);
begin
  Atualizar;
end;

procedure TFrmBaseGrid2.AplicaDireitosUsuario;
begin
  if cmArquivo.Visible=ivAlways then begin
  
  end;
end;

end.












       
