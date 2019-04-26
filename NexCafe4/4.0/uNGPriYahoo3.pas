unit uNGPriYahoo3;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls, Graphics, 
  Menus, ExtCtrls, AppBar, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton, ImgList,
  cxGraphics, dxBar, dxBarExtItems, cxClasses, OleCtrls, SHDocVw, SHDocVw_EWB,
  EmbeddedWB, pngimage, cxImage, cxBarEditItem, cxControls, cxContainer, cxEdit,
  cxLabel, cxTextEdit, cxStyles, LMDCustomComponent, LMDStarter, DdeMan;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    DocktoLeft1: TMenuItem;
    DocktoTop1: TMenuItem;
    DocktoRight1: TMenuItem;
    DocktoBottom1: TMenuItem;
    N1: TMenuItem;
    Undock1: TMenuItem;
    N2: TMenuItem;
    CloseAppBardemo1: TMenuItem;
    AppBar1: TAppBar;
    Timer1: TTimer;
    barMgr: TdxBarManager;
    barTop: TdxBar;
    panPri: TLMDSimplePanel;
    panBar: TLMDSimplePanel;
    cxBarEditItem1: TcxBarEditItem;
    panBusca: TLMDSimplePanel;
    lbClick: TcxLabel;
    lbQuery: TcxLabel;
    lbObtenha: TcxLabel;
    Timer2: TTimer;
    cmBuscar: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    im24: TcxImageList;
    dxBarLargeButton2: TdxBarLargeButton;
    cxStyle2: TcxStyle;
    dxBarStatic1: TdxBarStatic;
    edBusca: TcxBarEditItem;
    cxStyle3: TcxStyle;
    cmChat: TdxBarLargeButton;
    imOn: TImage;
    imOff: TImage;
    Image1: TImage;
    Timer3: TTimer;
    panIm: TLMDSimplePanel;
    Image2: TImage;
    cxLabel1: TcxLabel;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    dxBarSubItem4: TdxBarSubItem;
    dxBarSubItem5: TdxBarSubItem;
    cxStyle6: TcxStyle;
    LMDSimplePanel1: TLMDSimplePanel;
    bdcTop: TdxBarDockControl;
    LMDSimplePanel3: TLMDSimplePanel;
    Timer4: TTimer;
    cxStyle7: TcxStyle;
    lbHora: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    Image3: TImage;
    Starter: TLMDStarter;
    Timer5: TTimer;
    DDE: TDdeClientConv;
    Timer6: TTimer;
    lbBusca: TcxLabel;
    procedure DocktoLeft1Click(Sender: TObject);
    procedure DocktoTop1Click(Sender: TObject);
    procedure DocktoRight1Click(Sender: TObject);
    procedure DocktoBottom1Click(Sender: TObject);
    procedure Undock1Click(Sender: TObject);
    procedure CloseAppBardemo1Click(Sender: TObject);
    procedure AppBar1Unhiding(Sender: TObject;
      var AllowOperation: Boolean);
    procedure AppBar1Activate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LMDSpeedButton1Click(Sender: TObject);
    procedure cmSHClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure lbClickMouseEnter(Sender: TObject);
    procedure lbClickMouseLeave(Sender: TObject);
    procedure edBuscaEnter(Sender: TObject);
    procedure edBuscaExit(Sender: TObject);
    procedure edBuscaPropertiesChange(Sender: TObject);
    procedure cmChatClick(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure lbHoraClick(Sender: TObject);
    procedure cxLabel2MouseEnter(Sender: TObject);
    procedure cxLabel2MouseLeave(Sender: TObject);
    procedure cxLabel1Click(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure edBuscaCurChange(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer5Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
  private
    FInicio : Cardinal;
    FBuscando : Boolean;
    FBuf : PChar;
    FUrlAtual : String;
    FSL : TStrings;
    FPrim : Boolean;
    procedure SetUrlAtual(const Value: String);
    { Private declarations }
  public
    procedure ObtemSiteProg;
    property UrlAtual: String
      read FUrlAtual write SetUrlAtual;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses uSuperBanner, uWinPopUp, madCodeHook, ncAppUrlLog, ncClassesBase;

{$R *.DFM}

procedure TForm1.DocktoLeft1Click(Sender: TObject);
begin
  AppBar1.Placement := bpLeft;
end;

procedure TForm1.DocktoTop1Click(Sender: TObject);
begin
  AppBar1.Placement := bpTop;
end;

procedure TForm1.dxBarButton1Click(Sender: TObject);
begin
  Starter.Command := 'http://br.yahoo.com/?fr=fptb-msgr';
  Starter.Execute;
end;

procedure TForm1.dxBarLargeButton3Click(Sender: TObject);
begin
  Starter.Command := 'http://www.flickr.com';
  Starter.Execute;
end;

procedure TForm1.dxBarLargeButton4Click(Sender: TObject);
begin
  Starter.Command := 'https://login.yahoo.com/config/mail?&.src=ym&.intl=br';
  Starter.Execute;
end;

procedure TForm1.dxBarLargeButton5Click(Sender: TObject);
begin
  Starter.Command := 'http://br.answers.yahoo.com/';
  Starter.Execute;
end;

procedure TForm1.dxBarLargeButton6Click(Sender: TObject);
begin
  Starter.Command := 'http://br.yahoo.com/?fr=fptb-msgr';
  Starter.Execute;
end;

procedure TForm1.cmChatClick(Sender: TObject);
begin
  FormWinPopup.WinPopUp('', '', 0, 0, 5000, 0);
end;

procedure TForm1.cmSHClick(Sender: TObject);
var 
  S : String;
  I : Integer;
begin
  S := Trim(edBusca.EditValue);
  if S='' then Exit;
  for I := 1 to Length(S) do
    if S[I]=' ' then S[I]:='+';
  Starter.Command := 'http://br.search.yahoo.com/search?p='+S+'&searchsubmit=Buscar+na+web&fr=yfp&toggle=1&ei=UTF-8&rd=r1';
  try
    Starter.Execute;
  except
  end;
{    if AppBar1.Docking.Height=60 then begin
      AppBar1.Docking.Height := 30;
    end else begin
      AppBar1.Docking.Height := 60;
      edBusca.EditValue := 'gerenciador de lan house';
    end;}
end;

procedure TForm1.cxLabel1Click(Sender: TObject);
begin
  FreeAndNil(panIm);
end;

procedure TForm1.cxLabel2MouseEnter(Sender: TObject);
begin
  TcxLabel(Sender).Style.Color := $005C3E21;
end;

procedure TForm1.cxLabel2MouseLeave(Sender: TObject);
begin
  TcxLabel(Sender).Style.Color := clBackground;
end;

procedure TForm1.edBuscaCurChange(Sender: TObject);
begin
  cmSHClick(nil);
end;

procedure TForm1.edBuscaEnter(Sender: TObject);
begin
  FBuscando := True;
  with TcxBarEditItemControl(edBusca.CurItemLink.Control).Edit do begin
    StyleFocused.TextColor := clBlack;
    StyleFocused.TextStyle := [fsBold];
  end;
  cxStyle2.TextColor := clGray;
  cxStyle2.Font.Style := [fsBold];
  
  if edBusca.EditValue<>'' then
  if SameText('Busca na internet', edBusca.EditValue) then
    TcxBarEditItemControl(edBusca.CurItemLink.Control).Edit.EditValue := '';
end;

procedure TForm1.edBuscaExit(Sender: TObject);
begin
  Timer5.Enabled := True;
  if edBusca.EditValue='' then
    edBusca.EditValue := 'Busca na internet';
end;

procedure TForm1.edBuscaPropertiesChange(Sender: TObject);
begin
  TcxBarEditItemControl(edBusca.CurItemLink.Control).Edit.PostEditValue;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FPrim := True;
  GetMem(FBuf, 1024);
  FInicio := GetTickCount;
  FBuscando := False;
  FSL := TStringList.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeMem(FBuf, 1024);
  FSL.Free;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key=13) and FBuscando then 
    cmSHClick(nil);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Windows.SetParent(panIm.Handle, FindWindow('ProgMan', nil));
  panIm.Left := Screen.Width - panIm.Width;
  panIm.Top := (Screen.Height - panIm.Height) div 2;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  cmSHClick(nil);
  AppBar1.Docking.Height := 30;
end;

procedure TForm1.lbClickMouseEnter(Sender: TObject);
begin
  lbClick.Style.Color := clTeal;
  lbObtenha.Style.Color := clTeal;
  lbQuery.Style.Color := clTeal;
  panBusca.Color := clTeal;
end;

procedure TForm1.lbClickMouseLeave(Sender: TObject);
begin
  lbClick.Style.Color := clNavy;
  lbObtenha.Style.Color := clNavy;
  lbQuery.Style.Color := clNavy;
  panBusca.Color := clNavy;
end;

procedure TForm1.LMDSpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.ObtemSiteProg;
var 
  AlterouSite: Boolean;
  Site, Prog, S, aExe: String;
  H : HWND;
  ProcID : Cardinal;
begin
  Prog := '';
  Site := '';

  H := GetForegroundWindow;
  GetWindowText(H, FBuf, 255);
  Prog := FBuf;
  GetWindowThreadProcessId(H, ProcID);
  if ProcessIdToFileName(ProcID, FBuf) then
    aExe := LowerCase(FBuf) else
    aExe := '';
      
  AlterouSite := False;
  
  S := ExtractFileName(aExe);  
  if SameText(S, 'iexplore.exe') then begin
    try
      DDE.SetLink('IExplore', 'WWW_GetWindowInfo');
      if DDE.OpenLink then
      try
        S := DDE.RequestData( '0xFFFFFFFF, sURL, sTitle' );
        if S<>'' then begin
          Site := FormataSiteStr(S);
          AlterouSite := True;
        end;  
      finally
        DDE.CloseLink;
      end;
    except
    end;
  end else 
  if SameText(S, 'firefox.exe') then begin
    try
      DDE.SetLink('Firefox', 'WWW_GetWindowInfo');
      if DDE.OpenLink then
      try
        S := DDE.RequestData( '0xFFFFFFFF, sURL, sTitle' );
        if S<>'' then begin
          Site := FormataSiteStr(S);
          AlterouSite := True;
        end;  
      finally
        DDE.CloseLink;
      end;
    except
    end;
  end;
  UrlAtual := Site;
end;

procedure TForm1.SetUrlAtual(const Value: String);
var 
  U: TncUrlInfo;
  S: TncSearchInfo;
begin
  if Value=FUrlAtual then Exit;
  FUrlAtual := Value;
  ExtractUrlInfo(Value, U);
  ExtractSearchInfo(U.uiDominio, u.uiPagina, S);
  if (S.siEng<>'') and (S.siEng<>seYahoo) then begin
    if FSL.IndexOf(S.siArg) <> -1 then Exit;
    FSL.Add(S.siArg);
    lbQuery.Caption := '"'+S.siArg+'"';
    AppBar1.Docking.Height := 60;
    edBusca.EditValue := S.siArg;
  end;
end;

procedure TForm1.DocktoRight1Click(Sender: TObject);
begin
  AppBar1.Placement := bpRight;
end;

procedure TForm1.DocktoBottom1Click(Sender: TObject);
begin
  AppBar1.Placement := bpBottom;
end;

procedure TForm1.Undock1Click(Sender: TObject);
begin
  AppBar1.Placement := bpFloat;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.CloseAppBardemo1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.lbHoraClick(Sender: TObject);
begin
  Close;
end;

{ }

procedure TForm1.AppBar1Unhiding(Sender: TObject;
  var AllowOperation: Boolean);
begin
  AllowOperation := False;
  Timer1.Enabled := True;
end;

procedure TForm1.AppBar1Activate(Sender: TObject);
begin
  AppBar1.ShowHiddenAppBar(True);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if AppBar1.IsMouseOverAppBar then
    AppBar1.ShowHiddenAppBar(True);
  Timer1.Enabled := False;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if Image1.Tag=0 then begin
    Image1.Tag := 1;
    Image1.Picture.Assign(imOff.Picture);
  end
  else begin
    Image1.Tag := 0;
    Image1.Picture.Assign(imOn.Picture);
  end;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
  if FPrim then
    FormWinPopup.WB.Navigate(ExtractFilePath(ParamStr(0))+'tagyahoo.html') else
    FormWinPopup.WB.Refresh;
    
  FPrim := True;  
  Timer6.Enabled := True;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
begin
  lbHora.Caption := FormatDateTime('hh:mm:ss', (GetTickCount-FInicio)/1000/60/60/24) + ' ' + sLineBreak + 'R$ 1,00 ';
  if Assigned(panIm) then begin
    panIm.Left := Screen.Width - panIm.Width;
    panIm.Top := (Screen.Height - panIm.Height) div 2;
  end;
  Form2.Visible := True;
{  Timer3.Enabled := not Form2.Visible;}
  Timer3.Enabled := False;
  ObtemSiteProg;
end;

procedure TForm1.Timer5Timer(Sender: TObject);
begin
  Timer5.Enabled := False;
  FBuscando := False;
end;

procedure TForm1.Timer6Timer(Sender: TObject);
begin
  Timer6.Enabled := False;
  FormWinPopup.WinPopUp('', '', 0, 0, 12000, 0);
end;

end.
