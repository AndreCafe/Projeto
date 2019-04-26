unit ncFrmPrintReview;
{
    ResourceString: Dario 13/03/13
}
{  Lógica de pastas
    0 = acabou de ser criado
    1 = pasta onde ficam PDF's que precisam ser revisados pelo usuário
    2 = pasta onde ficam PDF's que foram aprovados e falta enviar pro servidor ... qdo terminar de enviar pro serv apaga o arquivo
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,
  ExtCtrls, Menus, cxButtons,
  dxGDIPlusClasses, 
  dxLayoutControlAdapters,
  cxImage, cxLabel, 
  ncPRThumbsScrollBox, 
  ncPRPagesScrollBox,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxRadioGroup, cxGroupBox, cxClasses,
  Int64List, cxCheckBox, 
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  cxControls, cxContainer, cxEdit, 
  AppEvnts, ImgList, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel,
  LMDCustomScrollBoxExt, LMDScrollBoxExt, cxProgressBar, 
  LMDCustomScrollBox, LMDScrollBox, ncPRConsts, SsBase, StShlCtl, 
  dxBar, dxBarExtItems, LMDSimplePanel,
  cxStyles, LMDPNGImage, ncPRFrmEtapas, LMDButtonControl, LMDCustomCheckBox,
  LMDCheckBox;

const

    kAppTittle = 'Impressão';
     kNaoImprimirEsta =  'NÃO IMPRIMIR esta página';
    kImprimirEsta =  'IMPRIMIR esta página';

type
  TncConfirmouImpEvent = procedure (Sender: TObject; aInfo: TStrings) of object;

  TncArqReview = class
  private
    procedure OnTerminateExt(Sender: TObject);
  public 
    arID        : Integer;
    arArq       : String;
    arDocTitle  : String;
//    arThExt     : TThreadExtImgs;
    arLastPgExt : Integer;
    arCreating  : Boolean;
    arIni       : TStrings;
    arPgCount,
    arThumbW,
    arThumbH,
    arBmpW,
    arBmpH      : Integer;
  public
    constructor Create(aArq: String; aArqID: Integer; aCreating: Boolean = False);

    constructor CreateFromInfo(aInfo: TStrings);

    procedure DeleteArqs;

    function CanShow: Boolean;

    function ExtAll: Boolean;

    procedure CancelExtImgs;

    destructor Destroy; override;
  end;


  TFrmPrintReview = class(TForm)
    TimerPrintTipo: TTimer;
    cxEditStyleController1: TcxEditStyleController;
    PanelFundo: TPanel;
    cxImageList1: TcxImageList;
    PanelRight: TPanel;
    StShellNotification1: TStShellNotification;
    Timer1: TTimer;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    cmImprimir: TdxBarLargeButton;
    im32: TcxImageList;
    cmCancelar: TdxBarLargeButton;
    TimerCheckPDF: TTimer;
    cmZoomIn: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    cmNext: TdxBarLargeButton;
    cmPrior: TdxBarLargeButton;
    cmPagAtual: TdxBarStatic;
    dxBarDockControl1: TdxBarDockControl;
    dxBarPopupMenu1: TdxBarPopupMenu;
    TimerShowModal: TTimer;
    panThumbs: TLMDSimplePanel;
    PanelThumbs: TPanel;
    PB: TcxProgressBar;
    panCentral: TLMDSimplePanel;
    PanelViewerArea: TPanel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    panSimNao: TLMDSimplePanel;
    cmSair: TdxBarLargeButton;
    dxBarDockControl2: TdxBarDockControl;
    dxBarManager1Bar2: TdxBar;
    cmTipoImp: TdxBarLargeButton;
    cmPagValor: TdxBarLargeButton;
    cxStyle3: TcxStyle;
    panBtn: TLMDSimplePanel;
    btnCancelar: TcxButton;
    btnAlteraTipo: TcxButton;
    panImprimir: TLMDSimplePanel;
    Image1: TImage;
    cxLabel1: TcxLabel;
    lbFolhas: TcxLabel;
    lbCusto: TcxLabel;
    cbNaoImp: TLMDCheckBox;
    btnSair: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TimerPrintTipoTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure cmImprimirClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure TimerCheckPDFTimer(Sender: TObject);
    procedure cmZoomInClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure cmNextClick(Sender: TObject);
    procedure cmPriorClick(Sender: TObject);
    procedure TimerShowModalTimer(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure cmSairClick(Sender: TObject);
    procedure cmTipoImpClick(Sender: TObject);
    procedure panCentralResize(Sender: TObject);
    procedure lbSimClick(Sender: TObject);
    procedure cbNaoImpClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    FAtivo : Boolean;
    FLastWc : TWinControl;
    fdefPrinterId : integer;
    fTipo : Integer;
    fPaginaAtual : integer;
    fDontPrint : Array of Integer;
    fPasta1 : string;
    fPasta2 : string;
    fLastOpen: String;
    fNomeArq : String;
    fOriginalFileName : string;
    fSession : integer;
    fThumbsScrollBox: TThumbsScrollBox;
    fPagesScrollBox: TPagesScrollBox;
    fProcList : TStringList;
    FOnConfirmouImp : TncConfirmouImpEvent;
    FOnCancelouImp : TncConfirmouImpEvent;
    FOnCreatingDoc : TNotifyEvent;
    lp : integer;
    fShowForm : TCustomForm;
    fPREtapas : TFrmPREtapas;
    FArqs : TList;
    fNomeAtual: String;
    FSessao: Cardinal;
    FGUIDMsg : TGUID;
    FImprimirPag : Boolean;


    procedure StartLoad;
    
    procedure ClearDontPrint;
    function DontPrintIndex(aPagNum: Integer): Integer;
    procedure SetImprimir(aPagNum: Integer);
    procedure SetNaoImprimir(aPagNum: Integer);
    procedure SetImprimirPag(const Value: Boolean);

    Property ImprimirPag: Boolean
      read FImprimirPag write SetImprimirPag;

    function NaoImprimir(aPagNum: Integer): Boolean;

    function NaoImpStr: String;
    

    procedure WM_EXTRACTIMG_START(var msg : TMessage); message WM_PR_EXTRACTIMG_START;
    procedure WM_EXTRACTIMG_PROGRESS(var msg : TMessage); message WM_PR_EXTRACTIMG_PROGRESS;
    procedure WM_NEWDOC(var msg : TMessage); message WM_PR_NEWDOC;
    procedure WM_EXTRACTIMG_ERROR(var msg : TMessage); message WM_PR_EXTRACTIMG_ERROR;
    procedure WM_CREATINGDOC(var msg : TMessage); message WM_PR_CREATINGDOC;

    function FindArqReview(aNome: String): TncArqReview;
    function FindArqReviewByID(aID: Integer): TncArqReview;

    function ImgPath: String;

    procedure LoadNaoImp;

    procedure PosicionaSimNao;
    
    procedure AddArq(S: String; aID: Integer; aCreating: Boolean = False);
    function  findNextPDF:boolean;
    function  openNextPDF: Boolean;
    procedure goToPage(aPageNum:integer);
    function  formataPreco(v:double):string;
    procedure calculaTotal;
    procedure cancelarImpressao;
    procedure cancelarExtImgs;
    procedure zerarImpressao;
    procedure fThumbsScrollBoxOnThumbClick(Sender: TObject; aPageNum:integer);
    procedure fPagesScrollBoxOnBMPClick(Sender: TObject; aPageNum:integer);
    //procedure fPagesScrollBoxOnFirstBmp(Sender: TObject; aTotPages, aThumbWidth, aThumbHeight, aBmpWidth, aBmpHeight:integer);
    procedure fPagesScrollBoxOnIniRead(Sender: TObject; aTotPages, aThumbWidth, aThumbHeight, aBmpWidth, aBmpHeight:integer);
    procedure fPagesScrollBoxPageChange(Sender: TObject; aPageNum: integer);
    procedure fPagesScrollBoxOnDblClick(Sender: TObject; aPageNum:integer);
    procedure fPagesScrollBoxStatusChange(Sender: TObject; aPageNum:integer);
    procedure SetImagesStatusPrintButton(aPageNum:integer);
    procedure PanelProgressVisivel(value:boolean);
    procedure SetAtivo(const Value: Boolean);
    procedure SetNomeAtual(const Value: String);
    function GetGuardSide: Boolean;
    procedure SetPrintTipo(const Value: Integer);

    procedure ObtemPrintTipo(aCancelar: Boolean);
    procedure ObtemPrintTipoEtapas;
    
    function ArqAtual: TncArqReview;

    property NomeAtual : String
      read fNomeAtual write SetNomeAtual;
    //procedure LoadConfig;
    { Private declarations }
  protected
    procedure CreateParams(var Params: TCreateParams); override;

    procedure COnfirmarImpressao;

    procedure OnLoadNaoImp(Sender: TObject);
  public
    procedure ShowDoc(aInfo: TStrings);

    procedure MouseWheelHandler(var Message: TMessage); override;

    function PrintablePageCount: Integer;
    function PageCount: Integer;

    property OnCreatingDoc: TNotifyEvent 
      read FOnCreatingDoc write FOnCreatingDoc;

    property PrintTipo: Integer
      read fTipo write SetPrintTipo;
    
    property GuardSide: Boolean
      read GetGuardSide;
      
    { Public declarations }
    property Sessao: Cardinal
      read FSessao write FSessao;

    property OnConfirmouImp: TncConfirmouImpEvent
      read FOnConfirmouImp write FOnConfirmouImp;  

    property OnCancelouImp: TncConfirmouImpEvent
      read FOnCancelouImp write FOnCancelouImp;  
      
    function TemImp: Boolean;
    property Ativo: Boolean
      read FAtivo write SetAtivo;
  end;

var
  FrmPrintReview: TFrmPrintReview;
  gWndParent : HWND;
  gTemAd : Boolean = False;
  
  {$IFDEF NOLOG}
  GApplicationPath :string;
  {$ENDIF}

implementation

uses
    gtPDFClasses,
    {$IFNDEF NOLOG}
    uLogs,
    {$ENDIF}
    gtPDFDoc,
    madRemote,
    TLHelp32,
    ncDeleteFiles,
    strUtils, 
    madCodeHook,
    madKernel,
    ncPRBaseClasses,
    ncTipoImp, 
    ncPRFrmPrintTipo,
    ncDebug, 
    ncImgImp, ncClassesBase, ncShellStart;

// START resource string wizard section
resourcestring
  SConfirmaImpressão = 'Confirma Impressão';
  SLiberarImpressão = 'Liberar Impressão';
  SReviseSuaImpressão = 'Revise sua impressão';
  SFolhas = ' folhas';
  SFolha = ' folha';
  STipoDeImpressão = 'Tipo de Impressão';
  SFolha_1 = 'Folha ';
  SDe = ' de ';
  SNãoImprimirAFolha = 'Não imprimir a folha ';
  SZerandoTrabalho = 'zerando trabalho';

// END resource string wizard section


{$R *.dfm}



function WinExecAndWait32(FileName: string; Visibility: Integer; aWait: Boolean): Longword;
var { by Pat Ritchey }
  zAppName: array[0..512] of Char;
  zCurDir: array[0..255] of Char;
  WorkDir: string;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  StrPCopy(zAppName, FileName);
  GetDir(0, WorkDir);
  StrPCopy(zCurDir, WorkDir);
  FillChar(StartupInfo, SizeOf(StartupInfo), #0);
  StartupInfo.cb          := SizeOf(StartupInfo);
  StartupInfo.dwFlags     := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  if not CreateProcess(nil,
    zAppName, // pointer to command line string
    nil, // pointer to process security attributes
    nil, // pointer to thread security attributes
    False, // handle inheritance flag
    CREATE_NEW_CONSOLE or // creation flags
    NORMAL_PRIORITY_CLASS,
    nil, //pointer to new environment block
    nil, // pointer to current directory name
    StartupInfo, // pointer to STARTUPINFO
    ProcessInfo) // pointer to PROCESS_INF
    then Result := WAIT_FAILED
  else
  begin
    if aWait then begin
      WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
      GetExitCodeProcess(ProcessInfo.hProcess, Result);
    end;
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end;
end; 

procedure TFrmPrintReview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FAtivo := False;
  if not gGuardSide then begin
    cancelarExtImgs;
    zerarImpressao;
    while fArqs.Count > 0 do begin
      TObject(FArqs[0]).Free;
      fArqs.Delete(0);
    end;
  end;
end;

procedure TFrmPrintReview.FormCreate(Sender: TObject);
begin
  FOnCreatingDoc := nil;
  SetLength(FDontPrint, 0);
  fPREtapas := nil;
  FOnConfirmouImp := nil;
  FOnCancelouImp := nil;
  FSessao := 0;
  fShowForm := nil;
  fAtivo := False;
  FTipo := -1;
  fLastOpen := '';
  fNomeAtual := '';

  btnSair.Visible := not GuardSide;

  fProcList := TStringList.create;
  fArqs := TList.Create;

{  fThumbsScrollBox := TThumbsScrollBox.Create(nil);
  fThumbsScrollBox.Parent := PanelThumbs;
  fThumbsScrollBox.OnImageClick := fThumbsScrollBoxOnThumbClick;
  fThumbsScrollBox.OnImageDblClick := fPagesScrollBoxOnDblClick;
  fThumbsScrollBox.NaoImprimir := NaoImprimir;}

  fPagesScrollBox := TPagesScrollBox.Create(nil);
  fPagesScrollBox.Parent := PanelViewerArea;         
  fPagesScrollBox.OnPageChange    := fPagesScrollBoxPageChange;
  fPagesScrollBox.OnStatusChange  := fPagesScrollBoxStatusChange;
  fPagesScrollBox.OnImageClick    := fPagesScrollBoxOnBMPClick;
  fPagesScrollBox.OnIniRead       := fPagesScrollBoxOnIniRead;
  fPagesScrollBox.OnImageDblClick := fPagesScrollBoxOnDblClick;
  fPagesScrollBox.NaoImprimir := NaoImprimir;
  
  ImprimirPag := False;
  
  GApplicationPath := ExtractFilePath(ParamStr(0));

  fPasta1 := GApplicationPath+'Print\pend\1'; // do not localize
  fPasta2 := GApplicationPath+'Print\pend\2'; // do not localize
  if not directoryexists(fpasta2) then
      forcedirectories(fpasta2);

  top    := 30;
  left   := 0;
  height := screen.WorkAreaHeight - 30;
  if gTemAd then
    width  := screen.WorkAreaWidth  - 123 else
    width  := screen.WorkAreaWidth;

  {$IFNDEF NOLOG} GLog.Log(self,[lcInfo],'Pasta1 : '+fPasta1);{$ENDIF} // do not localize

  caption := kAppTittle;

  {$IFNDEF NOLOG} GLog.ForceLogWrite; {$ENDIF}

  PanelProgressVisivel(false);
end;

procedure TFrmPrintReview.FormDestroy(Sender: TObject);
var
  i : integer;
begin
//    fThumbsScrollBox.Parent := nil;
    fPagesScrollBox.Parent := nil;
    fPagesScrollBox.Free;
    fProcList.Free;

    while fArqs.Count > 0 do begin
      TObject(FArqs[0]).Free;
      fArqs.Delete(0);
    end;
    fArqs.Free;
    
    {$IFNDEF NOLOG} GLog.CloseLogFile; {$ENDIF}
end;

procedure TFrmPrintReview.FormHide(Sender: TObject);
begin
  FAtivo := False;
  Timer1.Enabled := False;
  if fShowForm<>nil then
    fShowForm.ModalResult := mrAbort;
end;

procedure TFrmPrintReview.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=32 then begin
    cbNaoImpClick(nil);
    key:=0;
  end;
end;

procedure TFrmPrintReview.FormResize(Sender: TObject);
begin
  PosicionaSimNao;
end;

{procedure TFormNexCafe5PrintMan.LoadConfig;
var
    Inifile : TInifile;
    sections : TStringList;
begin

     if (fileExists(GApplicationPath+GLog.InifileName)) then begin
        Inifile := TInifile.Create(GApplicationPath+GLog.InifileName);
        sections := TStringList.create;
        try
            with Inifile do begin
                ReadSections(sections);

                if sections.IndexOf('Config')>-1 then begin
                    fLogToFile      :=  ReadBool ('Config','LogToFile', false);
                    fLogCategories  :=  ReadString ('Config','LogCategories', '');
                    fLogDirPath     :=  ReadInteger ('Config','LogDirPath', 0);
                end;
                writeString('Load', 'LastLogFile', {$IFNDEF NOLOG}{ GLog.LogFileName );{$ENDIF}{
           end;
        finally
            Inifile.Free;
            sections.Free;
        end;
     end;
     
end; }

procedure TFrmPrintReview.FormShow(Sender: TObject);
begin
  Left := Screen.WorkAreaLeft;
  Top := Screen.WorkAreaTop;
  Height := Screen.WorkAreaHeight;
  if gGuardSide and gTemAd then
    Width := Screen.WorkAreaWidth-123 else
    Width := Screen.WorkAreaWidth;
  Timer1.Enabled := gGuardSide;
end;

procedure TFrmPrintReview.fThumbsScrollBoxOnThumbClick(Sender: TObject;
  aPageNum: integer);
begin
    fThumbsScrollBox.SelectThumb(aPageNum);
    fPagesScrollBox.CurrentPage := aPageNum;
end;

function TFrmPrintReview.GetGuardSide: Boolean;
begin
  Result := gGuardSide;
end;

procedure TFrmPrintReview.fPagesScrollBoxOnBMPClick(Sender: TObject;
  aPageNum: integer);
begin
//    fThumbsScrollBox.SelectThumb(aPageNum);
    fPagesScrollBox.CurrentPage := aPageNum;
end;

procedure TFrmPrintReview.fPagesScrollBoxOnDblClick(Sender: TObject;
  aPageNum: integer);
begin
    fPagesScrollBox.ToggleZoom;
end;

procedure TFrmPrintReview.fPagesScrollBoxOnIniRead(Sender: TObject;
  aTotPages, aThumbWidth, aThumbHeight, aBmpWidth, aBmpHeight: integer);
begin
    Self.calculaTotal;

    {$IFNDEF NOLOG} GLog.Log(self,[lcMsgs],'fPagesScrollBoxOnIniRead fThumbsScrollBox.doIniRead');{$ENDIF} // do not localize
    {$IFNDEF NOLOG} GLog.ForceLogWrite; {$ENDIF}

//    fThumbsScrollBox.doIniRead(aTotPages, aThumbWidth, aThumbHeight);



    {$IFNDEF NOLOG} GLog.Log(self,[lcMsgs],'application.processmessages');{$ENDIF} // do not localize
    {$IFNDEF NOLOG} GLog.ForceLogWrite; {$ENDIF}

    //application.processmessages;
    goToPage(1);
    with TTimer.Create(Self) do begin
      Interval := 500;
      OnTimer := OnLoadNaoImp;
      Enabled := True;
    end;
end;


procedure TFrmPrintReview.cmNextClick(Sender: TObject);
begin
  fPagesScrollBox.Next;
end;

procedure TFrmPrintReview.dxBarLargeButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrintReview.dxBarLargeButton2Click(Sender: TObject);
begin
  fPagesScrollBox.ZoomOut;
end;

procedure TFrmPrintReview.cmSairClick(Sender: TObject);
begin
  cancelarExtImgs;
  zerarImpressao;
  Close;
end;

procedure TFrmPrintReview.cmTipoImpClick(Sender: TObject);
begin
  ObtemPrintTipo(False);
end;

procedure TFrmPrintReview.cmPriorClick(Sender: TObject);
begin
  fPagesScrollBox.Prior;
end;

procedure TFrmPrintReview.WM_EXTRACTIMG_START(var msg: TMessage);
var 
  sl : TStrings;
  a : TncArqReview;
  S : String;
  G: TGuid;
begin
  gLog.Log(Self, [lcTrace], 'WM_EXTRACTIMG_START'); // do not localize
  A := FindArqReviewByID(Msg.WParam);
  if A<>nil then begin
    S := Copy(A.arArq, 1, Length(A.arArq)-3)+'ini'; // do not localize
    if FileExists(S) then with A.arIni do begin
      if gGuardSide then begin
        LoadFromFile(S);
        A.arDocTitle := Values['DocTitle']; // do not localize
        A.arPgCount := StrToIntDef(Values['TotPages'], 0); // do not localize
        A.arThumbW := StrToIntDef(Values['ThumbW'], 0); // do not localize
        A.arThumbH := StrToIntDef(Values['ThumbH'], 0); // do not localize
        A.arBmpW := StrToIntDef(Values['BmpW'], 0); // do not localize
        A.arBmpH := StrToIntDef(Values['BmpH'], 0); // do not localize
        if (A=ArqAtual) then begin
          Caption := A.arDocTitle;
          if Assigned(fPREtapas) and (A=ArqAtual) then 
            fPREtapas.GerouDoc(A.arPgCount);
          StartLoad;
        end;
      end;
      A.arLastPgExt := 1;
      if (Values['Arq']='') then begin // do not localize
        CreateGuid(G);
        Values['Arq'] := GuidToString(G); // do not localize
      end;
      TimerCheckPDF.Enabled := True;
    end else begin
      gLog.Log(Self, [lcTrace], 'WM_EXTRACTIMG_START - ERRO: Ini não encontrado'); // do not localize
      FArqs.Remove(A);
      A.Free;
    end;
  end;
end;

procedure TFrmPrintReview.WM_NEWDOC(var msg: TMessage);
var s: string;
begin
  if gGuardSide and (FindArqReviewByID(msg.WParam)=nil) then begin
    S := PRFolder('1')+IntToStr(GetCurrentSessionID)+'_'+IntToStr(msg.WParam)+'.pdf'; // do not localize
    DebugMsg('TFrmPrintReview.WM_NEWDOC: '+ S); // do not localize
    if FileExists(S) then 
      AddArq(S, msg.WParam) else
      DebugMsg('TFrmPrintReview.WM_NEWDOC - Arquivo não existe: '+S); // do not localize
  end;
end;

procedure TFrmPrintReview.WM_CREATINGDOC(var msg: TMessage);
var S: String;
begin
  S := PRFolder('1')+IntToStr(GetCurrentSessionID)+'_'+IntToStr(msg.WParam)+'.pdf'; // do not localize
  DebugMsg('TFrmPrintReview.WM_CREATINGDOC: '+ S); // do not localize
  AddArq(S, msg.WParam, True);
  OpenNextPDF;
  if Assigned(FOnCreatingDoc) then FOnCreatingDoc(Self);
end;

procedure TFrmPrintReview.WM_EXTRACTIMG_ERROR(var msg: TMessage);
var 
  S: PString;
  AR : TncArqReview;
begin
  gLog.Log(Self, [lcTrace], 'WM_EXTRACTIMG_ERROR'); // do not localize

  AR := FindArqReviewByID(msg.wparam);
  if AR<>nil then begin
    if (AR=ArqAtual) and (fPREtapas<>nil) then
      fPREtapas.Cancelar
    else
    if ((not gGuardSide) or AR.CanShow) and (AR = ArqAtual) then 
      CancelarImpressao
    else begin
      FArqs.Remove(AR);
      AR.Free;
    end;
  end;
end;

procedure TFrmPrintReview.WM_EXTRACTIMG_PROGRESS(var msg: TMessage);
var
    iprogress : integer;
    A : TncArqReview;
begin
  gLog.Log(self,[lcMsgs],'WM_PR_EXTRACTIMG_PROGRESS'); // do not localize
  
  A := FindArqReviewByID(Msg.WParam);
  if A=nil then begin
    gLog.Log(self,[lcMsgs],'WM_PR_EXTRACTIMG_PROGRESS - Arq não encontrado'); // do not localize
    Exit;
  end;
  A.arLastPgExt := msg.LParam;

  if (A=ArqAtual) and ((not gGuardSide) or A.CanShow) then begin
    gLog.Log(self,[lcMsgs],'WM_PR_EXTRACTIMG_PROGRESS - 2'); // do not localize
    
    OpenNextPDF;
      
    iprogress := Msg.LParam;
{    PanelProgressVisivel(iprogress<fThumbsScrollBox.ImageCount);
    PB.Properties.Max := fThumbsScrollBox.ImageCount;
    PB.Position := iprogress;}
    fPagesScrollBox.NotifyProgressPrintMessage(iprogress);
//    fThumbsScrollBox.NotifyProgressPrintMessage(iprogress);
  end;
end;

function ForceForegroundWindow(hwnd: THandle): Boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID: DWORD;
  timeout: DWORD;
begin

  DebugMsg('ncFrmPrintreviw.ForceForegroundWindow'); // do not localize

  if GetForegroundWindow = hwnd then Result := True
  else
  begin
    if IsIconic(hwnd) then ShowWindow(hwnd, SW_RESTORE);
    // Windows 98/2000 doesn't want to foreground a window when some other
    // window has keyboard focus

    if ((Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion > 4)) or
      ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and
      ((Win32MajorVersion > 4) or ((Win32MajorVersion = 4) and
      (Win32MinorVersion > 0)))) then
    begin
      // Code from Karl E. Peterson, www.mvps.org/vb/sample.htm
      // Converted to Delphi by Ray Lischner
      // Published in The Delphi Magazine 55, page 16

      Result := False;
      ForegroundThreadID := GetWindowThreadProcessID(GetForegroundWindow, nil);
      ThisThreadID := GetWindowThreadPRocessId(hwnd, nil);
      if AttachThreadInput(ThisThreadID, ForegroundThreadID, True) then
      begin
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hwnd);
        AttachThreadInput(ThisThreadID, ForegroundThreadID, False);
        Result := (GetForegroundWindow = hwnd);
      end;
      if not Result then
      begin
        // Code by Daniel P. Stasinski
        SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @timeout, 0);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0),
          SPIF_SENDCHANGE);
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hWnd);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(timeout), SPIF_SENDCHANGE);
      end;
    end
    else
    begin
      BringWindowToTop(hwnd); // IE 5.5 related hack
      SetForegroundWindow(hwnd);
    end;

    Result := (GetForegroundWindow = hwnd);
  end;
end; { ForceForegroundWindow }


function TFrmPrintReview.TemImp: Boolean;
begin
  Result := (NomeAtual>'');
end;

procedure TFrmPrintReview.Timer1Timer(Sender: TObject);
begin
  if Visible and (fShowForm=nil) and gGuardSide then begin
{    Left := Screen.WorkAreaLeft;
    Top := Screen.WorkAreaTop;
    Height := Screen.WorkAreaHeight;
    if gTemAd then
      Width := Screen.WorkAreaWidth-123 else
      Width := Screen.WorkAreaWidth;}
    
    ForceForegroundWindow(Handle);
  end;
end;

procedure TFrmPrintReview.TimerCheckPDFTimer(Sender: TObject);
begin
  TimerCheckPDF.Enabled := False;
  openNextPDF;
  TimerCheckPDF.Tag := 0;
end;

procedure TFrmPrintReview.TimerPrintTipoTimer(Sender: TObject);
var F: TFrmPrintTipo; T: Integer;
begin
  TimerPrintTipo.Enabled := false;
  if gGuardSide then 
    ObtemPrintTipoEtapas else
    ObtemPrintTipo(False);
  //Application.BringToFront;
end;

procedure TFrmPrintReview.TimerShowModalTimer(Sender: TObject);
begin
  TimerShowModal.Enabled := False;
  if not Visible then
    ShowModal;
end;

function TFrmPrintReview.openNextPDF:boolean;
begin
    result := false;
    if NomeAtual>'' then Exit;
    
    if not findNextPDF then begin
      GLog.Log(self,[lcTrace],'openNextPDF sem arquivos para processar.'); // do not localize
      Exit;
    end;

    NomeAtual := ArqAtual.arArq;

    if {(NomeAtual<>fLastOpen) and} gGuardSide or (fileexists(NomeAtual)) then 
    begin

        if gGuardSide then begin
          cmImprimir.Caption := SConfirmaImpressão;
          cmSair.Visible := ivNever;
        end else begin
          cmImprimir.Caption := SLiberarImpressão;
          cmSair.Visible := ivAlways;
        end;

        GLog.Log(self,[lcTrace],'openNextPDF open : '+NomeAtual); // do not localize
        result := true;

        if ArqAtual<>nil then 
          caption := ArqAtual.arDocTitle else
          caption := SReviseSuaImpressão;

        if (not Visible) and (not gGuardSide) and (ArqAtual<>nil) then
          TimerShowModal.Enabled := True;  
          
        CalculaTotal;

        StartLoad;

        TimerPrintTipo.Enabled := Ativo and (not gGuardSide);

        fPagesScrollBox.ZoomToUsr(1, False);

        fLastOpen := NomeAtual;
        
        if (not gGuardSide) then 
          PrintTipo := StrToIntDef(ArqAtual.arIni.Values['Tipo'], -1); // do not localize
    end;
    {$IFNDEF NOLOG} GLog.ForceLogWrite;{$ENDIF}
end;

function TFrmPrintReview.PageCount: Integer;
begin
  Result := fPagesScrollBox.ImageCount;
end;

procedure TFrmPrintReview.panCentralResize(Sender: TObject);
begin
  PosicionaSimNao;
end;

procedure TFrmPrintReview.PanelProgressVisivel(value: boolean);
begin
  PB.visible   := value;
end;

procedure TFrmPrintReview.PosicionaSimNao;
begin
  panSimNao.Left := panelFundo.Left + ((panCentral.Width  - panSimNao.Width) div 2);
  panSimNao.Top := panelFundo.Top - 2;
end;

function TFrmPrintReview.PrintablePageCount: Integer;
begin
  Result := fPagesScrollBox.ImageCount - Length(fDontPrint);
end;

function TFrmPrintReview.findNextPDF:boolean;
//var AR : TncArqReview;
begin
  Result := (ArqAtual<>nil);
{  if (AR<>nil) and ((not gGuardSide) or AR.CanShow) then begin
    NomeAtual := AR.arArq;
    Result := True;
  end else
    Result := False;}
end;

procedure TFrmPrintReview.AddArq(S: String; aID: Integer; aCreating: Boolean = False);
var AR: TncArqReview;
begin
  DebugMsg('TFrmPrintReview.AddArq: ' + S); // do not localize
  AR := TncArqReview.Create(S, aID, aCreating);
  FArqs.Add(AR);
end;

procedure TFrmPrintReview.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
    {$IFNDEF NOLOG} GLog.Log(self,[lcExcept],'Application Exception : '+E.Message);{$ENDIF} // do not localize
end;

procedure TFrmPrintReview.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var
     mp : TPoint;
begin
     if Msg.message = WM_MOUSEWHEEL then begin

        if (FLastWc<>nil) and
           (FLastWc.Handle=Msg.hwnd) then exit;

        mp := mouse.CursorPos;
        Handled := true;
        FLastWc := nil;
{        if mp.X < (fThumbsScrollBox.Left+fThumbsScrollBox.Width) then
            FLastWc := fThumbsScrollBox
        else              }
            FLastWc := fPagesScrollBox;

        if FLastWc<> nil then
           sendMessage( FLastWc.Handle, CM_MOUSEWHEEL, Msg.wParam, Msg.lParam );
     end;

end;

function TFrmPrintReview.ArqAtual: TncArqReview;
begin
  if FArqs.Count>0 then
    Result := TncArqReview(FArqs[0]) else
    Result := nil;
end;

procedure TFrmPrintReview.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrintReview.calculaTotal;
var 
  T: TncTipoImp; I: Integer;
  S: String;
begin
   if NomeAtual>''  then begin
     if FTipo<>-1 then
       T := gTiposImp.PorID[FTipo] else
       T := nil;

     I := PrintablePageCount;

     if I>1 then 
       cmPagValor.Caption := IntToStr(I) + SFolhas else
       cmPagValor.Caption := IntToStr(I) + SFolha;

     lbFolhas.Caption := cmPagValor.Caption;  

     if (T<>nil) and (I>0) then  begin
       lbCusto.Caption := FormataPreco(PrintablePageCount * T.Valor);
       cmPagValor.Caption := cmPagValor.Caption + ' = ' + lbCusto.Caption;
     end else
       lbCusto.Caption := '';
       
//     btnImprimir.Caption := 'Imprimir! ' + cmPagValor.Caption;  
   end else begin
     cmPagValor.Caption := '';
     cmImprimir.Caption := '';
     lbFolhas.Caption := '';
     lbCusto.Caption := '';
  //   btnImprimir.Caption := '';
   end;
end;

procedure TFrmPrintReview.fPagesScrollBoxPageChange(Sender: TObject; aPageNum: integer);
begin
    goToPage(aPageNum);
end;

procedure TFrmPrintReview.fPagesScrollBoxStatusChange(Sender: TObject; aPageNum: integer);
begin
    SetImagesStatusPrintButton(aPageNum);
    CalculaTotal;
end;

procedure TFrmPrintReview.SetAtivo(const Value: Boolean);
begin
  if Value=FAtivo then Exit;
  Timer1.Enabled := Value;
  FAtivo := Value;
  if Value then  begin
    TimerPrintTipo.Enabled := (NomeAtual<>'');
    Show;
  end else
    Hide;
end;

procedure TFrmPrintReview.SetImagesStatusPrintButton(aPageNum:integer);
begin
  ImprimirPag := not NaoImprimir(aPageNum);
end;

procedure TFrmPrintReview.SetImprimir(aPagNum: Integer);
var
  I, D, T : Integer;
begin
  I := DontPrintIndex(aPagNum);
  if I=-1 then Exit;
  T := High(fDontPrint);
  for D := I to T-1 do
    fDontPrint[d] := fDontPrint[d+1];
  SetLength(fDontPrint, T);

  fPagesScrollBox.Reload(aPagNum);
//  fThumbsScrollBox.Reload(aPagNum);
  if fPaginaAtual=aPagNum then
    ImprimirPag := True;
  CalculaTotal;
end;

procedure TFrmPrintReview.SetImprimirPag(const Value: Boolean);
begin
  if Value = FImprimirPag then Exit;
  FImprimirPag := Value;
  cbNaoImp.Checked := not Value;
end;

procedure TFrmPrintReview.SetNaoImprimir(aPagNum: Integer);
var T : Integer;
begin
  T := DontPrintIndex(aPagNum);
  if T>=0 then Exit;
  T := Length(fDontPrint);
  SetLength(fDontPrint, T+1);
  fDontPrint[T] := aPagNum;

  fPagesScrollBox.Reload(aPagNum);
//  fThumbsScrollBox.Reload(aPagNum);

  if fPaginaAtual=aPagNum then
    ImprimirPag := False;

  CalculaTotal;
end;

procedure TFrmPrintReview.SetNomeAtual(const Value: String);
var ar : TncArqReview;
begin
  if fNomeAtual=Value then Exit;
  if fNomeAtual<>'' then begin
    ar := ArqAtual;
    if ar<>nil then begin
      FArqs.Delete(0);
      ar.Free;
    end;
  end;
  fNomeAtual := Value;
  fOriginalFileName := Value;
  TimerCheckPDF.Enabled := (Value='');
end;

procedure TFrmPrintReview.SetPrintTipo(const Value: Integer);
var T: TncTipoImp;
begin
  if Value=fTipo then Exit;
  fTipo := Value;
  if Value>=0 then
    T := gTiposImp.PorID[fTipo] else
    T := nil;

  cmTipoImp.Caption := STipoDeImpressão;
    
  if ((T=nil) or (T.ImgID<0)) then begin
    if Assigned(cmTipoImp.LargeGlyph) then 
      try cmTipoImp.LargeGlyph := nil; except end;
{    if Assigned(btnAlteraTipo.Glyph) then
      try btnAlteraTipo.Glyph := nil;  except end;}
  end;

  if T=nil then
    cmTipoImp.Caption := STipoDeImpressão
  else begin
    cmTipoImp.Caption := {'Tipo de Impressão: ' +} T.Nome;
    if T.ImgID>=0 then begin
      cmTipoImp.LargeGlyph := TBitmap.Create;
      dmImgImp.ilImp24.GetImage(T.ImgID, cmTipoImp.LargeGlyph);
{      btnAlteraTipo.Glyph := TBitmap.Create;
      dmImgImp.ilImp24.GetImage(T.ImgID, btnAlteraTipo.Glyph);}
    end;
  end;  
  calculaTotal;
end;

procedure TFrmPrintReview.ShowDoc(aInfo: TStrings);
var 
  ar: TncArqReview;
begin
  if gGuardSide then Exit;
  ar := TncArqReview.CreateFromInfo(aInfo);
  FArqs.Add(ar);
  WinExecAndWait32(extractfilepath(paramstr(0))+'nexap.exe "'+ar.arArq+'" VIEWERHANDLE'+IntToStr(Handle)+' '+IntToStr(ar.arID), SW_SHOWNORMAL, False); // do not localize
//  ShellStart(extractfilepath(paramstr(0))+'nexap.exe', '"'+ar.arArq+'" VIEWERHANDLE'+IntToStr(Handle)+' '+IntToStr(ar.arID));
end;

procedure TFrmPrintReview.StartLoad;
begin
  if ArqAtual=nil then Exit;
  
  with ArqAtual do 
  if FileExists(NomeAtual) and (arPgCount>0) then begin
    gLog.Log(Self, [lcTrace], 'StartLoad - arPgCount: '+IntToStr(arPgCount)+ // do not localize
                              ' - arThumbW: ' + IntToStr(arThumbW) + // do not localize
                              ' - arThumbH: ' + IntToStr(arThumbH) + // do not localize
                              ' - arBmpW: ' + IntToStr(arBmpW) + // do not localize
                              ' - arBmpH: ' + IntToStr(arBmpH)); // do not localize
                                    
    fPagesScrollBox.StartLoad( ImgPath , nil {fThumbsScrollBox},  arPgCount, arThumbW, arThumbH, Trunc(arBmpW*0.25), Trunc(arBmpH*0.25));
//    fThumbsScrollBox.StartLoad( ImgPath );
    fPaginaAtual := 1;
 end;
end;

procedure TFrmPrintReview.goToPage(aPageNum: integer);
begin
    fPaginaAtual := aPageNum;
//    fThumbsScrollBox.SelectThumb(aPageNum);
    cmPagAtual.Caption := SFolha_1 + inttostr(fPaginaAtual) + SDe + inttostr(fPagesScrollBox.ImageCount);
    cbNaoImp.Caption := SNãoImprimirAFolha + IntToStr(fPaginaAtual)+' / '+IntToStr(fPagesScrollBox.ImageCount);
    PosicionaSimNao;
    
    SetImagesStatusPrintButton(fPaginaAtual);
    cmPrior.Enabled  := fPaginaAtual>1;
    cmNext.Enabled := fPaginaAtual<fPagesScrollBox.ImageCount;
    //fThumbsScrollBox.SelectThumb(fPaginaAtual);
end;

function TFrmPrintReview.ImgPath: String;
begin
  Result := copy (NomeAtual, 1, length(NomeAtual)-4)+'\';
end;

procedure TFrmPrintReview.lbSimClick(Sender: TObject);
begin
  SetImprimir(fPagesScrollBox.CurrentPage);
end;

procedure TFrmPrintReview.LoadNaoImp;
var 
  S, sNex: String;
  P: Integer;

function GetNextPage: Boolean;
var I: Integer;
begin
  P := 0;
  while (P=0) and (S>'') do begin
    I := Pos(',', S);
    if I=0 then begin
      P := StrToIntDef(Trim(S), 0);
      S := '';
    end else begin
      sNex := copy(S, 1, I-1);
      P := StrToIntDef(Trim(sNex), 0);
      Delete(S, 1, I);
    end;
  end;
  Result := (P>0);
end;  

begin
  S := ArqAtual.arIni.Values['NaoImp']; // do not localize
  while GetNextPage do 
    SetNaoImprimir(P);
end;

procedure TFrmPrintReview.MouseWheelHandler(var Message: TMessage);
begin
  Message.Result := 1;
//  FPagesScrollBox.Dispatch(Message);
  PostMessage(FPagesScrollBox.Handle, CM_MOUSEWHEEL, message.WParam, message.LParam);
end;

function TFrmPrintReview.NaoImprimir(aPagNum: Integer): Boolean;
begin
  Result := (DontPrintIndex(aPagNum)>=0);
end;

function TFrmPrintReview.NaoImpStr: String;
var I: Integer;
begin
  Result := '';
  for I := 1 to PageCount do 
    if NaoImprimir(I) then begin
      if Result>'' then Result := Result + ',';
      Result := Result + IntToStr(I);
    end;
end;

procedure TFrmPrintReview.ObtemPrintTipo(aCancelar: Boolean);
var F: TFrmPrintTipo; T: Integer;
begin

  if gTiposImp.Count=0 then begin
    DebugMsg('TFrmPrintReview.TimerAfterShowTimer - gTiposImp.Count=0'); // do not localize
    Exit;
  end;
  
  if NomeAtual='' then Exit;

  F := TFrmPrintTipo.CreateEsp(Handle, Self);
  try
    fShowForm := F;
    gLog.Log(Self, [lcTrace], 'TimerPrintTipoTimer'); // do not localize
    T := FTipo;
    if F.ObtemTipoImp(T, PrintablePageCount, aCancelar) then begin
      gLog.Log(Self, [lcTrace], 'TimerPrintTipoTimer - OK'); // do not localize
      PrintTipo := T;
    end else begin
      gLog.Log(Self, [lcTrace], 'TimerPrintTipoTimer - CANCEL'); // do not localize
      if gGuardSide and aCancelar then cancelarImpressao;
    end;
  finally
    fShowForm := nil;
  end;
end;

procedure TFrmPrintReview.ObtemPrintTipoEtapas;
var T, aRes: Integer;
begin
  gLog.Log(Self, [lcTrace], 'ObtemPrintTipoEtapas - 1'); // do not localize

  if NomeAtual='' then begin
    gLog.Log(Self, [lcTrace], 'ObtemPrintTipoEtapas - NomeAtual em branco'); // do not localize
    Exit;
  end;

  if Assigned(fPREtapas) then 
    try FreeAndNil(fPREtapas); except end;

  gLog.Log(Self, [lcTrace], 'ObtemPrintTipoEtapas - 2'); // do not localize
    
  fPREtapas := TFrmPREtapas.CreateEsp(Handle, Self);  
  try
    fShowForm := fPREtapas;
    gLog.Log(Self, [lcTrace], 'ObtemPrintTipoEtapas - 3'); // do not localize
    
    T := FTipo;
    aRes := fPREtapas.Imprimir(T, ArqAtual.arPgCount);
    fShowForm := nil;
    fPREtapas := nil;
    case aRes of
      resCancelar : cancelarImpressao;
      resImprimir : begin
        PrintTipo := T;
        ConfirmarImpressao;
      end;
      resRevisar  : begin
        PrintTipo := T;
      
      end;
    end;
  finally
    fShowForm := nil;
    fPREtapas := nil;
  end;
end;

procedure TFrmPrintReview.OnLoadNaoImp(Sender: TObject);
begin
  try
    LoadNaoImp;
  finally
    Sender.Free;
  end;
end;

function TFrmPrintReview.formataPreco(v:double):string;
begin
    result := Trim(FloatToStrF(V, ffCurrency, 10, 2));
end;

procedure TFrmPrintReview.ConfirmarImpressao;
var
     sl:TStringList;
     s: string;
     A: TncArqReview;
begin
  GLog.Log(self,[lcTrace],'impressao aprovada : '+NomeAtual); // do not localize
   // deletear paginas
  A := ArqAtual;
  if A=nil then Exit;
  A.arIni.Values['NaoImp'] := NaoImpStr; // do not localize
  
  if GuardSide then
    A.arIni.Values['Sessao'] := IntToStr(FSessao); // do not localize
    
  A.arIni.Values['Tipo'] := IntToStr(FTipo); // do not localize
  S := PRFolder('2')+A.arIni.Values['Arq']; // do not localize
  A.arIni.SaveToFile(S+'.ini'); // do not localize
  CopyFile(PAnsiChar(A.arArq), PAnsiChar(S+'.pdf'), True);  // do not localize

  try
    if Assigned(FOnConfirmouImp) then
      FOnConfirmouImp(Self, A.arIni);
  finally
    cancelarExtImgs;
    zerarImpressao;
    TimerCheckPDF.Enabled := True;
  end;
end;

function EnumProcess(hHwnd: HWND; lParam : integer): boolean; stdcall;
var
  pPid : DWORD;
  title, ClassName : string;
begin
  //if the returned value in null the
  //callback has failed, so set to false and exit.
  if (hHwnd=variants.NULL) then
  begin
    result := false;
  end
  else
  begin
    //additional functions to get more 
    //information about a process.
    //get the Process Identification number.
    GetWindowThreadProcessId(hHwnd,pPid);
    //set a memory area to receive 
    //the process class name
    SetLength(ClassName, 255);
    //get the class name and reset the 
    //memory area to the size of the name
    SetLength(ClassName, 
              GetClassName(hHwnd, 
                           PChar(className), 
                           Length(className)));
    SetLength(title, 255);
    //get the process title; usually displayed 
    //on the top bar in visible process
    SetLength(title, GetWindowText(hHwnd, PChar(title), Length(title)));

    FrmPrintReview.fProcList.add(IntToStr(pPid)+'='+IntToStr(hHwnd));
    Result := true;
  end;
end;

procedure TFrmPrintReview.cancelarImpressao;
begin
  GLog.Log(self,[lcTrace], 'CancelarImpressao'); // do not localize
  if (ArqAtual<>nil) and Assigned(FOnCancelouImp) then
    FOnCancelouImp(Self, ArqAtual.arIni);
  
  cancelarExtImgs;
  zerarImpressao;
  TimerCheckPDF.Enabled := True;
end;

procedure TFrmPrintReview.cbNaoImpClick(Sender: TObject);
begin
  if cbNaoImp.Checked then
    SetNaoImprimir(fPagesScrollBox.CurrentPage) else
    SetImprimir(fPagesScrollBox.CurrentPage);
end;

procedure TFrmPrintReview.ClearDontPrint;
begin
  SetLength(fDontPrint, 0);
end;

procedure TFrmPrintReview.cmImprimirClick(Sender: TObject);
begin
  ConfirmarImpressao;
  if (not GuardSide) and (ArqAtual=nil) then
    Close;
end;

procedure TFrmPrintReview.cmZoomInClick(Sender: TObject);
begin
  fPagesScrollBox.ZoomIn;
end;

procedure TFrmPrintReview.CreateParams(var Params: TCreateParams);
var
  S: String;
  I: Integer;
begin
  inherited;
  if gGuardSide then begin
    S := 'FrmPrintReview_'+IntToStr(GetCurrentSessionID); // do not localize
    for I := 1 to Length(S) do 
     params.WinClassName[I-1] := S[I];
    params.WinClassName[I] := #0;
    params.ExStyle := params.ExStyle or WS_EX_APPWINDOW;
    params.WndParent := GetDesktopwindow;
  end else begin
    params.ExStyle := params.ExStyle or WS_EX_APPWINDOW;
    params.WndParent := gWndParent;
  end;
end;


function TFrmPrintReview.DontPrintIndex(aPagNum: Integer): Integer;
var I : integer;
begin
  for I := 0 to High(fDontPrint) do
    if fDontPrint[i] = aPagNum then begin
      Result := I;
      Exit;
    end;

  Result := -1;  
end;

procedure TFrmPrintReview.cancelarExtImgs;
begin
  GLog.Log(self,[lcTrace],'cancelarExtImgs'); // do not localize
  if FArqs.Count>0 then
    TncArqReview(FArqs[0]).CancelExtImgs;
end;

procedure TFrmPrintReview.zerarImpressao;
begin
  GLog.Log(self,[lcTrace],SZerandoTrabalho);

  ClearDontPrint;
  
  fPagesScrollBox.Clear;
//  fThumbsScrollBox.Clear;
  PrintTipo := -1;
  PanelProgressVisivel(false);

  fPagesScrollBox.VertScrollBar.Position := 0;
//  fThumbsScrollBox.VertScrollBar.Position := 0;

  fPaginaAtual:=0;
  NomeAtual := '';
  fOriginalFileName := '';
  GLog.Log(self,[lcTrace],'fFullFileName := (nada)'); // do not localize
  CalculaTotal;
end;

procedure TFrmPrintReview.cmCancelarClick(Sender: TObject);
begin
  cancelarImpressao;
  if (not GuardSide) and (ArqAtual=nil) then
    Close;
end;

function TFrmPrintReview.FindArqReview(aNome: String): TncArqReview;
var I : Integer;
begin
  for I := 0 to FArqs.Count-1 do 
    if SameText(TncArqReview(FArqs[i]).arArq, aNome ) then begin
      Result := TncArqReview(FArqs[i]);
      Exit;
    end;
  Result := nil;
end;

function TFrmPrintReview.FindArqReviewByID(aID: Integer): TncArqReview;
var I : Integer;
begin
  for I := 0 to FArqs.Count-1 do 
    if TncArqReview(FArqs[i]).arID=aID then begin
      Result := TncArqReview(FArqs[i]);
      Exit;
    end;
  Result := nil;
end;

{ TncArqReview }

function TerminateExtImgs(aName: String): Boolean;
var 
  H: HWND;
  Data : Pointer;
begin
  H := OpenFileMapping(FILE_MAP_ALL_ACCESS, False, PAnsiChar(aName));
  if H<>0 then
  try
    Data := MapViewOfFile(H, FILE_MAP_ALL_ACCESS, 0, 0, 0); 
    try
      Byte(Data^) := 1;
    finally
      UnmapViewOfFile(Data);
    end;
  finally
    CloseHandle(H);
  end;
end;

procedure TncArqReview.CancelExtImgs;
var S: String;
begin
  TerminateExtImgs(kMMFPrefix + ExtractFileName(arArq));
{  if Assigned(arThExt) then
  try
    arThExt.Terminate;
  except
  end;}
end;

function TncArqReview.CanShow: Boolean;
begin
  Result := ExtAll or (arLastPgExt>5) or arCreating;
end;

constructor TncArqReview.Create(aArq: String; aArqID: Integer; aCreating: Boolean = False);
begin
  arArq := aArq;
  arIni := TStringList.Create;
  arID := aArqID;
  arPgCount := 0;
  arThumbW := 0;
  arThumbH := 0;
  arBmpW := 0;
  arBmpH := 0;
  arDocTitle := '';
{  arThExt := TThreadExtImgs.Create(arArq, aViewerHWND);
  arThExt.FreeOnTerminate := True;
  arThExt.OnTerminate := OnTerminateExt;
  arThExt.Resume;}
  arLastPgExt := 0;
  arCreating := aCreating;
end;

constructor TncArqReview.CreateFromInfo(aInfo: TStrings);
begin
  inherited;
  arArq := PRFolder(#0)+aInfo.Values['Arq']+'.pdf'; // do not localize
  arIni := TStringList.Create;
  arIni.Text := aInfo.Text;
  arID := Integer(Self);
  arPgCount := StrToIntDef(aInfo.Values['TotPages'], 0); // do not localize
  arThumbW := StrToIntDef(aInfo.Values['ThumbW'], 0); // do not localize
  arThumbH := StrToIntDef(aInfo.Values['ThumbH'], 0); // do not localize
  arBmpW := StrToIntDef(aInfo.Values['BmpW'], 0); // do not localize
  arBmpH := StrToIntDef(aInfo.Values['BmpH'], 0); // do not localize
  arDocTitle := aInfo.Values['doctitle']; // do not localize
end;

procedure TncArqReview.DeleteArqs;
var 
  dirName : string;
  sl : TStringList;
begin
  GLog.Log(self,[lcTrace], 'DeleteArqs: '+arArq); // do not localize

  sl := TStringList.create;
  try
    if FileExists(arArq) then
      sl.add(copy(arArq, 1, Length(arArq)-3)+'ini'); // do not localize
      
    dirname := copy(arArq, 1, Length(arArq)-4)+'\';

    sl.add(arArq);
      
    GLog.Log(self,[lcTrace], 'DeleteArqs: '+dirname); // do not localize
    with TDeleteFilesThread.Create(dirName, sl) do Resume;
  finally
    sl.Free;
  end;
end;

destructor TncArqReview.Destroy;
begin
  arIni.Free;
  DeleteArqs;
  inherited;
end;

function TncArqReview.ExtAll: Boolean;
begin
  Result := (arPgCount>0) and (arLastPgExt>=arPgCount);
end;

procedure TncArqReview.OnTerminateExt(Sender: TObject);
begin
{  try
    arThExt := nil;
  except
  end;}
end;

end.

