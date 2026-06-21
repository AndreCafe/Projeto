unit uCMGConfigDesktop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StShlCtl, StdCtrls, ExtCtrls, SsBase, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel,
  LMDLabel, LMDCustomScrollBox, LMDScrollBox, lmdsplt, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDBaseGraphicButton,
  cmClassesBase,
  LMDCustomSpeedButton, LMDSpeedButton, LMDSimplePanel, IniFiles,
  LMDCustomSimpleLabel, LMDSimpleLabel, lmdcont, LMDCustomComponent,
  ImgList;

type
  TFrmDesktop = class(TForm)
    LMDSplitterPanel1: TLMDSplitterPanel;
    LMDSplitterPane1: TLMDSplitterPane;
    LMDSplitterPane2: TLMDSplitterPane;
    lvExibir: TStShellListView;
    lvRem: TStShellListView;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDLabel2: TLMDLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDLabel1: TLMDLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    LMDSimplePanel4: TLMDSimplePanel;
    btnCancelar: TLMDSpeedButton;
    LMDLabel3: TLMDLabel;
    btnExibirTodos: TLMDSpeedButton;
    btnRemoverTodos: TLMDSpeedButton;
    LMDLabel4: TLMDLabel;
    lbTipo: TLMDSimpleLabel;
    Icones16: TImageList;
    LMDBitmapList1: TLMDBitmapList;
    btnSalvar: TLMDSpeedButton;
    cbTipos: TComboBox;
    LMDSimplePanel5: TLMDSimplePanel;
    LMDSimplePanel6: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    cbTodas: TCheckBox;
    procedure lvExibirFilterItem(Sender: TObject; ShellItem: TStShellItem;
      var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure lvExibirDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lvRemFilterItem(Sender: TObject;
      ShellItem: TStShellItem; var Accept: Boolean);
    procedure lvRemDblClick(Sender: TObject);
    procedure btnExibirTodosClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnRemoverTodosClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure cbTiposChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FIni : TMemIniFile;
    FResultado: TStrings;   
    function TipoStr: String;
    { Private declarations }
  public
    function ConfiguraDesktop(ADesktop: String): String;
    { Public declarations }
  end;

var
  FrmDesktop: TFrmDesktop;

implementation

uses uCMGPri;

{$R *.dfm}

procedure TFrmDesktop.lvExibirFilterItem(Sender: TObject; ShellItem: TStShellItem;
  var Accept: Boolean);
begin
  Accept := FIni.ReadBool(TipoStr, ShellItem.Path, False);
end;

procedure TFrmDesktop.FormShow(Sender: TObject);
begin
  Left := 0;
  Top := 0;
  Height := Screen.WorkAreaHeight;
  Width := Screen.WorkAreaWidth;
  lvExibir.Refresh;
  lvRem.Refresh;
end;

procedure TFrmDesktop.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmDesktop.lvExibirDblClick(Sender: TObject);
begin
  if lvExibir.SelectedItem=nil then Exit;
  FIni.WriteBool(TipoStr, lvExibir.SelectedItem.Path, False);
  lvExibir.Refresh;
  lvRem.Refresh;
end;

procedure TFrmDesktop.FormCreate(Sender: TObject);
var I : Integer;
begin
  cbTipos.Items.Clear;
  with FrmPri.CM.TiposAcesso do
  for I := 0 to Count-1 do
    cbTipos.Items.AddObject(Itens[I].Nome, TObject(Itens[I].Codigo));
  if cbTipos.Items.Count>0 then
    cbTipos.ItemIndex := 0;
  cbTipos.Visible := (cbTipos.Items.Count>1);
  lbTipo.Visible := (cbTipos.Items.Count>1);
end;

procedure TFrmDesktop.lvRemFilterItem(Sender: TObject;
  ShellItem: TStShellItem; var Accept: Boolean);
begin
  Accept := not FIni.ReadBool(TipoStr, ShellItem.Path, False);
end;

procedure TFrmDesktop.lvRemDblClick(Sender: TObject);
begin
  if lvRem.SelectedItem=nil then Exit;
  FIni.WriteBool(TipoStr, lvRem.SelectedItem.Path, True);
  lvExibir.Refresh;
  lvRem.Refresh;
end;

procedure TFrmDesktop.btnExibirTodosClick(Sender: TObject);
var
  I : Integer;
begin
  for I := 0 to lvExibir.ShellItems.Count-1 do
  with lvExibir.ShellItems.Items[I] do
    FIni.WriteBool(TipoStr, Path, True);
  lvExibir.Refresh;
  lvRem.Refresh;  
end;

procedure TFrmDesktop.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDesktop.btnRemoverTodosClick(Sender: TObject);
var
  SL: TStrings;
  I : Integer;
begin
  SL := TStringList.Create;
  try
    FIni.ReadSection(TipoStr, SL);
    for I := 0 to SL.Count-1 do
      FIni.DeleteKey(TipoStr, SL[I]);
    lvRem.Refresh;
    lvExibir.Refresh;
  finally
    SL.Free;
  end;
end;

procedure TFrmDesktop.FormDestroy(Sender: TObject);
begin
  FResultado.Free;
  FIni.Free;
end;

function TFrmDesktop.TipoStr: String;
begin
  with cbTipos do
  if ItemIndex>=0 then
    Result := 'Desktop'+InTToStr(Integer(Items.Objects[ItemIndex]))
  else
    Result := 'Desktop';
end;

function TFrmDesktop.ConfiguraDesktop(ADesktop: String): String;
begin
  FResultado := TStringList.Create;
  FIni := TMemIniFile.Create('');
  FResultado.Text := ADesktop;
  FIni.SetStrings(FResultado);
  ShowModal;
  Result := FResultado.Text;
end;

procedure TFrmDesktop.btnSalvarClick(Sender: TObject);
var
  Maq: TCMMaquina;
  I : Integer;
begin
  FResultado.Clear;
  FIni.WriteBool('Geral', 'Configurado', True);
  FIni.GetStrings(FResultado);
  with FrmPri.CM do
  if Ativo then begin
    for I := 0 to Maquinas.Count-1 do with Maquinas[I] do
    if (Numero=Maquina) or cbTodas.Checked then begin
      Maquinas[I].AtualizaCache;
      Menu := FResultado.Text;
      SalvaAlteracoesObj(Maquinas[I], False);
    end;
  end else
    ShowMessage('Essa máquina está desconectada do servidor neste momento');
  Close;
end;

procedure TFrmDesktop.cbTiposChange(Sender: TObject);
begin
  lvExibir.Refresh;
  lvRem.Refresh;
end;

procedure TFrmDesktop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
