unit uFrmAss;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxMemo,
  cxLabel, cxContainer, cxEdit, cxTextEdit, LMDPNGImage, ExtCtrls, cxPC,
  cxControls, ncServAtualizaLic;

type
  TFrmAss = class(TForm)
    Paginas: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    tsOqueE: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    Panel1: TPanel;
    Image1: TImage;
    edSenha: TcxTextEdit;
    cxLabel1: TcxLabel;
    lbSenha: TcxLabel;
    meOqueE: TcxMemo;
    panBotoes: TLMDSimplePanel;
    btnAvancar: TcxButton;
    btnComprar: TcxButton;
    tsConectar: TcxTabSheet;
    cxLabel2: TcxLabel;
    Image2: TImage;
    LMDSimplePanel1: TLMDSimplePanel;
    cxButton2: TcxButton;
    cxLabel3: TcxLabel;
    procedure FormCreate(Sender: TObject);
  private
    dmLic : TdmAtualizaLic;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAss: TFrmAss;

implementation


{$R *.dfm}

procedure TFrmAss.FormCreate(Sender: TObject);
begin
  Paginas.HideTabs := True;
  Paginas.ActivePage := tsConectar;
end;

end.
