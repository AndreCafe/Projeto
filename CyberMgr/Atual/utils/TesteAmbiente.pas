unit TesteAmbiente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDCustomComponent, LMDSysInfo, ExtCtrls;

type
  TFrmPri = class(TForm)
    SI: TLMDSysInfo;
    Panel1: TPanel;
    Memo1: TMemo;
    Button1: TButton;
    SaveDlg: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

implementation

{$R *.dfm}

procedure TFrmPri.Button1Click(Sender: TObject);
begin
  if SaveDlg.Execute then
    Memo1.Lines.SaveToFile(SaveDlg.FileName);
end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
  Memo1.Lines.Add('ComputerName='+SI.ComputerName);
  Memo1.Lines.Add('CurrentUser='+SI.CurrentUser);
  Memo1.Lines.Add('TempPath='+SI.TempPath);
  Memo1.Lines.Add('-----------------------------------------------');
  Memo1.Lines.Add(SI.Environment.Text);
end;

end.
