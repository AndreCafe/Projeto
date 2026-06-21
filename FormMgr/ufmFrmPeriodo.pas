unit ufmFrmPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseLabel, LMDCustomSimpleLabel, LMDSimpleLabel, StdCtrls, 
  cxLookAndFeelPainters, cxButtons, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Menus, cxSpinEdit,
  cxTimeEdit;

type
  TFrmPeriodo = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btnOk: TcxButton;
    btnCancelar: TcxButton;
    edInicio: TcxDateEdit;
    edFim: TcxDateEdit;
    edInicioH: TcxTimeEdit;
    edFimH: TcxTimeEdit;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FInicio, FFim : ^TDateTime;
    FResultado : Boolean;
    { Private declarations }
  public
    { Public declarations }
    function ObtemPeriodo(var aInicio, aFim: TDateTime): Boolean;
  end;

var
  FrmPeriodo: TFrmPeriodo;

implementation

{$R *.dfm}

{ TForm1 }

function TFrmPeriodo.ObtemPeriodo(var aInicio, aFim: TDateTime): Boolean;
begin
  edInicio.Date := Int(aInicio);
  edInicioH.Time := Frac(aInicio);
  edFIm.Date := Int(aFim);
  edfimH.Time := Frac(aFim);
  FResultado := False;
  FInicio := @aInicio;
  FFim    := @aFim;
  ShowModal;
  Result := FResultado;
end;

procedure TFrmPeriodo.btnOkClick(Sender: TObject);
begin
  FResultado := True;
  FInicio^ := Trunc(edInicio.Date) + edInicioH.Time;
  FFim^ := Trunc(edFim.Date) + edFimH.Time;
  Close;
end;

procedure TFrmPeriodo.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPeriodo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
