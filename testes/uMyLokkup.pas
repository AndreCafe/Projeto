unit uMyLokkup;

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
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, StdCtrls, cxTextEdit, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit,
  LMDCustomEdit, LMDEditDBLookup, DB, kbmMemTable;

type
  TForm4 = class(TForm)
    edit: TcxTextEdit;
    LMDEditDBLookup1: TLMDEditDBLookup;
    Memo1: TMemo;
    MT: TkbmMemTable;
    MTNome: TStringField;
    DataSource1: TDataSource;
    Button1: TButton;
    procedure editPropertiesChange(Sender: TObject);
    procedure editPropertiesNewLookupDisplayText(Sender: TObject;
      const AText: TCaption);
    procedure FormCreate(Sender: TObject);
    procedure editPropertiesEditValueChanged(Sender: TObject);
    procedure editKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  if SameText('João', 'joao') then ShowMessage('Mesmo');

end;

procedure TForm4.editKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 8 then begin
    if (edit.SelLength>0) then begin
      if edit.SelLength = Length(edit.EditingText) then
        edit.Text := ''
      else
      if (edit.SelStart>0) then edit.SetSelection(edit.SelStart-1, edit.SelLength+1);
    end;
  end;

  if Key = 46 then
    if Edit.SelLength>0 then
      Edit.Text := '';

end;

procedure TForm4.editPropertiesChange(Sender: TObject);
begin
  Edit.PostEditValue;
end;

procedure TForm4.editPropertiesEditValueChanged(Sender: TObject);
var P: Integer;
  S: String;
begin
  if MT.FindNearest([edit.EditingText]) and SameText(Copy(MTNome.Value, 1, Length(edit.EditingText)), Edit.EditingText) then begin
    P := edit.CursorPos;
    edit.Text := MTNome.Value;
    edit.SetSelection(P, Length(edit.Text));
  end;
end;

procedure TForm4.editPropertiesNewLookupDisplayText(Sender: TObject;
  const AText: TCaption);
begin
  Caption := AText;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  MT.Append;
  MTNome.Value := 'Joao Lucio Borges';
  MT.Post;
end;

end.
