unit uCMDadosCopia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ffdb, ffllbase, ffdbbase, kbmMemTable, LMDCustomComponent,
  LMDOneInstance, 
  ffllcomm, fflllgcy, ffllcomp,
  fflleng, ffsrintm, ffclreng, 
  cmClassesBase, 
  cmServRemoto,
  cmListaID,
  cmIDRecursos,
  cmCompCliente, ExtCtrls;

type

  TDados = class(TDataModule)
    tbCli: TffTable;
    dsCli: TDataSource;
    tbPro: TffTable;
    dsPro: TDataSource;
    tbCat: TffTable;
    dsCat: TDataSource;
    dsME: TDataSource;
    tbME: TffTable;
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
    tbItensME: TffTable;
    dsItensME: TDataSource;
    tbEntre: TffTable;
    dsEntre: TDataSource;
    tbEntreCodigo: TAutoIncField;
    tbEntreNome: TStringField;
    tbMENomeEntregador: TStringField;
    tbFPag: TffTable;
    dsFPag: TDataSource;
    tbFPagDescricao: TStringField;
    tbMEEndEnt: TStringField;
    tbMEBaiEnt: TStringField;
    tbMECidEnt: TStringField;
    tbMEUFEnt: TStringField;
    Session: TffSession;
    db: TffDatabase;
    ffClient: TffClient;
    tbProxCategoria: TStringField;
    tbMETotalFinal: TCurrencyField;
    tbConfig: TffTable;
    dsConfig: TDataSource;
    SoUmProg: TLMDOneInstance;
    tbTipoMov: TffTable;
    dsTipoMov: TDataSource;
    tbTipoMovNome: TStringField;
    tbTipoMovMovEst: TBooleanField;
    tbTipoMovEntrada: TBooleanField;
    tbTipoMovSerie: TStringField;
    tbTipoMovPermiteAlterarSerie: TBooleanField;
    tbTipoMovNumeroAutomatico: TBooleanField;
    tbTipoMovConfirmarMovEstoque: TBooleanField;
    tbTipoMovAtualizaCusto: TBooleanField;
    tAuxItens: TffTable;
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
    RSE: TFFRemoteServerEngine;
    ffLT: TffLegacyTransport;
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
    tbEntreObs: TMemoField;
    tbLayout: TffTable;
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
    tbConfigPrecoPor: TWordField;
    tbConfigPreco: TCurrencyField;
    tbConfigModulos: TMemoField;
    tbConfigTolerancia: TIntegerField;
    mtMaquinaCliente: TIntegerField;
    mtMaquinaConectado: TBooleanField;
    tbMotivo: TffTable;
    dsMotivo: TDataSource;
    tbMotivoCodigo: TWordField;
    tbMotivoDescricao: TStringField;
    tbPacote: TffTable;
    dsPacote: TDataSource;
    tbPacoteHoras: TSmallintField;
    tbPacoteValorTotal: TCurrencyField;
    tbCaixa: TffTable;
    tbConfigTiposLancExtra: TMemoField;
    Timer1: TTimer;
    mtMaquinaProgramaAtual: TStringField;
    tbConfigProgramasPermitidos: TMemoField;
    tbConfigJanelasExplorer: TMemoField;
    tbConfigFecharProgramas: TBooleanField;
    tbConfigAutoExecutar: TStringField;
    mtMaquinaParado: TBooleanField;
    mtMaquinaLimiteTempo: TIntegerField;
    mtMaquinaLimiteTempoDT: TDateTimeField;
    tbConfigNumSeq: TAutoIncField;
    tbConfigLimiteTempoPadrao: TDateTimeField;
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
  private
    { Private declarations }
  public
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
  

const
  NumModulos = 11;
    
var
  Dados: TDados;
  ConfigModulos : Array[0..NumModulos] of  TInfoModulo;
  
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

uses uCMFrmPri;

{$R *.DFM}

procedure TransfDados(TF, TD: TDataset);
var 
  I : Integer;
  F : TField;
begin
  with TD do
  for I := 0 to pred(Fields.Count) do with Fields[I] do 
  if FieldKind<>fkCalculated then begin
    F := TF.FindField(FieldName);
    if F <> nil then 
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
  if MessageDlg('Confirma a exclusão de '+Serie+IntToStr(Numero)+
                ' de ' + tbMEDiaHora.AsString + ' ?', 
                mtconfirmation, 
                [mbyes,mbno],0) <> mryes then Exit;
  tbItensME.IndexName := 'IEmissor';
  tbItensME.SetRange([Emissor, Serie, Numero],
                     [Emissor, Serie, Numero]);
  try
    DB.StartTransaction;
    try
      tbME.Delete;
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
          
        tbItensME.Delete;
        if Produto > '' then
          AjustaSaldoPosterior(Produto, Data, NumSeq, SaldoAnt);   
      end;
      DB.Commit;
    except
      tbItensME.Cancel;
      tbME.Cancel;
      DB.Rollback;
      Raise;
    end;
  finally
    tbItensME.CancelRange;
  end;
end;

procedure TDados.AbreDB;
var
  SL : TStringList;
  St : String;
  I  : Integer;
begin
  ffLT.Enabled := False;
  ffLT.ServerName := ServRem.Host;
  ffLT.Enabled := True;
  ffClient.Active := True;
  session.Active:= true;
  db.Connected:= true;
  tbCli.open;
  tbCat.open;
  tbPro.open;
  tbME.open;
  tbEntre.open;
  tbFPag.open;
  tbItensME.open;
  tbTipoMov.Open;
  tbConfig.Open;
  tbLayout.Open;
  tbMotivo.Open;
  tbPacote.Open;
  tbCaixa.Open;

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

  if tbConfig.RecordCount > 0 then begin
    tbConfig.First;
    SL := TStringList.Create;
    try
      SL.SetText(PChar(tbConfigModulos.Value));
      for I := 2 to NumModulos do 
      if SL.Count > I then 
        ConfigModulos[I].LeStr(SL[I]);
    finally
      SL.Free;
    end;
  end;  
end;

procedure TDados.tbMECalcFields(DataSet: TDataSet);
begin
  tbMEData.Value := tbMEDiaHora.Value;
  tbMEHora.Value := tbMEDiaHora.Value;
  tbMETotalFinal.Value := tbMETotal.Value - tbMEDesconto.Value;
end;

procedure TDados.DataModuleCreate(Sender: TObject);
var 
  Path: string;
  I   : Integer;
begin
  DiaAberto := 0;
  NumAberto := -1;
  DirUA := '';
  for I := 0 to NumModulos do with ConfigModulos[I] do begin
    imID        := I;
    imPos       := I;
    imVisivel   := True;
    imMostratab := True;
  end;  
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
  ShowMessage('Já existe um Cyber-Manager sendo executado!');
end;

procedure TDados.CMAoDesativar(Sender: TObject);
begin
  ffClient.Active := False;
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
    M.SalvaDataset(mtMaquina);
    if mtMaquinaAcesso.Value < 1 then begin
      mtMaquinaInicio.Value := 0;
      mtMaquinaNomeContato.Value := '';
    end;
    mtMaquina.Post; 
    mtMaquina.Locate('Numero', NumAnt, []);
  finally
    mtMaquina.EnableControls;
  end;
  mtMaquina.Refresh;   
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
  mtMaquinaLimiteTempoDT.Value := TicksToDateTime(mtMaquinaLimiteTempo.Value);
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

end.
