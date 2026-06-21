unit uCMFrmRel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, nxdb, ppDB, ppDBPipe, ppBands, ppReport, ppSubRpt, ppCtrls, ppStrtch,
  ppMemo, ppVar, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppRegion, ppModule, daDataModule, ppTypes;

type
  TFrmRel = class(TForm)
    ppReport1: TppReport;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLine5: TppLine;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLine6: TppLine;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppSystemVariable3: TppSystemVariable;
    ppLine4: TppLine;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDBCaixa: TppDBPipeline;
    dsCaixa: TDataSource;
    tbCaixa: TnxTable;
    tbCaixaNumero: TAutoIncField;
    tbCaixaAbertura: TDateTimeField;
    tbCaixaFechamento: TDateTimeField;
    tbCaixaUsuario: TStringField;
    tbCaixaLancExtrasE: TCurrencyField;
    tbCaixaLancExtrasS: TCurrencyField;
    tbCaixaDescontos: TCurrencyField;
    tbCaixaInternet: TCurrencyField;
    tbCaixaPacotes: TCurrencyField;
    tbCaixaVendas: TCurrencyField;
    tbCaixaSaldoAnt: TCurrencyField;
    tbCaixaAberto: TBooleanField;
    tbCaixaObs: TMemoField;
    dsEstoque: TDataSource;
    tbLancExtra: TnxTable;
    tbLancExtraNumero: TAutoIncField;
    tbLancExtraDia: TDateTimeField;
    tbLancExtraCaixa: TIntegerField;
    tbLancExtraUsuario: TStringField;
    tbLancExtraEntrada: TBooleanField;
    tbLancExtraTipo: TStringField;
    tbLancExtraDescricao: TStringField;
    tbLancExtraValor: TCurrencyField;
    tbLancExtraObs: TMemoField;
    tbLancExtraValorFator: TCurrencyField;
    dsAcessos: TDataSource;
    dsLancExtra: TDataSource;
    ppDBAcesso: TppDBPipeline;
    ppDBLancExtra: TppDBPipeline;
    ppEstoque: TppDBPipeline;
    qAcesso: TnxQuery;
    qAcessoMaquina: TWordField;
    qAcessoValor: TCurrencyField;
    qAcessoDesconto: TCurrencyField;
    qAcessoTempoCobrado: TFloatField;
    qAcessoNome: TStringField;
    qAcessoTotalFinal: TFloatField;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel11: TppLabel;
    ppShape4: TppShape;
    qEstoque: TnxQuery;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    qEstoqueTipoMov: TStringField;
    qEstoqueQuant: TFloatField;
    qEstoqueTotal: TCurrencyField;
    qEstoqueEstoqueAtual: TFloatField;
    ppLabel10: TppLabel;
    ppShape5: TppShape;
    qEstoqueValorVendas: TCurrencyField;
    ppDBCalc5: TppDBCalc;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppShape6: TppShape;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel25: TppLabel;
    ppDBText15: TppDBText;
    ppLine8: TppLine;
    ppDBText16: TppDBText;
    tbLancExtraOperacaoSt: TStringField;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppShape7: TppShape;
    ppLabel24: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppDBText6: TppDBText;
    ppDBText13: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppLine7: TppLine;
    qPacote: TnxQuery;
    qPacoteTotalFInal: TFloatField;
    qPacoteValor: TCurrencyField;
    qPacoteDesconto: TCurrencyField;
    dsPacote: TDataSource;
    ppDBPacote: TppDBPipeline;
    qPacoteHoras: TDateTimeField;
    qPacoteQuantidade: TFloatField;
    ppSubReport4: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppLabel15: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppShape8: TppShape;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLine9: TppLine;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppLabel31: TppLabel;
    ppShape9: TppShape;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel35: TppLabel;
    ppShape10: TppShape;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLabel36: TppLabel;
    ppShape11: TppShape;
    ppLabel34: TppLabel;
    ppLabel37: TppLabel;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLabel39: TppLabel;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText31: TppDBText;
    tbCaixaTotLancExtra: TCurrencyField;
    tbCaixaSubTotal: TCurrencyField;
    tbCaixaTotalFinal: TCurrencyField;
    ppLabel40: TppLabel;
    ppDBText32: TppDBText;
    tbCaixaAcessoDesc: TCurrencyField;
    ppLine18: TppLine;
    ppLabel42: TppLabel;
    ppDBText33: TppDBText;
    ppDBText26: TppDBText;
    qAcessoTempo: TDateTimeField;
    qAcessoValorFinal: TCurrencyField;
    qEstoqueDesconto: TCurrencyField;
    qEstoqueTotalDesc: TCurrencyField;
    qEstoqueProduto: TStringField;
    qEstoqueDescricao: TStringField;
    ppDBText5: TppDBText;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppShape2: TppShape;
    ppLabel20: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel26: TppLabel;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppLine1: TppLine;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppShape3: TppShape;
    ppLine3: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    lbAguardando: TppLabel;
    tbCaixaAguardandoPagto: TCurrencyField;
    procedure qAcessoCalcFields(DataSet: TDataSet);
    procedure ppDBText7Format(Sender: TObject; DisplayFormat: String;
      DataType: TppDataType; Value: Variant; var Text: String);
    procedure qEstoqueCalcFields(DataSet: TDataSet);
    procedure ppDBCalc1Format(Sender: TObject; DisplayFormat: String;
      DataType: TppDataType; Value: Variant; var Text: String);
    procedure tbLancExtraCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ppDBText19Format(Sender: TObject; DisplayFormat: String;
      DataType: TppDataType; Value: Variant; var Text: String);
    procedure qPacoteCalcFields(DataSet: TDataSet);
    procedure tbCaixaCalcFields(DataSet: TDataSet);
    procedure ppDBText31Print(Sender: TObject);
    procedure ppDBText28Print(Sender: TObject);
    procedure ppDBText29Print(Sender: TObject);
    procedure ppDBText24GetText(Sender: TObject; var Text: String);
  private
    { Private declarations }
  public
    procedure RelCaixa(NumCaixa: Integer);
    { Public declarations }
  end;

var
  FrmRel: TFrmRel;

implementation

uses uCMDados, uCMFrmRepView;

{$R *.DFM}

procedure TFrmRel.qAcessoCalcFields(DataSet: TDataSet);
var 
  H, M, S, MS: Word;
  D : Integer;
begin
  qAcessoTotalFinal.Value := qAcessoValor.Value - qAcessoDesconto.Value;
  DecodeTime(qAcessoTempoCobrado.Value, H, M, S, MS);
  D := Trunc(qAcessoTempoCobrado.Value);
  MS := 0;
  if S=59 then
  if M=59 then begin
    if H=23 then begin
      Inc(D);
      S := 0;
      H := 0;
      M := 0;
    end else begin
      Inc(H);
      S := 0;
      M := 0;
    end;
  end else begin
    Inc(M);
    S := 0;
  end;
  qAcessoTempo.Value := D + EncodeTime(H, M, S, 0);
end;  
      
function LeftPad(S: String; T: Integer): String;
begin
  Result := S;
  while Length(Result) < T do Result := '0' + Result;
end;

function DateTimeToHMS(D: TDateTime): String;
var 
  H, M, S, MS: Word;
  Dia : Integer;
begin
  DecodeTime(D, H, M, S, MS);
  Dia := Trunc(D);
  Dia := (Dia * 24) + H; 
  Result := LeftPad(IntToStr(Dia), 2)+':'+
            LeftPad(IntToStr(M), 2)+':'+
            LeftPad(IntToStr(S), 2);
end;

procedure TFrmRel.ppDBText7Format(Sender: TObject; DisplayFormat: String;
  DataType: TppDataType; Value: Variant; var Text: String);
var D : Double;
begin
  if Value = Null then
    D := 0
  else
    D := Value;

  Text := DateTimeToHMS(D);
end;
  
procedure TFrmRel.RelCaixa(NumCaixa: Integer);
var Aguardando : Double;
begin
  tbCaixa.CancelRange;
  tbCaixa.IndexName := 'INumero';
  tbCaixa.SetRange([NumCaixa], [NumCaixa]);
  tbCaixa.First;
  if tbCaixaAberto.Value then
    Aguardando := Dados.ObtemAguardando
  else
    Aguardando := tbCaixaAguardandoPagto.Value;
  lbAguardando.Visible := (Aguardando > 0.009);
  lbAguardando.Caption := '** Acessos aguardando pagamento = ' + FloatToStrF(Aguardando, ffCurrency, 10, 2);
    
  qEstoque.Close;
  qAcesso.Close;
  qEstoque.Params[0].Value := NumCaixa;
  qAcesso.Params[0].Value := NumCaixa;
  qEstoque.Open;
  qAcesso.Open;
  tbLancExtra.Open;
  tbLancExtra.SetRange([NumCaixa], [NumCaixa]);
  TFrmRepView.Create(Self).Mostra(ppReport1);
end;

procedure TFrmRel.qEstoqueCalcFields(DataSet: TDataSet);
begin
  qEstoqueTotalDesc.Value :=
    qEstoqueTotal.Value - qEstoqueDesconto.Value;

  if (qEstoqueTipoMov.Value = 'VENDA') or (qEstoqueTipoMov.Value = 'VENDAAC') then
    qEstoqueValorVendas.Value := qEstoqueTotalDesc.Value
  else
    qEstoqueValorVendas.Value := 0;  
    
end;

procedure TFrmRel.ppDBCalc1Format(Sender: TObject; DisplayFormat: String;
  DataType: TppDataType; Value: Variant; var Text: String);
var D: Double;  
begin
  if Value = Null then
    D := 0
  else
    D := Value;

  Text := DateTimeToHMS(D);
end;

procedure TFrmRel.tbLancExtraCalcFields(DataSet: TDataSet);
begin
  if tbLancExtraEntrada.Value then begin
    tbLancExtraOperacaoSt.Value := 'Entrada';
    tbLancExtraValorFator.Value := tbLancExtraValor.Value;
  end else begin
    tbLancExtraOperacaoSt.Value := 'Saída';  
    tbLancExtraValorFator.Value := tbLancExtraValor.Value * -1;
  end;    
end;

procedure TFrmRel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel.FormCreate(Sender: TObject);
begin
  tbCaixa.Open;
end;

procedure TFrmRel.ppDBText19Format(Sender: TObject; DisplayFormat: String;
  DataType: TppDataType; Value: Variant; var Text: String);
var 
  I : Integer;  
  E : Extended;
begin
  if Value <> Null then begin
    E := Value;
    I := Trunc(E);
    Text := IntToStr(I);
  end;  
end;

procedure TFrmRel.qPacoteCalcFields(DataSet: TDataSet);
begin
  qPacoteTotalFinal.Value := qPacoteValor.Value - qPacoteDesconto.Value;
end;

procedure TFrmRel.tbCaixaCalcFields(DataSet: TDataSet);
begin
  tbCaixaTotLancExtra.Value := tbCaixaLancExtrasE.Value - tbCaixaLancExtrasS.Value;
  tbCaixaAcessoDesc.Value   := tbCaixaInternet.Value + tbCaixaDescontos.Value;
  tbCaixaSubTotal.Value     := tbCaixaPacotes.Value + 
                               tbCaixaInternet.Value +
                               tbCaixaVendas.Value;
                               
  tbCaixaTotalFinal.Value   := tbCaixaTotLancExtra.Value +
                               tbCaixaSubTotal.Value +
                               tbCaixaSaldoAnt.Value;
end;

procedure TFrmRel.ppDBText31Print(Sender: TObject);
begin
  if tbCaixaTotalFinal.Value < 0 then
    ppDBText31.Font.Color := clMaroon;
end;

procedure TFrmRel.ppDBText28Print(Sender: TObject);
begin
  if tbCaixaTotLancExtra.Value < 0 then
    ppDBText28.Font.Color := clMaroon;
end;

procedure TFrmRel.ppDBText29Print(Sender: TObject);
begin
  if tbCaixaSaldoAnt.Value < 0 then
    ppDBText29.Font.Color := clMaroon;
end;

procedure TFrmRel.ppDBText24GetText(Sender: TObject; var Text: String);
begin
  if (Text = '') then Text := '---------------';
end;

end.
