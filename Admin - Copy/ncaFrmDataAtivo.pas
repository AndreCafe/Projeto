unit ncaFrmDataAtivo;
{
    ResourceString: Dario 11/03/13
    Nada para para fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxDropDownEdit, cxCalendar, StdCtrls,
  cxButtons, cxTextEdit, cxMaskEdit, cxSpinEdit, cxControls, cxContainer,
  cxEdit, cxLabel, DateUtils, LMDPNGImage, ExtCtrls, ImgList, cxGraphics,
  cxLookAndFeels, ComCtrls, dxCore, cxDateUtils;

type
  TFrmDataAtivo = class(TForm)
    lbTit: TcxLabel;
    edDias: TcxSpinEdit;
    cxLabel2: TcxLabel;
    okDias: TcxButton;
    okMeses: TcxButton;
    cxLabel3: TcxLabel;
    edMeses: TcxSpinEdit;
    okAnos: TcxButton;
    cxLabel4: TcxLabel;
    edAnos: TcxSpinEdit;
    edData: TcxDateEdit;
    cxLabel5: TcxLabel;
    okData: TcxButton;
    btnCancelar: TcxButton;
    Image1: TImage;
    Image2: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure okDiasClick(Sender: TObject);
    procedure okMesesClick(Sender: TObject);
    procedure okAnosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure okDataClick(Sender: TObject);
  private
    FData : ^TDateTime;
    { Private declarations }
    function _ObtemData(var aData: TDateTime; aCaption, aTit: String; aImageIndex: Integer): Boolean;
  public
    class function ObtemData(var aData: TDateTime; aCaption, aTit: String; aImageIndex: Integer): Boolean;
    { Public declarations }
  end;

var
  FrmDataAtivo: TFrmDataAtivo;

implementation

{$R *.dfm}

{ TFrmDataAtivo }

procedure TFrmDataAtivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmDataAtivo.FormCreate(Sender: TObject);
begin
  edData.Date := Date;
end;

class function TFrmDataAtivo.ObtemData(var aData: TDateTime; aCaption,
  aTit: String; aImageIndex: Integer): Boolean;
begin
  Result := TFrmDataAtivo.Create(nil)._ObtemData(aData, aCaption, aTit, aImageIndex);
end;

function TFrmDataAtivo._ObtemData(var aData: TDateTime; aCaption, aTit: String; aImageIndex: Integer): Boolean;
begin
  Image1.Visible := (aImageIndex=1);
  Image2.Visible := (aImageIndex=2);
  Caption := aCaption;
  lbTit.Caption := aTit;
  FData := @aData;
  ShowModal;
  Result := (ModalResult=mrOk);
end;

procedure TFrmDataAtivo.okAnosClick(Sender: TObject);
var D, M, Y: Word;
begin
  edAnos.PostEditValue;
  DecodeDate(Date, Y, M, D);
  if D>DaysInAMonth(Y-edAnos.Value, M) then
    D := DaysInAMonth(Y-edAnos.Value, M);
  FData^ := EncodeDate(Y-edAnos.Value, M , D);
end;

procedure TFrmDataAtivo.okDataClick(Sender: TObject);
begin
  edData.PostEditValue;
  FData^ := edData.Date;
end;

procedure TFrmDataAtivo.okDiasClick(Sender: TObject);
begin
  edDias.PostEditValue;
  FData^ := Date - edDias.Value;
end;

procedure TFrmDataAtivo.okMesesClick(Sender: TObject);
var D, M, Y, Meses: Word;
begin
  edMeses.PostEditValue;
  
  DecodeDate(Date, Y, M, D);
  Meses := edMeses.Value;
  while Meses>0 do begin
    Dec(M);
    Dec(Meses);
    if M=0 then begin
      Dec(Y);
      M := 12;
    end;
  end;

  if D>DaysInAMonth(Y, M) then
    D := DaysInAMonth(Y, M);
  
  FData^ := EncodeDate(Y, M , D);
end;

end.
