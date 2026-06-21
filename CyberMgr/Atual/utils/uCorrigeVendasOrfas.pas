unit uCorrigeVendasOrfas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls, ExtCtrls, nxdb, nxllTransport,
  nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  nxsdServerEngine, nxreRemoteServerEngine;

type
  TForm1 = class(TForm)
    nxRSE: TnxRemoteServerEngine;
    nxTCPIP: TnxWinsockTransport;
    nxDB: TnxDatabase;
    nxSession: TnxSession;
    tTran: TnxTable;
    Panel1: TPanel;
    btnCorrigir: TButton;
    tME: TnxTable;
    DataSource1: TDataSource;
    G: TDBGrid;
    tMENumSeq: TAutoIncField;
    tMETransacao: TIntegerField;
    tMEProduto: TStringField;
    tMEQuant: TFloatField;
    tMEUnitario: TCurrencyField;
    tMETotal: TCurrencyField;
    tMECustoU: TCurrencyField;
    tMEItem: TWordField;
    tMEDesconto: TCurrencyField;
    tMEDataMov: TDateTimeField;
    tMEDataPag: TDateTimeField;
    tMEEntrada: TBooleanField;
    tMECancelado: TBooleanField;
    tMEEstoqueAnt: TFloatField;
    tMETipoTran: TWordField;
    tMEContato: TIntegerField;
    tMECaixaMov: TIntegerField;
    tMECaixaPag: TIntegerField;
    tMECategoria: TStringField;
    tTranNumero: TAutoIncField;
    tTranCaixaI: TIntegerField;
    tTranCaixaF: TIntegerField;
    tTranCaixaP: TIntegerField;
    tTranTipoAcesso: TWordField;
    tTranInicio: TDateTimeField;
    tTranFim: TDateTimeField;
    tTranDataPagto: TDateTimeField;
    tTranContato: TIntegerField;
    tTranNome: TStringField;
    tTranMaquina: TWordField;
    tTranTipo: TWordField;
    tTranFuncI: TStringField;
    tTranFuncF: TStringField;
    tTranTempo: TDateTimeField;
    tTranTempoCobrado: TDateTimeField;
    tTranCredUsado: TIntegerField;
    tTranCredAnterior: TIntegerField;
    tTranDesconto: TCurrencyField;
    tTranProdutos: TCurrencyField;
    tTranValor: TCurrencyField;
    tTranObs: TMemoField;
    tTranIsento: TBooleanField;
    tTranNaoUsarPacote: TBooleanField;
    tTranCodPacote: TWordField;
    tTranSinal: TCurrencyField;
    tTranTransacaoVinculada: TIntegerField;
    tTranValorFinalAcesso: TCurrencyField;
    tTranDescontoProduto: TCurrencyField;
    tTranNumDoc: TStringField;
    tTranStatusPagto: TWordField;
    tTranT0: TFloatField;
    tTranT1: TFloatField;
    tTranT2: TFloatField;
    tTranT3: TFloatField;
    tTranT4: TFloatField;
    tTranT5: TFloatField;
    tTranT6: TFloatField;
    tTranT7: TFloatField;
    tTranT8: TFloatField;
    tTranT9: TFloatField;
    tTranT10: TFloatField;
    tTranT11: TFloatField;
    tTranT12: TFloatField;
    tTranT13: TFloatField;
    tTranT14: TFloatField;
    tTranT15: TFloatField;
    tTranT16: TFloatField;
    tTranT17: TFloatField;
    tTranT18: TFloatField;
    tTranT19: TFloatField;
    tTranT20: TFloatField;
    tTranT21: TFloatField;
    tTranT22: TFloatField;
    tTranT23: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure btnCorrigirClick(Sender: TObject);
  private
    { Private declarations }
  public
    NImp : INteger;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  NImp := 0;
end;

procedure TForm1.btnCorrigirClick(Sender: TObject);
begin
  nxTCPIP.Active := True;
  nxRSE.Active := True;
  nxSession.Active := True;
  nxDB.Active := True;
  tME.Open;
  tTran.Open;
  
  tME.SetRange([0], [0]);
  tME.First;
  while not tME.IsEmpty do begin
    tME.Edit;
    Inc(NImp);
    if tTran.FindKey([tMEDataMov.Value]) then
      tMETransacao.Value := tTranNumero.Value
    else
      tMETransacao.Value := -1;  
    tME.Post;
    tME.Next;
  end;
  ShowMessage(IntToStr(NImp)+ ' itens corrigidos!');
  Close;
end;

end.
