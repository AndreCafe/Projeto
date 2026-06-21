unit uCMFrmPolicy;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxBarExtItems, dxBar;

type
  TFrmPolicy = class(TForm)
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
  FrmPolicy: TFrmPolicy;

implementation

{$R *.DFM}

end.
