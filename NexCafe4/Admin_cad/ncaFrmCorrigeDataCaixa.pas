unit ncaFrmCorrigeDataCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, ncLancExtra,
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxCalendar, cxMaskEdit, cxDBLookupComboBox, cxCurrencyEdit, cxMemo,
  cxImageComboBox, cxVGrid, cxDBVGrid, cxControls, cxInplaceContainer,
  dxBarExtItems, cxTextEdit, cxContainer, cxLabel, cxDropDownEdit, cxGroupBox,
  cxClasses;

type

  TFrmCorrigeDataCaixa = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cxGroupBox1: TcxGroupBox;
    cxLabel2: TcxLabel;
    lbFecha: TcxLabel;
    edAbert: TcxDateEdit;
    edFecha: TcxDateEdit;
    cxGroupBox2: TcxGroupBox;
    cxLabel1: TcxLabel;
    lbFechamento: TcxLabel;
    edAbertura: TcxDateEdit;
    edFechamento: TcxDateEdit;
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    FRes : Boolean;
    function Editar(aID: Integer; var aAbertura, aFechamento: TDateTime): Boolean;
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
  Close;
end;

procedure TFrmCorrigeDataCaixa.cmGravarClick(Sender: TObject);
begin
  cmGravar.Enabled := Dados.CM.UA.Admin;
  edFechamento.PostEditValue;
  edAbertura.PostEditValue;
  if (edFecha.Date = edFechamento.Date) and (edAbert.Date = edAbertura.Date) then
    Raise Exception.Create('Não houve alterações de data ou horário');
  FRes := True;  
  Close;
end;

function TFrmCorrigeDataCaixa.Editar(aID: Integer; var aAbertura,
  aFechamento: TDateTime): Boolean;
begin
  FRes := False;
  edAbert.Date := aAbertura;
  edAbertura.Date := aAbertura;
  Caption := 'Corrigir data/hora do caixa ' + IntToStr(aID);
  if aFechamento < 10 then begin
    edFecha.Clear;
    edFechamento.Clear;
    edFechamento.Enabled := False;
    lbFechamento.Enabled := False;
    edFecha.Enabled := False;
    lbFecha.Enabled := False;
  end else begin
    edFecha.Date := aFechamento;
    edFechamento.Date := aFechamento;  
  end;
  
  ShowModal;
  if FRes then begin
    Result := True;
    aAbertura := edAbertura.Date;
    if not edFechamento.Properties.ReadOnly then
      aFechamento := edFechamento.Date;
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
