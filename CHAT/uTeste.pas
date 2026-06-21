unit uTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, kbmMWCustomTransport, kbmMWClient,
  kbmMWCustomMessagingTransport, kbmMWTCPIPIndyMessagingTransport, chBase,
  chKBM, ExtCtrls, chfrBase, chfrPadrao;

type
  TForm1 = class(TForm)
    Client: TkbmMWSimpleClient;
    Transp: TkbmMWTCPIPIndyMessagingClientTransport;
    Panel1: TPanel;
    chFramePadrao1: TchFramePadrao;
    btnConectar: TButton;
    msgQIn: TkbmMWMemoryMessageQueue;
    msgQOut: TkbmMWMemoryMessageQueue;
    kbmMWMessageAction1: TkbmMWMessageAction;
    CHAT: TchKBMMW;
    Button1: TButton;
    Button2: TButton;
    procedure btnConectarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnConectarClick(Sender: TObject);
begin
  if CHat.Conectado then 
    Chat.Conectado := False
  else begin
    Chat.Username := 'jlborges';
    Chat.Password := 'delphi';
    Chat.Conectado := True;
    Caption := 'João L. Borges';
  end;  
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if CHat.Conectado then 
    Chat.Conectado := False
  else begin
    Chat.Username := 'fran';
    Chat.Password := 'fran';
    Chat.Conectado := True;
    Caption := 'FRAN';
  end;  
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if CHat.Conectado then 
    Chat.Conectado := False
  else begin
    Chat.Username := 'aj';
    Chat.Password := 'aj';
    Chat.Conectado := True;
    Caption := 'AJ';
  end;  
end;

end.
