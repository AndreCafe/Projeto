unit uTesteMozPri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, MOZILLACONTROLLib_TLB, StdCtrls, ExtCtrls, ActiveX, 
  LMDCustomComponent, LMDBaseController, LMDCustomContainer, LMDGenericList,
  SHDocVw, mshtml;

type
  TForm24 = class(TForm)
    M: TMozillaBrowser;
    Button1: TButton;
    Timer1: TTimer;
    M2: TMozillaBrowser;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    WB: TWebBrowser;
    procedure Button1Click(Sender: TObject);
    procedure MNewWindow2(ASender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool);
    procedure MBeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
      var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
      var Cancel: WordBool);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure MNavigateComplete2(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure OnTimer(Sender: TObject);

  public
    { Public declarations }
  end;

var
  Form24: TForm24;

implementation

uses ncShellStart, uDMMoz;

{$R *.dfm}

procedure TForm24.Button1Click(Sender: TObject);
begin
//  M.Navigate('http://ad.nextar.com.br');
  M.Navigate('http://ad.yieldmanager.com/iframe3?RwQAAKTuCgCsrzwAAAAAAOLWDAAAAAAAAAAMAAEAAAAAAAsADAAFEVDREgAAAAAAUSsSAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADMmQUAAAAAAAIAAgAAAAAAhbacS3FVxT-FtpxLcVXFP4'+
             'W2nEtxVcU.hbacS3FVxT8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADmsVhBpD2PB5VIig0Qot.sZLKiX.Wc5ghmwkWgAAAAAA==,,http://ad.yieldmanager.com/st?ad_type=iframe&ad_size=120x600&section=716452');
//  M.Navigate('http://ad.yieldmanager.com/st?ad_type=iframe&ad_size=120x600&section=716452');
//  M2.Navigate('www.globo.com');
//  M.Navigate('www.globo.com');
end;

procedure TForm24.Button2Click(Sender: TObject);
begin
  M.ControlInterface.Quit;
end;

procedure TForm24.Button3Click(Sender: TObject);
begin
  M.Free;
  M := TMozillaBrowser.Create(Self);
  M.ParentWindow := Handle;
  M.Left := 130;
  M.Top := 10;
  M.Height := 650;
  M.Width := 130;
  M.BringToFront;
  M.Show;
  ShowWindow(M.HWND, SW_SHOW);
  ShowWindow(M.Handle, SW_SHOW);
end;

procedure TForm24.FormShow(Sender: TObject);
begin
  M.BringToFront;
end;

procedure TForm24.MBeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
  var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
  var Cancel: WordBool);
begin
  if ASender<>M then begin
    ShellStart(URL);
    Cancel := True;
  end;
end;

procedure TForm24.MNavigateComplete2(ASender: TObject; const pDisp: IDispatch;
  var URL: OleVariant);
begin
  Memo1.Lines.Add('NavigateComplete2 - ' + URL);
  Memo1.Lines.Add('URL: ' + M.LocationURL);
end;

procedure TForm24.MNewWindow2(ASender: TObject; var ppDisp: IDispatch;
  var Cancel: WordBool);
var Moz : TMozillaBrowser;  
begin
  ppDisp := M2.ControlInterface;
  M2.OnBeforeNavigate2 := MBeforeNavigate2;
  Cancel := False;
end;

procedure TForm24.OnTimer(Sender: TObject);
begin
end;

Initialization
  OleInitialize(nil);

Finalization
  OleUninitialize;

end.
