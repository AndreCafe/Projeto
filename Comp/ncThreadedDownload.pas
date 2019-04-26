unit ncThreadedDownload;
{
    ResourceString: Dario 13/03/13
}

interface

uses
  Windows,
  ncNetMsg,
  ncPRConsts,
  ComObj,
  SysUtils,
  nxllTypes,
  nxllComponent,
  nxllMemoryManager,
  nxllTransport,
  nxllPluginBase,
  nxllDataMessageQueue,
  nxptBasePooledTransport,
  nxllSimpleSession,
  nxstMessages,
  SyncObjs,
  Classes,
  ncClassesBase;

const
  thdownload_errocom = -1;
  
type
  TncThDownloadDone = procedure (Sender:TObject; aArq: String; aVersaoServ, aErro: Integer) of object;

  TncThDownloadInfo = class
    Arq: String; 
    VersaoServ: Integer;
    Erro: Integer;
  end;
  
  TncThDownloadInt  = class (TThread)
  protected
    FTransp : TnxBasePooledTransport;
    FSS     : TnxSimpleSession;
    FReq    : TnmDownArqInt;
    FErro   : Integer;
    FVer    : Integer;
    FDestino: String;
    FSendInfoTo : HWND;
    
    procedure CriaSessao;
    procedure Execute; override;
  public
    constructor Create(aArq: String;
                       aVer: Integer; 
                       aDestino: String; 
                       aTransp: TnxBasePooledTransport;
                       aSendInfoTo : HWND); 
  end;

implementation

uses ncDebug, ncErros;

{ TncThDownload }

function TamArqOk(S: String): Boolean;
var SR: TSearchRec;
begin
  Result := True;
  if FindFirst(S, faAnyFile, SR)=0 then
  try
    Result := (SR.Size>5);
    DebugMsg('ncThreadedDownload.TamArqOk - Arquivo: '+ S + ' - Tamanho: ' + IntToStr(SR.Size)); // do not localize
  finally
    FindClose(SR);
  end;
end;

constructor TncThDownloadInt.Create(aArq: String; aVer: Integer; aDestino: String;
  aTransp: TnxBasePooledTransport; aSendInfoTo: HWND);
begin
  DebugMsg('TncThDownloadInt.Create 1'); // do not localize

  if (aVer>0) and (not TamArqOk(aDestino)) then
    aVer := 0;

  inherited Create(True);
  FTransp := aTransp;
  FSS     := nil;
  FReq.nmArq := aArq;
  FReq.nmVer := aVer;
  FSendInfoTo := aSendInfoTo;
  FErro   := -1;
  FVer := 0;
  FDestino:= aDestino;
  FreeOnTerminate := True;
  DebugMsg('TncThDownloadInt.Create 2'); // do not localize
end;

procedure TncThDownloadInt.CriaSessao;
begin
  DebugMsg('TncThDownloadInt.CriaSessao 1'); // do not localize
  FSS := TnxSimpleSession.Create(nil);
  FSS.Transport := FTransp;
  FSS.UserName := 'admin'; // do not localize
  FSS.Password := 'delphi9856'; // do not localize
  FSS.Active := True;
  DebugMsg('TncThDownloadInt.CriaSessao 2'); // do not localize
end;

procedure TncThDownloadInt.Execute;
var 
  S: TMemoryStream;
  SessionRequests: InxSessionRequests;
  DI : TncThDownloadInfo;
begin
  DebugMsg('TncthDownloadInt.Execute 1'); // do not localize
  try
    FErro := -1;
    CriaSessao;
    S := TMemoryStream.Create;
    try
      if Supports(FSS, InxSessionRequests, SessionRequests) then begin
        FErro := SessionRequests.ProcessRequest(Self, 0, ncnmDownloadArqInterno, 120000, @FReq, SizeOf(FReq), @S, nil, nmdStream);
        DebugMsg('TncthDownloadInt - Execute RES - Arq: '+FReq.nmArq+' - VerCli: ' + IntToStr(FReq.nmVer)+ ' - Erro: ' + IntToStr(FErro));
        if FErro > 10000 then  begin
          FVer := FErro - 10000;
          if S.Size>5 then begin
            S.SaveToFile(FDestino);
            FErro := 0;
          end else
            FErro := ncerrFalhaDownloadInt;
        end;
      end;
      FSS.Close;
    finally
      S.Free;
      FSS.Free;
    end;

  except
    on E: Exception do 
     DebugMsg('TncthDownloadInt.Execute - Exception: ' + E.Message); // do not localize
  end;

  DebugMsg('TncthDownloadInt.Execute Fim 1 - Arq: '+FReq.nmArq +' - VersaoServ: '+IntToStr(FVer)+' - Erro: '+IntToStr(FErro)); // do not localize
  
  if FSendInfoTo>0 then begin
    DebugMsg('TncthDownloadInt.Execute SendInfoTo - Arq: '+FReq.nmArq +' - VersaoServ: '+IntToStr(FVer)+' - Erro: '+IntToStr(FErro)); // do not localize
    DI := TncThDownloadInfo.Create;
    DI.Arq := FReq.nmArq;
    DI.VersaoServ := FVer;
    DI.Erro := FErro;
    PostMessage(FSendInfoTo, wm_DownloadIntInfo, Integer(DI), 0);
  end else 
    DebugMsg('TncthDownloadInt.Execute - SendInfoTo = 0');

  DebugMsg('TncthDownloadInt.Execute Fim 2'); // do not localize

end;


end.

