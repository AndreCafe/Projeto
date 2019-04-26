unit ncaFrmTempo;
{
    ResourceString: Dario 09/03/13
    Joao: TODO List
}

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxVGrid, cxDBVGrid, cxInplaceContainer, cxRadioGroup, cxContainer,
  cxLabel, cxPC, cxControls, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxTimeEdit, cxDropDownEdit, cxCurrencyEdit, Buttons, 
  cxButtonEdit, ncafbPesqCli, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel, cxListBox,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, ncCredTempo, 
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, kbmMemTable,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, ncClassesBase, ncTarifador,
  cxCheckBox, nxdb, dxBarExtItems, dxBar, cxLookAndFeels, ExtCtrls, ncaFrmTotal, ncaFrmCli,
  cxNavigator;

type

  TDadosTempo = object
  public  
    dtTipo      : Byte;
    dtMinutos   : Double;
    dtMaq       : Word;
    dtValor     : Currency;
    dtDadosCli  : TDadosCliente;
    dtPago      : Currency;
    dtDesc      : Currency;
    dtCodPassPac: Integer;
    dtNomePass  : String;
    dtSenha     : String;
    dtRecibo    : Boolean;
    dtTipoAcesso: Integer;
    dtObs       : String;
    dtCredValor : Boolean;
    dtFidResgate: Boolean;
    dtFidPontos : Double;
    dtFunc      : String;
    
    function Igual(const aDT: TDadosTempo): Boolean;
    function TotalFinal: Currency;
    function PagoTotal: Boolean;
    procedure Limpa;

    procedure LoadFromCredTempo(aCT: TncCredTempo);
    procedure SaveToCredTempo(aCT: TncCredTempo);
  end;

  PDadosTempo = ^TDadosTempo;
    
  TFrmTempo = class(TForm)
    tcxlist: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    panCli: TLMDSimplePanel;
    tTipoTempo: TkbmMemTable;
    tTipoTempoDescr: TStringField;
    tTipoTempoTipo: TSmallintField;
    tTipoTempoCodigo: TIntegerField;
    tTipoTempoMinutos: TIntegerField;
    tTipoTempoValor: TCurrencyField;
    tTipoTempoTipoAcesso: TIntegerField;
    dsTipoTempo: TDataSource;
    tPass: TnxTable;
    tPassID: TAutoIncField;
    tPassTipoPass: TIntegerField;
    tPassCliente: TIntegerField;
    tPassExpirou: TBooleanField;
    tPassSenha: TStringField;
    tPassPrimeiroUso: TDateTimeField;
    tPassTipoAcesso: TIntegerField;
    tPassTipoExp: TWordField;
    tPassExpirarEm: TDateTimeField;
    tPassMaxSegundos: TIntegerField;
    tPassSegundos: TIntegerField;
    tPassAcessos: TIntegerField;
    tPassDia1: TIntegerField;
    tPassDia2: TIntegerField;
    tPassDia3: TIntegerField;
    tPassDia4: TIntegerField;
    tPassDia5: TIntegerField;
    tPassDia6: TIntegerField;
    tPassDia7: TIntegerField;
    tPassTran: TIntegerField;
    tPassDataCompra: TDateTimeField;
    tPassValido: TBooleanField;
    tPassValor: TCurrencyField;
    tPassSessao: TIntegerField;
    panTot: TLMDSimplePanel;
    BarMgr: TdxBarManager;
    cbRecibo: TcxCheckBox;
    dxBarManager1Bar1: TdxBar;
    dxBarDockControl1: TdxBarDockControl;
    cmSalvar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    panCentral: TLMDSimplePanel;
    panTempo: TLMDSimplePanel;
    panAtalhoTempo: TLMDSimplePanel;
    lbT6: TcxLabel;
    lbT5: TcxLabel;
    lbT4: TcxLabel;
    lbT3: TcxLabel;
    lbT2: TcxLabel;
    lbT1: TcxLabel;
    edTempo: TcxTimeEdit;
    cxLabel9: TcxLabel;
    cxLabel8: TcxLabel;
    edValor: TcxCurrencyEdit;
    edTipoAcesso: TcxComboBox;
    lbTempo: TcxLabel;
    lbTipoAcesso: TcxLabel;
    lbSenha: TcxLabel;
    edSenha: TcxTextEdit;
    lbErroCartao: TcxLabel;
    panTT: TLMDSimplePanel;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVDescr: TcxGridDBColumn;
    TVPontos: TcxGridDBColumn;
    TVTipo: TcxGridDBColumn;
    GL: TcxGridLevel;
    cmMaq: TdxBarStatic;
    tTipoTempoID: TAutoIncField;
    tTipoTempoPontos: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbT1Click(Sender: TObject);
    procedure lbT1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure edValorPropertiesEditValueChanged(Sender: TObject);
    procedure edValorPropertiesChange(Sender: TObject);
    procedure edTempoPropertiesEditValueChanged(Sender: TObject);
    procedure edTempoPropertiesChange(Sender: TObject);
    procedure edTipoAcessoPropertiesEditValueChanged(Sender: TObject);
    procedure edValorEnter(Sender: TObject);
    procedure edTempoEnter(Sender: TObject);
    procedure cxLabel8Click(Sender: TObject);
    procedure cxLabel9Click(Sender: TObject);
    procedure lbTipoAcessoClick(Sender: TObject);
    procedure VGItemChanged(Sender: TObject; AOldRow: TcxCustomRow;
      AOldCellIndex: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure edSenhaPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TVCanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure TVDescrGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVDescrCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FDados      : PDadosTempo;
    FCalculando : Boolean;
    FCalcTempo  : Boolean;
    FResultado  : Boolean;
    FTar        : TncTarifador;
    FNovo       : Boolean;
    FSenhaAnt   : String;
    FCliAnt     : Integer;
    FShowed     : Boolean;
    FTACli      : Integer;
    FDebAnt     : Currency;
    FMinutosT   : Double;
    FPontosA    : Double;
    FValorT     : Currency;
    FTot        : TFrmTotal;
    FCli        : TFrmCli;

    function GetValor: Double;
    function GetTipoAcesso: Integer;
    procedure AtualizaVisTipoAcesso;
    procedure Totalizar;
    procedure RefreshTACli;

    function FidResg: Boolean;

    procedure OnMudouCliente(Sender: TObject);

    procedure OnTimerDropDown(Sender: TObject);

    { Private declarations }
  public
    function Editar(const aNovo, aSalvar: Boolean; aDados: PDadosTempo; aTran: Integer; aMostraAvulso: Boolean = False; aMinutosT: Double=0; aValorT: Currency=0; aRemovePos: Boolean=False): Boolean;
    { Public declarations }
  end;

var
  FrmTempo: TFrmTempo;

implementation

uses ncaDM, ncIDRecursos, ncaFrmPri, ufmImagens;

// START resource string wizard section
resourcestring
  SEsseCartãoJáFoiVendidoParaOutroC = 'Esse cartão já foi vendido para outro cliente';
  SNãoExisteCartãoComASenhaInformad = 'Não existe cartão com a senha informada';
  SInformaASenhaDoCartãoASerVendido = 'Informa a senha do cartão a ser vendido';
  SÉNecessárioSelecionarUmCliente = 'É necessário selecionar um cliente';
  SNenhumPrêmioFoiSelecionadoParaRe = 'Nenhum prêmio foi selecionado para resgate';
  SClienteNãoTemPontosSuficientes = 'Cliente não tem pontos suficientes';
  SParaFicarEmDébitoéNecessárioSele = 'Para ficar em débito é necessário selecionar um cliente';
  SOLimiteMáximoDeDébitoPermitidoPa = 'O limite máximo de débito permitido para esse cliente foi ultrapassado';
  SResgateDePrêmioFidelidade = 'Resgate de prêmio fidelidade';
  SMaq = 'Maq: ';

// END resource string wizard section


{$R *.dfm}

procedure TFrmTempo.Totalizar;
begin
  FTot.SubTotal := GetValor;
end;

procedure TFrmTempo.AtualizaVisTipoAcesso;
var 
  TemTodos: Boolean;
  M : Integer;
begin
  edSenha.Visible := (tTipoTempoTipo.Value = tctCartaoTempo);
  lbSenha.Visible := edSenha.Visible;
  lbErroCartao.Visible := False;
  with Dados do 
  with edTipoAcesso.Properties do begin
    TemTodos := SameText(Items[0], 'Todos'); // TODO : check string
    case tTipoTempoTipo.Value of
      tctAvulso, tctPrevisao : begin
        if TemTodos then Items.Delete(0);
        if edTipoAcesso.ItemIndex=-1 then edTipoAcesso.ItemIndex := 0;
        lbTempo.Visible := False;
        edtempo.Visible := True;
      end;
      tctPassaporte : begin
        edTempo.Visible := False;
        if not TemTodos then Items.InsertObject(0, 'Todos', TObject(-1)); // TODO : check string
        edTipoAcesso.ItemIndex := Items.IndexOfObject(TObject(tTipoTempoTipoAcesso.Value));
        M := tTipoTempoMinutos.Value;
        if M < 60 then
          lbTempo.Caption := tTipoTempoMinutos.AsString+'m'
        else begin
          lbTempo.Caption := IntToStr(M div 60)+'h';
          if (M mod 60)>0 then
            lbTempo.Caption := lbTempo.Caption + IntToStr(M mod 60) + 'm';
        end;  
        lbTempo.Visible := True;
      end;

      tctCartaoTempo : begin
        edTempo.Visible := False; 
        if not TemTodos then Items.InsertObject(0, 'Todos', TObject(-1)); // TODO : check string
        lbTempo.Visible := True;
        edSenhaPropertiesChange(nil);
        if FShowed and FNovo then edSenha.SetFocus;
      end;
      
      tctPacote : begin
        edTempo.Visible := False;
        if not TemTodos then Items.InsertObject(0, 'Todos', TObject(-1)); // TODO : check string
        edTipoAcesso.ItemIndex := 0;

        M := tTipoTempoMinutos.Value;
        if M < 60 then
          lbTempo.Caption := tTipoTempoMinutos.AsString+'m'
        else begin
          lbTempo.Caption := IntToStr(M div 60)+'h';
          if (M mod 60)>0 then
            lbTempo.Caption := lbTempo.Caption + IntToStr(M mod 60) + 'm';
        end;  
        
        lbTempo.Visible := True;
      end;
    end;  
  end;
  with edTipoAcesso, Properties do begin
    TemTodos := SameText(Items[0], 'Todos'); // TODO : check string
    edTipoAcesso.Visible := (Items.Count>2) or ((not TemTodos) and (Items.Count>1));
    edTipoAcesso.Enabled := (tTipoTempoTipo.Value in [tctAvulso, tctPrevisao]);
    lbTipoAcesso.Visible := edTipoAcesso.Visible;
  end;
  
  Totalizar;
end;

procedure TFrmTempo.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTempo.btnSalvarClick(Sender: TObject);
var 
  Debitar: Currency;
  Ind: Integer;
begin
  with FDados^, Dados do begin
    dtTipo      := tTipoTempoTipo.Value;
    if dtTipo = tctCartaoTempo then begin
      if lbErroCartao.Visible then 
        Raise ENexCafe.Create(SEsseCartãoJáFoiVendidoParaOutroC)
      else
      if dtCodPassPac=-1 then
      if Trim(edSenha.Text)='' then
        Raise ENexCafe.Create(SNãoExisteCartãoComASenhaInformad) else
        Raise ENexCafe.Create(SInformaASenhaDoCartãoASerVendido);
    end;
    
    if (not cmMaq.VisibleForUser) and (FCli.Codigo<1) and (dtTipo <> tctCartaoTempo) then 
      Raise ENexCafe.Create(SÉNecessárioSelecionarUmCliente);

    dtRecibo    := cbRecibo.Checked;
    case dtTipo of
       tctPrevisao..tctAvulso : begin
         dtMinutos := edTempo.Time * 24 * 60;
         dtValor   := edValor.Value;
       end;
       tctCartaoTempo : begin
         dtMinutos := tPass.FieldByName('MaxSegundos').AsInteger / 60; // do not localize
         dtValor   := edValor.Value;
       end;
    else 
      if FidResg then begin
        dtMinutos := tTipoTempoMinutos.Value;
        dtValor   := 0;
        dtFidPontos := tTipoTempoPontos.Value;
      end else begin
        dtMinutos := tTipoTempoMinutos.Value;
        dtValor   := tTipoTempoValor.Value;
        dtFidPontos := 0;
      end;
    end;

    dtDadosCli.dcCodigo    := FCli.Codigo;
    dtDadosCli.dcNome      := FCli.Nome;
    
    dtDesc      := FTot.Desconto;
    if dtTipo in [tctPacote, tctPassaporte] then begin
      dtCodPassPac:= tTipoTempoCodigo.Value;
      dtNomePass  := tTipoTempoDescr.Value;
    end;
    dtSenha     := edSenha.Text;
    dtObs := FTot.edObs.Lines.Text;

    with edTipoAcesso, Properties.Items do 
    if dtTipo in [tctAvulso, tctPassaporte] then begin
      Ind := ItemIndex;
      if dtTipo=tctPassaporte then
        dtTipoAcesso := tTipoTempoTipoAcesso.Value 
      else
      if Ind=-1 then
        dtTipoAcesso := gTiposAcesso.Itens[0].ID else
        dtTipoAcesso := Integer(Objects[Ind]);
    end;

    if FidResg then
      dtPago := 0 else  
      dtPago := FTot.Pago;

    if dtTipo=tctPrevisao then begin
      dtValor := 0;
      dtDesc  := 0;
      dtPago  := 0;
    end;

    if not cmMaq.VisibleForUser then 
      dtMaq := 0;

    if FidResg then begin
      if (FTot.PontosNec < 0.01) then 
        raise ENexCafe.create(SNenhumPrêmioFoiSelecionadoParaRe);

      if (FTot.PontosDisp < FTot.PontosNec) then 
        raise ENexCafe.create(SClienteNãoTemPontosSuficientes);
    end;

    with FDados^ do 
    if (not cmMaq.VisibleForUser) and (dtTipo<>tctPrevisao) then begin    
      Debitar := TotalFinal - dtPago;
      if (Debitar > 0.009) then begin
        if dtDadosCli.dcCodigo=0 then
          Raise ENexCafe.Create(SParaFicarEmDébitoéNecessárioSele);
        if (FCliAnt<>dtDadosCli.dcCodigo) then FDebAnt := 0;
        Debitar := Debitar - FDebAnt;
        with Dados do
        if Debitar>0.009 then begin
          tbCli.Locate('ID', dtDadosCli.dcCodigo, []); // do not localize
          if LimiteDebito(tbCliLimiteDebito)<(Debitar+tbCliDebito.Value) then
            Raise ENexCafe.Create(SOLimiteMáximoDeDébitoPermitidoPa);
        end;
      end;
    end;
  end;
  FResultado := True;
  Close;
end;

procedure TFrmTempo.lbT1Click(Sender: TObject);
begin
  edTempo.SetFocus;
  edTempo.Time := edTempo.Time + MinutosToDateTime(TControl(Sender).Tag);
end;

procedure TFrmTempo.lbT1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then begin
    lbT1Click(Sender);
    btnSalvarClick(nil);
  end;
end;

procedure TFrmTempo.cxLabel8Click(Sender: TObject);
begin
  if not FidResg then
    edValor.SetFocus;
end;

procedure TFrmTempo.cxLabel9Click(Sender: TObject);
begin
  if (not FidResg) and edTempo.Visible then
    edTempo.SetFocus;
end;

function TFrmTempo.Editar(const aNovo, aSalvar: Boolean; aDados: PDadosTempo; aTran: Integer; aMostraAvulso: Boolean = False; aMinutosT: Double=0; aValorT: Currency=0; aRemovePos: Boolean=False): Boolean;
var 
  TC: Integer; D: Double;
begin
  if gConfig.ContinuarCredTempo then begin
    FMinutosT := aMinutosT;
    FValorT := aValorT;
  end else begin
    FMinutosT := 0;
    FValorT := 0;
  end;
  FDados := aDados;
  FNovo := aNovo;
  if aNovo and (aDados.dtMaq>0) then begin
    if FDados^.dtDadosCli.dcCodigo<1 then
      TC := 1 else
      TC := 0;
  end else
  if (FDados^.dtDadosCli.dcCodigo<1) and (not aNovo) then
    TC := 1 else
    TC := 0;
  FCli.Init(False, False, aDados.dtDadosCli.dcCodigo, aDados.dtDadosCli.dcNome, '', TC, panCli);
  if aNovo and (aDados^.dtMaq=0) then
    FCli.lbSemCad.Visible := False;

  if FidResg then begin
    if aNovo then begin
      FPontosA := 0;
      D := FCli.Pesq.TabFidPontos.Value + FPontosA;
    end else begin
      FPontosA := aDados.dtFidPontos;
      D := FCli.Pesq.TabFidPontos.Value + FPontosA;
    end;
      
    FTot.InitPontos(aDados.dtFidPontos, FPontosA+D, aDados.dtObs, panTot);

    tTipoTempo.Filter := '(Pontos>0)'; // do not localize
    tTipoTempo.Filtered := True;

    cxLabel8.Visible := False;
    edValor.Visible := False;

    TVPontos.Visible := True;
    
    TV.OptionsView.Header := True;
    panTT.Width := 200;

    Caption := SResgateDePrêmioFidelidade;
  end else begin
    FTot.InitVal(aDados^.dtValor, aDados^.dtDesc, aDados^.dtDesc, 0, aDados^.dtObs, panTot);
    tTipoTempo.Filter := '';
    tTipoTempo.Filtered := False;
  end;  

  if aRemovePos then begin
    if FidResg then
      tTipoTempo.Filter := '(Tipo<>'+IntToStr(tctDiv)+') and (Tipo<>'+IntToStr(tctPrevisao)+') and (Pontos>0)' else // do not localize
      tTipoTempo.Filter := '(Tipo<>'+IntToStr(tctDiv)+') and (Tipo<>'+IntToStr(tctPrevisao)+')';; // do not localize
    tTipoTempo.Filtered := True;
  end;

  if aNovo then begin
    aDados.dtCredValor := gConfig.CreditoComoValor;
    if aRemovePos and (Dados.CM.Config.CredPadraoCod=tctPrevisao) then
      aDados.dtTipo := tctAvulso else
      aDados.dtTipo := Dados.CM.Config.CredPadraoTipo;
      
    aDados.dtCodPassPac := Dados.CM.Config.CredPadraoCod;
    aDados.dtFunc := Dados.CM.UA.Username;

    
  end else
  with FDados^.dtDadosCli do 
  if (dcCodigo>0) and Dados.tbCli.Locate('ID', dcCodigo, []) then // do not localize
    dcNome := Dados.tbCliNome.Value;
  
  FSenhaAnt := aDados.dtSenha;
  FCliAnt := aDados.dtDadosCli.dcCodigo;
  cmSalvar.Enabled := aNovo or (aSalvar and Permitido(daTraAlterar));
  panTempo.Enabled := aNovo;
  Grid.Enabled := aNovo;
  cbRecibo.Visible := (Dados.CM.Config.RecImprimir>0);
  cbRecibo.Checked := aNovo and (Dados.CM.Config.RecImprimir=2);
  
  edValor.Value := FDados^.dtValor;
  
  if aNovo then begin
    if gConfig.PgTempo then
      FTot.OpPagto := 1 else
      FTot.OpPagto := 2;
  end else 
    if FDados^.PagoTotal then 
      FTot.OpPagto := 1 else
      FTot.OpPagto := 2;
    
  FCli.CliCad := FDados^.dtDadosCli.dcCodigo;
  panCli.Enabled := (FDados^.dtMaq=0);
  
  if FDados^.dtMaq>0 then begin
    cmMaq.Visible := ivAlways;
    cmMaq.Caption := SMaq+IntToStr(FDados^.dtMaq);
    FTot.PagarFimAcesso;
  end else
    cmMaq.Visible := ivNever;
//  edCli.Enabled := aMostraAvulso;
  
  with Dados do
  if aDados.dtTipo in [tctPrevisao, tctAvulso, tctCartaoTempo] then 
    tTipoTempo.Locate('Tipo', aDados.dtTipo, []) // do not localize
  else
  if not tTipoTempo.Locate('Tipo; Codigo', VarArrayOf([aDados.dtTipo, aDados.dtCodPassPac]), []) then // do not localize
  if (not FNovo) and (aTran>0) then
  begin 
    tTipoTempo.Insert;
    tTipoTempoTipo.Value := aDados.dtTipo;
    tTipoTempoValor.Value := aDados.dtValor;
    tTipoTempoMinutos.Value := Trunc(aDados.dtMinutos);
    tTipoTempoDescr.AsVariant := tbTran.Lookup('ID', aTran, 'Descr'); // do not localize
    tTipoTempoCodigo.Value := aDados.dtCodPassPac;
    tTipoTempo.Post;
    tTipoTempo.Locate('Tipo; Codigo', VarArrayOf([aDados.dtTipo, aDados.dtCodPassPac]), []); // do not localize
  end;
  if not FNovo then begin
    FCalculando := True;
    try
      edValor.Value := FDados^.dtValor;
      edTempo.Time  := FDados^.dtMinutos / 60 / 24;
      TVFocusedRecordChanged(nil, nil, nil, False);
    finally
      FCalculando := False;
    end;
  end;
  if aDados.dtTipo in [tctPrevisao, tctAvulso] then
    edTipoAcesso.ItemIndex := edTipoAcesso.Properties.Items.IndexOfObject(TObject(aDados.dtTipoAcesso));

  while (tTipoTempoTipo.Value=tctDiv) and (not Eof) do
    tTipoTempo.Next;

  
  edSenha.Text := FDados^.dtSenha;
  ShowModal;
  Result := FResultado;
end;

procedure TFrmTempo.edSenhaPropertiesChange(Sender: TObject);
var M : Integer;
begin
  if FCalculando then Exit;

  if not tPass.FindKey([edSenha.Text]) then begin
    lbTempo.Caption := '';
    edValor.Value := 0;
    lbErroCartao.Visible := False;
    edTipoAcesso.ItemIndex := 0;
    FDados^.dtCodPassPac := -1;
  end else begin
    lbErroCartao.Visible := (FSenhaAnt <> edSenha.Text) and tPassValido.Value;
    FDados^.dtCodPassPac := tPassTipoPass.Value;
    edValor.Value := tPassValor.Value;
    
    with edTipoAcesso, Properties do
    ItemIndex := Items.IndexOfObject(TObject(tPassTipoAcesso.Value));
    M := tPassMaxSegundos.Value div 60;
    if M < 60 then
      lbTempo.Caption := IntToStr(M)+'m'
    else begin
      lbTempo.Caption := IntToStr(M div 60)+'h';
      if (M mod 60)>0 then
        lbTempo.Caption := lbTempo.Caption + IntToStr(M mod 60) + 'm';
    end;  
  end;
end;

procedure TFrmTempo.edTempoEnter(Sender: TObject);
begin
  edTempo.SelectAll;
end;

procedure TFrmTempo.edTempoPropertiesChange(Sender: TObject);
begin
  edTempo.PostEditValue;
end;

procedure TFrmTempo.edTempoPropertiesEditValueChanged(Sender: TObject);
begin
  if FCalculando then Exit;
  if not FNovo then Exit;
  
  FCalculando := True;
  FCalcTempo := True;
  try
    FTar.IDTipoAcesso := GetTipoAcesso;
    FTar.PCredito^.Minutos := 0;
    FTar.CredValor := 0;
    FTar.Reset;
    FTar.Inicio := Now;
    FTar.NumTicks := DateTimeToTicks(edTempo.Time) + MinutosToTicks(FMinutosT);
    edValor.EditValue := FloatToStr(FTar.Valor-FValorT);
    Totalizar;
  finally
    FCalculando := False;
  end;  
end;

procedure TFrmTempo.edTipoAcessoPropertiesEditValueChanged(Sender: TObject);
begin
  if not FShowed then Exit;
  
  if not FCalculando then begin
    if FCalcTempo then
      edTempoPropertiesEditValueChanged(nil) else
      edValorPropertiesEditValueChanged(nil);
  end;
end;

procedure TFrmTempo.edValorEnter(Sender: TObject);
begin
  edValor.SelectAll;
end;

procedure TFrmTempo.edValorPropertiesChange(Sender: TObject);
begin
  if FShowed then
    edValor.PostEditValue;
end;

procedure TFrmTempo.edValorPropertiesEditValueChanged(Sender: TObject);
var 
  NumTicks: Cardinal;
  H, M, S, MS: Word;
begin
  if not FShowed then Exit;
  if not FNovo then Exit;
  
  
  if FCalculando then Exit;
  FCalcTempo := False;
  FCalculando := True;
  try
    with Dados.CM do  begin
      FTar.Inicio := Now;
      FTar.IDTipoAcesso := GetTipoAcesso;
      FTar.CredValor := GetValor + FValorT;
      FTar.PCredito^.Minutos := 0;
      NumTicks := FTar.TempoCredValor(False);
      DecodeTime(TicksToDateTime(NumTicks), H, M, S, MS);
      edTempo.Time := TicksToDateTime(NumTicks - MinutosToTicks(FMinutosT));
    end;   
    Totalizar;
  finally
    FCalculando := False;
  end;    
end;

function TFrmTempo.FidResg: Boolean;
begin
  Result := FDados^.dtFidResgate;
end;

procedure TFrmTempo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTempo.FormCreate(Sender: TObject);
begin
  FPontosA := 0;
  FTot := TFrmTotal.Create(Self);
  FCli := gCliList.GetFrm;
  FCli.OnMudouCliente := OnMudouCliente;
  
  FTACli := -1;
  FDebAnt := 0;
  FShowed := False;
  with Dados.CM.Config do begin
    lbT1.Tag := TempoB1;
    lbT2.Tag := TempoB2;
    lbT3.Tag := TempoB3;
    lbT4.Tag := TempoB4;
    lbT5.Tag := TempoB5;
    lbT6.Tag := TempoB6;

    lbT1.Caption := MinutosToHmsStr(TempoB1);
    lbT2.Caption := MinutosToHmsStr(TempoB2);
    lbT3.Caption := MinutosToHmsStr(TempoB3);
    lbT4.Caption := MinutosToHmsStr(TempoB4);
    lbT5.Caption := MinutosToHmsStr(TempoB5);
    lbT6.Caption := MinutosToHmsStr(TempoB6);

    lbT1.Visible := (TempoB1>0);
    lbT2.Visible := (TempoB2>0);
    lbT3.Visible := (TempoB3>0);
    lbT4.Visible := (TempoB4>0);
    lbT5.Visible := (TempoB5>0);
    lbT6.Visible := (TempoB6>0);
  end;
  tPass.Open;
  FNovo := False;
  FTar := TncTarifador.Create;
  FResultado := False;
  FCalculando := True;
  FDados := nil;
  try
    lbTempo.Left := edTempo.Left;
    lbTempo.Top  := edTempo.Top;
    with Dados, edTipoAcesso.Properties do begin
      tbTipoAcesso.First;
      Items.Clear;
      while not tbTipoAcesso.Eof do begin
        Items.AddObject(tbTipoAcessoNome.Value, TObject(tbTipoAcessoID.Value));
        tbTipoAcesso.Next;
      end;
    end;
    dsTipoTempo.DataSet := nil;
    try
      tTipoTempo.Open;
      Dados.RefreshTipoCred(False);
      TransfRecords(Dados.tabTT, tTipoTempo);
    finally
      dsTipoTempo.Dataset := tTipoTempo;
    end;
//    AtualizaVisTipoAcesso;
  finally
    FCalculando := False;
  end;
end;

procedure TFrmTempo.FormDestroy(Sender: TObject);
begin
  FTot.Free;
  gCliList.ReleaseFrm(FCli);
  FTar.Free;
end;

procedure TFrmTempo.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 case Key of
    Key_Enter : 
    if (not (ssCtrl in Shift)) and (FCli.edCad.Focused or FCli.edAvulso.Focused) then begin
      if edValor.Visible and edValor.Enabled and (not edValor.Properties.ReadOnly) then
        edValor.SetFocus 
      else
        if edTempo.Visible and edTempo.Enabled and (not edTempo.Properties.ReadOnly) then
          edTempo.SetFocus
    end else
      if (cmSalvar.Enabled) then
      if ((ssCtrl in Shift) or (FTot.edRec.Focused)) then 
        btnSalvarClick(nil);
        
    Key_Esc   : Close;

    $7B {F12} : FTot.edRec.SetFocus;
  end;
end;

procedure TFrmTempo.FormShow(Sender: TObject);
var I : Integer;
begin
  with FDados^ do 
  if (dtMaq=0) and (dtDadosCli.dcCodigo>0) and (dtTipo<>tctPrevisao) then
    FDebAnt := TotalFinal - dtPago else
    FDebAnt := 0;

  FShowed := True;
  GetTipoAcesso;
  if FDados^.dtTipo = tctCartaoTempo then
    edSenhaPropertiesChange( nil);
  with edTipoAcesso, Properties.Items do   
  if (not FNovo) and (FDados^.dtTipo = tctAvulso) then begin
    I := IndexOfObject(TObject(FDados^.dtTipoAcesso));
    if I>=0 then
      ItemIndex := I;
  end;

  if FNovo then 
  if (FDados^.dtDadosCli.dcCodigo>0) then begin
    RefreshTACli;
    GetTipoAcesso;
  end else 
  if panCli.Enabled then 
  if FCli.Tipo=0 then
    FCli.edCad.SetFocus else
    FCli.edAvulso.SetFocus;
end;

function TFrmTempo.GetTipoAcesso: Integer;
var I : Integer;
begin
  with Dados, edTipoAcesso, edTipoAcesso.Properties do begin
    if ItemIndex>=0 then
      Result := Integer(Items.Objects[ItemIndex]) else
      Result := -1;
    if (tTipoTempoTipo.Value in [tctAvulso, tctPrevisao]) and (FTACli<>-1) and (FTACli<>Result) then begin
      I := Items.IndexOfObject(TObject(FTACli));
      if I>=0 then begin
        Result := FTACli;
        ItemIndex := I;
      end;
    end;
  end;
end;

function TFrmTempo.GetValor: Double;
begin
  try
    Result := edValor.EditValue;
  except
    Result := 0;
  end;
end;

procedure TFrmTempo.lbTipoAcessoClick(Sender: TObject);
begin
  if edTipoAcesso.Visible and edTipoAcesso.Enabled then
    edTipoAcesso.SetFocus;
end;

procedure TFrmTempo.OnMudouCliente(Sender: TObject);
begin
  FTot.PontosDisp := FCli.Pesq.TabFidPontos.Value + FPontosA;
  if FShowed then begin
    RefreshTACli;
    GetTipoAcesso;
  end;
end;

procedure TFrmTempo.OnTimerDropDown(Sender: TObject);
begin
  Sender.Free;
  FCli.edCad.SetFocus;
end;

procedure TFrmTempo.RefreshTACli;
var V: Variant;
begin
  V := FCli.TipoAcessoPref;
  if (V=null) or (gTiposAcesso.ItemPorChave[V]=nil) then
    FTACli := -1 else
    FTACli := V;
end;

procedure TFrmTempo.TVCanFocusRecord(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; var AAllow: Boolean);
var V: Variant;  
begin
  V := ARecord.Values[TVTipo.Index];
  AAllow := (V=null) or ((V<>tctDiv) and (V<>tctDiv2));
end;

procedure TFrmTempo.TVDescrCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var V: Variant;  
begin
  V := AViewInfo.GridRecord.Values[TVTipo.Index];
  if (V<>null) and ((V=tctDiv) or (V=tctDiv2)) then
    ACanvas.Font.Color := clGray;
end;

procedure TFrmTempo.TVDescrGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  V := ARecord.Values[TVTipo.Index];
  if (V=null) or ((V<>tctDiv) and (V<>tctDiv2)) then
    AText := '   ' + AText;
end;

procedure TFrmTempo.TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  FTot.PontosNec := tTipoTempoPontos.Value;

  if not FShowed then Exit;

  FCalculando := True;
  with Dados do
  try
    if not FidResg then begin
      if FNovo and (not (panAtalhoTempo.Visible and (tTipoTempoTipo.Value in [tctAvulso, tctPrevisao]))) then
      begin
        edValor.Value := tTipoTempoValor.Value;
        edTempo.Time  := tTipoTempoMinutos.Value / 60 / 24;
        Totalizar;
      end;
            
      panTot.Visible := (tTipoTempoTipo.Value  <> tctPrevisao) and (tTipoTempoTipo.Value <> tctLivre);
    end;
      
    panAtalhoTempo.Visible := (tTipoTempoTipo.Value in [tctAvulso, tctPrevisao]);
    edValor.Properties.ReadOnly := not panAtalhoTempo.Visible;
    AtualizaVisTipoAcesso;
  finally
    FCalculando := False;
  end;
end;

procedure TFrmTempo.VGItemChanged(Sender: TObject; AOldRow: TcxCustomRow;
  AOldCellIndex: Integer);
begin
  Totalizar;
end;

{ TDadosTempo }

function TDadosTempo.Igual(const aDT: TDadosTempo): Boolean;
begin
  Result := False;
  if dtTipo <> aDT.dtTipo then Exit;
  if dtMinutos <> aDT.dtMinutos then Exit;
  if dtValor <> aDT.dtValor then Exit;
  if dtDadosCli.dcCodigo <> aDT.dtDadosCli.dcCodigo then Exit;
  if dtPago <> aDT.dtPago then Exit;
  if dtDesc <> aDT.dtDesc then Exit;
  if dtCodPassPac <> aDT.dtCodPassPac then Exit;
  if dtMaq <> aDT.dtMaq then Exit;
  if dtSenha <> aDT.dtSenha  then Exit;
  if dtObs <> aDT.dtObs then Exit;
  if dtCredValor <> aDT.dtCredValor then Exit;
  if dtFidResgate <> aDT.dtFidResgate then Exit;
  if dtFidPontos <> aDT.dtFidPontos then Exit;
  
  Result := True;
end;

procedure TDadosTempo.Limpa;
begin
  dtTipo      := 0;
  dtMaq       := 0;
  dtMinutos   := 0;
  dtValor     := 0;
  dtDadosCli.dcCodigo := 0;
  dtDadosCli.dcNome := '';
  dtPago      := 0;
  dtDesc      := 0;
  dtCodPassPac:= 0;
  dtNomePass  := '';
  dtSenha := '';
  dtObs := '';
  dtTipoAcesso := -1;
  dtCredValor := False;
  dtFidPontos := 0;
  dtFidResgate := False;
end;

procedure TDadosTempo.LoadFromCredTempo(aCT: TncCredTempo);
begin
  dtFunc := aCT.teFunc;
  dtTipo := aCT.teTipo;
  dtMaq  := aCT.teMaq;
  dtMinutos := aCT.teMinutos;
  dtValor := aCT.teTotal;
  dtDadosCLi.dcCodigo := aCT.teCliente;
  dtPago := aCT.tePago;
  dtDesc := aCT.teDesconto;
  dtCodPassPac := aCT.teIDPacPass;
  dtNomePass := '';
  dtSenha := aCT.teSenha;
  dtTipoAcesso := aCT.teTipoAcesso;
  dtObs := aCT.teObs;
  dtCredValor := aCT.teCredValor;
  dtFidResgate := aCT.teFidResgate;
  dtFidPontos := aCT.teFidPontos;
end;

function TDadosTempo.PagoTotal: Boolean;
begin
  Result := (Abs(TotalFinal - dtPago) < 0.01);
end;

procedure TDadosTempo.SaveToCredTempo(aCT: TncCredTempo);
begin
  aCT.teTipo := dtTipo;
  aCT.teMaq := dtMaq ;
  aCT.teMinutos := dtMinutos;
  aCT.teTotal := dtValor;
  aCT.teCliente := dtDadosCli.dcCodigo;
  aCT.tePago := dtPago;
  aCT.teDesconto := dtDesc;
  aCT.teIDPacPass := dtCodPassPac;
  aCT.teSenha := dtSenha;
  aCT._Recibo := dtRecibo;
  aCT.teTipoAcesso := dtTipoAcesso;
  aCT.teObs := dtObs;
  aCT.teCredValor := dtCredValor;
  aCT.teFidResgate := dtFidResgate;
  aCT.teFidPontos := dtFidPontos;
  aCT.teFunc := dtFunc;
end;

function TDadosTempo.TotalFinal: Currency;
begin
  if dtFidResgate then
    Result := 0 else
    Result := dtValor - dtDesc;
end;

end.

