unit uCMFrmPri;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, 
  dxCntner, dxTL, 
  dxBar, dxDBTLCl, dxGrClms, dxDBCtrl, ExtCtrls,
  ComCtrls, 
  dxExEdtr, dxExGrEd, dxExELib, dxDBGrid, dxEdLib, dxDBEdtr,
  dxDBELib, 
  dxPSCore,
  dxPSdxTLLnk, dxPSdxDBGrLnk, dxPSStdGrLnk, Menus,
  dxPSdxDBCtrlLnk, dxsbar,
  dxTLClms, dxPSGlbl,
  
  uCMfbgAcessos,
  uCMFrmBaseGrid,
  uCMfbgPedidos,
  uCMfbgClientes,
  uCMfbgImpressoes,
  uCMfbgProdutos,
  uCMfbgUsuarios,
  uCMfbgGrupos,
  uCMfbgMaquinas,
  uCMfbgPacotes,
  uCMfbgCaixas,
  uCMfbgLancExtras,
  uCMFrmAguarde,
  
  dxBarExtItems, 
  LMDCustomComponent, 
  LMDCustomControl, 
  LMDCustomPanel, 
  LMDCustomBevelPanel, 
  LMDSimplePanel, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  LMDFormTabControl, dxPageControl, LMDFormDisplay, ppReport, ppSubRpt,
  ppCtrls, ppStrtch, ppMemo, ppVar, ppPrnabl, ppClass, ppBands, ppCache,
  ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, LMDContainerComponent,
  LMDBaseDialog, LMDAboutDlg, LMDVersionInfo, ImgList;
  

type

  TExp  = set of  (teExcel,teHTML,teTXT);
  TFrmPri = class(TForm)
    Bar: TdxBarManager;
    dxExibir: TdxBarSubItem;
    dxPrinter: TdxComponentPrinter;
    dlgExp: TSaveDialog;
    DPL: TdxDBGridReportLink;
    cmAjuda: TdxBarSubItem;
    cmSuporte: TdxBarButton;
    cmUsuarios: TdxBarButton;
    Timer1: TTimer;
    cmGrupos: TdxBarButton;
    Timer2: TTimer;
    LMDSimplePanel1: TLMDSimplePanel;
    Timer3: TTimer;
    Paginas: TdxPageControl;
    tsMaquinas: TdxTabSheet;
    tsAcessos: TdxTabSheet;
    fdMaquinas: TLMDFormDisplay;
    fdAcessos: TLMDFormDisplay;
    Timer4: TTimer;
    cmSubPacotes: TdxBarSubItem;
    cmVenderPac: TdxBarButton;
    cmCadastroPac: TdxBarButton;
    cmListaPacVendidos: TdxBarButton;
    cmClientesPac: TdxBarButton;
    cmSubCaixa: TdxBarSubItem;
    cmSubEstoque: TdxBarSubItem;
    cmEstoqueCompra: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    cmAjustaEntrada: TdxBarButton;
    cmAjustaSaida: TdxBarButton;
    cmListaMovEstoque: TdxBarButton;
    cmListaCaixas: TdxBarButton;
    cmSubLancExtras: TdxBarSubItem;
    cmLancarEntrada: TdxBarButton;
    cmLancarSaida: TdxBarButton;
    cmListaLancExtra: TdxBarButton;
    cmTotalMomento: TdxBarButton;
    cmTotalDia: TdxBarButton;
    cmTotalPeriodo: TdxBarButton;
    cmNovaMaq: TdxBarButton;
    cmFechar: TdxBarLargeButton;
    cmContatos: TdxBarLargeButton;
    cmConfig: TdxBarLargeButton;
    cmProdutos: TdxBarLargeButton;
    cmAcessos: TdxBarLargeButton;
    cmMaq: TdxBarLargeButton;
    cmVendaAvulsa: TdxBarLargeButton;
    cmCaixa: TdxBarLargeButton;
    cmExibir: TdxBarSubItem;
    cmEditarMaq: TdxBarLargeButton;
    cmLog: TdxBarButton;
    dxTabSheet1: TdxTabSheet;
    cmImpressoes: TdxBarLargeButton;
    fdImpressoes: TLMDFormDisplay;
    cmPrecos: TdxBarLargeButton;
    cmTempoAvulso: TdxBarButton;
    cmLicenca: TdxBarButton;
    cmVersao: TdxBarButton;
    AboutDlg: TLMDAboutDlg;
    VI: TLMDVersionInfo;
    Icones16: TImageList;
    procedure FormShow(Sender: TObject);
    procedure dxSenhaClick(Sender: TObject);
    procedure cmConfigClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmFimClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmSelecionaCamposClick(Sender: TObject);
    procedure cmExcelClick(Sender: TObject);
    procedure cmHTMLClick(Sender: TObject);
    procedure cmTXTClick(Sender: TObject);
    procedure gdProMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaginasChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure cmContatosClick(Sender: TObject);
    procedure cmFecharClick(Sender: TObject);
    procedure cmProdutosClick(Sender: TObject);
    procedure cmUsuariosClick(Sender: TObject);
    procedure cmGruposClick(Sender: TObject);
    procedure cmCadastroPacClick(Sender: TObject);
    procedure cmListaMovEstoqueClick(Sender: TObject);
    procedure cmVenderPacClick(Sender: TObject);
    procedure cmListaLancExtraClick(Sender: TObject);
    procedure cmListaCaixasClick(Sender: TObject);
    procedure cmListaPacVendidosClick(Sender: TObject);
    procedure cmClientesPacClick(Sender: TObject);
    procedure cmEstoqueCompraClick(Sender: TObject);
    procedure cmAjustaEntradaClick(Sender: TObject);
    procedure cmAjustaSaidaClick(Sender: TObject);
    procedure cmAcessosClick(Sender: TObject);
    procedure cmMaqClick(Sender: TObject);
    procedure cmTotalMomentoClick(Sender: TObject);
    procedure cmLancarEntradaClick(Sender: TObject);
    procedure cmLancarSaidaClick(Sender: TObject);
    procedure cmVendaAvulsaClick(Sender: TObject);
    procedure cmCaixaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmSubMaquinasClick(Sender: TObject);
    procedure cmLogClick(Sender: TObject);
    procedure cmImpressoesClick(Sender: TObject);
    procedure cmPrecosClick(Sender: TObject);
    procedure cmTempoAvulsoClick(Sender: TObject);
    procedure cmSuporteClick(Sender: TObject);
    procedure cmLicencaClick(Sender: TObject);
    procedure cmVersaoClick(Sender: TObject);
  private
    FrmMaquinas   : TfbgMaquinas;
    FrmImpressoes : TfbgImpressoes;
    FrmAguarde    : TFrmAguarde;
    FView         : Integer;
    FFirstShow    : Boolean;
    { Private declarations }
    procedure SetActiveView(Value: Integer);
    function GetFbg(V: Integer): TFrmBaseGrid;
    function GetFD(V: Integer): TLMDFormDisplay;
    function CriaFbg(V: Integer): TFrmBaseGrid;
    procedure AplicaConfigModulos;
  public
    FrmAcessos  : TfbgAcessos;
    procedure ConfigurarModulos;
  
    function AchaTelaME(Emissor, Num: Integer; Serie: String): TObject;
    function PrimeiroViewAtivo: Integer;

    procedure EditarME(Emissor: Integer; Serie: String; Num: Integer);

    property ActiveView: Integer
      read FView write SetActiveView;  

    function ActiveGrid: TdxDBGrid;

    procedure AtualizaDados(View: Integer);

    procedure LoadConfig;

    procedure ImprimirGrid(G: TdxDBGrid);
    procedure ExportarGrid(G: TdxDBGrid);

    procedure TentaConectar(Reconexao: Boolean);
    procedure RefreshCaixa;
    
    procedure AplicaDireitosUsuario;
    procedure EditaMaq;
  end;

const
  Key_Tab        = 9;
  Key_Ins        = 45;
  Key_Del        = 46;
  Key_Enter      = 13;
  Key_Up         = 38;
  Key_Down       = 40;
  Key_Esc        = 27;
  Key_CtrlN      = $310E;
  Key_F8         = $4200;
  Key_F9         = $4300;
  
  viMaq  = 0;
  viAce  = 1;
  viImp  = 2;

  ViewHigh = viImp;

   ViewSt : Array[0..ViewHigh] of String =
    ('Máquinas',
     'Transações',
     'Impressões');

   LongViewSt : Array[0..ViewHigh] of String =
    ('&Máquinas',
     '&Transações',
     '&Impressões');

   FormNames : Array[0..ViewHigh] of String = 
    ('fbgMaquinas',
     'fbgAcessos',
     'fbgImpressoes');

   // Estado do botão do cliente
   C_INCLUI = 0;
   C_COMBO  = 1;
   C_UNICO  = 2;

var
  IndToque : Integer;
  FrmPri : TFrmPri;

  // Caminho do programa
  Path       : String;
  
implementation

uses 
  uCMDados, 
  uCMFrmCredito,
  uCMFrmCliente,
  uCMFrmProduto, 
  uCMFrmME,
  uCMFrmLogin,
  uCMFrmMudaSenha,
  uCMFrmConfig, 
  uCMFrmPesqCli,
  uCMFrmUsuario, 
  uCMfbgLog,
  cmIDRecursos,
  cmClassesBase,
  dxGridMenus, 
  uCMFrmGrupo, uCMFrmVendaPac, uCMfbgPacVen, uCMFrmCaixa, uCMFrmLancExtra,
  uCMFrmRel, uCMfbgTipoTarifas, uCMFrmHoraCor, uCMFrmContato, uCMFrmChave;
  

{$R *.DFM}

procedure TFrmPri.LoadConfig;
begin
  with Dados do begin
    if tbConfig.RecordCount=0 then begin
      tbConfig.Append;
      tbConfig.Post;
    end; 
  end;  
end;

procedure TFrmPri.TentaConectar(Reconexao: Boolean);
begin
  with TFrmLogin.Create(Self) do
  ShowModal;

  Caption := 'Cyber Manager | CM-Admin | Usuário: ' + Dados.CM.UA.Nome;

  if not Dados.CM.Ativo then begin
    Application.Terminate;
    Exit;
  end;  

  if Permitido(reLogProgramas, taLOGVer) then
    cmLog.Visible := ivAlways
  else
    cmLog.Visible := ivNever;  

  Dados.AbreDB;
  LoadConfig;

end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
  if not FFirstShow then Exit;
  FFirstShow := False;
  TentaConectar(False);
  if not Dados.CM.Ativo then Exit;

  sdxPanelText := 'Arraste o cabeçalho da coluna para agrupar por esta coluna';

  ConfigurarModulos;
  FView := -1;
  WindowState := wsMaximized;

  AplicaDireitosUsuario;
end;

function TFrmPri.AchaTelaME(Emissor, Num: Integer; Serie: String): TObject;
begin
  Result := nil;
end;

procedure TFrmPri.EditarME(Emissor: Integer; Serie: String; Num: Integer);
var
  F : TFrmME;
begin
  F := TFrmME(AchaTelaME(0, Num, Dados.ObtemSerie('Pedido')));
  if F <> nil then
    F.Show
  else
  with TFrmME.Create(Self) do
    Editar(Emissor, Serie, Num);
end;

function TFrmPri.PrimeiroViewAtivo: Integer;
begin
  Result := 0;
end;

procedure TFrmPri.SetActiveView(Value: Integer);
begin
  if FView = Value then Exit;
  if (Value<0) or (Value>ViewHigh) then Exit;
  FView := Value;
  case FView of
    0 : cmMaq.Down := True;
    1 : cmAcessos.Down := True;
    2 : begin
      cmImpressoes.Down := True;
      FrmImpressoes.Timer1.Enabled := True;
    end;  
  end;  
  Paginas.ActivePageIndex := FView; 
  if (FView=1) and (FrmAcessos<>nil) then
    FrmAcessos.Timer1.Enabled := True;
end;

procedure TFrmPri.dxSenhaClick(Sender: TObject);
begin
  TFrmMudaSenha.Create(Self).ShowModal;
end;

procedure TFrmPri.cmConfigClick(Sender: TObject);
begin
  TFrmConfig.Create(Self).ShowModal;
end;

procedure TFrmPri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dados.mtUsuario.Active := False;
  Dados.mtMaquina.Active := False;
  dados.CM.Ativo := False;
  Fechando := True;
  
  dados.db.Connected:= false;
  dados.session.Active:= false;
  dados.servrem.Ativo := False;
end;

procedure TFrmPri.cmFimClick(Sender: TObject);
begin
  Dados.CM.Ativo := False;
  Dados.Session.Active := False;
  Close;
end;

function TFrmPri.GetFD(V: Integer): TLMDFormDisplay;
begin
  case V of
    viMaq : Result := fdMaquinas;
    viAce : Result := fdAcessos;
    viImp : Result := fdImpressoes;
  else
    Result := nil;  
  end;
end;

function TFrmPri.GetFbg(V: Integer): TFrmBaseGrid;
begin
  case V of
    viMaq : Result := FrmMaquinas;
    viAce : Result := FrmAcessos;
    viImp : Result := FrmImpressoes;
  else
    Result := nil;  
  end;
end;

function TFrmPri.CriaFbg(V: Integer): TFrmBaseGrid;
begin
  case V of
    viMaq : FrmMaquinas := TfbgMaquinas.Create(Self);
    viAce : FrmAcessos := TfbgAcessos.Create(Self);
    viImp : FrmImpressoes := TfbgImpressoes.Create(Self);
  end;
  Result := GetFbg(V);
end;

procedure TFrmPri.ConfigurarModulos;
begin
  FreeAndNil(FrmAguarde);
  FrmAguarde := TFrmAguarde.Create(Self);
  FrmAguarde.Show;
  Timer1.Enabled := True;
end;

procedure TFrmPri.AplicaConfigModulos;
var 
  I : Integer;
  Fbg : TFrmBaseGrid;
begin
  RefreshCaixa;
  try
    FrmAguarde.lbModulo.Caption := 'Criando módulos';
    FrmAguarde.lbModulo.Refresh;
    Application.ProcessMessages;
    Paginas.OnChange := nil;
    
    for I := 0 to ViewHigh do  begin
      FrmAguarde.lbModulo.Caption := 'Configurando ' + ViewSt[I] + ' ...';
      FrmAguarde.lbModulo.Refresh;
      FrmAguarde.PB.Position := I;
      Application.ProcessMessages;
      Fbg := GetFbg(I);
      if Fbg = nil then Fbg := CriaFbg(I);
      Fbg.Inicializar(True, FiltroNenhum, '');
      GetFD(I).AddForm(Fbg, True);
    end; 
  finally
    Paginas.OnChange := PaginasChange;
    FreeAndNil(FrmAguarde);
  end;  

  ActiveView := 0;
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  AboutDlg.Version := 'Versão: ' + VI.FileVersion;
  FFirstShow := True;
  FrmAguarde := nil;
  
  FrmAcessos    := nil;
  FrmMaquinas   := nil;
  FrmImpressoes := nil;
  FView := -1;
  
  Path:= Application.ExeName;
  while Path[Length(Path)]<>'\' do
      Delete(Path,Length(Path),1);
end;

procedure TFrmPri.ImprimirGrid(G: TdxDBGrid);
var Link: TdxDbGridReportLink;
begin
  Link:= dxPrinter.AddLink(G) as TDxDbGridReportLink;
  try
    Link.SupportedCustomDraw := True;
    if edgoPreview in G.OptionsView then
      Link.Options := Link.Options + [tlpoPreview] 
    else
      Link.Options := Link.Options - [tlpoPreview];
    Link.Preview(True);
  finally
    Link.Free;
  end;  
end;

procedure TFrmPri.cmSelecionaCamposClick(Sender: TObject);
begin
ActiveGrid.ColumnsCustomizing;
end;

procedure TFrmPri.ExportarGrid(G: TdxDBGrid);
const
  Exts: Array[1..3] of String = ('xls', 'htm', 'txt');
begin
  if Pos('.', dlgExp.FileName)>0 then
    dlgExp.FileName := Copy(dlgExp.FileName, 1, Pos('.', dlgExp.FileName)-1);

  if not (dlgExp.FilterIndex in [1..3]) then
    dlgExp.FilterIndex := 1;
    
  dlgExp.Execute;
  if dlgExp.FileName <> '' then begin
    if Pos('.', dlgExp.FileName)=0 then
      dlgExp.FileName := dlgExp.FileName + '.' + Exts[dlgExp.FilterIndex];
    case dlgExp.FilterIndex of
      1: G.SaveToXLS(dlgExp.FileName,True);
      2: G.SaveToHTML(dlgExp.FileName,True);
      3: G.SaveToText(dlgExp.FileName,True,'|','"','"');
    end;
  end;  
end;

procedure TFrmPri.cmExcelClick(Sender: TObject);
begin
  dlgExp.DefaultExt := '*.xls';
  dlgExp.FilterIndex:= 1;
  ExportarGrid(ActiveGrid);
end;

procedure TFrmPri.cmHTMLClick(Sender: TObject);
begin
  dlgExp.DefaultExt:= '*.htm';
  dlgExp.FilterIndex:= 2;
  ExportarGrid(ActiveGrid);
end;

procedure TFrmPri.cmTXTClick(Sender: TObject);
begin
  dlgExp.DefaultExt:= '*.txt';
  dlgExp.FilterIndex:= 3;
  ExportarGrid(ActiveGrid);
end;

procedure TFrmPri.AtualizaDados(View: Integer);
var Fbg : TFrmBaseGrid;
begin
  Fbg := GetFbg(View);
  if Fbg <> nil then Fbg.FiltraDados;
end;

function TFrmPri.ActiveGrid: TdxDBGrid;
begin
  case ActiveView of
    viMaq : Result := FrmMaquinas.Grid;
    viAce : Result := FrmAcessos.Grid;
    viImp : Result := FrmImpressoes.Grid;
  else
    Result := nil;  
  end;
end;

procedure TFrmPri.gdProMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button <> mbRight then exit;
  // show popup
  TdxDBGridPopupMenuManager.Instance.ShowGridPopupMenu(TdxDBGrid(Sender));
end;

procedure TFrmPri.PaginasChange(Sender: TObject);
begin
  ActiveView := Paginas.ActivePage.Tag;
end;

procedure TFrmPri.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  AplicaConfigModulos;
end;

procedure TFrmPri.Timer4Timer(Sender: TObject);
begin
  with Dados do
  if CM.Ativo and LicencaGlobal.Expirou then 
  begin
    Beep;
    ShowMessage('Prazo de uso do Cyber-Manager expirou!');
    Application.Terminate;
    Exit;
  end;
end;

procedure TFrmPri.cmContatosClick(Sender: TObject);
begin
  with TfbgClientes.Create(Self) do begin
    Inicializar(False, 0, 0);
    ShowModal;
    Free;
  end;  
end;

procedure TFrmPri.cmFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPri.cmProdutosClick(Sender: TObject);
begin
  with TfbgProdutos.Create(Self) do begin
    Inicializar(False, 0, 0);
    ShowModal;
    Free;
  end;  
end;

procedure TFrmPri.cmUsuariosClick(Sender: TObject);
begin
  with TfbgUsuarios.Create(Self) do begin
    Inicializar(False, 0, 0);
    ShowModal;
    Free;
  end;  
end;

procedure TFrmPri.cmGruposClick(Sender: TObject);
begin
  with TfbgGrupos.Create(Self) do begin
    Inicializar(False, 0, 0);
    ShowModal;
    Free;
  end;  
end;

procedure TFrmPri.cmCadastroPacClick(Sender: TObject);
begin
  with TfbgPacotes.Create(Self) do begin    
    Inicializar(False, FiltroNenhum, 0);
    ShowModal;
    Free;
  end;  
end;

procedure TFrmPri.cmListaMovEstoqueClick(Sender: TObject);
begin
  with TfbgPedidos.Create(Self) do begin
    Inicializar(False, FiltroNenhum, 0);
    ShowModal;
    Free;
  end;  
end;

procedure TFrmPri.cmVenderPacClick(Sender: TObject);
begin
  TFrmVendaPac.Create(Self).Novo(Dados.tbAcesso);
end;

procedure TFrmPri.cmListaLancExtraClick(Sender: TObject);
begin
  with TfbgLancExtras.Create(Self) do begin
    Inicializar(False, FiltroNenhum, 0);
    ShowModal;
    Free;
  end;
end;

procedure TFrmPri.cmListaCaixasClick(Sender: TObject);
begin
  with TfbgCaixas.Create(Self) do begin
    Inicializar(False, FiltroNenhum, 0);
    ShowModal;
    Free;
  end;  
end;

procedure TFrmPri.cmListaPacVendidosClick(Sender: TObject);
begin
  with TfbgPacVen.Create(Self) do begin
    Inicializar(False, FiltroNenhum, 0);
    ShowModal;
    Free;
  end;  
end;

procedure TFrmPri.RefreshCaixa;
begin
  if NumAberto > 0 then begin
    cmCaixa.Caption := 'Fechar Caixa';
    cmTotalMomento.Enabled := True;
    cmLancarEntrada.Enabled := Permitido(reLancExtras, taLEXCadastrar);
    cmLancarSaida.Enabled := cmLancarEntrada.Enabled;
    cmVendaAvulsa.Enabled := True;
    cmVenderPac.Enabled := True;
    cmTempoAvulso.Enabled := True;
  end else begin
    cmCaixa.Caption := 'Abrir Caixa';
    cmTotalMomento.Enabled := False;
    cmLancarEntrada.Enabled := False;
    cmLancarSaida.Enabled := False;
    cmVendaAvulsa.Enabled := False;
    cmVenderPac.Enabled := False;
    cmTempoAvulso.Enabled := False;
  end;  
end;

procedure TFrmPri.cmClientesPacClick(Sender: TObject);
begin
  with TfbgClientes.Create(Self) do begin
    Inicializar(False, 1, 0);
    ShowModal;
    Free;
  end;  
end;

procedure TFrmPri.cmEstoqueCompraClick(Sender: TObject);
begin
  TFrmME.Create(Self).Criar('COMPRA');
end;

procedure TFrmPri.cmAjustaEntradaClick(Sender: TObject);
begin
  TFrmME.Create(Self).Criar('ENTRADA');
end;

procedure TFrmPri.cmAjustaSaidaClick(Sender: TObject);
begin
  TFrmME.Create(Self).Criar('SAIDA');
end;

procedure TFrmPri.cmAcessosClick(Sender: TObject);
begin
  cmAcessos.Down := True;
  Paginas.ActivePageIndex := 1;
end;

procedure TFrmPri.cmMaqClick(Sender: TObject);
begin
  cmMaq.Down := True;
  Paginas.ActivePageIndex := 0;
end;

procedure TFrmPri.cmTotalMomentoClick(Sender: TObject);
begin
{  with Dados do 
  if tbCaixa.Locate('Numero', NumAberto, []) then 
    TFrmCaixa.Create(Self).Editar(tbCaixa);}
  TFrmRel.Create(Self).RelCaixa(NumAberto);  
end;

procedure TFrmPri.cmLancarEntradaClick(Sender: TObject);
begin
  TFrmLancExtra.Create(Self).Novo(Dados.tbLancExtra, True);
end;

procedure TFrmPri.cmLancarSaidaClick(Sender: TObject);
begin
  TFrmLancExtra.Create(Self).Novo(Dados.tbLancExtra, False);
end;

procedure TFrmPri.cmVendaAvulsaClick(Sender: TObject);
begin
  TFrmME.Create(Self).Criar('VENDA');
end;

procedure TFrmPri.cmCaixaClick(Sender: TObject);
begin
  with Dados do 
  if NumAberto<1 then
    AbrirFecharCaixa
  else  
  if tbCaixa.Locate('Numero', NumAberto, []) then 
    TFrmCaixa.Create(Self).Fechar(tbCaixa);
  
  RefreshCaixa;
end;

procedure TFrmPri.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : 
    if (ActiveGrid<>nil) and ActiveGrid.Focused then ActiveGrid.OnDblClick(nil);
    
    49..50    : 
    if (ssCtrl in Shift) or (ssAlt in Shift) then 
      ActiveView := Key - 49;
  end;
end;

procedure TFrmPri.cmSubMaquinasClick(Sender: TObject);
begin
  cmEditarMaq.Caption := 'Editar propriedades da Máquina ' + Dados.mtMaquinaNumero.AsString;
end;

procedure TFrmPri.cmLogClick(Sender: TObject);
begin
  with TfbgLog.Create(Self) do begin
    Inicializar(False, 0, 0);
    ShowModal;
    Free;
  end;  
end;

procedure TFrmPri.cmImpressoesClick(Sender: TObject);
begin
  cmImpressoes.Down := True;
  ActiveView := 2;
end;

procedure TFrmPri.AplicaDireitosUsuario;
begin
  cmLog.Enabled := Permitido(reLogProgramas, taLOGVer);
  cmUsuarios.Enabled := Permitido(reUsuarios, taUsuCadastrar);
  cmGrupos.Enabled := cmUsuarios.Enabled;
  cmCadastroPac.Enabled := Permitido(rePacotes, taPacCadastrar);
  cmEstoqueCompra.Enabled := Permitido(reMovEstoque, taEstCompras);
  cmAjustaSaida.Enabled := Permitido(reMovEstoque, taEstSaida);
  cmAjustaEntrada.Enabled := Permitido(reMovEstoque, taEstEntrada);
  cmLancarEntrada.Enabled := Permitido(reLancExtras, taLEXCadastrar);
  cmLancarSaida.Enabled := cmLancarEntrada.Enabled;
  cmConfig.Enabled := Permitido(reConfig, taCfgParametros);
  cmPrecos.Enabled := Permitido(reConfig, taCfgPrecos);
end;

procedure TFrmPri.cmPrecosClick(Sender: TObject);
begin
  with Dados do 
  if CM.Config.VariosTiposAcesso then begin
    with TfbgTarifas.Create(Self) do begin
      Inicializar(False, 0, 0);
      ShowModal;
      Free;
    end;  
  end else begin
    tbTipoAcesso.First;
    TFrmHoraCor.Create(Self).Editar((tbTipoAcesso.RecordCount=0));
  end;    
end;

procedure TFrmPri.EditaMaq;
begin
  FrmMaquinas.cmEditarAcessoClick(nil);
end;

procedure TFrmPri.cmTempoAvulsoClick(Sender: TObject);
begin
  TFrmCredito.Create(Self).Novo(FrmAcessos.Tab, 0, True);
end;

procedure TFrmPri.cmSuporteClick(Sender: TObject);
begin
  TFrmContato.Create(Self).ShowModal;
end;

procedure TFrmPri.cmLicencaClick(Sender: TObject);
var 
  S : String;
begin
  S := TFrmChave.Create(nil).Liberar(LicencaGlobal.AsString);
  if S <> LicencaGlobal.AsString then
    Dados.CM.Servidor.SalvaLicenca(S);
end;

procedure TFrmPri.cmVersaoClick(Sender: TObject);
begin
  AboutDlg.Execute;
end;

end.

