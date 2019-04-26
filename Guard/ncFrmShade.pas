unit ncFrmShade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrmShade = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
    FAtivo : Boolean;
    procedure SetAtivo(const Value: Boolean);
  public
    { Public declarations }
    property Ativ: Boolean
      read FAtivo write SetAtivo;
  end;

var
  FrmShade: TFrmShade;

implementation

uses ncFrmImp;

{$R *.dfm}

procedure TFrmShade.FormCreate(Sender: TObject);
begin
  FAtivo := False;
end;

procedure TFrmShade.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TFrmShade.SetAtivo(const Value: Boolean);
begin
  if Value = FAtivo then Exit;
  FAtivo := Value;
  if Value then 
    ShowModal else
    FrmImp.Close;
end;

procedure TFrmShade.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  FrmImp.ShowModal;
  Close;
  FAtivo := False;
end;

procedure TFrmShade.Timer2Timer(Sender: TObject);
begin
  Top := 0;
  Left := 0;
  Height := Screen.Height;
  width := Screen.Width;
end;
  
end.
