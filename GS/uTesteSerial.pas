unit uTesteSerial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GetDiskSerial, ExtCtrls;

type
  TForm13 = class(TForm)
    ds: TGetDiskSerial;
    Button1: TButton;
    Memo1: TMemo;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses uLicEXECryptor;

{$R *.dfm}

procedure TForm13.Button1Click(Sender: TObject);
var I : Integer;
    S, S2: String;
begin
  Memo1.Lines.Clear;
  for I := 0 to 3 do begin
    DS.DriveID := I;
    S := DS.SerialNumber;
    if Trim(S) > '' then 
      S2 := RegistroGlobal.CodigoEquip(S) else
      S2 := '';
    Memo1.Lines.Add('HD '+IntToStr(I)+' S/N: '+S+' C/E: '+S2);
  end;
end;

procedure TForm13.FormShow(Sender: TObject);
begin
  Button1.Click;
end;

procedure TForm13.Timer1Timer(Sender: TObject);
begin
  Button1.Click;
end;

end.
