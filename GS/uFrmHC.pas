unit uFrmHC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxMaskEdit, cxDropDownEdit, cxDBEdit, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, cxRichEdit, cxDBRichEdit,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, dxBar,
  dxBarExtItems, DB, cxClasses;

type
  TFrmHC = class(TForm)
    BarMgr: TdxBarManager;
    cmCancelar: TdxBarLargeButton;
    cmFechar: TdxBarLargeButton;
    cmSalvar: TdxBarLargeButton;
    LMDSimplePanel1: TLMDSimplePanel;
    edTexto: TcxDBRichEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edMeio: TcxDBComboBox;
    edPor: TcxDBComboBox;
    DataSource1: TDataSource;
    edTipo: TcxDBComboBox;
    cxLabel3: TcxLabel;
    procedure cmSalvarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure Editar(aTab: TDataset);
    { Public declarations }
  end;

var
  FrmHC: TFrmHC;

implementation

uses uNRfbClientes;

{$R *.dfm}

{ TFrmHC }

procedure TFrmHC.cmCancelarClick(Sender: TObject);
begin
  DataSource1.DataSet.Cancel;
  Close;
end;

procedure TFrmHC.cmSalvarClick(Sender: TObject);
begin
  DataSource1.Dataset.Post;
  Close;
end;

procedure TFrmHC.Editar(aTab: TDataset);
begin
  DataSource1.DataSet := aTab;
  ShowModal;
end;

procedure TFrmHC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
