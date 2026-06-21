unit ucmaLogin;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons,Dialogs, DBCtrls, Db,
  ExtCtrls, lmdcctrl, lmdctrl, LMDCustomControl, LMDCustomPanel, 
  LMDCustomBevelPanel,
  LMDSimplePanel, LMDCustomComponent, LMDIniCtrl, jpeg, 
  LMDCustomHint, LMDCustomShapeHint, LMDMessageHint, LMDShapeHint,
  LMDApplicationCtrl, cxLookAndFeelPainters, cxButtons, pngimage,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, Menus;

type
  TFrmLogin = class(TForm)
    Reg: TLMDIniCtrl;
    Panel1: TPanel;
    Bevel1: TBevel;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    edUsuario: TcxTextEdit;
    edSenha: TcxTextEdit;
    cxLabel3: TcxLabel;
    edServidor: TcxTextEdit;
    btnLogin: TcxButton;
    btnCancelar: TcxButton;
    LMDPanelFill1: TLMDPanelFill;
    Image1: TImage;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel6: TcxLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
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
  ucmaDm, ucmaPri;

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
  with Reg do begin
    edServidor.Text := ReadString('', 'Servidor', 'localhost');
    edUsuario.Text := ReadString('', 'Usuario', 'admin');
  end;
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

procedure TFrmLogin.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLogin.btnLoginClick(Sender: TObject);
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

    Close;  
  end;
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

