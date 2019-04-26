unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMemo, cxLabel, ExtCtrls, StdCtrls, uVersionInfo;

type
  TForm4 = class(TForm)
    cxMemo1: TcxMemo;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    fcount : integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
var
    S: string;
begin
    caption := application.Title;
    cxMemo1.lines.add('Ver.: '+VersionInfo.ProgramDisplayLongVersion);
    fcount := 6;
    if paramcount=1 then begin
       s := paramstr(1);
       if sametext(copy(s,1,3),'/p=') then begin
           s := copy(s,4,maxint);
           cxMemo1.lines.add('printer: ' + s);
           Timer1.Enabled := true;
       end else begin
           cxMemo1.lines.add('parametro invalido');
           Timer2.enabled := true;
       end;
    end else begin
           cxMemo1.lines.add('falta parametro');
           Timer2.enabled := true;
    end;
end;

procedure TForm4.Timer1Timer(Sender: TObject);
var
    F: TextFile;
    S, fn: string;
    c : int64;
    i : integer;
    sl : TStringList;
    doshow : boolean;
begin
   Timer1.Enabled := false;
   fn := extractfilepath(application.ExeName);
   sl := TStringList.create;
   try
       application.ProcessMessages;
       AssignFile(F, '');
       Reset(F);
       i := 0;
       c := 0;
       doshow := true;
       while not eof(f) do begin
           Readln(F, S);
           if trim(s)='' then doshow:=false;
           inc(c, length(s));
           inc(i);
           if i<100 then sl.add(s);
           if i=100 then begin
               sl.savetofile(fn+application.Title+'.out.txt');
               cxMemo1.lines.add('partial output: '+fn+application.Title+'.out.txt');
           end;
           if doshow then cxMemo1.lines.add('  > '+s);
           Label2.Caption := inttostr(c);
           Label2.Repaint;
           application.ProcessMessages;
       end;
       CloseFile(F);

   except
       on e:exception do
          cxMemo1.lines.add('erro: '+e.Message);
   end;
   sl.Free;
   
   Timer2.enabled := true;
end;

procedure TForm4.Timer2Timer(Sender: TObject);
begin
    dec(fcount);
    if copy(cxMemo1.lines[cxMemo1.lines.count-1],1,11)='fechando em' then
       cxMemo1.lines.Delete(cxMemo1.lines.count-1);
    cxMemo1.lines.add('fechando em '+inttostr(fcount));
    if fcount=0 then
        close;
end;

end.
