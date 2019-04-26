unit uTiposDeImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxContainer, cxEdit, cxListBox, cxDBEdit, Menus, cxButtons,
  cxTextEdit, cxMemo, ncPrinters, udmTipodeImpressao, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, uPrinterConstsAndTypes,
  cxDBLookupComboBox, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxMaskEdit,
  uJson, printers, uPrinterInfo8, uPrintException;

Const
    kTipoDeImpressao = 'tipo de impressão';
    kCriarTipoDeImpressaoTittle = 'Criar novo '+kTipoDeImpressao;
    kModificarTipoDeImpressaoTittle = 'Modificar '+kTipoDeImpressao;
    kCriarTipoDeImpressaoQuestion = 'Realmente quer terminar a criação do novo '+kTipoDeImpressao+'?';
    kCriarTipoDeImpressaoTittle2 = 'Finalizando a criação de novo '+kTipoDeImpressao;
    kModificarTipoDeImpressaoQuestion = 'Realmente quer terminar a modificação de '+kTipoDeImpressao+'?';
    kModificarTipoDeImpressaoTittle2 = 'Finalizando a modificação de '+kTipoDeImpressao;

    kPrintersJsonFile = 'C:\nexcafe\printers.json';
type
  TFormTipoDeImpressao = class(TForm)
    Label2: TLabel;
    cxButtonCriar: TcxButton;
    cxQUITESCROTO: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Nome: TcxGridDBColumn;
    cxGrid1DBTableView1Impressora: TcxGridDBColumn;
    cxGrid1DBTableView1Valor: TcxGridDBColumn;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxButtonAgapar: TcxButton;
    cxButtonModificar: TcxButton;
    cxButtonJson: TcxButton;
    Memo1: TMemo;
    cxLookupComboBox1: TcxLookupComboBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cxButtonCriarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxQUITESCROTOClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxButtonAgaparClick(Sender: TObject);
    procedure cxButtonModificarClick(Sender: TObject);
    procedure cxButtonJsonClick(Sender: TObject);
  private
    { Private declarations }
    jPrinters : TJSONObject;
    fPrinters : TStringList;
    fdefPrinterId : integer;
    procedure SelecionarImpresora;
    procedure PedirNomeDoTipoDeImpressao;
    procedure ConfigPrinter;
    procedure SalvarTipoDeImpressao;
    function  CalcProxCod:integer;
    procedure RefreshPMValorMinMax(aFileName:string);
    procedure PedirPreco;
    function  GetPrinterAsJson(getStreamFromDB:boolean):string;
    function  GetPrintersAsJson:string;
    function  CheckName(Sender: TObject; aNomeTipo:string):boolean;
    function  jPrintersGetDefaultPrinter(aJsonText:string):integer;
  public
    IdTipoImpressao : integer;
    printerName :string;
    info8AsJson :string;
    tipoImpressaoName :string;
    preco :double;
    PrinterInfo8Stream : TMemoryStream;
    function CapturePrinter(Sender: TForm; update:boolean):boolean;
    { Public declarations }
  end;

var
  FormTipoDeImpressao: TFormTipoDeImpressao;

implementation

uses
   ncgPrintInstall, WinSpool, uFormPasso1, uFormBackG1, uFormPasso2,
   strutils, uFormPassoQuerSair, uFormPasso3, uFormPasso4;

{$R *.dfm}

function SimNaoH(S: String; H : HWND): Boolean;
begin
  Result := (MessageBox(H, PChar(S), 'Atenção',
             MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = IDYES)
end;

function TFormTipoDeImpressao.jPrintersGetDefaultPrinter(aJsonText:string):integer;
begin
    result := 0;
    jPrinters.free;
    try
        jPrinters := TJSONObject.create( aJsonText );
        if jPrinters.has('defaultPrinter') then begin
           result := jPrinters.getInt('defaultPrinter');
        end;
    except
    end;
end;

procedure TFormTipoDeImpressao.FormCreate(Sender: TObject);
    function StrinListAsAsql(sl:TStrings):string;
    var
        i : integer;
    begin
        result := '';
        for i:=0 to sl.Count-1 do
           result := result + ', ''' + trim(sl.Text) + '''';
        result := copy(result, 3, maxint);   
    end;
begin
    top    := 0;
    left   := 0;
    height := screen.WorkAreaHeight;
    width  := screen.WorkAreaWidth;
    PrinterInfo8Stream := TMemoryStream.create;
    fPrinters   := TStringList.create;
    fPrinters.assign(GetPrinterList(true));

    cxButtonAgapar.Enabled := false;
    cxButtonModificar.Enabled := false;
    with dmTipodeImpressao do begin
        if nxTablePrinters.RecordCount=0 then begin
           nxTablePrinters.Append;
           nxTablePrintersasJson.AsString := '{}';
           nxTablePrinters.post;
           nxTablePrinters.first;
        end;
        if nxTablePrintersasJson.AsString='' then begin
           nxTablePrinters.edit;
           nxTablePrintersasJson.AsString := '{}';
           nxTablePrinters.post;
        end;
        jPrinters := TJSONObject.create('{}');
        fdefPrinterId := jPrintersGetDefaultPrinter(nxTablePrintersasJson.AsString );
        cxLookupComboBox1.EditValue := fdefPrinterId;
    end;
    
    // desactivar printers q foram desintaladas
    with dmTipodeImpressao do begin
        nxQuery1.SQL.Text := 'update TipoImp set active=false';
        if fPrinters.count>0 then
            nxQuery1.SQL.Text := nxQuery1.SQL.Text + ' where Impressora not in ('+ StrinListAsAsql(fPrinters) + ')';
        nxQuery1.ExecSQL;
        nxTableTipoImp.close;
        nxTableTipoImp.Open;
        RefreshPMValorMinMax(kPrintersJsonFile);
    end;

end;

procedure TFormTipoDeImpressao.FormDestroy(Sender: TObject);
begin
    fPrinters.Free;
    PrinterInfo8Stream.Free;
    jPrinters.free;
end;

procedure TFormTipoDeImpressao.FormShow(Sender: TObject);
begin
    FormBackG1.Left   := self.Left;
    FormBackG1.Top    := self.Top;
    FormBackG1.Height := self.Height;
    FormBackG1.Width  := self.Width;


end;

function TFormTipoDeImpressao.GetPrintersAsJson: string;
var
    defaultPrinter : integer;
    jsonPrinterText : string;
    jPrinters1 : TJSONObject;
    jPrintersA : TJSONArray;
begin
    result := '';
    defaultPrinter := cxLookupComboBox1.EditValue;

    jsonPrinterText :=  '{' + '"defaultPrinter":'+inttostr(defaultPrinter)+',"printers": []}' ;
    jPrinters1 := TJSONObject.create(jsonPrinterText);
    with dmTipodeImpressao do
    try
        dsTableTipoImp.DataSet := nil;
        nxTableTipoImp.First;
        while not nxTableTipoImp.Eof do begin
            if nxTableTipoImpActive.asboolean then begin
                jsonPrinterText := GetPrinterAsJson(true);
                nxTableTipoImp.edit;
                nxTableTipoImpasJson.AsString :=  jsonPrinterText;
                nxTableTipoImp.post;
                jPrintersA := jPrinters1.getJSONArray('printers');
                jPrintersA.put(TJSONObject.create(jsonPrinterText));
            end;
            nxTableTipoImp.Next;
        end;
        dsTableTipoImp.DataSet := nxTableTipoImp;
        result := jPrinters1.toString(4);
    finally
        jPrinters1.Free;
    end;
end;


function TFormTipoDeImpressao.CapturePrinter(Sender: TForm; update:boolean):boolean;
begin
     PrinterInfo8Stream.seek(0,0);
     if update then begin
         RestorePrinterInfo8(pchar(printerName), PrinterInfo8Stream);
         PrinterInfo8Stream.seek(0,0);
     end;
     try
        info8AsJson := CapturePrinterInfo8(Sender, pchar(printerName), PrinterInfo8Stream, true);
     except
        on e:eNexPrinterNotFound do begin
            ShowMessage(e.Message)
        end;
     end;
     result := info8AsJson<>'';
end;


procedure TFormTipoDeImpressao.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
    cxButtonAgapar.Enabled := cxGrid1DBTableView1.Controller.SelectedRecordCount > 0;
    cxButtonModificar.Enabled := cxGrid1DBTableView1.Controller.SelectedRecordCount > 0;
end;

procedure TFormTipoDeImpressao.cxQUITESCROTOClick(Sender: TObject);
begin
    close
end;

procedure TFormTipoDeImpressao.cxButtonModificarClick(Sender: TObject);
begin
    //if fPrinters.Count>0 then
    with dmTipodeImpressao do begin
        if nxTableTipoImpActive.asboolean then begin
            IdTipoImpressao := nxTableTipoImpID.Value;

            printerName       := nxTableTipoImpImpressora.Value;
            tipoImpressaoName := nxTableTipoImpNome.Value;
            preco             := nxTableTipoImpValor.Value;
            info8AsJson       := nxTableTipoImpAsJson.Value;
            PrinterInfo8Stream.Clear;
            nxTableTipoImpPrinterDevMode.SaveToStream(PrinterInfo8Stream);
            PrinterInfo8Stream.seek(0,0);

            SelecionarImpresora;
        end else
            Raise exception.Create(
                  'Tipo de impressão não pode ser modificada'+#13#10+
                  'porque "'+nxTableTipoImpImpressora.Value+'" foi desintalada.');
    end;
end;


procedure TFormTipoDeImpressao.cxButtonCriarClick(Sender: TObject);
begin
    if dmTipodeImpressao.nxTableTipoImp.RecordCount>9 then
       Raise exception.Create('O NexCafé não aceita mais que 10 tipos de impressões diferentes');
    IdTipoImpressao := -1;

    SelecionarImpresora;
end;

procedure TFormTipoDeImpressao.SelecionarImpresora;
var
    loop : boolean;
    mr : TModalResult;
begin
      FormBackG1.Show;
      with FormPasso1 do begin
        loop := true;
        while loop do begin

            mr := FormPasso1.ShowModal;
            if mr=mrOk then begin
                  PedirNomeDoTipoDeImpressao;
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

procedure TFormTipoDeImpressao.PedirNomeDoTipoDeImpressao;
var
    loop : boolean;
    mr : TModalResult;
begin
      FormBackG1.Show;
      with FormPasso2 do begin
        loop := true;
        while loop do begin

            FormPasso2.onCheckName := CheckName;
            mr := FormPasso2.ShowModal;
            if mr=mrOk then begin
                  ConfigPrinter;
                  loop := false;
            end;
            if mr=mrIgnore then begin
                  SelecionarImpresora;
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

procedure TFormTipoDeImpressao.ConfigPrinter;
var
    loop : boolean;
    mr : TModalResult;
begin
      FormBackG1.Show;
      with FormPasso3 do begin
        loop := true;
        while loop do begin

            mr := FormPasso3.ShowModal;
            if mr=mrOk then begin
                  PedirPreco;
                  loop := false;
            end;
            if mr=mrIgnore then begin
                  PedirNomeDoTipoDeImpressao;
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

procedure TFormTipoDeImpressao.PedirPreco;
var
    loop : boolean;
    mr : TModalResult;
begin
      FormBackG1.Show;
      with FormPasso4 do begin
        loop := true;
        while loop do begin

            mr := FormPasso4.ShowModal;
            if mr=mrOk then begin
                  FormBackG1.hide;
                  SalvarTipoDeImpressao;
                  loop := false;
            end;
            if mr=mrIgnore then begin
                  ConfigPrinter;
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

function TFormTipoDeImpressao.CheckName(Sender: TObject;
  aNomeTipo: string): boolean;
begin
    result := false;
    with dmTipodeImpressao do begin
        dsTableTipoImp.DataSet := nil;
        try
            nxTableTipoImp.First;
            while (not nxTableTipoImp.Eof) do begin
              if sametext(nxTableTipoImpNome.Value, aNomeTipo) then begin
                  result := true;
                  break
              end;
              nxTableTipoImp.Next;
            end;
        finally
            dsTableTipoImp.DataSet := nxTableTipoImp;
        end;
    end;
end;

function TFormTipoDeImpressao.CalcProxCod:integer;
var
    Ant: Integer;
begin
    with dmTipodeImpressao do begin
        dsTableTipoImp.DataSet := nil;
        try
            nxTableTipoImp.IndexName := 'IID'; //@dario atencao! se nao a coisa embaixo nao vai.
            nxTableTipoImp.First;
            Ant := 0;
            while (not nxTableTipoImp.Eof) and ((nxTableTipoImpID.Value-Ant)=1) do begin
              Ant := nxTableTipoImpID.Value;
              nxTableTipoImp.Next;
            end;
            result := Ant + 1;
        finally
            dsTableTipoImp.DataSet := nxTableTipoImp;
        end;
    end;
end;

procedure TFormTipoDeImpressao.SalvarTipoDeImpressao;
var
    id : integer;
begin
    with dmTipodeImpressao do begin
        if IdTipoImpressao = -1 then begin
            id := CalcProxCod;
            nxTableTipoImp.Append;
            nxTableTipoImpID.Value := id;
        end else begin
            if nxTableTipoImp.Locate('ID',IdTipoImpressao,[]) then
                nxTableTipoImp.Edit
            else
                raise eNexIdTipoImpressaoNotFound.Create(IdTipoImpressao);
        end;
        nxTableTipoImpNome.Value := tipoImpressaoName;
        nxTableTipoImpImpressora.Value := printerName;
        nxTableTipoImpValor.Value := preco;
        nxTableTipoImpContador.Value := 0;
        PrinterInfo8Stream.seek(0,0);
        nxTableTipoImpPrinterDevMode.LoadFromStream(PrinterInfo8Stream);
        // em ultima posição para GetPrinterAsJson já ter assignados os valores acima
        nxTableTipoImpActive.Value := printer.Printers.IndexOf(printerName)>-1;
        if nxTableTipoImpActive.asBoolean then
            nxTableTipoImpAsJson.Value := GetPrinterAsJson(false); //info8AsJson
        nxTableTipoImp.Post;
        RefreshPMValorMinMax(kPrintersJsonFile);
    end;
end;

procedure TFormTipoDeImpressao.RefreshPMValorMinMax(aFileName:string);
var
    jsonPrintersText : string;
    ss : TStringStream;
    ms : TMemoryStream;
begin
        jsonPrintersText := GetPrintersAsJson;
        memo1.Lines.text := jsonPrintersText ;
        ss := TStringStream.create(jsonPrintersText);
        ms := TMemoryStream.create;
        try
            ms.CopyFrom(ss,0);
            ms.SaveToFile(aFileName);
        finally
            ms.free;
            ss.free;
        end;

        with dmTipodeImpressao do begin
            nxTablePrinters.edit;
            nxTablePrintersasJson.AsString := jsonPrintersText;
            nxTablePrinters.post;
            fdefPrinterId := jPrintersGetDefaultPrinter( jsonPrintersText );
        end;
{
      procedure TfbTiposImp.RefreshPMValorMinMax;
      var aMin, aMax: Currency;
      begin
        DM.ObtemValorMinMaxImp(aMin, aMax);
        if (gConfig.PMValorMin<>aMin) or (gConfig.PMValorMax<>aMax) then begin
          gConfig.AtualizaCache;
          gConfig.PMValorMin := aMin;
          gConfig.PMValorMax := aMax;
          Dados.CM.SalvaAlteracoesObj(gConfig, False);
        end;
      end;
}
end;

procedure TFormTipoDeImpressao.cxButtonAgaparClick(Sender: TObject);
begin
    with dmTipodeImpressao do begin
         if not nxTableTipoImp.IsEmpty then
            if SimNaoH('Deseja realmente apagar o Tipo de Impressão ' + nxTableTipoImpNome.Value + '?', Handle) then begin
              nxTableTipoImp.Delete;
              RefreshPMValorMinMax(kPrintersJsonFile);
            end;
    end;
end;

function TFormTipoDeImpressao.GetPrinterAsJson(getStreamFromDB:boolean): string;
var
    aPrinter : TPrinter;
    jPrinter : TJSONObject;
    dchar : char;
begin
    aPrinter := Printer;
    dchar := decimalseparator;
    decimalseparator := '.';
    with dmTipodeImpressao do
    try
            result := '{';                                                                                

            try
                result := result + GetPrinterInfoasJson(nxTableTipoImpImpressora.asstring, aPrinter) +',';
                if getStreamFromDB then begin
                    PrinterInfo8Stream.Clear;
                    nxTableTipoImpPrinterDevMode.SaveToStream(PrinterInfo8Stream);
                end;
                PrinterInfo8Stream.seek(0,0);
                printerName := nxTableTipoImpImpressora.AsString;
                result := result + GetPrinterInfo8asJson(pchar(printerName), PrinterInfo8Stream) +',';
                result := result + '"NexcafeID": ' + nxTableTipoImpID.AsString +',';
                result := result + '"NexcafeNome": "' + nxTableTipoImpNome.AsString +'",';
                result := result + '"NexcafePrecoPP": '+ nxTableTipoImpValor.AsString+'}';
            except
                on e:exception do
                   showmessage( nxTableTipoImpImpressora.AsString +' error: '+  e.message);
            end;
            jPrinter := TJSONObject.create(result);
            result := jPrinter.toString(4);
            jPrinter.free;
    finally;
        decimalseparator := dchar;
    end;
end;


procedure TFormTipoDeImpressao.cxButtonJsonClick(Sender: TObject);
begin
    RefreshPMValorMinMax(kPrintersJsonFile);
 end;


end.
