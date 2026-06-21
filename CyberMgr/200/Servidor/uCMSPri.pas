unit uCMSPri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrmPri = class(TForm)
    btnFechar: TButton;
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

implementation

{$R *.dfm}

procedure TFrmPri.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.
