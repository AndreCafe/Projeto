unit ncaFrmAviso;
{
    ResourceString: Dario 10/03/13
}


interface

uses
  Windows, ncErros, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, Variants,
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxTextEdit, cxMaskEdit, cxCurrencyEdit, cxVGrid, cxDBVGrid, cxControls,
  cxInplaceContainer, dxBarExtItems, cxSpinEdit, cxCheckBox, cxBlobEdit,
  cxButtonEdit, LMDCustomComponent, LMDWaveComp, Buttons,
  cxGroupBox, cxRadioGroup, cxDBEdit, cxContainer, cxLabel,
  cxClasses, cxLookAndFeelPainters, cxLookAndFeels, Menus, StdCtrls, cxButtons;

type
  TFrmAviso = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    Tab: TkbmMemTable;
    dsTab: TDataSource;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    TabMinutos: TWordField;
    TabAvisoTexto: TStringField;
    TabSegAvisoTexto: TWordField;
    TabPiscarAvisoTexto: TBooleanField;
    TabSom: TBlobField;
    OpenDlg: TOpenDialog;
    cmAvisoSonoro: TdxBarLargeButton;
    pmAvisoSom: TdxBarPopupMenu;
    cmOuvir: TdxBarButton;
    cmSelecionarSom: TdxBarButton;
    Wave: TLMDWaveComp;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edMinutos: TcxDBSpinEdit;
    gbTexto: TcxGroupBox;
    edPiscarAviso: TcxDBCheckBox;
    lbTempo: TcxLabel;
    lbTexto: TcxLabel;
    edTexto: TcxDBTextEdit;
    lbSegundos: TcxLabel;
    rgTipoAviso: TcxDBRadioGroup;
    gbSom: TcxGroupBox;
    TabTipo: TWordField;
    edTempoAviso: TcxDBSpinEdit;
    btnOuvir: TcxButton;
    btnSelecionar: TcxButton;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cmAvisoSonoroClick(Sender: TObject);
    procedure btnOuvirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure rgTipoAvisoPropertiesEditValueChanged(Sender: TObject);
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
  FrmAviso: TFrmAviso;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncIDRecursos, 
  ufmFormBase, ufmImagens;

// START resource string wizard section
resourcestring
  SÉNecessárioDigitarOTextoQueSeráE = 'É necessário digitar o texto que será exibido ao cliente';
  SÉNecessárioSelecionarUmArquivoDe = 'É necessário selecionar um arquivo de som a ser tocado no momento do aviso';
  SÉNecessárioInformarAQuantidadeDe = 'É necessário informar a quantidade de minutos';
  SAlterarArquivoDeSom = 'Alterar arquivo de som';
  SSelecionarUmArquivoDeSom = 'Selecionar um arquivo de som';
  SOArquivoDeSomAindaNãoFoiSelecion = 'O arquivo de som ainda não foi selecionado';

// END resource string wizard section


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
  if gbTexto.Enabled and (Trim(edTexto.Text)='') then
    raise ENexCafe.Create(SÉNecessárioDigitarOTextoQueSeráE);

  if gbSom.Enabled and (TabSom.IsNull) then 
    raise ENexCafe.Create(SÉNecessárioSelecionarUmArquivoDe);

  if (edMinutos.Value=null) or (edMinutos.Value=0) then
    raise ENexCafe.Create(SÉNecessárioInformarAQuantidadeDe);
  
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
  TabMinutos.Value := 0;
  TabTipo.Value := 0;
  TabSegAvisoTexto.Value := 20;
  ShowModal;
end;

procedure TFrmAviso.RefreshSom;
begin
  btnOuvir.Enabled := gbSom.Enabled and (not TabSom.IsNull);
  btnSelecionar.Enabled := gbSom.Enabled;
  if btnOuvir.Enabled then
    btnSelecionar.Caption := SAlterarArquivoDeSom else
    btnSelecionar.Caption := SSelecionarUmArquivoDeSom;
end;

procedure TFrmAviso.rgTipoAvisoPropertiesEditValueChanged(Sender: TObject);
begin
  gbTexto.Enabled := (TabTipo.Value in [0, 2]);
  gbSom.Enabled := (TabTipo.Value > 0);
  if (not gbSom.Enabled) and (Tab.State in [dsEdit, dsInsert]) then
    TabSom.Clear;

  lbTexto.Enabled := gbTexto.Enabled;
  edTexto.Enabled := gbTexto.Enabled;
  lbTempo.Enabled := gbTexto.Enabled;
  lbSegundos.Enabled := gbTexto.Enabled;
  edTempoAviso.Enabled := gbTexto.Enabled;
  edPiscarAviso.Enabled := gbTexto.Enabled;
  RefreshSom;
end;

procedure TFrmAviso.FormShow(Sender: TObject);
begin
  cmGravar.Enabled := Permitido(daCFGPrecos);
  rgTipoAvisoPropertiesEditValueChanged(nil);
end;

procedure TFrmAviso.btnOuvirClick(Sender: TObject);
var
  S: String;
  M: TMemoryStream;
begin
  if TabSom.BlobSize = 0 then 
    Raise ENexCafe.Create(SOArquivoDeSomAindaNãoFoiSelecion);
  M := TMemoryStream.Create;
  try
    TabSom.SaveToStream(M);
    M.Position := 0;
    Wave.Wave.LoadFromStream(M);
    S := ExtractFilePath(ParamStr(0))+'\temp.wav';   // do not localize
    Wave.Play;
  finally
    M.Free;
  end;    
end;

procedure TFrmAviso.btnSelecionarClick(Sender: TObject);
begin
  if OpenDlg.Execute then begin
    TabSom.LoadFromFile(OpenDlg.FileName);
    RefreshSom;
  end;
end;

procedure TFrmAviso.cmAvisoSonoroClick(Sender: TObject);
var P : TPoint;
begin
  P := ItemLinkScreenPoint(cmAvisoSonoro.ClickItemLink);
  pmAvisoSom.Popup(P.X, P.Y);
end;

end.

