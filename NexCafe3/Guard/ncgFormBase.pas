unit ncgFormBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TFormBaseGuard = class(TForm)
  private
    { Private declarations }
    procedure OnMostrar(Sender: TObject);
    procedure OnEsconder(Sender: TObject);
  public
    { Public declarations }
    procedure Esconder; virtual;
    procedure Mostrar; 
  end;

var
  FormBaseGuard: TFormBaseGuard;

implementation

uses ncDebug;

{$R *.dfm}

{ TFormBaseGuard }

procedure TFormBaseGuard.Esconder;
begin
  try
    Hide;
  except
    on E: Exception do begin
      DebugMsg('TFormBaseGuard.Esconder - Name: ' + Self.Name + ' - Exception: ' + E.Message);
      with TTimer.Create(Self) do begin
        Interval := 50;
        OnTimer := OnEsconder;
        Enabled := True;
      end;
    end;
  end;
end;

procedure TFormBaseGuard.Mostrar;
begin
  try
    Show;
  except
    on E: Exception do begin
      DebugMsg('TFormBaseGuard.Mostrar - Name: ' + Self.Name + ' - Exception: ' + E.Message);
      with TTimer.Create(Self) do begin
        Interval := 50;
        OnTimer := OnMostrar;
        Enabled := True;
      end;
    end;
  end;
end;

procedure TFormBaseGuard.OnEsconder(Sender: TObject);
begin
  try
    Hide;
  finally
    Sender.Free;
  end;
end;

procedure TFormBaseGuard.OnMostrar(Sender: TObject);
begin
  try
    Show;  
  finally
    Sender.Free;
  end;
end;

end.
