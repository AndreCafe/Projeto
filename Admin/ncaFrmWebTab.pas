unit ncaFrmWebTab;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaPlusAPI, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxHyperLinkEdit, dxBar, cxBarEditItem, cxClasses,
  OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, cxPC, cxStyles, cxPCdxBarPopupMenu;

type
  TFrmWebTab = class(TFrmPlus)
    BarMgr: TdxBarManager;
    barToolbar: TdxBar;
    cmVoltar: TdxBarLargeButton;
    cmAvancar: TdxBarLargeButton;
    cmRefresh: TdxBarLargeButton;
    cmURL: TcxBarEditItem;
    BDC: TdxBarDockControl;
    cmCancelarAdesao: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure cmVoltarClick(Sender: TObject);
    procedure cmAvancarClick(Sender: TObject);
    procedure cmRefreshClick(Sender: TObject);
    procedure WBDocumentComplete(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure cmCancelarAdesaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  protected
    function GetFullURL : String; override;
    function URLaddparams(aURL: String): string; override;
  public
    FontBold : Boolean;
    FontCor : TColor;
    paramConta : Boolean;
    paramAdmin : Boolean;
    paramSessao : Boolean;
    showAddress : Boolean;
    showToolbar : Boolean;
    Navegou     : Boolean;
    showURL     : Byte;   

    procedure RefreshParams;
    procedure NavegaURL; override;

    procedure showCancelar(aCaption: String); override;
    procedure hideCancelar; override;
    
  published
    procedure Center; override;
    procedure setSize(aWidth, aHeight: OleVariant); override;
    procedure setPosition(aX, aY: OleVariant); override;
    procedure Maximizar; override;
    procedure Fechar; override;
  end;

var
  FrmWebTab: TFrmWebTab;

const
  suNao   = 0;
  suBase  = 1;
  suFull  = 2;
  suAtual = 3;  
  

implementation

uses ncClassesBase, ncaDM, ufmImagens;

{$R *.dfm}

procedure TFrmWebTab.Center;
begin
end;

procedure TFrmWebTab.Fechar;
begin
end;

procedure TFrmWebTab.FormCreate(Sender: TObject);
begin
  inherited;
  Navegou := False;
  paramSessao := True;
  paramAdmin := False;
  paramConta := False;
end;

procedure TFrmWebTab.cmAvancarClick(Sender: TObject);
begin
  inherited;
  WB.GoForward;
end;

procedure TFrmWebTab.cmCancelarAdesaoClick(Sender: TObject);
begin
  inherited;
  WB.Navigate(FadesaoURLCancelar);
  hideCancelar;
end;

procedure TFrmWebTab.cmRefreshClick(Sender: TObject);
begin
  inherited;
  NavegaURL;
end;

procedure TFrmWebTab.cmVoltarClick(Sender: TObject);
begin
  inherited;
  WB.GoBack;
end;

function TFrmWebTab.GetFullURL: String;
begin
{  if pos('plus.nexcafe.com.br', URL)>0 then
    Result := URLaddparams('http://plus.dev.nexcafe.com.br/') else
    Result :=} 
  Result := URLaddparams(FURL);
end;

procedure TFrmWebTab.hideCancelar;
begin
  inherited;
  FadesaoFechar := False;
  cmCancelarAdesao.Visible := ivNever;
end;

procedure TFrmWebTab.Maximizar;
begin
end;

procedure TFrmWebTab.NavegaURL;
begin
  RefreshParams;
  inherited;
end;

procedure TFrmWebTab.RefreshParams;
begin
  BDC.Visible := showToolbar;
  case showURL of
    suBase : begin
      cmURL.Visible := ivAlways;
      cmURL.EditValue := URL;
    end;
    suFull, suAtual : begin
      cmURL.Visible := ivAlways;
      cmURL.EditValue := GetFullURL;
    end;
  else
    cmURL.Visible := ivNever;
  end;
end;

procedure TFrmWebTab.setPosition(aX, aY: OleVariant);
begin
end;

procedure TFrmWebTab.setSize(aWidth, aHeight: OleVariant);
begin
end;

procedure TFrmWebTab.showCancelar(aCaption: String);
begin
  inherited;
  cmCancelarAdesao.Visible := ivAlways;
  cmCancelarAdesao.Caption := aCaption;
end;

function TFrmWebTab.URLaddparams(aURL: String): string;
begin
  Result := aURL;
  if paramConta then
    addurlpar(Result, 'conta', gConfig.Conta); // do not localize

  if paramAdmin then
    addurlpar(Result, 'adm', BoolStr[Dados.CM.UA.Admin]); // do not localize

  if paramSessao then
    addurlpar(Result,  'idsessaonex', FIDsessao); // do not localize
end;

procedure TFrmWebTab.WBDocumentComplete(ASender: TObject; const pDisp: IDispatch;
  var URL: OleVariant);
begin
  Navegou := True;
  
  inherited;
  
  if showURL=suAtual then 
    cmURL.EditValue := WB.Doc2.url;
end;

end.

