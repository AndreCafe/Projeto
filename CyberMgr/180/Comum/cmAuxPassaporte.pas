unit cmAuxPassaporte;

interface

uses
  cmClassesBase,
  SysUtils,
  nxdb;


  procedure LePassaportesCli(T: TnxTable; TipoAcesso, Cliente: Integer; Passaportes: PPassaportes);
  procedure SalvaPassaportesUsados(tPass, tHistPass: TnxTable; Transacao: Integer; Inicio: TDateTime; Passaportes: PPassaportes);
  procedure LePassaportesUsados(tPass, tHistPass: TnxTable; Cliente, Transacao: Integer; Passaportes: PPassaportes);

implementation

procedure LePassaportesCli(T: TnxTable; TipoAcesso, Cliente: Integer; Passaportes: PPassaportes);
var P : TPassaporte;
begin
  Passaportes^.Limpa;
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

procedure SalvaPassaportesUsados(tPass, tHistPass: TnxTable; Transacao: Integer; Inicio: TDateTime; Passaportes: PPassaportes);
var I : Integer;
begin
  tHistPass.IndexName := 'IPassTran';
  tPass.IndexName := 'INumero';
  with Passaportes^ do
  for I := 0 to Count-1 do with Itens[I] do begin
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

procedure LePassaportesUsados(tPass, tHistPass: TnxTable; Cliente, Transacao: Integer; Passaportes: PPassaportes);
var
  I : Integer;
  P : TPassaporte;
begin
  Passaportes^.Limpa;
  tHistPass.IndexName := 'ITranPass';
  tPass.IndexName := 'INumero';
  tHistPass.SetRange([Transacao], [Transacao]);
  tHistPass.First;
  try
    while not tHistPass.Eof do begin
      if tPass.FindKey([tHistPass.FieldByName('Passaporte').AsInteger]) then begin
        P.LoadFromDataset(tPass);
        P.pcExpirou := False;
        P.pcAcessos := P.pcAcessos - 1;
        if P.pcAcessos=0 then
          P.pcPrimeiroUso := 0;
        P.pcSegundos := P.pcSegundos - tHistPass.FieldByName('Segundos').AsInteger;
        Passaportes^.AddPassaporte(P);
      end;
      tHistPass.Next;
    end;

    if Cliente > 0 then begin
      tPass.IndexName := 'ICliExpNumero';
      tPass.SetRange([Cliente, False], [Cliente, False]);
      while not tPass.Eof do begin
        if not tHistPass.FindKey([Transacao, tPass.FieldByName('Numero').AsInteger]) then
        begin
          P.LoadFromDataset(tPass);
          Passaportes^.AddPassaporte(P);
        end;
        tPass.Next;
      end;
    end
  finally
    tHistPass.CancelRange;
    tPass.CancelRange;
  end;    
end;




end.
