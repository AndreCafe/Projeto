unit ncaFrmPacote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, 
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxTextEdit, cxMaskEdit, cxCurrencyEdit, cxVGrid, cxDBVGrid, cxControls,
  cxInplaceContainer, dxBarExtItems, cxClasses, cxSpinEdit;

type
  TFrmPacote = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    Tab: TkbmMemTable;
    TabQtdTempo: TIntegerField;
    TabValor: TCurrencyField;
    TabMinutos: TIntegerField;
    dsTab: TDataSource;
    TabDescr: TStringField;
    VG: TcxDBVerticalGrid;
    VGCodigo: TcxDBEditorRow;
    VGHoras: TcxDBEditorRow;
    VGValorTotal: TcxDBEditorRow;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    VGNome: TcxDBEditorRow;
    VGFidelidade: TcxDBEditorRow;
    VGDBEditorRow2: TcxDBEditorRow;
    TabFidelidade: TBooleanField;
    TabFidPontos: TIntegerField;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure TabAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    FNovo : Boolean;
    FTab : TnxTable;
    procedure Editar(aTab: TnxTable);
    procedure Novo(aTab: TnxTable);
    { Public declarations }
  end;

var
  FrmPacote: TFrmPacote;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncIDRecursos;

{$R *.DFM}

{ TFrmPacote }

procedure TFrmPacote.Editar(aTab: TnxTable);
begin
  FNovo := False;
  FTab := aTab;
  Tab.Insert;
  TabMinutos.Value := FTab.FieldByName('Minutos').AsInteger;
  TabValor.Value := FTab.FieldByName('Valor').AsFloat;
  TabDescr.Value := FTab.FieldByName('Descr').AsString;
  TabFidelidade.Value := FTab.FieldByName('Fidelidade').AsBoolean;
  TabFidPontos.Value := FTab.FieldByName('FidPontos').AsInteger;
  ShowModal;
end;

procedure TFrmPacote.cmGravarClick(Sender: TObject);
begin
  VG.DataController.PostEditingData;
  if TabMinutos.Value=0 then
    raise Exception.Create('É necessário digitar a quantidade de minutos');
  if TabDescr.Value='' then
    raise Exception.Create('É necessário digitar um nome para esse pacote'); 
    
  Tab.Post;
  if FNovo then
    FTab.Insert
  else  
    FTab.Edit;
  FTab.FieldByName('Minutos').AsInteger := TabMinutos.Value;
  FTab.FieldByName('Valor').AsFloat := TabValor.Value;
  FTab.FieldByName('Descr').AsString := TabDescr.Value;
  FTab.FieldByName('Fidelidade').AsBoolean := TabFidelidade.Value;
  FTab.FieldByName('FidPontos').AsInteger := TabFidPontos.Value;
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

procedure TFrmPacote.Novo(aTab: TnxTable);
begin
  FNovo := True;
  FTab := aTab;
  Tab.Insert;
  FTab.Last;
  ShowModal;
end;

procedure TFrmPacote.TabAfterInsert(DataSet: TDataSet);
begin
  TabFidelidade.Value := False;
end;

procedure TFrmPacote.FormShow(Sender: TObject);
begin
  VG.SetFocus;
  VG.FocusedRow := VGValorTotal;
  VG.FocusedRow := VGHoras;
  cmGravar.Enabled := Permitido(daCFGPrecos);
end;

end.
