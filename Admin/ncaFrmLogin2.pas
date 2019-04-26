unit ncaFrmLogin2;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons,Dialogs, DBCtrls, Db,
  ExtCtrls, LMDCustomControl, LMDCustomPanel, 
  LMDCustomBevelPanel, nxllTransport, nxptBasePooledTransport,
  LMDSimplePanel, LMDCustomComponent, LMDIniCtrl, jpeg, 
  LMDCustomHint, LMDCustomShapeHint, LMDMessageHint, LMDShapeHint,
  LMDApplicationCtrl, cxLookAndFeelPainters, cxButtons, pngimage,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, Menus, cxGraphics, cxCheckBox,
  cxMaskEdit, cxDropDownEdit, UDPAdvertiser, cxRadioGroup, lmdcont, LMDControl,
  LMDPNGImage, cxLookAndFeels;


type
  
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    edUsuario: TcxTextEdit;
    edSenha: TcxTextEdit;
    lbNomeRede: TcxLabel;
    btnLogin: TcxButton;
    btnCancelar: TcxButton;
    LMDPanelFill1: TLMDPanelFill;
    Image1: TImage;
    cxLabel7: TcxLabel;
    cxLabel6: TcxLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    edServidor: TcxComboBox;
    AutoIP: TUDPAdUser;
    rbNesta: TcxRadioButton;
    rbNoutra: TcxRadioButton;
    lbVer: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AutoIPNewAdvertiserDetected(Sender: TObject);
    procedure rbNestaClick(Sender: TObject);
    procedure rbNoutraClick(Sender: TObject);
  private
    FServidor: String;
    FUServ   : String;
    FUsuario : String;
    function GetAutoServName: String;
    procedure LeConfig;
    procedure SalvaConfig;
    procedure DoLogin(aAfterinst: Boolean);

    procedure TimerAutoLogin(Sender: TObject);
    procedure TimerLogoff(Sender: TObject);
    { Private declarations }
  public
    procedure RefreshConfig;
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses 
  CSCBase,
  CSCClient,
  ncClassesBase, 
  ncaDM, 
  ncaFrmPri, ncDebug, ncVersionInfo, ncaFrmErroConexao, ncErros;

{$R *.DFM}

procedure TFrmLogin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmLogin := nil;
  Action:= caFree;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  FrmLogin := Self;
  LeConfig;
end;

procedure TFrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and 
     (not btnLogin.Focused) and 
     (not btnCancelar.Focused) then 
  begin
    SelectNext(ActiveControl as TWinControl, True, True);
    Key := #0;
  end;
end;

procedure TFrmLogin.AutoIPNewAdvertiserDetected(Sender: TObject);
begin
  RefreshConfig;
end;

procedure TFrmLogin.btnCancelarClick(Sender: TObject);
begin
  AutoIP.Active := False;
  Close;
end;

procedure TFrmLogin.btnLoginClick(Sender: TObject);
begin
  DoLogin(False);
end;

procedure TFrmLogin.DoLogin(aAfterinst: Boolean);
begin
  with Dados do begin
    if rbNesta.Checked then
      FServidor := '127.0.0.1' 
    else
    if SameText(edServidor.Text, 'Detectar Automaticamente') then
      FServidor := 'auto' else
      FServidor := edServidor.Text;
      
    CM.Ativo := False;
    ServRem.Ativo := False;    
    FUsuario := edUsuario.Text;
    CM.Username := edUsuario.Text;
    CM.Senha    := edSenha.Text;
    CM.Maquina  := 0;
    ServidorRemoto := True;
    nxTCPIP.Active := False;
    nxTCPIP.Enabled := False;
    nxTCPIP.ServerName := GetAutoServName;
    nxTCPIP.Port := 16200;
    nxTCPIP.Enabled := True;
    CM.Servidor := ServRem;
    try
      AutoIP.Active := False;
      CM.Ativo := True;
    except
      On E: EErroNexCafe do begin
        if aAfterInst then Exit;
        if E.CodigoErro=ncerrFalhaConexao then begin
          TFrmErroConexao.Create(Self).ShowModal;
          Exit;
        end else
          Raise;
      end;   
      On E: Exception do begin 
        if aafterinst then Exit;
        Raise;
      end;
    end;  
    SalvaConfig;
    Close;  
  end;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  AutoIP.Active := True;
  lbVer.Caption := 'Versão x' + Copy(SelfVersion, 6, 20);
  RefreshConfig;
  
  if not SameText(ParamStr(1), 'afterlogoff') then 
  if edUsuario.Text = '' then
    edUsuario.SetFocus else
    edSenha.SetFocus; 
    
    
  if SameText(ParamStr(1), 'afterlogoff') then with TTimer.Create(Self) do begin
    edUsuario.Text := '';
    edUsuario.SetFocus;
    Interval := 100;
    OnTimer := TimerLogoff;
    Enabled := True;
  end;
    
  if SameText(ParamStr(1), 'afterinst') then with TTimer.Create(Self) do begin
    Interval := 100;
    OnTimer := TimerAutoLogin;
    Enabled := True;
  end;
end;

function TFrmLogin.GetAutoServName: String;
var I : Integer;
begin
  Result := '';
  if SameText(FServidor, 'auto') then begin
    Result := FUServ;
    if (Trim(Result)>'') then begin
      I := AutoIP.DetectedAdvertisers.IndexOfIP(Result);
      if I=-1 then
       I := AutoIP.DetectedAdvertisers.IndexOfComputerName(Result);
      if I>0 then
        Result := AutoIP.DetectedAdvertisers[I].IPAddress else
        Result := '';
    end;
    if (Result='') and (AutoIP.DetectedAdvertisers.Count>0) then
      Result := AutoIP.DetectedAdvertisers[0].IPAddress else
      Result := Trim(FUServ);
  end else
    Result := FServidor;

  if Result='' then Result := '127.0.0.1';
end;

procedure TFrmLogin.LeConfig;
begin
  with slConfig do begin
    BioActive := SameText(Values['Biometria'], 'S');

    rbNesta.Checked := not SameText(Values['OutraMaq'], 'S');
    rbNoutra.Checked := not rbNesta.Checked;
    FServidor := Values['Servidor'];
    FUsuario  := Values['Usuario'];
    FUServ    := Values['UltimoServidor'];
    edUsuario.Text := FUsuario;
    
    if (rbNoutra.Checked and SameText(FServidor, 'auto')) or rbNesta.Checked then
      edServidor.Text := 'Detectar Automaticamente' else
      edServidor.Text := FServidor;

    rbNestaClick(nil);  
  end;
end;

procedure TFrmLogin.rbNestaClick(Sender: TObject);
begin
  lbNomeRede.Enabled := rbNoutra.Checked;
  edServidor.Enabled := lbNomeRede.Enabled;
end;

procedure TFrmLogin.rbNoutraClick(Sender: TObject);
begin
  rbNestaClick(nil);
  if rbNoutra.Focused then
    edServidor.SetFocus;
end;

procedure TFrmLogin.RefreshConfig;
var i: integer;
begin
  edServidor.Properties.BeginUpdate;
  try
    edServidor.Properties.Items.Clear;
    edServidor.Properties.Items.Add('Detectar Automaticamente');
    for i := 0 to AutoIP.DetectedAdvertisers.Count-1 do 
      edServidor.Properties.Items.Add(AutoIP.DetectedAdvertisers[i].ComputerName);

{    if not edServidor.Focused then begin  
      edServidor.Text  := FServidor;
      if SameText('auto', FServidor) then begin
        edServidor.Text := GetAutoServName;
        i := AutoIP.DetectedAdvertisers.IndexOfIP(edServidor.Text);
        if i>=0 then
          edServidor.Text := AutoIP.DetectedAdvertisers[i].ComputerName;
      end else begin
        edServidor.Text := FServidor;
      end;  
    end;  }
  finally
    edServidor.Properties.EndUpdate;
  end;  
end;

procedure TFrmLogin.SalvaConfig;
begin
  with slConfig do begin
    if rbNesta.Checked then
      Values['OutraMaq'] := 'N' else
      Values['OutraMaq'] := 'S';
      
    Values['Servidor'] := FServidor;
    Values['Usuario'] :=  FUsuario;
    Values['UltimoServidor'] := FUServ;
    SaveConfig;
  end;
end;

procedure TFrmLogin.TimerAutoLogin(Sender: TObject);
begin
  Sender.Free;
  DoLogin(True);
end;

procedure TFrmLogin.TimerLogoff(Sender: TObject);
begin
  try
    ForceForegroundWindow(Handle);
  finally
    Sender.Free;
  end;
end;

initialization
  FrmLogin := nil;

end.

