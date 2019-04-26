unit ncgFrmConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill,
  cxControls, cxContainer, cxEdit, cxLabel, dxGDIPlusClasses, LMDSimplePanel,
  cxProgressBar, LMDControl, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters;

type
  TFrmConta = class(TForm)
    Timer1: TTimer;
    LMDSimplePanel10: TLMDSimplePanel;
    Image1: TImage;
    cxLabel1: TcxLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    Image2: TImage;
    lbNao: TcxLabel;
    Image3: TImage;
    lbSim: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDPanelFill6: TLMDPanelFill;
    LMDPanelFill1: TLMDPanelFill;
    panCentro2: TLMDPanelFill;
    cxLabel10: TcxLabel;
    cxLabel4: TcxLabel;
    lbTempo: TcxLabel;
    lbValor: TcxLabel;
    PB: TcxProgressBar;
    procedure btnSimClick(Sender: TObject);
    procedure btnCancClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbSimMouseEnter(Sender: TObject);
    procedure lbSimMouseLeave(Sender: TObject);
    procedure Image2MouseLeave(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
  private
    { Private declarations }
    FResultado : Boolean;
    FFim       : Cardinal;
  public
    function Confirma(Tempo, Valor: String): Boolean;
    { Public declarations }
  end;

var
  FrmConta: TFrmConta;

implementation

{$R *.DFM}

{ TFrmConta }

function TFrmConta.Confirma(Tempo, Valor: String): Boolean;
begin
  lbTempo.Caption := Tempo;
  lbValor.Caption := Valor;
  FFim    := GetTickCount + 30000;
  PB.Position := 0; 
  FResultado := False;
  ShowModal;
  Result := FResultado;
end;

procedure TFrmConta.btnSimClick(Sender: TObject);
begin
  FResultado := True;
  Close;
end;

procedure TFrmConta.btnCancClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrmConta := nil;
end;

procedure TFrmConta.Timer1Timer(Sender: TObject);
var T: Cardinal;
begin
  T := GetTickCount;
  if T>=FFim then begin
    Timer1.Enabled := False;
    btnSimClick(nil);
  end else
    PB.Position := 30000 - (FFim - T);
end;

procedure TFrmConta.FormCreate(Sender: TObject);
begin
  FrmConta := Self;
end;

procedure TFrmConta.Image2MouseEnter(Sender: TObject);
begin
  lbNao.Style.TextStyle := [fsBold, fsUnderline];
end;

procedure TFrmConta.Image2MouseLeave(Sender: TObject);
begin
  lbNao.Style.TextStyle := [fsBold];
end;

procedure TFrmConta.lbSimMouseEnter(Sender: TObject);
begin
  lbSim.Style.TextStyle := [fsBold, fsUnderline];
end;

procedure TFrmConta.lbSimMouseLeave(Sender: TObject);
begin
  lbSim.Style.TextStyle := [fsBold];
end;

initialization
  FrmConta := nil;

end.
