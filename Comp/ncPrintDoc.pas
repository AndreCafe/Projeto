unit ncPrintDoc;

interface
{
    ResourceString: Dario 13/03/13
    Nada para fazer
}

uses
  SysUtils,
  DB,
  MD5,
  Dialogs,
  Classes,
  Windows,
  ClasseCS,
  ncClassesBase;

type
  TncPrintDoc = class ( TncClasse )
  private
    FSL : TStrings;

    function GetChave: Variant; override;
    function GetDocInfoStr: String;
    procedure SetDocInfoStr(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;

    function TipoClasse: Integer; override;

    function Arq: TGUID;

    function Sessao: Integer;

    function Tipo: Integer;

    function NomeTipo: String;

    function ArqStr: String;

    function CalcPages: Integer;

    function Retrato: Boolean;

    function TotPages: Integer;
    
    property DocInfo: TStrings
      read FSL;
  published
    property DocInfoStr: String
      read GetDocInfoStr write SetDocInfoStr;
  end;

  TncPrintDocs = class ( TListaClasseCS )
  private
    function GetPorArq(Arq: String): TncPrintDoc;
    function GetPrintDoc(I: Integer): TncPrintDoc;
    function GetPorSessao(aID: Integer): TncPrintDoc;
  public
    property PorArq[Arq: String]: TncPrintDoc
      read GetPorArq;

    property PorSessao[aID: Integer]: TncPrintDoc
      read GetPorSessao;  
      
    property Itens[I: Integer]: TncPrintDoc
      read GetPrintDoc; default;
  end;

implementation

{ TncPrintDoc }

uses ncTipoImp;

function TncPrintDoc.Arq: TGUID;
begin
  Result := StringToGuid(FSL.Values['Arq']); // do not localize
end;

function TncPrintDoc.ArqStr: String;
begin
  Result := FSL.Values['Arq']; // do not localize
end;

function TncPrintDoc.CalcPages: Integer;
var 
  S, N: String;
  NI, P : Integer;
begin
  NI := 0;
  S := Trim(FSL.Values['NaoImp']); // do not localize

  while (S>'') do begin
    P := Pos(',', S);
    N := '';
    if P > 0 then begin
      N := Copy(S, 1, P-1);
      Delete(S, 1, P);
    end else begin
      N := Trim(S);
      S := '';
    end;
    if (N>'') and (StrToIntDef(N, 0)>0) then Inc(NI);
  end;

  Result := TotPages - NI;
  if Result<0 then 
    Result := 0;
end;

constructor TncPrintDoc.Create;
begin
  inherited;
  FSL := TStringList.Create;
end;

destructor TncPrintDoc.Destroy;
var O : TObject;
begin
  O := TObject(FSL);
  try
    inherited;
  finally
    O.Free;
  end;
end;

function TncPrintDoc.GetChave: Variant;
begin
  Result := FSL.Values['Arq']; // do not localize
end;

function TncPrintDoc.GetDocInfoStr: String;
begin
  Result := FSL.Text;
end;

function TncPrintDoc.NomeTipo: String;
var T: TncTipoImp;
begin
  T := gTiposImp.PorID[Tipo];
  if T<>nil then
    Result := T.Nome else
    Result := '';
end;

function TncPrintDoc.Retrato: Boolean;
begin
  Result := (StrToIntDef(FSL.Values['BmpH'], 0) >= StrToIntDef(FSL.Values['BmpW'], 0)); // do not localize
end;

function TncPrintDoc.Sessao: Integer;
begin
  Result := StrToIntDef(FSL.Values['Sessao'], -1); // do not localize
end;

procedure TncPrintDoc.SetDocInfoStr(const Value: String);
begin
  FSL.Text := Value;
end;

function TncPrintDoc.Tipo: Integer;
begin
  Result := StrToIntDef(FSL.Values['Tipo'], -1); // do not localize
end;

function TncPrintDoc.TipoClasse: Integer;
begin
  Result := tcPrintDoc;
end;

function TncPrintDoc.TotPages: Integer;
begin
  Result := StrToIntDef(FSL.Values['TotPages'], 0); // do not localize
end;

{ TncPrintDocs }

function TncPrintDocs.GetPorArq(Arq: String): TncPrintDoc;
var I : Integer;
begin
  for I := 0 to Count-1 do 
    if (GetPrintDoc(I).DocInfo.Values['Arq'] = Arq) then begin // do not localize
      Result := GetPrintDoc(I);
      Exit;
    end;

  Result := nil;  
end;

function TncPrintDocs.GetPorSessao(aID: Integer): TncPrintDoc;
var I : Integer;
begin
  for I := 0 to Count-1 do 
    if (GetPrintDoc(I).Sessao = aID) then begin
      Result := GetPrintDoc(I);
      Exit;
    end;

  Result := nil;  
end;

function TncPrintDocs.GetPrintDoc(I: Integer): TncPrintDoc;
begin
  Result := TncPrintDoc(GetItem(I));
end;


end.

