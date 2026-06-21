unit uFrmPri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, Menus, StdCtrls, ExtCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxSpinEdit, SsBase, StTrIcon, rtcDataSrv, rtcInfo,
  rtcConn, rtcHttpSrv;

type
  TFrmPri = class(TForm)
    MainMenu1: TMainMenu;
    Arqiuvo1: TMenuItem;
    ConfigurarOperadoraerota1: TMenuItem;
    miPorta: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    miCOM1: TMenuItem;
    miCOM2: TMenuItem;
    miCOM3: TMenuItem;
    miCOM4: TMenuItem;
    miCOM5: TMenuItem;
    miCOM6: TMenuItem;
    miCOM7: TMenuItem;
    miCOM8: TMenuItem;
    edTipoTel: TRadioGroup;
    LMDSimplePanel1: TLMDSimplePanel;
    edTel: TcxTextEdit;
    btnDiscar: TcxButton;
    Memo1: TMemo;
    Timer1: TTimer;
    TI: TStTrayIcon;
    HS: TRtcHttpServer;
    dpDiscar: TRtcDataProvider;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure miCOM8Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure btnDiscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dpDiscarCheckRequest(Sender: TRtcConnection);
    procedure dpDiscarDataReceived(Sender: TRtcConnection);
    procedure Timer2Timer(Sender: TObject);
    procedure ConfigurarOperadoraerota1Click(Sender: TObject);
  private
    hCommFile: THandle;  
    
    function GetPorta: Integer;
    procedure SetPorta(const Value: Integer);

    procedure OpenCOM;
    procedure CloseCOM;

    function PortaStr: String;

    procedure _Write(s: String);

    procedure _Discar(s: String);

    procedure WMDiscar(var Msg: TMessage);
      message WM_User + 1;  
    
    { Private declarations }
  public
    { Public declarations }
    property Porta: Integer
      read GetPorta write SetPorta;
  
    
  end;

  TDiscarInfo = record
    diTipoTel : String[5];
    diTel : String[15]; 
  end;
  PDiscarInfo = ^TDiscarInfo;

  procedure SaveConfig;

  function Rota(TT: Byte): String;

  function Operadora(TT: Byte): String;
  

var
  FrmPri: TFrmPri;
  slConfig : TStrings;
  ArqConfig : String;
  ix : integer;
  
const
  NomesTT : Array[0..5] of String = ('fixo', 'vivo',  'tim',  'claro',  'oi',  'outros');
  RotaDef : Array[0..5] of String = ('0',    '84',    '82',   '0',      '83',  '0');
  OperDef : Array[0..5] of String = ('21',   '15',    '41',   '21',     '14',  '21');
  
implementation

uses uFrmDiscar, uConfig;

{$R *.dfm}

function SoDig(s: String): String;
var i: integer;
begin
  Result := '';
  for i := 1 to Length(s) do 
    if s[i] in ['0'..'9'] then
      Result := Result + s[i];
end;

function Rota(TT: Byte): String;
begin
  if not TT in [0..5] then TT := 0;
  Result := slConfig.Values['rota_'+NomesTT[TT]];
  if Trim(Result)='' then Result := RotaDef[TT];
end;

function Operadora(TT: Byte): String;
begin
  if not TT in [0..5] then TT := 0;
  Result := slConfig.Values['oper_'+NomesTT[TT]];
  if Trim(Result)='' then Result := OperDef[TT];
end;

procedure TFrmPri.btnDiscarClick(Sender: TObject);
var s: string;
begin
  s := SoDig(edTel.Text);
  while copy(s, 1, 1)='0' do Delete(s, 1, 1);

  if length(s)>8 then 
  if copy(s, 1, 2)='48' then
    Delete(S, 1, 2) else
    s := '0'+ operadora(edTipoTel.ItemIndex)+s;
    
  s := rota(edTipoTel.ItemIndex)+s;

  TFrmDiscar.Create(Self).ShowModal;

  _Discar(s);
end;

procedure TFrmPri.CloseCOM;
begin
  if hCommFile <> INVALID_HANDLE_VALUE then begin
    CloseHandle(hCommFile); //Fecha a porta de Comunicação
    hCommFile := INVALID_HANDLE_VALUE;
  end;  
end;

procedure TFrmPri.ConfigurarOperadoraerota1Click(Sender: TObject);
begin
  TFrmConfig.Create(Self).ShowModal;
end;

procedure TFrmPri.dpDiscarCheckRequest(Sender: TRtcConnection);
var 
  s: String;
begin
  with TRTCDataServer(Sender) do begin
    Request.Accepted := (pos('&tipotel=', Request.URI)>0);
{    Self.Caption := Request.URI;
    S := Trim(Request.Filename);
    while copy(S, 1, 1)= '/' do Delete(S, 1, 1);
    Request.Accepted := (S='');}
  end;
end;

procedure TFrmPri.dpDiscarDataReceived(Sender: TRtcConnection);
var 
  P : PDiscarInfo;
  S : String;
  I : Integer;
begin                                                               
  with TRTCDataServer(Sender) do begin                              
    if Request.Complete then
    if SameText(Request.Method, 'get') then begin
      System.New(P);
      I := Pos('&', Request.URI);
      P^.diTel := Copy(Request.URI, 6, I-6);
      P^.diTipoTel := Copy(Request.URI, I+9, 1);
{      P^.diTipoTel := Request.Query.asString['tipotel'];
      P^.diTel := Request.Query.asString['tel'];}
//      Self.Caption := P^.diTipoTel + ' = ' + P^.diTel;
      Write('<html></html>');
      PostMessage(Handle, wm_user+1, Integer(P), 0);
    end;
  end;
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  hCommFile := INVALID_HANDLE_VALUE;
  HS.Listen;
end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
  Porta := StrToIntDef(slConfig.Values['porta'], 3);  
end;

function TFrmPri.GetPorta: Integer;
begin
  Result := miPorta.Tag;
end;

procedure SaveConfig;
begin
  slConfig.SaveToFile(ArqConfig);
end;

procedure TFrmPri.miCOM8Click(Sender: TObject);
begin
  Porta := TMenuItem(Sender).Tag;
  slConfig.Values['porta'] := IntToStr(Porta);
  SaveConfig;
end;

procedure TFrmPri.OpenCOM;
begin
  CloseCOM;
  
  hCommFile:= 
    CreateFile( 
      PChar(PortaStr), 
      GENERIC_WRITE,0, //not shared     
      nil, //no security
      OPEN_EXISTING,
      FILE_ATTRIBUTE_NORMAL,0 {template} );

  if hCommFile = INVALID_HANDLE_VALUE then //Verifica a abertura da porta
  begin
    memo1.lines.clear;
    memo1.lines.add('Não foi possível abrir a porta '+PortaStr+'.');
    CloseHandle(hCommFile);
  end else
    memo1.Lines.add('Porta '+PortaStr+' aberta com sucesso');
end;

function TFrmPri.PortaStr: String;
begin
  Result := 'COM'+IntToStr(Porta);
end;

procedure TFrmPri.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPri.SetPorta(const Value: Integer);
begin
  if miPorta.Tag<>Value then begin
    miPorta.Tag := Value;
    miPorta.Items[Value-1].Checked := True;
    OpenCOM;
  end;
end;

procedure TFrmPri.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  _Write('ATH');
  Memo1.Lines.Add('Fim de discagem');
end;

procedure TFrmPri.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  btnDiscar.Click;
end;

procedure TFrmPri.WMDiscar(var Msg: TMessage);
var P : PDiscarInfo;
begin
  P := PDiscarInfo(Msg.WParam);
  try
    edTipoTel.ItemIndex := StrToIntDef(P.diTipoTel, 0);
    edTel.Text := P.diTel;
    Timer2.Enabled := True;
  finally
    Dispose(P);
  end;
end;

procedure TFrmPri._Discar(s: String);
begin
  if hCommFile = INVALID_HANDLE_VALUE then begin
    Memo1.Lines.Add('Não foi possível abrir a porta de comunicação');
    Exit;
  end;

{  s2 := 'ATS7=60S30=0M1\N3%C3&K3B0N1X1'+#13#10;
  NumberWritten:=0; //Envia a String de Comando
  Status:=WriteFile( hCommFile,PChar(s2)[0],Length(s2),NumberWritten,nil);}

  _Write('ATDT'+s);
  memo1.lines.add('Discando: '+s+'...');
  Timer1.Enabled := False;
  Timer1.Interval := Length(S)*600;
  Timer1.Enabled := True;
end;

procedure TFrmPri._Write(s: String);
var
  Status: LongBool;
  NumberWritten: DWORD;
  Buf : array [0..1023] of Byte;
begin
  NumberWritten:=0; //Envia a String de Comando
  s := s + #13#10;
  Status:=WriteFile( hCommFile,PChar(s)[0],Length(s),NumberWritten,nil);
end;

initialization
  ArqConfig := ExtractFilePath(ParamStr(0))+'discador.ini';

  slConfig := TStringList.Create;

  if FileExists(ArqConfig) then 
    slConfig.LoadFromFile(ArqConfig);
    

finalization
  slConfig.Free;  

end.

21-
