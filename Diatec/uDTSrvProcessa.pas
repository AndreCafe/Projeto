unit uDTSrvProcessa;

interface

uses
  Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, 
  nxllConst, nxllTypes, nxdbBase, nxdb, Db, ExtCtrls, uDTSyncDef, FileCtrl,
  nxllComponent, dbf,uDTSrvBDServ;

type
  TDMProc = class(TDataModule)
    dbDown: TnxDatabase;
    Timer1: TTimer;
    Tab: TnxTable;
    qDup: TnxQuery;
    dbTemp: TnxDatabase;
    nxSession: TnxSession;
    dbLog: TnxDatabase;
    tLog: TnxTable;
    dbUpload: TnxDatabase;
    tLiberado: TDbf;
    dbfTab: TDbf;
    TabU: TnxTable;
    tLiberadoTABELA: TStringField;
    tLiberadoMSGERR: TStringField;
    tLiberadoDT_HOR: TStringField;
    procedure Timer1Timer(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    LI : TLogInfo;

    FArq : TextFile;
    FPastaCopiaUpload : String;
    { Private declarations }
    function DadosOK(T: TDataset): Boolean;
    procedure LogErro(S: String);
    procedure LogErroDataset(S: String; D: TDataset; F: TField);

    procedure ImportaDownOkFalse(DBDest: TnxDatabase; LogIDMin: Cardinal);
    
  public
    procedure ExportaDBF;
    procedure ImportaDBF;
    procedure ImpUpload;
    procedure MoveTabelasTemp;
    procedure ApagaTabelasTemp;
    procedure Debug(S: String);
    { Public declarations }
  end;

  procedure TransfDados(F, D: TDataset);


var
  DMProc: TDMProc;
  NumExp : Integer;

const
  TableID : Integer = 0;  

implementation

uses uDTTabelas, uDTDBFTabs, uChecaTDBF;

{$R *.DFM}

{ TDMProc }

function CorrigeAutoInc(nxTab: TnxTable; MinAutoInc: Integer): Integer;
var
  F : TField;
  I : Integer;

begin
  try
    with nxTab do
    for I := 0 to FieldCount-1 do
    if Fields[I].DataType = ftAutoInc then begin
      try
        nxTab.IndexFieldNames := Fields[I].FieldName;
      except
      end;
      
      if nxTab.RecordCount > 0 then begin
        nxTab.Last;
        if MinAutoInc>Fields[I].AsInteger then
          Result := MinAutoInc + 10
        else
          Result := Fields[I].AsInteger + 1;
      end else
        Result := MinAutoInc+50;
            
      nxTab.SetAutoIncValue(Result);
    end;
  except
  end;
end;

function ZeroEsq(S: String; Tam: Integer): String;
begin
  Result := S;
  while Length(Result)<Tam do Result := '0' + Result;
end;

procedure TransfDados(F, D: TDataset);
var 
  I : Integer;
  AF, CampoErro : TField;
  S: String;
begin
  ShortDateFormat := 'dd/mm/yyyy';
  LongDateFormat  := 'dd/mm/yyyy';
  LongTimeFormat  := 'HH:mm:ss';
  CampoErro := nil;
  D.Append;
  try
    for I := 0 to pred(F.FieldCount) do 
    with F.Fields[I] do
    if FieldKind = fkData then begin
      CampoErro := F.Fields[I];
      AF := D.FindField(FieldName);

      if (AF <> nil) then
      if (UpperCase(FieldName)='ITEM') and (AF.DataType=ftString) then
        AF.AsString := ZeroEsq(AsString, 10)
      else
      if ((UpperCase(FieldName) = 'OS') OR (UpperCase(FieldName)='ID') OR
          (UpperCase(FieldName) = 'ITEM') OR (UpperCase(FieldName)='POS'))
         and (Value=null) then 
      begin
      // isso resolve o misterioso problema do 0 que vira nulo no DBF
        AF.Value := 0;
      end
{      else
      if UpperCase(FieldName)='IDDIATEC' then begin
        AF.AsInteger := Trunc(AsFloat);
        if AF.AsInteger=0 then
          AF.AsInteger := -1;
      end}
      else begin
        if (AF.DataType in [ftDateTime, ftDate, ftTime]) then begin
          if AsString = '' then
            AF.Value := null
          else
            try
              AF.AsDateTime := StrToDateTime(AsString);
            except
              AF.Value := 0;
            end;
        end else
        if (DataType = ftDateTime) then begin
          try
            if IsNull then
              AF.AsString := ''
            else
            if FormatDateTime('yyyymmdd', AsDateTime)>'19000101' then
              AF.AsString := FormatDateTime('dd/mm/yyyy', AsDateTime)
            else
            if FormatDateTime('hh:mm', AsDateTime)>'00:00' then
              AF.AsString := FormatDateTime('hh:mm', AsDateTime)
            else
              AF.AsString := '';  
            if (F is TnxTable) and 
               SameText(TnxTable(F).TableName, 'UOS') and 
               (AF.AsString = '') and (
               SameText(FieldName, 'Inicio') or
               SameText(FieldName, 'Translado') or
               SameText(FieldName, 'Abono') or
               SameText(FieldName, 'Termino'))
            then   
              AF.AsString := '00:00';
          except
            S := FieldName;
            if S='888333' then
              Exit;
            AF.AsString := '';
          end;
        end else
          AF.Value := Value;  
      end;  
    end;  
    AF := D.FindField('DATAPROC');
    if AF<>nil then 
      AF.AsString := FormatDateTime('dd/mm/yyyy hh:mm', Now);
    D.Post;
  except
    on E: Exception do begin
      dmProc.LogErroDataset(E.Message, F, CampoErro);
      Raise;
    end;
  end;    
  Inc(NumExp);
end;

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

function TDMProc.DadosOk(T: TDataset) : Boolean;
begin
  with T do
  case TableID of
    idtbFase : {Fase}
      Result := (FieldByName('CLIENTE').AsString > ' ') and
                (FieldByName('PROJETO').AsString > ' ') and
                (FieldByName('ID').AsString > ' ');

    idtbOS : {OS}
      Result := (FieldByName('CLIENTE').AsString > ' ') and
                (FieldByName('TECNICO').AsString > ' ');

    idtbOSFase, idtbOSFaseDesc : {OSFase}
      Result := (FieldByName('CLIENTE').AsString > ' ') and
                (FieldByName('PROJETO').AsString > ' ') and
                (FieldByName('FASE').AsString > ' ') and
                (FieldByName('TECNICO').AsString > ' ');

  else
    Result := True;
  end;
end;

procedure ExportaTab(F, D: TDataset);
var I : Integer;
begin
  F.First;
  I := 0;
  while not (F.Eof and F.Bof) do begin
    if DMProc.DadosOk(F) then
      TransfDados(F, D);
    F.Edit;
    F.FieldByName('Sync').AsBoolean := False;
    F.Post;
    Inc(I);
    
    if I mod 4 = 0 then begin
      Sleep(1);
//      ProcessMessages;
    end;

    if I > 50000 then begin
      DMProc.Debug('Loop infinito em ExportaTab');
      Break;
    end;
  end;
end;

procedure ImportaTab(F, D: TDataset);
var I : Integer;
begin
  F.First;
  I := 0;
  TnxTable(D).BeginBatchAppend(10*1024*1024);
  while not F.Eof do begin
//    InitTran(dmProc.dbTemp, [TnxTable(D)], True);
    TransfDados(F, D);
    F.Next;
    ProcessMessages;
    Inc(I);
    Sleep(0);
{    if I mod 2 = 0 then
      Sleep(1);}

  {  if I mod 2000 = 0 then
      dmProc.dbTemp.Commit;}
    if I > 300000 then begin
      DMProc.Debug('Loop infinito em ImportaTab');
      Break;
    end;
  end;

  TnxTable(D).EndBatchAppend;

  if dmProc.dbTemp.InTransaction then
    dmProc.dbTemp.Commit;
end;

procedure TDMProc.ExportaDBF;
var
  NomeArq: String;
  I, Erro : Integer;
  ArqF, ArqD : String;
begin
  if Existe(DBFLiberado) then
    NomeArq := DBFLiberado
  else 
  if Existe(DBFUpload) then
    NomeArq := DBFUpload
  else
  if Existe(DBFDiatec) then
    NomeArq := DBFDiatec
  else  
    Exit;

  if Renomeia(NomeArq, DBFDiatec) then begin
    LI.Inicia(iolExportacao);
    Debug('Iniciou');
    try
      if NomeArq = DBFDiatec then NomeArq := DBFLiberado;

      Debug('Apagando arquivos temporários...');

      for I := 1 to NumTabs do
      if ExportarDBF[I] then begin
        ArqD := TempDir+'U'+NomeTab[I]+'.dbf';
        ArqF := CfgDirDBF+'U'+NomeTab[I]+'.dbf';

        if FileExists(ArqD) then
          DeleteFile(ArqD);

        if FileExists(ArqF) then
        if not CopyFile(PChar(ArqF), PChar(ArqD), False) then
          Raise Exception.Create('Erro ('+IntToStr(GetLastError)+') copiando arquivo ' + ArqF + ' para ' + ArqD);
      end;           

      Debug('Criando arquivos temporários...');

      with TdmDBF.Create(nil) do
      try
        ChecaTabelas(TempDir);
      finally
        Free;
      end;  
      
      DBFTab.Active := False;
      DBFTab.FilePath := TempDir;

      Debug('Iniciando transação dbUpload...');
      InitTran(dbUpload, [], False);
      try
        NumExp := 0;
        Tab.Close;
        Tab.Database := dbUpload;
        Tab.Exclusive := False;
        try
          for I := 1 to NumTabs do
          if ExportarDBF[I] then begin
            Tab.TableName := 'U' + NomeTab[I];
            Tab.IndexName := 'ISync';
            DBFTab.TableName := Tab.TableName + '.dbf';
            Tab.Open;
            Tab.SetRange([True], [True]);
            DBFTab.Open;
            TableID := I;
            LI.liDetalhes.Add('Tabela '+Tab.TableName+' - Registros: '+IntToStr(Tab.RecordCount));
            Debug('Exportando tabela '+Tab.TableName);
            ExportaTab(Tab, DBFTab);
            Tab.Close;
            DBFTab.Close;
          end;
        finally
          TableID := 0;
        end;

        for I := 1 to NumTabs do
        if ExportarDBF[I] then begin
          ArqF := TempDir+'U'+NomeTab[I]+'.dbf';
          ArqD := CfgDirDBF+'U'+NomeTab[I]+'.dbf';
          Debug('Movendo tabela temporária '+ArqF+' para '+ArqD);
          if not MoveFileEx(PChar(ArqF), PChar(ArqD),
                            MOVEFILE_COPY_ALLOWED +
                            MOVEFILE_REPLACE_EXISTING)
          then
            Raise Exception.Create('Erro ('+IntToStr(GetLastError)+') movendo arquivo ' + ArqF + ' para ' + ArqD);
          Sleep(5);
        end;

        if NumExp = 0 then begin
          Debug('Nenhum registro foi exportando. Renomeando arquivo de semáfora...');
          Renomeia(DBFDiatec, NomeArq)
          // se nao houve nenhum registro exportado Protheus não tem nada a fazer
        end else begin
          Debug('Sinalizando semáforo como "UPPEND.SEM"');
          Renomeia(DBFDiatec, DBFUpload);
        end;

        Debug('Commit na Transação dbUpload');
        dbupload.Commit;

        Debug('Ajustando número da ultima exportação');
        dmBDServ.UltimoExp := LI.liLogID;
      except
        Debug('Rollback na transação dbUpload');
        dbUpload.Rollback;
        Raise;
      end;
    except
      Debug('Erro ack na transação dbUpload');
      Renomeia(DBFDiatec, NomeArq);
      Raise;
    end;
  end;
  Debug('FIM');
end;

function Pad(S: String; L: Integer): String;
begin
  Result := S;
  while Length(Result)<L do Result := Result + ' ';
end;

procedure TDMProc.MoveTabelasTemp;
var 
  I, Erro : Integer;
  S : String;
begin
  S := DownDir(LI.liLogID);
  if not DirectoryExists(S) then
    MkDir(S);

  Debug('Movendo tabelas internas temporárias...');

  for I := 1 to NumTabs do
  if dbTab[I]=iddbDown then
    if not MoveFileEx(PChar(TempDir+NomeTab[I]+'.nx1'), 
                      PChar(S+'\'+NomeTab[I]+'.nx1'), 
                      MOVEFILE_REPLACE_EXISTING + 
                      MOVEFILE_COPY_ALLOWED) then
      Raise Exception.Create('Erro ('+IntToStr(GetLastError)+ ') movendo arquivos temporários de ' + 
                             TempDir + ' para '+ S);
end;

procedure TDMProc.ApagaTabelasTemp;
var I : Integer;
begin
  Debug('Apagando tabelas internas temporárias...');
  for I := 1 to NumTabs do
  if ExisteTemp(NomeTab[I]+'.nx1') then
  try
    SysUtils.DeleteFile(TempDir+NomeTab[I]+'.nx1');
  except
  end; 
  SetLastError(0);
end;

function ObtemNomeIndicePrim(idTab: Integer): String;
begin
  case idTab of
    idtbOS         : Result := 'IID';
    idtbOSFase     : Result := 'IProjFase';
    idtbOSFaseDesc : Result := 'IChave';
  else
    Result := '';  
  end;
end;

function AchaIndicePrim(idTab: Integer; TF, TD: TnxTable): Boolean;
begin
  case idTab of
    idtbOS         : Result := TD.FindKey([TF.FieldByName('Cliente').AsString,
                                           TF.FieldByName('Tecnico').AsString,
                                           TF.FieldByName('Data').AsDateTime,
                                           TF.FieldByName('ID').AsInteger]);

    idtbOSFase     : Result := TD.FindKey([TF.FieldByName('Cliente').AsString,
                                           TF.FieldByName('Projeto').AsString,
                                           TF.FieldByName('Fase').AsString,
                                           TF.FieldByName('Tecnico').AsString,
                                           TF.FieldByName('Item').AsInteger]);

    idtbOSFaseDesc : Result := TD.FindKey([TF.FieldByName('Cliente').AsString,
                                           TF.FieldByName('Projeto').AsString,
                                           TF.FieldByName('Fase').AsString,
                                           TF.FieldByName('Tecnico').AsString,
                                           TF.FieldByName('Item').AsInteger,
                                           TF.FieldByName('Pos').AsInteger]);


  else
    Result := False;
  end;
end;

function ObtemStrChaves(idTab: Integer; TF: TDataset): String;
begin
  case idTab of
    idtbOS         : Result := 'Cliente = ' + TF.FieldByName('Cliente').AsString + sLineBreak +
                               'Tecnico = ' + TF.FieldByName('Tecnico').AsString + sLineBreak +
                               'Data    = ' + TF.FieldByName('Data').AsString + sLineBreak +
                               'ID      = ' + TF.FieldByName('ID').AsString;

    idtbOSFase     : Result := 'Cliente = ' + TF.FieldByName('Cliente').AsString + sLineBreak +
                               'Projeto = ' + TF.FieldByName('Projeto').AsString + sLineBreak +
                               'Fase    = ' + TF.FieldByName('Fase').AsString + sLineBreak +
                               'Tecnico = ' + TF.FieldByName('Tecnico').AsString + sLineBreak +
                               'Item    = ' + TF.FieldByName('Item').AsString;

    idtbOSFaseDesc : Result := 'Cliente = ' + TF.FieldByName('Cliente').AsString + sLineBreak +
                               'Projeto = ' + TF.FieldByName('Projeto').AsString + sLineBreak +
                               'Fase    = ' + TF.FieldByName('Fase').AsString + sLineBreak +
                               'Tecnico = ' + TF.FieldByName('Tecnico').AsString + sLineBreak +
                               'Item    = ' + TF.FieldByName('Item').AsString + sLineBreak +
                               'Pos     = ' + TF.FieldByName('Pos').AsString;


  else
    Result := '';
  end;
end;



procedure TransfnxDados(F, D: TDataset; LI: TLogInfo = nil; NomeTab: String = '');
var 
  I : Integer;
  C : TField;

function ValueToString(V: Variant): String;
begin
  if V = Null then
    Result := 'NULL' else
    Result := V;
end;

begin
  D.Insert;
  for I := 0 to D.FieldCount-1 do with D.Fields[I] do begin
    C := F.FindField(FieldName);
    try
      if C <> nil then
        Value := C.Value;
    except 
      on E: Exception do
      if LI<>nil then begin
        LI.liDetalhes.Add('');
        LI.liDetalhes.Add('Erro transferindo campo ' + FieldName + ' da tabela ' + NomeTab);
        LI.liDetalhes.Add('Erro = ' + E.Message);
        LI.liDetalhes.Add('Valor do Campo = ' + C.AsString);
        Raise;
      end;
    end;
  end;
  D.Post;
end;
  
procedure TDMProc.ImportaDownOkFalse(DBDest: TnxDatabase; LogIDMin: Cardinal);
var
  I : Integer;
  Registros : Integer;
  S : String;
  B : TBookmark;
  Sair : Boolean;
  Cnt: Integer;
begin
  TabU.Active := False;
  TabU.Database := dbUpload;
  Tab.Active := False;
  Tab.Exclusive := False;
  Tab.Database := DBDest;
  for I := 1 to NumTabs do begin
    S := ObtemNomeIndicePrim(I);
    if S>'' then begin
      TabU.Active := False;
      TabU.TableName := 'U'+NomeTab[I];
      TabU.IndexName := 'IDownOk';
      Tab.Active := False;
      Tab.TableName := NomeTab[I];
      Tab.IndexName := S;
      Tab.Open;
      TabU.Open;
      if LogIDMin=0 then
        TabU.SetRange([False], [False])
      else
        TabU.SetRange([False, LogIDMin], [False, High(Integer)]);

      Debug('Importando uploads não conciliados da tabela ' + NomeTab[I]);


      TabU.First;
      Sair := False;
      Registros := 0;
      Cnt := 0;
      while (not Sair) and (not TabU.Eof) do begin
        if AchaIndicePrim(I, TabU, Tab) then begin
          if LogIDMin=0 then begin
            B := TabU.GetBookmark;
            try
              TabU.Next;
              Sair := TabU.Eof;
              TabU.GotoBookmark(B);
              TabU.Edit;
              TabU.FieldByName('DownOk').AsBoolean := True;
              TabU.Post;
            finally
              TabU.FreeBookmark(B);
            end;
          end else
            TabU.Next;

          with TabU.FieldByName('LogID') do
          if AsInteger > LI.liUUploadImp then
            LI.liUUploadImp := AsInteger;
        end else
        begin
          if DBDest=dbTemp then
            InitTran(dbTemp, [Tab], True);
          try  
            TransfnxDados(TabU, Tab, LI, TabU.TableName);
          except
            LI.liDetalhes.Add('');
            LI.liDetalhes.Add('Chaves do Registro que falhou: ');
            LI.liDetalhes.Add(ObtemStrChaves(I, TabU));
            Raise;
          end;
          Inc(Registros);
          if DBDest=dbTemp then
            if Registros mod 2000 = 0 then
              dbTemp.Commit;
          with TabU.FieldByName('LogID')do
          if AsInteger > LI.liUUploadImp then
            LI.liUUploadImp := AsInteger;

          TabU.Next;
        end;
        Sleep(0);
        ProcessMessages;
        Inc(Cnt);
        if Cnt>250000 then begin
          Debug('Loop infinito em ImportaDownOkFalse');
          Break;
        end;
      end;
      if (LogIDMin>0) and (Registros>0) then begin
        LI.liDetalhes.Add('Tabela '+NomeTab[I]+' - '+IntToStr(Registros)+ ' registro(s)');
      end;
    end;
  end;   
  Tab.Active := False;
  TabU.Active := False; 
end;

procedure TDMProc.ImpUpload;
var 
  UImp, U, I : Cardinal;
begin
  UImp := dmBDServ.UltimoImp;
  U    := dmBDServ.UltimoUp;
  LI.Inicia(iolImpUpload);
  Debug('Iniciou');
  tLog.Active := True;

  if not tLog.FindKey([UImp]) then
    Raise Exception.Create('Log de importação '+IntToStr(UImp)+' não foi encontrado');


  Debug('Abrindo database ...');

  dbDown.Active := False;
  dbDown.AliasPath := DownDir(dmBDServ.UltimoImp);
  dbDown.Active := True;
  dbUpload.Active := True;

  Debug('Iniciando transação dbDown');

  InitTran(dbDown, [], False);
  try
    Debug('Obtendo número da ultima conciliação realizada');
    I := dmBDServ.UltimoUpImp;
    if I=0 then I := 1;
    Debug('Iniciando conciliação...');
    ImportaDownOkFalse(dbDown, I);
    Debug('Commit na transação dbDown');
    dbDown.Commit;
  except
    Debug('Rollback em dbDown');
    dbDown.Rollback;
    Raise;
  end;
  LI.liUUploadImp := U;

  Debug('Gravando UUpload');
  if tLog.FindKey([UImp]) then begin
    try
      InitTran(dbLog, [tLog], True);
      try
        tLog.Edit;
        tLog.FieldByName('UUpload').AsInteger := LI.liUUploadImp;
        tLog.Post;
        dbLog.Commit;
      except
        dbLog.Rollback;
        if tLog.State=dsEdit then
          tLog.Cancel;
        Raise;  
      end;
    except
    end;  
  end;

  Debug('Gravando dmBDServ.UltimoUpImp');
  dmBDServ.UltimoUpImp := LI.liUUploadImp;
end;


procedure TDMProc.ImportaDBF;
var 
  SL : TStringList;
  NomeArq: String;
  I, C, UAutoInc, Cnt : Integer;
  ErroImp: Boolean;
  ArqDup : TextFile;
  CBD: TChecaBD;
begin
  if Existe(DBFDown) then
    NomeArq := DBFDown
  else
    Exit;

  ErroImp := False;

  if Renomeia(NomeArq, DBFDiatec) then begin
    LI.Inicia(iolImportacao);
    Debug('Iniciou');
    try
      DBFTab.Active := False;
      DBFTab.FilePath := cfgDirDbf;
      DBTemp.Active := False;
      Tab.Close;
      Tab.Database := dbTemp;
      ApagaTabelasTemp;
      DBTemp.Open;

      Debug('Criando tabelas internas temporárias...');
      CBD := TChecaBD.Create;
      try
        CBD.Checar(nil, nil, DBTemp, nil);
      finally
        CBD.Free;
      end;

{      Debug('Iniciando transação dbTemp...');
      dbTemp.StartTransaction;}
      try
        Tab.Exclusive := True;
        for I := 1 to NumTabs do
        if ClientTab[I] and ImportarDBF[I] then begin
          Tab.Close;
          Tab.TableName := NomeTab[I];
          Tab.IndexName := '';
          DBFTab.TableName := Tab.TableName + '.dbf';
          Debug('Abrindo tabela '+Tab.TableName+' em modo exclusivo');
          Tab.EmptyTable;
          Tab.Open;
          DBFTab.Open;
          try
            Debug('Importando tabela '+Tab.TableName);
            ImportaTab(DBFTab, Tab);
            LI.liDetalhes.Add(Pad(DBFTab.TableName, 20) + ' - Registros = ' + IntToStr(DBFTab.RecordCount));
          except
            on E: Exception do begin
              ErroImp := True;
              LI.liDetalhes.Add('** Erro ' + E.Message);
              LI.liDetalhes.Add('   Valores dos campos:');
              with Tab do
              for C := 0 to pred(FieldCount) do
                LI.liDetalhes.Add('   '+Fields[C].FieldName+'='+Fields[C].AsString);
              Debug('Sinalizando erro no arquivo de semáforo');
              Renomeia(DBFDiaTec, DBFERR);
              Raise;
            end;
          end;
          Tab.Close;
          DBFTab.Close;
        end;

        Debug('Checando duplicidades...');
        if qDup.Active then qDup.Close;
        qDup.Open;
        try
          if qDup.RecordCount>0 then begin
            if FileExists(cfgDirDBF+cfgArqDup) then
              SysUtils.DeleteFile(cfgDirDBF+cfgArqDup);
          end else begin
            AssignFile(ArqDup, cfgDirDBF+cfgArqDup);
            try
              Rewrite(ArqDup);
              qDup.First;
              Cnt := 0;
              with qDup do
              while not qDup.Eof do begin
                Writeln(ArqDup, 'Cliente: ' + Pad(FieldByName('Cliente').AsString, 6) + '|' +
                                'Tecnico: ' + Pad(FieldByName('Tecnico').AsString, 6) + '|' +
                                'Data: ' + FormatDateTime('dd/mm/yyyy', FieldByName('Data').AsDateTime) + '|' +
                                'ID: ' + Pad(FieldByName('ID').AsString, 6)+ '|' +
                                'Quant: ' + FieldByName('Quant').AsString);
                qDup.Next;
                Sleep(0);
                Inc(Cnt);
                if Cnt>50000 then begin
                  Debug('Loop infinito checando duplicidades');
                  Break;
                end;
              end;
            finally
              CloseFile(ArqDup);
            end;
          end;
        finally
          qDup.Close;
        end;

        ImportaDownOkFalse(dbTemp, 0);

        Debug('Iniciando transação dbUpload');

{        dbUpload.Active := True;
        dbUpload.StartTransaction;}
        try

          for I := 1 to NumTabs do
          if UploadTab[I] or (ClientTab[I] and ImportarDBF[I]) then begin
            Tab.Active := False;
            Tab.Database := dbTemp;
            Tab.TableName := NomeTab[I];
            Tab.IndexName := '';
            if Tab.Exists then begin
              Tab.Open;
              UAutoInc := CorrigeAutoInc(Tab, 0);
              Tab.Close;
            end;
            if (UAutoInc>0) and UploadTab[I] then begin
              Tab.Database := dbUpload;
              Tab.TableName := 'U'+NomeTab[I];
              if Tab.Exists then begin
                Tab.Open;
                CorrigeAutoInc(Tab, UAutoInc);
                Tab.Close;
              end;
            end;  
          end;

{          Debug('Commit em dbTemp');
          dbTemp.Commit;}
          if not DirectoryExists(DownDir(LI.liLogID)) then
            MkDir(DownDir(LI.liLogID));
          dbTemp.Close;
          MoveTabelasTemp;
          Debug('Sinalizando "LIBERADO.SEM"');
          Renomeia(DBFDiatec, DBFLiberado);
          Debug('Commit em dbUpload');
//          dbUpload.Commit;
        except
{          Debug('Rollback em dbUpload');
          dbUpload.Rollback;}
          Raise;
        end;

        if LI.liUUploadImp=0 then
          LI.liUUploadImp := 1;
        LI.liUUploadImp := LI.liLogID;

        Debug('Ajustando dmBDServ.UltimpUpImp'); 
        dmBDServ.UltimoUpImp := LI.liUUploadImp;
        dmBDServ.UltimoImp := LI.liLogID;
      except
        if dbTemp.Active and dbTemp.InTransaction then begin
          Debug('Rollback em dbTemp');
          dbTemp.Rollback;
        end;
          
        Tab.Active := False;
        dbTemp.Active := False;
        ApagaTabelasTemp;
        Raise;
      end;
    except
      on E: Exception do begin
        if not ErroImp then begin
          Debug('Renomeando arquivo semáforo '+E.Message);
          Renomeia(DBFDiatec, NomeArq);
        end;  
        Raise;
      end;
    end;
  end;
  Debug('Final');
end;

procedure TDMProc.Timer1Timer(Sender: TObject);
var O: Integer;
begin
  Timer1.Enabled := False;
  try
    LI.Limpa;
    
    try
     case dmBDServ.GetProxOper of
        iolImportacao : ImportaDBF;
        iolExportacao : ExportaDBF;
        iolImpUpload  : begin
          ImpUpload;
          LI.liSucesso := True;
          LI.Salva(tLog, nil, nil);
          LI.Limpa;
          if dmBDServ.UltimoExp < dmBDServ.UltimoUp then
            ExportaDBF;
        end;
      end;
      LI.liSucesso := True;
    except
      on E: Exception do begin
        if LI.liDetalhes.Count>0 then
          LI.liDetalhes.Add('');
        LI.liDetalhes.Add('Operação NÃO concluída: '+E.Message);
        LI.liSucesso := False;
      end;
    end;
    Tab.Active := False;
    TabU.Active := False;
    dbfTab.Active := False;
    dbTemp.Connected := False;
    dbDown.Connected := False;

    if LI.liLogID>0 then LI.Salva(tLog, nil, nil);
  finally
    LI.Limpa;
    Timer1.Enabled := True;
  end;    
end;

procedure TDMProc.DataModuleCreate(Sender: TObject);
var
  I : Integer; 
  S: String;

function ExisteSemaforo: Boolean;
begin
  Result :=
    Existe(DBFLiberado) or
    Existe(DBFProtheus) or
    Existe(DBFUpload)   or
    Existe(DBFDown)     or
    Existe(DBFDiatec)   or
    Existe(DBFErr);
  Sleep(50);  
end;

begin
  dmProc := Self;
  LI := TLogInfo.Create;
  dbLog.AliasName := NomeAlias(cDiatecLog);
  dbLog.Connected := True;
  
  dbUpload.AliasName := NomeAlias(cDiatecUp);
  dbUpload.Connected := True;

  dbTemp.AliasName := NomeAlias(cDiatecTemp);

  tLiberado.FilePath := cfgDirDbf;
  
  tLog.Open;

  LI.Limpa;

  Debug('Iniciou Servidor Diatec');

  if not (ExisteSemaforo)  and
     not (ExisteSemaforo) and
     not (ExisteSemaforo) and
     not (ExisteSemaforo) and
     not (ExisteSemaforo) then
  begin
    tLiberado.CreateTable;
    tLiberado.Active := False;
  end;

  with TdmDBF.Create(nil) do
  try
    ChecaTabelas(cfgDirDbf);
  finally
    Free;
  end;  

  with TdmDBF.Create(nil) do
  try
    ChecaTabelas(TempDir);
  finally
    Free;
  end;  
  

  Randomize;
  ShortDateFormat := 'dd/mm/yyyy';
  LongTimeFormat  := 'HH:mm:ss';
  S := AppFolder;
  AssignFile(FArq, S+'Erros.TXT');
  try
    Append(FArq);
  except
    Rewrite(FArq);
  end;    
end;

procedure TDMProc.DataModuleDestroy(Sender: TObject);
begin
  LI.Limpa;
  Debug('Finalizou Servidor');
  LI.Free;
  Close(FArq);
end;

procedure TDMProc.LogErro(S: String);
begin
  if S='' then Exit;
  Writeln(FArq, FormatDateTime('dd/mm/yyyy hh:mm:ss - ', Now) + S);
end;

procedure TDMProc.LogErroDataset(S: String; D: TDataset; F: TField);
var I : Integer;
begin
  if S='' then Exit;
  Writeln(FArq, FormatDateTime('dd/mm/yyyy hh:mm:ss    - ', Now) + S);
  try
    if F <> nil then
      Writeln(FArq,   '  Campo que gerou erro = ' + F.FieldName);
    for I := 0 to pred(D.FieldCount) do with D.Fields[I] do
      Writeln(FArq, '  ' + Pad(FieldName, 21) + '= ' + AsString);
  except
  end;      
end;

procedure TDMProc.Debug(S: String);
begin
  Exit;
  try
    tLog.Active := True;
    InitTran(dbLog, [tLog], True);
    try
      tLog.Insert;
      tLog.FieldByName('ID').AsInteger := dmBDServ.GetProxLog;
      tLog.FieldByName('Data').AsDateTime := Now;
      tLog.FieldByName('Duracao').AsDateTime := 0;
      tLog.FieldByName('UUpload').AsInteger := 0;
      tLog.FieldByName('Oper').AsInteger := iolDebug;
      tLog.FieldByName('Ok').AsBoolean := True;
      if LI.liOper>=0 then
         tLog.FieldByName('Detalhes').AsString :=
           ObtemStrOperacao(LI.liOper) + ' Log= ' + IntToStr(LI.liLogID) + ' Msg= ' + S
      else
        tLog.FieldByName('Detalhes').AsString := S;

      tLog.FieldByName('Tecnico').AsString := '';
      tLog.Post;
      dbLog.Commit;
    except
      dbLog.Rollback;
      if tLog.State=dsInsert then tLog.Cancel;
      Raise;
    end;
  except
  end;  
end;

end.
