unit uDTGrDsk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, FileCtrl, uDTSyncDef;

type
  TFrmGrDsk = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PB: TProgressBar;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FSourceDir : String;
  public
    procedure GeraDisquete(SourceDir: String);
    { Public declarations }
  end;

var
  FrmGrDsk: TFrmGrDsk;

implementation

uses UDTTabelas;

{$R *.DFM}

procedure TFrmGrDsk.FormShow(Sender: TObject);
begin
   Timer1.Enabled := True;
   PB.Max := NumTabs;
   PB.Min := 1;
   PB.Position := 1;
end;

procedure TFrmGrDsk.GeraDisquete(SourceDir: String);
begin
  FSourceDir := SourceDir;
  ShowModal;
end;

procedure TFrmGrDsk.Timer1Timer(Sender: TObject);
Var
  List : TStringList;
  I    : Integer;
begin
   Timer1.Enabled := False;
   List := TStringList.Create;
   try
     List.Values['Dir']   := 'A:\';
     List.Values['IP']    := cfgSrv;
     List.Values['Porta'] := InttoStr(cfgPort);
     List.SaveToFile('A:\DIATEC.INI');

     if not DirectoryExists('A:\Tabelas') then MkDir('A:\Tabelas');

     for I := 1 to NumTabs do begin
       Panel1.Caption := 'Copiando arquivo ' + FSourceDir + NomeTab[I];
       PB.Position := I;
       Application.ProcessMessages;
       if FileExists(FSourceDir+NomeTab[I]+'.nx1') then
         CopyFile(PChar(FSourceDir+NomeTab[I]+'.nx1'),
                  PChar('A:\Tabelas\'+NomeTab[I]+'.nx1'), False);
     end;    
   finally
     List.Free;
     Close;    
   end;
end;

procedure TFrmGrDsk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
