unit ncaFrmME2;
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
  LMDCustomScrollBox, LMDScrollBox, cxPC, cxPCdxBarPopupMenu, ncaFrmTotal, ncaFrmTotal3,
  cxLookupEdit, cxDBLookupEdit, Menus, StdCtrls, cxButtons, ncaFrmEditContato, ncaFrmEditFunc,
  ncClassesBase, cxNavigator, ncaPanVendaProdBase, ncaPanItensVendaBase, ncaPanItensVendaGrid,
  cxBarEditItem, ImgList, ncMyImage, ncDebCredValidator, dxGDIPlusClasses;

type
  TFrmME2 = class(TForm)
    panCompra: TLMDSimplePanel;
    BarMgr: TdxBarManager;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    panTot: TLMDSimplePanel;
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
    tProIncluidoEm: TDateTimeField;
    tProPermiteVendaFracionada: TBooleanField;
    tCodR: TnxTable;
    cbFocus: TCheckBox;
    cxStyle5: TcxStyle;
    panBuscaProd: TLMDSimplePanel;
    LMDSimplePanel1: TLMDSimplePanel;
    cmCancelar: TcxLabel;
    panCli: TLMDSimplePanel;
    cbCompra: TcxCheckBox;
    cbRecibo: TcxCheckBox;
    cmConfig: TcxButton;
    imgs: TcxImageList;
    panFunc: TLMDSimplePanel;
    panFidelidade: TLMDSimplePanel;
    Img: TImage;
    lbMensagem: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    RadioButton1: TRadioButton;
    cmGravar: TcxButton;
    tProPrecoAuto: TBooleanField;
    tProMargem: TFloatField;
    tProComissaoPerc: TFloatField;
    tProComissaoLucro: TBooleanField;
    tProRecVer: TIntegerField;
    tProuploadVer: TWordField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure cmCancelarClick(Sender: TObject);
  private
    FME       : TncMovEst;
    FNovo     : Boolean;
    FRes      : Boolean;
    FCliAnt   : Integer;
    FDebAnt   : Currency;
    FCredUsado : Currency;
    FMsgDebito: Integer;
    FTipoCli  : Integer;
    FShowed   : Boolean;
    FTot      : TFrmTotal3;
    FCli      : TFrmEditContato;
    FFunc     : TFrmEditFunc;
    FprocClickCompra: Boolean;
    //FMostrarUnit : Boolean;  agora sempre mostrará o preço unitário
    FTamanho     : byte;
    FPanAddProd  : TFrmPanVendaProdBase;
    FPanItens    : TpanItensVendaBase;
    FDCValidator : TncDebCredValidator;
    FItensA      : TncItensMovEst;
    { Private declarations }
    procedure AddItem(aItem: TncItemMovEst);
    procedure LoadItens;
    function GetFidResgate: Boolean;

    //procedure SetMostrarUnit(const Value: Boolean);
    procedure SetTamanho(Value: byte);

    procedure OnAddProd(Sender: TFrmPanVendaProdBase; aProdID: Cardinal; aValorUnit, aTotal: Currency; aQuant: Extended; aDescr: String; aPermSemEstoque: Boolean; aFidPontos: Double);

    procedure OnClicouRemoverItem(Sender: TObject; aBotao: TBotaoItemVenda);

    procedure OnClicouPagamento(Sender: TObject);

    procedure OnChangeCliente(Sender: TObject);

    function OnQuantOk(Sender: TFrmPanVendaProdBase; aProduto: Cardinal; aQuant, Estoque: Double): Boolean;

    procedure UpdateTipoTran;

    function EditarPagEsp: Boolean;

    //property MostrarUnit: Boolean
    //  read FMostrarUnit write SetMostrarUnit;

    property FidResgate: Boolean
      read GetFidResgate;
  public
    property Tamanho     : byte read FTamanho write SetTamanho;
    function Editar(aNovo: Boolean; aME: TncMovEst; aPodeSalvar: Boolean; aTamanho: Byte = tamTelaPDV1): Boolean;
    { Public declarations }
  end;

  TMeuLookup = class ( TcxCustomLookupEdit );

  TMeuLookupData = class ( TcxCustomLookupEditLookupData );

var                          
  FrmME2: TFrmME2;

implementation

uses
  ncaDM,
  ncaFrmVendaProd,
  ncaFrmPri,
  ncIDRecursos,
  ncafbPesqFor,
  ncaFrmConfigChoiceME,
  ncaFrmConfigVendaProdSemSaldo, 
  ncaFrmOpcoes,
  ncaFrmConfigQuickCad,
  ufmImagens, ncaFrmPagEspecie, ncEspecie, ncaFrmConfigTelaVendas;

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

// END resource string wizard section


{$R *.dfm}

{ TFrmME }

procedure TFrmME2.cbCompraClick(Sender: TObject);
begin
  if not FShowed then Exit;
  if FprocClickCompra then Exit;
  

  FprocClickCOmpra := True;
  try

    if FpanItens.Count>0 then begin
      ShowMessage('Não é possível alterar essa opções depois de já ter adicionado itens');
      cbCompra.Checked := False;
      Exit
    end;

  
  if cbCompra.Checked then 
    FME.Tipo := trEstCompra else
    FME.Tipo := trEstEntrada;
  UpdateTipoTran;  
  if cbCompra.Focused then
    FPanAddProd.FocusProd;
  finally
    FprocClickCOmpra := False;
  end;
end;

procedure TFrmME2.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmME2.cmConfigClick(Sender: TObject);
begin
  TFrmOpcoes.Create(Self).Editar(SOpçõesParaVendas, [{$ifdef Loja}TFrmConfigTelaVendas, TFrmConfigQuickCad, {$endif} TFrmConfigVendaProdSemSaldo]);
  FpanAddProd.FocusProd;
end;

procedure TFrmME2.cmGravarClick(Sender: TObject);
var 
  Debitar: Currency;
  W: TWinControl;
begin
{  try
    W := screen.ActiveControl;
    cbFocus.SetFocus;
    if W<>nil then W.SetFocus;
  except
  end;              }
  
  if FidResgate then begin
    FME.Total := 0;
    FME.Desconto := 0;
    FME.Pago := 0;
  end else begin
    if FME.Tipo = trEstVenda then 
      if (not FME.PagPend) and not EditarPagEsp then Exit;
    FME.Desconto := FTot.Desconto;  
    FME.DescPerc := FTot.DescPerc;
    FME.DescPorPerc := FTot.DescPorPerc;
    FME.Total    := FTot.SubTotal;
    FME.Pago     := FME.PagEsp.Pago;
  end;
  FME.Obs      := FTot.Obs;
  FME.Recibo   := cbRecibo.Checked;
  FME.NomeCliente := FCli.Nome;
  FME.Func := FFunc.Username;
  FME.Cliente := FCli.ID;
  
  if FME.Itens.Count=0 then
    Raise ENexCafe.Create(SÉNecessárioHaverItensParaSalvar);

  if not FME.FidResgate then begin
    if FME.Desconto-FME.Total > 0.001 then
      Raise ENexCafe.Create(SDescontoNãoPodeSerMaiorQueOValor);

    if FME.Desconto-FME.Total > 0.001 then
      Raise ENexCafe.Create(SDescontoNãoPodeSerMaiorQueOValor);

{    if (FME.Pago - (FME.Total - FME.Desconto)) > 0.001 then
      Raise ENexCafe.Create(SValorPagoNãoPodeSerMaiorQueOTota);}
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

  if (FME.Tipo=trEstVenda) and (not FidResgate) then
    FME.SalvaDescPago;

  FME.SalvaTipoTran;
    
  FRes := True;

  Close;
end;

procedure TFrmME2.OnAddProd(Sender: TFrmPanVendaProdBase; aProdID: Cardinal; aValorUnit, aTotal: Currency; aQuant: Extended; aDescr: String; aPermSemEstoque: Boolean; aFidPontos: Double);
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

procedure TFrmME2.OnChangeCliente(Sender: TObject);
begin
  if FidResgate then FTot.PontosDisp := FCli.FidPontos;
end;

procedure TFrmME2.OnClicouPagamento(Sender: TObject);
begin
  EditarPagEsp;
end;

procedure TFrmME2.OnClicouRemoverItem(Sender: TObject; aBotao: TBotaoItemVenda);
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

function TFrmME2.OnQuantOk(Sender: TFrmPanVendaProdBase; aProduto: Cardinal;
  aQuant, Estoque: Double): Boolean;
var A, B: Double;  
begin
  A := FItensA.QuantProduto(aProduto);
  B := FME.Itens.QuantProduto(aProduto);

  if (A-(B+aQuant))>=0 then
    Result := True else
    Result := (((B+aQuant)-A) <= Estoque);
end;

function TFrmME2.Editar(aNovo: Boolean; aME: TncMovEst;
  aPodeSalvar: Boolean; aTamanho: Byte = tamTelaPDV1): Boolean;
var
  Func : String;
  TC : Byte;
  U : TncUsuario;
begin
  FME := aME;
  FNovo := aNovo;

  FItensA.AsString := FME.Itens.AsString;
  
  panCompra.Visible := (aME.Tipo in [trEstCompra, trEstEntrada]);
  cbCompra.Enabled := aNovo and panCompra.Visible;
  cbCompra.Checked := (aME.Tipo=trEstCompra);
  

  FCredUsado := aME.PagEsp.CreditoUsado;

  Tamanho := aTamanho;

  panFidelidade.Visible := FidResgate;
  FPanAddProd.ResgateFid := FidResgate;
  

  FpanItens.ResgateFidelidade := FidResgate;

  if FidResgate then begin
    FTot.InitPontos(0, 0, aME.Obs, panTot);
    tPro.Filter := '(plus<>true) and (fidpontos>0)'; // do not localize
  end else begin
    case aME.Tipo of
      trEstVenda: begin
        FTot.InitVal(aME.PagEsp, aME.Total, aME.Desconto, aME.Pago, 0, aME.Obs, panTot);
        FTot.lbEditPagamento.Visible := (not aME.PagPend);
      end;
      trEstCompra : FTot.InitCusto(aME.PAgEsp, 0, aME.Obs, panTot);
    else 
      FTot.InitCusto(nil, 0, aME.Obs, panTot);
    end;
  end;

  with Dados.CM.Config do begin
    cbRecibo.Visible := (RecImprimir>0) and (FME.Tipo=trEstVenda);
    cbRecibo.Checked := (RecImprimir=2) and (aNovo) and (FME.Tipo=trEstVenda);  
  end;

  if aNovo then 
    FFunc.Username := Dados.CM.UA.Username else
    FFunc.Username := FME.Func;
  
  FCli.ID := FME.Cliente;
  if FME.Cliente>0 then
    TC := 0 else
    TC := 1;

  FDCValidator.SetOldCli(FCli.ID, FCli.Debito, FCli.Credito, FME.PagEsp.CreditoUsado, FME.PagEsp.Credito);
  
  cmGravar.Enabled := aPodeSalvar and (aNovo or Permitido(daTraAlterar));
  FCli.Fornecedor := (FME.Tipo <> trEstVenda);
  UpdateTipoTran;

  if aNovo then begin
    if gConfig.PgVendaAvulsa then
      FTot.OpPagto := 1 else
      FTot.OpPagto := 2;
  end else begin
    LoadItens;
    if not FME.PagPend then begin
      FDCValidator.OldDebito := FME.PagEsp.Debito;
      FDCValidator.OldCredito := FME.PagEsp.Credito;
    end;
    FTot.Recebido := FME.Pago;
    if Abs(((FME.Total - FME.Desconto) - FME.Pago)) < 0.01 then
      FTot.OpPagto := 1 else
      FTot.OpPagto := 0;
  end;
  
  FTot.Atualiza;
  ShowModal;
  Result := FRes;
end;

function TFrmME2.EditarPagEsp: Boolean;
var 
  P : TncPagEspecies; 
  aDesc: Currency;
  aDescPerc: Double;
  aDescPorPerc: Boolean;
begin
  P := TncPagEspecies.Create;
  try
    P.Assign(FME.PagEsp);
    aDesc := FTot.Desconto;
    aDescPerc := FTot.DescPerc;
    aDescPorPerc := FTot.DescPorPerc;
    P.Obs := FTot.Obs;
    Result := TFrmPagEspecie.Create(Self).Editar(FNovo, P, FDCValidator, FTot.SubTotal, aDesc, aDescPerc, aDescPorPerc);
    if Result then begin
      FCli.ID := FDCValidator.NewCli;
      FTot.Desconto := aDesc;
      FTot.DescPerc := aDescPerc;
      FTot.DescPorPerc := aDescPorPerc;
      FME.Desconto := aDesc;
      FME.DescPerc := aDescPerc;
      FME.DescPorPerc := aDescPorPerc;
      FME.Obs := P.Obs;
      FTot.Obs := P.Obs;
      FME.PagEsp.Assign(P);
    end;
  finally
    P.Free;
  end;
end;

procedure TFrmME2.edProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : if FPanAddProd.CanCloseForm then Close;
  end;
end;

procedure TFrmME2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmME2.FormCreate(Sender: TObject);
begin
  FItensA := TncItensMovEst.Create(nil);
  FDCValidator := TncDebCredValidator.Create;
  FprocClickCompra := False;
  
  cmConfig.Enabled := Dados.CM.UA.Admin;
  FCredUsado := 0;
  FPanAddProd  := DefPanVendaProdClass.Create(Self);
  FPanAddProd.OnAddProd := OnAddProd;
  FPanAddProd.PanVendaProd.Parent := panBuscaProd;
  FPanAddProd.OnQuantOk := Self.OnQuantOk;

  FPanItens := TPanItensVendaGrid.Create(Self);
  FpanItens.panPri.Parent := panLista;
  FpanItens.OnClicouBotao := OnClicouRemoverItem;
  FpanItens.MostrarBotao(bivRemoverItem, True);
  FpanItens.OnClickPagamento := OnClicouPagamento;

  FTot := TFrmTotal3.Create(Self);
  FTot.panTot.Parent := panTot;

  FCli := TFrmEditContato.Create(Self);
  FCli.panPri.Parent := panCli;
  FCli.DCValidator := FDCValidator;
  FCli.OnChange := OnChangeCliente;

  FFunc := TFrmEditFunc.Create(Self);
  FFunc.panPri.Parent := panFunc;
  
  FShowed := False;
  FTipoCli := -1;
  FMsgDebito := -1;
  
  FCliAnt:= 0;
  FDebAnt:= 0;

  FRes := False;
end;

procedure TFrmME2.FormDestroy(Sender: TObject);
begin
  FItensA.Free;
  FTot.Free;
  FDCValidator.Free;
end;

procedure TFrmME2.FormKeyDown(Sender: TObject; var Key: Word;
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

    Key_F2    : 
    if cmGravar.Enabled then begin
      FPanAddProd.ClosePops;
      cmGravarClick(nil);
    end;
    Key_F3    : begin
      FPanAddProd.ClosePops;
      FTot.EditDesc;
    end;
    Key_F4    : begin
      FPanAddProd.ClosePops;
      FTot.EditObs;
    end;
    Key_F5    : begin
      FPanAddProd.ClosePops;
      FCli.Pesquisa;
    end;
    Key_F6 : begin
      FPanAddProd.ClosePops;
      FFunc.Pesquisa;
    end;
  end;
end;

procedure TFrmME2.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [#13, #27]) then Key := #0;
end;

procedure TFrmME2.FormShow(Sender: TObject);
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
    
{  vgT.HideEdit;
  vgT.ShowEdit;}
  if (Screen.Width=640) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
end;

function TFrmME2.GetFidResgate: Boolean;
begin
  Result := FME.FidResgate;
end;


procedure TFrmME2.AddItem(aItem: TncItemMovEst);
begin
  if not FidResgate then 
    FTot.SubTotal := FTot.SubTotal + aItem.imTotal else
    FTot.PontosNec := FTot.PontosNec + aItem.imFidPontos;
  FpanItens.UpdateItemMovEst(-1, aItem);
end;

procedure TFrmME2.LoadItens;
var I : Integer;
begin
  FTot.SubTotal := 0;
  for I := 0 to FME.Itens.Count - 1 do begin
    AddItem(FME.Itens[I]);
    FTot.Recebido := FME.Pago;
  end;
end;

procedure TFrmME2.SetTamanho(Value: byte);
begin
    if Value<>fTamanho then begin

       fTamanho := value;

//       FTot.Tamanho := fTamanho;

       case fTamanho of
         tamTelaNormal : FpanItens.SetFontSize(10);
         tamTelaPDV1   : begin
             borderstyle := bsNone;
             left := 0;
             top  := 0;
             width := screen.width;
             height := screen.height;
             windowstate := wsMaximized;
             FpanItens.SetFontSize(20);
         end;
       end;
    end;

end;

procedure TFrmME2.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  FPanAddProd.FocusProd;
end;

procedure TFrmME2.UpdateTipoTran;
begin
  FpanItens.TipoTran := FME.Tipo;
  case FME.Tipo of
    trEstVenda   : 
      if not FidResgate then 
        Caption := SVenda else
        Caption := SResgateDeProdutoDoProgramaDePont;
    trEstCompra  : begin
      Caption := SCompra;
      FTot.SetPagEsp(FME.PagEsp);
    end;
    trEstSaida   : Caption := SAjusteDeEstoqueSAÍDA;
    trEstEntrada : begin
      Caption := SAjusteDeEstoqueENTRADA;
      FTot.SetPagEsp(FME.PagEsp);
    end;
  end;
  panCli.Visible := FidResgate or (FME.Tipo in [trEstVenda, trEstCompra]);

  FPanAddProd.TipoTran := fme.tIPO;

  FpanItens.Atualiza;
end;

end.

