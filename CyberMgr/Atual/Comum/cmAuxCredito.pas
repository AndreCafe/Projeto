unit cmAuxCredito;

interface

uses
  cmClassesBase,
  Variants,
  SysUtils,
  nxdb;

type

  TCredUtils = class
  private
    FTab: TnxTable;

    function LocalizaTran(aTran: Integer): Boolean;
  public
    constructor Create(aTab: TnxTable);
    function SaldoCliMin(aCliente: Integer): Double;
    function SaldoCliMS(aCliente: Integer): Cardinal;

    procedure SaveTran(aCliente: Integer;
                       aMinutos: Double;                     
                       aDataHora: TDateTime;
                       aTran: Integer;
                       aTipoTran: Byte);
  end;                     

implementation

{procedure LePassaportesCli(T: TnxTable; TipoAcesso, Cliente, Acesso: Integer; Passaportes: PPassaportes);
var P : TPassaporte;
begin
  Passaportes^.Limpa;
  if Cliente>0 then begin
    T.IndexName := 'ICliExpNumero';
    T.SetRange([Cliente, False], [Cliente, False]);
    try
      T.First;
      while not T.Eof do begin
        with T.FieldByName('TipoAcesso') do
        if (AsInteger=-1) or (AsInteger=TipoAcesso) then begin
          P.LoadFromDataset(T);
          Passaportes^.AddPassaporte(P);
        end;  
        T.Next;
      end;
    finally
      T.CancelRange
    end;
  end;

  if Acesso>0 then begin
    T.IndexName := 'ICliExpNumero';
    T.SetRange([Cliente, False], [Cliente, False]);
    try
      T.First;
      while not T.Eof do begin
        with T.FieldByName('TipoAcesso') do
        if (AsInteger=-1) or (AsInteger=TipoAcesso) then begin
          P.LoadFromDataset(T);
          Passaportes^.AddPassaporte(P);
        end;  
        T.Next;
      end;
    finally
      T.CancelRange
    end;
  end;
end;}

procedure SalvaPassaportesUsados(tPass, tHistPass: TnxTable; Transacao: Integer; Inicio: TDateTime; Passaportes: PPassaportes);
var I : Integer;
begin
  tHistPass.IndexName := 'IPassTran';
  tPass.IndexName := 'INumero';
  with Passaportes^ do
  for I := 0 to Count-1 do with Itens[I] do 
  if pcValido then begin
    if (pctUsadoMS>0) then begin
      if tHistPass.FindKey([pcNumero, Transacao]) then
        tHistPass.Edit
      else
        tHistPass.Append;
      tHistPass.FieldByName('Transacao').AsInteger := Transacao;
      tHistPass.FieldByName('DataHora').AsDateTime := Inicio;
      tHistPass.FieldByName('Passaporte').AsInteger := pcNumero;
      tHistPass.FieldByName('Segundos').AsInteger := (pctUsadoMS div 1000);
      tHistPass.Post;
    end;

    if (pctUsadoMS>0) or pctExpirou then begin
      if tPass.FindKey([pcNumero]) then begin
        TotalizaUso;
        tPass.Edit;
        SaveToDataset(tPass);
        tPass.Post;
      end;
    end;    
  end;
end;

procedure LePassaportesCliTran(tPass, tHistPass: TnxTable; TipoAcesso, Cliente, Transacao: Integer; Passaportes: PPassaportes);
var
  I : Integer;
  P : TPassaporte;

function JaUsouPass(Num: Integer): Boolean;
begin
  Result := 
    (Transacao>0) and
    (tHistPass<>nil) and
    tHistPass.Locate('Transacao; Passaporte', VarArrayOf([Transacao, Num]), []);
end;
  
begin
  Passaportes^.Limpa;
  if (tHistPass<>nil) and (Transacao>0) then
  try
    tPass.IndexName := 'INumero';
    tHistPass.IndexName := 'ITranPass';
    tHistPass.SetRange([Transacao], [Transacao]);
    tHistPass.First;
    while not tHistPass.Eof do begin
      if tPass.FindKey([tHistPass.FieldByName('Passaporte').AsInteger]) then begin
        P.LoadFromDataset(tPass);
        if tHistPass.FieldByName('Segundos').AsInteger>0 then
          P.pcExpirou := False;
        P.pcAcessos := P.pcAcessos - 1;
        if P.pcAcessos=0 then
          P.pcPrimeiroUso := 0;
        P.pcSegundos := P.pcSegundos - tHistPass.FieldByName('Segundos').AsInteger;
        Passaportes^.AddPassaporte(P);
      end;
      tHistPass.Next;
    end;
  finally
    tHistPass.CancelRange;  
  end;  

  if (Cliente > 0) and (tPass<>nil) then 
  try
    tPass.IndexName := 'INumero';
    tPass.IndexName := 'ICliExpNumero';
    tPass.SetRange([Cliente, False], [Cliente, False]);
    while not tPass.Eof do begin
      with tPass.FieldByName('TipoAcesso') do
      if ((AsInteger=-1) or (AsInteger=TipoAcesso)) and (not JaUsouPass(tPass.FieldByName('Numero').AsInteger)) then 
      begin
        P.LoadFromDataset(tPass);
        Passaportes^.AddPassaporte(P);
      end;
      tPass.Next;
    end;
  finally
    tPass.CancelRange
  end
end;

{ TCredUtils }

constructor TCredUtils.Create(aTab: TnxTable);
begin

end;

function TCredUtils.LocalizaTran(aTran: Integer): Boolean;
begin

end;

function TCredUtils.SaldoCliMin(aCliente: Integer): Double;
begin

end;

function TCredUtils.SaldoCliMS(aCliente: Integer): Cardinal;
begin

end;

procedure TCredUtils.SaveTran(aCliente: Integer; aMinutos: Double;
  aDataHora: TDateTime; aTran: Integer; aTipoTran: Byte);
begin

end;

end.
