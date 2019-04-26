unit uDMNexLicGen;

interface

uses
  SysUtils, Classes, IdBaseComponent, IdComponent, IdTCPServer, SyncObjs,
  IdCustomHTTPServer, IdHTTPServer, uLicExecryptor, EXECryptorKeyGen, ncDebug;

type
  TdmKeyGen = class(TDataModule)
    H: TIdHTTPServer;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure HCommandGet(AThread: TIdPeerThread;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  private
    { Private declarations }
      KG : TKeyGen;
  public
    { Public declarations }
  end;

var
  dmKeyGen: TdmKeyGen;
  CS : TCriticalSection;

implementation

{$R *.dfm}

function DataBaseLic: TDateTime;
begin
  Result := EncodeDate(2003, 1, 1);
end;

procedure TdmKeyGen.DataModuleCreate(Sender: TObject);
begin
  KG := TKeyGen.Create(ExtractFilePath(ParamStr(0)));
  H.Active := True;
end;

procedure TdmKeyGen.DataModuleDestroy(Sender: TObject);
begin
  H.Active := False;
  KG.Free;
end;

function DMAtoDate(S: String): TDateTime;
var D, M, A: Word;
begin
  Result := 0;
  if pos('/', S)<1 then Exit;
  D := StrToIntDef(copy(S, 1, Pos('/', S)-1), 0);
  Delete(S, 1, Pos('/', S));
  M := StrToIntDef(copy(S, 1, Pos('/', S)-1), 0);
  Delete(S, 1, Pos('/', S));
  A := StrToIntDef(S, 0);
  if (D<1) or (D>31) or (M<1) or (M>12) or (A<2000) or (A>9999)  then Exit;
  Result := EncodeDate(A, M, D);
end;

procedure TdmKeyGen.HCommandGet(AThread: TIdPeerThread;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  iTipo, iMaq, I : Integer;
  Venc : TDateTime;
  S, S2, sDebug : String;
begin
  if ARequestInfo.Params.Count=0 then Exit;
  
  try
    iTipo := StrToIntDef(ARequestInfo.Params.Values['tipo'], 5);
    if (iTipo<>5) and (iTipo<>2) and (iTipo<>6) then 
      iTipo := 5;
    iMaq := StrToIntDef(ARequestInfo.Params.Values['maquinas'], 1);  
    Venc := DMAToDate(ARequestInfo.Params.Values['vencimento']);
  
    with aRequestInfo do 
    if iTipo in [5, 6]  then begin
      S := DateToDateLic(Venc, True);
      S2 := S;
      iMaq := 1;
    end else begin
      if Venc=0 then Venc := DataBaseLic+1;
      S := Trim(Params.Values['loja'])+'-'+FormatDateTime('dd/mm/yyyy', Venc);
      S2 := DateToDateLic(Venc, False);
    end;  
  
     CS.Enter;
     try
         S := S2 + '-' + KG.CreateSerialNumberEx(
                              ExtractFilePath(ParamStr(0))+'nexcafe.ep2', S,
                              False, False, False, False, False, False,
                              iTipo, iMaq, ARequestInfo.Params.Values['codequip']);
     finally
       CS.Leave;
     end;
  
     AResponseInfo.ContentText := S;

     sDebug := '';

     with aRequestInfo do 
     for I := 0 to Params.Count - 1 do begin
       sDebug := sDebug + ', ';
       sDebug := sDebug + Params.Names[I] + '=' + Params.ValueFromIndex[I];
     end;  

     DebugMsgEsp('IP: '+ARequestInfo.RemoteIP+sDebug+', Resposta='+S, False, True);
  except
    on E: Exception do DebugMsgEsp('Exception: ' + E.Message, False, True);
  end;
end;

initialization
  CurrencyString := 'R$';
  ThousandSeparator := '.';
  DecimalSeparator := ',';
  ShortDateFormat := 'dd/mm/yyyy';
  nomearqdebug := 'NexLicGen_Debug.txt';
  DebugAtivo := True;
  CS := TCriticalSection.Create;

finalization
  CS.Free;
    
end.
