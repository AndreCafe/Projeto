unit uCMFrmAguarde;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls;

type
  TFrmAguarde = class(TForm)
    Label1: TLabel;
    PB: TProgressBar;
    lbModulo: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAguarde: TFrmAguarde;

implementation

{$R *.DFM}

end.
