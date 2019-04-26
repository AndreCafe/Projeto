unit uTesteProfile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDThemedComboBox, LMDCustomComboBox, LMDPrinterComboBox;

type
  TForm20 = class(TForm)
    P: TLMDPrinterComboBox;
    Save: TButton;
    Restore: TButton;
    Button1: TButton;
    procedure SaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RestoreClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    S : TMemoryStream;
  public
    { Public declarations }
  end;

var
  Form20: TForm20;

implementation

uses ncPrinterInfo8;

{$R *.dfm}

procedure TForm20.Button1Click(Sender: TObject);
begin
  ChangePrinterPaper(PChar(P.SelectedPrinter), DMPAPER_A4, 2970, 2100, DMORIENT_PORTRAIT);
end;

procedure TForm20.FormCreate(Sender: TObject);
var B: TBitmap;
begin
  S := TMemoryStream.Create;
  B.Canvas.Pixels
  
end;

procedure TForm20.RestoreClick(Sender: TObject);
begin
  RestoreInfo8(PChar(P.SelectedPrinter), S);
end;

procedure TForm20.SaveClick(Sender: TObject);
begin
  S.Clear;
  CapturePrinterInfo8(Self, PChar(P.SelectedPrinter), S);
  Caption := IntTostr(S.Size);
end;

end.
