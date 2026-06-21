unit uCMFrmPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, xpButton, LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseLabel, LMDCustomSimpleLabel, LMDSimpleLabel, StdCtrls, ovcbase,
  ovcef, ovcpb, ovcpf;

type
  TFrmPeriodo = class(TForm)
    xpButton1: TxpButton;
    xpButton2: TxpButton;
    edInicio: TOvcPictureField;
    Label1: TLabel;
    Label2: TLabel;
    edFim: TOvcPictureField;
    procedure xpButton1Click(Sender: TObject);
    procedure xpButton2Click(Sender: TObject);
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

procedure TFrmPeriodo.xpButton1Click(Sender: TObject);
begin
  FResultado := True;
  FInicio^ := edInicio.AsDateTime;
  FFim^ := edFim.AsDateTime;
  Close;
end;

procedure TFrmPeriodo.xpButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPeriodo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
