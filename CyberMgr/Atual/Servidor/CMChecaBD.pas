unit CMChecaBD;

//************************************************
//*   Source created with NexusDb Source Maker   *
//*                 Version 1.1.4                *
//*                                              *
//*               by Roberto Nicchi              *
//*            M a s t e r Informatica           *
//*                    Italy                     *
//*         software@masterinformatica.net       *
//*                                              *
//*       Source creation date: 01/12/2004       *
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

procedure CreatecybermgrDatabase(db:TnxDatabase;overwrite:boolean=false;creating:TnsmCreateDatabaseCb=nil);

procedure RestructurecybermgrDatabase(db:TnxDatabase;MatchFieldsBy:smallint=0;RestructuringDatabase:TnsmRestructureDatabaseCb=nil;RestructuringTable:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);

function VerifycybermgrDatabase(db:TnxDatabase;Verifying:TnsmVerifyDatabaseCb=nil;verifyerror:TnsmVerifyDatabaseErrorCb=nil):boolean;

function cybermgrDbVersion:string;

function cybermgrTablesCount:integer;

procedure cybermgrGetTableNames(tables:Tstrings);

// Tables methods

function TableDataDictionary(tablename:string):TnxDataDictionary;

procedure CreateTableByDict(db:TnxDatabase;tablename:string;dict:TnxDataDictionary;overwrite:boolean=false);

procedure CreateTable(db:TnxDatabase;tablename:string;overwrite:boolean=false);

function VerifyTableStructureByDict(db:TnxDatabase;tablename:string;dict:TnxDataDictionary):integer;

function VerifyTableStructure(db:TnxDatabase;tablename:string):integer;

procedure RestructureTableByDict(db:TnxDatabase;tablename:string;newdict:TnxDataDictionary;MatchFieldsBy:smallint=0;Restructuring:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);

procedure RestructureTable(db:TnxDatabase;tablename:string;MatchFieldsBy:smallint=0;Restructuring:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);

function CaixaTableDataDictionary:TnxDataDictionary;
function CategoriaTableDataDictionary:TnxDataDictionary;
function CCTableDataDictionary:TnxDataDictionary;
function ConfigTableDataDictionary:TnxDataDictionary;
function ContatoTableDataDictionary:TnxDataDictionary;
function CorTableDataDictionary:TnxDataDictionary;
function CorPrecosTableDataDictionary:TnxDataDictionary;
function FormPagtoTableDataDictionary:TnxDataDictionary;
function GrupoTableDataDictionary:TnxDataDictionary;
function HistPassTableDataDictionary:TnxDataDictionary;
function HoraCorTableDataDictionary:TnxDataDictionary;
function ImpressaoTableDataDictionary:TnxDataDictionary;
function LayoutTableDataDictionary:TnxDataDictionary;
function LogTableDataDictionary:TnxDataDictionary;
function MaquinaTableDataDictionary:TnxDataDictionary;
function MotivoTableDataDictionary:TnxDataDictionary;
function MovEstTableDataDictionary:TnxDataDictionary;
function PacoteTableDataDictionary:TnxDataDictionary;
function PassaporteTableDataDictionary:TnxDataDictionary;
function ProdutoTableDataDictionary:TnxDataDictionary;
function TipoAcessoTableDataDictionary:TnxDataDictionary;
function TipoMovTableDataDictionary:TnxDataDictionary;
function TipoPassTableDataDictionary:TnxDataDictionary;
function TransacaoTableDataDictionary:TnxDataDictionary;
function UsuarioTableDataDictionary:TnxDataDictionary;
function AvisoTableDataDictionary:TnxDataDictionary;
function CHATTableDataDictionary:TnxDataDictionary;


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

  dict.addfield('Numero','',nxtAutoinc,10,0,False);
  dict.addfield('Aberto','',nxtBoolean,0,0,False);
  dict.addfield('Usuario','',nxtNullString,10,0,False);
  dict.addfield('Abertura','',nxtDateTime,0,0,False);
  dict.addfield('Fechamento','',nxtDateTime,0,0,False);
  dict.addfield('Acesso','',nxtCurrency,0,0,False);
  dict.addfield('AcessoNaoPago','',nxtCurrency,0,0,False);
  dict.addfield('AcessoDebPago','',nxtCurrency,0,0,False);
  dict.addfield('AcessoQuant','',nxtCurrency,0,0,False);
  dict.addfield('Venda','',nxtCurrency,0,0,False);
  dict.addfield('VendaNaoPago','',nxtCurrency,0,0,False);
  dict.addfield('VendaDebPago','',nxtCurrency,0,0,False);
  dict.addfield('VendaQuant','',nxtCurrency,0,0,False);
  dict.addfield('Suprimento','',nxtCurrency,0,0,False);
  dict.addfield('Sangria','',nxtCurrency,0,0,False);
  dict.addfield('SaldoAnt','',nxtCurrency,0,0,False);
  dict.addfield('Descontos','',nxtCurrency,0,0,False);
  dict.addfield('TempoAcesso','',nxtExtended,0,0,False);
  dict.addfield('TempoManutencao','',nxtExtended,0,0,False);
  dict.addfield('Obs','',nxtBlobMemo,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumero',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Numero'));

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


function CCTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Cliente','',nxtWord32,0,0,False);
  dict.addfield('Caixa','',nxtDateTime,0,0,False);
  dict.addfield('DataHora','',nxtDateTime,0,0,False);
  dict.addfield('Transacao','',nxtWord32,0,0,False);
  dict.addfield('Valor','',nxtCurrency,0,0,False);
  dict.addfield('SaldoAntCliente','',nxtCurrency,0,0,False);
  dict.addfield('SaldoAntCaixa','',nxtCurrency,0,0,False);
  dict.addfield('Descricao','',nxtBlobMemo,0,0,False);
  dict.addfield('Usuario','',nxtNullString,20,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IClienteID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICaixaID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IClienteData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICaixaData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Caixa'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

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
  dict.addfield('Modulos','',nxtBlobMemo,0,0,False);
  dict.addfield('TiposLancExtra','',nxtBlobMemo,0,0,False);
  dict.addfield('ProgramasPermitidos','',nxtBlobMemo,0,0,False);
  dict.addfield('CMGuard','',nxtBlobMemo,0,0,False);
  dict.addfield('JanelasExplorer','',nxtBlobMemo,0,0,False);
  dict.addfield('FecharProgramas','',nxtBoolean,0,0,False);
  dict.addfield('AutoExecutar','',nxtNullString,200,0,False);
  dict.addfield('LimiteTempoPadrao','',nxtDateTime,0,0,False);
  dict.addfield('PacoteTempoReal','',nxtBoolean,0,0,False);
  dict.addfield('PermiteLoginSemCred','',nxtBoolean,0,0,False);
  dict.addfield('EncerramentoPrePago','',nxtByte,0,0,False);
  dict.addfield('ProdutoImpressao','',nxtNullString,15,0,False);
  dict.addfield('PermiteCapturaTela','',nxtBoolean,0,0,False);
  dict.addfield('AlertaFimTempo','',nxtDateTime,0,0,False);
  fd:=dict.addfield('VariosTiposAcesso','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('ModoPagtoAcesso','',nxtByte,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('MostraPrePagoDec','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  dict.addfield('TempoMaxAlerta','',nxtDateTime,0,0,False);
  dict.addfield('MostraCliCadAntesAvulso','',nxtBoolean,0,0,False);
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
  dict.addfield('CampoLocalizaCli','0=nome, 1=username, 2=código',nxtByte,0,0,False);
  dict.addfield('ManterSaldoCaixa','',nxtBoolean,0,0,False);
  dict.addfield('NaoMostrarMsgDebito','',nxtBoolean,0,0,False);
  dict.addfield('Tolerancia','',nxtDateTime,0,0,False);
  dict.addfield('RegImp98','',nxtBoolean,0,0,False);
  dict.addfield('LimitePadraoDebito','',nxtCurrency,0,0,False);
  fd:=dict.addfield('PortaImpRec','',nxtNullString,10,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'LPT1', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('SaltoImpRec','',nxtWord16,5,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '10', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('LargImpRec','',nxtWord16,5,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '40', cdvDefaultValue, fd.fdLength);
  dict.addfield('CabecalhoImpRec','',nxtBlobMemo,0,0,False);
  dict.addfield('RodapeImpRec','',nxtBlobMemo,0,0,False);
  fd:=dict.addfield('ImprimirImpRec','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  fd:=dict.addfield('MostraProgAtual','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  dict.addfield('MostraObs','',nxtBoolean,0,0,False);
  dict.addfield('EscondeTextoBotoes','',nxtBoolean,0,0,False);
  dict.addfield('EscondeTipoAcesso','',nxtBoolean,0,0,False);
  dict.addfield('ExigirRG','',nxtBoolean,0,0,False);
  dict.addfield('DesativaRegAutImp', '', nxtBoolean,0,0,False);
  dict.addfield('TipoFDesktop','',nxtNullString,3,0,False);
  dict.addfield('TipoFLogin','',nxtNullString,3,0,False);
  dict.addfield('NumFDesktop','',nxtInt32,0,0,False);
  dict.addfield('NumFLogin','',nxtInt32,0,0,False);
  dict.addfield('MostrarApenasPIN', '', nxtBoolean,0,0,False);
  dict.addfield('TextoPIN','',nxtNullString,30,0,False);
  dict.addfield('AlterarSenhaCli', '', nxtBoolean,0,0,False);
  dict.addfield('VerSenhaCli', '', nxtBoolean,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumSeq',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumSeq'));

  result:=dict;
end;


function ContatoTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('Codigo','',nxtAutoinc,10,0,False);
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
  dict.addfield('CreditoM','',nxtWord32,10,0,False);
  dict.addfield('TempoTotal','',nxtWord32,10,0,False);
  dict.addfield('TempoInicial','',nxtWord32,10,0,False);
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
  fd := dict.AddField('Inativo','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  
  fd := dict.addfield('TipoAcessoPref','',nxtInt32,0,0,False);
  
  
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, -1, cdvDefaultValue, fd.fdLength);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICodigo',filedescriptorindex,False,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Codigo'));

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

  result:=dict;
end;


function CorTableDataDictionary:TnxDataDictionary;
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


function CorPrecosTableDataDictionary:TnxDataDictionary;
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


function FormPagtoTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('Descricao','',nxtNullString,20,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('iDesc',filedescriptorindex,False,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Descricao'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  result:=dict;
end;


function GrupoTableDataDictionary:TnxDataDictionary;
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
  dict.addfield('Usuarios','',nxtBlobMemo,0,0,False);
  dict.addfield('Direitos','',nxtBlobMemo,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INome',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Nome'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  result:=dict;
end;


function HistPassTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('NumSeq','',nxtAutoinc,10,0,False);
  dict.addfield('Passaporte','',nxtWord32,10,0,False);
  dict.addfield('Transacao','',nxtWord32,10,0,False);
  dict.addfield('DataHora','',nxtDateTime,0,0,False);
  dict.addfield('Segundos','',nxtWord32,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumSeq',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumSeq'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IPassTran',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Passaporte'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Transacao'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITranPass',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Transacao'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Passaporte'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IPassData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Passaporte'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataHora'));

  result:=dict;
end;


function HoraCorTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('IDSeq','',nxtAutoinc,10,0,False);
  dict.addfield('DataHora','',nxtDateTime,0,0,False);
  dict.addfield('Computador','',nxtNullString,200,0,False);
  dict.addfield('Maquina','',nxtWord16,5,0,False);
  dict.addfield('Paginas','',nxtInt32,0,0,False);
  dict.addfield('Impressora','',nxtNullString,200,0,False);
  dict.addfield('Documento','',nxtBlobMemo,0,0,False);
  dict.addfield('Acesso','',nxtWord32,0,0,False);
  dict.addfield('Resultado','0-Completou, 1-Erro',nxtByte,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IIDSeq',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('IDSeq'));
  kfd.ascend:=False;

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IAcesso',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Acesso'));

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

  dict.addfield('Usuario','',nxtNullString,10,0,False);
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

  dict.addfield('NumSeq','',nxtAutoinc,10,0,False);
  dict.addfield('DiaHora','',nxtDateTime,0,0,False);
  dict.addfield('Maquina','',nxtWord16,0,0,False);
  dict.addfield('Usuario','',nxtNullString,30,0,False);
  dict.addfield('Programa','0=nenhum, 1=cmguard, 2=cmadmin, 3=cmserver',nxtByte,3,0,False);
  dict.addfield('Operacao','',nxtNullString,70,0,False);
  dict.addfield('Horas','',nxtDateTime,0,0,False);
  dict.addfield('Dias','',nxtWord16,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumSeq',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumSeq'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDiaHora',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DiaHora'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IUsuarioNumSeq',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumSeq'));

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
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumSeq'));

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
  dict.addfield('Inicio','',nxtDateTime,0,0,False);
  dict.addfield('Contato','',nxtWord32,10,0,False);
  dict.addfield('TipoAcesso','',nxtWord16,0,0,False);
  dict.addfield('NomeContato','',nxtNullString,40,0,False);
  dict.addfield('InicioTicks','',nxtWord32,10,0,False);
  dict.addfield('Acesso','',nxtInt32,0,0,False);
  dict.addfield('CreditoCli','',nxtWord32,10,0,False);
  dict.addfield('Isento','',nxtBoolean,0,0,False);
  dict.addfield('Menu','',nxtBlobMemo,0,0,False);
  dict.addfield('Recursos','',nxtBlobMemo,0,0,False);
  dict.addfield('Sinal','',nxtCurrency,0,0,False);
  dict.addfield('Vendas','',nxtCurrency,0,0,False);
  dict.addfield('ObsAcesso','',nxtBlobMemo,0,0,False);
  dict.addfield('LimiteTempo','',nxtWord32,0,0,False);
  dict.addfield('LiberaAlemPacote','',nxtBoolean,0,0,False);
  dict.addfield('TicksParadoPac','',nxtWord32,0,0,False);
  dict.addfield('ComputerName','',nxtNullString,200,0,False);
  dict.addfield('AguardaPagto','',nxtBoolean,0,0,False);
  fd:=dict.addfield('Manutencao','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('Caixa','',nxtInt32,0,0,False);
  dict.addfield('UsuarioI','',nxtNullString,30,0,False);
  dict.addfield('TipoTran','',nxtByte,3,0,False);
  dict.addfield('StrPassaportes','',nxtBlobMemo,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumero',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Numero'));

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

  dict.addfield('Codigo','',nxtByte,0,0,False);
  dict.addfield('Descricao','',nxtNullString,30,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICodigo',filedescriptorindex,False,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Codigo'));

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

  dict.addfield('NumSeq','',nxtAutoinc,10,0,False);
  dict.addfield('Transacao','',nxtWord32,0,0,False);
  dict.addfield('Produto','',nxtNullString,15,0,False);
  dict.addfield('Quant','',nxtDouble,0,0,False);
  dict.addfield('Unitario','',nxtCurrency,0,0,False);
  dict.addfield('Total','',nxtCurrency,0,0,False);
  dict.addfield('CustoU','',nxtCurrency,0,0,False);   
  dict.addfield('Item','',nxtByte,0,0,False);
  dict.addfield('Desconto','',nxtCurrency,0,0,False);
  dict.addfield('DataMov','',nxtDateTime,0,0,False);
  dict.addfield('DataPag','',nxtDateTime,0,0,False);
  dict.addfield('Entrada','',nxtBoolean,0,0,False);
  dict.addfield('Cancelado','',nxtBoolean,0,0,False);
  dict.addfield('EstoqueAnt','',nxtDouble,0,0,False);
  dict.addfield('TipoTran','',nxtByte,3,0,False);
  dict.addfield('Contato','',nxtWord32,10,0,False);
  dict.addfield('CaixaMov','',nxtInt32,0,0,False);
  dict.addfield('CaixaPag','',nxtInt32,0,0,False);
  dict.addfield('Categoria','',nxtNullString,20,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IProduto',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Produto'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataMov'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumSeq'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IContato',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Contato'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataMov'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICaixaMov',filedescriptorindex,True,'M',TnxCompKeyDescriptor);
  indexdescriptor.desc:='M';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CaixaMov'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumSeq'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICaixaPag',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CaixaPag'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataPag'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITranItem',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Transacao'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Item'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IProdCxMov',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Produto'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CaixaMov'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumSeq'));

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
  dict.filedescriptor[filedescriptorindex].desc:='Data/DataDict File';
  dict.filedescriptor[filedescriptorindex].initialsize:=4;
  dict.filedescriptor[filedescriptorindex].growsize:=1;
  dict.encryptionengine:='';

  // Fields

  dict.addfield('Codigo','',nxtWord16,0,0,False);
  dict.addfield('Horas','',nxtWord16,0,0,False);
  dict.addfield('ValorTotal','',nxtCurrency,0,0,False);
  dict.addfield('Descr','',nxtNullString,30,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICodigo',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Codigo'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Codigo'));

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

  dict.addfield('Numero','',nxtAutoinc,10,0,False);
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
  dict.addfield('Transacao','',nxtWord32,0,0,False);
  dict.addfield('DataCompra','',nxtDateTime,0,0,False);
  fd:=dict.addfield('Valido','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'True', cdvDefaultValue, fd.fdLength);
  dict.addfield('Valor','',nxtCurrency,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumero',filedescriptorindex,True,'Exp',TnxCompKeyDescriptor);
  indexdescriptor.desc:='Exp';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Numero'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICliExpNumero',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Expirou'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Numero'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITransacao',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Transacao'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICliNumero',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Cliente'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataCompra'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IExpNumero',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Expirou'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Numero'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ISenha',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Senha'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

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

  dict.addfield('Codigo','',nxtNullString,15,0,False);
  dict.addfield('Descricao','',nxtNullString,55,0,False);
  dict.addfield('Unid','',nxtNullString,5,0,False);
  dict.addfield('Preco','',nxtCurrency,5,0,False);
  dict.addfield('Obs','',nxtBlobMemo,0,0,False);
  dict.addfield('Imagem','',nxtBlobGraphic,0,0,False);
  dict.addfield('Categoria','',nxtNullString,35,0,False);
  dict.addfield('SubCateg', '', nxtNullString,35,0,False);
  dict.addfield('EstoqueAtual','',nxtExtended,0,0,False);
  dict.addfield('CustoUnitario','',nxtCurrency,0,0,False);                     
  dict.addfield('EstoqueACE','',nxtExtended,0,0,False);
  dict.addfield('EstoqueACS','',nxtExtended,0,0,False);
  dict.addfield('PodeAlterarPreco','',nxtBoolean,0,0,False);
  dict.addfield('NaoControlaEstoque','',nxtBoolean,0,0,False);
  

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

  dict.addfield('Codigo','',nxtWord16,5,0,False);
  dict.addfield('Nome','',nxtNullString,30,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICodigo',filedescriptorindex,False,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Codigo'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INome',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Nome'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

  result:=dict;
end;


function TipoMovTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('Nome','',nxtNullString,15,0,False);
  dict.addfield('MovEst','',nxtBoolean,0,0,False);
  dict.addfield('Entrada','',nxtBoolean,0,0,False);
  dict.addfield('Serie','',nxtNullString,2,0,False);
  dict.addfield('PermiteAlterarSerie','',nxtBoolean,0,0,False);
  dict.addfield('NumeroAutomatico','',nxtBoolean,0,0,False);
  dict.addfield('ConfirmarMovEstoque','',nxtBoolean,0,0,False);
  dict.addfield('AtualizaCusto','',nxtBoolean,0,0,False);
  dict.addfield('Situacoes','',nxtBlobMemo,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INome',filedescriptorindex,False,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Nome'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);

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

  dict.addfield('Codigo','',nxtAutoinc,10,0,False);
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

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICodigo',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Codigo'));

  result:=dict;
end;


function TransacaoTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('Numero','',nxtAutoinc,10,0,False);
  dict.addfield('CaixaI','',nxtInt32,0,0,False);
  dict.addfield('CaixaF','',nxtInt32,0,0,False);
  dict.addfield('CaixaP','',nxtInt32,0,0,False);
  fd:=dict.addfield('TipoAcesso','',nxtWord16,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  dict.addfield('Inicio','',nxtDateTime,0,0,False);
  dict.addfield('Fim','',nxtDateTime,0,0,False);
  dict.addfield('DataPagto','',nxtDateTime,0,0,False);
  dict.addfield('Contato','',nxtWord32,0,0,False);
  dict.addfield('Nome','',nxtNullString,40,0,False);
  dict.addfield('Maquina','',nxtByte,0,0,False);
  dict.addfield('Tipo','',nxtByte,0,0,False);
  dict.addfield('FuncI','',nxtNullString,10,0,False);
  dict.addfield('FuncF','',nxtNullString,40,0,False);
  dict.addfield('Tempo','',nxtDateTime,0,0,False);
  dict.addfield('TempoCobrado','',nxtDateTime,0,0,False);
  dict.addfield('CredUsado','',nxtWord32,0,0,False);
  dict.addfield('CredAnterior','',nxtWord32,0,0,False);
  dict.addfield('Desconto','',nxtCurrency,0,0,False);
  dict.addfield('Produtos','',nxtCurrency,0,0,False);
  dict.addfield('Valor','',nxtCurrency,0,0,False);
  dict.addfield('Obs','',nxtBlobMemo,0,0,False);
  dict.addfield('Isento','',nxtBoolean,0,0,False);
  fd:=dict.addfield('NaoUsarPacote','',nxtBoolean,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, 'False', cdvDefaultValue, fd.fdLength);
  dict.addfield('CodPacote','',nxtWord16,0,0,False);
  dict.addfield('Sinal','',nxtCurrency,0,0,False);
  dict.addfield('TransacaoVinculada','',nxtWord32,0,0,False);
  dict.addfield('ValorFinalAcesso','',nxtCurrency,0,0,False);
  dict.addfield('DescontoProduto','',nxtCurrency,0,0,False);
  dict.addfield('NumDoc','',nxtNullString,15,0,False);
  fd:=dict.addfield('StatusPagto','0=Em Andamento, 1=Aguarda Pagto, 2=Pago, 3=Debitado',nxtByte,0,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  dict.addfield('T0','',nxtDouble,0,0,False);
  dict.addfield('T1','',nxtDouble,0,0,False);
  dict.addfield('T2','',nxtDouble,0,0,False);
  dict.addfield('T3','',nxtDouble,0,0,False);
  dict.addfield('T4','',nxtDouble,0,0,False);
  dict.addfield('T5','',nxtDouble,0,0,False);
  dict.addfield('T6','',nxtDouble,0,0,False);
  dict.addfield('T7','',nxtDouble,0,0,False);
  dict.addfield('T8','',nxtDouble,0,0,False);
  dict.addfield('T9','',nxtDouble,0,0,False);
  dict.addfield('T10','',nxtDouble,0,0,False);
  dict.addfield('T11','',nxtDouble,0,0,False);
  dict.addfield('T12','',nxtDouble,0,0,False);
  dict.addfield('T13','',nxtDouble,0,0,False);
  dict.addfield('T14','',nxtDouble,0,0,False);
  dict.addfield('T15','',nxtDouble,0,0,False);
  dict.addfield('T16','',nxtDouble,0,0,False);
  dict.addfield('T17','',nxtDouble,0,0,False);
  dict.addfield('T18','',nxtDouble,0,0,False);
  dict.addfield('T19','',nxtDouble,0,0,False);
  dict.addfield('T20','',nxtDouble,0,0,False);
  dict.addfield('T21','',nxtDouble,0,0,False);
  dict.addfield('T22','',nxtDouble,0,0,False);
  dict.addfield('T23','',nxtDouble,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IContato',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Contato'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Inicio'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IData',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Inicio'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IUsuario',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('FuncI'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,False,False,False,False,True,1046);
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Inicio'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumero',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Numero'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IPagto',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('StatusPagto'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CaixaP'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Fim'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IFim',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Fim'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICaixaI',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CaixaF'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Inicio'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICodPac',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CodPacote'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICaixaF',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CaixaF'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Fim'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ITransacaoVinculada',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('TransacaoVinculada'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICaixaP',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CaixaP'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('DataPagto'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumDoc',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumDoc'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IDebito',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Contato'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('StatusPagto'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CaixaP'));
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Fim'));

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
  dict.encryptionengine:='';

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
  dict.addfield('PiscarAvisoTexto','',nxtBoolean,0,0,False);
  dict.addfield('Som','',nxtBlob,0,0,False);
  dict.addfield('TocarSom','',nxtBoolean,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IMinutos',filedescriptorindex,False,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Minutos'),TnxExtTextKeyFieldDescriptor);
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

  dict.addfield('NumSeq','',nxtAutoinc,10,0,False);
  dict.addfield('De','',nxtInt16,0,0,False);
  dict.addfield('Para','',nxtInt16,0,0,False);
  dict.addfield('DataHora','',nxtDateTime,0,0,False);
  dict.addfield('Texto','',nxtBlobMemo,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INumSeq',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('NumSeq'));

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

procedure inittableslist;
begin
  if assigned(Ftables) then exit;
  Ftables:=Tstringlist.create;
  Ftables.addobject('Caixa',@CaixaTableDataDictionary);
  Ftables.addobject('Categoria',@CategoriaTableDataDictionary);
  Ftables.addobject('CC',@CCTableDataDictionary);
  Ftables.addobject('Config',@ConfigTableDataDictionary);
  Ftables.addobject('Contato',@ContatoTableDataDictionary);
  Ftables.addobject('Cor',@CorTableDataDictionary);
  Ftables.addobject('CorPrecos',@CorPrecosTableDataDictionary);
  Ftables.addobject('FormPagto',@FormPagtoTableDataDictionary);
  Ftables.addobject('Grupo',@GrupoTableDataDictionary);
  Ftables.addobject('HistPass',@HistPassTableDataDictionary);
  Ftables.addobject('HoraCor',@HoraCorTableDataDictionary);
  Ftables.addobject('Impressao',@ImpressaoTableDataDictionary);
  Ftables.addobject('Layout',@LayoutTableDataDictionary);
  Ftables.addobject('Log',@LogTableDataDictionary);
  Ftables.addobject('Maquina',@MaquinaTableDataDictionary);
  Ftables.addobject('Motivo',@MotivoTableDataDictionary);
  Ftables.addobject('MovEst',@MovEstTableDataDictionary);
  Ftables.addobject('Pacote',@PacoteTableDataDictionary);
  Ftables.addobject('Passaporte',@PassaporteTableDataDictionary);
  Ftables.addobject('Produto',@ProdutoTableDataDictionary);
  Ftables.addobject('TipoAcesso',@TipoAcessoTableDataDictionary);
  Ftables.addobject('TipoMov',@TipoMovTableDataDictionary);
  Ftables.addobject('TipoPass',@TipoPassTableDataDictionary);
  Ftables.addobject('Transacao',@TransacaoTableDataDictionary);
  Ftables.addobject('Usuario',@UsuarioTableDataDictionary);
  Ftables.addobject('Aviso',@AvisoTableDataDictionary);
  Ftables.addobject('Chat',@CHATTableDataDictionary);
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

procedure CreatecybermgrDatabase(db:TnxDatabase;overwrite:boolean=false;Creating:TnsmCreateDatabaseCb=nil);
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

procedure RestructurecybermgrDatabase(db:TnxDatabase;MatchFieldsBy:smallint=0;RestructuringDatabase:TnsmRestructureDatabaseCb=nil;RestructuringTable:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);
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

function VerifycybermgrDatabase(db:TnxDatabase;Verifying:TnsmVerifyDatabaseCb=nil;verifyerror:TnsmVerifyDatabaseErrorCb=nil):boolean;
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

function cybermgrDbVersion:string;
begin
  result:='';
end;

function cybermgrTablesCount:integer;
begin
  result:=25;
end;

procedure cybermgrGetTableNames(tables:Tstrings);
begin
  tables.assign(Ftables);
end;

initialization
  inittableslist;
finalization
  cleanuptableslist;
end.
