unit uCorrigeVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Db, ffdb, fflleng, ffsrintm, ffclreng,
  ffllcomp, ffllcomm, fflllgcy, ffllbase, ffdbbase, StdCtrls, cmClassesBase;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    ffClient1: TffClient;
    ffSession1: TffSession;
    DB: TffDatabase;
    ffLT: TffLegacyTransport;
    FFRemoteServerEngine1: TFFRemoteServerEngine;
    T: TffTable;
    Q: TffQuery;
    TNumSeq: TAutoIncField;
    TEmissor: TIntegerField;
    TSerie: TStringField;
    TNumero: TIntegerField;
    TProduto: TStringField;
    TQuant: TFloatField;
    TUnitario: TCurrencyField;
    TTotal: TCurrencyField;
    TItem: TWordField;
    TDesconto: TCurrencyField;
    TData: TDateTimeField;
    TMovEst: TBooleanField;
    TEntrada: TBooleanField;
    TCancelado: TBooleanField;
    TEstoqueAnt: TFloatField;
    TTipoMov: TStringField;
    TContato: TIntegerField;
    TCaixa: TIntegerField;
    QSerie: TStringField;
    QNumero: TIntegerField;
    QCaixa: TIntegerField;
    QDiaHora: TDateTimeField;
    QTipo: TStringField;
    QEntrada: TBooleanField;
    QMovEst: TBooleanField;
    QChamada: TIntegerField;
    QContato: TIntegerField;
    QUsuario: TStringField;
    QEntregar: TBooleanField;
    QEntregador: TWordField;
    QCancelado: TBooleanField;
    QFormaPagto: TStringField;
    QTotal: TCurrencyField;
    QDesconto: TCurrencyField;
    QObs: TMemoField;
    QEndEnt: TStringField;
    QBaiEnt: TStringField;
    QCidEnt: TStringField;
    QUFEnt: TStringField;
    QEmissor: TIntegerField;
    QDtMovimentacao: TDateTimeField;
    QSituacao: TStringField;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Timer1Timer(Sender: TObject);
var 
  NumItens, I : Integer;
  DescFinal, Fator : Double;
begin
  Timer1.Enabled := False;
  Q.Open;
  T.Open;
  T.First;
  while not Q.Eof do begin
    Application.ProcessMessages;
    T.CancelRange;
    T.SetRange([QEmissor.Value, QSerie.Value, QNumero.Value],
               [QEmissor.Value, QSerie.Value, QNumero.Value]);
    NumItens := T.RecordCount;
    DescFinal := QDesconto.Value;
    Fator := QDesconto.Value / QTotal.Value;
    T.First;
    I := 0;
    while not T.Eof do begin
      Inc(I);
      T.Edit;
      if I=NumItens then
        TDesconto.Value := DescFinal
      else
        TDesconto.Value := DuasCasas(TTotal.Value * Fator);  
      DescFinal := DescFinal - TDesconto.Value;  
      T.Post;
      T.Next;
    end;  
    Q.Next;
  end;
  Beep;
  ShowMessage('Atualização realizada com sucesso!');
  Close;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

end.
