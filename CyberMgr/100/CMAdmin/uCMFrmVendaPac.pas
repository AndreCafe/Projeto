unit uCMFrmVendaPac;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxInspRw, dxDBInRw, dxInspct, dxCntner, dxDBInsp, ExtCtrls, dxBar, Db,
  kbmMemTable, ffDB, cmClassesBase;

type
  TFrmVendaPac = class(TForm)
    BarMgr: TdxBarManager;
    cmGravar: TdxBarButton;
    cmCancelar: TdxBarButton;
    Panel1: TPanel;
    Insp: TdxDBInspector;
    dsTab: TDataSource;
    InspNomeContato: TdxInspectorLookupRow;
    InspDesconto: TdxInspectorDBCurrencyRow;
    InspTotalFinal: TdxInspectorDBRow;
    InspDescrHoras: TdxInspectorLookupRow;
    InspValorL: TdxInspectorLookupRow;
    InspRow7: TdxInspectorDBRow;
    InspObs: TdxInspectorDBMemoRow;
    InspRow10: TdxInspectorDBDateRow;
    Tab: TkbmMemTable;
    TabContato: TIntegerField;
    TabNomeContato: TStringField;
    TabHoras: TIntegerField;
    TabValor: TCurrencyField;
    TabDesconto: TCurrencyField;
    TabTotalFinal: TCurrencyField;
    TabMotivo: TIntegerField;
    TabNomeMotivo: TStringField;
    TabHorasL: TIntegerField;
    TabValorL: TCurrencyField;
    TabUsuario: TStringField;
    TabNumero: TIntegerField;
    TabFormaPagto: TStringField;
    TabFormaPagtoL: TStringField;
    TabObs: TMemoField;
    TabInicio: TDateTimeField;
    TabDataPagto: TDateTimeField;
    cmNovoCli: TdxBarButton;
    TabDescrHoras: TStringField;
    TabCodPacote: TWordField;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cmNovoCliClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    FNovo : Boolean;
    FTab  : TffTable;
    procedure Editar(aTab: TffTable);
    procedure Novo(aTab: TffTable);
    { Public declarations }
  end;

var
  FrmVendaPac: TFrmVendaPac;

implementation

uses uCMFrmPri, uCMDados, uCMFrmCliente, cmIDRecursos;

{$R *.DFM}

procedure TFrmVendaPac.cmGravarClick(Sender: TObject);
var 
  CredAntes, HorasAnt : Cardinal;
  M : TCMMaquina;
begin
  TabValor.Value := TabValorL.Value;
  TabHoras.Value := TabHorasL.Value;
  Tab.Post;

  FTab.DisableControls;
  
  try
    with Dados do begin  
      tbCaixa.Refresh;
      tbCaixa.IndexName := 'INumero';
      
      if not tbCaixa.FindKey([NumAberto]) then begin
        Beep;
        ShowMessage('Caixa não encontrado!');
        Exit;
      end;
    
      tbCli.IndexName := 'ICodigo';
      if not tbCli.FindKey([TabContato.Value]) then begin
        Beep;
        ShowMessage('Cliente não encontrado!');  
        Exit;
      end;
    end;  
  
    with Dados do begin
      DB.StartTransactionWith([tbCli, tbCaixa, FTab]);
      try
        tbCli.Edit;
        tbCaixa.Edit;
        CredAntes := ObtemCred(tbCli.FieldByName('CreditoM').AsInteger);
        
        if not FNovo then begin
          tbCaixa.FieldByName('Pacotes').AsFloat := 
            tbCaixa.FieldByName('Pacotes').AsFloat -
            (FTab.FieldByName('Valor').AsFloat  - FTab.FieldByName('Desconto').AsFloat);

          tbCaixaDescontos.Value := tbCaixaDescontos.Value - FTab.FieldByName('Desconto').Value;
            
            
          FTab.Edit;
          HorasAnt := Trunc(FTab.FieldByName('Tempo').AsFloat) * 1000 * 60 * 60;
        end else begin
          FTab.Insert;
          HorasAnt := 0;
        end;  
            
        tbCli.FieldByName('CreditoM').AsInteger := ObtemCred(
          ObtemCred(tbCli.FieldByName('CreditoM').AsInteger) -
          HorasAnt + 
          (TabHorasL.Value * 1000 * 60 * 60));
  
        tbCli.Post;
  
        FTab.FieldByName('Contato').AsInteger := TabContato.Value;
        FTab.FieldByName('Caixa').AsInteger := NumAberto;
        FTab.FieldByName('Tempo').AsFloat := TabHorasL.Value;
        FTab.FieldByName('CodPacote').AsInteger := TabCodPacote.Value;
        FTab.FieldByname('Desconto').AsFloat := TabDesconto.Value;
        FTab.FieldByName('MotivoDesc').AsInteger := TabMotivo.Value;
        FTab.FieldByName('Tipo').AsInteger := 1;
        FTab.FieldByName('Valor').AsFloat := TabValorL.Value;
        FTab.FieldByName('Aberto').AsBoolean := False;
        FTab.FieldByName('Nome').AsString := TabNomeContato.Value;
        FTab.FieldByName('FuncI').AsString := TabUsuario.Value;
        FTab.FieldByName('FuncF').AsString := TabUsuario.Value;
        FTab.FieldByName('CredAnterior').AsInteger := CredAntes;
        FTab.FieldByName('CredUsado').AsInteger := 0;
        FTab.FieldByName('FormaPagto').AsString := TabFormaPagto.Value;
        FTab.FieldByName('Obs').Value := TabObs.Value;
        FTab.FieldByName('Isento').Value := False;
        FTab.FieldByName('Inicio').Value := TabInicio.Value;
        FTab.FieldByName('Fim').Value := TabInicio.Value;
        FTab.FieldByName('DataPagto').Value := TabDataPagto.Value;
        FTab.Post;

        tbCaixaDescontos.Value := tbCaixaDescontos.Value + TabDesconto.Value;

        tbCaixaPacotes.Value := 
          tbCaixaPacotes.Value +
          TabTotalFinal.Value;

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
        DB.Rollback;
        Raise;
      end;
    end;  
  finally
    FTab.EnableControls;
  end;    
  
  Close;
end;

procedure TFrmVendaPac.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendaPac.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmVendaPac.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmVendaPac.Editar(aTab: TffTable);
begin
  FNovo := False;
  FTab := aTab;

  if (NumAberto<1) or (NumAberto<>FTab.FieldByName('Caixa').AsInteger) then
    cmGravar.Enabled := False;
  
  Tab.Insert;
  
  TabNumero.Value := FTab.FieldByName('Numero').AsInteger;
  TabContato.Value := FTab.FieldByName('Contato').asInteger;
  TabHoras.Value := Trunc(FTab.FieldByName('Tempo').AsFloat);
  TabDesconto.Value := FTab.FieldByname('Desconto').AsFloat;
  TabMotivo.Value := FTab.FieldByName('MotivoDesc').AsInteger;
  TabValor.Value := FTab.FieldByName('Valor').AsFloat;
  TabUsuario.Value := FTab.FieldByName('FuncI').AsString;
  TabFormaPagto.Value := FTab.FieldByName('FormaPagto').AsString;
  TabObs.Value := FTab.FieldByName('Obs').Value;
  TabInicio.Value := FTab.FieldByName('Inicio').Value;
  TabDataPagto.Value := FTab.FieldByName('DataPagto').Value;
  TabCodPacote.Value := FTab.FieldByName('CodPacote').Value;
      
  Tab.Post;
  Tab.Edit;      
  ShowModal;
end;

procedure TFrmVendaPac.Novo(aTab: TffTable);
begin
  FNovo := True;
  FTab := aTab;
  Tab.Insert;
  TabUsuario.Value := Dados.CM.Username;
  TabInicio.Value := Now;
  TabDataPagto.Value := Date;
  ShowModal;
end;

procedure TFrmVendaPac.TabCalcFields(DataSet: TDataSet);
begin
  TabTotalFinal.Value := TabValorL.Value - TabDesconto.Value;
end;

procedure TFrmVendaPac.FormCreate(Sender: TObject);
begin
  Tab.Active := True;
end;

procedure TFrmVendaPac.cmNovoCliClick(Sender: TObject);
begin
  TFrmCliente.Create(Self).Novo;
  Dados.tbCli.Refresh;
end;

procedure TFrmVendaPac.FormShow(Sender: TObject);
begin
  InspDesconto.ReadOnly := not Permitido(reTransacoes, taTraDesconto);
end;

end.
