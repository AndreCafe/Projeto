unit ncgLVBack;

interface

uses
ComCtrls, CommCtrl, Windows;

const

// Note that LVM_SETBKIMAGE is not declared in Delphi 3, but is in Delphi 4 and
// is used by COMCTL32.DLL 4.71 and higher. It lets us put a background  image
// in a ListView.
LVBKIF_SOURCE_NONE = $0;
LVBKIF_SOURCE_URL = $2;
LVBKIF_STYLE_NORMAL = $0;
LVBKIF_STYLE_TILE = $10;

LVM_SETBKIMAGE = (LVM_FIRST + 68);
LVM_GETBKIMAGE = (LVM_FIRST + 69);

procedure SetListViewBkImage(aHandle: HWND; ImageFile: string);

implementation

uses Dialogs,sysutils;

type

TLVBKImage = record
  ulFlags : ULONG;
  hBitmap : HBITMAP;
  pszImage : PAnsiChar;
  cchImageMax : UINT;
  xOffsetPercent : Integer;
  yOffsetPercent : Integer;
end;

procedure SetListViewBkImage(aHandle: HWND; ImageFile: string);
var
  LVBKImage: TLVBKImage;
begin
  if ImageFile = '' then
    LVBKImage.ulFlags := LVBKIF_SOURCE_NONE
  else
  with LVBKImage do begin
    ulFlags := LVBKIF_SOURCE_URL or LVBKIF_STYLE_TILE;
    pszImage := PChar(ImageFile);
    cchImageMax := Length(pszImage);
    xOffsetPercent := 0;
    yOffsetPercent := 0;
  end;
  SendMessage(aHandle, LVM_SETTEXTBKCOLOR, 0, CLR_NONE);
  SendMessage(aHandle, LVM_SETBKIMAGE, 0, LPARAM(@LVBKImage));
end;

end.
 