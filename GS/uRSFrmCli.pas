unit uRSFrmCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxMaskEdit, cxRadioGroup, cxMemo,
  cxDropDownEdit, cxSpinEdit, cxImageComboBox, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxCalendar, cxCurrencyEdit,
  cxDBLookupComboBox, cxCheckBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxVGrid, cxDBVGrid, cxInplaceContainer, cxPC,
  dxBar, dxBarExtItems, cxDBLabel, cxLabel, cxContainer, cxTextEdit,
  cxDBEdit, ExtCtrls, kbmMemTable, kbmMWCustomConnectionPool,
  kbmMWCustomDataset, kbmMWClientDataset, uFreeBoleto, uFreeBoletoImage,
  Buttons, PngSpeedButton, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxButtonEdit;

type
  TFrmCli = class(TForm)
    BarMgr: TdxBarManager;
    cmSalvarFechar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cmFechar: TdxBarLargeButton;
    PagEdicao: TcxPageControl;
    tsCad: TcxTabSheet;
    VG: TcxDBVerticalGrid;
    VGCategoryRow1: TcxCategoryRow;
    VGCodigo: TcxDBEditorRow;
    VGTipoLoja: TcxDBEditorRow;
    VGLoja: TcxDBEditorRow;
    VGProprietarios: TcxDBEditorRow;
    VGNumMaq: TcxDBEditorRow;
    VGSenha: TcxDBEditorRow;
    VGGerente: TcxDBEditorRow;
    VGDBEditorRow1: TcxDBEditorRow;
    VGCategoryRow2: TcxCategoryRow;
    VGEndereco: TcxDBEditorRow;
    VGBairro: TcxDBEditorRow;
    VGDBMultiEditorRow1: TcxDBMultiEditorRow;
    VGCEP: TcxDBEditorRow;
    VGCategoryRow3: TcxCategoryRow;
    VGDBEditorRow2: TcxDBEditorRow;
    VGDBEditorRow3: TcxDBEditorRow;
    VGDBEditorRow4: TcxDBEditorRow;
    VGDBEditorRow5: TcxDBEditorRow;
    tsFin: TcxTabSheet;
    GridFC: TcxGrid;
    tvGridFin: TcxGridDBTableView;
    tvGridFinLancamento: TcxGridDBColumn;
    tvGridFinVencimento: TcxGridDBColumn;
    tvGridFinValor: TcxGridDBColumn;
    tvGridFinPagamento: TcxGridDBColumn;
    tvGridFinValorPago: TcxGridDBColumn;
    tvGridFinDescricao: TcxGridDBColumn;
    tvGridFinDoc: TcxGridDBColumn;
    tvGridFinObs: TcxGridDBColumn;
    GridFCLevel1: TcxGridLevel;
    tsEmail: TcxTabSheet;
    vgEmail: TcxDBVerticalGrid;
    vgEmailReg: TcxDBEditorRow;
    vgEmailTec: TcxDBEditorRow;
    vgEmailDBEditorRow2: TcxDBEditorRow;
    vgEmailDBEditorRow1: TcxDBEditorRow;
    tsLic: TcxTabSheet;
    VGLic: TcxDBVerticalGrid;
    VGLicCategoryRow2: TcxCategoryRow;
    VGLicSerieHD: TcxDBEditorRow;
    VGLicLicMaq: TcxDBEditorRow;
    vgLicTipo: TcxDBEditorRow;
    VGLicLicVenc: TcxDBEditorRow;
    VGLicCategoryRow1: TcxCategoryRow;
    VGLicManInicio: TcxDBEditorRow;
    VGLicManVenc: TcxDBEditorRow;
    panDadosPri: TPanel;
    edCodLoja: TcxDBTextEdit;
    edLic: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cmSalvar: TdxBarLargeButton;
    MT: TkbmMemTable;
    MTCodigoStr: TStringField;
    MTLicencaStr: TStringField;
    MTSenha: TStringField;
    MTCadastroEm: TDateTimeField;
    MTCadastroPor: TStringField;
    MTAtualizadoEm: TDateTimeField;
    MTAtualizadoPor: TStringField;
    MTLoja: TStringField;
    MTRazaoSocial: TStringField;
    MTPais: TStringField;
    MTCidade: TStringField;
    MTUF: TStringField;
    MTEndereco: TMemoField;
    MTCEP: TStringField;
    MTBairro: TStringField;
    MTSerieHD: TStringField;
    MTNumMaq: TWordField;
    MTCNPJ: TStringField;
    MTIE: TStringField;
    MTObs: TMemoField;
    MTTelefones: TMemoField;
    MTEmailReg: TMemoField;
    MTFormaPagto: TMemoField;
    MTLicMaq: TWordField;
    MTLicTipo: TWordField;
    MTLicVenc: TDateField;
    MTManInicio: TDateField;
    MTManVenc: TDateField;
    MTProprietarios: TMemoField;
    MTGerente: TStringField;
    MTTipoLoja: TWordField;
    MTEmailTec: TMemoField;
    MTValor: TCurrencyField;
    MTValorRec: TCurrencyField;
    MTEmitirNF: TBooleanField;
    MTMessenger: TMemoField;
    MTICQ: TMemoField;
    MTUVersao: TStringField;
    MTUObtemLic: TDateTimeField;
    MTCodigo: TIntegerField;
    dsMT: TDataSource;
    MTStatus: TIntegerField;
    MTContatarEm: TDateTimeField;
    VGDescrStatus: TcxDBEditorRow;
    MTDescrStatus: TStringField;
    VGDBEditorRow6: TcxDBEditorRow;
    cmBoleto: TdxBarLargeButton;
    FB: TFreeBoleto;
    FBI: TFreeBoletoImagem;
    tvGridFinColumn1: TcxGridDBColumn;
    LMDSimplePanel1: TLMDSimplePanel;
    btnApagar: TPngSpeedButton;
    btnEditar: TPngSpeedButton;
    btnAdd: TPngSpeedButton;
    lbUContato: TcxLabel;
    lbDataCad: TcxLabel;
    procedure cmSalvarFecharClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmSalvarClick(Sender: TObject);
    procedure edLicDblClick(Sender: TObject);
    procedure edCodLojaDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MTCalcFields(DataSet: TDataSet);
    procedure cmBoletoClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
  private
    FNovo : Boolean;
    { Private declarations }
  public
    procedure Novo;
    procedure Editar(Aba: Integer);
    procedure SalvaBoleto;
    { Public declarations }
  end;

var
  FrmCli: TFrmCli;

implementation

uses uRAPri, uRADM, ufmImagens, uLicenca, uRAFrmTitulo;

{$R *.dfm}

procedure TFrmCli.Editar(Aba: Integer);
begin
  if DM.qCliUObtemLic.IsNull then begin
    lbUContato.Caption := '  SEM CONTATO  ';
    lbUContato.Style.Color := clRed;
  end else
    lbUContato.Caption := '  U.Contato '+FormatDateTime('dd/mm/yyyy hh:mm', DM.qCliUObtemLic.Value)+'  ';
  lbDataCad.Caption  := '  Cadastro Em '+FormatDateTime('dd/mm/yyyy hh:mm', DM.qCliCadastroEm.Value)+'  ';
  Caption := 'Editando Cliente';
  MT.Insert;
  TransfFields(DM.qCli.Fields, MT.Fields);
  MT.Post;
  MT.Edit;
  PagEdicao.ActivePageIndex := Aba;
  ShowModal;
end;

procedure TFrmCli.Novo;
begin
  lbUContato.Visible := False;
  lbDataCad.Visible := False;
  FNovo := True;
  Caption := 'Novo Cliente';
  MT.Insert;
  MTCodigo.Value := DM.mwCli.Request('Admin', '100', 'GetNextAutoInc', ['Cliente', 'Codigo', '']);
  MTPais.Value := 'Brasil';
  MTLicTipo.Value := tlTeste;
  MT.Post;
  MT.Edit;
  PagEdicao.ActivePageIndex := 0;
  ShowModal;
end;

procedure TFrmCli.SalvaBoleto;
begin
  with DM do begin
    qFinCli.Edit;
    if qFinCliID.Value=0 then
      qFinCliID.Value := mwCli.Request('Admin', '100', 'GetNextAutoInc', ['Receber', 'ID', '']);
    FB.Vencimento := qFinCliVencimento.Value;
    FB.DataDocumento := qFinCliLancamento.Value;
    FB.Valor := qFinCliValor.Value;
    FB.NossoNumero := qFinCliID.AsString;
    FB.Documento := qFinCliID.AsString;
    FB.Preparar;
    qFinCliDoc.Value := FB.DadosGerados.LinhaDigitavel;
    qFinCli.Post;
    qFinCli.Resolve;
    qFinCli.Commit;
  end;
end;

procedure TFrmCli.cmSalvarFecharClick(Sender: TObject);
begin
  cmSalvarClick(nil);
  Close;
end;

function ApenasDig(S: String): String;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
  if (S[I] in  ['0'..'9']) then
    Result := Result + S[I];
end;

procedure TFrmCli.cmBoletoClick(Sender: TObject);
begin
  with DM do begin
    FB.Vencimento := qFinCliVencimento.Value;
    FB.DataDocumento := qFinCliLancamento.Value;
    FB.Valor := qFinCliValor.Value;
    FB.NossoNumero := qFinCliID.AsString;
    FB.Documento := qFinCliID.AsString;
    FB.Sacado.Nome := MTRazaoSocial.Value;
    if Length(ApenasDig(MTCNPJ.Value))>11 then
      FB.Sacado.Pessoa := pJuridica else
      FB.Sacado.Pessoa := pFisica;
    FB.Sacado.Endereco := MTEndereco.Value;
    FB.Sacado.Estado := MTUF.Value;
    FB.Sacado.Cidade := MTCidade.Value;
    FB.Sacado.Cep  := MTCEP.Value;
    FB.Sacado.Bairro := MTBairro.Value;  
    FB.Preparar;
    FBI.ListaBoletos.Add(FB);
    FBI.ShowPreview;
  end;
end;

procedure TFrmCli.btnAddClick(Sender: TObject);
begin
  if TFrmTitulo.Create(nil).Novo(MTCodigo.Value, DM.qFinCli) then
    SalvaBoleto;
end;

procedure TFrmCli.btnApagarClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente apagar essa parcela ?', mtConfirmation, [mbNo, mbYes], 0)=mrYes then
    DM.qFinCli.Delete;
end;

procedure TFrmCli.btnEditarClick(Sender: TObject);
begin
  if TFrmTitulo.Create(nil).Editar(MTCodigo.Value, DM.qFinCli) then 
    SalvaBoleto;
end;

procedure TFrmCli.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCli.cmSalvarClick(Sender: TObject);
begin
  VG.DataController.PostEditingData;
  vgLic.DataController.PostEditingData;
  vgEmail.DataController.PostEditingData;
  tvGridFin.DataController.PostEditingData;
  DM.qCli.DisableControls;
  MT.DisableControls;
  try
    with DM do 
    try
      if MT.State in [dsEdit, dsInsert] then
        MT.Post;
      if qFinCli.State in [dsEdit, dsInsert] then
        qFinCli.Post;
      if FNovo then 
        qCli.Insert
      else
        qCli.Edit;
      TransfFields(MT.Fields, qCli.Fields);


      if qFinCli.TransactionLevel > 0 then begin 
        qFinCli.First;
        while not qFinCli.Eof do begin
          if (qFinCliID.Value < 1) or qFinCliID.IsNull then begin
            qFinCli.Edit;
            qFinCliID.Value := mwCli.Request('Admin', '100', 'GetNextAutoInc', ['Receber', 'ID', '']);
            qFinCli.Post;
          end;  
          qFinCli.Next;
        end;
        qCli.Post;
        Resolver.Resolve([qCli, qFinCli]);
        qCli.Commit;
        qFinCli.Commit;
      end else begin  
        Resolver.Resolve([qCli]);
        qCli.Commit;
      end;
    except
      if qCli.TransactionLevel > 0 then
        qCli.Rollback;
      if qFinCli.TransactionLevel>0 then
        qFinCli.Rollback;
      Raise;
    end;    
  finally
    DM.qCli.EnableControls;
    MT.EnableControls;
  end;    
end;

procedure TFrmCli.edLicDblClick(Sender: TObject);
begin
  edLic.CopyToClipboard;
end;

procedure TFrmCli.edCodLojaDblClick(Sender: TObject);
begin
  edCodLoja.CopyToClipboard;
end;

procedure TFrmCli.FormCreate(Sender: TObject);
begin
  FNovo := False;
  MT.Open;
  tvGridFin.OptionsView.Navigator := DM.EAdmin;
  tvGridFin.OptionsData.Appending := DM.EAdmin;
  tvGridFin.OptionsData.Deleting  := DM.EAdmin;
  tvGridFin.OptionsData.Inserting := DM.EAdmin;
  tvGridFin.OptionsData.Editing   := DM.EAdmin;
end;

procedure TFrmCli.FormShow(Sender: TObject);
begin
  with DM do begin
    qFinCli.Close;
    qFinCli.Query.Text := 'select * from receber where loja = ' + MTCodigo.AsString;
    qFinCli.Open;
  end;  
end;

procedure TFrmCli.MTCalcFields(DataSet: TDataSet);
var L : TLicenca;
begin
  L.liSerialHD := Trim(MTSerieHD.Value);
  L.liMaquinas := MTLicMaq.Value;
  L.liTipo := MTLicTipo.Value;
  L.liCodLoja := MTCodigo.Value;
  L.liVencimento := MTLicVenc.Value;
  L.liSenha := LimpaTraco(L.SenhaCorreta);
  MTCodigoStr.Value := L.CodLojaAsString;
  MTLicencaStr.Value := Copy(L.AsString, 1, 19);
end;

end.
