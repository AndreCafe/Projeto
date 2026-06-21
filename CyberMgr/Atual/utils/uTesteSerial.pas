unit uTesteSerial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ovcpf, ovcbase, ovcef, ovcpb, ovcnf, EXECryptorKeyGen,
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;
  KG : TKeyGen;
  Caminho : String;

implementation

{uses uLicEXECryptor; }

{$R *.dfm}

function DataBaseLic: TDateTime;
begin
  Result := EncodeDate(2003, 1, 1);
end;

function DateToDateLic(D: TDateTime): String;
begin
  if D<=DataBaseLic then
    Result := '0000'
  else
    Result := IntToHex(Trunc(D-DataBaseLic), 4);  
end;


procedure TFrmPri.Button1Click(Sender: TObject);
var S: String;
begin
  S := IntToStr(edLoja.AsInteger)+'-'+edVenc.AsString;
  edSerial.Text := DateToDateLic(edVenc.AsDateTime) + '-' + 
                   KG.CreateSerialNumberEx(Caminho+'cm.ep2', 
                                           S,
                                           False, False, False, False, False, False,
                                           edTipo.ItemIndex, edMaq.AsInteger, edEquip.Text);  
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  Caminho := ExtractFilePath(ParamStr(0));
  KG := TKeyGen.Create(Caminho);
end;

procedure TFrmPri.FormDestroy(Sender: TObject);
begin
  KG.Free;
end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
  edLoja.AsInteger := 0;
  edMaq.AsInteger := 10;
  edVenc.AsDateTime := Date;
end;

end.
