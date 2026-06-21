unit ucmaFrmZerarTempo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxRadioGroup,
  cxControls, cxContainer, cxEdit, cxLabel;

type
  TFrmZeraTempo = class(TForm)
    cxLabel1: TcxLabel;
    rbClienteAtual: TcxRadioButton;
    rbTodos: TcxRadioButton;
    cxLabel2: TcxLabel;
    btnZerar: TcxButton;
    btnCancelar: TcxButton;
    procedure btnZerarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
  private
    FResultado : Integer;
    { Private declarations }
  public
    function Zerar(aCliente: String): Integer; // -1 Cancelar, 0 cliente atual, 1 todos
    { Public declarations }
  end;

var
  FrmZeraTempo: TFrmZeraTempo;

implementation

{$R *.dfm}

procedure TFrmZeraTempo.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmZeraTempo.btnZerarClick(Sender: TObject);
begin
  if rbClienteAtual.Checked then
    FResultado := 0 else
    FResultado := 1;
  Close;  
end;

procedure TFrmZeraTempo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TFrmZeraTempo.Zerar(aCliente: String): Integer;
begin      
  FResultado := -1;
  rbClienteAtual.Caption := aCliente;
  ShowModal;
  Result := FResultado;
end;

end.
