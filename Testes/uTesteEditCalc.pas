(*

TMoneyEdit Component
------------------------------------
Author : Leandro Prusch
e-mail : prusch@emrede.com.br
Version: 1.0
Type   : Freeware
------------------------------------
This component implements the Windows Calculator input style,
including a fixed decimal part (whose size is user defined).

The main atractions are:

    1) The formatting of the value is performed while the user enters
       the data, and not on the loss of focus.
    2) The user can choose the alignment of the value, (left, center or
       right) and such alignment is not implemented through the use of
       white spaces.
    3) The user can freely walk with the cursor through the digits, as
       well as delete and backspace the digits at any position.
    4) The initial value of the edit box is defined by the TextAsFloat
       property. The same property must be read at run-time.

Delphi 1.0 and 2.0: Please, note that there are 2 '.dcr' files provided
  in the zip file: MneyEd16.dcr and MneyEd32.dcr. You must rename one of
  them to 'MneyEdit.dcr', depending on which Delphi you are, and copy
  this file to the same location of the MneyEdit.pas file.
  If you do not follow this tip the components palette's added glyph
  of TMoneyEdit will be the same of TMemo. I, personally, don't like it.

I'd like to thank to Tom Gullion (TCurrencyEdit) and to Jose Maria Dias
  (TEditNew) for the help and the inspiration that came from theirs
  great components.

I'm putting this component in the DSP as freeware, so I'll not accept
  any responsability for any error contained in or caused by this
  component or his use.

Finally, I'd like to hear from you about any application, correction,
  improvemment and/or suggestion related to this component.

e-mail to: prusch@emrede.com.br

*)
unit uTesteEditCalc;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Menus;

type
  TMoneyEdit = class(TCustomMemo)
  private
    FDecimals: integer;
    FMaxLength: integer;
    FormatString: string;
    DecimalPos: integer;
    procedure SetDecimals(Value: integer);
    procedure SetMaxLength(Value: integer);
    function StripCommas(AString: string): string;
    procedure Reformat;
    procedure CMEnter(var Message: TCMGotFocus); message CM_ENTER;
    function GetTextAsFloat: Extended;
    procedure SetTextAsFloat( Value: Extended );
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: char); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property MaxLength: integer read FMaxLength write SetMaxLength;
    property Decimals: integer read FDecimals write SetDecimals;
    property TextAsFloat: Extended read GetTextAsFloat write SetTextAsFloat;
    property Alignment default taRightJustify;
    property BorderStyle;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

procedure Register;

implementation

constructor TMoneyEdit.Create(AOwner: TComponent);
begin
inherited Create(AOwner);
WantReturns := False;
Height := 24;
Width := 120;
Alignment := taRightJustify;
DecimalPos := 0;
FMaxLength := 16;
Decimals := 2;
end;

procedure TMoneyEdit.SetDecimals(Value: integer);
var
  i: integer;
begin
if ( Value > 0 ) and ( Value < FMaxLength-1 ) then FDecimals := Value;
FormatString := '#,##0.';
for i := 1 to FDecimals do FormatString := FormatString + '0';
MaxLength := MaxLength;
Reformat;
end;

procedure TMoneyEdit.SetMaxLength(Value: integer);
begin
if ( Value < 20 ) and ( Value > FDecimals+1 ) then FMaxLength := Value;
if (FMaxLength-FDecimals-1) mod 4 = 0 then Dec(FMaxLength);
end;

function TMoneyEdit.StripCommas(AString: string): string;
var
  StringValue: Extended;
  ErrorPos: integer;
begin
  while (Pos(ThousandSeparator, AString) > 0 ) do
    delete(AString, Pos(ThousandSeparator, AString), 1);
  while (Pos(DecimalSeparator, AString) > 0 ) do
    delete(AString, Pos(DecimalSeparator, AString), 1);
  Val( AString, StringValue, ErrorPos );
  if ErrorPos > 0 then
    Result := '0'
  else
    begin
    Insert( DecimalSeparator, AString, Length(AString)-FDecimals+1 );
    Result := AString;
    end;
end;

procedure TMoneyEdit.Reformat;
begin
Text := FormatFloat(FormatString, StrToFloat(StripCommas(Text)));
end;

procedure TMoneyEdit.CMEnter(var Message: TCMGotFocus);
begin
SelStart := Length(Text) - FDecimals - 1;
inherited;
end;

procedure TMoneyEdit.KeyDown(var Key: Word; Shift: TShiftState);
var
  CursorPos: integer;
  Buffer: string;
begin
inherited KeyDown(Key,Shift);
if Key = VK_DELETE then
  begin
  Buffer := Text;
  CursorPos := Length(Buffer)-SelStart-SelLength;
  if CursorPos > FDecimals+1 then
    begin
    if (CursorPos-FDecimals-1) mod 4 = 0 then Dec(CursorPos);
    Delete( Buffer, Length(Buffer)-CursorPos+1, 1 );
    Dec(CursorPos);
    end
  else
    begin
    if CursorPos = FDecimals+1 then Dec(CursorPos);
    if CursorPos > 0 then
      begin
      Delete( Buffer, Length(Buffer)-CursorPos+1, 1 );
      Insert( '0', Buffer, Length(Buffer)-CursorPos+2 );
      Dec(CursorPos);
      end;
    end;
  Key := 0;
  Text := Buffer;
  Reformat;
  SelStart := Length(Text)-CursorPos;
  end;
end;

procedure TMoneyEdit.KeyPress( var Key: char );
var
  Buffer: string;
  CursorPos: integer;
begin
inherited KeyPress(Key);
Buffer := Text;
CursorPos := Length(Buffer)-SelStart-SelLength;
case Key of
'0'..'9':
  begin
  if CursorPos >= FDecimals+1 then
    begin
    if Length(Buffer) < FMaxLength then
      Insert( Key, Buffer, Length(Buffer)-CursorPos+1 );
    end
  else if CursorPos >= 1 then
    begin
    Delete( Buffer, Length(Buffer)-CursorPos+1, 1 );
    Insert( Key, Buffer, Length(Buffer)-CursorPos+2 );
    if 1-CursorPos <= 0 then Dec(CursorPos);
    end;
  end;
#8: {BACKSPACE}
  begin
  if CursorPos > FDecimals then
    begin
    if (CursorPos-FDecimals) mod 4 = 0 then Inc(CursorPos);
    Delete( Buffer, Length(Buffer)-CursorPos, 1 );
    end
  else
    begin
    if CursorPos = FDecimals then Inc(CursorPos);
    Delete( Buffer, Length(Buffer)-CursorPos, 1 );
    if CursorPos <= FDecimals then
      begin
      Insert( '0', Buffer, Length(Buffer)-CursorPos+1 );
      Inc(CursorPos);
      end;
    end;
  end;
'.',',':
  CursorPos := FDecimals;
end;
Key := #0;
Text := Buffer;
Reformat;
SelStart := Length(Text)-CursorPos;
end;

function TMoneyEdit.GetTextAsFloat;
begin
Result := StrToFloat(StripCommas(Text));
end;

procedure TMoneyEdit.SetTextAsFloat( Value: Extended );
begin
Text := FormatFloat(FormatString, Value);
end;

procedure Register;
begin
  RegisterComponents('Standard', [TMoneyEdit]);
end;

end.

interface

implementation

end.
