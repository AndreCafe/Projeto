unit uImpLagoaWeb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxsdServerEngine, nxreRemoteServerEngine, nxdb,
  nxllComponent, DBTables;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    Origem: TTable;
    OrigemCODIGO: TStringField;
    OrigemCODREF: TStringField;
    OrigemDESCR: TStringField;
    OrigemCATEG: TStringField;
    OrigemSUBCATEG: TStringField;
    OrigemESTOQ: TFloatField;
    OrigemPRECO: TFloatField;
    OrigemPRECOVEN: TFloatField;
    OrigemLUCRO: TFloatField;
    OrigemOBS: TStringField;
    Dest: TnxTable;
    nxDatabase1: TnxDatabase;
    nxSession1: TnxSession;
    nxRemoteServerEngine1: TnxRemoteServerEngine;
    nxWinsockTransport1: TnxWinsockTransport;
    DestCodigo: TStringField;
    DestDescricao: TStringField;
    DestUnid: TStringField;
    DestPreco: TCurrencyField;
    DestObs: TMemoField;
    DestImagem: TGraphicField;
    DestCategoria: TStringField;
    DestSubCateg: TStringField;
    DestEstoqueAtual: TFloatField;
    DestCustoUnitario: TCurrencyField;
    DestEstoqueACE: TFloatField;
    DestEstoqueACS: TFloatField;
    Button1: TButton;
    PB: TProgressBar;
    ME: TnxTable;
    MENumSeq: TAutoIncField;
    METransacao: TIntegerField;
    MEProduto: TStringField;
    MEQuant: TFloatField;
    MEUnitario: TCurrencyField;
    METotal: TCurrencyField;
    MEItem: TWordField;
    MEDesconto: TCurrencyField;
    MEDataMov: TDateTimeField;
    MEDataPag: TDateTimeField;
    MEEntrada: TBooleanField;
    MECancelado: TBooleanField;
    MEEstoqueAnt: TFloatField;
    METipoTran: TWordField;
    MEContato: TIntegerField;
    MECaixaMov: TIntegerField;
    MECaixaPag: TIntegerField;
    MECategoria: TStringField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var NI: Integer;
begin
  Origem.Open;
  Dest.Open;
  ME.Open;
  PB.Max := Origem.RecordCount;
  PB.Position := 0;
  NI := 0;
  Origem.First;
  while not Origem.Eof do begin
    PB.Position := PB.Position + 1;
    Dest.Insert;
    DestCodigo.Value := OrigemCodRef.Value;
    DestDescricao.Value := OrigemDescr.Value;
    DestCategoria.Value := OrigemCateg.Value;
    DestObs.Value := OrigemObs.Value;
    DestEstoqueAtual.Value := OrigemEstoq.Value;
    DestPreco.Value := OrigemPrecoVen.Value;
    Dest.Post;
    if OrigemEstoq.Value > 0.0009 then begin
      ME.Insert;
      MEDataMov.Value := Now;
      MEDataPag.Value := Now;
      MECaixaMov.Value := 0;
      MECaixaPag.Value := 0;
      METransacao.Value := 0;
      MEProduto.Value := DEstCodigo.Value;
      MECancelado.Value := False;
      MEEntrada.Value := True;
      METipoTran.Value := 9;
      Inc(NI);
      MEItem.Value := NI;
      MEDesconto.Value := 0;
      MEEstoqueAnt.Value := 0;
      METotal.Value := 0;
      MECategoria.Value := OrigemCateg.Value;
      MEUnitario.Value := 0;
      MEQuant.Value := OrigemEstoq.Value;
      ME.Post;
    end;
    Origem.Next;
    Application.ProcessMessages;
  end;  
end;

end.
