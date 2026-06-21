unit uChamaVNC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDCustomComponent, LMDStarter, StdCtrls;

type
  TForm1 = class(TForm)
    S1: TLMDStarter;
    S2: TLMDStarter;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
  S1.Command := ExtractFilePath(ParamStr(0)) + 'winvnc4.exe';
  S2.Command := S1.Command;
  S1.Execute;
  S2.Execute;
  Close;
end;

end.
