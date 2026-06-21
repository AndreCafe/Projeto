unit uCMfbgProdutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  Db, nxdb, dxDBTLCl, dxGrClms, ExtCtrls, dxExEdtr, Menus, am2000menuitem,
  am2000utils, am2000popupmenu, am2000, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  am2000mainmenu;

type
  TfbgProdutos = class(TFrmBaseGrid)
    Tab: TnxTable;
    TabCodigo: TStringField;
    TabDescricao: TStringField;
    TabUnid: TStringField;
    TabPreco: TCurrencyField;
    TabObs: TMemoField;
    TabImagem: TGraphicField;
    TabCategoria: TStringField;
    TabEstoqueAtual: TFloatField;
    TabCustoUnitario: TCurrencyField;
    TabEstoqueACE: TFloatField;
    TabEstoqueACS: TFloatField;
    TabEstoqueFinal: TFloatField;
    dsTab: TDataSource;
    GridCodigo: TdxDBGridMaskColumn;
    GridDescricao: TdxDBGridMaskColumn;
    GridUnid: TdxDBGridMaskColumn;
    GridPreco: TdxDBGridCurrencyColumn;
    GridCategoria: TdxDBGridMaskColumn;
    GridEstoqueAtual: TdxDBGridMaskColumn;
    GridCustoUnitario: TdxDBGridCurrencyColumn;
    GridEstoqueACE: TdxDBGridMaskColumn;
    GridEstoqueACS: TdxDBGridMaskColumn;
    cmReprocessaEstoque: TdxBarButton;
    procedure cmReprocessaEstoqueClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FiltraDados; override;
    { Public declarations }

    procedure Novo; override;
    procedure Editar; override;
    procedure Apagar; override;

    procedure AplicaDireitosUsuario; override;
  end;

var
  fbgProdutos: TfbgProdutos;

implementation

uses uCMFrmProduto, uCMDados, cmIDRecursos, uCMFrmPri;

{$R *.DFM}

{ TfbgProdutos }

procedure TfbgProdutos.Apagar;
begin
  inherited;
  if MessageDlg('Confirma a exclusão do produto', mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then
    Tab.Delete;
end;

procedure TfbgProdutos.Editar;
begin
  inherited;
  TFrmProduto.Create(Self).Editar(Tab);
end;

procedure TfbgProdutos.FiltraDados;
begin
  if not Tab.Active then begin
    Tab.Open;
    Grid.Datasource := dsTab;
  end else
    Tab.Refresh;  
end;

procedure TfbgProdutos.Novo;
begin
  inherited;
  TFrmProduto.Create(Self).Incluir(Tab);
end;

procedure TfbgProdutos.cmReprocessaEstoqueClick(Sender: TObject);
begin
  with Dados do
  if MessageDlg('Essa operação altera o estoque atual dos produtos para o mesmo '+
                'valor contido no Kardex. Deseja realmente reprocessar o estoque?',
                mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then begin
    DB.StartTransactionWith([Tab, tAuxMovEst]);
    try
      Tab.First;
      while not Tab.Eof do begin
        Application.ProcessMessages;
        Tab.Edit;
        TabEstoqueAtual.Value := 
           ObtemSaldoAnterior(TabCodigo.Value, EncodeDate(2050, 1, 1), 1);
        Tab.Post;   
        Tab.Next;
      end;
      DB.Commit;
    except
      Tab.Cancel;
      DB.Rollback;
      Raise;
    end;  
    ShowMessage('Estoque reprocessado com sucesso!');
  end;  
end;

procedure TfbgProdutos.AplicaDireitosUsuario;
begin
  inherited;
  cmNovo.Enabled := Permitido(reProdutos, taProCadastrar);
  cmApagar.Enabled := Permitido(reProdutos, taProApagar);
  cmEditar.Enabled := Permitido(reProdutos, taProCadastrar);
end;

end.
