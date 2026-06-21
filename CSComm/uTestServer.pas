unit uTestServer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CSCMsgProcessor, CSCBase, CSCCustomBase, CSCServer, CSCClient, CSCQueue, ScktComp,
  StdCtrls, uDefMsg;

type
  TForm1 = class(TForm)
    Server: TCSCServer;
    MsgProc: TCSCMsgProcessor;
    LB: TListBox;
    procedure ServerConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure MsgProcMsgRec(Sender: TObject; Msg: TCSCMessage);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Login(Msg: TCSCMessage);
    procedure Texto(Msg: TCSCMessage);
    { Public declarations }

    procedure SendEventEverybody(MsgID: Longint; aData: Pointer; DataLen: Integer; MsgType: Byte);
    
    procedure Conectou(A: PAutentica);
    procedure Desconectou(A: PAutentica);

  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Conectou(A: PAutentica);
const
  AutSN : Array[Boolean] of String = ('Nao', 'Sim');
var 
  I : Integer;
begin
  I := LB.Items.IndexOfObject(TObject(A));
  if I = -1 then 
    I := LB.Items.AddObject(A^.FUsername, TObject(A));
    
  LB.Items.Strings[I] := A^.FUsername + ' Autenticou = ' + AutSN[A^.FAutenticou];
end;

procedure TForm1.Desconectou(A: PAutentica);
begin
  with LB.Items do 
  Delete(IndexOfObject(TObject(A)));
end;
    
procedure TForm1.ServerConnect(Sender: TObject; Socket: TCustomWinSocket);
var A : PAutentica;
begin
  New(A);
  A^.FAutenticou := False;
  A^.FUsername   := '';
  Socket.Data := A;
  Conectou(A);
end;

procedure TForm1.ServerDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
var 
  A : PAutentica;
  EvLogout : TnmevLoginLogout;
begin
  A := Socket.Data;

  // se o cara já se autenticou avisa todo mundo que ele se foi
  if A^.FAutenticou then begin
    A^.FAutenticou := False;
    EvLogout.nmUsername := A^.FUsername;
    SendEventEverybody(nmevLogout, @EvLogout, SizeOf(EvLogout), nmdByteArray);
  end;  
  
  Desconectou(A);
  
  Dispose(A);
end;

procedure TForm1.MsgProcMsgRec(Sender: TObject; Msg: TCSCMessage);
begin
  with Msg do 
  case dmMsg of
    nmLogin : Login(Msg);
    nmTexto : Texto(Msg);
  end;  
end;

procedure TForm1.Texto(Msg: TCSCMessage);
var 
  Ret: Integer;
  I: Integer;
  A : PAutentica;
  Sck : TCustomWinSocket;
  S : TStream;
  Dest : TnmevLoginLogout;
  Origem : TnmevLoginLogout;
begin
  Ret := 0;
  with Msg do
  try
    S := TStream(dmData);
    S.ReadBuffer(Dest, SizeOf(Dest));
    
    Origem.nmUsername := PAutentica(dmClientSck.Data)^.FUserName;
    S.Position := 0;
    S.WriteBuffer(Origem, SizeOf(Origem));
    S.Position := 0;
  except
    Ret := errExcecaoInesperada;
  end;  
  
  with Msg do
  Server.SendMsg(nmTexto, False, dmClientSck, nil, 0, nmdByteArray, Ret);
      
  with Msg do
  if Ret = 0 then 
    SendEventEverybody(nmevTexto, S, S.Size, nmdStream);
end;

procedure TForm1.Login(Msg: TCSCMessage);
var 
  Ret: Integer;
  I: Integer;
  EvLogin : TnmevLoginLogout;
  A : PAutentica;
  Sck : TCustomWinSocket;
begin
  Ret := 0;
  with Msg, PnmLogin(dmData)^ do
  try
    if (nmSenha <> DefSenha) then 
      Ret := errSenhaInvalida
    else begin
      A := PAutentica(dmClientSck.Data);
      A^.FAutenticou := True;
      A^.FUsername := nmUsername;
      Conectou(A);
    end;  
      
  except
    Ret := errExcecaoInesperada;
  end;  
  with Msg do
  Server.SendMsg(nmLogin, False, dmClientSck, nil, 0, nmdByteArray, Ret);
      
  with Msg, PnmLogin(dmData)^ do
  if Ret = 0 then begin
    EvLogin.nmUsername := nmUsername;
    SendEventEverybody(nmevLogin, @EvLogin, SizeOf(TnmevLoginLogout), nmdByteArray);
  end; 

  with Server, Daemon.Socket do
  for I := 0 to pred(ActiveConnections) do begin
    Sck := Connections[I];
    A := PAutentica(Sck.Data);
    EvLogin.nmUsername := A^.FUsername;
    if Sck <> Msg.dmClientSck then 
      SendMsg(nmevLogin, True, Msg.dmClientSck, @EvLogin, SizeOf(EvLogin), nmdByteArray, 0);
  end;
end;

procedure TForm1.SendEventEverybody(MsgID: Integer; aData: Pointer; DataLen: Integer;
  MsgType: Byte);
var 
  I : Integer;  
  Sck : TCustomWinSocket;
begin
  with Server, Daemon.Socket do
  for I := 0 to pred(ActiveConnections) do begin
    Sck := Connections[I];
    if PAutentica(Sck.Data)^.FAutenticou then
      SendMsg(MsgID, True, Sck, aData, DataLen, MsgType, 0);
  end;    
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Server.Listening := True;
end;

end.
