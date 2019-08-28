unit ncaFrmSessao;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxCurrencyEdit, cxRadioGroup,
  cxCalendar, cxTimeEdit, cxDBLookupComboBox, cxMemo, cxDropDownEdit,
  cxTextEdit, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxMaskEdit, dxBar, dxBarExtItems, ExtCtrls, cxDBVGrid, cxVGrid,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer, cxLabel,
  Buttons, cxInplaceContainer, cxPC, LMDControl, LMDBaseControl,
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
  cxCheckBox, cxSpinEdit, cxLookAndFeels, cxLookAndFeelPainters,
  cxPCdxBarPopupMenu, ncaFrmTotal, ncaFrmCli, cxImageComboBox, Menus, cxButtons,
  cxNavigator, ncEspecie, dxBarBuiltInMenu;

type
  TFrmSessao = class(TForm)
    Edit1: TEdit;
    bdcAcesso: TdxBarDockControl;
    PagPri: TcxPageControl;
    tsPagNormal: TcxTabSheet;
    panTot2: TLMDSimplePanel;
    panTran: TLMDSimplePanel;
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
    BarMgr: TdxBarManager;
    cmFuncFim: TdxBarStatic;
    cmData: TdxBarStatic;
    cmPagamento: TdxBarStatic;
    cmFuncInicio: TdxBarStatic;
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
    TVCancelado: TcxGridDBColumn;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cmRecibo: TdxBarControlContainerItem;
    cmListaEspera: TdxBarLargeButton;
    Timer2: TTimer;
    cxStyle15: TcxStyle;
    cmMaq: TdxBarStatic;
    cbRecibo: TcxCheckBox;
    panCli: TLMDSimplePanel;
    panGrupoTarObs: TLMDSimplePanel;
    LMDLabel4: TLMDLabel;
    panGrupoTar: TLMDSimplePanel;
    edGrupoTar: TcxImageComboBox;
    lbGrupoTar: TcxLabel;
    panObs: TLMDSimplePanel;
    lbObs: TcxLabel;
    edObs: TcxTextEdit;
    mtTranObs: TMemoField;
    btnTempo: TcxButton;
    btnProd: TcxButton;
    btnImp: TcxButton;
    btnCancelar: TcxButton;
    btnEditar: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mtTranCalcFields(DataSet: TDataSet);
    procedure TVValorFinalGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure btnTempoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TVCustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure TVDataControllerSummaryFooterSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
    procedure TVStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      out AStyle: TcxStyle);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnProdClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure cbListaEsperaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TVValorFinalCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure lbObsClick(Sender: TObject);
  private
    FMsgDebito : Integer;
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
    FTot       : TFrmTotal;
    FCli       : TFrmCli;
    
    { Private declarations }
    procedure LeTran;
    procedure RefreshTotais;

    function GetIMEDescr(IME: TncItemMovEst): String;

    procedure Biometria(var Msg: TMessage);
      message wm_biometria;
    
  public
    { Public declarations }
    function Editar(aSessao: TncSessao): Boolean;
  end;

var
  FrmSessao: TFrmSessao;

implementation

uses ncaFrmPri, ncIDRecursos, ufmImagens, ncCredTempo, ncaFrmTempo,
  ncImpressao, ncaFrmVendaProd, ncaFrmImp, ncDMServ, ncaBiometria;

// START resource string wizard section
resourcestring
  SImpressão = 'Impressão ';
  SPáginaS = ' Página(s)';
  SDesejaRealmenteCancelarATransaçã = 'Deseja realmente cancelar a transação selecionada?';
  SDescontoNãoPodeSerMaiorQueOTotal = 'Desconto não pode ser maior que o total';
  SÉNecessárioQueTenhaUmCadastroPar = 'É necessário que tenha um cadastro para poder deixar débito';
  SOLimiteMáximoDeDébitoPermitidoPa = 'O limite máximo de débito permitido para esse cliente foi ultrapassado';
  SEditarSessão = 'Editar Sessão';
  SMáq = 'Máq. ';
  SMaq = 'Maq. ';
  SDuração = 'Duração: ';
  STempoPrevisto = 'Tempo previsto = ';
  STempo = 'Tempo = ';
  SÉNecessárioSelecionarUmClienteCa = 'É necessário selecionar um cliente cadastrado ou optar por cliente avulso';
  rsSessaoEncerrouNaoPodeCancelarItem = 'Não é possível cancelar esse item pois essa sessão já foi encerrada';

// END resource string wizard section


{$R *.dfm}

const
  cliCad    = 0;
  cliAvulso = 1;
  cliFunc   = 2;

procedure TFrmSessao.Biometria(var Msg: TMessage);
begin
  FCli.Tipo := 0;
  FCli.CliCad := Msg.WParam;
  FCli.UpdateCliCadEdit(True);
end;

procedure TFrmSessao.btnImpClick(Sender: TObject);
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
      mtTranDescr.Value := SImpressão + IntToStr(Imp.TotQuant) + SPáginaS;
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

procedure TFrmSessao.btnCancelarClick(Sender: TObject);
begin
  if mtTran.IsEmpty then Exit;
  if mtTranCancelado.Value then Exit;
  
  if not (mtTranTipo.Value in [trImpressao, trCredTempo, trEstVenda]) then Exit;
  if not SimNaoH(SDesejaRealmenteCancelarATransaçã, Handle) then Exit;

  if mtTranID.Value=High(Integer) then begin
    case mtTranTipo.Value of
      trCredTempo : begin
        if FSessao.Encerrou then begin
          ShowMessage(rsSessaoEncerrouNaoPodeCancelarItem);
          Exit;
        end;

        FSessao.Tempos.Remove(TncCredTempo(mtTranObjItem.Value));
      end;
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
  RefreshTotais;
end;

procedure TFrmSessao.btnEditarClick(Sender: TObject);
var 
  Tran : TncTransacao;
  DT : TDadosTempo;
  CT : TncCredTempo;
  IME : TncItemMovEst;
  Imp : TncImpressao;
  P : TncPagEspecies;
begin
  if mtTran.RecordCount=0 then Exit;
  if not (mtTranTipo.Value in [trEstVenda, trCredTempo, trImpressao])  then Exit;
  Tran := TncTransacao(mtTranObjTran.Value);
  case mtTranTipo.Value of
    trEstVenda  : begin
      IME := TncItemMovEst.Create(nil);
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
      P := TncPagEspecies.Create;
      try
        P.Assign(CT.tePagEsp);
        DT.LoadFromCredTempo(CT);
        if TFrmTempo.Create(nil).Editar(False, (not CT.teCancelado) and ((CT.teCaixa=NumAberto) or (CT.teID=-1)), P, @DT, CT.teTran) 
        then begin
          DT.SaveToCredTempo(CT);
          CT.tePagEsp.Assign(P);
          Tran.trTotal    := CT.teTotal;
          Tran.trDesconto := CT.teDesconto;
          Tran.trPago     := CT.tePago;
        end;
      finally
        P.Free;
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
  panCli.Enabled := not cmListaEspera.Down;
  if cmListaEspera.Down then begin
    FCli.CliCad := FEspCli;
    FCli.edAvulso.Text := FEspNome;
    if FEspCli>0 then 
      FCli.Tipo := 0 else
      FCli.Tipo := 1;
    FSessao.Cliente := FEspCli;
  end;
end;

procedure TFrmSessao.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSessao.cmGravarClick(Sender: TObject);
var 
  Debitar, A, B, C : Currency;
  TemCred : Boolean;
  S : String;
  CANt, I : Integer;
begin
  FSalvando := True;
  try
    CAnt := FSessao.Cliente;
    FSessao.Obs := edObs.Text;
    FSessao.Cliente := FCli.Codigo;
    FSessao.NomeCliente := FCli.Nome;
    FSessao.TipoAcesso := edGrupoTar.EditValue;

    if FCli.Codigo <> CAnt then begin
      for I := 0 to FSessao.Vendas.Count-1 do FSessao.Vendas[I].imCliente := FCli.Codigo;
      for I := 0 to FSessao.Impressoes.Count - 1 do FSessao.Impressoes[I].impCliente := FCli.Codigo;
      for I := 0 to FSessao.Tempos.Count - 1 do FSessao.Tempos[I].teCliente := FCli.Codigo;
    end;

    if FCli.Tipo = 2 then
      FSessao.TipoCli := tcManutencao 
    else
    if FCli.Tipo=0 then begin
      if FCli.Pesq.TabIsento.Value then
        FSessao.TipoCli := tcCliGratis else
        FSessao.TipoCli := tcNormal;
    end else
      FSessao.TipoCli := tcNormal;
    
    if FSessao.Encerrou  then begin
//      RefreshTotais;
      FSessao.ObsFim := FTot.Obs;
      FSessao.Recibo := cbRecibo.Checked;
      if (FTot.Desconto - FTot.SubTotal) > 0.001 then
        Raise ENexCafe.Create(SDescontoNãoPodeSerMaiorQueOTotal);
        
      FSessao.DescTran := FTot.Desconto;
      FSessao.PagoTran := FTot.Pago;
      
      A := FSessao.TotalGeral;
      B := FSessao.DescTran;
      C := Fsessao.PagoTran;
      Debitar := A - B - C;

      with Dados do
      if (Debitar>0.009) then begin 
        if (FCliAnt<>FSessao.Cliente) or (FSessao.TranF=0) then 
          FDebAnt := 0;
            
        Debitar := Debitar - FDebAnt;
        if (FSessao.Cliente=0) then
          Raise ENexCafe.Create(SÉNecessárioQueTenhaUmCadastroPar);
        if Debitar > 0.009 then begin
          tbCli.Locate('ID', FSessao.Cliente, []); // do not localize
          if LimiteDebito(tbCliLimiteDebito)<(Debitar+tbCliDebito.Value) then
            Raise ENexCafe.Create(SOLimiteMáximoDeDébitoPermitidoPa);
        end;
      end;
    end;
  
    FGravou := True;
    Close;
  finally
    FSalvando := False;
  end;
end;

function TFrmSessao.Editar(aSessao: TncSessao): Boolean;
var
  Func : String;
  TC : Byte;
  U : TncUsuario;
begin
  Caption := SEditarSessão;
  if aSessao=nil then
    cmMaq.Caption := '' else
    cmMaq.Caption := SMáq+IntToStr(aSessao.Maq);
  FSessao := aSessao;
  edObs.Text := FSessao.Obs;
  FTot.Obs := FSessao.ObsFim;
  edGrupoTar.EditValue := FSessao.TipoAcesso;
  
  panObs.Visible := gConfig.MostraObs;

  with Dados.CM.Config do begin
    if FSessao.Encerrou and (RecImprimir>0) then
      cmRecibo.Visible := ivAlways else
      cmRecibo.Visible := ivNever;

    cbRecibo.Checked := aSessao.Encerrou and (RecImprimir=2);  
  end;

  LeTran;
  FTot.InitVal(aSessao.PagEsp, aSessao.TotalGeral, aSessao.DescTran, aSessao.PagoTran, 0, 0, aSessao.ObsFim, panTot2);

  U := Dados.CM.Usuarios.PorUsername[FSessao.FuncI];
  if U=nil then 
    Func := '' 
  else begin
    Func := U.Nome;
    if Trim(Func)='' then
      Func := U.Username;
  end;
  

  if FSessao.TipoCli=tcManutencao then
    TC := 2 
  else
  if FSessao.Cliente>0 then 
    TC := 0 else
    TC := 1;
    
  FCli.Init(False, (FSessao.TipoCli=tcManutencao), FSessao.Cliente, FSessao.NomeCliente, Func, TC, panCli);
  FCli.ReadOnly := not Permitido(daTraAlterar);
  
  if FSessao.Encerrou then begin
    panTot2.Visible := True;
    FTot.panInnerTot.AlignWithMargins := False;
    if FSessao.TranF=0 then begin
      RefreshTotais;
      if gConfig.PgAcesso then
        FTot.OpPagto := 1 else
        FTot.OpPagto := 2;
      FTot.Atualiza(True);  
    end else begin
      if ((FSessao.TotalGeral - FSessao.DescTran - FSessao.PagoTran)<0.01) then
         FTot.OpPagto := 1 else
         FTot.OpPagto := 0;
      FTot.Recebido := aSessao.PagoTran;
    end;
  end;
  RefreshTotais;

  ShowModal;
  Result := FGravou;
end;

procedure TFrmSessao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmSessao.FormCreate(Sender: TObject);
begin
  FTot := TFrmTotal.Create(Self);
  FCli := gCliList.GetFrm;
//  FCli.OnMudouCliente := OnMudouCliente;
  LoadGrupoTar(edGrupoTar);

  
  FTipoCli := -1;
  FShowed := False;
  FSalvando := False;
  mtTran.Open;
  
  FMsgDebito := -1;
  FCliAnt    := 0;
  FDebAnt    := 0;
end;

procedure TFrmSessao.FormDestroy(Sender: TObject);
begin
  FTot.Free;
  gCliList.ReleaseFrm(FCli);
end;

procedure TFrmSessao.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
    $7B {F12} : FTot.edRec.SetFocus;    
  end;
end;

procedure TFrmSessao.FormShow(Sender: TObject);
begin
  BioFrmH := Handle;
  if (Screen.Width=640) or (Screen.Width=800) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);

  if not Permitido(daIniciarSessaoCliCad) then
    FCli.tsCliCad.TabVisible := False;
    
  panGrupoTar.Visible := (gTiposAcesso.Count>1);
  
  panGrupoTarObs.Visible := panGrupoTar.Visible or panObs.Visible;  

  FCliAnt := FSessao.Cliente;
  FDebAnt := FTot.Debito;

  FShowed := True;
  cmMaq.Caption := SMaq+IntToStr(FSessao.Maq);
  
  btnCancelar.Enabled := Permitido(daTraCancelar);
    
  panTot2.Visible := FSessao.Encerrou;
  RefreshTotais;

  if FSessao.Encerrou then
    FTot.edRec.SetFocus;
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
    mtTranDescr.Value := SDuração+MinutosToHMSStr(FSessao.TempoUsado.Minutos);
    mtTranPago.Value := 0;
    mtTran.Post;
  end;
end;

procedure TFrmSessao.mtTranCalcFields(DataSet: TDataSet);
begin
  if mtTranTipo.Value in [trInicioSessao..trTransfMaq]  then
    mtTranNomeTipo.Value := AbrevTipoTransacao[mtTranTipo.Value] else
    mtTranNomeTipo.Value := '';
    
  mTTranTotalF.Value := mtTranTotal.Value - mtTranDesconto.Value;
  mtTranSaldo.Value := mtTranTotalF.Value - mtTranPago.Value;
end;

function TFrmSessao.GetIMEDescr(IME: TncItemMovEst): String;
var V: Variant;
begin
  V := Dados.tbPro.Lookup('ID', IME.imProduto, 'Descricao'); // do not localize
  if V<>null then
    Result := FloatToStr(IME.imQuant) + ' - ' + V else
    Result := '';
end;

procedure TFrmSessao.lbObsClick(Sender: TObject);
begin
  edObs.SetFocus;
end;

procedure TFrmSessao.btnProdClick(Sender: TObject);
var 
  IME, NewI: TncItemMovEst;
  Tran : TncTransacao;
begin
  IME := TncItemMovEst.Create(nil);
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
  P : TncPagEspecies;
begin
  inherited;
  DT.Limpa;
  DT.dtMaq := FSessao.Maq;
  DT.dtDadosCli.dcCodigo := FSessao.Cliente;
  DT.dtDadosCli.dcNome := FSessao.NomeCliente;
  DT.dtTipoAcesso := edGrupoTar.EditValue;
  P := TncPagEspecies.Create;
  try
    if TFrmTempo.Create(Self).Editar(True, True, P, @DT, 0, False, FSessao.MinutosTotCredTempo, FSessao.ValorTotCredTempo) then begin
      CT := FSessao.Tempos.NewItem;
      DT.SaveToCredTempo(CT);
      CT.teSessao := FSessao.ID;
      CT._Operacao := osIncluir;
      CT.teID := -1;
      CT.tePagEsp.Assign(P);

      mtTran.Append;
      mtTranDataHora.Value := Now;
      mtTranTotal.Value := CT.teTotal;
      mtTranDesconto.Value := CT.teDesconto;
      mtTranPago.Value := CT.tePago;
      mtTranTipo.Value := trCredTempo;
      mtTranFunc.Value := Dados.CM.Username;
      with mtTranDescr do 
      case CT.teTipo of
        tctPrevisao  : Value := STempoPrevisto + MinutosToHMSStr(CT.teMinutos);
        tctAvulso,
        tctPacote    : Value := STempo + MinutosToHMSStr(CT.teMinutos);
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
  finally
    P.Free;
  end;
end;

procedure TFrmSessao.RefreshTotais;
begin
  FTot.SubTotal := FSessao.TotalGeral;
end;

procedure TFrmSessao.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  ShowMessage(SÉNecessárioSelecionarUmClienteCa);
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
end;

procedure TFrmSessao.TVValorFinalCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var V: Variant;
begin
  V := AViewInfo.GridRecord.Values[TVCancelado.Index];
  if (V<>null) and (V=True) then begin
    ACanvas.Font.Style := [fsStrikeout];
    ACanvas.Font.Color := clRed;
  end;
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

