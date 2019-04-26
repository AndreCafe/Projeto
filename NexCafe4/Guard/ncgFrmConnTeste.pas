unit ncgFrmConnTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, PngSpeedButton, cxGroupBox, cxContainer, cxEdit,
  cxLabel, LMDControl, LMDDrawEdge, pngimage, ExtCtrls,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill, cxPC, cxControls,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxGraphics, cxTextEdit, cxMaskEdit, cxDropDownEdit, StdCtrls,
  LMDBaseEdit, LMDCustomEdit, LMDCustomMaskEdit, LMDCustomExtSpinEdit,
  LMDExtSpinEdit, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, PngBitBtn, cxProgressBar, Menus, dxBar,
  dxBarExtItems, cxClasses, cxLookAndFeelPainters, cxButtons, dxGDIPlusClasses,
  cxSpinEdit, ComCtrls, LMDGraphicControl, LMDFill, cxRadioGroup;

type
  TFrmConn = class(TForm)
    panConfig: TLMDSimplePanel;
    LMDSimplePanel3: TLMDSimplePanel;
    panTopo: TLMDSimplePanel;
    Paginas: TcxPageControl;
    tsReconectar: TcxTabSheet;
    tsLoginFunc: TcxTabSheet;
    tsConfig: TcxTabSheet;
    TimerOnTop: TTimer;
    TimerMsgErro: TTimer;
    TimerDesisteLogin: TTimer;
    LMDSimplePanel5: TLMDSimplePanel;
    lbVersao: TcxLabel;
    lbMaquina: TcxLabel;
    LMDSimplePanel6: TLMDSimplePanel;
    panCentro1: TLMDPanelFill;
    panDiv1: TLMDPanelFill;
    panA1: TLMDSimplePanel;
    Imagem1: TImage;
    lbMensagem1: TcxLabel;
    panB1: TLMDSimplePanel;
    btnAlterarParametros: TcxButton;
    btnSairWindows: TcxButton;
    pbConexao: TcxProgressBar;
    LMDSimplePanel8: TLMDSimplePanel;
    panErroConn: TLMDSimplePanel;
    imErroConn: TImage;
    lbErroConn: TcxLabel;
    ScrollBox1: TScrollBox;
    imAjuda1: TImage;
    lbAjuda1: TcxLabel;
    LMDPanelFill4: TLMDPanelFill;
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
    cxLabel16: TcxLabel;
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
    PB: TcxProgressBar;
    lbNovaVersao: TcxLabel;
    lbStatus: TcxLabel;
    lbAjuda2: TcxLabel;
    imAjuda2: TImage;
    lbAjuda3: TcxLabel;
    imAjuda3: TImage;
    LMDPanelFill1: TLMDPanelFill;
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
    Image4: TImage;
    cxLabel8: TcxLabel;
    lbAjuda4: TcxLabel;
    LMDPanelFill5: TLMDPanelFill;
    panSemSenha2: TLMDSimplePanel;
    Image3: TImage;
    cxLabel5: TcxLabel;
    TimerDesisteFechar: TTimer;
    tsSuporte: TcxTabSheet;
    panCentro5: TLMDPanelFill;
    panDiv5: TLMDPanelFill;
    panA5: TLMDSimplePanel;
    Image7: TImage;
    cxLabel7: TcxLabel;
    panB5: TLMDSimplePanel;
    cxGroupBox4: TcxGroupBox;
    btnCancelarSup: TButton;
    btnOkSup: TButton;
    panErroSup: TLMDSimplePanel;
    Image8: TImage;
    lbErroSup: TcxLabel;
    cxGroupBox5: TcxGroupBox;
    edSenhaSup: TcxTextEdit;
    LMDSimplePanel2: TLMDSimplePanel;
    imAjuda5: TImage;
    cxLabel9: TcxLabel;
    lbAjuda5: TcxLabel;
    LMDPanelFill3: TLMDPanelFill;
    TimerErroSup: TTimer;
    btnSup: TPngSpeedButton;
    LMDSimplePanel12: TLMDSimplePanel;
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerOnTopTimer(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btlVoltarCClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edServidorEnter(Sender: TObject);
    procedure edServidorExit(Sender: TObject);
    procedure TimerMsgErroTimer(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnVoltarLoginClick(Sender: TObject);
    procedure btnAlterarParametrosClick(Sender: TObject);
    procedure btnSairWindowsClick(Sender: TObject);
    procedure edUsuarioPropertiesChange(Sender: TObject);
    procedure TimerDesisteLoginTimer(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormResize(Sender: TObject);
    procedure lbAjuda3MouseEnter(Sender: TObject);
    procedure lbAjuda1MouseEnter(Sender: TObject);
    procedure lbAjuda2MouseEnter(Sender: TObject);
    procedure lbAjuda2MouseLeave(Sender: TObject);
    procedure lbAjuda3MouseLeave(Sender: TObject);
    procedure lbAjuda1MouseLeave(Sender: TObject);
    procedure lbAjuda1Click(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure cxLabel24Click(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure btnOkSupClick(Sender: TObject);
    procedure TimerErroSupTimer(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure imSupClick(Sender: TObject);
    procedure btnSupClick(Sender: TObject);
  private
    { Private declarations }
    FFocusOk : Boolean;
    FServs   : TStrings;
    FLoginOk : Boolean;
    FOper    : Byte;

    procedure MostraAjuda;
    
  public
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

implementation

uses ncgFrmPri, ncgFrmLogin, ncgLVBack, ncIDRecursos, ncFrmSuporteRem, ncDebug;

{$R *.dfm}

procedure TFrmConn.FormCreate(Sender: TObject);
begin
  DebugMsg('FrmConn - FormCreate 1');
  Paginas.HideTabs := True;
  DebugMsg('FrmConn - FormCreate 2');
  Paginas.ActivePageIndex := 0;
  DebugMsg('FrmConn - FormCreate 3');
  FServs := TStringList.Create;
  DebugMsg('FrmConn - FormCreate 4');
  if SameText('auto', slConfig.Values['Servidor']) then
    edServidor.Text := 'Detectar Automaticamente';
  DebugMsg('FrmConn - FormCreate 5');
  RefreshConexao;
  DebugMsg('FrmConn - FormCreate 6');
  FFocusOk := False;
  FLoginOk := False;
end;

procedure TFrmConn.RefreshConexao;
var 
  I : integer;
  S : String;
begin
  lbVersao.Caption := 'NexCafé '+FrmLogin.VersaoStr;

  with FrmPri, slConfig do begin
    FServs.Clear;
    for i := 0 to AutoIP.DetectedAdvertisers.Count-1 do 
      FServs.Add(AutoIP.DetectedAdvertisers[i].ComputerName);

    S := '';  

    if SameText('auto', Values['Servidor']) then
      S := 'Detectar Automaticamente' else
      S := Values['Servidor'];

    FrmLogin.lbMaq.Caption := 'Máquina ' + Values[NomeMaq];
    lbMaquina.Caption := 'Máquina ' + Values[NomeMaq];

    edServidor.Properties.Items.Text := FServs.Text;
    edServidor.Properties.Items.Insert(0, 'Detectar Automaticamente');
    if (Paginas.ActivePage<>tsConfig) then begin
      edMaquina.Value := StrToIntDef(Values[NomeMaq], 0);
      edServidor.Text := S;
    end;
  end;
end;

procedure TFrmConn.FormHide(Sender: TObject);
begin
  TimerOnTop.Enabled := False;
  TimerDesisteLogin.Enabled := False;
  TimerDesisteFechar.Enabled := False;
end;

procedure TFrmConn.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F8 then
    Paginas.ActivePage := tsSuporte;
end;

procedure TFrmConn.FormResize(Sender: TObject);
begin
  AjustaTela;
end;

procedure TFrmConn.FormShow(Sender: TObject);
begin
  RefreshConexao;
  TimerOnTop.Enabled := True;
  TicksVisible := GetTickCount;
  BorderStyle := bsNone;
  WindowState := wsMaximized;
  edUsuario.Text := '';
  edSenha.Text := '';
end;

procedure TFrmConn.imSupClick(Sender: TObject);
begin
  Paginas.ActivePage := tsSuporte;
end;

procedure TFrmConn.TimerOnTopTimer(Sender: TObject);
var 
  H : HWND;
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
      T := GetTickCount;
      if T < ProxConn then begin
        pbConexao.Position := 20000 - (ProxConn - T);
        lbStatus.Caption := '';
      end else begin
        lbStatus.Caption := 'Conectando...';
        ProxConn := GetTickCount + 1000;
        pbConexao.Position := 20000;
        Status := sgTentaAtivar;
      end;  
    end;

    sgTentaAtivar : if FrmPri.CM.TransferindoArq=0 then begin
      T := GetTickCount;
      pbConexao.Position := 20000;
      lbStatus.Caption := 'Conectando...';
      if (T >= ProxConn) then
      try
        Conectar(True);
      except
        Status := sgInativo;
        AutoIP.Active := True;
      end;
    end;   
  end;  

  if not Visible then begin
    TimerOnTop.Enabled := False;
    Exit 
  end;  
    
  Left := 0;
  Top := 0;
  Width := Screen.Width;
  Height := Screen.Height;

  panErroConn.Visible := (UErroStr>'');
  if panErroConn.Visible then begin
    if Trim(FrmPri.CMRem.Host)='' then
      lbErroConn.Caption := 'Não foi possível detectar seu servidor automaticamente. '+
                            'Por favor, clique em "Ajustar Parâmetros de Conexão" e '+
                            'informe o endereço do servidor' else
      lbErroConn.Caption := 'Servidor = '+FrmPri.CMRem.Host + sLineBreak + UErroStr;
  end;

  if FrmPri.StayOnTopOFF or (FFocusOk and Application.Active) or ncgFrmPri.Fechar then Exit;

  ForceForegroundWindow(Handle);
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, (SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE));
  H := GetForeGroundWindow;
  ShowWindow(Handle, SW_SHOW);
  if (H <> Handle) and (H <> FindWindow('Shell_TrayWnd', nil)) and ((GetTickCount-TicksVisible)<6000) then begin
    keybd_event(VK_LWIN, Mapvirtualkey(VK_LWIN, 0), 0, 0);
    keybd_event(VK_LWIN, Mapvirtualkey(VK_LWIN, 0), KEYEVENTF_KEYUP, 0);
    keybd_event(VK_CONTROL, Mapvirtualkey(VK_CONTROL, 0), 0, 0);
    keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), 0, 0);
    keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), KEYEVENTF_KEYUP, 0);
    keybd_event(VK_CONTROL, Mapvirtualkey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
    SetForegroundWindow(Handle);
  end;  
end;

procedure TFrmConn.btnSalvarClick(Sender: TObject);
var S: String;
begin
  if SameText('Detectar Automaticamente', edServidor.Text) then
    S := 'auto' else
    S := edServidor.Text;
    
  with FrmPri do begin
    if (StrToIntDef(slConfig.Values[NomeMaq],0) <> edMaquina.Value) or (S <> slConfig.Values['Servidor']) then begin
      slConfig.Values[NomeMaq] := edMaquina.Value;
      slConfig.Values['Servidor'] := S;
      slConfig.SaveToFile(IniFName);
      lbMaquina.Caption := 'Máquina '+slConfig.Values[NomeMaq];
      FrmLogin.lbMaq.Caption := 'Máquina ' + slConfig.Values[NomeMaq];
      CM.Ativo := False;
    end;

    Status := sgTentaAtivar;  
  end;
end;

procedure TFrmConn.btnSimClick(Sender: TObject);
begin
  DesbloqTaskMgr := True;
  FrmPri.FecharCMGuard;
end;

procedure TFrmConn.btnSupClick(Sender: TObject);
begin
  Paginas.ActivePage := tsSuporte;
  ProxConn := GetTickCount + 20000;
end;

procedure TFrmConn.btlVoltarCClick(Sender: TObject);
begin
  FrmPri.Status := FrmPri.CalcStatus;
end;

procedure TFrmConn.FormDestroy(Sender: TObject);
begin
  FServs.Free;
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

procedure TFrmConn.MostraAjuda;
begin
  panAjuda.Visible := not panAjuda.Visible;
  if not panAjuda.Visible then begin
    lbAjuda1.Caption := 'Ajuda';
    lbAjuda2.Caption := 'Ajuda';
    lbAjuda3.Caption := 'Ajuda';
    lbAjuda4.Caption := 'Ajuda';
    lbAjuda5.Caption := 'Ajuda';
    Exit;
  end;

  RE.Clear;

  panAjuda.Width := (panCentro1.Width div 2) - 40;
  panAjuda.Left := 20;
  panAjuda.Height := panCentro1.Height - 40;
  panAjuda.Top := 20;
  
  case Paginas.ActivePageIndex of
    0 : begin
      panAjuda.Parent := panCentro1;
      RE.Text := Memo1.Lines.Text;
      lbAjuda1.Caption := 'Fechar Ajuda';
    end;  

    1 : begin
      panAjuda.Parent := panCentro2;
      RE.Text := Memo2.Lines.Text;
      lbAjuda3.Caption := 'Fechar Ajuda';
    end;

    2 : begin
      panAjuda.Parent := panCentro3;
      RE.Text := Memo3.Lines.Text;
      lbAjuda3.Caption := 'Fechar Ajuda';
    end;  

    3 : begin
      panAjuda.Parent := panCentro4;
      RE.Text := Memo4.Lines.Text;
      lbAjuda4.Caption := 'Fechar Ajuda';
    end;  

    4 : begin
      panAjuda.Parent := panCentro5;
      RE.Text := Memo5.Lines.Text;
      lbAjuda5.Caption := 'Fechar Ajuda';
    end;  
  end;

end;

procedure TFrmConn.PaginasChange(Sender: TObject);
begin
  panAjuda.Visible := False;
  lbAjuda1.Caption := 'Ajuda';
  lbAjuda2.Caption := 'Ajuda';
  lbAjuda3.Caption := 'Ajuda';
  lbAjuda4.Caption := 'Ajuda';
  lbAjuda5.Caption := 'Ajuda';
  TimerDesisteFechar.Enabled := (Paginas.ActivePageIndex=3);

  if Paginas.ActivePage=tsSuporte then
    edSenhaSup.SetFocus;
end;

procedure TFrmConn.TimerMsgErroTimer(Sender: TObject);
begin
  panErroLogin.Visible := False;
  TimerMsgErro.Enabled := False;
end;

procedure TFrmConn.btnLoginClick(Sender: TObject);
var S: String;
begin
  TimerMsgErroTimer(nil);

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

procedure TFrmConn.btnOkSupClick(Sender: TObject);
begin
  if not SameText(edSenhaSup.Text, 'SOS') then begin
    panErroSup.Visible := True;
    TimerErroSup.Enabled := True;
  end else begin
    ChamaSuporte('Máq.'+IntToStr(FrmPri.CM.Maquina), FrmLogin.VersaoStr);
    AtualizaTela;
  end;
end;

procedure TFrmConn.btnVoltarLoginClick(Sender: TObject);
begin
  TimerMsgErroTimer(nil);
  TimerErroSupTimer(nil);
  FrmPri.Status := FrmPri.CalcStatus;
  AtualizaTela;
end;

procedure TFrmConn.cxLabel24Click(Sender: TObject);
begin
  panAjuda.Visible := False;
end;

procedure TFrmConn.lbAjuda1Click(Sender: TObject);
begin
  MostraAjuda;
end;

procedure TFrmConn.lbAjuda1MouseEnter(Sender: TObject);
begin
  lbAjuda1.Style.TextStyle := [fsBold, fsUnderline];
end;

procedure TFrmConn.lbAjuda1MouseLeave(Sender: TObject);
begin
  lbAjuda1.Style.TextStyle := [fsBold];
end;

procedure TFrmConn.lbAjuda2MouseEnter(Sender: TObject);
begin
  lbAjuda2.Style.TextStyle := [fsBold, fsUnderline];
end;

procedure TFrmConn.lbAjuda2MouseLeave(Sender: TObject);
begin
  lbAjuda2.Style.TextStyle := [fsBold];
end;

procedure TFrmConn.lbAjuda3MouseEnter(Sender: TObject);
begin
  lbAjuda3.Style.TextStyle := [fsBold, fsUnderline];
end;

procedure TFrmConn.lbAjuda3MouseLeave(Sender: TObject);
begin
  lbAjuda3.Style.TextStyle := [fsBold];
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
  panConfig.Visible := False;
  try
    panDiv1.Left := (panCentro1.Width - panDiv1.Width) div 2;
    panDiv2.Left := panDiv1.Left;
    panDiv3.Left := panDiv1.Left;
    panDiv4.Left := panDiv1.Left;
    panDiv5.Left := panDiv1.Left;
    
    panDiv1.Height := panCentro1.Height;
    panDiv2.Height := panCentro1.Height;
    panDiv3.Height := panCentro1.Height;
    panDiv4.Height := panCentro1.Height;
    panDiv5.Height := panCentro1.Height;
    
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
  
    panA5.Left := panDiv5.Left - Gap - panA5.Width;
    panA5.Top  := ((panCentro1.Height-panA5.Height) div 2) - 20;
    panB5.Left := panDiv5.Left + panDiv5.Width + Gap;
    panB5.Top  := panA5.Top;

    Application.ProcessMessages;
    Application.ProcessMessages;
  finally
    panConfig.Visible := True;
    btnAlterarParametros.Visible := True;
    btnSairWindows.Visible := True;
  end;
end;

procedure TFrmConn.AtualizaTela;
begin
  lbVersao.Caption := 'NexCafé '+FrmLogin.VersaoStr;

  TimerDesisteLogin.Enabled := (FrmPri.Status=sgLoginFunc);

  case FrmPri.Status of
    sgInativo : begin
//      lbProxConn.Visible := True;
      btnAlterarParametros.Enabled := True;
      btnSairWindows.Enabled := True;
      Paginas.ActivePageIndex := 0; 
      btnSup.Enabled := True;
    end;

    sgTentaAtivar : begin
//      lbProxConn.Visible := False;
      btnAlterarParametros.Enabled := False;
      btnSairWindows.Enabled := False;
      btnSup.Enabled := False;
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

procedure TFrmConn.TimerErroSupTimer(Sender: TObject);
begin
  TimerErroSup.Enabled := False;
  panErroSup.Visible := False;
end;

procedure TFrmConn.btnFecharClick(Sender: TObject);
begin
  FrmPri.FecharCMGuard;
end;

procedure TFrmConn.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
end;

end.
