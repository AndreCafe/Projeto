unit Unit1;

interface

uses
  Windows, Printers, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var 
  Prn: TextFile;
begin
  AssignFile(Prn, '\\Sigarp_nt\HP DeskJet 820Cxi');
  Reset(Prn);
  Writeln(Prn, 'Teste João');
  CloseFile(PRN);
end;

end.
