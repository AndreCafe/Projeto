unit uTotGrid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxBar, lmdcctrl,
  lmdctrl, dxBarExtItems, ExtCtrls, dxPSCore, dxPSdxTLLnk, dxPSdxDBGrLnk, uFrmDadosTot,
  dxPSdxDBCtrlLnk, dxDBTLCl, dxGrClms, dxPSGlbl, TeEngine,
  Series, TeeProcs, Chart, ComCtrls, ImgList, 
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  {$ifdef Ver150}
  Variants,
  {$endif}
  dxExEdtr, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev;

type
  TFrmTotGrid = class(TForm)
    BarMgr: TdxBarManager;
    mtCalc: TkbmMemTable;
    mtTot: TkbmMemTable;
    dsTot: TDataSource;
    LMDSimplePanel1: TLMDSimplePanel;
    cmFechar: TdxBarButton;
    cmProgresso: TdxBarProgressItem;
    Timer1: TTimer;
    CompPrinter: TdxComponentPrinter;
    cplGrid: TdxDBGridReportLink;
    cmImprimir: TdxBarButton;
    cmOpcoes: TdxBarButton;
    mtCalc2: TkbmMemTable;
    cmExcel: TdxBarButton;
    SaveDlgXLS: TSaveDialog;
    Paginas: TPageControl;
    tsTotais: TTabSheet;
    tsGrafico: TTabSheet;
    Grid: TdxDBGrid;
    Imagens: TImageList;
    cmTipoGraf: TdxBarImageCombo;
    Graf: TChart;
    Series1: TBarSeries;
    procedure cmFecharClick(Sender: TObject);
    procedure mtTotAfterInsert(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure mtCalcAfterInsert(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure mtTotCalcFields(DataSet: TDataSet);
    procedure cmImprimirClick(Sender: TObject);
    procedure mtCalc2AfterInsert(DataSet: TDataSet);
    procedure cmOpcoesClick(Sender: TObject);
    procedure cmExcelClick(Sender: TObject);
    procedure mtCalcCalcFields(DataSet: TDataSet);
    procedure GridCustomDrawFooter(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      var AText: String; var AColor: TColor; AFont: TFont;
      var AAlignment: TAlignment; var ADone: Boolean);
    procedure cplGridCustomDrawFooterCell(Sender: TBasedxReportLink;
      ACanvas: TCanvas; ABoundsRect, AClientRect: TRect;
      ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      var AText: String; var AColor: TColor; AFont: TFont;
      var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY;
      var ADone: Boolean);
    procedure cmTipoGrafChange(Sender: TObject);
    procedure GridChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
  private
    { Private declarations }
    procedure Processa;
    procedure GeraGrid;
    procedure TotalizaChave(Chave: String; TotChave: Variant);
    procedure CriaMTTot;
    procedure CriaMTCalc;
    procedure CriaMTCalc2;
    procedure MontaGrafico;
  public
    GridFonte  : TdxDBGrid;
    PTI        : PTotInfo;
    NumCols    : Integer;
    Processando: Boolean;
    procedure SomaRegNode(Node: TdxTreeListNode);
    procedure Totalizar(aGrid: TdxDBGrid; var TI: TTotInfo);
    function CriaCampo(D: TDataset; N: String; FT: TFieldType; FK: TFieldKind; Size: Integer): TField;
    { Public declarations }
  end;

var
  FrmTotGrid: TFrmTotGrid;

implementation

{$R *.DFM}

procedure TFrmTotGrid.SomaRegNode(Node: TdxTreeListNode);
var 
  I : Integer;
  ChaveIndice, St : String;
  V, VT : Variant;
begin
  if Node=nil then Exit;
  with Node, PTI^ do
  if not HasChildren then begin
    Application.ProcessMessages;
    cmProgresso.Position := cmProgresso.Position + 1;
    ChaveIndice := '';
    for I := 1 to tiNumCampos do begin
      V := Values[GridFonte.ColumnByFieldName(tiCampo[I]).Index];
      if not VarIsNull(V) then begin
        St := V;
        ChaveIndice := ChaveIndice + St;
      end;  
    end;  

    if PTI^.tiTipoTot <> ttContar then begin
      VT := Values[GridFonte.ColumnByFieldName(tiCampoTot).Index];  
      if VarIsNull(VT) then VT := 0;
    end;  

    if (tiChave>'') then begin  
      V := Values[GridFonte.ColumnByFieldName(tiChave).Index];
      if not VarIsNull(V) then
        ChaveIndice := ChaveIndice + V;
    end;    
        
    if mtCalc.FindKey([ChaveIndice]) then
      mtCalc.Edit
    else 
      mtCalc.Insert;
  
    mtCalc.FieldByName('ChaveIndice').Value := ChaveIndice;
        
    for I := 1 to tiNumCampos do begin
      V := Values[GridFonte.ColumnByFieldName(tiCampo[I]).Index];
        
      with mtCalc.FieldByName('Campo'+IntToStr(I)) do
      if VarIsNull(V) then
        AsString := ''
      else
        AsString := V;  
    end;    

    if tiChave<>'' then begin
      V := Values[GridFonte.ColumnByFieldName(tiChave).Index];
      if not VarIsNull(V) then
        mtCalc.FieldByName('Chave').AsString := V
      else
        mtCalc.FieldByName('Chave').AsString := '';  

      if tiOrdem=ocQuantidade then begin
        if mtCalc2.FindKey([mtCalc.FieldByName('Chave').AsString]) then
          mtCalc2.Edit
        else
          mtCalc2.Insert;
        mtCalc2.FieldByName('Chave').Value := mtCalc.FieldByName('Chave').AsString;  
        mtCalc2.FieldByName('Quant').Value := mtCalc2.FieldByName('Quant').Value + 1;   
        case PTI^.tiTipoTot of 
          ttMedia,
          ttSomar : 
            mtCalc2.FieldByName('Total').Value := 
              mtCalc2.FieldByName('Total').Value + VT;
          ttMin : 
            if VT < mtCalc2.FieldByName('Total').Value then 
              mtCalc2.FieldByName('Total').Value := VT;
          ttMax : 
            if VT > mtCalc2.FieldByName('Total').Value then 
              mtCalc2.FieldByName('Total').Value := VT;
        end;  
        mtCalc2.Post;    
      end;  
    end;    
  
    mtCalc.FieldByName('Quant').Value := mtCalc.FieldByName('Quant').Value + 1;
    case PTI^.tiTipoTot of
      ttMedia,
      ttSomar  : 
        mtCalc.FieldByName('Total').Value := 
          mtCalc.FieldByName('Total').Value + VT;
      ttMin    : 
        if VT < mtCalc.FieldByName('Total').Value then 
          mtCalc.FieldByName('Total').Value := VT;
      ttMax    : 
        if VT > mtCalc.FieldByName('Total').Value then 
          mtCalc.FieldByName('Total').Value := VT;
    end;
    mtCalc.Post;
  end else 
  for I := 0 to pred(Node.Count) do
    SomaRegNode(Node.Items[I]);  
end;

function TFrmTotGrid.CriaCampo(D: TDataset; N: String; FT: TFieldType; FK: TFieldKind; Size: Integer): TField;
begin
  if FT=ftUnknown then FT := ftFloat;
  
  case FT of
    ftSmallint : Result := TSmallintField.Create(D);
    ftInteger  : Result := TIntegerField.Create(D);
    ftWord     : Result := TWordField.Create(D);
    ftAutoInc  : Result := TIntegerField.Create(D);
    ftFloat    : Result := TFloatField.Create(D);
    ftCurrency : Result := TCurrencyField.Create(D);
    ftBCD      : Result := TBCDField.Create(D);
    ftDate     : Result := TDateField.Create(D);
    ftTime     : Result := TTimeField.Create(D);
    ftDateTime : begin
      Result := TDateTimeField.Create(D);
      TDateTimeField(Result).DisplayFormat := PTI^.tiDisplayFormat;
    end;  
    ftWideString,
    ftString   : Result := TStringField.Create(D);
    ftBoolean  : Result := TBooleanField.Create(D);
  else
    Result := nil;  
  end;
  if Result = nil then Exit;
  Result.FieldName := N;
  Result.FieldKind := FK;
  Result.DataSet   := D;
  Result.Name := D.Name + N;
  Result.Size := Size;
  Result.Visible  := False;
end;

procedure TFrmTotGrid.CriaMTTot;
var
  I : Integer;
  ID : TIndexDef;
begin
  dsTot.Dataset := nil;
  if mtTot <> nil then FreeAndNil(mtTot);
  mtTot := TkbmMemTable.Create(Self);
  with mtTot, PTI^ do begin
    Name := 'mtTot';
    for I := 1 to 25 do begin
      if I < 4 then 
        CriaCampo(mtTot, 'Campo'+IntToStr(I), ftString, fkData, 40);
      CriaCampo(mtTot, 'Chave'+IntTostr(I), tiTipoCampoTot, fkData, 0);
    end;
    CriaCampo(mtTot, 'ChaveIndice', ftString, fkData, 40);
    CriaCampo(mtTot, 'Outros', tiTipoCampoTot, fkData, 0).Visible := True;
    CriaCampo(mtTot, 'Media', tiTipoCampoTot, fkCalculated, 0).Visible := True;
    CriaCampo(mtTot, 'Total', tiTipoCampoTot, fkCalculated, 0).Visible := True;

    ID := IndexDefs.AddIndexDef;
    ID.Name := 'mtTotIndex1';
    ID.Fields := 'ChaveIndice';
    ID.Options := [ixPrimary];
    
    IndexName := 'mtTotIndex1';

    dsTot.DataSet := mtTot;
    Grid.DestroyColumns;
  end;
end;

procedure TFrmTotGrid.CriaMTCalc;
var
  ID: TIndexDef;
  I : Integer;
begin
  if mtCalc <> nil then FreeAndNil(mtCalc);
  mtCalc := TkbmMemTable.Create(Self);
  with mtCalc, PTI^ do begin
    Name := 'mtCalc';
    for I := 1 to 3 do 
      CriaCampo(mtCalc, 'Campo'+IntToStr(I), ftString, fkData, 40);

    CriaCampo(mtCalc, 'Chave', ftString, fkData, 40);
    CriaCampo(mtCalc, 'ChaveIndice', ftString, fkData, 200);
    CriaCampo(mtCalc, 'Quant', ftInteger, fkData, 0);
    CriaCampo(mtCalc, 'Total', tiTipoCampoTot, fkData, 0);
    CriaCampo(mtCalc, 'TotF', tiTipoCampoTot, fkCalculated, 0);

    ID := IndexDefs.AddIndexDef;
    ID.Name := 'mtCalcIndex1';
    ID.Fields := 'ChaveIndice';
    ID.Options := [ixPrimary, ixCaseInsensitive];  

    ID := IndexDefs.AddIndexDef;
    ID.Name := 'mtCalcIndex2';
    ID.Fields := 'Chave';
    ID.Options := [ixCaseInsensitive];

    ID := IndexDefs.AddIndexDef;
    ID.Name := 'mtCalcIndex3';
    ID.Fields := 'Total';
    ID.Options := [ixDescending];

    IndexName := 'mtCalcIndex1';
  end;
end;

procedure TFrmTotGrid.CriaMTCalc2;
var
  ID: TIndexDef;
begin
  if mtCalc2 <> nil then FreeAndNil(mtCalc2);
  mtCalc2 := TkbmMemTable.Create(Self);
  with mtCalc2, PTI^ do begin
    Name := 'mtCalc2';

    CriaCampo(mtCalc2, 'Chave', ftString, fkData, 40);
    CriaCampo(mtCalc2, 'Quant', ftInteger, fkData, 0);
    CriaCampo(mtCalc2, 'Total', tiTipoCampoTot, fkData, 0);
    
    ID := IndexDefs.AddIndexDef;
    ID.Name := 'mtCalc2Index1';
    ID.Fields := 'Chave';
    ID.Options := [ixCaseInsensitive];

    ID := IndexDefs.AddIndexDef;
    ID.Name := 'mtCalc2Index2';
    ID.Fields := 'Total';
    ID.Options := [ixDescending];

    IndexName := 'mtCalc2Index1';
  end;
end;

procedure TFrmTotGrid.Processa;
var 
  I : Integer;
  C : TdxDBGridColumn;

procedure ContaNode(Node: TdxTreeListNode);
begin
  if Node.HasChildren then 
    ContaNode(Node.Items[0])
  else
    cmProgresso.Max := cmProgresso.Max + Node.Parent.Count;
end;

begin
  Processando := True;
  if PTI^.tiTipoCampoTot in [ftSmallint, ftInteger, ftWord, ftAutoInc] then
    PTI^.tiTipoCampoTot := ftFloat;
  mtCalc.Active := False;
  mtCalc2.Active := False;
  mtTot.Active := False;
  CriaMTCalc;
  CriaMTCalc2;
  CriaMTTot;
  mtCalc.OnCalcFields := mtCalcCalcFields;
  mtTot.OnCalcFields := mtTotCalcFields;

  mtCalc.AfterInsert := mtCalcAfterInsert;
  mtTot.AfterInsert := mtTotAfterInsert;
  mtCalc2.AfterInsert := mtCalc2AfterInsert;
  
  mtCalc.Active := True;
  mtCalc2.Active := True;
  mtTot.Active := True;
  Grid.CreateDefaultColumns(mtTot, Self);

  with Grid do
  for I := 0 to pred(ColumnCount) do begin
    C := TdxDbGridColumn(Columns[I]);
    if C.Field.DataType = ftString then 
      C.SummaryFooterType := cstNone
    else begin  
      C.SummaryFooterField := C.Field.FieldName;
      C.SummaryFooterFormat := '0';
      case PTI^.tiTipoTot of
        ttContar,
        ttSomar  : C.SummaryFooterType := cstSum;
        ttMedia  : C.SummaryFooterType := cstAvg;
        ttMin    : C.SummaryFooterType := cstMin;
        ttMax    : C.SummaryFooterType := cstMax;
      end;
    end;  
  end;
  
  mtCalc2.IndexName := 'mtCalc2Index1';
  mtCalc.IndexName := 'mtCalcIndex1';
  cmProgresso.Caption := 'Somando';

  Grid.ColumnByFieldName('Outros').Visible := PTI^.tiMostraOutros;
  Grid.ColumnByFieldName('Media').Visible := PTI^.tiMostraMedia;

  for I := 1 to 3 do 
  with Grid.ColumnByFieldName('Campo'+IntToStr(I)) do 
  if I > PTI^.tiNumCampos then    
    Visible := False
  else begin
    Visible := True;
    Caption := ColFieldNameToCaption(GridFonte, PTI^.tiCampo[I]);
  end;

  BarMgr.BarByCaption('Progresso').Visible := True;
  cmProgresso.Position := 0;
  GridFonte.Refresh;
  try
    cmProgresso.Max := 0;

    with GridFonte do
    if (Count > 0) then begin
      if Items[0].Count = 0 then 
        cmProgresso.Max := Count
      else     
      for I := 0 to pred(Count) do
        ContaNode(Items[I]);
    end;  

    for I := 0 to pred(GridFonte.Count) do
      SomaRegNode(GridFonte.Items[I]);
      
  finally
    BarMgr.BarByCaption('Progresso').Visible := False;
  end;  
  GeraGrid;
  Grid.ApplyBestFit(nil);
  with Grid do
  for I := 0 to pred(ColumnCount) do
    Columns[I].Width := Columns[I].Width + 4;
  Processando := False;  
  MontaGrafico;  
end;
  
procedure TFrmTotGrid.TotalizaChave(Chave: String; TotChave: Variant);
var I : Integer;
begin
  if TotChave = null then TotChave := 0;
  if Trim(Chave) = '' then Chave := 'Outros';
  
  with Grid do
  for I := 0 to pred(ColumnCount) do
  with Columns[I] do
  if (Caption = Chave) then begin
    with mtTot.FieldByName(FieldName) do
    Value   := Value + TotChave;
    Exit;
  end;
  
  if NumCols >= PTI^.tiMaxCols then 
    mtTot.FieldByName('Outros').Value := mtTot.FieldByName('Outros').Value + TotChave
  else begin
    Inc(NumCols);
    with Grid do
    for I := 0 to pred(ColumnCount) do
    with Columns[I] do
    if (not Visible) and (Copy(FieldName, 1, 5)='Chave') then begin
      Visible := True;
      Caption := Chave;
      mtTot.FieldByName(FieldName).AsFloat := TotChave;
      Exit;
    end;  
  end;
  
end;

procedure TFrmTotGrid.GeraGrid;
var 
  I : Integer;
  ChaveIndice : String;

procedure SomaMtCalc;
begin
  mtCalc.First;
  cmProgresso.Max := mtCalc.RecordCount;
  with mtCalc do
  while not Eof do begin
    Application.ProcessMessages;
    cmProgresso.Position := cmProgresso.Position + 1;
    ChaveIndice := 
      mtCalc.FieldByName('Campo1').AsString + 
      mtCalc.FieldByName('Campo2').AsString + 
      mtCalc.FieldByName('Campo3').AsString;
    if mtTot.FindKey([ChaveIndice]) then
      mtTot.Edit
    else
      mtTot.Insert;
      
    mtTot.FieldByName('ChaveIndice').AsString := ChaveIndice;
    mtTot.FieldByName('Campo1').AsString      := mtCalc.FieldByName('Campo1').AsString;
    mtTot.FieldByName('Campo2').AsString      := mtCalc.FieldByName('Campo2').AsString;
    mtTot.FieldByName('Campo3').AsString      := mtCalc.FieldByName('Campo3').AsString;
    TotalizaChave(mtCalc.FieldByName('Chave').AsString, mtCalc.FieldByName('TotF').Value);
    mtTot.Post;
    Next;
  end; 
end;
  
begin
  mtTot.DisableControls;
  cmProgresso.Position := 0;
  cmProgresso.Caption := 'Montando Grid';
  BarMgr.BarByCaption('Progresso').Visible := True;
  try
    for I := 1 to 3 do
      Grid.ColumnByFieldName('Campo'+IntToStr(I)).Visible := (PTI^.tiNumCampos>=I);
      
    NumCols := 0;
    
    case PTI^.tiOrdem of
      ocAlfabetica : mtCalc.IndexName := 'mtCalcIndex2';
      ocQuantidade : mtCalc.IndexName := 'mtCalcIndex2';
      ocCustomizar :
        for I := 1 to PTI^.tiMaxCols do
        if Trim(PTI^.tiColunas[I]) > '' then
        with Grid.ColumnByFieldName('Chave'+IntToStr(I)) do begin
          Caption := Trim(PTI^.tiColunas[I]);
          Visible := True;
          Inc(NumCols);
        end;  
    end;

    if PTI^.tiOrdem = ocQuantidade then begin
      mtCalc2.IndexName := 'mtCalc2Index2';
      mtCalc2.First;
      while not mtCalc2.Eof do begin
        mtCalc.CancelRange;
        mtCalc.SetRange([mtCalc2.FieldByName('Chave').Value], 
                        [mtCalc2.FieldByName('Chave').Value]);
        SomaMtCalc;
        mtCalc2.Next
      end;
    end else 
      SomaMtCalc;
        
    Grid.Visible := True;
    Grid.ApplyBestFit(nil);
  finally
    mtTot.EnableControls;
    Grid.OptionsDB := Grid.OptionsDB + [edgoLoadAllRecords];
    BarMgr.BarByCaption('Progresso').Visible := False;
  end;    
  Grid.Visible := True;
end;

procedure TFrmTotGrid.Totalizar(aGrid: TdxDBGrid; var TI: TTotInfo);
begin
  PTI := @TI;
  GridFonte := aGrid;
  
  if PTI^.tiChave > '' then 
    ShowModal
  else
    Free;  
end;

procedure TFrmTotGrid.cmFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTotGrid.mtTotAfterInsert(DataSet: TDataSet);
var I : Integer;
begin
  mtTot.FieldByName('Campo1').Value := '';
  mtTot.FieldByName('Campo2').Value := '';
  mtTot.FieldByName('Campo3').Value := '';
  mtTot.FieldByName('Total').Value  := 0;
  mtTot.FieldByName('Outros').Value := 0;
  for I := 1 to 25 do 
    mtTot.FieldByName('Chave' + IntToStr(I)).AsFloat := 0;
end;

procedure TFrmTotGrid.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Processa;
end;

procedure TFrmTotGrid.mtCalcAfterInsert(DataSet: TDataSet);
begin
  mtCalc.FieldByName('Campo1').Value := '';
  mtCalc.FieldByName('Campo2').Value := '';
  mtCalc.FieldByName('Campo3').Value := '';
  mtCalc.FieldByName('Chave').Value := '';
  mtCalc.FieldByName('Quant').Value := 0;
  if PTI^.tiCampoTot > '' then 
    mtCalc.FieldByName('Total').Value := 0;
end;

procedure TFrmTotGrid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTotGrid.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TFrmTotGrid.mtTotCalcFields(DataSet: TDataSet);
var I : Integer;
begin
  with mtTot, FieldByName('Total') do begin
    Value := 0;
    for I := 1 to 25 do 
      Value := AsFloat + FieldByName('Chave'+IntToStr(I)).Value;
    Value := Value + FieldByName('Outros').Value;
    if FieldByName('Outros').Value > 0 then
      I := NumCols + 1
    else
      I := NumCols;
    if (I>0) and (Value > 0) then  
      FieldByName('Media').Value := (Value / I)
    else
      FieldByName('Media').Value := 0;  
  end;     
end;

procedure TFrmTotGrid.cmImprimirClick(Sender: TObject);
begin
  if Paginas.ActivePageIndex = 0 then begin
    cplGrid.ReportTitleText := PTI^.tiTitulo;
    cplGrid.Preview(True);
  end else 
    Graf.Print;
end;

procedure TFrmTotGrid.mtCalc2AfterInsert(DataSet: TDataSet);
begin
  mtCalc2.FieldByName('Total').Value := 0;
  mtCalc2.FieldByName('Quant').Value := 0;
end;

procedure TFrmTotGrid.cmOpcoesClick(Sender: TObject);
var 
  Ant: TTotInfo;
begin
  Ant := PTI^;
  with TFrmDadosTot.Create(Self) do
  if Mostra(GridFonte, PTI) then begin
    Self.Grid.ColumnByFieldName('Outros').Visible := PTI^.tiMostraOutros;
    Self.Grid.ColumnByFieldName('Media').Visible := PTI^.tiMostraMedia;
    if not PTI^.Alterou(Ant) then begin
      MontaGrafico;
      Exit;
    end;  
    Self.Grid.Visible := False;
    Processa;
  end;
end;

procedure TFrmTotGrid.cmExcelClick(Sender: TObject);
begin
  with SaveDlgXLS do
  if Execute and (FileName > '') then
    Grid.SaveToXLS(FileName, True);
end;

procedure TFrmTotGrid.mtCalcCalcFields(DataSet: TDataSet);
begin
  with mtCalc, PTI^ do
  if (tiTipoTot <> ttContar) and (tiCampoTot='') then
    FieldByName('TotF').Value := 0
  else 
  case tiTipoTot of
    ttContar : FieldByName('TotF').Value := mtCalc.FieldByName('Quant').Value;
    
    ttMedia  : 
    if mtCalc.FieldByName('Quant').Value > 0 then
      FieldByName('TotF').Value := FieldByName('Total').Value / mtCalc.FieldByName('Quant').Value
    else
      FieldByName('TotF').Value := 0;
      
    ttMin,
    ttMax,
    ttSomar : FieldByName('TotF').Value := FieldByName('Total').Value;    
  end;
end;

procedure TFrmTotGrid.GridCustomDrawFooter(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; var AText: String; var AColor: TColor;
  AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
var 
  C : TdxDBTreeListColumn;  
begin
  C := TdxDBTreeListColumn(AColumn);
  if (C.Field is TDateTimeField) then
    AText := FormatDateTime(TDateTimeField(C.Field).DisplayFormat, C.SummaryFooterValue);
end;

procedure TFrmTotGrid.cplGridCustomDrawFooterCell(
  Sender: TBasedxReportLink; ACanvas: TCanvas; ABoundsRect,
  AClientRect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
  var AText: String; var AColor: TColor; AFont: TFont;
  var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY;
  var ADone: Boolean);
var A : TAlignment;  
begin
  GridCustomDrawFooter(Sender, ACanvas, AClientRect, ANode, AColumn, AText,
                       AColor, AFont, A, ADone); 
end;

procedure TFrmTotGrid.cmTipoGrafChange(Sender: TObject);
begin
  MontaGrafico;
end;

procedure TFrmTotGrid.MontaGrafico;
var 
  V : Variant;
  I : Integer;
begin
  Grid.ColumnByFieldName('Media').Visible := PTI^.tiMostraMedia and
                                             (cmTipoGraf.ItemIndex>0);
  Graf.Title.Text.Clear;
  Graf.Title.Text.Add(PTI^.tiTitulo);
  while Graf.SeriesList.Count > 0 do
    Graf.SeriesList[0].Free;
  case cmTipoGraf.ItemIndex of
    0 : Graf.AddSeries(TPieSeries.Create(Self));
    1 : Graf.AddSeries(TBarSeries.Create(Self));
    2 : Graf.AddSeries(THorizBarSeries.Create(Self));
    3 : Graf.AddSeries(TLineSeries.Create(Self));
    4 : Graf.AddSeries(TAreaSeries.Create(Self));
  else
    Exit;  
  end;
  with Grid do
  if (FocusedNode=nil) or FocusedNode.HasChildren then Exit;
  mtCalc.CancelRange;
  mtCalc.First;
  Graf.SeriesList[0].ColorEachPoint := True;
  with Grid, FocusedNode, Graf.SeriesList[0] do
  for I := 0 to pred(grid.ColumnCount) do with Columns[I] do 
  if Visible and (
    ((UpperCase(FieldName)>'CHAVE') and
     (UpperCase(FieldName)<'CHAVE99')) or
     (UpperCase(FieldName)='OUTROS') or
     (UpperCase(FieldName)='MEDIA')) then 
  begin   
    V := Values[Index];
    if V=null then V := 0;
    if V > 0 then Add(V, Caption, clTeeColor);
  end;
  Paginas.ActivePage := tsGrafico;
end;


procedure TFrmTotGrid.GridChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
begin
  if not Processando then MontaGrafico;
end;

end.
