unit uProjVGHeader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxVGrid, cxControls,
  cxInplaceContainer;

type
  TForm1 = class(TForm)
    cxVerticalGrid1: TcxVerticalGrid;
    cxVerticalGrid1EditorRow1: TcxEditorRow;
    cxVerticalGrid1EditorRow2: TcxEditorRow;
    cxVerticalGrid1MultiEditorRow1: TcxMultiEditorRow;
    procedure cxVerticalGrid1DrawRowHeader(Sender: TObject;
      ACanvas: TcxCanvas; APainter: TcxvgPainter;
      AHeaderViewInfo: TcxCustomRowHeaderInfo; var Done: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses cxVGridViewInfo;

procedure TForm1.cxVerticalGrid1DrawRowHeader(Sender: TObject;
  ACanvas: TcxCanvas; APainter: TcxvgPainter;
  AHeaderViewInfo: TcxCustomRowHeaderInfo; var Done: Boolean);
begin
  if AHeaderViewInfo is TcxMultiEditorRowHeaderInfo then
    with AHeaderViewInfo do
    begin
      Transparent := True;
      ACanvas.Brush.Color := ViewParams.Color;
      ACanvas.FillRect(HeaderRect);
      ACanvas.DrawTexT('New Caption', HeaderRect, cxAlignCenter or cxAlignVCenter or cxShowEndEllipsis);
      Done := True;
    end;
end;

end.
