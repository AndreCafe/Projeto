unit uSuporte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellApi, LMDCustomComponent, lmdcont, ExtCtrls;

type
  TForm1 = class(TForm)
    Arqs: TLMDGenericList;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
var
  CFG: TStringList;
  S: String;
begin
  Timer1.Enabled := False;
  // Write simple configuration file for RemoteHost.exe
  // It is assumed that RemoteHost.exe is located in the same folder
  // with your application
  S := ExtractFilePath(ParamStr(0))+'SuporteR.exe';
  Arqs.Items[0].SaveTOFile(S);
  CFG := TStringList.Create;
  try
    CFG.Add('[RemoteHost]');
    CFG.Add('User=');
    CFG.Add('Address=suporte.nextar.com.br');
    CFG.Add('Port=AJ');                  
    CFG.Add('AllowModify=0');

    Cfg.Add('[Messages]');
    Cfg.Add('UnableToConnect=Não foi possível conectar ao suporte técnico da Nextar!');

    Cfg.Add('[MainForm]');
    Cfg.Add('mnuEndSession.Caption=Finalizar Suporte');
    Cfg.Add('cbxPorts.Visible=True');
    Cfg.Add('Caption=Assistência Remota');
    Cfg.Add('lblHelpDeskPort.Caption=Selecionar Técnico:');
    Cfg.Add('lblHelpDeskAddr.Caption=Endereço:');
    Cfg.Add('lblUsername.Caption=Loja');
    Cfg.Add('btnConnect.Caption=OK');
    Cfg.Add('btnCancel.Caption=Cancelar');
    Cfg.Add('lblMessage.Left=42');
    Cfg.Add('lblMessage.Width=373');
    Cfg.Add('lblMessage.Caption=Solicitar Assistência Remota: Clique no botão OK para se conectar ao serviço de suporte técnico remoto da Nextar. Através dessa opção seu computador será controlado por um técnico que terá acesso total ao seu computador.');

    Cfg.Add('[Ports]');
    Cfg.Add('AJ=1973');
    Cfg.Add('Joao=1974');
    Cfg.Add('Ceci=1975');

    CFG.SaveToFile(
      IncludeTRailingBackslash(ExtractFilePath(S))
      + 'SuporteR.cfg');
  finally
    CFG.Free;
  end;
  ShellExecute(0, 'open', pchar(S), nil,
    PChar(ExtractFilePath(S)),
    SW_SHOW);
  Close;
end;

end.
