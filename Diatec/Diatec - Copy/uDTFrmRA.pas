unit uDTFrmRA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, 
  LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomSimpleLabel, LMDSimpleLabel, StdCtrls, Buttons,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  DB, kbmMemTable, 
  LMDCustomLabel,
  LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton, LMDCustomScrollBox, LMDScrollBox,
  lmdsplt, LMDLabel, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxCheckBox, cxCalendar, cxMaskEdit,
  cxTimeEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGridLevel, cxGrid,
  cxImageComboBox, cxCurrencyEdit, cxGridBandedTableView,
  cxGridDBBandedTableView, cxPC, cxMemo, cxContainer, cxLabel;

type
  TFrmRA = class(TForm)
    panBotoes: TLMDSimplePanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimpleLabel1: TLMDSimpleLabel;
    LMDSimpleLabel2: TLMDSimpleLabel;
    LMDSimpleLabel3: TLMDSimpleLabel;
    LMDSimpleLabel4: TLMDSimpleLabel;
    Paginas: TcxPageControl;
    tsOS: TcxTabSheet;
    tsItens: TcxTabSheet;
    mtOS: TkbmMemTable;
    mtOSData: TDateField;
    mtOSID: TIntegerField;
    mtOSHoras: TTimeField;
    mtOSIncluir: TBooleanField;
    dsOS: TDataSource;
    mtItem: TkbmMemTable;
    dsItem: TDataSource;
    mtItemTipo: TWordField;
    mtItemValor: TCurrencyField;
    mtItemDescr: TMemoField;
    LMDSplitterPanel1: TLMDSplitterPanel;
    LMDSplitterPane1: TLMDSplitterPane;
    lbDataI: TLMDLabel;
    lbDataF: TLMDLabel;
    lbTec: TLMDLabel;
    lbCli: TLMDLabel;
    lbID: TLMDLabel;
    LMDSimpleLabel5: TLMDSimpleLabel;
    mtItemData: TDateField;
    mtItemIncluir: TBooleanField;
    gridOS: TcxGrid;
    glOS: TcxGridLevel;
    tvOS: TcxGridDBTableView;
    tvOSIncluir1: TcxGridDBColumn;
    tvOSData1: TcxGridDBColumn;
    tvOSID1: TcxGridDBColumn;
    tvOSHoras1: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    gridItens: TcxGrid;
    glItens: TcxGridLevel;
    tvItens: TcxGridDBBandedTableView;
    tvItensTipo1: TcxGridDBBandedColumn;
    tvItensValor1: TcxGridDBBandedColumn;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    tvItensIncluir: TcxGridDBBandedColumn;
    tvItensDescr: TcxGridDBBandedColumn;
    tvItensID: TcxGridDBBandedColumn;
    mtItemID: TIntegerField;
    tvItensData: TcxGridDBBandedColumn;
    cxLabel1: TcxLabel;
    procedure tvItensDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure GridOSDblClick(Sender: TObject);
    procedure tvItensValor1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
  private
    FNumOS: Integer;
    FNumDesp: Integer;
    FNovo: Boolean;
    FDataI, 
    FDataF,
    FDataFA,
    FDataIA : TDateTime;
    procedure DelOSs;
    procedure LeOS;
    procedure SalvaOS;
    procedure LeItens;
    procedure SalvaItens;
    { Private declarations }
    procedure SetDataF(const Value: TDateTime);
    procedure SetDataI(const Value: TDateTime);
    procedure Valida;
    procedure CalcInicioFim;
  public
    FCli, FTec: String;
    FIDRA: Cardinal;
    procedure Editar;
    procedure Novo;
    property DataI: TDateTime
      read FDataI write SetDataI;
    property DataF: TDateTime
      read FDataF write SetDataF;  
    { Public declarations }
  end;

var
  FrmRA: TFrmRA;

implementation

uses uDTDM, uDTFrmItemRA, uDTSyncDef;

{$R *.dfm}

procedure TFrmRA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRA.FormCreate(Sender: TObject);
begin
  mtItem.Open;
  mtOS.Open;
  FDataI := -1;
  FDataF := -1; 
  FNumOS := 0;
  FNumDesp := 0;
end;

procedure TFrmRA.LeItens;
begin
  with DM do begin
    if not FNovo then begin
      tRAItem.First;
      while not tRAItem.Eof  do begin
        mtItem.Insert;
        Inc(FNumDesp);
        mtItemIncluir.Value  := True;
        mtItemID.Value       := tRAItemID.Value;
        mtItemTipo.Value     := tRAItemTipo.Value;
        mtItemValor.Value    := tRAItemValor.Value;
        mtItemDescr.Value    := tRAItemDescr.Value;
        mtItemData.Value     := tRAItemData.Value;
        mtItem.Post;
        tRAItem.Next;
      end;
    end;

    tDesp.IndexName := 'IRA';
    tDesp.SetRange([FTec, FCli, null], [FTec, FCli, null]);
    try
      while not tDesp.Eof do begin
        mtItem.Insert;
        mtItemIncluir.Value  := False;
        mtItemID.Value       := tDespID.Value;
        mtItemTipo.Value     := tDespTipo.Value;
        mtItemValor.Value    := tDespValor.Value;
        mtItemDescr.Value    := tDespDescr.Value;
        mtItemData.Value     := tDespData.Value;
        mtItem.Post;
        tDesp.Next;
      end;
    finally
      tDesp.CancelRange;
    end;
    mtItem.First;
  end;
end;

procedure TFrmRA.LeOS;
begin
  with DM do begin
    if not FNovo then begin
      tRAOS.First;
      tOS.IndexName := 'IID';
      while not tRAOS.Eof do begin
        Inc(FNumOS);
        mtOS.Insert;
        mtOSIncluir.Value := True;
        mtOSData.Value := tRAOSDataOS.Value;
        mtOSID.Value := tRAOSIDOS.Value;
        if tOS.FindKey([tRAOSCLiente.Value, tRAOSTecnico.Value, tRAOSDataOS.Value, tRAOSIDOS.Value]) then
          mtOSHoras.Value := tOSTotalHoras.Value;
        mtOS.Post;
        tRAOS.Next;
      end;
    end;

    tAuxRAOS.Active := True;

    tOS.IndexName := 'IID';
    tOS.SetRange([FCli, FTec], [FCli, FTec]);
    try
      tOS.First;
      tAuxRAOS.IndexName := 'IOS';
      while not tOS.Eof do begin
        if not tAuxRAOS.FindKey([tOSTecnico.Value, tOSCliente.Value, tOSData.Value, tOSID.Value]) then 
        begin
          mtOS.Insert;
          mtOSIncluir.Value := False;
          mtOSData.Value := tOSData.Value;
          mtOSID.Value := tOSID.Value;
          mtOSHoras.Value := tOSTotalHoras.Value;
          mtOS.Post;
        end;
        tOS.Next;
      end;
    finally
      tOS.CancelRange;
    end;
  end;  
  mtOS.First;
end;

procedure TFrmRA.SalvaItens;
begin
  with DM do begin
    mtItem.First;
    tDesp.IndexName := 'IID';
    while not mtItem.Eof do begin
      if tDesp.FindKey([FTec, FCli, mtItemID.Value]) then begin
        tDesp.Edit;
        if mtItemIncluir.Value then
          tDespIDRA.Value := tRAID.Value
        else
          tDespIDRA.Clear;  
        tDesp.Post;
      end;
      mtItem.Next;
    end;  
  end;    
end;

procedure TFrmRA.SalvaOS;
var Jatem: Boolean;
begin
  with DM do begin
    mtOS.First;
    while not mtOS.Eof do begin
      Jatem := tRAOS.Locate('Tecnico;Cliente;DataOS;IDOS', VarArrayOf([tRATecnico.Value, tRACliente.Value, mtOSData.Value, mtOSID.Value]), []);
      if mtOSIncluir.Value then begin
        if not Jatem then begin
          tRAOS.Insert;
          tRAOSDataOS.Value := mtOSData.Value;
          tRAOSIDOS.Value := mtOSID.Value;
          tRAOSHoras.Value := mtOSHoras.Value;
          tRAOS.Post;
        end;
      end else
      if Jatem then 
        tRAOS.Delete;
      mtOS.Next;
    end;  
  end;    
end;

procedure TFrmRA.Editar;
begin
  FCli := dm.tRACliente.Value;
  FTec := dm.tRATecnico.Value;
  btnOk.Enabled := DM.tRASync.Value;
  lbCli.Caption := DM.tRANomeCli.Value;
  lbTec.Caption := DM.tRATecnico.Value;
  lbID.Caption := DM.tRAID.AsString;
  FDataIA := DM.tRADataI.Value;
  FDataFA := DM.tRADataF.Value;
  FIDRA   := DM.tRAID.Value;
  FNovo := False;
  LeOS;
  LeItens;
  DataI := FDataIA;
  DataF := FDataFA;
  ShowModal;
end;

procedure TFrmRA.Novo;
var
  Cnt: Integer;
begin  
  FIDRA := DM.ProxIDRA;
  lbCli.Caption := DM.qCliNome.Value;
  lbTec.Caption := IDTecnico;
  lbID.Caption  := IntToStr(FIDRA);
  FCli := DM.qCliID.Value;
  FTec := IDTecnico;
  FDataIA := 0;
  FDataFA := 0;
  DataI := 0;
  DataF := 0;
  FNovo := True;
  LeOS;
  LeItens;
  ShowModal
end;

procedure TFrmRA.SetDataF(const Value: TDateTime);
begin
  if FDataF=Value then Exit;
  FDataF := Value;
  lbDataF.Caption := FormatDateTime('dd/mm/yyyy', FDataF); 
  lbDataF.Visible := (FDataF>1);
end;

procedure TFrmRA.SetDataI(const Value: TDateTime);
begin
  if FDataI=Value then Exit;
  FDataI := Value;
  lbDataI.Caption := FormatDateTime('dd/mm/yyyy', FDataI); 
  lbDataI.Visible := (FDataI>1);
end;

procedure TFrmRA.DelOSs;
begin
  with DM do 
    while not (tRAOS.Bof and tRAOS.Eof) do 
      tRAOS.Delete;
end;

procedure TFrmRA.Valida;
var I : Integer;
begin
  if FNumOS = 0 then 
    Raise Exception.Create('Nenhuma OS foi incluída nesse relatório de atendimento');
  if FNumDesp = 0 then 
    Raise Exception.Create('Nenhuma Despesa foi incluída nesse relatório de atendimento');
  if mtItem.RecordCount=0 then
    Raise Exception.Create('Nenhum Item foi incluído nesse relatório de atendimento'); 
  for I := Trunc(DataI) to Trunc(DataF) do
    if not mtOS.Locate('Incluir;Data', VarArrayOf([True, I]), []) then
      Raise Exception.Create('É necessário haver ao menos uma OS para cada dia do intervalo selecionado');  
  mtItem.First;
  while not mtItem.Eof  do begin
    if mtItemIncluir.Value then begin

      if (mtItemData.Value<DataI) and ((DataI-mtItemData.Value)>1) then
        Raise Exception.Create('Não é possível ter despesas com 2 dias antes do inicio do atendimento');

      if (mtItemData.Value>DataF) and ((mtItemData.Value-DataF)>1) then
        Raise Exception.Create('Não é possível ter despesas com 2 dias depois do final do atendimento');
        
    end;
    mtItem.Next;
  end;   
end;

procedure TFrmRA.btnOkClick(Sender: TObject);
begin
  dsOS.DataSet := nil;
  dsItem.DataSet := nil;
  with DM do begin
    dsRAItem.DataSet := nil;
    dsRAOS.DataSet := nil;
    dsRA.DataSet := nil;
    try
      Valida;
      nxdb.StartTransactionWith([tRA, tRAOS, tRAItem]);
      try
        if FNovo then begin
          tRA.Insert;
          tRAID.Value := FIDRA;
        end else begin
          tRA.Edit;
//          DelOSs;
        end;
        tRADataI.Value := FDataI;
        tRADataF.Value := FDataF; 
        tRA.Post;
        SalvaOS;
        SalvaItens;  
        nxdb.Commit;
      except
        nxdb.Rollback;
        Raise;
      end;
    finally
      dsRA.DataSet := tRA;
      dsRAOS.DataSet := tRAOS;
      dsRAItem.DataSet := tRAItem;
      Self.dsOS.Dataset := mtOS;
      Self.dsItem.Dataset := mtItem;
    end;
  end; 
  Close; 
end;

procedure TFrmRA.GridOSDblClick(Sender: TObject);
begin
  if mtOS.IsEmpty then Exit;
  mtOS.Edit;
  if mtOSIncluir.Value then begin
    mtOSIncluir.Value := False;
    Dec(FNumOS);
    if FNumOS = 0 then begin
      DataI := 0;
      DataF := 0;
    end;  
  end else begin
    mtOSIncluir.Value := True;
    Inc(FNumOS);
    if (FNumOS = 1) or (DataI>mtOSData.Value) then 
      DataI := Trunc(mtOSData.Value);
    if (FNumOS = 1) or (DataF<mtOSData.Value) then
      DataF := Trunc(mtOSData.Value);
  end;  
  mtOS.Post;

  if (FNumOS>0) and (not mtOSIncluir.Value) then
    CalcInicioFim;
end;

procedure TFrmRA.CalcInicioFim;
var 
  B : TBookmark;
  N : Integer;
begin
  B := mtOS.GetBookmark;
  dsOS.DataSet := nil;
  try
    try
      mtOS.First;
      N := FNumOS;
      while (N>0) and (not mtOS.Eof) do begin
        if mtOSIncluir.Value then begin
          Dec(N);
          if (FNumOS = 1) or (DataI>mtOSData.Value) then 
            DataI := Trunc(mtOSData.Value);
          if (FNumOS = 1) or (DataF<mtOSData.Value) then
            DataF := Trunc(mtOSData.Value);
        end;
        mtOS.Next;
      end;
    finally
      mtOS.GotoBookmark(B);
    end;  
  finally
    mtOS.FreeBookmark(B);
    dsOS.DataSet := mtOS;
  end;  
end;

procedure TFrmRA.tvItensDblClick(Sender: TObject);
begin
  if mtItem.IsEmpty then Exit;
  mtItem.Edit;
  mtItemIncluir.Value := not mtItemIncluir.Value;
  mtItem.Post;
  if mtItemIncluir.Value then
    Inc(FNumDesp)
  else
    Dec(FNumDesp);  
end;

procedure TFrmRA.tvItensValor1GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var 
  vValor, vTipo: Variant;
begin
  vTipo := ARecord.Values[tvItensTipo1.Index];
  vValor := ARecord.Values[tvItensValor1.Index];
  if (vTipo=null) or (vValor=null) then Exit;
  if (vTipo=tiraKM) then
    AText := IntToStr(Trunc(vValor));
end;

end.
