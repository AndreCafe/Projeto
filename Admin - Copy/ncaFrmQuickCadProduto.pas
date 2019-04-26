unit ncaFrmQuickCadProduto;
{
    ResourceString: Dario 11/03/13
}

interface

{$I NEX.inc}

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
  cxPCdxBarPopupMenu, dxLayoutcxEditAdapters, dxLayoutContainer, Menus,
  cxButtons;

type
  TFrmQuickCadProduto = class(TForm)
    BarMgr: TdxBarManager;
    QCat: TnxQuery;
    dsMT: TDataSource;
    cmKardex: TdxBarButton;
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
    MTEstoqueRepor: TFloatField;
    MTFornecedor: TIntegerField;
    MTEstoqueMin: TFloatField;
    MTEstoqueMax: TFloatField;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel;
    dxLayoutStandardLookAndFeel1: TdxLayoutStandardLookAndFeel;
    MTNomeFor: TStringField;
    MTID: TIntegerField;
    MTUnid: TStringField;
    LMDSimplePanel1: TLMDSimplePanel;
    btnOk: TcxButton;
    btCancelar: TcxButton;
    qUnidade: TnxQuery;
    qUnidadeUnid: TStringField;
    lcFicha: TdxLayoutControl;
    edCodigo: TcxDBMaskEdit;
    edDescr: TcxDBTextEdit;
    edPrecoVenda: TcxDBCurrencyEdit;
    edCategoria: TcxDBComboBox;
    panFoto: TLMDSimplePanel;
    edFoto: TcxDBImage;
    edUnidade: TcxDBComboBox;
    dxLayoutGroup1: TdxLayoutGroup;
    lcFichaGroup5: TdxLayoutGroup;
    lcFichaItem2: TdxLayoutItem;
    lcFichaItem3: TdxLayoutItem;
    dxLayoutItem1: TdxLayoutItem;
    lcFichaItem5: TdxLayoutItem;
    lcFichaUnidade: TdxLayoutItem;
    lcFichaFoto: TdxLayoutItem;
    lcFichaGroupFoto: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    panelAutoCad: TLMDSimplePanel;
    Image3: TImage;
    cxLabel3: TcxLabel;
    cxLabelAutoCadDesativar: TcxLabel;
    //procedure btOkClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure MTAfterInsert(DataSet: TDataSet);
    procedure edFornecedorPropertiesInitPopup(Sender: TObject);
    procedure edFornecedorPropertiesCloseUp(Sender: TObject);
    procedure lbSemFotoClick(Sender: TObject);
    procedure edDescrEnter(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cxLabelAutoCadDesativarClick(Sender: TObject);
  private
    FProd : integer;
    { Private declarations }
    FParentHWND : HWND;
    procedure CreateParams(var Params: TCreateParams); override;
    
  public
    Tab : TnxTable;
    FDadosFor : TDadosCliente;
    { Public declarations }
    constructor Create(aParentHWND: HWND; AOwner: TComponent); 
    function Incluir(aCodigo: string; aTab: TnxTable):integer;
  end;

var
  FrmQuickCadProduto: TFrmQuickCadProduto;
  
implementation

uses
  ncIDRecursos, 
  ncaDM, 
  ufmImagens, 
  ncaFrmPri,
  ncaFrmConfigQuickCad,
  ncafbMovEst, ncafbPesqFor, ncClassesBase;

// START resource string wizard section
resourcestring
  SCampoPreçoDeVendaNãoPodeSerDeixa = 'Campo preço de venda não pode ser deixado em branco!';
  SCampoCódigoNãoPodeSerDeixadoEmBr = 'Campo código não pode ser deixado em branco!';
  SCampoDescriçãoNãoPodeSerDeixadoE = 'Campo descrição não pode ser deixado em branco!';

// END resource string wizard section



{$R *.DFM}

function TFrmQuickCadProduto.Incluir(aCodigo: string; aTab: TnxTable):integer;
var
  ms : TMemoryStream;
begin
  result := 0;
  Tab := aTab;
  MT.Insert;
  MT.Post;
  MT.Edit;

  edCodigo.Text := aCodigo;
  MTCodigo.Value := aCodigo;

  Dados.tbProdD.Open;
  width := 383;
  if gConfig.Autocad then
      if Dados.tbProdD.Locate('codbar', aCodigo, [loCaseInsensitive]) then begin // do not localize
        MTDescricao.Value := Dados.tbProdDdescricao.Value;
        MTCategoria.Value := Dados.tbProdDcategoria.Value;
        MTUnid.text := Dados.tbProdDunid.Value;
        if not Dados.tbProdDimagem.IsNull then begin
           lcFichaGroupFoto.visible := false;
           ms := TMemoryStream.create;
           try
             Dados.tbProdDimagem.SaveToStream(ms);
             ms.seek(0,0);
             MTimagem.LoadFromStream(ms);
           finally
             ms.Free;
           end;
           width := 541; 
        end;
      end;

  ShowModal;
  result := FProd;
end;
    
procedure TFrmQuickCadProduto.lbSemFotoClick(Sender: TObject);
begin
  edFoto.LoadFromFile;
end;

procedure TFrmQuickCadProduto.MTAfterInsert(DataSet: TDataSet);
begin
  MTFidelidade.Value := False;
  MTNaoControlaEstoque.Value := False;
end;

procedure TFrmQuickCadProduto.btnOkClick(Sender: TObject);
var
  Cat: String;
  DS : TDataSource;
begin

  if MTPreco.Value=0 then begin
    Beep;
    edPrecoVenda.SetFocus;
    ShowMessage(SCampoPreçoDeVendaNãoPodeSerDeixa);
    Exit;
  end;
  if Trim(MTCodigo.Value)='' then begin
    Beep;
    edCodigo.SetFocus;
    ShowMessage(SCampoCódigoNãoPodeSerDeixadoEmBr);
    Exit;
  end;
  if (MT.FieldByName('Descricao').AsString)='' then begin // do not localize
    Beep;
    edDescr.SetFocus;
    ShowMessage(SCampoDescriçãoNãoPodeSerDeixadoE);
    Exit;
  end;

  with Dados do begin
    InitTran(DB, [], False);
    try
      Tab.Insert;
      Tab.Edit;
      {Cat := Trim(MT.FieldByName('categoria').AsString);
      if (Cat <> '') and (not Findkey([MT.FieldByName('categoria').AsString]))
      then begin
        Append;
        FieldByName('Descricao').AsString :=
          MT.FieldByName('categoria').AsString;
        Post;
      end;}
      TransfDados(MT, Tab);
      Tab.fieldByName('CadastroRapido').asboolean := true; // do not localize
      Tab.Post;
      FProd := Tab.fieldByName('ID').asinteger; // do not localize
      DB.Commit;
    except
      DB.Rollback;
      Raise;
    end;

    {$ifdef LOJA}
    FrmPri.refreshRevisarCadProduto;
    {$endif}
    ModalResult := mrOK;
  end;
end;


constructor TFrmQuickCadProduto.Create(aParentHWND: HWND;
  AOwner: TComponent);
begin
  FParentHWND := aParentHWND;
  inherited Create(AOwner);
end;

procedure TFrmQuickCadProduto.CreateParams(var Params: TCreateParams);
begin
  inherited;
  params.ExStyle := params.ExStyle or WS_EX_APPWINDOW;
  params.WndParent := FParentHWND;
end;

procedure TFrmQuickCadProduto.cxLabelAutoCadDesativarClick(Sender: TObject);
begin
  TFrmConfigQuickCad.Create(Self).ShowModal;
end;

procedure TFrmQuickCadProduto.edDescrEnter(Sender: TObject);
begin
    if Sender is TcxCustomMaskEdit then
        TcxCustomMaskEdit(Sender).SelectAll;
end;


procedure TFrmQuickCadProduto.edFornecedorPropertiesCloseUp(Sender: TObject);
begin
  if MT.State<>dsEdit then MT.Edit;
  MTFornecedor.Value := FDadosFor.dcCodigo;
  TcxCustomDropDownEdit(Sender).Text := MTNomeFor.Value;
end;

procedure TFrmQuickCadProduto.edFornecedorPropertiesInitPopup(Sender: TObject);
begin
  FDadosFor.dcCodigo := MTFornecedor.Value;
  TcxPopupEdit(Sender).Properties.PopupControl := fbPesqFor;
  fbPesqFor.PreparaBusca(@FDadosFor, TcxCustomDropDownEdit(Sender));
end;

function IsPictureEmpty(APicture: TPicture): Boolean;
begin
  Result := not Assigned(APicture.Graphic) or APicture.Graphic.Empty;
end;

procedure TFrmQuickCadProduto.btCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmQuickCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  FVen:= nil;
  Action:= CaFree;
end;

procedure TFrmQuickCadProduto.FormShow(Sender: TObject);
begin
  FProd := 0;
  edPrecoVenda.SetFocus;
  cxLabelAutoCadDesativar.enabled := Dados.CM.UA.Admin;

//  PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
  qCat.First;
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
  end;

  lcFichaGroupFoto.visible := not mtImagem.IsNull;

  if (Screen.Width=640) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);


end;

procedure TFrmQuickCadProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Esc   : close;
    Key_Enter : begin
                  SelectNext(ActiveControl as TWinControl,True,True);
                  key:=0;
                end;
  end;
end;

procedure TFrmQuickCadProduto.FormCreate(Sender: TObject);
begin
  MT.Open;
  KeyPreview := true;
  lcFichaGroupFoto.visible := false;
  edPrecoVenda.Properties.ReadOnly := not Permitido(daProEditarPreco);
  FDadosFor.dcCodigo := 0;
end;

end.

