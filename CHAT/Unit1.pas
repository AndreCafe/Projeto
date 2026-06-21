unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RVStyle, RVScroll, RichView, RVTable;

type
  TForm1 = class(TForm)
    RV: TRichView;
    RVStyle1: TRVStyle;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var table : TRVTableItemInfo;
begin
  table := TRVTableItemInfo.CreateEx(1,2, RV.RVData);
  table.BorderStyle := rvtbRaisedColor;
  table.CellBorderStyle := rvtbLoweredColor;
  table.Color := clYellow;
  table.BorderLightColor := clYellow;;
  table.BorderColor := clYellow;
  table.CellBorderLightColor := clYellow;
  table.CellBorderColor := clYellow;
  table.BorderWidth := 0;
  table.CellBorderWidth := 0;
  table.CellPadding := 0;
  table.CellVSpacing := 0;
  table.CellHSpacing := 0;                  

  Table.Rows[0].VAlign := rvcMiddle;
  with table.Cells[0,0] do begin
    VAlign := rvcMiddle;
    Color := clYellow;
    DeleteItems(0, 1);
    AddNL('João diz:', 0, 0);
  end;

  with table.Cells[0,1] do begin
    VAlign := rvcMiddle;
    Color := clYellow;
    DeleteItems(0, 1);
    AddNL(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now), 0, 2);
  end;

  RV.AddItem('', table);  
  rv.AddTextNL(mEMO1.Lines.Text, 0, 0, 0);
  Rv.Format;
end;

end.
