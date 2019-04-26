unit ncaFrmDebTempo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, ncLancExtra,
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxCalendar, cxMaskEdit, cxDBLookupComboBox, cxCurrencyEdit, cxMemo,
  cxImageComboBox, cxVGrid, cxDBVGrid, cxControls, cxInplaceContainer,
  dxBarExtItems, cxTextEdit, cxContainer, cxLabel, cxSpinEdit, cxTimeEdit,
  cxClasses;

type

  TFrmDebTempo = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edObs: TcxTextEdit;
    cxLabel1: TcxLabel;
    edTempo: TcxTimeEdit;
    edCliente: TcxTextEdit;
    procedure cmCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    FRes : Boolean;
    function Editar(aSalvar: Boolean; aNomeCli: String; var Tempo: Double; var Obs: String): Boolean;
    { Public declarations }
  end;

var
  FrmDebTempo: TFrmDebTempo;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncIDRecursos, 
  ncClassesBase;

{$R *.DFM}

procedure TFrmDebTempo.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDebTempo.cmGravarClick(Sender: TObject);
begin
  edTempo.PostEditValue;
  edObs.PostEditValue;
  FRes := True;
  Close;
end;

function TFrmDebTempo.Editar(aSalvar: Boolean; aNomeCli: String;
  var Tempo: Double; var Obs: String): Boolean;
begin
  FRes := False;
  cmGravar.Enabled := aSalvar;
  edCliente.Text := aNomeCli;
  edTempo.Time := MinutosToDateTime(Tempo);
  edObs.Text := Obs;
  ShowModal;
  if FRes then begin
    Tempo := DateTimeToSegundos(edTempo.Time) / 60;
    Obs := edObs.Text;
  end;
end;

procedure TFrmDebTempo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmDebTempo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;


end.
