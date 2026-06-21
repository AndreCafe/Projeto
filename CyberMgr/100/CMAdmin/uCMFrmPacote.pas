unit uCMFrmPacote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, dxInspRw, dxDBInRw, dxInspct, dxCntner, dxDBInsp,
  ExtCtrls, dxBar, ffDB;

type
  TFrmPacote = class(TForm)
    BarMgr: TdxBarManager;
    cmGravar: TdxBarButton;
    cmCancelar: TdxBarButton;
    Panel1: TPanel;
    Insp: TdxDBInspector;
    Tab: TkbmMemTable;
    TabQtdTempo: TIntegerField;
    TabValorTotal: TCurrencyField;
    TabHoras: TIntegerField;
    dsTab: TDataSource;
    InspValorTotal: TdxInspectorDBCurrencyRow;
    InspHoras: TdxInspectorDBMaskRow;
    InspRow3: TdxInspectorDBRow;
    TabDescr: TStringField;
    TabCodigo: TWordField;
    InspRow4: TdxInspectorDBRow;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    FNovo : Boolean;
    FTab : TffTable;
    procedure Editar(aTab: TffTable);
    procedure Novo(aTab: TffTable);
    { Public declarations }
  end;

var
  FrmPacote: TFrmPacote;

implementation

uses uCMFrmPri;

{$R *.DFM}

{ TFrmPacote }

procedure TFrmPacote.Editar(aTab: TffTable);
begin
  FNovo := False;
  FTab := aTab;
  Tab.Insert;
  TabCodigo.Value := FTab.FieldByName('Codigo').AsInteger;
  TabHoras.Value := FTab.FieldByName('Horas').AsInteger;
  TabValorTotal.Value := FTab.FieldByName('ValorTotal').AsFloat;
  TabDescr.Value := FTab.FieldByName('Descr').AsString;
  ShowModal;
end;

procedure TFrmPacote.cmGravarClick(Sender: TObject);
begin
  Tab.Post;
  if FNovo then
    FTab.Insert
  else  
    FTab.Edit;
  FTab.FieldByName('Codigo').AsInteger := TabCodigo.Value;
  FTab.FieldByName('Horas').AsInteger := TabHoras.Value;
  FTab.FieldByName('ValorTotal').AsFloat := TabValorTotal.Value;
  FTab.FieldByName('Descr').AsString := TabDescr.Value;
  FTab.Post;
  Close;
end;

procedure TFrmPacote.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPacote.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPacote.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmPacote.Novo(aTab: TffTable);
begin
  FNovo := True;
  FTab := aTab;
  Tab.Insert;
  FTab.Last;
  if FTab.RecordCount>0 then
    TabCodigo.Value := FTab.FieldByName('Codigo').AsInteger + 1
  else
    TabCodigo.Value := 1;
  
  ShowModal;
end;

end.
