unit ncafbProdutos;

interface

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
  PngSpeedButton, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, LMDControl, Menus, cxLookAndFeelPainters, cxButtons;

type
  TfbProdutos = class(TFrmBase)
    Tab: TnxTable;
    TabCodigo: TStringField;
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
    TV: TcxGridDBTableView;
    TVDescricao: TcxGridDBColumn;
    TVCodigo: TcxGridDBColumn;
    TVEstoqueAtual: TcxGridDBColumn;
    TVPreco: TcxGridDBColumn;
    TVCategoria: TcxGridDBColumn;
    TVCustoUnitario: TcxGridDBColumn;
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
    TVPrecoTotal: TcxGridDBColumn;
    TVCustoTotal: TcxGridDBColumn;
    TabFidelidade: TBooleanField;
    TabFidPontos: TIntegerField;
    TVFidelidade: TcxGridDBColumn;
    TVFidPontos: TcxGridDBColumn;
    panMostrar: TPanel;
    panBusca: TLMDSimplePanel;
    btnAchar: TPngSpeedButton;
    rgCod: TcxRadioButton;
    rgNome: TcxRadioButton;
    lbBusca: TcxLabel;
    edBusca: TcxMaskEdit;
    Timer2: TTimer;
    cbMostrarFin: TcxCheckBox;
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
    TVFornecedor: TcxGridDBColumn;
    TVEstoqueMin: TcxGridDBColumn;
    TVEstoqueMax: TcxGridDBColumn;
    TVAbaixoMin: TcxGridDBColumn;
    TVRepor: TcxGridDBColumn;
    btnReproc: TcxButton;
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
    procedure rgCodClick(Sender: TObject);
    procedure edBuscaPropertiesChange(Sender: TObject);
    procedure btnAcharClick(Sender: TObject);
    procedure edBuscaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer2Timer(Sender: TObject);
    procedure TVAbaixoMinCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVAbaixoMinGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
  private
    { Private declarations }
  public
    class function Descricao: String; override;
    procedure AjustaLayoutLargeButton(B : TdxBarLargeButton); override;
    procedure AtualizaDireitos; override;
    procedure AjustaFin;

    procedure RefreshBotoes;

    procedure FiltraDados; override;
  
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
  ncIDRecursos, ncaFrmME, ncDMServ;

{$R *.dfm}

{ TfbProdutos }

class function TfbProdutos.Descricao: String;
begin
  Result := 'Produtos';
end;

procedure TfbProdutos.edBuscaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP : Tab.Prior;
    VK_Down : Tab.Next;
    VK_Return : cmEditarClick(nil);
    VK_Escape : btnAcharClick(nil);
  end;
end;

procedure TfbProdutos.edBuscaPropertiesChange(Sender: TObject);
begin
  inherited;
  if not Tab.Active then Exit;
  
  btnAchar.Enabled := (Trim(edBusca.Text)>'');
  btnAchar.Down := btnAchar.Enabled;
  
  if Trim(edBusca.Text)='' then 
    Tab.CancelRange else
    Tab.SetRange([edBusca.Text], [edBusca.Text+'zzzzzzzzzzzzzzzzzzzzz']);
end;

procedure TfbProdutos.FiltraDados;
begin
  inherited;
  AjustaFin;
  
  if not Tab.Active then
    Tab.Open;

  if rgNome.Checked then
    Tab.IndexName := 'IDescricao' else
    Tab.IndexName := 'ICodigo';
    

  if Trim(edBusca.Text)='' then
    Tab.CancelRange else
    Tab.SetRange([edBusca.Text], [edBusca.Text+'zzzzzzzzzzzzzzzzzzzzz']);

  RefreshBotoes;  
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

procedure TfbProdutos.rgCodClick(Sender: TObject);
begin
  inherited;
  FiltraDados;
  edBusca.SetFocus;
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

procedure TfbProdutos.TVAbaixoMinCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  if SameText(AViewInfo.Text, 'Sim') then 
    ACanvas.Font.Style := [fsBold]
  else
  if SameText(AViewInfo.Text, 's/m') then
    ACanvas.Font.Color := clSilver;  
end;

procedure TfbProdutos.TVAbaixoMinGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if SameText('Sem mínimo', AText) then
    AText := 's/m';
end;

procedure TfbProdutos.cmReprocessarClick(Sender: TObject);
begin
  with Dados do
  if SimNao('Essa operação altera o estoque atual dos produtos para o mesmo '+
            'valor contido no histórico de transações de cada produto. Deseja realmente reprocessar o estoque?')
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
    ShowMessage('Estoque reprocessado com sucesso!');
  end;
end;

procedure TfbProdutos.cmNovoClick(Sender: TObject);
begin
  inherited;
  btnAchar.Down := False;
  btnAchar.Enabled := False;
  edBusca.Text := '';
  TFrmProduto.Create(Self).Incluir(Tab);
  RefreshBotoes;
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

procedure TfbProdutos.btnAcharClick(Sender: TObject);
begin
  inherited;
  btnAchar.Down := False;
  btnAchar.Enabled := False;
  edBusca.Text := '';
end;

procedure TfbProdutos.cmApagarClick(Sender: TObject);
begin
  inherited;
  if Tab.IsEmpty then Exit;
  
  if SimNao('Deseja realmente apagar o produto ' + TabDescricao.Value + '? ') then
    Tab.Delete;
end;
                                        
procedure TfbProdutos.cmVendaAvulsaClick(Sender: TObject);
begin
  Dados.NovoMovEst(trEstVenda, 0);
  Tab.Refresh;
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

procedure TfbProdutos.cmSaidaClick(Sender: TObject);
begin
  Dados.NovoMovEst(trEstSaida, 0);
  Tab.Refresh;
end;

procedure TfbProdutos.AjustaFin;
begin
  TV.OptionsView.Footer := cbMostrarFin.Checked;
  TVCustoUnitario.Visible := TV.OptionsView.Footer;
  TVCustoTotal.Visible := TV.OptionsView.Footer;
  TVPrecoTotal.Visible := TV.OptionsView.Footer;
end;

procedure TfbProdutos.AjustaLayoutLargeButton(B: TdxBarLargeButton);
begin

end;

procedure TfbProdutos.AtualizaDireitos;
begin
  inherited;
  btnReproc.Visible := Dados.CM.UA.Admin;
  RefreshBotoes;
  cbMostrarFin.Enabled := Permitido(daVerLucroProdutos);
  AjustaFin;
  if not cbMostrarFin.Enabled then
    cbMostrarFin.Checked := False;
    
  if Tab.Active then
    Tab.Refresh;

end;

end.
