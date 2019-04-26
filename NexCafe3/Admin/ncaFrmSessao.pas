unit ncaFrmSessao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxCurrencyEdit, cxRadioGroup,
  cxCalendar, cxTimeEdit, cxDBLookupComboBox, cxMemo, cxDropDownEdit,
  cxTextEdit, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxMaskEdit, dxBar, dxBarExtItems, ExtCtrls, cxDBVGrid, cxVGrid,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer, cxLabel,
  Buttons, PngSpeedButton, cxInplaceContainer, cxPC, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  StdCtrls, kbmMemTable, ncaDM,
  ncafbPesqCli, 
  ncClassesBase, 
  ncSessao, 
  ncTarifador,
  ncTran,
  ncMovEst,
  ncTempo, LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  cxCheckBox;

type
  TFrmSessao = class(TForm)
    Edit1: TEdit;
    bdcAcesso: TdxBarDockControl;
    panDiv1: TLMDSimplePanel;
    LMDLabel1: TLMDLabel;
    PagPri: TcxPageControl;
    tsPagNormal: TcxTabSheet;
    panDiv2: TLMDSimplePanel;
    lbNumM: TLMDLabel;
    panTot2: TLMDSimplePanel;
    vgT: TcxVerticalGrid;
    vgTDesc: TcxEditorRow;
    vgTTotalFinal: TcxEditorRow;
    vgTPago: TcxEditorRow;
    vgTValorPago: TcxEditorRow;
    panDiv4: TLMDSimplePanel;
    panTran: TLMDSimplePanel;
    btnEditar: TPngSpeedButton;
    btnTempo: TPngSpeedButton;
    btnCancelar: TPngSpeedButton;
    btnProd: TPngSpeedButton;
    LMDSimplePanel7: TLMDSimplePanel;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVHora: TcxGridDBColumn;
    TVDescr: TcxGridDBColumn;
    TVValorFinal: TcxGridDBColumn;
    TVPago: TcxGridDBColumn;
    TVPagar: TcxGridDBColumn;
    GL: TcxGridLevel;
    tsPagManut: TcxTabSheet;
    InspM: TcxDBVerticalGrid;
    InspMData: TcxDBEditorRow;
    InspMInicio: TcxDBEditorRow;
    InspMFim: TcxDBEditorRow;
    InspMTempo: TcxDBEditorRow;
    InspMNomeFuncI: TcxDBEditorRow;
    InspMNomeFuncF: TcxDBEditorRow;
    InspMObs: TcxDBEditorRow;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDLabel3: TLMDLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDLabel2: TLMDLabel;
    vgH: TcxDBVerticalGrid;
    vgHTipoAcesso: TcxDBEditorRow;
    vgHCliCad: TcxDBEditorRow;
    vgHAvulso: TcxDBEditorRow;
    vgHDebitoCli: TcxDBEditorRow;
    vgHObs: TcxDBEditorRow;
    panH1: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    BarMgr: TdxBarManager;
    cmFuncFim: TdxBarStatic;
    cmData: TdxBarStatic;
    cmPagamento: TdxBarStatic;
    cmFuncInicio: TdxBarStatic;
    cmNumM: TdxBarControlContainerItem;
    cmMaquina: TdxBarStatic;
    cmGravar: TdxBarLargeButton;
    cmNovoSinal: TdxBarButton;
    cmTituloSinal: TdxBarStatic;
    cmCancelar: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    cmNovoItem: TdxBarButton;
    cmRemoverItem: TdxBarButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle12: TcxStyle;
    MT: TkbmMemTable;
    MTCliente: TIntegerField;
    MTNomeCliente: TStringField;
    MTNomeAvulso: TStringField;
    MTObs: TStringField;
    MTDebito: TCurrencyField;
    MTTipoAcesso: TIntegerField;
    MTNomeTipoAcesso: TStringField;
    dsMT: TDataSource;
    mtTran: TkbmMemTable;
    mtTranID: TIntegerField;
    mtTranDataHora: TDateTimeField;
    mtTranTipo: TIntegerField;
    mtTranDescr: TStringField;
    mtTranTotal: TCurrencyField;
    mtTranPago: TCurrencyField;
    mtTranSaldo: TCurrencyField;
    mtTranNomeTipo: TStringField;
    dsTran: TDataSource;
    mtTranObjTran: TIntegerField;
    mtTranObjItem: TIntegerField;
    TVTipo: TcxGridDBColumn;
    mtTranDesconto: TCurrencyField;
    mtTranFunc: TStringField;
    mtTranCancelado: TBooleanField;
    mtTranTotalF: TCurrencyField;
    mtTranCanceladoPor: TStringField;
    mtTranCanceladoEm: TDateTimeField;
    TVID: TcxGridDBColumn;
    Timer1: TTimer;
    btnFunc: TLMDSpeedButton;
    btnAvulso: TLMDSpeedButton;
    btnCad: TLMDSpeedButton;
    LMDSimplePanel3: TLMDSimplePanel;
    TVCancelado: TcxGridDBColumn;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    btmImp: TPngSpeedButton;
    cmRecibo: TdxBarControlContainerItem;
    cbRecibo: TcxCheckBox;
    cmListaEspera: TdxBarLargeButton;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure vgHCliCadEditPropertiesCloseUp(Sender: TObject);
    procedure vgHCliCadEditPropertiesInitPopup(Sender: TObject);
    procedure mtTranCalcFields(DataSet: TDataSet);
    procedure TVValorFinalGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure btnTempoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TVCustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure btnCadClick(Sender: TObject);
    procedure vgTDescEditPropertiesEditValueChanged(Sender: TObject);
    procedure vgTPagoEditPropertiesEditValueChanged(Sender: TObject);
    procedure btnFuncMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnAvulsoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TVDataControllerSummaryFooterSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
    procedure TVStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      out AStyle: TcxStyle);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnProdClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btmImpClick(Sender: TObject);
    procedure cbListaEsperaClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure vgTDescPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure vgHTipoAcessoPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure cmMaquinaClick(Sender: TObject);
  private
    FDadosCli : TDadosCliente;
    FMsgDebito : Integer;
    FIniciar   : Boolean;
    FGravou    : Boolean;
    FSalvando  : Boolean;
    FSessao    : TncSessao;
    FTipoCli   : Integer;
    FEspCli    : Integer;
    FEspNome   : String;
    FEspCartao : String;
    FShowed    : Boolean;
    FCliAnt    : Integer;
    FDebAnt    : Currency;
    
    { Private declarations }
    procedure MostraDebito(aShowDlg: Boolean = True);
    procedure LeTran;
    procedure RefreshTotais;
    procedure SetTipoCli(const Value: Integer);

    function GetIMEDescr(IME: TncItemMovEst): String;

    procedure Biometria(var Msg: TMessage);
      message wm_biometria;
    
  public
    { Public declarations }
    function Iniciar(const aMaq: Word): TncSessao;
    function Editar(aSessao: TncSessao): Boolean;
    property TipoCli: Integer
      read FTipoCli write SetTipoCli;
  end;

var
  FrmSessao: TFrmSessao;

implementation

uses ncaFrmPri, ncIDRecursos, ufmImagens, ncCredTempo, ncaFrmTempo,
  ncImpressao, ncaFrmVendaProd, ncaFrmImp, ncDMServ;

{$R *.dfm}

const
  cliCad    = 0;
  cliAvulso = 1;
  cliFunc   = 2;

procedure TFrmSessao.Biometria(var Msg: TMessage);
begin
  if Dados.tbCli.Locate('ID', Msg.WPARAM, []) then begin
    FDadosCli.dcCodigo := Dados.tbCliID.Value;
    FDadosCli.dcNome := Dados.tbCliNome.Value;
    MTCliente.Value := FDadosCli.dcCodigo;
    btnCad.Down := True;
    TipoCli := cliCad;
    vgHObs.Focused := True;
    MostraDebito;
    vgH.Refresh;
  end;
end;

procedure TFrmSessao.btmImpClick(Sender: TObject);
var 
  Imp, nImp: TncImpressao;
  Tran : TncTransacao;
begin
  inherited;
  Imp := TncImpressao.Create;
  try
    Imp.impManual := True;
    Imp.impSessao := FSessao.ID;
    Imp._Operacao := osIncluir;
    Imp.impID := -1;
    Imp.impMaquina := FSessao.Maq;
    Imp.impCliente := FSessao.Cliente;
    if TFrmImp.Create(nil).Editar(True, True, Imp) then begin
      nImp := FSessao.Impressoes.NewItem;
      nImp.AssignFrom(Imp);
      mtTran.Append;
      mtTranDataHora.Value := Now;
      mtTranTotal.Value := Imp.Total;
      mtTranDesconto.Value := Imp.impDesconto;
      mtTranPago.Value := Imp.impPago;
      mtTranTipo.Value := trImpressao;
      mtTranFunc.Value := Dados.CM.Username;
      mtTranDescr.Value := 'Impressão ' + IntToStr(Imp.TotQuant) + ' Página(s)';
      mtTranID.Value := High(Integer);
      Tran := FSessao.Transacoes.NewTran;
      Tran.LoadFromDataset(mtTran);
      mtTranObjTran.Value := Integer(Tran);
      mtTranObjItem.Value := Integer(nImp);
      mtTran.Post;
      RefreshTotais;
    end;
  finally
    Imp.Free;
  end;
end;

procedure TFrmSessao.btnAvulsoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then begin
    TipoCli := cliAvulso;
    btnAvulso.Down := True;
    cmGravarClick(nil);
  end;
end;

procedure TFrmSessao.btnCadClick(Sender: TObject);
begin
  TipoCli := TControl(Sender).Tag;
  MostraDebito;
end;

procedure TFrmSessao.btnCancelarClick(Sender: TObject);
begin
  if mtTran.IsEmpty then Exit;
  if mtTranCancelado.Value then Exit;
  if not (mtTranTipo.Value in [trImpressao, trCredTempo, trEstVenda]) then Exit;
  if not SimNaoH('Deseja realmente cancelar a transação selecionada?', Handle) then Exit;

  if mtTranID.Value=High(Integer) then begin
    case mtTranTipo.Value of
      trCredTempo : FSessao.Tempos.Remove(TncCredTempo(mtTranObjItem.Value));
      trImpressao : FSessao.Impressoes.Remove(TncImpressao(mtTranObjItem.Value));
      trEstVenda  : FSessao.Vendas.Remove(TncItemMovEst(mtTranObjItem.Value));
    end;
    TObject(mtTranObjItem.Value).Free;
    FSessao.Transacoes.Remove(TncTransacao(mtTranObjTran.Value));
    TObject(mtTranObjTran.Value).Free;
    mtTran.Delete;
  end else begin
    case mtTranTipo.Value of
      trCredTempo : begin
        TncCredTempo(mtTranObjItem.Value).teCancelado := True;
        TncCredTempo(mtTranObjItem.Value)._Operacao := osCancelar;
      end;
      trImpressao : begin
        TncImpressao(mtTranObjItem.Value).impCancelado := True;
        TncImpressao(mtTranObjItem.Value)._Operacao := osCancelar;
      end;
      trEstVenda  : begin
        TncItemMovEst(mtTranObjItem.Value).imCancelado := True;
        TncItemMovEst(mtTranObjItem.Value)._Operacao := osCancelar;
      end;
    end;
    TncTransacao(mtTranObjTran.Value).trCancelado := True;
    mtTran.Edit;
    mtTranCancelado.Value := True;
    mtTran.Post;
  end;
end;

procedure TFrmSessao.btnEditarClick(Sender: TObject);
var 
  Tran : TncTransacao;
  DT : TDadosTempo;
  CT : TncCredTempo;
  IME : TncItemMovEst;
  Imp : TncImpressao;
begin
  if mtTran.RecordCount=0 then Exit;
  if not (mtTranTipo.Value in [trEstVenda, trCredTempo, trImpressao])  then Exit;
  Tran := TncTransacao(mtTranObjTran.Value);
  case mtTranTipo.Value of
    trEstVenda  : begin
      IME := TncItemMovEst.Create;
      try
        IME.AssignFrom(TncItemMovEst(mtTranObjItem.Value));
        if TFrmVendaProd.Create(nil).Editar(IME, False, True, (not IME.imCancelado) and ((IME.imCaixa=NumAberto) or (IME.imID=-1))) then begin
          TncItemMovEst(mtTranObjItem.Value).AssignFrom(IME);
          Tran.trTotal    := IME.imTotal;
          Tran.trDesconto := IME.imDesconto;
          Tran.trPago     := IME.imPago;
          Tran.trDescr    := GetIMEDescr(IME);
        end;
      finally
        IME.Free;
      end;
    end;
    
    trCredTempo : begin
      CT := TncCredTempo(mtTranObjItem.Value);
      DT.LoadFromCredTempo(CT);
      if TFrmTempo.Create(nil).Editar(False, (not CT.teCancelado) and ((CT.teCaixa=NumAberto) or (CT.teID=-1)), @DT, CT.teTran) 
      then begin
        DT.SaveToCredTempo(CT);
        Tran.trTotal    := CT.teTotal;
        Tran.trDesconto := CT.teDesconto;
        Tran.trPago     := CT.tePago;
      end;
    end;
    
    trImpressao : begin
      Imp := TncImpressao.Create;
      try
        Imp.AssignFrom(TncImpressao(mtTranObjItem.Value));
        if TFrmImp.Create(nil).Editar(False, (NumAberto=Imp.impCaixa) or (Imp.impID=-1), Imp) then
        begin
          TncImpressao(mtTranObjItem.Value).AssignFrom(Imp);
          Tran.trTotal := Imp.Total;
          Tran.trDesconto := Imp.impDesconto;
          Tran.trPago     := Imp.impPago;
        end;
      finally
        Imp.Free;
      end;
    end;  
  end;
  mtTran.Edit;
  mtTranTotal.Value := Tran.trTotal;
  mtTranDesconto.Value := Tran.trDesconto;
  mtTranPago.Value := Tran.trPago;
  mtTranDescr.Value := Tran.trDescr;
  mtTran.Post;
  RefreshTotais;
end;

procedure TFrmSessao.cbListaEsperaClick(Sender: TObject);
begin
  panH1.Enabled := not cmListaEspera.Down;
  vgH.HideEdit;
  vgHCliCad.Properties.Options.Editing := not cmListaEspera.Down;
  vgHAvulso.Properties.Options.Editing := not cmListaEspera.Down;
  if cmListaEspera.Down then begin
    if not (MT.State in [dsEdit, dsInsert]) then
      MT.Edit;
    MTCliente.Value := FEspCli;
    MTNomeAvulso.Value := FEspNome;
    FSessao.Cliente := FEspCli;

    if FEspCli>0 then begin
      btnCad.Down := True;
      vgHCliCad.Visible := True;
      vgHAvulso.Visible := False;
    end else begin
      btnAvulso.Down := True;
      vgHCliCad.Visible := False;
      vgHAvulso.Visible := True;
    end;
  end;
end;

procedure TFrmSessao.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSessao.cmGravarClick(Sender: TObject);
var Debitar : Currency;
  TemCred : Boolean;
begin
  FSalvando := True;
  try
    if vgT.IsEditing then
    vgT.InplaceEditor.PostEditValue;
    vgH.DataController.PostEditingData;
    vgH.DataController.Post;
    if MT.State in [dsEdit, dsInsert] then MT.Post;
    FSessao.Obs := MTObs.Value;
    if FIniciar then begin
      if btnCad.Down and (MTCliente.Value=0) then begin
        Beep; 
        Timer1.Enabled := True;
        Exit;
      end;

      FSessao.TipoAcesso := MTTipoAcesso.Value;
      if btnAvulso.Down then 
        FSessao.NomeCliente := MTNomeAvulso.Value;
      if TipoCli=cliFunc then 
        FSessao.TipoCli := tcManutencao;
      FSessao.FuncI := Dados.CM.Username;

      if cmListaEspera.Visible=ivAlways then
      if (not cmListaEspera.Down) and 
         ((FEspCli<>FSessao.Cliente) or (FEspNome<>FSessao.NomeCliente)) then
        FSessao.IDListaEspera := -1;
    end else begin
      FSessao.Cliente := FDadosCli.dcCodigo;
      if btnAvulso.Down then
        FSessao.NomeCliente := MTNomeAvulso.Value else
        FSessao.NomeCliente := FDadosCli.dcNome;
      if FSessao.Encerrou  then begin
        RefreshTotais;
        FSessao.Recibo := cbRecibo.Checked;
        if (vgTDesc.Properties.Value - FSessao.TotalGeral)  > 0.001 then
          Raise Exception.Create('Desconto não pode ser maior que o total');
        FSessao.DescTran := vgTDesc.Properties.Value;
        FSessao.PagoTran := vgTValorPago.Properties.Value;
        Debitar := FSessao.TotalGeral - FSessao.DescTran - FSessao.PagoTran;
        
        with Dados do
        if (Debitar>0.009) then begin 
          if FCliAnt<>FSessao.Cliente then FDebAnt := 0;
          Debitar := Debitar - FDebAnt;
          if (FSessao.Cliente=0) then
            Raise Exception.Create('É necessário que tenha um cadastro para poder deixar débito');
          if Debitar > 0.009 then begin
            tbCli.Locate('ID', FSessao.Cliente, []);
            if LimiteDebito(tbCliLimiteDebito)<(Debitar+tbCliDebito.Value) then
              Raise Exception.Create('O limite máximo de débito permitido para esse cliente foi ultrapassado');
          end;
        end;
      end;
    end;
  
    FGravou := True;
    Close;
  finally
    FSalvando := False;
  end;
end;

procedure TFrmSessao.cmMaquinaClick(Sender: TObject);
begin
  PostMessage(Handle, wm_biometria, 0, 0);
end;

function TFrmSessao.Editar(aSessao: TncSessao): Boolean;
begin
  Caption := 'Editar Sessão';
  FSessao := aSessao;
  MTObs.Value := FSessao.Obs;
  MTTipoAcesso.Value := FSessao.TipoAcesso;
  if FSessao.TipoCli=tcManutencao then
    TipoCli := cliFunc
  else
  if FSessao.Cliente>0 then 
    TipoCli := cliCad else
    TipoCli := cliAvulso;

  with Dados.CM.Config do begin
    if FSessao.Encerrou and (RecImprimir>0) then
      cmRecibo.Visible := ivAlways else
      cmRecibo.Visible := ivNever;

    cbRecibo.Checked := aSessao.Encerrou and (RecImprimir=2);  
  end;

  case TipoCli of
    cliCad : begin
      MTCliente.Value := FSessao.Cliente;
      MTNomeCliente.Value := FSessao.NomeCliente;
      btnCad.Down := True;
      FDadosCli.dcCodigo := FSessao.Cliente;
      FDadosCli.dcNome   := FSessao.NomeCliente;
    end;
    cliAvulso : begin
      FDadosCli.dcCodigo := 0;
      FDadosCli.dcNome := FSessao.NomeCliente;
      MTNomeAvulso.Value := FSessao.NomeCliente;
      btnAvulso.Down := True;
    end;
    cliFunc : begin
      FDadosCli.dcCodigo := 0;
      FDadosCli.dcNome := '';
      MTNomeAvulso.Value := FSessao.FuncI;
      btnFunc.Down := True;
    end;
  end;
  FIniciar := False;
  LeTran;
  if FSessao.Encerrou then begin
    vgTDesc.Properties.Value := FSessao.DescTran;
    if FSessao.TranF=0 then begin
      RefreshTotais;
      vgTPago.Properties.Value := Dados.CM.Config.PgAcesso;
      if vgTPago.Properties.Value then
        vgTValorPago.Properties.Value := vgTTotalFinal.Properties.Value else
        vgTValorPago.Properties.Value := 0;
    end else begin
      vgTValorPago.Properties.Value := FSessao.PagoTran;
      vgTPago.Properties.Value := ((FSessao.TotalGeral - FSessao.DescTran - FSessao.PagoTran)<0.01);
    end;
  end;
  RefreshTotais;

  ShowModal;
  Result := FGravou;
end;

procedure TFrmSessao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    vgH.HideEdit;
    TcxPopupEditProperties(vgHCliCad.Properties.EditProperties).PopupControl := nil;
    if Assigned(fbPesqCli) then
      fbPesqCli.Parent := nil;
  except
  end;
  Action := caFree;
end;

procedure TFrmSessao.FormCreate(Sender: TObject);
begin
  FTipoCli := -1;
  FShowed := False;
  FSalvando := False;
  mtTran.Open;
  MT.Open;
  MT.Insert;
  if gTiposAcesso.Count>0 then
    MTTipoAcesso.Value := gTiposAcesso.Itens[0].ID else
    MTTipoAcesso.Value := 0;
  MT.Post;
  MT.Edit;
  FDadosCli.dcCodigo := 0;
  FDadosCli.dcNome := '';
  FMsgDebito := -1;
  FCliAnt    := 0;
  FDebAnt    := 0;
end;

procedure TFrmSessao.FormShow(Sender: TObject);
begin
  if (Screen.Width=640) or (Screen.Width=800) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);

  if not Permitido(daIniciarSessaoCliCad) then
    btnCad.Enabled := False;
   

  FCliAnt := FSessao.Cliente;
  FDebAnt := vgTTotalFinal.Properties.Value - vgTValorPago.Properties.Value;

  MostraDebito(False);

  FShowed := True;
  lbNumM.Caption := IntToStr(FSessao.Maq);
  btnCancelar.Enabled := (not FSessao.Encerrou) and Permitido(daTraCancelar);
  vgHTipoAcesso.Visible := (Dados.tbTipoAcesso.RecordCount>1);
  vgHTipoAcesso.Options.Focusing := Permitido(daAlterarTipoAcesso);
{  if FSessao.TipoCli <> tcManutencao then begin
     vgH.SetFocus;
     vgH.FocusedRow := vgHObs;
     if btnCad.Down then begin
       vgHCliCad.Visible := True;
       vgHAvulso.Visible := False;
       vgH.FocusedRow := vgHCliCad;
     end else begin
       vgHCliCad.Visible := False;
       vgHAvulso.Visible := True;
       vgH.FocusedRow := vgHAvulso;
     end;
     Edit1.SetFocus;
     vgH.SetFocus;  
  end;}

  btnCad.Enabled := FIniciar or ( FSessao.TipoCli<>tcManutencao);
  btnAvulso.Enabled := btnCad.Enabled;
  btnFunc.Enabled := FIniciar;
  if not Permitido(daIniciarSessaoCliCad) then
    btnCad.Enabled := False;
    
  panTot2.Visible := FSessao.Encerrou;
  RefreshTotais;

  if FIniciar and (not cmListaEspera.Down) and vgHCliCad.Visible then begin
    vgH.SetFocus;
    vgH.FocusedRow := vgHObs;
    vgH.FocusedRow := vgHCliCad;
    vgH.ShowEdit;
    Timer2.Enabled := True;
  end;

  if panTot2.Visible then begin
    vgT.SetFocus;
    vgT.FocusedRow := vgTPago;
    vgT.FocusedRow := vgTDesc;
    vgT.ShowEdit;
  end;
end;

function TFrmSessao.Iniciar(const aMaq: Word): TncSessao;
var M: TncMaquina;
begin
  Caption := 'Iniciar Sessão';
  btnFunc.Enabled := Permitido(daMaqModoManutencao);
  cmGravar.Caption := '&Iniciar';
  cmGravar.LargeImageIndex := 55;
  FSessao := TncSessao.Create(True);
  FSessao.ID := High(Cardinal);
  FSessao.Maq := aMaq;
  FSessao.TipoCli := tcNormal;
  M := Dados.CM.Maquinas.PorNumero[aMaq];
  if (M<>nil) and (M.TipoAcesso<>-1) then begin
    FSessao.TipoAcesso := M.TipoAcesso;
    MTTipoAcesso.Value := M.TipoAcesso;
  end;
  
  Result  := nil;
  panTot2.Visible := False;
  FIniciar := True;
  FGravou := False;
  
  if Dados.CM.Config.CliCadPadrao then
    TipoCli := cliCad else
    TipoCli := cliAvulso;

  if vgHAvulso.Visible then
    btnAvulso.Down := True else
    btnCad.Down := True;

  if DM.tEsp.Locate('PrevMaq; PrevSessao', VarArrayOf([aMaq, 0]), []) then
  begin
    FSessao.IDListaEspera := DM.tEspID.Value;
    FEspCli := DM.tEspCliente.Value;
    FEspNome := DM.tEspNomeCliente.Value;
    FEspCartao := DM.tEspCartao.Value;
    cmListaEspera.Visible := ivAlways;
    cmListaEspera.Down := True;
    cbListaEsperaClick(nil);
  end else begin
    FEspCli := 0;
    FEspNome := '';
    FEspCartao := '';
  end;

  ShowModal;
  if FGravou then 
    Result := FSessao else
    FSessao.Free;
end;

procedure TFrmSessao.LeTran;
var 
  I : Integer;
  Fim: Boolean;
begin
  Fim := False;
  for I := 0 to FSessao.Transacoes.Count-1 do begin
    mtTran.Insert;
    FSessao.Transacoes[I].SaveToDataset(mtTran);
    mtTranObjTran.Value := Integer(FSessao.Transacoes[I]);

    case mtTranTipo.Value of
      trEstVenda  : mtTranObjItem.Value := Integer(FSessao.Vendas.GetItemByTran(mtTranID.Value));
      trImpressao : mtTranObjItem.Value := Integer(FSessao.Impressoes.GetItemByTran(mtTranID.Value));
      trCredTempo : mtTranObjItem.Value := Integer(FSessao.Tempos.GetItemByTran(mtTranID.Value));
    end;
    
    if mtTranTipo.Value=trFimSessao then begin
      Fim := True;
      FSessao.DescTran := mtTranDesconto.Value;
      FSessao.PagoTran := mtTranPago.Value;
      mtTranDesconto.Value := 0;
      mtTranTotal.Value := FSessao.Total;
      mtTranPago.Value := 0;
    end;
    mtTran.Post;
  end;
  if FSessao.Encerrou and (not Fim) then begin
    mtTran.Append;
    mtTranID.Value := High(Integer);
    mtTranDataHora.Value := FSessao.Termino;
    mtTranTipo.Value := trFimSessao;
    mtTranTotal.Value := FSessao.Total;
    mtTranDesconto.Value := FSessao.Desconto;
    mtTranDescr.Value := 'Duração: '+MinutosToHMSStr(FSessao.TempoUsado.Minutos);
    mtTranPago.Value := 0;
    mtTran.Post;
  end;
end;

procedure TFrmSessao.vgHCliCadEditPropertiesCloseUp(Sender: TObject);
begin
  if MT.State<>dsEdit then MT.Edit;
  mtCliente.Value := FDadosCli.dcCodigo;
  FSessao.Cliente := mtCliente.Value;
  FSessao.NomeCliente := mtNomeCliente.Value;
  TcxCustomDropDownEdit(Sender).Text := FDadosCli.dcNome;
  MostraDebito;
//  TcxPopupEdit(Sender).Properties.PopupControl := nil;
end;

procedure TFrmSessao.vgHCliCadEditPropertiesInitPopup(Sender: TObject);
begin
  if FSalvando then Exit;
  
  TcxPopupEdit(Sender).Properties.PopupControl := fbPesqCli;
  FDadosCli.dcCodigo := mtCliente.Value;
  FDadosCli.dcNome   := mtNomeCliente.Value;
  fbPesqCli.PreparaBusca(@FDadosCli, TcxCustomDropDownEdit(Sender));
end;

procedure TFrmSessao.vgHTipoAcessoPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daAlterarTipoAcesso);
end;

procedure TFrmSessao.vgTDescEditPropertiesEditValueChanged(Sender: TObject);
begin
  RefreshTotais;
end;

procedure TFrmSessao.vgTDescPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daTraDesconto);
end;

procedure TFrmSessao.vgTPagoEditPropertiesEditValueChanged(Sender: TObject);
begin
  if vgTPago.Properties.Value then
    vgTValorPago.Properties.Value := vgTTotalFinal.Properties.Value else
    vgTValorPago.Properties.Value := 0;
  RefreshTotais;
end;

procedure TFrmSessao.MostraDebito(aShowDlg: Boolean = True);
begin
  if gConfig.NaoMostrarMsgDebito then Exit;
  vgHDebitoCli.Visible := (mtDebito.Value > 0.009) and (TipoCli=cliCad);
  if (not vgHDebitoCli.Visible) and (vgHDebitoCli.Focused) then
    vgT.SetFocus;
    
  if aShowDlg and (FMsgDebito<>mtCliente.Value) and (mtDebito.Value > 0.009) and (TipoCli=cliCad) then begin
    Beep;
    ShowMessage('Cliente possui débito de ' + FloatToStrF(mtDebito.Value, ffCurrency, 10, 2));
  end;
  FMsgDebito := mtCliente.Value;
end;

procedure TFrmSessao.mtTranCalcFields(DataSet: TDataSet);
begin
  if mtTranTipo.Value in [trInicioSessao..trTransfMaq]  then
    mtTranNomeTipo.Value := AbrevTipoTransacao[mtTranTipo.Value] else
    mtTranNomeTipo.Value := '';
    
  mTTranTotalF.Value := mtTranTotal.Value - mtTranDesconto.Value;
  mtTranSaldo.Value := mtTranTotalF.Value - mtTranPago.Value;
end;

procedure TFrmSessao.btnFuncMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then begin
    TipoCli := cliFunc;
    btnFunc.Down := True;
    cmGravarClick(nil);
  end;
end;

function TFrmSessao.GetIMEDescr(IME: TncItemMovEst): String;
var V: Variant;
begin
  V := Dados.tbPro.Lookup('ID', IME.imProduto, 'Descricao');
  if V<>null then
    Result := FloatToStr(IME.imQuant) + ' - ' + V else
    Result := '';
end;

procedure TFrmSessao.btnProdClick(Sender: TObject);
var 
  IME, NewI: TncItemMovEst;
  Tran : TncTransacao;
begin
  IME := TncItemMovEst.Create;
  try
    IME.imTipoTran := trEstVenda;
    if not TFrmVendaProd.Create(nil).Editar(IME, True, True, True) then Exit;
    NewI := FSessao.Vendas.NewItem;
    NewI.AssignFrom(IME);

    mtTran.Append;
    mtTranDataHora.Value := Now;
    mtTranTotal.Value := IME.imTotal;
    mtTranDesconto.Value := IME.imDesconto;
    mtTranPago.Value := IME.imPago;
    mtTranTipo.Value := trEstVenda;
    mtTranFunc.Value := Dados.CM.Username;
    mtTranDescr.Value := GetIMEDescr(IME);
    
    mtTranID.Value := High(Integer);
    Tran := FSessao.Transacoes.NewTran;
    Tran.LoadFromDataset(mtTran);
    mtTranObjTran.Value := Integer(Tran);
    mtTranObjItem.Value := Integer(NewI);
    mtTran.Post;
    RefreshTotais;
  finally
    IME.Free;
  end;
end;

procedure TFrmSessao.btnTempoClick(Sender: TObject);
var
  DT: TDadosTempo;  
  CT: TncCredTempo;
  Tran : TncTransacao;
begin
  inherited;
  DT.Limpa;
  DT.dtMaq := FSessao.Maq;
  DT.dtDadosCli.dcCodigo := FSessao.Cliente;
  DT.dtDadosCli.dcNome := FSessao.NomeCliente;
  DT.dtTipoAcesso := MTTipoAcesso.Value;
  if TFrmTempo.Create(Self).Editar(True, True, @DT, 0, False, FSessao.MinutosTotCredTempo, FSessao.ValorTotCredTempo) then begin
    CT := FSessao.Tempos.NewItem;
    DT.SaveToCredTempo(CT);
    CT.teSessao := FSessao.ID;
    CT._Operacao := osIncluir;
    CT.teID := -1;

    mtTran.Append;
    mtTranDataHora.Value := Now;
    mtTranTotal.Value := CT.teTotal;
    mtTranDesconto.Value := CT.teDesconto;
    mtTranPago.Value := CT.tePago;
    mtTranTipo.Value := trCredTempo;
    mtTranFunc.Value := Dados.CM.Username;
    with mtTranDescr do 
    case CT.teTipo of
      tctPrevisao  : Value := 'Tempo previsto = ' + MinutosToHMSStr(CT.teMinutos);
      tctAvulso,
      tctPacote    : Value := 'Tempo = ' + MinutosToHMSStr(CT.teMinutos);
      tctPassaporte: Value := DT.dtNomePass; 
    end;
    mtTranID.Value := High(Integer);
    Tran := FSessao.Transacoes.NewTran;
    Tran.LoadFromDataset(mtTran);
    mtTranObjTran.Value := Integer(Tran);
    mtTranObjItem.Value := Integer(CT);
    mtTran.Post;
    RefreshTotais;
  end;
end;

procedure TFrmSessao.RefreshTotais;
begin
  vgTTotalFinal.Properties.Value := FSessao.TotalGeral - vgTDesc.Properties.Value;
  if vgTTotalFinal.Properties.Value < 0 then begin
    vgTDesc.Properties.Value := FSessao.TotalGeral;
    vgTTotalFinal.Properties.Value := 0;
  end;
  if vgTPago.Properties.Value then
    vgTValorPago.Properties.Value := vgTTotalFinal.Properties.Value 
  else
  if vgTValorPago.Properties.Value = vgTTotalFinal.Properties.Value then begin
     vgTValorPago.Properties.Value := vgTTotalFinal.Properties.Value;
     vgTPago.Properties.Value := True;
  end;
end;

procedure TFrmSessao.SetTipoCli(const Value: Integer);
begin
  if Value=FTipoCli then Exit;
  if MT.State<>dsEdit then
    MT.Edit;
  FTipoCli := Value;
  btnTempo.Enabled := (not FSessao.Encerrou) and (TipoCli<>cliFunc);
  btnProd.Enabled  := (TipoCli<>cliFunc);
  if FTipoCli=cliCad then begin
    vgHObs.Focused := True;
    vgHAvulso.Visible := False;
    vgHCliCad.Visible := True;
    vgHCliCad.Focused := True;  
    if FShowed and not vgH.Focused then
      vgH.SetFocus;
    FSessao.TipoCli := tcNormal;      
    if FShowed then Timer2.Enabled := True;
  end else begin
    vgHCliCad.Visible := False;
    vgHAvulso.Visible := True;
    MTCliente.Clear;
    MTNomeAvulso.Clear;
    MTNomeCliente.Clear;
    FDadosCli.dcCodigo := 0;
    FDadosCli.dcNome := '';
    FSessao.Cliente := 0;
    vgH.FocusedRow := vgHObs;
    if FTipoCli=cliFunc then begin
      vgHAvulso.Properties.Caption := 'Funcionário';
      MTNomeAvulso.Value := Dados.CM.Username;
      TcxMaskEditProperties(vgHAvulso.Properties.EditProperties).ReadOnly := True;
      if FIniciar then begin
        FSessao.Transacoes.Limpa;
        mtTran.EmptyTable;
      end;
      FSessao.Tempos.Limpa;
      FSessao.Vendas.Limpa;
    end else begin
      vgHAvulso.Properties.Caption := 'Cliente';
      TcxMaskEditProperties(vgHAvulso.Properties.EditProperties).ReadOnly := False;
    end;
    vgH.FocusedRow := vgHAvulso;
  end;
end;

procedure TFrmSessao.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  ShowMessage('É necessário selecionar um cliente cadastrado ou optar por cliente avulso');
end;

procedure TFrmSessao.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  if vgHCliCad.Focused and Assigned(vgH.InplaceEditor) then
    TcxCustomDropDownEdit(vgH.InplaceEditor).DroppedDown := True;
end;

procedure TFrmSessao.TVCustomDrawFooterCell(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
begin
  with AViewInfo do
  if (Text>'') and (Pos('R$', Text)=0) then
    Text := 'R$ '+ Text;
end;

procedure TFrmSessao.TVDataControllerSummaryFooterSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
var V: Variant;  
begin
  V := ASender.DataController.Values[Arguments.RecordIndex, TVCancelado.Index];
  if (V<>null) and (V=True) then
    OutArguments.Done := True;
end;

procedure TFrmSessao.TVStylesGetContentStyle(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  out AStyle: TcxStyle);
  var V: Variant;
begin
  V := ARecord.Values[TVCancelado.Index];
  if (V<>null) and (V=True) then 
  if (AItem=TVPago) or (AItem=TVPagar) or (AItem=TVValorFinal) then
    AStyle := cxStyle14 else
    AStyle := cxStyle13; 
end;

procedure TFrmSessao.TVValorFinalGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  V := ARecord.Values[Sender.Index];
  if (V=null) or (V=0) then
    AText := '';
end;

end.
