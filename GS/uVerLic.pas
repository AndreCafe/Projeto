unit uVerLic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uLicenca, ovcbase, ovcef, ovcpb, ovcpf;

type
  TForm1 = class(TForm)
    Button1: TButton;
    edSerie: TEdit;
    Label1: TLabel;
    edMaq: TEdit;
    edData: TOvcPictureField;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  L : TLicenca;
  Form1: TForm1;

implementation


{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  L.liSenha := L.SenhaCorreta;
  L.liVencimento := edData.AsDateTime;
  L.liCodLoja := 500;
  L.liTipo := tlTeste;
  L.liSerialHD := edSerie.Text;
  L.liMaquinas := StrToIntDef(edMaq.Text, 1);
  Label1.Caption := L.CodLojaAsString + '   ' + Copy(L.AsStringSemHD, 1, 19);
end;

end.
