unit uDTSrvConsole;

interface

uses
  Windows, Messages, SysUtils, licClasses, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, LMDCustomScrollBox, LMDListBox;

type
  TFrmPri = class(TForm)
    btnFechar: TButton;
    Button1: TButton;
    lbNome: TLabel;
    LB: TLMDListBox;
    Timer1: TTimer;
    procedure btnFecharClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FInicio : Cardinal;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

implementation

uses uDTFrmChave, uDTSyncDEF, uDTSrvBDServ;

const
  SegMS = 1000;
  MinMS = SegMS * 60;
  HorMS = MinMS * 60;
  DiaMS = HorMS * 24;


{$R *.DFM}

procedure TFrmPri.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPri.Button1Click(Sender: TObject);
begin
  with LicencaGlobal do begin
    AsString := TFrmChave.Create(nil).Liberar(AsString);
    SalvaArquivoPadrao;
  end;
end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
  lbNome.Caption := 'ARM='+cfgNomeArm;
  Application.Title := cfgNomeArm + ' - Servidor Diatec';
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  FInicio := GetTickCount;
end;

procedure TFrmPri.Timer1Timer(Sender: TObject);
var 
  Tempo : Cardinal;
  D, H, M, S : Word;
  St : String;
begin
  Tempo := GetTickCount - FInicio;
  D := Tempo div DiaMS;
  Tempo := Tempo mod DiaMS;
  H := Tempo div HorMS;
  Tempo := Tempo mod HorMS;
  M := Tempo div MinMS;
  Tempo := Tempo mod MinMS;
  S := Tempo div SegMS;
  St := '';
  if D > 0 then 
  if D > 1 then
    St := IntToStr(D) + ' dias, '
  else
    St := '1 dia, ';
  St := St + IntToStr(H) + 'h, ' +
        IntToStr(M) + 'm, ' +
        IntToStr(S) + 's';
  LB.Items[0] := 'Versão;'+Copy(cfgVersao, 1, 1) + '.' + Copy(cfgVersao, 2, 2);
  LB.Items[1] := 'Tempo de Execução;'+St;
  LB.Items[2] := 'Clientes Conectados;'+IntToStr(NumClientesCon);
end;

end.
