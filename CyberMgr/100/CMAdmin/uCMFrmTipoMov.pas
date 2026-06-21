unit uCMFrmTipoMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxBar, dxInspRw, dxDBInRw, dxInspct, dxCntner, dxDBInsp, Db,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmTipoMov = class(TForm)
    BarMgr: TdxBarManager;
    cmGravar: TdxBarButton;
    cmCancelar: TdxBarButton;
    LMDSimplePanel1: TLMDSimplePanel;
    dxDBInspector1: TdxDBInspector;
    dxDBInspector1Nome: TdxInspectorDBMaskRow;
    dxDBInspector1MovEst: TdxInspectorDBCheckRow;
    dxDBInspector1Entrada: TdxInspectorDBCheckRow;
    dxDBInspector1Serie: TdxInspectorDBMaskRow;
    dxDBInspector1PermiteAlterarSerie: TdxInspectorDBCheckRow;
    dxDBInspector1NumeroAutomatico: TdxInspectorDBCheckRow;
    dxDBInspector1ConfirmarMovEstoque: TdxInspectorDBCheckRow;
    dxDBInspector1AtualizaCusto: TdxInspectorDBCheckRow;
    dxDBInspector1Row9: TdxInspectorDBMemoRow;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTipoMov: TFrmTipoMov;

implementation

uses uCMDados, uCMFrmPri;

{$R *.DFM}

procedure TFrmTipoMov.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmTipoMov.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dados.tbTipoMov.Cancel;
  Action := caFree;
end;

procedure TFrmTipoMov.cmGravarClick(Sender: TObject);
begin
  with Dados, tbTipoMov do
  if State in [dsEdit, dsInsert] then
    Post;
  Close;  
end;

procedure TFrmTipoMov.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
