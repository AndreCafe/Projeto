unit uEstudoQuantUnitario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, StdCtrls, cxRadioGroup, cxTextEdit, cxPropertiesStore,
  cxLabel, cxMaskEdit, cxDropDownEdit, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, LMDButtonControl,
  LMDRadioButton, cxCurrencyEdit, Menus, cxButtons;

type
  TForm8 = class(TForm)
    cxPropertiesStore1: TcxPropertiesStore;
    panQtdPreco: TLMDSimplePanel;
    lbSize: TcxLabel;
    cxCurrencyEdit2: TcxCurrencyEdit;
    panQtd: TLMDSimplePanel;
    edQuant: TcxCurrencyEdit;
    lbUnid: TcxLabel;
    btnLancar: TcxButton;
    panUnit: TLMDSimplePanel;
    edUnit: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    panTotal: TLMDSimplePanel;
    edTotal: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    procedure edQuantPropertiesEditValueChanged(Sender: TObject);
    procedure edPrecoPropertiesEditValueChanged(Sender: TObject);
    procedure edQuantExit(Sender: TObject);
    procedure panUnitEnter(Sender: TObject);
    procedure panUnitExit(Sender: TObject);
    procedure edTotalEnter(Sender: TObject);
    procedure edTotalExit(Sender: TObject);
    procedure panQtdPrecoResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.edPrecoPropertiesEditValueChanged(Sender: TObject);
begin
  lbSize.Caption := edQuant.EditingText;
end;

procedure TForm8.edQuantExit(Sender: TObject);
begin
  panQtd.Color := clWhite;
end;

procedure TForm8.edQuantPropertiesEditValueChanged(Sender: TObject);
var W: Integer;
begin
  lbSize.Caption := edQuant.EditingText;
  W := lbSize.Width+25+lbUnid.Width;
  if W>120 then
    panQtd.Width := W else
    panQtd.Width := 120;
end;

procedure TForm8.edTotalEnter(Sender: TObject);
begin
  panTotal.Color := $0080FFFF;
end;

procedure TForm8.edTotalExit(Sender: TObject);
begin
  panTotal.Color := clWhite;
end;

procedure TForm8.panQtdPrecoResize(Sender: TObject);
begin
  btnLancar.Left := panQtdPreco.Width-btnLancar.Width-1;
end;

procedure TForm8.panUnitEnter(Sender: TObject);
begin
  panUnit.Color := $0080FFFF;
end;

procedure TForm8.panUnitExit(Sender: TObject);
begin
  panUnit.Color := clWhite;
end;

end.
