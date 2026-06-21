unit uForm2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls, GR32_Image;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Image2: TImage;
    Image321: TImage32;
    Edit1: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

Const PixelMax = 32768;

Type
   pPixelArray = ^TPixelArray;
   TPixelArray = Array[0..PixelMax-1] Of TRGBTriple;


{Usage:}

implementation

{$R *.dfm}

end.

http://maps.google.com/maps/nav?hl=de&gl=de&output=json&oe=utf-8&q=from:-13.003631,%20-38.482648%20to:%20-13.003631,%20-38.482648&key=ABQIAAAAtJKJG0HibFL5oiY0AbFCVhS_T6sU900gA23wGwOfp-YpiH5uuBS6pbVTMk17E09bbRo4wXoEqhEK8w
