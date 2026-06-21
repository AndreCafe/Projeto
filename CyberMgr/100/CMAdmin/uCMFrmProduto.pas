unit uCMFrmProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxCntner, dxEditor, dxEdLib, dxDBELib, 
  dxExEdtr, dxDBEdtr, dxBar, StdCtrls, 
  ExtCtrls, 
  uCMFrmPri, Db, ffdb, ComCtrls,
  uCMfbgVendas, lmdcctrl, lmdctrl, dxInspRw, dxDBInRw, dxInspct, dxDBInsp,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  LMDFormDisplay;

type
  TFrmProduto = class(TForm)
    BarMgr: TdxBarManager;
    cmGravar: TdxBarButton;
    cmCancelar: TdxBarButton;
    QCat: TffQuery;
    Paginas: TPageControl;
    tsDados: TTabSheet;
    tsKardex: TTabSheet;
    LMDSimplePanel1: TLMDSimplePanel;
    InspProduto: TdxDBInspector;
    InspProdutoCodigo: TdxInspectorDBMaskRow;
    InspProdutoDescricao: TdxInspectorDBMaskRow;
    InspProdutoUnid: TdxInspectorDBMaskRow;
    InspProdutoPreco: TdxInspectorDBCurrencyRow;
    InspProdutoObs: TdxInspectorDBMemoRow;
    InspProdutoCategoria: TdxInspectorDBPickRow;
    dsTab: TDataSource;
    cmKardex: TdxBarButton;
    fdKardex: TLMDFormDisplay;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure cmKardexClick(Sender: TObject);
  private
    { Private declarations }
  public
     FVen: TfbgVendas;
     Tab : TffTable;
     CodAnt : String;
    { Public declarations }
    procedure Editar(aTab: TffTable);
    procedure Incluir(aTab: TffTable);
  end;

var
  FrmProduto: TFrmProduto;
  
implementation

uses 
  uCMFrmConfig, 
  cmIDRecursos,
  uCMDados;


{$R *.DFM}

procedure TFrmProduto.Editar(aTab: TffTable);
begin
  Tab := aTab;
  dsTab.Dataset := Tab;
  Tab.Edit;
  CodAnt := Tab.FieldByName('Codigo').AsString;
  cmKardex.Visible := ivAlways;
  cmGravar.Enabled := Permitido(reProdutos, taProEditar);
  InspProdutoPreco.ReadOnly := not Permitido(reProdutos, taProEditarPreco);
  ShowModal;
end;

procedure TFrmProduto.Incluir(aTab: TffTable);
begin
  Tab := aTab;  
  dsTab.Dataset := Tab;
  Tab.Append;
  ShowModal;
end;
    
procedure TFrmProduto.cmGravarClick(Sender: TObject);
var Cat: String;
begin
  if (Tab.FieldByName('Codigo').AsString)='' then begin
    Beep;
    ShowMessage('Campo código não pode ser deixado em branco!');
    Exit;
  end;  
  if (Tab.FieldByName('Descricao').AsString)='' then begin
    Beep;
    ShowMessage('Campo descrição não pode ser deixado em branco!');
    Exit;
  end;  
  with Dados, tbCat do begin
    DB.StartTransaction;
    try
      Cat := Trim(Tab.FieldByName('categoria').AsString);
      if (Cat <> '') and (not Findkey([Tab.FieldByName('categoria').AsString])) 
      then begin
        Append;
        FieldByName('Descricao').AsString := 
          Tab.FieldByName('categoria').AsString;
        Post;
      end;
      if Tab.State in [dsInsert, dsEdit] then Tab.Post;
      if (CodAnt<>'') and (CodAnt<>Tab.FieldByName('Codigo').AsString) then begin
        QCat.Close;
        QCat.SQL.Clear;
        QCat.SQL.Add('update itensme' +
                     ' set produto = ' + QuotedStr(Tab.FieldByName('Codigo').AsString) +
                     ' where produto = ' + QuotedStr(CodAnt));
        QCat.ExecSQL;
        QCat.Close;
      end;               
      DB.Commit;
    except
      DB.Rollback;
      Raise;
    end;  
  end;  
  Close;
end;

procedure TFrmProduto.cmCancelarClick(Sender: TObject);
begin
  Tab.Cancel;
  Close;
end;

procedure TFrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FVen:= nil;
  Tab.Cancel;
  Action:= CaFree;
end;

procedure TFrmProduto.FormShow(Sender: TObject);
begin
  qCat.Open;
  while not(Qcat.eof) do
  begin
    if Trim(qCat.FieldbyName('Descricao').AsString)<>'' then
      InspProdutoCategoria.Items.Add(qCat.FieldbyName('Descricao').AsString);
    qCat.Next;
  end;
  qCat.Close;
  Paginas.ActivePage := tsDados;
  InspProduto.SetFocus;  
  InspProduto.FocusedField :=  InspProdutoDescricao.Field;
  InspProduto.FocusedField :=  InspProdutoCodigo.Field;
end;

procedure TFrmProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmProduto.FormCreate(Sender: TObject);
begin
  tsKardex.TabVisible := False;
  CodAnt := '';
end;

procedure TFrmProduto.cmKardexClick(Sender: TObject);
begin
  cmKardex.Visible := ivNever;
  tsKardex.TabVisible := True;
  FVen := TfbgVendas.Create(Self);
  FVen.Inicializar(True, FiltroProduto, Tab.FieldByName('Codigo').AsString);
  FVen.SetFiltro(FiltroProduto, Tab.FieldByName('Codigo').AsString);
  fdKardex.AddForm(FVen, True);
  Paginas.ActivePage := tsKardex;
end;

end.
