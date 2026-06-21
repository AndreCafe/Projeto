unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, StdCtrls, dxBar, ExtCtrls;

type
  TFrmBase3 = class(TFrmBase)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
  private
    { Private declarations }
  public
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  FrmBase3: TFrmBase3;

implementation

{$R *.dfm}

{ TFrmBase3 }

class function TFrmBase3.Descricao: String;
begin
  Result := 'Form TESTE 3333';
end;

end.
