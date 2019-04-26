unit ncaFrmLancExtra;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, ncErros, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, ncLancExtra,
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxCalendar, cxMaskEdit, cxDBLookupComboBox, cxCurrencyEdit, cxMemo,
  cxImageComboBox, cxVGrid, cxDBVGrid, cxControls, cxInplaceContainer,
  dxBarExtItems, cxTextEdit, cxContainer, cxLabel, cxClasses, cxLookAndFeels,
  cxLookAndFeelPainters;

type

  TFrmLancExtra = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edValor: TcxCurrencyEdit;
    edObs: TcxTextEdit;
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    FRes : Boolean;
    function Editar(aNovo, aPodeSalvar: Boolean; aLE: TncLancExtra): Boolean;
    { Public declarations }
  end;

var
  FrmLancExtra: TFrmLancExtra;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncIDRecursos, 
  ncClassesBase, ufmImagens;

// START resource string wizard section
resourcestring
  SÉNecessárioInformarOValor = 'É necessário informar o valor';
  SAdicionarDinheiroAoCaixaSuprimen = 'Adicionar dinheiro ao caixa (Suprimento)';
  SRetirarDinheiroDoCaixaSangria = 'Retirar dinheiro do caixa (Sangria)';

// END resource string wizard section


{$R *.DFM}

procedure TFrmLancExtra.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLancExtra.cmGravarClick(Sender: TObject);
begin
  edValor.PostEditValue;
  if Abs(edValor.Value) < 0.001  then
    raise ENexCafe.Create(SÉNecessárioInformarOValor);
  FRes := True;
  Close;
end;

function TFrmLancExtra.Editar(aNovo, aPodeSalvar: Boolean;
  aLE: TncLancExtra): Boolean;
var Pode: Boolean;
begin
  if aLE.Tipo=trCaixaEnt then
    Pode := Permitido(daCaiSuprimento) else
    Pode := Permitido(daCaiSangria);
    
  cmGravar.Enabled := aPodeSalvar and (aNovo or (Permitido(daTraAlterar) and Pode));
  FRes := False;
  edValor.Value := aLE.Total;
  edObs.Text := aLE.Obs;
  if aLE.Tipo = trCaixaEnt then
    Caption := SAdicionarDinheiroAoCaixaSuprimen else
    Caption := SRetirarDinheiroDoCaixaSangria;
  ShowModal;
  if FRes then begin
    aLE.Total := edValor.Value;
    aLE.Obs := edObs.Text;
  end;
  Result := FRes;
end;

procedure TFrmLancExtra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmLancExtra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;


end.

