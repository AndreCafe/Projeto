unit ucmaPri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPC, cxControls, dxBar, ExtCtrls, dxsbar, cxContainer, cxEdit,
  dxBarExtItems, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxGridCustomTableView, cxGridTableView,
  kbmMemTable, kbmMemBinaryStreamFormat, DB, cxClasses, cxGridCustomView,
  cxGridLevel, cxGrid, cxMaskEdit, ComCtrls, ImgList, cxGroupBox, cxVGrid,
  cxInplaceContainer, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomGroupBox, LMDGroupBox,
  StdCtrls, cxRadioGroup, cxDBData, cxGridDBTableView, LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, cxLookAndFeelPainters, cxButtons, ufmFormBase,
  LMDCustomComponent, LMDContainerComponent, lmdmsg, cxGridCardView, cxHint,
  cxSplitter, PngImageList, dxDockPanel, dxDockControl, cxLabel, pngimage,
  cxTextEdit, cxMemo, Buttons, chfrBase, chfrPadrao, kbmMWClient,
  kbmMWCustomTransport, kbmMWCustomMessagingTransport,
  kbmMWTCPIPIndyMessagingTransport, chBase, chKBM, LMDVersionInfo,
  LMDBaseDialog, LMDAboutDlg, 
  ucmaFrmBaseChat,
  kbmMWTCPIPIndyMessagingClientTransport;

type
  TFrmPri = class(TForm)
    BarMgr: TdxBarManager;
    dxBarSubItem1: TdxBarSubItem;
    cmTrocarUsuario: TdxBarButton;
    cmAlterarSenha: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    cmSair: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton6: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    cxEditStyleController1: TcxEditStyleController;
    FM: TFormManager;
    MsgDlg: TLMDMessageBoxDlg;
    cxHintStyleController1: TcxHintStyleController;
    cxStyleRepository1: TcxStyleRepository;
    GridTableViewStyleSheetEggplant: TcxGridTableViewStyleSheet;
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
    cxVerticalGridStyleSheetEggplant: TcxVerticalGridStyleSheet;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    GridTableViewStyleSheetMaple: TcxGridTableViewStyleSheet;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    im32: TPngImageList;
    cmExibir: TdxBarImageCombo;
    cmExportar: TdxBarButton;
    cmImprimir: TdxBarButton;
    dsPri: TdxDockSite;
    dxDockingManager1: TdxDockingManager;
    dpAtalhos: TdxDockPanel;
    dxLayoutDockSite1: TdxLayoutDockSite;
    SB: TdxSideBar;
    dpPaginas: TdxDockPanel;
    dxLayoutDockSite2: TdxLayoutDockSite;
    Paginas: TcxPageControl;
    dpChat: TdxDockPanel;
    dxLayoutDockSite3: TdxLayoutDockSite;
    pagCHAT: TcxPageControl;
    tsCybermgr: TcxTabSheet;
    tsClientes: TcxTabSheet;
    MT: TkbmMemTable;
    MTDataHora: TDateTimeField;
    MTTexto: TMemoField;
    DataSource1: TDataSource;
    msgQOut: TkbmMWMemoryMessageQueue;
    msgQIn: TkbmMWMemoryMessageQueue;
    Transp: TkbmMWTCPIPIndyMessagingClientTransport;
    Client: TkbmMWSimpleClient;
    chFramePadrao1: TchFramePadrao;
    ChatR: TchKBMMW;
    cmSubExibir: TdxBarSubItem;
    cmMaquinas: TdxBarButton;
    cmClientes: TdxBarButton;
    cmProdutos: TdxBarButton;
    cmImpressoes: TdxBarButton;
    cmCaixa: TdxBarButton;
    cmOpcoes: TdxBarButton;
    cmTarifas: TdxBarButton;
    cmUsuarios: TdxBarButton;
    VI: TLMDVersionInfo;
    AboutDlg: TLMDAboutDlg;
    cmMostrarTextoBotoes: TdxBarButton;
    Timer1: TTimer;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    lbVersao: TcxLabel;
    cmChat: TdxBarControlContainerItem;
    btnChat: TLMDSpeedButton;
    TimerChat: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure cmSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarButton8Click(Sender: TObject);
    procedure cmChatClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FMChange(Sender: TObject);
    procedure cmMaquinasClick(Sender: TObject);
    procedure SBItemClick(Sender: TObject; Item: TdxSideBarItem);
    procedure SBChangeSelectedItem(Sender: TObject);
    procedure cmTrocarUsuarioClick(Sender: TObject);
    procedure cmAlterarSenhaClick(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxBarButton9Click(Sender: TObject);
    procedure cmMostrarTextoBotoesClick(Sender: TObject);
    procedure TimerChatTimer(Sender: TObject);
    procedure btnChatClick(Sender: TObject);
    procedure dpChatActivate(Sender: TdxCustomDockControl; Active: Boolean);
  private
    { Private declarations }
    FChat : TFrmBaseChat;

    procedure EnviarMsg(const aPara: Integer; const aTexto: String);
    procedure MudouAtencao(Sender: TObject);
  public
    
    procedure TentaConectar(Reconexao: Boolean);
    procedure AtualizaDireitos;

    property FrmChat: TFrmBaseChat
      read FChat;
    { Public declarations }
  end;

  function SimNao(S: String): Boolean;
  function SimNaoH(S: String; H : HWND): Boolean;
                                                     

var
  FrmPri: TFrmPri;

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

implementation

uses ufmImagens, ucmafbMaquinas, ucmaLogin, ucmaDM, 
  ucmafbTran, ucmafbClientes, Consts, ucmafbProdutos, ucmafbCaixa, 
  ncIDRecursos,
  cxGridStrs, 
  cxGridPopupMenuConsts,
  cxFilterConsts,
  cxFilterControlStrs,
  ucmafbOpcoes, ucmafbTarifas, ucmafbUsuarios,
  ucmafbImp, ucmaFrmSenha, ucmaFrmContato, ucmaHistVer, ucmaFrmTempo,
  ucmafbPesqCli;

{$R *.dfm}



function SimNao(S: String): Boolean;
begin
  Result := SimNaoH(S, FrmPri.Handle);
end;                

function SimNaoH(S: String; H : HWND): Boolean;
begin
  Result := (MessageBox(H, PChar(S), 'Atenção',
             MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = IDYES)
end;                


procedure TFrmPri.TentaConectar(Reconexao: Boolean);
begin
  Caption := 'Cyber Manager | CM-Admin ';

  FM.RegistraForm(TfbMaquinas);
  FM.RegistraForm(TfbClientes);
  FM.RegistraForm(TfbProdutos);
  FM.RegistraForm(TfbCaixa);
  FM.RegistraForm(TfbOpcoes);
  FM.RegistraForm(TfbTarifas);
  FM.RegistraForm(TfbUsuarios);
  FM.RegistraForm(TfbImp);

  with TFrmLogin.Create(Self) do
  ShowModal;

  if not Dados.CM.Ativo then Exit;

  Caption := 'Cyber Manager | CM-Admin | Usuário: ' + Dados.CM.UA.Nome;
  
  PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);

  Dados.AbreDB;
  
  cmTrocarUsuario.Caption := 'Trocar de Usuário';
  
  cmSubExibir.Enabled := True;
  dsPri.Visible := True;
  cmImprimir.Enabled := True;
  cmExportar.Enabled := True;
  cmAlterarSenha.Enabled := True;
  cmSubExibir.Caption := 'E&xibir: Máquinas';
  SB.SelectedItem := SB.Groups[0].Items[0];
  FM.Mostrar(TfbMaquinas, 0, 0);
  AtualizaDireitos;
end;

procedure TFrmPri.Timer1Timer(Sender: TObject);
begin
  Close;
end;

procedure TFrmPri.TimerChatTimer(Sender: TObject);
begin
  cmChat.Visible := ivAlways;
  if btnChat.Color = clYellow then
    btnChat.Color := clBtnFace else
    btnChat.Color := clYellow;
end;

procedure TFrmPri.cmSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPri.FormShow(Sender: TObject);
var I : Integer;
begin
  TentaConectar(False);
  if not Dados.CM.Ativo then 
    Application.Terminate;
  lbVersao.Caption := AboutDlg.Version + ' | Cod.Loja: ' + Dados.CM.Config.CodLoja;
  FChat := TFrmBaseChat.Create(Self);
  FChat.EnviarMsg := EnviarMsg;
  FChat.NumMaq := 0;
  FChat.panPri.Parent := tsClientes;
  dpChat.Width := lbVersao.Width;
  with Dados do begin
    tbChat.SetRange([Now-1], [Now+1]);
    tbChat.First;
    while not tbChat.Eof do begin
      if tbChatNumSeq.Value>UChat then
        FChat.MsgEnv(tbChatDataHora.Value, tbChatDe.Value, tbChatPara.Value, tbChatTexto.Value);
      tbChat.Next;
    end;
    if tbChatNumSeq.Value>UChat then
      UChat := tbChatNumSeq.Value;
  end;
  with FChat, Dados.CM do begin
    edMaq.Properties.Items.Clear;
    edMaq.Properties.Items.Add('Todos');
    for I := 0 to Maquinas.Count - 1 do
      edMaq.Properties.Items.Add(IntToStr(Maquinas[I].Numero));
    edMaq.ItemIndex := 0;  
    FChat.panPri.Parent := tsClientes;
    FChat.MudouAtencao := Self.MudouAtencao;
    FChat.NaoPiscar := True;
  end;

  Application.CreateForm(TfbPesqCli, fbPesqCli);
  fbPesqCli.FiltraDados;
end;

procedure TFrmPri.MudouAtencao(Sender: TObject);
begin
  if FChat.Atencao then
    TimerChat.Enabled := True
  else begin
    TimerChat.Enabled := False;
    cmChat.Visible := ivNever;
  end;  
end;

procedure TFrmPri.dxBarButton8Click(Sender: TObject);
begin
  AboutDlg.Execute;
end;

procedure TFrmPri.cmChatClick(Sender: TObject);
begin
{ pagChat.Visible := cmCHat.Down;
  cxSplitter2.Left := Paginas.Left + Paginas.Width - 10;}
end;

procedure TFrmPri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Timer1.Enabled then
    FM.Clear
  else begin
    Action := caNone;
    Timer1.Enabled := True;
    if not (FM.FormAtivo  is TfbMaquinas) then
      FM.Mostrar(TfbMaquinas, 0, null);
  end;  
end;

procedure TFrmPri.FMChange(Sender: TObject);
var F: TFrmBase;
begin
  if FM.FormAtivo is TfbCaixa then begin
    FM.FormAtivo.FiltraDados;
    F := TfbCaixa(FM.FormAtivo).FM.FormAtivo;
    if F is TfbTran then
      TfbTran(F).Refresh;
  end;    
end;

procedure TFrmPri.cmMaquinasClick(Sender: TObject);
var F : PFrmBaseClass;
begin
  SB.SelectedItem := SB.Groups[0].Items[TdxBarItem(Sender).Tag];
  F := FM.ClassByName(SB.SelectedItem.CustomData);
  cmSubExibir.Caption := 'E&xibir: ' + TdxBarItem(Sender).Caption;
  cmSubExibir.Tag := TdxBarItem(Sender).Tag;
  if (F<>nil) then
    FM.Mostrar(F^, 0, 0);
end;

procedure TFrmPri.AtualizaDireitos;
begin
  cmUsuarios.Enabled := Dados.CM.UA.Admin;
  cmOpcoes.Enabled := Permitido(daCFGParametros);
  if Dados.CM.Config.EscondeTextoBotoes then
    cmMostrarTextoBotoes.Caption := 'Mostrar Texto dos Botões'
  else
    cmMostrarTextoBotoes.Caption := 'Ocultar Texto dos Botões';
  MostrarTextoBotoes := not Dados.CM.Config.EscondeTextoBotoes;    
  SB.Groups[0].Items[cmUsuarios.Tag].Enabled := cmUsuarios.Enabled;
  SB.Groups[0].Items[cmOpcoes.Tag].Enabled := cmOpcoes.Enabled;
  SB.Groups[0].Items[cmTarifas.Tag].Enabled := cmTarifas.Enabled;
  FM.AtualizaDireitos;
end;

procedure TFrmPri.SBItemClick(Sender: TObject; Item: TdxSideBarItem);
var F : PFrmBaseClass;
begin
  F := FM.ClassByName(Item.CustomData);
  cmSubExibir.Caption := 'E&xibir: '+ Item.Caption;
  cmSubExibir.Tag := Item.Tag;
  if (F<>nil) then
    FM.Mostrar(F^, 0, 0);
end;

procedure TFrmPri.SBChangeSelectedItem(Sender: TObject);
begin
  if not SB.SelectedItem.Enabled then
    SB.SelectedItem := SB.Groups[0].Items[cmSubExibir.Tag];
end;

procedure TFrmPri.cmTrocarUsuarioClick(Sender: TObject);
begin
  cmTrocarUsuario.Caption := 'Login';
  Conectando := True;
  try
    cmSubExibir.Enabled := False;
    dsPri.Visible := False;
    cmImprimir.Enabled := False;
    cmExportar.Enabled := False;
    cmAlterarSenha.Enabled := False;
    FM.Clear;
    Dados.CM.Ativo := False;
    Dados.FecharDB;
    TentaConectar(False);
  finally
    Conectando := False;
  end;    
end;

procedure TFrmPri.btnChatClick(Sender: TObject);
begin
  dpChat.AutoHide := False;
  FChat.meTexto.SetFocus;
  FChat.Atencao := False;
end;

procedure TFrmPri.cmAlterarSenhaClick(Sender: TObject);
var S: String;
begin
  with Dados.CM, UA do begin
    AtualizaCache;
    S := TFrmAlteraSenha.Create(nil).Editar(Senha, Nome);
    if S<>Senha then begin
      Senha := S;
      SalvaAlteracoesObj(UA, False);
    end;  
  end; 
end;

procedure TFrmPri.dpChatActivate(Sender: TdxCustomDockControl; Active: Boolean);
begin
  if Active then FChat.meTexto.SetFocus;
end;

procedure TFrmPri.dxBarButton6Click(Sender: TObject);
begin
  TFrmContato.Create(Self).ShowModal;
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  FChat := nil;
  AboutDlg.Version := 'Versão: ' + VI.FileVersion;
  lbVersao.Caption := AboutDlg.Version + ' | Cod.Loja: ' + Dados.CM.Config.CodLoja;
end;

procedure TFrmPri.dxBarButton9Click(Sender: TObject);
begin
  TFrmRTF.Create(Self).Mostrar('Histórico de Versões', 'cmhist.rtf');
end;

procedure TFrmPri.EnviarMsg(const aPara: Integer; const aTexto: String);
begin
  Dados.CM.EnviaChat(aPara, aTexto);
//  FChat.MsgEnv(Now, FChat.NumMaq, aPara, aTexto);
end;

procedure TFrmPri.cmMostrarTextoBotoesClick(Sender: TObject);
begin
  MostrarTextoBotoes := not MostrarTextoBotoes;
  if MostrarTextoBotoes then
    cmMostrarTextoBotoes.Caption := 'Ocultar Textos dos Botões'
  else  
    cmMostrarTextoBotoes.Caption := 'Mostrar Textos dos Botões' ;
  with Dados, CM do begin  
    tbConfig.Edit;
    tbConfigEscondeTextoBotoes.Value := not MostrarTextoBotoes;
    tbConfig.Post;
    Config.AtualizaCache;
    Config.EscondeTextoBotoes := not MostrarTextoBotoes;
    SalvaAlteracoesObj(Config, False);
  end;  
  FM.AtualizaDireitos;
end;

initialization
  cxSetResourceString(@cxSGridNone, 'Nenhum');
  cxSetResourceString(@cxSGridSortColumnAsc, 'Ordenar Crescente');
  cxSetResourceString(@cxSGridSortColumnDesc, 'Ordenar Decrescente');
  cxSetResourceString(@cxSGridClearSorting, 'Não Ordenar');
  cxSetResourceString(@cxSGridGroupByThisField, 'Agrupar por esta coluna');
  cxSetResourceString(@cxSGridRemoveThisGroupItem, 'Remover do agrupamento');
  cxSetResourceString(@cxSGridGroupByBox, 'Agrupamento') ;
  cxSetResourceString(@cxSGridAlignmentSubMenu, 'Alinhamento');
  cxSetResourceString(@cxSGridAlignLeft, 'à Esquerda');
  cxSetResourceString(@cxSGridAlignRight, 'à Direita');
  cxSetResourceString(@cxSGridAlignCenter, 'ao Centro');        
  cxSetResourceString(@cxSGridRemoveColumn, 'Remover esta coluna');
  cxSetResourceString(@cxSGridFieldChooser, 'Selecionar Colunas');
  cxSetResourceString(@cxSGridBestFit, 'Tamanho ideal');
  cxSetResourceString(@cxSGridBestFitAllColumns, 'Tamanho ideal (Todas colunas)');
  cxSetResourceString(@cxSGridShowFooter, 'Rodapé');
  cxSetResourceString(@cxSGridShowGroupFooter, 'Rodapé em agrupamento');
  cxSetResourceString(@cxSGridSumMenuItem, 'Somar');
  cxSetResourceString(@cxSGridMinMenuItem, 'Min');
  cxSetResourceString(@cxSGridMaxMenuItem, 'Max');
  cxSetResourceString(@cxSGridCountMenuItem, 'Contar');
  cxSetResourceString(@cxSGridAvgMenuItem, 'Média');
  cxSetResourceString(@cxSGridNoneMenuItem, 'Nenhum');
  cxSetResourceString(@scxGridNoDataInfoText, '');
  

  cxSetResourceString(@scxGridRecursiveLevels, 'Você não pode criar niveis recursivos');

  cxSetResourceString(@scxGridDeletingConfirmationCaption, 'Confirmar');
  cxSetResourceString(@scxGridDeletingFocusedConfirmationText, 'Apagar registro?');
  cxSetResourceString(@scxGridDeletingSelectedConfirmationText, 'Apagar todos registros selecionados?');

  cxSetResourceString(@scxGridNewItemRowInfoText, 'Clique aqui para adicionar um novo registro');

  cxSetResourceString(@scxGridFilterIsEmpty, '<Filtro está vazio>');

  cxSetResourceString(@scxGridCustomizationFormCaption, 'Customização');
  cxSetResourceString(@scxGridCustomizationFormColumnsPageCaption, 'Colunas');
  cxSetResourceString(@scxGridGroupByBoxCaption, 'Arraste aqui o cabeçalho de uma coluna para agrupar por esta coluna');
  cxSetResourceString(@scxGridFilterCustomizeButtonCaption, 'Customizar...');

  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption, 'Bandas');

  cxSetResourceString(@scxGridConverterNotExistGrid, 'cxGrid não existet');
  cxSetResourceString(@scxGridConverterNotExistComponent, 'Componente não existe');
  cxSetResourceString(@scxImportErrorCaption, 'Erro de importação');

  cxSetResourceString(@scxNotExistGridView, 'Grid view não existe');
  cxSetResourceString(@scxNotExistGridLevel, 'Grid level ativo não existe');
  cxSetResourceString(@scxCantCreateExportOutputFile, 'Falha na criação do arquivo de exportação');
  
  cxSetResourceString(@cxSFilterRootButtonCaption, 'Filtro');
  cxSetResourceString(@cxSFilterAddCondition, 'Nova &Condição');
  cxSetResourceString(@cxSFilterAddGroup, 'Novo &Grupo');
  cxSetResourceString(@cxSFilterRemoveRow , '&Remover Linha');
  cxSetResourceString(@cxSFilterClearAll, 'Limpar &Tudo');
  cxSetResourceString(@cxSFilterFooterAddCondition, 'pressione o botão para adicionar uma nova condição');
  cxSetResourceString(@cxSFilterGroupCaption, 'se aplica as seguintes condições');
  cxSetResourceString(@cxSFilterRootGroupCaption , '<raiz>');
  cxSetResourceString(@cxSFilterControlNullString , '<vazio>');
  cxSetResourceString(@cxSFilterErrorBuilding, 'Não é possível montar o filtro nessa origem');
  cxSetResourceString(@cxSFilterDialogCaption, 'Filtro Customizado');
  cxSetResourceString(@cxSFilterDialogInvalidValue, 'Valor inválido');
  cxSetResourceString(@cxSFilterDialogUse, 'Usar');
  cxSetResourceString(@cxSFilterDialogSingleCharacter, 'para representar qualquer caracter');
  cxSetResourceString(@cxSFilterDialogCharactersSeries, 'para representar qualquer série de caracteres');
  cxSetResourceString(@cxSFilterDialogOperationAnd, 'E');
  cxSetResourceString(@cxSFilterDialogOperationOr, 'OU');
  cxSetResourceString(@cxSFilterDialogRows, 'Mostrar registros onde:');
  cxSetResourceString(@cxSFilterControlDialogCaption, 'Criador de Filtro');
  cxSetResourceString(@cxSFilterControlDialogNewFile, 'semtitulo.flt');
  cxSetResourceString(@cxSFilterControlDialogOpenDialogCaption, 'Abrir um filtro existente');
  cxSetResourceString(@cxSFilterControlDialogSaveDialogCaption, 'Salvar o filtro ativo para um arquivo');
  cxSetResourceString(@cxSFilterControlDialogActionSaveCaption , '&Salvar como...');
  cxSetResourceString(@cxSFilterControlDialogActionOpenCaption , '&Abrir...');
  cxSetResourceString(@cxSFilterControlDialogActionApplyCaption , 'A&plicar');
  cxSetResourceString(@cxSFilterControlDialogActionOkCaption, 'OK');
  cxSetResourceString(@cxSFilterControlDialogActionCancelCaption, 'Cancelar');
  cxSetResourceString(@cxSFilterControlDialogFileExt, 'flt');
  cxSetResourceString(@cxSFilterControlDialogFileFilter, 'Filttros (*.flt)|*.flt');

  cxSetResourceString(@cxSFilterOperatorEqual, 'seja igual a');
  cxSetResourceString(@cxSFilterOperatorNotEqual, 'seja diferente de');
  cxSetResourceString(@cxSFilterOperatorLess, 'seja menor que');
  cxSetResourceString(@cxSFilterOperatorLessEqual, 'seja menor que ou igual a');
  cxSetResourceString(@cxSFilterOperatorGreater, 'seja maior que');
  cxSetResourceString(@cxSFilterOperatorGreaterEqual, 'seja maior que ou igual a');
  cxSetResourceString(@cxSFilterOperatorLike, 'contenha');
  cxSetResourceString(@cxSFilterOperatorNotLike, 'não contenha');
  cxSetResourceString(@cxSFilterOperatorBetween, 'tenha valor entre');
  cxSetResourceString(@cxSFilterOperatorNotBetween, 'não tenha valor entre');
  cxSetResourceString(@cxSFilterOperatorInList, 'dentro de');
  cxSetResourceString(@cxSFilterOperatorNotInList, 'fora de');
  cxSetResourceString(@cxSFilterOperatorYesterday, 'seja ontem');
  cxSetResourceString(@cxSFilterOperatorToday, 'seja hoje');
  cxSetResourceString(@cxSFilterOperatorTomorrow, 'seja amanhã');
  cxSetResourceString(@cxSFilterOperatorLastWeek, 'seja semana passada');
  cxSetResourceString(@cxSFilterOperatorLastMonth, 'seja mês passado');
  cxSetResourceString(@cxSFilterOperatorLastYear, 'seja ano passado');
  cxSetResourceString(@cxSFilterOperatorThisWeek, 'seja esta semana');
  cxSetResourceString(@cxSFilterOperatorThisMonth, 'seja este mês');
  cxSetResourceString(@cxSFilterOperatorThisYear, 'seja este ano');
  cxSetResourceString(@cxSFilterOperatorNextWeek, 'seja a próxima semana');
  cxSetResourceString(@cxSFilterOperatorNextMonth, 'seja o próximo mês');
  cxSetResourceString(@cxSFilterOperatorNextYear, 'seja o próximo ano');
  cxSetResourceString(@cxSFilterAndCaption, 'e');
  cxSetResourceString(@cxSFilterOrCaption, 'ou');
  cxSetResourceString(@cxSFilterNotCaption, 'não');
  cxSetResourceString(@cxSFilterBlankCaption, 'branco');
  cxSetResourceString(@cxSFilterOperatorIsNull, 'esteja em branco');
  cxSetResourceString(@cxSFilterOperatorIsNotNull, 'nao esteja em branco');
  cxSetResourceString(@cxSFilterOperatorBeginsWith, 'comece com');
  cxSetResourceString(@cxSFilterOperatorDoesNotBeginWith, 'não comece com');
  cxSetResourceString(@cxSFilterOperatorEndsWith, 'termine com');
  cxSetResourceString(@cxSFilterOperatorDoesNotEndWith, 'não termine com');
  cxSetResourceString(@cxSFilterOperatorContains, 'contenha');
  cxSetResourceString(@cxSFilterOperatorDoesNotContain, 'nao contenha');
  cxSetResourceString(@cxSFilterBoxAllCaption , '(Todos)');
  cxSetResourceString(@cxSFilterBoxCustomCaption , '(Customizado...)');
  cxSetResourceString(@cxSFilterBoxBlanksCaption , '(Brancos)');
  cxSetResourceString(@cxSFilterBoxNonBlanksCaption , '(não Brancos)');
  
  
  

end.













                                                      
