unit uFrmAguarde2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmComSombra, 
  cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, GIFImg, ExtCtrls, StdCtrls,
  cxPC, cxPCdxBarPopupMenu, cxContainer, cxEdit, cxLabel, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, Menus,
  cxButtons, LMDCustomScrollBox, LMDScrollBox, LMDPNGImage;

type
  TFrmAguarde2 = class(TFrmComSombra)
    panEtapa: TLMDSimplePanel;
    lbRevisar: TcxLabel;
    lbPreparar: TcxLabel;
    lbTipo: TcxLabel;
    Paginas: TcxPageControl;
    tsPreparar: TcxTabSheet;
    tsTipo: TcxTabSheet;
    tsConfRevisao: TcxTabSheet;
    Label1: TLabel;
    Image1: TImage;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    tsRevisao: TcxTabSheet;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel3: TLMDSimplePanel;
    Image3: TImage;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel1: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    Image2: TImage;
    cxLabel2: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    Image4: TImage;
    Image5: TImage;
    LMDSimplePanel4: TLMDSimplePanel;
    btnAvancar: TcxButton;
    panBtn: TLMDSimplePanel;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    btnAlteraTipo: TcxButton;
    LMDSimplePanel5: TLMDSimplePanel;
    LMDSimplePanel6: TLMDSimplePanel;
    btnVoltar: TcxButton;
    cxButton9: TcxButton;
    cxButton3: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tsPrepararClick(Sender: TObject);
    procedure tsTipoClick(Sender: TObject);
    procedure tsPrepararShow(Sender: TObject);
    procedure tsPrepararHide(Sender: TObject);
    procedure tsRevisaoShow(Sender: TObject);
    procedure tsTipoShow(Sender: TObject);
    procedure tsConfRevisaoShow(Sender: TObject);
    procedure tsRevisaoHide(Sender: TObject);
    procedure tsConfRevisaoHide(Sender: TObject);
    procedure lbTipoClick(Sender: TObject);
    procedure tsTipoHide(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure btnAlteraTipoClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAguarde2: TFrmAguarde2;

const
  eiPreparar    = 0;
  eiTipo        = 1;
  eiConfRevisao = 2;
  eiRevisar     = 3;

implementation

{$R *.dfm}

procedure TFrmAguarde2.tsConfRevisaoHide(Sender: TObject);
begin
  inherited;
  lbRevisar.Enabled := False;
  if Paginas.ActivePageIndex<2 then
    lbRevisar.Style.TextColor := clBlack;
end;

procedure TFrmAguarde2.tsConfRevisaoShow(Sender: TObject);
begin
  inherited;
  lbRevisar.Enabled := True;
  lbRevisar.Style.TextColor := clBlue;
end;

procedure TFrmAguarde2.tsPrepararClick(Sender: TObject);
begin
  inherited;
  Paginas.ActivePageIndex := 1;
end;

procedure TFrmAguarde2.tsPrepararHide(Sender: TObject);
begin
  inherited;
  (Image1.Picture.Graphic as TGIFImage).Animate := False;
  lbPreparar.Style.TextColor := clBlack;
  lbPreparar.Enabled := False;
//  lbPreparar.Visible := False;
end;

procedure TFrmAguarde2.tsPrepararShow(Sender: TObject);
begin
  inherited;
  (Image1.Picture.Graphic as TGIFImage).AnimationSpeed := 300;
  (Image1.Picture.Graphic as TGIFImage).Animate := True;
  Height := 460;
  Width := 500;
  Left := (Screen.DesktopWidth - Width) div 2;
  Top := (Screen.DesktopHeight - Height) div 2;
end;

procedure TFrmAguarde2.tsRevisaoHide(Sender: TObject);
begin
  inherited;
  Paginas.ActivePageIndex := 1;
  if Paginas.ActivePageIndex<2 then
    lbRevisar.Style.TextColor := clBlack;
end;

procedure TFrmAguarde2.tsRevisaoShow(Sender: TObject);
begin
  inherited;
//  lbTipo.Visible := False;

  lbTipo.Visible := False;
  lbPreparar.Visible := False;
  lbRevisar.Visible := False;

  lbRevisar.Enabled := True;
  lbRevisar.Style.TextColor := clBlue;
  lbRevisar.Style.TextStyle := [fsUnderline, fsBold];
//  lbRevisar.Visible := False;
  Left := 0;
  Top := 0;
  Width := Screen.Width;
  Height := Screen.Height;
end;

procedure TFrmAguarde2.tsTipoClick(Sender: TObject);
begin
  inherited;
  Paginas.ActivePageIndex := 2;
end;

procedure TFrmAguarde2.tsTipoHide(Sender: TObject);
begin
  inherited;
  lbTipo.Enabled := False;
//  lbTipo.Visible := False;
end;

procedure TFrmAguarde2.tsTipoShow(Sender: TObject);
begin
  inherited;
  lbTipo.Enabled := True;
  lbTipo.Style.TextColor := clBlue;
  Height := 460;
  Width := 500;
  Left := (Screen.DesktopWidth - Width) div 2;
  Top := (Screen.DesktopHeight - Height) div 2;
end;

procedure TFrmAguarde2.cxButton1Click(Sender: TObject);
begin
  inherited;
  Paginas.ActivePage := tsRevisao;
end;

procedure TFrmAguarde2.btnAlteraTipoClick(Sender: TObject);
begin
  inherited;
  Paginas.ActivePageIndex := 1;
end;

procedure TFrmAguarde2.btnAvancarClick(Sender: TObject);
begin
  inherited;
  Paginas.ActivePageIndex := 2;
end;

procedure TFrmAguarde2.btnVoltarClick(Sender: TObject);
begin
  inherited;
  Paginas.ActivePageIndex := 1;
end;

procedure TFrmAguarde2.cxButton4Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmAguarde2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFrmAguarde2.FormCreate(Sender: TObject);
begin
  inherited;
  Width := 500;
  Paginas.HideTabs := True;
  Paginas.ActivePageIndex := 0;
end;

procedure TFrmAguarde2.lbTipoClick(Sender: TObject);
begin
  inherited;
  Paginas.ActivePageIndex := 1;
end;

procedure TFrmAguarde2.PaginasChange(Sender: TObject);
begin
  inherited;
  panBtn.Visible := (Paginas.ActivePageIndex=3);
end;

end.
