unit uCorrigeTimestampZero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ComCtrls, nxdb, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxsdServerEngine, nxreRemoteServerEngine, nxllComponent;

type
  TForm26 = class(TForm)
    nxSession1: TnxSession;
    nxDatabase1: TnxDatabase;
    nxRemoteServerEngine1: TnxRemoteServerEngine;
    nxWinsockTransport1: TnxWinsockTransport;
    T: TnxTable;
    PB: TProgressBar;
    Button1: TButton;
    TID: TAutoIncField;
    TTran: TIntegerField;
    TProduto: TIntegerField;
    TQuant: TFloatField;
    TUnitario: TCurrencyField;
    TTotal: TCurrencyField;
    TCustoU: TCurrencyField;
    TItem: TWordField;
    TDesconto: TCurrencyField;
    TPago: TCurrencyField;
    TPagoPost: TCurrencyField;
    TDescPost: TCurrencyField;
    TDataHora: TDateTimeField;
    TEntrada: TBooleanField;
    TCancelado: TBooleanField;
    TEstoqueAnt: TFloatField;
    TCliente: TIntegerField;
    TCaixa: TIntegerField;
    TCategoria: TStringField;
    TNaoControlaEstoque: TBooleanField;
    TITran: TIntegerField;
    TTipoTran: TWordField;
    TSessao: TIntegerField;
    TFidResgate: TBooleanField;
    TFidPontos: TFloatField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form26: TForm26;

implementation

{$R *.dfm}

procedure TForm26.Button1Click(Sender: TObject);
var 
  P: PDateTime;
  Q: Integer;
  D: TDateTime;
begin
  T.Open;
  T.First;
  New(P);
  D := EncodeDate(2000, 1, 1);
  P^ := 0; Q := 0;
  PB.Max := T.RecordCount;
  while not T.Eof do begin
    if (T.GetFieldData(TDataHora, P) and (P^<D)) or (TTran.Value=0) then
    begin
      T.Delete;
      Inc(Q);
    end else
      T.Next;
    PB.Position := PB.Position + 1;
    PB.Repaint;  
  end;
  Dispose(P);
  ShowMessage('Fim de correção - '+IntToStr(Q));
  Close;
end;

end.
