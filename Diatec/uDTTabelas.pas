unit uDTTabelas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, 
  nxdb,
  nxdbBase,
  nxllConst, nxllTypes,
  nxsdDataDictionary,
  nxsdTypes, 
  nxllutils, 
  nxsqlProxies, 
  nxsdserverengine,
  uDTFmtTabs,
  ComCtrls;

  function TableIndex(Nome: String): Integer;

type

  TChecaBD = class
  public
    procedure Checar(dbPar, dbLog, dbDown, dbUp: TnxDatabase);  
  end;

  procedure ChecaTabela(nxdb: TnxDatabase; Nome: String; Dict: TnxDataDictionary);
  
const
  NumTabs = 23;

  iddbLog  = 1;
  iddbPar  = 2;
  iddbDown = 3;
  iddbUp   = 4;

  strDB : Array[1..4] of String = (
    'Log', 'Parametro', 'Temp', 'Upload');
  

  idtbAmarraFase   = 1;
  idtbCliente      = 2;
  idtbFase         = 3;
  idtbFaseTec      = 4;
  idtbMotivo       = 5;
  idtbOS           = 6;
  idtbOSFase       = 7;
  idtbProjeto      = 8;
  idtbTecnico      = 9;
  idtbOSFaseDesc   = 10;
  idtbTipoHora     = 11;
  idtbOcorrencia   = 12;
  idtbParametro    = 13;
  idtbSolicita     = 14;
  idtbSolicitaDesc = 15;
  idtbLog          = 16;
  idtbFeriado      = 17;
  idtbRA           = 18;
  idtbRAItem       = 19;
  idtbRAOS         = 20;
  idtbRAF          = 21;
  idtbRAFCli       = 22;
  idtbRAFTec       = 23;
  

  NomeTab : Array[1..NumTabs] of String = (
   'AmarraFase', 
   'Cliente', 
   'Fase', 
   'FaseTec', 
   'Motivo', 
   'OS', 
   'OSFase', 
   'Projeto', 
   'Tecnico', 
   'OSFaseDesc', 
   'TipoHora', 
   'Ocorrencia',
   'Parametro',
   'Solicita',
   'SolicitaDesc',
   'Log',
   'Feriado',
   'RA',
   'RAItem',
   'RAOS',
   'RAF',
   'RAFCli',
   'RAFTec');

  dbTab : Array[1..NumTabs] of Byte = (
   iddbDown,  // AmarraFase
   iddbDown,  // Cliente
   iddbDown,  // Fase
   iddbDown,  // FaseTec
   iddbDown,  // Motivo
   iddbDown,  // OS
   iddbDown,  // OSFase
   iddbDown,  // Projeto
   iddbDown,  // Tecnico
   iddbDown,  // OSFaseDesc
   iddbDown,  // TipoHora
   iddbDown,  // Ocorrencia
   iddbPar,   // Parametro
   iddbDown,  // Solicita    
   iddbDown,  // SOlicitaDesc
   iddbLog,   // Log
   iddbDown,  // Feriado
   iddbUP,    // RA
   iddbUP,    // RAItem
   iddbUP,    // RAOS
   iddbUP,    // RAF
   iddbUP,    // RAFCli
   iddbUP);   // RAFTec
   
  UploadTab : Array[1..NumTabs] of Boolean = (
   False,     // AmarraFase
   False,     // Cliente
   True,      // Fase
   False,     // FaseTec
   False,     // Motivo
   True,      // OS
   True,      // OSFase
   False,     // Projeto
   False,     // Tecnico
   True,      // OSFaseDesc
   False,     // TipoHora
   False,     // Ocorrencia
   False,     // Parametro
   True,      // Solicita    
   True,      // SOlicitaDesc
   False,     // Log
   False,     // Feriado
   True,      // RA
   True,      // RAItem
   True,      // RAOS
   False,      // RAF
   False,     // RAFCli
   False);    // RAFTec
   
  ClientTab : Array[1..NumTabs] of Boolean = (
   True,     // AmarraFase
   True,     // Cliente
   True,     // Fase
   True,     // FaseTec
   True,     // Motivo
   True,     // OS
   True,     // OSFase
   True,     // Projeto
   True,     // Tecnico
   True,     // OSFaseDesc
   True,     // TipoHora
   True,     // Ocorrencia
   True,     // Parametro
   True,     // Solicita    
   True,     // SolicitaDesc
   True,     // Log
   True,     // Feriado
   True,     // RA
   True,     // RAItem
   True,     // RAOS
   False,    // RAF
   False,    // RAFCli
   False);   // RAFTec
   
    
  DownloadTotal : Array[1..NumTabs] of Boolean = (
   False,     // AmarraFase
   False,     // Cliente
   False,     // Fase
   False,     // FaseTec
   True ,     // Motivo
   False,     // OS 
   False,     // OSFase
   False,     // Projeto
   True ,     // Tecnico
   False,     // OSFaseDesc
   True ,     // TipoHora
   True,      // Ocorrencia
   True,      // Parâmetro
   False,     // Solicita
   False,     // SolicitaDesc
   False,     // Log
   True,      // Feriado
   False,     // RA
   False,     // RAItem
   False,     // RAOS
   False,     // RAF
   False,     // RAFCli
   False);    // RAFTec

  ImportarDBF   : Array[1..NumTabs] of Boolean = (
   True,      // AmarraFase
   True,      // Cliente
   True,      // Fase
   True,      // FaseTec
   True,      // Motivo
   True,      // OS 
   True,      // OSFase
   True,      // Projeto
   True,      // Tecnico
   True,      // OSFaseDesc
   True,      // TipoHora
   True,      // Ocorrencia
   False,     // Parâmetro
   True,      // Solicita
   True,      // SolicitaDesc
   False,     // Log
   True,      // Feriado
   False,     // RA
   False,     // RAItem
   False,     // RAOS
   False,     // RAF
   False,     // RAFCli
   False);    // RAFTec

  ExportarDBF   : Array[1..NumTabs] of Boolean = (
   False,     // AmarraFase
   False,     // Cliente
   True,      // Fase
   False,     // FaseTec
   False,     // Motivo
   True,      // OS
   True,      // OSFase
   False,     // Projeto
   False,     // Tecnico
   True,      // OSFaseDesc
   False,     // TipoHora
   False,     // Ocorrencia
   False,     // Parametro
   True,      // Solicita    
   True,      // SOlicitaDesc
   False,     // Log
   False,     // Feriado
   False,     // RA
   False,     // RAItem
   False,     // RAOS
   False,     // RAF
   False,     // RAFCli
   False);     // RAFTec
   
  
implementation

{$F+}

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;
     
function TableIndex(Nome: String): Integer;
var I : Integer;
begin
  if Nome[1] = 'U' then 
    Delete(Nome, 1, 1);
  
  for I := 1 to NumTabs do
  if Nome = NomeTab[I] then
  begin
    Result := I;
    Exit;
  end;
  Result := -1;
end;
     
procedure ChecaTabela(nxdb: TnxDatabase; Nome: String; Dict: TnxDataDictionary);
begin
  if nxdb=nil then Exit;
  if Dict=nil then
    Dict := TableDataDictionary(Nome);

  case verifytablestructurebydict(nxdb, Nome, Dict) of
    1 : createtablebydict(nxdb, Nome, Dict);
    2 : restructuretablebydict(nxdb, Nome, Dict);
  end;  
end;
     
procedure TChecaBD.Checar(dbPar, dbLog, dbDown, dbUp: TnxDatabase);  

var 
  I : Integer;
  Dict : TnxDataDictionary;
  nxdb : TnxDatabase;

begin
  for I := 1 to NumTabs do 
  begin
    case dbTab[I] of
      iddbLog  : nxdb := dbLog;
      iddbPar  : nxdb := dbPar;
      iddbDown : nxdb := dbDown;
      iddbUP   : nxdb := dbUp;
    else
      nxdb := nil;
    end;  
    
    Dict := TableDataDictionary(NomeTab[I]);
    ChecaTabela(nxdb, NomeTab[I], Dict);
    if UploadTab[I] and ExportarDBF[I] then
      ChecaTabela(dbUp, 'U'+NomeTab[I], Dict);
  end;  
end;

end.
