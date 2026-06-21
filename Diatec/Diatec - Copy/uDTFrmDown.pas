unit uDTFrmDown;

interface

uses
  Windows, Messages, Variants, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB, nxdb, nxdbBase, uDTDMSync,
  ComCtrls, lmdsplt, 
  kbmMemTable,
  LMDCustomScrollBox, LMDScrollBox,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  LMDCustomSimpleLabel, LMDSimpleLabel, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel, ExtCtrls,
  LMDCustomComponent, lmdcont, LMDGraphicControl,
  LMDBaseImage, LMDCustomLImage, LMDLImage, kbmMWStreamFormat,
  kbmMWBinaryStreamFormat, kbmMemBinaryStreamFormat, cxStyles, cxGraphics,
  cxEdit, cxTextEdit, cxMaskEdit, cxVGrid, cxControls, cxInplaceContainer,
  cxSpinEdit, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxCheckBox, cxCalendar, cxImageComboBox, cxDBLookupComboBox, cxTimeEdit,
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGridLevel, cxGrid, ImgList,
  LMDCustomImageList, LMDBitmapList;

type
  TFrmDown = class(TForm)
    LMDSplitterPane1: TLMDSplitterPane;
    LMDSplitterPane2: TLMDSplitterPane;
    panSelecao: TLMDSplitterPanel;
    dsCli: TDataSource;
    TabLocal: TnxTable;
    TabProj: TnxTable;
    Timer1: TTimer;
    Panel1: TPanel;
    LMDSimplePanel3: TLMDSimplePanel;
    LMDSimplePanel4: TLMDSimplePanel;
    btnD: TLMDSpeedButton;
    LMDBitmapList1: TLMDBitmapList;
    Panel2: TPanel;
    panProgresso: TLMDSimplePanel;
    lbTabela: TLMDSimpleLabel;
    lbAndamento: TLMDSimpleLabel;
    Progresso: TProgressBar;
    lbStatus: TLMDLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    imStatus: TLMDLImage;
    BSF: TkbmMWBinaryStreamFormat;
    MT: TkbmMemTable;
    mtCli: TkbmMemTable;
    mtCliTranslado: TDateTimeField;
    mtCliAssinou: TStringField;
    mtCliID: TStringField;
    mtCliNome: TStringField;
    mtCliBaixar: TBooleanField;
    mtCliNoturno: TStringField;
    mtCliFimSem: TStringField;
    mtCliAbono: TDateTimeField;
    mtCliMotAbono: TStringField;
    mtProj: TkbmMemTable;
    dsProj: TDataSource;
    mtProjCliente: TStringField;
    mtProjID: TStringField;
    mtProjNome: TStringField;
    mtProjUniqueID: TStringField;
    mtProjBaixar: TBooleanField;
    mtProjTranslado: TDateTimeField;
    mtProjAbono: TDateTimeField;
    mtProjMotAbono: TStringField;
    mtProjLocaPla: TStringField;
    mtProjLocaRec: TStringField;
    mtProjNoturno: TStringField;
    mtProjFimSem: TStringField;
    mtProjOSAbon: TStringField;
    cbStress: TCheckBox;
    VG2: TcxVerticalGrid;
    vgServ: TcxEditorRow;
    vgPortas: TcxMultiEditorRow;
    vgUsername: TcxEditorRow;
    vgSenha: TcxEditorRow;
    vg: TcxVerticalGrid;
    vgCliente: TcxEditorRow;
    vgProjeto: TcxEditorRow;
    vgDias: TcxEditorRow;
    gridCli: TcxGrid;
    glCli: TcxGridLevel;
    tvCli: TcxGridDBTableView;
    tvCliID1: TcxGridDBColumn;
    tvCliBaixar1: TcxGridDBColumn;
    tvCliNome1: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    gridProj: TcxGrid;
    glProj: TcxGridLevel;
    tvProj: TcxGridDBTableView;
    tvProjCliente1: TcxGridDBColumn;
    tvProjBaixar1: TcxGridDBColumn;
    tvProjID1: TcxGridDBColumn;
    tvProjNome1: TcxGridDBColumn;
    tvProjUniqueID1: TcxGridDBColumn;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    mtCliCidade: TStringField;
    mtCliKM: TIntegerField;
    mtCliVlPedag: TCurrencyField;
    mtCliPgAlim: TBooleanField;
    mtCliPgHosp: TBooleanField;
    mtCliValorKM: TCurrencyField;
    mtProjAPSemOS: TStringField;
    mtProjAbonaInt: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mtCliAfterInsert(DataSet: TDataSet);
    procedure mtProjAfterInsert(DataSet: TDataSet);
    procedure edPortaChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnDClick(Sender: TObject);
    procedure InspServidorChange(Sender: TObject);
    procedure Insp2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvProjBaixar1PropertiesChange(Sender: TObject);
    procedure tvCliBaixar1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
    Etapa : Byte;
    Dias : Integer;
    GerarDisco : Boolean;
    function SyncPendente: Boolean;
    procedure TransfMemTable(F, D: TkbmMemtable; TableName: String);
    procedure DownloadTableEsp(F, D: TDataset; TableName: String);
    procedure DownloadMT(const V: Variant; TableName: String);
    procedure DownloadTable(F, D: TDataset);
    procedure GeraDisco;
    procedure Etapa1;
    procedure Etapa2;
    procedure AjustaEtapa(E: Byte);
    procedure FazDownload;
  public
    { Public declarations }
  end;

var
  FrmDown: TFrmDown;
  ToogleProj: Boolean;

implementation

uses uDTDM, uDTSyncDef, uDTTabelas, uDTFrmPri, uChecaTabelas,
  uDTGrDsk;

{$R *.DFM}

procedure TFrmDown.DownloadTable(F, D: TDataset);
begin
  DownloadTableEsp(F, D, TnxTable(F).TableName);
end;

procedure TFrmDown.DownloadTableEsp(F, D: TDataset; TableName: String);
begin
  lbTabela.Caption := 'Tabela: ' + TableName;
  Progresso.Max := F.RecordCount;
  Progresso.Position := 0;
  Application.ProcessMessages;
  F.First;
  while not F.Eof do begin
    Progresso.Position := Progresso.Position + 1;
    lbAndamento.Caption := IntToStr(Progresso.Position) + ' / ' +
                           IntToStr(Progresso.Max);
    Application.ProcessMessages;
    DMSync.TransfDados(F, D);
    F.Next;
  end;
end;

procedure TransfMemReg(F, D: TkbmMemtable);
var 
  I : Integer;
  AF : TField;
begin
  D.Insert;
  for I := 0 to pred(F.FieldCount) do 
  with F.Fields[I] do
  if FieldKind = fkData then begin
    AF := D.FindField(FieldName);
    if AF <> nil then 
      AF.Value := Value;
  end;  
  D.Post;
end;

procedure TFrmDown.TransfMemTable(F, D: TkbmMemtable; TableName: String);
begin
  lbTabela.Caption := 'Tabela: ' + TableName;
  Progresso.Max := F.RecordCount;
  Progresso.Position := 0;
  F.First;
  while not F.Eof do begin
    Progresso.Position := Progresso.Position + 1;
    lbAndamento.Caption := IntToStr(Progresso.Position) + ' / ' +
                           IntToStr(Progresso.Max);
    Application.ProcessMessages;
    TransfMemReg(F, D);
    F.Next;
  end;
end;


procedure TFrmDown.DownloadMT(const V: Variant; TableName: String);
begin
  MT.Active := False;
  MT.Free;
  MT := TkbmMemTable.Create(Self);
  MT.AllDataFormat := BSF;
  MT.AllData := V;
  MT.Active := True;
  TabLocal.Active := False;
  TabLocal.TableName := TableName;
  TabLocal.IndexName := '';
  TabLocal.Open;
  DownloadTableEsp(MT, TabLocal, TableName);
end;

procedure TFrmDown.Insp2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{  if (Key = 13) and (Insp2.FocusedNode.Index=3) then begin
    Key := 0;
    Insp.SetFocus;
    Insp.FocusedNumber := 0;
  end;}
end;

function VarArrayCount(const A : Variant): Integer;
begin
  Result := VarArrayHighBound(A, 1) + 1;
end;

procedure TFrmDown.Etapa1;
var
  Erro, I: Integer;
  V : Variant;
begin
  lbStatus.Font.Color := clBlack;

  if SyncPendente then begin
    Beep;
    AjustaEtapa(3);
    lbStatus.Caption := 'Existem itens a serem enviados para o servidor ... não é possível fazer download';
    lbStatus.Font.Color := clRed;
    Exit;
  end;

  lbStatus.Caption := 'Estabelecendo conexão com o servidor ... aguarde';
  lbStatus.Refresh;
  Sleep(50);

  IDTecnico := vgUsername.Properties.Value;
  SenhaTec  := vgSenha.Properties.Value;

  DM.dbDown.Connected := True;

  // Apagar e criar tabelas caso download seja redirecionado para HD
  if Copy(Path, 1, 2)='A:' then begin
    for I := 1 to NumTabs do
    if FileExists(TempPath+NomeTab[I]+'.nx1') then
      DeleteFile(TempPath+NomeTab[I]+'.nx1');
    TFrmChecaBD.Create(Self).ChecaBD(DM.DBDown);
    DM.DBDown.Connected := True;
  end else begin
    TabLocal.Database := DM.nxdb;
    TabProj.Database := DM.nxdb;
  end;


  Sincronizando := True;
  with DM do
  try
    dbDown.StartTransaction;
    try
      TabLocal.Close;
      for I := 1 to NumTabs do
      if ClientTab[I] then begin
        TabLocal.TableName := NomeTab[I];
        TabLocal.IndexName := '';
        TabLocal.EmptyTable;
        TabLocal.Close;
      end;

      lbStatus.Caption := 'Enviando solicitação ao servidor ...';
      Application.ProcessMessages;

      I := vgDias.Properties.Value;
      DMSync.AbreSessao;
      V := DMSync.kbmCli.Request('DOWNLOADSVC', '', 'DOWNLOAD1',
                                 [IDTecnico, SenhaTec, ClienteDown, ProjetoDown, cfgVersao, I]);

      imStatus.ListIndex := 3;
      lbStatus.Caption := 'Resposta recebida do servidor ...';
      Application.ProcessMessages;

      if VarIsArray(V) then begin
        I := VarArrayCount(V);
        if I=1 then
          Raise Exception.Create(V[0]);
      end else
        Raise Exception.Create(V);


      TabLocal.Close;

      if I=2 then begin
{        mtCli.DisableControls;
        mtProj.DisableControls;}
        try
          mtCli.Active := True;
          MT.AllData := V[00];
          TransfMemTable(MT, mtCli, 'Clientes');
          MT.Close;
          MT.AllData := V[01];
          MT.Active := True;
          mtProj.Active := True;
          TransfMemTable(MT, mtProj, 'Projetos');
          lbStatus.Caption := 'Marque os clientes/projetos desejados e depois clique em Finalizar Download';
          lbStatus.Font.Color := clgreen;
          panSelecao.Visible := True;
          AjustaEtapa(2);
          FecharTabs := True;
          GerarDisco := True;
        finally
{          mtCli.EnableControls;
          mtProj.EnableControls;}
        end;
      end else begin
        DownloadMT(V[00], 'Cliente');
        DownloadMT(V[01], 'Projeto');
        DownloadMT(V[02], 'Tecnico');
        DownloadMT(V[03], 'Parametro');
        DownloadMT(V[04], 'OS');
        DownloadMT(V[05], 'OSFase');
        DownloadMT(V[06], 'Fase');
        DownloadMT(V[07], 'OSFaseDesc');
        DownloadMT(V[08], 'AmarraFase');
        DownloadMT(V[09], 'FaseTec');
        DownloadMT(V[10], 'Solicita');
        DownloadMT(V[11], 'SolicitaDesc');
        DownloadMT(V[12], 'Motivo');
        DownloadMT(V[13], 'Ocorrencia');
        DownloadMT(V[14], 'TipoHora');
        DownloadMT(V[15], 'RA');
        DownloadMT(V[16], 'RAOS');
        DownloadMT(V[17], 'RAItem');
        DownloadMT(V[18], 'Feriado');
        DownloadMT(V[19], 'Log');
        TabLocal.Close;

        AjustaEtapa(3);
        FecharTabs := False;
        GerarDisco := False;
        lbStatus.Font.Color := clGreen;
        lbStatus.Caption := 'Dados Recebidos Com Sucesso!';
      end;

      dbDown.Commit;
      if (I>2) then begin
        AjustaEtapa(3);
        FecharTabs := False;
        GerarDisco := False;
        lbStatus.Font.Color := clGreen;
        lbStatus.Caption := 'Dados Recebidos Com Sucesso!';
      end else begin
        AjustaEtapa(2);
        FecharTabs := True;
        GerarDisco := True;
      end;
    except;
      dbDown.Rollback;
      AjustaEtapa(1);
      FecharTabs := True;
      lbStatus.Font.Color := clRed;
      lbStatus.Caption := 'Falha no recebimento de dados!';
      Raise;
    end;
  finally;
    Sincronizando := False;
    DM.dbDown.Connected := False;
    btnD.Enabled := True;
  end;
  GeraDisco;
end;

procedure TFrmDown.FormCreate(Sender: TObject);
begin
  MT.AllDataFormat := BSF;
  Etapa := 1;
  panSelecao.Visible := False;

  ToogleProj := False;
  GerarDisco      := False;
  FecharTabs      := False;

  vgServ.Properties.Value := cfgSrv;
  vgPortas.Properties.Editors[0].Value := cfgPort;
  vgPortas.Properties.Editors[1].Value := cfgPortHTTP;
  AjustaEtapa(1);
end;

function TFrmDown.SyncPendente: Boolean;
var I : Integer;
begin
  Result := True;
  try
    TabLocal.Database := DM.nxdb;
    try
      for I := 1 to NumTabs do
      if UploadTab[I] then begin
        TabLocal.Close;
        TabLocal.TableName := NomeTab[I];
        TabLocal.IndexName := 'ISync';
        TabLocal.Open;
        TabLocal.SetRange([True], [True]);
        if not TabLocal.IsEmpty then Exit;
      end;
    finally
      TabLocal.Close;
      TabLocal.Database := DM.DBDown;
    end;      

    Result := False;
  except
    on E: Exception do begin
      AjustaEtapa(3);
      lbStatus.Caption := 'Falha preparando tabelas para download';
      Raise Exception.Create(E.Message + ' ' + NomeTab[I]);
    end;
  end;
end;

procedure TFrmDown.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cfgSrv := vgServ.Properties.Value;
  if TabLocal.Active then TabLocal.Close;
  if TabProj.Active then TabProj.Close;
  Action := caFree;
end;

procedure TFrmDown.mtCliAfterInsert(DataSet: TDataSet);
begin
  mtCliBaixar.Value := False;
end;

procedure TFrmDown.mtProjAfterInsert(DataSet: TDataSet);
begin
  mtProjBaixar.Value := False;
end;

procedure TFrmDown.Etapa2;
var 
  I: Integer;
  V: Variant;
  BaixarCli, PrimProj: Boolean;
  slCli, slProj : TStrings;
begin

  DM.dbDown.Connected := True;

  lbStatus.Font.Color := clBlack;
  FecharTabs := True;

  lbStatus.Caption := 'Estabelecendo conexão com o servidor ... aguarde';
  lbStatus.Refresh;
  Sleep(50);

  IDTecnico := vgUsername.Properties.Value;
  SenhaTec  := vgSenha.Properties.Value;

  btnD.Enabled := False;

  Sincronizando := True;
  try
    slCli := TStringList.Create;
    slProj := TStringList.Create;
    DM.dbDown.StartTransaction;
    try

      lbStatus.Caption := 'Montando lista de projetos a serem solicitados ao servidor ...';
      Application.ProcessMessages;

      mtCli.First;
      while not mtCli.Eof do begin
        if mtCliBaixar.Value then begin
          slCli.Add('(Cliente = ' + QuotedStr(mtCliID.Value) + ')');
          slProj.Add('(Cliente = ' + QuotedStr(mtCliID.Value) + ')');
        end else 
        begin
          PrimProj := True;
          mtProj.First;
          while not mtProj.Eof do begin
            if mtProjBaixar.Value then begin
              if PrimProj then
                slCli.Add('(Cliente = ' + QuotedStr(mtCliID.Value) + ')');
            
              slProj.Add('((Cliente = ' + QuotedStr(mtCliID.Value) + ') AND '+ 
                         '(Projeto = ' + QuotedStr(mtProjID.Value) + '))');
              PrimProj := False;        
            end;
            mtProj.Next;
          end;
        end;  
        mtCli.Next;
        Application.ProcessMessages;
      end;
      if (slCli.Text='') then begin
        Beep;
        ShowMessage('Não foi marcado nenhum projeto para ser baixado!');
        AjustaEtapa(2);
        Exit;
      end;  

      lbStatus.Caption := 'Enviando solicitação ao servidor ...';
      Application.ProcessMessages;
      
      
      I := vgDias.Properties.Value;
      DMSync.AbreSessao;
      V := DMSync.kbmCli.Request('DOWNLOADSVC', '', 'DOWNLOAD2',  
                                 [IDTecnico, SenhaTec, cfgVersao, I, slCli.Text, slProj.Text]);

      imStatus.ListIndex := 3;
      lbStatus.Caption := 'Analisando resposta recebida do servidor ...';
      Application.ProcessMessages;
      panSelecao.Visible := False;

      if VarIsArray(V) then begin
        I := VarArrayCount(V);
        if I=1 then 
          Raise Exception.Create(V[0]);
      end else
        Raise Exception.Create(V);

      lbStatus.Caption := 'Resposta OK. Importando dados para tabelas locais...';
      Application.ProcessMessages;
        
      DownloadMT(V[01], 'Tecnico');
      DownloadMT(V[02], 'Parametro');
      DownloadMT(V[03], 'OS');
      DownloadMT(V[04], 'OSFase');
      DownloadMT(V[05], 'Fase');
      DownloadMT(V[06], 'OSFaseDesc');
      DownloadMT(V[07], 'AmarraFase');
      DownloadMT(V[08], 'FaseTec');
      DownloadMT(V[09], 'Solicita');
      DownloadMT(V[10], 'SolicitaDesc');
      DownloadMT(V[11], 'Motivo');
      DownloadMT(V[12], 'Ocorrencia');
      DownloadMT(V[13], 'TipoHora');
      DownloadMT(V[14], 'RA');
      DownloadMT(V[15], 'RAOS');
      DownloadMT(V[16], 'RAItem');
      DownloadMT(V[17], 'Feriado');
      DownloadMT(V[18], 'Log');

      MT.Active := False;
      MT.AllData := V[0];
      MT.Active := True;
      
      lbTabela.Caption := 'Clientes / Projetos';
      lbAndamento.Caption := '0 / '+IntToStr(mtCli.RecordCount);
      Progresso.Max := mtCli.RecordCount + MT.RecordCount;
      Progresso.Position := 0;
      TabLocal.Close;
      TabLocal.TableName := 'Cliente';
      TabLocal.IndexName := '';
      TabLocal.Open;
      
      TabProj.Close;
      TabProj.TableName := 'Projeto';
      TabProj.IndexName := '';
      TabProj.Open;
        
      mtCli.First;
      while not mtCli.Eof do begin
        Progresso.Position := Progresso.Position + 1;
        BaixarCli := mtCliBaixar.Value;
        lbAndamento.Caption := IntToStr(Progresso.Position) + ' / ' + IntToStr(Progresso.Max);
        mtProj.First;
          
        while not mtProj.Eof do begin
          if mtCliBaixar.Value or mtProjBaixar.Value then
          begin
            BaixarCli := True;
            DMSync.TransfDados(mtProj, TabProj);
          end;
          mtProj.Next;
        end;
        
        DMSync.TransfDados(mtCli, TabLocal);
        mtCli.Next;
        Application.ProcessMessages;
      end;

      TabLocal.IndexName := 'IID';
      MT.First;
      while not MT.Eof do begin
        Progresso.Position := Progresso.Position + 1;
        if not TabLocal.FindKey([MT.FieldByName('ID').AsString]) then
          DMSync.TransfDados(MT, TabLocal);
        MT.Next;
        Application.ProcessMessages;
      end;
      
      DM.dbDown.Commit;
      FecharTabs := False;
      lbStatus.Caption := 'Dados recebidos com sucesso !';
      GerarDisco := True;
      lbStatus.Color   := clGreen;
      AjustaEtapa(3);
    except;
      AjustaEtapa(3);
      DM.dbDown.Rollback;
      lbStatus.Font.Color := clRed;
      lbStatus.Caption := 'Falha no recebimento de dados!';
      Raise;
    end;
  finally;
    slCli.Free;
    slProj.Free;
    if TabLocal.Active then TabLocal.Close;
    if TabProj.Active then TabProj.Close;
    Sincronizando := False;
    DM.dbDown.Connected := False;
  end;
  GeraDisco;
end;  

procedure TFrmDown.edPortaChange(Sender: TObject);
begin
  cfgPort := vgPortas.Properties.Editors[0].Value;
end;

procedure TFrmDown.GeraDisco;
begin
  if GerarDisco and (Copy(Path, 1, 2)='A:') then
    TFrmGrDsk.Create(Self).GeraDisquete(TempPath);
end;

procedure TFrmDown.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  mtProj.Post;
  mtCli.Edit;
  mtCliBaixar.Value := False;
  mtCli.Post;
end;

procedure TFrmDown.btnDClick(Sender: TObject);
begin
  CfgSrv := vgServ.Properties.Value;
  cfgPort := vgPortas.Properties.Editors[0].Value;
  cfgPortHTTP := vgPortas.Properties.Editors[1].Value;
  vg.SetFocus;
  vg2.SetFocus;
  Dias := vgDias.Properties.Value;
  ClienteDown := Trim(vgCliente.Properties.Value);
  ProjetoDown := Trim(vgProjeto.Properties.Value);
  if not cbStress.Checked then
    FazDownload
  else
  while cbStress.Checked do begin
    Application.ProcessMessages;
    Etapa := 1;
    FazDownload;
    Sleep(50);
  end;  
end;

procedure TFrmDown.InspServidorChange(Sender: TObject);
begin
  cfgSrv := vgServ.Properties.Value;
end;

procedure TFrmDown.AjustaEtapa(E: Byte);
begin
  Etapa := E;
  btnD.Enabled := True;
  imStatus.ListIndex := 2;
  case Etapa of
    1 : begin
      btnD.ListIndex := 0;
      btnD.Caption := '&Iniciar Download';
      Height := Panel1.Height + Panel2.Height + 27;
    end;
    2 : begin
      panSelecao.Visible := True;
      btnD.ListIndex := 0;
      btnD.Caption := '&Finalizar Download';
      Height := Panel1.Height + Panel2.Height + 210;
    end;
    3 : begin
      btnD.ListIndex := 1;
      btnD.Caption := '&Fechar';
      Height := Panel1.Height + Panel2.Height + 27;
    end;
  end;
end;

procedure TFrmDown.FazDownload;
begin
  try
    try
      case Etapa of
        1 : Etapa1;
        2 : Etapa2;
      else
        IDTecnico := vgUsername.Properties.Value;
        Close;
      end;
    finally
      dmSync.FechaSessao;
    end;
  except
    On E: Exception do begin
      Beep;
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TFrmDown.tvProjBaixar1PropertiesChange(Sender: TObject);
begin
  ToogleProj := True;
  try
    if mtProjBaixar.Value then
      mtCliBaixar.Value := True;
  finally
    ToogleProj := False;
  end;      
end;

procedure TFrmDown.tvCliBaixar1PropertiesChange(Sender: TObject);
begin
  if ToogleProj then Exit;
  mtProj.First;
  while not mtProj.Eof do begin
    mtProj.Edit;
    mtProjBaixar.Value := mtCliBaixar.Value;
    mtProj.Post;
    mtProj.Next;
  end;
  mtProj.Refresh;
  gridProj.Refresh;
end;

end.

