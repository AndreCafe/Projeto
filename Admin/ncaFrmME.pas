unit ncaFrmME;
{
    ResourceString: Dario 11/03/13
}

interface

{$I nex.inc}

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxCurrencyEdit, cxImageComboBox,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxTextEdit,
  cxDBLookupComboBox, cxMaskEdit, ExtCtrls, nxdb, kbmMemTable, dxBarExtItems,
  dxBar, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer, cxMemo,
  cxDBEdit, cxVGrid, cxDBVGrid, cxInplaceContainer, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxDropDownEdit, cxRadioGroup, ncMovEst, ncafbPesqCli, cxCheckBox, Buttons,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  cxLabel, cxSpinEdit, cxLookAndFeels, cxLookAndFeelPainters,
  LMDCustomScrollBox, LMDScrollBox, cxPC, cxPCdxBarPopupMenu, ncaFrmTotal,
  cxLookupEdit, cxDBLookupEdit, Menus, StdCtrls, cxButtons, ncaFrmEditContato,
  ncClassesBase, cxNavigator, ncaPanVendaProdBase, ncaPanItensVendaBase, ncaPanItensVendaGrid,
  cxBarEditItem;

type
  TFrmME = class(TForm)
    panCli: TLMDSimplePanel;
    BarMgr: TdxBarManager;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cmRecibo: TdxBarControlContainerItem;
    panTot: TLMDSimplePanel;
    cbRecibo: TcxCheckBox;
    tPro: TnxTable;
    tProID: TAutoIncField;
    tProCodigo: TStringField;
    tProDescricao: TStringField;
    tProUnid: TStringField;
    tProPreco: TCurrencyField;
    DataSource1: TDataSource;
    tProPodeAlterarPreco: TBooleanField;
    Timer1: TTimer;
    tProEstoqueAtual: TFloatField;
    tProplus: TBooleanField;
    tProFidPontos: TIntegerField;
    panLista: TLMDSimplePanel;
    tProCustoUnitario: TCurrencyField;
    tProCadastroRapido: TBooleanField;
    tProCategoria: TStringField;
    dxBarLargeButton1: TdxBarLargeButton;
    tProObs: TnxMemoField;
    tProImagem: TGraphicField;
    tProFornecedor: TIntegerField;
    tProSubCateg: TStringField;
    tProEstoqueACE: TFloatField;
    tProEstoqueACS: TFloatField;
    tProNaoControlaEstoque: TBooleanField;
    tProEstoqueMin: TFloatField;
    tProEstoqueMax: TFloatField;
    tProAbaixoMin: TBooleanField;
    tProAbaixoMinDesde: TDateTimeField;
    tProEstoqueRepor: TFloatField;
    tProplusURL: TnxMemoField;
    tProplusCodParceiro: TStringField;
    tProplusCodProduto: TStringField;
    tProAtivo: TBooleanField;
    tProFidelidade: TBooleanField;
    tPromd5Imagem: TStringField;
    tProlastProdModif: TDateTimeField;
    tProuploadR: TWordField;
    tProuploadS: TWordField;
    tProfk_produ: TIntegerField;
    tProbatchUID: TGuidField;
    tProIncluidoEm: TDateTimeField;
    tProPermiteVendaFracionada: TBooleanField;
    cmConfig: TdxBarLargeButton;
    tCodR: TnxTable;
    cbFocus: TCheckBox;
    cbCompra: TcxCheckBox;
    cmContCompra: TdxBarControlContainerItem;
    cxStyle5: TcxStyle;
    cmGravar: TdxBarButton;
    cmCancelar: TdxBarButton;
    panBuscaProd: TLMDSimplePanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmCancelarClick(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edProdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure cmConfigClick(Sender: TObject);
    procedure cbCompraClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FME       : TncMovEst;
    FNovo     : Boolean;
    FRes      : Boolean;
    FCliAnt   : Integer;
    FDebAnt   : Currency;
    FMsgDebito: Integer;
    FTipoCli  : Integer;
    FShowed   : Boolean;
    FTot      : TFrmTotal;
    FCli      : TFrmEditContato;
    //FMostrarUnit : Boolean;  agora sempre mostrará o preço unitário
    FTamanho     : byte;
    FPanAddProd  : TFrmPanVendaProdBase;
    FPanItens    : TpanItensVendaBase;
    FItensA      : TncItensMovEst;
    
    { Private declarations }
    procedure AddItem(aItem: TncItemMovEst);
    procedure LoadItens;
    function GetFidResgate: Boolean;

    //procedure SetMostrarUnit(const Value: Boolean);
    procedure SetTamanho(Value: byte);

    procedure OnAddProd(Sender: TFrmPanVendaProdBase; aProdID: Cardinal; aValorUnit, aTotal: Currency; aQuant: Extended; aDescr: String; aPermSemEstoque: Boolean; aFidPontos: Double);

    procedure OnClicouRemoverItem(Sender: TObject; aBotao: TBotaoItemVenda);

    function OnQuantOk(Sender: TFrmPanVendaProdBase; aProduto: Cardinal; aQuant, Estoque: Double): Boolean;

    procedure UpdateTipoTran;

    //property MostrarUnit: Boolean
    //  read FMostrarUnit write SetMostrarUnit;

    property FidResgate: Boolean
      read GetFidResgate;
  public
    property Tamanho     : byte read FTamanho write SetTamanho;
    function Editar(aNovo: Boolean; aME: TncMovEst; aPodeSalvar: Boolean; aTamanho: Byte = {$IFDEF LAN} tamTelaNormal {$ELSE} tamTelaPDV1 {$ENDIF}): Boolean;
    { Public declarations }
  end;

  TMeuLookup = class ( TcxCustomLookupEdit );

  TMeuLookupData = class ( TcxCustomLookupEditLookupData );

var                          
  FrmME: TFrmME;

implementation

uses
  ncaDM,
  ncaFrmVendaProd,
  ncaFrmPri,
  ncIDRecursos,
  ncafbPesqFor,
  ncaFrmConfigChoiceME,
  ncaFrmConfigVendaProdSemSaldo, ncaFrmOpcoes,
  ncaFrmConfigQuickCad, ufmImagens;

// START resource string wizard section
resourcestring
  SOpçõesParaVendas = 'Opções para Vendas';
  SÉNecessárioHaverItensParaSalvar = 'É necessário haver itens para salvar';
  SDescontoNãoPodeSerMaiorQueOValor = 'Desconto não pode ser maior que o valor total';
  SValorPagoNãoPodeSerMaiorQueOTota = 'Valor pago não pode ser maior que o total final';
  SÉNecessárioInformarOCliente = 'É necessário informar o cliente';
  SClienteNãoPossuiQuantidadeDePont = 'Cliente não possui quantidade de pontos suficiente';
  SParaFicarEmDébitoéNecessárioSele = 'Para ficar em débito é necessário selecionar um cliente';
  SOLimiteMáximoDeDébitoPermitidoPa = 'O limite máximo de débito permitido para esse cliente foi ultrapassado';
  SVenda = 'Venda';
  SResgateDeProdutoDoProgramaDePont = 'Resgate de produto do programa de pontos/fidelidade';
  SCompra = 'Compra';
  SAjusteDeEstoqueSAÍDA = 'Correção de Estoque - SAÍDA';
  SAjusteDeEstoqueENTRADA = 'Correção de Estoque - ENTRADA';

  SNaoPermiteCred = 'Crédito não permitido com ';
  SNaoPermiteTroco = 'Troco não permitido com ';

// END resource string wizard section


{$R *.dfm}

{ TFrmME }

procedure TFrmME.cbCompraClick(Sender: TObject);
begin
  if cbCompra.Checked then  
    FME.Tipo := trEstCompra else
    FME.Tipo := trEstEntrada;

  FTot.pgValPontos.Visible := (FME.Tipo=trEstCompra);
  panTot.Height := FTot.ValPanHeight;
  
    
  UpdateTipoTran;
  if FShowed then
    FPanAddProd.FocusProd;
end;

procedure TFrmME.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmME.cmConfigClick(Sender: TObject);
begin
  TFrmOpcoes.Create(Self).Editar(SOpçõesParaVendas, [{$ifdef Loja}TFrmConfigQuickCad,{$endif} TFrmConfigVendaProdSemSaldo]);
end;

procedure TFrmME.cmGravarClick(Sender: TObject);
var 
  Debitar: Currency;
  W: TWinControl;
begin
  try
    W := screen.ActiveControl;
    cbFocus.SetFocus;
    if W<>nil then W.SetFocus;
  except
  end;

  if FidResgate then begin
    FME.Total := 0;
    FME.Desconto := 0;
    FME.Pago := 0;
  end else begin
    FME.Total    := FTot.SubTotal;
    FME.Desconto := FTot.Desconto;
    FME.Pago     := FTot.Pago;
  end;
  FME.Obs      := FTot.Obs;
  FME.Recibo   := cbRecibo.Checked;
  FME.NomeCliente := FCli.Nome;
  FME.Cliente := FCli.ID;
  FME.TipoPag := FTot.TipoPag;   // dario 08/2009

  if FME.Itens.Count=0 then
    Raise ENexCafe.Create(SÉNecessárioHaverItensParaSalvar);


  if Ftot.SobrouTroco and (not FTot.PermiteTroco) then
        Raise ENexCafe.Create(SNaoPermiteTroco + Ftot.TipoPagNome);


  if not FME.FidResgate then begin

      if FME.Desconto-FME.Total > 0.001 then
        Raise ENexCafe.Create(SDescontoNãoPodeSerMaiorQueOValor);

      if (FME.Pago - (FME.Total - FME.Desconto)) > 0.001 then
            Raise ENexCafe.Create(SValorPagoNãoPodeSerMaiorQueOTota);

  end else begin

      if FCli.ID=0 then
        raise ENexCafe.Create(SÉNecessárioInformarOCliente);

      if FTot.PontosNec>FCli.FidPontos then
        raise ENexCafe.Create(SClienteNãoPossuiQuantidadeDePont);

  end;

  with Dados do
  if (FME.Tipo=trEstVenda) and (FME.ValorDebitado>0.009) then begin

      if FME.Cliente <> FCliAnt then FDebAnt := 0;
      Debitar := FME.ValorDebitado - FDebAnt;

      if (FME.ValorDebitado>0.009) then begin

          if (FME.Cliente=0) then
            Raise ENexCafe.Create(SParaFicarEmDébitoéNecessárioSele);

          if Debitar > 0.009 then begin
      
            tbCli.Locate('ID', FME.Cliente, []); // do not localize
            if LimiteDebito(tbCliLimiteDebito)<(Debitar+tbCliDebito.Value) then
              Raise ENexCafe.Create(SOLimiteMáximoDeDébitoPermitidoPa);

          end;

      end;

  end;

  // if Ftot.PermiteCred then
  // if Ftot.PermiteTroco then
  // FME.TipoPag := FTot.TipoPag;
  // SNaoPermiteCred = 'Crédito não permitido com ';
  // SNaoPermiteTroco = 'Troco não permitido com ';

  if (FME.Tipo=trEstVenda) and (not FidResgate) then
    FME.SalvaDescPago;

  FME.SalvaTipoTran;
    
  FRes := True;

  Close;
end;

procedure TFrmME.OnAddProd(Sender: TFrmPanVendaProdBase; aProdID: Cardinal; aValorUnit, aTotal: Currency; aQuant: Extended; aDescr: String; aPermSemEstoque: Boolean; aFidPontos: Double);
var IM: TncItemMovEst;
begin
  IM := TncItemMovEst.Create(nil);
  try
    IM.imTipoTran := FME.Tipo;
    IM.imFidResgate := FidResgate;
    IM.imProduto := aProdID;
    IM.imQuant := aQuant;
    IM.imPermSemEstoque := aPermSemEstoque;
    if FidResgate then
      IM.imFidPontos := aFidPontos * IM.imQuant
    else begin
      if FME.Tipo in [trEstVenda, trEstCompra] then begin
        IM.imUnitario := aValorUnit;
        IM.imTotal := aTotal;
      end;
      IM.imFidPontos := 0;
    end;
    
    FME.Itens.NewItem.AssignFrom(IM);
    AddItem(IM);
    //MostrarUnit := (FME.Tipo=trEstCompra);
  finally
    IM.Free;
  end;
end;

procedure TFrmME.OnClicouRemoverItem(Sender: TObject; aBotao: TBotaoItemVenda);
var aIndex: Integer;
begin
  aIndex := FpanItens.FocusedItemIndex;
  if aIndex=-1 then Exit;
  if FidResgate then
    FTot.PontosNec := FTot.PontosNec - FME.Itens[aIndex].imFidPontos else 
    FTot.SubTotal := FTot.SubTotal - FME.Itens[aIndex].imTotal;

  FME.Itens[aIndex].Free;
  FME.Itens.Delete(aIndex);
  FpanItens.DelItem(aIndex);
  
  if FME.Itens.Count=0 then 
    FPanAddProd.FocusProd;
end;

function TFrmME.OnQuantOk(Sender: TFrmPanVendaProdBase; aProduto: Cardinal;
  aQuant, Estoque: Double): Boolean;
var A, B: Double;  
begin
  A := FItensA.QuantProduto(aProduto);
  B := FME.Itens.QuantProduto(aProduto);

  if (A-(B+aQuant))>=0 then
    Result := True else
    Result := (((B+aQuant)-A) <= Estoque);
end;

function TFrmME.Editar(aNovo: Boolean; aME: TncMovEst;
  aPodeSalvar: Boolean; aTamanho: Byte = {$IFDEF LAN} tamTelaNormal {$ELSE} tamTelaPDV1 {$ENDIF}): Boolean;
var
  Func : String;
  //TC : Byte;
  U : TncUsuario;
begin
  FME := aME;
  FNovo := aNovo;

  FItensA.AsString := FME.Itens.AsString;
  
  if aME.Tipo in [trEstCompra, trEstEntrada] then 
    cmContCompra.Visible := ivAlways;

  cbCompra.Checked := (aME.Tipo = trEstCompra);

  cmContCompra.Enabled := aNovo;  

  Tamanho := aTamanho;

  FpanItens.ResgateFidelidade := FidResgate;

  if FidResgate then begin
    FTot.InitPontos(0, 0, aME.Obs, panTot);
    tPro.Filter := '(plus<>true) and (fidpontos>0)'; // do not localize
  end else
  if aME.Tipo=trEstVenda then
    FTot.InitVal(FME.PagEsp, 0, aME.Desconto, aME.Pago, 0, aME.TipoPag, aME.Obs, panTot)
  else begin
    FTot.InitCusto(0, aME.Obs, panTot);
    FTot.pgValPontos.Visible := (aME.Tipo=trEstCompra);
  end;

  with Dados.CM.Config do begin
    if (RecImprimir>0) and (FME.Tipo=trEstVenda) then
      cmRecibo.Visible := ivAlways else
      cmRecibo.Visible := ivNever;

    cbRecibo.Checked := (RecImprimir=2) and (aNovo) and (FME.Tipo=trEstVenda);  
  end;

  if aNovo then begin
    //TC := 1;
    Func := Dados.CM.UA.Nome;
    if Trim(Func)='' then
      Func := Dados.CM.UA.Username;
  end else begin
    FCli.ID := FME.Cliente;
//    if FME.Cliente>0 then
//      TC := 0
//    else
//      TC := 1;
    U := Dados.CM.Usuarios.PorUsername[FME.Func];
    if U=nil then 
      Func := '' 
    else begin
      Func := U.Nome;
      if Trim(Func)='' then
        Func := U.Username;
    end;
  end;

  cmGravar.Enabled := aPodeSalvar and (aNovo or Permitido(daTraAlterar));
  FCli.Fornecedor := (FME.Tipo <> trEstVenda);
  UpdateTipoTran;

  if aNovo then begin
    if gConfig.PgVendaAvulsa then
      FTot.OpPagto := 1 else
      FTot.OpPagto := 2;
  end else begin
    LoadItens;
    FTot.Recebido := FME.Pago;
    if Abs(((FME.Total - FME.Desconto) - FME.Pago)) < 0.01 then
      FTot.OpPagto := 1 else
      FTot.OpPagto := 0;
  end;
  FTot.TipoPag := FME.TipoPag;

  FTot.Atualiza;
  ShowModal;
  Result := FRes;
end;

procedure TFrmME.edProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : if FPanAddProd.CanCloseForm then Close;
  end;
end;

procedure TFrmME.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmME.FormCreate(Sender: TObject);
begin
  FItensA := TncItensMovEst.Create(nil);
  cmConfig.Enabled := Dados.CM.UA.Admin;
  FPanAddProd  := DefPanVendaProdClass.Create(Self);
  FPanAddProd.OnAddProd := OnAddProd;
  FPanAddProd.PanVendaProd.Parent := panBuscaProd;
  FPanAddProd.OnQuantOk := OnQuantOk;
  

  FPanItens := TPanItensVendaGrid.Create(Self);
  FpanItens.panPri.Parent := panLista;
  FpanItens.OnClicouBotao := OnClicouRemoverItem;
  FpanItens.MostrarBotao(bivRemoverItem, True);
  FpanItens.panTot.Color := clWhite;
  FpanItens.panTot.Height := 48;

  FTot := TFrmTotal.Create(Self);
  FTot.panTot.Parent := Self.panTot;

  FCli := TFrmEditContato.Create(Self);
  FCli.panPri.Parent := panCli;
  FShowed := False;
  FTipoCli := -1;
  FMsgDebito := -1;
  
  FCliAnt:= 0;
  FDebAnt:= 0;
  FTamanho := 255;

  FRes := False;
end;

procedure TFrmME.FormDestroy(Sender: TObject);
begin
  FTot.Free;
  FItensA.Free;
end;

procedure TFrmME.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
{    Key_Enter : 
      if (not (ssCtrl in Shift)) then 
        FPanAddProd.FocusProd
      else
        if cmGravar.Enabled then
          if ((ssCtrl in Shift) or (FTot.edRec.Focused)) then 
            cmGravarClick(nil); }
        
    Key_Esc   : 
    if ((not FNovo) or (Self.FPanItens.Count=0)) and FPanAddProd.CanCloseForm then Close;

    Key_F2    : if cmGravar.Enabled then cmGravar.Click;
    Key_F12   : if panTot.Visible then FTot.edRec.SetFocus;
    Key_F5    : begin
      FPanAddProd.ClosePops;
      FCli.Pesquisa;
    end;
  end;
end;

procedure TFrmME.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [#13, #27]) then Key := #0;
end;

procedure TFrmME.FormShow(Sender: TObject);
begin
  //MostrarUnit := (FME.Tipo=trEstCompra);
  FPanAddProd.TipoTran := FME.Tipo;
  FpanAddProd.SetGap(7);

  if not FShowed and FNovo then
    Timer1.Enabled := True;

  if not FNovo then begin
    FCliAnt := FME.Cliente;
    FDebAnt := FME.ValorDebitado;
  end;

  FTot.PontosDisp := FCli.FidPontos;
  
  FShowed := True;

  FTot.Atualiza;

  panTot.Height := FTot.ValPanHeight;
    
{  vgT.HideEdit;
  vgT.ShowEdit;}
  if (Screen.Width=640) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
end;

function TFrmME.GetFidResgate: Boolean;
begin
  Result := FME.FidResgate;
end;


procedure TFrmME.AddItem(aItem: TncItemMovEst);
begin
  if not FidResgate then 
    FTot.SubTotal := FTot.SubTotal + aItem.imTotal else
    FTot.PontosNec := FTot.PontosNec + aItem.imFidPontos;
  FpanItens.UpdateItemMovEst(-1, aItem);
end;

procedure TFrmME.LoadItens;
var I : Integer;
begin
  for I := 0 to FME.Itens.Count - 1 do begin
    AddItem(FME.Itens[I]);
    FTot.Recebido := FME.Pago;
  end;
end;

procedure TFrmME.SetTamanho(Value: byte);
begin
    if Value<>fTamanho then begin

       fTamanho := value;

       FTot.Tamanho := fTamanho;

       left := 0;
       top  := 0;
       width := screen.width;
       height := screen.height;
       windowstate := wsMaximized;
       

       case fTamanho of
         tamTelaNormal : begin
           BorderStyle := bsSizeable;
           FpanItens.SetFontSize(10);
         end;
         tamTelaPDV1   : begin
           borderstyle := bsNone;
           FpanItens.SetFontSize(20);
         end;
       end;
    end;

end;

procedure TFrmME.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  FPanAddProd.FocusProd;
end;

procedure TFrmME.UpdateTipoTran;
begin
  FpanItens.TipoTran := FME.Tipo;
  case FME.Tipo of
    trEstVenda   : 
      if not FidResgate then 
        Caption := SVenda else
        Caption := SResgateDeProdutoDoProgramaDePont;
    trEstCompra  : Caption := SCompra;
    trEstSaida   : Caption := SAjusteDeEstoqueSAÍDA;
    trEstEntrada : Caption := SAjusteDeEstoqueENTRADA;
  end;
  panCli.Visible := FidResgate or (FME.Tipo in [trEstVenda, trEstCompra]);

  FPanAddProd.TipoTran := fme.tIPO;

  FpanItens.Atualiza;
end;

end.

