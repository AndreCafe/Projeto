unit ncaFrmMEAnt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxBar, StdCtrls, 
  ExtCtrls,
  ComCtrls, Variants, cxStyles, cxGraphics, cxEdit, cxDBExtLookupComboBox,
  cxTextEdit, cxMaskEdit, cxCurrencyEdit, cxImageComboBox, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxDBLookupComboBox,
  nxdb, kbmMemTable, dxBarExtItems, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxContainer, cxMemo, cxDBEdit,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, cxVGrid, cxDBVGrid, cxInplaceContainer,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmME = class(TForm)
    BarMgr: TdxBarManager;
    mtItens: TkbmMemTable;
    mtItensQuant: TFloatField;
    mtItensUnitario: TCurrencyField;
    mtItensItem: TWordField;
    dsItens: TDataSource;
    dsMT: TDataSource;
    tMovEst: TnxTable;
    mtItensunidade: TStringField;
    panCab2: TLMDSimplePanel;
    Timer1: TTimer;
    dsMovEst: TDataSource;
    mtItensNomePro: TStringField;
    tMovEstFatorSaldo: TIntegerField;
    tMovEstSaldo: TFloatField;
    mtItensTotal: TFloatField;
    mtItensProduto: TStringField;
    mtItensEstoqueAtual: TFloatField;
    cmNovoItem: TdxBarButton;
    cmApagarItem: TdxBarButton;
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
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    dxBarDockControl2: TdxBarDockControl;
    panTotais: TLMDSimplePanel;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    LMDSimplePanel4: TLMDSimplePanel;
    LMDSimplePanel5: TLMDSimplePanel;
    LMDLabel1: TLMDLabel;
    panTotal: TLMDSimplePanel;
    LMDSimplePanel3: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    vgCab1: TcxDBVerticalGrid;
    vgCab1NumDoc: TcxDBEditorRow;
    vgCab2: TcxDBVerticalGrid;
    vgCab2Inicio: TcxDBEditorRow;
    vgCab2NomeFunc: TcxDBEditorRow;
    edObs: TcxDBMemo;
    Grid: TcxGrid;
    GL: TcxGridLevel;
    TV: TcxGridDBTableView;
    TVProduto: TcxGridDBColumn;
    TVNomeProduto: TcxGridDBColumn;
    TVEstoqueAtual: TcxGridDBColumn;
    TVQuant: TcxGridDBColumn;
    TVUnitario: TcxGridDBColumn;
    TVTotal: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    vgTot: TcxDBVerticalGrid;
    vgTotSubTotal: TcxDBEditorRow;
    vgTotDesconto: TcxDBEditorRow;
    vgTotTotFinal: TcxDBEditorRow;
    vgTotPago: TcxDBEditorRow;
    MT: TkbmMemTable;
    MTCaixaI: TIntegerField;
    MTCaixaF: TIntegerField;
    MTCaixaP: TIntegerField;
    MTTipoAcesso: TWordField;
    MTInicio: TDateTimeField;
    MTFim: TDateTimeField;
    MTDataPagto: TDateTimeField;
    MTContato: TIntegerField;
    MTNome: TStringField;
    MTMaquina: TWordField;
    MTTipo: TWordField;
    MTFuncI: TStringField;
    MTFuncF: TStringField;
    MTTempo: TDateTimeField;
    MTTempoCobrado: TDateTimeField;
    MTCredUsado: TIntegerField;
    MTCredAnterior: TIntegerField;
    MTDesconto: TCurrencyField;
    MTProdutos: TCurrencyField;
    MTValor: TCurrencyField;
    MTObs: TMemoField;
    MTIsento: TBooleanField;
    MTNaoUsarPacote: TBooleanField;
    MTCodPacote: TWordField;
    MTSinal: TCurrencyField;
    MTTransacaoVinculada: TIntegerField;
    MTValorFinalAcesso: TCurrencyField;
    MTDescontoProduto: TCurrencyField;
    MTNumDoc: TStringField;
    MTStatusPagto: TWordField;
    MTTotalFinal: TCurrencyField;
    MTNomeContato: TStringField;
    cmRecibo: TdxBarLargeButton;
    vgCab1Nome: TcxDBMultiEditorRow;
    MTUsernameCliente: TStringField;
    MTNumero: TIntegerField;
    tMovEstCustoU: TCurrencyField;
    mtItensPodeAlterarPreco: TBooleanField;
    procedure TVUnitarioGetProperties(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties);
    procedure vgTotDescontoPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Function  Valida: Boolean;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mtItensAfterInsert(DataSet: TDataSet);
    function ValidaLinha: Boolean;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mtItensAfterDelete(DataSet: TDataSet);
    procedure tMovEstCalcFields(DataSet: TDataSet);
    procedure mtItensCalcFields(DataSet: TDataSet);
    procedure mtItensBeforeDelete(DataSet: TDataSet);
    procedure mtItensProdutoValidate(Sender: TField);
    procedure mtItensProdutoChange(Sender: TField);
    procedure cmApagarItemClick(Sender: TObject);
    procedure cmNovoItemClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmReciboClick(Sender: TObject);
    procedure TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure vgTotDescontoEditPropertiesChange(Sender: TObject);
    procedure MTAfterInsert(DataSet: TDataSet);
    procedure MTCalcFields(DataSet: TDataSet);
    procedure vgCab1NomeEditors0EditPropertiesInitPopup(Sender: TObject);
    procedure vgCab1NomeEditors1EditPropertiesInitPopup(Sender: TObject);
    procedure vgCab1NomeEditors2EditPropertiesInitPopup(Sender: TObject);
    procedure TVEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);


  private
    function SalvarItem: Boolean;

    procedure LeItens;
    procedure SalvaItens;
    { Private declarations }
  public
    { Public declarations }
    UltimaLin: Integer;
    FocouTipo : Boolean;
    FTotItens : Double;
    FTotAnt   : Double;
    UltCol    : TcxGridColumn;
    FContatoAnt: Integer;
    SaveIndex : String;
    FTab      : TnxTable;
    FNovo     : Boolean;
    EUnit, EQuant: Currency;
    FInEdit: Boolean;
    FLendoItens : Boolean;
    FNumTran : Integer;

    procedure Editar(ATab: TnxTable);
    procedure Criar(ATab: TnxTable; ATipoTran : Byte);
  end;

var
  FrmME: TFrmME;
  
implementation

uses 
  ncClassesBase, 
  ncaDM, 
  ncaFrmPri, 
  ufmImagens, 
  ncIDRecursos;

type
  THackCustomEdit = class ( TcxCustomEdit );   
  THackEditProperties = class ( TcxCustomEditProperties );
  

{$R *.DFM}

const
  EnterColor = $00F1E4E4;
       
procedure TFrmME.cmGravarClick(Sender: TObject);
var TF : Double;
begin
  TV.DataController.PostEditingData;
  TV.DataCOntroller.Post;
  Dados.tbPro.IndexName := 'ICodigo';
  try
    with Dados do begin
      tbCaixa.IndexName := 'INumero';
      if not tbCaixa.FindKey([NumAberto]) then begin
        Beep;
        ShowMessage('Caixa não encontrado!');
        Exit;
      end;
    end;

    if (MTStatusPagto.Value=spDebitado) and (MTContato.Value < 1) then begin
      Beep;
      ShowMessage('Para debitar é necessário informar o cliente');
      Exit;
    end;
    if MT.State in [dsInsert, dsEdit] then MT.Post;
    
    with Dados do
    DB.StartTransactionWith([tbCli, FTab, tMovEst, tAuxMovEst, tbPro]);
    try
      Dados.tbPro.IndexName := 'ICodigo';
      MT.Edit;
      MTNome.Value := MTNomeContato.Value;
      MTCaixaI.Value := NumAberto;
      MTCaixaF.Value := MTCaixaI.Value;
      if MTStatusPagto.Value=spDebitado then begin
        MTCaixaP.Value := 0;
        MTDataPagto.Clear;
      end else begin
        MTCaixaP.Value := NumAberto;
        MTDataPagto.Value := MTInicio.Value;
      end;  
      if FNovo then
        FTab.Insert
      else
        FTab.Edit;
      TransfDados(MT, FTab);
      if FNovo then FTab.FieldByName('Numero').Clear;
      FTab.Post;  
      FNumTran := FTab.FieldByname('Numero').AsInteger;   
      MT.Post;

      mtItens.DisableControls;
      Dados.tbPro.DisableControls;
      try
        SalvaItens;
      finally
        mtItens.EnableControls;
        Dados.tbPro.EnableControls;
      end;    
      
      Dados.TotalizaDebCli(MTContato.Value);
      
      with Dados do
      if (MTStatusPagto.Value = spDebitado) and tbCliTemDebito.Value and
         (tbCliDebito.Value>LimiteDebito(tbCliLimiteDebito))
      then 
        Raise Exception.Create('Não é possível deixar essa operação em débito. Débito máximo permitido foi ultrapassado');

      if (not FNovo) and (FContatoAnt<>0) then
        Dados.TotalizaDebCli(FContatoAnt);

      Dados.DB.Commit;
      if (FNumTran=0) then 
          ShowMessage('Ocorreu um erro interno. Por favor avise o suporte técnico '+
                      'da Cyber Manager que ocorreu o erro número 180. '+
                      'Obrigado, Equipe de Desenvolvimento Cyber Manager');
    except
      tMovEst.Cancel;
      Dados.DB.RollBack;
      Raise;
    end;
  finally
  end;  
  
  if Sender<>nil then Close;
end;

Function TFrmME.Valida: Boolean;
begin
   Result:= true;
   if mtItens.RecordCount = 0 then
     Result:= false;
end;

procedure TFrmME.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmME.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFrmME.FormCreate(Sender: TObject);
begin
  FLendoItens := False;
  with Dados, vgCab1Nome.Properties do 
  case tbConfigCampoLocalizaCli.Value of
    1 : begin
      Editors[2].Options.TabStop := False;
      Editors[0].Free;
      Editors[0].Width := 30;
    end;  
    2 : begin
      Editors[2].Options.TabStop := False;
      Editors[1].Free;
      Editors[0].Width := 30;
    end;  
  else
    Editors[0].Free;
    Editors[0].Free;
  end;  

  FInEdit := False;
  UltCol := TVTotal;
  FTotItens := 0;
  FocouTipo := False;
  tMovEst.Open;
  MT.Open;
  mtItens.Open;
  SaveIndex := Dados.tbCli.IndexName;
  Dados.AjustaCampoLocalizaCli;
  FNovo := False;
end;

procedure TFrmME.FormShow(Sender: TObject);
begin
  mtItens.DisableControls;
  try
    Dados.tbPro.IndexName := 'IDescricao';
    panTotal.Visible := (MTTipo.Value in [ttEstCompra, ttEstVenda]);
    if MTTipo.Value = ttEstVenda then
      cmRecibo.Visible := ivAlways;
      
    if panTotal.Visible then
      UltCol := TVUnitario
    else
      UltCol := TVQuant;
        
    vgTotPago.Visible := (MTTipo.Value=ttEstVenda);
    
    TVUnitario.Visible := panTotal.Visible;
    TVTotal.Visible := panTotal.Visible;
    mtItens.Append;
    case MTTipo.Value of
      ttEstVenda  : Caption := 'Venda Avulsa';
      ttEstCompra : begin
        Caption := 'Compra';
        TVUnitario.Caption := 'Custo Unitário';
      end;
      ttEstEntrada: begin
        Caption := 'Entrada de Produtos';
        VGCab1Nome.Visible := False;
      end;
      ttEstSaida  : begin
        Caption := 'Saída de Produtos';
        vgCab1Nome.Visible := False;
      end;  
    end;
  finally
    mtItens.EnableControls;
  end;    
end;

procedure TFrmME.mtItensAfterInsert(DataSet: TDataSet);
begin
  mtItensItem.Value := mtItens.RecordCount+1;
  mtItensQuant.Value := 1;
end;

function TFrmME.SalvarItem: Boolean;
begin
  Result := 
    (mtItensProduto.Value > '') and
    (mtItensQuant.Value > 0.0009);
end;

procedure TFrmME.LeItens;
var Item: Integer;
begin
  mtItens.EmptyTable;
  tMovEst.SetRange([MTNumero.Value], [MTNumero.Value]);
  Item := 0;
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
end;

procedure TFrmME.SalvaItens;
var 
  I, Tipo, Contador, Ultimo : Integer;
  Data : TDateTime;
  Produto : String;
  NumSeq : Integer;
  DescFinal, Fator : Double;
  Custo, 
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
  if (MTProdutos.Value > 0.009) and (MTDescontoProduto.Value > 0.009) then
    Fator := (MTDescontoProduto.Value / MTProdutos.Value)
  else
    Fator := 0;

  DescFinal := MTDescontoProduto.Value;  
    
  if not FNovo then begin  
    tMovEst.SetRange([MTNumero.Value], [MTNumero.Value]);
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
  end;  
    
  mtItens.DisableControls;
  
  Ultimo := 0;
  Contador := 0;
  mtItens.First;
  while not mtItens.Eof do begin
    Inc(Contador);
    if SalvarItem then Ultimo := Contador;
    mtItens.Next;
  end;
    
  I := 0;
  Contador := 0;
  mtItens.First;
  
  try
    while not mtItens.Eof do begin
      Inc(Contador);
      if SalvarItem then begin
        Inc(I);
        tMovEst.Append;
        tMovEstItem.Value := I;

        with dados do
        if tbPro.FindKey([mtItensProduto.Value]) then
          tMovEstCustoU.Value := tbProCustoUnitario.Value;

        tMovEstContato.Value := MTContato.Value;
        tMovEstTransacao.Value := FNumTran;
        tMovEstCaixaMov.Value := MTCaixaI.Value;
        tMovEstCaixaPag.Value := MTCaixaP.Value;
        tMovEstDataMov.Value := MTInicio.Value;
        tMovEstDataPag.Value := MTDataPagto.Value;
        tMovEstProduto.Value := mtItensProduto.Value;
        tMovEstQuant.Value := mtItensQuant.Value;
        tMovEstUnitario.Value := mtItensUnitario.Value;
        tMovEstTotal.Value := mtItensTotal.Value;
        tMovEstTipoTran.Value := MTTipo.Value;
        tMovEstEntrada.Value := (MTTipo.Value in [ttEstCompra, ttEstEntrada]);
        tMovEstEstoqueAnt.Value := 0;

        if Contador = Ultimo then
          tMovEstDesconto.Value := DescFinal
        else
          tMovEstDesconto.Value := DuasCasas(tMovEstTotal.Value * Fator);

        DescFinal := DescFinal - tMovEstDesconto.Value;
          
        tMovEst.Post;

        if (FNumTran<>0) and (tMovEstTransacao.Value=0) then
          ShowMessage('Ocorreu um erro interno. Por favor avise o suporte técnico '+
                      'da Cyber Manager que ocorreu o erro número 555. '+
                      'Obrigado, Equipe de Desenvolvimento Cyber Manager');
        
        if tMovEstTipoTran.Value=ttEstCompra then 
          Custo := DuasCasas(tMovEstUnitario.Value - (tMovEstUnitario.Value * Fator))
        else
          Custo := 0;  

        if (not tMovEstCancelado.Value) then begin
          Mov := tMovEstFatorSaldo.Value * tMovEstQuant.Value;
          Dados.AjustaEstoqueProduto(tMovEstProduto.Value, Custo, Mov);
        end;                                 
        
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
  finally
    mtItens.EnableControls;
  end;   
end;

procedure TFrmME.Editar(ATab: TnxTable);
begin
  FTab := ATab;
  MT.Insert;
  TransfDados(FTab, MT);
  FContatoAnt := MTContato.Value;
  MT.Post;
  MT.Edit;
  FTotAnt := MTTotalFinal.Value;
  FLendoItens := True;
  try
    LeItens;
  finally
    FLendoItens := False;
  end;    
  cmGravar.Enabled := PodeEditarTran(MT);
  ShowModal;
end;

procedure TFrmME.Criar(ATab: TnxTable; ATipoTran: Byte);
begin
  ATab.CancelRange;
  FNovo := True;
  FTab := ATab;
  MT.Insert;
  MT.Post;
  MT.Edit;
  MTTipo.Value := ATipoTran;
  MTStatusPagto.Value := spPago;
  mtItens.Active := True;
  if NumAberto<1 then
    cmGravar.Enabled := False;
  ShowModal;
end;

Function TFrmME.ValidaLinha: Boolean;
begin
  Result := (mtItensQuant.Value>0) and
            (mtItensProduto.Value<>'');
end;

procedure TFrmME.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter :
    if ssCtrl in Shift then begin
      cmGravarClick(cmGravar);
      Key := 0;
    end;
      
    Key_Esc   : Close;
  end;
end;

procedure TFrmME.mtItensAfterDelete(DataSet: TDataSet);
begin
  if mtItens.RecordCount=0 then mtItens.Append;
end;

procedure TFrmME.tMovEstCalcFields(DataSet: TDataSet);
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

procedure TFrmME.mtItensCalcFields(DataSet: TDataSet);
begin
  FTotItens := FTotItens - mtItensTotal.Value;
  mtItensTotal.Value := mtItensQuant.Value * mtItensUnitario.Value;
  FTotItens := FTotItens + mtItensTotal.Value;
  if MT.State in [dsEdit, dsInsert] then
    MTProdutos.Value := FTotItens;
end;

procedure TFrmME.mtItensBeforeDelete(DataSet: TDataSet);
begin
  FTotItens := FTotItens - mtItensTotal.Value;
  if MT.State in [dsEdit, dsInsert] then
    MTProdutos.Value := FTotItens;
end;

procedure TFrmME.mtItensProdutoValidate(Sender: TField);
var S: String;
begin
  if FLendoItens then Exit;
  if TV.Controller.FocusedColumn = TVUnitario then Exit;
  with Dados do
  if not tbPro.Locate('Codigo', Sender.Value, []) then begin
    mtItensUnitario.Value := 0;
    mtItensQuant.Value := 0;
    Raise Exception.Create('Código Inválido!');
  end else  
  case MTTipo.Value of
    ttEstCompra : mtItensUnitario.AsVariant := tbPro.Lookup('Codigo', Sender.Value, 'CustoUnitario');
    ttEstVenda  : mtItensUnitario.AsVariant := tbPro.Lookup('Codigo', Sender.Value, 'Preco');
  end;
  
{ mtItensProduto.As
  S := Dados.tbProCodigo.AsString + ' == ' + Dados.tbProPreco.AsString;
  if S = '553476523zzz4' then
    mtItensProduto.Va}
end;

procedure TFrmME.mtItensProdutoChange(Sender: TField);
begin
{ if TV.Controller.FocusedColumn = TVUnitario then Exit;
  mtItensUnitario.Value := 0;
  with Dados do
  if tbPro.Locate('Codigo', mtItensProduto.Value, []) then
  case MTTipo.Value of
    ttEstCompra : mtItensUnitario.Value := tbProCustoUnitario.Value;
    ttEstVenda : mtItensUnitario.Value := tbProPreco.Value;
  else
    mtItensUnitario.Value := 0;
  end;    }
end;

procedure TFrmME.cmApagarItemClick(Sender: TObject);
begin
  if mtItens.State in [dsEdit, dsInsert] then mtItens.Post;
  if mtItens.RecordCount > 0 then
    mtItens.Delete;
end;

procedure TFrmME.cmNovoItemClick(Sender: TObject);
begin
  if mtItens.State in [dsEdit, dsInsert] then begin
    if SalvarItem then begin
      mtItens.Post;
      mtItens.Append;
    end;
  end else
    mtItens.Append;    
end;

procedure TFrmME.FormDestroy(Sender: TObject);
begin
  Dados.tbCli.IndexName := SaveIndex;
end;

procedure TFrmME.cmReciboClick(Sender: TObject);
var 
  Arq: TextFile;
  I : Integer;
  SL : TStrings;
begin
  AssignFile(Arq, Dados.tbConfigPortaImpRec.Value);
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
    if MTNomeContato.Value>'' then 
      Writeln(Arq, ' CLIENTE: ' + MTNomeContato.Value);
      
    Writeln(Arq, CharStr('-', tbConfigLargImpRec.Value));

    Writeln(Arq, ' PRODUTOS / SERVICOS       QUANT  VL.TOTAL ');
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
    if MTDescontoProduto.Value > 0.009 then begin
      Writeln(Arq, ' SUB-TOTAL === ' + ValorStr(MTProdutos.Value));
      Writeln(Arq, ' DESCONTO ==== ' + ValorStr(MTDescontoProduto.Value));
    end;    
    Writeln(Arq,   ' TOTAL FINAL = ' + ValorStr(MTTotalFinal.Value));
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

procedure TFrmME.TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if ANewItemRecordFocusingChanged then
    TV.Controller.FocusedColumnIndex := 0;
end;

procedure TFrmME.TVUnitarioGetProperties(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := (MTTipo.Value=ttEstVenda) and (not mtItensPodeAlterarPreco.Value);
end;

procedure TFrmME.vgTotDescontoEditPropertiesChange(Sender: TObject);
begin                                                                                      
  vgTot.DataController.PostEditingData;
end;

procedure TFrmME.vgTotDescontoPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daTraDesconto);
end;

procedure TFrmME.MTAfterInsert(DataSet: TDataSet);
begin
  MTInicio.Value := Now;
  MTFim.Value := Now;
  MTFuncI.Value := Dados.CM.Username;
  MTFuncF.Value := Dados.CM.Username;
end;

procedure TFrmME.MTCalcFields(DataSet: TDataSet);
begin
  MTTotalFinal.Value := MTProdutos.Value - MTDescontoProduto.Value;
end;

procedure TFrmME.vgCab1NomeEditors0EditPropertiesInitPopup(
  Sender: TObject);
begin
  Dados.tbCli.IndexName := 'ICodigo';
end;

procedure TFrmME.vgCab1NomeEditors1EditPropertiesInitPopup(
  Sender: TObject);
begin
  Dados.tbCli.IndexName := 'IUsername';
end;

procedure TFrmME.vgCab1NomeEditors2EditPropertiesInitPopup(
  Sender: TObject);
begin
  Dados.tbCli.IndexName := 'INome';
end;

procedure TFrmME.TVEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
var V: Variant;  
begin
  with TV.DataController do
  if (MTTipo.Value=ttEstVenda) and (AItem=TVUnitario) then begin
    V := TV.DataController.Values[FocusedRecordIndex, TVUNitario.Index];
    AAllow := (V=Null) or (V<0.01) or Permitido(daProEditarPreco);
  end;  
end;

end.




