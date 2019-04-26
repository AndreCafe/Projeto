unit ncaFrmSombra;
{
    ResourceString: Dario 11/03/13
    Nada pra fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type

  TFrmSombra2 = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
    Frm : TForm;
    FTipo : Byte;
  public
    procedure Mostrar(aTipo: Byte);
    procedure Fechar;
    procedure Cancelar;
    { Public declarations }
  end;

var
  FrmSombra2: TFrmSombra2;

implementation

{$R *.dfm}

uses
  ncaFrmAguarde, ncaFrmErroNav;

procedure TFrmSombra2.Cancelar;
begin
  Frm.ModalResult := mrCancel;
end;

procedure TFrmSombra2.Fechar;
begin
  if Assigned(Frm) then begin
    Frm.ModalResult := mrOk;
  end else begin
    Timer1.Enabled := False;
    ModalResult := mrOk;
  end;
end;

procedure TFrmSombra2.FormShow(Sender: TObject);
begin
  Timer2.Enabled := True;
end;

procedure TFrmSombra2.Mostrar(aTipo: Byte);
begin
  FTipo := aTipo;
  Frm := nil;
  ShowModal;  
end;

procedure TFrmSombra2.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if FTipo=1 then
    Frm := TFrmAguarde.Create(Self) else
    Frm := TFrmErroNav.Create(Self);
  Frm.ShowModal;
  while AlphaBlendValue>0 do begin 
    AlphaBlendValue := AlphaBlendValue - 10;
    Sleep(5);
    Application.ProcessMessages;
  end;
  ModalResult := Frm.ModalResult;
end;

procedure TFrmSombra2.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  while AlphaBlendValue<200 do begin
    AlphaBlendValue := AlphaBlendValue + 10;
    Sleep(5);
    Application.ProcessMessages;
  end;
  Timer1.Enabled := True;
end;

end.
