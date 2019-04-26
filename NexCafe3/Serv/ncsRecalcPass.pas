unit ncsRecalcPass;

interface

uses
  SysUtils, Classes, nxllComponent, nxdb, DB, ncPassaportes, ncAuxPassaporte;

type
  TdmRecalcPass = class(TDataModule)
    tCli: TnxTable;
    tCliID: TAutoIncField;
    tCliNome: TStringField;
    tCliEndereco: TStringField;
    tCliBairro: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliCEP: TStringField;
    tCliNasc: TDateTimeField;
    tCliSexo: TStringField;
    tCliObs: TMemoField;
    tCliCpf: TStringField;
    tCliRg: TStringField;
    tCliTelefone: TStringField;
    tCliEmail: TMemoField;
    tCliMinutos: TFloatField;
    tCliMinutosUsados: TFloatField;
    tCliMinutosIniciais: TFloatField;
    tCliIsento: TBooleanField;
    tCliUsername: TStringField;
    tCliPai: TStringField;
    tCliMae: TStringField;
    tCliSenha: TStringField;
    tCliUltVisita: TDateTimeField;
    tCliDebito: TCurrencyField;
    tCliEscola: TStringField;
    tCliEscolaHI: TDateTimeField;
    tCliEscolaHF: TDateTimeField;
    tCliNickName: TStringField;
    tCliDataNasc: TDateTimeField;
    tCliCelular: TStringField;
    tCliTemDebito: TBooleanField;
    tCliLimiteDebito: TCurrencyField;
    tCliFoto: TGraphicField;
    tCliIncluidoEm: TDateTimeField;
    tCliAlteradoEm: TDateTimeField;
    tCliIncluidoPor: TStringField;
    tCliAlteradoPor: TStringField;
    tCliInativo: TBooleanField;
    tCliTipoAcessoPref: TIntegerField;
    tCliValorCred: TCurrencyField;
    tCliHP1: TIntegerField;
    tCliHP2: TIntegerField;
    tCliHP3: TIntegerField;
    tCliHP4: TIntegerField;
    tCliHP5: TIntegerField;
    tCliHP6: TIntegerField;
    tCliHP7: TIntegerField;
    tCliNaoGuardarCredito: TBooleanField;
    tCliPermiteLoginSemCred: TBooleanField;
    tCliPassaportes: TFloatField;
    tTipoPass: TnxTable;
    tTipoPassID: TAutoIncField;
    tTipoPassNome: TStringField;
    tTipoPassValor: TCurrencyField;
    tTipoPassTipoAcesso: TIntegerField;
    tTipoPassTipoExp: TWordField;
    tTipoPassExpirarEm: TDateTimeField;
    tTipoPassMaxSegundos: TIntegerField;
    tTipoPassObs: TMemoField;
    tTipoPassDia1: TIntegerField;
    tTipoPassDia2: TIntegerField;
    tTipoPassDia3: TIntegerField;
    tTipoPassDia4: TIntegerField;
    tTipoPassDia5: TIntegerField;
    tTipoPassDia6: TIntegerField;
    tTipoPassDia7: TIntegerField;
    tPassaporte: TnxTable;
    tPassaporteID: TAutoIncField;
    tPassaporteTipoPass: TIntegerField;
    tPassaporteCliente: TIntegerField;
    tPassaporteExpirou: TBooleanField;
    tPassaporteSenha: TStringField;
    tPassaportePrimeiroUso: TDateTimeField;
    tPassaporteTipoAcesso: TIntegerField;
    tPassaporteTipoExp: TWordField;
    tPassaporteExpirarEm: TDateTimeField;
    tPassaporteMaxSegundos: TIntegerField;
    tPassaporteSegundos: TIntegerField;
    tPassaporteAcessos: TIntegerField;
    tPassaporteDia1: TIntegerField;
    tPassaporteDia2: TIntegerField;
    tPassaporteDia3: TIntegerField;
    tPassaporteDia4: TIntegerField;
    tPassaporteDia5: TIntegerField;
    tPassaporteDia6: TIntegerField;
    tPassaporteDia7: TIntegerField;
    tPassaporteTran: TIntegerField;
    tPassaporteDataCompra: TDateTimeField;
    tPassaporteValido: TBooleanField;
    tPassaporteValor: TCurrencyField;
    tPassaporteSessao: TIntegerField;
    tPassaporteNome: TStringField;
    nxDB: TnxDatabase;
    tSessaoCli: TnxTable;
    tSessaoCliID: TAutoIncField;
    tSessaoCliInicio: TDateTimeField;
    tSessaoCliTermino: TDateTimeField;
    tSessaoCliMinutosR: TFloatField;
    tSessaoCliMinutosC: TFloatField;
    tSessaoCliMaq: TWordField;
    tSessaoCliMaqI: TWordField;
    tSessaoCliEncerrou: TBooleanField;
    tSessaoCliCliente: TIntegerField;
    tSessaoCliTransfMaq: TBooleanField;
    tSessaoCliTipoCli: TWordField;
    tSessaoCliCancelado: TBooleanField;
    tSessaoCliTotal: TCurrencyField;
    tSessaoCliDesconto: TCurrencyField;
    tSessaoCliPagoPost: TCurrencyField;
    tSessaoCliDescPost: TCurrencyField;
    tSessaoCliPago: TCurrencyField;
    tSessaoCliNomeCliente: TStringField;
    tSessaoCliFuncI: TStringField;
    tSessaoCliFuncF: TStringField;
    tSessaoCliObs: TMemoField;
    tSessaoCliTipoAcesso: TIntegerField;
    tSessaoCliCaixaI: TIntegerField;
    tSessaoCliCaixaF: TIntegerField;
    tSessaoCliTicksI: TIntegerField;
    tSessaoCliPausado: TBooleanField;
    tSessaoCliInicioPausa: TIntegerField;
    tSessaoCliMinTicksUsados: TIntegerField;
    tSessaoCliMinTicksTotal: TIntegerField;
    tSessaoCliFimTicksUsados: TIntegerField;
    tSessaoCliFimTicksTotal: TIntegerField;
    tSessaoCliStrPausas: TMemoField;
    tSessaoCliStrTransfMaq: TMemoField;
    tSessaoCliStrFechamentoCaixa: TMemoField;
    tSessaoCliMinutosCli: TFloatField;
    tSessaoCliMinutosPrev: TFloatField;
    tSessaoCliMinutosMax: TFloatField;
    tSessaoCliMinutosCliU: TFloatField;
    tSessaoCliValorCli: TCurrencyField;
    tSessaoCliValorCliU: TFloatField;
    tSessaoCliTranI: TIntegerField;
    tSessaoCliTranF: TIntegerField;
    tSessaoCliPermitirDownload: TBooleanField;
    tSessaoCliVersaoRegistro: TIntegerField;
    tSessaoCliCartaoTempo: TBooleanField;
    tSessaoCliHP1: TIntegerField;
    tSessaoCliHP2: TIntegerField;
    tSessaoCliHP3: TIntegerField;
    tSessaoCliHP4: TIntegerField;
    tSessaoCliHP5: TIntegerField;
    tSessaoCliHP6: TIntegerField;
    tSessaoCliHP7: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    FPass : TncPassaportes;
    procedure Processa;
    procedure Open;
    { Public declarations }
  end;

  TThreadRecalcPass = class ( TThread )
  protected 
    procedure Execute; override;  
  end;

var
  dmRecalcPass: TdmRecalcPass;

implementation

uses ncServBD;

{$R *.dfm}

{ TdmRecalcPass }

procedure TdmRecalcPass.DataModuleCreate(Sender: TObject);
begin
  FPass := TncPassaportes.Create;
end;

procedure TdmRecalcPass.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(nxDB.Session) then nxDB.Session.Free;
  FPass.Free;
end;

procedure TdmRecalcPass.Open;
begin
  nxDB.Session := CreateSession;
  tPassaporte.Open;
  tSessaoCli.Open;
  tCli.Open;
  tTipoPass.Open;
end;

procedure TdmRecalcPass.Processa;
var 
  M: Double;
  I: integer;
  Hora : TDateTime;
begin
  inherited;
  InitTran(nxDB, [tSessaoCli, tCli, tTipoPass, tPassaporte], True);
  try
    ncAuxPassaporte.LePassaportesCliSessao(tPassaporte, nil, tTipoPass, -1, tCliID.Value, 0, FPass);
    M := 0;
    if tSessaoCli.FindKey([False, tCliID.Value]) then
      Hora := tSessaoCliInicio.Value else
      Hora := Now;
    
    for I := 0 to FPass.Count - 1 do with FPass[I] do 
    if ExpirarEm(Hora)>=Hora then 
      M := M + ObtemMinutosRestantes;
        
    tCli.Edit;
    tCliPassaportes.Value := M;  
    tCli.Post;

    nxDB.Commit;
  except
    nxDB.Rollback;
    Raise;
  end;
end;

{ TThreadRecalcPass }

procedure TThreadRecalcPass.Execute;
var DM : TdmRecalcPass;
begin
  inherited;
  try
    DM := TdmRecalcPass.Create(nil);
    try
      DM.Open;
      with DM do begin
        tCli.First;
        while (not Terminated) and (not tCli.Eof) do begin
          DM.Processa;
          tCli.Next;
          Sleep(5);
        end;
      end;
    finally
      DM.Free;
    end;
  except
  end;
end;

end.
