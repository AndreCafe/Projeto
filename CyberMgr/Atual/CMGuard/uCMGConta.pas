unit uCMGConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFrmConta = class(TForm)
    btnSim: TBitBtn;
    btnCanc: TBitBtn;
    Panel1: TPanel;
    lbValor: TLabel;
    lbTempo: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    Panel2: TPanel;
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
  Panel2.Caption := IntToStr(FContador);  
end;

procedure TFrmConta.FormCreate(Sender: TObject);
begin
  FrmConta := Self;
end;

initialization
  FrmConta := nil;

end.
