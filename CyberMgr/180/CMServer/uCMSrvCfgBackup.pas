unit uCMSrvCfgBackup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDBaseEdit, LMDCustomEdit, LMDCustomBrowseEdit, LMDBrowseEdit,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomLabel, LMDLabel;

type
  TFrmBackup = class(TForm)
    btnOk: TBitBtn;
    BitBtn2: TBitBtn;
    cbFazer: TCheckBox;
    edBackupDir: TLMDBrowseEdit;
    Label1: TLabel;
    LMDLabel1: TLMDLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FSL: TStringList;
    FName : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBackup: TFrmBackup;

implementation

{$R *.DFM}

procedure TFrmBackup.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBackup.btnOkClick(Sender: TObject);
begin
  FSL.Values['BACKUPDIR'] := edBackupDir.Path;
  
  if cbFazer.Checked then
    FSL.Values['FAZERBACKUP'] := 'S'
  else
    FSL.Values['FAZERBACKUP'] := 'N';  

  FSL.SaveToFile(FName);  
end;

procedure TFrmBackup.FormCreate(Sender: TObject);
begin
  FSL := TStringList.Create;
  FName := ExtractFilePath(ParamStr(0))+'CMServidor.ini';
  
  if FileExists(FName) then
    FSL.LoadFromFile(FName);
    
  cbFazer.Checked := (FSL.Values['FAZERBACKUP']='S');;  
  edBackupDir.Path := FSL.Values['BACKUPDIR'];
end;

procedure TFrmBackup.FormDestroy(Sender: TObject);
begin
  FSL.Free;
end;

procedure TFrmBackup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
