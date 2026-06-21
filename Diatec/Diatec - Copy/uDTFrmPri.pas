unit uDTFrmPri;

interface

uses
  Windows, Messages, Variants, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ComCtrls, Menus, ExtCtrls, Grids, DBGrids, 
  dxBar, dxBarExtDBItems, 
  ppBarCod, ppCtrls, ppDB, ppPrnabl, ppClass, ppDBPipe, ppBands,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, ppVar, ppStrtch, ppRegion,
  ppMemo, ppEndUsr, ppViewr, lmdclass, ImgList,
  dxBarExtItems, ppRptExp, dxPrnDlg, dxPSCore, 
  ppModule, Printers,
  UDTSyncDef, LMDOneInstance, LMDCustomComponent, LMDContainerComponent,
  LMDBaseDialog, LMDCustomScrollBox, LMDScrollBox,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, lmdcont,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit,
  cxCheckBox, cxCalendar, cxTextEdit, cxInplaceContainer, cxDBTL,
  cxControls, cxTLData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGridLevel, cxGrid, cxImageComboBox,
  cxDBLookupComboBox, cxTimeEdit, cxCurrencyEdit, cxGridBandedTableView,
  cxGridDBBandedTableView, cxPC, dxPSGlbl, dxPSUtl, dxPSEngn, cxMemo, ppSubRpt,
  LMDCustomImageList, LMDBitmapList, LMDControl, LMDSplt;



type

  TFrmPri = class(TForm)
    PopMnuApont: TPopupMenu;
    Edita1: TMenuItem;
    Exclui1: TMenuItem;
    BarMgr: TdxBarManager;
    cmArquivo: TdxBarSubItem;
    cmFim: TdxBarButton;
    cmExibir: TdxBarSubItem;
    cmCliente: TdxBarLookupCombo;
    cmProjeto: TdxBarLookupCombo;
    cmTimeLine: TdxBarCombo;
    cmZoomProj: TdxBarButton;
    cmZoomFase: TdxBarButton;
    cmZoomAponta: TdxBarButton;
    cmProgresso: TdxBarCombo;
    cmPreview: TdxBarButton;
    cmEditarSub: TdxBarSubItem;
    cmNovo: TdxBarButton;
    cmApagar: TdxBarButton;
    cmApontamento: TdxBarButton;
    cmOS: TdxBarButton;
    cmLog: TdxBarButton;
    cmDownload: TdxBarButton;
    cmUpload: TdxBarButton;
    cmZoomSub: TdxBarSubItem;
    dxBarDockControl3: TdxBarDockControl;
    cmEditar: TdxBarButton;
    cmStatus: TdxBarButton;
    ppRepOS: TppReport;
    PipeOS: TppDBPipeline;
    PipeOSItens: TppDBPipeline;
    cmLogin: TdxBarButton;
    cmSobre: TdxBarButton;
    GridIcons: TImageList;
    ButtonIcons: TImageList;
    cbLegenda: TdxBarImageCombo;
    cmImpOS: TdxBarButton;
    cmCollapse: TdxBarButton;
    cmExpand: TdxBarButton;
    cmImprCrono: TdxBarButton;
    cmImprAponta: TdxBarButton;
    cmImprFases: TdxBarButton;
    cmImprRelOS: TdxBarButton;
    cpGrids: TdxComponentPrinter;
    dlSetupImp: TPrinterSetupDialog;
    dlCfgImp: TPrintDialog;
    cmSetupImp: TdxBarButton;
    LMDOneInstance1: TLMDOneInstance;
    cmDataCrono: TdxBarDateCombo;
    cmOpcoes: TdxBarButton;
    pipeFase: TppDBPipeline;
    pipeAponta: TppDBPipeline;
    ppRepVal: TppReport;
    pipeCliente: TppDBPipeline;
    pipeProjeto: TppDBPipeline;
    cmLegendaAponta: TdxBarImageCombo;
    cmSubImprimirFase: TdxBarSubItem;
    cmImpValidacao: TdxBarButton;
    dxBarSubExport: TdxBarSubItem;
    cmXProject: TdxBarButton;
    cmTransDisk: TdxBarButton;
    cmSubImprimeOS: TdxBarSubItem;
    cmSubFase: TdxBarSubItem;
    cmSubTreeFase: TdxBarSubItem;
    ppHeaderBand2: TppHeaderBand;
    ppRegion7: TppRegion;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    ppLabel22: TppLabel;
    ppLabel31: TppLabel;
    ppLabel29: TppLabel;
    ppDBBarCode2: TppDBBarCode;
    ppRegion4: TppRegion;
    ppLabel21: TppLabel;
    ppLabel23: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine14: TppLine;
    ppLabel24: TppLabel;
    ppDBText20: TppDBText;
    ppLabel27: TppLabel;
    ppDBText21: TppDBText;
    ppLine17: TppLine;
    ppLabel28: TppLabel;
    ppLine18: TppLine;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppLine15: TppLine;
    ppDBText32: TppDBText;
    ppDBText18: TppDBText;
    ppDBText22: TppDBText;
    ppLabel42: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText24: TppDBText;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppDBText19: TppDBText;
    ppLine16: TppLine;
    ppDBText34: TppDBText;
    ppDBText23: TppDBText;
    ppDBText25: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppRegion5: TppRegion;
    ppMemo3: TppMemo;
    ppMemo4: TppMemo;
    ppRegion6: TppRegion;
    ppLabel33: TppLabel;
    ppDBText26: TppDBText;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppDBText27: TppDBText;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppDBText29: TppDBText;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel41: TppLabel;
    ppDBText30: TppDBText;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppDBText28: TppDBText;
    ppDBText31: TppDBText;
    ppLabel38: TppLabel;
    ppLine25: TppLine;
    ppLabel39: TppLabel;
    ppDBText33: TppDBText;
    ppRepSug: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel46: TppLabel;
    ppDBBarCode3: TppDBBarCode;
    ppRegion9: TppRegion;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLine19: TppLine;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLine22: TppLine;
    ppLabel51: TppLabel;
    ppLine26: TppLine;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppLine38: TppLine;
    ppLabel63: TppLabel;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppLine39: TppLine;
    ppLabel64: TppLabel;
    ppDBText63: TppDBText;
    ppRegion8: TppRegion;
    ppLabel44: TppLabel;
    ppDBText56: TppDBText;
    ppLabel45: TppLabel;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppLine37: TppLine;
    ppLine27: TppLine;
    ppLabel40: TppLabel;
    ppLine34: TppLine;
    ppLabel43: TppLabel;
    ppLabel52: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLine35: TppLine;
    ppLabel71: TppLabel;
    ppDBText64: TppDBText;
    ppDBText67: TppDBText;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppDBText68: TppDBText;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppRegion12: TppRegion;
    ppDBMemo2: TppDBMemo;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppRegion10: TppRegion;
    ppMemo5: TppMemo;
    ppMemo6: TppMemo;
    ppLine33: TppLine;
    ppLabel62: TppLabel;
    ppDBText55: TppDBText;
    ppDBText44: TppDBText;
    ppLabel53: TppLabel;
    ppLine28: TppLine;
    ppDBText45: TppDBText;
    cmImpReqSugestao: TdxBarButton;
    pipeFase2: TppDBPipeline;
    ppRepCGP: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel54: TppLabel;
    ppDBBarCode4: TppDBBarCode;
    ppRegion11: TppRegion;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLine29: TppLine;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLine30: TppLine;
    ppLabel59: TppLabel;
    ppLine31: TppLine;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppLine32: TppLine;
    ppLabel60: TppLabel;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppLine36: TppLine;
    ppLabel61: TppLabel;
    ppDBText53: TppDBText;
    ppLabel80: TppLabel;
    ppDBText71: TppDBText;
    ppDBText73: TppDBText;
    ppRegion14: TppRegion;
    ppDBMemo3: TppDBMemo;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppRegion15: TppRegion;
    ppMemo7: TppMemo;
    ppLine44: TppLine;
    ppLabel98: TppLabel;
    ppDBText84: TppDBText;
    ppDBText85: TppDBText;
    ppLabel99: TppLabel;
    ppLine45: TppLine;
    ppDBText86: TppDBText;
    pipeCGP: TppDBPipeline;
    cmImprimeCGP: TdxBarButton;
    Logos: TLMDBitmapList;
    cmCronograma: TdxBarButton;
    ppTitleBand1: TppTitleBand;
    ppRegion1: TppRegion;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppLine3: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    ppLabel8: TppLabel;
    ppDBText4: TppDBText;
    ppLabel9: TppLabel;
    ppLine5: TppLine;
    ppDBText5: TppDBText;
    ppDBText1: TppDBText;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppDBBarCode1: TppDBBarCode;
    ppDetailBand1: TppDetailBand;
    ppRegion13: TppRegion;
    ppLine6: TppLine;
    ppLabel12: TppLabel;
    ppLine7: TppLine;
    ppLabel11: TppLabel;
    ppDBText7: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppRegion2: TppRegion;
    ppMemo1: TppMemo;
    ppMemo2: TppMemo;
    ppRegion3: TppRegion;
    ppLine9: TppLine;
    ppLabel13: TppLabel;
    ppDBText9: TppDBText;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppDBText10: TppDBText;
    ppLabel14: TppLabel;
    ppDBText11: TppDBText;
    ppLabel16: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBText15: TppDBText;
    ppLabel15: TppLabel;
    ppLine12: TppLine;
    ppLabel19: TppLabel;
    ppDBText16: TppDBText;
    ppLine13: TppLine;
    ppLabel20: TppLabel;
    ppDBText17: TppDBText;
    ppDBImage1: TppDBImage;
    pipePar: TppDBPipeline;
    ppDBImage2: TppDBImage;
    ppDBImage3: TppDBImage;
    ppDBImage4: TppDBImage;
    ImageList1: TImageList;
    ppSystemVariable5: TppSystemVariable;
    ppLabel79: TppLabel;
    ppLine40: TppLine;
    ppLabel81: TppLabel;
    ppDBText72: TppDBText;
    Paginas: TcxPageControl;
    tsAponta: TcxTabSheet;
    LMDSplitterPanel1: TLMDSplitterPanel;
    splitFase: TLMDSplitterPane;
    Panel1: TPanel;
    bdcTarefas: TdxBarDockControl;
    splitAponta: TLMDSplitterPane;
    Panel2: TPanel;
    bdcAponta: TdxBarDockControl;
    tsOS: TcxTabSheet;
    tsComunicacoes: TcxTabSheet;
    spOS: TLMDSplitterPanel;
    LMDSplitterPane2: TLMDSplitterPane;
    bdcOS: TdxBarDockControl;
    LMDSplitterPane1: TLMDSplitterPane;
    tsLog: TcxTabSheet;
    bdcCGP2: TdxBarDockControl;
    LMDSplitterPanel2: TLMDSplitterPanel;
    LMDSplitterPane3: TLMDSplitterPane;
    LMDSplitterPane4: TLMDSplitterPane;
    DBMemo1: TDBMemo;
    pipeLog: TppDBPipeline;
    ppUpload: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel82: TppLabel;
    ppRegion16: TppRegion;
    ppLabel83: TppLabel;
    ppLabel85: TppLabel;
    ppDBText75: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppLine46: TppLine;
    ppLabel90: TppLabel;
    ppRegion17: TppRegion;
    ppDBMemo4: TppDBMemo;
    ppDBImage5: TppDBImage;
    ppDetailBand5: TppDetailBand;
    ppSummaryBand5: TppSummaryBand;
    ppRegion18: TppRegion;
    ppMemo8: TppMemo;
    ppDBText74: TppDBText;
    ppLine41: TppLine;
    ppLabel84: TppLabel;
    ppSucesso: TppLabel;
    bdcLog: TdxBarDockControl;
    ppLabel86: TppLabel;
    ppDBText76: TppDBText;
    ppLine8: TppLine;
    ppLabel10: TppLabel;
    ppDBText6: TppDBText;
    ppLinhaProj1: TppLine;
    pplbHorasPrev: TppLabel;
    pplbHorasReal: TppLabel;
    pplbPosicao: TppLabel;
    ppLinhaProj2: TppLine;
    ppLinhaProj3: TppLine;
    ppdbHorasPrev: TppDBText;
    ppdbHorasReal: TppDBText;
    ppdbPosicao: TppDBText;
    ppDBText54: TppDBText;
    ppDBText8: TppDBText;
    ppValEdt: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel92: TppLabel;
    ppDBBarCode5: TppDBBarCode;
    ppRegion20: TppRegion;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppLine4: TppLine;
    ppLabel95: TppLabel;
    ppDBText14: TppDBText;
    ppLabel96: TppLabel;
    ppDBText80: TppDBText;
    ppLine42: TppLine;
    ppLabel97: TppLabel;
    ppLine43: TppLine;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppLine47: TppLine;
    ppDBText83: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBImage6: TppDBImage;
    ppDetailBand6: TppDetailBand;
    ppSummaryBand6: TppSummaryBand;
    ppRegion21: TppRegion;
    ppMemo9: TppMemo;
    ppMemo10: TppMemo;
    ppLine53: TppLine;
    ppLabel110: TppLabel;
    ppDBText100: TppDBText;
    ppDBMemo5: TppDBMemo;
    ppLine48: TppLine;
    ppLabel87: TppLabel;
    tsRA: TcxTabSheet;
    spRA: TLMDSplitterPanel;
    LMDSplitterPane5: TLMDSplitterPane;
    LMDSplitterPane6: TLMDSplitterPane;
    LMDSplitterPane7: TLMDSplitterPane;
    TreeFase: TcxDBTreeList;
    cxDBTreeList1Cliente: TcxDBTreeListColumn;
    cxDBTreeList1Projeto: TcxDBTreeListColumn;
    cxDBTreeList1ID: TcxDBTreeListColumn;
    cxDBTreeList1Sync: TcxDBTreeListColumn;
    cxDBTreeList1HR: TcxDBTreeListColumn;
    cxDBTreeList1Nome: TcxDBTreeListColumn;
    cxDBTreeList1Inicio: TcxDBTreeListColumn;
    cxDBTreeList1DatReI: TcxDBTreeListColumn;
    cxDBTreeList1Termino: TcxDBTreeListColumn;
    cxDBTreeList1DatReF: TcxDBTreeListColumn;
    cxDBTreeList1Horas: TcxDBTreeListColumn;
    cxDBTreeList1PercEst: TcxDBTreeListColumn;
    cxDBTreeList1PercRealizado: TcxDBTreeListColumn;
    cxDBTreeList1IDRetag: TcxDBTreeListColumn;
    TreeFaseSumario: TcxDBTreeListColumn;
    cxDBTreeList1FasePai: TcxDBTreeListColumn;
    cxDBTreeList1DataVld: TcxDBTreeListColumn;
    gridAponta: TcxGrid;
    glAponta: TcxGridLevel;
    tvAponta: TcxGridDBTableView;
    tvApontaSync1: TcxGridDBColumn;
    tvApontaCliente1: TcxGridDBColumn;
    tvApontaProjeto1: TcxGridDBColumn;
    tvApontaHoras1: TcxGridDBColumn;
    tvApontaData1: TcxGridDBColumn;
    tvApontaOS1: TcxGridDBColumn;
    tvApontaItem1: TcxGridDBColumn;
    tvApontaFase1: TcxGridDBColumn;
    tvApontaTecnico1: TcxGridDBColumn;
    gridOS: TcxGrid;
    glOS: TcxGridLevel;
    tvOS: TcxGridDBTableView;
    tvOSSync1: TcxGridDBColumn;
    tvOSEntrou1: TcxGridDBColumn;
    tvOSNomeCliente1: TcxGridDBColumn;
    tvOSData1: TcxGridDBColumn;
    tvOSID1: TcxGridDBColumn;
    tvOSInicio1: TcxGridDBColumn;
    tvOSTermino1: TcxGridDBColumn;
    tvOSTranslado1: TcxGridDBColumn;
    tvOSAbono1: TcxGridDBColumn;
    tvOSMotivoAbon1: TcxGridDBColumn;
    gridOSItens: TcxGrid;
    glOSItens: TcxGridLevel;
    tvOSItens: TcxGridDBTableView;
    tvOSItensCliente1: TcxGridDBColumn;
    tvOSItensHoras1: TcxGridDBColumn;
    tvOSItensNomeProjeto1: TcxGridDBColumn;
    tvOSItensData1: TcxGridDBColumn;
    tvOSItensOS1: TcxGridDBColumn;
    tvOSItensItem1: TcxGridDBColumn;
    tvOSItensNomeFase1: TcxGridDBColumn;
    tvOSItensTecnico1: TcxGridDBColumn;
    tvOSItensSync1: TcxGridDBColumn;
    gridCGP: TcxGrid;
    glCGP: TcxGridLevel;
    tvCGP: TcxGridDBTableView;
    tvCGPSync1: TcxGridDBColumn;
    tvCGPData1: TcxGridDBColumn;
    tvCGPDataRT1: TcxGridDBColumn;
    tvCGPTecnico1: TcxGridDBColumn;
    tvCGPNomeTec1: TcxGridDBColumn;
    tvCGPNomeTipo1: TcxGridDBColumn;
    tvCGPNomeOrigem1: TcxGridDBColumn;
    tvCGPNomeResp1: TcxGridDBColumn;
    tvCGPNomeRT1: TcxGridDBColumn;
    RepEstilo: TcxStyleRepository;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    gridLog: TcxGrid;
    glLog: TcxGridLevel;
    tvLog: TcxGridDBTableView;
    tvLogOK1: TcxGridDBColumn;
    tvLogID1: TcxGridDBColumn;
    tvLogTecnico1: TcxGridDBColumn;
    tvLogData1: TcxGridDBColumn;
    tvLogOper1: TcxGridDBColumn;
    tvLogDuracao1: TcxGridDBColumn;
    gridRA: TcxGrid;
    glRA: TcxGridLevel;
    tvRA: TcxGridDBBandedTableView;
    tvRASync1: TcxGridDBBandedColumn;
    tvRANomeCli1: TcxGridDBBandedColumn;
    tvRADataI1: TcxGridDBBandedColumn;
    tvRADataF1: TcxGridDBBandedColumn;
    tvRANumF1: TcxGridDBBandedColumn;
    tvRAStatusTec1: TcxGridDBBandedColumn;
    gridRAOS: TcxGrid;
    glRAOS: TcxGridLevel;
    tvRAOS: TcxGridDBBandedTableView;
    tvRAOSDataOS1: TcxGridDBBandedColumn;
    tvRAOSIDOS1: TcxGridDBBandedColumn;
    gridRAItem: TcxGrid;
    glRAItem: TcxGridLevel;
    tvRAItem: TcxGridDBBandedTableView;
    tvRAItemTipo: TcxGridDBBandedColumn;
    tvRAItemValor: TcxGridDBBandedColumn;
    tvApontaDescr: TcxGridDBColumn;
    tvOSItensDescr: TcxGridDBColumn;
    tvRAItemDescr: TcxGridDBBandedColumn;
    tsDespesas: TcxTabSheet;
    gridDesp: TcxGrid;
    tvDesp: TcxGridDBBandedTableView;
    tvDespTipo: TcxGridDBBandedColumn;
    tvDespValor: TcxGridDBBandedColumn;
    tvDespNumF: TcxGridDBBandedColumn;
    tvDespStatusTec: TcxGridDBBandedColumn;
    tvDespCusteadoPor: TcxGridDBBandedColumn;
    tvDespValorTec: TcxGridDBBandedColumn;
    tvDespDescr: TcxGridDBBandedColumn;
    glDesp: TcxGridLevel;
    tvDespData: TcxGridDBBandedColumn;
    tvDespCli: TcxGridDBBandedColumn;
    tvDespSync: TcxGridDBBandedColumn;
    tvRAID: TcxGridDBBandedColumn;
    tvRAItemData: TcxGridDBBandedColumn;
    tvDespID: TcxGridDBBandedColumn;
    tvDespRA: TcxGridDBBandedColumn;
    repRA: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppDetailBand7: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable7: TppSystemVariable;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppDBImage7: TppDBImage;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand8: TppDetailBand;
    ppSummaryBand7: TppSummaryBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand9: TppDetailBand;
    ppSummaryBand8: TppSummaryBand;
    ppShape1: TppShape;
    ppLabel91: TppLabel;
    ppShape2: TppShape;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLine49: TppLine;
    ppLine50: TppLine;
    ppShape3: TppShape;
    ppLabel103: TppLabel;
    ppLine51: TppLine;
    ppShape4: TppShape;
    ppLabel107: TppLabel;
    pipeRA: TppDBPipeline;
    pipeRAItem: TppDBPipeline;
    pipeRAos: TppDBPipeline;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel108: TppLabel;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppMemo11: TppMemo;
    ppRegion19: TppRegion;
    ppLine52: TppLine;
    ppLabel109: TppLabel;
    ppShape5: TppShape;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppLabel112: TppLabel;
    ppLabel114: TppLabel;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppLabel115: TppLabel;
    ppShape8: TppShape;
    ppDBText93: TppDBText;
    ppLabel116: TppLabel;
    ppLine58: TppLine;
    ppLabel117: TppLabel;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLine61: TppLine;
    ppDBMemo6: TppDBMemo;
    ppShape9: TppShape;
    ppLabel113: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppRegion22: TppRegion;
    ppMemo12: TppMemo;
    ppLabel120: TppLabel;
    ppLine62: TppLine;
    ppDBText94: TppDBText;
    dxBarDockControl1: TdxBarDockControl;
    cmExcluirOSRet: TdxBarButton;
    ppDBIInt: TppDBText;
    ppDBFInt: TppDBText;
    pplbIInt: TppLabel;
    pplbFInt: TppLabel;
    pplbVlTrans: TppLabel;
    ppVlTrans: TppDBText;
    ppRegion23: TppRegion;
    ppLabel111: TppLabel;
    ppDBText95: TppDBText;
    cmCorrigirOS: TdxBarButton;
    pipeDescr: TppDBPipeline;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand10: TppDetailBand;
    ppSummaryBand9: TppSummaryBand;
    ppDBText96: TppDBText;
    ppLabel121: TppLabel;
    ppDBText97: TppDBText;
    procedure cmExcluirOSRetClick(Sender: TObject);
    procedure ppDBText94GetText(Sender: TObject; var Text: string);
    procedure ppLabel119GetText(Sender: TObject; var Text: string);
    procedure ppLabel117GetText(Sender: TObject; var Text: string);
    procedure ppLabel104GetText(Sender: TObject; var Text: string);
    procedure ppLabel105GetText(Sender: TObject; var Text: string);
    procedure FormShow(Sender: TObject);
    procedure cmFimClick(Sender: TObject);
    procedure cmPreviewClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure cmApontamentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure cmUploadClick(Sender: TObject);
    procedure cmDownloadClick(Sender: TObject);
    procedure cmImpOSClick(Sender: TObject);
    procedure cmLoginClick(Sender: TObject);
    procedure cbLegendaChange(Sender: TObject);
    procedure cmCollapseClick(Sender: TObject);
    procedure cmExpandClick(Sender: TObject);
    procedure cmConfImprClick(Sender: TObject);
    procedure cmImprFasesClick(Sender: TObject);
    procedure cmImprApontaClick(Sender: TObject);
    procedure cmImprRelOSClick(Sender: TObject);
    procedure cmSetupImpClick(Sender: TObject);
    procedure ppDBText22GetText(Sender: TObject; var Text: String);
    procedure ppDBText34GetText(Sender: TObject; var Text: String);
    procedure ppDBText5GetText(Sender: TObject; var Text: String);
    procedure ppDBText13GetText(Sender: TObject; var Text: String);
    procedure cmLegendaApontaChange(Sender: TObject);
    procedure cmImpValidacaoClick(Sender: TObject);
    procedure cmSubImprimirFaseClick(Sender: TObject);
    procedure cmTransDiskClick(Sender: TObject);
    procedure ppDBText31GetText(Sender: TObject; var Text: String);
    procedure cmImpReqSugestaoClick(Sender: TObject);
    procedure cmImprimeCGPClick(Sender: TObject);
    procedure ppSucessoGetText(Sender: TObject; var Text: String);
    procedure ppDBText76GetText(Sender: TObject; var Text: String);
    procedure cmProjetoChange(Sender: TObject);
    procedure cmClienteChange(Sender: TObject);
    procedure cmZoomFaseClick(Sender: TObject);
    procedure TreeFaseClick(Sender: TObject);
    procedure TreeFaseCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure TreeFaseDblClick(Sender: TObject);
    procedure tvApontaCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvApontaOS1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure tvLogOK1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ppSummaryBand1BeforePrint(Sender: TObject);
    procedure ppRepOSStartPage(Sender: TObject);
    procedure cmCorrigirOSClick(Sender: TObject);
  private
    FView : Integer;
    FErrorSt: String;
    procedure ImprimeRA;
    procedure SetView(Value: Integer);
    function PodeAlterar: Boolean;
    function PodeApagar: Boolean;
    function NumRecords: Integer;
    procedure MostraErro;
    function ConfirmaExclusao: Boolean;
    function ActiveGrid: TcxGrid;
    procedure AjustaLogo(IM: TppImage);
    
    function PlanejamentoOk(Inicio, Fim, Horas : Boolean): Boolean;
    
    { Private declarations }
  public
    procedure AjustaHabBotoes;
    procedure RefreshZoom;
    procedure ImprimeValidacao;
    procedure ImprimeValidacaoEDT;

    property ActiveView: Integer
      read FView write SetView;
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;
  FecharTabs: Boolean;

const
  viApontamento = 0;
  viOS          = 1;
  viCGP         = 2;
  viLog         = 3;
  viDesp        = 4;
  viRA          = 5;
  viEmail       = 6;
  
  ViewSt : Array[viApontamento..viEmail] of String = (
    'Apontamento',
    'OS',
    'Comunicações Gerais de Projeto',
    'Log',
    'Despesas de Atendimento',   
    'Relatórios de Atendimento',
    'E-mail');

const
  msgItemJaSincronizado = 'Este item já foi sincronizado com o servidor!';

  RefreshInicial : Boolean = False;

implementation

uses uDTDM, uFrmLogin, uDTFrmOS, uDTFrmAponta, uChecaTabelas, uDTFrmFase,
  uDTDMSync, uDTFrmUp, uDTFrmDown, uFrmRepView, uDTGrDsk,
  uDTFrmCGP, uDTFrmRA, uDTFrmItemRA, uDTRels, uDTFrmExcluiOSServ,
  uDTFrmCorrigirOS;

{$R *.DFM}

function TFrmPri.NumRecords: Integer;
begin
  with DM do
  case ActiveView of
    viApontamento : Result := tAponta.RecordCount;
    viOS          : Result := tOS.RecordCount;
    viCGP         : Result := tSolicita.RecordCount;
    viDesp        : Result := tDesp.RecordCount;
    viRA          : Result := tRA.RecordCount;
  else
    Result := 0;
  end;
end;

function TFrmPri.ActiveGrid: TcxGrid;
begin
  case ActiveView of
    viApontamento : Result := gridAponta;
    viOS          : Result := gridOSItens;
    viDesp        : Result := gridDesp;
    viRA          : Result := gridRA;
  else
    Result := nil;
  end;
end;

function TFrmPri.PodeApagar: Boolean;
begin
  FErrorSt := '';
  Result := True;
  with DM do
  case ActiveView of
    viApontamento : begin
      if not tApontaSync.Value then begin
        Result := False;
        FErrorSt := msgItemJaSincronizado;
      end;
      if tApontaOS.Value > 0 then begin
        Result := False;
        FErrorSt := 'Já foi gerado OS para este apontamento';
      end;
    end;
    viOS : begin
      if not tOSSync.Value then begin
        Result := False;
        FErrorSt := msgItemJaSincronizado;
      end else 
      if tAuxRAOS.Locate('Cliente;Tecnico;DataOS;IDOS', 
                         VarArrayOf([tOSCliente.Value, tOSTecnico.Value, tOSData.Value, tOSID.Value]), []) then
      begin
        Result := False;
        FErrorSt := 'Não é possível apagar uma OS que faz parte de um Relatório de Atendimento';
      end;
    end;
    viDesp : 
    if (tDespIDRA.Value>0) then begin
      Result := False;
      FErrorSt := 'Não é possível apagar uma despesa que já faz parte de um RA';
    end;
    
    viCGP :
    if not tSolicitaSync.Value then begin
      Result := False;
      FErrorSt := msgItemJaSincronizado;
    end;

    viRA :
    if not tRASync.Value then begin
      Result := False;
      FErrorSt := msgItemJaSincronizado;
    end;
  end;
end;

function TFrmPri.PodeAlterar: Boolean;
begin
  FErrorSt := '';
  Result := True;
  with DM do
  case ActiveView of
    viApontamento : begin
      if (not tApontaSync.Value) and (tApontaOS.Value>0) then 
      begin
        FErrorSt := msgItemJaSincronizado;
        Result := False;
        Exit;
      end;
    end;

    viOS : begin
    end;
  end;
end;

function TFrmPri.ConfirmaExclusao: Boolean;
var St: String;
begin
  Result := False;
  with DM do
  case ActiveView of
    viApontamento : 
      St := 'do Apontamento ' +
            FormatDateTime('hh:mm', tApontaHoras.Value) + ' - ' +
            tApontaData.AsString+' ?';
    viOS : 
      St := 'da OS nº '+tOSID.AsString+' de '+tOSData.AsString+' ?';

    viCGP :
      St := 'dessa comunicação ?';  

    viDesp :
      St := 'dessa despesa ?';  

    viRA : 
      St := 'do relatório de apontamento ?';
      
  else
    Exit;  
  end;
  Result := 
    (MessageDlg('Confirma a exclusão '+St, mtConfirmation, [mbYes, mbNo], 0)=mrYes);
end;

procedure TFrmPri.cmExcluirOSRetClick(Sender: TObject);
begin
  if DM.tOSSync.Value then begin
    Beep;
    ShowMessage('Não é necessário excluir a OS na retaguarda pois ela ainda nem foi enviada. Basta Excluir');
    Exit;
  end;

  with DM do 
  if tAuxRAOS.Locate('Cliente;Tecnico;DataOS;IDOS', 
                     VarArrayOf([tOSCliente.Value, tOSTecnico.Value, tOSData.Value, tOSID.Value]), []) then
    raise Exception.Create('Essa OS faz parte de um relatório de atendimento não é possível excluir');

  if tFrmExcluiOSServ.Create(nil).ExcluirOS then
    DM.ExcluiOSServ;
end;

procedure TFrmPri.SetView(Value: Integer);
begin
  if Value = FView then Exit;
  FView := Value;
  Paginas.ActivePageIndex := Value;
  case FView of
    viApontamento : begin
      cmPreview.Visible := ivAlways;
      cmApontamento.Down := True;
      cmPreview.Down := tvAponta.Preview.Visible;
    end;

    viOS : begin
      cmOS.Down := True;
      cmPreview.Down := tvOSItens.Preview.Visible;
    end;

    viLog : cmLog.Down := True;

    viDesp : begin
      cmPreview.Visible := ivAlways;
      cmPreview.Down    := tvDesp.Preview.Visible;
    end;

    viRA : begin
      cmPreview.Visible := ivAlways;
      cmPreview.Down := tvRAItem.Preview.Visible;
    end;  
  end;

  cmImpOS.Enabled := (FView = viOS);

  if FView in [viApontamento, viOS, viRA, viDesp] then
    cmPreview.Visible := ivAlways
  else
    cmPreview.Visible := ivNever;
end;

procedure TFrmPri.AjustaHabBotoes;
var
  I : Integer;
  BI : TdxBarItem;
begin
  Paginas.Visible := not lAbort;
  with BarMgr do
  for I := 0 to pred(ItemCount) do begin
    BI := Items[I];
    if not (BI is TdxBarSubItem) and
       (BI <> cmFim) and
       (BI <> cmOpcoes) and
       (BI <> cmSobre) and
       (BI <> cmDownload) and
       (BI <> cmLogin) then
      BI.Enabled := not lAbort;
  end;
end;

procedure TFrmPri.FormShow(Sender: TObject);
var lVazio : Boolean;
begin
  lVazio := False;
  with TFrmChecaBD.Create(nil) do
  ShowModal;
  DM.AbreDB;
  if DM.tTec.RecordCount > 0 then begin
    with TFrmLogin.Create(nil) do
    ShowModal;
  end else begin
    IDTecnico := '';
    NomeTecnico := '';
    DM.FiltraOS;
    lVazio := True;
    lAbort := True;
  end;
  AjustaHabBotoes;
  Inicializando := False;
  cmCliente.Text := DM.qCliNome.Value;
  cmProjeto.Text := DM.tProjNome.Value;
  DM.FiltraOS;
  ActiveView := viApontamento;
  if not DM.tParametroPermiteApagarOSSincronizada.Value then
    cmExcluirOSRet.Visible := ivNever else
    cmExcluirOSRet.Visible := ivAlways;

  if not DM.tParametroPermiteCorrigirOS.Value then
    cmCorrigirOS.Visible := ivNever else
    cmCorrigirOS.Visible := ivAlways; 
    
//  sdxPanelText := 'Arraste uma coluna para agrupamento';
  
  If lVazio then
  Begin
    cmDownloadClick(nil);
    //Posiciona o técnico
    DM.tTec.Locate('ID',IDTecnico,[]);
    FrmPri.Caption := 'Diário do Técnico ['+DM.tTecNome.Value+']';
  End;

  TreeFase.FullExpand;
  cmZoomFase.Down := False;
  RefreshZoom;
  DM.SomaHR(False);
end;
 
procedure TFrmPri.cmFimClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPri.RefreshZoom;
begin
  splitFase.Visible := (not cmZoomProj.Down) and (not cmZoomAponta.Down);
  splitAponta.Visible := (not cmZoomProj.Down) and (not cmZoomFase.Down);
end;

procedure TFrmPri.cmPreviewClick(Sender: TObject);
var TV: TcxGridTableView;
begin
  with ActiveGrid do
  if ActiveGrid <> nil then begin
    TV := TcxGridTableView(ActiveGrid.Views[0]);
    TV.Preview.Visible := cmPreview.Down;
  end;
end;

procedure TFrmPri.MostraErro;
begin
  if FErrorSt = '' then Exit;
  Beep;
  ShowMessage(FErrorSt);
  FErrorSt := '';
end;

procedure TFrmPri.cmEditarClick(Sender: TObject);
var HorasA: TDateTime;
begin
  if NumRecords=0 then Exit;
  //if not PodeAlterar then begin
  //  MostraErro;
  //  Exit;
  //end;
  case ActiveView of
    viApontamento : begin
      HorasA := DM.tFaseHoras.Value;
      with TFrmAponta.Create(nil) do
      Edita;
      if HorasA <> DM.tFaseHoras.Value then
        DM.tFase.Refresh;
    end;
    viOS : begin
      with TFrmOS.Create(nil) do
      EditaOS;
      DM.tOSItens.Refresh;
      DM.tFase.Refresh;
      DM.tAponta.Refresh;
    end;

    viCGP : TFrmCGP.Create(Self).Editar;
    viRA : begin
      Application.CreateForm(TFrmRA, FrmRA);
      FrmRA.Editar;
    end;
    viDesp : 
      if not DM.tDesp.IsEmpty then     
        TFrmItemRA.Create(Self).Editar(DM.tDesp);
  end;
end;

procedure TFrmPri.PaginasChange(Sender: TObject);
begin
  ActiveView := Paginas.ActivePageIndex;
  if (ActiveView = 1) and (not RefreshInicial) then begin
    RefreshInicial := True;
    DM.tOSItens.Refresh;
    GridOSItens.Refresh;
  end;  
end;

procedure TFrmPri.cmApontamentoClick(Sender: TObject);
begin
  ActiveView := TdxBarButton(Sender).Tag;
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  FView := -1;
  FErrorSt := '';
  IDTecnico := '';
  NomeTecnico := '';
  SenhaTec := '';
  lAbort   := False;
end;

function TFrmPri.PlanejamentoOk(Inicio, Fim, Horas : Boolean): Boolean;
begin
  Result := False;
  with DM do 
  if Inicio then 
  if tFaseDatReI.IsNull or (tFaseDatReI.Value=0) then 
  if FormatDateTime('yyyymmdd', Date) > FormatDateTime('yyyymmdd', tFaseInicio.Value) then
  begin
    Beep;
    ShowMessage('Data maior que data programada para Inicio!');
    Exit;
  end;  

  with DM do 
  if Fim then
  if FormatDateTime('yyyymmdd', Date) > FormatDateTime('yyyymmdd', tFaseTermino.Value) then
  begin
    Beep;
    ShowMessage('Data maior que data programada para Término!');
    Exit;
  end;  

  with DM do 
  if Horas then 
  if tFaseHorasReal.Value >= tFaseHoras.Value then      
  begin
    Beep;
    ShowMessage('As horas previstas para esta fase já foram realizadas!');
    Exit;
  end;  

  Result := True;
end;

procedure TFrmPri.cmNovoClick(Sender: TObject);
var B : TBookmark;
begin
  with DM do
  case ActiveView of
    viApontamento : begin
      if (Date>tParametroDataDown.Value) and 
         ((Date-tParametroDataDown.Value)>tParametroMaxDiasDown.Value) then begin
        Beep;
        ShowMessage('Download muito antigo ... faça novo download! (Ultimo Download em '+
                    FormatDateTime('dd/mm/yyyy', tParametroDataDown.Value)+')');
        Exit;
      end;

      if tFaseSumario.Value then begin
        Beep;
        ShowMessage('Não é possível apontar em fase sumário!');
        Exit;
      end;

      if (tProjLocaRec.Value='S') and not 
         tFaseTec.FindKey([tFaseCliente.Value, tFaseProjeto.Value, tFaseID.Value, IDTecnico]) then
      begin
        Beep;
        ShowMessage('Não está previsto a sua participação nessa fase do projeto!');
        Exit;
      end;   

      with tProjLocaPla do
      if not PlanejamentoOk((Value=lpHoraInicio) or (Value=lpTotal), 
                            (Value=lpHoraFim) or (Value=lpTotal),
                            (Copy(Value, 1, 1)='H')) then Exit;

{      if ExisteAponta(tFaseCliente.AsString, tFaseProjeto.AsString, tFaseID.AsString)
      then begin
        Beep;
        ShowMessage('Já existe um apontamento seu para esta fase hoje!');
        Exit;
      end;}

      if (tFaseStatus.Value = 'C') or (tFaseStatus.Value='V') then
      begin
        Beep;
        ShowMessage('Esta fase já foi concluída!');
        Exit;
      end;
      B := tFase.GetBookmark;
      try
        with TFrmAponta.Create(nil) do
        Novo;
        tFase.Refresh;
        tAponta.Refresh;
      finally
        tFase.GotoBookmark(B);
        tFase.FreeBookmark(B);
      end;
    end;

    viOS : begin
      with TFrmOS.Create(nil) do
      NovaOS;
      tOSItens.Refresh;
      tFase.Refresh;
      tAponta.Refresh;
    end;

    viCGP :  TFrmCGP.Create(Self).Novo;
    viDesp : TFrmItemRA.Create(Self).Novo(tDesp);
    viRA : begin
      Application.CreateForm(TFrmRA, FrmRA);
      FrmRA.Novo;
    end;
  end;
end;

procedure TFrmPri.cmApagarClick(Sender: TObject);
begin
  if NumRecords=0 then Exit;
  if not PodeApagar then begin
    MostraErro;
    Exit;
  end;
  with DM do 
  if ConfirmaExclusao then
  case ActiveView of
    viApontamento : begin
      DM.ApagaApontamento;
      DM.tFase.Refresh;
    end;
    viOS : begin
      DM.ApagaOS;
      DM.tAponta.Refresh;
      DM.tOSItens.Refresh;
      DM.tFase.Refresh;
    end;  
    viCGP : DM.ApagaCGP;
    viDesp : 
    if tDespOnServ.Value then begin
      tDesp.Edit;
      tDespExcluirServ.Value := True;
      tDesp.Post;
      Beep;
      ShowMessage('Já havia sido feito um upload dessa despesa. Ela foi apagada no client, ' +
                  'mas só será efetivamente apagada do servidor durante o próximo upload.');
    end else
      tDesp.Delete;
    
    viRA : with DM do begin
      nxdb.StartTransactionWith([tRA, tRAOS, tRAItem]);
      try
        tRAOS.First;
        while not (tRAOS.Eof and tRAOS.Bof) do tRAOS.Delete;
        tRAItem.First;
        while not (tRAItem.Eof and tRAItem.Bof) do begin
          tRAItem.Edit;
          tRAItemIDRA.Clear;
          tRAItem.Post;
        end;
        tRA.Delete;
        nxdb.Commit;
        tDesp.Refresh;
      except
        nxdb.Rollback;
        Raise;
      end;
    end;
  end;
end;

procedure TFrmPri.cmUploadClick(Sender: TObject);
begin
  UploadSemOS := DM.tParametroUploadApontamentoSemOS.Value;

  DM.FechaDB;
  try
    DMSync := TDMSync.Create(nil);
    try
      with TFrmUP.Create(nil) do
      ShowModal;
    finally
      DMSync.Free;
      DMSync := nil;
    end;
  finally
    DM.AbreDB;
    DM.FiltraOS;
  end;
  with DM do
  if UploadOK then begin
    ActiveView := viLog;
    tLog.Last;
    cmImprimeCGPClick(nil);
    
    tAuxFase.First;
    while not tAuxFase.Eof do begin
      Application.ProcessMessages;
      if tAuxFase.FieldByName('FlagSug').AsString = 'NP' then begin
        tAuxFase.Edit;
        tAuxFase.FieldByName('FlagSug').AsString := 'AN';
        tAuxFase.Post;
      end;
      tAuxFase.Next;
    end;  
  end;
end;

procedure TFrmPri.cmDownloadClick(Sender: TObject);
begin
  DM.FechaDB;
  cmCliente.Listsource := nil;
  try
    DMSync := TDMSync.Create(nil);
    try
      with TFrmDown.Create(nil) do
      ShowModal;
    finally
      DMSync.Free;
      DMSync := nil;
    end;
  finally
    DM.AbreDB;
    if not DM.tParametroPermiteCorrigirOS.Value then
      cmCorrigirOS.Visible := ivNever else
      cmCorrigirOS.Visible := ivAlways; 
    
    if not DM.tParametroPermiteApagarOSSincronizada.Value then
      cmExcluirOSRet.Visible := ivNever else
      cmExcluirOSRet.Visible := ivAlways;
    
    cmCliente.Listsource := DM.dsCli;
    DM.FiltraOS;
  end;
  
  with DM do begin
    tParametro.First;
    tParametro.Edit;
    tParametroDataDown.Value := Date;
    tParametro.Post;
  end;  
  
  lAbort := FecharTabs;
  AjustaHabBotoes;
end;

procedure TFrmPri.cmImpOSClick(Sender: TObject);
var S: String;
begin
{  AjustaLogo(ppLogoOS);}
  ppLinhaProj1.Visible := DM.tParametroImprimeAndamentoProjeto.Value;
  ppLinhaProj2.Visible := ppLinhaProj1.Visible;
  ppLinhaProj3.Visible := ppLinhaProj1.Visible;
  pplbHorasPrev.Visible := ppLinhaProj1.Visible;
  pplbHorasReal.Visible := ppLinhaProj1.Visible;
  pplbPosicao.Visible := ppLinhaProj1.Visible;
  ppdbHorasReal.Visible := ppLinhaProj1.Visible;
  ppdbHorasPrev.Visible := ppLinhaProj1.Visible;
  ppdbPosicao.Visible := ppLinhaProj1.Visible;

  with DM do begin
    mtDescr.Active := False;
    mtDescr.MasterSource := nil;
  
    tOSItens.First;
    mtDescr.Active := True;
    mtDescr.EmptyTable;
    while not tOSItens.Eof do begin
      s := CalcDesc(tOSItensCliente.Value,
               tOSItensProjeto.Value,
               tOSItensFase.Value,
               tOSItensTecnico.Value,
               tOSItensItem.Value,
               True);
      tOSItens.Next;
    end;
    mtDescr.MasterSource := dsOSItems;
  end;

  with TFrmRepView.Create(nil) do
  Mostra(ppRepOS);
end;

procedure TFrmPri.cmLoginClick(Sender: TObject);
begin
  lAbort := False;
  if DM.tTec.RecordCount > 0 then begin
    with TFrmLogin.Create(nil) do
    ShowModal;
  end else begin
    IDTecnico := '';
    NomeTecnico := '';
    DM.FiltraOS;
  end;
  AjustaHabBotoes;
  cmCliente.Text := DM.qCliNome.Value;
  cmProjeto.Text := DM.tProjNome.Value;
  DM.FiltraOS;
  ActiveView := viApontamento;
end;

procedure TFrmPri.cbLegendaChange(Sender: TObject);
begin
   cbLegenda.ItemIndex := -1;
   cbLegenda.Text      := 'Legenda';
end;

procedure TFrmPri.cmCollapseClick(Sender: TObject);
begin
   TreeFase.FullCollapse;
end;

procedure TFrmPri.cmExpandClick(Sender: TObject);
begin
   TreeFase.FullExpand;
end;

procedure TFrmPri.cmConfImprClick(Sender: TObject);
begin
   dlCfgImp.Execute;
end;

procedure TFrmPri.cmCorrigirOSClick(Sender: TObject);
begin
  if IDTecnico<>DM.tOSTecnico.Value then Exit;
  
  TFrmCorrigirOS.Create(Self).Editar;
end;

procedure TFrmPri.cmImprFasesClick(Sender: TObject);
begin
//  cpGrids.Preview(True,cpGridsLkTreeFase);
end;

procedure TFrmPri.cmImprApontaClick(Sender: TObject);
begin
//   cpGrids.Preview(True,cpGridsLkGridAponta);
end;

procedure TFrmPri.cmImprRelOSClick(Sender: TObject);
begin
//   cpGrids.Preview(True,cpGridsLkGridOS);
end;

procedure TFrmPri.cmSetupImpClick(Sender: TObject);
begin
   dlSetupImp.Execute;
end;

procedure TFrmPri.ImprimeRA;
var 
  T: Double;
  S, SIndex: String;
begin
  Application.CreateForm(TdmRels, dmRels);
  with DM do 
  try
    dsRAOS.Dataset := nil;
    dsRAItem.Dataset := nil;
    S := '(Tipo <> 4)';
    if qCliKM.Value<1 then
      S := S + ' and (Tipo<>0)';
    if qCliVlPedag.Value<1 then
      S := S + ' and (Tipo<>1)';
    if not qCliPgAlim.Value then
      S := S + ' and (Tipo<>2)';
    if not qCliPgHosp.Value then
      S := S + ' and (Tipo<>3)'; 
    
    tRAItem.Filter := S;
    tRAItem.Filtered := True;
    SIndex:= tRAItem.IndexName;
    tRAItem.IndexName := 'IRAData';
    try
      T := 0;
      tRAItem.First;
      while not tRAItem.Eof  do begin
        if tRAItemTipo.Value<>tiraKM  then 
          T := T + tRAItemValor.Value;
        tRAItem.Next;
      end;
      tRAItem.First;
      dmRels.frRA.Variables['TotalDesp'] := FloatToStrF(T, ffCurrency, 10, 2) + ' (2)'+#13#10;
      dmRels.frRA.ShowReport(False);
    finally
//      tRAItem.IndexName := SIndex;
    end;
  finally
    tRAItem.Filtered := False;
    tRAItem.Filter := '';
    tRAItem.OnFilterRecord := nil;
    dsRAOS.Dataset := tRAOS;
    dsRAItem.Dataset := tRAItem;
    dmRels.Free;
  end;
end;

procedure TFrmPri.ImprimeValidacao;
begin
  with DM do
  if tFaseStatus.Value <> 'V' then 
    ShowMessage('Fase não validada')
  else 
  begin 
    //Verifica se existem OS a serem montadas
    tAponta.First;
    while not tAponta.Eof do begin
      if tApontaOS.Value = -1 then begin
        Beep;
        ShowMessage('Existe(m) OS a ser(em) montada(s)');
        Exit;
      end;  
      tAponta.Next;
    end;

    try
      // Troca de indice para que os apontamentos saiam em ordem de data
      tAponta.IndexName := 'IProjFaseData';
      tAponta.First;
      TFrmRepView.Create(Self).Mostra(ppRepVal);
    finally
      tAponta.IndexName := 'IProjFase';
    end;
    
  end;  
end;

procedure TFrmPri.ppDBText22GetText(Sender: TObject; var Text: String);
begin
  if DM.tApontaSync.Value then
    Text := 'N'
  else
    Text := 'S';
end;

procedure TFrmPri.ppDBText34GetText(Sender: TObject; var Text: String);
begin
  while Length(Text) < 2 do Text := '0' + Text;
end;

procedure TFrmPri.ppDBText5GetText(Sender: TObject; var Text: String);
begin
  if DM.tOSSync.Value then
    Text := 'N'
  else
    Text := 'S';
end;

procedure TFrmPri.ppDBText13GetText(Sender: TObject; var Text: String);
begin
  if FormatDateTime('hh:mm', DM.tOSAbono.Value) = '00:00' then
    Text := '';
end;

procedure TFrmPri.cmLegendaApontaChange(Sender: TObject);
begin
  cmLegendaAponta.ItemIndex := -1;
  cmLegendaAponta.Text      := 'Legenda';
end;

procedure TFrmPri.cmImpValidacaoClick(Sender: TObject);
begin
  if DM.tFaseSumario.Value then
    ImprimeValidacaoEDT
  else  
    ImprimeValidacao;
end;

procedure TFrmPri.cmSubImprimirFaseClick(Sender: TObject);
begin
   If DM.tFaseStatus.Value = 'V' then
      cmImpValidacao.Enabled := True
   else
      cmImpValidacao.Enabled := False;

   if (DM.tFaseFlagSug.Value <> 'NN') and (DM.tFaseFlagSug.Value <> '') then
     cmImpReqSugestao.Enabled := True
   else
     cmImpReqSugestao.Enabled := False;
        
end;

procedure TFrmPri.cmTransDiskClick(Sender: TObject);
begin
   TFrmGrDsk.Create(Self).ShowModal;
end;

procedure TFrmPri.ppDBText31GetText(Sender: TObject; var Text: String);
var P: Integer;
begin
  P := Pos('.', Text);
  if P > 0 then
    Text[P] := ',';
  P := Pos(',', Text);
  if P > 0 then
    Text := Copy(Text, 1, P+2);
end;

procedure TFrmPri.cmImpReqSugestaoClick(Sender: TObject);
begin
{  AjustaLogo(ppLogoSug);}
  with TFrmRepView.Create(nil) do
  Mostra(ppRepSug)
end;

procedure TFrmPri.cmImprimeCGPClick(Sender: TObject);
begin
  case ActiveView of
    viCGP : begin
      if DM.tSolicita.RecordCount=0 then Exit;
      with TFrmRepView.Create(nil) do
      Mostra(ppRepCGP)
    end;  
    viLog : begin
      if DM.tLog.RecordCount=0 then Exit;
      with TFrmRepView.Create(nil) do
      Mostra(ppUpload);
    end;  
    viRA : if not DM.tRA.IsEmpty then ImprimeRA;
  end   
end;

procedure TFrmPri.AjustaLogo(IM: TppImage);
begin
  with DM do 
  if tTec.FindKey([IDTecnico]) then
  if tTecEmpresa.Value = '888' then
    IM.Picture.Assign(Logos.Items[0].Bitmap)
  else
  if tTecEmpresa.Value = '777' then
    IM.Picture.Assign(Logos.Items[1].Bitmap);
end;

procedure TFrmPri.ppSucessoGetText(Sender: TObject; var Text: String);
begin
  if DM.tLogOk.Value then
    Text := 'Sim'
  else
    Text := 'Não';  
end;

procedure TFrmPri.ppSummaryBand1BeforePrint(Sender: TObject);
begin
  pplbIInt.Visible := (DM.tOSObrigaInt.Value = 'S');
  ppDBIInt.Visible := pplbIInt.Visible;
  pplbFInt.Visible := pplbIInt.Visible;
  ppDBFInt.Visible := pplbIInt.Visible;
end;

procedure TFrmPri.ppDBText76GetText(Sender: TObject; var Text: String);
begin
  if DM.tOSGeraReemb.Value then
    Text := 'Sim'
  else
    Text := 'Não';
end;

procedure TFrmPri.ppDBText94GetText(Sender: TObject; var Text: string);
begin
  with DM do 
  Text := ZeroPad(tRAOSCliente.Value,6) +
                  tRAOSTecnico.Value +
                  FormatDateTime('yyyymmdd', tRAOSDataOS.Value) +
                  ZeroPad(tRAOSIDOS.AsString, 4);
end;

procedure TFrmPri.ppLabel104GetText(Sender: TObject; var Text: string);
begin
  Text := DM.tRACliente.Value + '-' + DM.tRANomeCli.Value;
end;

procedure TFrmPri.ppLabel105GetText(Sender: TObject; var Text: string);
var V: Variant;
begin
  V := DM.tTec.Lookup('ID', DM.tRATecnico.Value, 'Nome'); 
  if V=null then V := '';
  Text := DM.tRATecnico.Value + '-' + V;
end;

procedure TFrmPri.ppLabel117GetText(Sender: TObject; var Text: string);
begin
  case DM.tRAItemTipo.Value of
    tiraKM : Text := 'Kilometragem';
    tiraPedagio: Text := 'Pedágio';
    tiraRefeicao: Text := 'Alimentação';
    tiraHospedagem: Text := 'Hospedagem';
  end;
end;

procedure TFrmPri.ppLabel119GetText(Sender: TObject; var Text: string);
begin
  if DM.tRAItemTipo.Value=tiraKM  then
    Text := IntToStr(Trunc(DM.tRAItemValor.Value))+'KM (1)'
  else
    Text := FloatToStrF(DM.tRAItemValor.Value, ffCurrency, 10, 2);  
end;

procedure TFrmPri.ppRepOSStartPage(Sender: TObject);
begin
  ppVlTrans.Visible := (DM.tOSVlTrans.Value>0.009);
  pplbVlTrans.Visible := ppVlTrans.Visible;
end;

procedure TFrmPri.cmProjetoChange(Sender: TObject);
begin
  DM.SomaHR(False);
end;

procedure TFrmPri.cmClienteChange(Sender: TObject);
begin
  DM.SomaHR(False);
end;

procedure TFrmPri.cmZoomFaseClick(Sender: TObject);
begin
  splitAponta.Visible := not cmZoomFase.Down;
end;

procedure TFrmPri.ImprimeValidacaoEDT;
begin
 with DM do
  if tFaseStatus.Value <> 'V' then 
    ShowMessage('Fase não validada')
  else 
  begin 
    //Verifica se existem OS a serem montadas
    tAponta.First;
    while not tAponta.Eof do begin
      if tApontaOS.Value = -1 then begin
        Beep;
        ShowMessage('Existe(m) OS a ser(em) montada(s)');
        Exit;
      end;  
      tAponta.Next;
    end;

    TFrmRepView.Create(Self).Mostra(ppValEdt);
  end;  
end;

procedure TFrmPri.TreeFaseClick(Sender: TObject);
begin
  if DM.tFaseStatus.Value = 'V' then
     cmImpValidacao.Enabled := True
  else
     cmImpValidacao.Enabled := False;
end;

procedure TFrmPri.TreeFaseCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
var
  V : Variant;
begin
  V := AViewInfo.Node.Values[TreeFaseSumario.ItemIndex];
  with ACanvas do 
  if (V <> null) and (V=True) then
    Canvas.Font.Style := Canvas.Font.Style + [fsBold]
  else
    Canvas.Font.Style := Canvas.Font.Style - [fsBold];
end;

procedure TFrmPri.TreeFaseDblClick(Sender: TObject);
begin
  with DM do begin
    if tFaseSumario.Value and (not tParametroValidarEdt.Value) then begin
      Beep;
      ShowMessage('Não é possível editar uma fase sumário');
      Exit;
    end;
    TFrmFase.Create(Self).ShowModal;
    if tFaseSumario.Value then begin
      tFase.Refresh;
      TreeFase.Refresh;
    end;  
  end;  
end;

procedure TFrmPri.tvApontaCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var 
  OS: Variant;  
  Tec: Variant;
begin                
  if AViewInfo.Item = tvApontaDescr then Exit;

  with AViewInfo do begin      
    if Focused or Selected then Exit;
    OS := GridRecord.Values[tvApontaOS1.Index];
    Tec := GridRecord.Values[tvApontaTecnico1.Index];
    with ACanvas do
    if (OS <> null) and (Tec <> null) then begin
      if Tec <> IDTecnico then
        Canvas.Brush.Color := clYellow
      else
      if (OS = -1) then
        Canvas.Brush.Color := clWhite
      else begin
        Canvas.Brush.Color := clRed;
        Canvas.Font.Color := clWhite;
      end;  
    end;  
  end;      
end;

procedure TFrmPri.tvApontaOS1GetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: String);
begin
  if AText = '-1' then
    AText := '';
end;

procedure TFrmPri.tvLogOK1CustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  V : Variant;  
begin
  V := AViewInfo.GridRecord.Values[tvLogOK1.Index];
  if (V<>null) and (VarType(V)=varBoolean) then
  if V=True then
    ACanvas.Canvas.Brush.Color := clGreen
  else
    ACanvas.Canvas.Brush.Color := clRed;  
end;

end.
