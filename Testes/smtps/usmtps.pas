unit usmtps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdIntercept, IdServerInterceptLogBase,
  IdServerInterceptLogFile, DB, ADODB, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdTCPServer, IdCmdTCPServer,
  IdExplicitTLSClientServerBase, IdSMTPServer, IdMessage,idcontext,idsync,ActiveX;

type
 // just some testrecord
  TTestRec = record
    IntField  : integer;
    CharField : char;
    ByteField : byte;
    StrField  : string[20];
  end;
  PTTestRec = ^TTestRec;
 TShowMessageSync = class(TIdSync)
        protected
            FMsg: TIdMessage;
        public
            procedure DoSynchronize; override;
            constructor Create(tMsg: TIdMessage); reintroduce;
            class procedure Show(tMsg: TIdMessage);
        end;


  TForm1 = class(TForm)
    btnserveron: TButton;
    btnserveroff: TButton;
    IdSMTPServer1: TIdSMTPServer;
    ado1: TADOTable;
    q: TADOQuery;
    ADOConnection1: TADOConnection;
    LogFile: TIdServerInterceptLogFile;
    mess: TIdMessage;
    Label1: TLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Label2: TLabel;
    Label3: TLabel;
    StaticText3: TStaticText;
    Memo1: TMemo;
    Label4: TLabel;
    StaticText4: TStaticText;
    procedure btnserveronClick(Sender: TObject);
    procedure btnserveroffClick(Sender: TObject);
    procedure IdSMTPServer1MsgReceive(ASender: TIdSMTPServerContext;
      AMsg: TStream; var LAction: TIdDataReply);
    procedure IdSMTPServer1Connect(AContext: TIdContext);
    procedure IdSMTPServer1RcptTo(ASender: TIdSMTPServerContext;
      const AAddress: String; var VAction: TIdRCPToReply;
      var VForward: String);
    procedure IdSMTPServer1Received(ASender: TIdSMTPServerContext;
      var AReceived: String);
    procedure IdSMTPServer1UserLogin(ASender: TIdSMTPServerContext;
      const AUsername, APassword: String; var VAuthenticated: Boolean);
    procedure IdSMTPServer1MailFrom(ASender: TIdSMTPServerContext;
      const AAddress: String; var VAction: TIdMailFromReply);
    procedure FormCreate(Sender: TObject);
    procedure IdSMTPServer1Execute(AContext: TIdContext);
    procedure IdSMTPServer1Exception(AContext: TIdContext;
      AException: Exception);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
constructor TShowMessageSync.Create(tMsg: TIdMessage);
    begin
        inherited Create;
        FMsg := tMsg;
    end;

    procedure TShowMessageSync.DoSynchronize;
    begin
        Form1.Label2.Caption := FMsg.From.Address;
        Form1.Label1.Caption := FMsg.Recipients.EMailAddresses;
        Form1.Label3.Caption := FMsg.Subject;
        Form1.Memo1.Lines.AddStrings(FMsg.Body);
    end;

    class procedure TShowMessageSync.Show(tMsg: TIdMessage);
    begin
        with Create(tMsg) do try
            Synchronize;
        finally
            Free;
        end;
    end;
    {
    procedure TForm1.IdSMTPServer1MsgReceive(ASender: TIdSMTPServerContext;
AMsg: TStream; var LAction: TIdDataReply);
    var
        LMsg : TIdMessage;
    begin
        LMsg := TIdMessage.Create(nil);
        try
            LMsg.NoDecode := true;
            LMsg.LoadFromStream(AMsg, False);
            LMsg.SaveToFile('test.txt', False);
            TShowMessageSync.Show(LMsg);
        finally
            FreeAndNil(LMsg);
        end;
    end;
   }





procedure TForm1.btnserveronClick(Sender: TObject);
begin
 btnServerOn.Enabled := False;
 btnServerOff.Enabled := True;
 IdSMTPServer1.active := true;
end;

procedure TForm1.btnserveroffClick(Sender: TObject);
begin
 btnServerOn.Enabled := True;
 btnServerOff.Enabled := False;
 IdSMTPServer1.active := false;
end;

procedure TForm1.IdSMTPServer1MsgReceive(ASender: TIdSMTPServerContext;
  AMsg: TStream; var LAction: TIdDataReply);
 var
 lmsg : TIdMessage;
 LStream : TFileStream;
 toad,from,sub,body:string;
 abuff:tstrings;
 six:int64;
  begin

 CoInitialize(nil);
  six:=amsg.Size;
  LStream := TFileStream.Create(ExtractFilePath(Application.exename) + 'test.eml', fmCreate);
Try
 LStream.CopyFrom(AMsg, 0);
Finally
 FreeAndNil(LStream);
End;
  mess.NoDecode:=true;
 mess.LoadFromFile('test.eml',false);
 label4.Caption:=datetostr(mess.Date);
  label1.Caption:=mess.Recipients.EMailAddresses;
  label2.Caption:=mess.From.Address;
  label3.Caption:=mess.Subject;
  memo1.Lines.Text:=mess.Body.Text;
//if mess.From.Address <> '' then begin
ado1.TableName:='email';
ado1.Active:=true;
ado1.Insert;
ado1.FieldByName('to').Text:=mess.Recipients.EMailAddresses;
ado1.FieldByName('from').Text:= mess.From.Address;
ado1.FieldByName('subject').Text:=mess.Subject;
ado1.FieldByName('mbody').AsString:=mess.Body.Text;
//Date: Wed, 1 Feb 2006 17:34:43 +0000
ado1.FieldByName('mdate').AsDateTime:=mess.Date;
ado1.FieldByName('msize').value:=six;
ado1.FieldByName('ismarked').value:=0;
ado1.Post;
CoUnInitialize;
//end;
end;

procedure TForm1.IdSMTPServer1Connect(AContext: TIdContext);
begin
//idsmtpserver1.Greeting.SetReply(220,'Welcome to Jacques Noah Server');
//logfile.Accept(acontext.Connection);
end;

procedure TForm1.IdSMTPServer1RcptTo(ASender: TIdSMTPServerContext;
  const AAddress: String; var VAction: TIdRCPToReply;
  var VForward: String);
begin

  // The following actions can be returned to the server:
 {
    rAddressOk, //address is okay
    rRelayDenied, //we do not relay for third-parties
    rInvalid, //invalid address
    rWillForward, //not local - we will forward
    rNoForward, //not local - will not forward - please use
    rTooManyAddresses, //too many addresses
    rDisabledPerm, //disabled permentantly - not accepting E-Mail
    rDisabledTemp //disabled temporarily - not accepting E-Mail
 }
  if Pos('@', AAddress) > 0 then  begin
 VAction := rAddressOk;
 end
 else begin
  VAction :=rInvalid;
 end;
end;

procedure TForm1.IdSMTPServer1Received(ASender: TIdSMTPServerContext;
  var AReceived: String);
begin
  // This is a new event in the rewrite of IdSMTPServer for Indy 10.
 // It lets you control the Received: header that is added to the e-mail.
 // If you do not want a Received here to be added, set AReceived := '';
 // Formatting 'keys' are available in the received header -- please check
 // the IdSMTPServer source for more detail.
 AReceived := '';
end;

procedure TForm1.IdSMTPServer1UserLogin(ASender: TIdSMTPServerContext;
  const AUsername, APassword: String; var VAuthenticated: Boolean);
begin
 // This event is fired if a user attempts to login to the server
 // Normally used to grant relay access to specific users etc.
 if (AUsername='jacques') and (APassword='noah') then begin
 VAuthenticated := True;
 end else begin
 VAuthenticated := False;
 end;
end;

procedure TForm1.IdSMTPServer1MailFrom(ASender: TIdSMTPServerContext;
  const AAddress: String; var VAction: TIdMailFromReply);
begin
 // Here we are testing the MAIL FROM line sent to the server.
 // MAIL FROM address comes in via AAddress. VAction sets the return action to the server.
  // if Pos('@', AAddress) > 0 then  begin
 // The following actions can be returned to the server:
 { mAccept, mReject }

 // For now, we will just always allow the mail from address.
 VAction:= mAccept;
{
 end
 else begin
  VAction := mReject;
 end;    }
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

idsmtpserver1.Greeting.SetReply(220,'Welcome to SMTP Server');
end;

procedure TForm1.IdSMTPServer1Execute(AContext: TIdContext);
begin
logfile.DoLogWriteString(acontext.Connection.IOHandler.ReadLn);

end;

procedure TForm1.IdSMTPServer1Exception(AContext: TIdContext;
  AException: Exception);
begin
acontext.Connection.IOHandler.Write(aexception.Message);
end;

end.
