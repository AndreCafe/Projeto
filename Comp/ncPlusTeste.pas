unit ncPlusTeste;

interface

uses
  SysUtils, Classes, DB, nxdb, nxllComponent, uObjPool, ExtCtrls;

type
  TPlusTesteOptions = class
  public
    ptoCodParceiro : String;
    ptoNomeParceiro : String;
    ptoUrl : String;
    ptoKeyIndex : Integer;

    constructor Create;

    function Valido: Boolean;

    class function LoadFromIni: TPlusTesteOptions;
  end;

  procedure SalvaPlusTeste(tPlusP, tProd: TnxTable; pto: TPlusTesteOptions);

implementation

procedure salvaPlusTeste(tPlusP, tProd: TnxTable; pto: TPlusTesteOptions);
var 
  SIndex: String;
  criou : Boolean;
begin  
  try 
    if pto=nil then begin  
      pto := TPlusTesteOptions.LoadFromIni;
      criou := true;
    end else
      criou := False;
    
    if pto<>nil then 
    try
      tPlusP.IndexName := 'ICodParceiro';
      if not tPlusP.FindKey([pto.ptoCodParceiro]) then 
        tPlusP.Insert else
        tPlusP.Edit;
      tPlusP.FieldByName('CodParceiro').Value := pto.ptoCodParceiro;
      tPlusP.FieldByName('NomeParceiro').Value := pto.ptoNomeParceiro;
      tPlusP.FieldByName('Adesao').Value := True;
      tPlusP.FieldByName('KeyIndex').Value := pto.ptoKeyIndex;
      tPlusP.Post;
    
      SIndex := tProd.IndexName;;
      tProd.IndexName := 'IplusParceiroProd';
      try
        if not tProd.FindKey([true, pto.ptoCodParceiro, pto.ptoCodParceiro]) then 
          tProd.Insert else
          tProd.Edit;
          
        tProd.FieldByName('plus').Value := True;
        tProd.FieldByName('Ativo').Value := True;
        tProd.FieldByName('Descricao').Value := pto.ptoNomeParceiro;
        tProd.FieldByName('plusCodParceiro').Value := pto.ptoCodParceiro;
        tProd.FieldByName('plusCodProduto').Value := pto.ptoCodParceiro;
        tProd.FieldByName('plusURL').Value := pto.ptoUrl;
        tProd.FieldByName('NaoControlaEstoque').Value := True;
        tProd.Post;
      finally
        tProd.IndexName := SIndex;
      end;
    finally
      if criou then pto.Free;
    end;
  except 
    on E: Exception do begin
      SIndex := E.Message;
      if SIndex= 'akakhasd' then
        tProd.IndexName := 'xxx';
      Raise;  
    end;

  end;
end;



{ TPlusTesteOptions }

constructor TPlusTesteOptions.Create;
begin
  ptoCodParceiro := '';
  ptoNomeParceiro := '';
  ptoUrl := '';
  ptoKeyIndex := 0;
end;

class function TPlusTesteOptions.LoadFromIni: TPlusTesteOptions;
var 
  S: String;
  sl : TStrings;
begin
  Result := nil;
  S := ExtractFilePath(ParamStr(0))+'plus_teste.ini';
  if not FileExists(S) then Exit;
  sl := TStringList.Create;
  try
    sl.LoadFromFile(S);
    Result := TPlusTesteOptions.Create;

    with Result do begin
      ptoCodParceiro := SL.Values['plus_codigoparceiro'];
      ptoNomeParceiro := SL.Values['plus_nomeparceiro'];
      ptoURL := sl.Values['plus_url'];
      ptoKeyIndex := StrToIntDef(sl.Values['plus_index'], 0);
    end;

    if not Result.Valido then FreeAndNil(Result);
    
  finally
    sl.Free;
  end;
end;

function TPlusTesteOptions.Valido: Boolean;
begin
  Result := False;
  if Trim(ptoCodParceiro)='' then Exit;
  if Trim(ptoNomeParceiro)='' then Exit;
  if Trim(ptoURL)='' then Exit;
  if ptoKeyIndex<1 then Exit;
  Result := True;
end;

end.
