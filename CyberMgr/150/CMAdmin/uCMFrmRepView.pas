unit uCMFrmRepView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ppViewr, ppReport, StdCtrls, Mask, Buttons, ppComm, ppEndUsr;

type
  TFrmRepView = class(TForm)
    Panel3: TPanel;
    ppViewer1: TppViewer;
    pnlPreviewBar: TPanel;
    spbPreviewPrint: TSpeedButton;
    spbPreviewWhole: TSpeedButton;
    spbPreviewFirst: TSpeedButton;
    spbPreviewPrior: TSpeedButton;
    spbPreviewNext: TSpeedButton;
    spbPreviewLast: TSpeedButton;
    spbPreviewWidth: TSpeedButton;
    spbPreview100Percent: TSpeedButton;
    mskPreviewPercentage: TMaskEdit;
    mskPreviewPage: TMaskEdit;
    pnlStatusBar: TPanel;
    btnFechar: TBitBtn;
    btnEditar: TSpeedButton;
    ppDesigner1: TppDesigner;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppVClick(Sender: TObject);
    procedure spbPreviewPrintClick(Sender: TObject);
    procedure spbPreviewWholeClick(Sender: TObject);
    procedure spbPreviewWidthClick(Sender: TObject);
    procedure spbPreview100PercentClick(Sender: TObject);
    procedure ppViewer1PageChange(Sender: TObject);
    procedure ppViewer1PrintStateChange(Sender: TObject);
    procedure ppViewer1StatusChange(Sender: TObject);
    procedure spbPreviewFirstClick(Sender: TObject);
    procedure spbPreviewPriorClick(Sender: TObject);
    procedure mskPreviewPageKeyPress(Sender: TObject; var Key: Char);
    procedure spbPreviewNextClick(Sender: TObject);
    procedure spbPreviewLastClick(Sender: TObject);
    procedure mskPreviewPercentageKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
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
  btnEditar.Visible := (R.Template.FileName <> '');
  ppDesigner1.Report := R;
  ppViewer1.Report := R;
  R.PrintToDevices;
  ShowModal;
end;

procedure TFrmRepView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRepView.ppVClick(Sender: TObject);
begin
  ppViewer1.Print;
end;

procedure TFrmRepView.spbPreviewPrintClick(Sender: TObject);
begin
  ppViewer1.Print;
end;

procedure TFrmRepView.spbPreviewWholeClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zsWholePage;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);

  pnlPreviewBar.SetFocus;
end;

procedure TFrmRepView.spbPreviewWidthClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zsPageWidth;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);

  pnlPreviewBar.SetFocus;
end;

procedure TFrmRepView.spbPreview100PercentClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zs100Percent;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);

  pnlPreviewBar.SetFocus;
end;

procedure TFrmRepView.ppViewer1PageChange(Sender: TObject);
begin
  mskPreviewPage.Text := IntToStr(ppViewer1.AbsolutePageNo);
  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
end;

procedure TFrmRepView.ppViewer1PrintStateChange(Sender: TObject);
var
  lPosition: TPoint;
begin
  if ppViewer1.Busy then
    begin
      mskPreviewPercentage.Enabled := False;
      mskPreviewPage.Enabled := False;

      pnlPreviewBar.Cursor := crHourGlass;

      ppViewer1.Cursor := crHourGlass;

      pnlStatusBar.Cursor := crHourGlass;

    end
  else
    begin
      mskPreviewPercentage.Enabled := True;
      mskPreviewPage.Enabled := True;

      pnlPreviewBar.Cursor := crDefault;

      ppViewer1.Cursor := crDefault;

      pnlStatusBar.Cursor := crDefault;

    end;

  {this code will force the cursor to update}
  GetCursorPos(lPosition);
  SetCursorPos(lPosition.X, lPosition.Y);
end;

procedure TFrmRepView.ppViewer1StatusChange(Sender: TObject);
begin
  pnlStatusBar.Caption := ppViewer1.Status;
end;

procedure TFrmRepView.spbPreviewFirstClick(Sender: TObject);
begin
  ppViewer1.FirstPage;
end;

procedure TFrmRepView.spbPreviewPriorClick(Sender: TObject);
begin
  ppViewer1.PriorPage;
end;

procedure TFrmRepView.mskPreviewPageKeyPress(Sender: TObject;
  var Key: Char);
var  
  liPage: Longint;
begin

  if (Key = #13) then
    begin
      liPage := StrToInt(mskPreviewPage.Text);

      ppViewer1.GotoPage(liPage);
    end; {if, carriage return pressed}

end;

procedure TFrmRepView.spbPreviewNextClick(Sender: TObject);
begin
  ppViewer1.NextPage;
end;

procedure TFrmRepView.spbPreviewLastClick(Sender: TObject);
begin
  ppViewer1.LastPage;
end;

procedure TFrmRepView.mskPreviewPercentageKeyPress(Sender: TObject;
  var Key: Char);
var
  liPercentage: Integer;
begin
  if (Key = #13) then
    begin
      liPercentage := StrToIntDef(mskPreviewPercentage.Text, 100);

      ppViewer1.ZoomPercentage := liPercentage;

      spbPreviewWhole.Down := False;
      spbPreviewWidth.Down := False;
      spbPreview100Percent.Down := False;

      mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
    end; {if, carriage return pressed}
end;

procedure TFrmRepView.btnFecharClick(Sender: TObject);
begin
  if ppViewer1.Report.Printing then
    ppViewer1.Cancel;
end;

procedure TFrmRepView.btnEditarClick(Sender: TObject);
begin
  ppDesigner1.ShowModal;
end;

end.
