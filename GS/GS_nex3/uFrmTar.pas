unit uFrmTar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxMaskEdit, cxDropDownEdit, cxDBEdit, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, cxRichEdit, cxDBRichEdit,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, dxBar,
  dxBarExtItems, DB, cxImageComboBox, cxCalendar, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TFrmTar = class(TForm)
    BarMgr: TdxBarManager;
    cmCancelar: TdxBarLargeButton;
    cmFechar: TdxBarLargeButton;
    cmSalvar: TdxBarLargeButton;
    LMDSimplePanel1: TLMDSimplePanel;
    cxLabel2: TcxLabel;
    edPor: TcxDBComboBox;
    DataSource1: TDataSource;
    cxLabel3: TcxLabel;
    edPara: TcxDBComboBox;
    edObs: TcxDBMemo;
    edLancadoEm: TcxDBDateEdit;
    edResolvido: TcxDBDateEdit;
    cxLabel1: TcxLabel;
    cxLabel4: TcxLabel;
    lbResolvido: TcxLabel;
    edPend: TcxDBImageComboBox;
    cxLabel5: TcxLabel;
    edLoja: TcxDBLookupComboBox;
    cxLabel6: TcxLabel;
    edRealizarEm: TcxDBDateEdit;
    procedure cmSalvarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edPendPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Editar(aTab: TDataset);
    { Public declarations }
  end;

var
  FrmTar: TFrmTar;

implementation

uses uNRfbClientes;

{$R *.dfm}

{ TFrmHC }

procedure TFrmTar.cmCancelarClick(Sender: TObject);
begin
  DataSource1.DataSet.Cancel;
  Close;
end;

procedure TFrmTar.cmSalvarClick(Sender: TObject);
begin
  DataSource1.Dataset.Post;
  Close;
end;

procedure TFrmTar.Editar(aTab: TDataset);
begin
  DataSource1.DataSet := aTab;
  ShowModal;
end;

procedure TFrmTar.edPendPropertiesChange(Sender: TObject);
begin
  edResolvido.Visible := (edPend.EditValue<>null) and (not edPend.EditValue);
  lbResolvido.Visible := edResolvido.Visible;
end;

procedure TFrmTar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTar.FormShow(Sender: TObject);
begin
  edPendPropertiesChange(nil);
end;

end.
