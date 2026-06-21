unit uCMDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, nxdb, nxllConst, nxllTypes, nxdbBase, kbmMemTable, LMDCustomComponent,
  LMDOneInstance, 
  cmClassesBase, 
  cmServRemoto,
  cmListaID,
  cmIDRecursos,
  dxBar,
  cmCompCliente, ExtCtrls, nxsdServerEngine, nxreRemoteServerEngine,
  nxllComponent, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport;

type

  TDados = class(TDataModule)
    tbCli: TnxTable;
    dsCli: TDataSource;
    tbPro: TnxTable;
    dsPro: TDataSource;
    tbCat: TnxTable;
    dsCat: TDataSource;
    dsME: TDataSource;
    tbME: TnxTable;
    tbMENumero: TAutoIncField;
    tbMEDiaHora: TDateTimeField;
    tbMEChamada: TIntegerField;
    tbMEUsuario: TStringField;
    tbMEEntregador: TWordField;
    tbMEFormaPagto: TStringField;
    tbMETotal: TCurrencyField;
    tbMEDesconto: TCurrencyField;
    tbMEObs: TMemoField;
    tbMEData: TDateField;
    tbMEHora: TTimeField;
    tbProCodigo: TStringField;
    tbProDescricao: TStringField;
    tbProUnid: TStringField;
    tbProPreco: TCurrencyField;
    tbProObs: TMemoField;
    tbProImagem: TGraphicField;
    tbProCategoria: TStringField;
    tbMENomeContato: TStringField;
    tbCatDescricao: TStringField;
    tbItensME: TnxTable;
    dsItensME: TDataSource;
    tbFPag: TnxTable;
    dsFPag: TDataSource;
    tbFPagDescricao: TStringField;
    tbMEEndEnt: TStringField;
    tbMEBaiEnt: TStringField;
    tbMECidEnt: TStringField;
    tbMEUFEnt: TStringField;
    Session: TnxSession;
    db: TnxDatabase;
    tbProxCategoria: TStringField;
    tbMETotalFinal: TCurrencyField;
    tbConfig: TnxTable;
    dsConfig: TDataSource;
    SoUmProg: TLMDOneInstance;
    tbTipoMov: TnxTable;
    dsTipoMov: TDataSource;
    tbTipoMovNome: TStringField;
    tbTipoMovMovEst: TBooleanField;
    tbTipoMovEntrada: TBooleanField;
    tbTipoMovSerie: TStringField;
    tbTipoMovPermiteAlterarSerie: TBooleanField;
    tbTipoMovNumeroAutomatico: TBooleanField;
    tbTipoMovConfirmarMovEstoque: TBooleanField;
    tbTipoMovAtualizaCusto: TBooleanField;
    tAuxItens: TnxTable;
    tAuxItensEmissor: TIntegerField;
    tAuxItensSerie: TStringField;
    tAuxItensNumero: TIntegerField;
    tAuxItensProduto: TStringField;
    tAuxItensQuant: TFloatField;
    tAuxItensUnitario: TCurrencyField;
    tAuxItensTotal: TCurrencyField;
    tAuxItensItem: TWordField;
    tAuxItensDesconto: TCurrencyField;
    tAuxItensData: TDateTimeField;
    tAuxItensMovEst: TBooleanField;
    tAuxItensCancelado: TBooleanField;
    tAuxItensEstoqueAnt: TFloatField;
    tAuxItensTipoMov: TStringField;
    tAuxItensContato: TIntegerField;
    tAuxItensSaldo: TFloatField;
    tAuxItensFatorSaldo: TIntegerField;
    tAuxItensNumSeq: TAutoIncField;
    tAuxItensEntrada: TBooleanField;
    tbItensMENumSeq: TAutoIncField;
    tbItensMEEmissor: TIntegerField;
    tbItensMESerie: TStringField;
    tbItensMENumero: TIntegerField;
    tbItensMEProduto: TStringField;
    tbItensMEQuant: TFloatField;
    tbItensMEUnitario: TCurrencyField;
    tbItensMETotal: TCurrencyField;
    tbItensMEItem: TWordField;
    tbItensMEDesconto: TCurrencyField;
    tbItensMEData: TDateTimeField;
    tbItensMEMovEst: TBooleanField;
    tbItensMEEntrada: TBooleanField;
    tbItensMECancelado: TBooleanField;
    tbItensMEEstoqueAnt: TFloatField;
    tbItensMETipoMov: TStringField;
    tbItensMEContato: TIntegerField;
    tbMESerie: TStringField;
    tbMETipo: TStringField;
    tbMEEntrada: TBooleanField;
    tbMEMovEst: TBooleanField;
    tbMEContato: TIntegerField;
    tbMEEmissor: TIntegerField;
    tbMEDtMovimentacao: TDateTimeField;
    tbMECancelado: TBooleanField;
    tbProEstoqueAtual: TFloatField;
    tbProCustoUnitario: TCurrencyField;
    RSE: TnxRemoteServerEngine;
    tbProEstoqueACE: TFloatField;
    tbProEstoqueACS: TFloatField;
    tbProEstoqueFinal: TFloatField;
    tbMEEntregar: TBooleanField;
    tbMESituacao: TStringField;
    tbTipoMovSituacoes: TMemoField;
    mtUsuario: TkbmMemTable;
    dsUsuario: TDataSource;
    mtUsuarioUsername: TStringField;
    mtUsuarioNome: TStringField;
    mtUsuarioAdmin: TBooleanField;
    mtUsuarioSenha: TStringField;
    mtUsuarioGrupos: TMemoField;
    mtUsuarioDireitos: TMemoField;
    mtUsuarioNumClientes: TIntegerField;
    mtGrupo: TkbmMemTable;
    mtGrupoNome: TStringField;
    mtGrupoUsuarios: TMemoField;
    mtGrupoDireitos: TMemoField;
    dsGrupo: TDataSource;
    tbLayout: TnxTable;
    dsLayout: TDataSource;
    tbLayoutUsuario: TStringField;
    tbLayoutGrid: TStringField;
    tbLayoutNome: TStringField;
    tbLayoutPublico: TBooleanField;
    tbLayoutLayout: TBlobField;
    tbLayoutFiltro: TBlobField;
    tbLayoutUsuarios: TMemoField;
    ServRem: TCMServidorRemoto;
    CM: TClienteCyberMgr;
    mtMaquina: TkbmMemTable;
    mtMaquinaNumero: TIntegerField;
    mtMaquinaNome: TStringField;
    mtMaquinaInicio: TDateTimeField;
    mtMaquinaContato: TIntegerField;
    mtMaquinaNomeContato: TStringField;
    mtMaquinaInicioTicks: TIntegerField;
    mtMaquinaAcesso: TIntegerField;
    dsMaquina: TDataSource;
    mtMaquinaCliente: TIntegerField;
    mtMaquinaConectado: TBooleanField;
    tbMotivo: TnxTable;
    dsMotivo: TDataSource;
    tbMotivoCodigo: TWordField;
    tbMotivoDescricao: TStringField;
    tbPacote: TnxTable;
    dsPacote: TDataSource;
    tbPacoteHoras: TSmallintField;
    tbPacoteValorTotal: TCurrencyField;
    tbCaixa: TnxTable;
    Timer1: TTimer;
    mtMaquinaProgramaAtual: TStringField;
    mtMaquinaParado: TBooleanField;
    mtMaquinaLimiteTempo: TIntegerField;
    mtMaquinaLimiteTempoDT: TDateTimeField;
    tbCaixaNumero: TAutoIncField;
    tbCaixaAbertura: TDateTimeField;
    tbCaixaFechamento: TDateTimeField;
    tbCaixaUsuario: TStringField;
    tbCaixaLancExtrasE: TCurrencyField;
    tbCaixaLancExtrasS: TCurrencyField;
    tbCaixaDescontos: TCurrencyField;
    tbCaixaInternet: TCurrencyField;
    tbCaixaPacotes: TCurrencyField;
    tbCaixaVendas: TCurrencyField;
    tbCaixaSaldoAnt: TCurrencyField;
    tbCaixaAberto: TBooleanField;
    tbCaixaObs: TMemoField;
    tbMECaixa: TIntegerField;
    mtMaquinaMenu: TMemoField;
    tbAcesso: TnxTable;
    tbAuxCx: TnxTable;
    tbAuxCxNumero: TAutoIncField;
    tbAuxCxAbertura: TDateTimeField;
    tbAuxCxFechamento: TDateTimeField;
    tbAuxCxUsuario: TStringField;
    tbAuxCxDescontos: TCurrencyField;
    tbAuxCxInternet: TCurrencyField;
    tbAuxCxSaldoAnt: TCurrencyField;
    tbAuxCxAberto: TBooleanField;
    tbAuxCxObs: TMemoField;
    tbAuxCxSaldoFinal: TCurrencyField;
    tbAuxCxVendas: TCurrencyField;
    tbAuxCxPacotes: TCurrencyField;
    tbAuxCxLancExtrasE: TCurrencyField;
    tbAuxCxLancExtrasS: TCurrencyField;
    tbLancExtra: TnxTable;
    tbLancExtraNumero: TAutoIncField;
    tbLancExtraDia: TDateTimeField;
    tbLancExtraCaixa: TIntegerField;
    tbLancExtraUsuario: TStringField;
    tbLancExtraEntrada: TBooleanField;
    tbLancExtraTipo: TStringField;
    tbLancExtraDescricao: TStringField;
    tbLancExtraValor: TCurrencyField;
    tbLancExtraObs: TMemoField;
    tbLancExtraValorFator: TCurrencyField;
    dsCaixa: TDataSource;
    tbPacoteDescr: TStringField;
    tbPacoteCodigo: TWordField;
    tbHoraCor: TnxTable;
    mtMaquinaTipoAcesso: TWordField;
    tbTipoAcesso: TnxTable;
    mtMaquinaNomeTipoAcesso: TStringField;
    mtMaquinaMostrar: TStringField;
    mtMaquinaSinal: TCurrencyField;
    mtMaquinaVendas: TFloatField;
    tbSinal: TnxTable;
    mtMaquinaTotalFinal: TCurrencyField;
    Q: TnxQuery;
    tbCaixaAguardandoPagto: TCurrencyField;
    mtMaquinaObsAcesso: TStringField;
    tbHoraCorTipoAcesso: TWordField;
    tbHoraCorDia: TWordField;
    tbHoraCorHora: TWordField;
    tbHoraCorCor: TIntegerField;
    tbCor: TnxTable;
    mtMaquinaLiberaAlemPacote: TBooleanField;
    tbCorTipoAcesso: TWordField;
    tbCorCor: TIntegerField;
    tbCorCorFonte: TIntegerField;
    tbCorDescricao: TStringField;
    tbCorReinicia: TBooleanField;
    tbCorPrecos: TnxTable;
    tbCorPrecosTipoAcesso: TWordField;
    tbCorPrecosCor: TIntegerField;
    tbCorPrecosPos: TWordField;
    tbCorPrecosTempo: TDateTimeField;
    tbCorPrecosTolerancia: TDateTimeField;
    tbCorPrecosValor: TCurrencyField;
    tbCorPrecosValorMin: TCurrencyField;
    mtMaquinaComputerName: TStringField;
    tbTipoAcessoCodigo: TWordField;
    tbTipoAcessoNome: TStringField;
    dsTipoAcesso: TDataSource;
    tbConfigNomeProdImp: TStringField;
    tbConfigNumSeq: TAutoIncField;
    tbConfigModulos: TMemoField;
    tbConfigTiposLancExtra: TMemoField;
    tbConfigProgramasPermitidos: TMemoField;
    tbConfigJanelasExplorer: TMemoField;
    tbConfigFecharProgramas: TBooleanField;
    tbConfigAutoExecutar: TStringField;
    tbConfigLimiteTempoPadrao: TDateTimeField;
    tbConfigPacoteTempoReal: TBooleanField;
    tbConfigPermiteLoginSemCred: TBooleanField;
    tbConfigPausarFimPacote: TBooleanField;
    tbConfigProdutoImpressao: TStringField;
    tbConfigPermiteCapturaTela: TBooleanField;
    tbConfigAlertaFimTempo: TDateTimeField;
    tbConfigVariosTiposAcesso: TBooleanField;
    tbConfigModoPagtoAcesso: TWordField;
    mtMaquinaAguardaPagto: TBooleanField;
    Timer2: TTimer;
    tbConfigMostraPrePagoDec: TBooleanField;
    tbConfigTempoMaxAlerta: TDateTimeField;
    tbConfigMostraCliCadAntesAvulso: TBooleanField;
    mtMaquinaManutencao: TBooleanField;
    mtMaquinaCaixa: TIntegerField;
    mtMaquinaUsuarioI: TStringField;
    tbConfigAbre1: TDateTimeField;
    tbConfigAbre2: TDateTimeField;
    tbConfigAbre3: TDateTimeField;
    tbConfigAbre4: TDateTimeField;
    tbConfigAbre5: TDateTimeField;
    tbConfigAbre6: TDateTimeField;
    tbConfigAbre7: TDateTimeField;
    tbConfigFecha1: TDateTimeField;
    tbConfigFecha2: TDateTimeField;
    tbConfigFecha3: TDateTimeField;
    tbConfigFecha4: TDateTimeField;
    tbConfigFecha5: TDateTimeField;
    tbConfigFecha6: TDateTimeField;
    tbConfigFecha7: TDateTimeField;
    tbConfigCorLivre: TIntegerField;
    tbConfigCorFLivre: TIntegerField;
    tbConfigCorUsoPrePago: TIntegerField;
    tbConfigCorFUsoPrePago: TIntegerField;
    tbConfigCorUsoPosPago: TIntegerField;
    tbConfigCorFUsoPosPago: TIntegerField;
    tbConfigCorAguardaPagto: TIntegerField;
    tbConfigCorFAguardaPagto: TIntegerField;
    tbConfigCorManutencao: TIntegerField;
    tbConfigCorFManutencao: TIntegerField;
    tbConfigCorPausado: TIntegerField;
    tbConfigCorFPausado: TIntegerField;
    nxTCPIP: TnxWinsockTransport;
    procedure tbMECalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure FFTblMgrPause;
    procedure tbMEAfterInsert(DataSet: TDataSet);
    procedure SoUmProgCustom(Sender: TObject);
    procedure CMAoDesativar(Sender: TObject);
    procedure tAuxItensCalcFields(DataSet: TDataSet);
    procedure tbProCalcFields(DataSet: TDataSet);
    procedure ffClientConnectionLost(aSource: TObject; aStarting: Boolean;
      var aRetry: Boolean);
    procedure CMAoAtualizarUsuario(Sender: TObject);
    procedure CMAoDestruirUsuario(Sender: TObject);
    procedure CMAoAtualizarGrupo(Sender: TObject);
    procedure CMAoDestruirGrupo(Sender: TObject);
    procedure CMAoAtualizarMaquina(Sender: TObject);
    procedure CMAoDestruirMaquina(Sender: TObject);
    procedure mtMaquinaCalcFields(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure tbAuxCxCalcFields(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
    procedure ChecaTipoMov;
  public
    ListaAcessoFin : TStringList;
    procedure ApagarME(Emissor: Integer; Serie: String; Numero: Integer);
    procedure AbreDB;
    function ObtemSerie(TipoMov: String): String;
    { Public declarations }
    function ObtemSaldoAnterior(Produto: String; 
                                Data: TDateTime; 
                                NumSeq: Integer): Extended;
    procedure AjustaSaldoPosterior(Produto: String; 
                                   Data: TDateTime; 
                                   NumSeq: Integer;
                                   Saldo: Extended);
    procedure AjustaEstoqueProduto(Produto: String; Custo: Double; Quant: Double; Tipo: Integer);
    function ObtemProxNumME(Emissor: Integer; Serie: String): Integer;
    function DireitosGrupo(Grupo: String): String;
    procedure AbrirFecharCaixa;
    function ObtemAguardando: Double;
  end;

  TInfoCor = object
    icCorFundo : TColor;
    icCorFonte : TColor;
    icNegrito  : Boolean;
    procedure Limpa;
    procedure LeStr(S: String);
    function GetStr: String;
  end;

  TInfoModulo = object
    imID        : Byte;
    imPos       : Byte;
    imVisivel   : Boolean;
    imMostratab : Boolean;
    procedure Limpa;
    procedure LeStr(S: String);
    function GetStr: String;
  end;
  
  function DateTimeToTempo(DT: TDateTime; Unid: String): Double;
  procedure GetInfoCor(Itens, Cores: TStrings; S: String; var IC: TInfoCor);
  
  procedure TransfDados(TF, TD: TDataset);
  function Permitido(Recurso, TipoAcesso: Integer): Boolean;

  function BarV(B: Boolean): TdxBarItemVisible;
  
var
  Dados: TDados;
  NumAcessoPagto: Integer;
  
const
  DelimitaSt = #13#10;
  
  MaisDeUm : Boolean = False;  

  ServidorRemoto : Boolean = False;

  Fechando : Boolean = False;

var  
  DirUA : String;   // Direitos do usuário atual
  DiaAberto : TDateTime;
  NumAberto : Integer;

implementation

uses uCMFrmPri, uCMFrmAcesso;

{$R *.DFM}

function BarV(B: Boolean): TdxBarItemVisible;
begin
  if B then
    Result := ivAlways
  else
    Result := ivNever;  
end;

procedure TransfDados(TF, TD: TDataset);
var 
  I : Integer;
  F : TField;
begin
  with TD do
  for I := 0 to pred(Fields.Count) do with Fields[I] do 
  if FieldKind=fkData then begin
    F := TF.FindField(FieldName);
    if (F <> nil) and (F.FieldKind=fkData) then 
      Value := F.Value;
  end;
end;

function Pad(S: String; L: Integer): String;
begin
  while Length(S) < L do S := S + ' ';
  Result := S;
end;

function LeftPadCh(S: String; C: Char; T: Integer): String;
begin
  Result := S;
  while Length(Result) < T do Result := C + Result;
end;

function CalcIDME(D: TDataset): String;
begin
  Result := LeftPadCh(D.FieldByName('Emissor').AsString, '0', 7) +
            Pad(D.FieldByName('Serie').AsString, 2) +
            LeftPadCh(D.FieldByName('Numero').AsString, '0', 7);
end;

function CalcIDItemME(D: TDataset): String;
begin
  Result := CalcIDME(D) +
            LeftPadCh(D.FieldByName('Item').AsString, '0', 3);
end;

procedure TInfoCor.Limpa;
begin
  icCorFundo := clWhite;
  icCorFonte := clBlack;
  icNegrito  := False;
end;
  
procedure TInfoCor.LeStr(S: String);
begin
  if Length(S) <> 31 then
    Limpa 
  else begin
    icCorFundo := TColor(StrToIntDef(Trim(Copy(S, 1, 15)), Integer(clWhite)));
    icCorFonte := TColor(StrToIntDef(Trim(Copy(S, 16, 15)), Integer(clBlack)));
    icNegrito  := (S[31] = 'T')
  end;
end;

function TInfoCor.GetStr: String;
const
  TFStr : Array[Boolean] of Char = ('F', 'T');
begin
  Result := 
    Pad(IntToStr(Integer(icCorFundo)), 15) +
    Pad(IntToStr(Integer(icCorFonte)), 15) +
    TFStr[icNegrito];
end;

procedure GetInfoCor(Itens, Cores: TStrings; S: String; var IC: TInfoCor);
var I : Integer;
begin
  I := Itens.IndexOf(S);
  if I = -1 then I := 0;
  if (Cores.Count>I) then
    IC.LeStr(Cores[I])
  else
    IC.Limpa;  
end;

procedure TInfoModulo.Limpa;
begin
  imID        := 0;
  imPos       := 0;
  imVisivel   := True;
  imMostraTab := True;
end;
  
procedure TInfoModulo.LeStr(S: String);
begin
  if Length(S) <> 6 then
    Limpa
  else begin
    imID := StrToIntDef(Copy(S, 1, 2), 0);
    imPos := StrToIntDef(Copy(S, 3, 2), 0);
    imVisivel := (S[5]='T');
    imMostraTab := (S[6]='T');
  end;  
end;

function TInfoModulo.GetStr: String;
const
  TFStr : Array[Boolean] of Char = ('F', 'T');
begin
  Result := 
    Pad(IntToStr(imID), 2) + 
    Pad(IntToStr(imPos), 2) + 
    TFStr[imVisivel] +
    TFStr[imMostraTab];
end;

function DateTimeToTempo(DT: TDateTime; Unid: String): Double;
begin
  if Unid = 'Horas' then
    Result := Frac(DT) * 24
  else
  if Unid = 'Minutos' then
    Result := Frac(DT) * (24 * 60)
  else
  if Unid = 'Segundos' then
    Result := Frac(DT) * (24 * 60 * 60)
  else
    Result := 0;
end;

procedure TDados.ApagarME(Emissor: Integer; Serie: String; Numero: Integer);
const
  Fator : Array[Boolean] of Integer = (-1, 1);
var
  Produto: String;
  Data: TDateTime;
  NumSeq: Integer;
  SaldoAnt: Extended;
  Tipo : Integer;
  Mov : Extended;
begin
  tbME.IndexName := 'IEmissorSerieNum';
  if not tbME.FindKey([Emissor, Serie, Numero]) then Exit;
  if (tbMETipo.Value='VENDA') then begin
    if tbMECaixa.Value <> NumAberto then begin
      Beep;
      ShowMessage('Caixa não encontrado!');
      Exit;
    end;  
    tbCaixa.IndexName := 'INumero';
    tbCaixa.Refresh;
    if not tbCaixa.FindKey([NumAberto]) then begin
      Beep;
      ShowMessage('Caixa não encontrado!');
      Exit;
    end;
  end;

  if MessageDlg('Confirma a exclusão de '+Serie+IntToStr(Numero)+
                ' de ' + tbMEDiaHora.AsString + ' ?',
                mtconfirmation,
                [mbyes,mbno],0) <> mryes then Exit;
                
  tbItensME.IndexName := 'IEmissor';
  tbItensME.SetRange([Emissor, Serie, Numero],
                     [Emissor, Serie, Numero]);
  try
    DB.StartTransactionWith([tbCaixa, tbItensME, tbME, tbCaixa, tAuxItens]);
    try
      tbCaixa.Edit;
      while not (tbItensME.Eof and tbItensME.Bof) do begin
        if tbItensMEMovEst.Value and 
           (not tbItensMECancelado.Value) and 
           (not tbItensMEData.IsNull) then
        begin
          Produto := tbItensMEProduto.Value;
          Data := tbItensMEData.Value;
          NumSeq := tbItensMENumSeq.Value;
          SaldoAnt := tbItensMEEstoqueAnt.Value;
        end else
          Produto := '';

        if (not tbItensMECancelado.Value) and tbItensMEMovEst.Value then begin
          if not tbItensMEData.IsNull then begin
            Tipo := 0;
            Mov := Fator[tbItensMEEntrada.Value] * tbItensMEQuant.Value;
          end else begin
            Mov  := tbItensMEQuant.Value;
            if tbItensMEEntrada.Value then
              Tipo := 1
            else
              Tipo := -1;  
          end;  
          AjustaEstoqueProduto(tbItensMEProduto.Value, 0, (-1 * Mov), Tipo);
        end;    

        if (tbMETipo.Value='VENDA') then begin
          tbCaixaVendas.Value := 
            tbCaixaVendas.Value - 
            tbMETotalFinal.Value;
        end;
                        
        tbItensME.Delete;
        if Produto > '' then
          AjustaSaldoPosterior(Produto, Data, NumSeq, SaldoAnt);   
      end;
      tbCaixa.Post;  
      tbME.Delete;
      DB.Commit;
    except
      tbItensME.Cancel;
      tbME.Cancel;
      tbCaixa.Cancel;
      DB.Rollback;
      Raise;
    end;
  finally
    tbItensME.CancelRange;
  end;
end;

procedure TDados.AbreDB;
begin
  nxTCPIP.Enabled := False;
  nxTCPIP.ServerName := ServRem.Host;
  nxTCPIP.Enabled := True;
  session.Active:= true;
  db.Connected:= true;
  tbCli.open;
  tbCat.open;
  tbLancExtra.Open;
  tbPro.open;
  tbME.open;
  tbFPag.open;
  tbAcesso.Open;
  tbItensME.open;
  tbTipoMov.Open;
  tbConfig.Open;
  tbLayout.Open;
  tbMotivo.Open;
  tbPacote.Open;
  tbCaixa.Open;
  tbCor.Open;
  tbCorPrecos.Open;
  tbHoraCor.Open;
  tbSinal.Open;
  tbTipoAcesso.Open;

  ChecaTipoMov;

  if tbCaixa.FindKey([True]) then begin
    DiaAberto := tbCaixa.FieldByName('Abertura').AsDateTime;
    NumAberto := tbCaixa.FieldByName('Numero').AsInteger;
  end else begin
    DiaAberto := 0;
    NumAberto := -1;
  end;    

  tAuxItens.Open;

  mtUsuario.DisableControls;
  try
    mtUsuario.Active := True;
    mtUsuario.EmptyTable;
    CM.Usuarios.SalvaDataset(mtUsuario);
    mtUsuario.First;
  finally
    mtUsuario.EnableControls;
  end;

  mtGrupo.DisableControls;
  
  try
    mtGrupo.Active := True;
    mtGrupo.EmptyTable;
    CM.Grupos.SalvaDataset(mtGrupo);
    mtGrupo.First;
  finally
    mtGrupo.EnableControls;
  end;

  mtMaquina.DisableControls;
  try
    mtMaquina.Active := True;
    mtMaquina.EmptyTable;
    CM.Maquinas.SalvaDataset(mtMaquina);
    mtMaquina.First;
  finally
    mtMaquina.EnableControls;
  end;

  if tbConfig.RecordCount > 0 then 
    tbConfig.First;
end;

procedure TDados.tbMECalcFields(DataSet: TDataSet);
begin
  tbMEData.Value := tbMEDiaHora.Value;
  tbMEHora.Value := tbMEDiaHora.Value;
  tbMETotalFinal.Value := tbMETotal.Value - tbMEDesconto.Value;
end;

procedure TDados.DataModuleCreate(Sender: TObject);
begin
  ListaAcessoFin := TStringList.Create;
  DiaAberto := 0;
  NumAberto := -1;
  DirUA := '';
  if MaisDeUm then Exit;
end;

procedure TDados.FFTblMgrPause;
begin
  Application.ProcessMessages;
end;

procedure TDados.tbMEAfterInsert(DataSet: TDataSet);
begin
  tbMEEntregar.Value := False;
  tbMEData.Value := Date;
  tbMEUsuario.Value := Dados.CM.Username;
end;

function TDados.ObtemSerie(TipoMov: String): String;
begin
  if tbTipoMov.FindKey([TipoMov]) then 
    Result := tbTipoMovSerie.Value
  else
    Result := '';  
end;

procedure TDados.SoUmProgCustom(Sender: TObject);
begin
  MaisDeUm := True;
  ShowMessage('Já existe um CM-Admin sendo executado!');
end;

procedure TDados.CMAoDesativar(Sender: TObject);
begin
  Session.Active := False;
  Application.Terminate;
end;

procedure TDados.tAuxItensCalcFields(DataSet: TDataSet);
begin
  if tAuxItensData.IsNull or tAuxItensCancelado.Value or (not tAuxItensMovEst.Value) then
    tAuxItensFatorSaldo.Value := 0
  else
  if tAuxItensEntrada.Value then
    tAuxItensFatorSaldo.Value := 1
  else
    tAuxItensFatorSaldo.Value := -1;
  tAuxItensSaldo.Value := tAuxItensEstoqueAnt.Value + (tAuxItensFatorSaldo.Value * tAuxItensQuant.Value);      
end;

function TDados.ObtemProxNumME(Emissor: Integer; Serie: String): Integer;
begin
  tbME.IndexName := 'IEmissorSerieNum';
  tbME.SetRange([Emissor, Serie], [Emissor, Serie]);
  try
    Result := 1;
    if not (tbME.Eof and tbME.Bof) then begin
      tbME.Last;
      Result := tbMENumero.Value + 1;
    end
  finally
    tbME.CancelRange;
  end;
end;

function TDados.ObtemSaldoAnterior(Produto: String; 
                                   Data: TDateTime; 
                                   NumSeq: Integer): Extended;
var 
  I, F : TDateTime;
begin
  I := 1;
  F := 9999999;
  Result := 0;
  tAuxItens.SetRange([Produto, I], [Produto, F]);
  if tAuxItens.Eof and tAuxItens.Bof then Exit;
  tAuxItens.FindNearest([Produto, Data, (NumSeq-1)]);
  while (not tAuxItens.Bof) and 
        ((tAuxItensData.Value > Data) or 
         ((tAuxItensData.Value=Data) and (tAuxItensNumSeq.Value>=NumSeq))) do
    tAuxItens.Prior;
  if not tAuxItens.Bof then
    Result := tAuxItensSaldo.Value;
end;

procedure TDados.AjustaSaldoPosterior(Produto: String; Data: TDateTime;
  NumSeq: Integer; Saldo: Extended);
var
  I, F : TDateTime;
begin
  I := 1;
  F := 9999999;
  tAuxItens.SetRange([Produto, I], [Produto, F]);
  if tAuxItens.Eof and tAuxItens.Bof then Exit;

  tAuxItens.FindNearest([Produto, Data, (NumSeq+1)]);

  if (tAuxItensData.Value<Data) or 
     ((tAuxItensData.Value=Data) and (tAuxItensNumSeq.Value<=NumSeq)) then
    Exit;

  repeat 
    tAuxItens.Edit;
    tAuxItensEstoqueAnt.Value := Saldo;
    tAuxItens.Post;
    Saldo := tAuxItensSaldo.Value;
    tAuxItens.Next;
  until tAuxItens.Eof;
end;

procedure TDados.AjustaEstoqueProduto(Produto: String; Custo,
  Quant: Double; Tipo: Integer);
begin
  tbPro.IndexName := 'ICodigo';
  if tbPro.FindKey([Produto]) then begin
    tbPro.Edit;
    if Custo<>0 then 
      tbProCustoUnitario.Value := Custo;
    case Tipo of
      0 : tbProEstoqueAtual.Value := tbProEstoqueAtual.Value + Quant;
      1 : tbProEstoqueACE.Value := tbProEstoqueACE.Value + Quant;
     -1 : tbProEstoqueACS.Value := tbProEstoqueACS.Value + Quant;
    end; 
    tbPro.Post;
  end;
end;

procedure TDados.tbProCalcFields(DataSet: TDataSet);
begin
  tbProEstoqueFinal.Value :=
    tbProEstoqueAtual.Value +
    tbProEstoqueACE.Value -
    tbProEstoqueACS.Value;
end;

procedure TDados.ffClientConnectionLost(aSource: TObject;
  aStarting: Boolean; var aRetry: Boolean);
begin
  aRetry := False;
  CM.Ativo := False;
  ServRem.Ativo := False;
  Application.Terminate;
end;

procedure TDados.CMAoAtualizarUsuario(Sender: TObject);
var U: TCMUsuario;
begin
  if not mtUsuario.Active then Exit;
  U := TCMUsuario(Sender);
  if mtUsuario.Locate('Username', U.Username, []) then 
    mtUsuario.Edit
  else
    mtUsuario.Append;  
  U.SalvaDataset(mtUsuario);
  mtUsuario.Post;
end;

procedure TDados.CMAoDestruirUsuario(Sender: TObject);
begin
  if not mtUsuario.Active then Exit;
  with TCMUsuario(Sender) do
  if mtUsuario.Locate('Username', Username, []) then
    mtUsuario.Delete;
end;

procedure TDados.CMAoAtualizarGrupo(Sender: TObject);
var G : TCMGrupo;
begin
  if not mtGrupo.Active then Exit;
  mtGrupo.DisableControls;
  try
    G := TCMGrupo(Sender);
    if mtGrupo.Locate('Nome', G.Nome, []) then
      mtGrupo.Edit
    else
      mtGrupo.Append;
    G.SalvaDataset(mtGrupo);
    mtGrupo.Post; 
  finally
    mtGrupo.EnableControls;
  end;    
end;

procedure TDados.CMAoDestruirGrupo(Sender: TObject);
var G : TCMGrupo;
begin
  if not mtGrupo.Active then Exit;
  G := TCMGrupo(Sender);
  if mtGrupo.Locate('Nome', G.Nome, []) then
    mtGrupo.Delete;
end;

function TDados.DireitosGrupo(Grupo: String): String;
var G : TCMGrupo;
begin
  G := CM.Grupos.PorNome[Grupo];
  if G <> nil then
    Result := G.Direitos
  else
    Result := '';
end;

procedure TDados.CMAoAtualizarMaquina(Sender: TObject);
var 
  M : TCMMaquina;
  NumAnt : Integer;
  AguardaAnt: Boolean;
begin
  if not mtMaquina.Active then Exit;
  mtMaquina.DisableControls;
  try
    M := TCMMaquina(Sender);
    NumAnt := mtMaquina.FieldByName('Numero').AsInteger;
    if mtMaquina.Locate('Numero', M.Numero, []) then
      mtMaquina.Edit
    else
      mtMaquina.Append;
    AguardaAnt := mtMaquinaAguardaPagto.Value;  
    M.SalvaDataset(mtMaquina);
    
    if mtMaquinaAcesso.Value < 1 then begin
      mtMaquinaInicio.Value := 0;
      mtMaquinaNomeContato.Value := '';
      mtMaquinaNome.Value := '';
      mtMaquinaProgramaAtual.Value := '';
    end;
    mtMaquina.Post;
    if (not mtMaquinaAguardaPagto.Value) or AguardaAnt or  
       (CM.Config.ModoPagtoAcesso<>mpgTelaPagtoAutomatica) or
       (ListaAcessoFin.IndexOf(mtMaquinaAcesso.AsString)=-1) then begin
      AguardaAnt := True;
      mtMaquina.Locate('Numero', NumAnt, []);
    end;
  finally
    mtMaquina.EnableControls;
  end;
  mtMaquina.Refresh;   
  if not AguardaAnt then begin
    ListaAcessoFin.Delete(ListaAcessoFin.IndexOf(mtMaquinaAcesso.AsString));
    NumAcessoPagto := mtMaquinaAcesso.Value;
    Timer2.Enabled := True;
  end;  
  Timer1.Enabled := True;
end;

procedure TDados.CMAoDestruirMaquina(Sender: TObject);
var M : TCMMaquina;
begin
  if not mtMaquina.Active then Exit;
  M := TCMMaquina(Sender);
  if mtMaquina.Locate('Numero', M.Numero, []) then
    mtMaquina.Delete;
end;

procedure TDados.mtMaquinaCalcFields(DataSet: TDataSet);
begin
  mtMaquinaConectado.Value := (mtMaquinaCliente.Value>0);
  if mtMaquinaAcesso.Value > 0 then 
    mtMaquinaLimiteTempoDT.Value := TicksToDateTime(mtMaquinaLimiteTempo.Value)
  else
    mtMaquinaLimiteTempoDT.Value := 0;
      
  if mtMaquinaContato.Value > 0 then
    mtMaquinaMostrar.Value := mtMaquinaNomeContato.Value
  else
    mtMaquinaMostrar.Value := mtMaquinaNome.Value;  
  mtMaquinaTotalFinal.Value := mtMaquinaAcesso.Value + mtMaquinaVendas.Value;  
end;

function Permitido(Recurso, TipoAcesso: Integer): Boolean;
var Valor: String;
begin
  if Dados.CM.UA.Admin then
    Result := True
  else begin  
    Valor := ObtemValor(Dados.CM.UA.Direitos, IntToStr(Recurso));
    Result := LIContemID(Valor, TipoAcesso);
  end;
end;

procedure TDados.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if FrmPri.FrmAcessos<>nil then
    FrmPri.FrmAcessos.Tab.Refresh; 
end;

procedure TDados.ChecaTipoMov;
begin
  while not tbTipoMov.IsEmpty do tbTipoMov.Delete;
  
  tbTipoMov.Insert;
  tbTipoMovNome.Value := 'VENDA';
  tbTipoMovMovEst.Value := True;
  tbTipoMovEntrada.Value := False;
  tbTipoMovSerie.Value := 'VE';
  tbTipoMovPermiteAlterarSerie.Value := False;
  tbTipoMovNumeroAutomatico.Value := True;
  tbTipoMovConfirmarMovEstoque.Value := False;
  tbTipoMovAtualizaCusto.Value := False;
  tbTipoMov.Post;

  tbTipoMov.Insert;
  tbTipoMovNome.Value := 'COMPRA';
  tbTipoMovMovEst.Value := True;
  tbTipoMovEntrada.Value := True;
  tbTipoMovSerie.Value := 'CO';
  tbTipoMovPermiteAlterarSerie.Value := False;
  tbTipoMovNumeroAutomatico.Value := True;
  tbTipoMovConfirmarMovEstoque.Value := False;
  tbTipoMovAtualizaCusto.Value := True;
  tbTipoMov.Post;

  tbTipoMov.Insert;
  tbTipoMovNome.Value := 'ENTRADA';
  tbTipoMovMovEst.Value := True;
  tbTipoMovEntrada.Value := True;
  tbTipoMovSerie.Value := 'EN';
  tbTipoMovPermiteAlterarSerie.Value := False;
  tbTipoMovNumeroAutomatico.Value := True;
  tbTipoMovConfirmarMovEstoque.Value := False;
  tbTipoMovAtualizaCusto.Value := False;
  tbTipoMov.Post;

  tbTipoMov.Insert;
  tbTipoMovNome.Value := 'SAIDA';
  tbTipoMovMovEst.Value := True;
  tbTipoMovEntrada.Value := False;
  tbTipoMovSerie.Value := 'SA';
  tbTipoMovPermiteAlterarSerie.Value := False;
  tbTipoMovNumeroAutomatico.Value := True;
  tbTipoMovConfirmarMovEstoque.Value := False;
  tbTipoMovAtualizaCusto.Value := False;
  tbTipoMov.Post;
end;

procedure TDados.AbrirFecharCaixa;
var  Hora : TDateTime;
begin
  tbAuxCx.Active := True;
  if NumAberto<1 then begin
    Hora := Now;
    if MessageDlg('Confirma abertura do caixa de '+
                  FormatDateTime('dd/mm/yyyy hh:mm', Hora),
                  mtConfirmation,
                  [mbYes, mbNo], 0) = mrNo then Exit;
    tbAuxCx.Refresh;
    tbAuxCx.Last;
                    
    tbCaixa.Insert;
    tbCaixaAberto.Value := True;
    tbCaixaAbertura.Value := Hora;
    tbCaixaUsuario.Value := Dados.CM.Username;
    
    if tbAuxCx.RecordCount > 0 then
      tbCaixaSaldoAnt.Value := tbAuxCxSaldoFinal.Value
    else
      tbCaixaSaldoAnt.Value := 0;
       
    tbCaixa.Post;  
    DiaAberto := Hora;
    NumAberto := tbCaixaNumero.Value;
  end else begin
    tbCaixa.IndexName := 'INumero';
    if not tbCaixa.FindKey([NumAberto]) then begin
      Beep;
      ShowMessage('Falha localizando caixa aberto!');
      exit;
    end;
      
    if Now < tbCaixaAbertura.Value then begin
      Beep;
      ShowMessage('Data ou Hora de fechamento anterior a abertura!');
      Exit;
    end;
      
    if MessageDlg('Confirma Fechamento do caixa de '+
                  FormatDateTime('dd/mm/yyyy', tbCaixaAbertura.Value),
                  mtConfirmation,
                  [mbYes, mbNo], 0) = mrNo then Exit;
                  
    tbCaixa.Edit;
    tbCaixaAberto.Value := False;
    tbCaixaFechamento.Value := Now;
    tbCaixa.Post;  
    
    DiaAberto := 0;
    NumAberto := -1;
  end;
  
end;

procedure TDados.tbAuxCxCalcFields(DataSet: TDataSet);
begin
  tbAuxCxSaldoFinal.Value :=
    (tbAuxCxSaldoAnt.Value +
     tbAuxCxLancExtrasE.Value +
     tbAuxCxInternet.Value +
     tbAuxCxPacotes.Value +
     tbAuxCxVendas.Value) - 
     tbAuxCxLancExtrasS.Value;
end;

function TDados.ObtemAguardando: Double;
begin
  Q.Active := False;
  Q.Active := True;
  if Q.RecordCount > 0 then
    Result := Q.FieldByName('Acessos').AsFloat + Q.FieldByName('Vendas').AsFloat
  else
    Result := 0;
end;

procedure TDados.DataModuleDestroy(Sender: TObject);
begin
  ListaAcessoFin.Free;
end;

procedure TDados.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  if tbAcesso.FindKey([NumAcessoPagto]) then
    TFrmAcesso.Create(Self).Editar(tbAcesso, 2);
end;

end.
