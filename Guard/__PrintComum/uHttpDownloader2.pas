unit uHttpDownloader2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP,
  math, uFileBlockStream;

Const
   _1seg  = 1/24/3600;
   _500ms = 1/24/3600/2;
type
  THttpDownloaderProgress = procedure (Sender: TObject; aPosition, aSize: int64; aPercent, aVel: double; aTimeLeft: TDateTime; aMayUpdate:boolean) of Object;

  THttpDownloader = class;

  THttpDownloadThread = class(TThread)
  private
    FOnProgress : THttpDownloaderProgress;
    IdHTTP1: TIdHTTP;
    fHttpDownloader : THttpDownloader;
    FIniTime  : TDateTime;
    FVelInst   : double;
    //FVelMedia  : double;
    FLastTime : TDateTime;
    FLastUpdate : TDateTime;
    FLastBytes : int64;
    fs : TFileBlockStream;

    fSyncPosition, fSyncSize: int64;
    fSyncPercent, fSyncVel: double;
    fSyncTimeLeft: TDateTime;
    fSyncaMayUpdate: boolean;
    procedure SyncOnProgress;
    procedure doOnProgress (aPosition, aSize: int64; aPercent, aVel: double; aTimeLeft: TDateTime; aMayUpdate:boolean);
  protected
    procedure Execute; override;
  public
    result : boolean;
    property OnProgress : THttpDownloaderProgress
        read FOnProgress write FOnProgress;
    procedure BufferEvent(Sender: TObject; var Buffer; Count: Longint; isLast:boolean);
    constructor Create(aHttpDownloader:THttpDownloader);
    destructor Destroy; override;
  end;
  
  THttpDownloader = class(TComponent)
  private
    fHttpDownloadThread : THttpDownloadThread;
    FHost : string;
    FURLpath : string;
    FFilename : string;
    FdnFolder : string;
    FDelay : integer;
    FOnProgress : THttpDownloaderProgress;
    procedure SetdnFolder (adnFolder : string);
    { Private declarations }
  public
    property Delay : integer read FDelay write FDelay;
    property Host : string read FHost write FHost;
    property URLpath  : string read FURLpath write FURLpath;
    property Filename : string read FFilename write FFilename;
    property dnFolder : string read FdnFolder write SetdnFolder;
    property OnProgress : THttpDownloaderProgress
        read FOnProgress write FOnProgress;
    function Download:boolean;
    procedure fHttpDownloadThreadOnProgress(Sender: TObject; aPosition, aSize: int64; aPercent, aVel: double; aTimeLeft: TDateTime; aMayUpdate:boolean);
    procedure Cancel;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
  end;

implementation

constructor THttpDownloader.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    fHttpDownloadThread := THttpDownloadThread.Create(self);
end;

destructor THttpDownloader.Destroy;
begin
    fHttpDownloadThread.free;
    inherited Destroy;
end;


procedure THttpDownloader.SetdnFolder (adnFolder: string);
begin
     if adnFolder<>FdnFolder then begin
         FdnFolder := adnFolder;
         forcedirectories (FdnFolder);
     end;
end;

procedure THttpDownloader.Cancel;
begin
    fHttpDownloadThread.IdHTTP1.Disconnect;
end;

function THttpDownloader.Download:boolean;
begin
    fHttpDownloadThread.OnProgress := fHttpDownloadThreadOnProgress;
    fHttpDownloadThread.Resume;
    repeat
      sleep(100);
    until fHttpDownloadThread.Terminated;
    result := fHttpDownloadThread.result;
end;

procedure THttpDownloader.fHttpDownloadThreadOnProgress(Sender: TObject;
  aPosition, aSize: int64; aPercent, aVel: double; aTimeLeft: TDateTime;
  aMayUpdate: boolean);
begin
    if assigned(FOnProgress) then
        FOnProgress(Self, aPosition, aSize, aPercent,
            aVel, aTimeLeft, aMayUpdate);
end;

{ THttpDownloadThread }

constructor THttpDownloadThread.Create(aHttpDownloader:THttpDownloader);
begin
   inherited create(true);
   fHttpDownloader := aHttpDownloader;
   IdHTTP1 := TIdHTTP.Create(nil);
end;

destructor THttpDownloadThread.Destroy;
begin
  IdHTTP1.Free;
  inherited;
end;

procedure THttpDownloadThread.doOnProgress(aPosition, aSize: int64; aPercent,
  aVel: double; aTimeLeft: TDateTime; aMayUpdate: boolean);
begin
    fSyncPosition    := aPosition;
    fSyncSize        := aSize;
    fSyncPercent     := aPercent;
    fSyncVel         := aVel;
    fSyncTimeLeft    := aTimeLeft;
    fSyncaMayUpdate  := aMayUpdate;

    Synchronize(SyncOnProgress);
end;

procedure THttpDownloadThread.SyncOnProgress;
begin
    if assigned(FOnProgress) then
        FOnProgress(Self, fSyncPosition, fSyncSize, fSyncPercent,
            fSyncVel, fSyncTimeLeft, fSyncaMayUpdate);
end;

procedure THttpDownloadThread.Execute;
var
    cl : integer;
    err : boolean;
    procedure cleanup;
    begin
          fs.Free;
          if err and (fileexists(fHttpDownloader.dnFolder+fHttpDownloader.Filename)) then
              deletefile(fHttpDownloader.dnFolder+fHttpDownloader.Filename);
    end;
begin
    result := false;
    err:= true;
    cl:=0;
    FLastTime :=0;
    FLastUpdate :=0;
    FLastBytes :=0;
    if fileexists(fHttpDownloader.dnFolder+fHttpDownloader.Filename) then
        deletefile(fHttpDownloader.dnFolder+fHttpDownloader.Filename);
    fs := TFileBlockStream.Create(fHttpDownloader.dnFolder+fHttpDownloader.Filename, fmCreate );
    fs.WriteBlockSize := $FFFF;
    fs.OnWriteBuffer := BufferEvent;

    IdHTTP1.Host := fHttpDownloader.Host;
    try
      IdHTTP1.head(fHttpDownloader.URLpath+fHttpDownloader.Filename);
      fs.WriteBlockSize := $FFFF;// * 10;
      FIniTime := now;
      IdHTTP1.get(fHttpDownloader.URLpath+fHttpDownloader.Filename, fs);
      if IdHTTP1.Response.HasContentLength then
         cl := IdHTTP1.Response.ContentLength;
      err:=( cl>0)and(cl<>fs.size);
      result:=( cl>0)and(cl=fs.size);
    except
      on e:exception do begin
         cleanup;
         raise;
      end;
    end;
    cleanup;
end;

procedure THttpDownloadThread.BufferEvent(Sender: TObject; var Buffer; Count: Longint; isLast:boolean);
var
    TimeLeft: TDateTime;
    MayUpdate : boolean;
begin
    TimeLeft := 0;
    MayUpdate := false;
    if now-FLastTime>0 then begin
        FVelInst  :=  (fs.Position - FLastBytes)  / ((now-FLastTime)*24*3600);
        try
            TimeLeft :=  ( (fs.Size - fs.Position) / FVelInst / 24 / 3600 ) + _1seg; ;
        except
            TimeLeft := 0;
        end;
        MayUpdate := (now-FLastUpdate) > _500ms ;
        if MayUpdate then
            FLastUpdate := 0;
    end;

    doOnProgress(fs.Position, fs.Size, (fs.Position/fs.Size)*100,
            FVelInst, TimeLeft, MayUpdate);

    FLastTime := now;
    FLastBytes := fs.Position;
    if fHttpDownloader.Delay>0 then
       sleep(fHttpDownloader.Delay);

end;


end.
