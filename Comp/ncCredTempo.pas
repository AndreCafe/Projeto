unit ncCredTempo;
{
    ResourceString: Dario 12/03/13
}


interface

uses
  SysUtils,
  DB,
  MD5,
  Classes,
  Windows,
  ClasseCS,
  ncEspecie,
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
    tePagEsp     : TncPagEspecies;
    _Recibo      : Boolean;
    _Operacao    : Byte;

    constructor Create;
    destructor Destroy; override;
    
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
    procedure SetString(Value: String);
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
  tePagEsp.Assign(T.tePagEsp);
  _Recibo := T._Recibo;
  _Operacao := T._Operacao;
end;

constructor TncCredTempo.Create;
begin
  tePagEsp := TncPagEspecies.Create;
  Limpa;
end;                                   

function TncCredTempo.Debito: Currency;
begin
  if (not teCancelado) and (teSessao=0) then
    Result := teTotal - teDesconto - tePago else
    Result := 0;
end;

destructor TncCredTempo.Destroy;
begin
  tePagEsp.Free;
  inherited;
end;

function TncCredTempo.GetString: String;
begin
  Result := 
    IntToStr(teID) + sFldDelim(classid_TncCredTempo) +
    GetDTStr(teDataHora) + sFldDelim(classid_TncCredTempo) +
    teFunc + sFldDelim(classid_TncCredTempo) +
    IntToStr(teTipo) + sFldDelim(classid_TncCredTempo) + 
    FloatParaStr(teMinutos) + sFldDelim(classid_TncCredTempo) +
    IntToStr(teIDPacPass) + sFldDelim(classid_TncCredTempo) +
    FloatParaStr(teTotal) + sFldDelim(classid_TncCredTempo) +
    FloatParaStr(teDesconto) + sFldDelim(classid_TncCredTempo) +
    FloatParaStr(tePago) + sFldDelim(classid_TncCredTempo) +
    IntToStr(teCliente) + sFldDelim(classid_TncCredTempo) +
    IntToStr(teMaq) + sFldDelim(classid_TncCredTempo) +
    IntToStr(teSessao) + sFldDelim(classid_TncCredTempo) +
    IntToStr(tePassaporte) + sFldDelim(classid_TncCredTempo) + 
    BoolStr[teCancelado] + sFldDelim(classid_TncCredTempo) +
    IntToStr(teTran) + sFldDelim(classid_TncCredTempo) +
    IntToStr(teCaixa) + sFldDelim(classid_TncCredTempo) + 
    teSenha + sFldDelim(classid_TncCredTempo) + 
    teNome + sFldDelim(classid_TncCredTempo) + 
    IntToStr(teTipoAcesso) + sFldDelim(classid_TncCredTempo) +
    teObs + sFldDelim(classid_TncCredTempo) +
    BoolStr[teCredValor] + sFldDelim(classid_TncCredTempo) +
    BoolStr[teFidResgate] + sFldDelim(classid_TncCredTempo) +
    FloatParaStr(teFidPontos) + sFldDelim(classid_TncCredTempo) +
    tePagEsp.AsString + sFldDelim(classid_TncCredTempo) +
    BoolStr[_Recibo] + sFldDelim(classid_TncCredTempo) +
    IntToStr(_Operacao) + sFldDelim(classid_TncCredTempo);
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
  if tePagEsp.AsString <> T.tePagEsp.AsString then Exit;
  

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
  tePagEsp.Clear;
  
  _Operacao   := osNenhuma;
  _Recibo     := False;
end;

procedure TncCredTempo.LoadFromDataset(D: TDataset);
begin
  teID := D.FieldByName('ID').AsInteger; // do not localize
  teDataHora := D.FieldByName('DataHora').AsDateTime; // do not localize
  teFunc := D.FieldByName('Func').AsString; // do not localize
  teTipo := D.FieldByName('Tipo').AsInteger; // do not localize
  teMinutos := D.FieldByName('Minutos').AsFloat; // do not localize
  teIDPacPass := D.FieldByName('IDPacPass').AsInteger; // do not localize
  teTotal := D.FieldByName('Total').AsCurrency; // do not localize
  teDesconto := D.FieldByName('Desconto').AsCurrency; // do not localize
  tePago := D.FieldByName('Pago').AsCurrency; // do not localize
  teCliente := D.FieldByName('Cliente').AsInteger; // do not localize
  teMaq := D.FieldByName('Maq').AsInteger; // do not localize
  teSessao := D.FieldByName('Sessao').AsInteger; // do not localize
  tePassaporte := D.FieldByName('Passaporte').AsInteger; // do not localize
  teCancelado := D.FieldByName('Cancelado').AsBoolean; // do not localize
  teTran := D.FieldByName('Tran').AsInteger; // do not localize
  teCaixa := D.FieldByName('Caixa').AsInteger; // do not localize
  teSenha := D.FieldByName('Senha').AsString; // do not localize
  teNome := D.FieldByName('Nome').AsString; // do not localize
  teTipoAcesso := D.FieldByName('TipoAcesso').AsInteger; // do not localize
  teObs := D.FieldByName('Obs').AsString; // do not localize
  teCredValor := D.FieldByName('CredValor').AsBoolean; // do not localize
  teFidResgate := D.FieldByName('FidResgate').AsBoolean; // do not localize
  teFidPontos := D.FieldByName('FidPontos').AsFloat; // do not localize
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
  D.FieldByName('DataHora').AsDateTime := teDataHora; // do not localize
  D.FieldByName('Func').AsString := teFunc; // do not localize
  D.FieldByName('Tipo').AsInteger := teTipo; // do not localize
  D.FieldByName('Minutos').AsFloat := teMinutos; // do not localize
  D.FieldByName('IDPacPass').AsInteger := teIDPacPass; // do not localize
  D.FieldByName('Total').AsCurrency := teTotal; // do not localize
  D.FieldByName('Desconto').AsCurrency := teDesconto; // do not localize
  D.FieldByName('Pago').AsCurrency := tePago; // do not localize
  D.FieldByName('Cliente').AsInteger := teCliente; // do not localize
  D.FieldByName('Maq').AsInteger := teMaq; // do not localize
  D.FieldByName('Sessao').AsInteger := teSessao; // do not localize
  D.FieldByName('Passaporte').AsInteger := tePassaporte; // do not localize
  D.FieldByName('Cancelado').AsBoolean := teCancelado; // do not localize
  D.FieldByName('Tran').AsInteger := teTran; // do not localize
  D.FieldByName('Caixa').AsInteger := teCaixa; // do not localize
  D.FieldByName('Senha').AsString := teSenha; // do not localize
  D.FieldByName('Nome').AsString := teNome; // do not localize
  D.FieldByName('TipoAcesso').AsInteger := teTipoAcesso; // do not localize
  D.FieldByname('Obs').AsString := teObs; // do not localize
  D.FieldByName('CredValor').AsBoolean := teCredValor; // do not localize
  D.FieldByName('FidResgate').AsBoolean := teFidResgate; // do not localize
  D.FieldByName('FidPontos').AsFloat := teFidPontos; // do not localize
end;

procedure TncCredTempo.SaveToITranDataset(D: TDataset);
begin
  D.FieldByName('Tran').AsInteger := teTran; // do not localize
  D.FieldByName('Caixa').AsInteger := teCaixa; // do not localize
  D.FieldByName('DataHora').AsDateTime := teDataHora; // do not localize
  D.FieldByName('Caixa').AsInteger := teCaixa; // do not localize
  D.FieldByName('TipoItem').AsInteger := itTempo; // do not localize
  D.FieldByName('TipoTran').AsInteger := trCredTempo; // do not localize
  D.FieldByName('ItemID').AsInteger := teID; // do not localize
  D.FieldByname('ItemPos').AsInteger := 1; // do not localize
  D.FieldByName('Total').AsCurrency := teTotal; // do not localize
  D.FieldByName('Desconto').AsCurrency := teDesconto; // do not localize
  D.FieldByName('Pago').AsCurrency := tePago; // do not localize
  D.FieldByName('Cancelado').AsBoolean := teCancelado; // do not localize
  D.FieldByName('Sessao').AsInteger := teSessao; // do not localize
  
  if teFidResgate then begin
    D.FieldByName('FidFator').AsInteger := -1; // do not localize
    D.FieldByName('FidPontos').AsFloat := teFidPontos; // do not localize
  end else begin
    D.FieldByName('FidFator').Clear; // do not localize
    D.FieldByName('FidPontos').Clear; // do not localize
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
  D.FieldByName('Caixa').AsInteger := teCaixa; // do not localize
  D.FieldByName('DataHora').AsDateTime := teDataHora; // do not localize
  D.FieldByName('Caixa').AsInteger := teCaixa; // do not localize
  D.FieldByName('Total').AsCurrency := teTotal; // do not localize
  D.FieldByName('Desconto').AsCurrency := teDesconto; // do not localize
  D.FieldByName('Pago').AsCurrency := tePago; // do not localize
  D.FieldByName('Cancelado').AsBoolean := teCancelado; // do not localize
  D.FieldByName('Sessao').AsInteger := teSessao; // do not localize
  D.FieldByName('Cliente').AsInteger := teCliente; // do not localize
  D.FieldByName('Func').AsString := teFunc; // do not localize
  D.FieldByName('Maq').AsInteger  := teMaq; // do not localize
  D.FieldByName('Tipo').AsInteger := trCredTempo; // do not localize
  D.FieldByName('Obs').AsString := teObs; // do not localize
  D.FieldByName('FidResgate').AsBoolean := teFidResgate; // do not localize
end;

procedure TncCredTempo.SetString(const Value: String);
var S: String;

function pCampo: String;
begin
  Result := GetNextStrDelim(S, classid_TncCredTempo);
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
  tePagEsp.AsString := pCampo;
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
  for I := 0 to Count - 1 do 
    Result := Result + Itens[I].AsString + sListaDelim(classid_TncCredTempos);
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

procedure TncCredTempos.SetString(Value: String);
var S: String;
begin
  Limpa;
  while GetNextListItem(Value, S, classid_TncCredTempos) do 
    NewItem.AsString := S;
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

