unit ncaFrmDesliga;

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
    rbLivres: TcxRadioButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Mostrar(aMaq: Integer; aOpcao: Byte);
  end;

var
  FrmDesliga: TFrmDesliga;

implementation

uses 
  ncaDM, 
  ncaFrmUsuario, 
  ncIDRecursos;

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
  if rbLivres.Checked then
    ShutdownMaq(High(Word), Op)
  else  
    ShutDownMaq(0, Op);
         
  Close;
end;

procedure TFrmDesliga.Mostrar(aMaq: Integer; aOpcao: Byte);
begin
  if not Permitido(daMaqFecharCMGuard) then
    rbFecharGuard.Enabled := False;
  
  rbMaq.Tag := AMaq;
  rbMaq.Caption := 'Máquina ' + IntToStr(AMaq);

  case aOpcao of
    1 : rbFecharGuard.Checked := True;
    2 : rbReiniciar.Checked :=  True;
    3 : rbDesligar.Checked := True;
    4 : rbLogoff.Checked := True;
  end;
  ShowModal;
end;

end.
