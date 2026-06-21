unit uFrmTesteReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TFrmTeste = class(TForm)
    cxButton1: TcxButton;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTeste: TFrmTeste;

implementation

uses uFrmRegistro, uLicenca;

{$R *.dfm}

procedure TFrmTeste.cxButton1Click(Sender: TObject);
var S: String;
begin
  LicencaGlobal.LeArquivoPadrao;
  LicencaGlobal.LeSerialHD;
  S := LicencaGlobal.AsString;
  S := TFrmRegistro.Create(Self).EditaLicenca(S, True);
  if S <> LicencaGlobal.AsString then begin
    LicencaGlobal.AsString := S;
    LicencaGlobal.SalvaArquivoPadrao;
  end;  
end;

end.
