unit uPrintGuard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uOlhaPasta,
  gtPDFPrinter,
  gtPDFClasses,
  gtCstPDFDoc,
  gtExPDFDoc,
  gtExProPDFDoc,
  gtPDFDoc,
  gtPDFUtils,
  jpeg,
  ujson,
  dateutils,
  udmPrintGuard,
  uPrinterInfo8,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxLabel,
  Menus, cxButtons, ncPrinters,
  dxLayoutcxEditAdapters, dxLayoutContainer, dxLayoutControl, cxContainer,
  cxTextEdit, cxMemo, uPrintException;

Const
    kIndeterminada = '--Indeterminada--';
     
type
  TFormPrintGuard = class(TForm)
    Label1: TLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1maquina: TcxGridDBColumn;
    cxGrid1DBTableView1IDPrinter: TcxGridDBColumn;
    cxGrid1DBTableView1paginas: TcxGridDBColumn;
    cxGrid1DBTableView1datahora: TcxGridDBColumn;
    cxGrid1DBTableView1TipoImpressao: TcxGridDBColumn;
    cxButtonImprimir: TcxButton;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1DBTableView1FileName: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxGrid1DBTableView1TipoImpressaoGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
    procedure cxGrid1DBTableView1TipoImpressaoCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxButtonImprimirClick(Sender: TObject);
    procedure Imprimir;
    procedure SelecionarTipoDeImpressao;
  private
    { Private declarations }
    fPasta1 : string;
    fPasta2 : string;
    fOlhaPastaThread : TOlhaPastaThread;
    ffilesToPrint : TStringList;
    fDeleting : TStringList;
    fDeleteFilesThreadList : TList;
    //procedure p(aFullFileName:string);
    procedure LoadTipoImpressao;
    //procedure LoadPrinters;
    procedure adicionar(aPrintName:string);
    procedure checarDBePasta;
    procedure doOnNewPrint(Sender: TObject; aPrintName:string);
    function formataPreco(v: double): string;
    procedure LimparDiretorios(const aWait:boolean=false);
    procedure deleteFilesThreadOnDelete(Sender: TObject; Dirname : string);
    procedure deleteFilesThreadOnTerminate(Sender: TObject);
  public
    fTiposImpressao : TncPrinterList;
    selectedTipoImpressaoID : integer;
    selectedTipoImpressao : string;
    selectedMaquina : string;
    selectedPrinterName : string;
    selectedPrinterInfo8Stream : TMemoryStream;
    selectedPrinterJson : string;
    selectedTipoValor : double;
    //fImpressoras : TncPhysicalPrinterList;
    procedure ConfigSelectedPrinter(aForm:TForm);
    procedure getSelectedPrinterJson;
    procedure LoadSelectedPrinter;
    procedure revisar;
    procedure GetPrinterDescription(aDxLayoutControl: TdxLayoutControl; aIdPrinter, aQPaginas:integer);
    function print:boolean;
    { Public declarations }
  end;

var
  FormPrintGuard: TFormPrintGuard;
  GApplicationPath :string;

implementation

{$R *.dfm}

uses
    {$IFNDEF NOLOG}
    uLogs,
    {$ENDIF}
    md5,
    printers, ncgPrintInstall,
    uDeleteFiles,
    strUtils, uFormPassoA, uFormPassoB, uFormPassoQuerSair, uFormBackG1,
    uNexCafe5PrintCentral;


procedure TFormPrintGuard.FormCreate(Sender: TObject);
begin
  GApplicationPath := ExtractFilePath(ParamStr(0));
  fPasta1 := GApplicationPath+'Print\pend\2';
  fPasta2 := GApplicationPath+'Print\pend\3';
  label1.caption := fpasta1;
  ffilesToPrint := TStringList.create;
  fTiposImpressao := TncPrinterList.create;
  //fImpressoras    := TncPhysicalPrinterList.create;
  selectedPrinterInfo8Stream := TMemoryStream.create;
  fDeleting := TStringList.create;
  fDeleteFilesThreadList := TList.create;

  checarDBePasta;
  fOlhaPastaThread := TOlhaPastaThread.create( fPasta1);
  fOlhaPastaThread.OnNewPrint := doOnNewPrint;
  fOlhaPastaThread.Resume;
end;

procedure TFormPrintGuard.FormDestroy(Sender: TObject);
var
    i:integer;
begin
    {$IFNDEF NOLOG} GLog.CloseLogFile; {$ENDIF}
    fOlhaPastaThread.Terminate;
    fOlhaPastaThread.WaitFor;
    fOlhaPastaThread.free;
    fTiposImpressao.free;
    selectedPrinterInfo8Stream.Free;
    //fImpressoras.free;
    
    ffilesToPrint.free;
    
    fDeleting.Free;
    for i:=fDeleteFilesThreadList.Count-1 downto 0 do
        TDeleteFilesThread(fDeleteFilesThreadList[i]).terminate;
    fDeleteFilesThreadList.free;

end;

procedure TFormPrintGuard.GetPrinterDescription(aDxLayoutControl: TdxLayoutControl; aIdPrinter, aQPaginas: integer);
var
    aPrinter : TncPrinter;
    ALayoutGroup: TdxLayoutGroup;
    cxLabelA: TcxLabel;
    cxLabelB: TcxLabel;
    procedure CreateLabels;
    begin
          cxLabelA := TcxLabel.create(self);
          cxLabelA.Autosize := false;
          cxLabelA.width := 170;
          cxLabelA.height := 19;
          cxLabelA.Style.Font.Name := 'Verdana';
          cxLabelA.Style.Font.Size := 9;
          cxLabelB := TcxLabel.create(self);
          cxLabelB.Style.Font.Name := 'Verdana';
          cxLabelB.Style.Font.Size := 9;
    end;
begin
    aPrinter := fTiposImpressao.byId(aIdPrinter);
    if aPrinter<>nil then begin
        with aDxLayoutControl do begin
          BeginUpdate;

          clear;
          
          ALayoutGroup := CreateGroup(nil, Items);
          ALayoutGroup.LayoutDirection := ldHorizontal;
          ALayoutGroup.ShowBorder := false;
          ALayoutGroup.ShowCaption := false;
          CreateLabels;
          cxLabelA.Caption := 'Tipo de impressão:';
          cxLabelA.Properties.Alignment.Horz := taRightJustify;
          CreateItemForControl(cxLabelA, ALayoutGroup);
          cxLabelB.Style.Font.Style := [fsBold];
          cxLabelB.Caption := aPrinter.nome;
          CreateItemForControl(cxLabelB, ALayoutGroup);

          ALayoutGroup := CreateGroup(nil, Items);
          ALayoutGroup.LayoutDirection := ldHorizontal;
          ALayoutGroup.ShowBorder := false;
          ALayoutGroup.ShowCaption := false;
          CreateLabels;
          cxLabelA.Caption := 'Impressora:';
          cxLabelA.Properties.Alignment.Horz := taRightJustify;
          CreateItemForControl(cxLabelA, ALayoutGroup);
          cxLabelB.Caption := aPrinter.impressora;
          CreateItemForControl(cxLabelB, ALayoutGroup);

          ALayoutGroup := CreateGroup(nil, Items);
          ALayoutGroup.LayoutDirection := ldHorizontal;
          ALayoutGroup.ShowBorder := false;
          ALayoutGroup.ShowCaption := false;
          CreateLabels;
          cxLabelA.Caption := 'Preco por página:';
          cxLabelA.Properties.Alignment.Horz := taRightJustify;
          CreateItemForControl(cxLabelA, ALayoutGroup);
          cxLabelB.Caption := formataPreco(aPrinter.precopp);
          CreateItemForControl(cxLabelB, ALayoutGroup);

          ALayoutGroup := CreateGroup(nil, Items);
          ALayoutGroup.LayoutDirection := ldHorizontal;
          ALayoutGroup.ShowBorder := false;
          ALayoutGroup.ShowCaption := false;
          CreateLabels;
          cxLabelA.Caption := 'Tipo de papel padrão:';
          cxLabelA.Properties.Alignment.Horz := taRightJustify;
          CreateItemForControl(cxLabelA, ALayoutGroup);
          cxLabelB.Caption := aPrinter.PaperSizeName;
          cxLabelB.Style.Font.Style := [fsBold];
          CreateItemForControl(cxLabelB, ALayoutGroup);

          ALayoutGroup := CreateGroup(nil, Items);
          ALayoutGroup.LayoutDirection := ldHorizontal;
          ALayoutGroup.ShowBorder := false;
          ALayoutGroup.ShowCaption := false;
          CreateLabels;
          cxLabelA.Caption := 'Orientação padrão: ';
          cxLabelA.Properties.Alignment.Horz := taRightJustify;
          CreateItemForControl(cxLabelA, ALayoutGroup);
          if sametext(aPrinter.Orientation,'portrait') then
             cxLabelB.Caption := 'Retrato'
          else
             cxLabelB.Caption := 'Paisagem';
          CreateItemForControl(cxLabelB, ALayoutGroup);

          ALayoutGroup := CreateGroup(nil, Items);
          ALayoutGroup.LayoutDirection := ldHorizontal;
          ALayoutGroup.ShowBorder := false;
          ALayoutGroup.ShowCaption := false;
          CreateLabels;
          cxLabelA.Caption := 'Qualidade de impressão: ';
          cxLabelA.Properties.Alignment.Horz := taRightJustify;
          CreateItemForControl(cxLabelA, ALayoutGroup);
          cxLabelB.Caption := aPrinter.PrintQuality;
          CreateItemForControl(cxLabelB, ALayoutGroup);

          ALayoutGroup := CreateGroup(nil, Items);
          ALayoutGroup.LayoutDirection := ldHorizontal;
          ALayoutGroup.ShowBorder := false;
          ALayoutGroup.ShowCaption := false;
          CreateLabels;
          cxLabelA.Caption := 'Colorida: ';
          cxLabelA.Properties.Alignment.Horz := taRightJustify;
          CreateItemForControl(cxLabelA, ALayoutGroup);
          cxLabelB.Style.Font.color := clRed;
          if sametext(aPrinter.color,'monochrome') then
             cxLabelB.Caption := 'Não'
          else
             cxLabelB.Caption := 'Sim';
          CreateItemForControl(cxLabelB, ALayoutGroup);

          ALayoutGroup := CreateGroup(nil, Items);
          ALayoutGroup.LayoutDirection := ldHorizontal;
          ALayoutGroup.ShowBorder := false;
          ALayoutGroup.ShowCaption := false;
          CreateLabels;
          cxLabelA.Caption := 'Duplex: ';
          cxLabelA.Properties.Alignment.Horz := taRightJustify;
          CreateItemForControl(cxLabelA, ALayoutGroup);
          if sametext(aPrinter.Duplex,'simplex') then
             cxLabelB.Caption := 'Não'
          else
             cxLabelB.Caption := 'Sim';
          CreateItemForControl(cxLabelB, ALayoutGroup);

          ALayoutGroup := CreateGroup(nil, Items);
          ALayoutGroup.LayoutDirection := ldVertical;
          ALayoutGroup.ShowBorder := false;
          ALayoutGroup.ShowCaption := false;
          ALayoutGroup.CreateItem(TdxLayoutSeparatorItem);
          
          ALayoutGroup := CreateGroup(nil, Items);
          ALayoutGroup.LayoutDirection := ldHorizontal;
          ALayoutGroup.ShowBorder := false;
          ALayoutGroup.ShowCaption := false;
          CreateLabels;
          cxLabelA.Caption := 'Quantidade de páginas:';
          cxLabelA.Properties.Alignment.Horz := taRightJustify;
          CreateItemForControl(cxLabelA, ALayoutGroup);
          cxLabelB.Caption := inttostr(aQPaginas);
          cxLabelB.Style.Font.Style := [fsBold];
          CreateItemForControl(cxLabelB, ALayoutGroup);

          ALayoutGroup := CreateGroup(nil, Items);
          ALayoutGroup.LayoutDirection := ldHorizontal;
          ALayoutGroup.ShowBorder := false;
          ALayoutGroup.ShowCaption := false;
          CreateLabels;
          cxLabelA.Caption := 'Preco total trabalho:';
          cxLabelA.Properties.Alignment.Horz := taRightJustify;
          CreateItemForControl(cxLabelA, ALayoutGroup);
          cxLabelB.Caption := formataPreco(aPrinter.precopp*aQPaginas);
          cxLabelB.Style.Font.Style := [fsBold];
          cxLabelB.Style.Font.color := clBlue;
          CreateItemForControl(cxLabelB, ALayoutGroup);

          EndUpdate;
        end;

    end;
 end;

procedure TFormPrintGuard.cxGrid1DBTableView1TipoImpressaoCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  FBounds: TRect;
begin
    if Sametext(AViewInfo.DisplayValue, kIndeterminada) then begin
        FBounds := AViewInfo.Bounds;
        if AViewInfo.Selected then begin
            ACanvas.Brush.Color := clRed;
            ACanvas.Font.Color  := clWhite;
        end else begin
            ACanvas.Brush.Color := clWhite;
            ACanvas.Font.Color  := clRed;
        end;
        ACanvas.Rectangle(FBounds);
        InflateRect(FBounds, -2, 0);
        OffsetRect(FBounds, 1, 0);
        ACanvas.Font.Style := [fsBold];
        ACanvas.DrawTexT (kIndeterminada, FBounds, cxAlignCenter, true);
        ADone := true;
    end;
end;

procedure TFormPrintGuard.cxGrid1DBTableView1TipoImpressaoGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
    with dmPrintGuard do begin
        if nxTableTipoImp.Locate('id',cxGrid1DBTableView1.DataController.Values[ARecordIndex,cxGrid1DBTableView1IDPrinter.Index],[]) then
            AText := nxTableTipoImpNome.AsString
        else begin
            AText := kIndeterminada;
        end;
    end;
end;

procedure TFormPrintGuard.doOnNewPrint(Sender: TObject; aPrintName: string);
begin
    {$IFNDEF NOLOG} GLog.Log(self, [lcTrace], 'doOnNewPrint '+aPrintName); {$ENDIF}
    {$IFNDEF NOLOG} GLog.ForceLogWrite; {$ENDIF}
    if ffilesToPrint.IndexOf(aPrintName)=-1 then begin
        ffilesToPrint.add(aPrintName);
        adicionar( aPrintName );
    end;
end;

function TFormPrintGuard.formataPreco(v: double): string;
begin
    result := 'R$ ' + formatFloat('####0.00',v);
end;

procedure TFormPrintGuard.checarDBePasta;
begin
      with dmPrintGuard do begin
          nxTablePrintList.Last;
          while not nxTablePrintList.bof do begin
             if not fileexists(fPasta1 + '\' + nxTablePrintListFileName.asstring+'.nexprint') then
                 nxTablePrintList.Delete;
             nxTablePrintList.prior;
          end;
          if not nxTablePrintList.eof then
              if not fileexists(fPasta1 + '\' + nxTablePrintListFileName.asstring+'.nexprint') then
                 nxTablePrintList.Delete;
      end;
end;


procedure TFormPrintGuard.adicionar(aPrintName: string);
var
    fn, oriPath, desPath,  fFullDestFileName,s,aFullFileName : string;
    fFullDestDirName : string;
    sl : TStringList;
    //sMD5: string;
    fileinfo : TJSONObject;
    fileinfoMaquina  : string;
    fileinfpaginas   : integer;
    fileinfIDPrinter : integer;
    //fileinfppp       : double;
    //fileinftotal     : double;
    fileinfdatahora  : TDateTime;
begin
      with dmPrintGuard do begin
          if nxTablePrintList.Locate('FileName',aPrintName,[loCaseInsensitive]) then exit;

          aFullFileName := fPasta1 + '\' + aPrintName+'.nexprint';
          oriPath := ExtractFilePath(aFullFileName);
          fn      := copy(aFullFileName, length(oriPath)+1, maxint);
          if pos('.nexprint', fn)>0 then
             fn := copy(fn, 1, length(fn)-9);
          desPath := copy(oriPath, 1, pos('\2\', oriPath)-1) + '\3\';
          forcedirectories(desPath);

          if (fileexists (aFullFileName))  and
             (fileexists (aFullFileName+'.json'))  then begin


             sl := TStringList.create;
             sl.LoadFromFile( aFullFileName+'.json');
             fileinfo := TJSONObject.create(sl.text);
             try
                 fileinfoMaquina  := fileinfo.getString('maquina');
                 fileinfIDPrinter := fileinfo.getInt('IDPrinter');
                 fileinfpaginas   := fileinfo.getInt('paginas');
                 //fileinfppp       := fileinfo.getDouble('ppp');
                 //fileinftotal     := fileinfo.getDouble('total');
                 s                := fileinfo.getString('datahora');  //ddmmyyyyhhnnss
                 fileinfdatahora  := EncodeDateTime(
                                        StrToInt(copy(s,5,4)),
                                        StrToInt(copy(s,3,2)),
                                        StrToInt(copy(s,1,2)),
                                        StrToInt(copy(s,9,2)),
                                        StrToInt(copy(s,11,2)),
                                        StrToInt(copy(s,13,2)),
                                        0);
             finally
                 sl.free;
                 fileinfo.free;
             end;
             {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'fileinfdatahora '+s+'/'+formatdatetime('ddmmyyyyhhnnss',fileinfdatahora));{$ENDIF}
             {$IFNDEF NOLOG} GLog.ForceLogWrite;{$ENDIF}


              nxTablePrintList.InsertRecord( [
                  nil,
                  aPrintName,
                  fileinfoMaquina,
                  fileinfIDPrinter,
                  fileinfpaginas,
                  fileinfdatahora
              ]);

              fFullDestFileName := strUtils.ReplaceStr( desPath+ fn+'.nexprint', '\\', '\');
              fFullDestDirName  := strUtils.ReplaceStr( desPath+ fn+'\', '\\', '\');
              //sMD5 := md5.H(fFullDestFileName);
              {//$IFNDEF NOLOG}// GLog.Log(nil,[lcTrace],fFullDestFileName +'/'+sMD5);{//$ENDIF}

              if copyfile(pchar(aFullFileName), pchar(fFullDestFileName), false) and
                 copyfile(pchar(aFullFileName+'.json'), pchar(fFullDestFileName+'.json'), false) then begin

                  forcedirectories(fFullDestDirName);

              end;

          end;

      end;

end;

procedure TFormPrintGuard.cxButtonImprimirClick(Sender: TObject);
begin
  LoadTipoImpressao;
  SelecionarTipoDeImpressao;
end;

procedure TFormPrintGuard.SelecionarTipoDeImpressao;
var
    mr : TModalResult;
    loop : boolean;
    i : integer;
begin

  FormBackG1.show;
  with FormPassoA do begin
      with cxGrid1DBTableView1.ViewData do
      for i:=0 to RecordCount-1 do
        if Records[i].Selected then begin
           selectedTipoImpressaoID := Records[i].Values[cxGrid1DBTableView1IDPrinter.Index];
           selectedMaquina         := Records[i].Values[cxGrid1DBTableView1maquina.Index];
           break;
        end;

      loop := true;
      while loop do begin

          mr := FormPassoA.ShowModal;
          if mr=mrOk then begin
                Imprimir;
                loop := false;
          end;
          if mr=mrAbort then begin
                if FormPassoQuerSair.ShowModal=mrOk then begin
                    FormBackG1.hide;
                    exit;
                end;
          end;
      end;
  end;
end;

procedure TFormPrintGuard.Imprimir;
var
    mr : TModalResult;
    loop : boolean;
begin

  FormBackG1.show;
  with FormPassoB do begin
      loop := true;
      while loop do begin

          mr := FormPassoB.ShowModal;
          if mr=mrOk then begin
                //Imprimiu;
                loop := false;
                FormBackG1.hide;
                checarDBePasta;
          end;
          if mr=mrAbort then begin
                if FormPassoQuerSair.ShowModal=mrOk then begin
                    FormBackG1.hide;
                    exit;
                end;
          end;
          if mr=mrIgnore then begin
                SelecionarTipoDeImpressao;
                loop := false;
          end;
      end;
  end;
end;

procedure TFormPrintGuard.LoadTipoImpressao;
var
      newp : TncPrinter;
      jPrinter : TJsonObject;
begin
      with dmPrintGuard do begin
          nxTableTipoImp.First;
          fTiposImpressao.Clear;
          while not nxTableTipoImp.eof do begin
             if nxTableTipoImpActive.asBoolean then begin
                 newp := fTiposImpressao.Add(nxTableTipoImpNome.AsString);
                 newp.id := nxTableTipoImpID.AsInteger;
                 newp.precopp := nxTableTipoImpValor.Value;
                 newp.impressora := nxTableTipoImpImpressora.AsString;
                 jPrinter := TJsonObject.create(nxTableTipoImpasJson.AsString);
                 try
                     newp.Orientation       := jPrinter.getString('dmOrientation');
                     newp.PaperSizeName         := jPrinter.getString('dmPaperSizeName');
                     newp.PaperSizeShortName    := jPrinter.getString('dmPaperSizeShortName');
                     newp.DefaultSourceDesc := jPrinter.getString('dmDefaultSourceDesc');
                     newp.PrintQuality      := jPrinter.getString('dmPrintQuality');
                     newp.Color             := jPrinter.getString('dmColor');
                     newp.Duplex            := jPrinter.getString('dmDuplex');

                 finally
                     jPrinter.Free;
                 end;
             end;
             nxTableTipoImp.next;
          end;
      end;
end;

procedure TFormPrintGuard.ConfigSelectedPrinter(aForm:TForm);
var
    aPrinter : TPrinter;
    fs : TFormatSettings ;
    tempS1, tempS2 : string;
begin
     aPrinter := Printer;
     GetLocaleFormatSettings(1033,fs);
     LoadSelectedPrinter;
     tempS1 := '{';
     try
        tempS1 := tempS1 + GetPrinterInfoasJson(selectedPrinterName, aPrinter) +',';
        RestorePrinterInfo8(pchar(selectedPrinterName), selectedPrinterInfo8Stream);
        selectedPrinterInfo8Stream.seek(0,0);
        tempS2 := CapturePrinterInfo8(aForm, pchar(selectedPrinterName), selectedPrinterInfo8Stream, true);
        tempS1 := tempS1 + tempS2 +',';
        tempS1 := tempS1 + '"NexcafeID": ' + inttostr(selectedTipoImpressaoID) +',';
        tempS1 := tempS1 + '"NexcafeNome": "' + selectedTipoImpressao +'",';
        tempS1 := tempS1 + '"NexcafePrecoPP": '+ floatToStr(selectedTipoValor, fs)+'}';

        if tempS2>'' then
           selectedPrinterJson := tempS1;
     except
        on e:eNexPrinterNotFound do begin
            ShowMessage(e.Message)
        end;
     end;
end;

procedure TFormPrintGuard.getSelectedPrinterJson;
var
    aPrinter : TPrinter;
    fs : TFormatSettings ;
begin
     aPrinter := Printer;
     GetLocaleFormatSettings(1033,fs);
     LoadSelectedPrinter;
     selectedPrinterJson := '{';
     try
        selectedPrinterJson := selectedPrinterJson + GetPrinterInfoasJson(selectedPrinterName, aPrinter) +',';
        //RestorePrinterInfo8(pchar(selectedPrinterName), selectedPrinterInfo8Stream);
        selectedPrinterInfo8Stream.seek(0,0);
        selectedPrinterJson := selectedPrinterJson + GetPrinterInfo8asJson( pchar(selectedPrinterName), selectedPrinterInfo8Stream) +',';
        selectedPrinterJson := selectedPrinterJson + '"NexcafeID": ' + inttostr(selectedTipoImpressaoID) +',';
        selectedPrinterJson := selectedPrinterJson + '"NexcafeNome": "' + selectedTipoImpressao +'",';
        selectedPrinterJson := selectedPrinterJson + '"NexcafePrecoPP": '+ floatToStr(selectedTipoValor, fs)+'}';
     except
        on e:eNexPrinterNotFound do begin
            ShowMessage(e.Message)
        end;
     end;
end;

procedure TFormPrintGuard.LoadSelectedPrinter;
begin
     with dmPrintGuard do begin
         if nxTableTipoImp.Locate('ID', selectedTipoImpressaoID, []) then begin
             selectedPrinterName := nxTableTipoImpImpressora.AsString;
             selectedTipoImpressao := nxTableTipoImpNome.AsString;
             selectedTipoValor     := nxTableTipoImpValor.value;
             selectedPrinterInfo8Stream.Clear;
             nxTableTipoImpPrinterDevMode.SaveToStream(selectedPrinterInfo8Stream);
             selectedPrinterInfo8Stream.seek(0,0);
         end;
     end;
end;

function TFormPrintGuard.Print:boolean;
var
     gtPDFDocument1: TgtPDFDocument;
     gtPDFPrinter1: TgtPDFPrinter;

     jPrinter : TJSONObject;
     aFullDirName, aFullFileName, aFullFileNameDest : string;
     pageRange : string;
     i : integer;
begin
      result := false;
      with cxGrid1DBTableView1.ViewData do
      for i:=0 to RecordCount-1 do
        if Records[i].Selected then begin
           aFullDirName  := fPasta2 + '\' + Records[i].Values[cxGrid1DBTableView1FileName.Index];
           aFullFileName := aFullDirName + '.nexprint';
           pageRange := Records[i].Values[cxGrid1DBTableView1paginas.Index];
           break;
        end;

      aFullFileNameDest := strutils.ReplaceStr(aFullFileName, '\2\', '\3\');
      if not fileexists(aFullFileNameDest) then
         copyfile(pchar(aFullFileName), pchar(aFullFileNameDest), false);

      // carregar o devmode da impressora;
      selectedPrinterInfo8Stream.Seek(0,0);
      RestorePrinterInfo8(pchar(selectedPrinterName), selectedPrinterInfo8Stream);

      pageRange := '1-' + pageRange;
      gtPDFDocument1 := TgtPDFDocument.Create(Nil);
      try
          gtPDFDocument1.LoadFromFile(aFullFileNameDest);
          if gtPDFDocument1.IsLoaded then begin

              jPrinter := TJSONObject.create(selectedPrinterJson);

              gtPDFPrinter1 := TgtPDFPrinter.Create(Nil);
              gtPDFPrinter1.PDFDocument := gtPDFDocument1;

              gtPDFPrinter1.SelectPrinterByName('CutePDF Writer');
              //gtPDFPrinter1.SelectPrinterByName(selectedPrinterName);
              gtPDFPrinter1.ShowSetupDialog := False;

              // Specify page range
              // (poPrintToFile, poPageNums, poSelection, poWarning, poHelp, poDisablePrintToFile)
              gtPDFPrinter1.Options := [];
              gtPDFPrinter1.ShowSetupDialog := false;
              //(prAllPages, prSelection, prPageNums)
              //gtPDFPrinter1.PrintRange := prPageNums;
              gtPDFPrinter1.PrintRange := prAllPages;

              if sametext(jPrinter.getString('dmOrientation'),'Portrait') then
                  gtPDFPrinter1.AdvancedPrinterSettings.Orientation :=  potPortrait
              else
                  gtPDFPrinter1.AdvancedPrinterSettings.Orientation :=  potLandScape;

              if sametext(jPrinter.getString('dmColor'),'Monochrome') then
                  gtPDFPrinter1.AdvancedPrinterSettings.Color :=  cmMonochrome
              else
                  gtPDFPrinter1.AdvancedPrinterSettings.Color :=  cmColor;

              if sametext(jPrinter.getString('dmDuplex'),'Simplex') then
                  gtPDFPrinter1.AdvancedPrinterSettings.DuplexPrintingMode  :=  dpmNone
              else
                  gtPDFPrinter1.AdvancedPrinterSettings.DuplexPrintingMode  :=  dpmHorizontal ;

              gtPDFPrinter1.Scaling := psFitPage;

              gtPDFPrinter1.PrintDoc;

              // imprimiu ou nao imprimiu ?
              result := true;
              gtPDFPrinter1.Destroy;

              jPrinter.free;
          end else begin
              ShowMessage('erro abrindo: '+aFullFileNameDest);
          end;
      except
          on Err:Exception do begin
              ShowMessage(Err.Message);
          end;
      end;
      gtPDFDocument1.Reset;
      FreeAndNil(gtPDFDocument1);


      if result = true then begin
          limparDiretorios(true);

          //with dmPrintGuard do begin
          //    if nxTablePrintList.Locate('FileName',aFullDirName,[]) then
          //        nxTablePrintList.Delete;
          //
          //end;
      end;

end;

procedure TFormPrintGuard.revisar;
var
     i : integer;
begin
      with cxGrid1DBTableView1.ViewData do
      for i:=0 to RecordCount-1 do
        if Records[i].Selected then begin
           FormNexCafe5PrintCentral.FullFileName := fPasta1 + '\' + Records[i].Values[cxGrid1DBTableView1FileName.Index] + '.nexprint';
           FormNexCafe5PrintCentral.ShowModal;
           break;
        end;
end;


procedure TFormPrintGuard.LimparDiretorios(const aWait:boolean=false);
var
  deleteFilesThread1 : TDeleteFilesThread;
  aFullFileName : string;
  dirName : string;
  deletefilesList : TStringList;
  i, retry : integer;
begin
  {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'LimparDiretorio: '+fPasta1);{$ENDIF}

  with cxGrid1DBTableView1.ViewData do
  for i:=0 to RecordCount-1 do
    if Records[i].Selected then begin
       aFullFileName := Records[i].Values[cxGrid1DBTableView1FileName.Index]+'.nexprint';
       break;
    end;
  if aFullFileName='' then exit;

  deletefilesList := TStringList.create;
  try
      deletefilesList.add(fPasta1 + '\'+ aFullFileName);
      deletefilesList.add(fPasta1 + '\'+ aFullFileName+'.json');

      dirName := fPasta1 + '\'+copy(aFullFileName, 1, pos('.nexprint',aFullFileName)-1)+'\';
      fDeleting.add(dirName);

      deleteFilesThread1 := TDeleteFilesThread.create(dirName, deletefilesList);
      deleteFilesThread1.OnDelete := deleteFilesThreadOnDelete;
      deleteFilesThread1.OnTerminate := deleteFilesThreadOnTerminate;
      deleteFilesThread1.resume;
      fDeleteFilesThreadList.add(deleteFilesThread1);

      deletefilesList.clear;

      deletefilesList.add(fPasta2 + '\'+ aFullFileName);
      deletefilesList.add(fPasta2 + '\'+ aFullFileName+'.json');

      dirName := fPasta2 + '\'+copy(aFullFileName, 1, pos('.nexprint',aFullFileName)-1)+'\';
      fDeleting.add(dirName);

      deleteFilesThread1 := TDeleteFilesThread.create(dirName, deletefilesList);
      deleteFilesThread1.OnDelete := deleteFilesThreadOnDelete;
      deleteFilesThread1.OnTerminate := deleteFilesThreadOnTerminate;
      deleteFilesThread1.resume;
      fDeleteFilesThreadList.add(deleteFilesThread1);


  finally
      deletefilesList.Free;
  end;

  if aWait then begin
      retry:=0;
      repeat
          sleep(250);
          application.ProcessMessages;
      until (fDeleteFilesThreadList.IndexOf(deleteFilesThread1)=-1) or (retry=10)
  end;


end;


procedure TFormPrintGuard.deleteFilesThreadOnDelete(Sender: TObject;
  Dirname: string);
var
  i : integer;
begin
  i := fDeleting.IndexOf(Dirname);
  if i>-1 then
     fDeleting.Delete(i);
end;

procedure TFormPrintGuard.deleteFilesThreadOnTerminate(Sender: TObject);
var
  i : integer;
begin
  i := fDeleteFilesThreadList.IndexOf(Sender);
  if i>-1 then
     fDeleteFilesThreadList.Delete(i);
end;


end.
