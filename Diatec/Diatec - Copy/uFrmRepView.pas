unit uFrmRepView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ppViewr, ppReport, ppTypes, StdCtrls, Buttons, ImgList, dxBar;

type
  TFrmRepView = class(TForm)
    ppV: TppViewer;
    pnlPreviewBar: TPanel;
    pnlCancelButton: TPanel;
    dxBarImpress: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    cmImprime: TdxBarButton;
    cmPgInt: TdxBarButton;
    cmLargPag: TdxBarButton;
    cm100perc: TdxBarButton;
    cmPrimRg: TdxBarButton;
    cmPgAnt: TdxBarButton;
    edNroPg: TdxBarEdit;
    cmProxPg: TdxBarButton;
    cmUltPag: TdxBarButton;
    edPercent: TdxBarEdit;
    ImageList1: TImageList;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppVClick(Sender: TObject);
    procedure cmImprimeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cmPgIntClick(Sender: TObject);
    procedure cmLargPagClick(Sender: TObject);
    procedure cm100percClick(Sender: TObject);
    procedure cmPrimRgClick(Sender: TObject);
    procedure cmPgAntClick(Sender: TObject);
    procedure cmProxPgClick(Sender: TObject);
    procedure cmUltPagClick(Sender: TObject);
    procedure ppVResize(Sender: TObject);
    procedure edNroPgKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Mostra(R: TppReport);
  end;

var
  FrmRepView: TFrmRepView;

implementation

{$R *.DFM}

{ TFrmRepView }

procedure TFrmRepView.Mostra(R: TppReport);
begin
  ppV.Report := R;
  R.PrintToDevices;
  ShowModal;
end;

procedure TFrmRepView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRepView.ppVClick(Sender: TObject);
begin
  ppV.Print;
end;

procedure TFrmRepView.cmImprimeClick(Sender: TObject);
begin
   ppV.Print;
end;

procedure TFrmRepView.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure TFrmRepView.cmPgIntClick(Sender: TObject);
begin
  ppV.ZoomSetting := zsWholePage;
  edPercent.Text := IntToStr(ppV.CalculatedZoom)+'%';
  cmPgInt.Lowered := True;
  cm100Perc.Lowered := False;
  cmLargPag.Lowered := False;
end;

procedure TFrmRepView.cmLargPagClick(Sender: TObject);
begin
  ppV.ZoomSetting := zsPageWidth;
  edPercent.Text := IntToStr(ppV.CalculatedZoom)+'%';
  cmPgInt.Lowered := False;
  cm100Perc.Lowered := False;
  cmLargPag.Lowered := True;
end;

procedure TFrmRepView.cm100percClick(Sender: TObject);
begin
{  ppV.ZoomSetting := zs100Percent;
  edPercent.Text := IntToStr(ppV.CalculatedZoom)+'%';
  cmPgInt.Lowered := False;
  cm100Perc.Lowered := True;
  cmLargPag.Lowered := False;}
end;

procedure TFrmRepView.cmPrimRgClick(Sender: TObject);
begin
   ppV.FirstPage;
end;

procedure TFrmRepView.cmPgAntClick(Sender: TObject);
begin
   ppV.PriorPage;
end;

procedure TFrmRepView.cmProxPgClick(Sender: TObject);
begin
   ppV.NextPage;
end;

procedure TFrmRepView.cmUltPagClick(Sender: TObject);
begin
   ppV.LastPage;
end;

procedure TFrmRepView.ppVResize(Sender: TObject);
begin
   edPercent.Text := IntToStr(ppV.CalculatedZoom)+'%';
end;

procedure TFrmRepView.edNroPgKeyPress(Sender: TObject; var Key: Char);
var
  liPage: Longint;
begin

  if (Key = #13) then
    begin
      liPage := StrToInt(edNroPg.Text);

      ppV.GotoPage(liPage);
    end; {if, carriage return pressed}

end; {procedure, mskPreviewPageKeyPress}
end.
