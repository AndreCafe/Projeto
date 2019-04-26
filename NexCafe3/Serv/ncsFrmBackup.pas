unit ncsFrmBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, Menus, cxLookAndFeelPainters, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit,
  LMDCustomBrowseEdit, LMDBrowseEdit, StdCtrls, cxButtons, cxProgressBar, nxdb,
  nxllComponent, nxdbBackupController, Buttons, PngSpeedButton, cxGroupBox,
  cxRadioGroup, ExtCtrls, DB, cxPC, LMDSimplePanel, nxsdServerEngine,
  nxsrServerEngine, shellapi,
  nx1xAllEngines, ncClassesBase,
  nxDBBase, LMDCustomComponent, lmdcont, LMDContainerComponent,
  LMDBaseDialog, LMDBrowseDlg, LMDBaseController, LMDCustomContainer,
  LMDGenericList, LMDControl;


type
  TFrmCopia = class(TForm)
    nxBackup: TnxBackupController;
    nxDBO: TnxDatabase;
    nxDBD: TnxDatabase;
    nxSession: TnxSession;
    panPri: TPanel;
    T: TnxTable;
    Paginas: TcxPageControl;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    PagCorrigir: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxLabel2: TcxLabel;
    cxTabSheet2: TcxTabSheet;
    pbC: TcxProgressBar;
    lbCorr: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    btnCorrigir: TPngSpeedButton;
    LMDSimplePanel3: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    LMDSimplePanel8: TLMDSimplePanel;
    PagMigrar: TcxPageControl;
    cxTabSheet8: TcxTabSheet;
    cxTabSheet9: TcxTabSheet;
    LMDSimplePanel9: TLMDSimplePanel;
    PngSpeedButton2: TPngSpeedButton;
    cxLabel8: TcxLabel;
    LMDSimplePanel11: TLMDSimplePanel;
    cxLabel3: TcxLabel;
    LMDSimplePanel13: TLMDSimplePanel;
    PagImp: TcxPageControl;
    cxTabSheet6: TcxTabSheet;
    LMDSimplePanel12: TLMDSimplePanel;
    LMDSimplePanel1: TLMDSimplePanel;
    btnImportar: TPngSpeedButton;
    cxLabel4: TcxLabel;
    LMDSimplePanel6: TLMDSimplePanel;
    cxLabel9: TcxLabel;
    cxTabSheet7: TcxTabSheet;
    pbI: TcxProgressBar;
    lbImp: TcxLabel;
    GL: TLMDGenericList;
    Timer1: TTimer;
    LMDSimplePanel4: TLMDSimplePanel;
    btnBackup: TPngSpeedButton;
    cxLabel1: TcxLabel;
    edBackupDir: TLMDBrowseEdit;
    PB: TcxProgressBar;
    lbProgresso: TcxLabel;
    tsRestaurar: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    LMDSimplePanel5: TLMDSimplePanel;
    btnRestaurar: TPngSpeedButton;
    pbR: TcxProgressBar;
    lbRest: TcxLabel;
    PathDlg: TLMDBrowseDlg;
    procedure nxBackupTableProgress(aSender: TnxBackupController;
      aPercentDone: Integer);
    procedure nxBackupOverwriteTable(aSender: TnxBackupController;
      const aTableName: string; var aUseTable: Boolean);
    procedure nxBackupIncludeTable(aSender: TnxBackupController;
      const aTableName: string; var aUseTable: Boolean);
    procedure nxBackupAfterTableOpen(aSender: TnxBackupController;
      aTable: TnxTable; aIsSource: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
    procedure btnCorrigirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnRestaurarClick(Sender: TObject);
  private
    slArqs : TStrings;
    { Private declarations }
    procedure FazBackup;
    procedure InativaServidor;
    procedure AtivaServidor;
    procedure RecuperaDados;
    procedure Importar;
    procedure ApagarNX1;
    procedure CopiaDados(aSufix: String);
    procedure Restaurar(aTabs: TStrings);
    procedure Andamento(TableName: String; Maximo, Posicao: Integer);
    procedure EliminaItensDup;
  public
    { Public declarations }
  end;

var
  FrmCopia: TFrmCopia;

implementation

uses ncServBD, ncsFrmPri, ncDMServ, ncImpCM, ncEstruturaTabs, WindowList;

{$R *.dfm}

procedure TFrmCopia.Andamento(TableName: String; Maximo, Posicao: Integer);
begin
  if Posicao=1 then begin
    pbI.Properties.Max := Maximo;
    pbI.Position := 1;
    lbImp.Caption := 'Importando arquivo ' + TableName + ' ... ';
  end else begin
    pbI.Position := Posicao;
    if (Posicao mod 5) = 0  then
      Application.ProcessMessages;
  end;
end;

procedure TFrmCopia.ApagarNX1;
var 
  SR : TSearchRec;
  S: String;
begin
  S := ExtractFilePath(ParamStr(0))+'dados\';
  if FindFirst(S+'*.nx1', SysUtils.faAnyFile, SR) = 0 then
  try
    repeat
      Windows.DeleteFile(PChar(S+SR.Name));
    until FindNext(SR)<>0;
  finally
    FindClose(SR);
  end;
end;

procedure TFrmCopia.AtivaServidor;
begin
  FrmPri.Ativar;
end;

procedure TFrmCopia.btnBackupClick(Sender: TObject);
var S: String;
begin
  if Trim(edBackupDir.Text)='' then
    Raise Exception.Create('A pasta destino tem que ser informada');

  S := edBackupDir.Text;
  if Copy(S, Length(S), 1)<>'\' then
    S := S + '\';

  nxDBD.AliasPath := S + FormatDateTime('yyyymmdd_hhmm', Now);
  FazBackup;
end;

procedure TFrmCopia.FazBackup;
begin
  btnBackup.Enabled := False;
  PB.Visible := True;
  lbProgresso.Visible := True;
  edBackupDir.Enabled := False;
  try
    nxSession.ServerEngine := dmServidorBD.ServerEngine;
    nxSession.Active := True;
    if not DirectoryExists(nxDBD.AliasPath) then
      MkDir(nxDBD.AliasPath);
    nxDBO.Active := True;
    nxDBD.Active := True;
    nxBackup.Backup;
    ShowMessage('Backup realizado com sucesso!');
  finally
    edBackupDir.Enabled := True;
    PB.Visible := False;
    lbProgresso.Visible := False;
    nxSession.Active := False;
    btnBackup.Enabled := True;
  end;
end;

procedure TFrmCopia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCopia.FormCreate(Sender: TObject);
begin
  PagMigrar.ActivePageIndex := 0;
  Paginas.HideTabs := True;
  edBackupDir.Path := ExtractFilePath(ParamStr(0)) + 'Copia';
  PagCorrigir.HideTabs := True;
  PagCorrigir.ActivePageIndex := 0;
  PagImp.HideTabs := True;
  PagImp.ActivePageIndex := 0;
  slArqs := TStringList.Create;
end;

procedure TFrmCopia.FormDestroy(Sender: TObject);
begin
  slArqs.Free;
end;

procedure TFrmCopia.Importar;
begin
end;

procedure TFrmCopia.InativaServidor;
begin
  FrmPri.Desativar;
end;

procedure TFrmCopia.nxBackupAfterTableOpen(aSender: TnxBackupController;
  aTable: TnxTable; aIsSource: Boolean);
begin
  Application.ProcessMessages;
  lbProgresso.Caption := aTable.TableName;
  PB.Position := 0;
end;

procedure TFrmCopia.nxBackupIncludeTable(aSender: TnxBackupController;
  const aTableName: string; var aUseTable: Boolean);
begin
  aUseTable := True;
end;

procedure TFrmCopia.nxBackupOverwriteTable(aSender: TnxBackupController;
  const aTableName: string; var aUseTable: Boolean);
begin
  aUseTable := True;
end;

procedure TFrmCopia.nxBackupTableProgress(aSender: TnxBackupController;
  aPercentDone: Integer);
begin
  Application.ProcessMessages;
  PB.Position := aPercentDone;
end;

function RemoteGetCmdLine(buffer: pchar) : dword; stdcall;
begin
  result := 0;
  // let's copy the command line of the current process to the specified buffer
  lstrcpyA(buffer, GetCommandLine);
end;

function RemoteExit(buffer: pchar) : dword; stdcall;
begin
  result := 0;
  ExitProcess(0);
end;

function FiltraQuotes(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
    if S[I] <> '"' then Result := Result + S[I];
end;

procedure TFrmCopia.PngSpeedButton1Click(Sender: TObject);
var 
  wnd: dword;
  str: String;
begin
  if MessageDlg('Deseja realmente migrar as máquinas clientes para o NexCafé ?', mtConfirmation, [mbYes, mbNo], 0, mbNo)<>mrYes then Exit;
  if MessageDlg('Depois de migrar, caso queira voltar atrás será necessário desinstalar o NexGuard e re-instalar o '+
                'CM-Guard em cada máquina cliente da loja. Deseja realmente migrar agora ?', 
                mtConfirmation, [mbYes, mbNo], 0, mbNo)<>mrYes then Exit;
                
  // first we ask the taskbar's window handle and the corresponding process ID
  wnd := FindWindow('CMServComunicacao', '');

  if wnd=0 then
    Raise Exception.Create('É necessário estar com o servidor do Cyber Manager (CM-Server) em executação nessa máquina para realizar essa operação.');

  str := ExtractFilePath(ParamStr(0)) + 'MigraGuard.exe';
  GL[0].SaveToFile(str);
  ShellExecute(0, 'open', pchar(str), '', '', SW_NORMAL);
  Timer1.Enabled := True;
  ShowMessage('Pronto ! em mais alguns instantes as máquinas clientes estarão atualizadas para o NexCafé. '+
              'Se tiver alguma máquina desligada é necessário ligar');
end;


procedure TFrmCopia.RecuperaDados;
var
  SE: TnxServerEngine;
  DB: TnxDatabase;
  SS: TnxSession;
  I: Integer;
  S: String;
begin
  SE := TnxServerEngine.Create(Self);
  SS := TnxSession.Create(Self);
  DB := TnxDatabase.Create(Self);
  try
    lbCorr.Caption := 'Iniciando banco de dados ...';
    Application.ProcessMessages;
    SS.ServerEngine := SE;
    SS.Username := SessionUser;
    SS.Password := SessionPass;
    DB.Session := SS;
    SE.TempStoreSize := 200;
    SE.TempStorePath := ExtractFilePath(ParamStr(0))+'Temp';
    SE.Active := True;
    SS.Active := True;
    DB.AliasPath := ExtractFilePath(ParamStr(0))+'Dados';
    DB.Exclusive := True;
    DB.Active := True;
    pbC.Position := 0;
    for I := 0 to slArqs.Count - 1 do begin
      lbCorr.Caption := 'Corrigindo arquivo ' + ExtractFileName(slArqs[I]) +' . Aguarde ... ';
      pbC.Position := pbC.Position + 1;
      Application.ProcessMessages;
      Application.ProcessMessages;
      S := ExtractFileName(slArqs[I]);
      Delete(S, Pos('.', S), 4);
      DB.RecoverTable(S);
      Sleep(100);
    end;
    DB.Active := False;
    SS.Active := False;
    SE.Active := False;
    pbC.Position := 0;
    for I := 0 to slArqs.Count - 1 do begin
      lbCorr.Caption := 'Renomeando arquivo ' + ExtractFileName(slArqs[I]) +' . Aguarde ... ';
      pbC.Position := pbC.Position + 1;
      Application.ProcessMessages;
      Application.ProcessMessages;
      S := slArqs[I];
      Delete(S, Pos('.', S), 10);
      if FileExists(S+'_Failed.nx1') and 
         FileExists(S+'_Recovered.nx1') then 
      begin
        Windows.DeleteFile(PChar(S+'_Failed.nx1'));
        Windows.DeleteFile(PChar(slArqs[I]));
        RenameFile(S+'_Recovered.nx1', slArqs[I]);
      end else
        Windows.DeleteFile(PChar(slArqs[I]));
      
      Sleep(100);
    end;
    lbCorr.Caption := 'Arquivos Corrigidos com Sucesso ...';
  finally
    DB.Free;
    SS.Free;
    SE.Free;
  end;
end;

procedure TFrmCopia.Restaurar(aTabs: TStrings);
var 
  I : Integer;
  sTo, S : String;
begin
  sTo := ExtractFilePath(ParamStr(0)) + 'Dados\';
  if not DirectoryExists(sTo) then
    MkDir(sTo);
    
  pbR.Properties.Max := aTabs.Count;
  pbR.Properties.Max := pbR.Properties.Max;
  pbR.Position := 0;
  Application.ProcessMessages;
  
  for I := 0 to aTabs.Count-1 do begin
    lbRest.Caption := 'Restaurando arquivo ' + ExtractFileName(slArqs[I]) + ' ...';
    pbR.Position := pbR.Position + 1;
    Application.ProcessMessages;
    Application.ProcessMessages;
    Application.ProcessMessages;
    Application.ProcessMessages;
    S := sTo+ExtractFileName(aTabs[I]);
    if not CopyFile(PChar(aTabs[I]), PChar(S), False) then
      Raise Exception.Create('Erro n.'+IntToStr(GetLastError)+' copiando arquivo ' + aTabs[I] + ' para ' + S);
    Sleep(100);      
  end;
end;

procedure TFrmCopia.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  try
    DeleteFile(ExtractFilePath(ParamStr(0)) + 'MigraGuard.exe');
  except
  end;
end;

procedure TFrmCopia.btnCorrigirClick(Sender: TObject);
var SIndex : String;

procedure CorrigeIntegridade;
begin
  DM.CorrigeTemposOcupacao;
  DM.qAux.SQL.Text := 'delete from itran where not tran in (select id from tran)';
  DM.qAux.ExecSQL;
  DM.qAux.Active := False;
      
  InitTran(DM.nxDB, [], False);
  with DM do
  try
    qAux.SQL.Text := 'SELECT I.*, T.Caixa as TranCai FROM ITran I, Tran T '+
                     'where (T.ID=I.Tran) and (T.Caixa <> I.Caixa)';
    qAux.Active := True;
    qAux.First;
    SIndex := tITran.IndexName;
    try
      tITran.IndexName := 'IID';
      while not qAux.Eof do begin
        if tITran.FindKey([qAux.FieldByName('ID').AsInteger]) then
          tITran.Delete;
        qAux.Next;  
      end;
    finally
      tITran.IndexName := SIndex;
    end;
    EliminaItensDup;
    if nxDB.InTransaction then
      nxDB.Commit;
  finally
    if nxDB.InTransaction then
      nxDB.Rollback;
    qAux.Active := False;  
  end;
end;

begin
  if MessageDlg('Deseja corrigir o banco de dados do NexCafé ?', mtConfirmation, [mbYes, mbNo], 0, mbNo)<>mrYes then Exit;
  if MessageDlg('Essa operação pode demorar bastante. Deseja realmente realiza-la agora?', 
                mtConfirmation, [mbYes, mbNo], 0, mbNo)<>mrYes then Exit;

  btnCorrigir.Enabled := False;
  FrmPri.SB.Enabled := False;
  PagCorrigir.ActivePageIndex := 1;
  try
    FrmPri.Desativar;
    try
      CopiaDados('_correcao');
      RecuperaDados;
    finally
      FrmPri.Ativar;
      if FrmPri.Serv.Ativo then begin
        DM.ReprocessaDebitos;
        DM.RetotalizaPassaportes;
        CorrigeIntegridade;
      end;
    end;
    ShowMessage('Fim do processo de correção de arquivos');
  finally
    FrmPri.SB.Enabled := True;
    btnCorrigir.Enabled := True;
    PagCorrigir.ActivePageIndex := 0;
  end;
end;

procedure TFrmCopia.btnImportarClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente importar os dados do Cyber Manager ?', mtConfirmation, [mbYes, mbNo], 0, mbNo)<>mrYes then Exit;
  if MessageDlg('Os dados atuais do NexCafé serão substituídos pelos dados contidos no Cyber Manager. Confirma importação ?', 
                mtConfirmation, [mbYes, mbNo], 0, mbNo)<>mrYes then Exit;
  
  InativaServidor;
  try
    FrmPri.AjustaIconeTray;
    dmServidorBD := TdmServidorBD.Create(nil);
    try
      dmCM := TdmCM.Create(Self);
      try
        try
          dmCM.OpenConn;
        except
          raise Exception.Create('Não foi possivel conectar ao Cyber Manager. Certifique-se que o CM-Server esteja ativado');
        end;

        try
          dmCM.Open;
        except
          on E: Exception do begin
            raise Exception.Create(
              'Erro ao tentar abrir arquivos do Cyber Manager: "' + E.Message + '"' + sLineBreak+sLineBreak +
              'A importação de dados somente pode ser realizada a partir da versão 1.9.9.23 do Cyber Manager. '+
              'Caso esteja executando uma versão mais antiga será necessário atualizar o Cyber Manager');
          end;
        end;
        
        btnImportar.Enabled := False;
        FrmPri.SB.Enabled := False;
        PagImp.ActivePageIndex := 1;
        try
          CopiaDados('_imp');
          ApagarNX1;
          dmCM.EvAndamento := Andamento;
          DM := TDM.Create(Self);
          try
            DM.nxSession.ServerEngine := dmServidorBD.ServerEngine;
            DM.Open(True);
            dmCM.Importa;
          finally
            FreeAndNil(DM);
          end;
          ShowMessage('Arquivos importados com sucesso!');
        finally
          FrmPri.SB.Enabled := True;
          btnImportar.Enabled := True;
          PagImp.ActivePageIndex := 0;
        end;
      finally
        FreeAndNil(dmCM);
      end;
    finally
      FreeAndNil(dmServidorBD);
    end;
  finally
    AtivaServidor;
    FrmPri.AjustaIconeTray;
  end;  
end;

procedure TFrmCopia.btnRestaurarClick(Sender: TObject);
var 
  S, S2: String;
  SL: TStringList;
  I: Integer;
begin
  if (not PathDlg.Execute) or (Trim(PathDlg.SelectedFolder)='') then Exit;

  S := PathDlg.SelectedFolder;
  if S[Length(S)]<>'\' then S:=S+'\';

  S2 := ExtractFilePath(ParamStr(0))+'Dados\';
  
  if SameText(S, S2) then 
    Raise Exception.Create('Você informou a pasta errada. Você informou a pasta de dados do NexCafé. É necessário informar a pasta que contém sua CÓPIA de dados');

  SL := TStringList.Create;
  try
    NexcafeGetTableNames(SL);
    
    for I := SL.Count-1 downto 0 do begin
      SL[i] := S+SL[i]+'.nx1';
      if not FileExists(SL[i]) then SL.Delete(I);
    end;
    
    if SL.Count=0 then
      Raise Exception.Create('Não foi encontrado nenhum arquivo de banco de dados do NexCafé na pasta informada. Informe novamente o local. Se tiver em uma sub-pasta é necessário seleciona-la');

    btnRestaurar.Enabled := False;
    FrmPri.SB.Enabled := False;
    try
      lbRest.Visible := True;
      pbR.Visible := True;
      FrmPri.Desativar;
      try
        CopiaDados('_restaurar');
        ApagarNX1;
        Restaurar(SL);
      finally
        FrmPri.Ativar;
      end;
      ShowMessage('Arquivos restaurados com sucesso!');
    finally
      FrmPri.SB.Enabled := True;
      btnRestaurar.Enabled := True;
      lbRest.Visible := False;
      pbR.Visible := False;
    end;
  finally
    SL.Free;
  end;
end;

procedure TFrmCopia.CopiaDados(aSufix: String);
var 
  I : Integer;
  SR : TSearchRec;
  sFrom, sTo, S : String;
begin
  slArqs.Clear;
  
  sTo := ExtractFilePath(ParamStr(0)) + 'Copia\'+ FormatDateTime('yyyymmdd_hhmm', Now) + aSufix;
  if not DirectoryExists(sFrom) then
    MkDir(sTo);
    
  sFrom := ExtractFilePath(ParamStr(0)) + 'Dados';
  
  if FindFirst(sFrom+'\*.nx1', faAnyFile, SR) = 0 then
  try
    repeat
      if (Pos('_Failed', SR.Name)=0) and (Pos('_Recovered', SR.Name)=0) then
        slArqs.Add(sFrom+'\'+ExtractFileName(SR.Name));
    until FindNext(SR)<>0;
  finally
    FindClose(SR);
  end;
  
  pbC.Properties.Max := slArqs.Count;
  pbI.Properties.Max := pbC.Properties.Max;
  pbR.Properties.Max := pbC.Properties.Max;
  for I := 0 to slArqs.Count-1 do begin
    lbCorr.Caption := 'Copiando arquivo ' + ExtractFileName(slArqs[I]) + ' ...';
    lbImp.Caption := lbCorr.Caption;
    lbRest.Caption := lbCorr.Caption;
    pbC.Position := pbC.Position + 1;
    pbI.Position := pbC.Position;
    pbR.Position := pbC.Position;
    Application.ProcessMessages;
    Application.ProcessMessages;
    Application.ProcessMessages;
    Application.ProcessMessages;
    S := sTo+'\'+ExtractFileName(slArqs[I]);
    if not CopyFile(PChar(slArqs[I]), PChar(S), False) then
      Raise Exception.Create('Erro n.'+IntToStr(GetLastError)+' copiando arquivo ' + slArqs[I] + ' para ' + S);
    Sleep(100);      
  end;
end;

procedure TFrmCopia.EliminaItensDup;
var 
  SIndex : String;
  UItemID,
  UTipoItem,
  UTran,
  UID : Integer;
begin
  with DM do begin
    SIndex := tITran.IndexName;
    try
      tITran.IndexName := 'ITipoItemTran';
      UItemID := 0;
      UTipoItem := 0;
      UTran := 0;
      UID := 0;
      lbCorr.Caption := 'Checando integridade do banco de dados...';
      tITran.First;
      pbC.Properties.Max := tITran.RecordCount;
      pbC.Position := 0;
      while (not tITran.Eof) and (UID<>tITranID.Value) do begin
        UID := tITranID.Value;
        if (tITranTran.Value=UTran) and
           (tITranTipoItem.Value=UTipoItem) and
           (tITranItemID.Value=UItemID) then
          tITran.Delete else
        begin
          UItemID := tITranItemID.Value;
          UTipoItem := tITranTipoItem.Value;
          UTran := tITranTran.Value;
          tITran.Next;
        end;   
        pbC.Position := pbC.Position + 1;
        Application.ProcessMessages;
      end;
      lbCorr.Caption := 'Banco de dados corrigido com sucesso...';
    finally
      tITran.IndexName := SIndex;
    end;
  end;
end;

end.
