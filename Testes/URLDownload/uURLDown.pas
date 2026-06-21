unit uURLDown;

interface

uses
  Windows, ExtActns, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, nxllComponent, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerStream, AppWebUpdater, IEDownload,
  OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, ComObj, ActiveX, UrlMon, ComCtrls;

type
  TForm17 = class(TForm)
    T: TnxWinsockTransport;
    H: TIdHTTP;
    Button1: TButton;
    IdIOHandlerStream1: TIdIOHandlerStream;
    WU: TWebUpdater;
    IED: TIEDownload;
    EW: TEmbeddedWB;
    ProgressBar1: TProgressBar;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Progresso(Sender: TDownLoadURL; Progress,
    ProgressMax: Cardinal; StatusCode: TURLDownloadStatus; StatusText: String;
    var Cancel: Boolean) ;
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

{$R *.dfm}

procedure TForm17.Button1Click(Sender: TObject);
begin
with TDownloadURL.Create(self) do
   try
     URL:='https://secure.logmeinrescue.com/Customer/Download.aspx?EntryID=1856965867';
     FileName := 'c:\meus programas\logmeinteste.exe';
     OnDownloadProgress := Progresso;
     ExecuteTarget(nil) ;
     
   finally
     Free;
   end;
end;


procedure TForm17.Progresso(Sender: TDownLoadURL; Progress,
  ProgressMax: Cardinal; StatusCode: TURLDownloadStatus; StatusText: String;
  var Cancel: Boolean);
begin
  progressbar1.Max := ProgressMax;
  progressbar1.Position := Progress;
  Application.ProcessMessages;
end;

end.
