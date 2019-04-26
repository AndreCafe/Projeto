unit ncsDMArqInt;

interface

uses
  SysUtils, Classes, LMDCustomComponent, LMDBaseController, LMDCustomContainer,
  LMDGenericList;

type
  TdmArqInt = class(TDataModule)
    ilArqs: TLMDGenericList;
  private
    { Private declarations }
  public
    { Public declarations }
    function getArq(aArq: String; aVerCli: Integer; S: TStream): Integer;
  end;

var
  dmArqInt: TdmArqInt;

implementation

uses ncErros, ncDebug;

{$R *.dfm}

{ TdmArqInt }

function TdmArqInt.getArq(aArq: String; aVerCli: Integer; S: TStream): Integer;
var 
  Item: TLMDGenericListItem;
  i : integer;
begin
  DebugMsg('TdmArqInt.getArq - aArq: ' + aArq + ' - aVerCli: ' + IntToStr(aVerCli));
  try
    item := nil;
    for i := 0 to ilArqs.Count-1 do 
      if SameText(ExtractFileName(ilArqs.Items[i].FileName), aArq) then begin
        item := ilArqs.Items[i];
        Break;
      end;
     
    if Item=nil then begin
      Result := ncerrArqNaoEncontrado;
      DebugMsg('TdmArqInt.getArq - Arq. nao encontrado');
      Exit;
    end;
    
    if StrToIntDef(Item.Description, 0) > aVerCli then begin
      Result := StrToIntDef(Item.Description, 0)+10000;
      DebugMsg('TdmArqInt.getArq - Encontrou! - Versao: ' + IntToStr(Result));
      Item.SaveToStream(S);
    end else begin
      DebugMsg('TdmArqInt.getArq - Encontrou sem nova versao! - VersaoServ: ' + Item.Description + ' - VersaoCli: '+IntToStr(aVerCli));
      Result := ncerrSemNovaVersao;
    end;
  except
    on E: Exception do begin
      Result := 2;
      DebugMsgEsp('TdmArqInt.getArq - aArq: ' + aArq + ' - aVerCli: ' + IntToStr(aVerCli) + ' - Exception: ' + E.Message, false, True);
    end;
  end;
end;

end.

1111111111100000000000000000000000000000000000000000000000000
