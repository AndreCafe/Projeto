unit ncaWebBanner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw_EWB, EwbCore, Automation, EmbeddedWB, ncBaseWebApi, ExtCtrls,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel;

type
  TncBannerWebApi = class;

  TncBannerData = record
    bdPosicao : Byte;
    bdVisible : Boolean;
    bdTamanho : Integer;
    bdUrl     : String;
  end;
  
  TFrmWebBanner = class(TForm)
    TimerErro: TTimer;
    panBanner: TLMDSimplePanel;
    WB: TEmbeddedWB;
    procedure WBGetExternal(Sender: TCustomEmbeddedWB;
      var ppDispatch: IDispatch);
    procedure TimerErroTimer(Sender: TObject);
    procedure WBNavigateError(ASender: TObject; const pDisp: IDispatch; var URL,
      Frame, StatusCode: OleVariant; var Cancel: WordBool);
    function WBShowMessage(Sender: TObject; HWND: Cardinal; lpstrText,
      lpstrCaption: PWideChar; dwType: Integer; lpstrHelpFile: PWideChar;
      dwHelpContext: Integer; var plResult: Integer): HRESULT;
    procedure WBDocumentComplete(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure FormCreate(Sender: TObject);
  private
    function GetPosicao: Byte;
    procedure SetPosicao(const Value: Byte);
    procedure SetPanelVisible(const Value: Boolean);
    procedure SetPanelSize(const Value: Integer);
    { Private declarations }
  protected  
    function CreateApi: TncBannerWebApi; virtual; 

    procedure OnTimerPanelClose(Sender: TObject);
    procedure OnTimerNavigate(Sender: TObject);

    procedure _Navigate;
  public
    URL : String;

    FPanelSize: Integer;
    FPanelVisible: Boolean;

    procedure Init(BD: TncBannerData; aParent: TWinControl);

    procedure Navigate;

    procedure ResizeBanner;

    procedure panelClose;

    property Posicao: Byte
      read GetPosicao write SetPosicao;

    property PanelSize: Integer
      read FPanelSize write SetPanelSize;  

    property PanelVisible: Boolean
      read FPanelVisible write SetPanelVisible;  
    { Public declarations }
  end;

  TncBannerWebApi = class ( TncBaseWebApi )
  published
    function panelSize(const aPixels: OleVariant): OleVariant; virtual;
    function panelVisible(const aVisible: OleVariant): OleVariant; virtual;
    function panelClose: OleVariant; virtual;
  end;

  TncWebBanners = class
  private
    FForm    : TForm;
    FBanners : Array[0..3] of TFrmWebBanner;

    FLastLoad: String;

    function GetBannerByPosicao(aPosicao: Byte): TFrmWebBanner;
  public
    constructor Create(aForm: TForm);

    destructor Destroy; override;

    procedure LoadBanners(aBannersStr: String);

    procedure Resize;

    procedure InitBanner(BD: TncBannerData);
    procedure DeleteBanner(aPos: Byte);
  end;

var
  FrmWebBanner: TFrmWebBanner;
  gWebBanners : TncWebBanners = nil;

implementation

uses ncClassesBase;

{$R *.dfm}

function LoadBannerData(S: String; var BD: TncBannerData): Boolean;
var 
  sl : TStrings;
begin
  sl := SplitParams(S);
  try
    BD.bdPosicao := StrToIntDef(sl.Values['pos'], 99);
    BD.bdVisible := (sl.Values['vis']='1');
    BD.bdTamanho := StrToIntdef(sl.Values['tam'], 0);
    BD.bdUrl     := RemoveAspas(sl.Values['url']);

    Result := (BD.bdPosicao in [0..3]) and (BD.bdTamanho>0) and (BD.bdUrl>'');
  finally
    sl.Free;
  end;
end;

function TFrmWebBanner.CreateApi: TncBannerWebApi;
begin
  Result := TncBannerWebApi.Create(Self, WB);
end;

procedure TFrmWebBanner.FormCreate(Sender: TObject);
begin
  FPanelSize := 0;
  FPanelVisible := False;
end;

function TFrmWebBanner.GetPosicao: Byte;
begin
  case panBanner.Align of
    alRight : Result := 1;
    alBottom : Result := 2;
    alLeft : Result := 3;
  else
    Result := 0;
  end;
end;

procedure TFrmWebBanner.Init(BD: TncBannerData; aParent: TWinControl);
begin
  Posicao := BD.bdPosicao;
  panelSize := BD.bdTamanho;
  panelVisible := BD.bdVisible;
  URL := BD.bdURL;
  panBanner.Parent := aParent;
  Navigate;
end;

procedure TFrmWebBanner.Navigate;
begin
  with TTimer.Create(Self) do begin
    Interval := 50;
    OnTimer := Self.OnTimerNavigate;
    Enabled := True;
  end;
end;

procedure TFrmWebBanner.ResizeBanner;
begin
  WB.Left := 0;
  WB.Top := 0;
  if FPanelVisible then begin
    panBanner.Height := panelSize;
    panBanner.Width  := panelSize;
    WB.Width := panBanner.Parent.Width;
    WB.Height := panBanner.Parent.Height;
  end else begin
    panBanner.Height := 1;
    panBanner.Width := 1;
    WB.Width := 1;
    WB.Height := 1;
  end;
end;

procedure TFrmWebBanner.OnTimerNavigate(Sender: TObject);
begin
  try
    Sender.Free;
  finally
    _Navigate;
  end;
end;

procedure TFrmWebBanner.OnTimerPanelClose(Sender: TObject);
begin
  try
    Sender.Free;
  finally
    gWebBanners.DeleteBanner(Posicao);
  end;
end;

procedure TFrmWebBanner.panelClose;
begin
  with TTimer.Create(Self) do begin
    OnTimer := OnTimerPanelClose;
    Interval := 100;
    Enabled := True;
  end;
end;

procedure TFrmWebBanner.SetPanelSize(const Value: Integer);
begin
  if FPanelSize<>Value then begin
    FPanelSize := Value;
    ResizeBanner;
  end;
end;

procedure TFrmWebBanner.SetPanelVisible(const Value: Boolean);
begin
  FPanelVisible := Value;
  ResizeBanner;
end;

procedure TFrmWebBanner.SetPosicao(const Value: Byte);
begin
  case Value of
    1 : panBanner.Align := alRight;
    2 : panBanner.Align := alBottom;
    3 : panBanner.Align := alLeft;
  else
    panBanner.Align := alTop; 
  end;
end;

procedure TFrmWebBanner.TimerErroTimer(Sender: TObject);
begin
  TimerErro.Enabled := False;
  Navigate;
end;


function ColorToHtml(DColor:TColor):string;
var
  tmpRGB : TColorRef;
begin
  tmpRGB := ColorToRGB(DColor) ;
  Result:=Format('#%.2x%.2x%.2x',
                 [GetRValue(tmpRGB),
                  GetGValue(tmpRGB),
                  GetBValue(tmpRGB)]) ;
end; 

procedure TFrmWebBanner.WBDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
    try
//      wbBottom.OleObject.Document.Body.Style.Margin := '0';
      WB.OleObject.Document.Body.BgColor := ColorToHtml(clBtnFace);
    except
    end;
end;

procedure TFrmWebBanner.WBGetExternal(Sender: TCustomEmbeddedWB;
  var ppDispatch: IDispatch);
begin
  ppDispatch := TAutoObjectDispatch.Create(CreateApi) as IDispatch;
end;

procedure TFrmWebBanner.WBNavigateError(ASender: TObject;
  const pDisp: IDispatch; var URL, Frame, StatusCode: OleVariant;
  var Cancel: WordBool);
begin
  Cancel := True;
  TimerErro.Enabled := True;
end;

function TFrmWebBanner.WBShowMessage(Sender: TObject; HWND: Cardinal; lpstrText,
  lpstrCaption: PWideChar; dwType: Integer; lpstrHelpFile: PWideChar;
  dwHelpContext: Integer; var plResult: Integer): HRESULT;
begin
  ShowMessage(lpstrText);
end;

procedure TFrmWebBanner._Navigate;
begin
  WB.Navigate(URL);
end;

{ TncBannerWebApi }

function TncBannerWebApi.panelClose: OleVariant;
begin
  TFrmWebBanner(Form).panelClose;
end;

function TncBannerWebApi.panelSize(const aPixels: OleVariant): OleVariant;
begin
  TFrmWebBanner(Form).panelSize := aPixels;
end;

function TncBannerWebApi.panelVisible(const aVisible: OleVariant): OleVariant;
begin
  TFrmWebBanner(Form).panelVisible := aVisible;
end;

{ TncWebBanners }

constructor TncWebBanners.Create(aForm: TForm);
begin
  FForm := aForm;
  FLastLoad := '';
  FBanners[0] := nil;
  FBanners[1] := nil;
  FBanners[2] := nil;
  FBanners[3] := nil;
end;

procedure TncWebBanners.DeleteBanner(aPos: Byte);
var B : TFrmWebBanner;
begin
  B := GetBannerByPosicao(aPos);
  if B<>nil then begin
    FBanners[B.Posicao] := nil;
    B.Free;
  end;
end;

destructor TncWebBanners.Destroy;
begin
  if Assigned(FBanners[0]) then FreeAndNil(FBanners[0]);
  if Assigned(FBanners[1]) then FreeAndNil(FBanners[1]);
  if Assigned(FBanners[2]) then FreeAndNil(FBanners[2]);
  if Assigned(FBanners[3]) then FreeAndNil(FBanners[3]);
  
  inherited;
end;

function TncWebBanners.GetBannerByPosicao(aPosicao: Byte): TFrmWebBanner;
begin
  Result := FBanners[aPosicao];
end;

procedure TncWebBanners.InitBanner(BD: TncBannerData);
var B : TFrmWebBanner;
begin
  B := FBanners[BD.bdPosicao];
  if Assigned(B) then begin
    if BD.bdVisible and (not B.panelVisible) then B.PanelVisible := True;
    B.PanelSize := BD.bdTamanho;
    if B.URL<>BD.bdURL then begin
      B.URL := BD.bdUrl;
      B.PanelVisible := BD.bdVisible;
      B.Navigate;
    end;
  end else begin
    B := TFrmWebBanner.Create(FForm);
    FBanners[BD.bdPosicao] := B;
    B.Init(BD, FForm);
  end;
end;

function SplitBanners(S: String) : TStrings;
var P : Integer;

function GetPos: Boolean;
begin
  P := Pos('[', S);
  Result := (P>0);
end;

begin
  Result := TStringList.Create;
  while GetPos do begin
    Delete(S, 1, P);
    P := Pos(']', S);
    if P>0 then begin
      Result.Add(Copy(S, 1, P-1));
      Delete(S, 1, P);
    end else 
      S := '';
  end;
end;

procedure TncWebBanners.LoadBanners(aBannersStr: String);
var 
  sl : TStrings;
  A  : Array of TncBannerData;
  BD : TncBannerData;
  i, T  : Integer;

function FindBannerData(aPos: Byte): Boolean;
var k: integer;
begin
  for k := 0 to Length(A) - 1 do
    if A[k].bdPosicao=aPos then begin
      Result := True;
      Exit;
    end;
  Result := False;
end;  

begin
  SetLength(A, 0);
  T := 0;
  sl := SplitBanners(aBannersStr);
  try
    for I := 0 to sl.Count - 1 do
      if LoadBannerData(sl[i], BD) then begin
        Inc(T);
        SetLength(A, T);
        A[T-1].bdPosicao := BD.bdPosicao;
        A[T-1].bdVisible := BD.bdVisible;
        A[T-1].bdTamanho := BD.bdTamanho;
        A[T-1].bdUrl     := BD.bdUrl;
      end;

    for I := 0 to T-1 do InitBanner(A[I]);

    for I := 0 to 3 do if not FindBannerData(I) then DeleteBanner(I);
       
  finally
    sl.Free;
  end;
  

end;

procedure TncWebBanners.Resize;
var I: Integer;
begin
  for I := 0 to 3 do if FBanners[I]<>nil then
    FBanners[I].ResizeBanner;
end;

end.
