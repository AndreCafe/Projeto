unit ClasseCS;

interface

uses
  Classes,
  Db,
  SysUtils,
  SyncObjs,
  CacheProp;

type
  {$M+}
  TClasseCS = class
  private
    FCacheProp  : TCacheProp;
  protected
    function GetChave: Variant; virtual; abstract;
  public  
    constructor Create;
    destructor Destroy; override;

    function HaAlteracoes: Boolean;

    procedure AtualizaCache;  // Salva valores propriedads para cache
    procedure Reverte; // Salva valores em cache p/ propriedades
    procedure LimpaCache; // Todos valores serao considerados alterados

    procedure LeStream(S: TStream); virtual;
    procedure LeReader(R: TCPReader; S: TStream); virtual;
    procedure SalvaWriter(W: TCPWriter; SoAlterados: Boolean); virtual;
    procedure SalvaStream(S: TStream; SoAlterados: Boolean); virtual;

    procedure LeDataset(Tab: TDataset); virtual;
    procedure SalvaDataset(Tab: TDataset); virtual;

    procedure Assign(ObjFonte: TClasseCS); virtual;

    function PropriedadesAlteradas: String;

    property Chave: Variant
      read GetChave;
  end;
  {$M-}

  TCriaClasseCSFunc = function (TipoClasse: Integer): TClasseCS of Object;

  TListaClasseCS = class
  private
    FTipoClasse : Integer;
    FItens      : TList;
    FCriaClasse : TCriaClasseCSFunc;
    FSyncObj    : TCriticalSection;

  protected
    function GetItem(I: Integer): TClasseCS;
    function GetItemPorChave(V: Variant): TClasseCS;
    function GetCount: Integer; virtual;
  public
    constructor Create(aTipoClasse: Integer); 
    destructor Destroy; override;

    procedure Limpa;

    procedure Lock;
    procedure Unlock;

    procedure AtualizaCache;

    procedure LeDataset(Tab: TDataset);
    procedure SalvaDataset(Tab: TDataset);

    procedure LeStream(S: TStream);
    procedure SalvaStream(S: TStream);

    procedure SalvaArquivo(Nome: String); virtual;
    procedure LeArquivo(Nome: String); virtual;

    procedure Add(Obj: TClasseCS);
    function Remove(Obj: TClasseCS): Integer;

    property Itens[I: Integer]: TClasseCS
      read GetItem; default;

    property ItemPorChave[V: Variant]: TClasseCS
      read GetItemPorChave;  

    property Count: Integer
      read GetCount;  

    property CriaClasse: TCriaClasseCSFunc
      read FCriaClasse write FCriaClasse;
  end;  

implementation

uses ncDebug;

{ TClasseCS }

procedure TClasseCS.AtualizaCache;
begin
  FCacheProp.LeProps;
end;

constructor TClasseCS.Create;
begin
  inherited;
  FCacheProp := TCacheProp.Create(Self);
end;

destructor TClasseCS.Destroy;
begin
  FCacheProp.Free;
  inherited;
end;

procedure TClasseCS.LeReader(R: TCPReader; S: TStream);
begin
  FCacheProp.LeReader(R, S);
end;

procedure TClasseCS.LeStream(S: TStream);
begin
  FCacheProp.LeStream(S);
end;

procedure TClasseCS.Reverte;
begin
  FCacheProp.Reverte;
end;

procedure TClasseCS.LimpaCache;
begin
  FCacheProp.Limpa;
end;

procedure TClasseCS.SalvaDataset(Tab: TDataset);
var F: TField;
begin
  FCacheProp.SalvaDataset(Tab);
  F := Tab.FindField('ObjectInt');
  if Assigned(F) then
    F.AsInteger := Integer(Self);
end;

procedure TClasseCS.LeDataset(Tab: TDataset);
begin
  FCacheProp.LeDataset(Tab);
end;

procedure TClasseCS.SalvaStream(S: TStream; SoAlterados: Boolean);
begin
  try
    FCacheProp.SalvaStream(S, SoAlterados);
  except
    on E: Exception do 
      Raise Exception.Create('TClasseCS.SalvaStream - Exception: ' + E.Message);
  end;
end;

procedure TClasseCS.SalvaWriter(W: TCPWriter; SoAlterados: Boolean);
begin
  try
    FCacheProp.SalvaWriter(W, SoAlterados);
  except
    on E: Exception do 
      raise Exception.Create('TClasseCS.SalvaWriter - Exception: '+ E.Message);
  end;
end;

procedure TClasseCS.Assign(ObjFonte: TClasseCS);
begin
  FCacheProp.Assign(ObjFonte);
end;

function TClasseCS.HaAlteracoes: Boolean;
begin
  Result := FCacheProp.Alterou;
end;

function TClasseCS.PropriedadesAlteradas: String;
begin
  Result := FCacheProp.PropertiesAlteradas;
end;

procedure TListaClasseCS.LeArquivo(Nome: String);
var S: TStream;
begin
  if not FileExists(Nome) then Exit;
  S := TFileStream.Create(Nome, fmOpenRead);
  try
    LeStream(S);
  finally
    S.Free;
  end;
end;

procedure TListaClasseCS.SalvaArquivo(Nome: String);
var S: TStream;
begin
  S := TFileStream.Create(Nome, fmCreate);
  try
    SalvaStream(S);
  finally
    S.Free;
  end;
end;

{ TListaClasseCS }

constructor TListaClasseCS.Create(aTipoClasse: Integer);
begin
  inherited Create;
  FTipoClasse := aTipoClasse;
  FItens := TList.Create;
  FCriaClasse := nil;
  FSyncObj := TCriticalSection.Create;
end;

destructor TListaClasseCS.Destroy;
begin
  Limpa;
  FItens.Free;
  FSyncObj.Free;
  inherited;
end;

procedure TListaClasseCS.Limpa;
var Obj: TClasseCS;
begin
  Lock;
  try
    while Count > 0 do begin
      Obj := Itens[0];
      FItens.Remove(Obj);
      Obj.Free;
    end;  
  finally
    Unlock;
  end;    
end;

function TListaClasseCS.GetCount: Integer;
begin
  Lock;
  try
    Result := FItens.Count;
  finally
    Unlock;
  end;    
end;

function TListaClasseCS.GetItem(I: Integer): TClasseCS;
begin
  Lock;
  try
    Result := FItens[I];
  finally
    Unlock;
  end;    
end;

function TListaClasseCS.GetItemPorChave(V: Variant): TClasseCS;
var I : Integer;
begin
  Lock;
  try
    for I := 0 to pred(Count) do
    if Itens[I].Chave = V then begin
      Result := Itens[I];
      Exit;
    end;
  finally
    Unlock;
  end;    
  Result := nil;  
end;

procedure TListaClasseCS.LeDataset(Tab: TDataset);
var Obj: TClasseCS;
begin
  Lock;
  try
    Tab.First;
    while not Tab.Eof do begin
      Obj := FCriaClasse(FTipoClasse);
      Obj.LeDataset(Tab);
      FItens.Add(Obj);
      Tab.Next;
    end;
  finally
    Unlock;  
  end;  
end;

procedure TListaClasseCS.LeStream(S: TStream);
var 
  R : TCPReader;
  Obj : TClasseCS;
begin
  Lock;
  try
    Limpa;
    R := TCPReader.Create(S, 8192);
    try
      R.ReadListBegin;
      while (not R.EndOfList) and (R.Position<(S.Size-1)) do begin
        Obj := FCriaClasse(FTipoClasse);
        Obj.LeReader(R, S);
        FItens.Add(Obj);
      end;
      R.ReadListEnd;
    finally
      R.Free;
    end;  
  finally
    Unlock;
  end;    
end;

procedure TListaClasseCS.SalvaDataset(Tab: TDataset);
var I : Integer;
begin
  Lock;
  try
    for I := 0 to pred(Count) do begin
      Tab.Append;
      Itens[I].SalvaDataset(Tab);
      Tab.Post;
    end;   
  finally
    Unlock;
  end;    
end;

procedure TListaClasseCS.SalvaStream(S: TStream);
var 
  W : TCPWriter;
  I : Integer;
  P : String;
begin
  P := '0';
  try
    W := TCPWriter.Create(S, 8192);
    P := '1';
    Lock;
    P := '2';
    try
      P := '3';
      W.WriteListBegin;
      try
        P := '4';
        for I := 0 to pred(Count) do begin
          P := '4-'+IntToStr(I);
          Itens[I].SalvaWriter(W, False);
        end;
        P := '5';
      finally
        W.WriteListEnd;
      end;
      P := '6';
    finally
      Unlock;
      W.Free;
    end;
  except
    on E: Exception do  begin
      DebugMsgEsp('TListaClasseCS.SalvaStream - P: '+P+' - Exception: '+ E.Message, False, True);
      Raise;
    end;
  end;
end;

procedure TListaClasseCS.Add(Obj: TClasseCS);
begin
  Lock;
  try
    if FItens.IndexOf(Obj) = -1 then
      FItens.Add(Obj);
  finally
    Unlock;
  end;
end;

function TListaClasseCS.Remove(Obj: TClasseCS): Integer;
begin
  Lock;
  try
    Result := FItens.Remove(Obj);
  finally
    Unlock;
  end;    
end;

procedure TListaClasseCS.Lock;
begin
//  FSyncObj.Enter;
end;

procedure TListaClasseCS.Unlock;
begin
//  FSyncObj.Leave;
end;

procedure TListaClasseCS.AtualizaCache;
var 
  I : Integer;
begin
  Lock;
  try
    for I := 0 to pred(Count) do Itens[I].AtualizaCache;
  finally
    Unlock;
  end;  
end;

end.
