unit ncFrmDownSup;
{
    ResourceString: Dario 12/03/13
}


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, ActnList, ExtActns, XPStyleActnCtrls,
  ActnMan, StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxLabel,
  ComCtrls, ncClassesBase, ExtCtrls, cxGraphics, cxLookAndFeels;

type
  TFrmDownSup = class(TForm)
    PB: TProgressBar;
    cxLabel1: TcxLabel;
    cxButton1: TcxButton;
    cxLabel2: TcxLabel;
    ActionManager1: TActionManager;
    DownURL: TDownLoadURL;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure DownURLDownloadProgress(Sender: TDownLoadURL; Progress,
      ProgressMax: Cardinal; StatusCode: TURLDownloadStatus; StatusText: string;
      var Cancel: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
    FAutomatize : Boolean;
    procedure DoBaixar;
  public
    procedure Baixar(aNome, aObs: String; aAutomatize: Boolean = False);
    { Public declarations }
  end;

  procedure LimpaDirSuporte;

var
  FrmDownSup: TFrmDownSup;
  NumDown : Integer = 0;

implementation

uses ncShellStart, udmLogmein;

{$R *.dfm}

function DirSup: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'\suporte'; // do not localize
end;

procedure TFrmDownSup.Baixar(aNome, aObs: String; aAutomatize: Boolean = False);
begin
  FAutomatize := aAutomatize;
  Inc(NumDown);
  aNome := aNome + ' ('+IntToStr(NumDown)+')';
  DownURL.URL := 'https://secure.logmeinrescue.com/Customer/Download.aspx?EntryID=1856965867'+ // do not localize
                 '&comment0='+aNome+ // do not localize
                 '&comment1='+gConfig.Conta+ // do not localize
                 '&comment2='+aobs; // do not localize
  LimpaDirSuporte;                 
  ShowModal;                 
end;

procedure TFrmDownSup.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmDownSup.DoBaixar;
begin
  LimpaDirSuporte;
  if not DirectoryExists(DirSup) then
    MkDir(DirSup);
  DownURL.Filename := DirSup + '\SupRem' + IntToStr(Random(MaxInt)) + '.exe'; // do not localize
  DownURL.ExecuteTarget(nil);
end;

procedure TFrmDownSup.DownURLDownloadProgress(Sender: TDownLoadURL; Progress,
  ProgressMax: Cardinal; StatusCode: TURLDownloadStatus; StatusText: string;
  var Cancel: Boolean);
begin
  if ProgressMax=0 then Exit;
  PB.Max := ProgressMax;
  PB.Position := Progress;
  if Progress=ProgressMax then 
    Timer2.Enabled := True;
end;

procedure TFrmDownSup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmDownSup.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TFrmDownSup.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  DoBaixar;
end;

procedure TFrmDownSup.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  ShellStart(DownURL.Filename);
  if FAutomatize then TdmLogmein.Create(nil);
  
  Close;
end;

procedure LimpaDirSuporte;
var SR: TSearchRec;
begin
  if FindFirst(DirSup+'\*.*', faArchive, SR)=0 then
  try
    repeat
      DeleteFile(DirSup+'\'+SR.Name);
    until (FindNext(SR)<>0);
  finally
    FindClose(SR);
  end;
end;

initialization
  Randomize;

end.

