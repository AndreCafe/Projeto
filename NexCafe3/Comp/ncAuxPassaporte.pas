unit ncAuxPassaporte;

interface

uses
  ncClassesBase,
  ncTarifador,
  ncPassaportes,
  Variants,
  SysUtils,
  nxdb;
                     

//  procedure LePassaportesCli(T: TnxTable; TipoAcesso, Cliente, Transacao: Integer; Passaportes: PPassaportes);
  procedure SalvaPassaportesUsados(tPass, tHistPass: TnxTable; Sessao: Integer; Inicio: TDateTime; Passaportes: TncPassaportes; ExpirarTodos: Boolean = False);
  procedure LePassaportesCliSessao(tPass, tHistPass, tTipoPass: TnxTable; TipoAcesso, Cliente, Sessao: Integer; Passaportes: TncPassaportes);

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

procedure SalvaPassaportesUsados(tPass, tHistPass: TnxTable; Sessao: Integer; Inicio: TDateTime; Passaportes: TncPassaportes; ExpirarTodos: Boolean = False);
var I : Integer;
begin
  tHistPass.IndexName := 'IPassSessao';
  tPass.IndexName := 'IID';
  with Passaportes do
  for I := 0 to Count-1 do with Itens[I] do 
  if pcValido then begin
    if (pctUsadoMS>0) then begin
      if tHistPass.FindKey([pcID, Sessao]) then
        tHistPass.Edit
      else
        tHistPass.Append;
      tHistPass.FieldByName('Sessao').AsInteger := Sessao;
      tHistPass.FieldByName('DataHora').AsDateTime := Inicio;
      tHistPass.FieldByName('Passaporte').AsInteger := pcID;
      tHistPass.FieldByName('MinutosUsados').AsFloat := (pctUsadoMS / 1000 / 60);
      tHistPass.Post;
    end;

    if (pctUsadoMS>0) or pctExpirou or ExpirarTodos then begin
      if tPass.FindKey([pcID]) then begin
        TotalizaUso;
        tPass.Edit;
        SaveToDataset(tPass);
        if ExpirarTodos then
          tPass.FieldByName('Expirou').AsBoolean := True;
        tPass.Post;
      end;
    end;    
  end;
end;

procedure LePassaportesCliSessao(tPass, tHistPass, tTipoPass: TnxTable; TipoAcesso, Cliente, Sessao: Integer; Passaportes: TncPassaportes);
var  I : Integer;

function JaUsouPass(Num: Integer): Boolean;
begin
  Result := 
    (Sessao>0) and
    (tHistPass<>nil) and
    tHistPass.Locate('Sessao; Passaporte', VarArrayOf([Sessao, Num]), []);
end;
  
begin
  Passaportes.Limpa;
  if (tHistPass<>nil) and (Sessao>0) then
  try
    tPass.IndexName := 'IID';
    tTipoPass.IndexName := 'IID';
    tHistPass.IndexName := 'ISessaoPass';
    tHistPass.SetRange([Sessao], [Sessao]);
    tHistPass.First;
    while not tHistPass.Eof do begin
      if tPass.FindKey([tHistPass.FieldByName('Passaporte').AsInteger]) then 
      with Passaportes.NewPassaporte do begin
        LoadFromDataset(tPass);
        if (Trim(pcNome)='') and tTipoPass.FindKey([pcTipoPass]) then
          pcNome := tTipoPass.FieldByName('Nome').AsString;
        
        if tHistPass.FieldByName('MinutosUsados').AsFloat>0 then begin
          pcExpirou := False;
          pcAcessos := pcAcessos - 1;
          if pcAcessos=0 then
            pcPrimeiroUso := 0;
          pcSegundos := pcSegundos - Trunc(tHistPass.FieldByName('MinutosUsados').AsFloat * 60);
        end;
      end;
      tHistPass.Next;
    end;
  finally
    tHistPass.CancelRange;  
  end;  

  if (Cliente > 0) and (tPass<>nil) then 
  try
    tPass.IndexName := 'ICliExpID';
    tPass.SetRange([Cliente, False], [Cliente, False]);
    while not tPass.Eof do begin
      Passaportes.NewFromDataset(tPass);
      
      with Passaportes.Itens[Passaportes.Count-1] do
        if (Trim(pcNome)='') and tTipoPass.FindKey([pcTipoPass]) then
          pcNome := tTipoPass.FieldByName('Nome').AsString;
      
      tPass.Next;
    end;
  finally
    tPass.CancelRange
  end
end;

end.
