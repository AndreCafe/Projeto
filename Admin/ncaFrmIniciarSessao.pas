unit ncaFrmIniciarSessao;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxCurrencyEdit, cxRadioGroup,
  cxCalendar, cxTimeEdit, cxDBLookupComboBox, cxMemo, cxDropDownEdit,
  cxTextEdit, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxMaskEdit, dxBar, dxBarExtItems, ExtCtrls, cxDBVGrid, cxVGrid,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer, cxLabel,
  Buttons, cxInplaceContainer, cxPC, LMDControl, LMDBaseControl,
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
  cxCheckBox, cxSpinEdit, ncaFrmTempoIniciar, cxLookAndFeels,
  cxLookAndFeelPainters, ncaFrmCli, cxImageComboBox, ncEspecie;

type
  TFrmIniciarSessao = class(TForm)
    Edit1: TEdit;
    bdcAcesso: TdxBarDockControl;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDLabel3: TLMDLabel;
    panCli: TLMDSimplePanel;
    BarMgr: TdxBarManager;
    cmFuncFim: TdxBarStatic;
    cmData: TdxBarStatic;
    cmPagamento: TdxBarStatic;
    cmFuncInicio: TdxBarStatic;
    cmGravar: TdxBarLargeButton;
    cmNovoSinal: TdxBarButton;
    cmTituloSinal: TdxBarStatic;
    cmCancelar: TdxBarLargeButton;
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
    Timer1: TTimer;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cmRecibo: TdxBarControlContainerItem;
    cmListaEspera: TdxBarLargeButton;
    Timer2: TTimer;
    cxStyle15: TcxStyle;
    cmMaq: TdxBarStatic;
    panTempo: TLMDSimplePanel;
    cbRecibo: TcxCheckBox;
    panGrupoTarObs: TLMDSimplePanel;
    LMDLabel4: TLMDLabel;
    panGrupoTar: TLMDSimplePanel;
    edGrupoTar: TcxImageComboBox;
    lbGrupoTar: TcxLabel;
    panObs: TLMDSimplePanel;
    lbObs: TcxLabel;
    edObs: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure vgTDescEditPropertiesEditValueChanged(Sender: TObject);
    procedure cbListaEsperaClick(Sender: TObject);
    procedure vgTDescPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure vgHTipoAcessoPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure cmMaquinaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edGrupoTarPropertiesCloseUp(Sender: TObject);
    procedure edGrupoTarClick(Sender: TObject);
    procedure lbObsClick(Sender: TObject);
    procedure lbGrupoTarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
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
    FCli        : TFrmCli;
    FPagESP     : TncPagEspecies;
    
    
    { Private declarations }
    procedure RefreshTotais;

    procedure OnMudouCliente(Sender: TObject);

    procedure RefreshClienteTempo;

    procedure Biometria(var Msg: TMessage);
      message wm_biometria;
    
  public
    { Public declarations }
    function Iniciar(const aMaq: Word): TncSessao;
  end;

var
  FrmIniciarSessao: TFrmIniciarSessao;

implementation

uses ncaFrmPri, ncIDRecursos, ufmImagens, ncCredTempo, ncaFrmTempo,
  ncImpressao, ncaFrmVendaProd, ncaFrmImp, ncDMServ, ncaBiometria;

// START resource string wizard section
resourcestring
  SIniciarAcesso = 'Iniciar Acesso';
  SMáq = 'Máq.';
  SIniciarSessão = 'Iniciar Sessão';
  SIniciar = '&Iniciar';
  SÉNecessárioSelecionarUmClienteCa = 'É necessário selecionar um cliente cadastrado ou optar por cliente avulso';

// END resource string wizard section


{$R *.dfm}

procedure TFrmIniciarSessao.Biometria(var Msg: TMessage);
begin
  FCli.Tipo := 0;
  FCli.CliCad := Msg.WParam;
  FCli.UpdateCliCadEdit(True);
end;

procedure TFrmIniciarSessao.cbListaEsperaClick(Sender: TObject);
begin
  panCli.Enabled := not cmListaEspera.Down;
  if cmListaEspera.Down then begin
    FCli.CliCad := FEspCli;
    FCli.edAvulso.Text := FEspNome;
    if FEspCli>0 then 
      FCli.Tipo := 0 else
      FCli.Tipo := 1;
    FSessao.Cliente := FEspCli;
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
  if not gConfig.IsPremium then
  begin
    Beep;
    ShowMessage('Recurso disponivel apenas no plano Premium. No plano gratuito voce pode visualizar, mas nao salvar.');
    Exit;
  end;

  FSalvando := True;
  try
    FSessao.Obs := edObs.Text;
    if FIniciar then begin
      if (FCli.Tipo=0) and (FCli.CliCad=0) then begin
        Beep; 
        Timer1.Enabled := True;
        Exit;
      end;

      FSessao.TipoAcesso := edGrupoTar.EditValue;
      FSessao.NomeCliente := FCli.Nome;
      FSessao.Cliente := FCli.Codigo;
      if FCli.Tipo = 2 then
        FSessao.TipoCli := tcManutencao 
      else
      if FCli.Tipo=0 then begin
        if FCli.Pesq.TabIsento.Value then
          FSessao.TipoCli := tcCliGratis else
          FSessao.TipoCli := tcNormal;
      end else
        FSessao.TipoCli := tcNormal;
        
      FSessao.FuncI := Dados.CM.Username;

      if cmListaEspera.Visible=ivAlways then
      if (not cmListaEspera.Down) and 
         ((FEspCli<>FSessao.Cliente) or (FEspNome<>FSessao.NomeCliente)) then
        FSessao.IDListaEspera := -1;
    end else begin
      FSessao.Cliente := FCli.Codigo;
      FSessao.NomeCliente := FCli.Nome;
    end;

    if FSessao.TipoCli<>tcFunc then begin
      FDadosTempo.dtMaq := FSessao.Maq;
      FDadosTempo.dtDadosCli.dcNome := FSessao.NomeCliente;
      FDadosTempo.dtDadosCli.dcCodigo := FSessao.Cliente;

      FFrmTempo.btnSalvarClick(nil);

      if FDadosTempo.dtMinutos>0 then begin
        CT := FSessao.Tempos.NewItem;
        FDadosTempo.SaveToCredTempo(CT);
        CT.teSessao := FSessao.ID;
        CT.tePagEsp.Assign(FPagEsp);
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

procedure TFrmIniciarSessao.edGrupoTarClick(Sender: TObject);
begin
  edGrupoTar.SetFocus;
end;

procedure TFrmIniciarSessao.edGrupoTarPropertiesCloseUp(Sender: TObject);
begin
  FDadosTempo.dtTipoAcesso := edGrupoTar.EditValue;
  FFrmTempo.edTipoAcessoPropertiesEditValueChanged(nil);
end;

procedure TFrmIniciarSessao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TFrmIniciarSessao.FormCreate(Sender: TObject);
begin
  FPagEsp := TncPagEspecies.Create;
  FCli := gCliList.GetFrm;
  FCli.OnMudouCliente := OnMudouCliente;
  edGrupoTar.Properties.ReadOnly := not Permitido(daAlterarTipoAcesso);
  LoadGrupoTar(edGrupoTar);

  FDadosTempo.Limpa;
  FTipoCli := -1;
  FShowed := False;
  FSalvando := False;
  
  FMsgDebito := -1;
  FCliAnt    := 0;
  FDebAnt    := 0;
  FFrmTempo  := TFrmTempoIniciar.Create(Self);
  FFrmTempo.panTempo.Parent := panTempo;
  FFrmTempo.Editar(True, True, FPagEsp, @FDadosTempo, 0, False, 0, 0);
  Caption := SIniciarAcesso;
end;

procedure TFrmIniciarSessao.FormDestroy(Sender: TObject);
begin
  gCliList.ReleaseFrm(FCli);
  FPagEsp.Free;
end;

procedure TFrmIniciarSessao.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
    $7B {F12} : FFrmTempo.FTot.edRec.SetFocus;
  end;
end;

procedure TFrmIniciarSessao.FormShow(Sender: TObject);
begin
  BioFrmH := Handle;
  if (Screen.Width=640) or (Screen.Width=800) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);

  if not Permitido(daIniciarSessaoCliCad) then  begin
    FCli.lbComCad.Visible := False;
    FCli.Tipo := 1;
  end;
   
  FCliAnt := FSessao.Cliente;
  FDebAnt := 0;

  FShowed := True;
  cmMaq.Caption := SMáq + IntToStr(FSessao.Maq);
  panGrupoTar.Visible := (gTiposAcesso.Count>1);
  
  panGrupoTarObs.Visible := panGrupoTar.Visible or panObs.Visible;
  
  edGrupoTar.Properties.ReadOnly := (not Permitido(daAlterarTipoAcesso));
  edGrupoTar.TabStop := not edGrupoTar.Properties.Readonly;

  if gConfig.CliCadPadrao and gConfig.BloqueiaCliAvulso then begin
    FCli.Tipo := 0;
    FCli.tsAvulso.TabVisible := False;
  end;
  
  RefreshTotais;

  if FIniciar and (not cmListaEspera.Down) and (FCli.Tipo=0) then 
    FCli.Timer3.Enabled := True;
    
  FFrmTempo.FormShow(FFrmTempo);
end;

function TFrmIniciarSessao.Iniciar(const aMaq: Word): TncSessao;
var 
  M: TncMaquina;
  S: String;
begin

  if (gConfig.RecImprimir>0) then
    cmRecibo.Visible := ivAlways else
    cmRecibo.Visible := ivNever;
      
  cmMaq.Caption := SMáq + IntToStr(aMaq);
  Caption := SIniciarSessão;
  S := Dados.CM.UA.Nome;
  if S='' then S := Dados.CM.UA.Username;
  FCli.Init(False, Permitido(daMaqModoManutencao), 0, '', S, 0, panCli);
  FCli.lbSemCad.Enabled := not gConfig.BloqueiaCliAvulso;
  cmGravar.Caption := SIniciar;
//  cmGravar.LargeImageIndex := 55;
  FSessao := TncSessao.Create(True);
  FSessao.ID := High(Cardinal);
  FSessao.Maq := aMaq;
  FSessao.TipoCli := tcNormal;
  M := Dados.CM.Maquinas.PorNumero[aMaq];
  if (M<>nil) and (M.TipoAcesso<>-1) then begin
    FSessao.TipoAcesso := M.TipoAcesso;
    edGrupoTar.EditValue := M.TipoAcesso;
  end else 
  if gTiposAcesso.Count>0 then begin
    edGrupoTar.EditValue := gTiposAcesso[0].ID;
    FSessao.TipoAcesso := gTiposAcesso[0].ID;
  end;

  panObs.Visible := gConfig.MostraObs;
  
  Result  := nil;
  FIniciar := True;
  FGravou := False;
  
  if Dados.CM.Config.CliCadPadrao then
    FCli.Tipo := tcComCad else
    FCli.Tipo := tcSemCad;

  if DM.tEsp.Locate('PrevMaq; PrevSessao', VarArrayOf([aMaq, 0]), []) then // do not localize
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
  FDadosTempo.dtTipoAcesso := FSessao.TipoAcesso;
  FFrmTempo.Editar(True, True, FPagEsp, @FDadosTempo, 0, False, 0, 0);

  ShowModal;
  if FGravou then 
    Result := FSessao else
    FSessao.Free;
end;

procedure TFrmIniciarSessao.lbGrupoTarClick(Sender: TObject);
begin
  edGrupoTar.SetFocus;
end;

procedure TFrmIniciarSessao.lbObsClick(Sender: TObject);
begin
  edObs.SetFocus;
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

procedure TFrmIniciarSessao.OnMudouCliente(Sender: TObject);
begin
  RefreshClienteTempo;
end;

procedure TFrmIniciarSessao.RefreshClienteTempo;
begin
  if FTipoCli=tcFunc then begin
    FDadosTempo.dtDadosCli.dcCodigo := 0;
    FDadosTempo.dtDadosCli.dcNome := '';
  end else begin
    FDadosTempo.dtDadosCli.dcCodigo := FCli.Codigo;
    FDadosTempo.dtDadosCli.dcNome := FCli.Nome;
  end;
  FFrmTempo.edCliPropertiesCloseUp(nil);
end;

procedure TFrmIniciarSessao.RefreshTotais;
begin
end;

procedure TFrmIniciarSessao.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  ShowMessage(SÉNecessárioSelecionarUmClienteCa);
end;

end.

