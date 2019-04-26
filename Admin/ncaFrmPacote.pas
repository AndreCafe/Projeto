unit ncaFrmPacote;

interface
{
    ResourceString: Dario 11/03/13
}

uses
  Windows, ncErros, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, 
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxTextEdit, cxMaskEdit, cxCurrencyEdit, cxVGrid, cxDBVGrid, cxControls,
  cxInplaceContainer, dxBarExtItems, cxClasses, cxSpinEdit, cxLookAndFeels,
  cxLookAndFeelPainters;


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
    procedure Novo(aTab: TnxTable);
    { Public declarations }
  end;

var
  FrmPacote: TFrmPacote;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncIDRecursos, ufmImagens;

// START resource string wizard section
resourcestring
  SÉNecessárioDigitarAQuantidadeDeM = 'É necessário digitar a quantidade de minutos';
  SÉNecessárioDigitarUmNomeParaEsse = 'É necessário digitar um nome para esse pacote';

// END resource string wizard section


{$R *.DFM}

{ TFrmPacote }

procedure TFrmPacote.Editar(aTab: TnxTable);
begin
  FNovo := False;
  FTab := aTab;
  Tab.Insert;
  TabMinutos.Value := FTab.FieldByName('Minutos').AsInteger; // do not localize
  TabValor.Value := FTab.FieldByName('Valor').AsFloat; // do not localize
  TabDescr.Value := FTab.FieldByName('Descr').AsString; // do not localize
  ShowModal;
end;

procedure TFrmPacote.cmGravarClick(Sender: TObject);
begin
  VG.DataController.PostEditingData;
  if TabMinutos.Value=0 then
    raise ENexCafe.Create(SÉNecessárioDigitarAQuantidadeDeM);
  if TabDescr.Value='' then
    raise ENexCafe.Create(SÉNecessárioDigitarUmNomeParaEsse); 
    
  Tab.Post;
  if FNovo then
    FTab.Insert
  else  
    FTab.Edit;
  FTab.FieldByName('Minutos').AsInteger := TabMinutos.Value; // do not localize
  FTab.FieldByName('Valor').AsFloat := TabValor.Value; // do not localize
  FTab.FieldByName('Descr').AsString := TabDescr.Value; // do not localize
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

procedure TFrmPacote.FormShow(Sender: TObject);
begin
  VG.SetFocus;
  VG.FocusedRow := VGValorTotal;
  VG.FocusedRow := VGHoras;
  cmGravar.Enabled := Permitido(daCFGPrecos);
end;

end.

