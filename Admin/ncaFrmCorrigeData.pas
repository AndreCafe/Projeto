unit ncaFrmCorrigeData;
{
    ResourceString: Dario 11/03/13
    Nada para para fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxBar, cxClasses, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ComCtrls, dxCore, cxDateUtils;

type
  TFrmCorrigeData = class(TForm)
    edDataI: TcxDateEdit;
    cxLabel2: TcxLabel;
    BarMgr: TdxBarManager;
    BarMgrBar1: TdxBar;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    function Editar(var aData: TDateTime): Boolean;
    { Public declarations }
  end;

var
  FrmCorrigeData: TFrmCorrigeData;

implementation

uses ufmImagens;

{$R *.dfm}

procedure TFrmCorrigeData.cmCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmCorrigeData.cmGravarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TFrmCorrigeData.Editar(var aData: TDateTime): Boolean;
begin
  edDataI.Date := aData;
  ShowModal;
  if ModalResult=mrOk then begin
    aData := edDataI.Date;
    Result := True;
  end else
    Result := False;
end;

procedure TFrmCorrigeData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
