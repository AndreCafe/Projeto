unit ncTipoImp;
{
    ResourceString: Dario 13/03/13
    Nada para fazer
}

interface

uses
  SysUtils,
  DB,
  MD5,
  Dialogs,
  Classes,
  Windows,
  ClasseCS,
  ncClassesBase;

type

  TncTipoImp = class ( TncClasse ) 
  private
     FID : Integer;
     FNome : String;
     FValor : Currency;
     FImpressora : String;
     FImgID : Integer;
     FDevModeStream : TStringStream;
      
    function GetPrinterDevMode: String;
    procedure SetPrinterDevMode(const Value: String);
  protected
     function GetChave: Variant; override;
  public
     constructor Create;  
     destructor Destroy; override;

     function Clone: TncTipoImp;
     
     function TipoClasse: Integer; override;

     property DevModeStream: TStringStream
       read FDevModeStream;

  published
   
     property ID: Integer
       read FID write FID;

     property Nome: String
       read FNome write FNome;

     property Valor: Currency  
       read FValor write FValor;

     property ImgID: Integer
       read FImgID write FImgID;  

     property Impressora: String
       read FImpressora write FImpressora;  

     property PrinterDevMode: String
       read GetPrinterDevMode write SetPrinterDevMode;   
  end;  


  TncTiposImp = class ( TListaClasseCS )
  private
    function GetTipoImp(I: Integer): TncTipoImp;
    function GetPorID(aID: Integer): TncTipoImp;
  public
    property Itens[I: Integer]: TncTipoImp
      read GetTipoImp;

    property PorID[aID: Integer]: TncTipoImp
      read GetPorID;   
  end;   

var
  gTiposImp : TncTiposImp;  
     
implementation

{ TncTipoImp }

function TncTipoImp.Clone: TncTipoImp;
begin
  Result := TncTipoImp.Create;
  try
    Result.FID := FID;
    Result.FNome := FNome;
    Result.FValor := FValor;
    Result.FImpressora := FImpressora;
    Result.FImgID := FImgID;
    Result.PrinterDevMode := PrinterDevMode;
  except
    Result.Free;
    //Result := nil;
    raise;
  end;
end;

constructor TncTipoImp.Create;
begin
  inherited;

  FDevModeStream := TStringStream.Create('');
  
  FID := 0;
  FNome := '';
  FValor := 0;
  FImpressora := '';
  FImgID := 0;
end;

destructor TncTipoImp.Destroy;
begin
  FDevModeStream.Free;
  inherited;
end;

function TncTipoImp.GetChave: Variant;
begin
  Result := FID;
end;

function TncTipoImp.GetPrinterDevMode: String;
begin
  Result := FDevModeStream.DataString;
end;

procedure TncTipoImp.SetPrinterDevMode(const Value: String);
begin
  FDevModeStream.Size := 0;
  FDevModeStream.WriteString(Value);
end;

function TncTipoImp.TipoClasse: Integer;
begin
  result := tcTipoImp;
end;

{ TncTiposImp }

function TncTiposImp.GetPorID(aID: Integer): TncTipoImp;
var I : Integer;
begin
  for I := 0 to Count - 1 do with Itens[i] do 
    if (aID=ID) then begin
      Result := Itens[I];
      Exit;
    end;
  Result := nil;  
end;

function TncTiposImp.GetTipoImp(I: Integer): TncTipoImp;
begin
  Result := TncTipoImp(GetItem(I));
end;

var i : Integer;

initialization
  gTiposImp := TncTiposImp.Create(tcTipoImp);

finalization
  for I := 0 to gTiposImp.Count-1 do gTiposImp.Itens[i].ProcNotificar := nil;
  gTiposImp.Free;

end.
