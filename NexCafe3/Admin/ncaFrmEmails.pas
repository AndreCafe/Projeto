unit ncaFrmEmails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, cxClasses, StdCtrls;

type
  TFrmEmails = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Mostrar(aEmails: String);
  end;

var
  FrmEmails: TFrmEmails;

implementation

uses ncaFrmPri;

{$R *.dfm}

{ TFrmEmails }

procedure TFrmEmails.dxBarLargeButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEmails.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmEmails.Mostrar(aEmails: String);
begin
  Memo1.Lines.Text := aEmails;
  ShowModal;
end;

end.
