unit uCMFrmCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxInspRw, dxDBInRw, dxInspct, dxCntner, dxDBInsp, ExtCtrls, dxBar, Db,
  kbmMemTable, nxdb;

type
  TFrmCredito = class(TForm)
    BarMgr: TdxBarManager;
    cmGravar: TdxBarButton;
    cmCancelar: TdxBarButton;
    Panel1: TPanel;
    Insp: TdxDBInspector;
    dsTab: TDataSource;
    InspNomeContato: TdxInspectorLookupRow;
    InspRow7: TdxInspectorDBRow;
    InspObs: TdxInspectorDBMemoRow;
    InspRow10: TdxInspectorDBDateRow;
    Tab: TkbmMemTable;
    TabContato: TIntegerField;
    TabNomeContato: TStringField;
    TabMotivo: TIntegerField;
    TabNomeMotivo: TStringField;
    TabUsuario: TStringField;
    TabNumero: TIntegerField;
    TabObs: TMemoField;
    TabInicio: TDateTimeField;
    TabDataPagto: TDateTimeField;
    InspTempo: TdxInspectorDBTimeRow;
    TabTempo: TDateTimeField;
    TabDesconto: TCurrencyField;
    InspValor: TdxInspectorDBCurrencyRow;
    cmNovoCli: TdxBarButton;
    TabValor: TCurrencyField;
    TabValorC: TCurrencyField;
    TabTempoC: TDateTimeField;
    InspDesc: TdxInspectorDBCurrencyRow;
    TabValorFinal: TCurrencyField;
    TabNomeTipoAcesso: TStringField;
    InspTA: TdxInspectorLookupRow;
    TabTipoAcesso: TIntegerField;
    InspValorFinal: TdxInspectorDBCurrencyRow;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmNovoCliClick(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure InspNomeContatoEditButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    FNovo : Boolean;
    FTab  : TnxTable;
    FCredito : Boolean;
    UValor : Double;
    UTempo : TDateTime;
    Calculando : Boolean;
    procedure Editar(aTab: TnxTable);
    procedure Novo(aTab: TnxTable; aContato: Integer; aCredito: Boolean);
    procedure CalcValor;
    procedure CalcTempo;
    { Public declarations }
  end;

var
  FrmCredito: TFrmCredito;

implementation

uses uCMFrmPri, cmClassesBase, uCMDados, uCMFrmCliente, cmIDRecursos;


{$R *.DFM}

procedure TFrmCredito.cmGravarClick(Sender: TObject);
var 
  CredAntes : Cardinal;
  TempoAnt  : Cardinal;
  Fator     : Integer;
  M : TCMMaquina;
begin
  if (TabDesconto.Value - TabValor.Value) > 0.00001 then begin
    Beep;
    ShowMessage('Desconto não pode ser maior que valor!');
    Exit;
  end;

  if TabContato.Value=0 then begin
    Beep;
    ShowMessage('O cliente não foi selecionado!');
    Exit;
  end;  
  
  if Tab.State in [dsEdit, dsInsert] then Tab.Post;
  FTab.DisableControls;
  FTab.AutoCalcFields := False;
  try
    with Dados do begin  
      tbCli.IndexName := 'ICodigo';
      if not tbCli.FindKey([TabContato.Value]) then begin
        Beep;
        ShowMessage('Cliente não encontrado!');  
        Exit;
      end;

      tbCaixa.Refresh;
      tbCaixa.IndexName := 'INumero';

      if NumAberto=0 then begin
        Beep;
        ShowMessage('Caixa não está aberto!');
        Exit;
      end;  
      
      if not tbCaixa.FindKey([NumAberto]) then begin
        Beep;
        ShowMessage('Caixa não encontrado!');
        Exit;
      end;
      
    end;  
  
    with Dados do begin
      DB.StartTransactionWith([tbCli, FTab, tbCaixa]);
      try
        tbCli.Refresh;
        tbCaixa.Refresh;
        tbCli.Edit;
        tbCaixa.Edit;
        CredAntes := ObtemCred(tbCli.FieldByName('CreditoM').AsInteger);

        if FCredito then 
          Fator := 1
        else
          Fator := -1;  
        
        if not FNovo then begin
          FTab.Edit;
          TempoAnt := DateTimeToTicks(FTab.FieldByName('Tempo').AsDateTime);

          tbCaixaInternet.Value := 
            tbCaixaInternet.Value -
            (FTab.FieldByName('Valor').AsFloat  - FTab.FieldByName('Desconto').AsFloat);

          tbCaixaDescontos.Value := tbCaixaDescontos.Value - FTab.FieldByName('Desconto').Value;
          
        end else begin
          FTab.Insert;
          TempoAnt := 0;
        end;  
            
        tbCli.FieldByName('CreditoM').AsInteger := 
          ObtemCred(ObtemCred(tbCli.FieldByName('CreditoM').AsInteger) +
          ((DateTimeToTicks(TabTempo.Value)*Fator) - 
           (TempoAnt*Fator)));
  
        tbCli.Post;
  
        FTab.FieldByName('Contato').AsInteger := TabContato.Value;
        FTab.FieldByName('Caixa').AsInteger   := NumAberto;
        FTab.FieldByName('Tempo').AsDateTime  := TabTempo.Value;
        FTab.FieldByname('Desconto').AsFloat := 0;
        FTab.FieldByName('MotivoDesc').AsInteger := TabMotivo.Value;
        if FCredito then
          FTab.FieldByName('Tipo').AsInteger := taCreditoTempo
        else
          FTab.FieldByName('Tipo').AsInteger := taDebitoTempo;
            
        FTab.FieldByName('Valor').AsFloat := TabValor.Value;
        FTab.FieldByName('TipoAcesso').AsInteger := TabTipoAcesso.Value;
        FTab.FieldByName('Desconto').AsFloat := TabDesconto.Value;
        FTab.FieldByName('Aberto').AsBoolean := False;
        FTab.FieldByName('Nome').AsString := TabNomeContato.Value;
        FTab.FieldByName('FuncI').AsString := TabUsuario.Value;
        FTab.FieldByName('FuncF').AsString := TabUsuario.Value;
        FTab.FieldByName('CredAnterior').AsInteger := CredAntes;
        FTab.FieldByName('CredUsado').AsInteger := 0;
        FTab.FieldByName('FormaPagto').AsString := '';
        FTab.FieldByName('Obs').Value := TabObs.Value;
        FTab.FieldByName('Isento').Value := False;
        FTab.FieldByName('Inicio').Value := TabInicio.Value;
        FTab.FieldByName('Fim').Value := TabInicio.Value;
        FTab.FieldByName('DataPagto').Value := TabDataPagto.Value;
        FTab.Post;

        tbCaixaInternet.Value := 
          tbCaixaInternet.Value +
          TabValorFinal.Value;

        tbCaixaDescontos.Value := tbCaixaDescontos.Value + TabDesconto.Value;
        tbCaixa.Post;
          

        DB.Commit;

        M := Dados.CM.Maquinas.PorContato[TabContato.Value];
        with Dados.CM do 
        if M <> nil then begin
          M.AtualizaCache;
          M.CreditoCli := ObtemCred(tbCli.FieldByName('CreditoM').AsInteger);
          M.LiberaAlemPacote := not Config.PausarFimPacote;
          SalvaAlteracoesObj(M, False);
        end;  
        
      except
        FTab.Cancel;
        tbCli.Cancel;
        tbCaixa.Cancel;
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

procedure TFrmCredito.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCredito.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCredito.Editar(aTab: TnxTable);
begin
  FNovo := False;
  FTab := aTab;
  if (NumAberto<1) or (NumAberto<>FTab.FieldByName('Caixa').AsInteger) then
    cmGravar.Enabled := False;
  
  Tab.Insert;

  FCredito := (FTab.FieldByName('Tipo').AsInteger = taCreditoTempo);
  
  TabNumero.Value := FTab.FieldByName('Numero').AsInteger;
  TabContato.Value := FTab.FieldByName('Contato').asInteger;
  TabTempo.Value := FTab.FieldByName('Tempo').AsDateTime;
  TabMotivo.Value := FTab.FieldByName('MotivoDesc').AsInteger;
  TabUsuario.Value := FTab.FieldByName('FuncI').AsString;
  TabObs.Value := FTab.FieldByName('Obs').Value;
  TabInicio.Value := FTab.FieldByName('Inicio').Value;
  TabDataPagto.Value := FTab.FieldByName('DataPagto').Value;
  TabTipoAcesso.Value := FTab.FieldByName('TipoAcesso').Value;
  TabDesconto.Value := FTab.FieldByName('Desconto').Value;
  TabValor.Value := FTab.FieldByName('Valor').Value;
  
      
  Tab.Post;
  Tab.Edit;      
  ShowModal;
end;

procedure TFrmCredito.Novo(aTab: TnxTable; aContato: Integer; aCredito: Boolean);
begin
  FCredito := aCredito;
  FNovo := True;
  FTab := aTab;
  Dados.tbTipoAcesso.First;
  Tab.Insert;
  TabTipoAcesso.Value := Dados.tbTipoAcessoCodigo.Value;
  TabContato.Value := aContato;
  TabUsuario.Value := Dados.CM.Username;
  TabInicio.Value := Now;
  TabDataPagto.Value := Date;
  ShowModal;
end;

procedure TFrmCredito.FormCreate(Sender: TObject);
begin
  InspTA.Visible := Dados.CM.Config.VariosTiposAcesso;
  Calculando := False;
  UValor := 0;
  UTempo := 0;
  Dados.tbCli.Refresh;
  Tab.Active := True;
end;

procedure TFrmCredito.FormShow(Sender: TObject);
begin
  InspDesc.ReadOnly := not Permitido(reTransacoes, taTraDesconto);
  InspValor.Visible := FCredito;
  InspDesc.Visible  := FCredito;
  InspTA.Visible    := InspTA.Visible and FCredito;
  InspValorFinal.Visible := FCredito;
  Insp.SetFocus;  
  Insp.FocusedField := TabObs;
  if FCredito then begin
    if TabContato.Value > 0 then
      Insp.FocusedField := TabValor 
    else
      Insp.FocusedField := TabNomeContato;  
  end else  
    Insp.FocusedField := TabTempo;
    
  if FCredito then
    Caption := 'Crédito de Tempo'
  else
    Caption := 'Débito de Tempo';  
end;

procedure TFrmCredito.cmNovoCliClick(Sender: TObject);
begin
  TFrmCliente.Create(Self).Novo;
  Dados.tbCli.Refresh;
end;

procedure TFrmCredito.CalcTempo;
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
        NumTicks := ObtemTempo(Now, TA.Codigo, TA.PHoraCor^, CorPrecos, TabValor.Value);
        TabTempoC.AsDateTime := TicksToDateTime(NumTicks);
        if Tab.State in [dsEdit, dsInsert] then
          TabTempo.Value := TabTempoC.Value;
      end;
    end;    
  finally
    Calculando := False;
  end;    
end;

procedure TFrmCredito.CalcValor;
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
                            DateTimeToTicks(TabTempo.Value), 
                            0, TA.Codigo,
                            TA.PHoraCor^, CorPrecos, True,
                            TempoCobrado, Credito, Valor);
        TabValorC.Value := Valor; 
        if Tab.State in [dsInsert, dsEdit] then
          TabValor.Value := Valor;
      end;
    end;    
  finally
    Calculando := False;
  end;  
end;

procedure TFrmCredito.TabCalcFields(DataSet: TDataSet);
begin
  if not FCredito then Exit;
  if UValor <> TabValor.Value then begin
    TabValorC.Value := TabValor.Value;
    CalcTempo;
  end else begin
    TabTempoC.Value := TabTempo.Value;
    CalcValor;
  end;
  TabValorFinal.Value := TabValor.Value - TabDesconto.Value;
  UValor := TabValor.Value;
  UTempo := TabTempo.Value;    
end;

procedure TFrmCredito.InspNomeContatoEditButtonClick(Sender: TObject);
begin
  Dados.tbCli.IndexName := 'INome';
end;

procedure TFrmCredito.FormDestroy(Sender: TObject);
begin
  Dados.tbCli.IndexName := 'ICodigo';
end;

end.
