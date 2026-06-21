unit ucmaFrmAviso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, 
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxTextEdit, cxMaskEdit, cxCurrencyEdit, cxVGrid, cxDBVGrid, cxControls,
  cxInplaceContainer, dxBarExtItems, cxSpinEdit, cxCheckBox, cxBlobEdit,
  cxButtonEdit, LMDCustomComponent, LMDStarter, LMDWaveComp;

type
  TFrmAviso = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    Tab: TkbmMemTable;
    dsTab: TDataSource;
    VG: TcxDBVerticalGrid;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    TabMinutos: TWordField;
    TabAvisoTexto: TStringField;
    TabSegAvisoTexto: TWordField;
    TabPiscarAvisoTexto: TBooleanField;
    TabSom: TBlobField;
    TabTocarSom: TBooleanField;
    VGMinutos1: TcxDBEditorRow;
    VGAvisoTexto1: TcxDBEditorRow;
    VGSegAvisoTexto1: TcxDBEditorRow;
    VGPiscarAvisoTexto1: TcxDBEditorRow;
    VGTocarSom1: TcxDBEditorRow;
    OpenDlg: TOpenDialog;
    cmAvisoSonoro: TdxBarLargeButton;
    pmAvisoSom: TdxBarPopupMenu;
    cmOuvir: TdxBarButton;
    cmSelecionarSom: TdxBarButton;
    Starter: TLMDStarter;
    Wave: TLMDWaveComp;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cmAvisoSonoroClick(Sender: TObject);
    procedure cmSelecionarSomClick(Sender: TObject);
    procedure cmOuvirClick(Sender: TObject);
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
  FrmAviso: TFrmAviso;

implementation

uses ucmaPri, ucmaDM, cmIDRecursos, ufmFormBase;

{$R *.DFM}

{ TFrmPacote }

procedure TFrmAviso.Editar(aTab: TnxTable);
begin
  FNovo := False;
  FTab := aTab;
  Tab.Insert;
  TransfDados(aTab, Tab);
  Tab.Post;
  Tab.Edit;
  ShowModal;
end;

procedure TFrmAviso.cmGravarClick(Sender: TObject);
begin
  Tab.Post;
  if FNovo then
    FTab.Insert
  else  
    FTab.Edit;
  TransfDados(Tab, FTab);  
  FTab.Post;
  Close;
end;

procedure TFrmAviso.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAviso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAviso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmAviso.Novo(aTab: TnxTable);
begin
  FNovo := True;
  FTab := aTab;
  Tab.Insert;
  ShowModal;
end;

procedure TFrmAviso.FormShow(Sender: TObject);
begin
  VG.SetFocus;
  cmGravar.Enabled := Permitido(daCFGPrecos);
end;

procedure TFrmAviso.cmAvisoSonoroClick(Sender: TObject);
var P : TPoint;
begin
  P := ItemLinkScreenPoint(cmAvisoSonoro.ClickItemLink);
  pmAvisoSom.Popup(P.X, P.Y);
end;

procedure TFrmAviso.cmSelecionarSomClick(Sender: TObject);
begin
  if OpenDlg.Execute then
    TabSom.LoadFromFile(OpenDlg.FileName);
end;

procedure TFrmAviso.cmOuvirClick(Sender: TObject);
var 
  S: String;
  M: TMemoryStream;
begin
  if TabSom.BlobSize = 0 then 
    Raise Exception.Create('O arquivo de som ainda não foi selecionado');
  M := TMemoryStream.Create;
  try
    TabSom.SaveToStream(M);
    M.Position := 0;
    Wave.Wave.LoadFromStream(M);
    S := ExtractFilePath(ParamStr(0))+'\temp.wav';  
    Wave.Play;
  finally
    M.Free;
  end;    
end;

end.
