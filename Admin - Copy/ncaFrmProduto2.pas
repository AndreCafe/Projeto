unit ncaFrmProduto2;
{
    ResourceString: Dario 08/03/13
}

interface

{$I NEX.INC}

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
  cxTextEdit, dxLayoutLookAndFeels, cxLookAndFeels, cxLookAndFeelPainters,
  cxPCdxBarPopupMenu, dxLayoutcxEditAdapters, dxLayoutContainer, ufmFrmBasePai,
  uNexTransResourceStrings_PT, ncaFrmPopupCategoria, ncaFrmPopupUnidade,
  SpTBXFormPopupMenu, Menus, TB2Item, SpTBXItem, ncPopUpBase,
  ncaFrmLabelPopUp, ncaFrmPopUpPrecoVenda;

const
   kAlturaTotalFrmProduto = 555;

type
  TFrmProduto = class(TFrmBasePai)
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
    lcFichaItem2: TdxLayoutItem;
    lcFichaItem3: TdxLayoutItem;
    lcFichaItem24: TdxLayoutItem;
    lcFichaItem23: TdxLayoutItem;
    lcFichaItem1: TdxLayoutItem;
    edCustoUnitario: TcxDBCurrencyEdit;
    lcFichaItem4: TdxLayoutItem;
    lcFichaGroup1: TdxLayoutGroup;
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
    MTID: TIntegerField;
    tsPlus: TcxTabSheet;
    panPlus: TLMDSimplePanel;
    edDescrPlus: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    Image2: TImage;
    cxLabel2: TcxLabel;
    panelAutoCad: TLMDSimplePanel;
    Image3: TImage;
    cxLabel3: TcxLabel;
    cxLabelAutoCadSaibaMais: TcxLabel;
    MTUnid: TStringField;
    lcFichaUnidade: TdxLayoutItem;
    qUnidade: TnxQuery;
    qUnidadeUnid: TStringField;
    MTCadastroRapido: TBooleanField;
    lcFichaGroup8: TdxLayoutGroup;
    lcFichaGroup9: TdxLayoutGroup;
    lcFichaGroup10: TdxLayoutGroup;
    lcFichaGroup11: TdxLayoutGroup;
    lcFichaItem12: TdxLayoutItem;
    vendarac: TcxDBCheckBox;
    MTPermiteVendaFracionada: TBooleanField;
    cmClone: TdxBarButton;
    panelClonar: TLMDSimplePanel;
    Image4: TImage;
    cxLabel4: TcxLabel;
    cxLabelClonarSaibaMais: TcxLabel;
    cmConfig: TdxBarLargeButton;
    edPopUpCategoria: TcxDBPopupEdit;
    lcFichaItem13: TdxLayoutItem;
    edPopUpUnidade: TcxDBPopupEdit;
    MTPrecoAuto: TBooleanField;
    MTMargem: TCurrencyField;
    edPopupPreco: TcxTextEdit;
    Timer1: TTimer;
    lcFichaItem9: TdxLayoutItem;
    nexPopUpBasePreco: TnexPopUpBase;
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
    procedure cxLabelAutoCadSaibaMaisClick(Sender: TObject);
    procedure cmCloneClick(Sender: TObject);
    procedure cxLabelClonarSaibaMaisClick(Sender: TObject);
    procedure cmConfigClick(Sender: TObject);
    procedure edPopupPrecoExit(Sender: TObject);
    procedure edPopUpUnidadeEnter(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    FNextControl : TWinControl;
    procedure EnableDisable;
    procedure InicializarPopups;
  public
     Tab : TnxTable;
     CodAnt : String;
     FDadosFor : TDadosCliente;
    { Public declarations }
    procedure FocusNextControl(aWinControl:TWinControl);
    procedure Editar(aTab: TnxTable);
    procedure Incluir(aTab: TnxTable);
  end;

var
  FrmProduto: TFrmProduto;
  
implementation

uses
  Int64List,
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
{$IFDEF TRADUTOR}
  ufmTranslatorDM,
{$ENDIF}
  ncaFrmConfigQuickCad,
  ncaFrmConfigPrecoAuto,
  ncPopUpPrecoVendaForm;


// START resource string wizard section
// MMX resource string wizard section REMOVIDA - 08/04/13 12:58



{$R *.DFM}

procedure TFrmProduto.Editar(aTab: TnxTable);
begin
  Tab := aTab;
  MT.Insert;
  //Tab.Edit;
  CodAnt := Tab.FieldByName('Codigo').AsString; // do not localize
  TransfDados(Tab, MT);
  //Tab.Post;
  MT.Post;
  MT.Edit;

  if Tab.FieldByName('plus').AsBoolean=True then begin // do not localize
    Paginas.ActivePageIndex := 1;
    nbiCad.Tag := 1;
  end else
    Paginas.ActivePageIndex := 0;
    
  cmKardex.Visible := ivAlways;
  cmGravar.Enabled := Permitido(daProCadastrar);
  
  ShowModal;

end;

procedure TFrmProduto.cmCloneClick(Sender: TObject);
begin
    Height := kAlturaTotalFrmProduto - panelAutoCad.Height;
    panelClonar.Visible := true;
    cmClone.Enabled := False;
    MTID.clear;
    CodAnt := '';
end;

procedure TFrmProduto.cmConfigClick(Sender: TObject);
begin
  TFrmOpcoes.Create(Self).Editar(SncaFrmProduto_OpçõesParaProdutos, [TFrmConfigAutoCad, {$ifdef Loja}TFrmConfigQuickCad, TFrmConfigPrecoAuto, {$endif}TFrmConfigCodProdutoDuplicado]);
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

  cmClone.Enabled := False;
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
  Paginas.ActivePageIndex := ALink.Item.Tag;
end;



procedure TFrmProduto.cmGravarClick(Sender: TObject);
begin
  edCodigo.SetFocus;
  edDescr.SetFocus;
  if Trim(MTCodigo.Value)='' then begin
    Beep;
    edCodigo.SetFocus;
    ShowMessage(SncaFrmProduto_CampoCódigoNãoPodeSerDeixadoEmBr);
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
        ShowMessage(SncaFrmProduto_JáExisteUmProdutoCadastradoComEs);
        Exit;
    end;
  end;
  if (MT.FieldByName('Descricao').AsString)='' then begin // do not localize
    Beep;
    edDescr.SetFocus;
    ShowMessage(SncaFrmProduto_CampoDescriçãoNãoPodeSerDeixadoE);
    Exit;
  end;  
  
  with Dados do begin
    InitTran(DB, [], False);
    try
      {Cat := Trim(MT.FieldByName('categoria').AsString);
      if (Cat <> '') and (not Findkey([MT.FieldByName('categoria').AsString])) 
      then begin
        Append;
        FieldByName('Descricao').AsString := 
          MT.FieldByName('categoria').AsString;
        Post;
      end;}

      if CodAnt='' then
          Tab.Insert
      else begin
          if Tab.Locate('ID', MT.FieldByName('ID').AsString, [loCaseInsensitive]) then begin // do not localize
              Tab.Edit;
              Tab.FieldByName('CadastroRapido').AsBoolean := false; // do not localize
              MT.FieldByName('CadastroRapido').AsBoolean := false; // do not localize
          end;
      end;

      TransfDados(MT, Tab);
      Tab.Post;
      DB.Commit;
    except
      DB.Rollback;
      Raise;
    end;  
  end;
  {$ifdef LOJA}
  FrmPri.refreshRevisarCadProduto;
  {$endif}
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

procedure TFrmProduto.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

// Isto era pra ficar um classe intermediaria entro
// TFrmBasePai e TFrmProduto
procedure TFrmProduto.FocusNextControl(aWinControl: TWinControl);
var
   i, t1 : integer;
   item : TdxLayoutItem;
   Int64List : TInt64List;
begin
   Int64List := TInt64List.create;
   try
       t1 := aWinControl.TabOrder;
       with lcFicha do
       for i:=0 to  AbsoluteItemCount-1 do begin
           if (AbsoluteItems[i].inheritsfrom(TdxLayoutItem)) then
               with AbsoluteItems[i] as TdxLayoutItem do
               if (control.inheritsfrom(TWinControl)) then begin

                   if visible and enabled and
                      (TWinControl(control).TabOrder>t1) then begin
                          Int64List.Add(TWinControl(control).TabOrder);
                   end;
               end;
       end;
       Int64List.SortUp;
       if Int64List.Count>0 then
       with lcFicha do
       for i:=0 to  AbsoluteItemCount-1 do begin
           if (AbsoluteItems[i].inheritsfrom(TdxLayoutItem)) then
               with AbsoluteItems[i] as TdxLayoutItem do
               if (control.inheritsfrom(TWinControl)) then begin

                   if (Int64List[0] = TWinControl(control).TabOrder) then begin
                          FNextControl := TWinControl(control);
                          Timer1.enabled := true;
                          exit;
                   end;
               end;
       end;
   finally
       Int64List.Free;
   end;
end;

procedure TFrmProduto.Timer1Timer(Sender: TObject);
begin
    Timer1.enabled := false;
    if FNextControl<>nil then
        FNextControl.SetFocus;
    FNextControl := nil;
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
  EnableDisable;
  panelAutoCad.Visible := false;
  panelClonar.Visible := false;
  Height := kAlturaTotalFrmProduto - panelAutoCad.Height - panelClonar.Height;

  edCodigo.SetFocus;
  cmConfig.Enabled := Dados.CM.UA.Admin;

//  PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
  {qCat.First;
  while not qCat.Eof do
  begin
    if Trim(qCatCategoria.Value)<>'' then
      edCategoria.Properties.Items.Add(qCatCategoria.Value);
    qCat.Next;
  end; 
  //aqui

  qUnidade.First;
  while not qUnidade.Eof do
  begin
    if Trim(qUnidadeUnid.Value)<>'' then
      edUnidade.Properties.Items.Add(qUnidadeUnid.Value);
    qUnidade.Next;
  end;
  }
  pagFoto.ActivePageIndex := 1;

  if mtImagem.IsNull then
    pagFoto.ActivePageIndex := 0 else
    pagFoto.ActivePageIndex := 1;

  SaveIndex := Paginas.ActivePageIndex;
  FMgr.Mostrar(TfbMovEst, 0, MTID.Value);
  Paginas.ActivePageIndex := SaveIndex;

  if (Screen.Width=640) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
    
  InicializarPopups;
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
  MT.Open;
  pagFoto.ActivePageIndex := 0;
  edNaoControlarEstoque.Properties.ReadOnly := not Permitido(daProEditarPreco);
  edPopUpPreco.Properties.ReadOnly := not Permitido(daProEditarPreco);
  CodAnt := '';
  FDadosFor.dcCodigo := 0;
  FMgr.RegistraForm(TfbMovEst);


  //nexPopUpBase1.PopupForm := TFrmPopUpPrecoVenda.Create(Self);



end;

procedure TFrmProduto.InicializarPopups;
begin
  FrmPopupCategoria := TFrmPopupCategoria.create(Self);
  FrmPopupCategoria.Inicializar(edPopUpCategoria, MT);
  FrmPopupUnidade := TFrmPopupUnidade.create(Self);
  FrmPopupUnidade.Inicializar(edPopUpUnidade, MT);
  FrmLabelPopUp := TFrmLabelPopUp.create(Self);
  FrmLabelPopUp.Inicializar(edPopupPreco, MT);

  nexPopUpBasePreco.PopupForm := TFormPrecoVenda.create(Self);
  //    FrmPopupPrecoAuto.SetIniValue;
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
    edPopUpPreco.SetFocus;

    Height := kAlturaTotalFrmProduto - panelClonar.Height;
    panelAutoCad.Visible := true;
  end;
end;

procedure TFrmProduto.cxLabelAutoCadSaibaMaisClick(Sender: TObject);
begin
  TFrmConfigAutoCad.Create(Self).ShowModal;
end;

procedure TFrmProduto.cxLabelClonarSaibaMaisClick(Sender: TObject);
begin
  TFrmSaibaMaisClonar.Create(Self).ShowModal;
end;

procedure TFrmProduto.edPopupPrecoExit(Sender: TObject);
begin
//
end;

procedure TFrmProduto.edPopUpUnidadeEnter(Sender: TObject);
begin
//
end;


{$IFDEF TRADUTOR}
initialization
  RegisterFormForTranslate(TFrmProduto);
{$ENDIF}

end.


