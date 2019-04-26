unit ncaFrmDebTempo;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, ncLancExtra,
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxCalendar, cxMaskEdit, cxDBLookupComboBox, cxCurrencyEdit, cxMemo,
  cxImageComboBox, cxVGrid, cxDBVGrid, cxControls, cxInplaceContainer,
  dxBarExtItems, cxTextEdit, cxContainer, cxLabel, cxSpinEdit, cxTimeEdit,
  cxClasses, cxPC, StdCtrls, cxRadioGroup, cxCheckBox, cxLookAndFeels,
  cxLookAndFeelPainters, cxPCdxBarPopupMenu;

type

  TFrmDebTempo = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edObs: TcxTextEdit;
    edCliente: TcxTextEdit;
    rbTempo: TcxRadioButton;
    rbValor: TcxRadioButton;
    Paginas: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxLabel1: TcxLabel;
    edTempo: TcxTimeEdit;
    cxTabSheet2: TcxTabSheet;
    cxLabel4: TcxLabel;
    edValor: TcxCurrencyEdit;
    cbTempoTotal: TcxCheckBox;
    cbValorTotal: TcxCheckBox;
    procedure cmCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmGravarClick(Sender: TObject);
    procedure rbValorClick(Sender: TObject);
    procedure rbTempoClick(Sender: TObject);
    procedure cbValorTotalClick(Sender: TObject);
    procedure cbTempoTotalClick(Sender: TObject);
  private
    { Private declarations }
  public
    FRes : Boolean;
    FTempoTotal, FValorTotal : Double;
    function Editar(aSalvar, aNovo: Boolean; aNomeCli: String; var Tempo: Double; var Obs: String; var CredValor: Boolean; aTempoTotal: Double = 0; aValorTotal: Double = 0): Boolean;
    { Public declarations }
  end;

var
  FrmDebTempo: TFrmDebTempo;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncIDRecursos, 
  ncClassesBase, ufmImagens;

// START resource string wizard section
resourcestring
  SRemoverTudo = 'Remover tudo (';
  SHhMmSs = 'hh:mm:ss';

// END resource string wizard section


{$R *.DFM}

procedure TFrmDebTempo.cbTempoTotalClick(Sender: TObject);
begin
  edTempo.Enabled := not cbTempoTotal.Checked;
  if cbTempoTotal.Checked then
    edTempo.Time := MinutosToDateTime(FTempoTotal);
end;

procedure TFrmDebTempo.cbValorTotalClick(Sender: TObject);
begin
  edValor.Enabled := not cbValorTotal.Checked;
  if cbValorTotal.Checked then
    edValor.Value := FValorTotal;
end;

procedure TFrmDebTempo.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDebTempo.cmGravarClick(Sender: TObject);
begin
  edTempo.PostEditValue;
  edValor.PostEditValue;
  edObs.PostEditValue;
  FRes := True;
  Close;
end;

function TFrmDebTempo.Editar(aSalvar, aNovo: Boolean; aNomeCli: String;
  var Tempo: Double; var Obs: String; var CredValor: Boolean; aTempoTotal: Double = 0; aValorTotal: Double = 0): Boolean;
begin
  FRes := False;
  Result := False;
  cmGravar.Enabled := aSalvar;
  edCliente.Text := aNomeCli;
  if CredValor then begin
    rbValor.Checked := True;
    edValor.Value := Tempo;
    Paginas.ActivePageIndex := 1;
  end else 
    edTempo.Time := MinutosToDateTime(Tempo);

  cbValorTotal.Visible := aNovo;
  cbTempoTotal.Visible := aNovo;

  FValorTotal := aValorTotal;
  FTempoTotal := aTempoTotal;

  cbTempoTotal.Caption := SRemoverTudo + FormatDateTime(SHhMmSs, MinutosToDateTime(aTempoTotal)) + ')';
  cbValorTotal.Caption := SRemoverTudo + Trim(FloatToStrF(aValorTotal, ffCurrency, 10, 2)) + ')';
  
  rbTempo.Enabled := aNovo;
  rbValor.Enabled := aNovo; 

  edObs.Text := Obs;
  ShowModal;
  if FRes then begin
    Result := True;
    Obs := edObs.Text;
    CredValor := rbValor.Checked;
    if CredValor then
      Tempo := edValor.Value else
      Tempo := DateTimeToSegundos(edTempo.Time) / 60;
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

procedure TFrmDebTempo.rbTempoClick(Sender: TObject);
begin
  Paginas.ActivePageIndex := 0;
end;

procedure TFrmDebTempo.rbValorClick(Sender: TObject);
begin
  Paginas.ActivePageIndex := 1;
end;

end.

