unit ncaFrmProduto;
{
    ResourceString: Dario 08/03/13
}

interface

{$I NEX.INC}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Variants,
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
  cxTextEdit, dxLayoutLookAndFeels, cxLookAndFeels, cxLookAndFeelPainters,
  cxPCdxBarPopupMenu, dxLayoutcxEditAdapters, dxLayoutContainer, cxButtonEdit,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Menus, SpTBXFormPopupMenu, ncaFrmProduto_PrecoAuto, ncaFrmProduto_Estoque,
  cxLookupEdit, cxDBLookupEdit, cxButtons;

const
   kAlturaTotalFrmProduto = 555;

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
    tsCadastro: TcxTabSheet;
    MTEstoqueRepor: TFloatField;
    MTFornecedor: TIntegerField;
    MTEstoqueMin: TFloatField;
    MTEstoqueMax: TFloatField;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel;
    dxLayoutStandardLookAndFeel1: TdxLayoutStandardLookAndFeel;
    MTNomeFor: TStringField;
    MTID: TIntegerField;
    tsPlus: TcxTabSheet;
    panPlus: TLMDSimplePanel;
    edDescrPlus: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    Image2: TImage;
    cxLabel2: TcxLabel;
    MTUnid: TStringField;
    qUnidade: TnxQuery;
    qUnidadeUnid: TStringField;
    MTCadastroRapido: TBooleanField;
    MTPermiteVendaFracionada: TBooleanField;
    cmClone: TdxBarButton;
    cmConfig: TdxBarLargeButton;
    LMDSimplePanel3: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    pagFoto: TcxPageControl;
    tsSemFoto: TcxTabSheet;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    lbSemFoto: TcxLabel;
    tsFoto: TcxTabSheet;
    panFoto: TLMDSimplePanel;
    edFoto: TcxDBImage;
    panCampos: TLMDSimplePanel;
    panDescr: TLMDSimplePanel;
    panCodigo: TLMDSimplePanel;
    panPreco: TLMDSimplePanel;
    panCod: TLMDSimplePanel;
    imgBarcodeScan: TImage;
    edCodigo: TcxDBMaskEdit;
    panCategUnid: TLMDSimplePanel;
    panCateg: TLMDSimplePanel;
    cxLabel6: TcxLabel;
    panUnid: TLMDSimplePanel;
    cxLabel7: TcxLabel;
    panFornecedor: TLMDSimplePanel;
    panObs: TLMDSimplePanel;
    edFornecedor: TcxDBPopupEdit;
    cxLabel5: TcxLabel;
    pgBottom: TcxPageControl;
    tsTran: TcxTabSheet;
    tsTrans: TcxTabSheet;
    edFidelidade: TcxDBCheckBox;
    Timer1: TTimer;
    panEstoque: TLMDSimplePanel;
    MTPrecoAuto: TBooleanField;
    MTMargem: TFloatField;
    edDescr: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    cxLabel9: TcxLabel;
    edObs: TcxDBMemo;
    edEstoque: TcxPopupEdit;
    panInnerEstoque: TLMDSimplePanel;
    lbPEstoque: TcxLabel;
    lbEstoque: TcxLabel;
    panMinMax: TLMDSimplePanel;
    lbLimites: TcxLabel;
    lbMinMax: TcxLabel;
    edFidPontos: TcxDBSpinEdit;
    edPreco: TcxPopupEdit;
    panInnerPreco: TLMDSimplePanel;
    imgPreco: TImage;
    panDadosPreco: TLMDSimplePanel;
    lbPromptPreco: TcxLabel;
    lbPreco: TcxLabel;
    panCustoLucro: TLMDSimplePanel;
    lbMargem: TcxLabel;
    lbCusto: TcxLabel;
    lbPromptCusto: TcxLabel;
    edCateg: TcxDBLookupComboBox;
    tCateg: TnxTable;
    tCategDescricao: TStringField;
    MTLookupCateg: TStringField;
    dsCateg: TDataSource;
    panLookup: TLMDSimplePanel;
    btnExcluir: TcxButton;
    btnEditar: TcxButton;
    btnAdicionar: TcxButton;
    Q: TnxQuery;
    tUnid: TnxTable;
    tUnidDescricao: TStringField;
    dsUnid: TDataSource;
    MTLookupUnid: TStringField;
    edUnid: TcxDBLookupComboBox;
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
    procedure edCodigoExit(Sender: TObject);
    procedure cmCloneClick(Sender: TObject);
    procedure cmConfigClick(Sender: TObject);
    procedure edDescrEnter(Sender: TObject);
    procedure edDescrExit(Sender: TObject);
    procedure popPrecoPopup(Sender: TObject);
    procedure popPrecoClosePopup(Sender: TObject; Selected: Boolean);
    procedure popPrecoBeforePopup(Sender: TObject; var FormWidth,
      FormHeight: Integer);
    procedure edPrecoFocusChanged(Sender: TObject);
    procedure panDadosPrecoClick(Sender: TObject);
    procedure edEstoqueFocusChanged(Sender: TObject);
    procedure edEstoquePropertiesInitPopup(Sender: TObject);
    procedure edEstoqueEnter(Sender: TObject);
    procedure edEstoquePropertiesPopup(Sender: TObject);
    procedure lbPEstoqueClick(Sender: TObject);
    procedure edPrecoEnter(Sender: TObject);
    procedure edPrecoPropertiesInitPopup(Sender: TObject);
    procedure edPrecoPropertiesPopup(Sender: TObject);
    procedure edCategFocusChanged(Sender: TObject);
    procedure edCategPropertiesInitPopup(Sender: TObject);
    procedure edCategPropertiesChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure edUnidFocusChanged(Sender: TObject);
    procedure edUnidPropertiesInitPopup(Sender: TObject);
    procedure edCategKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edUnidKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    
  private
    FrmPrecoAuto : TFrmProd_PrecoAuto;
    FrmEstoque : TFrmProd_Estoque;
    FPrecoPopped : Boolean;
    { Private declarations }
    procedure EnableDisable;
    procedure OnRollUpPrecoAuto(Sender: TObject; var RollUp: Boolean);
    function AbortRollUp(Sender: TObject; aHWND: HWND): Boolean;
    procedure FocusNextPreco(Sender: TObject);
    procedure FocusNextEstoque(Sender: TObject);
    procedure ChangePreco(Sender: TObject);
    procedure ChangeEstoque(Sender: TObject);

    procedure OnTimerClosePreco(Sender: TObject);
    procedure OnTimerFocusPreco(Sender: TObject);

    procedure wmProxControl(var Msg: TMsg); message wm_user;
  public
     Tab : TnxTable;
     CodAnt : String;
     FDadosFor : TDadosCliente;
     FFechando : Boolean;
     FEstoqueAnt : Double;
     FNovo : Boolean;
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
  ncafbMovEst,
  ncafbPesqFor,
  ncaFrmSaibaMaisClonar,
  ncaFrmConfigAutoCad,
  ncaFrmChecarCodProdutoDuplicado,
  ncClassesBase, ncaFrmOpcoes, ncaFrmConfigCodProdutoDuplicado,
  ncaFrmConfigQuickCad, ncaAlertaClonarProduto, ncaAlertaAutocad,
  ncaFrmConfigPrecoAuto, ncaFrmBasicTextEdit;

// START resource string wizard section
resourcestring
  SOpçõesParaProdutos = 'Opções para Produtos';
  SCampoCódigoNãoPodeSerDeixadoEmBr = 'Campo código não pode ser deixado em branco!';
  SJáExisteUmProdutoCadastradoComEs = 'Já existe um produto cadastrado com esse código';
  SCampoDescriçãoNãoPodeSerDeixadoE = 'Campo descrição não pode ser deixado em branco!';
  SNaoControlarEstoque = 'Não controlar estoque desse produto';
  SConfirmaExcluir = 'Deseja realmente excluir';
  SCategEmUsoOutrosProdutos = 'Essa categoria é usada por outros produtos. Não é possível excluir';
  SUnidEmUsoOutrosProdutos = 'Essa unidade é usada por outros produtos. Não é possível excluir';
  SMin = 'min';
  SMax = 'max';
  SLucro = 'Lucro';
  SCategoria = 'Categoria';
  SUnidadeMed = 'Unidade de Medida';
  SProdutoExcluido = 'Esse produto foi excluído por outro usuário';

// END resource string wizard section



{$R *.DFM}

procedure TFrmProduto.Editar(aTab: TnxTable);
begin
  Tab := aTab;

  with aTab.FieldByName('EstoqueAtual') do
    if IsNull then
       FEstoqueAnt := 0 else
       FEstoqueAnt := Value;
  
  if not tCateg.Locate('Descricao', Tab.FieldByName('Categoria').Value, []) then begin
    tCateg.Append;
    tCategDescricao.AsVariant := Tab.FieldByName('Categoria').Value;
    tCateg.Post;
  end;

  if not tUnid.Locate('Descricao', Tab.FieldByName('Unid').Value, []) then begin
    tUnid.Append;
    tUnidDescricao.AsVariant := Tab.FieldByName('Unid').Value;
    tUnid.Post;
  end;
  
  MT.Insert;
  //Tab.Edit;
  CodAnt := Tab.FieldByName('Codigo').AsString; // do not localize
  TransfDados(Tab, MT);
  //Tab.Post;
  MT.Post;
  MT.Edit;

  FrmEstoque.InitData(MTNaoControlaEstoque.Value, MTPermiteVendaFracionada.Value, FEstoqueAnt, MTEstoqueMin.Value, MTEstoqueMax.Value);

  if Tab.FieldByName('plus').AsBoolean=True then begin // do not localize
    Paginas.ActivePageIndex := 1;
  end else
    Paginas.ActivePageIndex := 0;
    
  cmKardex.Visible := ivAlways;
  cmGravar.Enabled := Permitido(daProCadastrar);
  ShowModal;

end;

procedure TFrmProduto.cmCloneClick(Sender: TObject);
begin
    TpanAlertaClonarProduto.Create(Self).Mostrar(Self);
    cmClone.Enabled := False;
    FNovo := True;
    MTID.clear;
    CodAnt := '';
end;

procedure TFrmProduto.cmConfigClick(Sender: TObject);
begin
  TFrmOpcoes.Create(Self).Editar(SOpçõesParaProdutos, [TFrmConfigAutoCad, TFrmConfigPrecoAuto, {$ifdef Loja}TFrmConfigQuickCad, {$endif}TFrmConfigCodProdutoDuplicado]);
end;

procedure TFrmProduto.edNaoControlarEstoquePropertiesCloseUp(Sender: TObject);
begin
  EnableDisable;
end;

procedure TFrmProduto.edPrecoEnter(Sender: TObject);
begin
  edPreco.DroppedDown := True;
end;

procedure TFrmProduto.edPrecoFocusChanged(Sender: TObject);
begin
  if edPreco.Focused then 
    panPreco.Color := FrmPri.FocusColor else
    panPreco.Color := clWhite;
end;

procedure TFrmProduto.edPrecoPropertiesInitPopup(Sender: TObject);
begin
  edPreco.Properties.PopupControl := FrmPrecoAuto.panPri;
end;

procedure TFrmProduto.edPrecoPropertiesPopup(Sender: TObject);
begin
  FrmPrecoAuto.FocusFirst;
end;

procedure TFrmProduto.edUnidFocusChanged(Sender: TObject);
begin
  if edUnid.Focused then
    panUnid.Color := FrmPri.FocusColor else
    panUnid.Color := clWhite;
end;

procedure TFrmProduto.edUnidKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key <> KEY_ENTER) and (Key  <> Key_TAB) and (Key <> Key_ESC) and (Key <> Key_F2) then
    edUnid.DroppedDown := True;
end;

procedure TFrmProduto.edUnidPropertiesInitPopup(Sender: TObject);
begin
  edUnid.Properties.Grid.Align := alClient;
  panLookup.Parent := edUnid.Properties.Grid.Parent;
  panLookup.Visible := True;
  panLookup.Align := alTop;
end;

procedure TFrmProduto.EnableDisable;
begin
  edFidPontos.Enabled := edFidelidade.Enabled and edFidelidade.Checked;
end;

procedure TFrmProduto.Incluir(aTab: TnxTable);
begin
  FNovo := True;
  cmClone.Enabled := False;
  Tab := aTab;  
  MT.Insert;
  MT.Post;
  MT.Edit;

  FrmEstoque.InitData(MTNaoControlaEstoque.Value, MTPermiteVendaFracionada.Value, FEstoqueAnt, MTEstoqueMin.Value, MTEstoqueMax.Value);
  
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
  MTPrecoAuto.Value := gConfig.PrecoAuto;
end;

procedure TFrmProduto.NBLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
begin
  Paginas.ActivePageIndex := ALink.Item.Tag;
end;

procedure TFrmProduto.OnRollUpPrecoAuto(Sender: TObject; var RollUp: Boolean);
begin
  RollUp := not edPreco.Focused;
end;

procedure TFrmProduto.OnTimerClosePreco(Sender: TObject);
begin
  Sender.Free;
{  Timer1.Interval := 50;
  if (not FPrecoPopped) and edPreco.Focused then
    Timer1Timer(nil);}
end;

procedure TFrmProduto.OnTimerFocusPreco(Sender: TObject);
begin
  Sender.Free;
  if FPrecoPopped and edPreco.Focused then
    FrmPrecoAuto.SetFocus;
end;

procedure TFrmProduto.panDadosPrecoClick(Sender: TObject);
begin
  if not FPrecoPopped then
    edPreco.SetFocus;
end;

procedure TFrmProduto.popPrecoBeforePopup(Sender: TObject; var FormWidth,
  FormHeight: Integer);
begin
  FormWidth := FrmPrecoAuto.Width;
  FormHeight := FrmPrecoAuto.Height;
end;

procedure TFrmProduto.popPrecoClosePopup(Sender: TObject; Selected: Boolean);
begin
  FPrecoPopped := False; 
  with TTimer.Create(Self) do begin
    Interval := 500;
    OnTimer := OnTimerClosePreco;
    Enabled := True;
  end;
end;

procedure TFrmProduto.popPrecoPopup(Sender: TObject);
begin
  FPrecoPopped := True;
  FrmPrecoAuto.FocusFirst;
end;


procedure TFrmProduto.wmProxControl(var Msg: TMsg);
begin
  if not edEstoque.DroppedDown then
    Perform(Wm_NextDlgCtl,0,0);
end;

procedure TFrmProduto.cmGravarClick(Sender: TObject);
var 
  Cat: String;
  DS : TDataSource;
begin
  edObs.SetFocus;
  edDescr.SetFocus;
  MTPreco.Value := FrmPrecoAuto.Preco;
  MTCustoUnitario.Value := FrmPrecoAuto.Custo;
  MTPrecoAuto.Value := FrmPrecoAuto.PrecoAuto;
  MTMargem.AsVariant := FrmPrecoAuto.Margem;
  MTPodeAlterarPreco.Value := FrmPrecoAuto.PodeAlterarPreco;

  MTNaoControlaEstoque.Value := FrmEstoque.NaoControlar;
  MTPermiteVendaFracionada.Value := FrmEstoque.Fracao;
  MTEstoqueMin.Value := FrmEstoque.Minimo;
  MTEstoqueMax.Value := FrmEstoque.Maximo;
  
  if Trim(MTCodigo.Value)='' then begin
    Beep;
    edCodigo.SetFocus;
    ShowMessage(SCampoCódigoNãoPodeSerDeixadoEmBr);
    Exit;
  end;  
  if (MTCodigo.Value <> CodAnt) then 
  if Dados.tbPro.Locate('Codigo', MTCodigo.Value, [loCaseInsensitive]) then begin // do not localize
    Beep;
    if dados.CM.UA.Admin then begin
        TFrmChecarCodProdutoDuplicado.Create(self).ShowModal;
        if not gConfig.CodProdutoDuplicados then begin
            edCodigo.SetFocus;
            Exit;
        end;
    end else begin
        edCodigo.SetFocus;
        ShowMessage(SJáExisteUmProdutoCadastradoComEs);
        Exit;
    end;
  end;
  if Trim(MTDescricao.Value)='' then begin // do not localize
    Beep;
    edDescr.SetFocus;
    ShowMessage(SCampoDescriçãoNãoPodeSerDeixadoE);
    Exit;
  end;  
  
  with Dados do begin
    tbPro.IndexName := 'IID';
    InitTran(DB, [], False);
    try
      if FNovo then
        tbPro.Insert
      else 
      if tbPro.FindKey([MTID.Value]) then 
        tbPro.Edit else
        Raise Exception.Create(SProdutoExcluido);
      TransfDados(MT, tbPro);
      tbProCadastroRapido.Value := False;
      tbPro.Post;  
      DB.Commit;
      if FNovo then
        Tab.Locate('ID', tbProID.Value,[]) else
        Tab.Refresh;
    except
      DB.Rollback;
      Raise;
    end;
    if Dados.CorrigeEstoque(tbProID.Value, FEstoqueAnt, FrmEstoque.Estoque) then Tab.Refresh;
  end;

  
  
  {$ifdef LOJA}
  FrmPri.refreshRevisarCadProduto;
  {$endif}
  FFechando := True;
  Close;
end;

procedure TFrmProduto.btnExcluirClick(Sender: TObject);
var 
  Orig: String;
begin
  if edCateg.Focused then begin
    if SimNao(SConfirmaExcluir+' '+tCategDescricao.Value+'?') then begin
      Orig := tCategDescricao.Value;
      Q.Active := False;
      Q.SQL.Text := 'select count(*) from produto where (Categoria like '+QuotedStr(tCategDescricao.Value)+')';
      if not FNovo then
         Q.SQL.Text := Q.SQL.Text + ' AND (ID <> '+MTID.AsString+')';
      Q.Active := True;
      Caption := Q.Fields[0].AsString;
      if Q.Fields[0].Value>0 then
        ShowMessage(SCategEmUsoOutrosProdutos) 
      else begin
        tCateg.Delete;
        if (edCateg.EditValue<>null) and SameText(edCateg.EditValue, Orig) then
          edCateg.Clear;
      end;
    end;
    edCateg.DroppedDown := True;
  end;

  if edUnid.Focused then begin
    if SimNao(SConfirmaExcluir+' '+tUnidDescricao.Value+'?') then begin
      Orig := tUnidDescricao.Value;
      Q.Active := False;
      Q.SQL.Text := 'select count(*) from produto where (Unid like '+QuotedStr(tUnidDescricao.Value)+')';
      if not FNovo then
         Q.SQL.Text := Q.SQL.Text + ' AND (ID <> '+MTID.AsString+')';
      Q.Active := True;
      Caption := Q.Fields[0].AsString;
      if Q.Fields[0].Value>0 then
        ShowMessage(SUnidEmUsoOutrosProdutos) 
      else begin
        tUnid.Delete;
        if (edUnid.EditValue<>null) and SameText(edUnid.EditValue, Orig) then
          edUnid.Clear;
      end;
    end;
    edUnid.DroppedDown := True;
  end;
end;

procedure TFrmProduto.btnEditarClick(Sender: TObject);
var S, Orig: String;
begin
  if edCateg.Focused then begin
    S := tCategDescricao.Value;
    Orig := S;
    if TFrmBasicTextEdit.Create(Self).Editar(SCategoria, SCategoria, 35, S) then begin
      Q.Active := False;
      Q.SQL.Text := 'update produto set categoria = '+QuotedStr(S)+' where categoria = '+QuotedStr(Orig);
      Q.ExecSQL;
      if tCateg.Locate('Descricao', S, []) then begin
        if tCateg.Locate('Descricao', Orig, []) then
          tCateg.Delete;
      end else 
      if tCateg.Locate('Descricao', Orig, []) then begin
        tCateg.Edit;
        tCategDescricao.Value := S;
        tCateg.Post;
      end;
      if (edCateg.EditValue<>null) and SameText(edCateg.EditValue, Orig) then
        edCateg.EditValue := S;
    end;
    edCateg.DroppedDown := True;
  end;

  if edUnid.Focused then begin
    S := tUnidDescricao.Value;
    Orig := S;
    if TFrmBasicTextEdit.Create(Self).Editar(SUnidadeMed, SUnidadeMed, 5, S) then begin
      Q.Active := False;
      Q.SQL.Text := 'update produto set unid = '+QuotedStr(S)+' where Unid = '+QuotedStr(Orig);
      Q.ExecSQL;
      if tUnid.Locate('Descricao', S, []) then begin
        if tUnid.Locate('Descricao', Orig, []) then
          tUnid.Delete;
      end else 
      if tUnid.Locate('Descricao', Orig, []) then begin
        tUnid.Edit;
        tUnidDescricao.Value := S;
        tUnid.Post;
      end;
      if (edUnid.EditValue<>null) and SameText(edUnid.EditValue, Orig) then
        edUnid.EditValue := S;
    end;
    edUnid.DroppedDown := True;
  end;
  
end;

procedure TFrmProduto.btnAdicionarClick(Sender: TObject);
var S: String;
begin
  if edCateg.Focused then begin
    S := '';
    if TFrmBasicTextEdit.Create(Self).Editar(SCategoria, SCategoria, 35, S) then begin
      if not tCateg.Locate('Descricao', S, []) then begin
        tCateg.Append;
        tCategDescricao.Value := S;
        tCateg.Post;
        edCateg.EditValue := S;
      end;
      edCateg.EditValue := S;
    end else
      edCateg.DroppedDown := True;
  end;

  if edUnid.Focused then begin
    S := '';
    if TFrmBasicTextEdit.Create(Self).Editar(SUnidadeMed, SUnidadeMed, 5, S) then begin
      if not tUnid.Locate('Descricao', S, []) then begin
        tUnid.Append;
        tUnidDescricao.Value := S;
        tUnid.Post;
      end;
      edUnid.EditValue := S;
    end else
      edUnid.DroppedDown := True;
  end;
end;

procedure TFrmProduto.lbPEstoqueClick(Sender: TObject);
begin
  edEstoque.SetFocus;
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

function IsPictureEmpty(APicture: TPicture): Boolean;
begin
  Result := not Assigned(APicture.Graphic) or APicture.Graphic.Empty;
end;

procedure TFrmProduto.edFotoPropertiesEditValueChanged(Sender: TObject);
begin
  if IsPictureEmpty(edFoto.Picture) then
    pagFoto.ActivePageIndex := 0 else
    pagFoto.ActivePageIndex := 1;
end;

function TFrmProduto.AbortRollUp(Sender: TObject; aHWND: HWND): Boolean;
begin
  Result := (aHWND = panPreco.Handle) or Windows.IsChild(panPreco.Handle, aHWND) or (aHWND = lbPreco.Handle) or (aHWND = panDadosPreco.Handle) or 
            Windows.IsChild(panPreco.Handle, aHWND);
end;

function NumStr(D: Double; Casas: Byte = 2): String;
var P: Integer;
begin
  Str(D:10:Casas, Result);
  P := Pos('.', Result);
  if Pos('.', Result)>0 then begin
    Result[P] := DecimalSeparator;
    while Copy(Result, Length(Result), 1)='0' do Delete(Result, Length(Result), 1);
  end;
  if Copy(Result, Length(Result), 1) = DecimalSeparator then 
    Delete(Result, Length(Result), 1);
  Result := TrimLeft(Result);  
end;

procedure TFrmProduto.ChangeEstoque(Sender: TObject);
var S: String;
begin
  if FrmEstoque.NaoControlar then begin
    panMinMax.Visible := False;
    lbEstoque.Caption := SNaoControlarEstoque;
    lbEstoque.Style.Font.Size := 8;
  end else begin
    panMinMax.Visible := (FrmEstoque.Minimo>0) or (FrmEstoque.Maximo>0);
    lbEstoque.Style.Font.Size := 13;  
    lbEstoque.Caption := NumStr(FrmEstoque.Estoque);
    S := '';
    if FrmEstoque.Minimo>0.01 then
      S := SMin+'='+NumStr(FrmEstoque.Minimo);
    if FrmEstoque.Maximo>0.01 then begin
      if S>'' then S := S + ', ';
      S := S + SMax +'=' +NumStr(FrmEstoque.Maximo);
    end;
    lbMinMax.Caption := S;
  end;
end;

procedure TFrmProduto.ChangePreco(Sender: TObject);
begin
  lbPreco.Caption := FloatToStrF(FrmPrecoAuto.Preco, ffCurrency, 20, CurrencyDecimals);
  lbCusto.Caption := FloatToStrF(FrmPrecoAuto.Custo, ffCurrency, 20, CurrencyDecimals);
  lbMargem.Caption := '('+SLucro+' '+NumStr(FrmPrecoAuto.edMargem.Value)+'%)';
  panCustoLucro.Visible := Permitido(daVerCusto);
end;

procedure TFrmProduto.cmCancelarClick(Sender: TObject);
begin
  FFechando := True;
  edObs.SetFocus;
  edDescr.SetFocus;
  Close;
end;

procedure TFrmProduto.FocusNextEstoque(Sender: TObject);
begin
  edEstoque.DroppedDown := False;
  edCateg.SetFocus;
end;

procedure TFrmProduto.FocusNextPreco(Sender: TObject);
begin
  edEstoque.SetFocus;
end;

procedure TFrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  FVen:= nil;
  FMgr.Clear;
  Action:= CaFree;
end;

procedure TFrmProduto.FormShow(Sender: TObject);
var SaveIndex: Integer;
begin
  FrmPrecoAuto.InitData(MTPreco.Value, MTCustoUnitario.Value, MTMargem.AsVariant, MTPrecoAuto.Value, MTPodeAlterarPreco.Value);
  ChangeEstoque(nil);
  EnableDisable;
  

  edCodigo.SetFocus;
  cmConfig.Enabled := Dados.CM.UA.Admin;

//  PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
{  qCat.First;
  while not qCat.Eof do
  begin
    if Trim(qCatCategoria.Value)<>'' then
      edCategoria.Properties.Items.Add(qCatCategoria.Value);
    qCat.Next;
  end;

  qUnidade.First;
  while not qUnidade.Eof do
  begin
    if Trim(qUnidadeUnid.Value)<>'' then
      edUnidade.Properties.Items.Add(qUnidadeUnid.Value);
    qUnidade.Next;
  end;}

  pagFoto.ActivePageIndex := 1;

  if mtImagem.IsNull then
    pagFoto.ActivePageIndex := 0 else
    pagFoto.ActivePageIndex := 1;

  SaveIndex := Paginas.ActivePageIndex;

  pgBottom.Enabled := not FNovo;
    
  if not FNovo then
  with TfbMovEst.Create(Self) do begin
    panPri.Parent := tsTrans;
    AtualizaDireitos;
    ParentChanged;
    Operacao := 0;
    Filtro := MTID.Value;
    FiltraDados;
  end;

  if (Screen.Width=640) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
end;

procedure TFrmProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if not edObs.Focused then PostMessage(Handle, wm_user, 0, 0);
    Key_F2 : if cmGravar.Enabled then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmProduto.FormCreate(Sender: TObject);
begin
  FNovo := False;
  FEstoqueAnt := 0;
  FFechando := False;
  FrmEstoque := TFrmProd_Estoque.Create(Self);
  FrmEstoque.OnFocusNext := FocusNextEstoque;
  FrmEstoque.OnChange := ChangeEstoque;
  
  FrmPrecoAuto := TFrmProd_PrecoAuto.Create(Self);
  FrmPrecoAuto.OnFocusNext := FocusNextPreco;
  FrmPrecoAuto.OnChange := ChangePreco;

  with edEstoque.Properties do begin
    PopupHeight := FrmEstoque.Height;
    PopupWidth := FrmEstoque.Width;
    PopupMinHeight := PopupHeight;
    PopupMinWidth := PopupWidth;
  end;

  with edPreco.Properties do begin
    PopupHeight := FrmPrecoAuto.Height;
    PopupWidth := FrmPrecoAuto.Width;
    PopupMinHeight := PopupHeight;
    PopupMinWidth := PopupWidth;
  end;
  
  lbSemFoto.Align := alClient;
  MT.Open;
  pagFoto.ActivePageIndex := 0;
//  edPrecoVenda.Properties.ReadOnly := not Permitido(daProEditarPreco);
//  edPodeAlterarPreco.Properties.ReadOnly := not Permitido(daProEditarPreco);
  CodAnt := '';
  FDadosFor.dcCodigo := 0;
end;

procedure TFrmProduto.edCategFocusChanged(Sender: TObject);
begin
  if edCateg.Focused then
    panCateg.Color := FrmPri.FocusColor else
    panCateg.Color := clWhite;
end;

procedure TFrmProduto.edCategKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key <> KEY_ENTER) and (Key  <> Key_TAB) and (Key <> Key_ESC) and (Key <> Key_F2) then
    edCateg.DroppedDown := True;
end;

procedure TFrmProduto.edCategPropertiesChange(Sender: TObject);
begin
  edCateg.PostEditValue;
end;

procedure TFrmProduto.edCategPropertiesInitPopup(Sender: TObject);
begin
  if not tCateg.Locate('Descricao', edCateg.EditValue, []) then begin
    tCateg.Append;
    tCategDescricao.AsVariant := edCateg.EditValue;
    tCateg.Post;
  end;

  edCateg.Properties.Grid.Align := alClient;
  panLookup.Parent := edCateg.Properties.Grid.Parent;
  panLookup.Visible := True;
  panLookup.Align := alTop;
end;

procedure TFrmProduto.edCodigoExit(Sender: TObject);
var
  ms : TMemoryStream;
begin
  Dados.tbProdD.Open;
  if gConfig.Autocad and (CodAnt<>edCodigo.Text) then
  if Dados.tbProdD.Locate('codbar', edCodigo.Text, [loCaseInsensitive]) then begin // do not localize
    Beep;
    MTDescricao.Value := Dados.tbProdDdescricao.Value;
    MTCategoria.Value := Dados.tbProdDcategoria.Value;
    MTUnid.text := Dados.tbProdDunid.Value;
    if not Dados.tbProdDimagem.IsNull then begin
       pagFoto.ActivePageIndex := 1;
       ms := TMemoryStream.create;
       try
         Dados.tbProdDimagem.SaveToStream(ms);
         ms.seek(0,0);
         MTimagem.LoadFromStream(ms);
       finally
         ms.Free;
       end;
    end;
    edPreco.SetFocus;

    TpanAlertaAutocad.Create(Self).Mostrar(Self);
  end;
end;

procedure TFrmProduto.edDescrEnter(Sender: TObject);
begin
  TLMDSimplePanel(TControl(Sender).Parent).Color := FrmPri.FocusColor;
end;

procedure TFrmProduto.edDescrExit(Sender: TObject);
begin
  TLMDSimplePanel(TControl(Sender).Parent).Color := clWhite;
end;

procedure TFrmProduto.edEstoqueEnter(Sender: TObject);
begin
  edEstoque.DroppedDown := True;
end;

procedure TFrmProduto.edEstoqueFocusChanged(Sender: TObject);
begin
  if edEstoque.Focused then
    panEstoque.Color := FrmPri.FocusColor else
    panEstoque.Color := clWhite;
end;

procedure TFrmProduto.edEstoquePropertiesInitPopup(Sender: TObject);
begin
  edEstoque.Properties.PopupControl := FrmEstoque.panPri;
end;

procedure TFrmProduto.edEstoquePropertiesPopup(Sender: TObject);
begin
  FrmEstoque.FocusFirst;
end;

end.





















