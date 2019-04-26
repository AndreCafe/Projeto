unit ncaFrmErroConexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, StdCtrls, LMDCustomButton,
  LMDButton, LMDPNGImage, ExtCtrls, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmErroConexao = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    LMDButton1: TLMDButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LMDButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmErroConexao: TFrmErroConexao;

implementation

{$R *.dfm}

procedure TFrmErroConexao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmErroConexao.LMDButton1Click(Sender: TObject);
begin
  Close;
end;

end.
