unit Unit14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GrFingerComp, StdCtrls;

type
  TForm14 = class(TForm)
    Button1: TButton;
    G: TGrFingerComp;
    procedure GFingerPrint(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FTpt : PChar;
    FTptSize : Integer;
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

uses GrFinger;

{$R *.dfm}

procedure TForm14.Button1Click(Sender: TObject);
begin
  FTptSize := 0;
end;

procedure TForm14.FormDestroy(Sender: TObject);
begin
  StrDispose(FTpt);
end;

procedure TForm14.FormShow(Sender: TObject);
begin
  FTpt := StrAlloc(GR_MAX_SIZE_TEMPLATE);
  G.Active := True;
end;

procedure TForm14.GFingerPrint(Sender: TObject);
begin
  if FTptSize=0 then begin
    Move(G.Tpt^, FTpt^, G.TptSize);
    FTptSize := G.TptSize;
  end
  else begin
    G.PrepareIdentify;
    ShowMessage(IntToStr(G.Match(FTpt)));
  end;
end;

end.
