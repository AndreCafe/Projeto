unit ncaFrmTipoImp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, 
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxTextEdit, cxMaskEdit, cxCurrencyEdit, cxVGrid, cxDBVGrid, cxControls,
  cxInplaceContainer, dxBarExtItems, cxDBEdit, cxContainer, cxLabel,
  cxDropDownEdit, LMDCustomComponent, LMDSysInfo, cxClasses;

type
  TDadosTipoImp = record
    tiNome: String;
    tiValor: Currency;
    tiImp: String;
  end;
  PDadosTipoImp = ^TDadosTipoImp;
  
  TFrmTipoImp = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cxLabel1: TcxLabel;
    edDescr: TcxTextEdit;
    edValor: TcxCurrencyEdit;
    edImp: TcxComboBox;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    LMDSysInfo1: TLMDSysInfo;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    FTab : TnxTable;
    FDados : PDadosTipoImp;
    FRes : Boolean;
    function Editar(aDados: PDadosTipoImp): Boolean;
    { Public declarations }
  end;

var
  FrmTipoImp: TFrmTipoImp;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncIDRecursos;

{$R *.DFM}

{ TFrmPacote }

procedure TFrmTipoImp.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTipoImp.cmGravarClick(Sender: TObject);
begin
  if Trim(edDescr.Text)='' then
    Raise Exception.Create('É obrigatório que a tarifa tenha uma descrição');
  FDados^.tiNome := edDescr.Text;
  FDados^.tiValor := edValor.Value;
  FDados^.tiImp := edImp.Text;
  FRes := True;
  Close;
end;

function TFrmTipoImp.Editar(aDados: PDadosTipoImp): Boolean;
begin
  FDados := aDados;
  edImp.Properties.Items.Text := LmdSysInfo1.AllPrinters.Text;
  FRes := False;
  edDescr.Text := aDados^.tiNome;
  edValor.Value := aDados^.tiValor;
  edImp.Text := aDados^.tiImp;
  ShowModal;
  Result := FRes;
end;

procedure TFrmTipoImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTipoImp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmTipoImp.FormShow(Sender: TObject);
begin
  cmGravar.Enabled := Permitido(daCFGPrecos);
end;

end.
