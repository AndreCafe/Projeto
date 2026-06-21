unit GoogleMap;

interface

uses
  Windows, Messages,Dialogs, SysUtils, Variants, Classes, Controls, Forms,
  ActiveX, OleCtrls, SHDocVw, MSHTML, StdCtrls, idoc, Automation,
  ActnList, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, ExtCtrls, Menus;

type
  // Augment TWebBrowser so we can implement IDocHostUIHandler::GetExternal

  TWebBrowser = class(SHDocVw.TWebBrowser, IDocHostUIHandler)
  private
    function GetHTMLWindow2: IHTMLWindow2;
    function GetDocument2: IHTMLDocument2;
  protected
    procedure Loaded; override;
    { IDocHostUIHandler }
    function EnableModeless(fEnable: Integer): HResult; stdcall;
    function FilterDataObject(const pDO: IDataObject; out ppDORet: IDataObject): HResult; stdcall;
    function GetDropTarget(const pDropTarget: IDropTarget; out ppDropTarget: IDropTarget): HResult; stdcall;
    function GetExternal(out ppDispatch: IDispatch): HResult; stdcall;
    function GetHostInfo(var pInfo: _DOCHOSTUIINFO): HResult; stdcall;
    function GetOptionKeyPath(out pchKey: PWideChar; dw: UINT): HResult; stdcall;
    function HideUI: HResult; stdcall;
    function OnDocWindowActivate(fActivate: Integer): HResult; stdcall;
    function OnFrameWindowActivate(fActivate: Integer): HResult; stdcall;
    function ResizeBorder(var prcBorder: tagRECT; const pUIWindow: IOleInPlaceUIWindow;
      fRameWindow: Integer): HResult; stdcall;
    function ShowContextMenu(dwID: UINT; ppt: PtagPOINT; const pcmdtReserved: IUnknown;
       const pdispReserved: IDispatch): HResult; stdcall;
    function ShowUI(dwID: UINT; const pActiveObject: IOleInPlaceActiveObject;
      const pCommandTarget: IOleCommandTarget; const pFrame: IOleInPlaceFrame;
      const pDoc: IOleInPlaceUIWindow): HResult; stdcall;
    function TranslateAccelerator(var lpmsg: tagMSG; var pguidCmdGroup: TGUID; nCmdID: UINT): HResult; stdcall;
    function TranslateUrl(dwTranslate: UINT; pchURLIn: PWideChar; out ppchURLOut: PWideChar): HResult; stdcall;
    function UpdateUI: HResult; stdcall;
  public
    procedure ExecJScript(const Script: string);
    property Document2: IHTMLDocument2 read GetDocument2;
    property HTMLWindow2: IHTMLWindow2 read GetHTMLWindow2;

    function ParentForm: TCustomForm;
  private
    FOWClass : TObjectWrapperClass;
  public
    property OWClass: TObjectWrapperClass read FOWClass write FOWClass;
  end;

  TFormWrapper = class(TObjectWrapper)
  private
    function Form: TCustomForm;
  published
    procedure Teste(S: String);
    procedure Popup(Carro: OleVariant);
    procedure NewZoom(ZoomLevel: OleVariant);
  end;

  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    ActionList1: TActionList;
    CreateMarkerAction: TAction;
    AddControlAction: TAction;
    PanMapAction: TAction;
    LMDSimplePanel1: TLMDSimplePanel;
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Timer1: TTimer;
    Button6: TButton;
    PopupMenu1: TPopupMenu;
    Dadosdoatendimento1: TMenuItem;
    Equipe1: TMenuItem;
    Enviarmensagemdetexto1: TMenuItem;
    Button7: TButton;
    procedure CreateMarkerActionExecute(Sender: TObject);
    procedure AddControlActionExecute(Sender: TObject);
    procedure PanMapActionExecute(Sender: TObject);
    procedure CreateMarkerActionUpdate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure WebBrowser1BeforeNavigate2(ASender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure WebBrowser1DocumentComplete(ASender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure Timer1Timer(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
    FMarker : OleVariant;
    FPos : Integer;
  public
  published
    procedure Teste2;
    
    procedure MostraMsg(S: String);

    property Marker: OleVariant
      read FMarker write FMarker;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses ComObj, UrlMon, Unit2, uForm2;

const
  HTMLURL = 'file:///C:/site/googlemap.htm';
  IconesPath = 'file:///C:/site/maps/';

(*

  Below is the HTML document necessary for this example. For the example,
  this markup is retrieved from the above URL. Be sure to
  replace the text <YOUR GOOGLE MAP KEY GOES HERE> with your key:

<html>
  <head>
      <style type="text/css">
      * { margin: 0px; }
      </style>
    <script src="http://maps.google.com/maps?file=api&v=2.x&key=<YOUR GOOGLE MAP KEY GOES HERE>" type="text/javascript"></script>
    <script type="text/javascript">
    //<![CDATA[
    var map;

    function addControl(ctrlType) {
      switch(ctrlType)
      {
      case 1:
        map.addControl(new GSmallMapControl())
        break
      case 2:
        map.addControl(new GMapTypeControl());
        break
      }
    }

    function createMapMarker(lat, lng, html) {
      var point = new GLatLng(parseFloat(lat),parseFloat(lng));
      var marker = new GMarker(point);
      GEvent.addListener(marker, "click", function() {
      external.Caption = 'Hello from Javascript';
      });
      map.addOverlay(marker);
      return marker;
    }

    function load_map(id, lat, lng, zoom) {
      if (GBrowserIsCompatible()) {
        map = new GMap2(document.getElementById(id));
        var point = new GLatLng(parseFloat(lat),parseFloat(lng));
        map.setCenter(point, zoom);
       }
       else {
         alert("Sorry, the Google Maps API is not compatible with this browser");
       }
    }
    //]]>
    </script>
  </head>
  <body onunload="GUnload()">
    <div id="skypark" style="width: 500px; height: 500px;"></div>
    <script type="text/javascript">
    setTimeout("load_IEmap('skypark',37.0517349243164,-122.031608581543,11)", 500);
    </script>
  </body>
  <!--[if gte IE 6]>
  <script type="text/javascript">
  //<![CDATA[
  function load_IEmap(id, lat, lng, zoom) {
  load_map(id, lat, lng, zoom);
  }
  //]]>
  </script>
  <![endif]-->
</html>
*)

{ TWebBrowser }

function TWebBrowser.EnableModeless(fEnable: Integer): HResult;
begin
  Result := E_NOTIMPL;
end;

procedure TWebBrowser.ExecJScript(const Script: string);
begin
  HTMLWindow2.execScript(Script, 'JavaScript');
end;

function TWebBrowser.FilterDataObject(const pDO: IDataObject;
  out ppDORet: IDataObject): HResult;
begin
  Result := E_NOTIMPL;
end;

function TWebBrowser.GetDocument2: IHTMLDocument2;
begin
  Supports(Document, IHTMLDocument2, Result);
end;

function TWebBrowser.GetDropTarget(const pDropTarget: IDropTarget;
  out ppDropTarget: IDropTarget): HResult;
begin
  Result := E_NOTIMPL;
end;

function TWebBrowser.GetExternal(out ppDispatch: IDispatch): HResult;
begin
  ppDispatch := TAutoObjectDispatch.Create(OWClass.Connect(ParentForm)) as IDispatch;
  Result := S_OK;
end;

const
  // Constants from mshtmhst.h
  DOCHOSTUIFLAG_DIALOG    = $1;
  DOCHOSTUIFLAG_DISABLE_HELP_MENU = $2;
  DOCHOSTUIFLAG_NO3DBORDER        = $4;
  DOCHOSTUIFLAG_SCROLL_NO = $8;
  DOCHOSTUIFLAG_DISABLE_SCRIPT_INACTIVE   = $10;
  DOCHOSTUIFLAG_OPENNEWWIN        = $20;
  DOCHOSTUIFLAG_DISABLE_OFFSCREEN = $40;
  DOCHOSTUIFLAG_FLAT_SCROLLBAR    = $80;
  DOCHOSTUIFLAG_DIV_BLOCKDEFAULT  = $100;
  DOCHOSTUIFLAG_ACTIVATE_CLIENTHIT_ONLY   = $200;
  DOCHOSTUIFLAG_OVERRIDEBEHAVIORFACTORY   = $400;
  DOCHOSTUIFLAG_CODEPAGELINKEDFONTS       = $800;
  DOCHOSTUIFLAG_URL_ENCODING_DISABLE_UTF8 = $1000;
  DOCHOSTUIFLAG_URL_ENCODING_ENABLE_UTF8  = $2000;
  DOCHOSTUIFLAG_ENABLE_FORMS_AUTOCOMPLETE = $4000;
  DOCHOSTUIFLAG_ENABLE_INPLACE_NAVIGATION = $10000;
  DOCHOSTUIFLAG_IME_ENABLE_RECONVERSION   = $20000;
  DOCHOSTUIFLAG_THEME     = $40000;
  DOCHOSTUIFLAG_NOTHEME   = $80000;
  DOCHOSTUIFLAG_NOPICS    = $100000;
  DOCHOSTUIFLAG_NO3DOUTERBORDER   = $200000;
  DOCHOSTUIFLAG_DISABLE_EDIT_NS_FIXUP	= $400000;
  DOCHOSTUIFLAG_LOCAL_MACHINE_ACCESS_CHECK	= $800000;
  DOCHOSTUIFLAG_DISABLE_UNTRUSTEDPROTOCOL	= $1000000;
  DOCHOSTUIFLAG_ENABLE_ACTIVEX_BLOCK_MODE = $2000000;
  DOCHOSTUIFLAG_ENABLE_ACTIVEX_PROMPT_MODE = $4000000;
  DOCHOSTUIFLAG_ENABLE_ACTIVEX_DEFAULT_MODE = $8000000;

function TWebBrowser.GetHostInfo(var pInfo: _DOCHOSTUIINFO): HResult;
begin
  FillChar(pInfo, SizeOf(pInfo), 0);
  pInfo.cbSize := SizeOf(_DOCHOSTUIINFO);
  pInfo.dwFlags := DOCHOSTUIFLAG_SCROLL_NO or DOCHOSTUIFLAG_NO3DBORDER or DOCHOSTUIFLAG_ENABLE_FORMS_AUTOCOMPLETE or DOCHOSTUIFLAG_THEME;
  pInfo.dwDoubleClick := 0;
  Result := S_OK;
end;

function TWebBrowser.GetHTMLWindow2: IHTMLWindow2;
begin
  Result := Document2.parentWindow;
end;

function TWebBrowser.GetOptionKeyPath(out pchKey: PWideChar; dw: UINT): HResult;
begin
  Result := E_NOTIMPL;
end;

function TWebBrowser.HideUI: HResult;
begin
  Result := E_NOTIMPL;
end;

procedure TWebBrowser.Loaded;
begin
  inherited;
  Navigate(HTMLURL);
end;

function TWebBrowser.OnDocWindowActivate(fActivate: Integer): HResult;
begin
  Result := E_NOTIMPL;
end;

function TWebBrowser.OnFrameWindowActivate(fActivate: Integer): HResult;
begin
  Result := E_NOTIMPL;
end;

function TWebBrowser.ParentForm: TCustomForm;
begin
  Result := TCustomForm(TWinControl(Self).Parent);
end;

function TWebBrowser.ResizeBorder(var prcBorder: tagRECT;
  const pUIWindow: IOleInPlaceUIWindow; fRameWindow: Integer): HResult;
begin
  Result := S_OK;
end;

function TWebBrowser.ShowContextMenu(dwID: UINT; ppt: PtagPOINT;
  const pcmdtReserved: IInterface; const pdispReserved: IDispatch): HResult;
begin
  Result := E_NOTIMPL;
end;

function TWebBrowser.ShowUI(dwID: UINT;
  const pActiveObject: IOleInPlaceActiveObject;
  const pCommandTarget: IOleCommandTarget; const pFrame: IOleInPlaceFrame;
  const pDoc: IOleInPlaceUIWindow): HResult;
begin
  Result := S_FALSE;
end;

function TWebBrowser.TranslateAccelerator(var lpmsg: tagMSG;
  var pguidCmdGroup: TGUID; nCmdID: UINT): HResult;
begin
  Result := E_NOTIMPL;
end;

function TWebBrowser.TranslateUrl(dwTranslate: UINT; pchURLIn: PWideChar;
  out ppchURLOut: PWideChar): HResult;
begin
  ppchURLOut := nil;
  Result := S_FALSE;
end;

function TWebBrowser.UpdateUI: HResult;
begin
  Result := S_FALSE;
end;

procedure TForm1.AddControlActionExecute(Sender: TObject);
begin
  WebBrowser1.ExecJScript('addControl(1);');
  WebBrowser1.ExecJScript('addControl(2);');
  WebBrowser1.ExecJScript('addControl(3);');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Teste2;
//  WebBrowser1.ExecJScript('external.Teste2;');
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  FPos := FPos + 30;
  if FPos>330 then FPos := 0;
  
  WebBrowser1.ExecJScript(
    'var point = new GLatLng(-13.01,-38.475778)'+sLineBreak+
//    'var marker = GMarker(external.Marker)'+sLineBreak+
    'savemarker = external.Marker;'+slinebreak+
    'savemarker.setImage("'+IconesPath+'carro_vermelho'+IntToStr(FPos)+'.png");');
//    'savemarker.setLatLng(point);');
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if Button6.Tag=0 then begin
    WebBrowser1.ExecJScript(
      'external.Marker.hide();');
{      'savemarker = external.Marker;'+slinebreak+
      'savemarker.hide();');}
    Button6.Tag := 1;
  end else begin
    WebBrowser1.ExecJScript(
      'external.Marker.show();');
{      'savemarker = external.Marker;'+slinebreak+
      'savemarker.show();');}
    Button6.Tag := 0;
  end;

  
   
end;

procedure TForm1.Button7Click(Sender: TObject);
var SL : TStrings;
begin
  SL := TStringList.Create;
  try
    SL.Add('map.removeOverlay(external.Marker);');
//    SL.Add('map.addOverlay(marker);');
    WebBrowser1.HTMLWindow2.execScript(SL.Text, 'JavaScript');
  finally
    SL.Free;
  end;
end;

procedure TForm1.CreateMarkerActionExecute(Sender: TObject);
var SL : TStrings;
begin
  SL := TStringList.Create;
  try
    SL.Add('var point = new GLatLng(-13.013869,-38.485778);');
    SL.Add('var icone = new GIcon();');
    SL.Add('icone.image = "'+IconesPath+'carro_amarelo330.png";');
    SL.Add('icone.iconSize = new GSize(24,24);');
    SL.Add('icone.iconAnchor = new GPoint(9, 34);');
    SL.Add('icone.infoWindowAnchor = new GPoint(9, 2);');
    SL.Add('icone.infoShadowAnchor = new GPoint(18, 25);');
//    SL.Add('markerOptions = { icon:icone };');
    SL.Add('opts = {"icon": icone, "clickable": true, "labelText": "171", "labelOffset": new GSize(0, -25)};');
    SL.Add('var marker = new GMarker(point, opts);');
//    SL.Add('var marker = new GMarker(point, markerOptions);');
    SL.Add('GEvent.addListener(marker, "SingleRightClick", function() {');
    SL.Add('external.Popup(1);})');
    SL.Add('external.Marker = marker;');
    SL.Add('map.addOverlay(marker);');
    WebBrowser1.HTMLWindow2.execScript(SL.Text, 'JavaScript');
    Button2.Click;
    Button3.Click;
  finally
    SL.Free;
  end;
end;

procedure TForm1.CreateMarkerActionUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (WebBrowser1.Document2 <> nil) and (WebBrowser1.Document2.readyState = 'complete');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FPos := 0;
end;

procedure TForm1.MostraMsg(S: String);
begin
  ShowMessage(S);
end;

procedure TForm1.PanMapActionExecute(Sender: TObject);
begin
  WebBrowser1.ExecJScript('map.panTo(new GLatLng(-13.0139, -38.4858));');
end;

procedure TForm1.Teste2;
begin
  MostraMsg('agora sim 2');
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  WebBrowser1.ExecJScript(
    'map.enableScrollWheelZoom();'+slinebreak+
    'GEvent.addListener(map,"zoomend", function(oldLevel,newLevel) {'+sLineBreak+
    'external.NewZoom(newLevel);});'+sLineBreak+
    'external.NewZoom(map.getZoom());'+sLineBreak+
    'GEvent.addListener(map,"singlerightclick", function(a,b,overlay) {'+sLineBreak+
    'if (overlay) {if (overlay instanceof GMarker) {'+
    'GEvent.trigger(overlay,"SingleRightClick");}}});');
end;

procedure TForm1.WebBrowser1BeforeNavigate2(ASender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
begin
  WebBrowser1.OWClass := TFormWrapper;
end;

procedure TForm1.WebBrowser1DocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  Timer1.Enabled := True;
end;

{ TFormWrapper }

{procedure TFormWrapper.SetCaption(S: String);
begin
  Form.Caption := S;
end;

procedure TFormWrapper.Teste;
begin
  TForm1(Form).MostraMsg('Agora sim');
end;}

function TFormWrapper.Form: TCustomForm;
begin
  Result := TCustomForm(FObject);
end;

{function TFormWrapper.GetCaption: string;
begin
  Result := Form.Caption;
end;}

procedure TFormWrapper.NewZoom(ZoomLevel: OleVariant);
var I: Integer;
begin
  I := ZoomLevel;
  Form.Caption := IntToStr(I);
end;

procedure TFormWrapper.Popup(Carro: OleVariant);
var P : TPoint;
begin
  with TForm1(Form) do begin
    GetCursorPos(P);
//    P := WebBrowser1.ClientToScreen(P);
    PopupMenu1.Popup(P.X, P.Y);
  end;
end;

procedure TFormWrapper.Teste(S: String);
begin
  TForm1(Form).MostraMsg(S);
end;

end.

  
