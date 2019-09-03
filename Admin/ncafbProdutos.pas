unit ncafbProdutos;
{
    ResourceString: Dario 10/03/13
}

interface

{$I NEX.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, cxGridCustomPopupMenu, cxGridPopupMenu, dxBar,
  dxBarExtItems, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxMaskEdit, cxCurrencyEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, nxdb, cxTextEdit,
  cxDBLookupComboBox, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, cxContainer, cxProgressBar, cxCheckBox, cxBarEditItem,
  cxImageComboBox, cxSpinEdit, cxLabel, StdCtrls, cxRadioGroup, Buttons,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, LMDControl, Menus, cxLookAndFeelPainters, cxButtons,
  cxLookAndFeels, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, cxNavigator, dxPScxPivotGridLnk, dxGDIPlusClasses,
  uParentedPanel;

type
  TfbProdutos = class(TFrmBase)
    Tab: TnxTable;
    TabUnid: TStringField;
    TabPreco: TCurrencyField;
    TabObs: TMemoField;
    TabImagem: TGraphicField;
    TabEstoqueAtual: TFloatField;
    TabCustoUnitario: TCurrencyField;
    TabEstoqueACE: TFloatField;
    TabEstoqueACS: TFloatField;
    TabEstoqueFinal: TFloatField;
    dsTab: TDataSource;
    Grid: TcxGrid;
    TVprod: TcxGridDBTableView;
    TVprodDescr: TcxGridDBColumn;
    TVprodEstoqueAtual: TcxGridDBColumn;
    TVprodPreco: TcxGridDBColumn;
    TVprodCategoria: TcxGridDBColumn;
    TVprodCustoUnitario: TcxGridDBColumn;
    GL: TcxGridLevel;
    cmReprocessar: TdxBarButton;
    pmEstoque: TdxBarPopupMenu;
    TabDescricao: TStringField;
    TabCategoria: TStringField;
    TabSubCateg: TStringField;
    TabPodeAlterarPreco: TBooleanField;
    TabNaoControlaEstoque: TBooleanField;
    PB: TcxProgressBar;
    TabID: TAutoIncField;
    TabPrecoTotal: TCurrencyField;
    TabCustoTotal: TCurrencyField;
    TVprodPrecoTotal: TcxGridDBColumn;
    TVprodCustoTotal: TcxGridDBColumn;
    TabFidelidade: TBooleanField;
    TabFidPontos: TIntegerField;
    TVprodFidelidade: TcxGridDBColumn;
    TVprodFidPontos: TcxGridDBColumn;
    Timer2: TTimer;
    cmVendaAvulsa: TdxBarLargeButton;
    cmEntrada: TdxBarLargeButton;
    cmSaida: TdxBarLargeButton;
    cmCompra: TdxBarLargeButton;
    TabEstoqueRepor: TFloatField;
    TabFornecedor: TIntegerField;
    TabEstoqueMin: TFloatField;
    TabEstoqueMax: TFloatField;
    TabAbaixoMin: TBooleanField;
    TabAbaixoMinDesde: TDateTimeField;
    TabNomeFor: TStringField;
    TVprodFornecedor: TcxGridDBColumn;
    TVprodEstoqueMin: TcxGridDBColumn;
    TVprodEstoqueMax: TcxGridDBColumn;
    TVprodAbaixoMin: TcxGridDBColumn;
    TVprodRepor: TcxGridDBColumn;
    TVDescr: TcxGridDBColumn;
    Tabplus: TBooleanField;
    TabplusURL: TnxMemoField;
    TabplusCodParceiro: TStringField;
    TabplusCodProduto: TStringField;
    TabAtivo: TBooleanField;
    TabCadastroRapido: TBooleanField;
    TabPermiteVendaFracionada: TBooleanField;
    Tabmd5Imagem: TStringField;
    TablastProdModif: TDateTimeField;
    TabIncluidoEm: TDateTimeField;
    TVprodID: TcxGridDBColumn;
    TVprodCodigo: TcxGridDBColumn;
    pmFerramentas: TPopupMenu;
    ReprocessarEstoque1: TMenuItem;
    TabPrecoAuto: TBooleanField;
    TabMargem: TFloatField;
    TVprodUnid: TcxGridDBColumn;
    TVprodObs: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    TabCodigo: TStringField;
    panBusca2: TLMDSimplePanel;
    edBusca: TcxMaskEdit;
    BarMgrBar2: TdxBar;
    cmFerramentas: TdxBarSubItem;
    cmBusca: TdxBarControlContainerItem;
    cmObs: TdxBarButton;
    cmExibir: TdxBarSubItem;
    rgTodos: TdxBarButton;
    cmAbaixoMin: TdxBarButton;
    cmMostrarFin: TdxBarButton;
    Image1: TImage;
    lbLocalizar: TcxLabel;
    rgCodigo: TdxBarButton;
    rgNome: TdxBarButton;
    cxStyle2: TcxStyle;
    tAux: TnxTable;
    tAuxCodigo: TStringField;
    cxStyle3: TcxStyle;
    TimerSelBusca: TTimer;
    TabComissaoPerc: TFloatField;
    TabComissaoLucro: TBooleanField;
    TabRecVer: TIntegerField;
    TabuploadVer: TWordField;
    procedure cmReprocessarClick(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure cmVendaAvulsaClick(Sender: TObject);
    procedure cmCompraClick(Sender: TObject);
    procedure cmEntradaClick(Sender: TObject);
    procedure cmSaidaClick(Sender: TObject);
    procedure beiMostrarFinClick(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure edBuscaPropertiesChange(Sender: TObject);
    procedure edBuscaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer2Timer(Sender: TObject);
    procedure TVprodAbaixoMinCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVprodAbaixoMinGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVDescrGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure edBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ReprocessarEstoque1Click(Sender: TObject);
    procedure cmCfgClick(Sender: TObject);
    procedure TVprodKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure edBuscaEnter(Sender: TObject);
    procedure cmObsClick(Sender: TObject);
    procedure cmAbaixoMinClick(Sender: TObject);
    procedure cmMostrarFinClick(Sender: TObject);
    procedure rgTodosClick(Sender: TObject);
    procedure rgCodigoClick(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure TVprodCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure TVprodCustomDrawIndicatorCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxCustomGridIndicatorItemViewInfo;
      var ADone: Boolean);
    procedure TVprodColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure TimerSelBuscaTimer(Sender: TObject);
    procedure edBuscaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FrmBasePaiDestroy(Sender: TObject);
  private
    { Private declarations }
    FAtualizando: Boolean;
  public
    class function Descricao: String; override;
    function ECodigo(S: String): Boolean;
    procedure AjustaLayoutLargeButton(B : TdxBarLargeButton); override;
    procedure AtualizaDireitos; override;
    procedure AjustaFin;

    procedure RefreshBotoes;

    procedure FiltraDados; override;

    procedure AjustaExibir;
  
    { Public declarations }
  end;

var
  fbProdutos: TfbProdutos;

implementation

uses
  ncClassesBase, 
  ncaDM, 
  ncaFrmPri,
  ncaFrmProduto, 
  ufmImagens,
  ncIDRecursos, ncaFrmME, ncDMServ, ncaFrmConfigAutoCad,
  ncaFrmConfigCodProdutoDuplicado, ncaFrmConfigQuickCad, ncaFrmOpcoes,
  ncaFrmConfigVendaProdSemSaldo, ncaFrmConfigCodBarBal;

// START resource string wizard section
resourcestring
  SProdutos = 'Produtos';
  SSim = 'Sim';
  SSM = 's/m';
  SSemMínimo = 'Sem mínimo';
  SEssaOperaçãoAlteraOEstoqueAtualD = 'Essa operação altera o estoque atual dos produtos para o mesmo ';
  SValorContidoNoHistóricoDeTransaç = 'valor contido no histórico de transações de cada produto. Deseja realmente reprocessar o estoque?';
  SEstoqueReprocessadoComSucesso = 'Estoque reprocessado com sucesso!';
  SDesejaRealmenteApagarOProduto = 'Deseja realmente apagar o produto ';
  SOpçõesParaProdutos = 'Opções para Produtos';

  rsTodosProdutos = 'Todos produtos';
  rsAbaixoMin = 'Estoque abaixo do mínimo';
  rsInfoFin = 'Informações financeiras';
  rsExibir = 'Exibir';

// END resource string wizard section


{$R *.dfm}

{ TfbProdutos }

class function TfbProdutos.Descricao: String;
begin
  Result := SProdutos;
end;

function TfbProdutos.ECodigo(S: String): Boolean;
begin
  tAux.FindNearest([S]);
  Result := (not tAux.IsEmpty) and SameTextSemAcento(Copy(tAuxCodigo.Value, 1, Length(S)), S);
end;

procedure TfbProdutos.cmAbaixoMinClick(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbProdutos.edBuscaEnter(Sender: TObject);
begin
  inherited;
  if not FAtualizando then
    TimerSelBusca.Enabled := True;
end;

procedure TfbProdutos.edBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_Return : cmEditarClick(nil);
    //VK_Escape : btnAcharClick(nil);
  end;
end;

procedure TfbProdutos.edBuscaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP : Tab.Prior;
    VK_Down : Tab.Next;
    VK_ESCAPE : begin
      edBusca.Clear;
      edBuscaPropertiesChange(nil);
    end;
  end;
end;

procedure TfbProdutos.edBuscaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  TimerSelBusca.Enabled := True;
end;

procedure TfbProdutos.edBuscaPropertiesChange(Sender: TObject);
begin
  inherited;
  if not Tab.Active then Exit;

  lbLocalizar.Visible := (edBusca.Text='');

  Tab.DisableControls;
  try
    if Trim(edBusca.Text)='' then begin
      if rgCodigo.Down then
        Tab.IndexName := 'ICodigo' else
        Tab.IndexName := 'IDescricao';
      Tab.CancelRange;
    end else begin
      if ECodigo(edBusca.Text) then 
        Tab.IndexName := 'ICodigo' else
        Tab.IndexName := 'IDescricao';
      Tab.SetRange([edBusca.Text], [edBusca.Text+'zzzzzzzzzzzzzzzzzzzzz']); // do not localize
      FAtualizando := True;
      try
        if not rgTodos.Down then begin
          rgTodos.Down := True;
          edBusca.Properties.AutoSelect := False;
          AjustaExibir;
          edBusca.SetFocus;
          edBusca.Properties.AutoSelect := True;
        end;
      finally
        FAtualizando := False;
      end;
    end;
  finally
    Tab.EnableControls;
  end;
end;

procedure TfbProdutos.Edit1Enter(Sender: TObject);
begin
  inherited;
  cmEntrada.Caption := 'ENTER';
end;

procedure TfbProdutos.Edit1Exit(Sender: TObject);
begin
  inherited;
  cmEntrada.Caption := 'EXIT';

end;

procedure TfbProdutos.FiltraDados;
begin
  inherited;
  AjustaFin;
  AjustaExibir;

  Tab.DisableControls;

  try
  
    if not Tab.Active then
      Tab.Open;

    if rgTodos.Down then begin
      if rgNome.Down then
        Tab.IndexName := 'IDescricao' else // do not localize
        Tab.IndexName := 'ICodigo'; // do not localize
    
      if Trim(edBusca.Text)='' then
        Tab.CancelRange else
        Tab.SetRange([edBusca.Text], [edBusca.Text+'zzzzzzzzzzzzzzzzzzzzz']); // do not localize
    end else begin
      Tab.IndexName := 'IAbaixoMin';
      Tab.SetRange([True], [True]);
    end;
   
    TVprod.DataController.DataModeController.GridMode := not cmMostrarFin.Down;
  finally
    Tab.EnableControls;
  end;

  RefreshBotoes;  
end;

procedure TfbProdutos.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  cmObs.Down := Boolean(StrToIntDef(slCOnfig.Values['fbProdutos.btnObs.Down'], 1));
  FAtualizando := False;
  TVProd.Preview.Visible := cmObs.Down;
end;

procedure TfbProdutos.FrmBasePaiDestroy(Sender: TObject);
begin
  inherited;
  cmBusca.Control := nil;
  TVprodFornecedor.Free;
  panBusca2.Free;
end;

procedure TfbProdutos.Image1Click(Sender: TObject);
begin
  inherited;
  edBusca.SetFocus;
end;

procedure TfbProdutos.RefreshBotoes;
var TemDados: Boolean;
begin
  TemDados := not Tab.IsEmpty;
  cmEditar.Enabled := TemDados;
  cmSaida.Enabled := Permitido(daESTSaida) and TemDados;
  cmEntrada.Enabled := Permitido(daEstEntrada) and TemDados;
  cmCompra.Enabled := Permitido(daEstCompras) and TemDados;
  cmNovo.Enabled := Permitido(daProCadastrar);
  cmApagar.Enabled := Permitido(daProApagar) and TemDados;
  cmReprocessar.Enabled := cmSaida.Enabled; 
  cmVendaAvulsa.Enabled := Permitido(daAtenderClientes) and TemDados;
end;

procedure TfbProdutos.ReprocessarEstoque1Click(Sender: TObject);
begin
  inherited;
  cmReprocessarClick(nil);
end;

procedure TfbProdutos.rgCodigoClick(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbProdutos.rgTodosClick(Sender: TObject);
begin
  inherited;
  if not FAtualizando then
    FiltraDados;
end;

procedure TfbProdutos.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  if not TabNaoControlaEstoque.Value then begin
    TabPrecoTotal.Value := TabPreco.Value * TabEstoqueAtual.Value;
    TabCustoTotal.Value := TabCustoUnitario.Value * TabEstoqueAtual.Value;
  end;
end;

procedure TfbProdutos.Timer2Timer(Sender: TObject);
begin
  inherited;
  Timer2.Enabled := False;
  if FrmPri.FM.FormAtivo is TfbProdutos then
    edBusca.SetFocus;
end;

procedure TfbProdutos.TimerSelBuscaTimer(Sender: TObject);
begin
  inherited;
  TimerSelBusca.Enabled := False;
  if edBusca.Focused then
    edBusca.SelectAll;
end;

procedure TfbProdutos.TVprodAbaixoMinCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  if SameText(AViewInfo.Text, SSim) then 
    ACanvas.Font.Style := [fsBold]
  else
  if SameText(AViewInfo.Text, SSM) then
    ACanvas.Font.Color := clSilver;  
end;

procedure TfbProdutos.TVprodAbaixoMinGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if SameText(SSemMínimo, AText) then
    AText := SSM;
end;

procedure TfbProdutos.TVprodColumnHeaderClick(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
begin
  inherited;
  TVprod.DataController.DataModeController.GridMode := False;
end;

procedure TfbProdutos.TVprodCustomDrawColumnHeader(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
begin
  FrmPri.CustomDrawGridHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TfbProdutos.TVprodCustomDrawIndicatorCell(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxCustomGridIndicatorItemViewInfo;
  var ADone: Boolean);
begin
  inherited;
  ACanvas.Brush.Color := clWhite;
  ACanvas.FillRect(AViewInfo.Bounds);
  ADone := True;
end;

procedure TfbProdutos.TVprodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key=13 then cmEditarClick(nil);
  
end;

procedure TfbProdutos.TVDescrGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
{  if ARecord.Values[TVProdDescr.Index] <> null then
    AText := ARecord.Values[TVProdDescr.Index] else
    ATExt := '';}
end;

procedure TfbProdutos.cmReprocessarClick(Sender: TObject);
begin
  with Dados do
  if SimNao(SEssaOperaçãoAlteraOEstoqueAtualD+
            SValorContidoNoHistóricoDeTransaç)
  then begin
    dsTab.DataSet := nil;
    PB.Visible := True;
    try
      Tab.First;
      PB.Properties.Max := Tab.RecordCount;
      PB.Position := 0;
      while not Tab.Eof do begin
        Application.ProcessMessages;
        PB.Position := PB.Position + 1;
        if TabNaoControlaEstoque.Value then begin
          Tab.Edit;
          TabEstoqueAtual.Clear;
          Tab.Post;
        end else
          DM.AjustaSaldoPost(TabID.Value, 0, 0, 0);
        Tab.Next;
      end;
    finally
      PB.Visible := False;
      dsTab.DataSet := Tab;
    end;
    ShowMessage(SEstoqueReprocessadoComSucesso);
  end;
end;

procedure TfbProdutos.cmNovoClick(Sender: TObject);
begin
  inherited;
  //btnAchar.Down := False;
  //btnAchar.Enabled := False;
  edBusca.Text := '';
  TFrmProduto.Create(Self).Incluir(Tab);
  RefreshBotoes;
end;

procedure TfbProdutos.cmObsClick(Sender: TObject);
begin
  inherited;
  slConfig.Values['fbProdutos.btnObs.Down'] := IntToStr(Integer(cmObs.Down));
  SaveCOnfig;
  TVProd.Preview.Visible := cmObs.Down;
end;

procedure TfbProdutos.cmEditarClick(Sender: TObject);
begin
  inherited;
  if Tab.IsEmpty then Exit;

  TFrmProduto.Create(Self).Editar(Tab);
end;

procedure TfbProdutos.beiMostrarFinClick(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbProdutos.cmApagarClick(Sender: TObject);
begin
  inherited;
  if Tab.IsEmpty then Exit;

  if SimNao(SDesejaRealmenteApagarOProduto + TabDescricao.Value + '? ') then
    Tab.Delete;
end;
                                        
procedure TfbProdutos.cmVendaAvulsaClick(Sender: TObject);
begin
  Dados.NovoMovEst(trEstVenda, 0);
  Tab.Refresh;
end;

procedure TfbProdutos.cmCfgClick(Sender: TObject);
begin
  inherited;
  TFrmOpcoes.Create(Self).Editar(SOpçõesParaProdutos, [TFrmConfigAutoCad{$ifdef Loja}, TFrmConfigQuickCad, TFrmConfigCodProdutoDuplicado{$endif}, TFrmConfigVendaProdSemSaldo{$ifdef LOJA}, TFrmConfigCodBarBal{$endif}], True);

end;

procedure TfbProdutos.cmCompraClick(Sender: TObject);
begin
  Dados.NovoMovEst(trEstCompra, 0);
  Tab.Refresh;
end;

procedure TfbProdutos.cmEntradaClick(Sender: TObject);
begin
  Dados.NovoMovEst(trEstEntrada, 0);
  Tab.Refresh;
end;

procedure TfbProdutos.cmMostrarFinClick(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbProdutos.cmSaidaClick(Sender: TObject);
begin
  Dados.NovoMovEst(trEstSaida, 0);
  Tab.Refresh;
end;

procedure TfbProdutos.AjustaExibir;
begin
  cmExibir.Caption := rsExibir+': ';
  if rgTodos.Down then
    cmExibir.Caption := cmExibir.Caption + rsTodosProdutos else
    cmExibir.Caption := cmExibir.Caption + rsAbaixoMin;
    
  if cmMostrarFin.Down then 
    cmExibir.Caption := cmExibir.Caption + '  |  ' + rsInfoFin;
end;

procedure TfbProdutos.AjustaFin;
begin
  TVProd.OptionsView.Footer := cmMostrarFin.Down;
  TVProdCustoUnitario.Visible := TVProd.OptionsView.Footer;
  TVProdCustoTotal.Visible := TVProd.OptionsView.Footer;
  TVProdPrecoTotal.Visible := TVProd.OptionsView.Footer;
end;

procedure TfbProdutos.AjustaLayoutLargeButton(B: TdxBarLargeButton);
begin

end;

procedure TfbProdutos.AtualizaDireitos;
begin
  inherited;
  if Dados.CM.UA.Admin then
      cmReprocessar.Visible := ivAlways;
  //btnReproc.Visible := Dados.CM.UA.Admin;
  RefreshBotoes;
  cmMostrarFin.Enabled := Permitido(daVerLucroProdutos);
  AjustaFin;
  if not cmMostrarFin.Enabled then
    cmMostrarFin.Down := False;
    
  if Tab.Active then
    Tab.Refresh;

end;

end.

