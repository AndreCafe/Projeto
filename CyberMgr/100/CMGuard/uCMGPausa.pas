unit uCMGPausa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, RxGIF;

type
  TFrmPausa = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Timer4: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Congela;
    { Public declarations }
  end;

var
  FrmPausa: TFrmPausa;

implementation

{$R *.DFM}

{ TFrmConta }

procedure TFrmPausa.Congela;
begin
  ShowModal;
end;

procedure TFrmPausa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrmPausa := nil;
end;

procedure TFrmPausa.FormDestroy(Sender: TObject);
begin
  FrmPausa := nil;
end;

procedure TFrmPausa.FormCreate(Sender: TObject);
begin
  Left := 0;
  Top := 0;
  Width := Screen.Width;
  Height := Screen.Height;
end;

procedure TFrmPausa.Timer4Timer(Sender: TObject);
begin
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, (SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE));
end;

initialization
  FrmPausa := nil;
  
end.
