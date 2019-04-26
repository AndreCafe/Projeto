unit uPrintManBaseClasses;

interface

uses
   ExtCtrls, SysUtils, Classes, Forms, Graphics, StdCtrls, uImagem, messages;

const
   kNaoImprimir = 'N Ã O   I M P R I M I R';
   //kPrintThumbsPanel = $00737373;
   kPrintThumbsPanel = clGray;
   kCarregando = 'Carregando...';
   kThumbSelectedColor = clSkyBlue;
   kPrintBmpsPanel = clGray;
   kBmpSelectedColor = clSkyBlue;
   kScrollPage       = 36;
   kMaxMsgRetry      = 20;
   kMsgRetrySleep    = 5;
   kMaxReadRetries   = 2;
   kFirstReadTimeout = 15000;
   kReadInterval     = 250;
   kStartLoadAtOnce  = 4;

   THMSG_Load                 = WM_USER + 11;

   THMSG_LoadBMP              = WM_USER + 30;

   THMSG_SetThumbCount        = WM_USER + 40;
   THMSG_SetThumbSizes        = WM_USER + 41;
   THMSG_ThumbLoad            = WM_USER + 43;

   THMSG_Repaginar            = WM_USER + 50;
type

  TLabel2 = class(TLabel)
  protected
    function getPageNum: integer;
  public
    property PageNum : integer read getPageNum;
    constructor Create(AOwner: TComponent); override;
  end;

  TPanel = class(ExtCtrls.TPanel)
  public
    property Canvas;
  end;

  TImagemPanel = class(TPanel)
    private
      fSelected : boolean;
    protected
      procedure SetSelected(value: boolean); virtual;
    public
      lb  : TLabel2;
      img : TImagem;
      PageNum : integer;
      bmpImagem  : TBitmap;
      procedure setSelectedInternal(value: boolean);
      property Selected : boolean read fSelected write SetSelected;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
  end;

  TPagePanel = class(TImagemPanel)
    private
      fNaoImprimir : boolean;
      procedure SetNaoImprimir(value: boolean);
    public
      bmpDeleted : TBitmap;
      procedure paintDeleted;
      property NaoImprimir : boolean read fNaoImprimir write SetNaoImprimir;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
  end;

  TThumbPanel = class(TImagemPanel)
    protected
      procedure SetSelected(value: boolean); override;
  end;

  TThumbPanelList = class(TList)
   protected
    function Get(Index: Integer): TThumbPanel;
    procedure Put(Index: Integer; Item: TThumbPanel);
   public
    procedure Clear; override;
    property Items[Index: Integer]: TThumbPanel read Get write Put; default;
    destructor Destroy; override;
  end;

  TPagePanelList = class(TList)
   protected
    function Get(Index: Integer): TPagePanel;
    procedure Put(Index: Integer; Item: TPagePanel);
   public
    procedure Clear; override;
    property Items[Index: Integer]: TPagePanel read Get write Put; default;
    destructor Destroy; override;
  end;

implementation

uses
   uPagesScrollBox,
  {$IFNDEF NOLOG}
   uLogs,
  {$ENDIF}
   uThumbsScrollBox;

{ TPagePanel }

constructor TPagePanel.Create(AOwner: TComponent);
begin
  inherited;
  bmpDeleted := nil;
end;

destructor TPagePanel.Destroy;
begin
  if bmpDeleted<>nil then bmpDeleted.Free;
  inherited;
end;

procedure TPagePanel.paintDeleted;
begin
      if bmpDeleted = nil then begin
          bmpDeleted := TBitmap.Create;
          bmpDeleted.PixelFormat := pf24bit;
          bmpDeleted.Transparent := false;
          bmpDeleted.Assign(bmpImagem);
          bmpDeleted.Canvas.CopyMode := cmSrcAnd;
          if parent<>nil then begin
              bmpDeleted.Canvas.Draw(0,0, TPagesScrollBox(Parent).ShadowBmp);
              bmpDeleted.Canvas.CopyMode := cmMergeCopy;
              bmpDeleted.Canvas.Draw(0,0, TPagesScrollBox(Parent).DontPrintBmp);
          end else begin
             {$IFNDEF NOLOG}GLog.Log(self,[lcExcept],'TPagePanel.paintDeleted  parent=nil '+inttostr(PageNum));{$ENDIF}
          end;
      end;
      img.Bitmap := bmpDeleted;
end;

procedure TPagePanel.SetNaoImprimir(value: boolean);
begin
    if (fNaoImprimir <> value) and
       (bmpImagem<>nil) then begin
        fNaoImprimir := value;
        if fNaoImprimir then begin
            paintDeleted;
            TPagesScrollBox(Parent).incNoPrintCount;
        end else begin
            img.Bitmap := bmpImagem;
            TPagesScrollBox(Parent).decNoPrintCount;
        end;
        TPagesScrollBox(Parent).doStatusChange(img.PageNum);
    end;

end;

{ TImagemPanel }

constructor TImagemPanel.Create(AOwner: TComponent);
begin
  inherited;
  bmpImagem := nil;
  img := TImagem.create(Self);
  lb  := TLabel2.create(Self);
end;

destructor TImagemPanel.Destroy;
begin
  if bmpImagem<>nil then bmpImagem.Free;
  //img.Bitmap := nil;
  img.free;
  lb.Free;
  inherited;
end;

procedure TImagemPanel.setSelectedInternal(value: boolean);
begin
    if value<>fSelected then begin
          fSelected := value;
          if (fSelected) then
             color := kThumbSelectedColor
          else
             color := kPrintThumbsPanel;
    end;
end;

procedure TImagemPanel.SetSelected(value: boolean);
begin
    if value<>fSelected then begin
          fSelected := value;
          if (fSelected) then begin
             color := kThumbSelectedColor;
             if (Self.Parent<>nil) then
                TScrollBox(Self.Parent).ScrollInView(self);
          end else begin
              color := kPrintThumbsPanel;
          end;
    end;
end;

{ TThumbPanel }

procedure TThumbPanel.SetSelected(value: boolean);
begin
    if value<>fSelected then begin
          fSelected := value;
          if (fSelected) then begin
             color := kThumbSelectedColor;
             TScrollBox(Self.Parent).ScrollInView(self);
             TScrollBox(Self.Parent).ScrollInView(lb);
          end else begin
              color := kPrintThumbsPanel;
          end;
    end;
end;

{ TLabel2 }

constructor TLabel2.Create(AOwner: TComponent);
begin
  inherited;
  Height := kLabelHeight;
end;

function TLabel2.getPageNum: integer;
begin
    result := TImagemPanel(owner).PageNum;
end;

{ TThumbPanelList }

destructor TThumbPanelList.Destroy;
begin
  Clear;
  inherited;
end;

procedure TThumbPanelList.Clear;
var
    i : integer;
begin
    for i:=count-1 downto 0 do
       Get(i).free;
    count := 0;
end;

function TThumbPanelList.Get(Index: Integer): TThumbPanel;
begin
    result := inherited Get(Index);
end;

procedure TThumbPanelList.Put(Index: Integer; Item: TThumbPanel);
begin
    inherited  Put(Index, Item);
end;


{ TPagePanelList }

procedure TPagePanelList.Clear;
var
    i : integer;
begin
    for i:=count-1 downto 0 do
       Get(i).free;
    count := 0;
end;

destructor TPagePanelList.Destroy;
begin
  Clear;
  inherited;
end;

function TPagePanelList.Get(Index: Integer): TPagePanel;
begin
    result := inherited Get(Index);
end;

procedure TPagePanelList.Put(Index: Integer; Item: TPagePanel);
begin
    inherited  Put(Index, Item);
end;

end.
