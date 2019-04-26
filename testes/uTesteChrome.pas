unit uTesteChrome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cefvcl, cefgui, ceflib, StdCtrls;

type
  TMainForm = class(TForm)
    C: TChromium;
    Panel1: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    ChromiumOSR1: TChromiumOSR;
    SaveDialog: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure CGetDownloadHandler(Sender: TObject; const browser: ICefBrowser;
      const mimeType, fileName: ustring; contentLength: Int64;
      var handler: ICefDownloadHandler; out Result: Boolean);
    procedure CRunModal(Sender: TObject; const browser: ICefBrowser;
      out Result: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TCefStreamDownloadHandler = class(TCefDownloadHandlerOwn)
  private
    FStream: TStream;
    FOwned: Boolean;
  protected
    function ReceivedData(data: Pointer; DataSize: Integer): Integer; override;
    procedure Complete; override;
  public
    constructor Create(stream: TStream; Owned: Boolean); reintroduce;
    destructor Destroy; override;
  end;
  

var
  MainForm: TMainForm;

implementation

uses ncShellStart;

{$R *.dfm}

procedure TMainForm.Button1Click(Sender: TObject);
begin
  C.Load(Edit1.Text);
end;

procedure TMainForm.CGetDownloadHandler(Sender: TObject;
  const browser: ICefBrowser; const mimeType, fileName: ustring;
  contentLength: Int64; var handler: ICefDownloadHandler; out Result: Boolean);
begin
  SaveDialog.FileName := fileName;
  if SaveDialog.Execute then
    handler := TCefStreamDownloadHandler.Create(
      TFileStream.Create(SaveDialog.FileName, fmCreate), true);
  Result := True;
end;

procedure TMainForm.CRunModal(Sender: TObject; const browser: ICefBrowser;
  out Result: Boolean);
begin
end;

{ TCefStreamDownloadHandler }

procedure TCefStreamDownloadHandler.Complete;
begin
  MainForm.Caption := 'Download complete';
end;

constructor TCefStreamDownloadHandler.Create(stream: TStream; Owned: Boolean);
begin
  inherited Create;
  FStream := stream;
  FOwned := Owned;
end;

destructor TCefStreamDownloadHandler.Destroy;
begin
  if FOwned then
    FStream.Free;
  inherited;
end;

function TCefStreamDownloadHandler.ReceivedData(data: Pointer;
  DataSize: Integer): Integer;
begin
  Result := FStream.Write(data^, DataSize);
  MainForm.Caption := 'Downloading ... ' + IntToStr(FStream.Position div 1000) + ' Kb';
end;


end.
