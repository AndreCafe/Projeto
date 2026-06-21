unit uDTFmtTabs;

//************************************************
//*   Source created with NexusDb Source Maker   *
//*                 Version 1.1.4                *
//*                                              *
//*               by Roberto Nicchi              *
//*            M a s t e r Informatica           *
//*                    Italy                     *
//*         software@masterinformatica.net       *
//*                                              *
//*       Source creation date: 29/12/2005       *
//*                                              *
//************************************************
Interface

Uses classes, nxdb, nxsdDataDictionary, nxsdTypes, nxlltypes, nxllutils, nxsqlProxies, nxsdserverengine;

type
TsmDictFn=function(tablename:string):TnxDataDictionary;

TnsmCreateDatabaseCb=procedure(table:string;tableindex:integer);
TnsmRestructureDatabaseCb=procedure(table:string;tableindex:integer;op:smallint);
TnsmRestructureTableCb=procedure(table:string;perc:integer);
TnsmVerifyDatabaseCb=procedure(table:string;tableindex:integer);
TnsmVerifyDatabaseErrorCb=procedure(table:string);
TnsmRenamedFieldCb=procedure(table,field:string;var newfield:string);

// Database methods

procedure CreatediatecDatabase(db:TnxDatabase;overwrite:boolean=false;creating:TnsmCreateDatabaseCb=nil);

procedure RestructurediatecDatabase(db:TnxDatabase;MatchFieldsBy:smallint=0;RestructuringDatabase:TnsmRestructureDatabaseCb=nil;RestructuringTable:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);

function VerifydiatecDatabase(db:TnxDatabase;Verifying:TnsmVerifyDatabaseCb=nil;verifyerror:TnsmVerifyDatabaseErrorCb=nil):boolean;

function diatecDbVersion:string;

function diatecTablesCount:integer;

procedure diatecGetTableNames(tables:Tstrings);

// Tables methods

function TableDataDictionary(tablename:string):TnxDataDictionary;

procedure CreateTableByDict(db:TnxDatabase;tablename:string;dict:TnxDataDictionary;overwrite:boolean=false);

procedure CreateTable(db:TnxDatabase;tablename:string;overwrite:boolean=false);

function VerifyTableStructureByDict(db:TnxDatabase;tablename:string;dict:TnxDataDictionary):integer;

function VerifyTableStructure(db:TnxDatabase;tablename:string):integer;

procedure RestructureTableByDict(db:TnxDatabase;tablename:string;newdict:TnxDataDictionary;MatchFieldsBy:smallint=0;Restructuring:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);

procedure RestructureTable(db:TnxDatabase;tablename:string;MatchFieldsBy:smallint=0;Restructuring:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);

function AmarraFaseTableDataDictionary:TnxDataDictionary;
function ClienteTableDataDictionary:TnxDataDictionary;
function FaseTableDataDictionary:TnxDataDictionary;
function FaseTecTableDataDictionary:TnxDataDictionary;
function FeriadoTableDataDictionary:TnxDataDictionary;
function LogTableDataDictionary:TnxDataDictionary;
function MotivoTableDataDictionary:TnxDataDictionary;
function OcorrenciaTableDataDictionary:TnxDataDictionary;
function OSTableDataDictionary:TnxDataDictionary;
function OSFaseTableDataDictionary:TnxDataDictionary;
function OSFaseDescTableDataDictionary:TnxDataDictionary;
function ParametroTableDataDictionary:TnxDataDictionary;
function ProjetoTableDataDictionary:TnxDataDictionary;
function RATableDataDictionary:TnxDataDictionary;
function RAFTableDataDictionary:TnxDataDictionary;
function RAFCliTableDataDictionary:TnxDataDictionary;
function RAFTecTableDataDictionary:TnxDataDictionary;
function RAItemTableDataDictionary:TnxDataDictionary;
function RAOSTableDataDictionary:TnxDataDictionary;
function SolicitaTableDataDictionary:TnxDataDictionary;
function SolicitaDescTableDataDictionary:TnxDataDictionary;
function TecnicoTableDataDictionary:TnxDataDictionary;
function TipoHoraTableDataDictionary:TnxDataDictionary;

Implementation

var
  Ftables:Tstringlist;

procedure SetExtTextKeyFieldDescriptorOptions(kfd:TnxKeyFieldDescriptor;ignorecase,ignorekanatype,ignorenonspace,ignoresymbols,ignorewidth,usestringsort:boolean;locale:integer);
begin
  (kfd as TnxExtTextKeyFieldDescriptor).ignorecase:=ignorecase;
  (kfd as TnxExtTextKeyFieldDescriptor).ignoreKanatype:=ignoreKanatype;
  (kfd as TnxExtTextKeyFieldDescriptor).ignorenonspace:=ignorenonspace;
  (kfd as TnxExtTextKeyFieldDescriptor).ignoresymbols:=ignoresymbols;
  (kfd as TnxExtTextKeyFieldDescriptor).ignorewidth:=ignorewidth;
  (kfd as TnxExtTextKeyFieldDescriptor).usestringsort:=usestringsort;
  (kfd as TnxExtTextKeyFieldDescriptor).locale:=locale;
end;


function AmarraFaseTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('Cliente','',nxtNullString,8,0,False);
  dict.addfield('Projeto','',nxtNullString,15,0,False);
  dict.addfield('FasePai','',nxtNullString,12,0,False);
  dict.addfield('FaseFilho','',nxtNullString,12,0,False);
  dict.addfield('Tipo','',nxtNullString,1,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IAmarra',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Projeto'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('FasePai'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('FaseFilho'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  result:=dict;
end;


function ClienteTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('ID','',nxtNullString,8,0,False);
  dict.addfield('Nome','',nxtNullString,30,0,False);
  dict.addfield('Translado','',nxtDateTime,0,0,False);
  dict.addfield('Assinou','',nxtNullString,30,0,False);
  dict.addfield('Noturno','',nxtChar,1,0,False);
  dict.addfield('FimSem','',nxtChar,1,0,False);
  dict.addfield('Abono','',nxtDateTime,0,0,False);
  dict.addfield('MotAbono','',nxtNullString,2,0,False);
  dict.addfield('Cidade','',nxtNullString,40,0,False);
  dict.addfield('KM','',nxtInt32,10,0,False);
  dict.addfield('VlPedag','',nxtCurrency,0,0,False);
  dict.addfield('PgAlim','',nxtBoolean,0,0,False);
  dict.addfield('PgHosp','',nxtBoolean,0,0,False);
  dict.addfield('ValorKM','',nxtCurrency,0,0,False);
  
  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INome',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Nome'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  result:=dict;
end;


function FaseTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('Cliente','',nxtNullString,8,0,False);
  dict.addfield('Projeto','',nxtNullString,15,0,False);
  dict.addfield('ID','',nxtNullString,12,0,False);
  dict.addfield('FasePai','',nxtNullString,12,0,False);
  dict.addfield('Nome','',nxtNullString,50,0,False);
  dict.addfield('Inicio','',nxtDateTime,0,0,False);
  dict.addfield('Termino','',nxtDateTime,0,0,False);
  dict.addfield('Horas','',nxtInt32,0,0,False);
  dict.addfield('HorasReal','',nxtDouble,0,6,False);
  dict.addfield('PercEst','',nxtWord16,0,0,False);
  dict.addfield('Sync','',nxtBoolean,0,0,False);
  dict.addfield('IDRetag','',nxtNullString,20,0,False);
  dict.addfield('Sumario','',nxtBoolean,0,0,False);
  dict.addfield('Status','',nxtChar,1,0,False);
  dict.addfield('Validador','',nxtNullString,30,0,False);
  dict.addfield('DatReI','',nxtDateTime,0,0,False);
  dict.addfield('DatReF','',nxtDateTime,0,0,False);
  dict.addfield('DataVld','',nxtDateTime,0,0,False);
  dict.addfield('Revisao','',nxtNullString,4,0,False);
  dict.addfield('NovoHor','',nxtWord16,2,0,False);
  dict.addfield('NovoIni','',nxtDateTime,0,0,False);
  dict.addfield('NovoFim','',nxtDateTime,0,0,False);
  dict.addfield('Justific','',nxtNullString,250,0,False);
  dict.addfield('TecSug','',nxtNullString,6,0,False);
  dict.addfield('MotSug','',nxtChar,1,0,False);
  dict.addfield('FlagSug','',nxtNullString,2,0,False);
  dict.addfield('CliSug','',nxtNullString,30,0,False);
  dict.addfield('DataSug','',nxtDateTime,0,0,False);
  dict.addfield('SyncSug','',nxtBoolean,0,0,False);
  dict.addfield('IDSug','',nxtNullString,2,0,False);
  dict.addfield('LogID','',nxtInt32,2,0,False);
  dict.addfield('Obs','',nxtNullString,255,0,False);
  fd:=dict.addfield('DownOK','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Projeto'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IFasePai',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Projeto'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('FasePai'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INome',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Nome'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISync',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sync'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILogID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDownOk',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DownOK'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  result:=dict;
end;


function FaseTecTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('Cliente','',nxtNullString,8,0,False);
  dict.addfield('Projeto','',nxtNullString,15,0,False);
  dict.addfield('Fase','',nxtNullString,12,0,False);
  dict.addfield('Tecnico','',nxtNullString,6,0,False);
  dict.addfield('Status','',nxtChar,1,0,False);
  dict.addfield('Sync','',nxtBoolean,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Projeto'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Fase'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISync',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sync'));

  result:=dict;
end;


function FeriadoTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('Data','',nxtDate,0,0,False);
  dict.addfield('Descricao','',nxtNullString,50,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  result:=dict;
end;


function LogTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('ID','',nxtAutoinc,10,0,False);
  dict.addfield('Tecnico','',nxtNullString,6,0,False);
  dict.addfield('Data','',nxtDateTime,0,0,False);
  dict.addfield('Detalhes','quantidade de registros por tabela',nxtBlobMemo,0,0,False);
  dict.addfield('Oper','0=upload, 1=download',nxtByte,0,0,False);
  fd:=dict.addfield('OK','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('Duracao','',nxtDateTime,0,0,False);
  dict.addfield('UUpload','Número do ultimo upload importado por essa base',nxtWord32,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITecData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IOperTecData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Oper'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IOperData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Oper'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IOKData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('OK'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IOperID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Oper'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('OK'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  result:=dict;
end;


function MotivoTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('ID','',nxtNullString,2,0,False);
  dict.addfield('Nome','',nxtNullString,30,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  result:=dict;
end;


function OcorrenciaTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('ID','',nxtNullString,2,0,False);
  dict.addfield('Descricao','',nxtNullString,30,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  result:=dict;
end;


function OSTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('Cliente','',nxtNullString,8,0,False);
  dict.addfield('Projeto','',nxtNullString,15,0,False);
  dict.addfield('Tecnico','',nxtNullString,6,0,False);
  dict.addfield('Data','',nxtDateTime,0,0,False);
  dict.addfield('ID','',nxtWord16,0,0,False);
  dict.addfield('Inicio','',nxtDateTime,0,0,False);
  dict.addfield('Termino','',nxtDateTime,0,0,False);
  dict.addfield('Translado','',nxtDateTime,0,0,False);
  dict.addfield('Abono','',nxtDateTime,0,0,False);
  dict.addfield('MotivoAbon','',nxtNullString,2,0,False);
  dict.addfield('Sync','',nxtBoolean,0,0,False);
  dict.addfield('Assinou','',nxtNullString,30,0,False);
  fd:=dict.addfield('Local','C=Cliente, F=Franquia',nxtChar,1,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'C', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('Entrou','',nxtChar,1,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'N', cdvDefaultValue, fd.fdLength);
  dict.addfield('DataComp','',nxtDateTime,0,0,False);
  dict.addfield('NumAtend','',nxtNullString,10,0,False);
  dict.addfield('LogID','',nxtInt32,0,0,False);
  fd:=dict.addfield('DownOk','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('GeraReemb','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('TipoReemb','',nxtChar,1,0,False);
  dict.addfield('VeicProp','',nxtChar,1,0,False);
  dict.addfield('OutroLocal','',nxtNullString,6,0,False);
  dict.addfield('KmDestino','',nxtDouble,6,0,False);
  dict.addfield('Pedagio1','',nxtDouble,6,0,False);
  dict.addfield('Pedagio2','',nxtDouble,6,0,False);
  dict.addfield('Pedagio3','',nxtDouble,6,0,False);
  dict.addfield('Pedagio4','',nxtDouble,6,0,False);
  dict.addfield('Motivo','',nxtNullString,40,0,False);
  dict.addfield('Apagar','',nxtChar,1,0,False);
  dict.addfield('VersaoProj','',nxtNullString,10,0,False);
  dict.addfield('AbonaInt','',nxtNullString,1,0,False);
  dict.addfield('ObrigaInt','',nxtNullString,1,0,False);
  dict.addfield('IInt','',nxtDateTime,0,0,False);
  dict.addfield('FInt','',nxtDateTime,0,0,False);
  dict.addfield('VlTrans','',nxtCurrency,0,2,False);
  dict.addfield('Obs','', nxtNullString,100,0,False);
  
  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Apagar'), TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITecnico',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISync',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sync'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILogID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDownOk',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DownOk'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  result:=dict;
end;


function OSFaseTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('Cliente','',nxtNullString,8,0,False);
  dict.addfield('Projeto','',nxtNullString,15,0,False);
  dict.addfield('Data','',nxtDateTime,0,0,False);
  dict.addfield('OS','',nxtInt16,0,0,False);
  dict.addfield('Item','',nxtInt32,0,0,False);
  dict.addfield('Fase','',nxtNullString,12,0,False);
  dict.addfield('Tecnico','',nxtNullString,6,0,False);
  dict.addfield('Horas','',nxtDateTime,0,0,False);
  dict.addfield('Sync','',nxtBoolean,0,0,False);
  dict.addfield('TipoHora','',nxtNullString,15,0,False);
  dict.addfield('Ocorrencia','',nxtNullString,2,0,False);
  dict.addfield('Revisao','',nxtNullString,4,0,False);
  dict.addfield('LogID','',nxtInt32,0,0,False);
  dict.addfield('Apagar','',nxtChar,1,0,False);
  
  fd:=dict.addfield('DownOk','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IOSItem',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('OS'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IProjFase',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Projeto'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Fase'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Item'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Apagar'), TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICliTecOS',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('OS'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISync',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sync'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IProjFaseData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Projeto'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Fase'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILogID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDownOk',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DownOk'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  result:=dict;
end;


function OSFaseDescTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('Cliente','',nxtNullString,8,0,False);
  dict.addfield('Projeto','',nxtNullString,15,0,False);
  dict.addfield('Fase','',nxtNullString,12,0,False);
  dict.addfield('Tecnico','',nxtNullString,6,0,False);
  dict.addfield('Item','',nxtInt32,3,0,False);
  dict.addfield('Pos','',nxtInt32,0,0,False);
  dict.addfield('Texto','',nxtNullString,70,0,False);
  dict.addfield('Sync','',nxtBoolean,0,0,False);
  dict.addfield('Data','',nxtDateTime,0,0,False);
  dict.addfield('OS','',nxtInt16,0,0,False);
  dict.addfield('LogID','',nxtInt32,0,0,False);
  dict.addfield('Apagar','',nxtChar,1,0,False);
  
  fd:=dict.addfield('DownOk','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IChave',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Projeto'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Fase'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Item'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Pos'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Apagar'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISync',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sync'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILogID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDownOk',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DownOk'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  result:=dict;
end;


function ParametroTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('MaxDiasUpload','',nxtByte,0,0,False);
  dict.addfield('MaxDiasDown','',nxtByte,0,0,False);
  dict.addfield('DataDown','',nxtDateTime,0,0,False);
  dict.addfield('NomeFranquia','',nxtNullString,40,0,False);
  dict.addfield('BitMap','',nxtBlobGraphic,0,0,False);
  dict.addfield('ObedeceListaProj','',nxtBoolean,0,0,False);
  dict.addfield('ListaProjDefault','',nxtChar,1,0,False);
  dict.addfield('RestringeDiurno','',nxtBoolean,0,0,False);
  dict.addfield('TravarTranslado','',nxtBoolean,0,0,False);
  dict.addfield('CampoLocalOS','',nxtBoolean,0,0,False);
  dict.addfield('InicioDiurno','',nxtDateTime,0,0,False);
  dict.addfield('FimDiurno','',nxtDateTime,0,0,False);
  dict.addfield('UploadApontamentoSemOS','',nxtBoolean,0,0,False);
  dict.addfield('PermitirRateio','',nxtBoolean,0,0,False);
  dict.addfield('ConflitoHoraTodosCli','',nxtBoolean,0,0,False);
  dict.addfield('ExigeAutorizadoPor','',nxtBoolean,0,0,False);
  dict.addfield('MostraReemb','',nxtBoolean,0,0,False);
  dict.addfield('ForcaTransladoProj','',nxtBoolean,0,0,False);
  dict.addfield('TransladoUnicoPorCliente','',nxtBoolean,0,0,False);
  dict.addfield('ImprimeAndamentoProjeto','',nxtBoolean,0,0,False);
  dict.addfield('ValidarEDT','',nxtBoolean,0,0,False);
  dict.addfield('EstimarFaseNoApontamento','',nxtBoolean,0,0,False);
  dict.addfield('ExigirEstimativa','',nxtBoolean,0,0,False);
  dict.addfield('VlHosp','',nxtCurrency,0,0,False);
  dict.addfield('VlKMCli','',nxtCurrency,0,0,False);
  dict.addfield('VlKMTec','',nxtCurrency,0,0,False);
  dict.addfield('VlAlim','',nxtCurrency,0,0,False);
  dict.addfield('MostrarRA','',nxtBoolean,0,0,False);
  dict.addfield('ChecarVersaoProj','',nxtBoolean,0,0,False);
  dict.addfield('PermiteApagarOSSincronizada','',nxtBoolean,0,0,False);
  dict.addfield('AtivarIntervalo','',nxtBoolean,0,0,False);
  dict.addfield('AtivarValorTrans','',nxtBoolean,0,0,False);
  dict.addfield('PermiteCorrigirOS','',nxtBoolean,0,0,False);
  dict.addfield('TodasHorasNoFeriado','',nxtBoolean,0,0,False);
  
  // Indexes

  result:=dict;
end;


function ProjetoTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('Cliente','',nxtNullString,8,0,False);
  dict.addfield('ID','',nxtNullString,15,0,False);
  dict.addfield('Nome','',nxtNullString,50,0,False);
  dict.addfield('LocaPla','',nxtNullString,2,0,False);
  dict.addfield('LocaRec','',nxtNullString,1,0,False);
  dict.addfield('Noturno','',nxtNullString,1,0,False);
  dict.addfield('FimSem','',nxtNullString,1,0,False);
  dict.addfield('Translado','',nxtDateTime,0,0,False);
  dict.addfield('Abono','',nxtDateTime,0,0,False);
  dict.addfield('MotAbono','',nxtNullString,2,0,False);
  dict.addfield('OSAbon','',nxtNullString,1,0,False);
  dict.addfield('APSemOS','',nxtNullString,1,0,False);
  dict.addfield('Tipo','',nxtNullString,1,0,False);
  dict.addfield('HorasPrev','',nxtDouble,0,6,False);
  dict.addfield('HorasReal','',nxtDouble,0,6,False);
  dict.addfield('Posicao','',nxtDateTime,0,0,False);
  dict.addfield('VersaoProj','',nxtNullString,10,0,False);
  dict.addfield('AbonaInt','',nxtNullString,1,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INome',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Nome'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  result:=dict;
end;


function RATableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  fd:=dict.addfield('Sync','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  dict.addfield('Tecnico','',nxtNullString,6,0,False);
  dict.addfield('Cliente','',nxtNullString,8,0,False);
  dict.addfield('DataI','',nxtDate,0,0,False);
  dict.addfield('DataF','',nxtDate,0,0,False);
  dict.addfield('ID','',nxtWord16,0,0,False);
  dict.addfield('LogID','',nxtWord32,0,0,False);
  dict.addfield('NumF','',nxtWord32,0,0,False);
  dict.addfield('StatusCli','',nxtByte,0,0,False);
  dict.addfield('StatusTec','',nxtByte,0,0,False);
  dict.addfield('DHUpload','',nxtDateTime,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IChave',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISync',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sync'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILogID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataI'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITecI',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataI'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITecF',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataF'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumFStatusCli',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumF'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('StatusCli'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumFStatusTec',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumF'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('StatusTec'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumFDataI',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumF'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataI'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumFDataF',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumF'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataF'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumFCliDataI',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumF'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataI'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumFCliDataF',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumF'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataF'));

  result:=dict;
end;


function RAFTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Fechamento de RA';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('ID','',nxtWord16,5,0,False);
  dict.addfield('DHCriacao','',nxtDateTime,0,0,False);
  dict.addfield('DHFechaCli','',nxtDateTime,0,0,False);
  dict.addfield('DHFechaTec','',nxtDateTime,0,0,False);
  dict.addfield('DataI','',nxtDateTime,0,0,False);
  dict.addfield('DataF','',nxtDateTime,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,False,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));
  kfd.ascend:=False;

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDataF',filedescriptorindex,False,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataF'));
  kfd.ascend:=True;

  result:=dict;
end;


function RAFCliTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('Fechamento','',nxtWord32,0,0,False);
  dict.addfield('Cliente','',nxtNullString,8,0,False);
  dict.addfield('DataI','',nxtDateTime,0,0,False);
  dict.addfield('DataF','',nxtDateTime,0,0,False);
  dict.addfield('ValorTotal','',nxtCurrency,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IChave',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Fechamento'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  result:=dict;
end;


function RAFTecTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('Fechamento','',nxtWord32,0,0,False);
  dict.addfield('Tecnico','',nxtNullString,6,0,False);
  dict.addfield('DataI','',nxtDate,0,0,False);
  dict.addfield('DataF','',nxtDate,0,0,False);
  dict.addfield('ValorTotal','',nxtCurrency,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IChave',filedescriptorindex,False,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Fechamento'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  result:=dict;
end;


function RAItemTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Itens de ressarcimento do RA';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('Sync','',nxtBoolean,0,0,False);
  dict.addfield('Tecnico','',nxtNullString,6,0,False);
  dict.addfield('Cliente','',nxtNullString,8,0,False);
  dict.addfield('Data','',nxtDate,0,0,False);
  dict.addfield('ID','',nxtWord16,0,0,False);
  dict.addfield('IDRA','',nxtWord16,0,0,False);
  dict.addfield('Tipo','',nxtByte,0,0,False);
  dict.addfield('Valor','',nxtCurrency,0,0,False);
  dict.addfield('JustDiverg','',nxtBlobMemo,0,0,False);
  dict.addfield('Descr','',nxtBlobMemo,0,0,False);
  dict.addfield('NumF','',nxtWord32,0,0,False);
  dict.addfield('ValorDef','',nxtCurrency,0,0,False);
  dict.addfield('ValorCli','',nxtCurrency,0,0,False);
  dict.addfield('ValorTec','',nxtCurrency,0,0,False);
  dict.addfield('StatusTec','',nxtByte,0,0,False);
  dict.addfield('LogID','',nxtWord32,0,0,False);
  dict.addfield('StatusCli','',nxtByte,0,0,False);
  dict.addfield('ONServ','',nxtBoolean,0,0,False);
  dict.addfield('ExcluirServ','',nxtBoolean,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IRA',filedescriptorindex,False,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('IDRA'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILogID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumFStatusCli',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumF'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('StatusCli'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumFStatusTec',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumF'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('StatusTec'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IStatusCli',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('StatusCli'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IStatusTec',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('StatusTec'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISync',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sync'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IRAData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('IDRA'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));

  result:=dict;
end;


function RAOSTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('Sync','',nxtBoolean,0,0,False);
  dict.addfield('Tecnico','',nxtNullString,6,0,False);
  dict.addfield('Cliente','',nxtNullString,8,0,False);
  dict.addfield('DataOS','',nxtDateTime,0,0,False);
  dict.addfield('IDOS','',nxtWord16,0,0,False);
  dict.addfield('LogID','',nxtWord32,0,0,False);
  dict.addfield('NumF','',nxtWord16,0,0,False);
  dict.addfield('Horas','',nxtTime,0,0,False);
  dict.addfield('IDRA','',nxtWord16,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IRA',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('IDRA'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataOS'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('IDOS'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISync',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sync'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILogID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IOS',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataOS'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('IDOS'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumF',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumF'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataOS'));

  result:=dict;
end;


function SolicitaTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('Cliente','',nxtNullString,8,0,False);
  dict.addfield('Projeto','',nxtNullString,15,0,False);
  dict.addfield('Tecnico','',nxtNullString,6,0,False);
  dict.addfield('Data','',nxtDateTime,0,0,False);
  dict.addfield('Item','',nxtByte,0,0,False);
  dict.addfield('Tipo','',nxtNullString,2,0,False);
  dict.addfield('Origem','',nxtNullString,1,0,False);
  dict.addfield('NomeResp','',nxtNullString,30,0,False);
  dict.addfield('Sync','',nxtBoolean,0,0,False);
  dict.addfield('DataRT','',nxtDateTime,0,0,False);
  dict.addfield('NomeRT','',nxtNullString,8,0,False);
  dict.addfield('LogID','',nxtInt32,8,0,False);
  fd:=dict.addfield('DownOk','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IChave',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Projeto'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Item'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISync',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sync'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILogID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDownOk',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DownOk'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  result:=dict;
end;


function SolicitaDescTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('Cliente','',nxtNullString,8,0,False);
  dict.addfield('Projeto','',nxtNullString,15,0,False);
  dict.addfield('Tecnico','',nxtNullString,6,0,False);
  dict.addfield('Data','',nxtDateTime,0,0,False);
  dict.addfield('Item','',nxtByte,3,0,False);
  dict.addfield('Pos','',nxtByte,0,0,False);
  dict.addfield('Texto','',nxtNullString,70,0,False);
  dict.addfield('Sync','',nxtBoolean,0,0,False);
  fd:=dict.addfield('Tipo','',nxtChar,1,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'E', cdvDefaultValue, fd.fdLength);
  dict.addfield('LogID','',nxtInt32,1,0,False);
  fd:=dict.addfield('DownOk','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IChave',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tipo'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Projeto'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tecnico'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Item'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Pos'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISync',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sync'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));
  kfd.ascend:=False;

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILogID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDownOk',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DownOk'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('LogID'));

  result:=dict;
end;


function TecnicoTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('ID','',nxtNullString,6,0,False);
  dict.addfield('Nome','',nxtNullString,30,0,False);
  dict.addfield('Senha','',nxtNullString,6,0,False);
  dict.addfield('Empresa','',nxtNullString,3,0,False);
  dict.addfield('ListaProj','',nxtChar,1,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INome',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Nome'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  result:=dict;
end;


function TipoHoraTableDataDictionary:TnxDataDictionary;
var
  dict:TnxDataDictionary;
  indexdescriptor:TnxIndexDescriptor;
  kfd:TnxKeyFieldDescriptor;
  fd:TnxFieldDescriptor;
  filedescriptorindex:integer;
begin
  dict:=TnxDataDictionary.create;

  filedescriptorindex:=0;
  dict.filedescriptor[filedescriptorindex].blocksize:=nxbs4k;
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('ID','',nxtNullString,15,0,False);
  dict.addfield('Descricao','',nxtNullString,30,0,False);
  dict.addfield('Tipo','',nxtChar,1,0,False);
  dict.addfield('SemTrans','',nxtChar,1,0,False);
  

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  result:=dict;
end;


procedure inittableslist;
begin
  if assigned(Ftables) then exit;
  Ftables:=Tstringlist.create;
  Ftables.addobject('AmarraFase',@AmarraFaseTableDataDictionary);
  Ftables.addobject('Cliente',@ClienteTableDataDictionary);
  Ftables.addobject('Fase',@FaseTableDataDictionary);
  Ftables.addobject('FaseTec',@FaseTecTableDataDictionary);
  Ftables.addobject('Feriado',@FeriadoTableDataDictionary);
  Ftables.addobject('Log',@LogTableDataDictionary);
  Ftables.addobject('Motivo',@MotivoTableDataDictionary);
  Ftables.addobject('Ocorrencia',@OcorrenciaTableDataDictionary);
  Ftables.addobject('OS',@OSTableDataDictionary);
  Ftables.addobject('OSFase',@OSFaseTableDataDictionary);
  Ftables.addobject('OSFaseDesc',@OSFaseDescTableDataDictionary);
  Ftables.addobject('Parametro',@ParametroTableDataDictionary);
  Ftables.addobject('Projeto',@ProjetoTableDataDictionary);
  Ftables.addobject('RA',@RATableDataDictionary);
  Ftables.addobject('RAF',@RAFTableDataDictionary);
  Ftables.addobject('RAFCli',@RAFCliTableDataDictionary);
  Ftables.addobject('RAFTec',@RAFTecTableDataDictionary);
  Ftables.addobject('RAItem',@RAItemTableDataDictionary);
  Ftables.addobject('RAOS',@RAOSTableDataDictionary);
  Ftables.addobject('Solicita',@SolicitaTableDataDictionary);
  Ftables.addobject('SolicitaDesc',@SolicitaDescTableDataDictionary);
  Ftables.addobject('Tecnico',@TecnicoTableDataDictionary);
  Ftables.addobject('TipoHora',@TipoHoraTableDataDictionary);
end;

procedure cleanuptableslist;
begin
  if assigned(Ftables) then
  begin
    Ftables.free;
    Ftables:=nil;
  end
end;

function TableDataDictionary(tablename:string):TnxDataDictionary;
var
  dictfn:TsmDictFn;
  idx:integer;
begin
  idx:=Ftables.indexof(tablename);
  dictfn:=TsmDictFn(Ftables.Objects[idx]);
  result:=dictfn(tablename);
end;

procedure CreateTableByDict(db:TnxDatabase;tablename:string;dict:TnxDataDictionary;overwrite:boolean=false);
begin
  db.createtable(overwrite,tablename,dict);
end;

procedure CreateTable(db:TnxDatabase;tablename:string;overwrite:boolean=false);
var
  dict:TnxDataDictionary;
begin
  dict:=tabledatadictionary(tablename);
  try
    CreateTableByDict(db,tablename,dict,overwrite);
  finally
    dict.free;
  end;
end;

function VerifyTableStructureByDict(db:TnxDatabase;tablename:string;dict:TnxDataDictionary):integer;
var
  tmptable:TnxTable;
begin
  result:=0;

  if not(db.tableexists(tablename)) then
  begin
    result:=1;
    exit;
  end;

  tmptable:=TnxTable.create(nil);
  try
    tmptable.database:=db;
    tmptable.tablename:=tablename;
    tmptable.open;
    if not(tmptable.dictionary.isequal(dict)) then
      result:=2;
  finally
    tmptable.free;
  end;
end;

function VerifyTableStructure(db:TnxDatabase;tablename:string):integer;
var
  dict:TnxDataDictionary;
begin
  dict:=tabledatadictionary(tablename);
  try
    result:=VerifyTableStructureByDict(db,tablename,dict);
  finally
    dict.free;
  end;
end;

procedure RestructureTableByDict(db:TnxDatabase;tablename:string;newdict:TnxDataDictionary;MatchFieldsBy:smallint=0;Restructuring:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);
var
  tmptable:TnxTable;
  idx:integer;
  dict:TnxDataDictionary;
  fieldmap:Tstringlist;
  done:boolean;
  TaskStatus : TnxTaskStatus;
  TaskInfo : TnxAbstractTaskInfo;
  res:Tnxresult;
  fieldname:string;
  newfield:string;
begin
  tmptable:=TnxTable.create(nil);
  try
    tmptable.database:=db;
    tmptable.tablename:=tablename;
    tmptable.open;
    dict:=TnxDataDictionary.create;
    try
      dict.assign(tmptable.dictionary);
      tmptable.close;
      tmptable.dictionary.assign(newdict);
      fieldmap:=Tstringlist.create;
      try
        for idx:=0 to dict.fieldcount-1 do
        begin
          if MatchFieldsBy=0 then
          begin
            if not(tmptable.Dictionary.GetFieldFromName(dict.fielddescriptor[idx].name)=-1) then
              fieldmap.add(dict.fielddescriptor[idx].name+'='+dict.fielddescriptor[idx].name)
            else begin
              if assigned(VerifyRenamedField) then
              begin
                newfield:='';
                VerifyRenamedField(tablename,dict.fielddescriptor[idx].name,newfield);
                if not(newfield='') then
                  fieldmap.add(newfield+'='+dict.fielddescriptor[idx].name);
              end;
            end;
          end;
          if MatchFieldsBy=1 then
          begin
            if (idx < newdict.FieldCount) then
            begin
              fieldname:=newdict.fielddescriptor[idx].name;
              fieldmap.add(fieldname+'='+dict.fielddescriptor[idx].name);
            end;
          end;
        end;
        res:=tmptable.restructuretable(newdict,fieldmap,taskinfo);
      finally
        fieldmap.free;
      end;
    finally
      dict.free;
    end;

    taskinfo.GetStatus(Done,TaskStatus);
    while not Done do
    begin
      if assigned(Restructuring) then Restructuring(tablename,TaskStatus.tsPercentDone);
      taskinfo.GetStatus(Done,TaskStatus);
    end;

  finally
    if assigned(taskinfo) then taskinfo.free;
    tmptable.free;
  end;
end;

procedure RestructureTable(db:TnxDatabase;tablename:string;MatchFieldsBy:smallint=0;Restructuring:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);
var
  dict:TnxDataDictionary;
begin
  dict:=TableDataDictionary(tablename);
  try
    RestructureTableByDict(db,tablename,dict,MatchFieldsBy,Restructuring,VerifyRenamedField);
  finally
    dict.free;
  end;
end;

procedure CreatediatecDatabase(db:TnxDatabase;overwrite:boolean=false;Creating:TnsmCreateDatabaseCb=nil);
var
  idx:integer;
  tablename:string;
begin
  for idx:=0 to Ftables.count-1 do
  begin
    tablename:=Ftables[idx];
    if assigned(Creating) then Creating(tablename,1);
    createtable(db,tablename,overwrite);
  end;
end;

procedure RestructurediatecDatabase(db:TnxDatabase;MatchFieldsBy:smallint=0;RestructuringDatabase:TnsmRestructureDatabaseCb=nil;RestructuringTable:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);
var
  idx:integer;
  tablename:string;
  res:smallint;
begin
  for idx:=0 to Ftables.count-1 do
  begin
    tablename:=Ftables[idx];
    res:=verifytablestructure(db,tablename);
    if assigned(RestructuringDatabase) then RestructuringDatabase(tablename,idx+1,res);
    if res=1 then createtable(db,tablename)
    else if res=2 then restructuretable(db,tablename,matchfieldsby,RestructuringTable,VerifyRenamedField);
  end;
end;

function VerifydiatecDatabase(db:TnxDatabase;Verifying:TnsmVerifyDatabaseCb=nil;verifyerror:TnsmVerifyDatabaseErrorCb=nil):boolean;
var
  idx:integer;
  tablename:string;
  res:smallint;
begin
  result:=true;
  for idx:=0 to Ftables.count-1 do
  begin
    tablename:=Ftables[idx];
    if assigned(Verifying) then Verifying(tablename,idx+1);
    res:=verifytablestructure(db,tablename);
    if not(res=0) then
    begin
      result:=false;
      if assigned(verifyerror) then verifyerror(tablename);
    end;
  end;
end;

function diatecDbVersion:string;
begin
  result:='';
end;

function diatecTablesCount:integer;
begin
  result:=23;
end;

procedure diatecGetTableNames(tables:Tstrings);
begin
  tables.assign(Ftables);
end;

initialization
  inittableslist;
finalization
  cleanuptableslist;
end.
