unit ncEstruturaTabs;

//************************************************
//*   Source created with NexusDb Source Maker   *
//*                 Version 1.1.4                *
//*                                              *
//*               by Roberto Nicchi              *
//*            M a s t e r Informatica           *
//*                    Italy                     *
//*         software@masterinformatica.net       *
//*                                              *
//*       Source creation date: 9/1/2009       *
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

procedure CreateNexCafeDatabase(db:TnxDatabase;overwrite:boolean=false;creating:TnsmCreateDatabaseCb=nil);

procedure RestructureNexCafeDatabase(db:TnxDatabase;MatchFieldsBy:smallint=0;RestructuringDatabase:TnsmRestructureDatabaseCb=nil;RestructuringTable:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);

function VerifyNexCafeDatabase(db:TnxDatabase;Verifying:TnsmVerifyDatabaseCb=nil;verifyerror:TnsmVerifyDatabaseErrorCb=nil):boolean;

function NexCafeDbVersion:string;

function NexCafeTablesCount:integer;

procedure NexCafeGetTableNames(tables:Tstrings);

// Tables methods

function TableDataDictionary(tablename:string):TnxDataDictionary;

procedure CreateTableByDict(db:TnxDatabase;tablename:string;dict:TnxDataDictionary;overwrite:boolean=false);

procedure CreateTable(db:TnxDatabase;tablename:string;overwrite:boolean=false);

function VerifyTableStructureByDict(db:TnxDatabase;tablename:string;dict:TnxDataDictionary):integer;

function VerifyTableStructure(db:TnxDatabase;tablename:string):integer;

procedure RestructureTableByDict(db:TnxDatabase;tablename:string;newdict:TnxDataDictionary;MatchFieldsBy:smallint=0;Restructuring:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);

procedure RestructureTable(db:TnxDatabase;tablename:string;MatchFieldsBy:smallint=0;Restructuring:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);

function AvisoTableDataDictionary:TnxDataDictionary;
function CaixaTableDataDictionary:TnxDataDictionary;
function CategoriaTableDataDictionary:TnxDataDictionary;
function ChatTableDataDictionary:TnxDataDictionary;
function ClienteTableDataDictionary:TnxDataDictionary;
function ConfigTableDataDictionary:TnxDataDictionary;
function DebitoTableDataDictionary:TnxDataDictionary;
function EmailCorpoTableDataDictionary:TnxDataDictionary;
function EmailCriarTableDataDictionary:TnxDataDictionary;
function EmailEnvioTableDataDictionary:TnxDataDictionary;
function EsperaTableDataDictionary:TnxDataDictionary;
function ETarTableDataDictionary:TnxDataDictionary;
function FiltroWebTableDataDictionary:TnxDataDictionary;
function HCredTableDataDictionary:TnxDataDictionary;
function HPassTableDataDictionary:TnxDataDictionary;
function HTarTableDataDictionary:TnxDataDictionary;
function ImpressaoTableDataDictionary:TnxDataDictionary;
function ITranTableDataDictionary:TnxDataDictionary;
function LayoutTableDataDictionary:TnxDataDictionary;
function LogTableDataDictionary:TnxDataDictionary;
function LogAppTableDataDictionary:TnxDataDictionary;
function LogNomTableDataDictionary:TnxDataDictionary;
function LogUrlTableDataDictionary:TnxDataDictionary;
function MaqTableDataDictionary:TnxDataDictionary;
function MaquinaTableDataDictionary:TnxDataDictionary;
function MovEstTableDataDictionary:TnxDataDictionary;
function OcupacaoTableDataDictionary:TnxDataDictionary;
function PacoteTableDataDictionary:TnxDataDictionary;
function PassaporteTableDataDictionary:TnxDataDictionary;
function PatrocinioTableDataDictionary:TnxDataDictionary;
function ProcessosTableDataDictionary:TnxDataDictionary;
function ProdutoTableDataDictionary:TnxDataDictionary;
function ReciboTableDataDictionary:TnxDataDictionary;
function SessaoTableDataDictionary:TnxDataDictionary;
function TarifaTableDataDictionary:TnxDataDictionary;
function TempoTableDataDictionary:TnxDataDictionary;
function TipoAcessoTableDataDictionary:TnxDataDictionary;
function TipoImpTableDataDictionary:TnxDataDictionary;
function TipoPassTableDataDictionary:TnxDataDictionary;
function TranTableDataDictionary:TnxDataDictionary;
function UsuarioTableDataDictionary:TnxDataDictionary;
function BiometriaTableDataDictionary:TnxDataDictionary;


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


function AvisoTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('Minutos','',nxtWord16,0,0,False);
  dict.addfield('AvisoTexto','',nxtNullString,50,0,False);
  dict.addfield('SegAvisoTexto','',nxtByte,0,0,False);
  dict.addfield('Tipo','',nxtByte,0,0,False);
  dict.addfield('PiscarAvisoTexto','',nxtBoolean,0,0,False);
  dict.addfield('Som','',nxtBlob,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IMinutos',filedescriptorindex,False,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Minutos'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  result:=dict;
end;


function CaixaTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Aberto','',nxtBoolean,0,0,False);
  dict.addfield('Usuario','',nxtNullString,20,0,False);
  dict.addfield('Abertura','',nxtDateTime,0,0,False);
  dict.addfield('Fechamento','',nxtDateTime,0,0,False);
  dict.addfield('Reproc','',nxtDateTime,0,0,False);
  dict.addfield('TotalFinal','',nxtCurrency,0,0,False);
  dict.addfield('Descontos','',nxtCurrency,0,0,False);
  dict.addfield('Cancelamentos','',nxtCurrency,0,0,False);
  dict.addfield('Sangria','',nxtCurrency,0,0,False);
  dict.addfield('Supr','',nxtCurrency,0,0,False);
  dict.addfield('SaldoAnt','',nxtCurrency,0,0,False);
  dict.addfield('Obs','',nxtBlobMemo,0,0,False);
  dict.addfield('EstSessoesQtd','',nxtInt32,0,0,False);
  dict.addfield('EstSessoesTempo','',nxtDouble,0,0,False);
  dict.addfield('EstUrls','',nxtInt32,0,0,False);
  dict.addfield('EstSyncOk','',nxtBoolean,0,0,False);
  dict.addfield('EstBuscasEng','',nxtBlobMemo,0,0,False);
  dict.addfield('EstRes','',nxtBlobMemo,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IUsuario',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Usuario'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Abertura'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IAbertura',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Abertura'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IAberto',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Aberto'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Abertura'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IAbertoEstSyncOk',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Aberto'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('EstSyncOk'));

  result:=dict;
end;


function CategoriaTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('Descricao','',nxtNullString,35,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('Nome',filedescriptorindex,False,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Descricao'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  result:=dict;
end;


function ChatTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('De','',nxtInt32,0,0,False);
  dict.addfield('Para','',nxtInt32,0,0,False);
  dict.addfield('DataHora','',nxtDateTime,0,0,False);
  dict.addfield('Texto','',nxtBlobMemo,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDataHora',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDe',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('De'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IPara',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Para'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

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

  dict.addfield('ID','',nxtAutoinc,10,0,False);
  dict.addfield('Nome','',nxtNullString,40,0,False);
  dict.addfield('Endereco','',nxtNullString,50,0,False);
  dict.addfield('Bairro','',nxtNullString,20,0,False);
  dict.addfield('Cidade','',nxtNullString,30,0,False);
  dict.addfield('UF','',nxtNullString,2,0,False);
  dict.addfield('CEP','',nxtNullString,10,0,False);
  dict.addfield('Nasc','',nxtDateTime,0,0,False);
  dict.addfield('Sexo','M=Masculo, F=Feminino',nxtChar,1,0,False);
  dict.addfield('Obs','',nxtBlobMemo,0,0,False);
  dict.addfield('Cpf','',nxtNullString,14,0,False);
  dict.addfield('Rg','',nxtNullString,14,0,False);
  dict.addfield('Telefone','',nxtNullString,15,0,False);
  dict.addfield('Email','',nxtBlobMemo,0,0,False);
  dict.addfield('Minutos','',nxtDouble,10,0,False);
  dict.addfield('Passaportes','',nxtDouble,10,0,False);
  dict.addfield('MinutosUsados','',nxtDouble,10,0,False);
  dict.addfield('MinutosIniciais','',nxtDouble,10,0,False);
  dict.addfield('Isento','',nxtBoolean,0,0,False);
  dict.addfield('Username','',nxtNullString,40,0,False);
  dict.addfield('Pai','',nxtNullString,40,0,False);
  dict.addfield('Mae','',nxtNullString,40,0,False);
  dict.addfield('Senha','',nxtNullString,20,0,False);
  dict.addfield('UltVisita','',nxtDateTime,0,0,False);
  dict.addfield('Debito','',nxtCurrency,0,0,False);
  dict.addfield('Escola','',nxtNullString,40,0,False);
  dict.addfield('EscolaHI','',nxtDateTime,0,0,False);
  dict.addfield('EscolaHF','',nxtDateTime,0,0,False);
  dict.addfield('NickName','',nxtNullString,30,0,False);
  dict.addfield('DataNasc','',nxtDateTime,0,0,False);
  dict.addfield('Celular','',nxtNullString,15,0,False);
  dict.addfield('TemDebito','',nxtBoolean,0,0,False);
  dict.addfield('LimiteDebito','',nxtCurrency,0,0,False);
  dict.addfield('Foto','',nxtBlobGraphic,0,0,False);
  dict.addfield('IncluidoEm','',nxtDateTime,0,0,False);
  dict.addfield('AlteradoEm','',nxtDateTime,0,0,False);
  dict.addfield('IncluidoPor','',nxtNullString,10,0,False);
  dict.addfield('AlteradoPor','',nxtNullString,10,0,False);
  dict.addfield('TitEleitor','',nxtNullString,13,0,False);
  dict.addfield('FidPontos','',nxtDouble,10,0,False);
  dict.addfield('FidTotal','',nxtDouble,10,0,False);
  dict.addfield('FidResg','',nxtDouble,10,0,False);
  
  fd:=dict.addfield('NaoGuardarCredito','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('PermiteLoginSemCred','',nxtBoolean,0,0,False);
  fd:=dict.addfield('HP1','',nxtWord32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '2147483647', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('HP2','',nxtWord32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '2147483647', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('HP3','',nxtWord32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '2147483647', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('HP4','',nxtWord32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '2147483647', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('HP5','',nxtWord32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '2147483647', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('HP6','',nxtWord32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '2147483647', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('HP7','',nxtWord32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '2147483647', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('Inativo','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('TipoAcessoPref','',nxtInt32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '-1', cdvDefaultValue, fd.fdLength);
  dict.addfield('ValorCred','',nxtCurrency,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,False,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INome',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Nome'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IUsername',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Username'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IRg',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Rg'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDebito',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('TemDebito'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Nome'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IFidPontos',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('FidPontos'));

  result:=dict;
end;


function ConfigTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('NumSeq','',nxtAutoinc,10,0,False);
  dict.addfield('FecharProgramas','',nxtBoolean,0,0,False);
  dict.addfield('AutoExecutar','',nxtNullString,200,0,False);
  dict.addfield('LimiteTempoPadrao','',nxtDateTime,0,0,False);
  dict.addfield('PacoteTempoReal','',nxtBoolean,0,0,False);
  dict.addfield('PermiteLoginSemCred','',nxtBoolean,0,0,False);
  fd:=dict.addfield('AlteraLoginSemCred','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('EncerramentoPrePago','',nxtByte,0,0,False);
  fd:=dict.addfield('EncerramentoCartao','',nxtByte,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '1', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('TempoEPrePago','',nxtWord16,5,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '60', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('TempoECartao','',nxtWord16,5,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '60', cdvDefaultValue, fd.fdLength);
  dict.addfield('PermiteCapturaTela','',nxtBoolean,0,0,False);
  fd:=dict.addfield('VariosTiposAcesso','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('ModoPagtoAcesso','',nxtByte,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('MostraPrePagoDec','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('MostraNomeMaq','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  dict.addfield('TempoMaxAlerta','',nxtDateTime,0,0,False);
  dict.addfield('Abre1','',nxtDateTime,0,0,False);
  dict.addfield('Abre2','',nxtDateTime,0,0,False);
  dict.addfield('Abre3','',nxtDateTime,0,0,False);
  dict.addfield('Abre4','',nxtDateTime,0,0,False);
  dict.addfield('Abre5','',nxtDateTime,0,0,False);
  dict.addfield('Abre6','',nxtDateTime,0,0,False);
  dict.addfield('Abre7','',nxtDateTime,0,0,False);
  dict.addfield('Fecha1','',nxtDateTime,0,0,False);
  dict.addfield('Fecha2','',nxtDateTime,0,0,False);
  dict.addfield('Fecha3','',nxtDateTime,0,0,False);
  dict.addfield('Fecha4','',nxtDateTime,0,0,False);
  dict.addfield('Fecha5','',nxtDateTime,0,0,False);
  dict.addfield('Fecha6','',nxtDateTime,0,0,False);
  dict.addfield('Fecha7','',nxtDateTime,0,0,False);
  dict.addfield('CorLivre','',nxtInt32,0,0,False);
  dict.addfield('CorFLivre','',nxtInt32,0,0,False);
  dict.addfield('CorUsoPrePago','',nxtInt32,0,0,False);
  dict.addfield('CorFUsoPrePago','',nxtInt32,0,0,False);
  dict.addfield('CorUsoPosPago','',nxtInt32,0,0,False);
  dict.addfield('CorFUsoPosPago','',nxtInt32,0,0,False);
  dict.addfield('CorAguardaPagto','',nxtInt32,0,0,False);
  dict.addfield('CorFAguardaPagto','',nxtInt32,0,0,False);
  dict.addfield('CorManutencao','',nxtInt32,0,0,False);
  dict.addfield('CorFManutencao','',nxtInt32,0,0,False);
  dict.addfield('CorPausado','',nxtInt32,0,0,False);
  dict.addfield('CorFPausado','',nxtInt32,0,0,False);
  dict.addfield('CorDesktop','',nxtInt32,0,0,False);
  dict.addfield('CorFDesktop','',nxtInt32,0,0,False);
  fd:=dict.addfield('CorMaqManut','',nxtInt32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('CorFMaqManut','',nxtInt32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '12632256', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('CorPrevisao','',nxtInt32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '255', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('CorFPrevisao','',nxtInt32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '16777215', cdvDefaultValue, fd.fdLength);
  dict.addfield('CampoLocalizaCli','0=nome, 1=username, 2=código',nxtByte,0,0,False);
  dict.addfield('ManterSaldoCaixa','',nxtBoolean,0,0,False);
  dict.addfield('NaoMostrarMsgDebito','',nxtBoolean,0,0,False);
  fd:=dict.addfield('NaoCobrarImpFunc','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('Tolerancia','',nxtDateTime,0,0,False);
  dict.addfield('RegImp98','',nxtBoolean,0,0,False);
  dict.addfield('LimitePadraoDebito','',nxtCurrency,0,0,False);
  dict.addfield('RecPorta','',nxtNullString,10,0,False);
  dict.addfield('RecSalto','',nxtWord16,5,0,False);
  dict.addfield('RecLargura','',nxtWord16,5,0,False);
  dict.addfield('RecRodape','',nxtBlobMemo,0,0,False);
  dict.addfield('RecImprimir','',nxtByte,0,0,False);
  dict.addfield('RecMatricial','',nxtBoolean,0,0,False);
  dict.addfield('RecNomeLoja','',nxtNullString,40,0,False);
  fd:=dict.addfield('MostraProgAtual','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  dict.addfield('MostraObs','',nxtBoolean,0,0,False);
  dict.addfield('EscondeTextoBotoes','',nxtBoolean,0,0,False);
  dict.addfield('EscondeTipoAcesso','',nxtBoolean,0,0,False);
  dict.addfield('ExigirRG','',nxtBoolean,0,0,False);
  dict.addfield('TipoFDesktop','',nxtNullString,3,0,False);
  dict.addfield('TipoFLogin','',nxtNullString,3,0,False);
  dict.addfield('NumFDesktop','',nxtInt32,0,0,False);
  dict.addfield('NumFLogin','',nxtInt32,0,0,False);
  dict.addfield('MostrarApenasPIN','',nxtBoolean,0,0,False);
  dict.addfield('TextoPIN','',nxtNullString,30,0,False);
  dict.addfield('AlterarSenhaCli','',nxtBoolean,0,0,False);
  dict.addfield('VerSenhaCli','',nxtBoolean,0,0,False);
  dict.addfield('CliCadPadrao','',nxtBoolean,0,0,False);
  dict.addfield('ControlaImp','',nxtByte,0,0,False);
  dict.addfield('FiltrarWEB','',nxtBoolean,0,0,False);
  dict.addfield('SiteRedirFiltro','',nxtNullString,80,0,False);
  dict.addfield('PastaDownload','',nxtNullString,1024,0,False);
  fd:=dict.addfield('MinutosDesligaMaq','',nxtByte,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('BloqDownload','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('BloqMenuIniciar','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('BloqPainelCtrl','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('BloqCtrlAltDel','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('BloqExecutar','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('BloqMeusLocaisRede','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('BloqTray','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('BloqBotaoDir','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('TempoB1','',nxtWord16,5,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '10', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('TempoB2','',nxtWord16,5,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '15', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('TempoB3','',nxtWord16,5,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '30', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('TempoB4','',nxtWord16,5,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '60', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('TempoB5','',nxtWord16,5,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '120', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('TempoB6','',nxtWord16,5,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '180', cdvDefaultValue, fd.fdLength);
  dict.addfield('PaginaInicial','',nxtNullString,200,0,False);
  dict.addfield('EsconderCronometro','',nxtBoolean,0,0,False);
  dict.addfield('AposEncerrar','',nxtByte,0,0,False);
  dict.addfield('AlinhaBarraGuard','',nxtByte,0,0,False);
  dict.addfield('NoNet','',nxtByte,0,0,False);
  dict.addfield('TempoSumirLogin','',nxtWord16,0,0,False);
  dict.addfield('EsconderDrives','',nxtNullString,30,0,False);
  fd:=dict.addfield('EmailMetodo','',nxtByte,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  dict.addfield('EmailServ','',nxtNullString,50,0,False);
  dict.addfield('EmailUsername','',nxtNullString,50,0,False);
  dict.addfield('EmailSenha','',nxtNullString,50,0,False);
  dict.addfield('EmailDestino','',nxtBlobMemo,0,0,False);
  fd:=dict.addfield('EmailEnviarCaixa','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('CredPadraoTipo','',nxtByte,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '1', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('CredPadraoCod','',nxtInt32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('PgVendas','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('PgVendaAvulsa','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('PgAcesso','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('PgTempo','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('PgImp','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('BloquearUsoEmHorarioNP','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('OpcaoChat','',nxtByte,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('SalvarCodUsername','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('ContinuarCredTempo','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('NaoGuardarCreditoCli','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('RelCaixaAuto','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('SincronizarHorarios','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('MostrarDebitoNoGuard','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('BloquearLoginAlemMaxDeb','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('ClienteNaoAlteraSenha','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('NaoObrigarSenhaCliente','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('NaoVenderAlemEstoque','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('CreditoComoValor','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('CliAvulsoNaoEncerra','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('AutoSortGridCaixa','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('AvisoFimTempoAdminS','',nxtByte,0,0,False);
  fd:=dict.addfield('DetectarImpServ','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('AvisoCreditos','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('ClientePodeVerCred','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('ChatAlertaSonoro','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('ChatMostraNotificacao','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('ModoCredGuard','',nxtByte,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('MsgFimCred','',nxtNullString,150,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'Você possui outros créditos que não podem ser utilizados no momento. Para maiores informações consulte o atendente.', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('SemLogin','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('AutoObsAoCancelar','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('FidAtivo','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('FidSessaoValor','',nxtCurrency,0,0,False);
  dict.addfield('FidSessaoPontos','',nxtInt32,0,0,False);
  dict.addfield('FidVendaValor','',nxtCurrency,0,0,False);
  dict.addfield('FidVendaPontos','',nxtInt32,0,0,False);
  dict.addfield('FidImpValor','',nxtCurrency,0,0,False);
  dict.addfield('FidImpPontos','',nxtInt32,0,0,False);
  fd:=dict.addfield('FidParcial','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('FidAutoPremiar','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('FidTipoPremioAuto','',nxtByte,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  dict.addfield('FidPremioAuto','',nxtInt32,0,0,False);
  fd:=dict.addfield('FidMostrarSaldoGuard','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('FidMostrarSaldoAdmin','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('CliCadNaoEncerra','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('ImpedirPosPago','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('AutoLigarMaqCli','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);

  fd:=dict.addfield('Biometria','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, False, cdvDefaultValue, fd.fdLength);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumSeq',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumSeq'));

  result:=dict;
end;


function DebitoTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('Data','',nxtDateTime,0,0,False);
  dict.addfield('Cliente','',nxtWord32,0,0,False);
  dict.addfield('Valor','',nxtCurrency,0,0,False);
  fd:=dict.addfield('Tipo','0=Sessao, 1=Credito Tempo, 2=Produto',nxtByte,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  dict.addfield('ID','',nxtWord32,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICliData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITipoID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tipo'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));

  result:=dict;
end;


function EmailCorpoTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Corpo','',nxtBlobMemo,0,0,False);
  dict.addfield('Destino','',nxtBlobMemo,0,0,False);
  dict.addfield('Anexos','',nxtBlobMemo,0,0,False);
  dict.addfield('Assunto','',nxtNullString,100,0,False);
  dict.addfield('Inclusao','',nxtDateTime,0,0,False);
  dict.addfield('Restam','',nxtInt32,0,0,False);
  dict.addfield('EnviarEm','',nxtDateTime,0,0,False);
  dict.addfield('Processou','',nxtBoolean,0,0,False);
  dict.addfield('ApagarAnexosAposEnvio','',nxtBoolean,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IProcessou',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Processou'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('EnviarEm'));

  result:=dict;
end;


function EmailCriarTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Tipo','',nxtInt32,0,0,False);
  dict.addfield('Parametros','',nxtBlobMemo,0,0,False);
  dict.addfield('Destino','',nxtBlobMemo,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  result:=dict;
end;


function EmailEnvioTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Corpo','',nxtInt32,0,0,False);
  dict.addfield('Destino','',nxtBlobMemo,0,0,False);
  dict.addfield('Inclusao','',nxtDateTime,0,0,False);
  dict.addfield('Envio','',nxtDateTime,0,0,False);
  dict.addfield('Tentativas','',nxtWord16,0,0,False);
  dict.addfield('Enviar','',nxtBoolean,0,0,False);
  dict.addfield('MsgErro','',nxtBlobMemo,0,0,False);
  dict.addfield('OK','',nxtBoolean,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICorpo',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Corpo'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IEnviar',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Enviar'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('OK'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  result:=dict;
end;


function EsperaTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Pos','',nxtInt32,0,0,False);
  dict.addfield('Cliente','',nxtInt32,0,0,False);
  dict.addfield('NomeCliente','',nxtNullString,50,0,False);
  dict.addfield('DataHora','',nxtDateTime,0,0,False);
  dict.addfield('Previsao','',nxtDateTime,0,0,False);
  dict.addfield('PrevMaq','',nxtWord16,0,0,False);
  dict.addfield('PrevSessao','',nxtInt32,0,0,False);
  dict.addfield('Obs','',nxtNullString,50,0,False);
  dict.addfield('Cartao','',nxtNullString,20,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IPos',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Pos'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IMaqSessao',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('PrevMaq'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('PrevSessao'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICartao',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cartao'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICliente',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));

  result:=dict;
end;


function ETarTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('TipoAcesso','',nxtWord16,0,0,False);
  dict.addfield('Cor','',nxtInt32,0,0,False);
  dict.addfield('Pos','',nxtWord16,0,0,False);
  dict.addfield('Valor','',nxtCurrency,0,0,False);
  dict.addfield('Tempo','',nxtDateTime,0,0,False);
  dict.addfield('ValorMin','',nxtCurrency,0,0,False);
  dict.addfield('Tolerancia','',nxtDateTime,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IPrim',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('TipoAcesso'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cor'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Pos'));

  result:=dict;
end;


function FiltroWebTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('URL','',nxtNullString,300,0,False);
  fd:=dict.addfield('Liberar','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IURL',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('URL'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  result:=dict;
end;


function HCredTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('DataHora','',nxtDateTime,0,0,False);
  dict.addfield('Tipo','0=tempo, 1=valor',nxtByte,0,0,False);
  dict.addfield('Cliente','',nxtWord32,0,0,False);
  dict.addfield('Sessao','',nxtWord32,0,0,False);
  dict.addfield('Tran','',nxtWord32,0,0,False);
  dict.addfield('SaldoAnt','',nxtDouble,0,0,False);
  dict.addfield('Quant','',nxtDouble,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICliTipoID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tipo'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICliTipoDH',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tipo'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  result:=dict;
end;


function HPassTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Passaporte','',nxtWord32,10,0,False);
  dict.addfield('Sessao','',nxtWord32,10,0,False);
  dict.addfield('DataHora','',nxtDateTime,0,0,False);
  fd:=dict.addfield('Cancelado','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('MinutosAnt','',nxtDouble,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  dict.addfield('MinutosUsados','',nxtDouble,0,0,False);
  fd:=dict.addfield('Expirou','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IPassSessao',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Passaporte'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sessao'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISessaoPass',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sessao'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Passaporte'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IPassData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Passaporte'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  result:=dict;
end;


function HTarTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('TipoAcesso','',nxtWord16,0,0,False);
  dict.addfield('Dia','',nxtByte,0,0,False);
  dict.addfield('Hora','',nxtByte,0,0,False);
  dict.addfield('Cor','',nxtInt32,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IPrim',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('TipoAcesso'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Dia'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Hora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITipoAcessoCor',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('TipoAcesso'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cor'));

  result:=dict;
end;


function ImpressaoTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('ID','',nxtAutoinc,10,0,False);
  dict.addfield('Tran','',nxtInt32,0,0,False);
  dict.addfield('Caixa','',nxtInt32,0,0,False);
  fd:=dict.addfield('Manual','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('DataHora','',nxtDateTime,0,0,False);
  dict.addfield('Computador','',nxtNullString,200,0,False);
  dict.addfield('Maquina','',nxtWord16,5,0,False);
  dict.addfield('Paginas','',nxtWord16,0,0,False);
  dict.addfield('Impressora','',nxtNullString,200,0,False);
  dict.addfield('Documento','',nxtBlobMemo,0,0,False);
  dict.addfield('Sessao','',nxtWord32,0,0,False);
  dict.addfield('Resultado','0-Completou, 1-Erro',nxtByte,0,0,False);
  dict.addfield('q1','',nxtWord16,0,0,False);
  dict.addfield('q2','',nxtWord16,0,0,False);
  dict.addfield('q3','',nxtWord16,0,0,False);
  dict.addfield('q4','',nxtWord16,0,0,False);
  dict.addfield('q5','',nxtWord16,0,0,False);
  dict.addfield('q6','',nxtWord16,0,0,False);
  dict.addfield('q7','',nxtWord16,0,0,False);
  dict.addfield('q8','',nxtWord16,0,0,False);
  dict.addfield('q9','',nxtWord16,0,0,False);
  dict.addfield('q10','',nxtWord16,0,0,False);
  dict.addfield('v1','',nxtCurrency,0,0,False);
  dict.addfield('v2','',nxtCurrency,0,0,False);
  dict.addfield('v3','',nxtCurrency,0,0,False);
  dict.addfield('v4','',nxtCurrency,0,0,False);
  dict.addfield('v5','',nxtCurrency,0,0,False);
  dict.addfield('v6','',nxtCurrency,0,0,False);
  dict.addfield('v7','',nxtCurrency,0,0,False);
  dict.addfield('v8','',nxtCurrency,0,0,False);
  dict.addfield('v9','',nxtCurrency,0,0,False);
  dict.addfield('v10','',nxtCurrency,0,0,False);
  dict.addfield('Total','',nxtCurrency,0,0,False);
  dict.addfield('Desconto','',nxtCurrency,0,0,False);
  dict.addfield('PagoPost','',nxtCurrency,0,0,False);
  dict.addfield('DescPost','',nxtCurrency,0,0,False);
  dict.addfield('Pago','',nxtCurrency,0,0,False);
  dict.addfield('Func','',nxtNullString,20,0,False);
  dict.addfield('Cliente','',nxtInt32,10,0,False);
  fd:=dict.addfield('Cancelado','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('x75','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));
  kfd.ascend:=False;

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICaixa',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IAcesso',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sessao'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IMaquina',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Maquina'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IComputador',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Computador'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDataHora',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));
  kfd.ascend:=False;

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISessaoID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sessao'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITran',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tran'));
  kfd.ascend:=False;

  result:=dict;
end;


function ITranTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Tran','',nxtWord32,0,0,False);
  dict.addfield('Caixa','',nxtWord32,0,0,False);
  dict.addfield('Cliente','',nxtWord32,0,0,False);
  dict.addfield('Sessao','',nxtWord32,0,0,False);
  dict.addfield('DataHora','',nxtDateTime,0,0,False);
  dict.addfield('TipoTran','',nxtByte,0,0,False);
  dict.addfield('TipoItem','Sessao, Tempo, MovEst, Transação',nxtByte,0,0,False);
  dict.addfield('SubTipo','',nxtByte,0,0,False);
  dict.addfield('ItemID','',nxtWord32,0,0,False);
  dict.addfield('SubItemID','',nxtWord32,0,0,False);
  dict.addfield('ItemPos','',nxtByte,0,0,False);
  dict.addfield('Total','',nxtCurrency,0,0,False);
  dict.addfield('Desconto','',nxtCurrency,0,0,False);
  dict.addfield('Debito','',nxtCurrency,0,0,False);
  dict.addfield('Pago','',nxtCurrency,0,0,False);
  dict.addfield('Cancelado','',nxtBoolean,0,0,False);
  dict.addfield('FidFator','',nxtInt8,0,0,False);
  dict.addfield('FidPontos','',nxtDouble,0,0,False);
  dict.addfield('FidMov','',nxtBoolean,0,0,False);
  fd:=dict.addfield('FidOpe','',nxtByte,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITipoItemDH',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('TipoItem'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ItemID'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITranID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tran'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IClienteID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITipoItemTran',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('TipoItem'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ItemID'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tran'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IFidMovClienteDH',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('FidMov'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  result:=dict;
end;


function LayoutTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('Usuario','',nxtNullString,20,0,False);
  dict.addfield('Grid','',nxtNullString,40,0,False);
  dict.addfield('Nome','',nxtNullString,100,0,False);
  dict.addfield('Publico','',nxtBoolean,0,0,False);
  dict.addfield('Layout','',nxtBlob,0,0,False);
  dict.addfield('Filtro','',nxtBlob,0,0,False);
  dict.addfield('Usuarios','',nxtBlobMemo,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IPubGridUsuario',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Publico'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Grid'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Usuario'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Nome'),TnxExtTextKeyFieldDescriptor);
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
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('ID','',nxtAutoinc,10,0,False);
  dict.addfield('DiaHora','',nxtDateTime,0,0,False);
  dict.addfield('Maquina','',nxtWord16,0,0,False);
  dict.addfield('Usuario','',nxtNullString,20,0,False);
  dict.addfield('Programa','0=nenhum, 1=ncguard, 2=ncadmin, 3=ncserver',nxtByte,3,0,False);
  dict.addfield('Operacao','',nxtNullString,70,0,False);
  dict.addfield('Horas','',nxtDateTime,0,0,False);
  dict.addfield('Dias','',nxtWord16,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDiaHora',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DiaHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IUsuarioNumSeq',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IUsuarioDiaHora',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Usuario'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DiaHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IProgramaMaq',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Programa'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Maquina'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  result:=dict;
end;


function LogAppTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Caixa','',nxtInt32,0,0,False);
  dict.addfield('Sessao','',nxtInt32,0,0,False);
  dict.addfield('Cliente','',nxtInt32,0,0,False);
  dict.addfield('Inicio','',nxtDateTime,0,0,False);
  dict.addfield('Fim','',nxtDateTime,0,0,False);
  dict.addfield('Minutos','',nxtDouble,0,0,False);
  dict.addfield('Exe','',nxtNullString,16,0,False);
  dict.addfield('Caminho','',nxtNullString,16,0,False);
  dict.addfield('Titulo','',nxtNullString,16,0,False);
  dict.addfield('URL','',nxtInt32,0,0,False);
  dict.addfield('Maq','',nxtWord16,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IInicio',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Inicio'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IClienteInicio',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Inicio'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IMaq',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Maq'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Inicio'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISessaoID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sessao'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICaixa',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));

  result:=dict;
end;


function LogNomTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('ID','',nxtNullString,16,0,False);
  dict.addfield('Type','H=Host, D=Dominio, P=Pagina, S=Search Argument, E=Executavel, C=Caminho, T=Titulo',nxtChar,1,0,False);
  dict.addfield('Nome','',nxtBlobMemo,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  result:=dict;
end;


function LogUrlTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Caixa','',nxtInt32,10,0,False);
  dict.addfield('Cliente','',nxtInt32,10,0,False);
  dict.addfield('Maq','',nxtWord16,5,0,False);
  dict.addfield('Sessao','',nxtInt32,10,0,False);
  dict.addfield('Host','',nxtNullString,16,0,False);
  dict.addfield('Dominio','',nxtNullString,16,0,False);
  dict.addfield('Pagina','',nxtNullString,16,0,False);
  dict.addfield('SearchArg','',nxtNullString,16,0,False);
  dict.addfield('SearchEng','',nxtNullString,2,0,False);
  dict.addfield('ViewTime','',nxtDouble,0,0,False);
  dict.addfield('FirstView','',nxtDateTime,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IClienteFirstView',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('FirstView'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISessaoHostPagina',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sessao'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Host'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Pagina'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICaixa',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));

  result:=dict;
end;


function MaqTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('Numero','',nxtWord16,0,0,False);
  dict.addfield('Nome','',nxtNullString,30,0,False);
  dict.addfield('Menu','',nxtBlobMemo,0,0,False);
  dict.addfield('Recursos','',nxtBlobMemo,0,0,False);
  dict.addfield('ComputerName','',nxtNullString,200,0,False);
  fd:=dict.addfield('TipoAcesso','',nxtInt32,10,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '-1', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('EmManutencao','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('Obs','',nxtBlobMemo,0,0,False);
  dict.addfield('IP','',nxtNullString,15,0,False);
  dict.addfield('MacAddress','',nxtNullString,20,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumero',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Numero'));

  result:=dict;
end;


function MaquinaTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('Numero','',nxtWord16,0,0,False);
  dict.addfield('Nome','',nxtNullString,30,0,False);
  dict.addfield('Menu','',nxtBlobMemo,0,0,False);
  dict.addfield('Recursos','',nxtBlobMemo,0,0,False);
  dict.addfield('ComputerName','',nxtNullString,200,0,False);
  fd:=dict.addfield('TipoAcesso','',nxtInt32,10,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '-1', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('EmManutencao','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('Obs','',nxtBlobMemo,0,0,False);
  dict.addfield('ProgramaAtual','',nxtBlobMemo,0,0,False);
  dict.addfield('SiteAtual','',nxtBlobMemo,0,0,False);
  dict.addfield('IP','',nxtNullString,15,0,False);
  dict.addfield('MacAddress','',nxtNullString,20,0,False);
  dict.addfield('Patrocinio','',nxtNullString,20,0,False);
  dict.addfield('DisplayH','',nxtWord16,0,0,False);
  dict.addfield('DisplayW','',nxtWord16,0,0,False);
  dict.addfield('DisplayWH','',nxtNullString,10,0,False);
  
  fd:=dict.addfield('AvisaFimTempo','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumero',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Numero'));

  result:=dict;
end;


function MovEstTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('ID','',nxtAutoinc,10,0,False);
  dict.addfield('Tran','',nxtWord32,0,0,False);
  dict.addfield('Produto','',nxtWord32,10,0,False);
  dict.addfield('Quant','',nxtDouble,0,0,False);
  dict.addfield('Unitario','',nxtCurrency,0,0,False);
  dict.addfield('Total','',nxtCurrency,0,0,False);
  dict.addfield('CustoU','',nxtCurrency,0,0,False);
  dict.addfield('Item','',nxtByte,0,0,False);
  dict.addfield('Desconto','',nxtCurrency,0,0,False);
  dict.addfield('Pago','',nxtCurrency,0,0,False);
  dict.addfield('PagoPost','',nxtCurrency,0,0,False);
  dict.addfield('DescPost','',nxtCurrency,0,0,False);
  dict.addfield('DataHora','',nxtDateTime,0,0,False);
  dict.addfield('Entrada','',nxtBoolean,0,0,False);
  dict.addfield('Cancelado','',nxtBoolean,0,0,False);
  dict.addfield('EstoqueAnt','',nxtDouble,0,0,False);
  dict.addfield('Cliente','',nxtWord32,10,0,False);
  dict.addfield('Caixa','',nxtInt32,0,0,False);
  dict.addfield('Categoria','',nxtNullString,20,0,False);
  dict.addfield('NaoControlaEstoque','',nxtBoolean,0,0,False);
  dict.addfield('ITran','',nxtInt32,0,0,False);
  dict.addfield('TipoTran','',nxtByte,0,0,False);
  dict.addfield('Sessao','',nxtInt32,0,0,False);
  fd:=dict.addfield('FidResgate','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('FidPontos','',nxtDouble,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IProduto',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Produto'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IContato',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICaixaMov',filedescriptorindex,True,'M',TnxCompKeyDescriptor);
  indexdescriptor.desc:='M';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITranItem',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tran'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Item'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IProdCxMov',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Produto'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISessaoID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sessao'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  result:=dict;
end;


function OcupacaoTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Sessao','',nxtWord32,0,0,False);
  dict.addfield('Maq','',nxtWord32,0,0,False);
  dict.addfield('Data','',nxtDate,0,0,False);
  dict.addfield('Hora','',nxtByte,0,0,False);
  dict.addfield('Cliente','',nxtWord32,0,0,False);
  dict.addfield('Func','',nxtNullString,20,0,False);
  fd:=dict.addfield('TipoCli','',nxtByte,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  dict.addfield('MinutosU','',nxtDouble,0,0,False);
  dict.addfield('MinutosP','',nxtDouble,0,0,False);
  dict.addfield('Caixa','',nxtWord32,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISessao',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sessao'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Hora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Hora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICaixa',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Hora'));

  result:=dict;
end;


function PacoteTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Minutos','',nxtWord32,0,0,False);
  dict.addfield('Valor','',nxtCurrency,0,0,False);
  dict.addfield('Descr','',nxtNullString,30,0,False);
  fd:=dict.addfield('Fidelidade','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('FidPontos','',nxtInt32,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  result:=dict;
end;


function PassaporteTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Nome','',nxtNullString,50,0,False);
  dict.addfield('TipoPass','',nxtInt32,0,0,False);
  dict.addfield('Cliente','',nxtInt32,0,0,False);
  dict.addfield('Expirou','',nxtBoolean,0,0,False);
  dict.addfield('Senha','',nxtNullString,20,0,False);
  dict.addfield('PrimeiroUso','',nxtDateTime,0,0,False);
  dict.addfield('TipoAcesso','',nxtInt32,0,0,False);
  dict.addfield('TipoExp','',nxtByte,1,0,False);
  dict.addfield('ExpirarEm','',nxtDateTime,0,0,False);
  dict.addfield('MaxSegundos','',nxtWord32,0,0,False);
  dict.addfield('Segundos','',nxtWord32,0,0,False);
  dict.addfield('Acessos','',nxtWord32,0,0,False);
  dict.addfield('Dia1','',nxtWord32,0,0,False);
  dict.addfield('Dia2','',nxtWord32,0,0,False);
  dict.addfield('Dia3','',nxtWord32,0,0,False);
  dict.addfield('Dia4','',nxtWord32,0,0,False);
  dict.addfield('Dia5','',nxtWord32,0,0,False);
  dict.addfield('Dia6','',nxtWord32,0,0,False);
  dict.addfield('Dia7','',nxtWord32,0,0,False);
  dict.addfield('Tran','',nxtWord32,0,0,False);
  dict.addfield('DataCompra','',nxtDateTime,0,0,False);
  fd:=dict.addfield('Valido','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  dict.addfield('Valor','',nxtCurrency,0,0,False);
  dict.addfield('Sessao','',nxtWord32,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'Exp',TnxCompKeyDescriptor);
  indexdescriptor.desc:='Exp';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICliExpID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Expirou'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITransacao',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tran'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICliDataCompra',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataCompra'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IExpID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Expirou'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISenha',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Senha'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISessao',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sessao'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  result:=dict;
end;


function PatrocinioTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('Nome','',nxtNullString,20,0,False);
  dict.addfield('URLArea1','',nxtBlobMemo,0,0,False);
  dict.addfield('URLArea2','',nxtBlobMemo,0,0,False);
  dict.addfield('DominiosPerm','',nxtBlobMemo,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INome',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Nome'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  result:=dict;
end;


function ProcessosTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('ClienteID','',nxtInt32,0,0,False);
  dict.addfield('Request','',nxtInt32,0,0,False);
  dict.addfield('ProcessID','',nxtInt32,0,0,False);
  dict.addfield('ExeName','',nxtNullString,80,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICliReq',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ClienteID'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Request'));

  result:=dict;
end;


function ProdutoTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('ID','',nxtAutoinc,10,0,False);
  dict.addfield('Codigo','',nxtNullString,15,0,False);
  dict.addfield('Descricao','',nxtNullString,55,0,False);
  dict.addfield('Unid','',nxtNullString,5,0,False);
  dict.addfield('Preco','',nxtCurrency,5,0,False);
  dict.addfield('Obs','',nxtBlobMemo,0,0,False);
  dict.addfield('Imagem','',nxtBlobGraphic,0,0,False);
  dict.addfield('Categoria','',nxtNullString,35,0,False);
  dict.addfield('SubCateg','',nxtNullString,35,0,False);
  dict.addfield('EstoqueAtual','',nxtExtended,0,0,False);
  dict.addfield('CustoUnitario','',nxtCurrency,0,0,False);
  dict.addfield('EstoqueACE','',nxtExtended,0,0,False);
  dict.addfield('EstoqueACS','',nxtExtended,0,0,False);
  dict.addfield('PodeAlterarPreco','',nxtBoolean,0,0,False);
  dict.addfield('NaoControlaEstoque','',nxtBoolean,0,0,False);
  fd:=dict.addfield('Fidelidade','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('FidPontos','',nxtInt32,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICodigo',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Codigo'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDescricao',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Descricao'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  result:=dict;
end;


function ReciboTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Cliente','',nxtInt32,0,0,False);
  dict.addfield('Tran','',nxtInt32,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICliente',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  result:=dict;
end;


function SessaoTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Inicio','',nxtDateTime,0,0,False);
  dict.addfield('Termino','',nxtDateTime,0,0,False);
  dict.addfield('MinutosR','Em minutos',nxtDouble,0,0,False);
  dict.addfield('MinutosC','Em minutos',nxtDouble,0,0,False);
  dict.addfield('Maq','',nxtWord16,0,0,False);
  dict.addfield('MaqI','',nxtWord16,0,0,False);
  fd:=dict.addfield('Encerrou','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  dict.addfield('Cliente','',nxtWord32,0,0,False);
  dict.addfield('TransfMaq','Houve transferencia de maquina',nxtBoolean,0,0,False);
  fd:=dict.addfield('TipoCli','0=normal, 1=gratis, 2=manutencao',nxtByte,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('Cancelado','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('Total','',nxtCurrency,0,0,False);
  dict.addfield('Desconto','',nxtCurrency,0,0,False);
  dict.addfield('PagoPost','',nxtCurrency,0,0,False);
  dict.addfield('DescPost','',nxtCurrency,0,0,False);
  dict.addfield('Pago','',nxtCurrency,0,0,False);
  dict.addfield('NomeCliente','',nxtNullString,50,0,False);
  dict.addfield('FuncI','',nxtNullString,30,0,False);
  dict.addfield('FuncF','',nxtNullString,30,0,False);
  dict.addfield('Obs','',nxtBlobMemo,0,0,False);
  dict.addfield('TipoAcesso','',nxtInt32,0,0,False);
  dict.addfield('CaixaI','',nxtWord32,0,0,False);
  dict.addfield('CaixaF','',nxtWord32,0,0,False);
  dict.addfield('TicksI','',nxtInt32,0,0,False);
  dict.addfield('Pausado','',nxtBoolean,0,0,False);
  dict.addfield('InicioPausa','',nxtWord32,0,0,False);
  dict.addfield('MinTicksUsados','',nxtWord32,0,0,False);
  dict.addfield('MinTicksTotal','',nxtWord32,0,0,False);
  dict.addfield('FimTicksUsados','',nxtWord32,0,0,False);
  dict.addfield('FimTicksTotal','',nxtWord32,0,0,False);
  dict.addfield('StrPausas','',nxtBlobMemo,0,0,False);
  dict.addfield('StrTransfMaq','',nxtBlobMemo,0,0,False);
  dict.addfield('StrFechamentoCaixa','',nxtBlobMemo,0,0,False);
  dict.addfield('MinutosCli','',nxtExtended,0,0,False);
  dict.addfield('MinutosPrev','',nxtExtended,0,0,False);
  dict.addfield('MinutosMax','',nxtExtended,0,0,False);
  dict.addfield('MinutosCliU','',nxtExtended,0,0,False);
  dict.addfield('ValorCli','',nxtCurrency,0,0,False);
  dict.addfield('ValorCliU','',nxtExtended,0,0,False);
  dict.addfield('TranI','',nxtInt32,0,0,False);
  dict.addfield('TranF','',nxtInt32,0,0,False);
  dict.addfield('PermitirDownload','',nxtBoolean,0,0,False);
  dict.addfield('VersaoRegistro','',nxtWord32,0,0,False);
  fd:=dict.addfield('CartaoTempo','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('HP1','',nxtInt32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '2147483647', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('HP2','',nxtInt32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '2147483647', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('HP3','',nxtInt32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '2147483647', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('HP4','',nxtInt32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '2147483647', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('HP5','',nxtInt32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '2147483647', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('HP6','',nxtInt32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '2147483647', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('HP7','',nxtInt32,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '2147483647', cdvDefaultValue, fd.fdLength);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IClienteInicio',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Inicio'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IEncerrou',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Encerrou'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CaixaF'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IEncerrouCli',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Encerrou'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICaixaF',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CaixaF'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('TipoCli'));

  result:=dict;
end;


function TarifaTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('TipoAcesso','',nxtWord16,0,0,False);
  dict.addfield('Cor','',nxtInt32,0,0,False);
  dict.addfield('CorFonte','',nxtInt32,0,0,False);
  dict.addfield('Descricao','',nxtNullString,30,0,False);
  dict.addfield('Reinicia','',nxtBoolean,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IPrim',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('TipoAcesso'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cor'));

  result:=dict;
end;


function TempoTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('DataHora','',nxtDateTime,0,0,False);
  dict.addfield('Func','',nxtNullString,20,0,False);
  fd:=dict.addfield('Tipo','0=Tempo, 1=Tempo Previsto, 2=Passaporte, 3=pacote, 4=cartao de tempo',nxtByte,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  dict.addfield('Minutos','',nxtDouble,0,0,False);
  dict.addfield('IDPacPass','',nxtWord32,0,0,False);
  dict.addfield('Passaporte','',nxtWord32,0,0,False);
  dict.addfield('Total','',nxtCurrency,0,0,False);
  dict.addfield('Desconto','',nxtCurrency,0,0,False);
  dict.addfield('PagoPost','',nxtCurrency,0,0,False);
  dict.addfield('DescPost','',nxtCurrency,0,0,False);
  dict.addfield('Pago','',nxtCurrency,0,0,False);
  dict.addfield('Cliente','',nxtWord32,0,0,False);
  dict.addfield('Maq','',nxtWord16,0,0,False);
  dict.addfield('Sessao','',nxtWord32,0,0,False);
  dict.addfield('Cancelado','',nxtBoolean,0,0,False);
  dict.addfield('Tran','',nxtInt32,0,0,False);
  dict.addfield('Caixa','',nxtInt32,0,0,False);
  dict.addfield('Nome','',nxtNullString,50,0,False);
  dict.addfield('Senha','',nxtNullString,20,0,False);
  dict.addfield('TipoAcesso','',nxtInt32,0,0,False);
  dict.addfield('Obs','',nxtNullString,50,0,False);
  fd:=dict.addfield('CredValor','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('FidResgate','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('FidPontos','',nxtDouble,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISessaoID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sessao'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICliente',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITran',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tran'));

  result:=dict;
end;


function TipoAcessoTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('ID','',nxtWord16,5,0,False);
  dict.addfield('Nome','',nxtNullString,30,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,False,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INome',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Nome'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  result:=dict;
end;


function TipoImpTableDataDictionary:TnxDataDictionary;
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
  dict.filedescriptor[filedescriptorindex].desc:='Tipos de Impressão';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('ID','',nxtByte,3,0,False);
  dict.addfield('Nome','',nxtNullString,30,0,False);
  dict.addfield('Impressora','',nxtNullString,500,0,False);
  dict.addfield('Valor','',nxtCurrency,0,0,False);
  dict.addfield('Contador','',nxtInt32,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INome',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Nome'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IImp',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Impressora'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  result:=dict;
end;


function TipoPassTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Nome','',nxtNullString,50,0,False);
  dict.addfield('Valor','',nxtCurrency,0,0,False);
  dict.addfield('TipoAcesso','',nxtInt32,0,0,False);
  dict.addfield('TipoExp','',nxtByte,1,0,False);
  dict.addfield('ExpirarEm','',nxtDateTime,0,0,False);
  dict.addfield('MaxSegundos','',nxtWord32,0,0,False);
  dict.addfield('Obs','',nxtBlobMemo,0,0,False);
  dict.addfield('Dia1','',nxtWord32,0,0,False);
  dict.addfield('Dia2','',nxtWord32,0,0,False);
  dict.addfield('Dia3','',nxtWord32,0,0,False);
  dict.addfield('Dia4','',nxtWord32,0,0,False);
  dict.addfield('Dia5','',nxtWord32,0,0,False);
  dict.addfield('Dia6','',nxtWord32,0,0,False);
  dict.addfield('Dia7','',nxtWord32,0,0,False);
  fd:=dict.addfield('Fidelidade','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('FidPontos','',nxtInt32,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  result:=dict;
end;


function TranTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('DataHora','',nxtDateTime,0,0,False);
  dict.addfield('Cliente','',nxtWord32,0,0,False);
  dict.addfield('Tipo','',nxtByte,0,0,False);
  dict.addfield('Func','',nxtNullString,20,0,False);
  dict.addfield('Total','',nxtCurrency,30,0,False);
  dict.addfield('Desconto','',nxtCurrency,30,0,False);
  dict.addfield('Pago','',nxtCurrency,0,0,False);
  dict.addfield('Debito','',nxtCurrency,0,0,False);
  dict.addfield('Obs','',nxtBlobMemo,0,0,False);
  dict.addfield('Cancelado','',nxtBoolean,0,0,False);
  dict.addfield('CanceladoPor','',nxtNullString,30,0,False);
  dict.addfield('CanceladoEm','',nxtDateTime,0,0,False);
  dict.addfield('Caixa','',nxtWord32,0,0,False);
  dict.addfield('Maq','',nxtWord16,0,0,False);
  dict.addfield('NomeCliente','',nxtNullString,50,0,False);
  dict.addfield('Sessao','',nxtWord32,10,0,False);
  dict.addfield('Descr','',nxtNullString,50,0,False);
  dict.addfield('QtdTempo','',nxtDouble,0,0,False);
  dict.addfield('CredValor','',nxtBoolean,0,0,False);
  dict.addfield('FidResgate','',nxtBoolean,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICliDH',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICaixaID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDH',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITipoDH',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tipo'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISessao',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Sessao'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  result:=dict;
end;


function UsuarioTableDataDictionary:TnxDataDictionary;
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
  dict.encryptionengine:='nx1xDefault';

  // Fields

  dict.addfield('Username','',nxtNullString,20,0,False);
  dict.addfield('Nome','',nxtNullString,40,0,False);
  dict.addfield('Admin','',nxtBoolean,0,0,False);
  dict.addfield('Senha','',nxtNullString,30,0,False);
  dict.addfield('Grupos','',nxtBlobMemo,0,0,False);
  dict.addfield('Direitos','',nxtBlobMemo,0,0,False);
  dict.addfield('MaxTempoManut','',nxtInt32,0,0,False);
  dict.addfield('MaxMaqManut','',nxtInt32,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IUsername',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Username'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INome',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Nome'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  result:=dict;
end;

function BiometriaTableDataDictionary:TnxDataDictionary;
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
  dict.encryptionengine:='nx1xDefault';

  // Fields

  dict.addfield('ID','',nxtAutoInc,0,0,False);
  dict.addfield('Cliente','',nxtWord32,0,0,False);
  dict.addfield('Template','',nxtBlob,0,0,False);
  dict.addfield('UAcesso','',nxtDateTime,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IClienteID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IUAcesso',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('UAcesso'),TnxExtTextKeyFieldDescriptor);
  kfd.Ascend := False;
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  

  result:=dict;
end;

procedure inittableslist;
begin
  if assigned(Ftables) then exit;
  Ftables:=Tstringlist.create;
  Ftables.addobject('Aviso',@AvisoTableDataDictionary);
  Ftables.addobject('Caixa',@CaixaTableDataDictionary);
  Ftables.addobject('Categoria',@CategoriaTableDataDictionary);
  Ftables.addobject('Chat',@ChatTableDataDictionary);
  Ftables.addobject('Cliente',@ClienteTableDataDictionary);
  Ftables.addobject('Config',@ConfigTableDataDictionary);
  Ftables.addobject('Debito',@DebitoTableDataDictionary);
  Ftables.addobject('EmailCorpo',@EmailCorpoTableDataDictionary);
  Ftables.addobject('EmailCriar',@EmailCriarTableDataDictionary);
  Ftables.addobject('EmailEnvio',@EmailEnvioTableDataDictionary);
  Ftables.addobject('Espera',@EsperaTableDataDictionary);
  Ftables.addobject('ETar',@ETarTableDataDictionary);
  Ftables.addobject('FiltroWeb',@FiltroWebTableDataDictionary);
  Ftables.addobject('HCred',@HCredTableDataDictionary);
  Ftables.addobject('HPass',@HPassTableDataDictionary);
  Ftables.addobject('HTar',@HTarTableDataDictionary);
  Ftables.addobject('Impressao',@ImpressaoTableDataDictionary);
  Ftables.addobject('ITran',@ITranTableDataDictionary);
  Ftables.addobject('Layout',@LayoutTableDataDictionary);
  Ftables.addobject('Log',@LogTableDataDictionary);
  Ftables.addobject('LogApp',@LogAppTableDataDictionary);
  Ftables.addobject('LogNom',@LogNomTableDataDictionary);
  Ftables.addobject('LogUrl',@LogUrlTableDataDictionary);
  Ftables.addobject('Maq',@MaqTableDataDictionary);
  Ftables.addobject('Maquina',@MaquinaTableDataDictionary);
  Ftables.addobject('MovEst',@MovEstTableDataDictionary);
  Ftables.addobject('Ocupacao',@OcupacaoTableDataDictionary);
  Ftables.addobject('Pacote',@PacoteTableDataDictionary);
  Ftables.addobject('Passaporte',@PassaporteTableDataDictionary);
  Ftables.addobject('Patrocinio',@PatrocinioTableDataDictionary);
  Ftables.addobject('Processos',@ProcessosTableDataDictionary);
  Ftables.addobject('Produto',@ProdutoTableDataDictionary);
  Ftables.addobject('Recibo',@ReciboTableDataDictionary);
  Ftables.addobject('Sessao',@SessaoTableDataDictionary);
  Ftables.addobject('Tarifa',@TarifaTableDataDictionary);
  Ftables.addobject('Tempo',@TempoTableDataDictionary);
  Ftables.addobject('TipoAcesso',@TipoAcessoTableDataDictionary);
  Ftables.addobject('TipoImp',@TipoImpTableDataDictionary);
  Ftables.addobject('TipoPass',@TipoPassTableDataDictionary);
  Ftables.addobject('Tran',@TranTableDataDictionary);
  Ftables.addobject('Usuario',@UsuarioTableDataDictionary);
  Ftables.addobject('Biometria',@BiometriaTableDataDictionary);
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

procedure CreateNexCafeDatabase(db:TnxDatabase;overwrite:boolean=false;Creating:TnsmCreateDatabaseCb=nil);
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

procedure RestructureNexCafeDatabase(db:TnxDatabase;MatchFieldsBy:smallint=0;RestructuringDatabase:TnsmRestructureDatabaseCb=nil;RestructuringTable:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);
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

function VerifyNexCafeDatabase(db:TnxDatabase;Verifying:TnsmVerifyDatabaseCb=nil;verifyerror:TnsmVerifyDatabaseErrorCb=nil):boolean;
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

function NexCafeDbVersion:string;
begin
  result:='';
end;

function NexCafeTablesCount:integer;
begin
  result:=41;
end;

procedure NexCafeGetTableNames(tables:Tstrings);
begin
  tables.assign(Ftables);
end;

initialization
  inittableslist;
finalization
  cleanuptableslist;
end.
