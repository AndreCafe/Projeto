unit ncaFrmWebTab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, cxControls, cxContainer, cxEdit, cxTextEdit, cxHyperLinkEdit,
  OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, dxBar, cxBarEditItem, cxClasses;

type
  TFrmWEBTab = class(TForm)
    panPri: TLMDSimplePanel;
    WB: TEmbeddedWB;
    BarMgr: TdxBarManager;
    BDC: TdxBarDockControl;
    barToolbar: TdxBar;
    cmVoltar: TdxBarLargeButton;
    cmAvancar: TdxBarLargeButton;
    cmRefresh: TdxBarLargeButton;
    cmURL: TcxBarEditItem;
    procedure WBDocumentComplete(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure cmVoltarClick(Sender: TObject);
    procedure cmAvancarClick(Sender: TObject);
    procedure cmRefreshClick(Sender: TObject);
  private
    { Private declarations }
    function GetFullURL : String;
  public
    URL : String;
    FontBold : Boolean;
    FontCor : TColor;
    paramConta : Boolean;
    paramAdmin : Boolean;
    showAddress : Boolean;
    showToolbar : Boolean;
    showURL     : Byte;   

    procedure RefreshParams;
    procedure Navigate;
    { Public declarations }
  end;

const
  suNao   = 0;
  suBase  = 1;
  suFull  = 2;
  suAtual = 3;  

var
  FrmWEBTab: TFrmWEBTab;

implementation

uses ncaFrmPri, ufmImagens, ncClassesBase, ncaDM;

{$R *.dfm}

{ TFrmWEBTab }

procedure TFrmWEBTab.cmAvancarClick(Sender: TObject);
begin
  WB.GoForward;
end;

procedure TFrmWEBTab.cmRefreshClick(Sender: TObject);
begin
  Navigate;
end;

procedure TFrmWEBTab.cmVoltarClick(Sender: TObject);
begin
  WB.GoBack;
end;

function TFrmWEBTab.GetFullURL: String;
begin
  Result := URL;
  if paramConta then
    Result := Result + '?conta=' + gConfig.Conta;

  if paramAdmin then
    if paramConta then
      Result := Result + '&adm=' + BoolStr[Dados.CM.UA.Admin] else
      Result := Result + '?adm=' + BoolStr[Dados.CM.UA.Admin];
end;

procedure TFrmWEBTab.Navigate;
begin
  RefreshParams;
  WB.Navigate(GetFullURL);
end;


procedure TFrmWEBTab.RefreshParams;
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

procedure TFrmWEBTab.WBDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  if showURL=suAtual then 
    cmURL.EditValue := WB.Doc2.url;
end;

end.
