unit ncaFrmCorrigeDataCaixa;

interface

uses
  Windows, ncErros, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, ncLancExtra,
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxCalendar, cxMaskEdit, cxDBLookupComboBox, cxCurrencyEdit, cxMemo,
  cxImageComboBox, cxVGrid, cxDBVGrid, cxControls, cxInplaceContainer,
  dxBarExtItems, cxTextEdit, cxContainer, cxLabel, cxDropDownEdit, cxGroupBox,
  cxClasses, cxLookAndFeelPainters, cxLookAndFeels;

type

  TFrmCorrigeDataCaixa = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    edFecha: TcxDateEdit;
    lbFecha: TcxLabel;
    cxLabel2: TcxLabel;
    edAbert: TcxDateEdit;
    cxLabel1: TcxLabel;
    edSaldoF: TcxCurrencyEdit;
    cxLabel3: TcxLabel;
    edObs: TcxMemo;
    cxLabel4: TcxLabel;
    edIDLoja: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmCancelarClick(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    FRes : Boolean;
    function Editar(aID: Integer; var aAbertura, aFechamento: TDateTime; var aSaldoF: Currency; var aObs, aIDLoja: String): Boolean;
    { Public declarations }
  end;

var
  FrmCorrigeDataCaixa: TFrmCorrigeDataCaixa;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncIDRecursos, 
  ncClassesBase;

{$R *.DFM}

procedure TFrmCorrigeDataCaixa.cmCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmCorrigeDataCaixa.cmGravarClick(Sender: TObject);
begin
  edAbert.PostEditValue;
  edFecha.PostEditValue;
  edSaldoF.PostEditValue;
  edObs.PostEditValue;
  ModalResult := mrOk;
end;

function TFrmCorrigeDataCaixa.Editar(aID: Integer; var aAbertura,
  aFechamento: TDateTime; var aSaldoF: Currency; var aObs, aIDLoja: String): Boolean;
begin
  FRes := False;
  edAbert.Date := aAbertura;
  if aFechamento<10 then begin
    edFecha.Enabled := False;
    edObs.Enabled := False;
    edSaldoF.Enabled := False;
  end else begin
    edFecha.Date := aFechamento;
    edObs.Text := aObs;
    edIDLoja.Text := aIDLoja;
    if gConfig.PedirSaldoF then
      edSaldoF.Value := aSaldoF else
      edSaldoF.Enabled := False;
  end;
  ShowModal;
  if ModalResult=mrOk then begin
    Result := True;
    aAbertura := edAbert.Date;
    if aFechamento>10 then begin
      aFechamento := edFecha.Date;
      aSaldoF := edSaldoF.Value;
      aObs := edObs.Text;
      aIDLoja := edIDLoja.Text
    end;
  end else
    Result := False;
end;

procedure TFrmCorrigeDataCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCorrigeDataCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;


end.
