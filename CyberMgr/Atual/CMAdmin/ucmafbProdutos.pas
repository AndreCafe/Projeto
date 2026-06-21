unit ucmafbProdutos;

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
  dxPSCore, cxContainer, cxProgressBar;

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
    procedure cmReprocessarClick(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure cmVendaAvulsaClick(Sender: TObject);
    procedure cmCompraClick(Sender: TObject);
    procedure cmEntradaClick(Sender: TObject);
    procedure cmSaidaClick(Sender: TObject);
    procedure cmEstoqueClick(Sender: TObject);
  private
    { Private declarations }
  public
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;

    procedure FiltraDados; override;
  
    { Public declarations }
  end;

var
  fbProdutos: TfbProdutos;

implementation

uses cmClassesBase, ucmaDM, ucmaPri, ucmaFrmProduto, ucmaFrmME, ufmImagens, cmIDRecursos;

{$R *.dfm}

{ TfbProdutos }

class function TfbProdutos.Descricao: String;
begin
  Result := 'Produtos';
end;

procedure TfbProdutos.FiltraDados;
begin
  inherited;
  if Tab.Active then
    Tab.Refresh
  else  
    Tab.Open;
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
      DB.StartTransactionWith([Tab, tAuxMovEst]);
      try
        Tab.First;
        PB.Properties.Max := Tab.RecordCount;
        PB.Position := 0;
        while not Tab.Eof do begin
          Application.ProcessMessages;
          PB.Position := PB.Position + 1;
          Tab.Edit;
          if TabNaoControlaEstoque.Value then
            TabEstoqueAtual.Clear
          else  
            TabEstoqueAtual.Value := ReprocessaProd(TabCodigo.Value);
          Tab.Post;   
          Tab.Next;
        end;
        DB.Commit;
      except
        Tab.Cancel;
        DB.Rollback;
        Raise;
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

procedure TfbProdutos.cmApagarClick(Sender: TObject);
begin
  inherited;
  if SimNao('Deseja realmente apagar o produto ' + TabDescricao.Value + '? ') then
    Tab.Delete;
end;
                                        
procedure TfbProdutos.cmVendaAvulsaClick(Sender: TObject);
begin
  TFrmME.Create(Self).Criar(Dados.tbTran, ttEstVenda);
end;

procedure TfbProdutos.cmCompraClick(Sender: TObject);
begin
  TFrmME.Create(Self).Criar(Dados.tbTran, ttEstCompra);
end;

procedure TfbProdutos.cmEntradaClick(Sender: TObject);
begin
  TFrmME.Create(Self).Criar(Dados.tbTran, ttEstEntrada);
end;

procedure TfbProdutos.cmSaidaClick(Sender: TObject);
begin
  TFrmME.Create(Self).Criar(Dados.tbTran, ttEstSaida);
end;

procedure TfbProdutos.cmEstoqueClick(Sender: TObject);
var P: TPoint;
begin
  P := ItemLinkScreenPoint(cmEstoque.ClickItemLink);
  pmEstoque.Popup(P.X, P.Y);
  FiltraDados;
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
  if Tab.Active then
    Tab.Refresh;
end;

end.
