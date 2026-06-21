unit nrweb_FrmPri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls, LMDPNGImage;

type
  TFrmPri = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

implementation

{$R *.dfm}

procedure TFrmPri.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
