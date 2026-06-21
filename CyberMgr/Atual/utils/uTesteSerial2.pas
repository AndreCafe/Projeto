unit uTesteSerial2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ovcpf, ovcbase, ovcef, ovcpb, ovcnf, {EXECryptorKeyGen,}
  ovcsc;

type
  TFrmPri = class(TForm)
    edLoja: TOvcNumericField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edTipo: TComboBox;
    edVenc: TOvcPictureField;
    edEquip: TEdit;
    Button1: TButton;
    edSerial: TEdit;
    edMaq: TOvcNumericField;
    Label5: TLabel;
    Button2: TButton;
    OvcSpinner1: TOvcSpinner;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;
//  KG : TKeyGen;
  Caminho : String;

implementation

{uses uLicEXECryptor; }

{$R *.dfm}

procedure TFrmPri.Button1Click(Sender: TObject);
begin
{  edSerial.Text := {DateToDateLic(edVenc.AsDateTime) + '-' + 
                   KG.CreateSerialNumberEx(Caminho+'cm.ep2', 
                                           edLoja.AsString+'-'+edVenc.AsString,
                                           False, False, False, False, False, False,
                                           edTipo.ItemIndex, edMaq.AsInteger);   }
end;

procedure TFrmPri.Button2Click(Sender: TObject);
begin
//  KG := TKeyGen.Create(Caminho);
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
//  Caminho := ExtractFilePath(ParamStr(0));
end;

procedure TFrmPri.FormDestroy(Sender: TObject);
begin
//  KG.Free;
end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
{  edLoja.AsInteger := 0;
  edMaq.AsInteger := 10;
  edVenc.AsDateTime := Date;    }
end;

end.
