unit ncaFrmCadFornecedor;
{
    ResourceString: Dario 10/03/13
    João: TODO List!
}

interface

uses
  Windows, Variants, Messages, SysUtils, Classes, Graphics, jpeg, Controls, Forms, Dialogs,
  dxBar, StdCtrls, 
  DBCtrls, ExtCtrls,
  ComCtrls, Db, kbmMemTable, ToolWin, nxdb, 
  dxBarExtItems, 
  cxStyles, cxGraphics, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxImageComboBox, cxMemo, ufmFormBase,
  cxVGrid, cxDBVGrid, cxInplaceContainer, cxPC, cxControls,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, Mask,
  cxCheckBox, cxRadioGroup, cxTimeEdit, cxLookAndFeels, cxGroupBox, cxDBEdit,
  cxContainer, cxCurrencyEdit, cxImage, Buttons, cxLabel,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel, LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  cxClasses, cxBarEditItem, 
  dxNavBarCollns, dxNavBarBase, dxNavBar,
  dxLayoutControl, dxLayoutLookAndFeels, dxNavBarStyles,
  cxLookAndFeelPainters, ImgList, cxSpinEdit, LMDCustomImageList,
  LMDImageList, cxPCdxBarPopupMenu, dxLayoutcxEditAdapters, dxLayoutContainer,
  LMDPNGImage;


type
  TFrmCadFornecedor = class(TForm)
    BarMgr: TdxBarManager;
    DS: TDataSource;
    panPri: TLMDSimplePanel;
    tAux: TnxTable;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    FMgr: TFormManager;
    MT: TkbmMemTable;
    MTNome: TStringField;
    MTEndereco: TStringField;
    MTBairro: TStringField;
    MTCidade: TStringField;
    MTUF: TStringField;
    MTCEP: TStringField;
    MTObs: TMemoField;
    MTCpf: TStringField;
    MTTelefone: TStringField;
    MTEmail: TMemoField;
    MTUltVisita: TDateTimeField;
    MTCelular: TStringField;
    MTTemDebito: TBooleanField;
    MTTipoAcessoPref: TIntegerField;
    MTIncluidoEm: TSQLTimeStampField;
    MTAlteradoEm: TDateTimeField;
    MTIncluidoPor: TStringField;
    MTAlteradoPor: TStringField;
    MTInativo: TBooleanField;
    L: TcxLookAndFeelController;
    dxBarCombo1: TdxBarCombo;
    dxBarCombo2: TdxBarCombo;
    MTID: TIntegerField;
    BarMgrBar1: TdxBar;
    cxBarEditItem1: TcxBarEditItem;
    NB: TdxNavBar;
    nbiFicha: TdxNavBarItem;
    NBGroup1: TdxNavBarGroup;
    nbiTran: TdxNavBarItem;
    Paginas: TcxPageControl;
    tsDados: TcxTabSheet;
    lcFicha: TdxLayoutControl;
    edNome: TcxDBTextEdit;
    lcFichaItem3: TdxLayoutItem;
    edTelefone: TcxDBTextEdit;
    lcFichaItem8: TdxLayoutItem;
    edCelular: TcxDBTextEdit;
    lcFichaItem9: TdxLayoutItem;
    lcFichaGroup5: TdxLayoutGroup;
    edCNPJ: TcxDBTextEdit;
    lcFichaItem12: TdxLayoutItem;
    lcFichaGroup8: TdxLayoutGroup;
    lcFichaGroup6: TdxLayoutGroup;
    lcFichaGroup9: TdxLayoutGroup;
    edEndereco: TcxDBTextEdit;
    lcFichaItem17: TdxLayoutItem;
    edBairro: TcxDBComboBox;
    lcFichaItem18: TdxLayoutItem;
    edCidade: TcxDBComboBox;
    lcFichaItem19: TdxLayoutItem;
    edUF: TcxDBTextEdit;
    lcFichaItem20: TdxLayoutItem;
    lcFichaGroup11: TdxLayoutGroup;
    edCEP: TcxDBMaskEdit;
    lcFichaItem21: TdxLayoutItem;
    edEmail: TcxDBMemo;
    lcFichaItem22: TdxLayoutItem;
    edObs: TcxDBMemo;
    lcFichaItem23: TdxLayoutItem;
    lcFichaGroup7: TdxLayoutGroup;
    NBStyleItem1: TdxNavBarStyleItem;
    OpenDlg: TOpenDialog;
    tsTran: TcxTabSheet;
    MTRg: TStringField;
    edIE: TcxDBTextEdit;
    lcFichaItem13: TdxLayoutItem;
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
    procedure MTAfterInsert(DataSet: TDataSet);
    procedure MTAfterEdit(DataSet: TDataSet);
    procedure hora10MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure hora10Click(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnNenhumClick(Sender: TObject);
    procedure InspNomeTAPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure FMgrPageControlChange(Sender: TObject);
    procedure NBLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FMgrGetTabSheet(Sender: TObject; aClass: TFrmBaseClass;
      var aTabSheet: TcxTabSheet);

    { Private declarations }
  private
    FPai: TWinControl;

    procedure RefreshBtn;

    procedure wmAtualizaStrings(var Msg: TMessage); message wm_user;

  public
    FNovo : Boolean;
    Resultado: Integer;
    FRgAnt : String;
    FUsername : String;
    FTab : TDataset;
    FCHorario : Cardinal;
    function Novo(aTab: TDataset; aPai: TWinControl): Integer;
    function Editar(aTab: TDataset; aPai: TWinControl): Boolean;

    { Public declarations }
  end;

  TThreadStrings = class ( TThread )
  private
    FWnd : HWND;
  protected
    procedure Execute; override;
  public
    constructor Create(aWnd: HWND);  
  end;

var
  FrmCadFornecedor: TFrmCadFornecedor;
  
  slCamposCli,
  slCidades,
  slBairros,
  slEscolas : TStrings;

implementation

uses 
  ncaDM,
  ncErros,
  ncaFrmPri,
  ncClassesBase,
  ncIDRecursos,
  ncListaID,
  ufmImagens, 
  ncafbPass, 
  ncafbTran, ncSessao, ncafgExtratoFid, ncafbPesqCH, ncaFrmWebCam;

// START resource string wizard section
resourcestring
  SNomeNãoPodeSerDeixadoEmBranco = 'Nome não pode ser deixado em branco !';
  SHora = 'hora';

// END resource string wizard section


{$R *.DFM}

function TFrmCadFornecedor.Editar(aTab: TDataset; aPai: TWinControl): Boolean;
begin
  result := false;
  Resultado := -1;
  if aTab=nil then aTab := Dados.tbCli;
  try
    FUsername := aTab.FieldByName('Username').AsString; // do not localize
    FNovo := False;
    FTab := ATab;
    MT.Insert;
    TransfDados(FTab, MT);
    if MTInativo.IsNull then
      MTInativo.Value := False;
      
    cmGravar.Enabled := Permitido(daCliCadastrar);
    
    if aPai=nil then begin
      ShowModal;
      Result := Resultado>-1;
    end else begin
      FPai := aPai;
      panPri.Parent := FPai;
    end;  
  finally
    if FPai=nil then Free;
  end;  
end;

procedure TFrmCadFornecedor.cmGravarClick(Sender: TObject);
var S: TncSessao;

begin
  Paginas.ActivePageIndex := 0;
  edNome.SetFocus;

  if MTNome.Value = '' then
    Raise ENexCafe.Create(SNomeNãoPodeSerDeixadoEmBranco);
  {
  if (FRgAnt<>MTRg.Value) and (MTRg.AsString>'') and tAux.FindKey([MTRG.Value]) then
    Raise ENexCafe.Create('Já existe um cliente cadastrado com esse RG');

  if (FUsername <> MTUsername.Value) and
     (MTUsername.Value <> '') and
     tAux.Locate('Username', MTUsername.Value, [loCaseInsensitive]) then
  begin
    Beep;
    ShowMessage('Já existe outro cliente cadastrado com esse mesmo Username!');
    Exit;
  end; }

  if not (MT.State in [dsInsert, dsEdit]) then MT.Edit;

  if FNovo then begin
    FTab.Insert;
    FTab.FieldByName('IncluidoEm').AsDateTime := Now; // do not localize
    FTab.FieldByName('IncluidoPor').AsString := Dados.CM.Username; // do not localize
  end else begin
    FTab.Edit; 
    FTab.FieldByName('AlteradoEm').AsDateTime := Now; // do not localize
    FTab.FieldByName('AlteradoPor').AsString := Dados.CM.Username; // do not localize
  end;

  
  TransfDadosEsp(MT, FTab, '|ID|Minutos|IncluidoEm|IncluidoPor|AlteradoEm|AlteradoPor|'); // do not localize
  FTab.FieldByName('Fornecedor').AsBoolean := True; // do not localize

  FTab.Post;
  Resultado := FTab.FieldByName('ID').AsInteger; // do not localize
  if FPai=nil then 
    Close;

  S := Dados.CM.Sessoes.PorCliente[Resultado];
  if S<>nil then Dados.CM.ForceRefreshSessao(S.ID);
end;

procedure AjustaFontRB(RB: TcxRadioButton);
begin
  if RB.Checked then
    RB.Font.Style := [fsBold] else
    RB.Font.Style := [];
end;

procedure TFrmCadFornecedor.wmAtualizaStrings(var Msg: TMessage);
begin
  edBairro.Properties.Items.Text := slBairros.Text;
  edCidade.Properties.Items.Text := slCidades.Text;
end;

procedure TFrmCadFornecedor.btnNenhumClick(Sender: TObject);
var
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent(SHora+IntToStr(Dia)+IntToStr(H)));
    SB.Color := clRed;
    SB.Font.Color := clWhite;
  end;
end;

procedure TFrmCadFornecedor.btnTodosClick(Sender: TObject);
var
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent(SHora+IntToStr(Dia)+IntToStr(H)));
    SB.Color := clGreen;
    SB.Font.Color := clWhite;
  end;
end;

procedure TFrmCadFornecedor.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadFornecedor.FMgrGetTabSheet(Sender: TObject;
  aClass: TFrmBaseClass; var aTabSheet: TcxTabSheet);
begin
  if aClass = TfbTran then
    aTabSheet := tsTran;
end;

procedure TFrmCadFornecedor.FMgrPageControlChange(Sender: TObject);
begin
  if paginas.ActivePage = TsTran then begin

    if FMgr.FormByClass(TfbTran)=nil then begin
      FMgr.RegistraForm(TfbTran);
      LockWindowUpdate(Handle);
      try
        FMgr.Mostrar(TfbTran, ftran_Cliente, MTID.Value);
        TfbTran(FMgr.FormAtivo).panTran.AlignWithMargins := False;
      finally
        LockWindowUpdate(0);
      end;
    end;
  end;
end;

procedure TFrmCadFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMgr.Clear;
  Action := caFree;
end;

procedure TFrmCadFornecedor.FormCreate(Sender: TObject);
const
  SNStr : Array[Boolean] of String[5] = ('(não)', '(sim)');

function GetCharCase(aField: String): TEditCharCase;
var P: Integer;
begin
  P := StrToIntDef(gConfig.slCamposCliCC.Values[aField], 0);
  case P of
    1 : Result := ecUpperCase;
    2 : Result := ecLowerCase;
  else
    Result := ecNormal;
  end;
end;  

begin
  Paginas.Properties.HideTabs := true;

  edNome.Properties.CharCase := GetCharCase('Nome'); // do not localize
  edTelefone.Properties.CharCase := GetCharCase('Telefone'); // do not localize
  edCelular.Properties.CharCase := GetCharCase('Celular'); // do not localize
  edEndereco.Properties.CharCase := GetCharCase('Endereco'); // do not localize
  edBairro.Properties.CharCase := GetCharCase('Bairro'); // do not localize
  edCidade.Properties.CharCase := GetCharCase('Cidade'); // do not localize
  edObs.Properties.CharCase := GetCharCase('Obs'); // do not localize
  edEmail.Properties.CharCase := GetCharCase('Email'); // do not localize

  TThreadStrings.Create(Handle);

  FPai := nil;
  Paginas.ActivePageIndex := 0;

  FrmCadFornecedor := Self;
  MT.Open;
  tAux.Open;
  Paginas.ActivePageIndex:= 0;

end;

procedure TFrmCadFornecedor.FormShow(Sender: TObject);
begin

  Paginas.ActivePage := tsDados;
  edNome.SetFocus;

  if (Screen.Width=640) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
end;

procedure TFrmCadFornecedor.hora10Click(Sender: TObject);
begin
  with TLMDSpeedButton(Sender) do
  if Color=clGreen then
    Color := clRed
  else
    Color := clGreen;
end;

procedure TFrmCadFornecedor.hora10MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ssCtrl in Shift then 
    TLMDSpeedButton(Sender).Color := clGreen
  else
  if ssAlt in Shift then
    TLMDSpeedButton(Sender).Color := clRed;
end;

procedure TFrmCadFornecedor.InspNomeIsentoPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daCliMarcarIsento);
end;

procedure TFrmCadFornecedor.InspNomeTAPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daAlterarTipoAcesso);
end;

procedure TFrmCadFornecedor.NBLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
begin
  Paginas.ActivePageIndex := ALink.Index;
end;

function TFrmCadFornecedor.Novo(aTab: TDataset; aPai: TwinControl): Integer;
begin
  if aTab=nil then aTab := Dados.tbCli;
  nbiTran.Enabled := False;
  FTab := aTab;
  FNovo := True;
  FUsername := '';
  MT.Insert;
  MTUF.Value := Dados.tbConfigUFPadrao.AsString;
  MTCidade.Value := Dados.tbConfigCidadePadrao.AsString;
  MTInativo.Value := False;
  Result := -1;
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


function ForceForegroundWindow(hwnd: THandle): boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID : DWORD;
  timeout : DWORD;
begin
  if IsIconic(hwnd) then ShowWindow(hwnd, SW_RESTORE);
  if GetForegroundWindow = hwnd then 
    Result := true
  else begin

  // Windows 98/2000 doesn't want to foreground a window when some other
  // window has keyboard focus
  
    if ((Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion > 4)) or
        ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and
        ((Win32MajorVersion > 4) or ((Win32MajorVersion = 4) and
        (Win32MinorVersion > 0)))) then
    begin
  
  // Code from Karl E. Peterson, www.mvps.org/vb/sample.htm
  // Converted to Delphi by Ray Lischner
  // Published in The Delphi Magazine 55, page 16
  
      Result := false;
      ForegroundThreadID := GetWindowThreadProcessID(GetForegroundWindow,nil);
      ThisThreadID := GetWindowThreadPRocessId(hwnd,nil);
      if AttachThreadInput(ThisThreadID, ForegroundThreadID, true) then
      begin
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hwnd);
        AttachThreadInput(ThisThreadID, ForegroundThreadID, false);
        Result := (GetForegroundWindow = hwnd);
      end;
      if not Result then begin
  // Code by Daniel P. Stasinski
        SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @timeout, 0);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0),  SPIF_SENDCHANGE);
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hWnd);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0,
        TObject(timeout), SPIF_SENDCHANGE);
      end;
    end
    else begin
      BringWindowToTop(hwnd); // IE 5.5 related hack
      SetForegroundWindow(hwnd);
    end;
  
    Result := (GetForegroundWindow = hwnd);
  end;
end; { ForceForegroundWindow }

procedure TFrmCadFornecedor.RefreshBtn;
begin
  cmGravar.Enabled := ((FPai=nil) or MT.Modified) and  Permitido(daCliCadastrar);
  cmCancelar.Enabled := cmGravar.Enabled;
end;

procedure TFrmCadFornecedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmCadFornecedor.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Paginas.ActivePageIndex=0 then
  if (Key = KEY_Enter) and (not edObs.Focused) and (not edEmail.Focused) then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmCadFornecedor.DSStateChange(Sender: TObject);
begin
  RefreshBtn;
end;

procedure TFrmCadFornecedor.MTAfterInsert(DataSet: TDataSet);
begin
  FRgAnt := '';
  MTTipoAcessoPref.Value := -1;
end;

procedure TFrmCadFornecedor.MTAfterEdit(DataSet: TDataSet);
begin
  //
end;

type THackMouse = class (TcxCustomImage);

{ TThreadStrings }

constructor TThreadStrings.Create(aWnd: HWND);
begin
  FWnd := aWnd;
  inherited Create(False);
  FreeOnTerminate := True;
end;

procedure TThreadStrings.Execute;
var
  S: TnxSession;
  Q: TnxQuery;
  Str : String;
  
begin
  inherited;
  Q := nil;
  S := TnxSession.Create(nil);
  try
    S.ServerEngine := Dados.RSE;
    S.Username := 'admin'; // do not localize
    S.Password := 'delphi9856'; // do not localize
    S.Active := True;
    
    Q := TnxQuery.Create(nil);
    Q.Session := S;
    Q.AliasName := 'NexCafe'; // do not localize
    Q.SQL.Text := 'select distinct(Escola) as Escola from Cliente'; // do not localize
    Q.Active := True;

    slEscolas.Clear;
    Q.First;
    while not Q.Eof do begin
      Str := Trim(Q.FieldByName('Escola').AsString); // do not localize
      if Str>'' then slEscolas.Add(Str);
      Q.Next;
    end;
    
    Q.Active := False;
    Q.SQL.Text := 'select distinct(Bairro) as Bairro from Cliente'; // do not localize
    Q.Active := True;

    slBairros.Clear;
    Q.First;
    while not Q.Eof do begin
      Str := Trim(Q.FieldByName('Bairro').AsString); // do not localize
      if Str>'' then slBairros.Add(Str);
      Q.Next;
    end;

    Q.Active := False;
    Q.SQL.Text := 'select distinct(Cidade) as Cidade from Cliente'; // do not localize
    Q.Active := True;

    slCidades.Clear;
    Q.First;
    while not Q.Eof do begin
      Str := Trim(Q.FieldByName('Cidade').AsString); // do not localize
      if Str>'' then slCidades.Add(Str);
      Q.Next;
    end;
    PostMessage(FWnd, wm_user, 0, 0);
  except
  end;
  if Q<>nil then Q.Free;
  if S<>nil then S.Free;
end;

initialization
  slCamposCli := TStringList.Create;
  slCamposCli.Add('Nome=Nome'); // do not localize
  slCamposCli.Add('Username=Username'); // do not localize
  slCamposCli.Add('Nickname=Apelido'); // do not localize
  slCamposCli.Add('Senha=Senha'); // do not localize
  slCamposCli.Add('Telefone=Telefone'); // do not localize
  slCamposCli.Add('Celular=Celular'); // do not localize
  slCamposCli.Add('Rg=RG'); // do not localize
  slCamposCli.Add('Cpf=CPF'); // do not localize
  slCamposCli.Add('TitEleitor=Tit.Eleitor'); // do not localize
  slCamposCli.Add('Endereco=Endereço'); // do not localize
  slCamposCli.Add('Bairro=Bairro'); // do not localize
  slCamposCli.Add('Cidade=Cidade'); // do not localize
  slCamposCli.Add('UF=UF (Estado)'); // do not localize
  slCamposCli.Add('Pai=Pai'); // do not localize
  slCamposCli.Add('Mae=Mãe'); // do not localize
  slCamposCli.Add('Escola=Escola'); // do not localize
  slCamposCli.Add('Email=E-mail'); // do not localize
  slCamposCli.Add('Obs=Observações'); // do not localize
  
  slCidades := TStringList.Create;
  slBairros := TStringList.Create;
  slEscolas := TStringList.Create;

finalization
  slCamposCli.Free;
  slCidades.Free;
  slBairros.Free;
  slEscolas.Free;  

end.

