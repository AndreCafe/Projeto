unit ncaFrmPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, Variants,
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxTextEdit, cxMaskEdit, cxCurrencyEdit, cxVGrid, cxDBVGrid, cxControls,
  cxInplaceContainer, dxBarExtItems, cxSpinEdit, cxCheckBox, cxBlobEdit,
  cxButtonEdit, LMDCustomComponent, LMDStarter, LMDWaveComp, Buttons,
  PngSpeedButton, cxGroupBox, cxRadioGroup, cxDBEdit, cxContainer, cxLabel,
  cxClasses, cxMemo;

type
  TFrmPatro = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    Tab: TkbmMemTable;
    dsTab: TDataSource;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cmAvisoSonoro: TdxBarLargeButton;
    pmAvisoSom: TdxBarPopupMenu;
    cmOuvir: TdxBarButton;
    cmSelecionarSom: TdxBarButton;
    cxLabel1: TcxLabel;
    gbTexto: TcxGroupBox;
    TabNome: TStringField;
    TabURLArea1: TMemoField;
    TabURLArea2: TMemoField;
    TabDominiosPerm: TMemoField;
    edNome: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edDominiosPerm: TcxDBMemo;
    edURL1: TcxTextEdit;
    edURL2: TcxTextEdit;
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
    procedure RefreshSom;
    { Public declarations }
  end;

var
  FrmPatro: TFrmPatro;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncIDRecursos, 
  ufmFormBase;

{$R *.DFM}

{ TFrmPacote }

procedure TFrmPatro.Editar(aTab: TnxTable);
begin
  FNovo := False;
  FTab := aTab;
  Tab.Insert;
  TransfDados(aTab, Tab);
  edURL1.Text := TabURLArea1.Value;
  edURL2.Text := TabURLArea2.Value;
  Tab.Post;
  Tab.Edit;
  ShowModal;
end;

procedure TFrmPatro.cmGravarClick(Sender: TObject);
begin
  if (edNome.EditValue=Null) or (Trim(edNome.EditValue)='') then
    raise Exception.Create('É necessário informar o nome do patrocinador');

  if (edURL1.Text='') or (Trim(edURL1.Text)='') then
    raise Exception.Create('É necessário o endereço da página principal a ser exibida');
    
  TabURLArea1.Value := edURL1.Text;
  TabURLArea2.Value := edURL2.Text;
  
  Tab.Post;
  if FNovo then
    FTab.Insert
  else  
    FTab.Edit;
  TransfDados(Tab, FTab);  
  FTab.Post;
  Close;
end;

procedure TFrmPatro.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPatro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPatro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmPatro.Novo(aTab: TnxTable);
begin
  FNovo := True;
  FTab := aTab;
  Tab.Insert;
  ShowModal;
end;

procedure TFrmPatro.RefreshSom;
begin
end;

procedure TFrmPatro.FormShow(Sender: TObject);
begin
  cmGravar.Enabled := Permitido(daCFGPrecos);
end;

end.
