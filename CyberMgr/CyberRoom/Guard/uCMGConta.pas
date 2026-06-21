unit uCMGConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, cxControls, cxContainer, cxEdit, cxLabel;

type
  TFrmConta = class(TForm)
    btnSim: TBitBtn;
    btnCanc: TBitBtn;
    Timer1: TTimer;
    lbConfirma: TcxLabel;
    procedure btnSimClick(Sender: TObject);
    procedure btnCancClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FResultado : Boolean;
    FContador  : Byte;
  public
    function Confirma(Tempo: String): Boolean;
    { Public declarations }
  end;

var
  FrmConta: TFrmConta;

implementation

{$R *.DFM}

{ TFrmConta }

function TFrmConta.Confirma(Tempo: String): Boolean;
begin
  FContador := 30;
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
begin
  Dec(FContador);
  if FContador = 0 then begin
    Timer1.Enabled := False;
    btnSimClick(nil);
  end;
end;

procedure TFrmConta.FormCreate(Sender: TObject);
begin
  FrmConta := Self;
end;

initialization
  FrmConta := nil;

end.
