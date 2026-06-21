unit uDiatecAdmin;

interface

uses
  Windows, Messages, Variants, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, nxdb,
  nxllConst, nxllTypes, 
  nxllTransport, nxptBasePooledTransport,
  LMDCustomComponent, lmdcont, nxsdServerEngine, nxreRemoteServerEngine,
  nxllComponent, StdCtrls, LMDControl, LMDBaseControl, uDTSyncDef,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton, ExtCtrls, nxdbBase,
  DBCtrls, LMDCustomScrollBox, LMDScrollBox, lmdsplt, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, dxBar, dxBarDBNav, LMDSimplePanel,
  ComCtrls, Menus, cxStyles, cxGraphics, cxEdit,
  cxMaskEdit, cxCheckBox, cxImageComboBox, cxImage, cxTimeEdit,
  cxCurrencyEdit, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxCalendar, cxMemo, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGridLevel,
  cxGrid, cxVGrid, cxDBVGrid, cxInplaceContainer, cxTextEdit,
  cxDBLookupComboBox, cxPC, Grids, DBGrids, ImgList, LMDCustomImageList,
  LMDBitmapList, LMDBaseGraphicControl, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, dxSkinsdxBarPainter;

type
  TFrmPri = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edServidor: TEdit;
    Label2: TLabel;
    edArm: TEdit;
    btnConn: TLMDSpeedButton;
    LMDBitmapList1: TLMDBitmapList;
    dxBarManager1: TdxBarManager;
    dxBarDBNavigator1: TdxBarDBNavigator;
    dxBarDBNavEdit1: TdxBarDBNavButton;
    dxBarDBNavPost1: TdxBarDBNavButton;
    dxBarDBNavCancel1: TdxBarDBNavButton;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    miApagar: TMenuItem;
    miEliminar: TMenuItem;
    miFechar: TMenuItem;
    N1: TMenuItem;
    miExportar: TMenuItem;
    Label3: TLabel;
    edPorta: TEdit;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyleRepository4: TcxStyleRepository;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    Paginas: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    tsParametros: TcxTabSheet;
    tsConsolida: TcxTabSheet;
    tsRA: TcxTabSheet;
    PB: TProgressBar;
    Panel2: TPanel;
    btnApagar: TLMDSpeedButton;
    LMDSplitterPanel1: TLMDSplitterPanel;
    LMDSplitterPane1: TLMDSplitterPane;
    gLog: TcxGrid;
    tvLog: TcxGridDBTableView;
    tvLogOK1: TcxGridDBColumn;
    tvLogOper1: TcxGridDBColumn;
    tvLogTecnico1: TcxGridDBColumn;
    tvLogData1: TcxGridDBColumn;
    tvLogDuracao1: TcxGridDBColumn;
    tvLogID1: TcxGridDBColumn;
    tvLogDetalhes1: TcxGridDBColumn;
    glLog: TcxGridLevel;
    LMDSplitterPane2: TLMDSplitterPane;
    pagDetalhes: TcxPageControl;
    tsDetalhes: TcxTabSheet;
    edDetalhes: TDBMemo;
    tsOS: TcxTabSheet;
    gridOS: TcxGrid;
    tvOS: TcxGridDBTableView;
    tvOSDownOk1: TcxGridDBColumn;
    tvOSCliente1: TcxGridDBColumn;
    tvOSProjeto1: TcxGridDBColumn;
    tvOSTecnico1: TcxGridDBColumn;
    tvOSData1: TcxGridDBColumn;
    tvOSID1: TcxGridDBColumn;
    tvOSInicio1: TcxGridDBColumn;
    tvOSTermino1: TcxGridDBColumn;
    tvOSTranslado1: TcxGridDBColumn;
    tvOSAbono1: TcxGridDBColumn;
    tvOSMotivoAbon1: TcxGridDBColumn;
    tvOSSync1: TcxGridDBColumn;
    tvOSAssinou1: TcxGridDBColumn;
    tvOSLocal1: TcxGridDBColumn;
    tvOSEntrou1: TcxGridDBColumn;
    tvOSDataComp1: TcxGridDBColumn;
    tvOSNumAtend1: TcxGridDBColumn;
    glOS: TcxGridLevel;
    tsOSFase: TcxTabSheet;
    gAponta: TcxGrid;
    tvAponta: TcxGridDBTableView;
    tvApontaDownOk1: TcxGridDBColumn;
    tvApontaCliente1: TcxGridDBColumn;
    tvApontaProjeto1: TcxGridDBColumn;
    tvApontaData1: TcxGridDBColumn;
    tvApontaOS1: TcxGridDBColumn;
    tvApontaItem1: TcxGridDBColumn;
    tvApontaFase1: TcxGridDBColumn;
    tvApontaTecnico1: TcxGridDBColumn;
    tvApontaHoras1: TcxGridDBColumn;
    tvApontaSync1: TcxGridDBColumn;
    tvApontaTipoHora1: TcxGridDBColumn;
    tvApontaOcorrencia1: TcxGridDBColumn;
    tvApontaRevisao1: TcxGridDBColumn;
    tvApontaLogID1: TcxGridDBColumn;
    tvApontaIDDiatec1: TcxGridDBColumn;
    glAponta: TcxGridLevel;
    tsOSFaseDescr: TcxTabSheet;
    gridDescrAponta: TcxGrid;
    tvDescrAponta: TcxGridDBTableView;
    tvDescrApontaDownOk1: TcxGridDBColumn;
    tvDescrApontaCliente1: TcxGridDBColumn;
    tvDescrApontaProjeto1: TcxGridDBColumn;
    tvDescrApontaFase1: TcxGridDBColumn;
    tvDescrApontaTecnico1: TcxGridDBColumn;
    tvDescrApontaItem1: TcxGridDBColumn;
    tvDescrApontaPos1: TcxGridDBColumn;
    tvDescrApontaTexto1: TcxGridDBColumn;
    tvDescrApontaSync1: TcxGridDBColumn;
    tvDescrApontaData1: TcxGridDBColumn;
    tvDescrApontaOS1: TcxGridDBColumn;
    tvDescrApontaLogID1: TcxGridDBColumn;
    tvDescrApontaIDDiatec1: TcxGridDBColumn;
    glDescrAponta: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    LMDSimplePanel1: TLMDSimplePanel;
    VG: TcxDBVerticalGrid;
    VGCategoryRow1: TcxCategoryRow;
    VGMaxDiasUpload1: TcxDBEditorRow;
    VGUploadApontamentoSemOS1: TcxDBEditorRow;
    VGCategoryRow2: TcxCategoryRow;
    VGObedeceListaProj1: TcxDBEditorRow;
    VGListaProjDefault1: TcxDBEditorRow;
    VGMaxDiasDown1: TcxDBEditorRow;
    VGCategoryRow3: TcxCategoryRow;
    VGNomeFranquia1: TcxDBEditorRow;
    VGBitMap1: TcxDBEditorRow;
    VGCategoryRow4: TcxCategoryRow;
    VGRestringeDiurno1: TcxDBEditorRow;
    VGCampoLocalOS1: TcxDBEditorRow;
    VGTravarTranslado1: TcxDBEditorRow;
    VGForcaTransladoProj1: TcxDBEditorRow;
    VGMostraReemb1: TcxDBEditorRow;
    VGPermitirRateio1: TcxDBEditorRow;
    VGExigeAutorizadoPor1: TcxDBEditorRow;
    VGConflitoHoraTodosCli1: TcxDBEditorRow;
    VGTransladoUnicoPorCliente1: TcxDBEditorRow;
    VGImprimeAndamentoProjeto1: TcxDBEditorRow;
    VGValidarEDT1: TcxDBEditorRow;
    VGCategoryRow5: TcxCategoryRow;
    VGEstimarFaseNoApontamento1: TcxDBEditorRow;
    VGExigeAutorizadoPor2: TcxDBEditorRow;
    VGCategoryRow6: TcxCategoryRow;
    VGInicioDiurno1: TcxDBEditorRow;
    VGFimDiurno1: TcxDBEditorRow;
    VGCategoryRow7: TcxCategoryRow;
    VGMostrarRA1: TcxDBEditorRow;
    VGVlKMCli1: TcxDBEditorRow;
    VGVlKMTec1: TcxDBEditorRow;
    VGVlAlim1: TcxDBEditorRow;
    VGVlHosp1: TcxDBEditorRow;
    VGDBEditorRow1: TcxDBEditorRow;
    VGDBEditorRow2: TcxDBEditorRow;
    Panel3: TPanel;
    btnExpAgain: TLMDSpeedButton;
    ExibiritensnoconciliadoscomProtheus1: TMenuItem;
    VGAtivarIntervalo: TcxDBEditorRow;
    VGAtivarValorTrans: TcxDBEditorRow;
    VGPermiteCorrigirOS: TcxDBEditorRow;
    VGDBEditorRow3: TcxDBEditorRow;
    procedure tvOSDownOk1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btnConnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnApagaDebugClick(Sender: TObject);
    procedure miFecharClick(Sender: TObject);
    procedure miEliminarClick(Sender: TObject);
    procedure miExportarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure tvLogOK1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvLogFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnExpAgainClick(Sender: TObject);
  private
    { Private declarations }
  public
    function GetVer: String;
    procedure SalvaConfig;
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

implementation

uses uDTAFrmApagar, uDMA, uAFrmFecha, uAFrmItemRA, cxGridExportLink,
  uVersionInfo, uDebug;

{$R *.DFM}

function ConfigFileName: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'DiatecAdmin.ini';
end;

procedure TFrmPri.btnConnClick(Sender: TObject);
var V : Variant;
begin
  with DM do 
  if btnConn.ListIndex = 0 then begin
    DebugMsg('btnConn - 1');
    nxTCPIP.Active := False;
    nxTCPIP.Enabled := False;
    nxTCPIP.ServerName := edServidor.Text;
    nxTCPIP.Enabled := True;
    nxTCPIP.Active := True;
    DebugMsg('btnConn - 2');
    cfgNomeArm := edArm.Text;
    DebugMsg('btnConn - 3');
    dbUp.Active := False;
    DebugMsg('btnConn - 4');
    dbPar.Active := False;
    DebugMsg('btnConn - 5');
    dbLog.Active := False;
    DebugMsg('btnConn - 6');
    cfgSrv := edServidor.Text;
    DebugMsg('btnConn - 7');
    cfgPort := StrToIntDef(edPorta.Text, cfgPort);
    DebugMsg('btnConn - 8');

    DM.AbreSessao;
    DebugMsg('btnConn - 9');
    V := DM.kbmCli.Request('DOWNLOADSVC', '', 'DOWNClITEC', []);
    DebugMsg('btnConn - 10');
    mtCli.Open;
    DebugMsg('btnConn - 11');
    mtTec.Open;
    DebugMsg('btnConn - 12');
    DM.mtCli.EmptyTable;
    DebugMsg('btnConn - 13');
    DM.mtTec.EmptyTable;
    DebugMsg('btnConn - 14');
    DM.MT.AllData := V[0];
    DebugMsg('btnConn - 15');
    DM.TransfRecords(DM.MT, DM.mtCli);
    DebugMsg('btnConn - 16');
    DM.MT.AllData := V[1];
    DebugMsg('btnConn - 17');
    DM.TransfRecords(DM.MT, DM.mtTec);
    DebugMsg('btnConn - 18');
    dbUp.AliasName := NomeAlias(cDiatecUp);
    DebugMsg('btnConn - 19');
    dbPar.AliasName := NomeAlias(cDiatecPar);
    DebugMsg('btnConn - 20');
    dbLog.AliasName := NomeAlias(cDiatecLog);
    DebugMsg('btnConn - 21');
    Tab.Open;
    DebugMsg('btnConn - 22');
    tLog.Open;
    DebugMsg('btnConn - 23');
    tLog.Last;
    DebugMsg('btnConn - 24');
    tOS.Open;
    DebugMsg('btnConn - 25');
    tOSFase.Open;
    DebugMsg('btnConn - 26');
    tOSFaseDesc.Open;
    DebugMsg('btnConn - 27');
    tRAF.Open;
    DebugMsg('btnConn - 28');
    tRAItem.Open;
    DebugMsg('btnConn - 29');
    tRAOS.Open;
    DebugMsg('btnConn - 30');
    tAuxRAOS.Open;
    DebugMsg('btnConn - 31');
    Paginas.Visible := True;
    DebugMsg('btnConn - 32');
    btnConn.ListIndex := 1;
    DebugMsg('btnConn - 33');
    btnConn.Caption := 'Desconectar';
    DebugMsg('btnConn - 34');
    miApagar.Enabled := True;
    DebugMsg('btnConn - 35');
    miEliminar.Enabled := True;
    DebugMsg('btnConn - 36');
    SalvaConfig;
  end else begin
    nxTCPIP.Active := False;
    Paginas.Visible := False;
    btnConn.ListIndex := 0;
    btnConn.Caption := 'Conectar';
  end;
end;

procedure TFrmPri.btnExpAgainClick(Sender: TObject);
begin
  with DM do begin
    if tOS.IsEmpty then Exit;
    dbUP.StartTransaction;
    try
      tOS.First;
      while not tOS.Eof do begin
        tOS.Edit;
        tOS.FieldByName('Sync').AsBoolean := True;
        tOS.Post;
        tOS.NExt;
      end;

      tOSFase.First;
      while not tOSFase.Eof do begin
        tOSFase.Edit;
        tOSFase.FieldByName('Sync').AsBoolean := True;
        tOSFase.Post;
        tOSFase.NExt;
      end;

      tOSFaseDesc.First;
      while not tOSFaseDesc.Eof do begin
        tOSFaseDesc.Edit;
        tOSFaseDesc.FieldByName('Sync').AsBoolean := True;
        tOSFaseDesc.Post;
        tOSFaseDesc.Next;
      end;
      
      dbUp.Commit;
    except
      dbUp.Rollback;
      Raise;
    end; 
    ShowMessage('Os itens somente serão exportados novamente assim que houver um novo upload');              
  end;    

end;

procedure TFrmPri.FormCreate(Sender: TObject);
var 
  SL : TStrings;
  I : Integer;
begin
  Caption := 'Administrador Diário do Técnico - Versão ' +
             Copy(cfgVersao, 1, 1) + '.' + Copy(cfgVersao, 2, 2);
  SL := TStringList.Create;
  try
    SL.Values['IP'] := 'localhost';
    SL.Values['ARM'] := '';
    SL.Values['Porta'] := '27000';
    cfgNomeArm := '';
    if FileExists(ConfigFileName) then
      SL.LoadFromFile(ConfigFileName);

    edServidor.Text := SL.Values['IP'];
    edArm.Text := Sl.Values['ARM'];
    I := StrToIntDef(SL.Values['Porta'], 27000);
    edPorta.Text := IntToStr(I);
    cfgNomeArm := edArm.Text;
  finally
    SL.Free;
  end;

end;

procedure TFrmPri.SalvaConfig;
var SL: TStrings;
begin
  SL := TStringList.Create;
  try
    SL.Values['IP'] := edServidor.Text;
    SL.Values['ARM'] := edArm.Text;
    SL.Values['Porta'] := edPorta.Text;
    SL.SaveToFile(ConfigFileName);
  finally
    SL.Free;
  end;
end;

procedure TFrmPri.btnApagarClick(Sender: TObject);
begin
  with DM do begin
    if (tLogOper.Value<>0) then begin
      Beep;
      ShowMessage('Só é possível apagar UPLOAD');
      Exit;
    end;
    if MessageDlg('Deseja realmente apagar este upload?', mtConfirmation, [mbNo, mbYes], 0)<>mrYes then
      Exit;
    dbUp.StartTransactionWith([tOS, tOSFase, tOSFaseDesc]);
    try
      while not (tOSFaseDesc.Bof and tOSFaseDesc.Eof) do tOSFaseDesc.Delete;
      while not (tOSFase.Bof and tOSFase.Eof) do tOSFase.Delete;
      while not (tOS.Bof and tOS.Eof) do tOS.Delete;
      tLog.Delete;
      dbUp.Commit;
    except
      dbUp.Rollback;
      Raise;
    end;
  end;  
end;

procedure InitTran(aDB: TnxDatabase;
                   const aTables : array of TnxTable;
                   aWith : Boolean);
var I : Integer;
begin
  if aDB.InTransaction then Exit;
  I := 10;
  while I > 0 do begin
    try
      if aWith then
        aDB.StartTransactionWith(aTables)
      else
        aDB.StartTransaction;
      I := 0;
    except
      Dec(I);
      Random(500);
    end
  end;
end;

procedure TFrmPri.btnApagaDebugClick(Sender: TObject);
var I: Integer;
begin
  with DM do begin
    PB.Visible := True;
    tLog.DisableControls;
    try
      tLog.IndexName := 'IOperData';
      tLog.SetRange([iolDebug], [iolDebug]);
      tLog.First;
      I := 0;
      PB.Max := tLog.RecordCount;
      try
        while (not Application.Terminated) and (not (tLog.Eof and tLog.Bof)) do begin
          InitTran(dbLog, [tLog], True);
          tLog.Delete;
          Inc(I);
          PB.Position := I;
          if I mod 500 = 0 then
            dbLog.Commit;
          if I mod 10 = 0 then
            Application.ProcessMessages
        end;
      except
        dbLog.Rollback;
        Raise;
      end;    
      if dbLog.InTransaction then dbLog.Commit;
    finally
      PB.Visible := False;
      tLog.EnableControls;
      tLog.CancelRange;
      tLog.IndexName := 'IID';
    end;
  end;  
end;

procedure TFrmPri.miFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPri.miEliminarClick(Sender: TObject);
var
  Dia: TDateTime;
  SIndex: String;
begin
  with DM do 
  if TFrmApagar.Create(Self).Apagar(Dia) then
  begin
    SIndex := tLog.IndexName;
    tLog.IndexName := 'IData';
    PB.Visible := True;
    tLog.DisableControls;
    try
      tLog.SetRange([EncodeDate(1980, 1, 1)], [Dia]);
      PB.Max := tLog.RecordCount;
      PB.Position := 0;
      while not (tLog.Eof and tLog.Bof) do begin
        tLog.Delete;
        PB.Position := PB.Position + 1;
        Application.ProcessMessages;
      end;
      ShowMessage(IntToStr(PB.Max) + ' registros eliminados com sucesso!');  
    finally
      PB.Visible := False;
      tLog.IndexName := SIndex;
      tLog.CancelRange;
      tLog.EnableControls;
    end;
  end;
end;

procedure TFrmPri.miExportarClick(Sender: TObject);
var NFase, NOS, NOSFase, NOSFaseDesc: Integer;
begin
  with DM do begin
    dbUP.StartTransaction;
    try
      Q.Close;
      Q.SQL.Text := 'update UOS set Sync = True where DownOK = False';
      Q.ExecSQL;
      NOS := Q.RowsAffected;
  
      Q.Close;
      Q.SQL.Text := 'update UOSFase set Sync = True where DownOK = False';
      Q.ExecSQL;
      NOSFase := Q.RowsAffected;
  
      Q.Close;
      Q.SQL.Text := 'update UOSFaseDesc set Sync = True where DownOK = False';
      Q.ExecSQL;
      NOSFaseDesc := Q.RowsAffected;
  
      Q.Close;
      Q.SQL.Text := 'update UFase set Sync = True where DownOK = False';
      Q.ExecSQL;
      NFase := Q.RowsAffected;
      
      dbUp.Commit;
    except
      dbUp.Rollback;
      Raise;
    end; 
  
    ShowMessage(' OS Exportadas = ' + IntToStr(NOS) + 
                ' Apontamentos Exportados = ' + IntToStr(NOSFase) +
                ' Linhas de Descrição de Apontamentos Exportas = ' + IntToStr(NOSFaseDesc) +
                ' Tarefas Exportadas = ' + IntToStr(NFase));
  
    ShowMessage('Os itens somente serão exportados novamente assim que houver um novo upload');              
  end;    
end;

function TFrmPri.GetVer: String;
var 
  S, S2: String;
begin
  S := GetVersionInfo;
  S2 := S;
  Delete(S, 1, 6);
  Result := 'Versão ' + Copy(S2, 1, 5) + ' Build ' + S;
end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
  Caption := 'Administrador Diário do Técnico - ' + GetVer;
  FrmRAF.panPri.Parent := tsConsolida;
  FrmRA.panPri.Parent := tsRA;
  PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
end;

procedure TFrmPri.PaginasChange(Sender: TObject);
begin
  if Paginas.ActivePageIndex=3 then
    FrmRA.tvDesp.DataController.DataModeController.GridMode := False;
end;

procedure TFrmPri.tvLogOK1CustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var V : Variant;
begin                
  try
    V := AViewInfo.GridRecord.Values[tvLogOK1.Index];
    if not VarIsNull(V) then begin
      if V then
        ACanvas.Canvas.Brush.Color := clGreen
      else
        ACanvas.Canvas.Brush.Color := clRed;  
    end;    
  except
  end;  
end;

procedure TFrmPri.tvOSDownOk1CustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  with AViewInfo do
    if (Value<>null) and (Value=True) then
      ACanvas.Canvas.Brush.Color := clYellow;

end;

procedure TFrmPri.tvLogFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var V: Variant;  
begin
  try
    V := AFocusedRecord.Values[tvLogOper1.Index];
    tsOS.TabVisible := (not VarIsNull(V)) and (V=iolUpload);
    tsOSFase.TabVisible := tsOS.TabVisible;
    tsOSFaseDescr.TabVisible := tsOS.TabVisible;
  except
  end;  
end;

end.
