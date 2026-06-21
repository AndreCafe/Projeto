unit ChartName;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TChartNameForm = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    edChartName: TEdit;
    Button1: TButton;
    Button2: TButton;
  end;

function ChartNameDialogExecute(var AName: string): Boolean;
implementation

{$R *.DFM}

function ChartNameDialogExecute(var AName: string): Boolean;
begin
  with TChartNameForm.Create(nil) do
  try
    edChartName.Text := AName;
    Result := ShowModal = mrOk;
    if Result then
      AName := edChartName.Text;
  finally
    Free;
  end;
end;

end.
