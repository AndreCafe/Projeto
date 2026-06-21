unit uRSdmEmail;

interface

uses
  SysUtils, Classes, IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient,
  IdSMTP, IdBaseComponent, IdMessage;

type
  TdmEmail = class(TDataModule)
    Msg: TIdMessage;
    SMTP: TIdSMTP;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SendEmail(aTo: String; aAssunto, aCorpo, aAnexos: String; aTipo: Integer;
                        const aUsername: string = ''; 
                        const aPassword: string = '');
  end;

var
  dmEmail: TdmEmail;

implementation

{$R *.dfm}

{ TdmEmail }


{ TdmEmail }

procedure TdmEmail.SendEmail(aTo: String; aAssunto, aCorpo, aAnexos: String; aTipo: Integer; const aUsername,
  aPassword: string);
var 
  sl: TStrings; i: integer;
begin
  sl := TStringList.Create;
  try
    try
      Msg.Subject := aAssunto;
      Msg.Recipients.Clear;
      Msg.Recipients.Clear;
      Msg.Recipients.Add.Address := aTo;
      SL.Text := aAnexos;
      Msg.Body.Text := aCorpo;
      Msg.Subject := aAssunto;
      Msg.MessageParts.Clear;
      for I := 0 to SL.Count - 1 do
        with TidAttachment.Create(Msg.MessageParts, SL.ValueFromIndex[I]) do
          FileName := SL.Names[I];
      I := 10;
      while (I>0) do begin
        try
          smtp.Connect;
          I := -1;
        except
          Dec(i);
          Sleep(Random(5000));
        end;
      end;
      if smtp.Connected then begin
        try
          smtp.Send(Msg);
        finally
          smtp.Disconnect;
        end;
      end;
    except
    end;
  finally
    SL.Free;
  end;
end;

end.
