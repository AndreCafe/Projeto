unit uzEstruturaTabs;

//************************************************
//*   Source created with NexusDb Source Maker   *
//*                 Version 1.1.4                *
//*                                              *
//*               by Roberto Nicchi              *
//*            M a s t e r Informatica           *
//*                    Italy                     *
//*         software@masterinformatica.net       *
//*                                              *
//*       Source creation date: 10/3/2008       *
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

procedure CreateZorroDatabase(db:TnxDatabase;overwrite:boolean=false;creating:TnsmCreateDatabaseCb=nil);

procedure RestructureZorroDatabase(db:TnxDatabase;MatchFieldsBy:smallint=0;RestructuringDatabase:TnsmRestructureDatabaseCb=nil;RestructuringTable:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);

function VerifyZorroDatabase(db:TnxDatabase;Verifying:TnsmVerifyDatabaseCb=nil;verifyerror:TnsmVerifyDatabaseErrorCb=nil):boolean;

function ZorroDbVersion:string;

function ZorroTablesCount:integer;

procedure ZorroGetTableNames(tables:Tstrings);

// Tables methods

function TableDataDictionary(tablename:string):TnxDataDictionary;

procedure CreateTableByDict(db:TnxDatabase;tablename:string;dict:TnxDataDictionary;overwrite:boolean=false);

procedure CreateTable(db:TnxDatabase;tablename:string;overwrite:boolean=false);

function VerifyTableStructureByDict(db:TnxDatabase;tablename:string;dict:TnxDataDictionary):integer;

function VerifyTableStructure(db:TnxDatabase;tablename:string):integer;

procedure RestructureTableByDict(db:TnxDatabase;tablename:string;newdict:TnxDataDictionary;MatchFieldsBy:smallint=0;Restructuring:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);

procedure RestructureTable(db:TnxDatabase;tablename:string;MatchFieldsBy:smallint=0;Restructuring:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);

function bancoTableDataDictionary:TnxDataDictionary;
function boletoTableDataDictionary:TnxDataDictionary;

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


function bancoTableDataDictionary:TnxDataDictionary;
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

  dict.addfield('Num','',nxtNullString,3,0,False);
  dict.addfield('Nome','',nxtNullString,60,0,False);
  dict.addfield('Abrev','',nxtNullString,20,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INum',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Num'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('INome',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Nome'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IAbrev',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Abrev'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  result:=dict;
end;


function boletoTableDataDictionary:TnxDataDictionary;
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
  fd:=dict.addfield('Tipo','',nxtByte,3,0,False);
  with TnxConstDefaultValueDescriptor(fd.AddDefaultValue(TnxConstDefaultValueDescriptor)) do VariantToNative(fd.fdType, '0', cdvDefaultValue, fd.fdLength);
  dict.addfield('Fornecedor','',nxtInt32,10,0,False);
  dict.addfield('CodigoBarras','',nxtNullString,44,0,False);
  dict.addfield('LinhaDig','',nxtNullString,47,0,False);
  dict.addfield('Scan','',nxtDateTime,0,0,False);
  dict.addfield('Vencimento','',nxtDate,0,0,False);
  dict.addfield('Pagamento','',nxtDateTime,0,0,False);
  dict.addfield('Valor','',nxtCurrency,0,0,False);
  dict.addfield('Banco','',nxtNullString,3,0,False);
  dict.addfield('ImBoleto','',nxtBlobGraphic,0,0,False);
  dict.addfield('ImPagto','',nxtBlobGraphic,0,0,False);
  dict.addfield('ServPub','',nxtBoolean,0,0,False);
  dict.addfield('Descr','',nxtNullString,50,0,False);
  dict.addfield('Obs','',nxtBlobMemo,0,0,False);

  // Indexes

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IID',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('ID'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('ICodBar',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('CodigoBarras'),TnxExtTextKeyFieldDescriptor);
  SetExtTextKeyFieldDescriptorOptions(kfd,True,True,True,False,True,False,1046);

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IVencimento',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Vencimento'));

  FileDescriptorIndex:=0;
  indexdescriptor:=dict.AddIndex('IPagto',filedescriptorindex,True,'',TnxCompKeyDescriptor);
  indexdescriptor.desc:='';
  indexdescriptor.indexfile.blocksize:=nxbs4k;
  kfd:=TnxCompKeyDescriptor(indexdescriptor.keydescriptor).Add(dict.GetFieldFromName('Pagamento'));

  result:=dict;
end;


procedure inittableslist;
begin
  if assigned(Ftables) then exit;
  Ftables:=Tstringlist.create;
  Ftables.addobject('banco',@bancoTableDataDictionary);
  Ftables.addobject('boleto',@boletoTableDataDictionary);
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

procedure CreateZorroDatabase(db:TnxDatabase;overwrite:boolean=false;Creating:TnsmCreateDatabaseCb=nil);
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

procedure RestructureZorroDatabase(db:TnxDatabase;MatchFieldsBy:smallint=0;RestructuringDatabase:TnsmRestructureDatabaseCb=nil;RestructuringTable:TnsmRestructureTableCb=nil;VerifyRenamedField:TnsmRenamedFieldCb=nil);
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

function VerifyZorroDatabase(db:TnxDatabase;Verifying:TnsmVerifyDatabaseCb=nil;verifyerror:TnsmVerifyDatabaseErrorCb=nil):boolean;
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

function ZorroDbVersion:string;
begin
  result:='';
end;

function ZorroTablesCount:integer;
begin
  result:=2;
end;

procedure ZorroGetTableNames(tables:Tstrings);
begin
  tables.assign(Ftables);
end;

initialization
  inittableslist;
finalization
  cleanuptableslist;
end.
