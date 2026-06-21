unit ucmaFrmAcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, kbmMemTable, nxdb,  LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomSimpleLabel, LMDSimpleLabel, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, LMDDBSimpleLabel, StdCtrls, DBCtrls,
  LMDCustomParentPanel, LMDCustomGroupBox, LMDGroupBox, dxBarExtItems,
  Mask, ComCtrls,
  Variants,
  LMDCustomLabel, LMDLabel, LMDButtonControl, LMDCustomCheckBox,
  cmClassesBase,
  LMDCheckBox, LMDDBLabel, OvcBase, OvcEF, OvcPB, OvcNF,
  OvcDbNF, OvcSF, OvcDbSF, OvcPF, Buttons, ImgList, 
  cxStyles, cxGraphics, cxEdit, cxDBLookupComboBox, cxTextEdit,
  cxCurrencyEdit, cxMemo, cxVGrid, cxDBVGrid, cxControls,
  cxInplaceContainer, cxTimeEdit, cxCheckBox, cxImageComboBox,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxCalendar,
  cxMaskEdit, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses,
  cxGridCustomView, cxGridLevel, cxGrid, cxGridDBTableView, 
  cxDBExtLookupComboBox, cxPC, dxBar, 
  cxContainer, LMDBaseEdit, LMDCustomEdit, LMDCustomMaskEdit, LMDCalculatorEdit,
  cxImage, cxDBEdit, cxRadioGroup, cxDropDownEdit, ucmafbPesqCli, PngSpeedButton,
  cxLabel;

type

  TFrmAcesso = class(TForm)
    BarMgr: TdxBarManager;
    dsTab: TDataSource;
    Tab: TkbmMemTable;
    TabNumero: TAutoIncField;
    TabInicio: TDateTimeField;
    TabFim: TDateTimeField;
    TabContato: TIntegerField;
    TabNome: TStringField;
    TabMaquina: TWordField;
    TabFuncI: TStringField;
    TabFuncF: TStringField;
    TabTempo: TDateTimeField;
    TabValor: TCurrencyField;
    TabObs: TMemoField;
    TabCredUsado: TIntegerField;
    TabCredAnterior: TIntegerField;
    TabIsento: TBooleanField;
    TabData: TDateTimeField;
    TabCredUsadoT: TDateTimeField;
    TabCredAntT: TDateTimeField;
    TabDataPagto: TDateTimeField;
    TabDesconto: TCurrencyField;
    TabValorFinal: TCurrencyField;
    TabNomeContato: TStringField;
    TabCreditoCli: TIntegerField;
    TabTempoTicks: TIntegerField;
    cmFuncFim: TdxBarStatic;
    TabSubTotal: TCurrencyField;
    cmData: TdxBarStatic;
    cmPagamento: TdxBarStatic;
    TabTempoCobrado: TDateTimeField;
    TabNaoUsarPacote: TBooleanField;
    TabProdutos: TFloatField;
    dsItens: TDataSource;
    mtItens: TkbmMemTable;
    mtItensItem: TWordField;
    mtItensQuant: TFloatField;
    mtItensUnitario: TCurrencyField;
    mtItensunidade: TStringField;
    mtItensNomePro: TStringField;
    tMovEst: TnxTable;
    dstbItens: TDataSource;
    cmFuncInicio: TdxBarStatic;
    mtItensTotal: TFloatField;
    mtItensProduto: TStringField;
    TabTipoAcesso: TWordField;
    TabSinal: TCurrencyField;
    mtSinal: TkbmMemTable;
    dsSinal: TDataSource;
    mtSinalCaixa: TIntegerField;
    mtSinalValor: TCurrencyField;
    OvcController1: TOvcController;
    mtSinalFuncI: TStringField;
    TabValorAcesso: TCurrencyField;
    mtSinalNumero: TIntegerField;
    mtSinalInicio: TDateTimeField;
    mtSinalNomeFunc: TStringField;
    tTran: TnxTable;
    tSinal: TnxTable;
    bdcAcesso: TdxBarDockControl;
    mtSinalValorCalc: TCurrencyField;
    cmNumM: TdxBarControlContainerItem;
    cmMaquina: TdxBarStatic;
    cmGravar: TdxBarLargeButton;
    cmNovoSinal: TdxBarButton;
    cmTituloSinal: TdxBarStatic;
    TabNomeTipoAcesso: TStringField;
    panDiv1: TLMDSimplePanel;
    LMDLabel1: TLMDLabel;
    cmCancelar: TdxBarLargeButton;
    TabIsentoCli: TBooleanField;
    cmManutencao: TdxBarLargeButton;
    PagPri: TcxPageControl;
    tsPagNormal: TcxTabSheet;
    tsPagManut: TcxTabSheet;
    panDiv2: TLMDSimplePanel;
    lbNumM: TLMDLabel;
    Paginas: TcxPageControl;
    tsSinal: TcxTabSheet;
    LMDSimplePanel3: TLMDSimplePanel;
    gbPrePago: TGroupBox;
    LMDSimpleLabel2: TLMDSimpleLabel;
    lbTempo: TLMDSimpleLabel;
    edLimiteTempo: TOvcPictureField;
    panDivPausa: TLMDSimplePanel;
    gbPausar: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edPausaTempo: TOvcPictureField;
    edPausaHora: TOvcPictureField;
    panGridSinal: TLMDSimplePanel;
    bdcSinal: TdxBarDockControl;
    tsProdutos: TcxTabSheet;
    LMDSimplePanel4: TLMDSimplePanel;
    lbTotalVendas: TLMDDBLabel;
    tsAcesso: TcxTabSheet;
    panAcesso: TLMDSimplePanel;
    panDivA3: TLMDSimplePanel;
    bdcAcesso2: TdxBarDockControl;
    TabNomeFuncI: TStringField;
    TabNomeFuncF: TStringField;
    TabCaixaI: TIntegerField;
    TabCaixaF: TIntegerField;
    TabCaixaP: TIntegerField;
    tMovEstNumSeq: TAutoIncField;
    tMovEstTransacao: TIntegerField;
    tMovEstProduto: TStringField;
    tMovEstQuant: TFloatField;
    tMovEstUnitario: TCurrencyField;
    tMovEstTotal: TCurrencyField;
    tMovEstItem: TWordField;
    tMovEstDesconto: TCurrencyField;
    tMovEstDataMov: TDateTimeField;
    tMovEstDataPag: TDateTimeField;
    tMovEstEntrada: TBooleanField;
    tMovEstCancelado: TBooleanField;
    tMovEstEstoqueAnt: TFloatField;
    tMovEstTipoTran: TWordField;
    tMovEstContato: TIntegerField;
    tMovEstCaixaMov: TIntegerField;
    tMovEstCaixaPag: TIntegerField;
    tMovEstCategoria: TStringField;
    tMovEstFatorSaldo: TIntegerField;
    tMovEstSaldo: TFloatField;
    TabTipo: TIntegerField;
    TabStatusPagto: TIntegerField;
    mtSinalTransacaoVinculada: TIntegerField;
    TabDebitoCli: TCurrencyField;
    dxBarLargeButton1: TdxBarLargeButton;
    TabTipoAcessoPref: TIntegerField;
    Insp: TcxDBVerticalGrid;
    InspValor: TcxDBEditorRow;
    InspTempoCobrado: TcxDBEditorRow;
    InspTempo: TcxDBEditorRow;
    InspCredUsadoT: TcxDBEditorRow;
    InspCredAntT: TcxDBEditorRow;
    InspNaoUsarPacote: TcxDBEditorRow;
    InspSinal: TcxDBEditorRow;
    InspDesconto: TcxDBEditorRow;
    InspProdutos: TcxDBEditorRow;
    InspValorFinal: TcxDBEditorRow;
    InspStatusPagto: TcxDBEditorRow;
    GridSinal: TcxGrid;
    LVSinal: TcxGridLevel;
    TVSinal: TcxGridDBBandedTableView;
    TVSinalValor: TcxGridDBBandedColumn;
    TVSinalInicio: TcxGridDBBandedColumn;
    TVSinalFuncI: TcxGridDBBandedColumn;
    TVSinalCaixa: TcxGridDBBandedColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    GridProd: TcxGrid;
    GLProd: TcxGridLevel;
    TVProd: TcxGridDBTableView;
    TVProdProduto: TcxGridDBColumn;
    TVProdNomeProduto: TcxGridDBColumn;
    TVProdQuant: TcxGridDBColumn;
    TVProdUnitario: TcxGridDBColumn;
    TVProdTotal: TcxGridDBColumn;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    InspM: TcxDBVerticalGrid;
    InspMData: TcxDBEditorRow;
    InspMInicio: TcxDBEditorRow;
    InspMFim: TcxDBEditorRow;
    InspMTempo: TcxDBEditorRow;
    InspMNomeFuncI: TcxDBEditorRow;
    InspMNomeFuncF: TcxDBEditorRow;
    InspMObs: TcxDBEditorRow;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle12: TcxStyle;
    Edit1: TEdit;
    dxBarDockControl1: TdxBarDockControl;
    cmNovoItem: TdxBarButton;
    cmRemoverItem: TdxBarButton;
    TabUsernameCliente: TStringField;
    tMovEstCustoU: TCurrencyField;
    edSinal: TcxCurrencyEdit;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDLabel3: TLMDLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDLabel2: TLMDLabel;
    InspCab: TcxDBVerticalGrid;
    InspCabTipoAcesso: TcxDBEditorRow;
    InspCabAvulso: TcxDBEditorRow;
    InspCabDebitoCli: TcxDBEditorRow;
    InspCabObs: TcxDBEditorRow;
    Image1: TImage;
    cmEditarCliente: TdxBarLargeButton;
    cmRecibo: TdxBarLargeButton;
    mtItensPodeAlterarPreco: TBooleanField;
    InspCabCliCad: TcxDBEditorRow;
    LMDSimplePanel5: TLMDSimplePanel;
    btnAvulso: TPngSpeedButton;
    btnCad: TPngSpeedButton;
    cxLabel1: TcxLabel;
    procedure TVProdUnitarioGetProperties(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties);
    procedure cmEditarClienteClick(Sender: TObject);
    procedure InspCabCliCadEditors2EditPropertiesCloseUp(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure InspDescontoPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure InspCabCliCadEditors0GetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure edSinalPropertiesChange(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TabQtdPretoChange(Sender: TField);
    procedure InspRow12CloseUp(Sender: TObject; var Value: Variant;
      var Accept: Boolean);
    procedure mtItensAfterInsert(DataSet: TDataSet);
    procedure mtItensAfterDelete(DataSet: TDataSet);
    procedure tMovEstCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure mtItensBeforeDelete(DataSet: TDataSet);
    procedure lbVendasClick(Sender: TObject);
    procedure mtItensProdutoValidate(Sender: TField);
    procedure mtItensCalcFields(DataSet: TDataSet);
    procedure mtSinalBeforeDelete(DataSet: TDataSet);
    procedure mtSinalCalcFields(DataSet: TDataSet);
    procedure cmNovoSinalClick(Sender: TObject);
    procedure edPausaTempoChange(Sender: TObject);
    procedure edPausaHoraChange(Sender: TObject);
    procedure btnRecalcClick(Sender: TObject);
    procedure edSinalChange(Sender: TObject);
    procedure edLimiteTempoChange(Sender: TObject);
    procedure TabAfterEdit(DataSet: TDataSet);
    procedure InspCadEditButtonClick(Sender: TObject);
    procedure cmManutencaoClick(Sender: TObject);
    procedure InspCadCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure cmReciboClick(Sender: TObject);
    procedure InspCabItemChanged(Sender: TObject;
      AOldRow: TcxCustomRow; AOldCellIndex: Integer);
    procedure InspCabExit(Sender: TObject);
    procedure InspEnter(Sender: TObject);
    procedure TVSinalEditing(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      var AAllow: Boolean);
    procedure TVProdFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridProdEnter(Sender: TObject);
    procedure TVProdMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TVProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TVProdCustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure InspCabCliCadEditPropertiesInitPopup(Sender: TObject);
    procedure cmNovoItemClick(Sender: TObject);
    procedure cmRemoverItemClick(Sender: TObject);
    procedure InspCabCliCadEditors0EditPropertiesInitPopup(
      Sender: TObject);
    procedure InspCabCliCadEditors1EditPropertiesInitPopup(
      Sender: TObject);
    procedure InspCabCliCadEditors2EditPropertiesInitPopup(
      Sender: TObject);
    procedure InspCabCliCadEditPropertiesCloseUp(Sender: TObject);
    procedure InspCabAvulsoEditPropertiesEditValueChanged(Sender: TObject);
    procedure btnCadClick(Sender: TObject);
    procedure btnAvulsoClick(Sender: TObject);
  private
    { Private declarations }
    FTab : TnxTable;
    FContatoAnt : Integer;
    FNomeAnt    : String;
    FValorAnt   : Double;
    FTotVendas  : Double;
    FTotSinal   : Double;
    FTicks      : Cardinal;
    FCredUsado  : Cardinal;
    FCredAntes  : Cardinal;
    FIniciar    : Boolean;
    FTipoAnt    : Integer;
    FLendo      : Boolean;
    FMsgDebito  : Integer;
    FPass       : TPassaportes;
    FStream     : TMemoryStream;
    FDadosCli   : TDadosCliente;

    function GetSinal: Double;
    procedure ResetaValores;
    procedure RecalcValores;

    function SalvarItem: Boolean;
    function ItemAtual: Integer;
    
    procedure LeItens;
    procedure SalvaItens;

    procedure LeSinais;
    procedure SalvaSinais;
    procedure GravaIniciar;
    procedure GravaEditar;
  public
    Calculando : Boolean;
    Recalc : Boolean;
    UltimaLin: Integer;
    FocouTipo : Boolean;

    procedure Editar(aTab: TnxTable; Pagina: Integer);
    procedure EditarEsp(aTab: TnxTable; Pagina: Integer);
    procedure Iniciar;
    procedure MostraDebito;
    procedure RefreshFoto;
    { Public declarations }
  end;

var
  FrmAcesso: TFrmAcesso;

implementation

uses ucmaPri, ucmaDM, cmIDRecursos, cmAuxPassaporte, ufmImagens, ucmaFrmCliente;

{$R *.DFM}

procedure TFrmAcesso.GravaIniciar;
begin
  Dados.tbCli.IndexName := 'ICodigo';
  if Tab.State in [dsEdit, dsInsert] then Tab.Post;
  with Dados, CM do
  if (TabContato.Value > 0) and tbCli.Locate('Codigo', TabContato.Value, []) then
    LoginMaq(TabMaquina.Value, 
             tbCli.FieldByName('Codigo').AsInteger, 
             tbCli.FieldByName('Username').AsString, 
             tbCli.FieldByName('Senha').AsString, 
             tbCli.FieldByName('Nome').AsString, 
             TabObs.Value, 
             DateTimeToTicks(edPausaTempo.AsDateTime),
             GetSinal,
             TabTipoAcesso.Value)
    else 
      LoginMaq(TabMaquina.Value, 0, 'anonimo', 'anonimo', TabNome.Text, TabObs.Value, 
               DateTimeToTicks(edPausaTempo.AsDateTime),
               GetSinal, 
               TabTipoAcesso.Value);
  Close;
end;

function TFrmAcesso.GetSinal: Double;
begin
  try
    Result := edSinal.EditValue;
  except
    Result := 0;
  end;
end;

procedure TFrmAcesso.GravaEditar;
var
  M : TCMMaquina;
  Ticks, CredCli : Cardinal;
begin
  CredCli := 0;
  if TabStatusPagto.Value<>spEmAndamento then begin
    if TabStatusPagto.Value=spDebitado then begin
      TabDataPagto.Clear;
      TabCaixaP.Value := 0;
    end else begin
      TabDataPagto.AsDateTime := Date;
      TabCaixaP.Value :=NumAberto;
    end;
  end;

  InspCab.DataController.PostEditingData;
  InspCab.DataController.Post;

  TVSinal.DataController.PostEditingData;

  Dados.tbPro.IndexName := 'ICodigo';
  Dados.tbCli.IndexName := 'ICodigo';
  if Tab.State in [dsEdit, dsInsert] then
    Tab.Post;

  M := Dados.CM.Maquinas.PorAcesso[TabNumero.Value];
  if (M<>nil) and (TabStatusPagto.Value=spEmAndamento) then begin 
    Ticks := DateTimeToTicks(edPausaTempo.AsDateTime);
    if (Ticks <> M.LimiteTempo) and (M.NumTicks > Ticks) then
      Raise Exception.Create('Não é possivel lançar um pagamento antecipado ou tempo de pausa'+
                             ' que resulte em um tempo de uso menor do que já foi transcorrido');
  end;

  if mtSinal.State in [dsEdit, dsInsert] then mtSinal.Post;
  if mtItens.State in [dsEdit, dsInsert] then mtItens.Post;
  RecalcValores;
  FTab.DisableControls;
  Dados.tbCli.DisableControls;
  tSinal.DisableControls;
  tMovEst.DisableControls;
  Dados.tbPro.DisableControls;
  mtSinal.DisableControls;
  mtItens.DisableControls;
  
  FTab.AutoCalcFields := False;
  try
    Dados.tbCli.IndexName := 'ICodigo';
    if TabDesconto.Value > TabValor.Value then begin
      Beep;
      ShowMessage('Desconto não pode ser maior que valor de Internet!');
      Exit;
    end;

    if (TabStatusPagto.Value=spDebitado) and (TabContato.Value < 1) then begin
      Beep;
      ShowMessage('Para debitar é necessário associar esse acesso à um cliente cadastrado');
      Exit;
    end;


    with Dados do begin
      tbPro.IndexName := 'ICodigo';
      tbCaixa.Refresh;
      tbCaixa.IndexName := 'INumero';

      if not tbCaixa.FindKey([NumAberto]) then begin
        Beep;
        ShowMessage('Caixa não encontrado!');
        Exit;
      end;

      DB.StartTransactionWith([tbCli, tSinal, tMovEst, tbPro, FTab]);
      try
        if TabStatusPagto.Value<>spEmAndamento then begin
          if (FContatoAnt > 0) and (FContatoAnt<>TabContato.Value) then
          if tbCli.FindKey([FContatoAnt]) then begin
            tbCli.Edit;

            if CM.Config.PacoteTempoReal then
              tbCli.FieldByName('TempoTotal').Value :=
                tbCli.FieldByName('TempoTotal').Value -
                DateTimeToSegundos(TabTempo.Value)
            else
              tbCli.FieldByName('TempoTotal').Value :=
                tbCli.FieldByName('TempoTotal').Value -
                DateTimeToSegundos(TabTempoCobrado.Value);

            if FCredUsado>0 then
              tbCli.FieldByName('CreditoM').AsInteger :=
                ObtemCred(tbCli.FieldByName('CreditoM').AsInteger) +
                FCredUsado;
            tbCli.Post;
          end;
        end;  

        if (TabContato.Value > 0) and tbCli.FindKey([TabContato.Value]) then begin
          CredCli := tbCli.FieldByName('CreditoM').AsInteger;
          if (TabStatusPagto.Value<>spEmAndamento) then begin
            tbCli.Edit;
            if (TabContato.Value <> FContatoAnt) then begin
              if CM.Config.PacoteTempoReal then
                tbCli.FieldByName('TempoTotal').AsInteger :=
                  tbCli.FieldByName('TempoTotal').AsInteger +
                  DateTimeToSegundos(TabTempo.Value)
              else
                tbCli.FieldByName('TempoTotal').AsInteger :=
                  tbCli.FieldByName('TempoTotal').AsInteger +
                  DateTimeToSegundos(TabTempoCobrado.Value);

              tbCli.FieldByName('CreditoM').AsInteger :=
                ObtemCred(ObtemCred(tbCli.FieldByName('CreditoM').AsInteger) -
                TabCredUsado.Value);
            end else
              tbCli.FieldByName('CreditoM').AsInteger :=
                ObtemCred(tbCli.FieldByName('CreditoM').AsInteger +
                FCredUsado -
                TabCredUsado.Value);
            tbCli.Post;
          end;  
        end;

        FTab.Edit;

        with FTab.FieldByName('Tipo') do
        if TabProdutos.AsFloat > 0.009 then
          AsInteger := ttAcessoVenda
        else
          AsInteger := ttAcesso;
          
        if TabStatusPagto.Value > spEmAndamento then begin
          if FTab.FieldByName('CaixaF').AsInteger=0 then
            FTab.FieldByName('CaixaF').AsInteger := TabCaixaP.Value;
          FTab.FieldByName('CredUsado').AsInteger := TabCredUsado.Value;
          FTab.FieldByName('CredAnterior').AsInteger := TabCredAnterior.Value;
          FTab.FieldByName('DataPagto').Value := TabDataPagto.AsVariant;
          FTab.FieldByName('StatusPagto').Value := TabStatusPagto.Value;
          FTab.FieldByName('CaixaP').AsInteger := TabCaixaP.Value;
        end;

        FTab.FieldByName('Obs').Value := TabObs.Value;
        FTab.FieldByName('TipoAcesso').AsInteger := TabTipoAcesso.Value;
        FTab.FieldByName('Nome').Value := TabNome.Value;
        FTab.FieldByName('Contato').AsInteger := TabContato.Value;
        if TabContato.Value > 0 then
          FTab.FieldByName('Nome').AsString := TabNomeContato.Value;
          
        FTab.FieldByName('Valor').AsFloat := TabValor.Value;
        FTab.FieldByName('Desconto').AsFloat := TabDesconto.Value;
        FTab.FieldByName('Produtos').Value := TabProdutos.Value;
        FTab.FieldByName('NaoUsarPacote').AsBoolean := TabNaoUsarPacote.Value;
        FTab.FieldByName('Sinal').AsFloat := TabSinal.Value;
        FTab.FieldByName('ValorFinalAcesso').Value :=
          CalcAcesso(FTab.FieldByName('Valor').AsFloat,
                     FTab.FieldByName('Sinal').AsFloat,
                     FTab.FieldByName('Desconto').AsFloat);


        SalvaSinais;
        SalvaItens;
        FTab.Post;

        if TabContato.Value>0 then
          TotalizaDebCli(TabContato.Value);

        if (TabStatusPagto.Value = spDebitado) and tbCliTemDebito.Value and
           (tbCliDebito.Value>LimiteDebito(tbCliLimiteDebito))
        then 
          Raise Exception.Create('Não é possível deixar essa operação em débito. Débito máximo permitido foi ultrapassado');


        if (TabContato.Value<>FContatoAnt) and (FContatoAnt>0) then
          TotalizaDebCli(FContatoAnt);

        DB.Commit;

        if M <> nil then begin
          M.AtualizaCache;
          if M.AguardaPagto then
            M.ZeraInfoAcesso
          else begin
            M.TipoAcesso  := TabTipoAcesso.Value;
            M.Vendas      := TabProdutos.Value;
            M.Sinal       := TabSinal.Value;
            M.Contato     := TabContato.Value;
            if M.Contato>0 then begin
              M.NomeContato := TabNomeContato.Value;
              M.Nome := M.NomeContato
            end else begin
              M.Nome := TabNome.Value;
              M.NomeContato := M.Nome;
            end;
            M.ObsAcesso   := TabObs.Value;
            M.LimiteTempo := DateTimeToTicks(edPausaTempo.AsDateTime);
            LePassaportesCliTran(Dados.tbPass, Dados.tbHistPass, M.TipoAcesso, M.Contato, M.Acesso, M.Passaportes);
            
            if M.Contato > 0 then 
              M.CreditoCli := ObtemCred(Integer(CredCli))
            else  
              M.CreditoCli := 0;
              
          end;

          CM.SalvaAlteracoesObj(M, False);
        end;  
          
      except
        try
          if FTab.State in [dsEdit, dsInsert] then FTab.Cancel;
          if tbCli.State in [dsedit, dsInsert] then tbCli.Cancel;
        finally
          DB.Rollback;
        end;
        Raise;
      end; 
    end;   
  finally
    Dados.tbCli.EnableControls;
    tSinal.EnableControls;
    tMovEst.EnableControls;
    Dados.tbPro.EnableControls;
    mtSinal.EnableControls;
    mtItens.EnableControls;
  
    FTab.EnableControls;
    FTab.AutoCalcFields := True;
  end;   
  Close;
end;


procedure TFrmAcesso.cmGravarClick(Sender: TObject);
begin
  if btnCad.Down and (TabContato.Value=0) then begin
    Beep;
    ShowMessage('É necessário selecionar o cliente cadastrado.');
    Exit;
  end;

{  if btnAvulso.Down then begin
    FDadosCli.dcCodigo := 0;
    FDadosCli.dcNome := '';
    if not (Tab.State in [dsInsert, dsEdit]) then
      Tab.Edit;
    TabContato.Clear;  
    TabNomeContato.Clear;
  end;}
     
  Edit1.SetFocus;
  MostraDebito;
  
  if FIniciar then
    GravaIniciar
  else
    GravaEditar;  
end;

procedure TFrmAcesso.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAcesso.cmEditarClienteClick(Sender: TObject);
begin
  if TabContato.Value=0 then Exit;
  if not Dados.tbCli.Locate('Codigo', TabContato.Value, []) then Exit;
  TFrmCliente.Create(nil).Editar(Dados.tbCli, nil);
  RefreshFoto;
end;

procedure TFrmAcesso.Iniciar;
begin
  lbNumM.Font.Color := clNavy;
  if Permitido(daMaqModoManutencao) then
    cmManutencao.Visible := ivAlways;
  cmGravar.Caption := '&Iniciar';
  cmGravar.LargeImageIndex := 55;
  Height := Height - panGridSinal.Height - 21;
  Dados.tbTipoAcesso.First;
  Paginas.ActivePageIndex := 0;
  panGridSinal.Visible := False;
  Paginas.HideTabs := True;
  Tab.Insert;
  FIniciar := True;
  TabTipoAcesso.Value := Dados.tbTipoAcesso.FieldByName('Codigo').AsInteger;
  TabMaquina.Value := Dados.mtMaquinaNumero.Value;
  Caption := 'Liberar Uso';
  Tab.Post;
  Tab.Edit;

  InspCabCliCad.Visible := Dados.CM.Config.MostraCliCadAntesAvulso;
  InspCabAvulso.Visible := not InspCabCliCad.Visible;

  if InspCabAvulso.Visible then
    btnAvulso.Down := True else
    btnCad.Down := True;
  
  ShowModal;
end;

procedure TFrmAcesso.EditarEsp(aTab: TnxTable; Pagina: Integer);
var 
  I : Integer;
  M : TCMMaquina;
begin
  Paginas.ActivePageIndex := 1;
  Paginas.ActivePageIndex := Pagina;

  FTab := aTab;
  InspStatusPagto.Visible := (FTab.FieldByName('StatusPagto').AsInteger >= spAguardaPagto);
  if InspStatusPagto.Visible and Dados.tbConfigImprimirImpRec.Value then
    cmRecibo.Visible := ivAlways;

  if InspStatusPagto.Visible and (not Permitido(daAlterarSinal)) then
    panGridSinal.Enabled := False;  

  cmGravar.Enabled := PodeEditarTran(FTab);
  cmData.Caption := 'Data: ' + FormatDateTime('dd/mm/yyyy hh:mm', FTab.FieldByName('Inicio').AsDateTime);
  cmPagamento.Caption := 'Pagamento: ' + FormatDateTime('dd/mm/yyyy', FTab.FieldByName('DataPagto').AsDateTime);
  cmFuncInicio.Caption := 'Func. Inicio: ' + FTab.FieldByName('FuncI').AsString;
  cmFuncFim.Caption := 'Func. Fim: ' + FTab.FieldByName('FuncF').AsString;

  Insp.Enabled := InspStatusPagto.Visible;

  FContatoAnt := FTab.FieldByName('Contato').AsInteger;
  FNomeAnt    := FTab.FieldByName('Nome').AsString;
  if FContatoAnt>0 then
    FNomeAnt := '';
  FTicks      := DateTimeToTicks(FTab.FieldByName('Tempo').AsDateTime);
  FCredUsado  := FTab.FieldByName('CredUsado').AsInteger;
  FCredAntes  := FTab.FieldByName('CredAnterior').AsInteger;
  FValorAnt   := FTab.FieldByName('Valor').AsFloat;

  Tab.AutoCalcFields := False;
  Tab.DisableControls;
  try
    Tab.Insert;
    for I := 0 to pred(Tab.Fields.Count) do
    with Tab.Fields[I] do
    if FieldKind=fkData then 
      Value := FTab.FieldByName(FieldName).Value;
    Tab.Post;
  finally
    Tab.EnableControls;
    Tab.AutoCalcFields := True;
  end;    
  Tab.Edit;
  RefreshFoto;
    
  if TabStatusPagto.Value=spAguardaPagto then
    TabStatusPagto.Value := spPago;

  FPass.Limpa;  
  if TabStatusPagto.Value>=spAguardaPagto then begin
    LePassaportesCliTran(Dados.tbPass, 
                         Dados.tbHistPass, 
                         TabTipoAcesso.Value, 
                         TabContato.Value, 
                         TabNumero.Value, 
                         @FPass);
  end;  

  if Insp.Enabled then begin
    panDivPausa.Visible := False;
    gbPausar.Visible := False;
    edLimiteTempo.Visible := False;
    lbTempo.Visible := False;
  end;

  edSinal.Properties.ReadOnly := True;
  edSinal.TabStop := False;

  FLendo := True;
  try
    LeItens; 
    LeSinais;
  finally
    FLendo := False;
  end;    

  RecalcValores;

  if TabStatusPagto.Value=spEmAndamento then begin
    M := Dados.CM.Maquinas.PorAcesso[TabNumero.Value];
    if M <> nil then
      edPausaTempo.AsDateTime := TicksToDateTime(M.LimiteTempo);
  end;

  InspCabCliCad.Visible := (TabContato.Value>0);
  InspCabAvulso.Visible := not InspCabCliCad.Visible;

  if InspCabAvulso.Visible then
    btnAvulso.Down := True else
    btnCad.Down := True;
  

  ShowModal;
end;

procedure TFrmAcesso.Editar(aTab: TnxTable; Pagina: Integer);
begin
  EditarEsp(aTab, Pagina);
end;

procedure TFrmAcesso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{  case Key of
    Key_Enter, Key_Tab : 
    if ssCtrl in Shift then
      cmGravarClick(nil)
    else
    if ssShift in Shift then begin
      if edSinal.Focused then begin
        InspCab.SetFocus;
        InspCab.
        Key := 0;
      end;
    end else
    if FIniciar then begin
      if (ActiveControl=InspCab) and (InspCab.FocusedField=TabObs) then begin
        edSinal.SetFocus;
        Key := 0;
      end
      else
      if edSinal.Focused then begin
        edLimiteTempo.SetFocus;
        Key := 0;
      end
      else
      if edLimiteTempo.Focused then begin
        edPausaTempo.SetFocus;
        Key := 0;
      end
      else
      if edPausaTempo.Focused then begin
        edPausaHora.SetFocus;
        Key := 0;
      end;
    end;  
    
    Key_Esc   : Close;
  end;}
end;

procedure TFrmAcesso.TabCalcFields(DataSet: TDataSet);
begin
  RecalcValores;

  TabData.Value := TabInicio.Value;
  if TabCredUsado.Value=0 then
    TabCredUsadoT.Clear
  else  
    TabCredUsadoT.Value := TicksToDateTime(TabCredUsado.Value);

  if TabCredAnterior.Value=0 then
    TabCredAntT.Clear
  else  
    TabCredAntT.Value   := TicksToDateTime(TabCredAnterior.Value);

  TabValorAcesso.Value := CalcAcesso(TabValor.Value, TabSinal.Value, TabDesconto.Value);
      
  TabValorFinal.Value := 
    TabValorAcesso.Value +
    TabProdutos.Value;

  TabTempoTicks.Value := DateTimeToTicks(TabTempoCobrado.Value);

  if Tab.State in [dsEdit, dsInsert] then
    TabSubTotal.Value := TabValor.Value + TabProdutos.Value;

  if Tab.State in [dsEdit, dsInsert] then  
  if TabTipoAcesso.Value <> FTipoAnt then 
    edSinalChange(nil);

  FTipoAnt := TabTipoAcesso.Value;  
end;

procedure TFrmAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dados.tbCli.IndexName := 'ICodigo';
  Dados.tbPro.IndexName := 'ICodigo';
  Action := caFree;
end;

procedure TFrmAcesso.ResetaValores;
begin
  Tab.FieldByName('CredUsado').AsInteger := FCredUsado;
  Tab.FieldByName('CredAnterior').AsInteger := FCredAntes;
  Tab.FieldByName('Valor').AsFloat := FValorAnt;
  RecalcValores;
end;

procedure TFrmAcesso.FormCreate(Sender: TObject);
begin
  FStream := TMemoryStream.Create;
  FIniciar := False;
  PagPri.ActivePage := tsPagNormal;
  FLendo := False;
  edSinal.EditValue := 0;
  edLimiteTempo.AsDateTime := 0;
  edPausaHora.AsDateTime := 0;
  edPausaTempo.AsDateTime := 0;
  FTotVendas := 0;
  FTotSinal := 0;
  Recalc := False;
  Tab.Active := True;
  mtItens.Open;
  tMovEst.Open;
  tSinal.Open;
  tTran.Open;
  mtSinal.Active := True;
{  InspM.DividerPos := 117;
  InspCab.DividerPos := 120;}
end;

procedure TFrmAcesso.FormDestroy(Sender: TObject);
begin
  FStream.Free;
end;

procedure TFrmAcesso.RecalcValores;
var
  Cred, CreditoUsado, TempoCobrado, Ticks : Cardinal;
  Valor  : Double;
  TA : TCMTipoAcesso;
begin
  if (not (Tab.State in [dsEdit, dsInsert])) or 
     Recalc or 
     (TabStatusPagto.Value=spEmAndamento) or 
     (not cmGravar.Enabled) or
     (TabTipo.Value=ttManutencao) then Exit;
  Recalc := True;
  try
    if TabNaoUsarPacote.Value or (TabContato.Value<1) then
      Cred := 0
    else begin
      Cred := TabCreditoCli.Value;
      if (FContatoAnt=TabContato.Value) then
        Cred := Cred + FCredUsado;
    end;    
      
    Ticks := FTicks;
    if TabContato.Value>0 then
      TabIsento.Value := TabIsentoCli.Value
    else
      TabIsento.Value := False;

    with Dados.CM do begin
      TA := TiposAcesso.PorCodigo[TabTipoAcesso.Value];
      if (TA=nil) then
      if (TiposAcesso.Count>0) then
        TA := TiposAcesso.Itens[0]
      else
        Exit;  
      CalculaTempoValor(TabInicio.Value, Ticks, Cred, 
                        TA.Codigo, TA.PHoraCor^, CorPrecos, 
                        Config.PacoteTempoReal,
                        @FPass, TempoCobrado, CreditoUsado, Valor);
      if TabIsento.Value then
        Valor := 0;                   
    end;
        
    TabValor.Value := Valor;
    TabTempoCobrado.Value := TicksToDateTime(TempoCobrado);
    TabCredUsado.Value := CreditoUsado;
    TabCredAnterior.Value := TabCreditoCli.Value;
    if TabContato.Value = FContatoAnt then
      TabCredAnterior.Value := TabCreditoCli.Value + FCredUsado;

  finally
    Recalc := False;
  end;        
end;  

procedure TFrmAcesso.RefreshFoto;
var S: String;
begin
  with Dados do
  if (TabContato.Value>0) then begin
    TabNome.Value := '';
    cmEditarCliente.Visible := ivAlways;
    if (tbCliCodigo.Value <> TabContato.Value) then
      if not tbCli.Locate('Codigo', TabContato.Value, []) then Exit;
    if (not tbCliFoto.IsNull) then begin
      S := ExtractFilePath(ParamStr(0))+'foto.jpg';
      tbCliFoto.SaveToFile(S);
      Image1.Picture.LoadFromFile(S);
      Image1.Visible := True;
      Exit;
    end;
  end else
    cmEditarCliente.Visible := ivNever;
  Image1.Visible := False;
end;

procedure TFrmAcesso.TabQtdPretoChange(Sender: TField);
begin
  RecalcValores;
end;

procedure TFrmAcesso.InspRow12CloseUp(Sender: TObject; var Value: Variant;
  var Accept: Boolean);
begin
  Accept := True;
  if (Value=Null) or (Value<1) then begin
    TabContato.Value := 0;
    TabNome.Value := FNomeAnt;
    ResetaValores;
  end else begin 
    ResetaValores;
    TabNome.Value := Dados.tbCli.Lookup('Codigo', Value, 'Nome');
  end;                                 
end;

function TFrmAcesso.SalvarItem: Boolean;
begin
  Result := 
    (mtItensProduto.Value > '') and
    (mtItensQuant.Value > 0.0009);
end;

procedure TFrmAcesso.LeSinais;
begin
  mtSinal.EmptyTable;
  tSinal.SetRange([TabNumero.Value], [TabNumero.Value]);
  mtSinal.DisableControls;
  FTotSinal := 0;
  try
    tSinal.First;
    while not tSinal.Eof do begin
      mtSinal.Append;
      mtSinalNumero.Value := tSinal.FieldByName('Numero').AsInteger;
      mtSinalInicio.Value := tSinal.FieldByName('Inicio').AsDateTime;
      mtSinalValor.Value  := tSinal.FieldByName('Valor').AsFloat;
      mtSinalTransacaoVinculada.Value := tSinal.FieldByName('TransacaoVinculada').AsInteger;
      mtSinalCaixa.Value := tSinal.FieldByName('CaixaP').AsInteger;
      mtSinalFuncI.Value := tSinal.FieldByName('FuncI').AsString;
      mtSinal.Post;
      tSinal.Next;
    end;  
  finally
    tSinal.CancelRange;
    mtSinal.EnableControls;
  end;    
  if Tab.State in [dsInsert, dsEdit] then
  edSinal.EditValue := FloatToStr(FTotSinal);
  edSinalChange(nil);        
end;

procedure TFrmAcesso.LeItens;
var Item: Integer;
begin
  mtItens.EmptyTable;
  tMovEst.SetRange([TabNumero.Value],
                   [TabNumero.Value]);

  Item := 0;
  FTotVendas := 0;
  mtItens.DisableControls;
  try
    tMovEst.First;
    while not tMovEst.Eof do begin
      Inc(Item);
      mtItens.Append;
      mtItensItem.Value := Item;
      mtItensProduto.Value := tMovEstProduto.Value;
      mtItensQuant.Value := tMovEstQuant.Value;
      mtItensUnitario.Value := tMovEstUnitario.Value;
      mtItens.Post;
      tMovEst.Next;
    end;  
  finally
    mtItens.EnableControls;
  end;  
  if Tab.State in [dsInsert, dsEdit] then
    TabProdutos.Value := FTotVendas;
end;

procedure TFrmAcesso.SalvaSinais;
var 
  SinalAnt, DifSinal: Double;
begin
  if mtSinal.State=dsEdit then
    mtSinal.Post;
  mtSinal.First;
  while not mtSinal.Eof do begin
    if (mtSinalCaixa.Value=NumAberto) then begin
      if (mtSinalNumero.Value>0) and tSinal.Locate('Numero', mtSinalNumero.Value, []) then 
        tSinal.Edit
      else
        tSinal.Insert;  
      SinalAnt := tSinal.FieldByName('Valor').AsFloat;  
      
      tSinal.FieldByName('Maquina').AsInteger := TabMaquina.Value;
      tSinal.FieldByName('TipoAcesso').AsInteger := TabTipoAcesso.Value;
      if TabContato.Value > 0 then
        tSinal.FieldByName('Nome').AsString := TabNomeContato.Value
      else
        tSinal.FieldByName('Nome').AsString := TabNome.Value;
          
      if tSinal.State=dsInsert then begin
        tSinal.FieldByName('Tipo').AsInteger := ttSinal;
        tSinal.FieldByName('CaixaI').AsInteger := mtSinalCaixa.Value;
        tSinal.FieldByName('CaixaF').AsInteger := mtSinalCaixa.Value;
        tSinal.FieldByName('CaixaP').AsInteger := mtSinalCaixa.Value;
        tSinal.FieldByName('TransacaoVinculada').AsInteger := TabNumero.Value;
        tSinal.FieldByName('FuncI').AsString := Dados.CM.Username;
        tSinal.FieldByName('FuncF').AsString := Dados.CM.Username;
        tSinal.FieldByName('StatusPagto').AsInteger := spPago;
        tSinal.FieldByName('Inicio').AsDateTime := Now;
        tSinal.FieldByName('Fim').AsDateTime := Now;
        tSinal.FieldByName('DataPagto').AsDateTime := Now;
        tSinal.FieldByName('Isento').AsBoolean := False;
      end;  
        
      tSinal.FieldByName('Contato').AsInteger := TabContato.Value;
      tSinal.FieldByName('Valor').AsFloat := mtSinalValor.Value;
      tSinal.FieldByName('ValorFinalAcesso').AsFloat := mtSinalValor.Value;
      
      DifSinal := DifSinal + (mtSinalValor.Value - SinalAnt);
      tSinal.Post;
    end; 
    mtSinal.Next;
  end;  
end;

procedure TFrmAcesso.SalvaItens;
var 
  I : Integer;
  Data : TDateTime;
  Produto : String;
  NumSeq : Integer;
  Mov,
  SaldoAnt: Extended;

function ApagouProduto: Boolean;
begin
  Result := False;
  mtItens.First;
  while not mtItens.Eof do begin
    if (mtItensProduto.Value = tMovEstProduto.Value) and SalvarItem then 
      Exit;
    mtItens.Next;
  end;
  Result := True;
end;
  
begin
  tMovEst.SetRange([TabNumero.Value], [TabNumero.Value]);
  tMovEst.First;
  while not (tMovEst.Eof and tMovEst.Bof) do begin
    if ApagouProduto then begin
      Data := tMovEstDataMov.Value;
      Produto := tMovEstProduto.Value;
      NumSeq := tMovEstNumSeq.Value;
    end else
      Produto := '';

    if (not tMovEstCancelado.Value) then begin
      Mov := tMovEstFatorSaldo.Value * tMovEstQuant.Value;
      Dados.AjustaEstoqueProduto(tMovEstProduto.Value, 0, (-1 * Mov));
    end;                                 

    SaldoAnt := tMovEstEstoqueAnt.Value;                                 
    tMovEst.Delete;
    
    if Produto <> '' then 
      Dados.AjustaSaldoPosterior(Produto, Data, NumSeq, SaldoAnt);
  end;  
  
  mtItens.First;
  I := 0;
  while not mtItens.Eof do begin
    if SalvarItem then begin
      Inc(I);
      tMovEst.Append;
      tMovEstItem.Value := I;
      tMovEstTransacao.Value := TabNumero.Value;
      tMovEstProduto.Value := mtItensProduto.Value;
      with Dados do
      if tbPro.FindKey([mtItensProduto.Value]) then
        tMovEstCustoU.Value := tbProCustoUnitario.Value;
      tMovEstQuant.Value := mtItensQuant.Value;
      tMovEstUnitario.Value := mtItensUnitario.Value;
      tMovEstTotal.Value := mtItensTotal.Value;
      tMovEstTipoTran.Value := ttAcessoVenda;
      tMovEstEntrada.Value := False;
      tMovEstCaixaPag.Value := FTab.FieldByName('CaixaP').AsInteger;
      tMovEstCaixaMov.Value := FTab.FieldByName('CaixaF').AsInteger;
      if tMovEstCaixaMov.Value=0 then
        tMovEstCaixaMov.Value := NumAberto;
      tMovEstCancelado.Value := False;
      tMovEstEstoqueAnt.Value := 0;
      tMovEstDataMov.Value := TabInicio.Value;
      tMovEstDataPag.AsVariant := FTab.FieldByName('DataPagto').Value;
      tMovEst.Post;
      
      Dados.AjustaEstoqueProduto(tMovEstProduto.Value, 0, -1 * tMovEstQuant.Value);
      
      tMovEst.Edit;
      tMovEstEstoqueAnt.Value := 
        Dados.ObtemSaldoAnterior(tMovEstProduto.Value, 
                                 tMovEstDataMov.Value,
                                 tMovEstNumSeq.Value);
       tMovEst.Post;
       Dados.AjustaSaldoPosterior(tMovEstProduto.Value,
                                 tMovEstDataMov.Value,
                                 tMovEstNumSeq.Value,
                                 tMovEstSaldo.Value);
    end;  
    mtItens.Next;
  end;
end;

procedure TFrmAcesso.mtItensAfterInsert(DataSet: TDataSet);
begin
  mtItensItem.Value := mtItens.RecordCount+1;
  mtItensQuant.Value := 1;
end;

procedure TFrmAcesso.mtItensAfterDelete(DataSet: TDataSet);
begin
  if mtItens.RecordCount=0 then 
    mtItens.Append;
end;

procedure TFrmAcesso.tMovEstCalcFields(DataSet: TDataSet);
begin
  if tMovEstCancelado.Value then 
    tMovEstFatorSaldo.Value := 0
  else
  if tMovEstEntrada.Value then
    tMovEstFatorSaldo.Value := 1
  else
    tMovEstFatorSaldo.Value := -1;
  tMovEstSaldo.Value := 
    tMovEstEstoqueAnt.Value +  
    (tMovEstFatorSaldo.Value * tMovEstQuant.Value);
end;

procedure TFrmAcesso.FormShow(Sender: TObject);
begin
  lbNumM.Caption := TabMaquina.AsString;
  if TabTipo.Value=ttManutencao then begin
    PagPri.ActivePage := tsPagManut;
    Exit;
  end;  
    
  tsAcesso.TabVisible := (TabStatusPagto.Value>=spAguardaPagto);

  with Dados do 
  InspCabTipoAcesso.Visible := CM.Config.VariosTiposAcesso and (tbTipoAcesso.RecordCount>1);
  
  Dados.tbPro.IndexName := 'IDescricao';
  mtItens.DisableControls;
  try
    mtItens.Append;
  finally
    mtItens.EnableControls;
  end;    
  case Paginas.ActivePageIndex of
    0 : begin
     InspCab.SetFocus;
     InspCab.FocusedRow := InspCabObs;
     if Dados.CM.Config.MostraCliCadAntesAvulso then
       InspCab.FocusedRow := InspCabCliCad
     else
       InspCab.FocusedRow := InspCabAvulso;
     InspCab.SetFocus;  
    end;

    1 : GridProd.SetFocus;
    2 : begin
      Insp.SetFocus;
      Insp.FocusedRow := InspDesconto;
    end;
  end;  
end;

procedure TFrmAcesso.mtItensBeforeDelete(DataSet: TDataSet);
begin
  FTotVendas := FTotVendas - mtItensTotal.Value;
  if Tab.State in [dsInsert, dsEdit] then
    TabProdutos.Value := FTotVendas;
end;

function TFrmAcesso.ItemAtual: Integer;
begin
  Result := Succ(TVProd.DataController.FocusedRecordIndex);
end;

procedure TFrmAcesso.lbVendasClick(Sender: TObject);
begin
  GridProd.SetFocus;
end;

procedure TFrmAcesso.mtItensProdutoValidate(Sender: TField);
var V: Variant;
begin
  if mtItens.ControlsDisabled then Exit;

  with Dados do begin
    V := tbPro.Lookup('Codigo', mtItensProduto.Value, 'Preco');
    if V <> null then
      mtItensUnitario.AsVariant := V
    else begin  
      mtItensUnitario.Value := 0;
      mtItensQuant.Value := 0;
      Raise Exception.Create('Código Inválido!');
    end;  
  end;
end;

procedure TFrmAcesso.mtItensCalcFields(DataSet: TDataSet);
begin
  FTotVendas := FTotVendas - mtItensTotal.Value;
  mtItensTotal.Value := mtItensQuant.Value * mtItensUnitario.Value;
  FTotVendas := FTotVendas + mtItensTotal.Value;
  if not FLendo then
  if Tab.State in [dsInsert, dsEdit] then
    TabProdutos.Value := FTotVendas;
end;

procedure TFrmAcesso.mtSinalBeforeDelete(DataSet: TDataSet);
begin
  FTotSinal := FTotSinal - mtSinalValor.Value;
  if Tab.State in [dsInsert, dsEdit] then
    TabSinal.Value := FTotSinal;
  edSinal.EditValue := FloatToStr(FTotSinal);
  edSinalChange(nil);
end;

procedure TFrmAcesso.mtSinalCalcFields(DataSet: TDataSet);
begin
  FTotSinal := FTotSinal - mtSinalValorCalc.Value;
  mtSinalValorCalc.Value := mtSinalValor.Value;
  FTotSinal := FTotSinal + mtSinalValorCalc.Value;
  
  if Tab.State in [dsInsert, dsEdit] then
    TabSinal.Value := FTotSinal;

  if not FLendo then 
    edSinal.EditValue := FloatToStr(FTotSinal);
end;

procedure TFrmAcesso.cmNovoSinalClick(Sender: TObject);
begin
  mtSinal.Append;
  mtSinalInicio.Value := Now;
  mtSinalNumero.Value := 0;
  mtSinalCaixa.Value := NumAberto;
  mtSinalFuncI.Value := Dados.CM.Username;
  mtSinalValor.Value := 0;
  mtSinal.Post;
  mtSinal.Edit;
  GridSinal.SetFocus;
end;

procedure TFrmAcesso.edPausaTempoChange(Sender: TObject);
begin
  if Calculando then Exit;
  Calculando := True;
  try
    edPausaHora.AsDateTime := Now + edLimiteTempo.AsDateTime;
  finally
    Calculando := False;
  end;    
end;

procedure TFrmAcesso.edPausaHoraChange(Sender: TObject);
begin
  if Calculando then Exit;
  Calculando := True;
  try
    edPausaTempo.AsDateTime := Date + Frac(edPausaHora.AsDateTime) - Frac(Now);
  finally
    Calculando := False;
  end;    
end;

procedure TFrmAcesso.btnAvulsoClick(Sender: TObject);
begin
  InspCab.DataController.DataSource := nil;
  try
    InspCabCliCad.Visible := False;
    InspCabAvulso.Visible := True;
    InspCabAvulso.Focused := True;
    TabContato.Clear;
    TabNome.Clear;
    TabNomeContato.Clear;
    FDadosCli.dcCodigo := 0;
    FDadosCli.dcNome := '';
  finally
    InspCab.DataController.DataSource := dsTab;
  end;
end;

procedure TFrmAcesso.btnCadClick(Sender: TObject);
begin
  InspCabAvulso.Visible := False;
  InspCabCliCad.Visible := True;
  InspCabCliCad.Focused := True;
end;

procedure TFrmAcesso.btnRecalcClick(Sender: TObject);
begin
  edLimiteTempo.AsDateTime := edPausaTempo.AsDateTime;
  edLimiteTempoChange(nil);
end;

procedure TFrmAcesso.edSinalChange(Sender: TObject);
var 
  NumTicks: Cardinal;
  TA : TCMTipoAcesso;
begin
  if Calculando then Exit;
  Calculando := True;
  try
    with Dados.CM do  begin
      TA := TiposAcesso.PorCodigo[TabTipoAcesso.Value];
      if TA <> nil then begin
        NumTicks := ObtemTempo(Now, TA.Codigo, TA.PHoraCor^, CorPrecos, GetSinal);
        edLimiteTempo.AsDateTime := TicksToDateTime(NumTicks);
        edPausaTempo.AsDateTime := edLimiteTempo.AsDateTime;
        edPausaHora.AsDateTime := Now + edLimiteTempo.AsDateTime;
      end;
    end;    
  finally
    Calculando := False;
  end;    
end;

procedure TFrmAcesso.edSinalPropertiesChange(Sender: TObject);
begin
  edSinal.PostEditValue;
end;

procedure TFrmAcesso.edLimiteTempoChange(Sender: TObject);
var 
  NumTicks: Cardinal;
  TA : TCMTipoAcesso;
  Credito, TempoCobrado : Cardinal;
  Valor : Double;
begin
  if Calculando then Exit;
  Calculando := True;
  try
    with Dados, CM do  begin
      TA := TiposAcesso.PorCodigo[TabTipoAcesso.Value];
      if TA <> nil then begin
          CalculaTempoValor(Now, 
                            DateTimeToTicks(edLimiteTempo.AsDateTime), 
                            0, TA.Codigo,
                            TA.PHoraCor^, CorPrecos, True,
                            nil, TempoCobrado, Credito, Valor);
        edSinal.EditValue := FloatToStr(Valor);
        edPausaTempo.AsDateTime := edLimiteTempo.AsDateTime;
        edPausaHora.AsDateTime := Now + edLimiteTempo.AsDateTime;
      end;
    end;    
  finally
    Calculando := False;
  end;  
end;

procedure TFrmAcesso.TabAfterEdit(DataSet: TDataSet);
begin
  FTipoAnt  := TabTipoAcesso.Value;
end;

procedure TFrmAcesso.InspCadEditButtonClick(Sender: TObject);
begin
  Dados.AjustaCampoLocalizaCli;
end;

procedure TFrmAcesso.cmManutencaoClick(Sender: TObject);
begin
  with Dados, CM do 
    ModoManutencao(TabMaquina.Value, True);
  Close;  
end;

procedure TFrmAcesso.InspCadCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  Accept := True;
  MostraDebito;
end;

procedure TFrmAcesso.InspDescontoPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daTraDesconto);
end;

procedure TFrmAcesso.MostraDebito;
begin
  if not Dados.tbCOnfigNaoMostrarMsgDebito.Value then 
  if (FMsgDebito<>TabContato.Value) and (TabDebitoCli.Value > 0.009) then begin
    Beep;
    ShowMessage('Cliente possui débito de ' + FloatToStrF(TabDebitoCli.Value, ffCurrency, 10, 2));
  end;
  FMsgDebito := TabContato.Value;
end;

procedure TFrmAcesso.cmReciboClick(Sender: TObject);
var
  Arq: TextFile;
  I : Integer;
  SL : TStrings;
begin
  AssignFile(Arq, 'prn');
  Rewrite(Arq);
  SL := TStringList.Create;
  with Dados do 
  try
    SL.Text := tbConfigCabecalhoImpRec.Value;
    for I := 0 to SL.Count-1 do 
      Writeln(Arq, SL.Strings[I]);
    Writeln(Arq, CharStr('-', tbConfigLargImpRec.Value));
    Writeln(Arq, ' DATA/HORA: ' + FormatDateTime('dd/mm/yyyy hh:mm', Now));
    Writeln(Arq);
    Writeln(Arq, ' RECIBO PARA SIMPLES CONFERENCIA');
    if TabNome.Value>'' then 
      Writeln(Arq, ' CLIENTE: ' + TabNome.Value);
      
    Writeln(Arq, CharStr('-', tbConfigLargImpRec.Value));
    Writeln(Arq, ' HORA DE INICIO : ' + FormatDateTime('hh:mm:ss', TabInicio.Value));
    Writeln(Arq, ' TEMPO DE ACESSO: ' + FormatDateTime('hh:mm:ss', TabTempo.Value));
    Write(Arq,   ' VALOR DO ACESSO: ');
    if TabCredUsado.Value > 0 then
      WriteLn(Arq, 'PRE-PAGO')
    else
      Writeln(Arq, ValorStr(TabValor.Value));
    Writeln(Arq, CharStr('-', tbConfigLargImpRec.Value));

    if TabProdutos.Value > 0 then begin
      Writeln(Arq, ' PRODUTOS / SERVICOS       QUANT   VL.TOTAL ');
      Writeln(Arq, CharStr('-', tbConfigLargImpRec.Value));
      mtItens.First;
      while not mtItens.Eof do begin
        if mtItensProduto.Value > '' then
          Writeln(Arq, Pad(Copy(mtItensNomePro.AsString, 1, 25), 27) +
                       LPad(mtItensQuant.AsString, 5) + 
                       LPad(ValorStr(mtItensTotal.Value), 11));
        mtItens.Next;             
      end;
      Writeln(Arq, CharStr('-', tbConfigLargImpRec.Value));
      Writeln(Arq, ' TOTAL PRODUTOS / SERVICOS ===== ' + LPad(ValorStr(TabProdutos.Value), 10));
      Writeln(Arq, CharStr('-', tbConfigLargImpRec.Value));
    end;
    
    if TabDesconto.Value > 0.009 then
      Writeln(Arq, ' DESCONTO ==== ' + ValorStr(TabDesconto.Value));
    Writeln(Arq,   ' TOTAL FINAL = ' + ValorStr(TabValorFinal.Value));
    Writeln(Arq, CharStr('-', tbConfigLargImpRec.Value));

    SL.Text := tbConfigRodapeImpRec.Value;
    for I := 0 to SL.Count-1 do 
      Writeln(Arq, SL.Strings[I]);
    
    for I := 1 to tbConfigSaltoImpRec.Value do Writeln(Arq);
  finally
    SL.Free;
    CloseFile(Arq);
  end;  
end;

procedure TFrmAcesso.InspCabItemChanged(Sender: TObject;
  AOldRow: TcxCustomRow; AOldCellIndex: Integer);
begin
  MostraDebito;
end;

procedure TFrmAcesso.InspCabExit(Sender: TObject);
begin
  MostraDebito;
end;

procedure TFrmAcesso.InspEnter(Sender: TObject);
begin
  Insp.FocusedRow := InspDesconto;
end;

procedure TFrmAcesso.TVSinalEditing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
var V : Variant;  
begin
  with Sender, DataController do 
  V := GetValue(FocusedRecordIndex, TVSinalCaixa.Index);
  AAllow := (V<>Null) and (NumAberto>0) and (V=NumAberto);
end;

procedure TFrmAcesso.TVProdFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if ANewItemRecordFocusingChanged then
    TVProd.Controller.FocusedItem := TVProdProduto;
end;

procedure TFrmAcesso.GridProdEnter(Sender: TObject);
begin
  TVProd.Controller.FocusedItem := TVProdProduto;
end;

procedure TFrmAcesso.TVProdMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if mtItens.State = dsInsert then mtItens.Post;
  if (Button = mbRight) and 
     (mtItens.RecordCount > 0) and
     (gridProd.ViewInfo.GetHitTest(X, Y) <> nil) then
  if MessageDlg('Apagar este item ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes    
    then mtItens.Delete
end;

procedure TFrmAcesso.TVProdUnitarioGetProperties(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not mtItensPodeAlterarPreco.Value;
end;

procedure TFrmAcesso.TVProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Del : 
    if ssCtrl in Shift then begin
      if mtItens.State in [dsEdit, dsInsert] then mtItens.Post;
      if mtItens.RecordCount > 0 then
        mtItens.Delete;
      Key := 0;  
    end;  

    Key_Up :
    if TVProd.Controller.FocusedRowIndex=0 then 
      Key := 0;
    
    Key_Enter : 
    if TVProd.Controller.FocusedColumn = TVProdQuant then
    if SalvarItem then begin
      if mtItens.State in [dsEdit, dsInsert] then mtItens.Post;
      if (TVProd.DataController.FocusedRecordIndex+1) = mtItens.RecordCount then
        mtItens.Append;
    end else
    if (mtItens.RecordCount > 1) and (ItemAtual=mtItens.RecordCount)
    then begin
      mtItens.Cancel;
      mtItens.Delete;
//      Insp.SetFocus;
      Key := 0;
    end;  
  end;  
end;

procedure TFrmAcesso.TVProdCustomDrawFooterCell(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
begin
  ACanvas.Font.Style := [fsBold];
end;

procedure TFrmAcesso.InspCabCliCadEditPropertiesCloseUp(Sender: TObject);
begin
  if not (Tab.State  in [dsEdit, dsInsert]) then
    Tab.Edit;
    
  TabContato.Value := FDadosCli.dcCodigo;
  TcxCustomDropDownEdit(Sender).Text := FDadosCli.dcNome;
end;

procedure TFrmAcesso.InspCabCliCadEditPropertiesInitPopup(Sender: TObject);
begin
  FDadosCli.dcCodigo := TabContato.Value;
  FDadosCli.dcNome   := TabNomeContato.Value;
  fbPesqCli.PreparaBusca(@FDadosCli, TcxCustomDropDownEdit(Sender));
end;

procedure TFrmAcesso.cmNovoItemClick(Sender: TObject);
begin
  mtItens.Append;
end;

procedure TFrmAcesso.cmRemoverItemClick(Sender: TObject);
begin
  mtItens.Delete;
end;

procedure TFrmAcesso.InspCabAvulsoEditPropertiesEditValueChanged(
  Sender: TObject);
begin
{  TabContato.Clear;
  TabNomeContato.Clear;
  FDadosCli.dcCodigo := 0;
  FDadosCli.dcNome := '';
  RefreshFoto;}
end;

procedure TFrmAcesso.InspCabCliCadEditors0EditPropertiesInitPopup(
  Sender: TObject);
begin
  Dados.tbCli.IndexName := 'ICodigo';
end;

procedure TFrmAcesso.InspCabCliCadEditors0GetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := (not FIniciar) and (not Permitido(daTrocarClienteAcesso));
end;

procedure TFrmAcesso.InspCabCliCadEditors1EditPropertiesInitPopup(
  Sender: TObject);
begin
  Dados.tbCli.IndexName := 'IUsername';
end;

procedure TFrmAcesso.InspCabCliCadEditors2EditPropertiesCloseUp(
  Sender: TObject);
begin
  RefreshFoto;
  MostraDebito;
  if FIniciar and (TabTipoAcessoPref.Value >= 0) then
    TabTipoAcesso.Value := TabTipoAcessoPref.Value;
end;

procedure TFrmAcesso.InspCabCliCadEditors2EditPropertiesInitPopup(
  Sender: TObject);
begin
  Dados.tbCli.IndexName := 'INome';
end;

end.

                                                                 
