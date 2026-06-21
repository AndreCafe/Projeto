unit ucmaFrmDesliga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxRadioGroup, ExtCtrls, cxControls, cxContainer,
  cxEdit, cxLabel, pngimage, Buttons, PngSpeedButton, PngBitBtn,
  cxLookAndFeelPainters, cxButtons, Menus;

type
  TFrmDesliga = class(TForm)
    Image1: TImage;
    cxLabel1: TcxLabel;
    Panel1: TPanel;
    rbLogoff: TcxRadioButton;
    rbDesligar: TcxRadioButton;
    rbReiniciar: TcxRadioButton;
    rbFecharGuard: TcxRadioButton;
    rbTodas: TcxRadioButton;
    rbMaq: TcxRadioButton;
    cxLabel2: TcxLabel;
    btnOk: TcxButton;
    btnCancelar: TcxButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Mostrar(AMaq: Integer);
  end;

var
  FrmDesliga: TFrmDesliga;

implementation

uses ucmaDM, ucmaFrmUsuario, cmIDRecursos;

{$R *.dfm}

procedure TFrmDesliga.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDesliga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmDesliga.btnOkClick(Sender: TObject);
var OP: Integer;
begin
  if rbFecharGuard.Checked then
    OP := 0
  else
  if rbReiniciar.Checked then
    OP := 1
  else  
  if rbDesligar.Checked then
    OP := 2
  else
    OP := 3; 

  with Dados.CM do   
  if rbMaq.Checked then 
    ShutDownMaq(rbMaq.Tag, Op)
  else
    ShutDownMaq(0, Op);
         
  Close;
end;

procedure TFrmDesliga.Mostrar(AMaq: Integer);
begin
  if not Permitido(daMaqFecharCMGuard) then
    rbFecharGuard.Enabled := False;
  
  rbMaq.Tag := AMaq;
  rbMaq.Caption := 'Máquina ' + IntToStr(AMaq);
  ShowModal;
end;

end.
