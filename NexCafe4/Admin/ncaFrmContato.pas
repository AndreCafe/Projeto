unit ncaFrmContato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, pngimage,
  cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, Menus, 
  LMDPNGImage;

type
  TFrmContato = class(TForm)
    Label1: TLabel;
    cxLabel1: TcxLabel;
    cxLabel7: TcxLabel;
    Image3: TImage;
    cxLabel11: TcxLabel;
    cxLabel15: TcxLabel;
    Image4: TImage;
    cxButton1: TcxButton;
    cxLabel12: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    Image1: TImage;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmContato: TFrmContato;

implementation

{$R *.dfm}

procedure TFrmContato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmContato.cxButton1Click(Sender: TObject);
begin
  Close;
end;

end.
