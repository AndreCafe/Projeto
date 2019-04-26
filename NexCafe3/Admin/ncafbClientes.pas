unit ncafbClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxBar, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxMaskEdit, cxCurrencyEdit, cxTextEdit, cxCalendar, cxMemo, cxCheckBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, 
  nxdb, ncPassaportes, ncAuxPassaporte,
  dxBarExtItems, 
  cxGridCustomPopupMenu, cxGridPopupMenu, cxInplaceContainer,
  cxVGrid, cxDBVGrid, cxImageComboBox, cxTimeEdit, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, cxDropDownEdit,
  cxContainer, cxLabel, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  frxClass, frxDBSet, frxDesgn, kbmMemTable, frxExportMail, frxExportPDF,
  frxExportRTF, frxDCtrl, frxCross, frxChBox, frxBarcode, frxRich,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxProgressBar, cxRadioGroup, Buttons, PngSpeedButton, LMDControl, 
  cxGroupBox;

type
  TfbClientes = class(TFrmBase)
    Tab: TnxTable;
    TabNome: TStringField;
    TabEndereco: TStringField;
    TabBairro: TStringField;
    TabCidade: TStringField;
    TabUF: TStringField;
    TabCEP: TStringField;
    TabNasc: TDateTimeField;
    TabSexo: TStringField;
    TabObs: TMemoField;
    TabCpf: TStringField;
    TabRg: TStringField;
    Tabemail: TMemoField;
    TabUltVisita: TDateTimeField;
    TabIsento: TBooleanField;
    TabUsername: TStringField;
    TabSenha: TStringField;
    TabTelefone: TStringField;
    TabDebito: TCurrencyField;
    TabEscola: TStringField;
    TabNickName: TStringField;
    TabDataNasc: TDateTimeField;
    TabCelular: TStringField;
    TabTemDebito: TBooleanField;
    dsCli: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVNome: TcxGridDBColumn;
    TVDebito: TcxGridDBColumn;
    TVCredito: TcxGridDBColumn;
    TVTempoUsado: TcxGridDBColumn;
    TVRg: TcxGridDBColumn;
    TVUVisita: TcxGridDBColumn;
    TVEndereco: TcxGridDBColumn;
    TVBairro: TcxGridDBColumn;
    TVCidade: TcxGridDBColumn;
    TVUF: TcxGridDBColumn;
    TVCEP: TcxGridDBColumn;
    TVSexo: TcxGridDBColumn;
    TVObs: TcxGridDBColumn;
    TVemail: TcxGridDBColumn;
    TVIsento: TcxGridDBColumn;
    TVUsername: TcxGridDBColumn;
    TVTelefone: TcxGridDBColumn;
    TVCodigo: TcxGridDBColumn;
    TVEscola: TcxGridDBColumn;
    TVNickName: TcxGridDBColumn;
    TVDataNasc: TcxGridDBColumn;
    TVCelular: TcxGridDBColumn;
    TVTemDebito: TcxGridDBColumn;
    GL: TcxGridLevel;
    cmTempo: TdxBarSubItem;
    cmPagarDebito: TdxBarLargeButton;
    cmVenderCred: TdxBarLargeButton;
    pmTempo: TdxBarPopupMenu;
    cmDebTempo: TdxBarLargeButton;
    TabAlteradoEm: TDateTimeField;
    TabIncluidoPor: TStringField;
    TabAlteradoPor: TStringField;
    TabTipoAcessoPref: TIntegerField;
    TVIncluidoEm: TcxGridDBColumn;
    TVIncluidoPor: TcxGridDBColumn;
    TVAlteradoEm: TcxGridDBColumn;
    TVAlteradoPor: TcxGridDBColumn;
    TabIncluidoEm: TDateTimeField;
    cmZerarTempo: TdxBarLargeButton;
    cmSubTempo: TdxBarLargeButton;
    cmSenha: TdxBarLargeButton;
    pmSenha: TdxBarPopupMenu;
    cmAlterarSenha: TdxBarButton;
    cmApagarSenha: TdxBarButton;
    TabPai: TStringField;
    TabMae: TStringField;
    TabEscolaHI: TDateTimeField;
    TabEscolaHF: TDateTimeField;
    TabLimiteDebito: TCurrencyField;
    TabInativo: TBooleanField;
    TVInativo: TcxGridDBColumn;
    TVLimDebito: TcxGridDBColumn;
    TVPai: TcxGridDBColumn;
    TVMae: TcxGridDBColumn;
    TabFoto: TGraphicField;
    TVSenha: TcxGridDBColumn;
    TabID: TAutoIncField;
    TabMinutos: TFloatField;
    TabMinutosUsados: TFloatField;
    TabMinutosIniciais: TFloatField;
    TabValorCred: TCurrencyField;
    TabHP1: TIntegerField;
    TabHP2: TIntegerField;
    TabHP3: TIntegerField;
    TabHP4: TIntegerField;
    TabHP5: TIntegerField;
    TabHP6: TIntegerField;
    TabHP7: TIntegerField;
    TabNaoGuardarCredito: TBooleanField;
    TabPermiteLoginSemCred: TBooleanField;
    TVValorCred: TcxGridDBColumn;
    rpDesigner: TfrxDesigner;
    dbClientes: TfrxDBDataset;
    cmEtq: TdxBarLargeButton;
    TabIDCodBar: TStringField;
    mtEtq: TkbmMemTable;
    frxRichObject1: TfrxRichObject;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    frxCrossObject1: TfrxCrossObject;
    frxDialogControls1: TfrxDialogControls;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    frxMailExport1: TfrxMailExport;
    mtEtqNome: TStringField;
    mtEtqEndereco: TStringField;
    mtEtqBairro: TStringField;
    mtEtqCidade: TStringField;
    mtEtqUF: TStringField;
    mtEtqCEP: TStringField;
    mtEtqNasc: TDateTimeField;
    mtEtqSexo: TStringField;
    mtEtqObs: TMemoField;
    mtEtqCpf: TStringField;
    mtEtqRg: TStringField;
    mtEtqemail: TMemoField;
    mtEtqUltVisita: TDateTimeField;
    mtEtqIsento: TBooleanField;
    mtEtqUsername: TStringField;
    mtEtqSenha: TStringField;
    mtEtqTelefone: TStringField;
    mtEtqDebito: TCurrencyField;
    mtEtqEscola: TStringField;
    mtEtqNickName: TStringField;
    mtEtqDataNasc: TDateTimeField;
    mtEtqCelular: TStringField;
    mtEtqIncluidoEm: TDateTimeField;
    mtEtqPai: TStringField;
    mtEtqMae: TStringField;
    mtEtqEscolaHI: TDateTimeField;
    mtEtqEscolaHF: TDateTimeField;
    mtEtqInativo: TBooleanField;
    mtEtqFoto: TGraphicField;
    mtEtqID: TAutoIncField;
    mtEtqMinutos: TFloatField;
    mtEtqMinutosUsados: TFloatField;
    mtEtqValorCred: TCurrencyField;
    mtEtqCodigo: TStringField;
    frEtq: TfrxReport;
    TVPassaportes: TcxGridDBColumn;
    TabPassaportes: TFloatField;
    TabTitEleitor: TStringField;
    TitEleitor: TcxGridDBColumn;
    cmListaEmail: TdxBarLargeButton;
    PB: TcxProgressBar;
    TabFidPontos: TFloatField;
    TabFidTotal: TFloatField;
    TabFidResg: TFloatField;
    TVFidPontos: TcxGridDBColumn;
    TVFidTotal: TcxGridDBColumn;
    TVFidResg: TcxGridDBColumn;
    cmFidelidade: TdxBarLargeButton;
    pmFidelidade: TdxBarPopupMenu;
    cmResgTempo: TdxBarButton;
    cmResgProduto: TdxBarButton;
    cmCorrigirFid: TdxBarButton;
    Timer1: TTimer;
    Timer2: TTimer;
    cmZerarTudo: TdxBarButton;
    panMostrar: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cmMostrar: TcxComboBox;
    cxLabel1: TcxLabel;
    panBusca: TcxGroupBox;
    btnAchar: TPngSpeedButton;
    rgCod: TcxRadioButton;
    rgUsername: TcxRadioButton;
    rgNome: TcxRadioButton;
    edBusca: TcxMaskEdit;
    lbBusca: TcxLabel;
    cbObs: TcxCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVIsentoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVInativoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cmApagarSenhaClick(Sender: TObject);
    procedure cmAlterarSenhaClick(Sender: TObject);
    procedure cmSenhaClick(Sender: TObject);
    procedure cmSubTempoClick(Sender: TObject);
    procedure cmZerarTempoClick(Sender: TObject);
    procedure cmVenderCredClick(Sender: TObject);
    procedure cmDebTempoClick(Sender: TObject);
    procedure cmMostrarChange(Sender: TObject);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure cmPagarDebitoClick(Sender: TObject);
    procedure cmOrdemChange(Sender: TObject);
    procedure cmMostrarPropertiesChange(Sender: TObject);
    procedure cmOrdemPropertiesChange(Sender: TObject);
    procedure TVTempoUsadoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVCreditoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure lbDebTotalDblClick(Sender: TObject);
    procedure btnRecriaDebitosClick(Sender: TObject);
    procedure cmEtqClick(Sender: TObject);
    procedure mtEtqCalcFields(DataSet: TDataSet);
    procedure FrmBasePaiDestroy(Sender: TObject);
    procedure TVPassaportesGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems1GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems2GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems3GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems4GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure cmListaEmailClick(Sender: TObject);
    procedure cmFidelidadeClick(Sender: TObject);
    procedure cmResgProdutoClick(Sender: TObject);
    procedure cmResgTempoClick(Sender: TObject);
    procedure cmCorrigirFidClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cbObsClick(Sender: TObject);
    procedure btnAcharClick(Sender: TObject);
    procedure edBuscaPropertiesChange(Sender: TObject);
    procedure rgCodClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure edBuscaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cmZerarTudoClick(Sender: TObject);
  private
    { Private declarations }
    FPass : TncPassaportes;
    STotDeb,
    STotPass,
    STotValor,
    STotCred,
    SQuant : String;
  public
    function ToolbarIsRibbonGroup(aBar: TdxBar): Boolean; override;

    procedure CalcTotais;
  
    procedure FiltraDados; override;
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;
    procedure ParentChanged; override;
    
    
    { Public declarations }
  end;

var
  fbClientes: TfbClientes;

implementation

uses 
  ncaDM, 
  ufmImagens, 
  ncaFrmPri, 
  ncClassesBase,
  ncaFrmPass, 
  ncaFrmCliente, 
  ncIDRecursos, 
  ncaFrmZerarTempo,
  ncaFrmSenha, ncDebito, ncaFrmDebito, ncDMServ, ncCredTempo, ncaFrmTempo,
  ncSessao, ncDebTempo, ncaFrmDebTempo, ncaFrmImpEtqCli, ncaFrmEmails,
  ncVersoes, ncaFrmAjustaFid;

{$R *.dfm}

procedure TfbClientes.FiltraDados;
var 
  FiltroBas : String;
begin
  if not Tab.Active then Tab.Active := True;

  FiltroBas := '';

  CalcTotais;

  panBusca.Enabled := (cmMostrar.ItemIndex<>1);
  edBusca.Enabled := panBusca.Enabled;
  rgNome.Enabled := panBusca.Enabled;
  rgUsername.Enabled := panBusca.Enabled;
  rgCod.Enabled := panBusca.Enabled;

  if cmMostrar.ItemIndex=1 then begin
    Tab.IndexName := 'IDebito';
    Tab.SetRange([True], [True]);
  end else begin 
    if cmMostrar.ItemIndex=2 then 
      FiltroBas := '(Minutos > 0'+DecimalSeparator+'016) or ' +
                   '(Passaportes > 0'+DecimalSeparator+'016)';
    if rgNome.Checked then begin
        Tab.IndexName := 'INome';
        TVNome.Index := 0;
        TVUsername.Index := 1;
        TVCodigo.Index := 2;
        TV.OptionsBehavior.IncSearchItem := TVNome;
    end else
    if rgUsername.Checked then begin
      Tab.IndexName := 'IUsername';
      TVUsername.Index := 0;
      TVNome.Index := 1;
      TVCodigo.Index := 2;
      TV.OptionsBehavior.IncSearchItem := TVUsername;
    end else begin
      Tab.IndexName := 'IID';
      TVCodigo.Index := 0;
      TVNome.Index := 1;
      TVUsername.Index := 2;
      TV.OptionsBehavior.IncSearchItem := TVCodigo;
    end;  
  end;

  
  with TV.DataController.Filter do
  if FilterText > '' then begin
    if FiltroBas > '' then
      FiltroBas := '(' + FilterText + ') AND '+ FiltroBas
    else
      FiltroBas := FilterText;
  end;
  Tab.Filter := FiltroBas;
  Tab.Filtered := (FiltroBas>'');

  Tab.Refresh;
  if Tab.RecordCount = 1  then
    SQuant := IntToStr(Tab.RecordCount) + ' Cliente'
  else  
    SQuant := IntToStr(Tab.RecordCount) + ' Cliente(s)';
    
  TV.DataController.Summary.Recalculate;
  
  if panBusca.Enabled then
  if Trim(edBusca.Text)>'' then
    if rgCod.Checked then
      Tab.SetRange([StrToIntDef(Trim(edBusca.Text), 0)], [StrToIntDef(Trim(edBusca.Text), 0)]) else
      Tab.SetRange([edBusca.Text], [edBusca.Text+'zzzzzzzzzzzzzzzzzzzzzzzzzzz']);
end;

procedure TfbClientes.cmVenderCredClick(Sender: TObject);
var 
  DT: TDadosTempo;  
  CT: TncCredTempo;
  S: TncSessao;
begin
  inherited;
  DT.Limpa;
  with Dados do
  S := CM.Sessoes.PorCliente[TabID.Value];
  if S<>nil then begin
    DT.dtMaq := S.Maq;
    DT.dtDadosCli.dcCodigo := S.Cliente;
    if S.Cliente>0 then
      DT.dtDadosCli.dcNome := S.NomeCliente;
  end else begin
    DT.dtDadosCli.dcCodigo := TabID.Value;
    DT.dtDadosCli.dcNome   := TabNome.Value;
  end;
  if Sender=cmResgTempo then
    DT.dtFidResgate := True;
    
  if TFrmTempo.Create(Self).Editar(True, True, @DT, 0, True) then  
    try
      CT := TncCredTempo.Create;
      DT.SaveToCredTempo(CT);
      if S<>nil then CT.teSessao := S.ID;
      CT._Operacao := osIncluir;
      Dados.CM.SalvaCredTempo(CT);
      CalcTotais;
      Tab.Refresh;
    finally
      CT.Free;
    end;
end;

procedure TfbClientes.cmZerarTempoClick(Sender: TObject);
begin
  inherited;
  case TFrmZeraTempo.Create(Self).Zerar(TabNome.Value) of
    0 : begin
      Tab.Edit;
      TabMinutosUsados.Value := 0;
      Tab.Post;
    end;
    1 : begin
      Tab.First;
      while not Tab.Eof do begin
        Tab.Edit;
        TabMinutosUsados.Value := 0;
        Tab.Post;
        Tab.Next;
        Application.ProcessMessages;
      end;
      ShowMessage('Tempo acumulado de todos clientes foi zerado com sucesso!');
    end;
  end;
end;

procedure TfbClientes.cmZerarTudoClick(Sender: TObject);
begin
  inherited;
  if SimNao('Deseja zerar os pontos fidelidade de TODOS os clientes?') and
     SimNao('Essa operação vai zerar os pontos fidelidade de TODOS os clientes da loja. Deseja continuar ?') 
  then
    Dados.CM.AjustaPontosFid(0, 0, 0, 'Zerou pontos de todos clientes');
end;

procedure TfbClientes.btnAcharClick(Sender: TObject);
begin
  inherited;
  if (not btnAchar.Down) and (Trim(edBusca.Text)>'') then begin
    edBusca.Text := '';
    Tab.CancelRange;
  end;
end;

procedure TfbClientes.btnRecriaDebitosClick(Sender: TObject);
begin
  inherited;
  DM.RecriaDebitos;
end;

procedure TfbClientes.CalcTotais;
begin
  STotDeb := FloatToStrF(Dados.TotalDebitos, ffCurrency, 10, 2);
  STotCred := MinutosToHMSAbrev(Dados.TotalCreditos);
  STotValor := FloatToStrF(Dados.TotalCredValor, ffCurrency, 10, 2);
  STotPass := MinutosToHMSAbrev(Dados.TotalPassCli);
end;

procedure TfbClientes.cmDebTempoClick(Sender: TObject);
var 
  T: TncDebTempo;
  Tempo: Double;
  Obs: String;
  CredValor : Boolean;
begin
  T := TncDebTempo.Create;
  try
    T.Func := Dados.CM.Username;
    T.Cliente := TabID.Value;
    Tempo := 0;
    Obs := '';
    CredValor := False;
    if TFrmDebTempo.Create(nil).Editar(True, True, TabNome.Value, Tempo, Obs, CredValor, TabMinutos.Value, TabValorCred.Value) then begin
      T.Obs := Obs;
      T.QtdTempo := Tempo;
      T.CredValor := CredValor;
      Dados.CM.SalvaDebTempo(T);
    end;
    CalcTotais;
    Tab.Refresh;  
  finally
    T.Free;
  end;
  Tab.Refresh;  
end;

class function TfbClientes.Descricao: String;
begin
  Result := 'Clientes';
end;

procedure TfbClientes.edBuscaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP : Tab.Prior;
    VK_Down : Tab.Next;
    VK_Return : cmEditarClick(nil);
    VK_Escape : btnAcharClick(nil);
  end;
end;

procedure TfbClientes.edBuscaPropertiesChange(Sender: TObject);
begin
  inherited;
  if Trim(edBusca.Text)>'' then begin
    if rgCod.Checked then
      Tab.SetRange([StrToIntDef(Trim(edBusca.Text), 0)], [StrToIntDef(Trim(edBusca.Text), 0)]) else
      Tab.SetRange([edBusca.Text], [edBusca.Text+'zzzzzzzzzzzzzzzzzzzzzzzzzzz']);
    btnAchar.Down := True;
    btnAchar.Enabled := True;
  end else begin
    Tab.CancelRange;
    btnAchar.Down := False;
    btnAchar.Enabled := False;
  end;
end;

procedure TfbClientes.cmMostrarChange(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbClientes.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  STotDeb := '';
  STotValor := '';
  STotCred := '';
  SQuant := '';
  case Dados.tbConfigCampoLocalizaCli.Value of
    0 : rgNome.Checked := True;
    1 : rgUsername.Checked := True;
  else
    rgCod.Checked := True;  
  end;
  cmMostrar.ItemIndex := 0;
  FPass := TncPassaportes.Create;
end;

procedure TfbClientes.FrmBasePaiDestroy(Sender: TObject);
begin
  inherited;
  FPass.Free;
end;

procedure TfbClientes.lbDebTotalDblClick(Sender: TObject);
begin
  inherited;
  DM.ReprocessaDebitos;
  ShowMessage('Débitos Reprocessados!');
end;

procedure TfbClientes.mtEtqCalcFields(DataSet: TDataSet);
var S: String;
begin
  inherited;
  S := IntToStr(mtEtqID.Value);
  while Length(S)<6 do S := '0'+S;
  mtEtqCodigo.Value := S;
end;

procedure TfbClientes.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  Tab.Refresh;
end;

procedure TfbClientes.Timer2Timer(Sender: TObject);
begin
  inherited;
  Timer2.Enabled := False;
  try
    if (FrmPri.FM.FormAtivo=Self) and panBusca.Enabled then 
      edBusca.SetFocus;
  except
  end;
end;

function TfbClientes.ToolbarIsRibbonGroup(aBar: TdxBar): Boolean;
begin
  Result := (aBar = BarMgr.BarByComponentName('BarMgrBar1'));
end;

procedure TfbClientes.TVCreditoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  inherited;
  V := ARecord.Values[TVCredito.Index];
  if V<>null then
    AText := MinutosToHMSAbrev(V);
end;

procedure TfbClientes.TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  with aviewinfo do
  if (Value<>Null) and (Value>0.009) then begin
    ACanvas.Canvas.Brush.Color := clRed;
    ACanvas.Canvas.Font.Color := clWhite;
  end;
end;

procedure TfbClientes.TVInativoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  with aviewinfo do 
  if (Value<>Null) and (Value=True) then begin
    ACanvas.Canvas.Brush.Color := clGray;
    ACanvas.Canvas.Font.Color := clWhite;
  end;
end;

procedure TfbClientes.TVIsentoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  with aviewinfo do 
  if (Value<>Null) and (Value=True) then begin
    ACanvas.Canvas.Brush.Color := clGreen;
    ACanvas.Canvas.Font.Color := clWhite;
  end;
end;

procedure TfbClientes.TVPassaportesGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
var V: Variant;
begin
  inherited;
  V := ARecord.Values[TVPassaportes.Index];
  if V<>null then
    AText := MinutosToHMSAbrev(V);
end;

procedure TfbClientes.TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;
  AText := STotDeb;
end;

procedure TfbClientes.TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems1GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;
  AText := STotCred;
end;

procedure TfbClientes.TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems2GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;
  AText := SQuant;
end;

procedure TfbClientes.TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems3GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;
  AText := STotValor;
end;

procedure TfbClientes.TVTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems4GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;
  AText := STotPass;
end;

procedure TfbClientes.TVTempoUsadoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;
begin
  inherited;
  V := ARecord.Values[TVTempoUsado.Index];
  if V<>null then
    AText := MinutosToHMSAbrev(V);
end;

procedure TfbClientes.cmNovoClick(Sender: TObject);
begin
  edBusca.Text := '';
  Tab.CancelRange;
  btnAchar.Enabled := False;
  btnAchar.Down := False;

  TFrmCliente.Create(Self).Novo(Tab, nil);
  Dados.tbCli.Refresh;
  Dados.tbCli.Locate('ID', TabID.Value, []);
end;

procedure TfbClientes.cmEditarClick(Sender: TObject);
begin
  inherited;
  TFrmCliente.Create(Self).Editar(Tab, nil);
  Dados.tbCli.Refresh;
  Dados.tbCli.Locate('ID', TabID.Value, []);
end;

procedure TfbClientes.cmEtqClick(Sender: TObject);
var 
  AInicio : Integer;
  ATodos : Boolean;
  ARes : Integer;  
  S: String;
begin
  inherited;
  mtEtq.Active := False;
  AInicio := 1;
  ATodos := False;
  S := ExtractFilePath(ParamStr(0))+'EtiquetaCliente.fr3';
  
  repeat
    ARes := TFrmImpEtqCli.Create(Self).Editar(TabNome.Value, AInicio, ATodos);
    frEtq.FileName := S;
    rpDesigner.OpenDir := ExtractFilePath(ParamStr(0));
    rpDesigner.SaveDir := rpDesigner.OpenDir;
    if ARes=2 then begin
      if not FileExists(S) then 
        frEtq.SaveToFile(S);
      frEtq.DesignReport;
    end;
  until (ARes in [0..1]);

  if (Tab.RecordCount>0) and (ARes=1) then begin
    try
      mtEtq.Open;
      while AInicio>1 do begin
        mtEtq.Append;
        mtEtq.Post;
        Dec(AInicio);
      end;
      if ATodos then begin
        Tab.First;
        while not Tab.Eof do begin
          mtEtq.Append;
          TransfDados(Tab, mtEtq);
          mtEtq.Post;
          Tab.Next;
        end;
        mtEtq.First;
      end else begin
        mtEtq.Append;
        TransfDados(Tab, mtEtq);
        mtEtq.Post;
      end;
      if FileExists(S) then
        frEtq.LoadFromFile(S);
      frEtq.ShowReport;  
    finally
      mtEtq.Active := False;
    end;

  end;

end;

procedure TfbClientes.cmFidelidadeClick(Sender: TObject);
var P: TPoint;
begin
  inherited;
  P := ItemLinkScreenPoint(cmFidelidade.ClickItemLink);
  pmFidelidade.Popup(P.X, P.Y);
end;

procedure TfbClientes.cmListaEmailClick(Sender: TObject);
var 
  SL: TStrings;
  Emails : String;
  I : Integer;

procedure AddEmail(S: String);
begin
  S := Trim(S);
  if S>'' then

  while (S>'') and (S[Length(S)] in [';', ',']) do Delete(S, Length(S), 1);
  if Emails>'' then Emails := Emails + '; ';
  Emails := Emails + S;
end;  

begin
  inherited;
  if not SimNao('Deseja gerar uma lista de e-mails dos clientes? Você poderá copiar e colar os endereços para enviar e-mail para todos seus clientes usando sua conta de e-mail.') then Exit;
  
  SL := TStringList.Create;
  Emails := '';
  PB.Properties.Max := Tab.RecordCount;
  PB.Position := 0;
  PB.Visible := True;
  Tab.DisableControls;
  try
    Tab.First;
    while not Tab.Eof do begin
      Pb.Position := PB.Position + 1;
      Application.ProcessMessages;
      SL.Text := Trim(TabEmail.Value);
      for I := 0 to SL.Count - 1 do AddEmail(SL[i]);
      Tab.Next;
    end;
  finally
    Tab.EnableControls;
    PB.Visible := False;
    SL.Free;
  end;
  TFrmEmails.Create(nil).Mostrar(Emails);
end;

procedure TfbClientes.cbObsClick(Sender: TObject);
begin
  inherited;
  TV.Preview.Visible := cbObs.Checked;
end;

procedure TfbClientes.cmAlterarSenhaClick(Sender: TObject);
var S: String;
begin
  S := TFrmAlteraSenha.Create(Self).Editar(TabSenha.Value, TabNome.Value);
  if S <> TabSenha.Value then begin
    Tab.Edit;
    TabSenha.Value := S;
    Tab.Post;
  end;
end;

procedure TfbClientes.cmApagarClick(Sender: TObject);
begin
  inherited;
  if Dados.CM.Sessoes.PorCliente[TabID.Value] <> nil then 
  begin
    Beep;
    ShowMessage('Não é possível apagar um cliente que está com acesso em andamento!');
    Exit;
  end;

  if TabDebito.Value > 0.009 then begin
    Beep;
    ShowMessage('Esse cliente possui itens em débito. É necessário fazer o pagamento primeiramente, para depois excluir');
    Exit;
  end;
  
  if SimNao('Confirma a exclusão de '+TabNome.Value+' ?') then Tab.Delete;
end;

procedure TfbClientes.cmApagarSenhaClick(Sender: TObject);
begin
  if SimNao('Essa opção deve ser utilizada quando o cliente esquece a senha. '+
            'Dessa forma ele poderá criar uma nova senha. Deseja realmente apagar a senha atual?') then 
  begin
    Tab.Edit;
    TabSenha.Clear;
    Tab.Post;
  end;
end;

procedure TfbClientes.cmCorrigirFidClick(Sender: TObject);
var 
  Pontos: Double;
  Obs: String;
  Fator: Smallint;
begin
  inherited;
  if Tab.IsEmpty then Exit;

  Pontos := 0;
  Obs := '';
  Fator := 1;

  if TFrmAjustaFid.Create(Self).Editar(True, True, TabNome.Value, Pontos, Obs, Fator, TabFidPontos.Value) then
  begin
    Dados.CM.AjustaPontosFid(TabID.Value, Fator, Pontos, Obs);
    Tab.Refresh;
    Timer1.Enabled := True;
  end;
end;

procedure TfbClientes.cmPagarDebitoClick(Sender: TObject);
var Deb: TncDebito;
begin
  Deb := TncDebito.Create;
  try
    Deb.Cliente := TabID.Value;
    Deb.Operacao := osIncluir;
    DM.LoadIDeb(Deb);
    if TFrmDebito.Create(nil).Editar(True, Deb, TabNome.Value) then
    begin
      Dados.CM.SalvaDebito(Deb);
      Tab.Refresh;
    end;
  finally
    Deb.Free;
  end;
end;

procedure TfbClientes.cmResgProdutoClick(Sender: TObject);
begin
  inherited;
  Dados.NovoMovEst(trEstVenda, TabID.Value, True);
  Tab.Refresh;
end;

procedure TfbClientes.cmResgTempoClick(Sender: TObject);
begin
  inherited;
  cmVenderCredClick(cmResgTempo);
  Tab.Refresh;
end;

procedure TfbClientes.cmSenhaClick(Sender: TObject);
var P : TPoint;
begin
  P := ItemLinkScreenPoint(cmSenha.ClickItemLink);
  pmSenha.Popup(P.X, P.Y);
end;

procedure TfbClientes.cmSubTempoClick(Sender: TObject);
var P : TPoint;
begin
  P := ItemLinkScreenPoint(cmSubTempo.ClickItemLink);
  pmTempo.Popup(P.X, P.Y);
end;

procedure TfbClientes.AtualizaDireitos;
begin
  inherited;
  cmCorrigirFid.Enabled := Permitido(daCorrigirFidelidade);
  cmFidelidade.Enabled := gConfig.FidAtivo and Versoes.PodeUsar(idre_fidelidade);
//  btnRecriaDebitos.Visible := SameText(ParamStr(1), 'imp');
  cmNovo.Enabled := Permitido(daCliCadastrar);
  cmApagar.Enabled := Permitido(daCliApagar);
  cmDebTempo.Enabled := Permitido(daCliDebitarTempo);
  cmZerarTempo.Enabled := Permitido(daZerarTempoAcumulado);
  cmApagarSenha.Enabled := Permitido(daApagarSenhaCliente);
  cmZerarTudo.Enabled := Dados.CM.UA.Admin;
  TVSenha.Visible := Dados.CM.Config.VerSenhaCli;
  if Tab.Active then Tab.Refresh;

  if not Permitido(daAtenderClientes) then begin
    cmSubTempo.Enabled := False;
    cmPagarDebito.Enabled := False;
    cmFidelidade.Enabled := False;
  end;
end;

procedure TfbClientes.cmOrdemChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TfbClientes.cmMostrarPropertiesChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TfbClientes.cmOrdemPropertiesChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TfbClientes.ParentChanged;
begin
  inherited;
  panMostrar.Top := 100;
end;

procedure TfbClientes.rgCodClick(Sender: TObject);
begin
  inherited;
  try
    if (FrmPri.FM.FormAtivo=Self) and panBusca.Enabled then 
      edBusca.SetFocus;
  except
  end;
  FiltraDados;
end;

end.
