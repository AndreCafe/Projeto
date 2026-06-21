unit ucmafbConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems,
  ExtCtrls, cxStyles, cxGraphics, cxEdit, cxCheckBox, cxDBLookupComboBox,
  cxMaskEdit, cxTimeEdit, cxImageComboBox, cxColorComboBox, cxVGrid,
  cxClasses, cxDBVGrid, cxInplaceContainer, cxPC, cxControls,
  cxDropDownEdit, cxSpinEdit, cxMemo, cxTextEdit, cxContainer, cxGroupBox,
  cxRadioGroup, cxLabel, DB, kbmMemTable;

type
  TfbOpcoes = class(TFrmBase)
    cxPageControl1: TcxPageControl;
    tsGeral: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    tsCores: TcxTabSheet;
    VG: TcxDBVerticalGrid;
    VGRegImp981: TcxDBEditorRow;
    VGNomeProdImp1: TcxDBEditorRow;
    VGFecharProgramas1: TcxDBEditorRow;
    VGAutoExecutar1: TcxDBEditorRow;
    VGLimiteTempoPadrao1: TcxDBEditorRow;
    VGPacoteTempoReal1: TcxDBEditorRow;
    VGPermiteLoginSemCred1: TcxDBEditorRow;
    VGEncerramentoPrePago1: TcxDBEditorRow;
    VGAlertaFimTempo1: TcxDBEditorRow;
    VGTempoMaxAlerta1: TcxDBEditorRow;
    VGMostraPrePagoDec1: TcxDBEditorRow;
    VGPermiteCapturaTela1: TcxDBEditorRow;
    VGVariosTiposAcesso1: TcxDBEditorRow;
    VGModoPagtoAcesso1: TcxDBEditorRow;
    VGMostraCliCadAntesAvulso: TcxDBEditorRow;
    VGCampoLocalizaCli1: TcxDBEditorRow;
    VGManterSaldoCaixa1: TcxDBEditorRow;
    VGNaoMostrarMsgDebito1: TcxDBEditorRow;
    VGTolerancia1: TcxDBEditorRow;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxVerticalGridStyleSheetUserFormat2: TcxVerticalGridStyleSheet;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    vgCor: TcxDBVerticalGrid;
    vgCorMaqLivre: TcxDBEditorRow;
    vgCorCMaqLivre: TcxCategoryRow;
    vgCorFMaqLivre: TcxDBEditorRow;
    vgCorCUsoPre: TcxCategoryRow;
    vgCorMaqUsoPre: TcxDBEditorRow;
    vgCorFUsoPre: TcxDBEditorRow;
    vgCorCUsoPos: TcxCategoryRow;
    vgCorCUsoManut: TcxCategoryRow;
    vgCorCPausada: TcxCategoryRow;
    vgCorCategoryRow4: TcxCategoryRow;
    vgCorUsoPos: TcxDBEditorRow;
    vgCorFUsoPos: TcxDBEditorRow;
    vgCorManut: TcxDBEditorRow;
    vgCorFManut: TcxDBEditorRow;
    vgCorPausa: TcxDBEditorRow;
    vgCorFPausa: TcxDBEditorRow;
    vgCorDesktop: TcxDBEditorRow;
    vgCorFDesktop: TcxDBEditorRow;
    cmSalvar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    tsRecibos: TcxDBVerticalGrid;
    tsRecibosImprimirImpRec1: TcxDBEditorRow;
    tsRecibosPortaImpRec1: TcxDBEditorRow;
    tsRecibosSaltoImpRec1: TcxDBEditorRow;
    tsRecibosLargImpRec1: TcxDBEditorRow;
    tsRecibosCabecalhoImpRec1: TcxDBEditorRow;
    tsRecibosRodapeImpRec1: TcxDBEditorRow;
    vgMC: TcxVerticalGrid;
    vgmAlinhamento: TcxEditorRow;
    vgmEsconderCronometro: TcxEditorRow;
    vgmAposEncerrar: TcxEditorRow;
    vgmTempoSumir: TcxEditorRow;
    vgMCCategoryRow1: TcxCategoryRow;
    vgmMenuIniciar: TcxEditorRow;
    vgmPainelControle: TcxEditorRow;
    vgmCtrlAltDel: TcxEditorRow;
    vgmCmdExec: TcxEditorRow;
    vgMCCategoryRow2: TcxCategoryRow;
    vgmBloquearDownload: TcxEditorRow;
    vgmPaginaInicial: TcxEditorRow;
    rgQdoCairRede: TcxRadioGroup;
    MT: TkbmMemTable;
    DS: TDataSource;
    MTNumSeq: TAutoIncField;
    MTModulos: TMemoField;
    MTTiposLancExtra: TMemoField;
    MTProgramasPermitidos: TMemoField;
    MTCMGuard: TMemoField;
    MTJanelasExplorer: TMemoField;
    MTFecharProgramas: TBooleanField;
    MTAutoExecutar: TStringField;
    MTLimiteTempoPadrao: TDateTimeField;
    MTPacoteTempoReal: TBooleanField;
    MTPermiteLoginSemCred: TBooleanField;
    MTEncerramentoPrePago: TWordField;
    MTProdutoImpressao: TStringField;
    MTPermiteCapturaTela: TBooleanField;
    MTAlertaFimTempo: TDateTimeField;
    MTVariosTiposAcesso: TBooleanField;
    MTModoPagtoAcesso: TWordField;
    MTMostraPrePagoDec: TBooleanField;
    MTTempoMaxAlerta: TDateTimeField;
    MTMostraCliCadAntesAvulso: TBooleanField;
    MTAbre1: TDateTimeField;
    MTAbre2: TDateTimeField;
    MTAbre3: TDateTimeField;
    MTAbre4: TDateTimeField;
    MTAbre5: TDateTimeField;
    MTAbre6: TDateTimeField;
    MTAbre7: TDateTimeField;
    MTFecha1: TDateTimeField;
    MTFecha2: TDateTimeField;
    MTFecha3: TDateTimeField;
    MTFecha4: TDateTimeField;
    MTFecha5: TDateTimeField;
    MTFecha6: TDateTimeField;
    MTFecha7: TDateTimeField;
    MTCorLivre: TIntegerField;
    MTCorFLivre: TIntegerField;
    MTCorUsoPrePago: TIntegerField;
    MTCorFUsoPrePago: TIntegerField;
    MTCorUsoPosPago: TIntegerField;
    MTCorFUsoPosPago: TIntegerField;
    MTCorAguardaPagto: TIntegerField;
    MTCorFAguardaPagto: TIntegerField;
    MTCorManutencao: TIntegerField;
    MTCorFManutencao: TIntegerField;
    MTCorPausado: TIntegerField;
    MTCorFPausado: TIntegerField;
    MTCorDesktop: TIntegerField;
    MTCorFDesktop: TIntegerField;
    MTCampoLocalizaCli: TWordField;
    MTManterSaldoCaixa: TBooleanField;
    MTNaoMostrarMsgDebito: TBooleanField;
    MTTolerancia: TDateTimeField;
    MTRegImp98: TBooleanField;
    MTPortaImpRec: TStringField;
    MTSaltoImpRec: TWordField;
    MTLargImpRec: TWordField;
    MTCabecalhoImpRec: TMemoField;
    MTRodapeImpRec: TMemoField;
    MTImprimirImpRec: TBooleanField;
    cxLabel1: TcxLabel;
    vgmLiberarRede: TcxEditorRow;
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmSalvarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FrmBasePaiDestroy(Sender: TObject);
  private
    FAlterou : Boolean;
    procedure SetAlterou(const Value: Boolean);
    { Private declarations }
  protected
    slGuard: TStrings;
    property Alterou: Boolean
      read FAlterou write SetAlterou;  
  public
    procedure Ler;
    procedure Salvar;
    { Public declarations }
  end;

var
  fbOpcoes: TfbOpcoes;

implementation

uses ucmaDM, ucmaPri;

{$R *.dfm}

procedure TfbOpcoes.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  slGuard := TStringList.Create;
  MT.Active := True;
end;

procedure TfbOpcoes.Ler;
begin
  Alterou := False;
end;

procedure TfbOpcoes.Salvar;
begin

  Alterou := False;
end;

procedure TfbOpcoes.SetAlterou(const Value: Boolean);
begin
  FAlterou := Value;
  cmSalvar.Enabled := FAlterou;
  cmCancelar.Enabled := FAlterou;
end;

procedure TfbOpcoes.cmSalvarClick(Sender: TObject);
begin
  inherited;
  Salvar;
end;

procedure TfbOpcoes.cmCancelarClick(Sender: TObject);
begin
  inherited;
  Ler;
end;

procedure TfbOpcoes.FrmBasePaiDestroy(Sender: TObject);
begin
  inherited;
  slGuard.Free;
end;

end.
