unit cxTreeListAboutFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCustomTreeListBaseFormUnit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, cxRichEdit,
  cxLookAndFeelPainters, StdCtrls, ExtCtrls, cxGroupBox;

type
  TfrmAbout = class(TcxCustomTreeListDemoUnitForm)
    gbTreeListPlace: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    reAbout: TcxRichEdit;
    cxGroupBox1: TcxGroupBox;
  private
    { Private declarations }
  public
    procedure ActivateDataSet; override;
    class function GetID: Integer; override;
  end;

implementation

{$R *.dfm}

{ TTfrmAbout }

procedure TfrmAbout.ActivateDataSet;
var
  AStream: TStream;
begin
  AStream := TResourceStream.Create(hInstance, 'TREELISTFEATURESLIST', 'TREELISTFEATURES');
  try
    reAbout.Lines.LoadFromStream(AStream);
  finally
    AStream.Free;
  end;
end;

class function TfrmAbout.GetID: Integer;
begin
  Result := -1;
end;

initialization
  TfrmAbout.Register;

end.
