unit uRSLogInfo;

interface

uses
  Classes, DB, SysUtils;

type

  TLogInfo = class
  public
    liOper      : Word;
    liDataHora  : TDateTime;
    liLoja      : Integer;
    liOK        : Boolean;
    liDetalhes  : TStrings;
    liIP        : String;
    liHD        : String;

    constructor Create;
    destructor Destroy; override;
    procedure Limpa;
    procedure Inicia(aOp: Word; aIP: String);
    procedure SaveToDataset(D : TDataset);
  end;  

implementation

{ TLogInfo }

constructor TLogInfo.Create;
begin
  liDetalhes := TStringList.Create;
  Limpa;
end;

destructor TLogInfo.Destroy;
begin
  liDetalhes.Free;
  inherited;
end;

procedure TLogInfo.Inicia(aOp: Word; aIP: String);
begin
  Limpa;
  liOper := aOp;
  liIP := aIP;
end;

procedure TLogInfo.Limpa;
begin
  liOper  := 0;
  liDataHora  := Now;
  liLoja      := 0;
  liOk        := False;
  liDetalhes.Clear;
  liIP        := '';
  liHD := '';
end;

procedure TLogInfo.SaveToDataset(D: TDataset);
begin
  try
    D.Insert;
    D.FieldByName('OperID').AsInteger := liOper;
    D.FieldByName('DataHora').AsDateTime := liDataHora;
    D.FieldByName('Ok').AsBoolean := liOk;
    D.FieldByName('Loja').AsInteger := liLoja;
    D.FieldByName('Detalhes').AsString := liDetalhes.Text;
    D.FIeldByName('IP').AsString := liIP;
    D.FieldByName('SerieHD').AsString := liHD;
    D.Post;
  except
  end;  
end;


end.
