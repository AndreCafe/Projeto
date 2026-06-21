unit uFrmRegistro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxControls, cxInplaceContainer,
  cxVGrid, cxDBVGrid, dxBar, dxBarExtItems, cxLookAndFeelPainters,
  cxContainer, cxTextEdit, cxMaskEdit, cxButtonEdit, StdCtrls, cxButtons,
  cxPC, ExtCtrls, cxGroupBox, cxRadioGroup, cxLabel, cxSpinEdit, cxMemo,
  cxDBEdit, uLicenca, kbmMemTable, kbmMemBinaryStreamFormat, DB,
  kbmMWHTTPStdTransStream,
  kbmMWCustomConnectionPool, kbmMWClientDataset, kbmMWCustomTransport,
  kbmMWClient, kbmMWTCPIPIndyTransport, Menus, kbmMWTCPIPIndyClientTransport;

type
  TFrmRegistro = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    Paginas: TcxPageControl;
    tsLicenca: TcxTabSheet;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    tsNaoLic: TcxTabSheet;
    cxStyle21: TcxStyle;
    rgRegistro: TcxRadioGroup;
    cxLabel4: TcxLabel;
    Panel1: TPanel;
    btnVoltar: TcxButton;
    btnAvancar: TcxButton;
    btnFechar: TcxButton;
    vgLic: TcxVerticalGrid;
    vgLicCodigo: TcxEditorRow;
    vgLicNumero: TcxEditorRow;
    vgLicTipo: TcxEditorRow;
    vgLicExpira: TcxEditorRow;
    vgLicMaq: TcxEditorRow;
    tsRegistro1: TcxTabSheet;
    vgCad1: TcxDBVerticalGrid;
    vgCad1Loja: TcxDBEditorRow;
    vgCad1Proprietario: TcxDBEditorRow;
    vgCad1Gerente: TcxDBEditorRow;
    cxLabel2: TcxLabel;
    rgNaoLic: TcxRadioGroup;
    cxLabel6: TcxLabel;
    lbOpReg1: TcxLabel;
    cxLabel5: TcxLabel;
    tsRegistro2: TcxTabSheet;
    tsRegistro3: TcxTabSheet;
    vgCad1TipoLoja: TcxDBEditorRow;
    vgCad2: TcxDBVerticalGrid;
    vgCad2Pais: TcxDBEditorRow;
    vgCad2Cidade: TcxDBEditorRow;
    vgCad2UF: TcxDBEditorRow;
    vgCad2CEP: TcxDBEditorRow;
    vgCad2Endereco: TcxDBEditorRow;
    vgCad1NumMaq: TcxDBEditorRow;
    vgCad2Telefones: TcxDBEditorRow;
    cxLabel3: TcxLabel;
    lbOpReg2: TcxLabel;
    cxLabel8: TcxLabel;
    lbOpReg3: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    edSenha1: TcxDBTextEdit;
    tsRegistro4: TcxTabSheet;
    cxLabel16: TcxLabel;
    lbOpReg4: TcxLabel;
    cxGroupBox3: TcxGroupBox;
    edEmailTec: TcxDBMemo;
    cxLabel11: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    edEmailReg: TcxDBMemo;
    tsRegistro5: TcxTabSheet;
    lbRegConcluir: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel10: TcxLabel;
    lbSucesso: TcxLabel;
    edSenha2: TcxTextEdit;
    tsDadosCad: TcxTabSheet;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    edSenha: TcxTextEdit;
    tsAlteraLic1: TcxTabSheet;
    tsAlteraLic2: TcxTabSheet;
    tsAlteraLic3: TcxTabSheet;
    edSenhaLj: TcxTextEdit;
    lbSenha: TcxLabel;
    lbTransf: TcxLabel;
    rgOutroHD: TcxRadioGroup;
    cxLabel9: TcxLabel;
    vgLic2: TcxVerticalGrid;
    vgLic2Codigo: TcxEditorRow;
    vgLic2HD: TcxEditorRow;
    vgLic2Numero: TcxEditorRow;
    lbContato: TcxLabel;
    lbInstrucao: TcxLabel;
    lbCab: TcxLabel;
    vgLic1: TcxVerticalGrid;
    vgLic1Codigo: TcxEditorRow;
    vgLic1HD: TcxEditorRow;
    lbInstAlteraLic1: TcxLabel;
    cxLabel7: TcxLabel;
    mwClient: TkbmMWSimpleClient;
    TCPIP: TkbmMWTCPIPIndyClientTransport;
    CP: TkbmMWClientConnectionPool;
    mwSession: TkbmMWPooledSession;
    dsReg: TDataSource;
    mtReg: TkbmMemTable;
    mtRegCodigo: TIntegerField;
    mtRegSenha: TStringField;
    mtRegCadastroEm: TDateTimeField;
    mtRegCadastroPor: TStringField;
    mtRegAtualizadoEm: TDateTimeField;
    mtRegAtualizadoPor: TStringField;
    mtRegLoja: TStringField;
    mtRegRazaoSocial: TStringField;
    mtRegPais: TStringField;
    mtRegCidade: TStringField;
    mtRegUF: TStringField;
    mtRegEndereco: TMemoField;
    mtRegCEP: TStringField;
    mtRegBairro: TStringField;
    mtRegSerieHD: TStringField;
    mtRegNumMaq: TWordField;
    mtRegCNPJ: TStringField;
    mtRegIE: TStringField;
    mtRegObs: TMemoField;
    mtRegTelefones: TMemoField;
    mtRegEmailReg: TMemoField;
    mtRegFormaPagto: TMemoField;
    mtRegLicMaq: TWordField;
    mtRegLicTipo: TWordField;
    mtRegLicVenc: TDateField;
    mtRegManInicio: TDateField;
    mtRegManVenc: TDateField;
    mtRegProprietarios: TMemoField;
    mtRegGerente: TStringField;
    mtRegTipoLoja: TWordField;
    mtRegEmailTec: TMemoField;
    MTBSF: TkbmBinaryStreamFormat;
    lbExpirou: TcxLabel;
    panErro: TPanel;
    lbErro: TcxLabel;
    lbHost: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FLic : TLicenca;
    FEtapa : Integer;
    FResultado : String;
    FNumSerie : String;
    { Private declarations }
    procedure MostraLicenca;

    procedure Validar;
    procedure ValidaReg1;
    procedure ValidaReg2;
    procedure ValidaReg3;
    procedure ValidaReg4;
    procedure ValidaAlteraLic1;
    procedure ValidaAlteraLic2;
    procedure ValidaAlteraLic3;

    procedure AvancaLicenca;
    procedure AvancaNaoLic;
    procedure AvancaReg1;
    procedure AvancaReg2;
    procedure AvancaReg3;
    procedure AvancaReg4;
    procedure AvancaAlteraLic1;
    procedure AvancaAlteraLic2;
    procedure AvancaAlteraLic3;
    
    procedure AvancaConcluir;
    procedure AvancaDadosCad;

    procedure TelaInicialLicenca;
    
    procedure SetEtapa(const Value: Integer);

    function Request(AFunc: string; Args: Array of Variant): Variant;
  public
    function EditaLicenca(ALicStr: String; aMostraErro: Boolean): String;

    property Etapa: Integer
      read FEtapa write SetEtapa;
    { Public declarations }
  end;

const
  etLicenca     = 0;
  etNaoLic      = 1;
  etDadosCad    = 2;
  etReg1        = 3;
  etReg2        = 4;
  etReg3        = 5;
  etReg4        = 6;
  etRegConcluir = 7;
  etAlteraLic1  = 8;
  etAlteraLic2  = 9;
  etAlteraLic3  = 10;
  

var
  FrmRegistro: TFrmRegistro;
  hostreg    : String = 'joaoborges.dyndns.org';

implementation

{$R *.dfm}

function TFrmRegistro.Request(AFunc: string; Args: array of Variant): Variant;
begin
  try
    TCPIP.Active := True;
    Result := mwClient.Request('REGISTRO', '1.00', AFunc, Args);
  except
    On E: Exception do begin
      lbErro.Caption := AFUNC + '=' + E.Message;
      Raise;
    end; 
  end;   
end;

procedure TFrmRegistro.FormShow(Sender: TObject);
begin
  mtReg.Insert;
  mtRegPais.Value := 'Brasil';
  mtRegTipoLoja.Value := 0;
  vgCad1.FocusedRow := vgCad1Loja;
  vgCad1TipoLoja.Visible := not ControlX;
  TelaInicialLicenca;
end;

procedure TFrmRegistro.btnVoltarClick(Sender: TObject);
begin
  Etapa := Paginas.ActivePage.Tag;
end;

procedure TFrmRegistro.MostraLicenca;
begin
  with FLic do begin
    vgLicCodigo.Properties.Value := CodLojaAsString;
    vgLicNumero.Properties.Value := Copy(AsString, 1, 19);
    vgLicTipo.Properties.Value := TipoStr; 
    if liTipo=tlDefinitiva then 
      vgLicExpira.Properties.Value := 'Nunca'
    else  
      vgLicExpira.Properties.Value := FormatDateTime('dd/mm/yyyy', liVencimento);
    vgLicMaq.Properties.Value := liMaquinas;
  end;  
end;

procedure TFrmRegistro.AvancaLicenca;
begin
  case rgRegistro.ItemIndex of
    0 : Close;
    1 : Etapa := etAlteraLic1;
    2 : Etapa := etDadosCad; 
  end;  
end;

procedure TFrmRegistro.AvancaNaoLic;
begin
  case rgNaoLic.ItemIndex of
    0 : Close;
    1 : Etapa := etReg1;
    2 : Etapa := etAlteraLic1;
  end; 
end;

procedure TFrmRegistro.AvancaReg1;
begin
  Etapa := etReg2;
end;

procedure TFrmRegistro.AvancaReg2;
begin
  Etapa := etReg3;   
end;

procedure TFrmRegistro.AvancaReg3;
begin
  Etapa := etReg4;   
end;

procedure TFrmRegistro.AvancaReg4;
begin
  Etapa := etRegConcluir;
end;

procedure TFrmRegistro.AvancaConcluir;
var V : Variant;
begin
  if not (mtReg.State in [dsEdit, dsInsert]) then mtReg.Edit;
  mtReg.FieldByName('SerieHD').Value := FNumSerie;
    
  mtReg.Post;
  try
    V := mtReg.AllData;
    if FLic.SenhaOk then begin
      V := Request('ATUALIZACADASTRO', [mtReg.FieldByName('Codigo').AsInteger, edSenha.Text, V]);
      if V[0]<>'OK' then
        Raise Exception.Create(V[0]);
    end else begin  
      V := Request('OBTEMLICENCATESTE', [V]);
      if V[0]<>'OK' then
        Raise Exception.Create(V[0]);
      FLic.AsString := V[1];
    end;  
    FResultado := FLic.AsString;
    MostraLicenca;
    Etapa := etLicenca;
  except
    on E: Exception do begin
      lbErro.Caption := E.Message;
      mtReg.Edit;
      Raise;
    end;  
  end;    
end;

procedure TFrmRegistro.SetEtapa(const Value: Integer);
var I : Integer;
begin
  if Value=FEtapa then Exit;
  
  if (FEtapa>=0) and (FEtapa<Value) then 
    Paginas.Pages[Value].Tag := FEtapa;

  lbSucesso.Visible := (FEtapa=etRegConcluir) and (Value=etLicenca);

  if (Value=etAlteraLic1) and (FEtapa in [etLicenca, etNaoLic]) then
  begin
    vgLic1HD.Properties.Value := FNumSerie;
    vgLic2HD.Properties.Value := FNumSerie;
    if FLic.liCodLoja>0 then
      vgLic1Codigo.Properties.Value := FLic.CodLojaAsString else
      vgLic1Codigo.Properties.Value := '';
                       
    if FLic.SenhaOk then
      vgLic2Numero.Properties.Value := Copy(FLic.AsString, 1, 19) else
      vgLic2Numero.Properties.Value := '';  
  end;

  FEtapa := Value;
  for I := 0 to Paginas.PageCount-1 do 
    Paginas.Pages[I].TabVisible := (I=FEtapa);

  Paginas.ActivePageIndex := FEtapa;

  case FEtapa of
    etLicenca : begin
      MostraLicenca;
      lbOpReg1.Caption := 'Exibindo / Alterando os Dados Cadastrais da Loja';
      lbOpReg2.Caption := lbOpReg1.Caption;
      lbOpReg3.Caption := lbOpReg1.Caption;
      lbOpReg4.Caption := lbOpReg1.Caption;
    end;
    etNaoLic : begin
      if controlx then
        lbOpReg1.Caption := 'Registrando o Control-X para Teste Gratuito'
      else  
        lbOpReg1.Caption := 'Registrando o Cyber Manager para Teste Gratuito';
      lbOpReg2.Caption := lbOpReg1.Caption;
      lbOpReg3.Caption := lbOpReg1.Caption;
      lbOpReg4.Caption := lbOpReg1.Caption;
    end;
    etReg1 : begin
      vgCad1.SetFocus;
      vgCad1.FocusedRow := vgCad1Loja;
    end;
    etReg2 : begin
      vgCad2.SetFocus;
      vgCad2.FocusedRow := vgCad2Pais;
    end;  
    etReg3 : edSenha1.SetFocus;
    etReg4 : edEmailReg.SetFocus;
    etAlteraLic1 : begin
      vgLic1.FocusedRow := vgLic1HD;
      vgLic1.FocusedRow := vgLic1Codigo;
      vgLic1.SetFocus;
    end;
    etAlteraLic2 : begin
      vgLic2Codigo.Properties.Value := vgLic1Codigo.Properties.Value;
      vgLic2.FocusedRow := vgLic2Numero;
      vgLic2.SetFocus;
    end;
  end;  

  btnVoltar.Visible := ((ControlX and (FEtapa>etAlteraLic1)) or (not ControlX and (FEtapa>1))) and 
                       (Paginas.ActivePage.Tag>=0);
  btnAvancar.Visible := True;
end;

procedure TFrmRegistro.ValidaReg1;
begin
  if (vgCad1Loja.Properties.Value='') or (vgCad1Loja.Properties.Value=Null) then begin
    vgCad1.FocusedRow := vgCad1Loja;
    vgCad1.SetFocus;
    Raise Exception.Create('O nome da loja deve ser informado');
  end;
  if vgCad1NumMaq.Properties.Value < 1 then begin
    vgCad1.FocusedRow := vgCad1NumMaq;
    vgCad1.SetFocus;
    Raise Exception.Create('O número de máquinas não pode ser menor que 1');
  end;
  if (vgCad1Proprietario.Properties.Value='') or (vgCad1Proprietario.Properties.Value=Null) then begin
    vgCad1.FocusedRow := vgCad1Proprietario;
    vgCad1.SetFocus;
    Raise Exception.Create('O nome do proprietário deve ser informado');
  end;
end;

procedure TFrmRegistro.ValidaReg2;
begin
  if (vgCad2Cidade.Properties.Value='') or (vgCad2Cidade.Properties.Value=Null) then begin
    vgCad2.FocusedRow := vgCad2Cidade;
    vgCad2.SetFocus;
    Raise Exception.Create('O nome da Cidade deve ser informado');
  end;
end;

procedure TFrmRegistro.ValidaReg3;
begin
  if edSenha1.Text <> edSenha2.Text then
    Raise Exception.Create('As senhas informadas não são iguais');      
end;

procedure TFrmRegistro.ValidaReg4;
begin
  if edEmailReg.Lines.Text='' then
    Raise Exception.Create('É necessário informar um E-mail para envio das informações de registro');
end;

procedure TFrmRegistro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRegistro.Validar;
begin
  case FEtapa of
    etReg1 : ValidaReg1;
    etReg2 : ValidaReg2;
    etReg3 : ValidaReg3;
    etReg4 : ValidaReg4;
    etAlteraLic1 : ValidaAlteraLic1;
    etAlteraLic2 : ValidaAlteraLic2;
    etAlteraLic3 : ValidaAlteraLic3;
  end;  
end;

procedure TFrmRegistro.btnAvancarClick(Sender: TObject);
begin
  Validar;
  case Etapa of
    etLicenca     : AvancaLicenca;
    etNaoLic      : AvancaNaoLic;
    etDadosCad    : AvancaDadosCad;
    etReg1        : AvancaReg1;
    etReg2        : AvancaReg2;
    etReg3        : AvancaReg3;
    etReg4        : AvancaReg4;
    etRegConcluir : AvancaConcluir;
    etAlteraLic1  : AvancaAlteraLic1;
    etAlteraLic2  : AvancaAlteraLic2;
    etAlteraLic3  : AvancaAlteraLic3;
  end;
end;

procedure TFrmRegistro.FormCreate(Sender: TObject);
var 
  ProxyIP : String;
  ProxyPort: Integer;
begin                               
  if ControlX then begin
    lbInstAlteraLic1.Caption := 
      'Caso você ainda não o possua ou o tenha perdido, entre em contato com a Autocom para obtê-lo.'+
      sLineBreak+sLineBreak+
      'Telefone: (16) 9131-8891'+sLineBreak+
      'Messenger: controlx1@ibest.com.br';
    lbInstrucao.Caption := 
      'Digite o seu número de licença e clique em avançar.'+
      ' Caso você ainda não o possua ou o tenha perdido, entre '+
      'em contato com a Autocom para obtê-lo.';
    lbContato.Caption := 'Telefone: (16) 9131-8891'+sLineBreak+'Messenger: controlx1@ibest.com.br';
  end;
  
  Paginas.HideTabs := True;
  FEtapa := -1;
  if ObtemProxy(ProxyIP, ProxyPort) then begin
    TCPIP.Port := ProxyPort;
    TCPIP.Host := ProxyIP;
    TCPIP.Params.Values['KBMMWHTTPPOSTURL'] := 'http://'+hostreg+':3001';
    TCPIP.StreamFormat := 'HTTP';
    lbHost.Caption := 'ProxyIP = ' + ProxyIP + ' Porta = ' + IntToStr(ProxyPort) + ' Params = ' + TCPIP.Params.Text;
  end else begin
    TCPIP.Host := HostReg;
    lbHost.Caption := 'Sem Proxy';
  end;  
end;

procedure TFrmRegistro.AvancaDadosCad;
var V: Variant;
begin
  V := Request('OBTEMCADASTRO', [FLic.liCodLoja, edSenha.Text]);
  if V[0] = 'OK' then begin
    mtReg.AllData := V[1];
    mtReg.Active := True;
    edSenha2.Text := edSenha1.Text;
  end else
    Raise Exception.Create(V[0]);
  
  Etapa := etReg1;
end;

procedure TFrmRegistro.AvancaAlteraLic1;
var 
  V: Variant;
begin
  try
    V := Request('OBTEMLICENCA', [StrToCodLoja(vgLic1Codigo.Properties.Value)]);
  except
    Etapa := etAlteraLic2;
    Exit;
  end;
      
  if V[0] = 'OK' then begin
    FLic.AsString := V[1];
    FResultado := FLic.AsString;
    if FNumSerie <> FLic.liSerialHD then begin
      FLic.liSerialHD := FNumSerie;
      Etapa := etAlteraLic3
    end else begin 
      TelaInicialLicenca;
      lbSucesso.Caption := 'Licença atualizada com sucesso!';
    end;  
  end else
    Raise Exception.Create(V[0]);
end;

procedure TFrmRegistro.AvancaAlteraLic2;
begin
  lbSucesso.Caption := 'Licença atualizada com sucesso!';
  TelaInicialLicenca;
end;

procedure TFrmRegistro.AvancaAlteraLic3;
begin
  Etapa := etLicenca;
  TelaInicialLicenca;
end;

procedure TFrmRegistro.ValidaAlteraLic1;
begin
  if StrToCodLoja(vgLic1Codigo.Properties.Value)=0 then begin
    vgLic1.SetFocus;
    vgLic1.FocusedRow := vgLic1Codigo;
    Raise Exception.Create('O Código da Loja informado não está correto');
  end;  
end;

procedure TFrmRegistro.ValidaAlteraLic2;
var L : TLicenca;
begin
  L.liSerialHD := FNumSerie;
  L.liCodLoja := StrToCodLoja(vgLic1Codigo.Properties.Value);
  L.AsStringSemHD := vgLic2Numero.Properties.Value;
  if L.SenhaOk then begin
    FLic.AsString := L.AsString;
    FResultado := FLic.AsString;
  end else 
    Raise Exception.Create('O número de licença informado não é válido');  
end;

procedure TFrmRegistro.ValidaAlteraLic3;
var 
  L : TLicenca;
  V : Variant;
begin
  if rgOutroHD.ItemIndex = 1then begin
    L.AsString := FLic.AsString;
    L.liCodLoja := StrToCodLoja(vgLic1Codigo.Properties.Value);
    try
      V := Request('TROCAHD', [L.liCodLoja, edSenhaLj.Text, FNumSerie]);
    except
      Raise Exception.Create('Falha de comunicação com servidor de registro da Cybermgr.com');
    end;
      
    if V[0] = 'OK' then begin
      FLic.AsString := V[1];
      FResultado := FLic.AsString;
    end else
      Raise Exception.Create(V[0]);  

    lbSucesso.Caption := 'Licença atualizada com sucesso!';
  end;    
end;

function TFrmRegistro.EditaLicenca(ALicStr: String; aMostraErro: Boolean): String;
begin
  panErro.Visible := aMostraErro;
  if aMostraErro then begin
    Self.BorderStyle := bsSizeable;
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
  end;
  FResultado := ALicStr;
  FLic.AsString := ALicStr;
  FNumSerie := FLic.liSerialHD;
  ShowModal;
  Result := FResultado;
end;

procedure TFrmRegistro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRegistro.TelaInicialLicenca;
begin
  if ControlX then begin
    if FEtapa=etAlteraLic2 then
      Close
    else begin  
      FEtapa := etLicenca;
      Etapa := etAlteraLic1
    end;  
  end else  
  if FLic.Expirou then begin
    lbExpirou.Visible := True;
    lbExpirou.Caption := 'Sua licença de uso temporária expirou em ' + FormatDateTime('dd/mm/yyyy', FLic.liVencimento);
    Etapa := etNaoLic;
  end else  
  if not FLic.SenhaOk then begin
    lbExpirou.Visible := False;
    Etapa := etNaoLic;
  end else
    Etapa := etLicenca;
end;

initialization
  if ControlX then HostReg := 'controlx.ath.cx';

end.
