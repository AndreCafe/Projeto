unit uHttpDownloader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdURI,
  math, uFileBlockStream;

Const
   _1seg  = 1/24/3600;
   _500ms = 1/24/3600/2;
type
  THttpDownloaderProgress = procedure (Sender: TObject; aPosition, aSize: int64; aPercent, aVel: double; aTimeLeft: TDateTime; aMayUpdate:boolean) of Object;

  THttpDownloader = class(TComponent)
  private
    IdHTTP1: TIdHTTP;
    FHost : string;
    FURLpath : string;
    FFilename : string;
    FdnFolder : string;
    FDelay : integer;
    FOnProgress : THttpDownloaderProgress;
    FIniTime  : TDateTime;
    FVelInst   : double;
    FVel1  : double;
    FVel2  : double;
    FVel3  : double;
    FLastTime : TDateTime;
    FLastUpdate : TDateTime;
    FLastBytes : int64;
    fs : TFileBlockStream;
    procedure SetdnFolder (adnFolder : string);
    procedure BufferEvent(Sender: TObject; var Buffer; Count: Longint; isLast:boolean);
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
    procedure Cancel;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
  end;

implementation

constructor THttpDownloader.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    IdHTTP1 := TIdHTTP.Create(nil);
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.ReadTimeout    := 30000;
end;

destructor THttpDownloader.Destroy;
begin
    IdHTTP1.Free;
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
    IdHTTP1.Disconnect;
end;

function THttpDownloader.Download:boolean;
var
    err : boolean;
    cl : integer;
    procedure cleanup;
    begin
          fs.Free;
          if err and (fileexists(FdnFolder+FFilename)) then
              deletefile(FdnFolder+FFilename);
    end;
begin
    cl:=0;
    err := true;
    FLastTime :=0;
    FLastUpdate :=0;
    FLastBytes :=0;
    FVel1 := 0;
    FVel2 := 0;
    FVel3 := 0;
    if fileexists(FdnFolder+FFilename) then
        deletefile(FdnFolder+FFilename);
    fs := TFileBlockStream.Create(FdnFolder+FFilename, fmCreate );
    fs.WriteBlockSize := $7FFF;
    fs.OnWriteBuffer := BufferEvent;
    IdHTTP1.Disconnect;
    IdHTTP1.Host := FHost;
    try
      IdHTTP1.head(TIdURI.PathEncode(FURLpath+FFilename));
      fs.WriteBlockSize := $7FFF;// * 10;
      FIniTime := now;

      IdHTTP1.get(TIdURI.PathEncode(FURLpath+FFilename), fs);
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
    IdHTTP1.Disconnect;
end;

procedure THttpDownloader.BufferEvent(Sender: TObject; var Buffer; Count: Longint; isLast:boolean);
var
    TimeLeft: TDateTime;
    MayUpdate : boolean;
    velMedia : double;
begin
    TimeLeft := 0;
    velMedia := 0;
    MayUpdate := false;
    if now-FLastTime>0 then begin
        FVelInst  :=  (fs.Position - FLastBytes)  / ((now-FLastTime)*24*3600);
        if FVel1 = 0 then FVel1 := FVelInst;
        if FVel2 = 0 then FVel1 := FVelInst;
        if FVel3 = 0 then FVel1 := FVelInst;
        FVel3 := FVel2;
        FVel2 := FVel1;
        FVel1 := FVelInst;
        velMedia := (FVel1 + FVel2 + FVel3)/3;
        try
            TimeLeft :=  ( (fs.Size - fs.Position) / velMedia / 24 / 3600 ) + _1seg; ;
        except
            TimeLeft := 0;
        end;

        MayUpdate := (now-FLastUpdate) > _500ms ;
        if MayUpdate then
            FLastUpdate := 0;
        if velMedia<10 then
           IdHTTP1.ReadTimeout    := 60000
        else
        if velMedia<25 then
           IdHTTP1.ReadTimeout    := 45000
        else
           IdHTTP1.ReadTimeout    := 30000;
    end;

    if assigned(FOnProgress) then
        FOnProgress(Self, fs.Position, fs.Size, (fs.Position/fs.Size)*100,
            velMedia, TimeLeft, MayUpdate);

    FLastTime := now;
    FLastBytes := fs.Position;
    if FDelay>0 then
       sleep(FDelay);
   
end;

end.
