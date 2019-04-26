unit uFrmLojaNex;

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxMemo,
  cxLabel, cxContainer, cxEdit, cxTextEdit, LMDPNGImage, ExtCtrls, cxPC,
  cxControls, ncServAtualizaLic, cxMaskEdit, cxRadioGroup, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  kbmMemTable, cxCheckBox, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  uRSAss, cxLookAndFeels;

type
  TFrmLojaNex = class(TForm)
    Paginas: TcxPageControl;
    tsSenha: TcxTabSheet;
    tsOqueE: TcxTabSheet;
    tsComprar: TcxTabSheet;
    meOqueE: TcxMemo;
    panBotoes: TLMDSimplePanel;
    btnCancelarOquee: TcxButton;
    btnComprar: TcxButton;
    tsConectar: TcxTabSheet;
    cxLabel2: TcxLabel;
    Image2: TImage;
    LMDSimplePanel1: TLMDSimplePanel;
    btnTentarNovamente: TcxButton;
    lbConectar: TcxLabel;
    edSenha: TcxTextEdit;
    lbEsqueciSenha: TcxLabel;
    imSenha: TImage;
    cxLabel4: TcxLabel;
    panBotoesSenha: TLMDSimplePanel;
    btnAvancarSenha: TcxButton;
    btnVoltarSenha: TcxButton;
    btnCancelarSenha: TcxButton;
    pgComprar: TcxPageControl;
    tsDados: TcxTabSheet;
    tsConfirmar: TcxTabSheet;
    LMDSimplePanel4: TLMDSimplePanel;
    btnAvancarDados: TcxButton;
    btnVoltarDados: TcxButton;
    btnCancelarDados: TcxButton;
    LMDSimplePanel5: TLMDSimplePanel;
    btnConfirmar: TcxButton;
    btnVoltarConfirmar: TcxButton;
    btnCancelarConfirmar: TcxButton;
    edNomeRazao: TcxMaskEdit;
    Label4: TLabel;
    Label1: TLabel;
    edEndereco: TcxMaskEdit;
    edUF: TcxMaskEdit;
    Label6: TLabel;
    edCidade: TcxMaskEdit;
    Label5: TLabel;
    Label2: TLabel;
    edCPF: TcxMaskEdit;
    edTel1: TcxMaskEdit;
    Label3: TLabel;
    edTel2: TcxMaskEdit;
    edTel3: TcxMaskEdit;
    cxLabel5: TcxLabel;
    edTel4: TcxMaskEdit;
    cxEditStyleController1: TcxEditStyleController;
    rbComprar: TcxRadioButton;
    tsEscolher: TcxTabSheet;
    cxLabel1: TcxLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    btnAvancarAss: TcxButton;
    btnVoltarAss: TcxButton;
    btnCancelarAss: TcxButton;
    cxLabel7: TcxLabel;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    VColumn1: TcxGridDBColumn;
    cxLabel8: TcxLabel;
    cbCientePrazo: TcxCheckBox;
    cbCienteTelefones: TcxCheckBox;
    MT: TkbmMemTable;
    DS: TDataSource;
    MTDescr: TStringField;
    MTMeses: TIntegerField;
    MTValor: TCurrencyField;
    tsTermos: TcxTabSheet;
    meTermos: TcxMemo;
    cbTermos: TcxCheckBox;
    cxLabel6: TcxLabel;
    LMDSimplePanel6: TLMDSimplePanel;
    btnAvancarTermos: TcxButton;
    btnVoltarTermos: TcxButton;
    btnCancelarTermos: TcxButton;
    edSenhaComprar: TcxTextEdit;
    cxLabel9: TcxLabel;
    Image3: TImage;
    lbConta2: TcxLabel;
    lbConta: TcxLabel;
    edRGInscr: TcxMaskEdit;
    Label7: TLabel;
    edBairro: TcxMaskEdit;
    edCEP: TcxMaskEdit;
    Label8: TLabel;
    Label9: TLabel;
    btnCancelarConexao: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnComprarClick(Sender: TObject);
    procedure btnVoltarSenhaClick(Sender: TObject);
    procedure btnAvancarSenhaClick(Sender: TObject);
    procedure btnVoltarAssClick(Sender: TObject);
    procedure cbCientePrazoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAvancarAssClick(Sender: TObject);
    procedure pgComprarChange(Sender: TObject);
    procedure btnVoltarDadosClick(Sender: TObject);
    procedure btnAvancarDadosClick(Sender: TObject);
    procedure lbEsqueciSenhaClick(Sender: TObject);
    procedure btnVoltarConfirmarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnTentarNovamenteClick(Sender: TObject);
    procedure btnAvancarTermosClick(Sender: TObject);
    procedure cbTermosClick(Sender: TObject);
    procedure cbCienteTelefonesClick(Sender: TObject);
    procedure btnVoltarTermosClick(Sender: TObject);
  private
    dmLic : TdmAtualizaLic;
    FJaLeuDados   : Boolean;
    FAssinou      : Boolean;
    FBol          : TDadosBoleto;
    FDadosEmissao : TDadosEmissaoBol;
    { Private declarations }
    procedure OnTimerConectar(Sender: TObject);
  public
    function Assinar(var aBol: TDadosBoleto; var aDadosEmissao: TDadosEmissaoBol): Boolean;
    { Public declarations }
  end;

var
  FrmLojaNex: TFrmLojaNex;

implementation

uses uLicEXECryptor, ncsFrmRecuperaReg;


{$R *.dfm}

function TFrmLojaNex.Assinar(var aBol: TDadosBoleto; var aDadosEmissao: TDadosEmissaoBol): Boolean;
begin
  FAssinou := False;
  ShowModal;
  if FAssinou then begin
    Result := True;
    Move(FDadosEmissao, aDadosEmissao, SizeOf(FDadosEmissao));
    Move(FBol, aBol, SizeOf(FBol));
  end else
    Result := False;
end;

procedure TFrmLojaNex.btnAvancarAssClick(Sender: TObject);
begin
  if not cbCientePrazo.Checked then begin
    Beep;
    ShowMessage('Para continuar com a compra é necessário marcar a opção "Estou ciente do prazo de ativação da minha assinatura"');
    Exit;
  end;
  tsDados.Enabled := True;
  pgComprar.ActivePage := tsDados;
end;

procedure TFrmLojaNex.btnAvancarDadosClick(Sender: TObject);
begin
  if not cbCienteTelefones.Checked then begin
    Beep;
    ShowMessage('É necessário estar ciente sobre os telefones de contato');
    Exit;
  end;

  if (Trim(edNomeRazao.Text)='') or
     (Trim(edCPF.Text)='') or
     (Trim(edEndereco.Text)='') or
     (Trim(edCidade.Text)='') or
     (Trim(edUF.Text)='') then 
  begin
    Beep;
    ShowMessage('Todos os dados são obrigatórios para realizar a compra da assinatura.');
    Exit;
  end;

  if (Trim(edTel1.Text)='') and
     (Trim(edTel2.Text)='') and
     (Trim(edTel3.Text)='') and
     (Trim(edTel4.Text)='') then
  begin
    Beep;
    ShowMessage('É necessário informar ao menos um telefone de contato');
    Exit;
  end;

  if tsTermos.TabVisible then begin
    tsTermos.Enabled := True;
    pgComprar.ActivePage := tsTermos;
  end
  else begin
    tsConfirmar.Enabled := True;
    pgComprar.ActivePage := tsConfirmar;
  end;
end;

procedure TFrmLojaNex.btnAvancarSenhaClick(Sender: TObject);
var SL: TStrings;
begin
  SL := TStringList.Create;
  try
    SL.Text := dmLic.ObtemDadosCobranca(lbConta.Caption, edSenha.Text);
    if not FJaLeudados then begin
      FJaLeuDados := True;
      edNomeRazao.Text := SL.Values['RazaoSocial'];
      edCPF.Text := SL.Values['CNPJ'];
      edRGInscr.Text := SL.Values['IE'];
      edEndereco.Text := SL.Values['Endereco'];
      edBairro.Text := SL.Values['Bairro'];
      edCEP.Text := SL.Values['CEP'];
      edCidade.Text := SL.Values['Cidade'];
      edUF.Text := SL.Values['UF'];
      edTel1.Text := SL.Values['Tel1'];
      edTel2.Text := SL.Values['Tel2'];
      edTel3.Text := SL.Values['Tel3'];
      edTel4.Text := SL.Values['Tel4'];
    end;
  finally
    SL.Free;
  end;
  
  Paginas.ActivePage := tsComprar;
  pgComprar.ActivePage := tsEscolher;
end;

procedure TFrmLojaNex.btnAvancarTermosClick(Sender: TObject);
begin
  if not cbTermos.Checked then begin
    Beep;
    ShowMessage('É necessário estar de acordo com os termos de uso do serviço');
    Exit;
  end;

  tsConfirmar.Enabled := True;
  pgComprar.ActivePage := tsConfirmar;
end;

procedure TFrmLojaNex.btnComprarClick(Sender: TObject);
begin
  Paginas.ActivePage := tsSenha;
end;

procedure TFrmLojaNex.btnConfirmarClick(Sender: TObject);
var SL : TStrings;
begin
  SL := TStringList.Create;
  try
    SL.Values['RazaoSocial'] := edNomeRazao.Text;
    SL.Values['CNPJ'] := edCPF.Text;
    SL.Values['IE'] := edRGInscr.Text;
    SL.Values['Endereco'] := edEndereco.Text;
    SL.Values['Bairro'] := edBairro.Text;
    SL.Values['CEP'] := edCEP.Text;
    SL.Values['Cidade'] := edCidade.Text;
    SL.Values['UF'] := edUF.Text;
    SL.Values['Tel1'] := edTel1.Text;
    SL.Values['Tel2'] := edTel2.Text;
    SL.Values['Tel3'] := edTel3.Text;
    SL.Values['Tel4'] := edTel4.Text;

    dmLic.Assinar(lbConta.Caption, edSenhaComprar.Text, MTMeses.Value, SL.Text, FDadosEmissao, FBol);
    FAssinou := True;
    Close;
finally
    SL.Free;
  end;
end;

procedure TFrmLojaNex.btnTentarNovamenteClick(Sender: TObject);
begin
  with TTimer.Create(Self) do begin
    btnCancelarConexao.Enabled := False;
    btnTentarNovamente.Enabled := False;
  
    lbConectar.Style.TextColor := clBlack;
    lbConectar.Caption := 'Conectando ao serviço de assinaturas NexCafé. Aguarde ...';
    Interval := 1500;
    OnTimer := OnTimerConectar;
    Enabled := True;
  end;
end;

procedure TFrmLojaNex.btnVoltarAssClick(Sender: TObject);
begin
  Paginas.ActivePage := tsOquee;
  tsDados.Enabled := False;
  tsTermos.Enabled := False;
  tsConfirmar.Enabled := False;
  cbCientePrazo.Checked := False;
end;

procedure TFrmLojaNex.btnVoltarConfirmarClick(Sender: TObject);
begin
  if tsTermos.TabVisible then
    pgComprar.ActivePage := tsTermos else
    pgComprar.ActivePage := tsDados;
end;

procedure TFrmLojaNex.btnVoltarDadosClick(Sender: TObject);
begin
  pgComprar.ActivePage := tsEscolher;
end;

procedure TFrmLojaNex.btnVoltarSenhaClick(Sender: TObject);
begin
  Paginas.ActivePage := tsOquee;
end;

procedure TFrmLojaNex.btnVoltarTermosClick(Sender: TObject);
begin
  pgComprar.ActivePage := tsDados;
end;

procedure TFrmLojaNex.cbCientePrazoClick(Sender: TObject);
begin
  tsTermos.Enabled := False;
  tsDados.Enabled := False;
  tsConfirmar.Enabled := False;
end;

procedure TFrmLojaNex.cbCienteTelefonesClick(Sender: TObject);
begin
  tsTermos.Enabled := False;
  tsConfirmar.Enabled := False;
end;

procedure TFrmLojaNex.cbTermosClick(Sender: TObject);
begin
  tsConfirmar.Enabled := False;
end;

procedure TFrmLojaNex.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmLojaNex.FormCreate(Sender: TObject);
begin
  FAssinou := False;
  FJaLeuDados := False;
  lbConta.Caption := RegistroGlobal.Conta;
  lbConta2.Caption := RegistroGlobal.Conta;
  Paginas.HideTabs := True;
  Paginas.ActivePage := tsConectar;
  dmLic := TdmAtualizaLic.Create(Self);
end;

procedure TFrmLojaNex.FormShow(Sender: TObject);
begin
  with TTimer.Create(Self) do begin
    Interval := 3000;
    OnTimer := OnTimerConectar;
    Enabled := True;
  end;
end;

procedure TFrmLojaNex.lbEsqueciSenhaClick(Sender: TObject);
var S: String;
begin
  S := dmLic.ObtemSenha(RegistroGlobal.Conta);
  if S>'' then begin
    ShowMessage('A senha da sua conta foi enviada para o e-mail: '+sLineBreak+sLineBreak+S);
    ShowMessage('Confira sua caixa de SPAM ou Lixo Eletrônico');
  end else  
    raise ENexCafe.create('Não foi possível enviar a senha para o seu e-mail. Faça contato com o suporte técnico da Nextar');
end;

procedure TFrmLojaNex.OnTimerConectar(Sender: TObject);
var
  sOquee, sTermos : String;
  A : TArrayAssinatura;
  I : Integer;
begin
  Sender.Free;
  try
    dmLic.ObtemParamAss(sOquee, sTermos, A);
    meOquee.Text := sOquee;
    meTermos.Text := sTermos;
    MT.EmptyTable;
    for I := 0 to High(A) do begin
      MT.Append;
      MTDescr.Value := A[I].prDescr + ' - ' + FloatToStrF(A[I].prValor, ffCurrency, 10, 2);
      MTMeses.Value := A[I].prMeses;
      MTValor.Value := A[I].prValor;
      MT.Post;
    end;

    MT.First;

    tsTermos.TabVisible := (Trim(sTermos)>'');
    if not tsTermos.TabVisible then
      tsConfirmar.Caption := '3. Confirmar a compra';
    
    Paginas.ActivePage := tsOquee;
  except
    on E: ENexCafe do begin
      Beep;
      lbConectar.Caption := 'Falha de conexão com o serviço de assinaturas NexCafé. '+
                            'Por favor faça contato conosco através da opção "Atendimento Online" '+
                            'do site: www.nexcafe.com.br' + sLineBreak + sLineBreak +
                            E.Message;
      lbConectar.Style.TextColor := clRed;
      btnCancelarConexao.Enabled := True;
      btnTentarNovamente.Enabled := True;
    end;
  end;
end;

procedure TFrmLojaNex.pgComprarChange(Sender: TObject);
begin
  if pgComprar.ActivePage = tsDados then begin
    if Trim(edNomeRazao.Text)='' then
      edNomeRazao.SetFocus;
  end else
  if pgComprar.ActivePage = tsConfirmar then begin
    rbComprar.Caption := 'Comprar ' + MTDescr.Value;
    edSenhaComprar.SetFocus;
  end;
  
end;

end.
