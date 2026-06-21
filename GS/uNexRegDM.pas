unit uNexRegDM;

interface

uses
  SysUtils, Classes, kbmMWClient, kbmMWClientDataset, Variants,
  kbmMWCustomConnectionPool, kbmMemTable, kbmMWStreamFormat,
  kbmMWBinaryStreamFormat, kbmMWCustomTransport, kbmMWTCPIPIndyTransport,
  DB, kbmMWCustomDataset, chBase, chKBM, kbmMWCustomMessagingTransport,
  kbmMWTCPIPIndyMessagingTransport, kbmMWTCPIPIndyClientTransport,
  kbmMWTCPIPIndyMessagingClientTransport, nxdb, nxllTransport,
  nxptBasePooledTransport, nxtwWinsockTransport, nxsdServerEngine,
  nxreRemoteServerEngine, nxllComponent;

type
  TDM = class(TDataModule)
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    nxRSE: TnxRemoteServerEngine;
    nxTCP: TnxWinsockTransport;
    qCli: TnxQuery;
    tCli: TnxTable;
    tCliCodigo: TAutoIncField;
    tUsuario: TnxTable;
    tUsuarioUsername: TStringField;
    tUsuarioSenha: TStringField;
    tUsuarioNome: TStringField;
    tUsuarioAdmin: TBooleanField;
    tUsuarioDireitos: TMemoField;
    tUsuarioNomeCHAT: TStringField;
    tUsuarioStatusCHAT: TStringField;
    tUsuarioCHAT: TBooleanField;
    qCliCodigo: TIntegerField;
    qCliTipo: TWordField;
    qCliSenha: TStringField;
    qCliCadastroEm: TDateTimeField;
    qCliCadastroPor: TStringField;
    qCliAtualizadoEm: TDateTimeField;
    qCliAtualizadoPor: TStringField;
    qCliLoja: TStringField;
    qCliRazaoSocial: TStringField;
    qCliPais: TStringField;
    qCliCidade: TStringField;
    qCliUF: TStringField;
    qCliCEP: TStringField;
    qCliBairro: TStringField;
    qCliSerieHD: TStringField;
    qCliNumMaq: TWordField;
    qCliCNPJ: TStringField;
    qCliIE: TStringField;
    qCliObs: TMemoField;
    qCliEmailReg: TMemoField;
    qCliFormaPagto: TMemoField;
    qCliLicMaq: TWordField;
    qCliLicTipo: TWordField;
    qCliLicVenc: TDateField;
    qCliManInicio: TDateField;
    qCliManVenc: TDateField;
    qCliGerente: TStringField;
    qCliTipoLoja: TWordField;
    qCliEmailTec: TMemoField;
    qCliValor: TCurrencyField;
    qCliValorRec: TCurrencyField;
    qCliEmitirNF: TBooleanField;
    qCliMessenger: TMemoField;
    qCliICQ: TMemoField;
    qCliUObtemLic: TDateTimeField;
    qCliUVersao: TStringField;
    qCliNegociacao: TWordField;
    qCliContatarEm: TDateTimeField;
    dsCli: TDataSource;
    tCliTipo: TWordField;
    tCliSenha: TStringField;
    tCliCadastroEm: TDateTimeField;
    tCliCadastroPor: TStringField;
    tCliAtualizadoEm: TDateTimeField;
    tCliAtualizadoPor: TStringField;
    tCliLoja: TStringField;
    tCliRazaoSocial: TStringField;
    tCliPais: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliCEP: TStringField;
    tCliBairro: TStringField;
    tCliSerieHD: TStringField;
    tCliNumMaq: TWordField;
    tCliCNPJ: TStringField;
    tCliIE: TStringField;
    tCliObs: TMemoField;
    tCliEmailReg: TMemoField;
    tCliFormaPagto: TMemoField;
    tCliLicMaq: TWordField;
    tCliLicTipo: TWordField;
    tCliLicVenc: TDateField;
    tCliManInicio: TDateField;
    tCliManVenc: TDateField;
    tCliGerente: TStringField;
    tCliTipoLoja: TWordField;
    tCliEmailTec: TMemoField;
    tCliValor: TCurrencyField;
    tCliValorRec: TCurrencyField;
    tCliEmitirNF: TBooleanField;
    tCliMessenger: TMemoField;
    tCliICQ: TMemoField;
    tCliUObtemLic: TDateTimeField;
    tCliUVersao: TStringField;
    tCliNegociacao: TWordField;
    tCliContatarEm: TDateTimeField;
    tAut: TnxTable;
    tAutID: TAutoIncField;
    tAutPrograma: TWordField;
    tAutLoja: TIntegerField;
    tAutAutorizacao: TStringField;
    tAutVencimento: TDateField;
    tAutCodigoEquip: TStringField;
    tAutMaquinas: TWordField;
    tAutTipo: TWordField;
    tAutCriadaEm: TDateTimeField;
    tAutCriadaPor: TStringField;
    tAutInativadaEm: TDateTimeField;
    tAutInativadaPor: TStringField;
    tAutAtiva: TBooleanField;
    tAutObs: TMemoField;
    tAutGerar: TBooleanField;
    tAutEnviouCli: TBooleanField;
    tCliPrograma: TWordField;
    tCliCodEquip: TStringField;
    qCliCodEquip: TStringField;
    qCliPrograma: TWordField;
    qCliCodLoja: TIntegerField;
    tCliBloqueado: TBooleanField;
    tCliCliente: TBooleanField;
    qCliBloqueado: TBooleanField;
    qCliCliente: TBooleanField;
    qCliCodigoComp: TStringField;
    qCliTipoAut: TWordField;
    qCliAtivado: TBooleanField;
    qCliCodAtivacao: TStringField;
    qCliEmailConta: TStringField;
    qCliAtivadoEm: TDateTimeField;
    qCliTipoConta: TWordField;
    qCliPremiumAte: TDateTimeField;
    tCliAtivado: TBooleanField;
    tCliCodAtivacao: TStringField;
    tCliEmailConta: TStringField;
    tCliAtivadoEm: TDateTimeField;
    tCliTipoConta: TWordField;
    tCliPremiumAte: TDateTimeField;
    tCliCodDesc: TStringField;
    qCliCodDesc: TStringField;
    tCliCadastroCompleto: TBooleanField;
    tCliCadastroCompletoEm: TDateTimeField;
    tCliRegistroEm: TDateTimeField;
    tCliCidade_geoip: TStringField;
    tCliUF_geoip: TStringField;
    tCliEndereco: TStringField;
    tCliTels: TnxMemoField;
    tCliProp: TnxMemoField;
    tCliProprietario: TStringField;
    tCliContaTrocada: TBooleanField;
    tCliCAno: TWordField;
    tCliCMes: TWordField;
    tCliCDia: TWordField;
    tCliAAno: TWordField;
    tCliAMes: TWordField;
    tCliADia: TWordField;
    tCliUAno: TWordField;
    tCliUMes: TWordField;
    tCliUDia: TWordField;
    tCliUDias: TWordField;
    tCliMotivoDesist: TStringField;
    tCliLastAdminPopup: TDateTimeField;
    tCliCampanha: TStringField;
    tCliutmccn: TIntegerField;
    tCliutmctr: TIntegerField;
    tCliutmcct: TIntegerField;
    tCliutmcsr: TIntegerField;
    tCliutmcmd: TIntegerField;
    tCliOrigem: TStringField;
    tCliRedirT: TIntegerField;
    tCliRedirI: TDateTimeField;
    tCliTel1: TStringField;
    tCliTel2: TStringField;
    tCliTel3: TStringField;
    tCliTel4: TStringField;
    tCliTipoTel1: TWordField;
    tCliTipoTel2: TWordField;
    tCliTipoTel3: TWordField;
    tCliTipoTel4: TWordField;
    tCliUpdateCad: TIntegerField;
    tCliUpdateMkt: TIntegerField;
    tCliUpdateContato: TIntegerField;
    tCliDBounce: TDateTimeField;
    tCliDInativo: TDateTimeField;
    tCliInstalouEm: TDateTimeField;
    tCliBounce: TBooleanField;
    tCliInativo: TBooleanField;
    tCliConfirmouLocal: TBooleanField;
    tCliPreRegistro: TBooleanField;
    tCliPreRegistroIP: TStringField;
    tCliPreRegistroEm: TDateTimeField;
    tCliContatoCC: TBooleanField;
    tCliStatus: TWordField;
    tCliStatusDesde: TDateTimeField;
    tCliRecente: TBooleanField;
    tCliParouRedir: TBooleanField;
    tCliPremium: TBooleanField;
    tCliFezRedir: TBooleanField;
    tCliRedirU: TDateTimeField;
    tCliRedirD: TWordField;
    tCliUsou: TBooleanField;
    tCliSaiu: TBooleanField;
    tCliVaiVoltar: TBooleanField;
    tCliVaiVoltarAte: TDateTimeField;
    tCliCCContatoOk: TBooleanField;
    tCliCCContatoFail: TBooleanField;
    tCliCCPContatoOk: TDateTimeField;
    tCliCCPContatoFail: TDateTimeField;
    tCliCCUContatoOk: TDateTimeField;
    tCliCCUContatoFail: TDateTimeField;
    tCliCCQContatoOK: TIntegerField;
    tCliCCQContatoFail: TIntegerField;
    tCliCCAgente: TIntegerField;
    qCliCadastroCompleto: TBooleanField;
    qCliCadastroCompletoEm: TDateTimeField;
    qCliRegistroEm: TDateTimeField;
    qCliCidade_geoip: TStringField;
    qCliUF_geoip: TStringField;
    qCliTels: TnxMemoField;
    qCliProp: TnxMemoField;
    qCliProprietario: TStringField;
    qCliContaTrocada: TBooleanField;
    qCliCAno: TWordField;
    qCliCMes: TWordField;
    qCliCDia: TWordField;
    qCliAAno: TWordField;
    qCliAMes: TWordField;
    qCliADia: TWordField;
    qCliUAno: TWordField;
    qCliUMes: TWordField;
    qCliUDia: TWordField;
    qCliUDias: TWordField;
    qCliMotivoDesist: TStringField;
    qCliLastAdminPopup: TDateTimeField;
    qCliCampanha: TStringField;
    qCliutmccn: TIntegerField;
    qCliutmctr: TIntegerField;
    qCliutmcct: TIntegerField;
    qCliutmcsr: TIntegerField;
    qCliutmcmd: TIntegerField;
    qCliOrigem: TStringField;
    qCliRedirT: TIntegerField;
    qCliRedirI: TDateTimeField;
    qCliTel1: TStringField;
    qCliTel2: TStringField;
    qCliTel3: TStringField;
    qCliTel4: TStringField;
    qCliTipoTel1: TWordField;
    qCliTipoTel2: TWordField;
    qCliTipoTel3: TWordField;
    qCliTipoTel4: TWordField;
    qCliUpdateCad: TIntegerField;
    qCliUpdateMkt: TIntegerField;
    qCliUpdateContato: TIntegerField;
    qCliDBounce: TDateTimeField;
    qCliDInativo: TDateTimeField;
    qCliInstalouEm: TDateTimeField;
    qCliBounce: TBooleanField;
    qCliInativo: TBooleanField;
    qCliConfirmouLocal: TBooleanField;
    qCliPreRegistro: TBooleanField;
    qCliPreRegistroIP: TStringField;
    qCliPreRegistroEm: TDateTimeField;
    qCliContatoCC: TBooleanField;
    qCliStatusDesde: TDateTimeField;
    qCliRecente: TBooleanField;
    qCliParouRedir: TBooleanField;
    qCliPremium: TBooleanField;
    qCliFezRedir: TBooleanField;
    qCliRedirU: TDateTimeField;
    qCliRedirD: TWordField;
    qCliUsou: TBooleanField;
    qCliSaiu: TBooleanField;
    qCliVaiVoltar: TBooleanField;
    qCliVaiVoltarAte: TDateTimeField;
    qCliCCContatoOk: TBooleanField;
    qCliCCContatoFail: TBooleanField;
    qCliCCPContatoOk: TDateTimeField;
    qCliCCPContatoFail: TDateTimeField;
    qCliCCUContatoOk: TDateTimeField;
    qCliCCUContatoFail: TDateTimeField;
    qCliCCQContatoOK: TIntegerField;
    qCliCCQContatoFail: TIntegerField;
    qCliCCAgente: TIntegerField;
    qCliEndereco: TStringField;
    qCliStatus: TWordField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qCliCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FPai : Integer;
  public
    procedure AbreCli;
    { Public declarations }
  end;

  procedure TransfFields(F, D: TFields);

const
  SvcName = 'Admin';
  SvcVersion = '100';  

var
  DM: TDM;

  lOperacao: Byte;
  lLoja: String;
  lCodigo: Integer;
  lCidade: String;
  lProprietario: String;
  lEmail: String;
  lNumSerie: String;
  lUltimos: Integer;
  UsuarioLogin : String;


implementation

uses uLicenca, kbmMWZipStdTransStream, uNexRegPri;

{$R *.dfm}

procedure TransfFields(F, D: TFields);
var 
  I : Integer;
  Obj: TField;
begin
  for I := 0 to F.Count-1 do with F[I] do begin
    Obj := D.FindField(FieldName);
    if (Obj <> nil) and (Obj.FieldKind=fkData) then
      Obj.Value := Value;
  end;    
end;

procedure TDM.AbreCli;
var 
  S, Str: String;
  

procedure AddCond(sCond: String);
begin
  if S>'' then
    S := S + ' AND ';
  S := S + '('+sCond+')';
end;

procedure AddCondEsp(aCampo, aValor: String);
begin
  if Trim(aValor)>'' then
    AddCond('Upper('+aCampo+') like '+QuotedStr('%'+UpperCase(aValor)+'%'));
end;

begin
  S := '';
  FrmPri.DisableDatasets;
  qCli.DisableControls;
  dsCli.Dataset := nil;
  try
    qCli.Active := False;
    case lOperacao of
      0 : begin
        tCli.Active := True;
        tCli.Last;
        if (tCliCodigo.Value-lUltimos) > 0 then
          qCli.Sql.Text := 'select * from cliente where Codigo > ' + IntToStr(tCliCodigo.Value-lUltimos) else
          qCli.Sql.Text := 'select * from cliente where Codigo > 0';
      end;
      1 : begin  
        AddCondEsp('Loja', lLoja);
        if lCodigo>0 then
          AddCond('Codigo = ' + IntToStr(lCodigo));
        AddCondEsp('Cidade', lCidade);
        
        AddCondEsp('Proprietarios', lProprietario);
        if Trim(lNumSerie)>'' then
          AddCond('(SerieHD = '+ QuotedStr(lNumSerie)+') or (CodEquip = '+QuotedStr(lNumSerie)+')');
        if Trim(lEmail)>'' then begin
          Str := '((Upper(EmailTec) like '+QuotedStr('%'+UpperCase(lEmail)+'%')+') OR '+
                 '(Upper(EmailConta) like '+QuotedStr('%'+UpperCase(lEmail)+'%')+') OR '+
                 '(Upper(EmailReg) like '+QuotedStr('%'+UpperCase(lEmail)+'%')+') OR '+
                 '(Upper(Messenger) like '+QuotedStr('%'+UpperCase(lEmail)+'%')+'))';
          AddCond(Str);       
        end;
        if S='' then
          S := '(Codigo = -1)';
        qCli.SQL.Text := 'Select * from cliente where ' + S;
      end;
  
      2 : qCli.SQL.Text := 'Select * from cliente';
    end;
    S := qCli.SQL.Text;
    if S='1239871293' then Exit;
    qCli.Active := True;
  finally
    dsCli.Dataset := qCli;
    qCli.EnableControls;
    FrmPri.EnableDatasets;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  lOperacao := 0;
  lLoja := '';
  lCodigo := 0;
  lCidade := '';
  lProprietario := '';
  lEmail := '';
  lNumSerie := '';
  lUltimos := 15;
end;

procedure TDM.qCliCalcFields(DataSet: TDataSet);
begin
  qCliCodLoja.Value := qCliCodigo.Value;
  qCliCodigoComp.Value := CodLojaToStr(qCliCodigo.Value);
  qCliTipoAut.AsVariant := tAut.Lookup('Loja;Ativa', VarArrayOf([qCliCodigo.Value, True]), 'Tipo');
end;

end.
