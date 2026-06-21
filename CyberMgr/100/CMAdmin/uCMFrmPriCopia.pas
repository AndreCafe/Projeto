unit uCMFrmPriCopia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, OvcBase, dxCntner, dxTL, dxDBCtrl, dxDBGrid, lmdcctrl,
  Lmdsplta, ActnList, lmdctrl, lmdbtn, dxBar, dxDBTLCl, dxGrClms, ExtCtrls,
  lmdstdcS, ComCtrls, lmdcompo, lmdclass, lmdformA, lmdsplt, dxEditor,
  dxExEdtr, dxExGrEd, dxExELib, dxEdLib, Db, ffdb,dbTables, dxDBEdtr,
  dxDBELib, dxfColorButton, lmdcombo, lmdextcS, dxfCheckBox,
  Lmdled, lmdgraph, dxLayout, kbmMemTable, DBCtrls,
  lmdnonvS,Registry, Grids, DBGrids, dxPSCore,
  dxPSdxTLLnk, dxPSdxDBGrLnk, dxPSStdGrLnk, ImgList, lmdnwgui, Menus,
  dxPSdxDBCtrlLnk, dxsbar,
  dxTLClms, dxPSGlbl,
  CPort, 
  uCMfbgAcessos,
  uCMFrmBaseGrid,
  uCMfbgPedidos,
  uCMfbgVendas,
  uCMfbgClientes,
  uCMfbgProdutos,
  uCMfbgUsuarios,
  uCMfbgEntregadores,
  uCMfbgGrupos,
  uCMfbgMaquinas,
  uCMfbgPacotes,
  uCMfbgCaixas,
  uCMfbgLancExtras,
  uCMFrmAguarde,
  lmdcont, 
  LMDWndProcComponent, LMDSimplePanel, LMDCustomScrollBox,
  LMDScrollBox, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDIniCtrl, LMDCustomComponent, dxBarExtItems, LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDGlobalHotKey, StBase, StShBase, StTrIcon,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomSimpleLabel, 
  LMDSimpleLabel, LMDContainerComponent, LMDBaseDialog, LMDAboutDlg;
  

type

  TExp  = set of  (teExcel,teHTML,teTXT);
  TFrmPri = class(TForm)
    OvcController1: TOvcController;
    Bar: TdxBarManager;
    dxBarSubItem1: TdxBarSubItem;
    cmFim: TdxBarButton;
    dxExibir: TdxBarSubItem;
    cmContatos: TdxBarButton;
    cmProdutos: TdxBarButton;
    cmPedidos: TdxBarButton;
    cmEntregadores: TdxBarButton;
    cmConfig: TdxBarButton;
    dxPrinter: TdxComponentPrinter;
    cmImprimir: TdxBarButton;
    cmSelecionaCampos: TdxBarButton;
    cmVendas: TdxBarButton;
    cmJanelas: TdxBarListItem;
    cmExportar: TdxBarSubItem;
    cmExcel: TdxBarButton;
    cmHTML: TdxBarButton;
    cmTXT: TdxBarButton;
    dlgExp: TSaveDialog;
    DPL: TdxDBGridReportLink;
    cmAjuda: TdxBarSubItem;
    cmConteudo: TdxBarButton;
    MenuLocaliza: TdxBarPopupMenu;
    cmColunas: TdxBarListItem;
    cmAcessos: TdxBarButton;
    IconesGrandes: TImageList;
    cmNovo: TdxBarLargeButton;
    cmApagar: TdxBarLargeButton;
    cmEditar: TdxBarLargeButton;
    cmPreviewObs: TdxBarLargeButton;
    cmLocalizar: TdxBarSubItem;
    cmUsuarios: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    INI: TLMDIniCtrl;
    cmPacotes: TdxBarButton;
    cmMaquinas: TdxBarButton;
    cmGrafico: TdxBarLargeButton;
    cmAtualizar: TdxBarLargeButton;
    Timer1: TTimer;
    cmGrupos: TdxBarButton;
    imTelefone: TImageList;
    Timer2: TTimer;
    LMDSimplePanel1: TLMDSimplePanel;
    Paginas: TPageControl;
    tsMaquinas: TTabSheet;
    tsAcessos: TTabSheet;
    tsPacotes: TTabSheet;
    tsPedidos: TTabSheet;
    tsContatos: TTabSheet;
    tsProdutos: TTabSheet;
    tsVendas: TTabSheet;
    tsUsuarios: TTabSheet;
    tsEntregadores: TTabSheet;
    tsGrupos: TTabSheet;
    cmCreditoTempo: TdxBarLargeButton;
    tsCaixa: TTabSheet;
    tsLancExtra: TTabSheet;
    cmCaixa: TdxBarButton;
    cmLancExtra: TdxBarButton;
    cmSubTempo: TdxBarSubItem;
    cmDebitarTempo: TdxBarButton;
    TimerCaixa: TTimer;
    Timer3: TTimer;
    AboutDlg: TLMDAboutDlg;
    procedure FormShow(Sender: TObject);
    procedure dxSenhaClick(Sender: TObject);
    procedure cmConfigClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmFimClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmImprimirClick(Sender: TObject);
    procedure cmSelecionaCamposClick(Sender: TObject);
    procedure InsereJanelas(Descricao: string; Janela: TForm);
    procedure DeletaJanelas(Janela: TForm);
    procedure cmJanelasClick(Sender: TObject);
    procedure cmExcelClick(Sender: TObject);
    procedure cmHTMLClick(Sender: TObject);
    procedure cmTXTClick(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure cmPreviewObsClick(Sender: TObject);
    procedure cmPedidosClick(Sender: TObject);
    procedure cmColunasClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gdProMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaginasChange(Sender: TObject);
    procedure cmAtualizarClick(Sender: TObject);
    procedure cmGraficoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cmCreditoTempoClick(Sender: TObject);
    procedure cmDebitarTempoClick(Sender: TObject);
    procedure TimerCaixaTimer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure cmConteudoClick(Sender: TObject);
  private
    FrmPedidos    : TfbgPedidos;
    FrmVen        : TfbgVendas;
    FrmCli        : TfbgClientes;
    FrmProdutos   : TfbgProdutos;
    FrmUsuarios   : TfbgUsuarios;
    FrmEntreg     : TfbgEntregadores;
    FrmGrupos     : TfbgGrupos;
    FrmMaquinas   : TfbgMaquinas;
    FrmPacotes    : TfbgPacotes;
    FrmLancExtras : TfbgLancExtras;
    FrmCaixas     : TfbgCaixas;
    FrmAguarde    : TFrmAguarde;
    FView         : Integer;
    FViewAnt      : Integer;
    FFirstShow    : Boolean;
    { Private declarations }
    procedure SetActiveView(Value: Integer);
    function GetFbg(V: Integer): TFrmBaseGrid;
    function CriaFbg(V: Integer): TFrmBaseGrid;
    function GetBotao(V: Integer): TdxBarButton;
    procedure AplicaConfigModulos;
  public
    FrmAcessos  : TfbgAcessos;
    procedure ConfigurarModulos;
  
    function AchaTelaME(Emissor, Num: Integer; Serie: String): TObject;
    function PrimeiroViewAtivo: Integer;

    procedure EditarME(Emissor: Integer; Serie: String; Num: Integer);
    procedure CriarPedido;

    property ActiveView: Integer
      read FView write SetActiveView;  

    function ActiveGrid: TdxDBGrid;

    procedure AtualizaDados(View: Integer);

    procedure LoadConfig;

    procedure ImprimirGrid(G: TdxDBGrid);
    procedure ExportarGrid(G: TdxDBGrid);

    procedure TentaConectar(Reconexao: Boolean);
  end;

const
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
  viPac  = 2;
  viPed  = 3;
  viCli  = 4;
  viPro  = 5;
  viVen  = 6;
  viUsu  = 7;
  viEnt  = 8;
  viGru  = 9;
  viCai  = 10;
  viLan  = 11;

  ViewHigh = viLan;

   ViewSt : Array[0..ViewHigh] of String =
    ('Máquinas',
     'Acessos',
     'Pacotes',
     'Pedidos', 
     'Contatos', 
     'Produtos', 
     'Vendas por produto',
     'Usuários',
     'Entregadores',
     'Grupos',
     'Caixa',
     'Lançamentos Extras');

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
  uCMFrmCliente,
  uCMFrmProduto, 
  uCMFrmME,
  uCMFrmLogin,
  uCMFrmMudaSenha,
  uCMFrmRegEntrega, 
  uCMFrmConfig, 
  uCMFrmPesqCli,
  uCMChecaTabelas, 
  uCMFrmEntregador, 
  uCMFrmUsuario, 
  cmIDRecursos,
  dxGridMenus, 
  uCMFrmGrupo;
  

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

procedure TFrmPri.InsereJanelas(Descricao: string; Janela: TForm);
var I : Integer;
begin
  with cmJanelas.Items do begin
    I := IndexOfObject(Janela);
    if I = -1 then
      AddObject(Descricao, Janela)
    else
      Strings[I] := Descricao;
    cmJanelas.Enabled := True;  
  end;
end;

procedure TFrmPri.DeletaJanelas(Janela: TForm);
var I : Integer;
begin
  with cmJanelas.Items do begin
    I := IndexOfObject(Janela);
    if i >= 0 then
       Delete(I);
    cmJanelas.Enabled := (cmJanelas.Items.Count>0);   
  end;
end;

procedure TFrmPri.TentaConectar(Reconexao: Boolean);
begin
  with TFrmLogin.Create(Self) do
  ShowModal;

  if not Dados.CM.Ativo then begin
    Application.Terminate;
    Exit;
  end;  

  Dados.AbreDB;
  LoadConfig;

  if Reconexao then begin
    FrmPedidos.Tab.Open;
    FrmVen.Q.Open;
    FrmCli.Tab.Open;
  end;
end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
  if not FFirstShow then Exit;
  FFirstShow := False;
  TentaConectar(False);
  if not Dados.CM.Ativo then Exit;

  sdxPanelText := 'Arraste o cabeçalho da coluna para agrupar por esta coluna';

  ConfigurarModulos;
  ActiveView := FViewAnt;
end;

function TFrmPri.AchaTelaME(Emissor, Num: Integer; Serie: String): TObject;
var I : Integer;
begin
  for I := 0 to pred(cmJanelas.Items.Count) do begin
    Result := cmJanelas.Items.Objects[I];
    if Result is TFrmME then 
    with TFrmME(Result) do
      if MesmoME(Emissor, Serie, Num) then Exit;
  end;    
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

procedure TFrmPri.CriarPedido;
begin
  TFrmME.Create(Self).Criar;
end;

function TFrmPri.PrimeiroViewAtivo: Integer;
var I : Integer;
begin
  Result := 0;
  for I := 0 to ViewHigh do
  if Paginas.Pages[I].TabVisible then begin
    Result := I;
    Exit;
  end;  
end;

procedure TFrmPri.SetActiveView(Value: Integer);
var 
  Fbg : TFrmBaseGrid;
begin
  if FView = Value then Exit;
  if (Value<0) or (Value>ViewHigh) then Exit;

  with ConfigModulos[Value] do begin
    if not imVisivel then Exit;
    if not imMostraTab then begin
      GetFbg(Value).ShowModal;
      Exit;
    end;  
  end;

  FView := Value;
  
  Paginas.ActivePageIndex := FView;
  
  Fbg := GetFbg(FView);
  cmLocalizar.Enabled := (Fbg<>nil);
  cmPreviewObs.Enabled := (Fbg<>nil);
  if Fbg <> nil then begin
    cmColunas.Items.Clear;
    cmColunas.Items.Assign(Fbg.cmColunas.Items);
    Fbg.Grid.SetFocus;
    Fbg.Grid.EndSearch;
    cmPreviewObs.Down :=  (edgoPreview in Fbg.Grid.OptionsView);
  end;
  
  GetBotao(FView).Down := True;
  cmNovo.Enabled := (FView in [viPed, viAce, viCli, viPro, viEnt, viUsu, viMaq, viPac, viLan, viCai]);

  case FView of
    viCai : begin
      if NumAberto > 0 then 
        cmNovo.Caption := 'Fechar '+FormatDateTime('dd/mm/yyyy', DiaAberto)
      else  
        cmNovo.Caption := 'Abrir '+FormatDateTime('dd/mm/yyyy', Now);
      
      cmEditar.Caption := 'Ver Total';
    end;
    
    viAce : cmNovo.Caption := 'Vender Pacote';  
  else 
    cmNovo.Caption := 'Novo';
    cmEditar.Caption := 'Editar';
  end;    

  if FView=viMaq then begin 
    Bar.Bars[3].Visible := False;
  end else begin
    Bar.Bars[3].Visible := True;
  end;  
  if FView <> viCli then
    cmSubTempo.Visible := ivNever
  else
    cmSubTempo.Visible := ivAlways;
      
  cmEditar.Enabled := (FView <> viMaq);
  cmApagar.Enabled := (FView <> viAce);
  cmGrafico.Enabled := cmEditar.Enabled;
  cmAtualizar.Enabled := cmEditar.Enabled;
  cmPreviewObs.Enabled := cmEditar.Enabled;
  cmApagar.Enabled := cmNovo.Enabled and not (FView in [viCai, viAce]);
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
  dados.ffClient.Active:= false;
  dados.servrem.Ativo := False;
end;

procedure TFrmPri.cmFimClick(Sender: TObject);
begin
  Dados.CM.Ativo := False;
  Dados.ffClient.Active := False;
  Close;
end;

function TFrmPri.GetFbg(V: Integer): TFrmBaseGrid;
begin
  case V of
    viMaq : Result := FrmMaquinas;
    viAce : Result := FrmAcessos;
    viPac : Result := FrmPacotes;
    viPed : Result := FrmPedidos;
    viCli : Result := FrmCli;
    viPro : Result := FrmProdutos;
    viVen : Result := FrmVen;
    viUsu : Result := FrmUsuarios;
    viEnt : Result := FrmEntreg;
    viGru : Result := FrmGrupos;
    viCai : Result := FrmCaixas;
    viLan : Result := FrmLancExtras;
  else
    Result := nil;  
  end;
end;

function TFrmPri.CriaFbg(V: Integer): TFrmBaseGrid;
begin
  case V of
    viMaq : FrmMaquinas := TfbgMaquinas.Create(Self);
    viAce : FrmAcessos := TfbgAcessos.Create(Self);
    viPac : FrmPacotes := TfbgPacotes.Create(Self);
    viPed : FrmPedidos := TfbgPedidos.Create(Self);
    viCli : FrmCli := TfbgClientes.Create(Self);
    viPro : FrmProdutos := TfbgProdutos.Create(Self);
    viVen : FrmVen := TfbgVendas.Create(Self);
    viUsu : FrmUsuarios := TfbgUsuarios.Create(Self);
    viEnt : FrmEntreg := TfbgEntregadores.Create(Self);
    viGru : FrmGrupos := TfbgGrupos.Create(Self);
    viLan : FrmLancExtras := TfbgLancExtras.Create(Self);
    viCai : FrmCaixas := TfbgCaixas.Create(Self);
  end;
  Result := GetFbg(V);
end;


function TFrmPri.GetBotao(V: Integer): TdxBarButton;
begin
  case V of
    viMaq : Result := cmMaquinas;
    viAce : Result := cmAcessos;
    viPac : Result := cmPacotes;
    viPed : Result := cmPedidos;
    viCli : Result := cmContatos;
    viPro : Result := cmProdutos;
    viVen : Result := cmVendas;
    viUsu : Result := cmUsuarios;
    viEnt : Result := cmEntregadores;
    viGru : Result := cmGrupos;
    viCai : Result := cmCaixa;
    viLan : Result := cmLancExtra;
  else
    Result := nil;  
  end;
end;
    
procedure TFrmPri.ConfigurarModulos;
var I : Integer;
begin
  for I := 0 to ViewHigh do Paginas.Pages[I].TabVisible := False;
  FreeAndNil(FrmAguarde);
  FrmAguarde := TFrmAguarde.Create(Self);
  FrmAguarde.Show;
  Timer1.Enabled := True;
end;

procedure TFrmPri.AplicaConfigModulos;
var 
  I : Integer;
  Fbg : TFrmBaseGrid;
  Botao : TdxBarButton;
begin
  try
    FrmAguarde.lbModulo.Caption := 'Criando módulos';
    FrmAguarde.lbModulo.Refresh;
    Application.ProcessMessages;
    
    for I := 0 to ViewHigh do 
    with ConfigModulos[I] do begin
      FrmAguarde.lbModulo.Caption := 'Configurando ' + ViewSt[I] + ' ...';
      FrmAguarde.lbModulo.Refresh;
      FrmAguarde.PB.Position := I;
      Application.ProcessMessages;
      Botao := GetBotao(I);
      Fbg := GetFbg(I);
      
      if not Permitido(Succ(I), taLeitura) then
        imVisivel := False;
        
      if imVisivel then begin
        Botao.Visible := ivAlways;
        if Fbg = nil then 
          Fbg := CriaFbg(I);

        if I=viVen then FrmVen.SoVendas := True;
          
        if imMostraTab then begin
          Paginas.Pages[I].TabVisible := True;
          if Fbg.FrmSeparado then
            Fbg.Inicializar(Bar, Paginas.Pages[I], FiltroNenhum, '');
          Botao.ButtonStyle := bsChecked;
        end else begin
          if not Fbg.FrmSeparado then begin
            FreeAndNil(Fbg);
            Fbg := CriaFbg(I);
            Fbg.cmHojeClick(nil);
          end;  
          Paginas.Pages[I].TabVisible := False;
          Botao.ButtonStyle := bsDefault;
        end;
      end else begin
        Botao.Visible := ivNever;
        Paginas.Pages[I].TabVisible := False;
        FreeAndNil(Fbg);
      end;  
    end; 
  finally
    FreeAndNil(FrmAguarde);
  end;  

  ActiveView := PrimeiroViewAtivo;
end;

procedure TFrmPri.FormCreate(Sender: TObject);
var I : Integer;
begin
  FViewAnt := viCai;
  FFirstShow := True;
  FrmAguarde := nil;
  FrmAcessos := nil;
  FrmMaquinas := nil;
  FrmPacotes := nil;
  FrmPedidos := nil;
  FrmUsuarios := nil;
  FrmProdutos := nil;
  FrmVen := nil;
  FrmCli := nil;
  FrmUsuarios := nil;
  FrmEntreg := nil;
  FrmGrupos := nil;
  FrmCaixas := nil;
  FrmLancExtras := nil;
  
  for I := 0 to ViewHigh do Paginas.Pages[I].TabVisible := False;

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

procedure TFrmPri.cmImprimirClick(Sender: TObject);
begin
  ImprimirGrid(ActiveGrid);
end;

procedure TFrmPri.cmSelecionaCamposClick(Sender: TObject);
begin
ActiveGrid.ColumnsCustomizing;
end;

procedure TFrmPri.cmJanelasClick(Sender: TObject);
begin
  (cmJanelas.Items.Objects[cmJanelas.ItemIndex] as TForm).show;
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
    viPac : Result := FrmPacotes.Grid;
    viPed : Result := FrmPedidos.Grid;
    viCli : Result := FrmCli.Grid;
    viPro : Result := FrmProdutos.Grid;
    viVen : Result := FrmVen.Grid;
    viUsu : Result := FrmUsuarios.Grid;
    viEnt : Result := FrmEntreg.Grid;
    viGru : Result := FrmGrupos.Grid;
    viLan : Result := FrmLancExtras.Grid;
    viCai : Result := FrmCaixas.Grid;
  else
    Result := nil;  
  end;
end;

procedure TFrmPri.cmNovoClick(Sender: TObject);
var Fbg: TFrmBaseGrid;
begin
  Fbg := GetFbg(ActiveView);
  if Fbg <> nil then Fbg.Novo;
  if ActiveView <> viCli then
    AtualizaDados(ActiveView);
end;

procedure TFrmPri.cmEditarClick(Sender: TObject);
var Fbg: TFrmBaseGrid;
begin
  Fbg := GetFbg(ActiveView);
  if Fbg <> nil then Fbg.Editar;
  if not (ActiveView in [viCli, viAce]) then
    AtualizaDados(ActiveView);
end;

procedure TFrmPri.cmApagarClick(Sender: TObject);
var Fbg: TFrmBaseGrid;
begin
  Fbg := GetFbg(ActiveView);
  if Fbg <> nil then Fbg.Apagar;
  AtualizaDados(ActiveView);
end;

procedure TFrmPri.cmPreviewObsClick(Sender: TObject);
begin
  with ActiveGrid do
  if cmPreviewObs.Down then
   OptionsView := OptionsView + [edgoPreview]
  else
   OptionsView := OptionsView - [edgoPreview];
end;

procedure TFrmPri.cmPedidosClick(Sender: TObject);
begin
  with TdxBarButton(Sender) do
  ActiveView := Tag;
end;

procedure TFrmPri.cmColunasClick(Sender: TObject);
begin
  with cmColunas, Items do
  with TdxDBTreeListColumn(Objects[ItemIndex]) do begin
    Index := 0;
    Sorted := csUp;
  end;  
  ActiveGrid.SetFocus;
  ActiveGrid.EndSearch;
end;

procedure TFrmPri.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ActiveGrid <> nil then
  if ActiveGrid.Focused then 
  case Key of
    Key_Ins   : cmNovoClick(nil);
    Key_Del   : cmApagarClick(nil);
    Key_Enter : cmEditarClick(nil);
    48..57    : 
    if ssCtrl in Shift then 
      ActiveView := Key - 46;
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
  ActiveView := Paginas.ActivePageIndex;
end;

procedure TFrmPri.cmAtualizarClick(Sender: TObject);
begin
  AtualizaDados(ActiveView);
end;

procedure TFrmPri.cmGraficoClick(Sender: TObject);
var Fbg: TFrmBaseGrid;
begin
  Fbg := GetFbg(ActiveView);
  if Fbg <> nil then Fbg.cmGraficoClick(nil);
end;

procedure TFrmPri.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  AplicaConfigModulos;
end;

procedure TFrmPri.cmCreditoTempoClick(Sender: TObject);
begin
  FrmCli.CreditarTempo;
end;

procedure TFrmPri.cmDebitarTempoClick(Sender: TObject);
begin
  FrmCli.DebitarTempo;
end;

procedure TFrmPri.TimerCaixaTimer(Sender: TObject);
begin
  TimerCaixa.Enabled := False;
  if FrmCaixas<>nil then
    FrmCaixas.Tab.Refresh;
end;

procedure TFrmPri.Timer3Timer(Sender: TObject);
begin
  if ActiveView = viAce then begin
    Timer3.Enabled := False;
    ActiveView := viCai;
  end else
    ActiveView := viAce;  
end;

procedure TFrmPri.cmConteudoClick(Sender: TObject);
begin
  if Dados.CM.ModoDemo then
    AboutDlg.Description := 'Versão Demonstração'
  else
    AboutDlg.Description := 'Licenciado';
  AboutDlg.Execute;  
end;

end.

