unit nrAutorizacao; 

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, nxDB, uLicEXECryptor;

type  
  TAutorizacao = class
    auID         : Integer;
    auTipo       : Byte;
    auMaquinas   : Integer;
    auVencimento : TDateTime;
    auInativar   : Boolean;

    procedure Load(T: TnxTable);
    procedure AssignFrom(B: TAutorizacao);
    function Alterou(B: TAutorizacao): Boolean;
  end;
  
  TCabAutorizacao = class
    caLoja     : Integer;
    caPrograma : Integer;
    caCodEquip : String;
    caSerieHD : String;
    caMaquinas : Integer;
    caManut    : TDateTime;

    caItens    : TList;

    constructor Create;
    destructor Destroy; override;

    function Count: Integer;
    function CountAtiva: Integer;
    function NewItem: TAutorizacao;
    function Alterou(B: TCabAutorizacao): Boolean;
    function AlterouCab(B: TCabAutorizacao): Boolean;
    procedure Limpa;
    
    function ItemByID(aID: Integer): TAutorizacao;
    function Item(aIndex: Integer): TAutorizacao;
    procedure AssignFrom(B: TCabAutorizacao);
    procedure Load(aCodLoja: Integer; tCli, tAut: TnxTable);
    procedure Save(UsuarioAtual: String; B: TCabAutorizacao; tCli, tAut: TnxTable);
  end;

  function AutorizacaoParaLicenca(const Aut: Integer): Integer;

const
  taTemporaria = 0;
  taDefinitiva = 2;
  taTesteGratuito = 3;
  taLocacao = 4;
  taFreePremium = 5;
  

implementation

uses uLicenca;

function AutorizacaoParaLicenca(const Aut: Integer): Integer;
begin
  case Aut of
    taTemporaria : Result := tlTemporaria;
    taDefinitiva : Result := tlDefinitiva;
    taTesteGratuito : Result := tlTeste;
    taLocacao : Result := tlTemporaria;
    taFreePremium : Result := tlFreePremium;
  else
    Result := 0;  
  end;
end;


function TCabAutorizacao.Alterou(B: TCabAutorizacao): Boolean;
var I: Integer;
begin
  Result := True;
  if AlterouCab(B) then Exit;
  if Count <> B.Count then Exit;
  
  for I := 0 to Count-1 do 
    if Item(I).Alterou(B.Item(I)) then Exit;
  Result := False;
end;

function TCabAutorizacao.AlterouCab(B: TCabAutorizacao): Boolean;
begin
  Result := True;
  if caLoja <> B.caLoja then Exit;
  if caPrograma <> B.caPrograma then Exit;
  if caCodEquip <> B.caCodEquip then Exit;
  if caSerieHD <> B.caSerieHD then Exit;
  if caMaquinas <> B.caMaquinas then Exit;
  if caManut <> B.caManut then Exit;
  Result := False;
end;

procedure TCabAutorizacao.AssignFrom(B: TCabAutorizacao);
var I: Integer;
begin
  Limpa;
  caLoja := B.caLoja;
  caPrograma := B.caPrograma;
  caCodEquip := B.caCodEquip;
  caSerieHD := B.caSerieHD;
  caMaquinas := B.caMaquinas;
  caManut := B.caManut;
  for I := 0 to B.Count-1 do 
    NewItem.AssignFrom(B.Item(I));
end;

function TCabAutorizacao.Count: Integer;
begin
  Result := caItens.Count;
end;

function TCabAutorizacao.CountAtiva: Integer;
var I : Integer;
begin
  Result := 0;
  for I := 0 to Count-1 do
    if not Item(I).auInativar then
      Inc(Result);
end;

constructor TCabAutorizacao.Create;
begin
  caItens := TList.Create;
end;

destructor TCabAutorizacao.Destroy;
begin
  Limpa;
  caItens.Free;
  inherited;
end;

function TCabAutorizacao.Item(aIndex: Integer): TAutorizacao;
begin
  Result := TAutorizacao(caItens.Items[aIndex]);
end;

function TCabAutorizacao.ItemByID(aID: Integer): TAutorizacao;
var I : Integer;
begin
  for I := 0 to Count - 1 do
    if Item(I).auID=aID then begin
      Result := Item(I);
      Exit;
    end;
  Result := nil;   
end;

procedure TCabAutorizacao.Limpa;
begin
  while Count>0 do begin
    Item(0).Free;
    caItens.Delete(0);
  end;
end;

procedure TCabAutorizacao.Load(aCodLoja: Integer; tCli, tAut: TnxTable);
begin
  Limpa;
  tCli.IndexName := 'ICodigo';
  if (tCli.FieldByName('Codigo').AsInteger<>aCodloja) and (not tCli.FindKey([aCodLoja])) then
    Raise Exception.Create('Loja não encontrada');
  
  caLoja     := tCli.FieldByName('Codigo').AsInteger;
  caPrograma := tCli.FieldByName('Programa').AsInteger;
  caSerieHD := tCli.FieldByName('SerieHD').AsString;
  caCodEquip := tCli.FieldByName('CodEquip').AsString;
  caMaquinas := tCli.FieldByName('LicMaq').AsInteger;
  caManut    := tCli.FieldByName('ManVenc').AsDateTime;

  tAut.IndexName := 'ILoja';
  tAut.SetRange([aCodLoja, True], [aCodLoja, True]);
  try
    while not tAut.Eof do begin
      NewItem.Load(tAut);
      tAut.Next;
    end;
  finally
    tAut.CancelRange;
  end;
end;

function TCabAutorizacao.NewItem: TAutorizacao;
begin
  Result := TAutorizacao.Create;
  Result.auID := 0;
  caItens.Add(Result);
end;

procedure TCabAutorizacao.Save(UsuarioAtual: String; B: TCabAutorizacao; tCli, tAut: TnxTable);
var 
  I, T : Integer;
  IB : TAutorizacao;
  ACab, Inativar, AlterouItem : Boolean;
  L : TLicenca;
begin
  if not Alterou(B) then Exit;

  if (caPrograma=0) and (CountAtiva>1) then
    raise exception.Create('O Cyber Manager permite apenas uma única autorização');
  
  T := 0;
  for I := 0 to Count-1 do with Item(I) do
    if (not auInativar) and (auTipo = taDefinitiva) then Inc(T);

  if T>1 then
    raise exception.Create('Não é permitido mais de uma autorização Definitiva');
    
  T := 0;
  for I := 0 to Count-1 do with Item(I) do
    if (not auInativar) then T := T + auMaquinas;

  if T<>caMaquinas then
    raise exception.Create('Quantidade de máquinas difere de quantidade de autorizações');
    
  tCli.Database.StartTransactionWith([tCli, tAut]);
  try
    tAut.CancelRange;
    tAut.IndexName := 'IID';
    ACab := AlterouCab(B);

    
    tCli.Edit;
    tCli.FieldByName('Programa').AsInteger := caPrograma;
    tCli.FieldByName('SerieHD').AsString := caSerieHD;
    tCli.FieldByName('CodEquip').AsString := caCodEquip;
    tCli.FieldByName('LicMaq').AsInteger := caMaquinas;
    tCli.FieldByName('ManVenc').AsDateTime := caManut;
    tCli.Post;

    for I := 0 to Count-1 do with Item(I) do begin
      AlterouItem := False;
      if auInativar then
        Inativar := True
      else
      if auID>0 then begin
        IB := B.ItemByID(auID);
        if ((IB=nil) or ACab or Alterou(IB)) then begin
          AlterouItem := True;
          Inativar := True;
        end;
      end;

      if Inativar and tAut.FindKey([auID]) then begin
        tAut.Edit;
        tAut.FieldByName('Ativa').AsBoolean := False;
        tAut.FieldByName('InativadaEm').AsDateTime := Now;
        tAut.FieldByName('InativadaPor').AsString := UsuarioAtual;
        tAut.Post;
      end;

      if (auID=0) or AlterouItem then begin
        tAut.Insert;
        tAut.FieldByName('Programa').AsInteger := caPrograma;
        tAut.FieldByName('Loja').AsInteger := caLoja;
        tAut.FieldByName('CriadaEm').AsDateTime := Now;
        tAut.FieldByName('CriadaPor').AsString := UsuarioAtual;
        tAut.FieldByName('Gerar').AsBoolean := (caPrograma<>0);
        tAut.FieldByName('Ativa').AsBoolean := True;
        tAut.FieldByName('EnviouCli').AsBoolean := False;
        tAut.FieldByName('Tipo').AsInteger := auTipo;
        tAut.FieldByName('Maquinas').AsInteger := auMaquinas;
        
        if auTipo=taDefinitiva then
          tAut.FieldByName('Vencimento').AsDateTime := caManut else
          tAut.FieldByName('Vencimento').AsDateTime := auVencimento;
        
        if caPrograma=0 then begin
          case auTipo of
            taTemporaria, taLocacao : L.liTipo := tlTemporaria;
            taDefinitiva : L.liTipo := tlDefinitiva;
            taTesteGratuito : L.liTipo := tlTeste;
            taFreePremium : L.liTipo := tlFreePremium;
          end;
          L.liMaquinas := auMaquinas;
          L.liVencimento := auVencimento;
          L.liSerialHD := caSerieHD;
          L.liCodLoja := caLoja;
          L.AtualizaSenha;
          tAut.FieldByName('CodigoEquip').AsString := caSerieHD;
          tAut.FieldByName('Autorizacao').AsString := L.AsStringSemHD;
        end else
          tAut.FieldByName('CodigoEquip').AsString := caCodEquip;
          
        if tAut.FieldByName('Vencimento').AsDateTime=0 then
          tAut.FieldByName('Vencimento').Clear;  
        tAut.Post;
        auID := tAut.FieldByName('ID').AsInteger;
      end;
    end;
      
    tCli.Database.Commit;
  except
    tCli.Database.Rollback;
    if tCli.State=dsEdit then tCli.Cancel;
    if tAut.State in [dsEdit, dsInsert] then tAut.Cancel;
    raise;
  end;
end;

{ TAutorizacao }

function TAutorizacao.Alterou(B: TAutorizacao): Boolean;
begin
  Result := True;
  if B.auID <> auID then Exit;
  if B.auTipo <> auTipo then Exit;
  if B.auMaquinas <> auMaquinas then Exit;
  if B.auVencimento <> auVencimento then Exit;
  if auInativar or B.auInativar then Exit;
   
  Result := False;
end;

procedure TAutorizacao.AssignFrom(B: TAutorizacao);
begin
  auID := B.auID;
  auTipo := B.auTipo;
  auMaquinas := B.auMaquinas;
  auVencimento := B.auVencimento;
  auInativar := B.auInativar;
end;

procedure TAutorizacao.Load(T: TnxTable);
begin
  auInativar := False;
  auID := T.FieldByName('ID').AsInteger;
  auTipo := T.FieldByName('Tipo').AsInteger;
  auMaquinas := T.FieldByName('Maquinas').AsInteger;
  auVencimento := T.FieldByName('Vencimento').AsDateTime;
end;


end.
