unit uPiratas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, nxdb, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxllComponent, nxsdServerEngine, nxreRemoteServerEngine,
  StdCtrls;

type
  TForm14 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    nxRSE: TnxRemoteServerEngine;
    nxSession1: TnxSession;
    nxTCPIP: TnxWinsockTransport;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    tLog: TnxTable;
    tCliCodigo: TIntegerField;
    tCliTipo: TWordField;
    tCliSenha: TStringField;
    tCliCadastroEm: TDateTimeField;
    tCliCadastroPor: TStringField;
    tCliAtualizadoEm: TDateTimeField;
    tCliAtualizadoPor: TStringField;
    tCliLoja: TStringField;
    tCliRazaoSocial: TStringField;
    tCliPais: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliEndereco: TMemoField;
    tCliCEP: TStringField;
    tCliBairro: TStringField;
    tCliSerieHD: TStringField;
    tCliNumMaq: TWordField;
    tCliCNPJ: TStringField;
    tCliIE: TStringField;
    tCliObs: TMemoField;
    tCliTelefones: TMemoField;
    tCliEmailReg: TMemoField;
    tCliFormaPagto: TMemoField;
    tCliLicMaq: TWordField;
    tCliLicTipo: TWordField;
    tCliLicVenc: TDateField;
    tCliManInicio: TDateField;
    tCliManVenc: TDateField;
    tCliProprietarios: TMemoField;
    tCliGerente: TStringField;
    tCliTipoLoja: TWordField;
    tCliEmailTec: TMemoField;
    tCliValor: TCurrencyField;
    tCliValorRec: TCurrencyField;
    tCliEmitirNF: TBooleanField;
    tCliMessenger: TMemoField;
    tCliICQ: TMemoField;
    tCliUObtemLic: TDateTimeField;
    tCliUVersao: TStringField;
    tCliNegociacao: TWordField;
    tCliStatus: TIntegerField;
    tCliContatarEm: TDateTimeField;
    tLogNum: TAutoIncField;
    tLogDataHora: TDateTimeField;
    tLogLoja: TIntegerField;
    tLogDetalhes: TMemoField;
    tLogIP: TStringField;
    tLogOperID: TWordField;
    tLogOK: TBooleanField;
    tLogSerieHD: TStringField;
    Button2: TButton;
    tLogIP2: TStringField;
    Button3: TButton;
    tLog2: TnxTable;
    AutoIncField1: TAutoIncField;
    DateTimeField1: TDateTimeField;
    IntegerField1: TIntegerField;
    MemoField1: TMemoField;
    StringField1: TStringField;
    WordField1: TWordField;
    BooleanField1: TBooleanField;
    tLog2SerieHD: TStringField;
    tLog2IP2: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

{$R *.dfm}

procedure TForm14.Button1Click(Sender: TObject);
begin
  tLog.Active := True;
  tCli.Active := True;
  tLog.SetRange([7], [7]);
  while not tLog.Eof do begin
    tCli.SetRange([tLogSerieHD.Value], [tLogSerieHD.Value]);
    while not tCli.Eof do begin
      if (tCliLicTipo.Value<>4) and (tCliUObtemLic.Value>EncodeDate(2006, 6, 16)) then
        Memo1.Lines.Values[tCliCodigo.AsString]  := tCliLoja.AsString;
      tCli.Next;
    end;
    tLog.Next;
  end;
end;

procedure TForm14.Button2Click(Sender: TObject);
begin
  tLog.Active := True;
  while not tLog.Eof  do begin
    tLog.Edit;
    tLogIP2.Value := Copy(tLogIP.Value, 1, Pos(':', tLogIP.Value)-1);
    tLog.Post;
    tLog.Next;
  end;
  ShowMessage('Pronto!');
end;

procedure TForm14.Button3Click(Sender: TObject);
begin
  tLog.Active := True;
  tLog2.Active := True;
  tCli.Active := True;
  tLog.SetRange([5], [5]);
  while not tLog.Eof do begin
    tLog2.SetRange([tLogIP2.Value, 7], [tLogIP2.Value, 7]);
    while not tLog2.Eof do begin
      if tLog2SerieHD.Value <> tLogSerieHD.Value then
        Memo1.Lines.Values[tLogLoja.AsString]  := 'S';
      tLog2.Next;
    end;
    tLog.Next;  
  end;
  ShowMessage('adslkjasdlkjasdlkasdklj PRONTO');
  Beep;
end;

end.
