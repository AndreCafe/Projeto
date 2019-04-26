unit ncgFrmConn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, cxGroupBox, cxContainer, cxEdit,
  cxLabel, LMDControl, LMDDrawEdge, pngimage, ExtCtrls,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill, cxPC, cxControls,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxGraphics, cxTextEdit, cxMaskEdit, cxDropDownEdit, StdCtrls,
  LMDBaseEdit, LMDCustomEdit, LMDCustomMaskEdit, LMDCustomExtSpinEdit,
  LMDExtSpinEdit, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, cxProgressBar, Menus, dxBar,
  dxBarExtItems, cxClasses, cxLookAndFeelPainters, cxButtons, dxGDIPlusClasses,
  cxSpinEdit, ComCtrls, LMDGraphicControl, LMDFill, cxRadioGroup, ncgFormBase,
  LMDCustomSimpleLabel, LMDSimpleLabel, cxLookAndFeels, cxPCdxBarPopupMenu,
  cxCheckBox;

type
  TFrmConn = class(TFormBaseGuard)
    panConfig: TLMDSimplePanel;
    panPri: TLMDSimplePanel;
    panCentro: TLMDSimplePanel;
    Paginas: TcxPageControl;
    tsReconectar: TcxTabSheet;
    tsLoginFunc: TcxTabSheet;
    tsConfig: TcxTabSheet;
    TimerMsgErro: TTimer;
    TimerDesisteLogin: TTimer;
    LMDSimplePanel6: TLMDSimplePanel;
    panCentro1: TLMDPanelFill;
    panDiv1: TLMDPanelFill;
    panA1: TLMDSimplePanel;
    Imagem1: TImage;
    panB1: TLMDSimplePanel;
    btnAlterarParametros: TcxButton;
    btnSairWindows: TcxButton;
    pbConexao: TcxProgressBar;
    LMDSimplePanel8: TLMDSimplePanel;
    LMDSimplePanel9: TLMDSimplePanel;
    panCentro2: TLMDPanelFill;
    panDiv2: TLMDPanelFill;
    panA2: TLMDSimplePanel;
    Image5: TImage;
    cxLabel10: TcxLabel;
    panB2: TLMDSimplePanel;
    cxGroupBox1: TcxGroupBox;
    edUsuario: TcxTextEdit;
    edSenha: TcxTextEdit;
    btnVoltarLogin: TButton;
    btnLogin: TButton;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    panErroLogin: TLMDSimplePanel;
    Image9: TImage;
    lbErroLogin: TcxLabel;
    LMDSimplePanel16: TLMDSimplePanel;
    lbToken: TcxLabel;
    LMDPanelFill7: TLMDPanelFill;
    LMDSimplePanel1: TLMDSimplePanel;
    panCentro3: TLMDPanelFill;
    panDiv3: TLMDPanelFill;
    panA3: TLMDSimplePanel;
    Image6: TImage;
    cxLabel14: TcxLabel;
    panB3: TLMDSimplePanel;
    cxGroupBox2: TcxGroupBox;
    edServidor: TcxComboBox;
    edMaquina: TcxSpinEdit;
    btnVoltarC: TButton;
    btnSalvar: TButton;
    LMDSimplePanel17: TLMDSimplePanel;
    cxLabel20: TcxLabel;
    LMDPanelFill11: TLMDPanelFill;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    panSemSenha1: TLMDSimplePanel;
    Image1: TImage;
    cxLabel3: TcxLabel;
    tsFechar: TcxTabSheet;
    LMDSimplePanel7: TLMDSimplePanel;
    panCentro4: TLMDPanelFill;
    panDiv4: TLMDPanelFill;
    panA4: TLMDSimplePanel;
    Image2: TImage;
    cxLabel4: TcxLabel;
    panB4: TLMDSimplePanel;
    cxGroupBox3: TcxGroupBox;
    btnNao: TButton;
    btnSim: TButton;
    cxLabel6: TcxLabel;
    LMDSimplePanel13: TLMDSimplePanel;
    cxLabel8: TcxLabel;
    LMDPanelFill5: TLMDPanelFill;
    panSemSenha2: TLMDSimplePanel;
    Image3: TImage;
    cxLabel5: TcxLabel;
    TimerDesisteFechar: TTimer;
    PB: TcxProgressBar;
    lbNovaVersao: TcxLabel;
    LMDSimpleLabel1: TLMDSimpleLabel;
    lbStatus: TLMDSimpleLabel;
    panErroConn: TLMDSimplePanel;
    lbErroConn: TcxLabel;
    imErroConn: TImage;
    edAutoDetect: TcxCheckBox;
    panTopo: TLMDSimplePanel;
    lbMaquina: TLMDSimpleLabel;
    lbVersao: TLMDSimpleLabel;
    cxLabel7: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btlVoltarCClick(Sender: TObject);
    procedure edServidorEnter(Sender: TObject);
    procedure edServidorExit(Sender: TObject);
    procedure TimerMsgErroTimer(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnAlterarParametrosClick(Sender: TObject);
    procedure btnSairWindowsClick(Sender: TObject);
    procedure edUsuarioPropertiesChange(Sender: TObject);
    procedure TimerDesisteLoginTimer(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormResize(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure btnVoltarLoginClick(Sender: TObject);
    procedure edAutoDetectClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FFocusOk : Boolean;
    FLoginOk : Boolean;
    FOper    : Byte;
  protected
    procedure CreateParams(var Params: TCreateParams); override;

    procedure UpdateServers(Sender: TObject);

  public

    procedure OnTimerTop; override;
    procedure LimpaLoginInfo;
    procedure AjustaTela;
    
    procedure RefreshConexao;
    procedure AtualizaTela;

    property Oper: Byte 
      read FOper write FOper;
    { Public declarations }
  end;

const
  olFechar = 0;
  olConfig = 1;  

var
  FrmConn: TFrmConn;
  ProxConn   : Cardinal;
  gToken : String;

implementation

uses ncgFrmPri, ncgFrmLogin, ncgLVBack, ncIDRecursos, ncFrmSuporteRem, ncDebug,
  ncClassesBase, ncgPrevLogoff, ncNXServRemoto, ncgConnMgr, ncgWatch, ncToken;

{$R *.dfm}

procedure TFrmConn.FormCreate(Sender: TObject);
begin
  lbToken.Caption := 'Token: '+Format2Dig(gToken);
  try gConnMgr.OnUpdate := UpdateServers; except end;
  nxsr_ActiveFormHWND := Handle;
  Left := 0;
  Top := 0;
  Width := Screen.Width;
  Height := Screen.Height;
  FormResize(Self);
  DebugMsg('FrmConn - FormCreate 1');
  Paginas.HideTabs := True;
  DebugMsg('FrmConn - FormCreate 2');
  Paginas.ActivePageIndex := 0;
  DebugMsg('FrmConn - FormCreate 3');
  DebugMsg('FrmConn - FormCreate 4');
  if SameText('auto', slConfig.Values['Servidor']) then
    edServidor.Text := 'Detectar Automaticamente';
  DebugMsg('FrmConn - FormCreate 5');
  RefreshConexao;
  DebugMsg('FrmConn - FormCreate 6');
  FFocusOk := False;
  FLoginOk := False;
end;



procedure TFrmConn.FormDestroy(Sender: TObject);
begin
  inherited;
  try gConnMgr.OnUpdate := nil; except end;
end;

procedure TFrmConn.RefreshConexao;
var 
  I : integer;
  S : String;
  sl : TStrings;
begin
  DebugMsg('TFrmConn.RefreshConexao');
  lbVersao.Caption := 'NexCafé '+FrmLogin.VersaoStr;
  DebugMsg('TFrmConn.RefreshConexao 1');
  

  with FrmPri, slConfig do begin
    DebugMsg('TFrmConn.RefreshConexao 2');

    S := '';  

    if SameText('auto', Values['Servidor']) then 
      S := 'Detectar Automaticamente' else
      S := Values['Servidor'];

    DebugMsg('TFrmConn.RefreshConexao 3');


    FrmLogin.lbMaq.Caption := 'Máquina ' + Values[NomeMaq];
    DebugMsg('TFrmConn.RefreshConexao 4');
    
    lbMaquina.Caption := 'Máquina ' + Values[NomeMaq];
    DebugMsg('TFrmConn.RefreshConexao 5');
    
    if SameText('auto', Values['Servidor']) then 
      edServidor.Properties.Items.Insert(0, 'Detectar Automaticamente');
      
    DebugMsg('TFrmConn.RefreshConexao 7');
    
    if (Paginas.ActivePage<>tsConfig) then begin
      edMaquina.Value := StrToIntDef(Values[NomeMaq], 0);
      DebugMsg('TFrmConn.RefreshConexao 8');

      gConnMgr.RefreshAutoInfo;
      edServidor.Properties.Items.Text := gConnMgr.AutoServers.Text;
      if gConnMgr.Auto then begin
        if gConnMgr.LastConnOk then
          edServidor.Text := gConnMgr.LastConn 
        else
        if gConnMgr.AutoServers.Count>0 then
          edServidor.Text := gConnMgr.AutoServers[0];
      end else
        edServidor.Text := slConfig.Values['Servidor'];
        
      edServidor.Enabled := not gConnMgr.Auto;
      edAutoDetect.Checked := gConnMgr.Auto;
    end;
  end;
  DebugMsg('TFrmConn.RefreshConexao - OK');
end;

procedure TFrmConn.FormHide(Sender: TObject);
begin
  DebugMsg('TFrmConn.FormHide');
  TimerDesisteLogin.Enabled := False;
  TimerDesisteFechar.Enabled := False;
  DebugMsg('TFrmConn.FormHide - OK');
end;

procedure TFrmConn.FormResize(Sender: TObject);
begin
  AjustaTela;
end;

procedure TFrmConn.FormShow(Sender: TObject);
begin
  DebugMsg('TFrmConn.FormShow - 1');
  if FrmPri.Status=sgConfig then
    RefreshConexao;
  DebugMsg('TFrmConn.FormShow - 2');
  DebugMsg('TFrmConn.FormShow - 3');
  DebugMsg('TFrmConn.FormShow - 4');
  BorderStyle := bsNone;
  DebugMsg('TFrmConn.FormShow - 5');
  edUsuario.Text := '';
  DebugMsg('TFrmConn.FormShow - 6');
  edSenha.Text := '';
  DebugMsg('TFrmConn.FormShow - OK');
end;

procedure TFrmConn.btnSalvarClick(Sender: TObject);
var S: String;
begin
{  if SameText('Detectar Automaticamente', edServidor.Text) then begin
    edServidor.Text := '';
    Exit;
  end;}
  S := Trim(edServidor.Text);

  if edAutoDetect.Checked then 
    S := 'auto';

  with FrmPri do begin
    DebugMsg('TFrmConn.btnSalvarClick - ' + slConfig.Text);
  
    if (StrToIntDef(slConfig.Values[NomeMaq],0) <> edMaquina.Value) or (S <> slConfig.Values['Servidor']) then begin
      
      slConfig.Values[NomeMaq] := edMaquina.Value;
      slConfig.Values['Servidor'] := S;
      slConfig.SaveToFile(IniFName);

      DebugMsg('TFrmConn.btnSalvarClick - ' + slConfig.Text);

      if not edAutoDetect.Checked then
        gConnMgr.Servidor := S;
        
      lbMaquina.Caption := 'Máquina '+slConfig.Values[NomeMaq];
      FrmLogin.lbMaq.Caption := 'Máquina ' + slConfig.Values[NomeMaq];
      CM.Ativo := False;
    end;
    

    Status := sgTentaAtivar;  
  end;
end;

procedure TFrmConn.btnSimClick(Sender: TObject);
begin
  KeepMeClosed;
  FrmPri.CMShutdown(Self, operFecharNex);
end;

procedure TFrmConn.btnVoltarLoginClick(Sender: TObject);
begin
  TimerMsgErroTimer(nil);
  FrmPri.Status := FrmPri.CalcStatus;
  AtualizaTela;
end;

procedure TFrmConn.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.X := 0;
  Params.Y := 0;
  Params.Width := Screen.Width;
  Params.Height := Screen.Height;
end;

procedure TFrmConn.btlVoltarCClick(Sender: TObject);
begin
  FrmPri.Status := FrmPri.CalcStatus;
end;

procedure TFrmConn.edAutoDetectClick(Sender: TObject);
begin
  inherited;
  edServidor.Enabled := not edAutoDetect.Checked;
end;

procedure TFrmConn.edServidorEnter(Sender: TObject);
begin
  FFocusOk := True;
end;

procedure TFrmConn.edServidorExit(Sender: TObject);
begin
  FFocusOk := False;
end;

procedure TFrmConn.LimpaLoginInfo;
begin
  edUsuario.Text := '';
  edSenha.Text := '';
  FLoginOk := False;
end;

procedure TFrmConn.OnTimerTop;
var 
  T : Cardinal;
begin
  with FrmPri do 
  case Status of 
    sgFechar : begin
      lbStatus.Caption := 'Fechando ...';
      pbConexao.Position := 0;
      Exit;
    end;
    
    sgInativo : begin
      DebugMsg('TFrmConn.TimerOnTopTimer - sgInativo - 1');
      T := GetTickCount;
      if T < ProxConn then begin
        pbConexao.Position := 20000 - (ProxConn - T);
        lbStatus.Caption := '';
      end else begin
        DebugMsg('TFrmConn.TimerOnTopTimer - sgInativo - 2');
        lbStatus.Caption := 'Conectando.';
        ProxConn := GetTickCount + 1000;
        pbConexao.Position := 20000;
        Status := sgTentaAtivar;
      end; 
      DebugMsg('TFrmConn.TimerOnTopTimer - sgInativo OK'); 
    end;

    sgTentaAtivar : begin
//    if FrmPri.CM.TransferindoArq=0 then begin
      DebugMsg('TFrmConn.TimerOnTopTimer - sgTentaAtivar - 1');
      T := GetTickCount;
      pbConexao.Position := 20000;
      lbStatus.Caption := 'Conectando...';
      DebugMsg('TFrmConn.TimerOnTopTimer - sgTentaAtivar - 2 - T: ' + IntToStr(T) + ' - ProxConn: ' + IntToStr(ProxConn));
      if (T >= ProxConn) then
      try
        DebugMsg('TFrmConn.TimerOnTopTime - sgTentaAtivar 3');
        Conectar(True);
      except
        DebugMsg('TFrmConn.TimerOnTopTimer - sgTentaAtivar - 4');
        Status := sgInativo;
      end;
      DebugMsg('TFrmConn.TimerOnTopTimer - sgTentaAtivar - OK');
    end;   
  end;  

  panErroConn.Visible := (UErroStr>'');
  if panErroConn.Visible then begin
    if Trim(FrmPri.nxTCPIP.ServerName)='' then
      lbErroConn.Caption := 'Não foi possível detectar seu servidor automaticamente. '+
                            'Por favor, clique em "Ajustar Parâmetros de Conexão" e '+
                            'informe o endereço do servidor' else
      lbErroConn.Caption := 'Servidor = '+FrmPri.nxTCPIP.ServerName + sLineBreak + sLineBreak + UErroStr;
  end;
end;

procedure TFrmConn.PaginasChange(Sender: TObject);
begin
  TimerDesisteFechar.Enabled := (Paginas.ActivePageIndex=3);
end;

procedure TFrmConn.TimerMsgErroTimer(Sender: TObject);
begin
  panErroLogin.Visible := False;
  TimerMsgErro.Enabled := False;
end;

procedure TFrmConn.UpdateServers(Sender: TObject);
begin
  edServidor.Properties.Items.Text := gConnMgr.AutoServers.Text;
  if edAutoDetect.Checked then begin
    if gConnMgr.LastConnOk then
      edServidor.Text := gConnMgr.LastConn 
    else
    if gConnMgr.AutoServers.Count>0 then
      edServidor.Text := gConnMgr.AutoServers[0];
  end;
end;

procedure TFrmConn.btnLoginClick(Sender: TObject);
var S: String;
begin
  TimerMsgErroTimer(nil);
  S := 'x';
  if (TokenPassOk(gToken, edUsuario.Text) or TokenPassOk(gToken, edSenha.Text)) then
    S := '' else
    S := FrmPri.UsuarioOpOk(edUsuario.Text, edSenha.Text, daMaqFecharCMGuard);
    
  FLoginOk := (S='');
  if not FLoginOk then begin
    TimerMsgErro.Enabled := False;
    TimerMsgErro.Enabled := True;
    lbErroLogin.Caption := S;
    panErroLogin.Visible := True;
    edUsuario.SetFocus;
  end else 
  if FOper=olFechar then
    FrmPri.Status := sgConfirmaFechar else
    FrmPri.Status := sgConfig;
end;

procedure TFrmConn.btnAlterarParametrosClick(Sender: TObject);
begin
  Oper := olConfig;
  if FLoginOk or FrmPri.SemSenha then
    FrmPri.Status := sgConfig else
    FrmPri.Status := sgLoginFunc;
end;

procedure TFrmConn.btnSairWindowsClick(Sender: TObject);
begin
  Oper := olFechar;
  if FLoginOk or FrmPri.SemSenha then
    FrmPri.Status := sgConfirmaFechar else
    FrmPri.Status := sgLoginFunc;
end;

procedure TFrmConn.AjustaTela;
const Gap = 22;
begin
  panDiv1.Left := (panCentro1.Width - panDiv1.Width) div 2;
  panDiv2.Left := panDiv1.Left;
  panDiv3.Left := panDiv1.Left;
  panDiv4.Left := panDiv1.Left;
  
  panDiv1.Height := panCentro1.Height;
  panDiv2.Height := panCentro1.Height;
  panDiv3.Height := panCentro1.Height;
  panDiv4.Height := panCentro1.Height;
  
  panA1.Left := panDiv1.Left - Gap - panA1.Width;
  panA1.Top  := ((panCentro1.Height-panA1.Height) div 2) - 20;
  panB1.Left := panDiv1.Left + panDiv1.Width + Gap;
  panB1.Top  := panA1.Top;
  
  panA2.Left := panDiv2.Left - Gap - panA2.Width;
  panA2.Top  := ((panCentro1.Height-panA2.Height) div 2) - 20;
  panB2.Left := panDiv2.Left + panDiv2.Width + Gap;
  panB2.Top  := panA2.Top;

  panA3.Left := panDiv3.Left - Gap - panA3.Width;
  panA3.Top  := ((panCentro1.Height-panA3.Height) div 2) - 20;
  panB3.Left := panDiv3.Left + panDiv3.Width + Gap;
  panB3.Top  := panA3.Top;

  panA4.Left := panDiv4.Left - Gap - panA4.Width;
  panA4.Top  := ((panCentro1.Height-panA4.Height) div 2) - 20;
  panB4.Left := panDiv4.Left + panDiv4.Width + Gap;
  panB4.Top  := panA4.Top;
end;

procedure TFrmConn.AtualizaTela;
begin
  lbVersao.Caption := 'NexCafé '+FrmLogin.VersaoStr;

  TimerDesisteLogin.Enabled := (FrmPri.Status=sgLoginFunc);

  case FrmPri.Status of
    sgInativo : begin
      btnAlterarParametros.Enabled := True;
      btnSairWindows.Enabled := True;
      Paginas.ActivePageIndex := 0; 
    end;

    sgTentaAtivar : begin
      btnAlterarParametros.Enabled := False;
      btnSairWindows.Enabled := False;
      Paginas.ActivePageIndex := 0;
    end;

    sgLoginFunc : begin
      LimpaLoginInfo;
      Paginas.ActivePageIndex := 1;
    end;

    sgConfirmaFechar : begin
      LimpaLoginInfo;
      Paginas.ActivePageIndex := 3;
      panSemSenha2.Visible := FrmPri.SemSenha;
    end;

    sgConfig : begin
      Paginas.ActivePageIndex := 2;
      panSemSenha1.Visible := FrmPri.SemSenha;
    end;
  end;
end;

procedure TFrmConn.edUsuarioPropertiesChange(Sender: TObject);
begin
  TimerMsgErroTimer(nil);
  TimerDesisteLogin.Enabled := False;
  TimerDesisteLogin.Enabled := True;
end;

procedure TFrmConn.TimerDesisteLoginTimer(Sender: TObject);
begin
  FrmPri.Status := FrmPri.CalcStatus;
end;

procedure TFrmConn.btnFecharClick(Sender: TObject);
begin
  FrmPri.FecharCMGuard;
end;

procedure TFrmConn.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
  PrevLogoff;
end;

initialization
  gToken := CreateToken;

end.
