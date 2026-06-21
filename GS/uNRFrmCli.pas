unit uNRFrmCli;

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
  LMDCustomBevelPanel, LMDSimplePanel, cxButtonEdit, nxdb, LMDControl,
  cxPCdxBarPopupMenu, cxLookAndFeels, cxLookAndFeelPainters;

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
    VGCategoryRow2: TcxCategoryRow;
    VGDBMultiEditorRow1: TcxDBMultiEditorRow;
    VGCategoryRow3: TcxCategoryRow;
    VGDBEditorRow2: TcxDBEditorRow;
    VGDBEditorRow5: TcxDBEditorRow;
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
    MTCEP: TStringField;
    MTBairro: TStringField;
    MTSerieHD: TStringField;
    MTNumMaq: TWordField;
    MTCNPJ: TStringField;
    MTIE: TStringField;
    MTObs: TMemoField;
    MTEmailReg: TMemoField;
    MTFormaPagto: TMemoField;
    MTLicMaq: TWordField;
    MTLicTipo: TWordField;
    MTLicVenc: TDateField;
    MTManInicio: TDateField;
    MTManVenc: TDateField;
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
    MTContatarEm: TDateTimeField;
    cmBoleto: TdxBarLargeButton;
    VGCategoryRow4: TcxCategoryRow;
    VGDBMultiEditorRow2: TcxDBMultiEditorRow;
    VGDBMultiEditorRow3: TcxDBMultiEditorRow;
    VGDBMultiEditorRow4: TcxDBMultiEditorRow;
    VGLic: TcxDBVerticalGrid;
    VGLicCategoryRow2: TcxCategoryRow;
    VGLicManVenc: TcxDBEditorRow;
    vgLicCodigo: TcxDBEditorRow;
    vgLicSenha: TcxDBEditorRow;
    vgLicNome: TcxDBEditorRow;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    lbDataCad: TcxLabel;
    lbUContato: TcxLabel;
    dxBarDockControl1: TdxBarDockControl;
    VGDBMultiEditorRow6: TcxDBMultiEditorRow;
    MTPrograma: TWordField;
    MTBloqueado: TBooleanField;
    MTCliente: TBooleanField;
    VGLicDBEditorRow1: TcxDBEditorRow;
    VGLicDBMultiEditorRow1: TcxDBMultiEditorRow;
    MTEmailConta: TStringField;
    VGLicDBEditorRow2: TcxDBEditorRow;
    VGAtivado: TcxDBEditorRow;
    MTAtivado: TBooleanField;
    VGLicDBEditorRow3: TcxDBEditorRow;
    MTCodAtivacao: TStringField;
    VGLicDBEditorRow4: TcxDBEditorRow;
    MTCodDesc: TStringField;
    MTProprietario: TStringField;
    VGDBEditorRow1: TcxDBEditorRow;
    MTTel1: TStringField;
    MTTel2: TStringField;
    MTTel3: TStringField;
    MTTel4: TStringField;
    MTEndereco: TStringField;
    VGDBMultiEditorRow5: TcxDBMultiEditorRow;
    procedure cmSalvarFecharClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MTCalcFields(DataSet: TDataSet);
  private
    FNovo : Boolean;
    FTab : TDataset;
    FRes : Boolean;
    { Private declarations }
  public
    procedure Novo;
    function Editar(aDataset: TDataset; Aba: Integer): Boolean;
    { Public declarations }
  end;

var
  FrmCli: TFrmCli;

implementation

uses uNexRegPri, uNexRegDM, ufmImagens, uLicenca;

{$R *.dfm}

function TFrmCli.Editar(aDataset: TDataset; Aba: Integer): Boolean;
begin
  dm.tCli.IndexName := 'ICodigo';
  if not DM.tCli.FindKey([aDataset.FieldByname('Codigo').AsInteger]) then
    Raise Exception.Create('Cliente não encontrado!');
    
  Caption := 'Editando Cliente';
  FRes := False;
  FTab := aDataset;
  
  with DM do begin
    if tCliUObtemLic.IsNull then begin
      lbUContato.Caption := '  SEM CONTATO  ';
      lbUContato.Style.Color := clRed;
    end else
      lbUContato.Caption := '  U.Contato '+FormatDateTime('dd/mm/yyyy hh:mm', tCli.FieldByName('UObtemLic').AsDateTime)+'  ';
    lbDataCad.Caption  := '  Cadastro Em '+FormatDateTime('dd/mm/yyyy hh:mm', tCli.FieldByName('CadastroEm').AsDateTime)+'  ';
  end;
  
  MT.Insert;
  TransfFields(DM.tCli.Fields, MT.Fields);
  MT.Post;
  MT.Edit;
  PagEdicao.ActivePageIndex := Aba;
  ShowModal;
  Result := FRes;
end;

procedure TFrmCli.Novo;
begin
  FTab := DM.qCli;
  lbUContato.Visible := False;
  lbDataCad.Visible := False;
  FNovo := True;
  Caption := 'Novo Cliente';
  MT.Insert;
  MTPais.Value := 'Brasil';
  MTLicTipo.Value := tlTeste;
  MTCliente.Value := False;
  MTBloqueado.Value := False;
  MT.Post;
  MT.Edit;
  PagEdicao.ActivePageIndex := 0;
  ShowModal;
end;

procedure TFrmCli.cmSalvarFecharClick(Sender: TObject);
begin
  FRes := True;
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
  FTab.DisableControls;
  with DM do
  try
    if MT.State in [dsEdit, dsInsert] then
      MT.Post;

    if FNovo then 
      tCli.Insert 
    else begin
      if not tCli.Locate('Codigo', MTCodigo.Value, []) then
        raise exception.Create('Loja não encontrada');
      tCli.Edit;
    end;

    TransfFields(MT.Fields, tCli.Fields);
    if FNovo then begin
      tCliCodigo.Clear;
      tCliCadastroEm.Value := Now;
      tCliCadastroPor.Value := UsuarioLogin;
    end;
      
    tCliNumMaq.Value := tCliLicMaq.Value;
    
    tCli.Post;
    FTab.Active := False;
    FTab.Active := True;
    FTab.Locate('Codigo', tCliCodigo.Value, []);
  finally
    FTab.EnableControls;
  end;
end;

procedure TFrmCli.FormCreate(Sender: TObject);
begin
  FNovo := False;
  MT.Open;
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
