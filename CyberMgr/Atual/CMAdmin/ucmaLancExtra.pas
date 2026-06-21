unit ucmaLancExtra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, 
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxCalendar, cxMaskEdit, cxDBLookupComboBox, cxCurrencyEdit, cxMemo,
  cxImageComboBox, cxVGrid, cxDBVGrid, cxControls, cxInplaceContainer,
  dxBarExtItems;

type
  TFrmLancExtra = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    Tab: TkbmMemTable;
    dsTab: TDataSource;
    TabDia: TDateTimeField;
    TabCaixa: TIntegerField;
    TabUsuario: TStringField;
    TabValor: TCurrencyField;
    TabObs: TMemoField;
    TabNomeUsuario: TStringField;
    TabTipo: TIntegerField;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    VG: TcxDBVerticalGrid;
    VGDia: TcxDBEditorRow;
    VGCaixa: TcxDBEditorRow;
    VGNomeUsuario: TcxDBEditorRow;
    VGValor: TcxDBEditorRow;
    VGObs: TcxDBEditorRow;
    VGTipo: TcxDBEditorRow;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    FNovo : Boolean;
    FTab : TnxTable;
    procedure Editar(aTab: TnxTable);
    procedure Novo(aTab: TnxTable; Tipo: Byte);
    { Public declarations }
  end;

var
  FrmLancExtra: TFrmLancExtra;

implementation

uses ucmaPri, ucmaDM, cmIDRecursos, cmClassesBase;

{$R *.DFM}

{ TFrmPacote }

procedure TFrmLancExtra.Editar(aTab: TnxTable);
begin
  FNovo := False;
  FTab := aTab;
  Tab.Insert;
  TabDia.Value := FTab.FieldByName('Inicio').AsDateTime;
  TabCaixa.Value := FTab.FieldByName('CaixaP').AsInteger;
  TabTipo.Value := FTab.FieldByName('Tipo').AsInteger;
  TabValor.Value := FTab.FieldByName('Valor').AsFloat;
  TabObs.Value := FTab.FieldByName('Obs').AsString;
  TabUsuario.Value := FTab.FieldByName('FuncI').AsString;

  if ((TabTipo.Value = ttSangriaCaixa) and (not Permitido(daCaiSangria))) or
     ((TabTipo.Value = ttSuprimentoCaixa) and (not Permitido(daCaiSuprimento))) then
    cmGravar.Enabled := False;

  cmGravar.Enabled := cmGravar.Enabled and PodeEditarTran(FTab);
  
  TransfDados(FTab, Tab);
  Tab.Post;
  Tab.Edit;
  ShowModal;
end;

procedure TFrmLancExtra.cmGravarClick(Sender: TObject);
begin
  VG.DataController.PostEditingData;
  VG.DataController.Post;
  with Dados do begin
    tbCaixa.Refresh;
    tbCaixa.IndexName := 'INumero';
    if not tbCaixa.FindKey([NumAberto]) then begin
      Beep;
      ShowMessage('Caixa não encontrado!');
      Exit;
    end;
  end;

  with Dados do begin
    DB.StartTransactionWith([FTab]);
    try
      if Tab.State in [dsEdit, dsInsert] then
        Tab.Post;
      
      if FNovo then begin
        FTab.Insert;
        FTab.FieldByName('Inicio').AsDateTime := Now;
        FTab.FieldByName('Fim').AsDateTime := Now;
        FTab.FieldByName('FuncI').AsString := TabUsuario.Value;
        FTab.FieldByName('FuncF').AsString := TabUsuario.Value;
        FTab.FieldByName('Tipo').AsInteger := TabTipo.Value;
        FTab.FieldByName('CaixaI').AsInteger := NumAberto;
        FTab.FieldByName('CaixaF').AsInteger := NumAberto;
        FTab.FieldByName('CaixaP').AsInteger := NumAberto;
        FTab.FieldByName('DataPagto').AsDateTime := Now;
        FTab.FieldByName('StatusPagto').AsInteger := spPago;
      end else
        FTab.Edit;
      FTab.FieldByName('Valor').Value := TabValor.Value;
      FTab.FieldByName('Obs').Value   := TabObs.Value;
      FTab.Post;

      DB.Commit;
    except
      FTab.Cancel;
      DB.Rollback;
      Raise;
    end;
  end;
  Close;
end;

procedure TFrmLancExtra.cmCancelarClick(Sender: TObject);
begin
  Close;
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

procedure TFrmLancExtra.Novo(aTab: TnxTable; Tipo: Byte);
begin
  FTab := aTab;
  if (NumAberto<1) then
    cmGravar.Enabled := False;
  FNovo := True;
  VGCaixa.Visible := False;
  Tab.Insert;
  TabUsuario.Value := Dados.CM.Username;
  TabDia.Value := Now;
  TabCaixa.Value := NumAberto;
  TabTipo.Value := Tipo;
  ShowModal;
end;

procedure TFrmLancExtra.FormShow(Sender: TObject);
begin
  VG.SetFocus;
  VG.FocusedRow := VGObs;
  VG.FocusedRow := VGValor;
end;

end.
