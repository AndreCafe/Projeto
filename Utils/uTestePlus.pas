unit uTestePlus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, rtcDataCli, rtcInfo, rtcConn, rtcHttpCli, ExtCtrls, clipbrd;

type
  TForm41 = class(TForm)
    HC: TRtcHttpClient;
    Req: TRtcDataRequest;
    Button1: TButton;
    Req2: TRtcDataRequest;
    Edit1: TEdit;
    postTran: TRtcDataRequest;
    Button2: TButton;
    Timer1: TTimer;
    Timer2: TTimer;
    Memo1: TMemo;
    Button3: TButton;
    Button4: TButton;
    RtcDataRequest1: TRtcDataRequest;
    RtcHttpClient1: TRtcHttpClient;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ReqResponseDone(Sender: TRtcConnection);
    procedure ReqBeginRequest(Sender: TRtcConnection);
    procedure FormCreate(Sender: TObject);
    procedure postTranBeginRequest(Sender: TRtcConnection);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Req2DataReceived(Sender: TRtcConnection);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure postTranResponseDone(Sender: TRtcConnection);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    sl : TStrings;
  public
    procedure OnResp(Sender: TObject); 
    procedure OnFail(Sender: TObject);
    { Public declarations }
  end;

var
  Form41: TForm41;
  t: String;

implementation

uses ncaK, ncCommPlus;

{$R *.dfm}

procedure TForm41.Button1Click(Sender: TObject);
begin
  with Req.Request do begin
    Method:='GET';
    FileName:='/api/tokenplus/get/';
    Host:='plus.dev.nexcafe.com.br';
    Query.Text := '';
    Req.Post;
  end;
end;

procedure TForm41.Button2Click(Sender: TObject);
var 
  g: TGUID; s: string;
begin
  if CreateGUID(G)<>0 then Exit;
  T := GUIDToString(G);
  
  S := 'teste';
  with Req2.Request do begin
    Method:='GET';
    FileName:='/api/produtos/';
    Host:='plus.dev.nexcafe.com.br';
    S:='conta=samirbraga@gmail.com&tokenplus='+sl[0]+'&key='+nexGetKH(1, sl[0], '', '')+'&tokennex='+T;
    Query.Text:=S;
    Req2.Post;
//    Edit1.Text := 'http://nxp.dev/api/produtos/?'+S;
  end; 

end;

procedure TForm41.Button3Click(Sender: TObject);
begin
  with TplusPostTranReq.Create do begin
    ptrConta := 'samirbraga@gmail.com';
    ptrParceiro := '2';

    ptrIDTranParceiro := 'teste3';
    ptrDTTranParceiro := Now;
    ptrIDTranNex := 'B123456789012345678901234567890';
    ptrDTTranNex := Now;

    ptrDescr := 'credito paymentz';
    ptrValor := 13.5;
    ptrPin := 'XYZ';
    ptrSucesso := True;
    ptrObs := 'yabadabaduuuuu';

    OnResp := Self.OnResp;
    OnFail := Self.OnFail;
    Start;
  end;
end;

procedure TForm41.Button4Click(Sender: TObject);
begin
  with TplusReqProdutos.Create do begin
//    praConta := 'samirbraga@gmail.com';
    OnResp := Self.OnResp;
    OnFail := Self.OnFail;
    Start;
  end;
end;

procedure TForm41.Button5Click(Sender: TObject);
begin
  with TplusReqAdesoes.Create do begin
    praConta := 'samirbraga@gmail.com';
    OnResp := Self.OnResp;
    OnFail := Self.OnFail;
    Start;
  end;
end;

procedure TForm41.Button6Click(Sender: TObject);
begin
  with TplusReqParceiros.Create do begin
    OnResp := Self.OnResp;
    OnFail := Self.OnFail;
    Start;
  end;
end;

procedure TForm41.FormCreate(Sender: TObject);
begin
  sl := TStringList.Create;
end;

procedure TForm41.OnFail(Sender: TObject);
begin
  ShowMessage('Falhou: ' + TplusReq(Sender).LastError);
  Sender.Free;
end;

procedure TForm41.OnResp(Sender: TObject);
begin
  Memo1.Lines.Text := TplusReq(Sender).Resposta.Text;
  ShowMessage('Resposta: ' + TplusReq(Sender).Resposta.Text);
  Sender.Free;
end;

procedure TForm41.postTranBeginRequest(Sender: TRtcConnection);
begin
  HC.WriteHeader;
end;

procedure TForm41.postTranResponseDone(Sender: TRtcConnection);
begin
//  if HC.Response.Done then begin
//    Memo1.Lines.Text := HC.Read;
Memo1.Lines.Text := HC.Read;
//    Caption := HC.Read;
    Clipboard.AsText := Memo1.Lines.Text;
    HC.Disconnect;
//  end;

end;

procedure TForm41.Req2DataReceived(Sender: TRtcConnection);
var s : string;
begin
  Caption := 'DATA RECEIVED';
  if HC.Response.Done then begin
    Edit1.Text := 'Response DONE';
    sl.Text := HC.Read;
    if SameText(sl.Values['key'], nexGetKH(1, t, '', '')) then begin
      sl.Delete(0);
      s := sl.text;
      ShowMessage(UTF8ToANsi(sl.Text)); 
    end else
      ShowMessage('Chave inválida! '+sl.Values['key']);
  end;
end;

procedure TForm41.ReqBeginRequest(Sender: TRtcConnection);
begin
  HC.WriteHeader;   
end;

procedure TForm41.ReqResponseDone(Sender: TRtcConnection);
var 
  g: TGUID; s: string;
begin
  sl.text := HC.Read;
  hc.disconnect;
  Timer2.Enabled := True;
  if CreateGUID(G)<>0 then Exit;
  T := GUIDToString(G);
  Exit;
  
  

  with Req2.Request do begin
    Method:='GET';
    FileName:='/api/produtos/';
    Host:='plus.dev.nexcafe.com.br';
    S:='conta=samirbraga@gmail.com&tokenplus='+S+'&key='+nexGetKH(1, S, '', '')+'&tokennex='+T;
    Query.Text:=S;
    Req2.Post;
//    Edit1.Text := 'http://nxp.dev/api/produtos/?'+S;
  end; 
end;

procedure TForm41.Timer1Timer(Sender: TObject);
var s: string;
begin
  Timer1.Enabled := False;
  with Req2.Request do begin
    Method:='GET';
    FileName:='/api/produtos/';
    Host:='plus.dev.nexcafe.com.br';
    S:='conta=samirbraga@gmail.com&tokenplus='+sl[0]+'&key='+nexGetKH(1, sl[0], '', '')+'&tokennex='+T;
    Query.Text:=S;
    Req2.Post;
//    Edit1.Text := 'http://nxp.dev/api/produtos/?'+S;
  end; 
end;

procedure TForm41.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  
  with postTran.Request do begin
    Method := 'GET';

    Host:='plus.dev.nexcafe.com.br';
    
    FileName:='/api/transacoes/salvar/';

//    Query.asString['authenticity_token'] := sl[1];
    Query.asString['account'] := 'samirbraga@gmail.com';
{    Query.asString['partner_id'] := '2';

    Query.asString['transaction_partner_id'] := 'teste';
    Query.asString['transaction_partner_datetime'] := FormatDateTime('yyyy-mm-dd hh:mm:ss', Now);
    Query.asString['transaction_nexcafe_id'] := '123456789012345678901234567890';
    Query.asString['transaction_nexcafe_datetime'] := FormatDateTime('yyyy-mm-dd hh:mm:ss', Now);

    Query.asString['description'] := 'credito paymentz';
    Query.asString['value'] := '13.50';
    Query.asString['pin'] := 'XYZ';                                                                                      
    Query.asString['success'] := '1';
    Query.asString['comment'] := 'yabadabaduuuuu';}
    Query.asString['key'] := nexGetKH(1, sl[0], '', '');
    Query.asString['tokennex'] := t;
    Query.asString['tokenplus'] := sl[0];

    Memo1.Lines.Text := Query.Text;

    postTran.Post;
  end;      

end;

end.


<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>404 Not Found</title>
</head><body>
<h1>Not Found</h1>
<p>The requested URL /api/transacoes/salvar/ was not found on this server.</p>
<hr>
<address>Apache/2.2.14 (Ubuntu) Server at nxp.dev Port 80</address>
</body></html>

