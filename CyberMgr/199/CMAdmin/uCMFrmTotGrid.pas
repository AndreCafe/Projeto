unit uTMFrmTotGrid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxBar, lmdcctrl,
  lmdctrl, dxBarExtItems, ExtCtrls, dxPSCore, dxPSdxTLLnk, dxPSdxDBGrLnk, uFrmDadosTot,
  dcsystem, dcapp, dxPSdxDBCtrlLnk;

type
  TFrmTotGrid = class(TForm)
    BarMgr: TdxBarManager;
    mtCalc: TkbmMemTable;
    mtTot: TkbmMemTable;
    mtCalcCampo1: TStringField;
    mtCalcCampo2: TStringField;
    mtCalcCampo3: TStringField;
    mtCalcChave: TStringField;
    mtCalcTotal: TFloatField;
    mtTotChave1: TFloatField;
    mtTotChave2: TFloatField;
    mtTotChave3: TFloatField;
    mtTotChave4: TFloatField;
    mtTotChave5: TFloatField;
    mtTotChave6: TFloatField;
    mtTotChave7: TFloatField;
    mtTotChave8: TFloatField;
    mtTotChave9: TFloatField;
    mtTotChave10: TFloatField;
    mtTotChave11: TFloatField;
    mtTotChave12: TFloatField;
    mtTotChave13: TFloatField;
    mtTotChave14: TFloatField;
    mtTotChave15: TFloatField;
    mtTotChave16: TFloatField;
    mtTotChave17: TFloatField;
    mtTotChave18: TFloatField;
    mtTotChave19: TFloatField;
    mtTotChave20: TFloatField;
    mtTotChave21: TFloatField;
    mtTotChave22: TFloatField;
    mtTotChave23: TFloatField;
    mtTotChave24: TFloatField;
    mtTotChave25: TFloatField;
    mtTotTotal: TFloatField;
    mtTotMedia: TFloatField;
    dsTot: TDataSource;
    LMDSimplePanel1: TLMDSimplePanel;
    cmFechar: TdxBarButton;
    mtTotCampo1: TStringField;
    mtTotCampo2: TStringField;
    mtTotCampo3: TStringField;
    mtTotOutros: TFloatField;
    Grid: TdxDBGrid;
    GridCampo1: TdxDBGridMaskColumn;
    GridCampo2: TdxDBGridMaskColumn;
    GridCampo3: TdxDBGridMaskColumn;
    GridChave1: TdxDBGridMaskColumn;
    GridChave2: TdxDBGridMaskColumn;
    GridChave3: TdxDBGridMaskColumn;
    GridChave4: TdxDBGridMaskColumn;
    GridChave5: TdxDBGridMaskColumn;
    GridChave6: TdxDBGridMaskColumn;
    GridChave7: TdxDBGridMaskColumn;
    GridChave8: TdxDBGridMaskColumn;
    GridChave9: TdxDBGridMaskColumn;
    GridChave10: TdxDBGridMaskColumn;
    GridChave11: TdxDBGridMaskColumn;
    GridChave12: TdxDBGridMaskColumn;
    GridChave13: TdxDBGridMaskColumn;
    GridChave14: TdxDBGridMaskColumn;
    GridChave15: TdxDBGridMaskColumn;
    GridChave16: TdxDBGridMaskColumn;
    GridChave17: TdxDBGridMaskColumn;
    GridChave18: TdxDBGridMaskColumn;
    GridChave19: TdxDBGridMaskColumn;
    GridChave20: TdxDBGridMaskColumn;
    GridChave21: TdxDBGridMaskColumn;
    GridChave22: TdxDBGridMaskColumn;
    GridChave23: TdxDBGridMaskColumn;
    GridChave24: TdxDBGridMaskColumn;
    GridChave25: TdxDBGridMaskColumn;
    GridMedia: TdxDBGridColumn;
    GridTotal: TdxDBGridColumn;
    cmProgresso: TdxBarProgressItem;
    Timer1: TTimer;
    mtCalcChaveIndice: TStringField;
    mtTotChaveIndice: TStringField;
    GridOutros: TdxDBGridColumn;
    CompPrinter: TdxComponentPrinter;
    cplGrid: TdxDBGridReportLink;
    cmImprimir: TdxBarButton;
    cmOpcoes: TdxBarButton;
    mtCalc2: TkbmMemTable;
    mtCalc2Chave: TStringField;
    mtCalc2Total: TFloatField;
    cmExcel: TdxBarButton;
    SaveDlgXLS: TSaveDialog;
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
  private
    { Private declarations }
    procedure Processa;
    procedure GeraGrid;
    procedure TotalizaChave(Chave: String; TotChave: Double);
  public
    GridFonte: TdxDBGrid;
    PTI      : PTotInfo;
    NumCols  : Integer;
    procedure SomaRegNode(Node: TdxTreeListNode);
    procedure Totalizar(aGrid: TdxDBGrid; var TI: TTotInfo);
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
  V : Variant;
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

    if (tiChave>'') then begin  
      V := Values[GridFonte.ColumnByFieldName(tiChave).Index];
      if not VarIsNull(V) then
        ChaveIndice := ChaveIndice + V;
    end;    
        
    if mtCalc.FindKey([ChaveIndice]) then
      mtCalc.Edit
    else 
      mtCalc.Insert;
  
    mtCalcChaveIndice.Value := ChaveIndice;
        
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
        mtCalcChave.AsString := V
      else
        mtCalcChave.AsString := '';  

      if tiOrdem=ocQuantidade then begin
        if mtCalc2.FindKey([mtCalcChave.AsString]) then
          mtCalc2.Edit
        else
          mtCalc2.Insert;
        mtCalc2Chave.Value := mtCalcChave.AsString;  
        mtCalc2Total.Value := mtCalc2Total.Value + 1;   
        mtCalc2.Post;    
      end;  
    end;    
  
    mtCalcTotal.Value := mtCalcTotal.Value + 1;
    mtCalc.Post;
  end else 
  for I := 0 to pred(Node.Count) do
    SomaRegNode(Node.Items[I]);  
end;


procedure TFrmTotGrid.Processa;
var I : Integer;

procedure ContaNode(Node: TdxTreeListNode);
begin
  if Node.HasChildren then 
    ContaNode(Node.Items[0])
  else
    cmProgresso.Max := cmProgresso.Max + Node.Parent.Count;
end;

begin

  mtCalc2.IndexName := 'mtCalc2Index1';
  mtCalc.IndexName := 'mtCalcIndex1';
  cmProgresso.Caption := 'Somando';
  GridOutros.Visible := PTI^.tiMostraOutros;
  GridMedia.Visible := PTI^.tiMostraMedia;

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
end;
  
procedure TFrmTotGrid.TotalizaChave(Chave: String; TotChave: Double);
var I : Integer;
begin
  if Trim(Chave) = '' then Chave := 'Outros';
  
  with Grid do
  for I := 0 to pred(ColumnCount) do
  with Columns[I] do
  if (Caption = Chave) then begin
    with mtTot.FieldByName(FieldName) do
    AsFloat := AsFloat + TotChave;
    Exit;
  end;

  
  if NumCols >= PTI^.tiMaxCols then 
    mtTotOutros.Value := mtTotOutros.Value + TotChave
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
    ChaveIndice := mtCalcCampo1.Value + mtCalcCampo2.Value + mtCalcCampo3.Value;
    if mtTot.FindKey([ChaveIndice]) then
      mtTot.Edit
    else
      mtTot.Insert;
      
    mtTotChaveIndice.Value := ChaveIndice;
    mtTotCampo1.Value := mtCalcCampo1.Value;
    mtTotCampo2.Value := mtCalcCampo2.Value;
    mtTotCampo3.Value := mtCalcCampo3.Value;
    TotalizaChave(mtCalcChave.AsString, mtCalcTotal.Value);
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
        mtCalc.SetRange([mtCalc2Chave.Value], [mtCalc2Chave.Value]);
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
  
  if PTI^.tiNumCampos > 0 then
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
  mtTotCampo1.Value := '';
  mtTotCampo2.Value := '';
  mtTotCampo3.Value := '';
  mtTotTotal.Value  := 0;
  mtTotOutros.Value := 0;
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
  mtCalcCampo1.Value := '';
  mtCalcCampo2.Value := '';
  mtCalcCampo3.Value := '';
  mtCalcChave.Value := '';
  mtCalcTotal.Value := 0;
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
  mtTotTotal.AsFloat := 0;
  for I := 1 to 25 do 
  mtTotTotal.AsFloat := mtTotTotal.AsFloat + mtTot.FieldByName('Chave'+IntToStr(I)).AsFloat;  
  mtTotTotal.AsFloat := mtTotTotal.AsFloat + mtTotOutros.AsFloat;
  if mtTotOutros.AsFloat > 0.009 then
    I := NumCols + 1
  else
    I := NumCols;
  if (I>0) and (mtTotTotal.AsFloat > 0.009) then  
    mtTotMedia.AsFloat := (mtTotTotal.AsFloat / I)
  else
    mtTotMedia.AsFloat := 0;  
end;

procedure TFrmTotGrid.cmImprimirClick(Sender: TObject);
begin
  cplGrid.ReportTitleText := PTI^.tiTitulo;
  cplGrid.Preview(True);
end;

procedure TFrmTotGrid.mtCalc2AfterInsert(DataSet: TDataSet);
begin
  mtCalc2Total.Value := 0;
end;

procedure TFrmTotGrid.cmOpcoesClick(Sender: TObject);
var Ant: TTotInfo;
begin
  Ant := PTI^;
  with TFrmDadosTot.Create(Self) do
  if Mostra(GridFonte, PTI) then begin
    GridOutros.Visible := PTI^.tiMostraOutros;
    GridMedia.Visible := PTI^.tiMostraMedia;
    if not PTI^.Alterou(Ant) then Exit;
    Self.Grid.Visible := False;
    mtCalc.EmptyTable;
    mtCalc2.EmptyTable;
    mtTot.EmptyTable;
    Processa;
  end;
end;

procedure TFrmTotGrid.cmExcelClick(Sender: TObject);
begin
  with SaveDlgXLS do
  if Execute and (FileName > '') then
    Grid.SaveToXLS(FileName, True);
end;

end.
