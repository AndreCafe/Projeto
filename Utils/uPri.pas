unit uPri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  GIFImg, ExtCtrls, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmPri = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

implementation

uses uFrmSombra, uFrmAguarde2;

{$R *.dfm}

procedure TFrmPri.Button2Click(Sender: TObject);
begin
  TFrmAguarde2.CreateEsp(Handle, Self).ShowModalCustom(300);
end;

end.
