unit uFrmDadosReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, StdCtrls, Buttons, PngBitBtn, cxTextEdit, cxDBEdit,
  cxLabel, cxSpinEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxControls,
  cxContainer, cxEdit, cxGroupBox, DB, kbmMemTable, ExtCtrls, cxMemo, pngimage;

type
  TFrmDadosReg = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label8: TLabel;
    edTipo: TcxDBImageComboBox;
    edNome: TcxDBMaskEdit;
    edQtdMaq: TcxDBSpinEdit;
    edPais: TcxDBMaskEdit;
    edCidade: TcxDBMaskEdit;
    edProp: TcxDBMaskEdit;
    edEstado: TcxDBMaskEdit;
    edCEP: TcxDBMaskEdit;
    edEndereco: TcxDBMaskEdit;
    cxLabel2: TcxLabel;
    cxGroupBox3: TcxGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    edEmail: TcxDBMaskEdit;
    cxLabel15: TcxLabel;
    edSenha: TcxDBTextEdit;
    cxLabel14: TcxLabel;
    edRSenha: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel8: TcxLabel;
    lbOpReg1: TcxLabel;
    cxLabel11: TcxLabel;
    PngBitBtn1: TPngBitBtn;
    PngBitBtn2: TPngBitBtn;
    mtReg: TkbmMemTable;
    mtRegCodigo: TIntegerField;
    mtRegSenha: TStringField;
    mtRegCadastroEm: TDateTimeField;
    mtRegCadastroPor: TStringField;
    mtRegAtualizadoEm: TDateTimeField;
    mtRegAtualizadoPor: TStringField;
    mtRegLoja: TStringField;
    mtRegRazaoSocial: TStringField;
    mtRegPais: TStringField;
    mtRegCidade: TStringField;
    mtRegUF: TStringField;
    mtRegEndereco: TMemoField;
    mtRegCEP: TStringField;
    mtRegBairro: TStringField;
    mtRegSerieHD: TStringField;
    mtRegNumMaq: TWordField;
    mtRegCNPJ: TStringField;
    mtRegIE: TStringField;
    mtRegObs: TMemoField;
    mtRegTelefones: TMemoField;
    mtRegFormaPagto: TMemoField;
    mtRegLicMaq: TWordField;
    mtRegLicTipo: TWordField;
    mtRegLicVenc: TDateField;
    mtRegManInicio: TDateField;
    mtRegManVenc: TDateField;
    mtRegGerente: TStringField;
    mtRegTipoLoja: TWordField;
    mtRegEmailTec: TMemoField;
    dsReg: TDataSource;
    edREmail: TcxTextEdit;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel4: TcxLabel;
    edTel: TcxDBMemo;
    Image1: TImage;
    mtRegProprietario: TStringField;
    mtRegEmailReg: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PngBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDadosReg: TFrmDadosReg;

implementation

{$R *.dfm}

procedure TFrmDadosReg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmDadosReg.PngBitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
