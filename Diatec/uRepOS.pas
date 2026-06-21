unit uRepOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,  QuickRpt, Qrctrls, ExtCtrls, nxdb;

type
  TFrmRepOS = class(TForm)
    qrOS: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    TitleBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRImage1: TQRImage;
    ColumnHeaderBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRShape2: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRepOS: TFrmRepOS;

implementation

uses uDTDM;

{$R *.DFM}

end.
