unit uAFrmData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TFrmData = class(TForm)
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    Label1: TLabel;
    edData: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
  private
    D : TDateTime;
    { Private declarations }
  public
    function ObtemData(var Dia: TDateTime): Boolean;
    { Public declarations }
  end;

var
  FrmData: TFrmData;

implementation

{$R *.dfm}

procedure TFrmData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmData.FormCreate(Sender: TObject);
begin
  edData.Date := Date;
end;

function TFrmData.ObtemData(var Dia: TDateTime): Boolean;
begin
  D := 0;
  ShowModal;
  if D<>0 then begin
    Dia := D;
    Result := True;
  end else
    Result := False;  
end;

procedure TFrmData.btnOKClick(Sender: TObject);
begin
  D := edData.Date;
  Close;
end;

end.
