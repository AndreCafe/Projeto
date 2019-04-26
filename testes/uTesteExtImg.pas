unit uTesteExtImg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, gtPDFClasses, gtCstPDFDoc, gtExPDFDoc, gtExProPDFDoc,
  gtPDFDoc;

type
  TForm20 = class(TForm)
    Button1: TButton;
    gtPDFDocument1: TgtPDFDocument;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form20: TForm20;

implementation

uses ncPRExtractImgs;

{$R *.dfm}

procedure TForm20.Button1Click(Sender: TObject);
var T : TThreadExtImgs;
begin
  T := TThreadExtImgs.Create('c:\meus programas\teste.pdf', 100, true, 0);
  T.FreeOnTerminate := True;
  T.Resume;
  T.WaitFor;
end;

end.
