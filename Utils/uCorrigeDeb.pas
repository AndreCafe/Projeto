unit uCorrigeDeb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, nxreRemoteServerEngine, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, 
  cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, dxCore, cxDateUtils,
  cxCheckBox;

type
  TForm16 = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    tTran: TnxTable;
    nxTCP: TnxWinsockTransport;
    PB: TProgressBar;
    Button1: TButton;
    nxRemoteServerEngine1: TnxRemoteServerEngine;
    tTranID: TAutoIncField;
    tTranDataHora: TDateTimeField;
    tTranCliente: TIntegerField;
    tTranTipo: TWordField;
    tTranFunc: TStringField;
    tTranTotal: TCurrencyField;
    tTranDesconto: TCurrencyField;
    tTranTotLiq: TCurrencyField;
    tTranPago: TCurrencyField;
    tTranDebitoAnt: TCurrencyField;
    tTranDebito: TCurrencyField;
    tTranDebitoPago: TCurrencyField;
    tTranCreditoAnt: TCurrencyField;
    tTranCredito: TCurrencyField;
    tTranCreditoUsado: TCurrencyField;
    tTranTroco: TCurrencyField;
    tTranObs: TnxMemoField;
    tTranCancelado: TBooleanField;
    tTranCanceladoPor: TStringField;
    tTranCanceladoEm: TDateTimeField;
    tTranCaixa: TIntegerField;
    tTranCaixaPag: TIntegerField;
    tTranMaq: TWordField;
    tTranNomeCliente: TStringField;
    tTranSessao: TIntegerField;
    tTranDescr: TStringField;
    tTranQtdTempo: TFloatField;
    tTranCredValor: TBooleanField;
    tTranFidResgate: TBooleanField;
    tTranplusID: TGuidField;
    tTranplusTran: TBooleanField;
    tTranPagFunc: TStringField;
    tTranPagPend: TBooleanField;
    tTranRecVer: TIntegerField;
    tITran: TnxTable;
    tDebito: TnxTable;
    tITranID: TAutoIncField;
    tITranTran: TIntegerField;
    tITranCaixa: TIntegerField;
    tITranCaixaPag: TIntegerField;
    tITranCliente: TIntegerField;
    tITranSessao: TIntegerField;
    tITranDataHora: TDateTimeField;
    tITranTipoTran: TWordField;
    tITranTipoItem: TWordField;
    tITranSubTipo: TWordField;
    tITranItemID: TIntegerField;
    tITranSubItemID: TIntegerField;
    tITranItemPos: TWordField;
    tITranTotal: TCurrencyField;
    tITranDesconto: TCurrencyField;
    tITranTotLiq: TCurrencyField;
    tITranDebito: TCurrencyField;
    tITranPago: TCurrencyField;
    tITranCancelado: TBooleanField;
    tITranPagPend: TBooleanField;
    tITranFidFator: TSmallintField;
    tITranFidPontos: TFloatField;
    tITranFidMov: TBooleanField;
    tITranplusID: TGuidField;
    tITranplusTran: TBooleanField;
    tITranFidOpe: TWordField;
    tITranRecVer: TIntegerField;
    tCli: TnxTable;
    tCliID: TAutoIncField;
    tCliDebito: TCurrencyField;
    tCliTemDebito: TBooleanField;
    tDebitoData: TDateTimeField;
    tDebitoCliente: TIntegerField;
    tDebitoValor: TCurrencyField;
    tDebitoTipo: TWordField;
    tDebitoID: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

function StrToCurrency(S: String): Currency;
var 
  Code, P : Integer;
  Res: Real;
begin
  P := Pos(',', S);
  if P>0 then S[P] := '.';
  Result := 0;
  if (Trim(S)>'') then begin
    Val(S, Res, Code);
    if Code=0 then
      REsult := Res;
  end;
end;

function CodStr(I: Integer): String;
begin
  Result := IntToStr(I);
  while length(result)<3 do
    result := '0'+result;
end;

function SoDig(S: String): String;
var i: integer;
begin
  result := '';
  for i := 1 to length(S) do
    if s[i] in ['0'..'9', '-'] then
      result := result + s[i];
end;

function SoDig2(S: String): String;
var i: integer;
begin
  result := '';
  for i := 1 to length(S) do
    if s[i] in ['0'..'9'] then
      result := result + s[i];
end;

function LimpaRG(S: String): String;
var I: Integer;
begin
  Result := '';
  while (Length(S)>0) and (not (S[1] in ['0'..'9'])) do
    Delete(S, 1, 1);
  Result := Trim(S);  
end;

function MeuTrim(S: String): String;
var 
   I: Integer; 
begin
  Result := '';
  for I := 1 to Length(S) do 
    if Ord(S[i])=160 then
      Result := Result + ' ' else
      Result := Result + S[i];
end;

procedure TForm16.Button1Click(Sender: TObject);
var 
  I : Integer;
  A, D, T : Currency;
begin
  tTran.Open;
  tITran.Open;
  tCli.Open;
  tDebito.Open;

  I := 0;
  PB.Max := tTran.RecordCount;

  PB.Position := 0;
  
  while not tTran.Eof do begin
    if (not tTranCancelado.Value) and (not tTranPagPend.Value) and (tTranDebito.Value>0) and (tTranCliente.Value>0) then
    begin
      tITran.SetRange([tTranID.Value], [tTranID.Value]);
      tITran.First;
      T := 0;
      while not tITran.Eof do begin
        if tITranPagPend.Value then begin
          tITran.Edit;
          tItranPagPend.Value := False;
          tITran.Post;
          

          if tITranDebito.Value>0 then begin
            T := T + tITranDebito.Value;
            tDebito.Insert;
            tDebitoData.Value := tITranDataHora.Value;
            tDebitoCliente.Value := tTranCliente.Value;
            tDebitoTipo.Value := 1;
            tDebitoID.Value := tITranItemID.Value;
            tDebitoValor.Value := tITranDebito.Value;
            tDebito.Post;
          end;
        end;
        tITran.Next;
      end;

      if (T>0) and tCli.FindKey([tTranCliente.Value]) then begin 
        Inc(I);
        tCli.Edit;
        tCliDebito.Value := tCliDebito.Value + T;
        tCli.Post;
      end;

    end;

    tTran.Next;
    PB.Position := PB.Position + 1;
    Application.ProcessMessages;  
  end;

  ShowMessage('Pronto! '+IntToStr(I)+' transações tiveram débitos corrigidos');
  Close;
end;

procedure TForm16.FormCreate(Sender: TObject);
begin
  nxdb.aliasname := 'NexCafe';
end;

procedure TForm16.FormShow(Sender: TObject);
begin
  tCli.Open;
end;

end.
