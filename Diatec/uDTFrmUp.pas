unit uDTFrmUp;

interface

uses
  Windows, Variants, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB, nxdb, nxdbBase, uDTDMSync,
  ComCtrls, LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  LMDCustomSimpleLabel, LMDSimpleLabel, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  kbmMemTable, kbmMWStreamFormat, kbmMWBinaryStreamFormat, ExtCtrls;

type
  TFrmUp = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    lbTabela: TLMDSimpleLabel;
    LMDSimpleLabel3: TLMDSimpleLabel;
    edServidor: TEdit;
    btnUpload: TLMDSpeedButton;
    lbStatus: TLMDLabel;
    Progresso: TProgressBar;
    TabLocal: TnxTable;
    LMDSimpleLabel1: TLMDSimpleLabel;
    edPorta: TEdit;
    TabAux: TnxTable;
    TabAuxCliente: TStringField;
    TabAuxProjeto: TStringField;
    TabAuxData: TDateTimeField;
    TabAuxOS: TSmallintField;
    TabAuxItem: TWordField;
    TabAuxFase: TStringField;
    TabAuxTecnico: TStringField;
    TabAuxHoras: TDateTimeField;
    TabAuxSync: TBooleanField;
    TabAuxTipoHora: TStringField;
    TabAuxOcorrencia: TStringField;
    TabAuxRevisao: TStringField;
    mtLog: TkbmMemTable;
    Ani: TAnimate;
    LMDSpeedButton1: TLMDSpeedButton;
    BSF: TkbmMWBinaryStreamFormat;
    Timer1: TTimer;
    edPortaHTTP: TEdit;
    LMDSimpleLabel2: TLMDSimpleLabel;
    mtUP: TkbmMemTable;
    tAuxProj: TnxTable;
    procedure edServidorChange(Sender: TObject);
    procedure btnUploadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edPortaChange(Sender: TObject);
    procedure TabLocalFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure LMDSpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edPortaHTTPChange(Sender: TObject);
  private
    { Private declarations }
    procedure PreparaTabelas;
    procedure ApontamentoSemOS;
    procedure SyncTable;
    procedure FazUpload;
  public
    { Public declarations }
  end;

var
  FrmUp: TFrmUp;
  UploadOK : Boolean;

implementation

uses uDTDM, uDTSyncDef, uDTTabelas, uDTFrmPri;

{$R *.DFM}

procedure TFrmUp.edServidorChange(Sender: TObject);
begin
  cfgSrv := edServidor.Text;
end;

procedure TFrmUp.SyncTable;
begin
  lbTabela.Caption := 'Preparando Tabela ' + TabLocal.TableName + ' ...';
  Application.ProcessMessages;
  TabLocal.First;
  while not TabLocal.Eof do begin
    TabLocal.Edit;
    TabLocal.FieldByName('Sync').AsBoolean := False;
    if TabLocal.FindField('SyncSug') <> nil then
      TabLocal.FieldByName('SyncSug').AsBoolean := False;
    TabLocal.Post;
    TabLocal.First;
  end;
end;

procedure TransfRegistro(F, D: TDataset);
var 
  I : Integer;
  AF : TField;
begin
  D.Append;
  for I := 0 to pred(F.FieldCount) do
  with F.Fields[I] do
  if FieldKind = fkData then begin
    AF := D.FindField(FieldName);
    if AF <> nil then 
      AF.Value := Value;
  end;  
  D.Post;
end;
  
procedure TFrmUp.btnUploadClick(Sender: TObject);
begin
  edPortaHTTPChange(nil);
  Timer1.Enabled := True;
end;

procedure TFrmUp.FazUpload;
var
  I, N : Integer;
  V    : Variant; 
  Alerta: String;
  VarA : Array[1..9] of Variant;

{function TransfTable(MT: TkbmMemTable; Nome: String): Variant;
begin
  TabLocal.First;
  lbTabela.Caption := 'Preparando Tabela: ' + Nome + ' ...';
  Progresso.Position := Progresso.Position + 1;
  if TabLocal.RecordCount>0 then begin
    MT.LoadFromDataSet(TabLocal, [mtcpoStructure]);
    Result := MT.AllData;
  end else
    Result := null;
end;}

function TransfTable(MT: TkbmMemTable; Nome: String): Variant;
var F : TField;
begin
  TabLocal.First;
  lbTabela.Caption := 'Preparando Tabela: ' + Nome + ' ...';
  Progresso.Position := Progresso.Position + 1;
  Application.ProcessMessages;
  
  if TabLocal.RecordCount>0 then begin
    MT.CreateTableAs(TabLocal, [mtcpoStructure]);
    MT.Active := True;
    while (not TabLocal.Eof) do begin
      TransfRegistro(TabLocal, MT);
      F := TabLocal.FindField('ExcluirServ');
      if (F<>nil) and (F.AsBoolean=True) then
        TabLocal.Delete
      else begin  
        TabLocal.Edit;
        F := TabLocal.FindField('OnServ');
        if F<>nil then F.AsBoolean := True;
        TabLocal.FieldByName('Sync').AsBoolean := False;
        F := TabLocal.FindField('SyncSug');
        if F<>nil then F.AsBoolean := False;
        TabLocal.Post;
      end;  
//      TabLocal.First;
    end;

    Result := MT.AllData;
  end else
    Result := null;
end;


begin
  lbStatus.Font.Color := clBlack;
  if btnUpload.Caption = 'Fechar' then
  begin
    Close;
    Exit;
  end;
  Progresso.Position := 0;
  ApontamentoSemOS;
  lbStatus.Caption := 'Estabelecendo conexão com o servidor ... aguarde';
  lbStatus.Refresh;
  Sincronizando := True;
  for N := 1 to 9 do VarA[N] := null;
  
  try
    DM.nxdb.StartTransaction;
    try
      lbStatus.Caption := 'Enviando dados para o servidor ...';
      TabLocal.Close;
      N := 0;
      for I := 1 to NumTabs do
      if UploadTab[I] then begin
        TabLocal.Close;
        TabAux.Close;
        TabLocal.TableName := NomeTab[I];
        TabLocal.IndexName := 'ISync';
        TabLocal.Filtered := False;
        TabLocal.Filter   := '';
        TabLocal.OnFilterRecord := nil;
        

{        if not UploadSemOS then
        case I of
          idtbOSFase: begin
            TabLocal.Filtered := True;
            TabLocal.Filter   := '(OS > 0)';
            TabLocal.OnFilterRecord := nil;
          end;
          
          idtbOSFaseDesc: begin  
            TabAux.Open;
            TabLocal.Filtered := True;
            TabLocal.Filter   := '';
            TabLocal.OnFilterRecord := TabLocalFilterRecord;
          end;
        end;  }
          
        TabLocal.Open;
        TabLocal.SetRange([True], [True]);
        mtUP.Active := False;
        mtUP.Fields.Clear;
        mtUP.FieldDefs.Clear;
        Inc(N);
        VarA[N] := TransfTable(mtUP, NomeTab[I]);
//        SyncTable;
      end;

      lbTabela.Caption := 'Enviando dados para o servidor...';
      Application.ProcessMessages;
      Ani.Visible := True;
      Ani.Active := True;
      try
        DMSync.AbreSessao;
        V := DMSync.kbmCli.Request('UPLOADSVC', '', 'UPLOAD',  
                                   [IDTecnico, 
                                    SenhaTec, 
                                    cfgVersao,
                                    VarA[1], 
                                    VarA[2], 
                                    VarA[3],
                                    VarA[4], 
                                    VarA[5], 
                                    VarA[6],
                                    VarA[7], 
                                    VarA[8], 
                                    VarA[9]]);
      finally
        Ani.Visible := False;
        Ani.Active := False;
      end;                                
                                  
      Progresso.Position := Progresso.Position + 1;                            
                                  
      if (VarType(V)=varString) or (VarType(V)=varOleStr) then
        Raise Exception.Create(V);

      if ((VarType(V) and varArray) = varArray) and ((VarType(V) and varVariant) = varVariant) then begin
        mtLog.AllData := V[0];
        Beep;
        Alerta := V[1];
      end else begin
        mtLog.AllData := V;
        Alerta := '';
      end;

      mtLog.Active := True;
      TabLocal.Active := False;
      TabLocal.TableName := 'Log';
      TabLocal.IndexName := '';
      TabLocal.Active := True;
      mtLog.First;
      while not mtLog.Eof do begin
        TransfRegistro(mtLog, TabLocal);
        mtLog.Next;
      end;  

      DM.nxdb.Commit;
      UploadOk := True;
      if Alerta='' then begin
        ShowMessage('Dados enviados com sucesso!');
        lbStatus.Caption := 'Dados enviados com sucesso!';
      end else begin
        ShowMessage('Dados enviados com sucesso. ' + Alerta);
        lbStatus.Caption := 'Dados enviados com sucesso. ' + Alerta;
      end;
      lbStatus.Font.Color := clgreen;
    except;
      lbStatus.Font.Color := clRed;
      lbStatus.Caption := 'Falha no enviou de dados!';
      try
        if TabLocal.Active then TabLocal.Cancel;
      except
      end;
      DM.nxdb.Rollback;
      Raise;
    end;
  finally;
    TabLocal.Close;
    TabAux.Close;
    Sincronizando := False;
    btnUpload.Enabled := True;
  end;
  if UploadOk then Close;
  btnUpload.Visible := False;
end;

procedure TFrmUp.FormCreate(Sender: TObject);
begin
  UploadOK := False;
  edServidor.Text := cfgSrv;
  edPorta.Text := IntToStr(cfgPort);
  edPortaHTTP.Text := IntToStr(cfgPortHTTP);
  PreparaTabelas;
end;

procedure TFrmUP.ApontamentoSemOS;
var 
  Existe: Boolean;
  V : Variant;
begin
  TabLocal.Close;
  TabLocal.TableName := 'OSFase';
  TabLocal.IndexName := 'ISync';
  TabLocal.Filtered := True;
  TabLocal.Filter   := '(OS < 0)';
  TabLocal.OnFilterRecord := nil;
  try
    tAuxProj.Open;
    TabLocal.Open;
    TabLocal.SetRange([True], [True]);
    TabLocal.First;
    Existe := False;
    while not TabLocal.Eof do begin
      if DM.tParametroUploadApontamentoSemOs.Value then
      // É permitido o upload sem OS, mas é exibido um alerta
        Existe := True
      else begin 
        // Não é permitido globalmente, checar se o projeto é uma exceção
        V := tAuxProj.Lookup('ID', TabLocal.FieldByName('Projeto').AsString, 'APSemOS');
        if (V=Null) or (not SameText(V, 'S')) then begin
          // Não É uma exceção
          btnUpload.Caption := 'Fechar';
          Raise Exception.Create('Atenção: Existem apontamentos que não foram gerados OS!');
        end;
      end;
    end;
    if Existe then begin
      Beep;
      ShowMessage('Atenção: Existem apontamentos que não foram gerados OS!')
    end;
  finally
    tAuxProj.Active := False;
    TabLocal.Close;
    TabLocal.Filtered := False;
  end;      
end;

procedure TFrmUp.PreparaTabelas;
var I : Integer;
begin
  try
    try
      for I := 1 to NumTabs do 
      if UploadTab[I] and (I<>idtbOSFase) then begin
        TabLocal.Close;
        TabLocal.TableName := NomeTab[I];
        TabLocal.IndexName := 'ISync';
        
        if (I=idtbOSFase) and (not UploadSemOS) then begin
          TabLocal.Filtered := True;
          TabLocal.Filter   := 'OS > 0';
        end else begin
          TabLocal.Filtered := False;
          TabLocal.Filter   := '';
        end;  
        
        TabLocal.Open;
        TabLocal.SetRange([True], [True]);
        if TabLocal.RecordCount > 0 then Exit;
      end;
    finally
      TabLocal.Close;
    end;      
    lbStatus.Caption := 'Não há items a serem sincronizados';
    btnUpload.Caption := 'Fechar';
    btnUpload.Visible := False;
  except
    btnUpload.Caption := 'Fechar';
    btnUpload.Visible := False;
    lbStatus.Caption := 'Falha preparando tabelas para upload';
    Raise;
  end;
end;

procedure TFrmUp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMSync.FechaSessao;
  Action := caFree;
end;

procedure TFrmUp.edPortaChange(Sender: TObject);
begin
  cfgPort := StrToIntDef(edPorta.Text, cfgPort);
end;

procedure TFrmUp.TabLocalFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  with TabLocal do
  Accept := UploadSemOS or (
            TabAux.FindKey([FieldByName('Cliente').AsString,
                            FieldByName('Projeto').AsString,
                            FieldByName('Fase').AsString,
                            FieldByName('Tecnico').AsString,
                            FieldByName('Item').AsInteger]) and
            (TabAuxOS.Value>0));                
end;

procedure TFrmUp.LMDSpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmUp.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  FazUpload;
end;

procedure TFrmUp.edPortaHTTPChange(Sender: TObject);
begin
  cfgPortHTTP := StrToIntDef(edPortaHTTP.Text, cfgPortHTTP);
end;

end.
