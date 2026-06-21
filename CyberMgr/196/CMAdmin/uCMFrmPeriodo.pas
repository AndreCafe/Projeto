unit uCMFrmPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseLabel, LMDCustomSimpleLabel, LMDSimpleLabel, StdCtrls, ovcbase,
  ovcef, ovcpb, ovcpf, cxLookAndFeelPainters, cxButtons;

type
  TFrmPeriodo = class(TForm)
    edInicio: TOvcPictureField;
    Label1: TLabel;
    Label2: TLabel;
    edFim: TOvcPictureField;
    btnOk: TcxButton;
    btnCancelar: TcxButton;
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
  edInicio.AsDateTime := aInicio;
  edFIm.AsDateTime := aFim;
  FResultado := False;
  FInicio := @aInicio;
  FFim    := @aFim;
  ShowModal;
  Result := FResultado;
end;

procedure TFrmPeriodo.btnOkClick(Sender: TObject);
begin
  FResultado := True;
  FInicio^ := edInicio.AsDateTime;
  FFim^ := edFim.AsDateTime;
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
