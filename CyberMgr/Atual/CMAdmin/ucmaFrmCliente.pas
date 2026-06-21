unit ucmaFrmCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxBar, StdCtrls, 
  DBCtrls, ExtCtrls,
  lmdcctrl, lmdctrl, lmdeditb, lmdeditc, Lmddbedit, 
  ComCtrls, Db, kbmMemTable, ToolWin, nxdb, 
  dxBarExtItems, 
  lmdbtn, lmdstdcS, cxStyles, cxGraphics, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxImageComboBox, cxMemo, ufmFormBase,
  cxVGrid, cxDBVGrid, cxInplaceContainer, cxPC, cxControls,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, Mask,
  cxCheckBox, cxRadioGroup, cxTimeEdit, cxLookAndFeels, cxGroupBox, cxDBEdit,
  cxContainer, cxCurrencyEdit, cxImage, Buttons, PngSpeedButton;

type
  TFrmCliente = class(TForm)
    BarMgr: TdxBarManager;
    DS: TDataSource;
    panPri: TLMDSimplePanel;
    tAux: TnxTable;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    Paginas: TcxPageControl;
    FMgr: TFormManager;
    MT: TkbmMemTable;
    MTCodigo: TAutoIncField;
    MTNome: TStringField;
    MTEndereco: TStringField;
    MTBairro: TStringField;
    MTCidade: TStringField;
    MTUF: TStringField;
    MTCEP: TStringField;
    MTNasc: TDateTimeField;
    MTSexo: TStringField;
    MTObs: TMemoField;
    MTCpf: TStringField;
    MTRg: TStringField;
    MTTelefone: TStringField;
    MTEmail: TMemoField;
    MTCreditoM: TIntegerField;
    MTTempoTotal: TIntegerField;
    MTTempoInicial: TIntegerField;
    MTIsento: TBooleanField;
    MTUsername: TStringField;
    MTSenha: TStringField;
    MTUltVisita: TDateTimeField;
    MTDebito: TCurrencyField;
    MTEscola: TStringField;
    MTNickName: TStringField;
    MTDataNasc: TDateTimeField;
    MTCelular: TStringField;
    MTTemDebito: TBooleanField;
    MTTipoAcessoPref: TIntegerField;
    cmHistorico: TdxBarLargeButton;
    MTIncluidoEm: TSQLTimeStampField;
    MTAlteradoEm: TDateTimeField;
    MTIncluidoPor: TStringField;
    MTAlteradoPor: TStringField;
    MTPai: TStringField;
    MTMae: TStringField;
    MTEscolaHI: TDateTimeField;
    MTEscolaHF: TDateTimeField;
    MTInativo: TBooleanField;
    MTLimiteDebito: TCurrencyField;
    tsDados: TcxTabSheet;
    L: TcxLookAndFeelController;
    dxBarCombo1: TdxBarCombo;
    dxBarCombo2: TdxBarCombo;
    MTFoto: TGraphicField;
    InspNome: TcxDBVerticalGrid;
    InspNomeObs: TcxDBEditorRow;
    InspNomeEmail: TcxDBEditorRow;
    InspSexo: TcxDBEditorRow;
    InspNomeDBEditorRow2: TcxDBEditorRow;
    InspNomeDBEditorRow1: TcxDBEditorRow;
    InspNomeDataNasc: TcxDBEditorRow;
    InspNomeCelular: TcxDBEditorRow;
    InspNomeTelefone: TcxDBEditorRow;
    InspNomeNickName: TcxDBEditorRow;
    InspNomeUsername: TcxDBEditorRow;
    InspNomeNome: TcxDBEditorRow;
    InspCodigo: TcxDBEditorRow;
    vgLimDebito: TcxDBEditorRow;
    InspNomeTA: TcxDBEditorRow;
    InspEscola: TcxDBEditorRow;
    InspNomeDBEditorRow3: TcxDBEditorRow;
    InspNomeDBEditorRow5: TcxDBEditorRow;
    InspNomeDBEditorRow6: TcxDBEditorRow;
    InspNomeDBEditorRow7: TcxDBEditorRow;
    InspNomeDBEditorRow8: TcxDBEditorRow;
    InspNomeDBEditorRow9: TcxDBEditorRow;
    vgTipoConta: TcxDBEditorRow;
    vgStatusConta: TcxDBEditorRow;
    InspNomeDBEditorRow12: TcxDBEditorRow;
    InspNomeDBEditorRow13: TcxDBEditorRow;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    btnCancelar: TPngSpeedButton;
    btnHistorico: TPngSpeedButton;
    btnSalvar: TPngSpeedButton;
    vgEscolaHI: TcxDBEditorRow;
    vgEscolaHF: TcxDBEditorRow;
    vgCategescola: TcxCategoryRow;
    vgSenha: TcxDBEditorRow;
    procedure DSStateChange(Sender: TObject);
    procedure InspNomeIsentoPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmHistoricoClick(Sender: TObject);
    procedure MTAfterInsert(DataSet: TDataSet);
    procedure MTAfterEdit(DataSet: TDataSet);

    { Private declarations }
  private
    FPai: TWinControl;

    procedure RefreshBtn;
  public
    FNovo : Boolean;
    Resultado: Integer;
    FRgAnt : String;
    FUsername : String;
    FTab : TDataset;
    function Novo(aTab: TDataset; aPai: TWinControl): Integer;
    procedure Editar(aTab: TDataset; aPai: TWinControl);
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

uses 
  ucmaDM,
  ucmaPri,
  cmClassesBase,
  cmIDRecursos,
  cmListaID,
  ufmImagens, ucmafbPass, ucmafbTran;

{$R *.DFM}

procedure TFrmCliente.Editar(aTab: TDataset; aPai: TWinControl);
begin
  if aTab=nil then aTab := Dados.tbCli;
  try
    FNovo := False;
    FTab := ATab;
    MT.Insert;
    TransfDados(FTab, MT);
    if (MTSexo.Value<>'M') and (MTSexo.Value<>'F') then
      MTSexo.Value := 'M';
    if MTInativo.IsNull then
      MTInativo.Value := False;
      
    FUsername := MTUsername.Value;
    if MTIsento.IsNull then
      MTIsento.Value := False;

    cmHistorico.Visible := ivAlways;
    cmGravar.Enabled := Permitido(daCliCadastrar);
    
    if aPai=nil then
      ShowModal
    else begin
      FPai := aPai;
      panPri.Parent := FPai;
    end;  
  finally
    if FPai=nil then Free;
  end;  
end;

procedure TFrmCliente.cmGravarClick(Sender: TObject);
begin
  InspNome.DataController.PostEditingData;
  if MTNome.Value = '' then
    Raise Exception.Create('Nome não pode ser deixado em branco !');
      
  if (FRgAnt<>MTRg.Value) and (MTRg.AsString>'') and tAux.FindKey([MTRG.Value]) then
    Raise Exception.Create('Já existe um cliente cadastrado com esse RG');

  if (FUsername <> MTUsername.Value) and
     (MTUsername.Value <> '') and
     tAux.Locate('Username', MTUsername.Value, [loCaseInsensitive]) then
  begin
    Beep;
    ShowMessage('Já existe outro cliente cadastrado com esse mesmo Username!');
    Exit;
  end;   

  if FNovo then begin
    FTab.Insert;
    FTab.FieldByName('IncluidoEm').AsDateTime := Now;
    FTab.FieldByName('IncluidoPor').AsString := Dados.CM.Username;
  end else begin
    FTab.Edit; 
    FTab.FieldByName('AlteradoEm').AsDateTime := Now;
    FTab.FieldByName('AlteradoPor').AsString := Dados.CM.Username;
  end;

  TransfDadosEsp(MT, FTab, '|CreditoM|IncluidoEm|IncluidoPor|AlteradoEm|AlteradoPor|');

  FTab.Post;
  Resultado := FTab.FieldByName('Codigo').AsInteger;
  if FPai=nil  then Close;
end;

procedure TFrmCliente.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMgr.Clear;
  Action := caFree;
end;

procedure TFrmCliente.FormCreate(Sender: TObject);
var II : TcxImageComboBoxItem;
begin
  vgSenha.Properties.EditProperties.ReadOnly := not Dados.CM.Config.AlterarSenhaCli;
  vgTipoConta.Properties.EditProperties.ReadOnly := not Permitido(daCliMarcarIsento);
  vgStatusConta.Properties.EditProperties.ReadOnly := not Permitido(daInativarContas);
  vgLimDebito.Properties.EditProperties.ReadOnly := not Permitido(daAlterarLimiteDebito);

  FPai := nil;
  Paginas.ActivePageIndex := 0;
  with Dados, TcxImageComboBoxProperties(InspNomeTA.Properties.EditProperties) do begin
    Items.Clear;
    II := TcxImageComboBoxItem(Items.Add);
    II.Value := -1;
    II.Description := 'Livre';

    if tbTipoAcesso.RecordCount<2 then      
      InspNomeTA.Visible := False;

    tbTipoAcesso.First;
    while not tbTipoAcesso.Eof do begin
      II := TcxImageComboBoxItem(Items.Add);
      II.Description := tbTipoAcessoNome.Value;
      II.Value := tbTipoAcessoCodigo.Value;
      tbTipoAcesso.Next;
    end;
  end;

  FrmCliente := Self;
  MT.Open;
  tAux.Open;
  Paginas.ActivePageIndex:= 0;
  FMgr.RegistraForm(TfbPassaportes);
  FMgr.RegistraForm(TfbTran);
  with TcxMaskEditProperties(vgSenha.Properties.EditProperties) do
  if Dados.CM.Config.VerSenhaCli then
    EchoMode := eemNormal
  else
    EchoMode := eemPassword;  
    
end;

procedure TFrmCliente.FormShow(Sender: TObject);
begin
  FRGAnt := MTRG.Value;
  Paginas.ActivePage := tsDados;
  InspNome.SetFocus;
  InspNome.FocusedRow := InspNomeObs;
  InspNome.FocusedRow := InspNomeNome;
end;

procedure TFrmCliente.InspNomeIsentoPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daCliMarcarIsento);
end;

function TFrmCliente.Novo(aTab: TDataset; aPai: TwinControl): Integer;
begin
  if aTab=nil then aTab := Dados.tbCli;
  FTab := aTab;
  FNovo := True;
  FUsername := '';
  MT.Insert;
  MTIsento.Value := False;
  MTInativo.Value := False;
  MTSexo.Value := 'M';
  Resultado := -1;
  RefreshBtn;
  if aPai = nil  then
  begin
    try
      ShowModal;
    finally
      Result := Resultado;
      Free;
    end;
  end else begin
    FPai := aPai;
    panPri.Parent := FPai;
  end;
end;

procedure TFrmCliente.RefreshBtn;
begin
  btnSalvar.Enabled := ((FPai=nil) or MT.Modified) and  Permitido(daCliCadastrar);
  btnCancelar.Enabled := btnSalvar.Enabled;
end;

procedure TFrmCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmCliente.cmHistoricoClick(Sender: TObject);
begin
  cmHistorico.Visible := ivNever;
  Paginas.HideTabs := False;
  FMgr.Mostrar(TfbPassaportes, fpass_Cliente, MTCodigo.Value);
  FMgr.Mostrar(TfbTran, ftran_Cliente, MTCodigo.Value);
end;

procedure TFrmCliente.DSStateChange(Sender: TObject);
begin
  RefreshBtn;
end;

procedure TFrmCliente.MTAfterInsert(DataSet: TDataSet);
begin
  FRgAnt := '';
  MTTipoAcessoPref.Value := -1;
end;

procedure TFrmCliente.MTAfterEdit(DataSet: TDataSet);
begin
  FRgAnt := MTRG.Value;
end;

end.
