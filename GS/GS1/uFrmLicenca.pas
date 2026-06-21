unit uFrmLicenca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxMaskEdit, dxBarExtItems,
  cxContainer, cxCheckBox, cxVGrid, cxControls, cxInplaceContainer,
  ExtCtrls, dxBar, cxTextEdit, cxDropDownEdit, cxLabel,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxPC, cxGroupBox,
  cxRadioGroup, Menus;

type
  TFrmLicenca = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    vgLic1: TcxVerticalGrid;
    vgLic1Codigo: TcxEditorRow;
    vgLic1HD: TcxEditorRow;
    vgLic1Numero: TcxEditorRow;
    lbInstrucao: TcxLabel;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxLabel3: TcxLabel;
    rgRegistro: TcxRadioGroup;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    edSenha: TcxTextEdit;
    cxTabSheet3: TcxTabSheet;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    lbContato: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  etCodigoLoja = 1;
  etNumeroLic  = 2;
  etSucesso    = 3;  

var
  FrmLicenca: TFrmLicenca;

implementation

uses uLicenca;

{$R *.dfm}

procedure TFrmLicenca.FormShow(Sender: TObject);
begin
{ with LicencaGlobal do begin
    Limpa;
    if liCodLoja>0 then
      vgLicCodigo.Properties.Value := CodLojaAsString
    else
      vgLicCodigo.Properties.Value := '';
        
    vgLicHD.Properties.Value := liSerialHD;
    if SenhaOk then
      vgLicNumero.Properties.Value := Copy(AsString, 1, 19)
    else
      vgLicNumero.Properties.Value := '';  
  end;  }
end;

procedure TFrmLicenca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
