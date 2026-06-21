unit uCMPolicy;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxBarExtItems, dxBar;

type
  TForm1 = class(TForm)
    BarMgr: TdxBarManager;
    cmNovoPreco: TdxBarButton;
    cmApagar: TdxBarButton;
    cmCancelar: TdxBarLargeButton;
    cmTodos: TdxBarButton;
    cmGravar: TdxBarLargeButton;
    cmEditar: TdxBarButton;
    stNome: TdxBarStatic;
    ccmNome: TdxBarControlContainerItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

end.
