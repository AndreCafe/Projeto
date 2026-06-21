unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxBarExtItems, dxBar, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, cxClasses;

type
  TForm1 = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    dxBarStatic2: TdxBarStatic;
    dxBarStatic3: TdxBarStatic;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure StatusBarResize(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

type
  TdxBarControlAccess = class(TdxBarControl);
  TdxBarAccess = class(TdxBar);
  TdxBarManagerAccess = class(TdxBarManager);

procedure TForm1.StatusBarResize(Sender: TObject);
var
  R: TRect;
  I, UsedSpace: Integer;
begin
  with TdxBarControlAccess(Sender) do
  begin
    // Calculate the width of all items except the 1st one
    UsedSpace := 0;
    with Bar.ItemLinks do
      for I := 1 to Count - 1 do
        Inc(UsedSpace,  TdxBarStatic(Items[I].Item).Width);

    // Calculate the size of the QuickCustomizing mark
    if MarkExists then
    begin
      R := MarkRect;
      Inc(UsedSpace, R.Right - R.Left);
    end;

    with TdxBarAccess(Bar) do
    begin
      // Calculate the size of the sizing grip
      if HasSizeGrip then
        Inc(UsedSpace, TdxBarAccess(Bar).Painter.StatusBarGripSize(BarManager).cx);

      // Calculate the size of the finger
      if CanMoving then
        Inc(UsedSpace, TdxBarAccess(Bar).Painter.FingersSize(Bar.Control));

      // Calculate the size of the borders
      if BorderStyle <> bbsNone then
        Inc(UsedSpace, 2 * TdxBarAccess(Bar).Painter.BorderSizeX);
    end;

    dxBarManager1.BeginUpdate;
    try
      dxBarStatic1.Width := (Sender as TdxBarControl).Width - UsedSpace;
    finally
      dxBarManager1.EndUpdate();
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  ABar: TdxBar;
begin
  ABar :=   dxBarManager1.Bars[0];
  if (ABar <> nil) and (ABar.Control <> nil) then
  begin
    TdxBarControlAccess(ABar.Control).OnResize := StatusBarResize;
    StatusBarResize(ABar.Control);
  end;
end;

end.
