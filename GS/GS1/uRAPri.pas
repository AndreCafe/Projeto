unit uRAPri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxVGrid, cxDBVGrid,
  cxInplaceContainer, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, nxdb, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxllComponent, nxsdServerEngine,
  nxreRemoteServerEngine, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxBarDBNav, cxPC, dxBar, dxBarExtItems,
  cxGroupBox, cxContainer, cxTextEdit, cxMemo, cxDBEdit, cxMaskEdit,
  cxRadioGroup, cxImageComboBox, cxSpinEdit, cxLabel, ExtCtrls, StdCtrls,
  cxCurrencyEdit, cxDBLabel, cxPropertiesStore, cxCalendar,
  cxDBLookupComboBox, cxDropDownEdit, cxCheckBox, cxDBExtLookupComboBox,
  cxLookAndFeelPainters, cxButtons, cxGridCustomPopupMenu, cxGridPopupMenu,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  ImgList, kbmMWCustomConnectionPool, kbmMWClientDataset,
  kbmMWClient, kbmMemTable, kbmMWStreamFormat, kbmMWBinaryStreamFormat,
  kbmMWCustomTransport, kbmMWTCPIPIndyTransport, kbmMWCustomDataset, dxsbar,
  dxDockControl,
  dxDockPanel, ufmFormBase, dxPScxCommon,
  PngImageList, cxTL, cxDBTL, cxTLData;

type
  TFrmPri = class(TForm)
    BarMgr: TdxBarManager;
    cmFechar: TdxBarButton;
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
    cxVerticalGridStyleSheetPlumHighColor: TcxVerticalGridStyleSheet;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxVerticalGridStyleSheetDevExpress: TcxVerticalGridStyleSheet;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxGridPopupMenu1: TcxGridPopupMenu;
    cmImprimir: TdxBarButton;
    CP: TdxComponentPrinter;
    cmExcel: TdxBarButton;
    cxGridPopupMenu2: TcxGridPopupMenu;
    cmArquivo: TdxBarSubItem;
    cmExibir: TdxBarSubItem;
    cmEditarSub: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    cmExibir2: TdxBarSubItem;
    cmNomeOper: TdxBarStatic;
    dxDockingManager1: TdxDockingManager;
    dsExecutar: TdxDockSite;
    dpExec: TdxDockPanel;
    dxBarDockControl1: TdxBarDockControl;
    cmNovoMenu: TdxBarButton;
    cmEditMenu: TdxBarButton;
    cmApagarMenu: TdxBarButton;
    dsCentro: TdxDockSite;
    dpForms: TdxDockPanel;
    dxLayoutDockSite3: TdxLayoutDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    Paginas: TcxPageControl;
    FM: TFormManager;
    cmConfigMenu: TdxBarButton;
    cmVoltar: TdxBarButton;
    cmAvancar: TdxBarButton;
    cmAlterarSenha: TdxBarButton;
    im32: TPngImageList;
    TLM: TcxDBTreeList;
    TLMDescr: TcxDBTreeListColumn;
    TLMForm: TcxDBTreeListColumn;
    TLMOperID: TcxDBTreeListColumn;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure cmExcelClick(Sender: TObject);
    procedure cmFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmNovoMenuClick(Sender: TObject);
    procedure cmEditMenuClick(Sender: TObject);
    procedure cmApagarMenuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TLMDblClick(Sender: TObject);
    procedure cmConfigMenuClick(Sender: TObject);
    procedure FMChange(Sender: TObject);
    procedure cmAlterarSenhaClick(Sender: TObject);
  private
    { Private declarations }
    FGrid : TcxGrid;
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

implementation

uses cxExportGrid4Link, uRADM, uRAFrmMenu, uRAfbClientes, uRAfbLog, uRAfbPlanoContas, uRAfbUsuario, ufmImagens, uRAfbPREstat,
  uRAfbTitulos, uRAFrmLogin, uRAFrmAlteraSenha, urafbStatus,
  cxGridPopupMenuConsts,
  cxGridStrs, 
  cxFilterConsts,
  cxFilterControlStrs;
  

{$R *.dfm}

function GridININame: String;
begin
  Result := ExtractFilePath(ParamStr(0)) + 'RegAdminGrid.ini';
end;

procedure TFrmPri.dxBarLargeButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPri.cmExcelClick(Sender: TObject);
var V : Variant;
begin
  V := ivNever;
  cmNovoMenu.Visible := V;
  if FGrid <> nil then
    ExportGrid4ToExcel('c:\Exportar.xls', FGrid);
end;

procedure TFrmPri.cmFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  FGrid := nil;
  FM.RegistraForm(TfbClientes);
  FM.RegistraForm(TfbTitulos);
  FM.RegistraForm(TfbPREstat); 
  FM.RegistraForm(TfbLog);
  FM.RegistraForm(TfbPC);
  FM.RegistraForm(TfbUsuario);
  FM.RegistraForm(TfbStatus); 
end;

procedure TFrmPri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FM.Free;
end;

procedure TFrmPri.cmNovoMenuClick(Sender: TObject);
begin
  TFrmMenu.Create(Self).Novo;
end;

procedure TFrmPri.cmEditMenuClick(Sender: TObject);
begin
  TFrmMenu.Create(Self).Editar;
end;

procedure TFrmPri.cmApagarMenuClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente apagar este item do menu?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
    DM.qMenu.Delete;
end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
  if TFrmLogin.Create(Self).Login then begin
    with DM, mwCli do 
    Caption := 'Registro Cyber Manager | Servidor: ' + mwTCPIP.Host + 
               ' | Usuário: ' + DM.mwCli.Username;
    FM.Mostrar(TfbClientes, 0, 0);
    TLM.FullExpand;
  end else begin
    Close;
    Exit;
  end;  
end;

procedure TFrmPri.TLMDblClick(Sender: TObject);
var C: PFrmBaseClass;
begin
  with DM do
  if qMenuForm.Value > '' then begin
    C := FM.ClassByName(qMenuForm.Value);
    if C<>nil then 
      FM.Mostrar(C^, qMenuOperID.Value, 0);
  end;    
end;

procedure TFrmPri.cmConfigMenuClick(Sender: TObject);
begin
  BarMgr.BarByName('Executar').Visible := cmConfigMenu.Down;
  if cmConfigMenu.Down then
    TLM.DragMode := dmAutomatic
  else
    TLM.DragMode := dmManual;
end;

procedure TFrmPri.FMChange(Sender: TObject);
begin
  if FM.FormAtivo <> nil then
    dpForms.Caption := FM.FormAtivo.Descricao
  else
    dpForms.Caption := '';  
end;

procedure TFrmPri.cmAlterarSenhaClick(Sender: TObject);
var 
  S: String;
begin
  with DM.mwCli do begin
    S := TFrmAlteraSenha.Create(Self).Editar(Password, Username);
    if S <> Password then begin
      Request(SvcName, SvcVersion, 'ALTERASENHA', [Username, S]);
      Password := S;
    end;  
  end
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
  cxSetResourceString(@cxSGridAvgMenuItem, 'Media');
  cxSetResourceString(@cxSGridNoneMenuItem, 'Nenhum');

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


           



                                                                    
