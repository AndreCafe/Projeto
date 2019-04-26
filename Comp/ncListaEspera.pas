unit ncListaEspera;
{
    ResourceString: Dario 13/03/13
}

interface

uses
  SysUtils,
  DB,
  MD5,
  Classes,
  Windows,
  ClasseCS,
  ncSessao,
  ncClassesBase;

type

  TncItemListaEspera = class
  private
    function GetString: String;
    procedure SetString(const Value: String);
  published
  public
    ilID          : Integer;
    ilCliente     : Integer;
    ilNomeCliente : String;
    ilDataHora    : TDateTime;
    ilPrevisao    : TDateTime;
    ilPrevMaq     : Integer;
    ilPrevSessao  : Integer;
    ilObs         : String;
    ilCartao      : String;
    _Operacao     : Byte;

    constructor Create;

    procedure LoadFromStram(S: TStream);
    procedure LoadFromDataset(D: TDataset);
    procedure SaveToStream(S: TStream);
    procedure SaveToDataset(D: TDataset; aPos: Integer);
    procedure Limpa;
    procedure AssignFrom(B: TncItemListaEspera);
    function Igual(B: TncItemListaEspera): Boolean;

    procedure SetPrevisao(Value: TDateTime);
    procedure SetPrevMaq(Value: Integer);
    procedure SetPrevSessao(Value: Integer);
    
    
    property AsString: String
      read GetString write SetString;  
  end;

  TncListaEspera = class
  private
    FItens : TList;
    function GetItem(I: Integer): TncItemListaEspera;
    function GetString: String;
    procedure SetString(Value: String);
  public
    constructor Create;
    destructor Destroy; override;

    procedure AjustaOperacao(B: TncListaEspera);

    procedure Remove(IME: TncItemListaEspera);
    procedure Delete(aIndex: Integer);
    
    procedure Limpa;
    procedure AjustaPrevisao(Sessoes: TncSessoes);

    function Count: Integer;

    function NewItem: TncItemListaEspera;

    function GetItemByID(aID: Integer): TncItemListaEspera;
    function GetItemBySessao(aSessao: Integer): TncItemListaEspera;
    
    property Itens[I: Integer]: TncItemListaEspera
      read GetItem; Default;

    property AsString: String
      read GetString write SetString;  
  end;
  

implementation

{ TncItemListaEspera }

procedure TncItemListaEspera.AssignFrom(B: TncItemListaEspera);
begin
  ilID          := B.ilID;
  ilCliente     := B.ilCliente;
  ilNomeCliente := B.ilNomeCliente;
  ilDataHora    := B.ilDataHora;
  ilPrevisao    := B.ilPrevisao;
  ilPrevMaq     := B.ilPrevMaq;
  ilPrevSessao  := B.ilPrevSessao;
  ilObs         := B.ilObs;
  ilCartao      := B.ilCartao;
  _Operacao     := B._Operacao;
end;

constructor TncItemListaEspera.Create;
begin
  Limpa;
end;

function TncItemListaEspera.GetString: String;
begin
  Result :=
    IntToStr(ilID) + sFldDelim(Classid_TncItemListaEspera) +
    IntToStr(ilCliente) + sFlddelim(Classid_TncItemListaEspera) +
    ilNomeCliente + sFldDelim(Classid_TncItemListaEspera) +
    GetDTStr(ilDataHora) + sFldDelim(Classid_TncItemListaEspera) + 
    GetDTStr(ilPrevisao) + sFldDelim(Classid_TncItemListaEspera) +
    IntToStr(ilPrevMaq) + sFldDelim(Classid_TncItemListaEspera) +
    IntToStr(ilPrevSessao) + sFldDelim(Classid_TncItemListaEspera) +
    ilObs + sFldDelim(Classid_TncItemListaEspera) + 
    ilCartao + sFldDelim(Classid_TncItemListaEspera) +
    IntToStr(_Operacao) + sFldDelim(Classid_TncItemListaEspera);
end;

function TncItemListaEspera.Igual(B: TncItemListaEspera): Boolean;
begin
  Result := False;
  if ilID <> B.ilID then Exit;
  if ilCliente <> B.ilCliente then Exit;
  if ilNomeCliente <> B.ilNomeCliente then Exit;
  if ilDataHora <> B.ilDataHora then Exit;
  if ilPrevisao <> B.ilPrevisao then Exit;
  if ilPrevMaq <> B.ilPrevMaq then Exit;
  if ilPrevSessao <> B.ilPrevSessao then Exit;
  if ilObs <> B.ilObs then Exit;
  if ilCartao <> B.ilCartao then Exit;
  Result := True;
end;

procedure TncItemListaEspera.Limpa;
begin
  ilID          := -1;
  ilCliente     := 0;
  ilNomeCliente := '';
  ilDataHora    := 0;
  ilPrevisao    := 0;
  ilPrevMaq     := 0;
  ilPrevSessao  := 0;
  ilObs         := '';
  ilCartao      := '';
  _Operacao     := osNenhuma;
end;

procedure TncItemListaEspera.LoadFromDataset(D: TDataset);
begin
  ilID          := D.FieldByName('ID').AsInteger; // do not localize
  ilCliente     := D.FieldByName('Cliente').AsInteger; // do not localize
  ilNomeCliente := D.FieldByName('NomeCliente').AsString; // do not localize
  ilDataHora    := D.FieldByName('DataHora').AsDateTime; // do not localize
  ilPrevisao    := D.FieldByName('Previsao').AsDateTime; // do not localize
  ilPrevMaq     := D.FieldByName('PrevMaq').AsInteger; // do not localize
  ilPrevSessao  := D.FieldByName('PrevSessao').AsInteger; // do not localize
  ilObs         := D.FieldByName('Obs').AsString; // do not localize
  ilCartao      := D.FieldByName('Cartao').AsString; // do not localize
end;

procedure TncItemListaEspera.LoadFromStram(S: TStream);
var 
  I : Integer;
  Str : String;
begin
  S.Read(I, SizeOf(I));
  if I>0 then begin
    SetLength(Str, I);
    S.Read(Str[1], I);
    AsString := Str;
  end else
    Limpa;
end;

procedure TncItemListaEspera.SaveToDataset(D: TDataset; aPos: Integer);
begin
  D.FieldByName('Cliente').AsInteger := ilCliente; // do not localize
  D.FieldByName('NomeCliente').AsString := ilNomeCliente; // do not localize
  D.FieldByName('DataHora').AsDateTime := ilDataHora; // do not localize
  D.FieldByName('Pos').AsInteger := aPos; // do not localize

  if ilPrevisao>0 then
    D.FieldByName('Previsao').AsDateTime := ilPrevisao else // do not localize
    D.FieldByName('Previsao').Clear; // do not localize

  if ilPrevMaq>0 then
    D.FieldByName('PrevMaq').AsInteger := ilPrevMaq else // do not localize
    D.FieldByName('PrevMaq').Clear; // do not localize

  if ilPrevSessao>0 then
    D.FieldByName('PrevSessao').AsInteger := ilPrevSessao else // do not localize
    D.FieldByName('PrevSessao').Clear; // do not localize
    
  D.FieldByName('Obs').AsString := ilObs; // do not localize
  D.FieldByName('Cartao').AsString := ilCartao; // do not localize
end;

procedure TncItemListaEspera.SaveToStream(S: TStream);
var 
  Str: String;
  I : Integer;
begin
  Str := AsString;
  I := Length(Str);
  S.Write(I, SizeOf(I));
  if I>0 then
    S.Write(Str[1], I);
end;

procedure TncItemListaEspera.SetPrevisao(Value: TDateTime);
begin
  if Value <> ilPrevisao then begin
    ilPrevisao := Value;
    _Operacao := osAlterar;
  end;
end;

procedure TncItemListaEspera.SetPrevMaq(Value: Integer);
begin
  if Value <> ilPrevMaq then begin
    ilPrevMaq := Value;
    _Operacao := osAlterar;
  end;
end;

procedure TncItemListaEspera.SetPrevSessao(Value: Integer);
begin
  if Value <> ilPrevSessao then begin
    ilPrevSessao := Value;
    _Operacao := osAlterar;
  end;
end;

procedure TncItemListaEspera.SetString(const Value: String);
var S: String;

function pCampo: String;
begin
  Result := GetNextStrDelim(S, classid_TncItemListaEspera);
end;

begin
  S := Value;
  ilID := StrToIntDef(pCampo, -1);
  ilCliente := StrToIntDef(pCampo, 0);
  ilNomeCliente := pCampo;
  ilDataHora := DTFromStr(pCampo);
  ilPrevisao := DTFromStr(pCampo);
  ilPrevMaq := StrToIntDef(pCampo, 0);
  ilPrevSessao := StrToIntDef(pCampo, 0);
  ilObs := pCampo;
  ilCartao := pCampo;
  _Operacao := StrToIntDef(pCampo, osNenhuma);
end;

procedure TncListaEspera.AjustaOperacao(B: TncListaEspera);
var 
  I : Integer;
  IL : TncItemListaEspera;
begin
  for I := 0 to Count - 1 do with Itens[I] do 
  if (ilID<>-1) and (B.GetItemByID(ilID)=nil) then
    _Operacao := osExcluir;

  for I := 0 to B.Count - 1 do
    if (B[I].ilID=-1) then begin
      if B[I]._Operacao<>osCancelar then begin
        B[I]._Operacao := osIncluir;
        NewItem.AssignFrom(B[I]);
      end;
    end
    else begin
      IL := GetItemByID(B[I].ilID);
      if IL<>nil then begin
        if B[I]._Operacao=osCancelar then
          IL._Operacao := osCancelar
        else begin  
          IL.AssignFrom(B[I]);
          IL._Operacao := osAlterar;
        end;
      end;
    end;

  for I := Count-1 downto 0 do
  if Itens[I]._Operacao=osNenhuma then begin
    Itens[I].Free;
    FItens.Delete(I);
  end;  
end;

type
  TTerminoSessao = record
    tsTermino : TDateTime;
    tsSessao  : Integer;
    tsMaq     : Integer;
  end;
  
procedure TncListaEspera.AjustaPrevisao(Sessoes: TncSessoes);
var 
  A : Array of TTerminoSessao;
  Termino : TDateTime;
  I, T, k: Integer;

procedure _MoveUp(aPos: Integer);
var j: Integer;
begin
  for j := aPos to T-2 do A[j+1] := A[j];
end;

function AddPos: Integer;
begin
  for Result := 0 to T-2 do
  if Termino < A[Result].tsTermino then Exit;
  Result := T-1;
end;
    
begin
  SetLength(A, 0);
  T := 0;
  for I := 0 to Sessoes.Count - 1 do with Sessoes[I], Tarifador do
  if CreditoTotal.Ticks>0 then begin
    Termino := Inicio + TicksToDateTime(Pausas.TicksTotal + CreditoTotal.Ticks);
    Inc(T);
    SetLength(A, T);
    k := AddPos;
    if k<(T-1) then _MoveUp(k);
    A[k].tsTermino := Termino;
    A[k].tsSessao := ID;
    A[k].tsMaq := Maq;
  end;

  for I  := T to Count-1 do begin
    Itens[I].SetPrevisao(0);
    Itens[I].SetPrevMaq(0);
    Itens[I].SetPrevSessao(0);
  end;

  for I := 0 to T-1 do begin
    Itens[I].SetPrevisao(A[I].tsTermino);
    Itens[I].SetPrevMaq(A[I].tsMaq);
    Itens[I].SetPrevSessao(A[I].tsSessao);
  end;
end;

function TncListaEspera.Count: Integer;
begin
  Result := FItens.Count;
end;

constructor TncListaEspera.Create;
begin
  FItens := TList.Create;
end;

procedure TncListaEspera.Delete(aIndex: Integer);
begin
  FItens.Delete(aIndex);
end;

destructor TncListaEspera.Destroy;
begin
  Limpa;
  FItens.Free;
  inherited;
end;

function TncListaEspera.GetItem(I: Integer): TncItemListaEspera;
begin
  Result := TncItemListaEspera(FItens[I]);
end;

function TncListaEspera.GetItemByID(aID: Integer): TncItemListaEspera;
var I : Integer;
begin
  for I := 0 to Count - 1 do
  if Itens[I].ilID=aID then begin
    Result := Itens[I];
    Exit;
  end;
  Result := nil;
end;

function TncListaEspera.GetItemBySessao(aSessao: Integer): TncItemListaEspera;
var I : Integer;
begin
  for I := 0 to Count - 1 do
  if Itens[I].ilPrevSessao=aSessao then begin
    Result := Itens[I];
    Exit;
  end;
  Result := nil;
end;

function TncListaEspera.GetString: String;
var I : Integer;
begin
  Result := '';
  for I := 0 to Count - 1 do 
    Result := Result + Itens[I].AsString + sListaDelim(classid_TncListaEspera);
end;

procedure TncListaEspera.Limpa;
begin
  while Count>0 do begin
    Itens[0].Free;
    FItens.Delete(0);
  end;
end;

function TncListaEspera.NewItem: TncItemListaEspera;
begin
  Result := TncItemListaEspera.Create;
  FItens.Add(Result);
end;

procedure TncListaEspera.Remove(IME: TncItemListaEspera);
begin
  FItens.Remove(IME);
end;

procedure TncListaEspera.SetString(Value: String);
var S: String;
begin
  while GetNextListItem(Value, S, classid_TncListaEspera) do
    NewItem.AsString := S;
end;

end.

