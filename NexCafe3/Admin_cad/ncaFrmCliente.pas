unit ncaFrmCliente;

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
  cxContainer, cxCurrencyEdit, cxImage, Buttons, PngSpeedButton, cxLabel,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel, LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  cxClasses, cxBarEditItem;

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
    LMDSimplePanel2: TLMDSimplePanel;
    vgSenha: TcxDBEditorRow;
    MTID: TIntegerField;
    cxTabSheet1: TcxTabSheet;
    panHorarios: TLMDSimplePanel;
    panDiasHoras: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    hora723: TLMDSpeedButton;
    hora722: TLMDSpeedButton;
    hora721: TLMDSpeedButton;
    hora720: TLMDSpeedButton;
    hora719: TLMDSpeedButton;
    hora718: TLMDSpeedButton;
    hora717: TLMDSpeedButton;
    hora716: TLMDSpeedButton;
    hora715: TLMDSpeedButton;
    hora714: TLMDSpeedButton;
    hora70: TLMDSpeedButton;
    hora71: TLMDSpeedButton;
    hora72: TLMDSpeedButton;
    hora73: TLMDSpeedButton;
    hora74: TLMDSpeedButton;
    hora75: TLMDSpeedButton;
    hora76: TLMDSpeedButton;
    hora77: TLMDSpeedButton;
    hora78: TLMDSpeedButton;
    hora79: TLMDSpeedButton;
    hora710: TLMDSpeedButton;
    hora711: TLMDSpeedButton;
    hora712: TLMDSpeedButton;
    hora713: TLMDSpeedButton;
    LMDLabel5: TLMDLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    hora623: TLMDSpeedButton;
    hora622: TLMDSpeedButton;
    hora621: TLMDSpeedButton;
    hora620: TLMDSpeedButton;
    hora619: TLMDSpeedButton;
    hora618: TLMDSpeedButton;
    hora617: TLMDSpeedButton;
    hora616: TLMDSpeedButton;
    hora615: TLMDSpeedButton;
    hora614: TLMDSpeedButton;
    hora60: TLMDSpeedButton;
    hora61: TLMDSpeedButton;
    hora62: TLMDSpeedButton;
    hora63: TLMDSpeedButton;
    hora64: TLMDSpeedButton;
    hora65: TLMDSpeedButton;
    hora66: TLMDSpeedButton;
    hora67: TLMDSpeedButton;
    hora68: TLMDSpeedButton;
    hora69: TLMDSpeedButton;
    hora610: TLMDSpeedButton;
    hora611: TLMDSpeedButton;
    hora612: TLMDSpeedButton;
    hora613: TLMDSpeedButton;
    LMDLabel1: TLMDLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    hora523: TLMDSpeedButton;
    hora522: TLMDSpeedButton;
    hora521: TLMDSpeedButton;
    hora520: TLMDSpeedButton;
    hora519: TLMDSpeedButton;
    hora518: TLMDSpeedButton;
    hora517: TLMDSpeedButton;
    hora516: TLMDSpeedButton;
    hora515: TLMDSpeedButton;
    hora514: TLMDSpeedButton;
    hora50: TLMDSpeedButton;
    hora51: TLMDSpeedButton;
    hora52: TLMDSpeedButton;
    hora53: TLMDSpeedButton;
    hora54: TLMDSpeedButton;
    hora55: TLMDSpeedButton;
    hora56: TLMDSpeedButton;
    hora57: TLMDSpeedButton;
    hora58: TLMDSpeedButton;
    hora59: TLMDSpeedButton;
    hora510: TLMDSpeedButton;
    hora511: TLMDSpeedButton;
    hora512: TLMDSpeedButton;
    hora513: TLMDSpeedButton;
    LMDLabel2: TLMDLabel;
    LMDSimplePanel5: TLMDSimplePanel;
    hora423: TLMDSpeedButton;
    hora422: TLMDSpeedButton;
    hora421: TLMDSpeedButton;
    hora420: TLMDSpeedButton;
    hora419: TLMDSpeedButton;
    hora418: TLMDSpeedButton;
    hora417: TLMDSpeedButton;
    hora416: TLMDSpeedButton;
    hora415: TLMDSpeedButton;
    hora414: TLMDSpeedButton;
    hora40: TLMDSpeedButton;
    hora41: TLMDSpeedButton;
    hora42: TLMDSpeedButton;
    hora43: TLMDSpeedButton;
    hora44: TLMDSpeedButton;
    hora45: TLMDSpeedButton;
    hora46: TLMDSpeedButton;
    hora47: TLMDSpeedButton;
    hora48: TLMDSpeedButton;
    hora49: TLMDSpeedButton;
    hora410: TLMDSpeedButton;
    hora411: TLMDSpeedButton;
    hora412: TLMDSpeedButton;
    hora413: TLMDSpeedButton;
    LMDLabel3: TLMDLabel;
    LMDSimplePanel6: TLMDSimplePanel;
    hora323: TLMDSpeedButton;
    hora322: TLMDSpeedButton;
    hora321: TLMDSpeedButton;
    hora320: TLMDSpeedButton;
    hora319: TLMDSpeedButton;
    hora318: TLMDSpeedButton;
    hora317: TLMDSpeedButton;
    hora316: TLMDSpeedButton;
    hora315: TLMDSpeedButton;
    hora314: TLMDSpeedButton;
    hora30: TLMDSpeedButton;
    hora31: TLMDSpeedButton;
    hora32: TLMDSpeedButton;
    hora33: TLMDSpeedButton;
    hora34: TLMDSpeedButton;
    hora35: TLMDSpeedButton;
    hora36: TLMDSpeedButton;
    hora37: TLMDSpeedButton;
    hora38: TLMDSpeedButton;
    hora39: TLMDSpeedButton;
    hora310: TLMDSpeedButton;
    hora311: TLMDSpeedButton;
    hora312: TLMDSpeedButton;
    hora313: TLMDSpeedButton;
    LMDLabel4: TLMDLabel;
    LMDSimplePanel8: TLMDSimplePanel;
    hora223: TLMDSpeedButton;
    hora222: TLMDSpeedButton;
    hora221: TLMDSpeedButton;
    hora220: TLMDSpeedButton;
    hora219: TLMDSpeedButton;
    hora218: TLMDSpeedButton;
    hora217: TLMDSpeedButton;
    hora216: TLMDSpeedButton;
    hora215: TLMDSpeedButton;
    hora214: TLMDSpeedButton;
    hora20: TLMDSpeedButton;
    hora21: TLMDSpeedButton;
    hora22: TLMDSpeedButton;
    hora23: TLMDSpeedButton;
    hora24: TLMDSpeedButton;
    hora25: TLMDSpeedButton;
    hora26: TLMDSpeedButton;
    hora27: TLMDSpeedButton;
    hora28: TLMDSpeedButton;
    hora29: TLMDSpeedButton;
    hora210: TLMDSpeedButton;
    hora211: TLMDSpeedButton;
    hora212: TLMDSpeedButton;
    hora213: TLMDSpeedButton;
    LMDLabel6: TLMDLabel;
    LMDSimplePanel9: TLMDSimplePanel;
    hora123: TLMDSpeedButton;
    hora122: TLMDSpeedButton;
    hora121: TLMDSpeedButton;
    hora120: TLMDSpeedButton;
    hora119: TLMDSpeedButton;
    hora118: TLMDSpeedButton;
    hora117: TLMDSpeedButton;
    hora116: TLMDSpeedButton;
    hora115: TLMDSpeedButton;
    hora114: TLMDSpeedButton;
    hora10: TLMDSpeedButton;
    hora11: TLMDSpeedButton;
    hora12: TLMDSpeedButton;
    hora13: TLMDSpeedButton;
    hora14: TLMDSpeedButton;
    hora15: TLMDSpeedButton;
    hora16: TLMDSpeedButton;
    hora17: TLMDSpeedButton;
    hora18: TLMDSpeedButton;
    hora19: TLMDSpeedButton;
    hora110: TLMDSpeedButton;
    hora111: TLMDSpeedButton;
    hora112: TLMDSpeedButton;
    hora113: TLMDSpeedButton;
    LMDLabel7: TLMDLabel;
    LMDSimplePanel13: TLMDSimplePanel;
    btnNenhum: TLMDSpeedButton;
    btnTodos: TLMDSpeedButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    MTHP1: TIntegerField;
    MTHP2: TIntegerField;
    MTHP3: TIntegerField;
    MTHP4: TIntegerField;
    MTHP5: TIntegerField;
    MTHP6: TIntegerField;
    MTHP7: TIntegerField;
    MTNaoGuardarCredito: TBooleanField;
    BarMgrBar1: TdxBar;
    cxBarEditItem1: TcxBarEditItem;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    edNaoGuardarCred: TcxDBCheckBox;
    VGPermiteLoginSemCred: TcxDBEditorRow;
    MTPermiteLoginSemCred: TBooleanField;
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
    procedure hora10MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure hora10Click(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnNenhumClick(Sender: TObject);
    procedure FormResize(Sender: TObject);

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
  ncaDM,
  ncaFrmPri,
  ncClassesBase,
  ncIDRecursos,
  ncListaID,
  ufmImagens, 
  ncafbPass, 
  ncafbTran, ncSessao;

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
var S: TncSessao;

procedure SalvaDia(Dia: Integer; Campo : TIntegerField);
var 
  H, Valor : Integer;
  SB : TLmdSpeedButton;
begin
  Valor := Campo.Value;
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    Valor := SetBit(Valor, BitsH[H], (SB.Color=clGreen));
  end;
  Campo.Value := Valor;
end;

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
  SalvaDia(1, MTHP1);
  SalvaDia(2, MTHP2);
  SalvaDia(3, MTHP3);
  SalvaDia(4, MTHP4);
  SalvaDia(5, MTHP5);
  SalvaDia(6, MTHP6);
  SalvaDia(7, MTHP7);
  
  TransfDadosEsp(MT, FTab, '|ID|Minutos|IncluidoEm|IncluidoPor|AlteradoEm|AlteradoPor|');

  FTab.Post;
  Resultado := FTab.FieldByName('ID').AsInteger;
  if FPai=nil  then Close;

  S := Dados.CM.Sessoes.PorCliente[Resultado];
  if S<>nil then Dados.CM.ForceRefreshSessao(S.ID);
end;

procedure TFrmCliente.btnNenhumClick(Sender: TObject);
var
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    SB.Color := clRed;
    SB.Font.Color := clWhite;
  end;
end;

procedure TFrmCliente.btnTodosClick(Sender: TObject);
var
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    SB.Color := clGreen;
    SB.Font.Color := clWhite;
  end;
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
const
  SNStr : Array[Boolean] of String[5] = ('(não)', '(sim)');
begin
  with TcxImageComboBoxProperties(VGPermiteLoginSemCred.Properties.EditProperties) do begin
    Items[0].Description := 'Seguir opção padrão ' + SNStr[gConfig.PermiteLoginSemCred];
    if not gConfig.AlteraLoginSemCred then begin
      Items[1].Description := Items[0].Description;
      Items[2].Description := Items[0].Description;
      ReadOnly := True;
      VGPermiteLoginSemCred.Properties.Options.Editing := False;
    end;
  end;

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
      II.Value := tbTipoAcessoID.Value;
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

procedure LeDia(Dia: Integer; Valor: Integer);
var 
  H : Integer;
  SB : TLmdSpeedButton;
begin
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    if BitIsSet(Valor, BitsH[H]) then
      SB.Color := clGreen else
      SB.Color := clRed;
    SB.Font.Color := clWhite;  
  end;
end;

begin
  FRGAnt := MTRG.Value;
  Paginas.ActivePage := tsDados;
  InspNome.SetFocus;
  InspNome.FocusedRow := InspNomeObs;
  InspNome.FocusedRow := InspNomeNome;
  LeDia(1, MTHP1.Value);
  LeDia(2, MTHP2.Value);
  LeDia(3, MTHP3.Value);
  LeDia(4, MTHP4.Value);
  LeDia(5, MTHP5.Value);
  LeDia(6, MTHP6.Value);
  LeDia(7, MTHP7.Value);

  if (Screen.Width=640) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
end;

procedure TFrmCliente.hora10Click(Sender: TObject);
begin
  with TLMDSpeedButton(Sender) do
  if Color=clGreen then
    Color := clRed
  else
    Color := clGreen;
end;

procedure TFrmCliente.hora10MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ssCtrl in Shift then 
    TLMDSpeedButton(Sender).Color := clGreen
  else
  if ssAlt in Shift then
    TLMDSpeedButton(Sender).Color := clRed;
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
  MTNaoGuardarCredito.Value := gConfig.NaoGuardarCreditoCli;
  MTSexo.Value := 'M';
  MTHP1.Value := $FFFFFF;
  MTHP2.Value := $FFFFFF;
  MTHP3.Value := $FFFFFF;
  MTHP4.Value := $FFFFFF;
  MTHP5.Value := $FFFFFF;
  MTHP6.Value := $FFFFFF;
  MTHP7.Value := $FFFFFF;
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
  cmGravar.Enabled := ((FPai=nil) or MT.Modified) and  Permitido(daCliCadastrar);
  cmCancelar.Enabled := cmGravar.Enabled;
end;

procedure TFrmCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmCliente.FormResize(Sender: TObject);
begin
  panHorarios.Left := (Width-panHorarios.Width) div 2;
end;

procedure TFrmCliente.cmHistoricoClick(Sender: TObject);
begin
  cmHistorico.Enabled := False;
  Paginas.HideTabs := False;
  FMgr.Mostrar(TfbPassaportes, fpass_Cliente, MTID.Value);
  FMgr.Mostrar(TfbTran, ftran_Cliente, MTID.Value);
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
