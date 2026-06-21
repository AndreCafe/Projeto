unit uDTDMSync;

interface    

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  nxdbBase, nxdb, 
  nxllConst, nxllTypes, nxptZipCompressor,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport,
  Db, nxllComponent, nxsdServerEngine, nxreRemoteServerEngine,
  kbmMWCustomTransport, kbmMWClient, kbmMemTable,
  kbmMWStreamFormat, kbmMWBinaryStreamFormat, kbmMWClientDataset,
  kbmMWTCPIPIndyTransport, kbmMWTCPIPIndyClientTransport;

type
  PInfoTabela = ^TInfoTabela;
  TInfoTabela = record
   itIndexName : String;
   itMasterSource : TDataSource;
   itMasterFields : String;
  end;
  
  TDMSync = class(TDataModule)
    kbmCli: TkbmMWSimpleClient;
    mwTCPIP: TkbmMWTCPIPIndyClientTransport;
  private
    { Private declarations }
  public
    procedure AbreSessao;
    procedure FechaSessao;
    procedure Sincronizou(Tabela: TDataset);
    procedure TransfDados(F, D: TDataset);
    function SalvaInfoTabela(T: TnxTable): PInfoTabela;
    procedure RestauraInfoTabela(T: TnxTable; var IT : PInfoTabela);
    { Public declarations }
  end;

var
  DMSync: TDMSync;

  ListaProj,
  ListaProjDef : Char;
  ProjetoDown, ClienteDown : String;

const
  TimeoutControle = (1 / 24 / 60 / 60) * 15;

implementation

uses uDTSyncDef, uDTDM, uDTFrmPri, Registry;

{$R *.DFM}

{ TDMSync }

function ObtemProxy(var aProxyIP: String; var aProxyPort: Integer): Boolean;
var 
  R: TRegistry;
begin
  R := nil;
  try
    Result := False;
    R := TRegistry.Create;
    R.RootKey := HKEY_CURRENT_USER;
    R.Access := KEY_READ;
    if R.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet Settings', False) then begin
      Result := (R.ReadInteger('ProxyEnable')=1);
      aProxyIP := R.ReadString('ProxyServer');
      aProxyPort := StrToIntDef(Copy(aProxyIP, Pos(':', aProxyIP)+1, 5), 8080);
      Delete(aProxyIP, Pos(':', aProxyIP), 10);
      R.CloseKey;
    end;
  except
    Result := False;
  end;
  if R<>nil then 
    R.Free;
end;


procedure TDMSync.AbreSessao;
var 
  ProxyIP : String;
  ProxyPort: Integer;
begin
  mwTCPIP.Params.Clear;
  mwTCPIP.Active := False;
  mwTCPIP.Port := cfgPort;
  mwTCPIP.Host := cfgSrv;
  mwTCPIP.StreamFormat := 'ZIPPED';
  try
    mwTCPIP.Active := True;
  except
    if cfgPortHTTP>0 then begin
      if ObtemProxy(ProxyIP, ProxyPort) then begin
        mwTCPIP.Port := ProxyPort;
        mwTCPIP.Host := ProxyIP;
        if cfgPortHTTP <> 80 then
          mwTCPIP.Params.Values['KBMMWHTTPPOSTURL'] := 'http://'+cfgSrv+':'+IntToStr(cfgPortHTTP)
        else  
          mwTCPIP.Params.Values['KBMMWHTTPPOSTURL'] := 'http://'+cfgSrv;
      end else begin
        mwTCPIP.Port := cfgPortHTTP;
        mwTCPIP.Host := cfgSrv;
      end;  
      mwTCPIP.StreamFormat := 'HTTP';
      mwTCPIP.Active := True;
    end else
      Raise;  
  end;    
end;

procedure TDMSync.FechaSessao;
begin
  mwTCPIP.Active := False;
end;

procedure TDMSync.Sincronizou(Tabela: TDataset);
var F: TField;
begin
  if Tabela.FindField('Sync') = nil then Exit;
  Tabela.Edit;
  Tabela.FieldByName('Sync').Value := False;
  F := Tabela.FindField('SyncSug');
  if F<>nil then 
    F.Value := False;
  Tabela.Post;
end;

function TDMSync.SalvaInfoTabela(T: TnxTable): PInfoTabela;
var IT: TInfoTabela;
begin
  IT.itIndexName := T.IndexName;
  IT.itMasterSource := T.MasterSource;
  IT.itMasterFields := T.MasterFields;
  T.CancelRange;
  T.Active := False;
  T.MasterFields := '';
  T.MasterSource := nil;
  T.Active := True;
  T.IndexName := 'ISync';
  New(Result);
  Result^ := IT;
end;

procedure TDMSync.RestauraInfoTabela(T: TnxTable; var IT : PInfoTabela);
begin
  if IT=nil then Exit;
  try
    T.CancelRange;
    T.IndexName    := IT^.itIndexName;
    T.Active := False;
    T.MasterFields := IT^.itMasterFields;
    T.MasterSource := IT^.itMasterSource;
    T.Active := True;
  finally
    Dispose(IT);
    IT := nil;
  end;  
end;
    
procedure TDMSync.TransfDados(F, D: TDataset);
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
  AF := D.FindField('OnServ');
  if AF <> nil then AF.AsBoolean := True;
  
  AF := D.FindField('Sync');
  if AF <> nil then AF.AsBoolean := False;  

  AF := D.FindField('SyncSug');
  if AF <> nil then AF.AsBoolean := False;
  
  D.Post;
end;

end.
