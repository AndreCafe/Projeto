unit uZeraCred;

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
    tCli: TnxTable;
    nxTCP: TnxWinsockTransport;
    tCliID: TAutoIncField;
    tCliNome: TStringField;
    tCliMinutos: TFloatField;
    tCliUltVisita: TDateTimeField;
    tCliValorCred: TCurrencyField;
    PB: TProgressBar;
    Button1: TButton;
    nxRemoteServerEngine1: TnxRemoteServerEngine;
    edData: TcxDateEdit;
    cxLabel1: TcxLabel;
    cbTempo: TcxCheckBox;
    cbValor: TcxCheckBox;
    cbTodos: TcxCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbTodosClick(Sender: TObject);
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
var I : Integer;
begin
  if (not cbTempo.Checked) and (not cbValor.Checked) then begin
    ShowMessage('Marque os tipos de tempo que deseja gerar');
    Exit;
  end;
  tCli.IndexName := 'IUltVisita';
  tCli.Open;
  
  if not cbTodos.Checked then
    tCli.SetRange([EncodeDate(1980, 1, 1)], [edData.Date]);
    
  PB.Max := tCli.RecordCount;
  PB.Position := 0;
  tCli.First;
  I := 0;
  while not tCli.Eof do begin
    if (tCliMinutos.Value>0) or (tCliValorCred.Value>0) then begin
      tCli.Edit;
      if cbTempo.Checked then tCliMinutos.Value := 0;
      if cbValor.Checked then tCliValorCred.Value := 0;
      tCli.Post;
      Inc(I);
    end;
    tCli.Next;
    PB.Position := PB.Position + 1;
    Application.ProcessMessages;  
  end;

  ShowMessage('Pronto! '+IntToStr(I)+' clientes tiveram seus créditos zerados');
  Close;
end;

procedure TForm16.cbTodosClick(Sender: TObject);
begin
  edData.Enabled := not cbTodos.Checked;
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
