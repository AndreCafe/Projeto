unit uCMSenhaPri;

interface

uses
  Windows, ShlObj, ClipBrd, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, OvcBase, OvcEF, OvcPB, OvcNF, OvcSC, cmClassesBase,
  Buttons, OvcPF, StShBase, StFileOp, StBase, StDrop, DropSource,
  LMDControl, LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton;

type
  TForm1 = class(TForm)
    Button1: TButton;
    OvcController1: TOvcController;
    GroupBox1: TGroupBox;
    rbDemo: TRadioButton;
    rbCompra: TRadioButton;
    edData: TDateTimePicker;
    GroupBox2: TGroupBox;
    edNumMaq: TOvcNumericField;
    OvcSpinner1: TOvcSpinner;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox5: TGroupBox;
    edLicenca: TEdit;
    BitBtn1: TBitBtn;
    Drop: TDropFileSource;
    btnCopiar: TLMDSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure rbCompraClick(Sender: TObject);
    procedure rbDemoClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnCopiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    Lic : TLicenca;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

function DesktopDir: string;
var
  data: array[0..MAX_PATH] of char;
begin
  SHGetSpecialFolderPath(application.handle, @data[0], CSIDL_DESKTOP, 
                         true); 
  result:=strpas(@data[0]);
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  edNumMaq.AsInteger := 2;
  edData.DateTime := Date;
  Edit1.text := VolumeSerial('C');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

function NumStr(N: Integer; Tam: Integer): String;
begin
  Result := IntToStr(N);
  while Length(Result)<Tam do Result := '0' + Result;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  Lic.liDefinitiva := rbCompra.Checked;
  Lic.liMaquinas := edNumMaq.AsInteger;
  Lic.liVencimento := edData.DateTime;
  Lic.liNumSerie := StrToIntDef('$' + Edit1.Text, 0);
  Lic.AtualizaSenha;
  edLicenca.Text := Copy(Lic.AsString, 1, 19);
  Edit2.Text := Lic.SenhaAntiga;
end;

procedure TForm1.rbCompraClick(Sender: TObject);
begin
  rbCompra.Font.Color := clBlue;
  rbDemo.Font.Color := clBlack;
  Edit1Change(nil);
end;

procedure TForm1.rbDemoClick(Sender: TObject);
begin
  rbCompra.Font.Color := clBlack;
  rbDemo.Font.Color := clBlue;
  Edit1Change(nil);
end;

procedure TForm1.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Lic.SalvaArquivo(DesktopDir+'\'+NomeArqLicenca);
  Drop.Files.Text := DesktopDir+'\'+NomeArqLicenca;
  Drop.CopyToClipboard;
end;

procedure TForm1.btnCopiarClick(Sender: TObject);
begin
  edLicenca.SelectAll;
  edLicenca.CopyToClipboard;
end;

end.
