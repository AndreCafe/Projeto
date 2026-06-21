unit uImpNomes;

interface

uses
  nxSEAllEngines, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, nxdb, nxllComponent, nxsdServerEngine, nxsrServerEngine, StdCtrls,
  ComCtrls, nxsrSqlEngineBase, nxsqlEngine;

type
  TForm28 = class(TForm)
    Button1: TButton;
    nxServerEngine1: TnxServerEngine;
    nxSession1: TnxSession;
    nxDatabase1: TnxDatabase;
    T: TnxTable;
    TUsuario: TStringField;
    TSexo: TStringField;
    PB: TProgressBar;
    tA: TnxTable;
    tAUsuario: TStringField;
    tASexo: TStringField;
    Button2: TButton;
    tN: TnxTable;
    Q: TnxQuery;
    nxSqlEngine1: TnxSqlEngine;
    QUsuario: TStringField;
    QSexo: TStringField;
    QQtd: TLargeintField;
    tNA: TnxTable;
    tNAUsuario: TStringField;
    tNASexo: TStringField;
    tNAQtd: TIntegerField;
    Button3: TButton;
    tNNome: TStringField;
    tNSexo: TStringField;
    tNQtd: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form28: TForm28;

implementation

{$R *.dfm}

function PNome(S: String): String;
var I : Integer;
begin
  I := 1;
  while (I<=Length(S)) and (Copy(S, I, 1)<>' ') do Inc(I);
  Result := Copy(S, 1, I-1);
end;

procedure TForm28.Button1Click(Sender: TObject);
var Tam : Integer;
begin
  T.Open;
  T.First;   Tam := 0;
  PB.Max := T.RecordCount;
  PB.Position := 0;
  while not t.Eof do begin
    T.Edit;
    TUsuario.Value := PNome(Trim(TUsuario.Value));
    if Length(TUsuario.Value)>Tam then 
      Tam := Length(TUsuario.Value);
    T.Post;
    T.Next;
    PB.Position := PB.Position + 1;
    if (PB.Position mod 100) = 0 then Application.ProcessMessages;
  end;
  ShowMessage(IntToStr(Tam));
end;

procedure TForm28.Button3Click(Sender: TObject);
begin
  tN.Open;
  tNA.Open;
  while not tNA.Eof do begin
    if TN.FindKey([tNAUsuario.Value]) then begin
      if tNQtd.Value = tNAQtd.Value then
        tN.Delete
      else
      if tNQtd.Value < tNAQtd.Value then begin
        tN.Edit;
        tNSexo.Value := tNASexo.Value;
        tNQtd.Value := tNAQtd.Value;
        tN.Post;
      end;
    end else begin
      tN.Insert;
      tNNome.Value := tNAUsuario.Value;
      tNSexo.Value := tNASexo.Value;
      tNQtd.Value := tNAQtd.Value;
      tN.Post;
    end;
    tNA.Next;
  end;
  ShowMessage('Fim');
end;

end.
