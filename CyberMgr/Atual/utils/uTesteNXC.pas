unit uTesteNXC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, nxcCliente;

type
  TForm12 = class(TForm)
    NXC: TnxcCliente;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

procedure TForm12.Button1Click(Sender: TObject);
begin
  NXC.Ativo := True;
  NXC.EnviaArqFundo(True, 'c:\teste.jpg');
end;

procedure TForm12.Button2Click(Sender: TObject);
begin
  NXC.Ativo := True;
end;

procedure TForm12.Button3Click(Sender: TObject);
begin
  ShowMessage(NXC.NomeArqDesktop);
end;

end.
