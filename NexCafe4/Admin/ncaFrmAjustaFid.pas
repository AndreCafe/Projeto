unit ncaFrmAjustaFid;

interface

uses
  Windows, ncErros, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, ncLancExtra, Variants,
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxCalendar, cxMaskEdit, cxDBLookupComboBox, cxCurrencyEdit, cxMemo,
  cxImageComboBox, cxVGrid, cxDBVGrid, cxControls, cxInplaceContainer,
  dxBarExtItems, cxTextEdit, cxContainer, cxLabel, cxSpinEdit, cxTimeEdit,
  cxClasses, cxPC, StdCtrls, cxRadioGroup, cxCheckBox;

type

  TFrmAjustaFid = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edObs: TcxTextEdit;
    edCliente: TcxTextEdit;
    rbAdicionar: TcxRadioButton;
    rbRemover: TcxRadioButton;
    cbZerar: TcxCheckBox;
    cxLabel1: TcxLabel;
    edPontos: TcxMaskEdit;
    procedure cmCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmGravarClick(Sender: TObject);
    procedure cbZerarClick(Sender: TObject);
    procedure rbRemoverClick(Sender: TObject);
    procedure rbAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    FRes : Boolean;
    FSaldo : Double;
    FClicou : Boolean;
    function Editar(aSalvar, aNovo: Boolean; aNomeCli: String; var Pontos: Double; var Obs: String; var Fator: Smallint; aSaldo: Double = 0): Boolean;
    { Public declarations }
  end;

var
  FrmAjustaFid: TFrmAjustaFid;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncIDRecursos, 
  ncClassesBase;

{$R *.DFM}

procedure TFrmAjustaFid.cbZerarClick(Sender: TObject);
begin
  FClicou := True;
  try
    if cbZerar.Checked then begin
      if FSaldo<0 then
        rbAdicionar.Checked := True else
        rbRemover.Checked := True;
      edPontos.EditValue := FSaldo;
    end;
    edPontos.Enabled := not cbZerar.Checked;
  finally
    FClicou := False;
  end;
end;

procedure TFrmAjustaFid.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAjustaFid.cmGravarClick(Sender: TObject);
begin
  edPontos.PostEditValue;
  if (edPontos.EditValue=null) or (edPontos.EditValue<0.00001) then
    raise ENexCafe.Create('É necessário informar a quantidade de pontos');
  
  edObs.PostEditValue;
  FRes := True;
  Close;
end;

function TFrmAjustaFid.Editar(
  aSalvar, 
  aNovo: Boolean; 
  aNomeCli: String; 
  var Pontos: Double; 
  var Obs: String; 
  var Fator: Smallint; 
  aSaldo: Double = 0): Boolean;
begin
  FRes := False;
  Result := False;
  cmGravar.Enabled := aSalvar;
  edCliente.Text := aNomeCli;
  if Fator=1 then
    rbAdicionar.Checked := True else
    rbRemover.Checked := True;

  edPontos.EditValue := Pontos;  
  edObs.Text := Obs;

  cbZerar.Visible := aNovo;

  FSaldo := aSaldo;

  cbZerar.Caption := 'Zerar Pontos (' + FloatToStr(FSaldo) + ')';
  cbZerar.Visible := (Abs(aSaldo)>0.0001);

  edObs.Text := Obs;
  ShowModal;
  if FRes then begin
    Result := True;
    Obs := edObs.Text;
    if rbAdicionar.Checked then
      Fator := 1 else
      Fator := -1;
    Pontos := edPontos.EditValue;  
  end;
end;

procedure TFrmAjustaFid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAjustaFid.FormCreate(Sender: TObject);
begin
  FClicou := False;
end;

procedure TFrmAjustaFid.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmAjustaFid.rbAdicionarClick(Sender: TObject);
begin
  if FClicou then Exit;

  cbZerar.Checked := False;
  edPontos.Enabled := True;
  edPontos.SetFocus;
end;

procedure TFrmAjustaFid.rbRemoverClick(Sender: TObject);
begin
  if FClicou then Exit;
  
  cbZerar.Checked := False;
  edPontos.Enabled := True;
  edPontos.SetFocus;
end;

end.
