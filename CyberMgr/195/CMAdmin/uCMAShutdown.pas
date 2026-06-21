unit uCMAShutdown;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFrmShutdown = class(TForm)
    rgOperacao: TRadioGroup;
    rgMaquina: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NMaq : Byte;
  end;

var
  FrmShutdown: TFrmShutdown;

implementation

uses cmIDRecursos, uCMFrmPri, uCMDados;

{$R *.DFM}

procedure TFrmShutdown.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmShutdown.FormShow(Sender: TObject);
begin
  rgMaquina.Items[0] := 'Máquina ' + IntToStr(NMaq);
end;

procedure TFrmShutdown.BitBtn1Click(Sender: TObject);
var OP:Integer;
begin
  if rgOperacao.Items.Count=2 then
    Op := rgOperacao.ItemIndex+1
  else
    Op := rgOperacao.ItemIndex;
      
  with Dados.CM do
  if rgMaquina.ItemIndex=0 then
    ShutDownMaq(NMaq, Op)
  else
    ShutDownMaq(0, Op);
    
  Close;  
end;

procedure TFrmShutdown.FormCreate(Sender: TObject);
begin
  if not Permitido(daMaqFecharCMGuard) then
    rgOperacao.Items.Delete(0);
end;

end.
