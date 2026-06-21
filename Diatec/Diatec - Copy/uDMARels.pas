unit uDMARels;

interface

uses
  SysUtils, Classes, DB, nxdb, frxClass, frxDBSet, frxExportPDF;

type
  TdmRels = class(TDataModule)
    dbDesp: TfrxDBDataset;
    Q: TnxQuery;
    QSync: TBooleanField;
    QTecnico: TStringField;
    QCliente: TStringField;
    QData: TDateField;
    QID: TWordField;
    QIDRA: TWordField;
    QTipo: TWordField;
    QValor: TCurrencyField;
    QJustDiverg: TMemoField;
    QDescr: TMemoField;
    QNumF: TIntegerField;
    QValorDef: TCurrencyField;
    QValorCli: TCurrencyField;
    QValorTec: TCurrencyField;
    QStatusTec: TWordField;
    QLogID: TIntegerField;
    QStatusCli: TWordField;
    QONServ: TBooleanField;
    QExcluirServ: TBooleanField;
    QNomeCli: TStringField;
    pdfExp: TfrxPDFExport;
    QValorFinal: TCurrencyField;
    QNomeTipo: TStringField;
    QDataI: TDateField;
    QDataF: TDateField;
    QValorStr: TStringField;
    dbPar: TfrxDBDataset;
    QOSDia: TStringField;
    dbRAF: TfrxDBDataset;
    qTec: TnxQuery;
    qTecSync: TBooleanField;
    qTecTecnico: TStringField;
    qTecCliente: TStringField;
    qTecData: TDateField;
    qTecID: TWordField;
    qTecIDRA: TWordField;
    qTecTipo: TWordField;
    qTecValor: TCurrencyField;
    qTecJustDiverg: TMemoField;
    qTecDescr: TMemoField;
    qTecNumF: TIntegerField;
    qTecValorDef: TCurrencyField;
    qTecValorCli: TCurrencyField;
    qTecValorTec: TCurrencyField;
    qTecStatusTec: TWordField;
    qTecLogID: TIntegerField;
    qTecStatusCli: TWordField;
    qTecONServ: TBooleanField;
    qTecExcluirServ: TBooleanField;
    qTecDataI: TDateField;
    qTecDataF: TDateField;
    qTecNomeCli: TStringField;
    qTecNomeTipo: TStringField;
    qTecValorStr: TStringField;
    qTecNomeTec: TStringField;
    qTecValorFinal: TCurrencyField;
    dbTec: TfrxDBDataset;
    frIntCli: TfrxReport;
    frIntTec: TfrxReport;
    frDesp: TfrxReport;
    procedure qTecCalcFields(DataSet: TDataSet);
    procedure QCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure SelecionaDados(aNumF: Integer);
    procedure SelecionaDadosTec(aNumF: Integer);
  public
    procedure DetalhamentoCli(aNumF: Integer);
    procedure ResumoIntegraCli(aNumF: Integer);
    procedure ResumoIntegraTec(aNumF: Integer);
    { Public declarations }
  end;

var
  dmRels: TdmRels;

implementation

uses uDMA, uDTSyncDef;

{$R *.dfm}

procedure TdmRels.DetalhamentoCli(aNumF: Integer);
begin
  SelecionaDados(aNumF);
  frDesp.Variables['VlKMCli'] := FloatToStrF(DM.TabVlKMCli.Value, ffCurrency, 15, 2)+'.'+#13#10;
  frDesp.ShowReport;
end;

function ZeroPad(St: String; Tam: Byte): String;
begin
  Result := St;
  while Length(Result) < Tam do
    Result := '0' + Result;
end;

procedure TdmRels.QCalcFields(DataSet: TDataSet);
begin
  case QTipo.Value of
    tiraKM         : qNomeTipo.Value := 'Kilometragem';
    tiraPedagio    : qNomeTipo.Value := 'Pedágio';
    tiraRefeicao   : qNomeTipo.Value := 'Alimentação';
    tiraHospedagem : qNomeTipo.Value := 'Hospedagem';
  end;

  if QTipo.Value = tiraKM then begin
    QValorFinal.Value := QValorCli.Value * DM.TabVlKMCli.Value;
    QValorStr.Value   := FloatToStrF(QValorFinal.Value, ffCurrency, 15, 2) +
                         ' ('+IntToStr(Trunc(QValorCli.Value))+'KM)';
  end else begin
    QValorFinal.Value := QValorCli.Value;
    QValorStr.Value   := FloatToStrF(QValorFinal.Value, ffCurrency, 15, 2);
  end;

  with DM do
  if tAuxRAOS.FindKey([qNumF.Value, qCliente.Value, qData.Value]) then
    qOSDia.Value :=
      tAuxRAOSCliente.Value+
      tAuxRAOSTecnico.Value+
      FormatDateTime('yyyymmdd', tAuxRAOSDataOS.Value) +
      ZeroPad(tAuxRAOSIDOS.AsString, 4);
end;

procedure TdmRels.qTecCalcFields(DataSet: TDataSet);
begin
  case qTecTipo.Value of
    tiraKM         : qTecNomeTipo.Value := 'Kilometragem';
    tiraPedagio    : qTecNomeTipo.Value := 'Pedágio';
    tiraRefeicao   : qTecNomeTipo.Value := 'Alimentação';
    tiraHospedagem : qTecNomeTipo.Value := 'Hospedagem';
  end;

  if qTecTipo.Value = tiraKM then begin
    qTecValorFinal.Value := qTecValorTec.Value * DM.TabVlKMTec.Value;
    qTecValorStr.Value   := FloatToStrF(qTecValorFinal.Value, ffCurrency, 15, 2) +
                         ' ('+IntToStr(Trunc(qTecValorTec.Value))+'KM)';
  end else begin
    qTecValorFinal.Value := qTecValorTec.Value;
    qTecValorStr.Value   := FloatToStrF(qTecValorFinal.Value, ffCurrency, 15, 2);
  end;
end;

procedure TdmRels.ResumoIntegraCli(aNumF: Integer);
begin
  SelecionaDados(aNumF);
  frIntCli.ShowReport;
end;

procedure TdmRels.ResumoIntegraTec(aNumF: Integer);
begin
  SelecionaDadosTec(aNumF);
  frIntTec.ShowReport;
end;

procedure TdmRels.SelecionaDados(aNumF: Integer);
begin
  DM.tAuxRAOS.IndexName := 'INumF';
  Q.SQL.Text := Format( 
  'select *, ' +
  '(select Min(DataI) from RA where (NumF=%d)) as DataI, ' +
  '(select Max(DataF) from RA where (NumF=%d)) as DataF ' +
  'from RAItem ' +
  ' where (NumF=%d) and (ValorCli>0.009) ' +
  ' order by cliente, data', 
  [aNumF, aNumF, aNumF]);
  Q.Open;
end;

procedure TdmRels.SelecionaDadosTec(aNumF: Integer);
begin
  qTec.SQL.Text := Format( 
  'select *, ' +
  '(select Min(DataI) from RA where (NumF=%d)) as DataI, ' +
  '(select Max(DataF) from RA where (NumF=%d)) as DataF ' +
  'from RAItem ' +
  ' where (NumF=%d) and (ValorTec>0.009) ' +
  ' order by tecnico, data',
  [aNumF, aNumF, aNumF]);
  qTec.Open;
end;

end.
