unit uTesteNavExt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDCustomComponent, LMDSysInfo, LMDControl, SHFolder,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  ComCtrls;

type
  TForm21 = class(TForm)
    LMDSysInfo1: TLMDSysInfo;
    Memo1: TMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    LMDSimplePanel1: TLMDSimplePanel;
    Button6: TButton;
    Button5: TButton;
    Button4: TButton;
    Button2: TButton;
    Button1: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Button7: TButton;
    Button8: TButton;
    Edit2: TEdit;
    TabSheet3: TTabSheet;
    Button9: TButton;
    Edit3: TEdit;
    Button10: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form21: TForm21;

implementation

uses ncBrowserUtils;

{$R *.dfm}

const
  sExt_ID = 'jacgaboiemcjbhbkladmdaklboajmcgg';
  sExt_Version = '1.4';


procedure TForm21.Button10Click(Sender: TObject);
begin
  ChangeHomePage(edit3.Text);
end;

procedure TForm21.Button1Click(Sender: TObject);
begin
  Chrome_Install_Ext(sExt_ID, 'c:\chrome_ext.crx', sExt_Version);
end;

procedure TForm21.Button2Click(Sender: TObject);
begin
  Chrome_Remove_Ext(sExt_ID);
end;

procedure TForm21.Button3Click(Sender: TObject);
begin
  ShowMessage(Chrome_BaseExt_Folder);
end;

procedure TForm21.Button4Click(Sender: TObject);
var S: String;
begin
  S := Chrome_Ext_Folder(sExt_ID, sExt_Version)+'\redirect.html';
  ShowMessage(S);
  Memo1.Lines.LoadFromFile(S);
  
end;

procedure TForm21.Button5Click(Sender: TObject);
begin
  ShowMessage(GetSysFolder(csidl_windows));
end;

procedure TForm21.Button6Click(Sender: TObject);
begin
  Chrome_ChangeHomePage(Edit1.Text);
end;

procedure TForm21.Button7Click(Sender: TObject);
var sl : TStrings;
begin
  sl := FF_Profile_Folders;
  try
    Memo1.Lines.Text := sl.Text;
  finally
    if Assigned(sl) then sl.Free;
  end;
end;

procedure TForm21.Button8Click(Sender: TObject);
begin
  FF_ChangeHomePage(edit2.Text);
end;

procedure TForm21.Button9Click(Sender: TObject);
begin
  IE_ChangeHomePage(Edit3.Text);
end;

end.
