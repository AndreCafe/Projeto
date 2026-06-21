unit uTestClient;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CSCBase, CSCCustomBase, CSCClient, uDefMsg, StdCtrls, CSCMsgProcessor, CSCQueue;

type
  TForm1 = class(TForm)
    Cliente: TCSCClient;
    MsgProc: TCSCMsgProcessor;
    Button1: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    cbUsuarios: TComboBox;
    Button2: TButton;
    LB: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure ClienteConnect(Sender: TObject);
    procedure MsgProcMsgRec(Sender: TObject; Msg: TCSCMessage);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Login(Username: String);
    { Public declarations }
    procedure Conectou(Username: String);
    procedure Desconectou(Username : String);

  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Conectou(Username: String);
begin
  cbUsuarios.Items.Add(Username);
end;

procedure TForm1.Desconectou(Username : String);
begin
  with cbUsuarios.Items do
  Delete(IndexOf(Username));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Cliente.Connected := True;
end;

procedure TForm1.Login(Username: String);
var
  LoginReq : TnmLogin;
  Ret : Integer;
begin
  LoginReq.nmUsername := Username;
  LoginReq.nmSenha    := DefSenha;
  Ret := Cliente.RequestData(nmLogin, @LoginReq, SizeOf(LoginReq), 
                             nmdByteArray, nil, 0, nmdByteArray);
  if Ret <> 0 then
    ShowMessage('Erro '+IntToStr(Ret));                           
end;

procedure TForm1.ClienteConnect(Sender: TObject);
begin
  Login(Edit1.Text);
end;

procedure TForm1.MsgProcMsgRec(Sender: TObject; Msg: TCSCMessage);
var 
  Origem: TnmevLoginLogout;
  S : TStream;
begin
  with Msg do
  case dmMsg of
    nmevLogin : with TnmevLoginLogout(dmData^) do
      Conectou(nmUsername);
      
    nmevLogout : with TnmevLoginLogout(dmData^) do
      Desconectou(nmUsername);

    nmevTexto : begin
      S := TStream(dmData);
      S.ReadBuffer(Origem, SizeOf(Origem));
      LB.Items.Append(Origem.nmUserName);
      LB.Items.Append('------------------');
      LB.Items.LoadFromStream(S);
      LB.Items.Append('');
    end;  
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var 
  S : TStream;
  Dest: TnmevLoginLogout;
  Erro : Integer;
begin
  S := TMemoryStream.Create;
  try
    Dest.nmUsername := cbUsuarios.Text;
    S.Write(Dest, SizeOf(Dest));
    Memo1.Lines.SaveToStream(S);
    Erro := Cliente.RequestData(nmTexto, S, S.Size, nmdStream, nil, 0, nmdByteArray);
    if Erro <> 0 then
      ShowMessage('Erro: '+IntToStr(Erro));
  finally
    S.Free;
  end;  
end;

end.
