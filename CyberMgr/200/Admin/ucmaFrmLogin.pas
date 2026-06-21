unit ucmaFrmLogin;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons,Dialogs, DBCtrls, Db,
  ExtCtrls, lmdcctrl, lmdctrl, LMDCustomControl, LMDCustomPanel, 
  LMDCustomBevelPanel,
  LMDSimplePanel, LMDCustomComponent, LMDIniCtrl, jpeg, uLicenca,
  LMDCustomHint, LMDCustomShapeHint, LMDMessageHint, LMDShapeHint,
  LMDApplicationCtrl, cxLookAndFeelPainters, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxImage;

type
  TFrmLogin = class(TForm)
    panServ: TLMDSimplePanel;
    Label5: TLabel;
    LMDSimplePanel6: TLMDSimplePanel;
    Label2: TLabel;
    Label1: TLabel;
    Reg: TLMDIniCtrl;
    Image1: TImage;
    MH: TLMDMessageHint;
    Timer1: TTimer;
    LMDApplicationCtrl1: TLMDApplicationCtrl;
    btnOk: TcxButton;
    btnCancelar: TcxButton;
    imLogo: TcxImage;
    edServidor: TcxTextEdit;
    edUsuario: TcxTextEdit;
    edSenha: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edUsuarioEnter(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edSenhaExit(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure LMDApplicationCtrl1Activate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses 
  CSCBase,
  CSCClient,
  cmClassesBase, 
  uCMDados,
  uCMFrmPri;

{$R *.DFM}

procedure TFrmLogin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmLogin := nil;
  Action:= caFree;
  if not Dados.CM.Ativo then 
    Application.Terminate
  else
    FrmPri.Caption := 'Cyber Manager | Usuário: '+Dados.CM.UA.Nome;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  FrmLogin := Self;
  with Reg do begin
    edServidor.Text := ReadString('', 'Servidor', 'localhost');
    edUsuario.Text := ReadString('', 'Usuario', 'admin');
  end;
end;

procedure TFrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and 
     (not btnOk.Focused) and 
     (not btnCancelar.Focused) then 
  begin
    SelectNext(ActiveControl as TWinControl, True, True);
    Key := #0;
  end;
end;

procedure TFrmLogin.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLogin.btnOkClick(Sender: TObject);
begin
  with Dados do begin
    CM.Username := edUsuario.Text;
    CM.Senha    := edSenha.Text;
    CM.Maquina  := 0;
    ServidorRemoto := True;
    ServRem.Host := edServidor.Text;
    CM.Servidor := ServRem;
    try
      CM.Ativo := True;
    except
      On E: ECSError do 
        case E.SocketError of
          10047,
          10065,
          10049 : begin
            Beep;
            MessageDlg( 'Você informou um endereço de servidor errado ou '+
                        'sua configuração de Rede está com problemas.'
                        +#13#10+#13+#10+
                        'Digite corretamente o nome da máquina ou endereço IP '+
                        'do servidor. Caso o problema persista certifique-se '+
                        'que as configurações de rede do seu computador estejam corretas.',
                        mtError, [mbOk], 0);
            edServidor.SetFocus;            
            Exit;             
          end;
          
          10061, 10064 : begin
            Beep;
            MessageDlg ('Você informou um endereço de servidor errado ou '+
                        'o Servidor Cyber Manager (CM-Server) ainda não foi '+
                        'ativado na máquina informada.'+#13#10+#13+#10+
                        'Certifique-se que o nome da máquina ou endereço IP '+
                        'do servidor digitado esteja correto e que o CM-Server'+
                        ' esteja ativado.',
                        mtError, [mbOk], 0);
            edServidor.SetFocus;            
            Exit;             
          end;
        else
          edServidor.SetFocus;
          Raise;
        end;  
      On E: Exception do 
        begin
          if (Pos('11001', E.Message)>0) or (Pos('11004', E.Message)>0) then begin
            Beep;
            MessageDlg ('Provavelmente você informou um endereço de servidor errado. '+
                        'Algumas outras possíveis causas: ' + #13#10 +
                        '- Configuração de rede incorreta; ' + #13#10 + 
                        '- Cabo de rede desconectado ou defeituoso; ' + #13#10 + 
                        '- Equipamentos de rede (Hub, Switch, Placa de Rede) desligados ou defeituosos.' +
                        #13#10#13#10 +
                        'Digite corretamente o nome da máquina ou endereço IP '+
                        'do servidor. Caso o problema persista certifique-se '+
                        'que as configurações de rede do seu computador estejam corretas.',
                        mtError, [mbOk], 0);
            edServidor.SetFocus;            
            Exit;             
          end else begin
            edSenha.SetFocus;
            Raise;
          end;  
        end;
      else
        Raise;   
    end;         
            

    with Reg do begin
      WriteString('', 'Servidor', edServidor.Text);
      WriteString('', 'Usuario', edUsuario.Text);
    end;

    if LicencaGlobal.EmModoDemo then begin
      Beep;
      ShowMessage('O Cyber-Manager está sendo executado em modo Demonstração e estará limitado ao controle de duas máquinas.'); 
    end;    
    Close;  
  end;
end;

procedure TFrmLogin.edUsuarioEnter(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TFrmLogin.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if (ActiveControl<>nil) and (ActiveControl.Hint>'') then
    MH.ShowControlMessage(ActiveControl.Hint, ActiveControl);
end;

procedure TFrmLogin.edSenhaExit(Sender: TObject);
begin
  if FrmLogin=nil then Exit;
  MH.HideMessage;
end;

procedure TFrmLogin.FormDeactivate(Sender: TObject);
begin
  if FrmLogin=nil then Exit;
  MH.HideMessage;
end;

procedure TFrmLogin.LMDApplicationCtrl1Activate(Sender: TObject);
begin
  if FrmLogin=nil then Exit;
  Timer1.Enabled := True;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  if edServidor.Text = '' then
    edServidor.SetFocus
  else
  if edUsuario.Text = '' then
    edUsuario.SetFocus
  else
    edSenha.SetFocus;    
end;

initialization
  FrmLogin := nil;

end.

