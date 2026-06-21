unit uCMFrmAcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxInspRw, dxDBInRw, dxInspct, dxCntner, dxDBInsp, ExtCtrls, dxBar, Db,
  kbmMemTable, ffdb, dxEditor, dxExEdtr, dxDBEdtr, dxDBELib, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomSimpleLabel, LMDSimpleLabel, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, LMDDBSimpleLabel, StdCtrls, DBCtrls,
  LMDCustomParentPanel, LMDCustomGroupBox, LMDGroupBox, dxBarExtItems,
  Mask, dxDBGrid, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, ComCtrls,
  {$ifdef Ver150}
  Variants,
  {$endif}
  LMDCustomLabel, LMDLabel, LMDButtonControl, LMDCustomCheckBox,
  LMDCheckBox, LMDDBLabel, dxPageControl, OvcBase, OvcEF, OvcPB, OvcNF,
  OvcDbNF, OvcSF, OvcDbSF, ToolEdit, CurrEdit, OvcPF, Buttons, ImgList;

type

  TFrmAcesso = class(TForm)
    BarMgr: TdxBarManager;
    dsTab: TDataSource;
    Tab: TkbmMemTable;
    TabNumero: TAutoIncField;
    TabAberto: TBooleanField;
    TabInicio: TDateTimeField;
    TabFim: TDateTimeField;
    TabContato: TIntegerField;
    TabNome: TStringField;
    TabMaquina: TWordField;
    TabFuncI: TStringField;
    TabFuncF: TStringField;
    TabTempo: TDateTimeField;
    TabMotivoDesc: TWordField;
    TabValor: TCurrencyField;
    TabObs: TMemoField;
    TabCredUsado: TIntegerField;
    TabCredAnterior: TIntegerField;
    TabIsento: TBooleanField;
    TabData: TDateTimeField;
    TabCredUsadoT: TDateTimeField;
    TabCredAntT: TDateTimeField;
    TabDataPagto: TDateTimeField;
    TabMotivo: TStringField;
    TabDesconto: TCurrencyField;
    TabValorFinal: TCurrencyField;
    TabNomeContato: TStringField;
    TabCreditoCli: TIntegerField;
    TabTempoTicks: TIntegerField;
    TabFormaPagto: TStringField;
    cmFuncFim: TdxBarStatic;
    TabSubTotal: TCurrencyField;
    cmData: TdxBarStatic;
    cmPagamento: TdxBarStatic;
    TabCaixa: TIntegerField;
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
    tItensME: TffTable;
    tItensMEProduto: TStringField;
    tItensMEItem: TWordField;
    tItensMETotal: TCurrencyField;
    tItensMENomeProduto: TStringField;
    tItensMEEmissor: TIntegerField;
    tItensMESerie: TStringField;
    tItensMENumero: TIntegerField;
    tItensMEQuant: TFloatField;
    tItensMEUnitario: TCurrencyField;
    tItensMEDesconto: TCurrencyField;
    tItensMEData: TDateTimeField;
    tItensMEMovEst: TBooleanField;
    tItensMECancelado: TBooleanField;
    tItensMEEstoqueAnt: TFloatField;
    tItensMETipoMov: TStringField;
    tItensMEContato: TIntegerField;
    tItensMENumSeq: TAutoIncField;
    tItensMEFatorSaldo: TIntegerField;
    tItensMEEntrada: TBooleanField;
    tItensMESaldo: TFloatField;
    dstbItens: TDataSource;
    cmFuncInicio: TdxBarStatic;
    tItensMECaixa: TIntegerField;
    mtItensTotal: TFloatField;
    mtItensProduto: TStringField;
    TabTipoAcesso: TWordField;
    TabSinal: TCurrencyField;
    mtSinal: TkbmMemTable;
    dsSinal: TDataSource;
    mtSinalCaixa: TIntegerField;
    mtSinalAcessoPago: TIntegerField;
    mtSinalValor: TCurrencyField;
    OvcController1: TOvcController;
    mtSinalFuncI: TStringField;
    TabValorAcesso: TCurrencyField;
    mtSinalNumero: TIntegerField;
    mtSinalInicio: TDateTimeField;
    mtSinalNomeFunc: TStringField;
    tAcesso: TffTable;
    tSinal: TffTable;
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
    ImageList1: TImageList;
    TabIsentoCli: TBooleanField;
    cmManutencao: TdxBarLargeButton;
    TabManutencao: TBooleanField;
    PagPri: TdxPageControl;
    tsPagNormal: TdxTabSheet;
    tsPagManut: TdxTabSheet;
    panDiv2: TLMDSimplePanel;
    lbNumM: TLMDLabel;
    InspCab: TdxDBInspector;
    InspTipoAcesso: TdxInspectorLookupRow;
    InspCad: TdxInspectorLookupRow;
    InspAvulso: TdxInspectorDBRow;
    InspObs: TdxInspectorDBMemoRow;
    Paginas: TdxPageControl;
    tsSinal: TdxTabSheet;
    LMDSimplePanel3: TLMDSimplePanel;
    gbPrePago: TGroupBox;
    LMDSimpleLabel2: TLMDSimpleLabel;
    lbTempo: TLMDSimpleLabel;
    edLimiteTempo: TOvcPictureField;
    edSinal: TCurrencyEdit;
    panDivPausa: TLMDSimplePanel;
    gbPausar: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edPausaTempo: TOvcPictureField;
    edPausaHora: TOvcPictureField;
    btnRecalc: TBitBtn;
    panGridSinal: TLMDSimplePanel;
    GridSinal: TdxDBGrid;
    GridSinalValor: TdxDBGridCurrencyColumn;
    GridSinalInicio: TdxDBGridDateColumn;
    GridSinalFuncI: TdxDBGridMaskColumn;
    GridSinalCaixa: TdxDBGridMaskColumn;
    bdcSinal: TdxBarDockControl;
    tsProdutos: TdxTabSheet;
    LMDSimplePanel4: TLMDSimplePanel;
    lbTotalVendas: TLMDDBLabel;
    lbVendas: TLMDLabel;
    gridItens: TdxDBGrid;
    gridItensProduto: TdxDBGridColumn;
    gridItensNomePro: TdxDBGridLookupColumn;
    gridItensQuant: TdxDBGridMaskColumn;
    gridItensValor: TdxDBGridCurrencyColumn;
    gridItensTotal: TdxDBGridMaskColumn;
    tsAcesso: TdxTabSheet;
    panAcesso: TLMDSimplePanel;
    panDivA3: TLMDSimplePanel;
    bdcAcesso2: TdxBarDockControl;
    Insp: TdxDBInspector;
    InspInternet: TdxInspectorDBCurrencyRow;
    InspCredUsadoT: TdxInspectorDBTimeRow;
    InspCredAntT: TdxInspectorDBTimeRow;
    InspTempo: TdxInspectorDBTimeRow;
    InspTempoCobrado: TdxInspectorDBTimeRow;
    InspRow6: TdxInspectorDBCheckRow;
    InspTotalFinal: TdxInspectorDBCurrencyRow;
    InspDesconto: TdxInspectorDBCurrencyRow;
    InspServicos: TdxInspectorDBCurrencyRow;
    InspSinal: TdxInspectorDBCurrencyRow;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDLabel2: TLMDLabel;
    InspM: TdxDBInspector;
    InspManut: TdxInspectorDBMemoRow;
    InspMRow6: TdxInspectorLookupRow;
    TabNomeFuncI: TStringField;
    TabNomeFuncF: TStringField;
    InspMRow7: TdxInspectorLookupRow;
    InspMData: TdxInspectorDBDateRow;
    InspMInicio: TdxInspectorDBTimeRow;
    InspMFim: TdxInspectorDBTimeRow;
    InspMTempo: TdxInspectorDBTimeRow;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure InspNomeContatoChange(Sender: TObject);
    procedure TabQtdPretoChange(Sender: TField);
    procedure gridItensCustomDrawFooter(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      var AText: String; var AColor: TColor; AFont: TFont;
      var AAlignment: TAlignment; var ADone: Boolean);
    procedure InspRow12CloseUp(Sender: TObject; var Value: Variant;
      var Accept: Boolean);
    procedure gridItensChangeNodeEx(Sender: TObject);
    procedure gridItensEnter(Sender: TObject);
    procedure gridItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridItensMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure gridItensItemGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
    procedure mtItensAfterInsert(DataSet: TDataSet);
    procedure mtItensAfterDelete(DataSet: TDataSet);
    procedure tItensMECalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure InspTotalFinalDrawValue(Sender: TdxInspectorRow;
      ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
      var AColor: TColor; var ADone: Boolean);
    procedure mtItensBeforeDelete(DataSet: TDataSet);
    procedure lbVendasClick(Sender: TObject);
    procedure gridItensExit(Sender: TObject);
    procedure mtItensProdutoValidate(Sender: TField);
    procedure mtItensCalcFields(DataSet: TDataSet);
    procedure mtSinalBeforeDelete(DataSet: TDataSet);
    procedure mtSinalCalcFields(DataSet: TDataSet);
    procedure GridSinalEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure cmNovoSinalClick(Sender: TObject);
    procedure edPausaTempoChange(Sender: TObject);
    procedure edPausaHoraChange(Sender: TObject);
    procedure btnRecalcClick(Sender: TObject);
    procedure edSinalChange(Sender: TObject);
    procedure edLimiteTempoChange(Sender: TObject);
    procedure InspEnter(Sender: TObject);
    procedure TabAfterEdit(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure InspCadEditButtonClick(Sender: TObject);
    procedure cmManutencaoClick(Sender: TObject);
    procedure InspMExit(Sender: TObject);
  private
    { Private declarations }
    FTab : TffTable;
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

    procedure Editar(aTab: TffTable; Pagina: Integer);
    procedure EditarEsp(aTab: TffTable; RO: Boolean; Pagina: Integer);
    procedure Iniciar;
    { Public declarations }
  end;

var
  FrmAcesso: TFrmAcesso;

implementation

uses uCMFrmPri, cmClassesBase, uCMDados, cmIDRecursos;

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
             edSinal.Value,
             TabTipoAcesso.Value)
    else 
      LoginMaq(TabMaquina.Value, 0, 'anonimo', 'anonimo', TabNome.Text, TabObs.Value, 
               DateTimeToTicks(edPausaTempo.AsDateTime),
               edSinal.Value,
               TabTipoAcesso.Value);
  Close;
end;

procedure TFrmAcesso.GravaEditar;
var M : TCMMaquina;
begin
  if not TabAberto.Value then begin
    TabDataPagto.AsDateTime := Date;
    TabCaixa.Value := NumAberto;
  end;

  Dados.tbPro.IndexName := 'ICodigo';
  Tab.Post;
  
  if mtSinal.State in [dsEdit, dsInsert] then mtSinal.Post;
  if mtItens.State in [dsEdit, dsInsert] then mtItens.Post;
  RecalcValores;
  FTab.DisableControls;
  FTab.AutoCalcFields := False;
  try
    Dados.tbCli.IndexName := 'ICodigo';
    if TabDesconto.Value > TabValor.Value then begin
      Beep;
      ShowMessage('Desconto não pode ser maior que valor de Internet!');
      Exit;
    end;  
  
    with Dados do begin
      tbCaixa.Refresh;
      tbCaixa.IndexName := 'INumero';
      
      if not tbCaixa.FindKey([NumAberto]) then begin
        Beep;
        ShowMessage('Caixa não encontrado!');
        Exit;
      end;
      
      DB.StartTransaction;
//      DB.StartTransactionWith([tbCli, tbCaixa, tSinal, tItensME, tAuxItens, tbPro, FTab]);
      try
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
  
        tbCaixa.Edit;
        
        if (NumAberto>0) and 
           (FTab.FieldByName('Caixa').Value = NumAberto) and
           (not FTab.FieldByName('DataPagto').IsNull) and 
           (FTab.FieldByName('DataPagto').AsDateTime>10) then
        begin
          tbCaixa.FieldByName('Vendas').AsFloat :=
            tbCaixa.FieldByName('Vendas').AsFloat -
            FTab.FieldByName('Produtos').AsFloat;
  
          tbCaixa.FieldByName('Internet').AsFloat := 
            tbCaixa.FieldByName('Internet').AsFloat -
            CalcAcesso(FTab.FieldByName('Valor').AsFloat,
                       FTab.FieldByName('Sinal').AsFloat,
                       FTab.FieldByName('Desconto').AsFloat);
                       
          tbCaixa.FieldByName('Descontos').AsFloat := 
            tbCaixa.FieldByName('Descontos').AsFloat -
            FTab.FieldByName('Desconto').AsFloat;          
        end;
  
        if TabContato.Value > 0 then
        if tbCli.FindKey([TabContato.Value]) then begin
          tbCli.Edit;
          
          if TabContato.Value <> FContatoAnt then begin
          
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
        
        FTab.Edit;
        
        with FTab.FieldByName('Tipo') do
        if TabProdutos.AsFloat > 0.009 then 
          AsInteger := taInternetImpressao
        else
          AsInteger := taInternet;    
        
        FTab.FieldByName('Caixa').AsInteger := TabCaixa.Value;
        FTab.FieldByName('TipoAcesso').AsInteger := TabTipoAcesso.Value;
        FTab.FieldByName('Nome').Value := TabNome.Value;
        FTab.FieldByName('Contato').AsInteger := TabContato.Value;
        if TabContato.Value > 0 then
          FTab.FieldByName('Nome').AsString := TabNomeContato.Value;
        FTab.FieldByName('Valor').AsFloat := TabValor.Value;
        FTab.FieldByName('Desconto').AsFloat := TabDesconto.Value;
        FTab.FieldByName('MotivoDesc').AsInteger := TabMotivoDesc.Value;
        FTab.FieldByName('CredUsado').AsInteger := TabCredUsado.Value;
        FTab.FieldByName('CredAnterior').AsInteger := TabCredAnterior.Value;
        FTab.FieldByName('DataPagto').Value := TabDataPagto.AsVariant;
        FTab.FieldByName('Obs').Value := TabObs.Value;
        FTab.FieldByName('Produtos').Value := TabProdutos.Value;
        FTab.FieldByName('NaoUsarPacote').AsBoolean := TabNaoUsarPacote.Value;
        FTab.FieldByName('Sinal').AsFloat := TabSinal.Value;
        FTab.FieldByName('ValorFinalAcesso').Value := 
          CalcAcesso(FTab.FieldByName('Valor').AsFloat,
                     FTab.FieldByName('Sinal').AsFloat,
                     FTab.FieldByName('Desconto').AsFloat);
        
  
        if (not TabDataPagto.IsNull) and 
           (TabDataPagto.AsDateTime > 10) and
           (NumAberto>0) and 
           (TabCaixa.Value=NumAberto) then
        begin   
          tbCaixa.FieldByName('Internet').AsFloat := 
            tbCaixa.FieldByName('Internet').AsFloat +
            CalcAcesso(FTab.FieldByName('Valor').AsFloat,
                       FTab.FieldByName('Sinal').AsFloat,
                       FTab.FieldByName('Desconto').AsFloat);

          tbCaixa.FieldByName('Vendas').AsFloat :=
            tbCaixa.FieldByName('Vendas').AsFloat +
            FTab.FieldByName('Produtos').AsFloat;
  
          tbCaixa.FieldByName('Descontos').AsFloat := 
            tbCaixa.FieldByName('Descontos').AsFloat +
            FTab.FieldByName('Desconto').AsFloat;          
        end;    
          
        SalvaSinais;  
        tbCaixa.Post;  
        SalvaItens;
        FTab.Post;

  
        DB.Commit;

        M := CM.Maquinas.PorAcesso[TabNumero.Value];
        if M <> nil then begin
          M.AtualizaCache;
          if M.AguardaPagto and (not TabDataPagto.IsNull) then
            M.ZeraInfoAcesso
          else begin  
            M.TipoAcesso := TabTipoAcesso.Value;
            M.Vendas := TabProdutos.Value;
            M.Sinal  := TabSinal.Value;
            M.Contato := TabContato.Value;
            M.NomeContato := TabNomeContato.Value;
            M.ObsAcesso   := TabObs.Value;
            M.Nome        := TabNome.Value;
            M.LimiteTempo := DateTimeToTicks(edPausaTempo.AsDateTime);
            if M.Contato > 0 then 
              M.CreditoCli := ObtemCred(tbCli.FieldByName('CreditoM').AsInteger)
            else
              M.CreditoCli := 0;
          end;    
              
          CM.SalvaAlteracoesObj(M, False);
        end;  
          
      except
        tbCaixa.Cancel;
        FTab.Cancel;
        tbCli.Cancel;
        DB.Rollback;
        Raise;
      end; 
    end;   
  finally
    FTab.EnableControls;
    FTab.AutoCalcFields := True;
  end;   
  Close;
end;


procedure TFrmAcesso.cmGravarClick(Sender: TObject);
begin
  if FIniciar then
    GravaIniciar
  else
    GravaEditar;  
end;

procedure TFrmAcesso.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAcesso.Iniciar;
begin
  lbNumM.Font.Color := clNavy;
  if Permitido(reMaquinas, taMaqConfigurar) then
    cmManutencao.Visible := ivAlways;
  cmGravar.Caption := '&Iniciar';
  cmGravar.LargeImageIndex := 1;
  Height := Height - panGridSinal.Height - 21;
  Dados.tbTipoAcesso.First;
  Paginas.ActivePageIndex := 0;
  panGridSinal.Visible := False;
  Paginas.HideButtons := True;
  Tab.Insert;
  FIniciar := True;
  TabTipoAcesso.Value := Dados.tbTipoAcesso.FieldByName('Codigo').AsInteger;
  TabMaquina.Value := Dados.mtMaquinaNumero.Value;
  Caption := 'Liberar Uso';
  ShowModal;
end;

procedure TFrmAcesso.EditarEsp(aTab: TffTable; RO: Boolean; Pagina: Integer);
var 
  I : Integer;
  M : TCMMaquina;
begin
  Paginas.ActivePageIndex := Pagina;
  
  FTab := aTab;

  cmGravar.Enabled := (not RO) and 
                      (NumAberto>0) and
                      ((FTab.FieldByName('Caixa').AsInteger=0) or
                       (FTab.FieldByName('DataPagto').IsNull) or
                       (FTab.FieldByName('Caixa').AsInteger=NumAberto) );

  cmData.Caption := 'Data: ' + FormatDateTime('dd/mm/yyyy hh:mm', FTab.FieldByName('Inicio').AsDateTime);
  cmPagamento.Caption := 'Pagamento: ' + FormatDateTime('dd/mm/yyyy', FTab.FieldByName('DataPagto').AsDateTime);
  cmFuncInicio.Caption := 'Func. Inicio: ' + FTab.FieldByName('FuncI').AsString;
  cmFuncFim.Caption := 'Func. Fim: ' + FTab.FieldByName('FuncF').AsString;

  Dados.tbCli.IndexName := 'INome';

  Insp.Enabled := not FTab.FieldByName('Aberto').AsBoolean;

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

  if Insp.Enabled then begin
    panDivPausa.Visible := False;
    gbPausar.Visible := False;
    edLimiteTempo.Visible := False;
    lbTempo.Visible := False;
  end;

  edSinal.ReadOnly := True;
  edSinal.TabStop := False;

  FLendo := True;
  try
    LeItens; 
    LeSinais;
  finally
    FLendo := False;
  end;    

  RecalcValores;

  if TabAberto.Value then begin
    M := Dados.CM.Maquinas.PorAcesso[TabNumero.Value];
    if M <> nil then 
      edPausaTempo.AsDateTime := TicksToDateTime(M.LimiteTempo);
  end;  
  
  ShowModal;
end;

procedure TFrmAcesso.Editar(aTab: TffTable; Pagina: Integer);
begin
  EditarEsp(aTab, False, Pagina);
end;

procedure TFrmAcesso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter, Key_Tab : 
    if ssCtrl in Shift then 
      cmGravarClick(nil)
    else
    if ssShift in Shift then begin
      if edSinal.Focused then begin
        InspCab.SetFocus;
        InspCab.FocusedField := TabObs;
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
  end;
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
  Dados.tbCli.IndexName := 'INome';
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
  PagPri.ActivePage := tsPagNormal;
  FLendo := False;
  edSinal.Value := 0;
  edLimiteTempo.AsDateTime := 0;
  edPausaHora.AsDateTime := 0;
  edPausaTempo.AsDateTime := 0;
  FTotVendas := 0;
  FTotSinal := 0;
  Recalc := False;
  Tab.Active := True;
  mtItens.Open;
  tItensME.Open;
  tSinal.Open;
  tAcesso.Open;
  mtSinal.Active := True;
  InspM.DividerPos := 117;
  InspCab.DividerPos := 120;
end;

procedure TFrmAcesso.InspNomeContatoChange(Sender: TObject);
begin
  TabNome.Value := TabNomeContato.Value;
end;

procedure TFrmAcesso.RecalcValores;
var
  Cred, CreditoUsado, TempoCobrado, Ticks : Cardinal;
  Valor  : Double;
  TA : TCMTipoAcesso;
begin
  if not (Tab.State in [dsEdit, dsInsert]) or Recalc or TabAberto.Value or TabManutencao.Value then Exit;
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
      if (TA=nil) and (TiposAcesso.Count>0) then
        TA := TiposAcesso.Itens[0]
      else
        Exit;  
      CalculaTempoValor(TabInicio.Value, Ticks, Cred, 
                        TA.Codigo, TA.PHoraCor^, CorPrecos, 
                        Config.PacoteTempoReal,
                        TempoCobrado, CreditoUsado, Valor);
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

procedure TFrmAcesso.TabQtdPretoChange(Sender: TField);
begin
  RecalcValores;
end;

procedure TFrmAcesso.gridItensCustomDrawFooter(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; var AText: String; var AColor: TColor;
  AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
begin
  AFont.Style := [fsBold];
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

procedure TFrmAcesso.gridItensChangeNodeEx(Sender: TObject);
begin
  gridItens.FocusedField := mtItensProduto;
end;

procedure TFrmAcesso.gridItensEnter(Sender: TObject);
begin
  lbVendas.Color := clTeal;
  gridItens.FocusedField := mtItensProduto;
end;

procedure TFrmAcesso.gridItensKeyDown(Sender: TObject; var Key: Word;
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
    if gridItens.FocusedNode.Index = 0 then begin
//      Insp.SetFocus;
      Key := 0;
    end;  
    
    Key_Enter : 
    if (gridItens.FocusedField.FieldName = 'Quant') then
    if SalvarItem then begin
      if mtItens.State in [dsEdit, dsInsert] then mtItens.Post;
      if (gridItens.FocusedNode.Index+1) = mtItens.RecordCount then
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

procedure TFrmAcesso.gridItensMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if mtItens.State = dsInsert then mtItens.Post;
  if (Button = mbRight) and 
     (mtItens.RecordCount > 0) and
     (gridItens.GetNodeAt(X, Y) <> nil) then
  if MessageDlg('Apagar este item ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes    
    then mtItens.Delete
end;

procedure TFrmAcesso.gridItensItemGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
  Text := IntToStr(ANode.Index);
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
      mtSinalAcessoPago.Value := tSinal.FieldByName('AcessoPago').AsInteger;
      mtSinalCaixa.Value := tSinal.FieldByName('Caixa').AsInteger;
      mtSinalFuncI.Value := tSinal.FieldByName('FuncI').AsString;
      mtSinal.Post;
      tSinal.Next;
    end;  
  finally
    tSinal.CancelRange;
    mtSinal.EnableControls;
  end;    
  if Tab.State in [dsInsert, dsEdit] then
    TabSinal.Value := FTotSinal;
  edSinal.Value := FTotSinal;
  edSinalChange(nil);        
end;

procedure TFrmAcesso.LeItens;
var Item: Integer;
begin
  mtItens.EmptyTable;
  tItensME.SetRange([0, 'AC', TabNumero.Value], 
                     [0, 'AC', TabNumero.Value]);
  Item := 0;
  FTotVendas := 0;
  mtItens.DisableControls;
  try
    tItensME.First;
    while not tItensME.Eof do begin
      Inc(Item);
      mtItens.Append;
      mtItensItem.Value := Item;
      mtItensProduto.Value := tItensMEProduto.Value;
      mtItensQuant.Value := tItensMEQuant.Value;
      mtItensUnitario.Value := tItensMEUnitario.Value;
      mtItens.Post;
      tItensME.Next;
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
  mtSinal.DisableControls;
  try
    if mtSinal.State=dsEdit then
      mtSinal.Post;
    mtSinal.First;
    while not mtSinal.Eof do begin
      if (mtSinalCaixa.Value=NumAberto) then begin
        if tSinal.Locate('Numero', mtSinalNumero.Value, []) then 
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
          tSinal.FieldByName('Tipo').AsInteger := taSinal;
          tSinal.FieldByName('Caixa').AsInteger := mtSinalCaixa.Value;
          tSinal.FieldByName('AcessoPago').AsInteger := TabNumero.Value;
          tSinal.FieldByName('FuncI').AsString := Dados.CM.Username;
          tSinal.FieldByName('FuncF').AsString := Dados.CM.Username;
          tSinal.FieldByName('Aberto').AsBoolean := False;
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
  finally
    mtSinal.EnableControls;
  end;
  if Abs(DifSinal)>0.0009 then with Dados, tbCaixa do
    FieldByName('Internet').AsFloat := FieldByName('Internet').AsFloat + DifSinal;
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
    if (mtItensProduto.Value = tItensMEProduto.Value) and SalvarItem then 
      Exit;
    mtItens.Next;
  end;
  Result := True;
end;
  
begin
  tItensME.SetRange([0, 'AC', TabNumero.Value], 
                     [0, 'AC', TabNumero.Value]);
  tItensME.First;
  while not (tItensME.Eof and tItensME.Bof) do begin
    if (not tItensMEData.IsNull) and ApagouProduto then begin
      Data := tItensMEData.Value;
      Produto := tItensMEProduto.Value;
      NumSeq := tItensMENumSeq.Value;
    end else
      Produto := '';

    if (not tItensMECancelado.Value) and tItensMEMovEst.Value then begin
      if not tItensMEData.IsNull then 
        Mov := tItensMEFatorSaldo.Value * tItensMEQuant.Value
      else 
        Mov  := tItensMEQuant.Value;
      Dados.AjustaEstoqueProduto(tItensMEProduto.Value, 0, (-1 * Mov), 0);
    end;                                 

    SaldoAnt := tItensMEEstoqueAnt.Value;                                 
    tItensME.Delete;
    
    if Produto <> '' then 
      Dados.AjustaSaldoPosterior(Produto, Data, NumSeq, SaldoAnt);
  end;  
  
  mtItens.First;
  mtItens.DisableControls;
  I := 0;
  try
    while not mtItens.Eof do begin
      if SalvarItem then begin
        Inc(I);
        tItensME.Append;
        tItensMEItem.Value := I;
        tItensMEEmissor.Value := 0;
        tItensMESerie.Value := 'AC';
        tItensMENumero.Value := TabNumero.Value;
        tItensMEProduto.Value := mtItensProduto.Value;
        tItensMEQuant.Value := mtItensQuant.Value;
        tItensMEUnitario.Value := mtItensUnitario.Value;
        tItensMETotal.Value := mtItensTotal.Value;
        tItensMETipoMov.Value := 'VENDA';
        tItensMEEntrada.Value := False;
        tItensMECaixa.Value := FTab.FieldByName('Caixa').AsInteger;
        tItensMEMovEst.Value := True;
        tItensMECancelado.Value := False;
        tItensMEEstoqueAnt.Value := 0;
        tItensMEData.Value := TabInicio.Value;
        tItensME.Post;
        
        Dados.AjustaEstoqueProduto(tItensMEProduto.Value, 0, -1 * tItensMEQuant.Value, 0);
        
        tItensME.Edit;
        tItensMEEstoqueAnt.Value := 
          Dados.ObtemSaldoAnterior(tItensMEProduto.Value, 
                                   tItensMEData.Value,
                                   tItensMENumSeq.Value);
          tItensME.Post;                           
          
        Dados.AjustaSaldoPosterior(tItensMEProduto.Value, 
                                   tItensMEData.Value,
                                   tItensMENumSeq.Value,
                                   tItensMESaldo.Value);
      end;  
      mtItens.Next;
    end;
  finally
    mtItens.EnableControls;
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

procedure TFrmAcesso.tItensMECalcFields(DataSet: TDataSet);
begin
  if tItensMEData.IsNull or tItensMECancelado.Value or (not tItensMEMovEst.Value) then
    tItensMEFatorSaldo.Value := 0
  else
  if tItensMEEntrada.Value then
    tItensMEFatorSaldo.Value := 1
  else
    tItensMEFatorSaldo.Value := -1;
  tItensMESaldo.Value := 
    tItensMEEstoqueAnt.Value +  
    (tItensMEFatorSaldo.Value * tItensMEQuant.Value);
end;

procedure TFrmAcesso.FormShow(Sender: TObject);
begin
  lbNumM.Caption := TabMaquina.AsString;
  if TabManutencao.Value then begin
    PagPri.ActivePage := tsPagManut;
    Exit;
  end;  
    
  tsAcesso.TabVisible := not TabAberto.Value;
  if Dados.CM.Config.MostraCliCadAntesAvulso then
    InspAvulso.Node.MoveTo(InspObs.Node, inaInsert);
  
  InspTipoAcesso.Visible := Dados.CM.Config.VariosTiposAcesso;
  Dados.tbPro.IndexName := 'IDescricao';
  Dados.tbCli.IndexName := 'INome';
  mtItens.Append;
  case Paginas.ActivePageIndex of
    0 : begin
     InspCab.SetFocus;
     InspCab.FocusedField := TabObs;
     if Dados.CM.Config.MostraCliCadAntesAvulso then
       InspCab.FocusedField := TabNomeContato
     else
       InspCab.FocusedField := TabNome;
     InspCab.SetFocus;  
    end;

    1 : gridItens.SetFocus;
    2 : begin
      Insp.SetFocus;
      Insp.FocusedField := Tab.FieldByName('Desconto');
    end;  
  end;  
  InspDesconto.ReadOnly := not Permitido(reTransacoes, taTraDesconto);
end;

procedure TFrmAcesso.InspTotalFinalDrawValue(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AColor := clGray;
  AFont.Style := [fsBold];
  AFont.Color := clWhite;
end;

procedure TFrmAcesso.mtItensBeforeDelete(DataSet: TDataSet);
begin
  FTotVendas := FTotVendas - mtItensTotal.Value;
  if Tab.State in [dsInsert, dsEdit] then
    TabProdutos.Value := FTotVendas;
end;

function TFrmAcesso.ItemAtual: Integer;
begin
  Result := Succ(gridItens.FocusedNode.Index);
end;

procedure TFrmAcesso.lbVendasClick(Sender: TObject);
begin
  gridItens.SetFocus;
end;

procedure TFrmAcesso.gridItensExit(Sender: TObject);
begin
  lbVendas.Color := clGray;
end;

procedure TFrmAcesso.mtItensProdutoValidate(Sender: TField);
begin
  with Dados do
  if tbPro.Locate('Codigo', mtItensProduto.Value, []) then
    mtItensUnitario.Value := tbProPreco.Value
  else
  if mtItensProduto.Value>'' then begin
    mtItensUnitario.Value := 0;
    mtItensQuant.Value := 0;
    Raise Exception.Create('Código Inválido!');
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
  edSinal.Value := FTotSinal;
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
    edSinal.Value := FTotSinal;
end;

procedure TFrmAcesso.GridSinalEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
var V : Variant;  
begin
  V := Node.Values[GridSinalCaixa.Index];
  Allow := (V<>Null) and (NumAberto>0) and (V=NumAberto);
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
    btnRecalc.Visible := True and FIniciar;
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
    btnRecalc.Visible := True and FIniciar;
  finally
    Calculando := False;
  end;    
end;

procedure TFrmAcesso.btnRecalcClick(Sender: TObject);
begin
  btnRecalc.Visible := False;
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
        NumTicks := ObtemTempo(Now, TA.Codigo, TA.PHoraCor^, CorPrecos, edSinal.Value);
        edLimiteTempo.AsDateTime := TicksToDateTime(NumTicks);
        edPausaTempo.AsDateTime := edLimiteTempo.AsDateTime;
        edPausaHora.AsDateTime := Now + edLimiteTempo.AsDateTime;
      end;
    end;    
  finally
    Calculando := False;
  end;    
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
                            TempoCobrado, Credito, Valor);
        edSinal.Value := Valor; 
        edPausaTempo.AsDateTime := edLimiteTempo.AsDateTime;
        edPausaHora.AsDateTime := Now + edLimiteTempo.AsDateTime;
      end;
    end;    
  finally
    Calculando := False;
  end;  
end;

procedure TFrmAcesso.InspEnter(Sender: TObject);
begin
  Insp.FocusedField := TabDesconto;
end;

procedure TFrmAcesso.TabAfterEdit(DataSet: TDataSet);
begin
  FTipoAnt  := TabTipoAcesso.Value;
end;

procedure TFrmAcesso.FormDestroy(Sender: TObject);
begin
  Dados.tbCli.IndexName := 'ICodigo';
end;

procedure TFrmAcesso.InspCadEditButtonClick(Sender: TObject);
begin
  Dados.tbCli.IndexName := 'INome';
end;

procedure TFrmAcesso.cmManutencaoClick(Sender: TObject);
begin
  with Dados, CM do 
    ModoManutencao(TabMaquina.Value, True);
  Close;  
end;

procedure TFrmAcesso.InspMExit(Sender: TObject);
begin
  InspM.PostEditor;
end;

end.
