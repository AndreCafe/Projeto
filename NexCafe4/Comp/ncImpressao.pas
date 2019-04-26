unit ncImpressao;

interface

uses
  SysUtils,
  DB,
  MD5,
  Classes,
  Windows,
  ClasseCS,
  ncClassesBase;

type

  TncImpressao = class
  private
    function GetString: String;
    procedure SetString(const Value: String);
  public
    impID : Integer;
    impTran : Integer;
    impCaixa : Integer;
    impManual : Boolean;
    impDataHora : TDateTime;
    impComputador : String;
    impMaquina : Word;
    impPaginas : Word;
    impImpressora : String;
    impDocumento : String;
    impSessao : Integer;
    impResultado : Byte;
    impQuant : Array[1..10] of Word;
    impValor : Array[1..10] of Currency;
    impDesconto : Currency;
    impPago : Currency;
    impCancelado : Boolean;
    impFunc : String;
    impCliente : Integer;
    _Recibo : Boolean;
    _Operacao : Byte;

    constructor Create;
    procedure Limpa;

    procedure AssignFrom(Imp: TncImpressao);

    function Igual(Imp: TncImpressao): Boolean;

    function Debito: Currency;
    function Total: Currency;
    function TotQuant: Integer;

    function ValorPorTipo(aTipo: Integer): Currency;

    function QuantPorTipo(aTipo: Integer): Integer;

    function TotalPorTipo(aTipo: Integer): Currency;

    procedure SaveToDataset(D: TDataset);
    procedure SaveToITranDataset(D: TDataset);
    procedure SaveToTranDataset(D: TDataset);
    procedure SaveToStream(S: TStream);
    
    procedure LoadFromDataset(D: TDataset);       
    procedure LoadFromStream(S: TStream);
    
    property AsString: String
      read GetString write SetString;
  end;  

  TncImpressoes = class
  private
    FItens : TList;
    function GetItem(I: Integer): TncImpressao;
    function GetString: String;
    procedure SetString(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;

    procedure AjustaOperacao(B: TncImpressoes);
    procedure Remove(Imp: TncImpressao);
    
    procedure Limpa;

    function Count: Integer;

    function NewItem: TncImpressao;

    function GetItemByID(aID: Integer): TncImpressao;
    function GetItemByTran(aTran: Integer): TncImpressao;
    
    property Itens[I: Integer]: TncImpressao
      read GetItem; Default;

    property AsString: String
      read GetString write SetString;  
  
  end;
  
implementation

{ TncImpressao }

procedure TncImpressao.AssignFrom(Imp: TncImpressao);
begin
  impID := Imp.impID;
  impTran := Imp.impTran;
  impCaixa := Imp.impCaixa;
  impManual := Imp.impManual;
  impDataHora := Imp.impDataHora;
  impComputador := Imp.impComputador;
  impMaquina := Imp.impMaquina;
  impPaginas := Imp.impPaginas;
  impImpressora := Imp.impImpressora;
  impDocumento := Imp.impDocumento;
  impSessao := Imp.impSessao;
  impResultado := Imp.impResultado;
  Move(Imp.impQuant, impQuant, SizeOf(impQuant));
  Move(Imp.impValor, impValor, SizeOf(impValor));
  impDesconto := Imp.impDesconto;
  impPago := Imp.impPago;
  impCancelado := Imp.impCancelado;
  impFunc := Imp.impFunc;
  impCliente := Imp.impCliente;
  _Recibo := Imp._Recibo;
  _Operacao := Imp._Operacao;
end;

constructor TncImpressao.Create;
begin
  Limpa;
end;

function TncImpressao.Debito: Currency;
begin
  if impCancelado or (impSessao<>0) then
    Result := 0 else
    Result := Total - impDesconto - impPago;
end;

function TncImpressao.GetString: String;
var I : Integer;
begin
  Result :=
    IntToStr(impID) + sFldDelim +
    IntToStr(impTran) + sFldDelim +
    IntToStr(impCaixa) + sFldDelim +
    BoolStr[impManual] + sFldDelim +
    GetDTStr(impDataHora) + sFldDelim +
    impComputador + sFldDelim +
    IntToStr(impMaquina) + sFldDelim +
    IntToStr(impPaginas)+ sFldDelim +
    impImpressora + sFldDelim +
    impDocumento + sFldDelim +
    IntToStr(impSessao) + sFldDelim +
    IntToStr(impResultado) + sFldDelim;

  for I := 1 to 10 do begin 
    Result := Result + IntToStr(impQuant[I]) + sFldDelim;
    Result := Result + FloatParaStr(impValor[I]) + sFldDelim;
  end;

  Result := Result +
    FloatParaStr(impDesconto) + sFldDelim +
    FloatParaStr(impPago) + sFldDelim +
    BoolStr[impCancelado] + sFldDelim +
    impFunc + sFldDelim +
    IntToStr(impCliente) + sFldDelim +
    BoolStr[_Recibo] + sFldDelim +
    IntToStr(_Operacao) + sFldDelim;
    
end;

function TncImpressao.Igual(Imp: TncImpressao): Boolean;
var I : Integer;
begin
  Result := False;
  if impID <> Imp.impID then Exit;
  if impTran <> Imp.impTran then Exit;
  if impCaixa <> Imp.impCaixa then Exit;
  if impManual <> Imp.impManual then Exit;
  if impDataHora <> Imp.impDataHora then Exit;
  if impComputador <> Imp.impComputador then Exit;
  if impMaquina <> Imp.impMaquina then Exit;
  if impPaginas <> Imp.impPaginas then Exit;
  if impImpressora <> Imp.impImpressora then Exit;
  if impDocumento <> Imp.impDocumento then Exit;
  if impSessao <> Imp.impSessao then Exit;
  if impResultado <> Imp.impResultado then Exit;

  for I  := 1 to 10 do begin
    if impQuant[I] <> Imp.impQuant[I] then Exit;
    if impValor[I] <> Imp.impValor[I] then Exit;
  end;
  
  if impDesconto <> Imp.impDesconto then Exit;
  if impPago <> Imp.impPago then Exit;
  if impCancelado <> Imp.impCancelado then Exit;
  if impCliente <> Imp.impCliente then Exit;
  if impFunc <> Imp.impFunc then Exit;
  
  Result := True;
end;

procedure TncImpressao.Limpa;
begin
  impID := -1;
  impTran := 0;
  impCaixa := 0;
  impManual := False;
  impDataHora := 0;
  impComputador := '';
  impMaquina := 0;
  impPaginas := 0;
  impImpressora := '';
  impDocumento := '';
  impSessao := 0;
  impResultado := 0;
  FillChar(impQuant, SizeOf(impQuant), 0);
  FillChar(impValor, SizeOf(impValor), 0);
  impDesconto := 0;
  impPago := 0;
  impFunc := '';
  impCancelado := False;
  impCliente := 0;
  _Recibo := False;
  _Operacao := osNenhuma;
end;

procedure TncImpressao.LoadFromDataset(D: TDataset);
var I: Integer;
begin
  impID := D.FieldByName('ID').AsInteger;
  impTran := D.FieldByName('Tran').AsInteger;
  impCaixa := D.FieldByName('Caixa').AsInteger;
  impManual := D.FieldByName('Manual').AsBoolean;
  impDataHora := D.FieldByName('DataHora').AsDateTime;
  impComputador := D.FieldByName('Computador').AsString;
  impMaquina := D.FieldByName('Maquina').AsInteger;
  impPaginas := D.FieldByName('Paginas').AsInteger;
  impImpressora := D.FieldByName('Impressora').AsString;
  impDocumento := D.FieldByName('Documento').AsString;
  impSessao := D.FieldByName('Sessao').AsInteger;
  impResultado := D.FieldByName('Resultado').AsInteger;
  for I := 1 to 10 do begin
    impQuant[I] := D.FieldByName('q'+IntToStr(I)).AsInteger;
    impValor[I] := D.FieldByName('v'+IntToStr(I)).AsCurrency;
  end;
  impDesconto := D.FieldByName('Desconto').AsCurrency;
  impPago := D.FieldByName('Pago').AsCurrency;
  impCliente := D.FieldByName('Cliente').AsInteger;
  impFunc := D.FieldByName('Func').AsString;
  impCancelado := D.FieldByName('Cancelado').AsBoolean;
  _Operacao := osNenhuma;
end;

procedure TncImpressao.LoadFromStream(S: TStream);
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

function TncImpressao.QuantPorTipo(aTipo: Integer): Integer;
begin
  if aTipo in [1..10] then
    Result := impQuant[aTipo] else
    Result := 0;
end;

procedure TncImpressao.SaveToDataset(D: TDataset);
var I: Integer;
begin
  D.FieldByName('Tran').AsInteger := impTran;
  D.FieldByName('Caixa').AsInteger := impCaixa;
  D.FieldByName('Manual').AsBoolean := impManual;
  D.FieldByName('DataHora').AsDateTime := impDataHora;
  D.FieldByName('Computador').AsString := impComputador;
  D.FieldByName('Maquina').AsInteger := impMaquina;
  D.FieldByName('Paginas').AsInteger := impPaginas;
  D.FieldByName('Impressora').AsString := impImpressora;
  D.FieldByName('Documento').AsString := impDocumento;
  D.FieldByName('Sessao').AsInteger := impSessao;
  D.FieldByName('Resultado').AsInteger := impResultado;
  for I := 1 to 10 do begin
    D.FieldByName('q'+IntToStr(I)).AsInteger := impQuant[I];
    D.FieldByName('v'+IntToStr(I)).AsCurrency := impValor[I];
  end;
  D.FieldByname('Total').AsCurrency := Total;
  D.FieldByName('Desconto').AsCurrency := impDesconto;
  D.FieldByName('Pago').AsCurrency := impPago;
  D.FieldByName('Cancelado').AsBoolean := impCancelado;
  D.FieldByName('Cliente').AsInteger := impCliente;
  D.FieldByName('Func').AsString := impFunc;
end;

procedure TncImpressao.SaveToITranDataset(D: TDataset);
begin
  D.FieldByName('Tran').AsInteger := impTran;
  D.FieldByName('Caixa').AsInteger := impCaixa;
  D.FieldByName('DataHora').AsDateTime := impDataHora;
  D.FieldByName('Caixa').AsInteger := impCaixa;
  D.FieldByName('TipoItem').AsInteger := itImpressao;
  D.FieldByName('TipoTran').AsInteger := trImpressao;
  D.FieldByName('ItemID').AsInteger := impID;
  D.FieldByname('ItemPos').AsInteger := 1;
  D.FieldByName('Total').AsCurrency := Total;
  D.FieldByName('Desconto').AsCurrency := impDesconto;
  D.FieldByName('Pago').AsCurrency := impPago;
  D.FieldByName('Cancelado').AsBoolean := impCancelado;
  D.FieldByName('Sessao').AsInteger := impSessao;
end;

procedure TncImpressao.SaveToStream(S: TStream);
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

procedure TncImpressao.SaveToTranDataset(D: TDataset);
begin
  D.FieldByName('Caixa').AsInteger := impCaixa;
  D.FieldByName('DataHora').AsDateTime := impDataHora;
  D.FieldByName('Total').AsCurrency := Total;
  D.FieldByName('Desconto').AsCurrency := impDesconto;
  D.FieldByName('Pago').AsCurrency := impPago;
  D.FieldByName('Cancelado').AsBoolean := impCancelado;
  D.FieldByName('Cliente').AsInteger := impCliente;
  D.FieldByName('Func').AsString := impFunc;
  D.FieldByName('Tipo').AsInteger := trImpressao;
  D.FieldByName('Descr').AsString := IntToStr(TotQuant) + ' página(s)';
  D.FieldByName('Sessao').AsInteger := impSessao;
  D.FieldByName('Maq').AsInteger := impMaquina;
end;

procedure TncImpressao.SetString(const Value: String);
var 
  S: String;
  I: Integer;

function pCampo: String;
begin
  Result := GetNextStrDelim(S);
end;

begin
  S := Value;
  impID := StrToIntDef(pCampo, -1);
  impTran := StrToIntDef(pCampo, 0);
  impCaixa := StrToIntDef(pCampo, 0);
  impManual := (BoolStr[True]=pCampo);
  impDataHora := DTFromStr(pCampo);
  impComputador := pCampo;
  impMaquina := StrToIntDef(pCampo, 0);
  impPaginas := StrToIntDef(pCampo, 0);
  impImpressora := pCampo;
  impDocumento := pCampo;
  impSessao := StrToIntDef(pCampo, 0);
  impResultado := StrToIntDef(pCampo, 0);
  for I := 1 to 10 do begin
    impQuant[I] := StrToIntDef(pCampo, 0);
    impValor[I] := StrParaFloat(pCampo);
  end;
  impDesconto := StrParaFloat(pCampo);
  impPago := StrParaFloat(pCampo);
  impCancelado := (BoolStr[True]=pCampo);
  impFunc := pCampo;
  impCliente := StrToIntDef(pCampo, 0);
  _Recibo := (BoolStr[True] = pCampo);
  _Operacao := StrToIntDef(pCampo, osNenhuma);
end;

function TncImpressao.Total: Currency;
var I : Integer;
begin
  Result := 0;
  for I := 1 to 10 do 
    Result := Result + (impValor[I] * impQuant[I]);
end;

function TncImpressao.TotalPorTipo(aTipo: Integer): Currency;
begin
  if aTipo in [1..10] then
    Result := impValor[aTipo] * impQuant[aTipo] else
    Result := 0;
end;

function TncImpressao.TotQuant: Integer;
var i : Integer;
begin
  Result := 0;
  for i := 1 to 10 do
    Result := Result + impQuant[i];
end;

function TncImpressao.ValorPorTipo(aTipo: Integer): Currency;
begin

end;

{ TncImpressoes }

procedure TncImpressoes.AjustaOperacao(B: TncImpressoes);
var 
  I : Integer;
  Imp : TncImpressao;
begin
  for I := 0 to Count - 1 do with Itens[I] do 
  if (impID<>-1) and (B.GetItemByID(impID)=nil) then
    _Operacao := osExcluir;

  for I := 0 to B.Count - 1 do
    if (B[I].impID=-1) then begin
      if B[I]._Operacao<>osCancelar then begin
        B[I]._Operacao := osIncluir;
        NewItem.AssignFrom(B[I]);
      end;
    end
    else begin
      Imp := GetItemByID(B[I].impID);
      if Imp<>nil then begin
        if B[I]._Operacao=osCancelar then
          Imp._Operacao := osCancelar
        else
        if Imp.impCancelado or B[I].impCancelado then
          Imp._Operacao := osNenhuma 
        else begin  
          Imp.AssignFrom(B[I]);
          Imp._Operacao := osAlterar;
        end;
      end;
    end;

  for I := Count-1 downto 0 do
  if Itens[I]._Operacao=osNenhuma then begin
    Itens[I].Free;
    FItens.Delete(I);
  end;  
end;

function TncImpressoes.Count: Integer;
begin
  Result := FItens.Count;
end;

constructor TncImpressoes.Create;
begin
   FItens := TList.Create;
end;

destructor TncImpressoes.Destroy;
begin
  Limpa;
  FItens.Free;
  inherited;
end;

function TncImpressoes.GetItem(I: Integer): TncImpressao;
begin
  Result := TncImpressao(FItens[I]);
end;

function TncImpressoes.GetItemByID(aID: Integer): TncImpressao;
var i : Integer;
begin
  for i := 0 to Count - 1 do
  if Itens[i].impID=aID then begin
    Result := Itens[i];
    Exit;
  end;
  Result := nil;
end;

function TncImpressoes.GetItemByTran(aTran: Integer): TncImpressao;
var i : Integer;
begin
  for i := 0 to Count - 1 do
  if Itens[i].impTran=aTran then begin
    Result := Itens[i];
    Exit;
  end;
  Result := nil;
end;

function TncImpressoes.GetString: String;
var i: Integer;
begin
  Result := '';
  for i := 0 to Count - 1 do begin
    if i>0 then Result := Result + sLineBreak;
    Result := Result + Itens[i].AsString;
  end;
end;

procedure TncImpressoes.Limpa;
begin
  while Count>0 do begin
    Itens[0].Free;
    FItens.Delete(0);
  end;
end;

function TncImpressoes.NewItem: TncImpressao;
begin
  Result := TncImpressao.Create;
  FItens.Add(Result);
end;

procedure TncImpressoes.Remove(Imp: TncImpressao);
begin
  FItens.Remove(Imp);
end;

procedure TncImpressoes.SetString(const Value: String);
var 
  SL : TStrings;
  i: Integer;
begin
  Limpa;
  SL := TStringList.Create;
  try
    SL.Text := Value;
    for i := 0 to SL.Count - 1 do
      NewItem.AsString := SL[i];
  finally
    SL.Free;
  end;
end;

end.
