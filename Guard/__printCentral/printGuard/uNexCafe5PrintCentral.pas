unit uNexCafe5PrintCentral;

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
  dxGDIPlusClasses, ncPrinters, dxSkinscxPCPainter, dxLayoutControlAdapters,
  cxImage, cxLabel, uThumbsScrollBox, uPagesScrollBox,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxRadioGroup, cxGroupBox, cxClasses,
  Int64List, cxCheckBox, dxSkinsCore, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  cxControls, cxContainer, cxEdit, dxSkinsForm, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, AppEvnts, ImgList, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel,
  LMDCustomScrollBoxExt, LMDScrollBoxExt, cxProgressBar, gPanel;

const
    WM_STARTPRINT_MESSAGE   = WM_APP + 1;
    WM_PROGRESS_MESSAGE     = WM_APP + 2;
    WM_STARTRETURN_MESSAGE  = WM_APP + 3;
    WM_CANCELPRINT_MESSAGE  = WM_APP + 4;
    WM_ENDPRINT_MESSAGE     = WM_APP + 5;
    WM_AFTERPRINTSTART      = WM_APP + 6;

    kNexCafe5AfterPrintPath = 'c:\nexcafe\';
    kNexCafe5AfterPrintExeName = 'nexCafe5AfterPrint.exe';
    kThumbWidth = 200;
    kAppTittle = 'Central de impressões';
    kNaoImprimirEsta =  'NÃO IMPRIMIR esta página';
    kImprimirEsta =  'IMPRIMIR esta página';
    kTargetExeName = kNexCafe5AfterPrintExeName;
type


  TFormNexCafe5PrintCentral = class(TForm)
    TimerAfterShow: TTimer;
    dxSkinController1: TdxSkinController;
    cxEditStyleController1: TcxEditStyleController;
    PanelFundo: TPanel;
    PanelHeader1: TPanel;
    cxButtonFim: TcxButton;
    cxButtonEliminar: TcxButton;
    cxLabelTotPag: TcxLabel;
    ApplicationEvents1: TApplicationEvents;
    PanelThumbs: TPanel;
    cxImageList1: TcxImageList;
    cxLabelValorTotal: TcxLabel;
    cxLabel1: TcxLabel;
    PanelRight: TPanel;
    PanelViewerArea: TPanel;
    PanelHeader2Area: TPanel;
    PanelHeader2: TPanel;
    cxButtonPagSiguiente: TcxButton;
    cxButtonZoomMenos: TcxButton;
    cxButtonPagAnterior: TcxButton;
    cxButtonZoomMais: TcxButton;
    cxButtonNaoImprimir: TcxButton;
    cxLabelPaginaAtual: TcxLabel;
    PanelProgress: TGPanel;
    cxProgressBar1: TcxProgressBar;
    GPanel2: TGPanel;
    PanelBorderLeft: TGPanel;
    PanelNavThumb: TPanel;
    cxButtonDown2: TcxButton;
    cxButtonUp2: TcxButton;
    cxButtonDown3: TcxButton;
    cxButtonUp3: TcxButton;
    cxButtonDown1: TcxButton;
    cxButtonUp1: TcxButton;
    GPanelScroll1: TGPanel;
    Shape1: TShape;
    GPanelScroll2: TGPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxButton13Click(Sender: TObject);
    procedure cxButtonPagAnteriorClick(Sender: TObject);
    procedure cxButtonPagSiguienteClick(Sender: TObject);
    procedure cxButton16Click(Sender: TObject);
    procedure cxButton9Click(Sender: TObject);
    procedure cxButton10Click(Sender: TObject);
    procedure cxButtonNaoImprimirClick(Sender: TObject);
    procedure cxButtonFimClick(Sender: TObject);
    procedure cxButtonEliminarClick(Sender: TObject);
    procedure PanelHeader2AreaResize(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure FormResize(Sender: TObject);
    procedure cxButtonDown3Click(Sender: TObject);
    procedure cxButtonDown2Click(Sender: TObject);
    procedure cxButtonDown1Click(Sender: TObject);
    procedure cxButtonUp3Click(Sender: TObject);
    procedure cxButtonUp2Click(Sender: TObject);
    procedure cxButtonUp1Click(Sender: TObject);
    procedure TimerAfterShowTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure WM_STARTPRINT_MESSAGE(var msg : TMessage); message WM_STARTPRINT_MESSAGE;
    procedure WM_PROGRESS_MESSAGE(var msg : TMessage); message WM_PROGRESS_MESSAGE;
    procedure WM_ENDPRINT_MESSAGE(var msg : TMessage); message WM_ENDPRINT_MESSAGE;
    procedure WM_AFTERPRINTSTART(var msg : TMessage); message WM_AFTERPRINTSTART;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    //procedure LoadConfig;
  private
    FLastWc : TWinControl;
    //fdefPrinterId : integer;
    fPrinters     : TncPrinterList;
    fPrinterAtual : TncPrinter;
    fPaginaAtual : integer;
    fPasta1 : string;
    fPasta2 : string;
    fNomeMaquina : string;
    fFullFileName : string;
    fFullFileNameDest : string;
    fSession : integer;
    fThumbsScrollBox: TThumbsScrollBox;
    fPagesScrollBox: TPagesScrollBox;
    fMD5fromWMSTARTPRINT : string;
    fProcList : TStringList;
    lp : integer;
    procedure GetPrinters;
    function  openNextPDF:boolean;
    procedure SetFullFileName(value:string);
    procedure goToPage(aPageNum:integer);
    function  formataPreco(v:double):string;
    function  getPrintPageCount:integer;
    procedure calculaTotal;
    //procedure LimparDiretorio;
    //procedure deleteFilesThreadOnDelete(Sender: TObject; Dirname : string);
    //procedure deleteFilesThreadOnTerminate(Sender: TObject);
    procedure cancelarImpressao;
    procedure zerarImpressao;
    //procedure formataRadioImpressoras(aCxRadioGroupPrinters: TcxRadioGroup);
    procedure fThumbsScrollBoxOnThumbClick(Sender: TObject; aPageNum:integer);
    procedure fPagesScrollBoxOnBMPClick(Sender: TObject; aPageNum:integer);
    //procedure fPagesScrollBoxOnFirstBmp(Sender: TObject; aTotPages, aThumbWidth, aThumbHeight, aBmpWidth, aBmpHeight:integer);
    procedure fPagesScrollBoxOnIniRead(Sender: TObject; aTotPages, aThumbWidth, aThumbHeight, aBmpWidth, aBmpHeight:integer; aMD5:string);
    procedure fPagesScrollBoxPageChange(Sender: TObject; aPageNum: integer);
    procedure fPagesScrollBoxOnDblClick(Sender: TObject; aPageNum:integer);
    procedure fPagesScrollBoxStatusChange(Sender: TObject; aPageNum:integer);
    procedure fPagesScrollBoxOnFirstBmp(Sender: TObject; idx:integer; aBmp:TBitmap);
    procedure SetImagesStatusPrintButton(aPageNum:integer);
    procedure PanelProgressVisivel(value:boolean);
    { Private declarations }
  public
    { Public declarations }
    property  FullFileName : string read fFullFileName write SetFullFileName;
  end;

var
  FormNexCafe5PrintCentral: TFormNexCafe5PrintCentral;
  {$IFDEF NOLOG}
  GApplicationPath :string;
  {$ENDIF}

implementation

uses
    gtPDFClasses,
    {$IFNDEF NOLOG}
    uLogs,
    {$ENDIF}
    umd5,
    gtPDFDoc,
    TLHelp32,
    madKernel,
    uDeleteFiles, uCommonProc,
    strUtils, ncgPrintInstall, ncNomeMaquina, inifiles, uJson,
    {uFormBackG1, uFormPasso1, uFormPasso2, uFormPasso10, uFormPasso20,
    uFormPassoQuerSair,} uPrintManBaseClasses, uFormBackG1, uPrintGuard;

{$R *.dfm}

procedure TFormNexCafe5PrintCentral.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
    if NewWidth<800 then NewWidth :=800;
    if NewHeight<600 then NewHeight :=600;
end;

procedure TFormNexCafe5PrintCentral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     cancelarImpressao;
end;

procedure TFormNexCafe5PrintCentral.FormCreate(Sender: TObject);
begin
  fPrinters   := TncPrinterList.create;
  fNomeMaquina := GetNomeMaquina;
  {$IFNDEF NOLOG} GLog.Log(self,[lcInfo],'NomeMaquina : '+fNomeMaquina);{$ENDIF}

  fProcList := TStringList.create;

  fThumbsScrollBox := TThumbsScrollBox.Create(nil);
  fThumbsScrollBox.Parent := PanelThumbs;
  fThumbsScrollBox.OnImageClick := fThumbsScrollBoxOnThumbClick;
  fThumbsScrollBox.OnImageDblClick := fPagesScrollBoxOnDblClick;

  fPagesScrollBox := TPagesScrollBox.Create(nil);
  fPagesScrollBox.Parent := PanelViewerArea;         
  fPagesScrollBox.OnPageChange    := fPagesScrollBoxPageChange;
  fPagesScrollBox.OnStatusChange  := fPagesScrollBoxStatusChange;
  fPagesScrollBox.OnImageClick    := fPagesScrollBoxOnBMPClick;
  fPagesScrollBox.OnIniRead       := fPagesScrollBoxOnIniRead;
  fPagesScrollBox.OnImageDblClick := fPagesScrollBoxOnDblClick;
  fPagesScrollBox.OnFirstBmp      := fPagesScrollBoxOnFirstBmp;

  cxButtonNaoImprimir.caption := kNaoImprimirEsta;
  GApplicationPath := ExtractFilePath(ParamStr(0));

  fPasta1 := GApplicationPath+'Print\pend\2';
  fPasta2 := GApplicationPath+'Print\pend\3';

  top    := 0;
  left   := 0;
  height := screen.WorkAreaHeight;
  width  := screen.WorkAreaWidth;

  {$IFNDEF NOLOG} GLog.Log(self,[lcInfo],'Pasta1 : '+fPasta1);{$ENDIF}

  caption := kAppTittle;

  if not NexPrinterInstalled then
     InstallNexPrinter(false);

  GetPrinters;
  {$IFNDEF NOLOG} GLog.ForceLogWrite; {$ENDIF}
  //fPrinterAtual := fPrinters[FormPrintGuard.selectedTipoImpressaoID];
  cxLabelValorTotal.Visible := true;

  PanelProgressVisivel(false);

end;

procedure TFormNexCafe5PrintCentral.FormDestroy(Sender: TObject);
begin
    fThumbsScrollBox.Parent := nil;
    fPagesScrollBox.Parent := nil;
    fPagesScrollBox.Free;
    fPrinters.free;
    fProcList.Free;


    {$IFNDEF NOLOG} GLog.CloseLogFile; {$ENDIF}
end;

procedure TFormNexCafe5PrintCentral.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=32 then begin
        cxButtonNaoImprimirClick(nil);
        key:=0;
    end;
end;

procedure TFormNexCafe5PrintCentral.FormResize(Sender: TObject);
begin
    GPanelScroll1.width := fPagesScrollBox.ScrollW;
    GPanelScroll2.width := GPanelScroll1.width;
end;

{procedure TFormNexCafe5PrintCentral.LoadConfig;
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

procedure TFormNexCafe5PrintCentral.FormShow(Sender: TObject);
begin
    FormBackG1.Left   := self.Left;
    FormBackG1.Top    := self.Top;
    FormBackG1.Height := self.Height;
    FormBackG1.Width  := self.Width;
end;

procedure TFormNexCafe5PrintCentral.fThumbsScrollBoxOnThumbClick(Sender: TObject;
  aPageNum: integer);
begin
    fPagesScrollBox.CurrentPage := aPageNum;
end;

procedure TFormNexCafe5PrintCentral.fPagesScrollBoxOnBMPClick(Sender: TObject;
  aPageNum: integer);
begin
    //fThumbsScrollBox.SelectThumb(aPageNum);
    fPagesScrollBox.CurrentPage := aPageNum;
end;

procedure TFormNexCafe5PrintCentral.fPagesScrollBoxOnDblClick(Sender: TObject;
  aPageNum: integer);
begin
    fPagesScrollBox.ToggleZoom;
end;

procedure TFormNexCafe5PrintCentral.fPagesScrollBoxOnFirstBmp(Sender: TObject;
  idx: integer; aBmp: TBitmap);
var
    p : IProcesses;
    j, reTry : integer;
    res : boolean;
begin
    inherited;

    p := Processes(kTargetExeName);
    for j:=p.ItemCount-1 downto 0 do begin
        reTry := 0;
        repeat sleep(1); inc(reTry);
           res := p[j].Windows_.PostMessage( WM_STARTRETURN_MESSAGE, p[j].Session, 0);
        until (res) or (reTry=5);
    end;
    {$IFNDEF NOLOG}GLog.Log(self,[lcMsgs],'WM_STARTRETURN_MESSAGE');{$ENDIF}
    {$IFNDEF NOLOG}GLog.ForceLogWrite; {$ENDIF}
end;


procedure TFormNexCafe5PrintCentral.fPagesScrollBoxOnIniRead(Sender: TObject;
  aTotPages, aThumbWidth, aThumbHeight, aBmpWidth, aBmpHeight: integer; aMD5:string);
begin
    cxLabelTotPag.Caption := inttostr(getPrintPageCount);

    {$IFNDEF NOLOG} GLog.Log(self,[lcMsgs],'fPagesScrollBoxOnIniRead fThumbsScrollBox.doIniRead');{$ENDIF}
    {$IFNDEF NOLOG} GLog.ForceLogWrite; {$ENDIF}

    fThumbsScrollBox.doIniRead(aTotPages, aThumbWidth, aThumbHeight);



    {$IFNDEF NOLOG} GLog.Log(self,[lcMsgs],'application.processmessages');{$ENDIF}
    {$IFNDEF NOLOG} GLog.ForceLogWrite; {$ENDIF}

    //application.processmessages;
    goToPage(1);
    cxButtonNaoImprimir.Enabled := fPagesScrollBox.PrintablePageCount>1;


    calculaTotal;
end;


procedure TFormNexCafe5PrintCentral.cxButtonUp1Click(Sender: TObject);
begin
    fThumbsScrollBox.goUp(1);
end;

procedure TFormNexCafe5PrintCentral.cxButtonUp2Click(Sender: TObject);
begin
    fThumbsScrollBox.goUp(2);
end;

procedure TFormNexCafe5PrintCentral.cxButtonUp3Click(Sender: TObject);
begin
    fThumbsScrollBox.goUp(3);
end;

procedure TFormNexCafe5PrintCentral.cxButton13Click(Sender: TObject);
begin
    fPagesScrollBox.First;
end;

procedure TFormNexCafe5PrintCentral.cxButtonPagAnteriorClick(Sender: TObject);
begin
    fPagesScrollBox.Prior;
end;

procedure TFormNexCafe5PrintCentral.cxButtonPagSiguienteClick(Sender: TObject);
begin
    fPagesScrollBox.Next;
end;



procedure TFormNexCafe5PrintCentral.cxButton16Click(Sender: TObject);
begin
    fPagesScrollBox.Last;
end;

procedure TFormNexCafe5PrintCentral.cxButton9Click(Sender: TObject);
begin
    fPagesScrollBox.ZoomOut;
end;

procedure TFormNexCafe5PrintCentral.cxButtonDown1Click(Sender: TObject);
begin
    fThumbsScrollBox.goDown(1);
end;

procedure TFormNexCafe5PrintCentral.cxButtonDown2Click(Sender: TObject);
begin
    fThumbsScrollBox.goDown(2);
end;

procedure TFormNexCafe5PrintCentral.cxButtonDown3Click(Sender: TObject);
begin
    fThumbsScrollBox.goDown(3);
end;

procedure TFormNexCafe5PrintCentral.cxButton10Click(Sender: TObject);
begin
    fPagesScrollBox.ZoomIn;
end;

procedure TFormNexCafe5PrintCentral.WM_STARTPRINT_MESSAGE(var msg: TMessage);
var
    S: PChar; filesPath:string;
begin
    {$IFNDEF NOLOG} GLog.Log(self,[lcMsgs],'WM_STARTPRINT_MESSAGE');{$ENDIF}
    GetMem(S, msg.LParam+1);
    try
      GlobalGetAtomName(msg.WParam,S,msg.LParam+1);
      fMD5fromWMSTARTPRINT := string(S);
      GlobalDeleteAtom(msg.WParam);
    finally
      msg.Result := 1;
      freeMem(s);
    end;

    if fPagesScrollBox.MD5='' then begin
        if uMD5.H( formatfloat('000', CurrentProcess.Session) + fFullFileNameDest )<>fMD5fromWMSTARTPRINT then exit;
    end else
    if fMD5fromWMSTARTPRINT<>fPagesScrollBox.MD5 then exit;

    fPagesScrollBox.NotifyStartPrintMessage;
    fThumbsScrollBox.NotifyStartPrintMessage;

    filesPath := copy (fFullFileNameDest, 1, length(fFullFileNameDest)-9)+'\';
    fPagesScrollBox.StartLoad( filesPath , fThumbsScrollBox);
    fThumbsScrollBox.StartLoad( filesPath );
    fPaginaAtual := 1;
    
    {$IFNDEF NOLOG} GLog.Log(self,[lcMsgs],'WM_STARTPRINT_MESSAGE md5 ok');{$ENDIF}
    {$IFNDEF NOLOG} GLog.ForceLogWrite; {$ENDIF}
end;

procedure TFormNexCafe5PrintCentral.WM_PROGRESS_MESSAGE(var msg: TMessage);
var
    S: PChar;
    fMessageStr  : TStringList;
    iprogress, len : integer;
    aMD5fromWMSTARTPRINT : string;
begin
    {$IFNDEF NOLOG} GLog.Log(self,[lcMsgs],'WM_PROGRESS_MESSAGE' );{$ENDIF}
    iprogress := 0;
    try
        GetMem(S, msg.LParam+1);
        fMessageStr  := TStringList.create;
        try
          len := GlobalGetAtomName(msg.WParam,S,msg.LParam+1);
          if len = 0  then begin
              {$IFNDEF NOLOG} GLog.Log( nil,[lcTrace],
                       'GlobalGetAtomName error: '+SysErrorMessage(GetLastError)+' '+
                       inttostr(msg.wParam)+' '+inttostr(msg.lParam)
              );{$ENDIF}
              exit;
          end;
          fMessageStr.text := string(S);
          if fMessageStr.count>2 then begin
              aMD5fromWMSTARTPRINT := fMessageStr[0];
              iprogress := StrToInt(fMessageStr[2]);
          end;
          GlobalDeleteAtom(msg.WParam);
        finally
          msg.Result := 1;
          freeMem(s);
          fMessageStr.Free;
        end;
        {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'WM_PROGRESS_MESSAGE: '+aMD5fromWMSTARTPRINT );{$ENDIF}
        if fPagesScrollBox.MD5='' then begin
            if uMD5.H( formatfloat('000', CurrentProcess.Session) + fFullFileNameDest )<>aMD5fromWMSTARTPRINT then exit;
        end else
        if aMD5fromWMSTARTPRINT<>fPagesScrollBox.MD5 then exit;

        PanelProgressVisivel(iprogress<fThumbsScrollBox.ImageCount);
        cxProgressBar1.Properties.Max := fThumbsScrollBox.ImageCount;
        cxProgressBar1.Position := iprogress;
        fPagesScrollBox.NotifyProgressPrintMessage(iprogress);
        fThumbsScrollBox.NotifyProgressPrintMessage(iprogress);

        {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'WM_PROGRESS_MESSAGE ok: '+inttostr(iprogress) );{$ENDIF}
    finally
        msg.Result := 1;
    end;
    {$IFNDEF NOLOG} GLog.ForceLogWrite; {$ENDIF}
end;

procedure TFormNexCafe5PrintCentral.WM_AFTERPRINTSTART(var msg: TMessage);
var
    S: PChar;
//    filesPath : string;
begin
    {$IFNDEF NOLOG} GLog.Log(self,[lcMsgs],'WM_AFTERPRINTSTART');{$ENDIF}

    GetMem(S, msg.LParam+1);
    try
        GlobalGetAtomName(msg.WParam,S,msg.LParam+1);
        fMD5fromWMSTARTPRINT := string(S);
        GlobalDeleteAtom(msg.WParam);

        if fMD5fromWMSTARTPRINT <>
           uMD5.H( formatfloat('000', CurrentProcess.Session) + fFullFileNameDest ) then exit;

        {$IFNDEF NOLOG} GLog.Log(self,[lcMsgs],'WM_AFTERPRINTSTART md5 ok');{$ENDIF}
 //       filesPath := copy (fFullFileNameDest, 1, length(fFullFileNameDest)-9)+'\';
 //       fPagesScrollBox.StartLoad( filesPath , fThumbsScrollBox);
 //       fThumbsScrollBox.StartLoad( filesPath );
 //       fPaginaAtual := 1;
    finally
      msg.Result := 1;
      freeMem(s);
    end;
end;

procedure TFormNexCafe5PrintCentral.WM_ENDPRINT_MESSAGE(var msg: TMessage);
begin
    try
        if fMD5fromWMSTARTPRINT='' then begin
            if uMD5.H( formatfloat('000', CurrentProcess.Session) + fFullFileNameDest )<>fPagesScrollBox.MD5 then exit;
        end else
        if fMD5fromWMSTARTPRINT<>fPagesScrollBox.MD5 then exit;

        cancelarImpressao;

        {$IFNDEF NOLOG} GLog.Log(self,[lcMsgs],'WM_ENDPRINT_MESSAGE: '+inttostr(msg.LParam) );{$ENDIF}
    finally
        msg.Result := 1;
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
  if IsIconic(hwnd) then ShowWindow(hwnd, SW_RESTORE);

  if GetForegroundWindow = hwnd then Result := True
  else
  begin
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


{procedure TFormNexCafe5PrintCentral.formataRadioImpressoras(aCxRadioGroupPrinters: TcxRadioGroup);
var
    i:integer;
    p : TcxRadioGroupItem;
    w, w1 : integer;
begin
    aCxRadioGroupPrinters.Properties.Items.Clear;
    aCxRadioGroupPrinters.AutoSize := true;
    aCxRadioGroupPrinters.Style.BorderStyle := ebsNone;
    aCxRadioGroupPrinters.StyleFocused.BorderStyle := ebsNone;
    w := 0;
    aCxRadioGroupPrinters.Canvas.font := aCxRadioGroupPrinters.style.font;
    for i:=0 to fPrinters.Count -1 do begin
        p := aCxRadioGroupPrinters.Properties.Items.Add;
        p.Caption := formataPreco(fPrinters[i].precopp)+ ' - '+ fPrinters[i]. nome;
        w1 := aCxRadioGroupPrinters.Canvas.TextExtent(p.Caption).cx+40;
        if w1>w then w:=w1;
        p.Value := fPrinters[i].id;
    end;
    aCxRadioGroupPrinters.Width := w;
    aCxRadioGroupPrinters.Left := (FormPasso1.Width-aCxRadioGroupPrinters.Width) div 2;
    aCxRadioGroupPrinters.Top  := 147 + (aCxRadioGroupPrinters.Height div 2);
end;}

procedure TFormNexCafe5PrintCentral.TimerAfterShowTimer(Sender: TObject);
begin
  TimerAfterShow.Enabled := false;
  calculaTotal;
end;

procedure TFormNexCafe5PrintCentral.SetFullFileName(value: string);
begin
    if value <> fFullFileName then begin
        fFullFileName := value;
        
        {$IFNDEF NOLOG} GLog.Log(self,[lcMsgs],'SetFullFileName: '+fFullFileName);{$ENDIF}
        if openNextPDF then
             TimerAfterShow.Enabled := true
        else
            raise exception.create('Arquivo não encontrado: '+fFullFileName);

        ExecBatFileAsync( kNexCafe5AfterPrintPath + kNexCafe5AfterPrintExeName+' "'+fFullFileName+'"',kNexCafe5AfterPrintPath, nil);
    end;
end;

function TFormNexCafe5PrintCentral.openNextPDF:boolean;
var
    filesPath : string;
    //filesPath, sJsonFilename1, sJsonFilename2 : string;
begin
    result := false;

    if fileexists(fFullFileName) then begin
        fFullFileNameDest := strutils.ReplaceStr(fFullFileName, '\2\', '\3\');

        filesPath := copy (fFullFileName, 1, length(fFullFileName)-9)+'\';
        {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'openNextPDF open : '+fFullFileName);{$ENDIF}
        result := true;

        caption := kAppTittle + ' ('+inttostr(fsession)+') - '+ fFullFileName;
        cxLabelTotPag.Caption := inttostr(getPrintPageCount);


    end;
end;

procedure TFormNexCafe5PrintCentral.PanelHeader2AreaResize(Sender: TObject);
begin
    PanelHeader2.Left := ((PanelHeader2Area.width - PanelHeader2.width) div 2);
end;

procedure TFormNexCafe5PrintCentral.PanelProgressVisivel(value: boolean);
begin
  PanelProgress.visible   := value;
  PanelBorderLeft.visible := not value;
  if not value then begin
      PanelNavThumb.Top := PanelProgress.Height+1;
  end;
end;

procedure TFormNexCafe5PrintCentral.GetPrinters;
var
    p : TncPrinter;
    jPrinters : TJSONObject;
    aPrinters : TJSONArray;
    aPrinter : TJSONObject;
    sl : TStringList;
    i : integer;
begin

    fPrinters.Clear;
    sl := TStringList.create;
    sl.LoadFromFile( GApplicationPath + '\printers.json');
    jPrinters := TJSONObject.create(sl.text);
    try
         //fdefPrinterId := jPrinters.getInt('defaultPrinter');
         aPrinters     := jPrinters.getJSONArray('printers');
         for i:=0 to aPrinters.length-1 do begin
            aPrinter := aPrinters.getJSONObject(i);
            p := TncPrinter.create;
            p.id := aPrinter.getInt('NexcafeID');
            p.nome := aPrinter.getString('NexcafeNome');
            p.precopp := aPrinter.getDouble('NexcafePrecoPP');
            fPrinters.Add(p);
            //if p.id = fdefPrinterId then
            //    fPrinterAtual := p;
         end;
    finally
         sl.free;
         jPrinters.free;
    end;

    {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'GetPrinters : '+inttostr(fPrinters.count));{$ENDIF}

end;


function TFormNexCafe5PrintCentral.getPrintPageCount:integer;
begin
     result := fPagesScrollBox.PrintablePageCount;
end;

procedure TFormNexCafe5PrintCentral.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
    {$IFNDEF NOLOG} GLog.Log(self,[lcExcept],'Application Exception : '+E.Message);{$ENDIF}
end;

procedure TFormNexCafe5PrintCentral.ApplicationEvents1Message(var Msg: tagMSG;
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
        if mp.X < (fThumbsScrollBox.Left+fThumbsScrollBox.Width) then
            FLastWc := fThumbsScrollBox
        else
            FLastWc := fPagesScrollBox;

        if FLastWc<> nil then
           sendMessage( FLastWc.Handle, CM_MOUSEWHEEL, Msg.wParam, Msg.lParam );
     end;

end;


procedure TFormNexCafe5PrintCentral.calculaTotal;
var
   i : integer;
begin
   if fPrinterAtual=nil then begin
       for i:=0 to fPrinters.count-1 do
           if fPrinters[i].id =FormPrintGuard.selectedTipoImpressaoID then begin
               fPrinterAtual := fPrinters[i];
               break;
           end;
   end;
   cxLabelTotPag.Caption      := inttostr(getPrintPageCount);
   cxLabelValorTotal.caption  := formataPreco(getPrintPageCount * fPrinterAtual.precopp);
   cxLabelValorTotal.Visible := true;
end;

procedure TFormNexCafe5PrintCentral.fPagesScrollBoxPageChange(Sender: TObject; aPageNum: integer);
begin
    goToPage(aPageNum);
end;

procedure TFormNexCafe5PrintCentral.fPagesScrollBoxStatusChange(Sender: TObject; aPageNum: integer);
begin
    SetImagesStatusPrintButton(aPageNum);
    calculaTotal;                               
end;

procedure TFormNexCafe5PrintCentral.SetImagesStatusPrintButton(aPageNum:integer);
var
    bmp: TBitmap;
    PagePanel : TPagePanel;
begin
    bmp:= TBitmap.create;
    try
        PagePanel := fPagesScrollBox.Pagina[fPaginaAtual];
        if PagePanel<>nil then
            if PagePanel.NaoImprimir then begin
                cxImageList1.GetImage(1, bmp);
                cxButtonNaoImprimir.Glyph.Assign( bmp );
                cxButtonNaoImprimir.caption := kImprimirEsta;
            end else begin
                cxImageList1.GetImage(2, bmp);
                cxButtonNaoImprimir.Glyph.Assign( bmp );
                cxButtonNaoImprimir.caption := kNaoImprimirEsta;
            end;

    finally
        bmp.free;
    end;
end;

procedure TFormNexCafe5PrintCentral.goToPage(aPageNum: integer);
begin
    fPaginaAtual := aPageNum;
    cxLabelPaginaAtual.caption   :=  inttostr(fPaginaAtual) + '/' + inttostr(fPagesScrollBox.ImageCount);
    cxButtonPagAnterior.Enabled  := fPaginaAtual>1;
    cxButtonPagSiguiente.Enabled := fPaginaAtual<fPagesScrollBox.ImageCount;
    //fThumbsScrollBox.SelectThumb(fPaginaAtual);
    SetImagesStatusPrintButton(fPaginaAtual);
end;

function TFormNexCafe5PrintCentral.formataPreco(v:double):string;
begin
    result := 'R$ ' + formatFloat('####0.00',v);
end;

procedure TFormNexCafe5PrintCentral.cxButtonNaoImprimirClick(Sender: TObject);
begin
    fPagesScrollBox.ToggleImprimir(fPagesScrollBox.CurrentPage );
end;

procedure TFormNexCafe5PrintCentral.cxButtonFimClick(Sender: TObject);
var
     pRange : string;
     fPDFDocument : TgtPDFDocument;
     //retry : integer;
begin
      {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'impressao aprovada : '+fFullFileNameDest);{$ENDIF}

      // deletear paginas

      pRange := fPagesScrollBox.deletedRange;
      fPDFDocument := TgtPDFDocument.create(nil);
      fPDFDocument.FileName := fFullFileNameDest;
      try
          if pRange<>'' then begin
              {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'removendo paginas: '+pRange);{$ENDIF}
              fPDFDocument.DeletePages(pRange);
          end;
          {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'salvando em : '+fFullFileNameDest);{$ENDIF}
          try
              fPDFDocument.SaveToFile(fFullFileNameDest+'.tmp');
          except
              on e:exception do begin
              {$IFNDEF NOLOG} GLog.Log(self,[lcExcept],e.Message);{$ENDIF}
              end;
          end;
      finally
         fPDFDocument.Reset;
         fPDFDocument.Free;
      end;
      copyfile(pchar(fFullFileNameDest+'.tmp'), pchar(fFullFileNameDest), true);
      deletefile(fFullFileNameDest+'.tmp');

      zerarImpressao;
      close;
end;

procedure TFormNexCafe5PrintCentral.cxButtonEliminarClick(Sender: TObject);
begin
  close;
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

    FormNexCafe5PrintCentral.fProcList.add(IntToStr(pPid)+'='+IntToStr(hHwnd));
    Result := true;
  end;
end;

procedure TFormNexCafe5PrintCentral.cancelarImpressao;
var
    reTry : integer;
    s : string;
    wParam, lParam : integer;
    procHandle: THandle;
    Struct: TProcessEntry32;

    procedure p;
    var
       tid, pid : integer;
    begin
       if sametext(extractfilename(Struct.szExeFile) ,kTargetExeName) then begin

          procHandle := StrToInt( fProcList.Values[IntToStr(Struct.th32ProcessID)] );
          
          tid := GetWindowThreadProcessId(procHandle, @pid);
          reTry := 0;
          s := fPagesScrollBox.MD5;
          wParam := GlobalFindAtom(PChar(s));
          if wParam=0 then begin
              wParam := GlobalAddAtom(PChar(s));
              lParam  := Length(s);
              repeat sleep(1); inc(reTry);
              until PostThreadMessage( tid, WM_CANCELPRINT_MESSAGE, wParam, lParam) or (reTry=5);

              {$IFNDEF NOLOG}GLog.Log(self,[lcMsgs],'WM_CANCELPRINT_MESSAGE pid '+inttostr(Struct.th32ProcessID)+ ' '+s);{$ENDIF}
          end;
       end;
    end;

begin
      {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'impressao cancelada');{$ENDIF}
      try
          lp := 0; //globally declared integer
          fProcList.clear;
          if EnumWindows(@EnumProcess,lp) = false then
             ShowMessage('Error: Could not obtain process window hook from system.');

          procHandle:=CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS, 0);
          Struct.dwSize:=Sizeof(TProcessEntry32);

          if Process32First(procHandle, Struct) then p;
          while Process32Next(procHandle, Struct) do p;
      except
          on exception do
                ShowMessage('Error showing process list');
      end;

      zerarImpressao;

      {$IFNDEF NOLOG}GLog.ForceLogWrite; {$ENDIF}
end;

procedure TFormNexCafe5PrintCentral.zerarImpressao;
begin
        {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'zerando trabalho');{$ENDIF}

        fPagesScrollBox.Clear;
        fThumbsScrollBox.Clear;
        PanelProgressVisivel(false);

        fPagesScrollBox.VertScrollBar.Position := 0;
        fThumbsScrollBox.VertScrollBar.Position := 0;

        fPaginaAtual:=0;
        calculaTotal;
        //FormBackG1.hide;

        //LimparDiretorio;
        fFullFileName := '';
        fFullFileNameDest := '';
        fMD5fromWMSTARTPRINT := '';
        {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'fFullFileName := (nada)');{$ENDIF}


        {if FormPasso1.Showing then
            FormPasso1.ModalResult := mrIgnore;
        if FormPasso2.Showing then
            FormPasso1.ModalResult := mrIgnore;
        if FormPasso10.Showing then
            FormPasso10.ModalResult := mrIgnore;
        if FormPasso20.Showing then
            FormPasso20.ModalResult := mrIgnore;
        if FormPassoQuerSair.Showing then
            FormPassoQuerSair.ModalResult := mrIgnore;   }

end;

{
procedure TFormNexCafe5PrintCentral.LimparDiretorio;
var
  deleteFilesThread1 : TDeleteFilesThread;
  deleteFilesThread2 : TDeleteFilesThread;
begin
  {$ IFNDEF NOLOG GLog.Log(self,[lcTrace],'LimparDiretorio: '+fPasta1);$ENDIF
  $IFNDEF NOLOG GLog.Log(self,[lcTrace],'deletando : '+fPasta1 + '\'+ fOriginalFileName);$ENDIF

  fDeleting.add(fPasta1 + '\'+ fOriginalFileName);

  deleteFilesThread1 := TDeleteFilesThread.create(fPasta1, fOriginalFileName);
  deleteFilesThread1.OnDelete := deleteFilesThreadOnDelete;
  deleteFilesThread1.OnTerminate := deleteFilesThreadOnTerminate;
  deleteFilesThread1.resume;
  fDeleteFilesThreadList.add(deleteFilesThread1);

  fDeleting.add(fPasta1 + '\'+ fOriginalFileName+'.json');
  deleteFilesThread2 := TDeleteFilesThread.create(fPasta1, fOriginalFileName+'.json');
  deleteFilesThread2.OnDelete := deleteFilesThreadOnDelete;
  deleteFilesThread2.OnTerminate := deleteFilesThreadOnTerminate;
  deleteFilesThread2.resume;
  fDeleteFilesThreadList.add(deleteFilesThread2);
end;


procedure TFormNexCafe5PrintCentral.deleteFilesThreadOnDelete(Sender: TObject;
  Dirname: string);
var
  i : integer;
begin
  i := fDeleting.IndexOf(Dirname);
  if i>-1 then
     fDeleting.Delete(i);
end;

procedure TFormNexCafe5PrintCentral.deleteFilesThreadOnTerminate(Sender: TObject);
var
  i : integer;
begin
  i := fDeleteFilesThreadList.IndexOf(Sender);
  if i>-1 then
     fDeleteFilesThreadList.Delete(i);
end;

}

end.
