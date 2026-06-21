unit ncCliAtualizaLic;

interface

uses
  SysUtils, Classes, CSCBase,
  Windows, Messages, ExtCtrls, uLicEXECryptor,
  IdHTTP;

type

  TdmAtualizaLic = class(TDataModule)
  private
    { Private declarations }
  public
    function ObtemNovaLic(RaiseEx: Boolean = False): String;
    { Public declarations }
  end;

  TThreadAtualizaLic = class ( TThread )
  protected
    procedure Execute; override;
  end;

var
  dmAtualizaLic: TdmAtualizaLic;
  clilic_versao      : String  = 'x.x.x.x';
  clilic_codequip    : String  = '';
  clilic_vencimento  : String  = '';  // dd/mm/yyyy — preencher antes de chamar ObtemNovaLic
  clilic_qtdlic      : Integer = 0;
  clilic_codloja     : Integer = 0;
  clilic_notifyhandle: HWND    = 0;

implementation

uses
  JTimer, ncClassesBase, ncErros;

{$R *.dfm}

function TdmAtualizaLic.ObtemNovaLic(RaiseEx: Boolean = False): String;
const
  HOSTS: array[0..1] of String = (
    'licencas.nexcafe.com.br',
    'joaoborges.dyndns.org'
  );
  PORTA = 2233;
  TIPO  = 5;
  VPLANO = 3;
var
  Http: TIdHTTP;
  URL : String;
  I   : Integer;
  P   : ncPString;
begin
  Result := '';
  Http := TIdHTTP.Create(nil);
  try
    Http.ConnectTimeout := 10000;
    Http.ReadTimeout    := 15000;
    for I := Low(HOSTS) to High(HOSTS) do
    try
      URL := Format(
        'http://%s:%d/?vencimento=%s&codequip=%s&tipo=%d&vplano=%d&loja=%d',
        [HOSTS[I], PORTA,
         clilic_vencimento, clilic_codequip,
         TIPO, VPLANO,
         clilic_codloja]);
      Result := Http.Get(URL);
      if Result <> '' then begin
        New(P);
        P^ := Result;
        PostMessage(clilic_notifyhandle, cscm_RefreshLic, Integer(P), 0);
        Break; // sucesso no primeiro host que responder
      end;
    except
      if (I = High(HOSTS)) and RaiseEx then raise;
      // senao tenta proximo host
    end;
  finally
    Http.Free;
  end;
end;

{ TThreadAtualizaLic }

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

procedure TThreadAtualizaLic.Execute;
var 
  DM : TdmAtualizaLic;
  Dummy: Integer;
begin
  DM := TdmAtualizaLic.Create(nil);
  try
    DM.ObtemNovaLic;
  finally
    DM.Free;
  end;
end;

end.

