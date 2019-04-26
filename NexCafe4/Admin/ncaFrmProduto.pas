unit ncaFrmProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, 
  ExtCtrls, 
  Db, nxdb, ComCtrls,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  LMDFormDisplay, cxPC, cxControls, cxStyles, cxGraphics,
  cxEdit, cxMaskEdit, cxCurrencyEdit, cxDropDownEdit, cxMemo, cxVGrid,
  cxDBVGrid, cxInplaceContainer, dxBar, ufmFormBase, dxBarExtItems,
  kbmMemTable, cxCheckBox, cxImage, cxClasses, cxDBLookupComboBox, cxSpinEdit,
  LMDControl, ncafbPesqCli,
  dxNavBarStyles, dxNavBarCollns, dxNavBarBase, dxNavBar, dxLayoutControl,
  cxDBEdit, cxLabel, LMDPNGImage, cxCalendar, cxImageComboBox, cxContainer,
  cxTextEdit, dxLayoutLookAndFeels;

type
  TFrmProduto = class(TForm)
    BarMgr: TdxBarManager;
    QCat: TnxQuery;
    dsMT: TDataSource;
    cmKardex: TdxBarButton;
    LMDSimplePanel2: TLMDSimplePanel;
    Paginas: TcxPageControl;
    FMgr: TFormManager;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    MT: TkbmMemTable;
    MTCodigo: TStringField;
    MTDescricao: TStringField;
    MTPreco: TCurrencyField;
    MTObs: TMemoField;
    MTImagem: TGraphicField;
    MTCategoria: TStringField;
    MTCustoUnitario: TCurrencyField;
    MTPodeAlterarPreco: TBooleanField;
    MTNaoControlaEstoque: TBooleanField;
    dsCAT: TDataSource;
    QCatCategoria: TStringField;
    MTFidelidade: TBooleanField;
    MTFidPontos: TIntegerField;
    panNB: TLMDSimplePanel;
    NB: TdxNavBar;
    NBGroup1: TdxNavBarGroup;
    nbiTran: TdxNavBarItem;
    nbiCad: TdxNavBarItem;
    NBStyleItem1: TdxNavBarStyleItem;
    tsCadastro: TcxTabSheet;
    lcFicha: TdxLayoutControl;
    edCodigo: TcxDBMaskEdit;
    edDescr: TcxDBTextEdit;
    edObs: TcxDBMemo;
    pagFoto: TcxPageControl;
    tsSemFoto: TcxTabSheet;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    lbSemFoto: TcxLabel;
    tsFoto: TcxTabSheet;
    panFoto: TLMDSimplePanel;
    edFoto: TcxDBImage;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    lcFichaItem2: TdxLayoutItem;
    lcFichaItem3: TdxLayoutItem;
    lcFichaItem24: TdxLayoutItem;
    lcFichaItem23: TdxLayoutItem;
    edPrecoVenda: TcxDBCurrencyEdit;
    lcFichaItem1: TdxLayoutItem;
    edCustoUnitario: TcxDBCurrencyEdit;
    lcFichaItem4: TdxLayoutItem;
    lcFichaGroup1: TdxLayoutGroup;
    edCategoria: TcxDBComboBox;
    lcFichaItem5: TdxLayoutItem;
    edEstoqueMin: TcxDBMaskEdit;
    lcFichaItem7: TdxLayoutItem;
    edEstoqueMax: TcxDBMaskEdit;
    lcFichaItem6: TdxLayoutItem;
    lcFichaGroup4: TdxLayoutGroup;
    lcFichaGroup5: TdxLayoutGroup;
    edNaoControlarEstoque: TcxDBImageComboBox;
    lcFichaItem10: TdxLayoutItem;
    lcFichaGroup2: TdxLayoutGroup;
    lcFichaGroup6: TdxLayoutGroup;
    edFidelidade: TcxDBCheckBox;
    lcFichaItem8: TdxLayoutItem;
    edFidPontos: TcxDBSpinEdit;
    lcFichaItem11: TdxLayoutItem;
    lcFichaGroup3: TdxLayoutGroup;
    MTEstoqueRepor: TFloatField;
    MTFornecedor: TIntegerField;
    MTEstoqueMin: TFloatField;
    MTEstoqueMax: TFloatField;
    edFornecedor: TcxDBPopupEdit;
    lcFornecedor: TdxLayoutItem;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel;
    dxLayoutStandardLookAndFeel1: TdxLayoutStandardLookAndFeel;
    MTNomeFor: TStringField;
    lcFichaItem9: TdxLayoutItem;
    edPodeAlterarPreco: TcxDBCheckBox;
    MTID: TIntegerField;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure MTAfterInsert(DataSet: TDataSet);
    procedure NBLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
    procedure edFornecedorPropertiesInitPopup(Sender: TObject);
    procedure edFornecedorPropertiesCloseUp(Sender: TObject);
    procedure edNaoControlarEstoquePropertiesCloseUp(Sender: TObject);
    procedure edFidelidadePropertiesChange(Sender: TObject);
    procedure lbSemFotoClick(Sender: TObject);
    procedure edFotoPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    procedure EnableDisable;
  public
     Tab : TnxTable;
     CodAnt : String;
     FDadosFor : TDadosCliente;
    { Public declarations }
    procedure Editar(aTab: TnxTable);
    procedure Incluir(aTab: TnxTable);
  end;

var
  FrmProduto: TFrmProduto;
  
implementation

uses 
  ncIDRecursos, 
  ncaDM, 
  ufmImagens, 
  ncaFrmPri, 
  ncafbMovEst, ncafbPesqFor;


{$R *.DFM}

procedure TFrmProduto.Editar(aTab: TnxTable);
begin
  Tab := aTab;
  MT.Insert;
  TransfDados(Tab, MT);
  MT.Post;
  MT.Edit;
  CodAnt := Tab.FieldByName('Codigo').AsString;
  cmKardex.Visible := ivAlways;
  cmGravar.Enabled := Permitido(daProCadastrar);
  ShowModal;
end;

procedure TFrmProduto.edNaoControlarEstoquePropertiesCloseUp(Sender: TObject);
begin
  EnableDisable;
end;

procedure TFrmProduto.EnableDisable;
begin
  edFidPontos.Enabled := edFidelidade.Enabled and edFidelidade.Checked;
  edEstoqueMin.Enabled := not MTNaoControlaEstoque.Value;
  edEstoqueMax.Enabled := not MTNaoControlaEstoque.Value;
end;

procedure TFrmProduto.Incluir(aTab: TnxTable);
begin
  nbiTran.Enabled := False;
  Tab := aTab;  
  MT.Insert;
  MT.Post;
  MT.Edit;
  ShowModal;
  CodAnt := '';
end;
    
procedure TFrmProduto.lbSemFotoClick(Sender: TObject);
begin
  edFoto.LoadFromFile;
end;

procedure TFrmProduto.MTAfterInsert(DataSet: TDataSet);
begin
  MTFidelidade.Value := False;
  MTNaoControlaEstoque.Value := False;
end;

procedure TFrmProduto.NBLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
begin
  Paginas.ActivePageIndex := ALink.Index;
end;

procedure TFrmProduto.cmGravarClick(Sender: TObject);
var 
  Cat: String;
  DS : TDataSource;
begin
  edCodigo.SetFocus;
  edDescr.SetFocus;
  if Trim(MTCodigo.Value)='' then begin
    Beep;
    edCodigo.SetFocus;
    ShowMessage('Campo código não pode ser deixado em branco!');
    Exit;
  end;  
  if (MTCodigo.Value <> CodAnt) then 
  if Dados.tbPro.Locate('Codigo', MTCodigo.Value, [loCaseInsensitive]) then begin
    Beep;
    edCodigo.SetFocus;
    ShowMessage('Já existe um produto cadastrado com esse código');
    Exit;
  end;
  if (MT.FieldByName('Descricao').AsString)='' then begin
    Beep;
    edDescr.SetFocus;
    ShowMessage('Campo descrição não pode ser deixado em branco!');
    Exit;
  end;  
  
  with Dados do begin
    InitTran(DB, [], False);
    try
{      Cat := Trim(MT.FieldByName('categoria').AsString);
      if (Cat <> '') and (not Findkey([MT.FieldByName('categoria').AsString])) 
      then begin
        Append;
        FieldByName('Descricao').AsString := 
          MT.FieldByName('categoria').AsString;
        Post;
      end;}
      if CodAnt='' then
        Tab.Insert else
        Tab.Edit;
        
      TransfDados(MT, Tab);
      Tab.Post;  
      DB.Commit;
    except
      DB.Rollback;
      Raise;
    end;  
  end;  
  Close;
end;

procedure TFrmProduto.edFidelidadePropertiesChange(Sender: TObject);
begin
  EnableDisable;
end;

procedure TFrmProduto.edFornecedorPropertiesCloseUp(Sender: TObject);
begin
  if MT.State<>dsEdit then MT.Edit;
  MTFornecedor.Value := FDadosFor.dcCodigo;
  TcxCustomDropDownEdit(Sender).Text := MTNomeFor.Value;
end;

procedure TFrmProduto.edFornecedorPropertiesInitPopup(Sender: TObject);
begin
  FDadosFor.dcCodigo := MTFornecedor.Value;
  TcxPopupEdit(Sender).Properties.PopupControl := fbPesqFor;
  fbPesqFor.PreparaBusca(@FDadosFor, TcxCustomDropDownEdit(Sender));
end;

procedure TFrmProduto.edFotoPropertiesEditValueChanged(Sender: TObject);
begin
  if IsPictureEmpty(edFoto.Picture) then
    pagFoto.ActivePageIndex := 0 else
    pagFoto.ActivePageIndex := 1;
end;

procedure TFrmProduto.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  FVen:= nil;
  FMgr.Clear;
  Action:= CaFree;
end;

procedure TFrmProduto.FormShow(Sender: TObject);
begin
  EnableDisable;
//  PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
  qCat.First;
  while not qCat.Eof do
  begin
    if Trim(qCatCategoria.Value)<>'' then 
      edCategoria.Properties.Items.Add(qCatCategoria.Value);
    qCat.Next;
  end;

  pagFoto.ActivePageIndex := 1;

  if mtImagem.IsNull then 
    pagFoto.ActivePageIndex := 0 else
    pagFoto.ActivePageIndex := 1;
  
  FMgr.Mostrar(TfbMovEst, 0, MTID.Value);
  Paginas.ActivePageIndex := 0;
  if (Screen.Width=640) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
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
  pagFoto.ActivePageIndex := 0;
  edNaoControlarEstoque.Properties.ReadOnly := not Permitido(daProEditarPreco);
  edPrecoVenda.Properties.ReadOnly := not Permitido(daProEditarPreco);
  edPodeAlterarPreco.Properties.ReadOnly := not Permitido(daProEditarPreco);
  CodAnt := '';
  FDadosFor.dcCodigo := 0;
  FMgr.RegistraForm(TfbMovEst);
end;

end.
