unit nrEstruturaTabs;

//************************************************
//*   Source created with NexusDb Source Maker   *
//*                 Version 1.1.4                *
//*                                              *
//*               by Roberto Nicchi              *
//*            M a s t e r Informatica           *
//*                    Italy                     *
//*         software@masterinformatica.net       *
//*                                              *
//*       Source creation date: 6/1/2009       *
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

procedure CreateNexRegDatabase(db:TnxDatabase;overwrite:boolean=false;creating:TnsmCreateDatabaseCb=nil);

procedure RestructureNexRegDatabase(db:TnxDatabase;MatchFieldsBy:smallint=0;RestructuringDatabase:TnsmRestructureDatabaseCb=nil;RestructuringTable:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);

function VerifyNexRegDatabase(db:TnxDatabase;Verifying:TnsmVerifyDatabaseCb=nil;verifyerror:TnsmVerifyDatabaseErrorCb=nil):boolean;

function NexRegDbVersion:string;

function NexRegTablesCount:integer;

procedure NexRegGetTableNames(tables:Tstrings);

// Tables methods

function TableDataDictionary(tablename:string):TnxDataDictionary;

procedure CreateTableByDict(db:TnxDatabase;tablename:string;dict:TnxDataDictionary;overwrite:boolean=false);

procedure CreateTable(db:TnxDatabase;tablename:string;overwrite:boolean=false);

function VerifyTableStructureByDict(db:TnxDatabase;tablename:string;dict:TnxDataDictionary):integer;

function VerifyTableStructure(db:TnxDatabase;tablename:string):integer;

procedure RestructureTableByDict(db:TnxDatabase;tablename:string;newdict:TnxDataDictionary;MatchFieldsBy:smallint=0;Restructuring:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);

procedure RestructureTable(db:TnxDatabase;tablename:string;MatchFieldsBy:smallint=0;Restructuring:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);

function AtendimentoTableDataDictionary:TnxDataDictionary;
function AutorizacaoTableDataDictionary:TnxDataDictionary;
function clienteTableDataDictionary:TnxDataDictionary;
function ConexaoTableDataDictionary:TnxDataDictionary;
function EmailCorpoTableDataDictionary:TnxDataDictionary;
function EmailEnvioTableDataDictionary:TnxDataDictionary;
function EstTableDataDictionary:TnxDataDictionary;
function EstResTableDataDictionary:TnxDataDictionary;
function EstSearchTableDataDictionary:TnxDataDictionary;
function FilaTableDataDictionary:TnxDataDictionary;
function HistConTableDataDictionary:TnxDataDictionary;
function LogTableDataDictionary:TnxDataDictionary;
function PlanoContasTableDataDictionary:TnxDataDictionary;
function receberTableDataDictionary:TnxDataDictionary;
function SessaoTableDataDictionary:TnxDataDictionary;
function StatusTableDataDictionary:TnxDataDictionary;
function TarefasTableDataDictionary:TnxDataDictionary;
function UsuarioTableDataDictionary:TnxDataDictionary;

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


function AtendimentoTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Fila','',nxtInt32,0,0,False);
  dict.addfield('InicioFila','',nxtDateTime,0,0,False);
  dict.addfield('InicioAtend','',nxtDateTime,0,0,False);
  dict.addfield('FimAtend','',nxtDateTime,0,0,False);
  dict.addfield('Func','',nxtNullString,20,0,False);
  dict.addfield('DescrCli','',nxtBlobMemo,0,0,False);
  dict.addfield('DescrFunc','',nxtBlobMemo,0,0,False);
  dict.addfield('Sessao','',nxtInt32,0,0,False);
  dict.addfield('Loja','',nxtInt32,0,0,False);
  dict.addfield('Pendente','',nxtBoolean,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IFilaIDInicio',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Fila'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('InicioAtend'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IInicioAtend',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('InicioAtend'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILoja',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('InicioFila'));

  result:=dict;
end;


function AutorizacaoTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Programa','',nxtByte,3,0,False);
  dict.addfield('Loja','',nxtWord32,10,0,False);
  dict.addfield('Autorizacao','',nxtNullString,30,0,False);
  dict.addfield('Vencimento','',nxtDate,0,0,False);
  dict.addfield('CodigoEquip','',nxtNullString,30,0,False);
  dict.addfield('Maquinas','',nxtWord16,0,0,False);
  dict.addfield('Tipo','',nxtByte,0,0,False);
  dict.addfield('CriadaEm','',nxtDateTime,0,0,False);
  dict.addfield('CriadaPor','',nxtNullString,30,0,False);
  dict.addfield('InativadaEm','',nxtDateTime,0,0,False);
  dict.addfield('InativadaPor','',nxtNullString,30,0,False);
  fd:=dict.addfield('Ativa','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('Obs','',nxtBlobMemo,0,0,False);
  fd:=dict.addfield('Gerar','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('EnviouCli','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILoja',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Ativa'));
  kfd.ascend:=False;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IEquip',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CodigoEquip'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IInclusao',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CriadaEm'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IGerar',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Gerar'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILojaID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));
  kfd.ascend:=False;

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IVencimento',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Vencimento'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IEnviou',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('EnviouCli'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICodigoEquipTipo',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CodigoEquip'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Tipo'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IEnviouAtiva',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('EnviouCli'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Ativa'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));
  kfd.ascend:=False;

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IAtiva',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Ativa'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));
  kfd.ascend:=False;

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IAtivaVencimento',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Ativa'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Vencimento'));

  result:=dict;
end;


function clienteTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('Codigo','',nxtAutoinc,10,0,False);
  fd:=dict.addfield('Tipo','',nxtByte,3,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  dict.addfield('Senha','',nxtNullString,30,0,False);
  dict.addfield('CadastroEm','',nxtDateTime,0,0,False);
  dict.addfield('CadastroPor','',nxtNullString,30,0,False);
  dict.addfield('AtualizadoEm','',nxtDateTime,0,0,False);
  dict.addfield('AtualizadoPor','',nxtNullString,30,0,False);
  dict.addfield('Loja','',nxtNullString,50,0,False);
  dict.addfield('RazaoSocial','',nxtNullString,50,0,False);
  dict.addfield('Pais','',nxtNullString,50,0,False);
  dict.addfield('Cidade','',nxtNullString,30,0,False);
  dict.addfield('UF','',nxtNullString,2,0,False);
  dict.addfield('Endereco','',nxtBlobMemo,0,0,False);
  dict.addfield('CEP','',nxtNullString,50,0,False);
  dict.addfield('Bairro','',nxtNullString,50,0,False);
  dict.addfield('SerieHD','',nxtNullString,60,0,False);
  dict.addfield('CodEquip','',nxtNullString,60,0,False);
  dict.addfield('NumMaq','',nxtWord16,5,0,False);
  dict.addfield('CNPJ','',nxtNullString,19,0,False);
  dict.addfield('IE','',nxtNullString,15,0,False);
  dict.addfield('Obs','',nxtBlobMemo,0,0,False);
  dict.addfield('Telefones','',nxtBlobMemo,0,0,False);
  dict.addfield('EmailReg','',nxtBlobMemo,0,0,False);
  dict.addfield('FormaPagto','',nxtBlobMemo,0,0,False);
  dict.addfield('LicMaq','',nxtWord16,0,0,False);
  dict.addfield('LicTipo','1=Temporária, 2=Definitiva, 3=Teste',nxtByte,0,0,False);
  dict.addfield('LicVenc','',nxtDate,0,0,False);
  dict.addfield('ManInicio','',nxtDate,0,0,False);
  dict.addfield('ManVenc','',nxtDate,0,0,False);
  dict.addfield('Proprietarios','',nxtBlobMemo,0,0,False);
  dict.addfield('Gerente','',nxtNullString,50,0,False);
  dict.addfield('TipoLoja','',nxtByte,3,0,False);
  dict.addfield('EmailTec','',nxtBlobMemo,0,0,False);
  dict.addfield('Valor','',nxtCurrency,0,0,False);
  dict.addfield('ValorRec','',nxtCurrency,0,0,False);
  dict.addfield('EmitirNF','',nxtBoolean,0,0,False);
  dict.addfield('Messenger','',nxtBlobMemo,0,0,False);
  dict.addfield('ICQ','',nxtBlobMemo,0,0,False);
  dict.addfield('UObtemLic','',nxtDateTime,0,0,False);
  dict.addfield('UVersao','',nxtNullString,10,0,False);
  fd:=dict.addfield('Negociacao','',nxtByte,3,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  dict.addfield('Status','',nxtInt32,3,0,False);
  dict.addfield('ContatarEm','',nxtDateTime,0,0,False);
  fd:=dict.addfield('Programa','0=CyberManager, 1=NexCafé',nxtByte,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('Bloqueado','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('Cliente','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICodigo',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Codigo'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILoja',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IStatusNome',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Status'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISerieHD',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('SerieHD'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICodEquip',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CodEquip'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  result:=dict;
end;


function ConexaoTableDataDictionary:TnxDataDictionary;
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
  fd:=dict.addfield('Aberta','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('Tipo','0=Usuario, 1=Loja',nxtByte,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  dict.addfield('HD','',nxtNullString,60,0,False);
  dict.addfield('Login','',nxtDateTime,0,0,False);
  dict.addfield('Logout','',nxtDateTime,0,0,False);
  dict.addfield('Loja','',nxtInt32,0,0,False);
  dict.addfield('Usuario','',nxtNullString,30,0,False);
  dict.addfield('Nome','',nxtNullString,50,0,False);
  dict.addfield('Status','',nxtNullString,30,0,False);
  dict.addfield('IP','',nxtNullString,20,0,False);
  dict.addfield('ThreadID','',nxtWord32,10,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IIPLoja',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('IP'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IHDLoja',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('HD'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IAbertaThreadID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Aberta'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ThreadID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IAbertaUsuario',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Aberta'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Usuario'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

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
  dict.addfield('Assunto','',nxtNullString,100,0,False);
  dict.addfield('Inclusao','',nxtDateTime,0,0,False);
  dict.addfield('Tipo','',nxtByte,0,0,False);
  dict.addfield('EnviarEm','',nxtDateTime,0,0,False);
  dict.addfield('Processou','',nxtBoolean,0,0,False);

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


function EstTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Loja','',nxtInt32,0,0,False);
  dict.addfield('Data','',nxtDate,0,0,False);
  dict.addfield('Caixa','',nxtInt32,0,0,False);
  dict.addfield('DataAtu','',nxtDateTime,0,0,False);
  dict.addfield('SessoesQtd','',nxtInt32,0,0,False);
  dict.addfield('SessoesTempo','',nxtDouble,0,0,False);
  dict.addfield('URLs','',nxtInt32,0,0,False);
  dict.addfield('CodEquip','',nxtNullString,20,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILojaData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDataLoja',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICodEquipData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CodEquip'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILojaCaixa',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICodEquipCaixa',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CodEquip'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));

  result:=dict;
end;


function EstResTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('Loja','',nxtInt32,0,0,False);
  dict.addfield('CodEquip','',nxtNullString,20,0,False);
  dict.addfield('Res','',nxtNullString,10,0,False);
  dict.addfield('Qtd','',nxtInt32,10,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILojaRes',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Res'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICodEquipRes',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CodEquip'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Res'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  result:=dict;
end;


function EstSearchTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Loja','',nxtInt32,0,0,False);
  dict.addfield('Data','',nxtDate,0,0,False);
  dict.addfield('Caixa','',nxtInt32,0,0,False);
  dict.addfield('CodEquip','',nxtNullString,20,0,False);
  dict.addfield('DataAtu','',nxtDateTime,0,0,False);
  dict.addfield('Eng','',nxtNullString,2,0,False);
  dict.addfield('Qtd','',nxtInt32,0,0,False);
  dict.addfield('Pag','',nxtInt32,0,0,False);
  dict.addfield('Est','',nxtInt32,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILojaData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDataLoja',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICodEquipData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CodEquip'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Data'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IEstEng',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Est'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Eng'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILojaCaixa',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICodEquipCaixa',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CodEquip'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));

  result:=dict;
end;


function FilaTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Nome','',nxtNullString,30,0,False);

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

  result:=dict;
end;


function HistConTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Tipo','',nxtNullString,10,0,False);
  dict.addfield('Loja','',nxtInt32,10,0,False);
  dict.addfield('DataHora','',nxtDateTime,0,0,False);
  dict.addfield('Por','',nxtNullString,15,0,False);
  dict.addfield('Texto','',nxtBlobMemo,0,0,False);
  dict.addfield('Meio','',nxtNullString,10,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILoja',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

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

  dict.addfield('Num','',nxtAutoinc,10,0,False);
  dict.addfield('DataHora','',nxtDateTime,0,0,False);
  dict.addfield('Loja','',nxtInt32,0,0,False);
  dict.addfield('Detalhes','',nxtBlobMemo,0,0,False);
  dict.addfield('IP','',nxtNullString,20,0,False);
  dict.addfield('OperID','',nxtByte,3,0,False);
  dict.addfield('OK','',nxtBoolean,0,0,False);
  dict.addfield('SerieHD','',nxtNullString,60,0,False);
  dict.addfield('IP2','',nxtNullString,20,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INum',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Num'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILoja',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDataHora',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IOperID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('OperID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IHDOper',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('SerieHD'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('OperID'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IIPOper',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('IP2'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('OperID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IHDOperOk',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('SerieHD'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('OperID'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('OK'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Num'));

  result:=dict;
end;


function PlanoContasTableDataDictionary:TnxDataDictionary;
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
  dict.filedescriptor[filedescriptorindex].desc:='Plano de Contas';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('ID','',nxtWord32,10,0,False);
  dict.addfield('Pai','',nxtWord32,0,0,False);
  dict.addfield('Nome','',nxtNullString,40,0,False);
  dict.addfield('Sintetico','',nxtBoolean,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IPai',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Pai'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INome',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Nome'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  result:=dict;
end;


function receberTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Loja','',nxtInt32,0,0,False);
  dict.addfield('Vencimento','',nxtDate,0,0,False);
  dict.addfield('Pagamento','',nxtDate,0,0,False);
  dict.addfield('Valor','',nxtCurrency,0,0,False);
  dict.addfield('ValorPago','',nxtCurrency,0,0,False);
  dict.addfield('Obs','',nxtBlobMemo,0,0,False);
  dict.addfield('Doc','',nxtNullString,60,0,False);
  dict.addfield('Descricao','',nxtNullString,50,0,False);
  dict.addfield('Lancamento','',nxtDateTime,0,0,False);
  fd:=dict.addfield('Tipo','P=Pagar, R=Receber',nxtChar,1,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'R', cdvDefaultValue, fd.fdLength);
  dict.addfield('PC','Plano de Contas',nxtWord32,1,0,False);
  dict.addfield('SituacaoCobr','0',nxtByte,1,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILoja',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Pagamento'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Vencimento'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IVenc',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Vencimento'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IPagto',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Pagamento'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICCPagto',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('PC'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Pagamento'));

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
  dict.addfield('Loja','',nxtInt32,0,0,False);
  dict.addfield('Fila','',nxtInt32,0,0,False);
  dict.addfield('Inicio','',nxtDateTime,0,0,False);
  dict.addfield('Fim','',nxtDateTime,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILoja',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Inicio'));

  result:=dict;
end;


function StatusTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('Codigo','',nxtInt32,10,0,False);
  dict.addfield('Descricao','',nxtNullString,50,0,False);
  dict.addfield('CorFonte','',nxtInt32,0,0,False);
  dict.addfield('CorFundo','',nxtInt32,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICodigo',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Codigo'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INome',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Descricao'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  result:=dict;
end;


function TarefasTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Por','',nxtNullString,10,0,False);
  dict.addfield('Para','',nxtNullString,10,0,False);
  dict.addfield('Loja','',nxtInt32,10,0,False);
  dict.addfield('Texto','',nxtBlobMemo,0,0,False);
  dict.addfield('Pendente','',nxtBoolean,0,0,False);
  dict.addfield('ResolvidoEm','',nxtDateTime,0,0,False);
  dict.addfield('RealizarEm','',nxtDateTime,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IPara',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Para'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Pendente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDataHora',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ILoja',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Loja'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IPendente',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Pendente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

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
  dict.filedescriptor[filedescriptorindex].desc:='';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('Username','',nxtNullString,20,0,False);
  dict.addfield('Senha','',nxtNullString,20,0,False);
  dict.addfield('Nome','',nxtNullString,50,0,False);
  dict.addfield('Admin','',nxtBoolean,0,0,False);
  dict.addfield('Direitos','',nxtBlobMemo,0,0,False);
  dict.addfield('NomeCHAT','',nxtNullString,50,0,False);
  dict.addfield('StatusCHAT','',nxtNullString,30,0,False);
  dict.addfield('CHAT','',nxtBoolean,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IUsername',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Username'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INome',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Nome'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  result:=dict;
end;


procedure inittableslist;
begin
  if assigned(Ftables) then exit;
  Ftables:=Tstringlist.create;
  Ftables.addobject('Atendimento',@AtendimentoTableDataDictionary);
  Ftables.addobject('Autorizacao',@AutorizacaoTableDataDictionary);
  Ftables.addobject('cliente',@clienteTableDataDictionary);
  Ftables.addobject('Conexao',@ConexaoTableDataDictionary);
  Ftables.addobject('EmailCorpo',@EmailCorpoTableDataDictionary);
  Ftables.addobject('EmailEnvio',@EmailEnvioTableDataDictionary);
  Ftables.addobject('Est',@EstTableDataDictionary);
  Ftables.addobject('EstRes',@EstResTableDataDictionary);
  Ftables.addobject('EstSearch',@EstSearchTableDataDictionary);
  Ftables.addobject('Fila',@FilaTableDataDictionary);
  Ftables.addobject('HistCon',@HistConTableDataDictionary);
  Ftables.addobject('Log',@LogTableDataDictionary);
  Ftables.addobject('PlanoContas',@PlanoContasTableDataDictionary);
  Ftables.addobject('receber',@receberTableDataDictionary);
  Ftables.addobject('Sessao',@SessaoTableDataDictionary);
  Ftables.addobject('Status',@StatusTableDataDictionary);
  Ftables.addobject('Tarefas',@TarefasTableDataDictionary);
  Ftables.addobject('Usuario',@UsuarioTableDataDictionary);
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

procedure CreateNexRegDatabase(db:TnxDatabase;overwrite:boolean=false;Creating:TnsmCreateDatabaseCb=nil);
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

procedure RestructureNexRegDatabase(db:TnxDatabase;MatchFieldsBy:smallint=0;RestructuringDatabase:TnsmRestructureDatabaseCb=nil;RestructuringTable:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);
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

function VerifyNexRegDatabase(db:TnxDatabase;Verifying:TnsmVerifyDatabaseCb=nil;verifyerror:TnsmVerifyDatabaseErrorCb=nil):boolean;
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

function NexRegDbVersion:string;
begin
  result:='';
end;

function NexRegTablesCount:integer;
begin
  result:=18;
end;

procedure NexRegGetTableNames(tables:Tstrings);
begin
  tables.assign(Ftables);
end;

initialization
  inittableslist;
finalization
  cleanuptableslist;
end.
