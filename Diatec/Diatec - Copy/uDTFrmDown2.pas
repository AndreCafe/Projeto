unit uDTFrmDown2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, lmdctrl, lmdstdcS, lmdcctrl, lmdbtn, DB, nxdb, nxdbBase, uDTDMSync,
  ComCtrls, lmdsplt, dxDBGrid, dxTL, dxDBCtrl, dxCntner, kbmMemTable,
  dxExEdtr,
  dxDBTLCl, dxGrClms, lmdstdcA, LMDCustomScrollBox, LMDScrollBox,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  LMDCustomSimpleLabel, LMDSimpleLabel, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel, ExtCtrls,
  dxInspRw, dxInspct, LMDCustomComponent, lmdcont;

type
  TFrmDown = class(TForm)
    LMDSplitterPane1: TLMDSplitterPane;
    LMDSplitterPane2: TLMDSplitterPane;
    panSelecao: TLMDSplitterPanel;
    dsCli: TDataSource;
    dsProj: TDataSource;
    gridCli: TdxDBGrid;
    gridProj: TdxDBGrid;
    mtCli: TkbmMemTable;
    mtCliID: TStringField;
    mtCliNome: TStringField;
    mtProjCliente: TStringField;
    mtProjID: TStringField;
    mtProjNome: TStringField;
    mtProjUniqueID: TStringField;
    mtProjBaixar: TBooleanField;
    mtCliBaixar: TBooleanField;
    gridCliID: TdxDBGridMaskColumn;
    gridCliNome: TdxDBGridMaskColumn;
    gridCliBaixar: TdxDBGridCheckColumn;
    gridProjCliente: TdxDBGridMaskColumn;
    gridProjID: TdxDBGridMaskColumn;
    gridProjNome: TdxDBGridMaskColumn;
    gridProjUniqueID: TdxDBGridMaskColumn;
    gridProjBaixar: TdxDBGridCheckColumn;
    mtProj: TkbmMemTable;
    qOSFase: TnxQuery;
    qFase: TnxQuery;
    qAmarra: TnxQuery;
    qOSFaseDesc: TnxQuery;
    qFaseTec: TnxQuery;
    mtCliTranslado: TDateTimeField;
    mtCliAssinou: TStringField;
    TabLocal: TnxTable;
    TabProj: TnxTable;
    mtCliNoturno: TStringField;
    mtCliFimSem: TStringField;
    Timer1: TTimer;
    mtCliAbono: TDateTimeField;
    mtCliMotAbono: TStringField;
    mtProjTranslado: TDateTimeField;
    mtProjAbono: TDateTimeField;
    mtProjMotAbono: TStringField;
    mtProjLocaPla: TStringField;
    mtProjLocaRec: TStringField;
    mtProjNoturno: TStringField;
    mtProjFimSem: TStringField;
    qSolicita: TnxQuery;
    qSolicitaDesc: TnxQuery;
    mtProjOSAbon: TStringField;
    Panel1: TPanel;
    Insp: TdxInspector;
    InspCliente: TdxInspectorTextRow;
    InspProjeto: TdxInspectorTextRow;
    InspDias: TdxInspectorTextSpinRow;
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
    dxInspector1: TdxInspector;
    InspServidor: TdxInspectorTextRow;
    InspPorta: TdxInspectorTextRow;
    InspUsername: TdxInspectorTextMaskRow;
    InspSenha: TdxInspectorTextMaskRow;
    LMDSimplePanel1: TLMDSimplePanel;
    qCli: TnxQuery;
    qProj: TnxQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mtCliAfterInsert(DataSet: TDataSet);
    procedure mtProjAfterInsert(DataSet: TDataSet);
    procedure edPortaChange(Sender: TObject);
    procedure gridProjBaixarToggleClick(Sender: TObject;
      const Text: String; State: TdxCheckBoxState);
    procedure gridCliBaixarToggleClick(Sender: TObject; const Text: String;
      State: TdxCheckBoxState);
    procedure Timer1Timer(Sender: TObject);
    procedure InspDrawValue(Sender: TdxInspectorRow;
      ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
      var AColor: TColor; var ADone: Boolean);
    procedure btnDClick(Sender: TObject);
    procedure InspServidorChange(Sender: TObject);
  private
    { Private declarations }
    Etapa : Byte;
    Dias : Integer;
    GerarDisco : Boolean;
    function SyncPendente: Boolean;
    procedure DownQuery(Q: TnxQuery; Nome: String);
    procedure DownloadTableEsp(F, D: TDataset; TableName: String);
    procedure DownloadTable(F, D: TDataset);
    procedure ExecQueries;
    procedure DownloadQueries;
    procedure GeraDisco;
    procedure Etapa1;
    procedure Etapa2;
    procedure AjustaEtapa(E: Byte);
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
  F.First;
  with DMSync do
  while not F.Eof do begin
    Progresso.Position := Progresso.Position + 1;
    lbAndamento.Caption := IntToStr(Progresso.Position) + ' / ' +
                           IntToStr(Progresso.Max);
    Application.ProcessMessages;
    TransfDados(F, D);
    F.Next;
  end;
end;

procedure TFrmDown.Etapa1;
var Erro, I: Integer;
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

  IDTecnico := InspUsername.Text;
  SenhaTec  := InspSenha.Text;

  // Apagar e criar tabelas caso download seja redirecionado para HD
  if Copy(Path, 1, 2)='A:' then begin
    for I := 1 to NumTabs do
    if FileExists(TempPath+NomeTab[I]+'.ff2') then
      DeleteFile(TempPath+NomeTab[I]+'.ff2');
    TFrmChecaBD.Create(Self).ChecaBD(DM.DBDown);
    DM.DBDown.Connected := True;  
  end else begin
    TabLocal.DatabaseName := 'nxdb';
    TabProj.DatabaseName := 'nxdb';
  end;  

  Erro := DMSync.AbreDown;
  if Erro > 0 then begin
    Beep;
    lbStatus.Caption := GetSyncErrorMsg(Erro);
    //ShowMessage(lbStatus.Caption);
    Exit;
  end;

  btnD.Enabled := False;

  Sincronizando := True;
  with DMSync do
  try
{    ffDBSync.StartTransaction;}
    try
      lbStatus.Caption := 'Recebendo dados do servidor ...';
      TabLocal.Close;
      TabRemota.Close;
      for I := 1 to NumTabs do 
      if ClientTab[I] then begin
        TabLocal.TableName := NomeTab[I];
        TabLocal.IndexName := '';
        TabLocal.EmptyTable;
        if DownloadTotal[I] then begin
          TabLocal.Open;
          TabRemota.TableName := NomeTab[I];
          TabRemota.IndexName := '';
          TabRemota.Open;
          if NomeTab[I] = 'OS' then begin
            TabRemota.IndexName := 'ITecnico';
            
            { -- Isso limita o download para apenas OS's desse técnico, que tenham sido
                 feitas nos ultimos X dias com base na data atual do computador cliente --}

            TabRemota.SetRange([IDTecnico, Dias], [IDTecnico, Dias+30]);
          end;
          DownloadTable(TabRemota, TabLocal);
          TabRemota.Close;
          TabLocal.Close;
        end;  
      end;

      if (ClienteDown='') and (TecListaProj = 'T') then begin
        mtCli.DisableControls;
        mtProj.DisableControls;
        try
          TabRemota.TableName := 'Cliente';
          TabRemota.IndexName := '';
          TabRemota.Open;
          DownloadTable(TabRemota, mtCli);
          TabRemota.Close;

          TabRemota.TableName := 'Projeto';
          TabRemota.Open;
          DownloadTable(TabRemota, mtProj);
          TabRemota.Close;
          
          lbStatus.Caption := 'Marque os clientes/projetos desejados e depois clique em Finalizar Download';
          lbStatus.Font.Color := clgreen;

          panSelecao.Visible := True;
          Self.Height := 410;
        finally
          mtCli.EnableControls;
          mtProj.EnableControls;
        end;    
      end else begin
        if TecListaProj = 'A' then begin
          qCli.SQL.Add('SELECT C.* FROM CLIENTE, FASETEC F');
          qCli.SQL.Add('WHERE (ID = F.CLIENTE) AND');
          qCli.SQL.Add('(F.TECNICO = ' + QuotedStr(IDTecnico)+')');
          if ClienteDown>'' then begin
            qCli.SQL.Add(' AND (F.CLIENTE=' + QuotedStr(ClienteDown) + ')');
            if ProjetoDown>'' then
              qCli.SQL.Add(' AND (F.PROJETO=' + QuotedStr(ProjetoDown) + ')');
          end;    

          qCli.SQL.Add('SELECT P.* FROM PROJETO, FASETEC F');
          qCli.SQL.Add('WHERE (ID = F.PROJETO) AND');
          qCli.SQL.Add('(F.TECNICO = ' + QuotedStr(IDTecnico)+')');
          if (ClienteDown>'') and (ProjetoDown>'') then begin
            qCli.SQL.Add(' AND (F.CLIENTE=' + QuotedStr(ClienteDown) + ')');
            if ProjetoDown>'' then
              qCli.SQL.Add(' AND (F.PROJETO=' + QuotedStr(ProjetoDown) + ')');
          end;    
        end else begin
          qCLI.SQL.Add('SELECT * FROM CLIENTE');
          qCLI.SQL.Add('WHERE ID = ' + QuotedStr(ClienteDown));
          
          qProj.SQL.Add('SELECT * FROM PROJETO');
          qProj.SQL.Add('WHERE ID = ' + QuotedStr(ProjetoDown));
        end;
        qCli.Open;
        qProj.Open;

        if ClienteDown>'' then begin
          DownloadTable(qCli, mtCli);
          DownloadTable(qProj, mtProj);
        end else begin
          DownloadQueries;
          DownQuery(qCli, 'CLIENTE');
          DownQuery(qProj, 'PROJETO');
        end;
      end; 
      
{      ffDBSync.Commit;}
      if (ClienteDown>'') then begin
        AjustaEtapa(3);
        FecharTabs := True;
        GerarDisco := False;
      end else begin
        AjustaEtapa(2);
        FecharTabs := False;
        GerarDisco := True;
      end;  
    except;
{      ffDBSync.Rollback;}
      FecharTabs := True;
      lbStatus.Font.Color := clRed;
      lbStatus.Caption := 'Falha no recebimento de dados!';
      Raise;
    end;
  finally;
    Sincronizando := False;
    FechaDown;
    btnD.Enabled := True;
  end;
  GeraDisco;
end;

procedure TFrmDown.FormCreate(Sender: TObject);
begin
  Etapa := 1;
  Height := 140;
  Width := 520;
  panSelecao.Visible := False;
  
  ToogleProj := False;
  GerarDisco      := False;
  FecharTabs      := False;

  InspUsername.Text := IDTecnico;
  InspSenha.Text    := SenhaTec;
  InspServidor.Text := cfgSrv;
  InspPorta.Text    := IntToStr(cfgPort);
end;

function TFrmDown.SyncPendente: Boolean;
var I : Integer;
begin
  Result := True;
  try
    TabLocal.DatabaseName := 'nxdb';
    try
      for I := 1 to NumTabs do
      if UploadTab[I] then begin
        TabLocal.Close;
        TabLocal.TableName := NomeTab[I];
        TabLocal.IndexName := 'ISync';
        TabLocal.Open;
        TabLocal.SetRange([True], [True]);
        if TabLocal.RecordCount > 0 then
          Exit;
      end;
    finally
      TabLocal.Close;
      TabLocal.DatabaseName := 'DBDown';
    end;      

    Result := False;
  except
    AjustaEtapa(3);
    lbStatus.Caption := 'Falha preparando tabelas para download';
  end;
end;

procedure TFrmDown.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cfgSrv := InspServidor.Text;
  if TabLocal.Active then TabLocal.Close;
  if TabProj.Active then TabProj.Close;
  DMSync.FechaDown;
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

procedure TFrmDown.ExecQueries;

procedure AddLine(St: String);
begin
  if qOSFase.SQL.Count > 2 then
    St := 'OR ' + St;
  qOSFase.SQL.Add(' '+St);  
end;

begin
  qOSFase.SQL.Clear;
  qOSFase.SQL.Add('select * from OSFase');
  qOSFase.SQL.Add('where');
  if ClienteDown='' then begin
    mtCli.First;
    while not mtCli.Eof do begin
      if mtCliBaixar.Value then 
        AddLine('(Cliente='''+mtCliID.Value+''')')
      else begin
        mtProj.First;
        while not mtProj.Eof do begin
          if mtProjBaixar.Value then
            AddLine('((Cliente='''+mtCliID.Value+''') AND (Projeto='''+mtProjID.Value+'''))');
          mtProj.Next;
        end;
      end;
      mtCli.Next;
    end;  
  end else
    AddLine('((Cliente='''+ClienteDown+''') AND (Projeto='''+ProjetoDown+'''))');
  qFase.SQL.Assign(qOSFase.SQL);
  qAmarra.SQL.Assign(qOSFase.SQL);
  qOSFaseDesc.SQL.Assign(qOSFase.SQL);
  qFaseTec.SQL.Assign(qOSFase.SQL);
  qSolicita.SQL.Assign(qOSFase.SQL);
  qSolicitaDesc.SQL.Assign(qOSFase.SQL);
  
  qFase.SQL[0] := 'select * from Fase';
  qAmarra.SQL[0] := 'select * from AmarraFase';   
  qOSFaseDesc.SQL[0] := 'select * from OSFaseDesc';
  qFaseTec.SQL[0] := 'select * from FaseTec';
  qSolicita.SQL[0] := 'select * from Solicita';
  qSolicitaDesc.SQL[0] := 'select * from SolicitaDesc';
  
  qOSFase.Open;
  qFase.Open;
  qOSFaseDesc.Open;
  qAmarra.Open;
  qFaseTec.Open;
  qSolicita.Open;
  qSolicitaDesc.Open;
end;

procedure TFrmDown.DownloadQueries;
begin
  Sincronizando := True;
  with DMSync do begin
    lbStatus.Caption := 'Requisitando dados selecionados ao servidor ...'; 
    Application.ProcessMessages;
    ExecQueries;
    panSelecao.Visible := False;
    lbStatus.Caption := 'Recebendo dados do servidor ...';
    Application.ProcessMessages;
    
    DownQuery(qOSFase, 'OSFase');
    DownQuery(qFase, 'Fase');
    DownQuery(qAmarra, 'AmarraFase');
    DownQuery(qOSFaseDesc, 'OSFaseDesc');
    DownQuery(qFaseTec, 'FaseTec');
    DownQuery(qSolicita, 'Solicita');
    DownQuery(qSolicitaDesc, 'SolicitaDesc');
  end;  
end;  

procedure TFrmDown.DownQuery(Q: TnxQuery; Nome: String);
begin
  if Q.RecordCount=0 then Exit;
  TabLocal.Close;
  TabLocal.TableName := Nome;
  TabLocal.IndexName := '';
  TabLocal.Open;
  DownloadTableEsp(Q, TabLocal, Nome);
  TabLocal.Close;
end;

procedure TFrmDown.Etapa2;
var 
  Erro: Integer;
  BaixarCli: Boolean;

begin
  lbStatus.Font.Color := clBlack;
  FecharTabs := True;

  lbStatus.Caption := 'Estabelecendo conexão com o servidor ... aguarde';
  lbStatus.Refresh;
  Sleep(50);

  IDTecnico := InspUsername.Text;
  SenhaTec  := InspSenha.Text;

  Erro := DMSync.AbreDown;
  if Erro > 0 then begin
    Beep;
    lbStatus.Caption := GetSyncErrorMsg(Erro);
    ShowMessage(lbStatus.Caption);
    Exit;
  end;


  btnD.Enabled := False;

  Sincronizando := True;
  with DMSync do
  try
    ffDBSync.StartTransaction;
    try
      panSelecao.Visible := False;
      DownloadQueries;
      
      lbTabela.Caption := 'Clientes / Projetos';
      lbAndamento.Caption := '0 / '+IntToStr(mtCli.RecordCount);
      Progresso.Max := mtCli.RecordCount;
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
            TransfDados(mtProj, TabProj);
          end;  
          mtProj.Next;
        end;
        TransfDados(mtCli, TabLocal);
        mtCli.Next;
        Application.ProcessMessages;
      end;
      
      ffDBSync.Commit;
      FecharTabs := False;
      lbStatus.Caption := 'Dados recebidos com sucesso !';
      GerarDisco := True;
      lbStatus.Color   := clGreen;
    except;
      AjustaEtapa(2);
      ffDBSync.Rollback;
      lbStatus.Font.Color := clRed;
      lbStatus.Caption := 'Falha no recebimento de dados!';
      Raise;
    end;
  finally;
    if TabLocal.Active then TabLocal.Close;
    if TabProj.Active then TabProj.Close;
    Sincronizando := False;
    FechaDown;
  end;
  GeraDisco;
end;  

procedure TFrmDown.edPortaChange(Sender: TObject);
begin
  cfgPort := StrToIntDef(InspPorta.Text, cfgPort);
end;

procedure TFrmDown.GeraDisco;
begin
  if GerarDisco and (Copy(Path, 1, 2)='A:') then
    TFrmGrDsk.Create(Self).GeraDisquete(TempPath);
end;

procedure TFrmDown.gridProjBaixarToggleClick(Sender: TObject;
  const Text: String; State: TdxCheckBoxState);
begin
  ToogleProj := True;
  try
    if State = cbsUnChecked then Timer1.Enabled := True;
  finally
    ToogleProj := False;
  end;    
end;

procedure TFrmDown.gridCliBaixarToggleClick(Sender: TObject;
  const Text: String; State: TdxCheckBoxState);
begin
  if ToogleProj then Exit;
  mtProj.First;
  while not mtProj.Eof do begin
    mtProj.Edit;
    mtProjBaixar.Value := (State=cbsChecked);
    mtProj.Post;
    mtProj.Next;
  end;
end;

procedure TFrmDown.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  mtProj.Post;
  mtCli.Edit;
  mtCliBaixar.Value := False;
  mtCli.Post;
end;

procedure TFrmDown.InspDrawValue(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Style := [fsBold];
end;

procedure TFrmDown.btnDClick(Sender: TObject);
begin
  Dias := StrToInt(InspDias.Text);
  ClienteDown := Trim(InspCliente.Text);
  ProjetoDown := Trim(InspProjeto.Text);
  case Etapa of
    0 : Etapa1;
    1 : Etapa2;
  else 
    IDTecnico := InspUsername.Text;
    Close;
  end;  
end;

procedure TFrmDown.InspServidorChange(Sender: TObject);
begin
  cfgSrv := InspServidor.Text;
end;

procedure TFrmDown.AjustaEtapa(E: Byte);
begin
  Etapa := E;
  btnD.Enabled := True;
  case Etapa of
    1 : begin
      btnD.ListIndex := 0;
      btnD.Caption := 'Conectar e &Iniciar Download';
    end;
    2 : begin
      panSelecao.Visible := True;
      btnD.ListIndex := 0;
      btnD.Caption := 'Conectar e &Finalizar Download';
    end;
    3 : begin
      btnD.ListIndex := 2;
      btnD.Caption := '&Fechar';
    end;
  end;  
end;

end.
