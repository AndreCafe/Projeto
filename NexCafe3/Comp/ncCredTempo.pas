unit ncCredTempo;

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

  TncCredTempo = class
  private
    function GetString: String;
    procedure SetString(const Value: String);
  public
    teID        : Integer;
    teDataHora  : TDateTime;
    teFunc      : String;
    teTipo      : Byte;
    teMinutos   : Double;
    teIDPacPass : Integer;
    teTotal     : Currency;
    teDesconto  : Currency;
    tePago      : Currency;
    teCliente   : Integer;
    teMaq       : Word;
    teSessao    : Integer;
    tePassaporte: Integer;
    teCancelado : Boolean;
    teTran      : Integer;
    teCaixa     : Integer;
    teSenha     : String;
    teNome      : String;
    teTipoAcesso: Integer;
    teObs       : String;
    teCredValor  : Boolean;
    teFidResgate : Boolean;
    teFidPontos  : Double;
    _Recibo      : Boolean;
    _Operacao    : Byte;

    constructor Create;
    procedure Limpa;

    procedure AssignFrom(T: TncCredTempo);

    function Igual(T: TncCredTempo): Boolean;

    function MudouTempo(B: TncCredTempo): Boolean;

    function Debito: Currency;

    procedure SaveToDataset(D: TDataset);
    procedure SaveToITranDataset(D: TDataset);
    procedure SaveToTran(D: TDataset);

    procedure SaveToStream(S: TStream);
    
    procedure LoadFromDataset(D: TDataset);       
    procedure LoadFromStream(S: TStream);
    
    property AsString: String
      read GetString write SetString;
  end;

  TncCredTempos = class
  private
    FItens : TList;
    function GetItem(I: Integer): TncCredTempo;
    function GetString: String;
    procedure SetString(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;

    procedure AjustaOperacao(B: TncCredTempos);
    procedure Remove(CT: TncCredTempo);
    
    procedure Limpa;

    function Count: Integer;

    function NewItem: TncCredTempo;
    function TotCredTempoValido: TncTempo;

    function GetItemByID(aID: Integer): TncCredTempo;
    function GetItemByTran(aTran: Integer): TncCredTempo;
    
    property Itens[I: Integer]: TncCredTempo 
      read GetItem; Default;

    property AsString: String
      read GetString write SetString;  
  
  end;
    

implementation


{ TncCredTempo }

procedure TncCredTempo.AssignFrom(T: TncCredTempo);
begin
  teID := T.teID;
  teDataHora := T.teDataHora;
  teFunc := T.teFunc;
  teTipo := T.teTipo;
  teMinutos := T.teMinutos;
  teIDPacPass := T.teIDPacPass;
  teTotal := T.teTotal;
  teDesconto := T.teDesconto;
  tePago := T.tePago;
  teCliente := T.teCliente;
  teMaq := T.teMaq;
  teSessao := T.teSessao;
  tePassaporte := T.tePassaporte;
  teCancelado := T.teCancelado;
  teTran := T.teTran ;
  teCaixa := T.teCaixa;
  teSenha := T.teSenha;
  teNome := T.teNome;
  teTipoAcesso := T.teTipoAcesso;
  teObs := T.teObs;
  teCredValor := T.teCredValor;
  teFidResgate := T.teFidResgate;
  teFidPontos := T.teFidPontos;
  _Recibo := T._Recibo;
  _Operacao := T._Operacao;
end;

constructor TncCredTempo.Create;
begin
  Limpa;
end;                                   

function TncCredTempo.Debito: Currency;
begin
  if (not teCancelado) and (teSessao=0) then
    Result := teTotal - teDesconto - tePago else
    Result := 0;
end;

function TncCredTempo.GetString: String;
begin
  Result := 
    IntToStr(teID) + sFldDelim +
    GetDTStr(teDataHora) + sFldDelim +
    teFunc + sFldDelim +
    IntToStr(teTipo) + sFldDelim + 
    FloatParaStr(teMinutos) + sFldDelim +
    IntToStr(teIDPacPass) + sFldDelim +
    FloatParaStr(teTotal) + sFldDelim +
    FloatParaStr(teDesconto) + sFldDelim +
    FloatParaStr(tePago) + sFldDelim +
    IntToStr(teCliente) + sFldDelim +
    IntToStr(teMaq) + sFldDelim +
    IntToStr(teSessao) + sFldDelim +
    IntToStr(tePassaporte) + sFldDelim + 
    BoolStr[teCancelado] + sFldDelim +
    IntToStr(teTran) + sFldDelim +
    IntToStr(teCaixa) + sFldDelim + 
    teSenha + sFldDelim + 
    teNome + sFldDelim + 
    IntToStr(teTipoAcesso) + sFldDelim +
    teObs + sFldDelim +
    BoolStr[teCredValor] + sFldDelim +
    BoolStr[teFidResgate] + sFldDelim +
    FloatParaStr(teFidPontos) + sFldDelim +
    BoolStr[_Recibo] + sFldDelim +
    IntToStr(_Operacao) + sFldDelim;
end;

function TncCredTempo.Igual(T: TncCredTempo): Boolean;
begin
  Result := False;
  if teID <> T.teID then Exit;
  if teDataHora <> T.teDataHora then Exit;
  if teFunc <> T.teFunc then Exit;
  if teTipo <> T.teTipo then Exit;
  if teMinutos <> T.teMinutos then Exit;
  if teIDPacPass <> T.teIDPacPass then Exit;
  if teTotal <> T.teTotal then Exit;
  if teDesconto <> T.teDesconto then Exit;
  if tePago <> T.tePago then Exit;
  if teCliente <> T.teCliente then Exit;
  if teMaq <> T.teMaq then Exit;
  if teSessao <> T.teSessao then Exit;
  if tePassaporte <> T.tePassaporte then Exit;
  if teCancelado <> T.teCancelado then Exit;
  if teTran <> T.teTran  then Exit;
  if teCaixa <> T.teCaixa then Exit;
  if teSenha <> T.teSenha then Exit;
  if teNome <> T.teNome then Exit;
  if teTipoAcesso <> T.teTipoAcesso then Exit;
  if teObs <> T.teObs then Exit;
  if teCredValor <> T.teCredValor then Exit;
  if teFidResgate <> T.teFidResgate then Exit;
  if teFidPontos <> T.teFidPontos then Exit;

  if _Operacao <> T._Operacao then Exit;
  Result := True;
end;

procedure TncCredTempo.Limpa;
begin
  teID        := -1;
  teDataHora  := 0;
  teFunc      := '';
  teTipo      := tctPrevisao;
  teMinutos   := 0;
  teIDPacPass := 0;
  teTotal     := 0;
  teDesconto  := 0;
  tePago      := 0;
  teCliente   := 0;
  teMaq       := 0;
  teSessao    := 0;
  tePassaporte := 0;
  teCancelado := False;
  teTran      := -1;
  teCaixa     := 0;
  teSenha     := '';
  teNome      := '';
  teTipoAcesso := -1;
  teObs := '';
  teCredValor := False;
  teFidResgate := False;
  teFidPontos := 0;
  
  _Operacao   := osNenhuma;
  _Recibo     := False;
end;

procedure TncCredTempo.LoadFromDataset(D: TDataset);
begin
  teID := D.FieldByName('ID').AsInteger;
  teDataHora := D.FieldByName('DataHora').AsDateTime;
  teFunc := D.FieldByName('Func').AsString;
  teTipo := D.FieldByName('Tipo').AsInteger;
  teMinutos := D.FieldByName('Minutos').AsFloat;
  teIDPacPass := D.FieldByName('IDPacPass').AsInteger;
  teTotal := D.FieldByName('Total').AsCurrency;
  teDesconto := D.FieldByName('Desconto').AsCurrency;
  tePago := D.FieldByName('Pago').AsCurrency;
  teCliente := D.FieldByName('Cliente').AsInteger;
  teMaq := D.FieldByName('Maq').AsInteger;
  teSessao := D.FieldByName('Sessao').AsInteger;
  tePassaporte := D.FieldByName('Passaporte').AsInteger;
  teCancelado := D.FieldByName('Cancelado').AsBoolean;
  teTran := D.FieldByName('Tran').AsInteger;
  teCaixa := D.FieldByName('Caixa').AsInteger;
  teSenha := D.FieldByName('Senha').AsString;
  teNome := D.FieldByName('Nome').AsString;
  teTipoAcesso := D.FieldByName('TipoAcesso').AsInteger;
  teObs := D.FieldByName('Obs').AsString;
  teCredValor := D.FieldByName('CredValor').AsBoolean;
  teFidResgate := D.FieldByName('FidResgate').AsBoolean;
  teFidPontos := D.FieldByName('FidPontos').AsFloat;
  _Recibo := False;
  _Operacao := osNenhuma;
end;

procedure TncCredTempo.LoadFromStream(S: TStream);
var
  Str: String;
  I: Integer;
begin
  S.Read(I, SizeOf(I));
  if I>0 then begin
    SetLength(Str, I);
    S.Read(Str[1], I);
    AsString := Str;
  end else
    Limpa;
end;

function TncCredTempo.MudouTempo(B: TncCredTempo): Boolean;
begin
  Result :=
    (B.teTipo <> teTipo) or
    (B.teMinutos <> teMinutos) or
    (B.teCliente <> teCliente) or
    ((B.teTipo = tctPassaporte) or
     (B.teIDPacPass <> teIDPacPass));
end;

procedure TncCredTempo.SaveToDataset(D: TDataset);
begin
  D.FieldByName('DataHora').AsDateTime := teDataHora;
  D.FieldByName('Func').AsString := teFunc;
  D.FieldByName('Tipo').AsInteger := teTipo;
  D.FieldByName('Minutos').AsFloat := teMinutos;
  D.FieldByName('IDPacPass').AsInteger := teIDPacPass;
  D.FieldByName('Total').AsCurrency := teTotal;
  D.FieldByName('Desconto').AsCurrency := teDesconto;
  D.FieldByName('Pago').AsCurrency := tePago;
  D.FieldByName('Cliente').AsInteger := teCliente;
  D.FieldByName('Maq').AsInteger := teMaq;
  D.FieldByName('Sessao').AsInteger := teSessao;
  D.FieldByName('Passaporte').AsInteger := tePassaporte;
  D.FieldByName('Cancelado').AsBoolean := teCancelado;
  D.FieldByName('Tran').AsInteger := teTran;
  D.FieldByName('Caixa').AsInteger := teCaixa;
  D.FieldByName('Senha').AsString := teSenha;
  D.FieldByName('Nome').AsString := teNome;
  D.FieldByName('TipoAcesso').AsInteger := teTipoAcesso;
  D.FieldByname('Obs').AsString := teObs;
  D.FieldByName('CredValor').AsBoolean := teCredValor;
  D.FieldByName('FidResgate').AsBoolean := teFidResgate;
  D.FieldByName('FidPontos').AsFloat := teFidPontos;
end;

procedure TncCredTempo.SaveToITranDataset(D: TDataset);
begin
  D.FieldByName('Tran').AsInteger := teTran;
  D.FieldByName('Caixa').AsInteger := teCaixa;
  D.FieldByName('DataHora').AsDateTime := teDataHora;
  D.FieldByName('Caixa').AsInteger := teCaixa;
  D.FieldByName('TipoItem').AsInteger := itTempo;
  D.FieldByName('TipoTran').AsInteger := trCredTempo;
  D.FieldByName('ItemID').AsInteger := teID;
  D.FieldByname('ItemPos').AsInteger := 1;
  D.FieldByName('Total').AsCurrency := teTotal;
  D.FieldByName('Desconto').AsCurrency := teDesconto;
  D.FieldByName('Pago').AsCurrency := tePago;
  D.FieldByName('Cancelado').AsBoolean := teCancelado;
  D.FieldByName('Sessao').AsInteger := teSessao;
  
  if teFidResgate then begin
    D.FieldByName('FidFator').AsInteger := -1;
    D.FieldByName('FidPontos').AsFloat := teFidPontos;
  end else begin
    D.FieldByName('FidFator').Clear;
    D.FieldByName('FidPontos').Clear;
  end;
end;

procedure TncCredTempo.SaveToStream(S: TStream);
var
  Str: String;
  I: Integer;
begin
  Str := AsString;
  I := Length(Str);
  S.Write(I, SizeOf(I));
  if I>0 then 
    S.Write(Str[1], I);
end;

procedure TncCredTempo.SaveToTran(D: TDataset);
begin
  D.FieldByName('Caixa').AsInteger := teCaixa;
  D.FieldByName('DataHora').AsDateTime := teDataHora;
  D.FieldByName('Caixa').AsInteger := teCaixa;
  D.FieldByName('Total').AsCurrency := teTotal;
  D.FieldByName('Desconto').AsCurrency := teDesconto;
  D.FieldByName('Pago').AsCurrency := tePago;
  D.FieldByName('Cancelado').AsBoolean := teCancelado;
  D.FieldByName('Sessao').AsInteger := teSessao;
  D.FieldByName('Cliente').AsInteger := teCliente;
  D.FieldByName('Func').AsString := teFunc;
  D.FieldByName('Maq').AsInteger  := teMaq;
  D.FieldByName('Tipo').AsInteger := trCredTempo;
  D.FieldByName('Obs').AsString := teObs;
  D.FieldByName('FidResgate').AsBoolean := teFidResgate;
end;

procedure TncCredTempo.SetString(const Value: String);
var S: String;

function pCampo: String;
begin
  Result := GetNextStrDelim(S);
end;

begin
  Limpa;
  S := Value;
  teID := StrToIntDef(pCampo, -1);
  teDataHora := DTFromStr(pCampo);
  teFunc := pCampo;
  teTipo := StrToIntDef(pCampo, 0);
  teMinutos := StrParaFloat(pCampo);
  teIDPacPass := StrToIntDef(pCampo, 0);
  teTotal := StrParaFloat(pCampo);
  teDesconto := StrParaFloat(pCampo);
  tePago := StrParaFloat(pCampo);
  teCliente := StrToIntDef(pCampo, 0);
  teMaq := StrToIntDef(pCampo, 0);
  teSessao := StrToIntDef(pCampo, 0);
  tePassaporte := StrToIntDef(pCampo, 0);
  teCancelado := (BoolStr[True]=pCampo);
  teTran := StrToIntDef(pCampo, -1);
  teCaixa := StrToIntDef(pCampo, 0);
  teSenha := pCampo;
  teNome := pCampo;
  teTipoAcesso := StrToIntDef(pCampo, -1);
  teObs := pCampo;
  teCredValor := (BoolStr[True]=pCampo);
  teFidResgate := (BoolStr[True]=pCampo);
  teFidPontos := StrParaFloat(pCampo);
  _Recibo := (BoolStr[True]=pCampo);
  _Operacao := StrToIntDef(pCampo, osNenhuma);
end;

{ TncCredTempos }

procedure TncCredTempos.AjustaOperacao(B: TncCredTempos);
var 
  I : Integer;
  T : TncCredTempo;
begin
    
  for I := 0 to Count - 1 do with Itens[I] do 
  if (teID<>-1) and (B.GetItemByID(teID)=nil) then
    _Operacao := osExcluir;

  for I := 0 to B.Count - 1 do
    if (B[I].teID=-1) then begin
      if (B[I]._Operacao<>osCancelar) then begin
        B[I]._Operacao := osIncluir;
        NewItem.AssignFrom(B[I]);
      end;
    end
    else begin
      T := GetItemByID(B[I].teID);
      if T<>nil then begin
        if B[I]._Operacao=osCancelar then
          T._Operacao := osCancelar
        else begin  
          T.AssignFrom(B[I]);
          T._Operacao := osAlterar;
        end;
      end;
    end;

  for I := Count-1 downto 0 do
  if Itens[I]._Operacao=osNenhuma then begin
    Itens[I].Free;
    FItens.Delete(I);
  end;  
end;

function TncCredTempos.Count: Integer;
begin
  Result := FItens.Count;
end;

constructor TncCredTempos.Create;
begin
  FItens := TList.Create;
end;

destructor TncCredTempos.Destroy;
begin
  Limpa;
  FItens.Free;
  inherited;
end;

function TncCredTempos.GetItem(I: Integer): TncCredTempo;
begin
  Result := TncCredTempo(FItens[I]);
end;

function TncCredTempos.GetItemByID(aID: Integer): TncCredTempo;
var I : Integer;
begin
  for I := 0 to FItens.Count - 1 do with Itens[I] do 
  if teID=aID then begin
    Result := Itens[I];
    Exit;
  end;
  Result := nil;
end;

function TncCredTempos.GetItemByTran(aTran: Integer): TncCredTempo;
var I : Integer;
begin
  for I := 0 to FItens.Count - 1 do with Itens[I] do 
  if teTran=aTran then begin
    Result := Itens[I];
    Exit;
  end;
  Result := nil;
end;

function TncCredTempos.GetString: String;
var I : Integer;
begin
  Result := '';
  for I := 0 to Count - 1 do begin
    if I>0 then Result := Result + sLineBreak;
    Result := Result + Itens[I].AsString;
  end;
end;

procedure TncCredTempos.Limpa;
begin
  while Count>0 do begin
    Itens[0].Free;
    FItens.Delete(0);
  end;
end;

function TncCredTempos.NewItem: TncCredTempo;
begin
  Result := TncCredTempo.Create;
  FItens.Add(Result);
end;

procedure TncCredTempos.Remove(CT: TncCredTempo);
begin
  FItens.Remove(CT);
end;

procedure TncCredTempos.SetString(const Value: String);
var 
  SL: TStrings;
  I: Integer;
begin
  Limpa;
  SL := TStringList.Create;
  try
    SL.Text := Value;
    for I := 0 to SL.Count - 1 do
      NewItem.AsString := SL[I];
  finally
    SL.Free;
  end;
end;

function TncCredTempos.TotCredTempoValido: TncTempo;
var I : Integer;
begin
  Result.MInutos := 0;
  for I := 0 to Count-1 do with Itens[I] do 
  if (not teCancelado) and (teTipo in [tctAvulso, tctPacote]) then
    Result.Minutos := Result.Minutos + teMinutos;
end;

end.
