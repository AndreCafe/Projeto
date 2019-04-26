unit ncaFrmLoginOLD;
{
    ResourceString: Dario 11/03/13
}

interface

{$I NEX.INC}

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
  LMDPNGImage, cxLookAndFeels, dxBar, cxStyles, cxClasses, dxBarExtItems,
  cxImage, cxPCdxBarPopupMenu, cxPC;


type
  
  TFrmNexLogin = class(TForm)
    Panel1: TPanel;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    edUsuario: TcxTextEdit;
    edSenha: TcxTextEdit;
    LMDPanelFill1: TLMDPanelFill;
    cxLabel6: TcxLabel;
    panRodape: TLMDSimplePanel;
    btnLogin: TcxButton;
    btnCancelar: TcxButton;
    AutoIP: TUDPAdUser;
    lbVer: TcxLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    imgConn: TcxImage;
    panConn: TLMDSimplePanel;
    rbNesta: TcxRadioButton;
    rbNoutra: TcxRadioButton;
    edServidor: TcxComboBox;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDSimplePanel11: TLMDSimplePanel;
    Image1: TImage;
    pgImg: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    imgNexCafe: TImage;
    cxTabSheet2: TcxTabSheet;
    Image2: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgConnClick(Sender: TObject);
    procedure rbNoutraClick(Sender: TObject);
    procedure rbNestaClick(Sender: TObject);
  private
    FServidor: String;
    FUServ   : String;
    FUsuario : String;
    FShowing : Boolean;
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
  FrmNexLogin: TFrmNexLogin;

implementation

uses 
  CSCBase,
  CSCClient,
  ncClassesBase, 
  ncaDM, 
  ncaFrmPri, ncDebug, uVersionInfo, ncaFrmErroConexao, ncErros, ncaFrmConn;

// START resource string wizard section
const
  S127001 = '127.0.0.1';

// END resource string wizard section


// START resource string wizard section
resourcestring
  SDetectarAutomaticamente = 'Detectar Automaticamente';
  SVersão = 'Versão ';

// END resource string wizard section


{$R *.DFM}

procedure TFrmNexLogin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmNexLogin := nil;
  Action:= caFree;
end;

procedure TFrmNexLogin.FormCreate(Sender: TObject);
begin
  {$IFDEF LAN}
  pgImg.ActivePageIndex := 0;
  {$ENDIF}
  
  {$IFDEF LOJA}
  pgImg.ActivePageIndex := 1;
  {$ENDIF}
  FShowing := False;
  FrmNexLogin := Self;
  LeConfig;
end;

procedure TFrmNexLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and 
     (not btnLogin.Focused) and 
     (not btnCancelar.Focused) then 
  begin
    SelectNext(ActiveControl as TWinControl, True, True);
    Key := #0;
  end;
end;

procedure TFrmNexLogin.btnCancelarClick(Sender: TObject);
begin
  AutoIP.Active := False;
  Close;
end;

procedure TFrmNexLogin.btnLoginClick(Sender: TObject);
begin
  DoLogin(False);
end;

procedure TFrmNexLogin.imgConnClick(Sender: TObject);
begin
  panConn.Visible := not panConn.Visible;
  if panConn.Visible then 
    Height := 352 else
    Height := 352-panConn.Height;

  edUsuario.SetFocus;  
end;

procedure TFrmNexLogin.DoLogin(aAfterinst: Boolean);
begin
  with Dados do begin
    if rbNesta.Checked then
      FServidor := S127001 
    else
    if SameText(edServidor.Text, SDetectarAutomaticamente) then
      FServidor := 'auto' else // do not localize
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

procedure TFrmNexLogin.FormShow(Sender: TObject);
begin
  FShowing := True;
  Height := 352 - panConn.Height;
  
  AutoIP.Active := True;
  lbVer.Caption := SVersão + prefixo_versao + Copy(SelfVersion, 7, 20);
  RefreshConfig;
  
  if not SameText(ParamStr(1), 'afterlogoff') then  // do not localize
  if edUsuario.Text = '' then
    edUsuario.SetFocus else
    edSenha.SetFocus; 
    
    
  if SameText(ParamStr(1), 'afterlogoff') then with TTimer.Create(Self) do begin // do not localize
    edUsuario.Text := '';
    edUsuario.SetFocus;
    Interval := 100;
    OnTimer := TimerLogoff;
    Enabled := True;
  end;
    
  if SameText(ParamStr(1), 'afterinst') then with TTimer.Create(Self) do begin // do not localize
    Interval := 100;
    OnTimer := TimerAutoLogin;
    Enabled := True;
  end;
end;

function TFrmNexLogin.GetAutoServName: String;
var I : Integer;
begin
  Result := '';
  if SameText(FServidor, 'auto') then begin // do not localize
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

  if Result='' then Result := S127001;
end;

procedure TFrmNexLogin.LeConfig;
begin
  with slConfig do begin
    BioActive := SameText(Values['Biometria'], 'S'); // do not localize

    FUsuario  := Values['Usuario']; // do not localize
    edUsuario.Text := FUsuario;

    rbNesta.Checked := not SameText(Values['OutraMaq'], 'S'); // do not localize
    rbNoutra.Checked := not rbNesta.Checked;
    FServidor := Values['Servidor']; // do not localize
    FUServ    := Values['UltimoServidor']; // do not localize
    
    if (rbNoutra.Checked and SameText(FServidor, 'auto')) or rbNesta.Checked then // do not localize
      edServidor.Text := SDetectarAutomaticamente else
      edServidor.Text := FServidor;

    edServidor.Enabled := rbNoutra.Checked;
  end;
end;

procedure TFrmNexLogin.rbNestaClick(Sender: TObject);
begin
  edServidor.Enabled := False;
end;

procedure TFrmNexLogin.rbNoutraClick(Sender: TObject);
begin
  edServidor.Enabled := True;
  if FShowing then
    edServidor.SetFocus;
end;

procedure TFrmNexLogin.RefreshConfig;
begin
end;

procedure TFrmNexLogin.SalvaConfig;
begin
  with slConfig do begin
    if rbNesta.Checked then
      Values['OutraMaq'] := 'N' else // do not localize
      Values['OutraMaq'] := 'S'; // do not localize
      
    Values['Servidor'] := FServidor; // do not localize
    Values['Usuario'] :=  FUsuario; // do not localize
    Values['UltimoServidor'] := FUServ; // do not localize
    SaveConfig;
  end;
end;

procedure TFrmNexLogin.TimerAutoLogin(Sender: TObject);
begin
  Sender.Free;
  DoLogin(True);
end;

procedure TFrmNexLogin.TimerLogoff(Sender: TObject);
begin
  try
    ForceForegroundWindow(Handle);
  finally
    Sender.Free;
  end;
end;

initialization
  FrmNexLogin := nil;

end.


