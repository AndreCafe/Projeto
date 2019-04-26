unit ncaFrmIniciarSessao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxCurrencyEdit, cxRadioGroup,
  cxCalendar, cxTimeEdit, cxDBLookupComboBox, cxMemo, cxDropDownEdit,
  cxTextEdit, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxMaskEdit, dxBar, dxBarExtItems, ExtCtrls, cxDBVGrid, cxVGrid,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer, cxLabel,
  Buttons, PngSpeedButton, cxInplaceContainer, cxPC, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  StdCtrls, kbmMemTable, ncaDM,
  ncafbPesqCli, 
  ncClassesBase, 
  ncSessao, 
  ncTarifador,
  ncTran,
  ncMovEst,
  ncTempo, LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  cxCheckBox, cxSpinEdit, ncaFrmTempoIniciar;

type
  TFrmIniciarSessao = class(TForm)
    Edit1: TEdit;
    bdcAcesso: TdxBarDockControl;
    panDiv1: TLMDSimplePanel;
    LMDLabel1: TLMDLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDLabel3: TLMDLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDLabel2: TLMDLabel;
    vgH: TcxDBVerticalGrid;
    vgHTipoAcesso: TcxDBEditorRow;
    vgHCliCad: TcxDBEditorRow;
    vgHAvulso: TcxDBEditorRow;
    vgHDebitoCli: TcxDBEditorRow;
    vgHObs: TcxDBEditorRow;
    panH1: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    BarMgr: TdxBarManager;
    cmFuncFim: TdxBarStatic;
    cmData: TdxBarStatic;
    cmPagamento: TdxBarStatic;
    cmFuncInicio: TdxBarStatic;
    cmGravar: TdxBarLargeButton;
    cmNovoSinal: TdxBarButton;
    cmTituloSinal: TdxBarStatic;
    cmCancelar: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    cmNovoItem: TdxBarButton;
    cmRemoverItem: TdxBarButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle12: TcxStyle;
    MT: TkbmMemTable;
    MTCliente: TIntegerField;
    MTNomeCliente: TStringField;
    MTNomeAvulso: TStringField;
    MTObs: TStringField;
    MTDebito: TCurrencyField;
    MTTipoAcesso: TIntegerField;
    MTNomeTipoAcesso: TStringField;
    dsMT: TDataSource;
    Timer1: TTimer;
    btnFunc: TLMDSpeedButton;
    btnAvulso: TLMDSpeedButton;
    btnCad: TLMDSpeedButton;
    LMDSimplePanel3: TLMDSimplePanel;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cmRecibo: TdxBarControlContainerItem;
    cmListaEspera: TdxBarLargeButton;
    Timer2: TTimer;
    cxStyle15: TcxStyle;
    cmMaq: TdxBarStatic;
    panTempo: TLMDSimplePanel;
    cbRecibo: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure vgHCliCadEditPropertiesCloseUp(Sender: TObject);
    procedure vgHCliCadEditPropertiesInitPopup(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnCadClick(Sender: TObject);
    procedure vgTDescEditPropertiesEditValueChanged(Sender: TObject);
    procedure btnFuncMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnAvulsoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbListaEsperaClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure vgTDescPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure vgHTipoAcessoPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure cmMaquinaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure vgHTipoAcessoEditPropertiesCloseUp(Sender: TObject);
  private
    FDadosCli : TDadosCliente;
    FMsgDebito : Integer;
    FIniciar   : Boolean;
    FGravou    : Boolean;
    FSalvando  : Boolean;
    FSessao    : TncSessao;
    FTipoCli   : Integer;
    FEspCli    : Integer;
    FEspNome   : String;
    FEspCartao : String;
    FShowed    : Boolean;
    FCliAnt    : Integer;
    FDebAnt    : Currency;
    FFrmTempo  : TFrmTempoIniciar;
    FDadosTempo : TDadosTempo;  
    
    
    { Private declarations }
    procedure MostraDebito(aShowDlg: Boolean = True);
    procedure RefreshTotais;
    procedure SetTipoCli(const Value: Integer);

    procedure RefreshClienteTempo;

    procedure Biometria(var Msg: TMessage);
      message wm_biometria;
    
  public
    { Public declarations }
    function Iniciar(const aMaq: Word): TncSessao;
    property TipoCli: Integer
      read FTipoCli write SetTipoCli;
  end;

var
  FrmIniciarSessao: TFrmIniciarSessao;

implementation

uses ncaFrmPri, ncIDRecursos, ufmImagens, ncCredTempo, ncaFrmTempo,
  ncImpressao, ncaFrmVendaProd, ncaFrmImp, ncDMServ, ncaBiometria;

{$R *.dfm}

const
  cliCad    = 0;
  cliAvulso = 1;
  cliFunc   = 2;

procedure TFrmIniciarSessao.Biometria(var Msg: TMessage);
begin
  if Dados.tbCli.Locate('ID', Msg.WPARAM, []) then begin
    FDadosCli.dcCodigo := Dados.tbCliID.Value;
    FDadosCli.dcNome := Dados.tbCliNome.Value;
    MTCliente.Value := FDadosCli.dcCodigo;
    btnCad.Down := True;
    TipoCli := cliCad;
    vgHObs.Focused := True;
    MostraDebito;
    vgH.Refresh;
  end;
end;

procedure TFrmIniciarSessao.btnAvulsoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then begin
    TipoCli := cliAvulso;
    btnAvulso.Down := True;
    cmGravarClick(nil);
  end;
end;

procedure TFrmIniciarSessao.btnCadClick(Sender: TObject);
begin
  TipoCli := TControl(Sender).Tag;
  MostraDebito;
end;

procedure TFrmIniciarSessao.cbListaEsperaClick(Sender: TObject);
begin
  panH1.Enabled := not cmListaEspera.Down;
  vgH.HideEdit;
  vgHCliCad.Properties.Options.Editing := not cmListaEspera.Down;
  vgHAvulso.Properties.Options.Editing := not cmListaEspera.Down;
  if cmListaEspera.Down then begin
    if not (MT.State in [dsEdit, dsInsert]) then
      MT.Edit;
    MTCliente.Value := FEspCli;
    MTNomeAvulso.Value := FEspNome;
    FSessao.Cliente := FEspCli;

    if FEspCli>0 then begin
      btnCad.Down := True;
      vgHCliCad.Visible := True;
      vgHAvulso.Visible := False;
    end else begin
      btnAvulso.Down := True;
      vgHCliCad.Visible := False;
      vgHAvulso.Visible := True;
    end;
  end;
end;

procedure TFrmIniciarSessao.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmIniciarSessao.cmGravarClick(Sender: TObject);
var Debitar : Currency;
  TemCred : Boolean;
  CT: TncCredTempo;
begin
  FSalvando := True;
  try
    vgH.DataController.PostEditingData;
    vgH.DataController.Post;
    if MT.State in [dsEdit, dsInsert] then MT.Post;
    FSessao.Obs := MTObs.Value;
    if FIniciar then begin
      if btnCad.Down and (MTCliente.Value=0) then begin
        Beep; 
        Timer1.Enabled := True;
        Exit;
      end;

      FSessao.TipoAcesso := MTTipoAcesso.Value;
      if btnAvulso.Down then 
        FSessao.NomeCliente := MTNomeAvulso.Value;
      if TipoCli=cliFunc then 
        FSessao.TipoCli := tcManutencao;
      FSessao.FuncI := Dados.CM.Username;

      if cmListaEspera.Visible=ivAlways then
      if (not cmListaEspera.Down) and 
         ((FEspCli<>FSessao.Cliente) or (FEspNome<>FSessao.NomeCliente)) then
        FSessao.IDListaEspera := -1;
    end else begin
      FSessao.Cliente := FDadosCli.dcCodigo;
      if btnAvulso.Down then
        FSessao.NomeCliente := MTNomeAvulso.Value else
        FSessao.NomeCliente := FDadosCli.dcNome;
    end;

    if FSessao.TipoCli<>cliFunc then begin
      FDadosTempo.dtMaq := FSessao.Maq;
      FDadosTempo.dtDadosCli.dcNome := FSessao.NomeCliente;
      FDadosTempo.dtDadosCli.dcCodigo := FSessao.Cliente;

      FFrmTempo.btnSalvarClick(nil);

      if FDadosTempo.dtMinutos>0 then begin
        CT := FSessao.Tempos.NewItem;
        FDadosTempo.SaveToCredTempo(CT);
        CT.teSessao := FSessao.ID;
        CT._Operacao := osIncluir;
        CT.teID := -1;
      end;
    end;
  
    FGravou := True;
    Close;
  finally
    FSalvando := False;
  end;
end;

procedure TFrmIniciarSessao.cmMaquinaClick(Sender: TObject);
begin
  PostMessage(Handle, wm_biometria, 0, 0);
end;

procedure TFrmIniciarSessao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    vgH.HideEdit;
    TcxPopupEditProperties(vgHCliCad.Properties.EditProperties).PopupControl := nil;
    if Assigned(fbPesqCli) then
      fbPesqCli.Parent := nil;
  except
  end;
  Action := caFree;
end;

procedure TFrmIniciarSessao.FormCreate(Sender: TObject);
begin
  FDadosTempo.Limpa;
  FTipoCli := -1;
  FShowed := False;
  FSalvando := False;
  MT.Open;
  MT.Insert;
  if gTiposAcesso.Count>0 then
    MTTipoAcesso.Value := gTiposAcesso.Itens[0].ID else
    MTTipoAcesso.Value := 0;
  MT.Post;
  MT.Edit;
  FDadosCli.dcCodigo := 0;
  FDadosCli.dcNome := '';
  FMsgDebito := -1;
  FCliAnt    := 0;
  FDebAnt    := 0;
  FFrmTempo  := TFrmTempoIniciar.Create(Self);
  FFrmTempo.panTempo.Parent := panTempo;
  FDadosTempo.dtTipoAcesso := MTTipoAcesso.Value;
  FFrmTempo.Editar(True, True, @FDadosTempo, 0, False, 0, 0);
  Caption := 'Iniciar Acesso';
end;

procedure TFrmIniciarSessao.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmIniciarSessao.FormShow(Sender: TObject);
begin
  BioFrmH := Handle;
  if (Screen.Width=640) or (Screen.Width=800) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);

  if not Permitido(daIniciarSessaoCliCad) then
    btnCad.Enabled := False;
   
  FCliAnt := FSessao.Cliente;
  FDebAnt := 0;

  MostraDebito(False);

  FShowed := True;
  cmMaq.Caption := 'Máq.' + IntToStr(FSessao.Maq);
  vgHTipoAcesso.Visible := (Dados.tbTipoAcesso.RecordCount>1);
  vgHTipoAcesso.Options.Focusing := Permitido(daAlterarTipoAcesso);
{  if FSessao.TipoCli <> tcManutencao then begin
     vgH.SetFocus;
     vgH.FocusedRow := vgHObs;
     if btnCad.Down then begin
       vgHCliCad.Visible := True;
       vgHAvulso.Visible := False;
       vgH.FocusedRow := vgHCliCad;
     end else begin
       vgHCliCad.Visible := False;
       vgHAvulso.Visible := True;
       vgH.FocusedRow := vgHAvulso;
     end;
     Edit1.SetFocus;
     vgH.SetFocus;  
  end;}

  btnCad.Enabled := FIniciar or ( FSessao.TipoCli<>tcManutencao);
  btnAvulso.Enabled := btnCad.Enabled;
  if gConfig.CliCadPadrao and gConfig.BloqueiaCliAvulso then
    btnAvulso.Enabled := False;
  btnFunc.Enabled := FIniciar;
  if not Permitido(daIniciarSessaoCliCad) then
    btnCad.Enabled := False;

  RefreshTotais;

  if FIniciar and (not cmListaEspera.Down) and vgHCliCad.Visible then begin
    vgH.SetFocus;
    vgH.FocusedRow := vgHObs;
    vgH.FocusedRow := vgHCliCad;
    vgH.ShowEdit;
    Timer2.Enabled := True;
  end;
  FFrmTempo.FormShow(FFrmTempo);
end;

function TFrmIniciarSessao.Iniciar(const aMaq: Word): TncSessao;
var M: TncMaquina;
begin
  cmMaq.Caption := 'Máq. ' + IntToStr(aMaq);
  Caption := 'Iniciar Sessão';
  btnFunc.Enabled := Permitido(daMaqModoManutencao);
  cmGravar.Caption := '&Iniciar';
//  cmGravar.LargeImageIndex := 55;
  FSessao := TncSessao.Create(True);
  FSessao.ID := High(Cardinal);
  FSessao.Maq := aMaq;
  FSessao.TipoCli := tcNormal;
  M := Dados.CM.Maquinas.PorNumero[aMaq];
  if (M<>nil) and (M.TipoAcesso<>-1) then begin
    FSessao.TipoAcesso := M.TipoAcesso;
    MTTipoAcesso.Value := M.TipoAcesso;
  end;
  
  Result  := nil;
  FIniciar := True;
  FGravou := False;
  
  if Dados.CM.Config.CliCadPadrao then
    TipoCli := cliCad else
    TipoCli := cliAvulso;

  if vgHAvulso.Visible then
    btnAvulso.Down := True else
    btnCad.Down := True;

  if DM.tEsp.Locate('PrevMaq; PrevSessao', VarArrayOf([aMaq, 0]), []) then
  begin
    FSessao.IDListaEspera := DM.tEspID.Value;
    FEspCli := DM.tEspCliente.Value;
    FEspNome := DM.tEspNomeCliente.Value;
    FEspCartao := DM.tEspCartao.Value;
    cmListaEspera.Visible := ivAlways;
    cmListaEspera.Down := True;
    cbListaEsperaClick(nil);
  end else begin
    FEspCli := 0;
    FEspNome := '';
    FEspCartao := '';
  end;

  FDadosTempo.Limpa;
  FDadosTempo.dtMaq := FSessao.Maq;
  FDadosTempo.dtDadosCli.dcCodigo := FSessao.Cliente;
  FDadosTempo.dtDadosCli.dcNome := FSessao.NomeCliente;
  FDadosTempo.dtTipoAcesso := MTTipoAcesso.Value;
  FFrmTempo.Editar(True, True, @FDadosTempo, 0, False, 0, 0);

  ShowModal;
  if FGravou then 
    Result := FSessao else
    FSessao.Free;
end;

procedure TFrmIniciarSessao.vgHCliCadEditPropertiesCloseUp(Sender: TObject);
begin
  if MT.State<>dsEdit then MT.Edit;
  mtCliente.Value := FDadosCli.dcCodigo;
  FSessao.Cliente := mtCliente.Value;
  FSessao.NomeCliente := mtNomeCliente.Value;
  TcxCustomDropDownEdit(Sender).Text := FDadosCli.dcNome;

  RefreshClienteTempo;
  
  MostraDebito;
//  TcxPopupEdit(Sender).Properties.PopupControl := nil;
end;

procedure TFrmIniciarSessao.vgHCliCadEditPropertiesInitPopup(Sender: TObject);
begin
  if FSalvando then Exit;
  
  TcxPopupEdit(Sender).Properties.PopupControl := fbPesqCli;
  FDadosCli.dcCodigo := mtCliente.Value;
  FDadosCli.dcNome   := mtNomeCliente.Value;
  fbPesqCli.PreparaBusca(@FDadosCli, TcxCustomDropDownEdit(Sender));
end;

procedure TFrmIniciarSessao.vgHTipoAcessoEditPropertiesCloseUp(Sender: TObject);
begin
  FDadosTempo.dtTipoAcesso := MTTipoAcesso.Value;
  FFrmTempo.edTipoAcessoPropertiesEditValueChanged(nil);
end;

procedure TFrmIniciarSessao.vgHTipoAcessoPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daAlterarTipoAcesso);
end;

procedure TFrmIniciarSessao.vgTDescEditPropertiesEditValueChanged(Sender: TObject);
begin
  RefreshTotais;
end;

procedure TFrmIniciarSessao.vgTDescPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daTraDesconto);
end;

procedure TFrmIniciarSessao.MostraDebito(aShowDlg: Boolean = True);
begin
  if gConfig.NaoMostrarMsgDebito then Exit;
  vgHDebitoCli.Visible := (mtDebito.Value > 0.009) and (TipoCli=cliCad);
    
  if aShowDlg and (FMsgDebito<>mtCliente.Value) and (mtDebito.Value > 0.009) and (TipoCli=cliCad) then begin
    Beep;
    ShowMessage('Cliente possui débito de ' + FloatToStrF(mtDebito.Value, ffCurrency, 10, 2));
  end;
  FMsgDebito := mtCliente.Value;
end;

procedure TFrmIniciarSessao.btnFuncMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then begin
    TipoCli := cliFunc;
    btnFunc.Down := True;
    cmGravarClick(nil);
  end;
end;

procedure TFrmIniciarSessao.RefreshClienteTempo;
begin
  if FTipoCli=cliFunc then begin
    FDadosTempo.dtDadosCli.dcCodigo := 0;
    FDadosTempo.dtDadosCli.dcNome := '';
  end else begin
    FDadosTempo.dtDadosCli.dcCodigo := FSessao.Cliente;
    FDadosTempo.dtDadosCli.dcNome := FSessao.NomeCliente;
  end;
  FFrmTempo.edCliPropertiesCloseUp(nil);
end;

procedure TFrmIniciarSessao.RefreshTotais;
begin
end;

procedure TFrmIniciarSessao.SetTipoCli(const Value: Integer);
begin
  if Value=FTipoCli then Exit;
  if MT.State<>dsEdit then
    MT.Edit;
  FTipoCli := Value;
  panTempo.Visible := (FTipoCli<>cliFunc);
  if FTipoCli=cliCad then begin
    vgHObs.Focused := True;
    vgHAvulso.Visible := False;
    vgHCliCad.Visible := True;
    vgHCliCad.Focused := True;  
    if FShowed and not vgH.Focused then
      vgH.SetFocus;
    FSessao.TipoCli := tcNormal;      
    if FShowed then Timer2.Enabled := True;
  end else begin
    vgHCliCad.Visible := False;
    vgHAvulso.Visible := True;
    MTCliente.Clear;
    MTNomeAvulso.Clear;
    MTNomeCliente.Clear;
    FDadosCli.dcCodigo := 0;
    FDadosCli.dcNome := '';
    FSessao.Cliente := 0;
    vgH.FocusedRow := vgHObs;
    if FTipoCli=cliFunc then begin
      vgHAvulso.Properties.Caption := 'Funcionário';
      MTNomeAvulso.Value := Dados.CM.Username;
      TcxMaskEditProperties(vgHAvulso.Properties.EditProperties).ReadOnly := True;
      FSessao.Tempos.Limpa;
      FSessao.Vendas.Limpa;
    end else begin
      vgHAvulso.Properties.Caption := 'Cliente';
      TcxMaskEditProperties(vgHAvulso.Properties.EditProperties).ReadOnly := False;
    end;
    vgH.FocusedRow := vgHAvulso;
  end;
  RefreshClienteTempo;
end;

procedure TFrmIniciarSessao.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  ShowMessage('É necessário selecionar um cliente cadastrado ou optar por cliente avulso');
end;

procedure TFrmIniciarSessao.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  if vgHCliCad.Focused and Assigned(vgH.InplaceEditor) then
    TcxCustomDropDownEdit(vgH.InplaceEditor).DroppedDown := True;
end;

end.
