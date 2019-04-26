unit ncgFrmConfigDesktop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StShlCtl, StdCtrls, ExtCtrls, SsBase, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel,
  LMDLabel, LMDCustomScrollBox, LMDScrollBox, lmdsplt, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDBaseGraphicButton,
  ncClassesBase,
  LMDCustomSpeedButton, LMDSpeedButton, LMDSimplePanel, IniFiles,
  LMDCustomSimpleLabel, LMDSimpleLabel, lmdcont, LMDCustomComponent,
  ImgList, cxEdit, cxLabel, cxContainer, cxCheckListBox, cxPC, cxControls,
  LMDCustomImageList, LMDBitmapList, pngimage, LMDPNGImage, ShlObj,
  cxShellCommon, cxShellTreeView, ShellLink, ShellControls, dxBar,
  cxClasses, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  cxPCdxBarPopupMenu;

type
  TFrmDesktop = class(TForm)
    Paginas: TcxPageControl;
    BarMgr: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BarMgrBar1: TdxBar;
    cmSalvar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbSalvarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure panSalvarMouseEnter(Sender: TObject);
    procedure panSalvarMouseExit(Sender: TObject);
  private
    FFirst : Boolean;
    { Private declarations }
  public

     function ConfiguraDesktop: Boolean;
    { Public declarations }
  end;

{  TnexShellItem = (siDesktop, siStartMenu);
  TnexShellUser = (suAll, suUser);

  TnexShellItemPanel = class
    sciTab        : TcxTabSheet;
    sciLabel      : TcxLabel;
    sciPan        : TLMDSimplePanel;
    sciTree       : Array[TnexShellUser] of TJamShellTree;

    constructor Create(aParent: TcxPageControl; aOwner: TComponent);

    procedure Load(aTipoAcesso: Integer);
    procedure Save(aTipoAcesso: Integer);
  end;

  TnexShellTipoAcesso = class
    fPaginas    : TcxPageControl;
    fTipoAcesso : Integer;
    fItems      : Array[TnexShellItem] of TnexShellItemPanel;

    constructor Create(aParent: TWinControl; aTipoAcesso: Integer; aOwner: TComponent);

    procedure Load;
    procedure Save;
  end;    }

var
  FrmDesktop: TFrmDesktop;

implementation

uses ncgFrmPri, ncgFrmShellFilter, ncgFrameShellFilter, ncDebug;

{$R *.dfm}

procedure TFrmDesktop.lbSalvarClick(Sender: TObject);
var I : Integer;
begin
  for I := 0 to Paginas.PageCount - 1 do 
    TFrmShellFilter(Paginas.Pages[I].Tag).Save;
  ModalResult := mrOk;
end;

procedure TFrmDesktop.panSalvarMouseEnter(Sender: TObject);
begin
  TLMDSimplePanel(Sender).Color := $009D7135;
end;

procedure TFrmDesktop.panSalvarMouseExit(Sender: TObject);
begin
  TLMDSimplePanel(Sender).Color := $0059401E;
end;

procedure TFrmDesktop.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TFrmDesktop.Button1Click(Sender: TObject);
begin
  Close;
end;

function TFrmDesktop.ConfiguraDesktop: Boolean;
begin
  ShowModal;
  Result := (ModalResult=mrOk);
end;

procedure TFrmDesktop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmDesktop.FormCreate(Sender: TObject);
begin
  FFirst := True;
end;

procedure TFrmDesktop.FormShow(Sender: TObject);
var 
  I : Integer;
  T : TcxTabSheet;
  F : TFrmShellFilter;
begin
  if not FFirst then Exit;
  FFirst := False;
  DebugMsg('FrmDesktop.FormShow 1');

  for I := 0 to gTiposAcesso.Count-1 do  begin
    T := TcxTabSheet.Create(Self);
    T.PageControl := Paginas;
    T.Caption := gTiposAcesso.Itens[I].Nome;
    T.TabVisible := True;

    F := TFrmShellFilter.Create(Self);
    F.panPri.Parent := T;
    F.Tag := gTiposAcesso.Itens[I].ID;
    F.Load;
    T.Tag := Integer(F);
  end;
  DebugMsg('FrmDesktop.FormShow 2');
end;

end.
