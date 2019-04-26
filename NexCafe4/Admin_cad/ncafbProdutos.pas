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
  dxPSCore, cxContainer, cxProgressBar, cxCheckBox, cxBarEditItem;

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
    TVEstoqueACE: TcxGridDBColumn;
    TVEstoqueACS: TcxGridDBColumn;
    TVPreco: TcxGridDBColumn;
    TVCategoria: TcxGridDBColumn;
    TVCustoUnitario: TcxGridDBColumn;
    GL: TcxGridLevel;
    cmReprocessar: TdxBarButton;
    cmVendaAvulsa: TdxBarLargeButton;
    cmEstoque: TdxBarLargeButton;
    pmEstoque: TdxBarPopupMenu;
    cmCompra: TdxBarButton;
    cmEntrada: TdxBarButton;
    cmSaida: TdxBarButton;
    TabDescricao: TStringField;
    TabCategoria: TStringField;
    TabSubCateg: TStringField;
    TabPodeAlterarPreco: TBooleanField;
    TabNaoControlaEstoque: TBooleanField;
    PB: TcxProgressBar;
    TabID: TAutoIncField;
    beiMostrarFin: TcxBarEditItem;
    TabPrecoTotal: TCurrencyField;
    TabCustoTotal: TCurrencyField;
    TVPrecoTotal: TcxGridDBColumn;
    TVCustoTotal: TcxGridDBColumn;
    procedure cmReprocessarClick(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure cmVendaAvulsaClick(Sender: TObject);
    procedure cmCompraClick(Sender: TObject);
    procedure cmEntradaClick(Sender: TObject);
    procedure cmSaidaClick(Sender: TObject);
    procedure cmEstoqueClick(Sender: TObject);
    procedure beiMostrarFinClick(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;
    procedure AjustaFin;

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

procedure TfbProdutos.FiltraDados;
begin
  inherited;
  AjustaFin;
    
  if Tab.Active then
    Tab.Refresh
  else  
    Tab.Open;
end;

procedure TfbProdutos.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  if not TabNaoControlaEstoque.Value then begin
    TabPrecoTotal.Value := TabPreco.Value * TabEstoqueAtual.Value;
    TabCustoTotal.Value := TabCustoUnitario.Value * TabEstoqueAtual.Value;
  end;
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
  TFrmProduto.Create(Self).Incluir(Tab);
end;

procedure TfbProdutos.cmEditarClick(Sender: TObject);
begin
  inherited;
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
  if SimNao('Deseja realmente apagar o produto ' + TabDescricao.Value + '? ') then
    Tab.Delete;
end;
                                        
procedure TfbProdutos.cmVendaAvulsaClick(Sender: TObject);
begin
  Dados.NovoMovEst(trEstVenda);
end;

procedure TfbProdutos.cmCompraClick(Sender: TObject);
begin
  Dados.NovoMovEst(trEstCompra);
end;

procedure TfbProdutos.cmEntradaClick(Sender: TObject);
begin
  Dados.NovoMovEst(trEstEntrada);
end;

procedure TfbProdutos.cmSaidaClick(Sender: TObject);
begin
  Dados.NovoMovEst(trEstSaida);
end;

procedure TfbProdutos.cmEstoqueClick(Sender: TObject);
var P: TPoint;
begin
  P := ItemLinkScreenPoint(cmEstoque.ClickItemLink);
  pmEstoque.Popup(P.X, P.Y);
  FiltraDados;
end;

procedure TfbProdutos.AjustaFin;
begin
  TV.OptionsView.Footer := (beiMostrarFin.EditValue=True);
  TVCustoUnitario.Visible := TV.OptionsView.Footer;
  TVCustoTotal.Visible := TV.OptionsView.Footer;
  TVPrecoTotal.Visible := TV.OptionsView.Footer;
end;

procedure TfbProdutos.AtualizaDireitos;
begin
  inherited;
  cmSaida.Enabled := Permitido(daESTSaida);
  cmEntrada.Enabled := Permitido(daEstEntrada);
  cmCompra.Enabled := Permitido(daEstCompras);
  cmNovo.Enabled := Permitido(daProCadastrar);
  cmApagar.Enabled := Permitido(daProApagar);
  cmReprocessar.Enabled := cmSaida.Enabled; 
  beiMostrarFin.Enabled := Permitido(daVerLucroProdutos);
  AjustaFin;
  if not beiMostrarFin.Enabled then
    beiMostrarFin.EditValue := False;
    
  if Tab.Active then
    Tab.Refresh;
end;

end.
