unit uCMFrmMudaSenha;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons,Dialogs, uCMFrmPri, dxCntner, dxEditor, dxEdLib;

type
  TFrmMudaSenha = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    OKBtn: TButton;
    Password: TdxEdit;
    Nova: TdxEdit;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMudaSenha: TFrmMudaSenha;

implementation

uses uCMDados;

{$R *.DFM}

procedure TFrmMudaSenha.CancelBtnClick(Sender: TObject);
begin
close;
end;

procedure TFrmMudaSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:= CaFree;
end;

end.

