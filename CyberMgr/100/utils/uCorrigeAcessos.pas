unit uCorrigeAcessos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Db, ffdb, fflleng, ffsrintm, ffclreng,
  ffllcomp, ffllcomm, fflllgcy, ffllbase, ffdbbase, StdCtrls, cmClassesBase;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ffClient1: TffClient;
    ffSession1: TffSession;
    ffDatabase1: TffDatabase;
    ffLT: TffLegacyTransport;
    FFRemoteServerEngine1: TFFRemoteServerEngine;
    T: TffTable;
    TNumero: TAutoIncField;
    TCaixa: TIntegerField;
    TAberto: TBooleanField;
    TTipoAcesso: TWordField;
    TInicio: TDateTimeField;
    TFim: TDateTimeField;
    TDataPagto: TDateTimeField;
    TContato: TIntegerField;
    TNome: TStringField;
    TMaquina: TWordField;
    TTipo: TWordField;
    TFuncI: TStringField;
    TFuncF: TStringField;
    TTempo: TDateTimeField;
    TTempoCobrado: TDateTimeField;
    TCredUsado: TIntegerField;
    TCredAnterior: TIntegerField;
    TDesconto: TCurrencyField;
    TProdutos: TCurrencyField;
    TMotivoDesc: TWordField;
    TValor: TCurrencyField;
    TObs: TMemoField;
    TIsento: TBooleanField;
    TFormaPagto: TStringField;
    TNaoUsarPacote: TBooleanField;
    TCodPacote: TWordField;
    TSinal: TCurrencyField;
    TAcessoPago: TIntegerField;
    TValorFinalAcesso: TCurrencyField;
    TDescontoProduto: TCurrencyField;
    Timer1: TTimer;
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormShow(Sender: TObject);
begin
  Timer1.Enabled := true;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  T.Open;
  T.First;
  while not T.Eof do begin
    Application.ProcessMessages;
    T.Edit;
    TValorFinalAcesso.Value := 
      CalcAcesso(TValor.Value, TSinal.Value, TDesconto.Value);
    
    T.Post;
    T.Next;
  end;
  Beep;
  ShowMessage('Dados corrigidos com sucesso !');
  Close;
end;

end.
