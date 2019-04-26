unit uNexCafe5PrintMan;

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

    kAppTittle = 'Central de impressões';
    kNaoImprimirEsta =  'NÃO IMPRIMIR esta página';
    kImprimirEsta =  'IMPRIMIR esta página';
    kTargetExeName='printGuard.exe';
type


  TFormNexCafe5PrintMan = class(TForm)
    TimerAfterWM: TTimer;
    TimerAfterShow: TTimer;
    dxSkinController1: TdxSkinController;
    cxEditStyleController1: TcxEditStyleController;
    PanelFundo: TPanel;
    PanelHeader1: TPanel;
    cxButtonMudarPrinter: TcxButton;
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
    procedure WM_STARTPRINT_MESSAGE(var msg : TMessage); message WM_STARTPRINT_MESSAGE;
    procedure WM_PROGRESS_MESSAGE(var msg : TMessage); message WM_PROGRESS_MESSAGE;
    procedure WM_ENDPRINT_MESSAGE(var msg : TMessage); message WM_ENDPRINT_MESSAGE;
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
    procedure cxButtonMudarPrinterClick(Sender: TObject);
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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
  private
    FLastWc : TWinControl;
    fdefPrinterId : integer;
    fPrinters     : TncPrinterList;
    fPrinterAtual : TncPrinter;
    fPaginaAtual : integer;
    fPasta1 : string;
    fPasta2 : string;
    fNomeMaquina : string;
    fFullFileName : string;
    fOriginalFileName : string;
    fSession : integer;
    fThumbsScrollBox: TThumbsScrollBox;
    fPagesScrollBox: TPagesScrollBox;
    fMD5fromWMSTARTPRINT : string;
    FIsStartPrint : boolean;
    fDeleting : TStringList;
    fDeleteFilesThreadList : TList;
    fProcList : TStringList;
    lp : integer;
    procedure showMe;
    procedure GetPrinters;
    function  findNextPDF:boolean;
    function  openNextPDF:boolean;
    procedure TimerAfterWMTimer(Sender: TObject);
    procedure TimerAfterShowTimer(Sender: TObject);
    procedure goToPage(aPageNum:integer);
    function  formataPreco(v:double):string;
    function  getPrintPageCount:integer;
    procedure reCalc;
    procedure calculaTotal;
    procedure LimparDiretorio;
    procedure deleteFilesThreadOnDelete(Sender: TObject; Dirname : string);
    procedure deleteFilesThreadOnTerminate(Sender: TObject);
    procedure cancelarImpressao;
    procedure zerarImpressao;
    procedure formataRadioImpressoras(aCxRadioGroupPrinters: TcxRadioGroup);
    procedure fThumbsScrollBoxOnThumbClick(Sender: TObject; aPageNum:integer);
    procedure fPagesScrollBoxOnBMPClick(Sender: TObject; aPageNum:integer);
    //procedure fPagesScrollBoxOnFirstBmp(Sender: TObject; aTotPages, aThumbWidth, aThumbHeight, aBmpWidth, aBmpHeight:integer);
    procedure fPagesScrollBoxOnIniRead(Sender: TObject; aTotPages, aThumbWidth, aThumbHeight, aBmpWidth, aBmpHeight:integer; aMD5:string);
    procedure fPagesScrollBoxPageChange(Sender: TObject; aPageNum: integer);
    procedure fPagesScrollBoxOnDblClick(Sender: TObject; aPageNum:integer);
    procedure fPagesScrollBoxStatusChange(Sender: TObject; aPageNum:integer);
    procedure SetImagesStatusPrintButton(aPageNum:integer);
    procedure PanelProgressVisivel(value:boolean);
    //procedure LoadConfig;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNexCafe5PrintMan: TFormNexCafe5PrintMan;
  {$IFDEF NOLOG}
  GApplicationPath :string;
  {$ENDIF}

implementation

uses
    gtPDFClasses,
    {$IFNDEF NOLOG}
    uLogs,
    {$ENDIF}
    md5,
    gtPDFDoc,
    madKernel,
    TLHelp32,
    uDeleteFiles,
    strUtils, ncgPrintInstall, ncNomeMaquina, inifiles, uJson,
    uFormBackG1, uFormPasso1, uFormPasso2, uFormPasso10, uFormPasso20,
    uFormPassoQuerSair, uPrintManBaseClasses;

{$R *.dfm}

procedure TFormNexCafe5PrintMan.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
    if NewWidth<800 then NewWidth :=800;
    if NewHeight<600 then NewHeight :=600;
end;

procedure TFormNexCafe5PrintMan.FormCreate(Sender: TObject);
begin
  fPrinters   := TncPrinterList.create;
  fNomeMaquina := GetNomeMaquina;
  {$IFNDEF NOLOG} GLog.Log(self,[lcInfo],'NomeMaquina : '+fNomeMaquina);{$ENDIF}

  fDeleting := TStringList.create;
  fDeleteFilesThreadList := TList.create;
  fProcList := TStringList.create;

  fThumbsScrollBox := TThumbsScrollBox.Create(nil);
  fThumbsScrollBox.Parent := PanelThumbs;
  fThumbsScrollBox.OnImageClick := fThumbsScrollBoxOnThumbClick;
  fThumbsScrollBox.OnImageDblClick := fPagesScrollBoxOnDblClick;

  fPagesScrollBox := TPagesScrollBox.Create(nil);
  fPagesScrollBox.Parent := PanelViewerArea;         
  fPagesScrollBox.OnPageChange := fPagesScrollBoxPageChange;
  fPagesScrollBox.OnStatusChange := fPagesScrollBoxStatusChange;
  fPagesScrollBox.OnImageClick   := fPagesScrollBoxOnBMPClick;
  fPagesScrollBox.OnIniRead    := fPagesScrollBoxOnIniRead;
  fPagesScrollBox.OnImageDblClick := fPagesScrollBoxOnDblClick;

  cxButtonNaoImprimir.caption := kNaoImprimirEsta;
  GApplicationPath := ExtractFilePath(ParamStr(0));

  fPasta1 := GApplicationPath+'Print\pend\2';
  fPasta2 := GApplicationPath+'Print\pend\3';

  TimerAfterWM.Interval := 100;
  TimerAfterWM.onTimer := TimerAfterWMTimer;
  TimerAfterShow.Interval := 100;
  TimerAfterShow.onTimer := TimerAfterShowTimer;

  top    := 0;
  left   := 0;
  height := screen.WorkAreaHeight;
  width  := screen.WorkAreaWidth;

  {$IFNDEF NOLOG} GLog.Log(self,[lcInfo],'Pasta1 : '+fPasta1);{$ENDIF}

  caption := kAppTittle;
  RemovePrinters(false);

  if not NexPrinterInstalled then
     InstallNexPrinter(false);

  GetPrinters;
  {$IFNDEF NOLOG} GLog.ForceLogWrite; {$ENDIF}

  PanelProgressVisivel(false);
end;

procedure TFormNexCafe5PrintMan.FormDestroy(Sender: TObject);
var
  i : integer;
begin
    fThumbsScrollBox.Parent := nil;
    fPagesScrollBox.Parent := nil;
    fPagesScrollBox.Free;
    fPrinters.free;
    fDeleting.Free;
    fProcList.Free;
    
    for i:=fDeleteFilesThreadList.Count-1 downto 0 do
        TDeleteFilesThread(fDeleteFilesThreadList[i]).terminate;
    fDeleteFilesThreadList.free;

    {$IFNDEF NOLOG} GLog.CloseLogFile; {$ENDIF}
end;

procedure TFormNexCafe5PrintMan.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=32 then begin
        cxButtonNaoImprimirClick(nil);
        key:=0;
    end;
end;

procedure TFormNexCafe5PrintMan.FormResize(Sender: TObject);
begin
    GPanelScroll1.width := fPagesScrollBox.ScrollW;
    GPanelScroll2.width := GPanelScroll1.width;
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

procedure TFormNexCafe5PrintMan.FormShow(Sender: TObject);
begin
    FormBackG1.Left   := self.Left;
    FormBackG1.Top    := self.Top;
    FormBackG1.Height := self.Height;
    FormBackG1.Width  := self.Width;
    TimerAfterWM.Enabled := true;
end;

procedure TFormNexCafe5PrintMan.fThumbsScrollBoxOnThumbClick(Sender: TObject;
  aPageNum: integer);
begin
    fPagesScrollBox.CurrentPage := aPageNum;
end;

procedure TFormNexCafe5PrintMan.fPagesScrollBoxOnBMPClick(Sender: TObject;
  aPageNum: integer);
begin
    //fThumbsScrollBox.SelectThumb(aPageNum);
    fPagesScrollBox.CurrentPage := aPageNum;
end;

procedure TFormNexCafe5PrintMan.fPagesScrollBoxOnDblClick(Sender: TObject;
  aPageNum: integer);
begin
    fPagesScrollBox.ToggleZoom;
end;

procedure TFormNexCafe5PrintMan.fPagesScrollBoxOnIniRead(Sender: TObject;
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
end;


procedure TFormNexCafe5PrintMan.cxButtonUp1Click(Sender: TObject);
begin
    fThumbsScrollBox.goUp(1);
end;

procedure TFormNexCafe5PrintMan.cxButtonUp2Click(Sender: TObject);
begin
    fThumbsScrollBox.goUp(2);
end;

procedure TFormNexCafe5PrintMan.cxButtonUp3Click(Sender: TObject);
begin
    fThumbsScrollBox.goUp(3);
end;

procedure TFormNexCafe5PrintMan.cxButton13Click(Sender: TObject);
begin
    fPagesScrollBox.First;
end;

procedure TFormNexCafe5PrintMan.cxButtonPagAnteriorClick(Sender: TObject);
begin
    fPagesScrollBox.Prior;
end;

procedure TFormNexCafe5PrintMan.cxButtonPagSiguienteClick(Sender: TObject);
begin
    fPagesScrollBox.Next;
end;



procedure TFormNexCafe5PrintMan.cxButton16Click(Sender: TObject);
begin
    fPagesScrollBox.Last;
end;

procedure TFormNexCafe5PrintMan.cxButton9Click(Sender: TObject);
begin
    fPagesScrollBox.ZoomOut;
end;

procedure TFormNexCafe5PrintMan.cxButtonDown1Click(Sender: TObject);
begin
    fThumbsScrollBox.goDown(1);
end;

procedure TFormNexCafe5PrintMan.cxButtonDown2Click(Sender: TObject);
begin
    fThumbsScrollBox.goDown(2);
end;

procedure TFormNexCafe5PrintMan.cxButtonDown3Click(Sender: TObject);
begin
    fThumbsScrollBox.goDown(3);
end;

procedure TFormNexCafe5PrintMan.cxButton10Click(Sender: TObject);
begin
    fPagesScrollBox.ZoomIn;
end;

procedure TFormNexCafe5PrintMan.WM_STARTPRINT_MESSAGE(var msg: TMessage);
var
    S: PChar;
begin
    // usa gambiarra do timer para liberar o programa q mandou a mensagem
    GetMem(S, msg.LParam+1);
    try
      GlobalGetAtomName(msg.WParam,S,msg.LParam+1);
      fMD5fromWMSTARTPRINT := string(S);
      GlobalDeleteAtom(msg.WParam);
    finally
      msg.Result := 1;
      freeMem(s);
    end;
    FIsStartPrint := true;
    TimerAfterWM.Enabled := fFullFileName='';
    {$IFNDEF NOLOG} GLog.Log(self,[lcMsgs],'WM_STARTPRINT_MESSAGE');{$ENDIF}
    {$IFNDEF NOLOG} GLog.ForceLogWrite; {$ENDIF}
end;

procedure TFormNexCafe5PrintMan.WM_PROGRESS_MESSAGE(var msg: TMessage);
var
    S: PChar;
    fMessageStr  : TStringList;
    iprogress : integer;
begin
    iprogress := 0;
    try
        GetMem(S, msg.LParam+1);
        fMessageStr  := TStringList.create;
        try
          GlobalGetAtomName(msg.WParam,S,msg.LParam+1);
          fMessageStr.text := string(S);
          if fMessageStr.count>2 then begin
              fMD5fromWMSTARTPRINT := fMessageStr[0];
              iprogress := StrToInt(fMessageStr[2]);
          end;
          GlobalDeleteAtom(msg.WParam);
        finally
          msg.Result := 1;
          freeMem(s);
          fMessageStr.Free;
        end;
        if fMD5fromWMSTARTPRINT='' then begin
            if MD5.H( formatfloat('000', CurrentProcess.Session) + fFullFileName )<>fPagesScrollBox.MD5 then exit;
        end else
        if fMD5fromWMSTARTPRINT<>fPagesScrollBox.MD5 then exit;

        PanelProgressVisivel(iprogress<fThumbsScrollBox.ImageCount);
        cxProgressBar1.Properties.Max := fThumbsScrollBox.ImageCount;
        cxProgressBar1.Position := iprogress;

        //cxLabelProgress2.caption := inttostr(msg.LParam) +'/'+ inttostr(fThumbsScrollBox.ImageCount);
        {$IFNDEF NOLOG} GLog.Log(self,[lcMsgs],'WM_PROGRESS_MESSAGE: '+inttostr(iprogress) );{$ENDIF}
    finally
        msg.Result := 1;
    end;
    fPagesScrollBox.NotifyProgressPrintMessage(iprogress);
    fThumbsScrollBox.NotifyProgressPrintMessage(iprogress);
    {$IFNDEF NOLOG} GLog.ForceLogWrite; {$ENDIF}
end;

procedure TFormNexCafe5PrintMan.WM_ENDPRINT_MESSAGE(var msg: TMessage);
begin
    try
        if fMD5fromWMSTARTPRINT='' then begin
            if MD5.H( formatfloat('000', msg.WParam) + fFullFileName )<>fPagesScrollBox.MD5 then exit;
        end else
        if fMD5fromWMSTARTPRINT<>fPagesScrollBox.MD5 then exit;

        cancelarImpressao;
        
        {$IFNDEF NOLOG} GLog.Log(self,[lcMsgs],'WM_ENDPRINT_MESSAGE: '+inttostr(msg.LParam) );{$ENDIF}
    finally
        msg.Result := 1;
    end;
end;

procedure TFormNexCafe5PrintMan.TimerAfterWMTimer(Sender: TObject);
begin
    TimerAfterWM.Enabled := false;

    {$IFNDEF NOLOG} GLog.Log(self,[lcMsgs],'TimerAfterWMTimer');{$ENDIF}
    if openNextPDF then
        showMe
    else
        application.Minimize;

    if FIsStartPrint then begin
        FIsStartPrint := false;
        fPagesScrollBox.NotifyStartPrintMessage;
        fThumbsScrollBox.NotifyStartPrintMessage;
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


procedure TFormNexCafe5PrintMan.showMe;
begin
  { $ WARNINGS OFF}
  //if DebugHook =0 then begin   //not in IDE
  //    FormStyle := fsStayOnTop;
  //    self.BringToFront;
  //end;
  { $ WARNINGS ON}

  PostMessage(application.Handle, WM_SYSCOMMAND, SC_Restore, 0);
  {$IFNDEF NOLOG} GLog.Log(self,[lcMsgs],'WM_SYSCOMMAND SC_Restore' );{$ENDIF}
  ForceForegroundWindow(Handle);

  TimerAfterShow.Enabled := true;
end;

procedure TFormNexCafe5PrintMan.formataRadioImpressoras(aCxRadioGroupPrinters: TcxRadioGroup);
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
end;

procedure TFormNexCafe5PrintMan.TimerAfterShowTimer(Sender: TObject);
var
    mr : TModalResult;
    loop : boolean;
begin
  TimerAfterShow.Enabled := false;
  //Application.BringToFront;

  FormBackG1.Show;

  if fPrinters.Count>1 then
  with FormPasso1 do begin
      loop := true;
      while loop do begin

          formataRadioImpressoras(cxRadioGroupPrinters);

          FormPasso2.cxLabelTittle.caption := 'Revisor de Impressão passo 2';
          mr := FormPasso1.ShowModal;
          if mr=mrOk then begin
                fPrinterAtual := fPrinters[cxRadioGroupPrinters.ItemIndex];
                calculaTotal;
                loop := false;
          end;
          if mr=mrAbort then begin
                if FormPassoQuerSair.ShowModal=mrOk then begin
                    cancelarImpressao;
                    FormBackG1.hide;
                    exit;
                end;
          end;
          if mr=mrIgnore then begin
                FormBackG1.hide;
                exit;
          end;
      end;
  end;

  FormPasso2.cxLabelPreco.caption := inttostr(getPrintPageCount) +
        ' páginas e custará ' +
        formataPreco(getPrintPageCount * fPrinterAtual.precopp);
  FormPasso2.ShowModal;

  FormBackG1.hide;

  cxLabelValorTotal.Visible := true;

end;

procedure TFormNexCafe5PrintMan.cxButtonMudarPrinterClick(Sender: TObject);
begin
    if fPrinters.Count>1 then
    with FormPasso20 do begin
        FormBackG1.Show;
        try
            formataRadioImpressoras(cxRadioGroupPrinters);
            cxRadioGroupPrinters.ItemIndex := fPrinters.indexof(fPrinterAtual);
            FormPasso20.ShowModal;
            fPrinterAtual := fPrinters[cxRadioGroupPrinters.ItemIndex];
            calculaTotal;
        finally
            FormBackG1.hide;
        end;
    end;
end;

function TFormNexCafe5PrintMan.openNextPDF:boolean;
var
    filesPath : string;
begin
    result := false;
    
    if fFullFileName='' then begin
        if not findNextPDF then begin
            {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'openNextPDF sem arquivos para processar.');{$ENDIF}
            application.Minimize;
            exit;
        end;
    end;

    if fileexists(fFullFileName) then begin

        filesPath := copy (fFullFileName, 1, length(fFullFileName)-9)+'\';
        {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'openNextPDF open : '+fFullFileName);{$ENDIF}
        result := true;

        caption := kAppTittle + ' ('+inttostr(fsession)+') - '+ fOriginalFileName;
        cxLabelTotPag.Caption := inttostr(getPrintPageCount);

        fPagesScrollBox.StartLoad( filesPath , fThumbsScrollBox);
        fThumbsScrollBox.StartLoad( filesPath );
        fPaginaAtual := 1;

    end;
end;

procedure TFormNexCafe5PrintMan.PanelHeader2AreaResize(Sender: TObject);
begin
    PanelHeader2.Left := ((PanelHeader2Area.width - PanelHeader2.width) div 2);
end;

procedure TFormNexCafe5PrintMan.PanelProgressVisivel(value: boolean);
begin
  PanelProgress.visible   := value;
  PanelBorderLeft.visible := not value;
  if not value then begin
      PanelNavThumb.Top := PanelProgress.Height+1;
  end;
end;

function TFormNexCafe5PrintMan.findNextPDF:boolean;
var
    sr: TSearchRec;
    folder : string;
begin
    result := false;
    {$WARNINGS OFF}
    if SysUtils.FindFirst(fPasta1 + '\' + fNomeMaquina+'_*', faArchive, sr) = 0 then begin
        repeat
            folder := copy(sr.Name, 1, length(sr.Name)- length(ExtractFileExt(sr.Name)));
            if (fileexists(fPasta1 + '\' +folder+ '\file.info' )) and
               (fileexists(fPasta1 + '\' +folder+ '.nexprint' )) then begin

                if fDeleting.IndexOf(fPasta1 + '\' +folder+ '.nexprint') = -1 then begin
                    fOriginalFileName := sr.Name;
                    fFullFileName := fPasta1 + '\' + sr.Name;
                    result := true;
                    break;
                end;

            end;
        until FindNext(sr) <> 0;
        SysUtils.FindClose(sr);
    end;
    {$WARNINGS ON}
end;

procedure TFormNexCafe5PrintMan.GetPrinters;
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
         fdefPrinterId := jPrinters.getInt('defaultPrinter');
         aPrinters     := jPrinters.getJSONArray('printers');
         for i:=0 to aPrinters.length-1 do begin
            aPrinter := aPrinters.getJSONObject(i);
            p := TncPrinter.create;
            p.id := aPrinter.getInt('NexcafeID');
            p.nome := aPrinter.getString('NexcafeNome');
            p.precopp := aPrinter.getDouble('NexcafePrecoPP');
            fPrinters.Add(p);
            if p.id = fdefPrinterId then
                fPrinterAtual := p;
         end;
    finally
         sl.free;
         jPrinters.free;
    end;

    {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'GetPrinters : '+inttostr(fPrinters.count));{$ENDIF}

end;


function TFormNexCafe5PrintMan.getPrintPageCount:integer;
begin
     result := fPagesScrollBox.PrintablePageCount;
end;

procedure TFormNexCafe5PrintMan.reCalc;
begin
   calculaTotal;
   cxLabelTotPag.Caption := inttostr(getPrintPageCount);
end;

procedure TFormNexCafe5PrintMan.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
    {$IFNDEF NOLOG} GLog.Log(self,[lcExcept],'Application Exception : '+E.Message);{$ENDIF}
end;

procedure TFormNexCafe5PrintMan.ApplicationEvents1Message(var Msg: tagMSG;
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

procedure TFormNexCafe5PrintMan.calculaTotal;
begin
   cxLabelValorTotal.caption  := formataPreco(getPrintPageCount * fPrinterAtual.precopp);
end;

procedure TFormNexCafe5PrintMan.fPagesScrollBoxPageChange(Sender: TObject; aPageNum: integer);
begin
    goToPage(aPageNum);
end;

procedure TFormNexCafe5PrintMan.fPagesScrollBoxStatusChange(Sender: TObject; aPageNum: integer);
begin
    SetImagesStatusPrintButton(aPageNum);
    reCalc;                               
end;

procedure TFormNexCafe5PrintMan.SetImagesStatusPrintButton(aPageNum:integer);
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

procedure TFormNexCafe5PrintMan.goToPage(aPageNum: integer);
begin
    fPaginaAtual := aPageNum;
    cxLabelPaginaAtual.caption   :=  inttostr(fPaginaAtual) + '/' + inttostr(fPagesScrollBox.ImageCount);
    cxButtonPagAnterior.Enabled  := fPaginaAtual>1;
    cxButtonPagSiguiente.Enabled := fPaginaAtual<fPagesScrollBox.ImageCount;
    //fThumbsScrollBox.SelectThumb(fPaginaAtual);
    SetImagesStatusPrintButton(fPaginaAtual);
end;

function TFormNexCafe5PrintMan.formataPreco(v:double):string;
begin
    result := 'R$ ' + formatFloat('####0.00',v);
end;

procedure TFormNexCafe5PrintMan.cxButtonNaoImprimirClick(Sender: TObject);
begin
    fPagesScrollBox.ToggleImprimir(fPagesScrollBox.CurrentPage );
end;

procedure TFormNexCafe5PrintMan.cxButtonFimClick(Sender: TObject);
var
     pRange : string;
     mr:TModalResult;
     fPDFDocument : TgtPDFDocument;
     loop : boolean;
     aDecimalSeparator : char;
     sl:TStringList;
begin
    FormBackG1.Show;

    FormPasso10.cxLabelPreco.caption := inttostr(getPrintPageCount) +
        ' páginas e custará ' +
        formataPreco(getPrintPageCount * fPrinterAtual.precopp);

    loop := true;
    while loop do begin
        mr := FormPasso10.ShowModal;
        if mr=mrAbort then begin
              if FormPassoQuerSair.ShowModal=mrOk then begin
                  cancelarImpressao;
                  FormBackG1.hide;
                  exit;
              end;
        end;
        if mr=mrOk then begin

            {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'impressao aprovada : '+fFullFileName);{$ENDIF}

            // deletear paginas

            pRange := fPagesScrollBox.deletedRange;
            fPDFDocument := TgtPDFDocument.create(nil);
            fPDFDocument.FileName := fFullFileName;
            try
                if pRange<>'' then begin
                    {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'removendo paginas: '+pRange);{$ENDIF}
                    fPDFDocument.DeletePages(pRange);
                end;
                {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'salvando em : '+fPasta2 + '\'+fNomeMaquina+'_'+ fOriginalFileName);{$ENDIF}
                fPDFDocument.SaveToFile(fPasta2 + '\'+fNomeMaquina+'_'+ fOriginalFileName);
            finally
               fPDFDocument.Free;
            end;

            aDecimalSeparator := DecimalSeparator;
            DecimalSeparator := '.';
            sl := TStringList.create;
            try
                sl.text := '{"maquina":"'+fNomeMaquina+'",'+
                          '"IDPrinter":'+inttostr(fPrinterAtual.id)+','+
                          '"ppp":'+formatfloat('####0.00',fPrinterAtual.precopp)+','+
                          '"paginas":'+inttostr(fPagesScrollBox.PrintablePageCount)+','+
                          '"total":'+formatfloat('####0.00',fPagesScrollBox.PrintablePageCount * fPrinterAtual.precopp)+','+
                          ' "datahora":"'+formatdatetime('ddmmyyyyhhnnss',now)+'"'+
                          '}';
                {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'salvando json em : '+fPasta2 + '\'+fNomeMaquina+'_'+ fOriginalFileName+'.json');{$ENDIF}
                sl.SaveToFile(fPasta2 + '\'+fNomeMaquina+'_'+ fOriginalFileName+'.json');
            finally
                DecimalSeparator := aDecimalSeparator;
                sl.free;
            end;
            
            zerarImpressao;
            OpenNextPDF;

            loop := false;
      end;
      if mr=mrCancel then begin
          FormBackG1.hide;
          exit;
      end;
      if mr=mrIgnore then begin
           FormBackG1.hide;
           exit;
      end;
    end;
    FormBackG1.hide;

end;

procedure TFormNexCafe5PrintMan.cxButtonEliminarClick(Sender: TObject);
begin
  FormBackG1.Show;

  if FormPassoQuerSair.ShowModal=mrOk then
     cancelarImpressao;

  FormBackG1.hide;
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

    FormNexCafe5PrintMan.fProcList.add(IntToStr(pPid)+'='+IntToStr(hHwnd));
    Result := true;
  end;
end;

procedure TFormNexCafe5PrintMan.cancelarImpressao;
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

              {$IFNDEF NOLOG} GLog.Log(self,[lcMsgs],'WM_CANCELPRINT_MESSAGE pid '+inttostr(Struct.th32ProcessID)+ ' '+s);{$ENDIF}
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
      TimerAfterWM.enabled :=  true;

      {$IFNDEF NOLOG} GLog.ForceLogWrite; {$ENDIF}
end;

procedure TFormNexCafe5PrintMan.zerarImpressao;
begin
        {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'zerando trabalho');{$ENDIF}

        fPagesScrollBox.Clear;
        fThumbsScrollBox.Clear;
        PanelProgressVisivel(false);

        fPagesScrollBox.VertScrollBar.Position := 0;
        fThumbsScrollBox.VertScrollBar.Position := 0;

        fPaginaAtual:=0;
        reCalc;
        FormBackG1.hide;

        LimparDiretorio;
        fFullFileName := '';
        fOriginalFileName := '';
        fMD5fromWMSTARTPRINT := '';
        {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'fFullFileName := (nada)');{$ENDIF}


        if FormPasso1.Showing then
            FormPasso1.ModalResult := mrIgnore;
        if FormPasso2.Showing then
            FormPasso1.ModalResult := mrIgnore;
        if FormPasso10.Showing then
            FormPasso10.ModalResult := mrIgnore;
        if FormPasso20.Showing then
            FormPasso20.ModalResult := mrIgnore;
        if FormPassoQuerSair.Showing then
            FormPassoQuerSair.ModalResult := mrIgnore;

end;

procedure TFormNexCafe5PrintMan.LimparDiretorio;
var
  deleteFilesThread : TDeleteFilesThread;
begin
  {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'LimparDiretorio: '+fPasta1);{$ENDIF}
  {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'deletando : '+fPasta1 + '\'+ fOriginalFileName);{$ENDIF}

  fDeleting.add(fPasta1 + '\'+ fOriginalFileName);
  
  deleteFilesThread := TDeleteFilesThread.create(fPasta1, fOriginalFileName);
  deleteFilesThread.OnDelete := deleteFilesThreadOnDelete;
  deleteFilesThread.OnTerminate := deleteFilesThreadOnTerminate;
  deleteFilesThread.resume;
  fDeleteFilesThreadList.add(deleteFilesThread);
  
end;

procedure TFormNexCafe5PrintMan.deleteFilesThreadOnDelete(Sender: TObject;
  Dirname: string);
var
  i : integer;
begin
  i := fDeleting.IndexOf(Dirname);
  if i>-1 then
     fDeleting.Delete(i);
end;

procedure TFormNexCafe5PrintMan.deleteFilesThreadOnTerminate(Sender: TObject);
var
  i : integer;
begin
  i := fDeleteFilesThreadList.IndexOf(Sender);
  if i>-1 then
     fDeleteFilesThreadList.Delete(i);
end;

end.
