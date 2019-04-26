unit ncaFrmSite;
{
    ResourceString: Dario 11/03/13
    Nada pra fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, cxControls, cxContainer, cxEdit, cxLabel,
  ExtCtrls, cxTextEdit, cxClasses, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters;

type
  TFrmSite = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    BarMgr: TdxBarManager;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    edSite: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FRes : Boolean;
  public
    function ObtemURL(aURL: String): String;
    { Public declarations }
  end;

var
  FrmSite: TFrmSite;

implementation

uses ncClassesBase, ufmImagens;

{$R *.dfm}

procedure TFrmSite.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSite.cmGravarClick(Sender: TObject);
begin
  FRes := True;
  Close;
end;

procedure TFrmSite.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TFrmSite.ObtemURL(aURL : String): String;
begin
  FRes := False;
  edSite.Text := aURL;
  ShowModal;
  if FRes then
    Result := FormataSiteStr(edSite.Text) else
    Result := '';
end;

end.
