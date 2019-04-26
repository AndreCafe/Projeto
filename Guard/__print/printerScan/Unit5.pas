unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo,
  StdCtrls, cxButtons, printers, ncgPrintInstall;

type
  TForm5 = class(TForm)
    cxButton1: TcxButton;
    cxMemo1: TcxMemo;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation
   uses strutils;

{$R *.dfm}

procedure TForm5.cxButton1Click(Sender: TObject);
var
    aPrinter: TPrinter;
    pl : TStringList;
    i, defaultPrinter : integer;
    jsonPrinter : string;
    nl, s : string;
    jsonIndent : integer;

    function ind:string;
    begin
        result := strutils.DupeString(#32, jsonIndent*4)
    end;
begin
    defaultPrinter := 2;
    
    cxMemo1.clear;
    nl := #13#10;
    jsonIndent := 0;
    jsonPrinter :=  ind + '{'+nl;
    pl := TStringList(GetPrinterList);
    inc(jsonIndent);
    jsonPrinter := jsonPrinter + ind + '"defaultPrinter": '+inttostr(defaultPrinter)+',' + nl;
    jsonPrinter := jsonPrinter + ind + '"printers": {' + nl;
    try
        for i:=0 to pl.count-1 do begin
            aPrinter := Printer;
            try
                aPrinter.SetPrinter(pAnsiChar(pl[i]),'WINSPOOL','', 0);
                inc(jsonIndent);
                jsonPrinter := jsonPrinter + ind + '"printer'+inttostr(aPrinter.PrinterIndex)+'": {' + nl;
                inc(jsonIndent);
                jsonPrinter := jsonPrinter + ind + '"name": "' + pl[i]  +'",' + nl;
                if aPrinter.Orientation = poPortrait then s:='Portrait' else  s:='Landscape';
                jsonPrinter := jsonPrinter + ind + '"orientation": "' + s  +'",' + nl;
                //jsonPrinter := jsonPrinter + ind + '"PageWidth": ' + inttostr(aPrinter.PageWidth) +','  + nl;
                //jsonPrinter := jsonPrinter + ind + '"PageHeight": ' + inttostr(aPrinter.PageHeight)  +',' + nl;
                jsonPrinter := jsonPrinter + ind + '"PHYSICALWIDTH": ' + inttostr( GetDeviceCaps(aPrinter.Handle, PHYSICALWIDTH) ) +','  + nl;
                jsonPrinter := jsonPrinter + ind + '"PHYSICALHEIGHT": ' + inttostr( GetDeviceCaps(aPrinter.Handle, PHYSICALHEIGHT) ) +','  + nl;
                jsonPrinter := jsonPrinter + ind + '"PHYSICALOFFSETX": ' + inttostr( GetDeviceCaps(aPrinter.Handle, PHYSICALOFFSETX) ) +','  + nl;
                jsonPrinter := jsonPrinter + ind + '"PHYSICALOFFSETY": ' + inttostr( GetDeviceCaps(aPrinter.Handle, PHYSICALOFFSETY) ) +','  + nl;
                jsonPrinter := jsonPrinter + ind + '"HORZRES": ' + inttostr( GetDeviceCaps(aPrinter.Handle, HORZRES) ) +','  + nl;
                jsonPrinter := jsonPrinter + ind + '"VERTRES": ' + inttostr( GetDeviceCaps(aPrinter.Handle, VERTRES) ) +','  + nl;
                jsonPrinter := jsonPrinter + ind + '"LOGPIXELSX": ' + inttostr( GetDeviceCaps(aPrinter.Handle, LOGPIXELSX) ) +','  + nl;
                jsonPrinter := jsonPrinter + ind + '"LOGPIXELSY": ' + inttostr( GetDeviceCaps(aPrinter.Handle, LOGPIXELSY) ) +','   + nl;
                jsonPrinter := jsonPrinter + ind + '"NexcafeID": ' + inttostr( aPrinter.PrinterIndex ) +','    + nl;
                jsonPrinter := jsonPrinter + ind + '"NexcafeNome": "' + pl[i] +'",'    + nl;
                jsonPrinter := jsonPrinter + ind + '"NexcafePrecoPP": 0.00'    + nl;


                dec(jsonIndent);
                if i=pl.count-1 then
                    jsonPrinter := jsonPrinter + ind + '}' + nl
                else
                    jsonPrinter := jsonPrinter + ind + '},' + nl;
                dec(jsonIndent);
            except
                on e:exception do
                cxMemo1.Lines.add( pl[i] +' error: '+  e.message);
            end;
        end;
        jsonPrinter := jsonPrinter + ind + '}' + nl;
        dec(jsonIndent);
        jsonPrinter := jsonPrinter + ind + '}';
        cxMemo1.Lines.add( jsonPrinter );
    finally
        pl.free;
    end;
end;

end.
