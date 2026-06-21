unit uTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, kbmMWCustomTransport, kbmMWClient, kbmMWTCPIPIndyTransport,
  StdCtrls, ovcsf, ovcbase, ovcef, ovcpb, ovcnf, ExtCtrls;

type
  TForm1 = class(TForm)
    btnConectar: TButton;
    Button2: TButton;
    Button3: TButton;
    mwCli: TkbmMWSimpleClient;
    mwTCPIP: TkbmMWTCPIPIndyClientTransport;
    edCod: TOvcNumericField;
    edSenha: TOvcSimpleField;
    Label1: TLabel;
    Label2: TLabel;
    lbTotal: TLabel;
    lbRestante: TLabel;
    edUsuario: TEdit;
    Label3: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure btnConectarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure mwTCPIPConnectionLost(Sender: TObject);
    procedure mwTCPIPDisconnected(Sender: TObject;
      Info: TkbmMWCustomTransportInfo);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    FInicioTicks : Cardinal;
    FTicksTotal  : Cardinal; 
    procedure KeepAlive;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnConectarClick(Sender: TObject);
begin
  if mtTCPIP.Active then
    mwTCPIP.Active := False
  else begin  
    mwTCPIP.Active := True;
    try
      mwCli.Username := edCod.AsString;
      mwCli.Password := edSenha.AsString;
      KeepAlive;
    except
      mwTCIP.Active := False;
      Raise;
    end;
  end;  
end;

procedure TForm1.KeepAlive;
begin
  mwCli.Request('QS', '100', 'KeepAlive', []);
  Timer1.Enabled := True;
  btnConectar.Caption := 'Desconectar';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if mwTCPIP.Active then
    KeepAlive;
end;

procedure TForm1.mwTCPIPConnectionLost(Sender: TObject);
begin
  btnConectar.Caption := 'Conectar';
  Timer1.Enabled := False;
end;

procedure TForm1.mwTCPIPDisconnected(Sender: TObject;
  Info: TkbmMWCustomTransportInfo);
begin
  btnConectar.Caption := 'Conectar';
  Timer1.Enabled := False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FInicioTicks := 0;
  FTotalTicks  := 0;
end;

procedure TForm1.Button2Click(Sender: TObject);
var 
  V : Variant;
begin
  V := mwCli.Request('QS', '100', 'UserLogin', [edUsuario.Text]);
  if VarType(V) in [varSmallint, varInteger, varShortInt, varByte, varWord] then begin
    FTicksInicio := GetTickCount;    FTicksTotal $0011;  varWord     = $0012;  end;

end.
