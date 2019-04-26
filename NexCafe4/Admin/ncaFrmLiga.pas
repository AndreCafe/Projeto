unit ncaFrmLiga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxRadioGroup, ExtCtrls, cxControls, cxContainer,
  cxEdit, cxLabel, pngimage, Buttons, PngSpeedButton, PngBitBtn,
  cxLookAndFeelPainters, cxButtons, Menus, cxGroupBox, LMDGraph, LMDPNGImage, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDTypes, LMDBevel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmLiga = class(TForm)
    panReiniciar: TLMDSimplePanel;
    Image2: TImage;
    LMDSimplePanel6: TLMDSimplePanel;
    lbOperacao: TcxLabel;
    cxLabel4: TcxLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    rbMaq: TcxRadioButton;
    rbTodas: TcxRadioButton;
    btnCancelar: TcxButton;
    btnOk: TcxButton;
    cxLabel1: TcxLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    
    function Ligar(aMaq: Integer): Integer;
  end;

var
  FrmLiga: TFrmLiga;

implementation

uses 
  ncaDM, 
  ncaFrmUsuario, 
  ncIDRecursos;

{$R *.dfm}

const
  SelColor : Array[Boolean] of TColor = (clBtnFace, clWhite);

procedure TFrmLiga.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLiga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TFrmLiga.Ligar(aMaq: Integer): Integer;
begin
  Result := -1;
  rbMaq.Caption := 'Máquina ' + IntToStr(AMaq);
  ShowModal;
  if ModalResult=mrOk then begin
    if rbMaq.Checked then
      Result := aMaq else
      Result := 0;
  end;
end;


end.
