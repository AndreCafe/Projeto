// =============================================================================
// Source auto-created 22/10/2003 14:22:31 by FFCodeGun v.4.13a
// 
// Main Source
// 
// !!Do not forget to have ffxJFNutils units
// in your project library path!!
// =============================================================================
// nxTable format supported: FF2
// 
// Procedural Mode - Common Table Creation Settings:
// - Call procedure     : None
// - Field Constants    : False
// - Interface          : False
// - Routine            : Dictionary function
// 
// =============================================================================

function ffTblAmarraFaseDict : TnxDataDictionary;
  // AmarraFase.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Cliente', '', nxtNullAnsiStr, 6, 0, False, nil);

// 1
Result.AddField('Projeto', '', nxtNullAnsiStr, 10, 0, False, nil);

// 2
Result.AddField('FasePai', '', nxtNullAnsiStr, 12, 0, False, nil);

// 3
Result.AddField('FaseFilho', '', nxtNullAnsiStr, 12, 0, False, nil);

// 4
Result.AddField('Tipo', '', nxtNullAnsiStr, 1, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Cliente');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Projeto');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('FasePai');
FldIHList[2] := '';
FldArray[3] := Result.GetFieldFromName('FaseFilho');
FldIHList[3] := '';
Result.AddIndex('IAmarra', '', 0, 4, FldArray, FldIHList, True, True, True);

end;// ffTblAmarraFaseDict

function ffTblClienteDict : TnxDataDictionary;
  // Cliente.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('ID', '', nxtNullAnsiStr, 6, 0, False, nil);

// 1
Result.AddField('Nome', '', nxtNullString, 30, 0, False, nil);

// 2
Result.AddField('Translado', '', nxtDateTime, 0, 0, False, nil);

// 3
Result.AddField('Assinou', '', nxtNullAnsiStr, 30, 0, False, nil);

// 4
Result.AddField('Noturno', '', nxtChar, 1, 0, False, nil);

// 5
Result.AddField('FimSem', '', nxtChar, 1, 0, False, nil);

// 6
Result.AddField('Abono', '', nxtDateTime, 0, 0, False, nil);

// 7
Result.AddField('MotAbono', '', nxtNullAnsiStr, 2, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('ID');
FldIHList[0] := '';
Result.AddIndex('IID', '', 0, 1, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Nome');
FldIHList[0] := '';
Result.AddIndex('INome', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblClienteDict

function ffTblControleDict : TnxDataDictionary;
  // Controle.FF2

begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Status', '', nxtInt16, 5, 0, False, nil);

// 1
Result.AddField('Data', '', nxtDateTime, 0, 0, False, nil);

// 2
Result.AddField('UploadPend', '', nxtBoolean, 0, 0, False, nil);

// 3
Result.AddField('VersaoMin', '', nxtNullAnsiStr, 5, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// none
end;// ffTblControleDict

function ffTblFaseDict : TnxDataDictionary;
  // Fase.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Cliente', '', nxtNullAnsiStr, 6, 0, False, nil);

// 1
Result.AddField('Projeto', '', nxtNullAnsiStr, 10, 0, False, nil);

// 2
Result.AddField('ID', '', nxtNullAnsiStr, 12, 0, False, nil);

// 3
Result.AddField('FasePai', '', nxtNullAnsiStr, 12, 0, False, nil);

// 4
Result.AddField('Nome', '', nxtNullAnsiStr, 50, 0, False, nil);

// 5
Result.AddField('Inicio', '', nxtDateTime, 0, 0, False, nil);

// 6
Result.AddField('Termino', '', nxtDateTime, 0, 0, False, nil);

// 7
Result.AddField('Horas', '', nxtWord16, 0, 0, False, nil);

// 8
Result.AddField('HorasReal', '', nxtDouble, 0, 6, False, nil);

// 9
Result.AddField('PercEst', '', nxtWord16, 0, 0, False, nil);

// 10
Result.AddField('Sync', '', nxtBoolean, 0, 0, False, nil);

// 11
Result.AddField('IDRetag', '', nxtNullAnsiStr, 20, 0, False, nil);

// 12
Result.AddField('Sumario', '', nxtBoolean, 0, 0, False, nil);

// 13
Result.AddField('Status', '', nxtChar, 1, 0, False, nil);

// 14
Result.AddField('Validador', '', nxtNullAnsiStr, 30, 0, False, nil);

// 15
Result.AddField('DatReI', '', nxtDateTime, 0, 0, False, nil);

// 16
Result.AddField('DatReF', '', nxtDateTime, 0, 0, False, nil);

// 17
Result.AddField('DataVld', '', nxtDateTime, 0, 0, False, nil);

// 18
Result.AddField('Revisao', '', nxtNullAnsiStr, 2, 0, False, nil);

// 19
Result.AddField('NovoHor', '', nxtWord16, 2, 0, False, nil);

// 20
Result.AddField('NovoIni', '', nxtDateTime, 0, 0, False, nil);

// 21
Result.AddField('NovoFim', '', nxtDateTime, 0, 0, False, nil);

// 22
Result.AddField('Justific', '', nxtNullAnsiStr, 250, 0, False, nil);

// 23
Result.AddField('TecSug', '', nxtNullAnsiStr, 6, 0, False, nil);

// 24
Result.AddField('MotSug', '', nxtChar, 1, 0, False, nil);

// 25
Result.AddField('FlagSug', '', nxtNullAnsiStr, 2, 0, False, nil);

// 26
Result.AddField('CliSug', '', nxtNullAnsiStr, 30, 0, False, nil);

// 27
Result.AddField('DataSug', '', nxtDateTime, 0, 0, False, nil);

// 28
Result.AddField('SyncSug', '', nxtBoolean, 0, 0, False, nil);

// 29
Result.AddField('IDSug', '', nxtNullAnsiStr, 2, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Cliente');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Projeto');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('ID');
FldIHList[2] := '';
Result.AddIndex('IID', '', 0, 3, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Nome');
FldIHList[0] := '';
Result.AddIndex('INome', '', 0, 1, FldArray, FldIHList, True, True, True);

// 3
FldArray[0] := Result.GetFieldFromName('Sync');
FldIHList[0] := '';
Result.AddIndex('ISync', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblFaseDict

function ffTblFaseTecDict : TnxDataDictionary;
  // FaseTec.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Cliente', '', nxtNullAnsiStr, 6, 0, False, nil);

// 1
Result.AddField('Projeto', '', nxtNullAnsiStr, 10, 0, False, nil);

// 2
Result.AddField('Fase', '', nxtNullAnsiStr, 12, 0, False, nil);

// 3
Result.AddField('Tecnico', '', nxtNullAnsiStr, 6, 0, False, nil);

// 4
Result.AddField('Status', '', nxtChar, 1, 0, False, nil);

// 5
Result.AddField('Sync', '', nxtBoolean, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Cliente');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Projeto');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('Fase');
FldIHList[2] := '';
FldArray[3] := Result.GetFieldFromName('Tecnico');
FldIHList[3] := '';
Result.AddIndex('IID', '', 0, 4, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Sync');
FldIHList[0] := '';
Result.AddIndex('ISync', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblFaseTecDict

function ffTblMotivoDict : TnxDataDictionary;
  // Motivo.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('ID', '', nxtNullAnsiStr, 2, 0, False, nil);

// 1
Result.AddField('Nome', '', nxtNullAnsiStr, 30, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('ID');
FldIHList[0] := '';
Result.AddIndex('IID', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblMotivoDict

function ffTblOcorrenciaDict : TnxDataDictionary;
  // Ocorrencia.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('ID', '', nxtNullAnsiStr, 2, 0, False, nil);

// 1
Result.AddField('Descricao', '', nxtNullAnsiStr, 30, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('ID');
FldIHList[0] := '';
Result.AddIndex('IID', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblOcorrenciaDict

function ffTblOSDict : TnxDataDictionary;
  // OS.FF2

var
  FldArray : TffFieldList;
  FldVCheck : TnxVCheckDescriptor;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Cliente', '', nxtNullAnsiStr, 6, 0, False, nil);

// 1
Result.AddField('Projeto', '', nxtNullAnsiStr, 6, 0, False, nil);

// 2
Result.AddField('Tecnico', '', nxtNullAnsiStr, 6, 0, False, nil);

// 3
Result.AddField('Data', '', nxtDateTime, 0, 0, False, nil);

// 4
Result.AddField('ID', '', nxtWord16, 0, 0, False, nil);

// 5
Result.AddField('Inicio', '', nxtDateTime, 0, 0, False, nil);

// 6
Result.AddField('Termino', '', nxtDateTime, 0, 0, False, nil);

// 7
Result.AddField('Translado', '', nxtDateTime, 0, 0, False, nil);

// 8
Result.AddField('Abono', '', nxtDateTime, 0, 0, False, nil);

// 9
Result.AddField('MotivoAbon', '', nxtNullAnsiStr, 2, 0, False, nil);

// 10
Result.AddField('Sync', '', nxtBoolean, 0, 0, False, nil);

// 11
Result.AddField('Assinou', '', nxtNullAnsiStr, 30, 0, False, nil);

// 12
FldVCheck.vdHasMinVal := False;
FldVCheck.vdHasMaxVal := False;
FldVCheck.vdHasDefVal := True;

SetVCheckVal('C', nxtChar, FldVCheck.vdDefVal);
FldVCheck.vdPicture := '';

Result.AddField('Local', 'C=Cliente, F=Franquia', nxtChar, 1, 0, False, @FldVCheck);

// 13
FldVCheck.vdHasMinVal := False;
FldVCheck.vdHasMaxVal := False;
FldVCheck.vdHasDefVal := True;

SetVCheckVal('N', nxtChar, FldVCheck.vdDefVal);
FldVCheck.vdPicture := '';

Result.AddField('Entrou', '', nxtChar, 1, 0, False, @FldVCheck);

// 14
Result.AddField('DataComp', '', nxtDateTime, 0, 0, False, nil);

// 15
Result.AddField('NumAtend', '', nxtNullAnsiStr, 10, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Cliente');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Tecnico');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('Data');
FldIHList[2] := '';
FldArray[3] := Result.GetFieldFromName('ID');
FldIHList[3] := '';
Result.AddIndex('IID', '', 0, 4, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Tecnico');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Data');
FldIHList[1] := '';
Result.AddIndex('ITecnico', '', 0, 2, FldArray, FldIHList, True, True, True);

// 3
FldArray[0] := Result.GetFieldFromName('Sync');
FldIHList[0] := '';
Result.AddIndex('ISync', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblOSDict

function ffTblOSFaseDict : TnxDataDictionary;
  // OSFase.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Cliente', '', nxtNullAnsiStr, 6, 0, False, nil);

// 1
Result.AddField('Projeto', '', nxtNullAnsiStr, 10, 0, False, nil);

// 2
Result.AddField('Data', '', nxtDateTime, 0, 0, False, nil);

// 3
Result.AddField('OS', '', nxtInt16, 0, 0, False, nil);

// 4
Result.AddField('Item', '', nxtWord16, 0, 0, False, nil);

// 5
Result.AddField('Fase', '', nxtNullAnsiStr, 12, 0, False, nil);

// 6
Result.AddField('Tecnico', '', nxtNullAnsiStr, 6, 0, False, nil);

// 7
Result.AddField('Horas', '', nxtDateTime, 0, 0, False, nil);

// 8
Result.AddField('Sync', '', nxtBoolean, 0, 0, False, nil);

// 9
Result.AddField('TipoHora', '', nxtNullAnsiStr, 15, 0, False, nil);

// 10
Result.AddField('Ocorrencia', '', nxtNullAnsiStr, 2, 0, False, nil);

// 11
Result.AddField('Revisao', '', nxtNullAnsiStr, 2, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Cliente');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Tecnico');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('Data');
FldIHList[2] := '';
FldArray[3] := Result.GetFieldFromName('OS');
FldIHList[3] := '';
Result.AddIndex('IOSItem', '', 0, 4, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Cliente');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Projeto');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('Fase');
FldIHList[2] := '';
FldArray[3] := Result.GetFieldFromName('Tecnico');
FldIHList[3] := '';
FldArray[4] := Result.GetFieldFromName('Item');
FldIHList[4] := '';
Result.AddIndex('IProjFase', '', 0, 5, FldArray, FldIHList, True, True, True);

// 3
FldArray[0] := Result.GetFieldFromName('Cliente');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Tecnico');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('OS');
FldIHList[2] := '';
FldArray[3] := Result.GetFieldFromName('Data');
FldIHList[3] := '';
Result.AddIndex('ICliTecOS', '', 0, 4, FldArray, FldIHList, True, True, True);

// 4
FldArray[0] := Result.GetFieldFromName('Sync');
FldIHList[0] := '';
Result.AddIndex('ISync', '', 0, 1, FldArray, FldIHList, True, True, True);

// 5
FldArray[0] := Result.GetFieldFromName('Cliente');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Projeto');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('Fase');
FldIHList[2] := '';
FldArray[3] := Result.GetFieldFromName('Data');
FldIHList[3] := '';
FldArray[4] := Result.GetFieldFromName('Tecnico');
FldIHList[4] := '';
Result.AddIndex('IProjFaseData', '', 0, 5, FldArray, FldIHList, True, True, True);

end;// ffTblOSFaseDict

function ffTblOSFaseDescDict : TnxDataDictionary;
  // OSFaseDesc.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Cliente', '', nxtNullAnsiStr, 6, 0, False, nil);

// 1
Result.AddField('Projeto', '', nxtNullAnsiStr, 10, 0, False, nil);

// 2
Result.AddField('Fase', '', nxtNullAnsiStr, 12, 0, False, nil);

// 3
Result.AddField('Tecnico', '', nxtNullAnsiStr, 6, 0, False, nil);

// 4
Result.AddField('Item', '', nxtWord16, 3, 0, False, nil);

// 5
Result.AddField('Pos', '', nxtByte, 0, 0, False, nil);

// 6
Result.AddField('Texto', '', nxtNullAnsiStr, 70, 0, False, nil);

// 7
Result.AddField('Sync', '', nxtBoolean, 0, 0, False, nil);

// 8
Result.AddField('Data', '', nxtDateTime, 0, 0, False, nil);

// 9
Result.AddField('OS', '', nxtInt16, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Cliente');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Projeto');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('Fase');
FldIHList[2] := '';
FldArray[3] := Result.GetFieldFromName('Tecnico');
FldIHList[3] := '';
FldArray[4] := Result.GetFieldFromName('Item');
FldIHList[4] := '';
FldArray[5] := Result.GetFieldFromName('Pos');
FldIHList[5] := '';
Result.AddIndex('IChave', '', 0, 6, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Sync');
FldIHList[0] := '';
Result.AddIndex('ISync', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblOSFaseDescDict

function ffTblParametroDict : TnxDataDictionary;
  // Parametro.FF2

begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('MaxDiasUpload', '', nxtByte, 0, 0, False, nil);

// 1
Result.AddField('MaxDiasDown', '', nxtByte, 0, 0, False, nil);

// 2
Result.AddField('DataDown', '', nxtDateTime, 0, 0, False, nil);

// 3
Result.AddField('NomeFranquia', '', nxtNullAnsiStr, 40, 0, False, nil);

// 4
Result.AddField('BitMap', '', nxtBLOBGraphic, 0, 0, False, nil);

// 5
Result.AddField('ObedeceListaProj', '', nxtBoolean, 0, 0, False, nil);

// 6
Result.AddField('ListaProjDefault', '', nxtChar, 1, 0, False, nil);

// 7
Result.AddField('RestringeDiurno', '', nxtBoolean, 0, 0, False, nil);

// 8
Result.AddField('TravarTranslado', '', nxtBoolean, 0, 0, False, nil);

// 9
Result.AddField('CampoLocalOS', '', nxtBoolean, 0, 0, False, nil);

// 10
Result.AddField('InicioDiurno', '', nxtDateTime, 0, 0, False, nil);

// 11
Result.AddField('FimDiurno', '', nxtDateTime, 0, 0, False, nil);

// 12
Result.AddField('UploadApontamentoSemOS', '', nxtBoolean, 0, 0, False, nil);

// 13
Result.AddField('PermitirRateio', '', nxtBoolean, 0, 0, False, nil);

// 14
Result.AddField('ConflitoHoraTodosCli', '', nxtBoolean, 0, 0, False, nil);

// 15
Result.AddField('ExigeAutorizadoPor', '', nxtBoolean, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// none
end;// ffTblParametroDict

function ffTblProjetoDict : TnxDataDictionary;
  // Projeto.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Cliente', '', nxtNullAnsiStr, 6, 0, False, nil);

// 1
Result.AddField('ID', '', nxtNullAnsiStr, 10, 0, False, nil);

// 2
Result.AddField('Nome', '', nxtNullAnsiStr, 50, 0, False, nil);

// 3
Result.AddField('LocaPla', '', nxtNullAnsiStr, 2, 0, False, nil);

// 4
Result.AddField('LocaRec', '', nxtNullAnsiStr, 1, 0, False, nil);

// 5
Result.AddField('Noturno', '', nxtNullAnsiStr, 1, 0, False, nil);

// 6
Result.AddField('FimSem', '', nxtNullAnsiStr, 1, 0, False, nil);

// 7
Result.AddField('Translado', '', nxtDateTime, 0, 0, False, nil);

// 8
Result.AddField('Abono', '', nxtDateTime, 0, 0, False, nil);

// 9
Result.AddField('MotAbono', '', nxtNullAnsiStr, 2, 0, False, nil);

// 10
Result.AddField('OSAbon', '', nxtNullAnsiStr, 1, 0, False, nil);

// 11
Result.AddField('Tipo', '', nxtNullAnsiStr, 1, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Cliente');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('ID');
FldIHList[1] := '';
Result.AddIndex('IID', '', 0, 2, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Nome');
FldIHList[0] := '';
Result.AddIndex('INome', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblProjetoDict

function ffTblSolicitaDict : TnxDataDictionary;
  // Solicita.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Cliente', '', nxtNullAnsiStr, 6, 0, False, nil);

// 1
Result.AddField('Projeto', '', nxtNullAnsiStr, 10, 0, False, nil);

// 2
Result.AddField('Tecnico', '', nxtNullAnsiStr, 6, 0, False, nil);

// 3
Result.AddField('Data', '', nxtDateTime, 0, 0, False, nil);

// 4
Result.AddField('Item', '', nxtByte, 0, 0, False, nil);

// 5
Result.AddField('Tipo', '', nxtNullAnsiStr, 2, 0, False, nil);

// 6
Result.AddField('Origem', '', nxtNullAnsiStr, 1, 0, False, nil);

// 7
Result.AddField('NomeResp', '', nxtNullAnsiStr, 30, 0, False, nil);

// 8
Result.AddField('Sync', '', nxtBoolean, 0, 0, False, nil);

// 9
Result.AddField('DataRT', '', nxtDateTime, 0, 0, False, nil);

// 10
Result.AddField('NomeRT', '', nxtNullAnsiStr, 8, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Cliente');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Projeto');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('Tecnico');
FldIHList[2] := '';
FldArray[3] := Result.GetFieldFromName('Data');
FldIHList[3] := '';
FldArray[4] := Result.GetFieldFromName('Item');
FldIHList[4] := '';
Result.AddIndex('IChave', '', 0, 5, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Sync');
FldIHList[0] := '';
Result.AddIndex('ISync', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblSolicitaDict

function ffTblSolicitaDescDict : TnxDataDictionary;
  // SolicitaDesc.FF2

var
  FldArray : TffFieldList;
  FldVCheck : TnxVCheckDescriptor;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Cliente', '', nxtNullAnsiStr, 6, 0, False, nil);

// 1
Result.AddField('Projeto', '', nxtNullAnsiStr, 10, 0, False, nil);

// 2
Result.AddField('Tecnico', '', nxtNullAnsiStr, 6, 0, False, nil);

// 3
Result.AddField('Data', '', nxtDateTime, 0, 0, False, nil);

// 4
Result.AddField('Item', '', nxtByte, 3, 0, False, nil);

// 5
Result.AddField('Pos', '', nxtByte, 0, 0, False, nil);

// 6
Result.AddField('Texto', '', nxtNullAnsiStr, 70, 0, False, nil);

// 7
Result.AddField('Sync', '', nxtBoolean, 0, 0, False, nil);

// 8
FldVCheck.vdHasMinVal := False;
FldVCheck.vdHasMaxVal := False;
FldVCheck.vdHasDefVal := True;

SetVCheckVal('E', nxtChar, FldVCheck.vdDefVal);
FldVCheck.vdPicture := '';

Result.AddField('Tipo', '', nxtChar, 1, 0, False, @FldVCheck);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Tipo');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Cliente');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('Projeto');
FldIHList[2] := '';
FldArray[3] := Result.GetFieldFromName('Tecnico');
FldIHList[3] := '';
FldArray[4] := Result.GetFieldFromName('Data');
FldIHList[4] := '';
FldArray[5] := Result.GetFieldFromName('Item');
FldIHList[5] := '';
FldArray[6] := Result.GetFieldFromName('Pos');
FldIHList[6] := '';
Result.AddIndex('IChave', '', 0, 7, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Sync');
FldIHList[0] := '';
Result.AddIndex('ISync', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblSolicitaDescDict

function ffTblTecnicoDict : TnxDataDictionary;
  // Tecnico.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('ID', '', nxtNullAnsiStr, 6, 0, False, nil);

// 1
Result.AddField('Nome', '', nxtNullAnsiStr, 30, 0, False, nil);

// 2
Result.AddField('Senha', '', nxtNullAnsiStr, 6, 0, False, nil);

// 3
Result.AddField('Empresa', '', nxtNullAnsiStr, 3, 0, False, nil);

// 4
Result.AddField('ListaProj', '', nxtChar, 1, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('ID');
FldIHList[0] := '';
Result.AddIndex('IID', '', 0, 1, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Nome');
FldIHList[0] := '';
Result.AddIndex('INome', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblTecnicoDict

function ffTblTipoHoraDict : TnxDataDictionary;
  // TipoHora.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('ID', '', nxtNullAnsiStr, 15, 0, False, nil);

// 1
Result.AddField('Descricao', '', nxtNullAnsiStr, 30, 0, False, nil);

// 2
Result.AddField('Tipo', '', nxtChar, 1, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('ID');
FldIHList[0] := '';
Result.AddIndex('IID', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblTipoHoraDict

