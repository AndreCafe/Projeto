unit uCMFrmLancExtra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, dxInspRw, dxDBInRw, dxInspct, dxCntner, dxDBInsp,
  ExtCtrls, dxBar, ffDB;

type
  TFrmLancExtra = class(TForm)
    BarMgr: TdxBarManager;
    cmGravar: TdxBarButton;
    cmCancelar: TdxBarButton;
    Panel1: TPanel;
    Insp: TdxDBInspector;
    Tab: TkbmMemTable;
    dsTab: TDataSource;
    TabDia: TDateTimeField;
    TabCaixa: TIntegerField;
    TabUsuario: TStringField;
    TabEntrada: TBooleanField;
    TabTipo: TStringField;
    TabDescricao: TStringField;
    TabValor: TCurrencyField;
    TabObs: TMemoField;
    InspDia: TdxInspectorDBDateRow;
    InspCaixa: TdxInspectorDBMaskRow;
    InspUsuario: TdxInspectorDBMaskRow;
    InspEntrada: TdxInspectorDBCheckRow;
    InspDescricao: TdxInspectorDBMaskRow;
    InspValor: TdxInspectorDBCurrencyRow;
    InspObs: TdxInspectorDBMemoRow;
    InspTipo: TdxInspectorDBPickRow;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure TabAfterInsert(DataSet: TDataSet);
    procedure InspEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    FNovo : Boolean;
    FTab : TffTable;
    procedure Editar(aTab: TffTable);
    procedure Novo(aTab: TffTable; Entrada: Boolean);
    { Public declarations }
  end;

var
  FrmLancExtra: TFrmLancExtra;

implementation

uses uCMFrmPri, uCMDados, cmIDRecursos;

{$R *.DFM}

{ TFrmPacote }

procedure TFrmLancExtra.Editar(aTab: TffTable);
begin
  cmGravar.Enabled := Permitido(reLancExtras, taLEXEditar); 
  FNovo := False;
  FTab := aTab;
  if (NumAberto<1) or (NumAberto<>FTab.FieldByName('Caixa').AsInteger) then
    cmGravar.Enabled := False;
    
  Tab.Insert;
  TransfDados(FTab, Tab);
  Tab.Post;
  Tab.Edit;
  ShowModal;
end;

procedure TFrmLancExtra.cmGravarClick(Sender: TObject);
begin
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
    DB.StartTransactionWith([tbCaixa, FTab]);
    try
      Tab.Post;
      
      tbCaixa.Edit;
      
      if FNovo then
        FTab.Insert
      else begin
        if FTab.FieldByName('Entrada').AsBoolean then
          tbCaixa.FieldByName('LancExtrasE').AsFloat :=
            tbCaixa.FieldByName('LancExtrasE').AsFloat -
            FTab.FieldByName('Valor').AsFloat
        else
          tbCaixa.FieldByName('LancExtrasS').AsFloat :=
            tbCaixa.FieldByName('LancExtrasS').AsFloat -
            FTab.FieldByName('Valor').AsFloat;
            
        FTab.Edit;
      end;  
    
      TransfDados(Tab, FTab); 

      FTab.FieldByName('Entrada').Value := TabEntrada.Value;
      FTab.FieldByName('Valor').Value   := TabValor.Value;
      
      FTab.FieldByName('Caixa').AsInteger := NumAberto;

      FTab.Post;

      if FTab.FieldByName('Entrada').AsBoolean then
        tbCaixa.FieldByName('LancExtrasE').AsFloat :=
          tbCaixa.FieldByName('LancExtrasE').AsFloat +
          FTab.FieldByName('Valor').AsFloat
      else
        tbCaixa.FieldByName('LancExtrasS').AsFloat :=
          tbCaixa.FieldByName('LancExtrasS').AsFloat +
          FTab.FieldByName('Valor').AsFloat;
      
      tbCaixa.Post;
      
      DB.Commit;
    except
      FTab.Cancel;
      tbCaixa.Cancel;
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

procedure TFrmLancExtra.Novo(aTab: TffTable; Entrada: Boolean);
begin
  FTab := aTab;
  if (NumAberto<1) then
    cmGravar.Enabled := False;
  FNovo := True;
  InspCaixa.Visible := False;
  Tab.Insert;
  TabEntrada.Value := Entrada;
  TabUsuario.Value := Dados.CM.Username;
  TabDia.Value := Now;
  ShowModal;
end;

procedure TFrmLancExtra.FormCreate(Sender: TObject);
begin
  InspTipo.Items.SetText(PChar(Dados.tbConfigTiposLancExtra.Value));
end;

procedure TFrmLancExtra.TabAfterInsert(DataSet: TDataSet);
begin
  TabEntrada.Value := False;
end;

procedure TFrmLancExtra.InspEnter(Sender: TObject);
begin
  Insp.FocusedField := TabValor;
end;

procedure TFrmLancExtra.FormShow(Sender: TObject);
begin
  Insp.FocusedField := TabValor;
end;

end.
