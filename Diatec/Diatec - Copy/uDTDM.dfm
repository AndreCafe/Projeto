object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 594
  Width = 693
  object dsCli: TDataSource
    DataSet = qCli
    Left = 8
    Top = 128
  end
  object dsProj: TDataSource
    DataSet = tProj
    Left = 56
    Top = 128
  end
  object dsFaseTec: TDataSource
    DataSet = tFaseTec
    Left = 176
    Top = 128
  end
  object tAuxCli: TnxTable
    Database = nxdb
    Timeout = 10000
    AfterScroll = tAuxCliAfterScroll
    TableName = 'Cliente'
    IndexName = 'IID'
    Left = 152
    Top = 312
    object tAuxCliNome: TStringField
      DisplayWidth = 30
      FieldName = 'Nome'
      Size = 30
    end
    object tAuxCliID: TStringField
      DisplayWidth = 8
      FieldName = 'ID'
      Size = 8
    end
    object tAuxCliTranslado: TDateTimeField
      FieldName = 'Translado'
    end
    object tAuxCliAssinou: TStringField
      FieldName = 'Assinou'
      Size = 30
    end
    object tAuxCliNoturno: TStringField
      FieldName = 'Noturno'
      Size = 1
    end
    object tAuxCliFimSem: TStringField
      FieldName = 'FimSem'
      Size = 1
    end
  end
  object tTec: TnxTable
    Database = nxdb
    Timeout = 10000
    TableName = 'Tecnico'
    IndexName = 'IID'
    Left = 48
    Top = 8
    object tTecNome: TStringField
      DisplayWidth = 30
      FieldName = 'Nome'
      Size = 30
    end
    object tTecSenha: TStringField
      FieldName = 'Senha'
      Visible = False
      Size = 6
    end
    object tTecID: TStringField
      FieldName = 'ID'
      Size = 6
    end
    object tTecEmpresa: TStringField
      FieldName = 'Empresa'
      Size = 3
    end
    object tTecListaProj: TStringField
      FieldName = 'ListaProj'
      Size = 1
    end
  end
  object tFaseTec: TnxTable
    Database = nxdb
    Timeout = 10000
    TableName = 'FaseTec'
    IndexName = 'IID'
    MasterFields = 'Cliente;Projeto;ID'
    MasterSource = dsFase
    Left = 104
    Top = 64
    object tFaseTecCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object tFaseTecTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tFaseTecStatus: TStringField
      FieldName = 'Status'
      Size = 1
    end
    object tFaseTecSync: TBooleanField
      FieldName = 'Sync'
    end
    object tFaseTecProjeto: TStringField
      FieldName = 'Projeto'
      Size = 15
    end
    object tFaseTecNomeTec: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTec'
      LookupDataSet = tTec
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Tecnico'
      Size = 30
      Lookup = True
    end
    object tFaseTecFase: TStringField
      FieldName = 'Fase'
      Size = 12
    end
  end
  object tOS: TnxTable
    Database = nxdb
    Timeout = 10000
    Filter = 'Apagar <> '#39'S'#39
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    AfterInsert = tOSAfterInsert
    BeforePost = tOSBeforePost
    OnCalcFields = tOSCalcFields
    TableName = 'OS'
    IndexName = 'IID'
    Left = 152
    Top = 64
    object tOSCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object tOSData: TDateTimeField
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tOSID: TWordField
      FieldName = 'ID'
    end
    object tOSInicio: TDateTimeField
      FieldName = 'Inicio'
      DisplayFormat = 'hh:mm'
    end
    object tOSTermino: TDateTimeField
      DisplayLabel = 'T'#233'rmino'
      FieldName = 'Termino'
      DisplayFormat = 'hh:mm'
    end
    object tOSTranslado: TDateTimeField
      FieldName = 'Translado'
      DisplayFormat = 'hh:mm'
    end
    object tOSAbono: TDateTimeField
      FieldName = 'Abono'
      DisplayFormat = 'hh:mm'
    end
    object tOSMotivoAbon: TStringField
      FieldName = 'MotivoAbon'
      Size = 2
    end
    object tOSTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tOSNomeCliente: TStringField
      DisplayLabel = 'Cliente'
      FieldKind = fkLookup
      FieldName = 'NomeCliente'
      LookupDataSet = tAuxCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Cliente'
      Size = 30
      Lookup = True
    end
    object tOSTotalHoras: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'TotalHoras'
      Calculated = True
    end
    object tOSUniqueID: TStringField
      FieldKind = fkCalculated
      FieldName = 'UniqueID'
      Size = 32
      Calculated = True
    end
    object tOSAssinou: TStringField
      FieldName = 'Assinou'
      Size = 30
    end
    object tOSTotalFinal: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'TotalFinal'
      Calculated = True
    end
    object tOSNomeAbono: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeAbono'
      LookupDataSet = tMotivo
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'MotivoAbon'
      Size = 30
      Lookup = True
    end
    object tOSNomeTecnico: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTecnico'
      LookupDataSet = tTec
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Tecnico'
      Size = 30
      Lookup = True
    end
    object tOSCodNomeCli: TStringField
      FieldKind = fkCalculated
      FieldName = 'CodNomeCli'
      Size = 37
      Calculated = True
    end
    object tOSCodNomeTec: TStringField
      FieldKind = fkCalculated
      FieldName = 'CodNomeTec'
      Size = 37
      Calculated = True
    end
    object tOSChaveOS: TStringField
      FieldKind = fkCalculated
      FieldName = 'ChaveOS'
      Size = 37
      Calculated = True
    end
    object tOSSync: TBooleanField
      FieldName = 'Sync'
    end
    object tOSProjeto: TStringField
      FieldName = 'Projeto'
      Size = 15
    end
    object tOSLocal: TStringField
      FieldName = 'Local'
      Size = 1
    end
    object tOSNomeLocal: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeLocal'
      Size = 9
      Calculated = True
    end
    object tOSEntrou: TStringField
      FieldName = 'Entrou'
      Size = 1
    end
    object tOSDataComp: TDateTimeField
      FieldName = 'DataComp'
    end
    object tOSNumAtend: TStringField
      FieldName = 'NumAtend'
      Size = 10
    end
    object tOSGeraReemb: TBooleanField
      FieldName = 'GeraReemb'
    end
    object tOSTipoReemb: TStringField
      FieldName = 'TipoReemb'
      Size = 1
    end
    object tOSKmDestino: TFloatField
      FieldName = 'KmDestino'
    end
    object tOSPedagio1: TFloatField
      FieldName = 'Pedagio1'
    end
    object tOSPedagio2: TFloatField
      FieldName = 'Pedagio2'
    end
    object tOSPedagio3: TFloatField
      FieldName = 'Pedagio3'
    end
    object tOSPedagio4: TFloatField
      FieldName = 'Pedagio4'
    end
    object tOSMotivo: TStringField
      FieldName = 'Motivo'
      Size = 40
    end
    object tOSOutroLocal: TStringField
      FieldName = 'OutroLocal'
      Size = 6
    end
    object tOSVeicProp: TStringField
      FieldName = 'VeicProp'
      Size = 1
    end
    object tOSProjCodNome: TStringField
      FieldKind = fkCalculated
      FieldName = 'ProjCodNome'
      Size = 50
      Calculated = True
    end
    object tOSProjHorasReal: TFloatField
      FieldKind = fkLookup
      FieldName = 'ProjHorasReal'
      LookupDataSet = tProj
      LookupKeyFields = 'Cliente; ID'
      LookupResultField = 'HorasReal'
      KeyFields = 'Cliente; Projeto'
      DisplayFormat = '0.00'
      Lookup = True
    end
    object tOSProjNome: TStringField
      FieldKind = fkLookup
      FieldName = 'ProjNome'
      LookupDataSet = tProj
      LookupKeyFields = 'Cliente; ID'
      LookupResultField = 'Nome'
      KeyFields = 'Cliente; Projeto'
      Size = 50
      Lookup = True
    end
    object tOSProjPosicao: TDateTimeField
      FieldKind = fkLookup
      FieldName = 'ProjPosicao'
      LookupDataSet = tProj
      LookupKeyFields = 'Cliente; ID'
      LookupResultField = 'Posicao'
      KeyFields = 'Cliente; Projeto'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
      Lookup = True
    end
    object tOSApagar: TStringField
      FieldName = 'Apagar'
      Size = 1
    end
    object tOSVersaoProj: TStringField
      FieldName = 'VersaoProj'
      Size = 10
    end
    object tOSObrigaInt: TStringField
      FieldName = 'ObrigaInt'
      Size = 1
    end
    object tOSProjHorasPrev: TFloatField
      FieldKind = fkLookup
      FieldName = 'ProjHorasPrev'
      LookupDataSet = tProj
      LookupKeyFields = 'Cliente; ID'
      LookupResultField = 'HorasPrev'
      KeyFields = 'Cliente; Projeto'
      DisplayFormat = '0.00'
      Lookup = True
    end
    object tOSAbonaInt: TStringField
      FieldName = 'AbonaInt'
      Size = 1
    end
    object tOSIInt: TDateTimeField
      FieldName = 'IInt'
      DisplayFormat = 'hh:mm'
    end
    object tOSFInt: TDateTimeField
      FieldName = 'FInt'
      DisplayFormat = 'hh:mm'
    end
    object tOSTempoInt: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'TempoInt'
      Calculated = True
    end
    object tOSVlTrans: TCurrencyField
      FieldName = 'VlTrans'
    end
    object tOSObs: TStringField
      FieldName = 'Obs'
      Size = 100
    end
  end
  object tAponta: TnxTable
    Database = nxdb
    Timeout = 10000
    AfterInsert = tApontaAfterInsert
    BeforePost = tApontaBeforePost
    BeforeDelete = tApontaBeforeDelete
    OnCalcFields = tApontaCalcFields
    TableName = 'OSFase'
    IndexFieldNames = 'Cliente;Projeto;Fase'
    MasterFields = 'Cliente;Projeto;ID'
    MasterSource = dsFase
    Left = 208
    Top = 64
    object tApontaCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object tApontaProjeto: TStringField
      FieldName = 'Projeto'
      Size = 15
    end
    object tApontaData: TDateTimeField
      FieldName = 'Data'
    end
    object tApontaTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tApontaHoras: TDateTimeField
      FieldName = 'Horas'
      DisplayFormat = 'hh:mm'
    end
    object tApontaSync: TBooleanField
      FieldName = 'Sync'
    end
    object tApontaTipoHora: TStringField
      FieldName = 'TipoHora'
      Size = 15
    end
    object tApontaOS: TSmallintField
      FieldName = 'OS'
    end
    object tApontaDescricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descricao'
      Size = 2500
      Calculated = True
    end
    object tApontaNomeTipoHora: TStringField
      DisplayLabel = 'Tipo Hora'
      FieldKind = fkLookup
      FieldName = 'NomeTipoHora'
      LookupDataSet = tTipoHora
      LookupKeyFields = 'ID'
      LookupResultField = 'Descricao'
      KeyFields = 'TipoHora'
      Size = 30
      Lookup = True
    end
    object tApontaKeyField: TStringField
      FieldKind = fkCalculated
      FieldName = 'KeyField'
      Size = 50
      Calculated = True
    end
    object tApontaNomeTecnico: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTecnico'
      LookupDataSet = tTec
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Tecnico'
      Size = 30
      Lookup = True
    end
    object tApontaOcorrencia: TStringField
      FieldName = 'Ocorrencia'
      Size = 2
    end
    object tApontaRevisao: TStringField
      FieldName = 'Revisao'
      Size = 4
    end
    object tApontaTipoHoraTipo: TStringField
      FieldKind = fkLookup
      FieldName = 'TipoHoraTipo'
      LookupDataSet = tTipoHora
      LookupKeyFields = 'ID'
      LookupResultField = 'Tipo'
      KeyFields = 'TipoHora'
      Size = 1
      Lookup = True
    end
    object tApontaFase: TStringField
      FieldName = 'Fase'
      Size = 12
    end
    object tApontaItem: TIntegerField
      FieldName = 'Item'
    end
    object tApontaLogID: TIntegerField
      FieldName = 'LogID'
    end
    object tApontaDownOk: TBooleanField
      FieldName = 'DownOk'
    end
    object tApontaApagar: TStringField
      FieldName = 'Apagar'
      Size = 1
    end
  end
  object nxdb: TnxDatabase
    Session = nxSession
    AliasPath = 'C:\Meus Programas\DiaTec\30\Cliente\Tabelas'
    Left = 8
    Top = 192
  end
  object nxSession: TnxSession
    ServerEngine = ServerEngine
    Left = 56
    Top = 192
  end
  object dsFase: TDataSource
    DataSet = tFase
    Left = 112
    Top = 128
  end
  object dsAponta: TDataSource
    DataSet = tAponta
    Left = 256
    Top = 128
  end
  object tFase: TnxTable
    Database = nxdb
    Timeout = 10000
    BeforePost = tFaseBeforePost
    OnCalcFields = tFaseCalcFields
    TableName = 'Fase'
    IndexName = 'IID'
    MasterFields = 'Cliente;ID'
    MasterSource = dsProj
    Left = 56
    Top = 64
    object tFaseCliente: TStringField
      DisplayWidth = 7
      FieldName = 'Cliente'
      Size = 8
    end
    object tFaseNome: TStringField
      DisplayWidth = 60
      FieldName = 'Nome'
      Size = 50
    end
    object tFaseInicio: TDateTimeField
      FieldName = 'Inicio'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tFaseTermino: TDateTimeField
      FieldName = 'Termino'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tFaseHoras: TWordField
      FieldName = 'Horas'
    end
    object tFasePercEst: TWordField
      DisplayLabel = 'Previs'#227'o'
      FieldName = 'PercEst'
    end
    object tFaseSync: TBooleanField
      FieldName = 'Sync'
    end
    object tFaseHorasReal: TFloatField
      DisplayLabel = 'H.Realizadas'
      FieldName = 'HorasReal'
      DisplayFormat = '0.00'
    end
    object tFaseSumario: TBooleanField
      FieldName = 'Sumario'
    end
    object tFaseStatus: TStringField
      FieldName = 'Status'
      Size = 1
    end
    object tFaseValidador: TStringField
      FieldName = 'Validador'
      Size = 30
    end
    object tFaseDatReI: TDateTimeField
      FieldName = 'DatReI'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tFaseDatReF: TDateTimeField
      FieldName = 'DatReF'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tFaseDataVld: TDateTimeField
      FieldName = 'DataVld'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tFaseIconIndex: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'IconIndex'
      Calculated = True
    end
    object tFaseUniqueID: TStringField
      DisplayWidth = 26
      FieldKind = fkCalculated
      FieldName = 'UniqueID'
      Size = 27
      Calculated = True
    end
    object tFaseProjeto: TStringField
      FieldName = 'Projeto'
      Size = 15
    end
    object tFaseRevisao: TStringField
      DisplayWidth = 4
      FieldName = 'Revisao'
      Size = 4
    end
    object tFaseIDRetag: TStringField
      FieldName = 'IDRetag'
    end
    object tFaseNovoHor: TWordField
      FieldName = 'NovoHor'
    end
    object tFaseNovoIni: TDateTimeField
      FieldName = 'NovoIni'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tFaseNovoFim: TDateTimeField
      FieldName = 'NovoFim'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tFaseJustific: TStringField
      FieldName = 'Justific'
      Size = 250
    end
    object tFaseTecSug: TStringField
      FieldName = 'TecSug'
      Size = 6
    end
    object tFaseMotSug: TStringField
      FieldName = 'MotSug'
      Size = 1
    end
    object tFaseFlagSug: TStringField
      FieldName = 'FlagSug'
      Size = 2
    end
    object tFaseCliSug: TStringField
      FieldName = 'CliSug'
      Size = 30
    end
    object tFaseSyncSug: TBooleanField
      FieldName = 'SyncSug'
    end
    object tFaseIDSugPrint: TStringField
      DisplayWidth = 37
      FieldKind = fkCalculated
      FieldName = 'IDSugPrint'
      Size = 37
      Calculated = True
    end
    object tFaseNomeTecSug: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTecSug'
      LookupDataSet = tTec
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'TecSug'
      Size = 30
      Lookup = True
    end
    object tFaseNomeMotSug: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeMotSug'
      Size = 50
      Calculated = True
    end
    object tFaseDataSug: TDateTimeField
      FieldName = 'DataSug'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tFaseIDSug: TStringField
      FieldName = 'IDSug'
      Size = 2
    end
    object tFaseID: TStringField
      FieldName = 'ID'
      Size = 12
    end
    object tFaseFasePai: TStringField
      FieldName = 'FasePai'
      Size = 12
    end
    object tFaseHR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'HR'
      DisplayFormat = '0.0'
      Calculated = True
    end
    object tFaseOBS: TStringField
      FieldName = 'OBS'
      Size = 255
    end
    object tFasePercRealizado: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PercRealizado'
      DisplayFormat = '0.00'
      Calculated = True
    end
  end
  object dsTec: TDataSource
    DataSet = tTec
    Left = 176
    Top = 192
  end
  object tAmarraFase: TnxTable
    Database = nxdb
    Timeout = 10000
    TableName = 'AmarraFase'
    IndexFieldNames = 'Cliente;Projeto'
    MasterFields = 'Cliente;ID'
    MasterSource = dsProj
    Left = 128
    Top = 8
    object tAmarraFaseCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object tAmarraFaseProjeto: TStringField
      FieldName = 'Projeto'
      Size = 15
    end
    object tAmarraFaseTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object tAmarraFaseNomeFasePai: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeFasePai'
      LookupDataSet = tFase
      LookupKeyFields = 'Cliente;Projeto;ID'
      LookupResultField = 'Nome'
      KeyFields = 'Cliente;Projeto;FasePai'
      Size = 30
      Lookup = True
    end
    object tAmarraFaseFasePai: TStringField
      FieldName = 'FasePai'
      Size = 12
    end
    object tAmarraFaseFaseFilho: TStringField
      FieldName = 'FaseFilho'
      Size = 12
    end
  end
  object tProj: TnxTable
    Database = nxdb
    Timeout = 10000
    AfterScroll = tProjAfterScroll
    TableName = 'Projeto'
    IndexFieldNames = 'Cliente'
    MasterFields = 'ID'
    MasterSource = dsCli
    Left = 8
    Top = 64
    object tProjCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object tProjNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tProjID: TStringField
      FieldName = 'ID'
      Size = 15
    end
    object tProjLocaPla: TStringField
      FieldName = 'LocaPla'
      Size = 2
    end
    object tProjLocaRec: TStringField
      FieldName = 'LocaRec'
      Size = 1
    end
    object tProjNoturno: TStringField
      FieldName = 'Noturno'
      Size = 1
    end
    object tProjFimSem: TStringField
      FieldName = 'FimSem'
      Size = 1
    end
    object tProjTranslado: TDateTimeField
      FieldName = 'Translado'
    end
    object tProjAbono: TDateTimeField
      FieldName = 'Abono'
    end
    object tProjMotAbono: TStringField
      FieldName = 'MotAbono'
      Size = 2
    end
    object tProjOSAbon: TStringField
      FieldName = 'OSAbon'
      Size = 1
    end
    object tProjTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object tProjHorasPrev: TFloatField
      FieldName = 'HorasPrev'
    end
    object tProjHorasReal: TFloatField
      FieldName = 'HorasReal'
    end
    object tProjPosicao: TDateTimeField
      FieldName = 'Posicao'
    end
    object tProjVersaoProj: TStringField
      FieldName = 'VersaoProj'
      Size = 10
    end
    object tProjAPSemOS: TStringField
      FieldName = 'APSemOS'
      Size = 1
    end
    object tProjAbonaInt: TStringField
      FieldName = 'AbonaInt'
      Size = 1
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    Left = 112
    Top = 184
  end
  object dsOS: TDataSource
    DataSet = tOS
    Left = 304
    Top = 128
  end
  object tOSItens: TnxTable
    Database = nxdb
    Timeout = 10000
    Filter = 'Apagar<>'#39'S'#39
    FilterOptions = [foCaseInsensitive]
    BeforePost = tOSItensBeforePost
    OnCalcFields = tOSItensCalcFields
    TableName = 'OSFase'
    IndexName = 'IOSItem'
    MasterFields = 'Cliente;Tecnico;Data;ID'
    MasterSource = dsOS
    Left = 184
    Top = 8
    object tOSItensCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object tOSItensData: TDateTimeField
      FieldName = 'Data'
    end
    object tOSItensTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tOSItensHoras: TDateTimeField
      FieldName = 'Horas'
      DisplayFormat = 'hh:mm'
    end
    object tOSItensSync: TBooleanField
      FieldName = 'Sync'
    end
    object tOSItensNomeProjeto: TStringField
      DisplayLabel = 'Projeto'
      FieldKind = fkLookup
      FieldName = 'NomeProjeto'
      LookupDataSet = tAuxProj
      LookupKeyFields = 'Cliente;ID'
      LookupResultField = 'Nome'
      KeyFields = 'Cliente;Projeto'
      Size = 30
      Lookup = True
    end
    object tOSItensNomeFase: TStringField
      DisplayLabel = 'Fase'
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'NomeFase'
      LookupDataSet = tAuxFase
      LookupKeyFields = 'Cliente;Projeto;ID'
      LookupResultField = 'Nome'
      KeyFields = 'Cliente;Projeto;Fase'
      Size = 60
      Lookup = True
    end
    object tOSItensOS: TSmallintField
      FieldName = 'OS'
    end
    object tOSItensDescricao: TStringField
      DisplayWidth = 2000
      FieldKind = fkCalculated
      FieldName = 'Descricao'
      Size = 2000
      Calculated = True
    end
    object tOSItensNomeTipoHora: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTipoHora'
      LookupDataSet = tTipoHora
      LookupKeyFields = 'ID'
      LookupResultField = 'Descricao'
      KeyFields = 'TipoHora'
      Size = 30
      Lookup = True
    end
    object tOSItensCodNomeFase: TStringField
      DisplayWidth = 67
      FieldKind = fkCalculated
      FieldName = 'CodNomeFase'
      Size = 67
      Calculated = True
    end
    object tOSItensProjeto: TStringField
      FieldName = 'Projeto'
      Size = 15
    end
    object tOSItensTipoHora: TStringField
      FieldName = 'TipoHora'
      Size = 15
    end
    object tOSItensOcorrencia: TStringField
      FieldName = 'Ocorrencia'
      Size = 2
    end
    object tOSItensRevisao: TStringField
      FieldName = 'Revisao'
      Size = 4
    end
    object tOSItensFase: TStringField
      FieldName = 'Fase'
      Size = 12
    end
    object tOSItensChaveU: TStringField
      FieldKind = fkCalculated
      FieldName = 'ChaveU'
      Size = 50
      Calculated = True
    end
    object tOSItensItem: TIntegerField
      FieldName = 'Item'
    end
    object tOSItensLogID: TIntegerField
      FieldName = 'LogID'
    end
    object tOSItensDownOk: TBooleanField
      FieldName = 'DownOk'
    end
    object tOSItensTipoHoraTipo: TStringField
      FieldKind = fkLookup
      FieldName = 'TipoHoraTipo'
      LookupDataSet = tTipoHora
      LookupKeyFields = 'ID'
      LookupResultField = 'Tipo'
      KeyFields = 'TipoHora'
      Size = 1
      Lookup = True
    end
    object tOSItensApagar: TStringField
      FieldName = 'Apagar'
      Size = 1
    end
  end
  object dsOSItems: TDataSource
    DataSet = tOSItens
    Left = 160
    Top = 256
  end
  object tNovaOS: TnxTable
    Database = nxdb
    Timeout = 10000
    TableName = 'OS'
    IndexName = 'IID'
    Left = 8
    Top = 256
  end
  object tMotivo: TnxTable
    Database = nxdb
    Timeout = 10000
    TableName = 'Motivo'
    IndexName = 'IID'
    Left = 56
    Top = 256
    object tMotivoNome: TStringField
      DisplayWidth = 30
      FieldName = 'Nome'
      Size = 30
    end
    object tMotivoID: TStringField
      DisplayWidth = 2
      FieldName = 'ID'
      Size = 2
    end
  end
  object dsMotivo: TDataSource
    DataSet = tMotivo
    Left = 216
    Top = 256
  end
  object tNovoAponta: TnxTable
    Database = nxdb
    Timeout = 10000
    TableName = 'OSFase'
    IndexName = 'IProjFase'
    Left = 240
    Top = 8
  end
  object tAuxProj: TnxTable
    Database = nxdb
    Timeout = 10000
    TableName = 'Projeto'
    IndexName = 'IID'
    Left = 304
    Top = 8
  end
  object tAuxFase: TnxTable
    Database = nxdb
    Timeout = 10000
    TableName = 'Fase'
    IndexName = 'IID'
    Left = 256
    Top = 64
  end
  object tOSFaseDesc: TnxTable
    Database = nxdb
    Timeout = 10000
    Filter = 'Apagar <> '#39'S'#39
    FilterOptions = [foCaseInsensitive]
    TableName = 'OSFaseDesc'
    IndexName = 'IChave'
    Left = 320
    Top = 64
    object tOSFaseDescCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object tOSFaseDescTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tOSFaseDescTexto: TStringField
      FieldName = 'Texto'
      Size = 70
    end
    object tOSFaseDescSync: TBooleanField
      FieldName = 'Sync'
    end
    object tOSFaseDescProjeto: TStringField
      FieldName = 'Projeto'
      Size = 15
    end
    object tOSFaseDescFase: TStringField
      FieldName = 'Fase'
      Size = 12
    end
    object tOSFaseDescData: TDateTimeField
      FieldName = 'Data'
    end
    object tOSFaseDescOS: TSmallintField
      FieldName = 'OS'
    end
    object tOSFaseDescItem: TIntegerField
      FieldName = 'Item'
    end
    object tOSFaseDescLogID: TIntegerField
      FieldName = 'LogID'
    end
    object tOSFaseDescDownOk: TBooleanField
      FieldName = 'DownOk'
    end
    object tOSFaseDescApagar: TStringField
      FieldName = 'Apagar'
      Size = 1
    end
    object tOSFaseDescPos: TIntegerField
      FieldName = 'Pos'
    end
  end
  object tTipoHora: TnxTable
    Database = nxdb
    Timeout = 10000
    TableName = 'TipoHora'
    IndexName = 'IID'
    Left = 312
    Top = 192
    object tTipoHoraID: TStringField
      FieldName = 'ID'
      Size = 15
    end
    object tTipoHoraDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object tTipoHoraTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object tTipoHoraSemTrans: TStringField
      FieldName = 'SemTrans'
      Size = 1
    end
  end
  object INICtrl: TLMDIniCtrl
    IniFile = 'A:\DIATEC.INI'
    IniPrefix = ppProgram
    Target = itIniFile
    Left = 280
    Top = 256
  end
  object tOcorrencia: TnxTable
    Database = nxdb
    Timeout = 10000
    TableName = 'Ocorrencia'
    IndexName = 'IID'
    Left = 480
    Top = 112
    object tOcorrenciaID: TStringField
      FieldName = 'ID'
      Size = 2
    end
    object tOcorrenciaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
  end
  object dsOcorrencia: TDataSource
    DataSet = tOcorrencia
    Left = 544
    Top = 112
  end
  object dsAmarraFase: TDataSource
    DataSet = tAmarraFase
    Left = 432
    Top = 264
  end
  object DBDown: TnxDatabase
    Session = nxSession
    Left = 56
    Top = 312
  end
  object LMDSysInfo1: TLMDSysInfo
    Left = 352
    Top = 256
  end
  object qCli: TnxQuery
    Database = nxdb
    SQL.Strings = (
      
        'SELECT DISTINCT(P.Cliente), C.ID, C.Nome, C.Translado, C.Assinou' +
        ', C.Noturno, C.FimSem, C.Abono, '
      
        'C.MotAbono, C.Cidade, C.KM, C.VlPedag, C.PgAlim, C.PgHosp, C.Val' +
        'orKM'
      '  FROM Projeto P, Cliente C'
      '  WHERE C.ID = P.Cliente'
      '  ORDER BY C.Nome')
    Left = 360
    Top = 8
    object qCliCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object qCliID: TStringField
      FieldName = 'ID'
      Size = 6
    end
    object qCliNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object qCliTranslado: TDateTimeField
      FieldName = 'Translado'
    end
    object qCliAssinou: TStringField
      FieldName = 'Assinou'
      Size = 30
    end
    object qCliNoturno: TStringField
      FieldName = 'Noturno'
      Size = 1
    end
    object qCliFimSem: TStringField
      FieldName = 'FimSem'
      Size = 1
    end
    object qCliAbono: TDateTimeField
      FieldName = 'Abono'
    end
    object qCliMotAbono: TStringField
      FieldName = 'MotAbono'
      Size = 2
    end
    object qCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 40
    end
    object qCliKM: TIntegerField
      FieldName = 'KM'
    end
    object qCliVlPedag: TCurrencyField
      FieldName = 'VlPedag'
    end
    object qCliPgAlim: TBooleanField
      FieldName = 'PgAlim'
    end
    object qCliPgHosp: TBooleanField
      FieldName = 'PgHosp'
    end
  end
  object tParametro: TnxTable
    Database = nxdb
    TableName = 'Parametro'
    IndexName = 'Sequential Access Index'
    Left = 416
    Top = 8
    object tParametroMaxDiasUpload: TWordField
      FieldName = 'MaxDiasUpload'
    end
    object tParametroMaxDiasDown: TWordField
      FieldName = 'MaxDiasDown'
    end
    object tParametroDataDown: TDateTimeField
      FieldName = 'DataDown'
    end
    object tParametroNomeFranquia: TStringField
      FieldName = 'NomeFranquia'
      Size = 40
    end
    object tParametroBitMap: TGraphicField
      FieldName = 'BitMap'
      BlobType = ftGraphic
    end
    object tParametroRestringeDiurno: TBooleanField
      FieldName = 'RestringeDiurno'
    end
    object tParametroTravarTranslado: TBooleanField
      FieldName = 'TravarTranslado'
    end
    object tParametroCampoLocalOS: TBooleanField
      FieldName = 'CampoLocalOS'
    end
    object tParametroInicioDiurno: TDateTimeField
      FieldName = 'InicioDiurno'
    end
    object tParametroFimDiurno: TDateTimeField
      FieldName = 'FimDiurno'
    end
    object tParametroUploadApontamentoSemOS: TBooleanField
      FieldName = 'UploadApontamentoSemOS'
    end
    object tParametroObedeceListaProj: TBooleanField
      FieldName = 'ObedeceListaProj'
    end
    object tParametroListaProjDefault: TStringField
      FieldName = 'ListaProjDefault'
      Size = 1
    end
    object tParametroPermitirRateio: TBooleanField
      FieldName = 'PermitirRateio'
    end
    object tParametroConflitoHoraTodosCli: TBooleanField
      FieldName = 'ConflitoHoraTodosCli'
    end
    object tParametroExigeAutorizadoPor: TBooleanField
      FieldName = 'ExigeAutorizadoPor'
    end
    object tParametroMostraReemb: TBooleanField
      FieldName = 'MostraReemb'
    end
    object tParametroForcaTransladoProj: TBooleanField
      FieldName = 'ForcaTransladoProj'
    end
    object tParametroTransladoUnicoPorCliente: TBooleanField
      FieldName = 'TransladoUnicoPorCliente'
    end
    object tParametroImprimeAndamentoProjeto: TBooleanField
      FieldName = 'ImprimeAndamentoProjeto'
    end
    object tParametroValidarEDT: TBooleanField
      FieldName = 'ValidarEDT'
    end
    object tParametroEstimarFaseNoApontamento: TBooleanField
      FieldName = 'EstimarFaseNoApontamento'
    end
    object tParametroExigirEstimativa: TBooleanField
      FieldName = 'ExigirEstimativa'
    end
    object tParametroVlHosp: TCurrencyField
      FieldName = 'VlHosp'
    end
    object tParametroVlKMCli: TCurrencyField
      FieldName = 'VlKMCli'
    end
    object tParametroVlKMTec: TCurrencyField
      FieldName = 'VlKMTec'
    end
    object tParametroMostrarRA: TBooleanField
      FieldName = 'MostrarRA'
    end
    object tParametroVlAlim: TCurrencyField
      FieldName = 'VlAlim'
    end
    object tParametroPermiteApagarOSSincronizada: TBooleanField
      FieldName = 'PermiteApagarOSSincronizada'
    end
    object tParametroAtivarIntervalo: TBooleanField
      FieldName = 'AtivarIntervalo'
    end
    object tParametroAtivarValorTrans: TBooleanField
      FieldName = 'AtivarValorTrans'
    end
    object tParametroPermiteCorrigirOS: TBooleanField
      FieldName = 'PermiteCorrigirOS'
    end
    object tParametroTodasHorasNoFeriado: TBooleanField
      FieldName = 'TodasHorasNoFeriado'
    end
  end
  object tSolicita: TnxTable
    Database = nxdb
    AfterInsert = tSolicitaAfterInsert
    BeforePost = tSolicitaBeforePost
    OnCalcFields = tSolicitaCalcFields
    TableName = 'Solicita'
    IndexName = 'IChave'
    MasterFields = 'Cliente;ID'
    MasterSource = dsProj
    Left = 384
    Top = 64
    object tSolicitaCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object tSolicitaProjeto: TStringField
      FieldName = 'Projeto'
      Size = 15
    end
    object tSolicitaTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tSolicitaData: TDateTimeField
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tSolicitaItem: TWordField
      FieldName = 'Item'
    end
    object tSolicitaTipo: TStringField
      FieldName = 'Tipo'
      Size = 2
    end
    object tSolicitaOrigem: TStringField
      FieldName = 'Origem'
      Size = 1
    end
    object tSolicitaNomeResp: TStringField
      FieldName = 'NomeResp'
      Size = 30
    end
    object tSolicitaSync: TBooleanField
      FieldName = 'Sync'
    end
    object tSolicitaNomeTec: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTec'
      LookupDataSet = tTec
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Tecnico'
      Size = 30
      Lookup = True
    end
    object tSolicitaNomeTipo: TStringField
      DisplayWidth = 40
      FieldKind = fkCalculated
      FieldName = 'NomeTipo'
      Size = 30
      Calculated = True
    end
    object tSolicitaNomeOrigem: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeOrigem'
      Size = 7
      Calculated = True
    end
    object tSolicitaDescricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descricao'
      Size = 1000
      Calculated = True
    end
    object tSolicitaChave: TStringField
      FieldKind = fkCalculated
      FieldName = 'Chave'
      Size = 35
      Calculated = True
    end
    object tSolicitaDataRT: TDateTimeField
      FieldName = 'DataRT'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tSolicitaRetorno: TStringField
      FieldKind = fkCalculated
      FieldName = 'Retorno'
      Size = 1000
      Calculated = True
    end
    object tSolicitaNomeRT: TStringField
      FieldName = 'NomeRT'
      Size = 8
    end
  end
  object tSolicitaDesc: TnxTable
    Database = nxdb
    BeforePost = tSolicitaDescBeforePost
    TableName = 'SolicitaDesc'
    IndexName = 'IChave'
    Left = 488
    Top = 8
    object tSolicitaDescCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object tSolicitaDescProjeto: TStringField
      FieldName = 'Projeto'
      Size = 15
    end
    object tSolicitaDescTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tSolicitaDescItem: TWordField
      FieldName = 'Item'
    end
    object tSolicitaDescPos: TWordField
      FieldName = 'Pos'
    end
    object tSolicitaDescTexto: TStringField
      FieldName = 'Texto'
      Size = 70
    end
    object tSolicitaDescSync: TBooleanField
      FieldName = 'Sync'
    end
    object tSolicitaDescData: TDateTimeField
      FieldName = 'Data'
    end
    object tSolicitaDescTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
  end
  object dsSolicita: TDataSource
    DataSet = tSolicita
    Left = 344
    Top = 128
  end
  object dsSolicitaDesc: TDataSource
    DataSet = tSolicitaDesc
    Left = 407
    Top = 128
  end
  object tAuxSol: TnxTable
    Database = nxdb
    TableName = 'Solicita'
    IndexName = 'IChave'
    Left = 232
    Top = 192
  end
  object tAuxSD: TnxTable
    Database = nxdb
    TableName = 'SolicitaDesc'
    IndexName = 'IChave'
    Left = 376
    Top = 192
  end
  object dsPar: TDataSource
    DataSet = tParametro
    Left = 216
    Top = 312
  end
  object ServerEngine: TnxServerEngine
    ActiveRuntime = True
    SqlEngine = SQLEngine
    Options = []
    Left = 296
    Top = 312
  end
  object SQLEngine: TnxSqlEngine
    ActiveDesigntime = True
    Left = 376
    Top = 312
  end
  object tLog: TnxTable
    Database = nxdb
    Timeout = 10000
    OnCalcFields = tLogCalcFields
    TableName = 'Log'
    IndexName = 'IID'
    Left = 464
    Top = 328
    object tLogID: TAutoIncField
      FieldName = 'ID'
    end
    object tLogTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tLogData: TDateTimeField
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy hh:mm:ss'
    end
    object tLogDetalhes: TMemoField
      FieldName = 'Detalhes'
      BlobType = ftMemo
    end
    object tLogOper: TWordField
      FieldName = 'Oper'
    end
    object tLogOK: TBooleanField
      FieldName = 'OK'
    end
    object tLogDuracao: TDateTimeField
      FieldName = 'Duracao'
      DisplayFormat = 'hh:mm:ss'
    end
    object tLogUUpload: TIntegerField
      FieldName = 'UUpload'
    end
    object tLogNomeTec: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTec'
      LookupDataSet = tTec
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Tecnico'
      Size = 40
      Lookup = True
    end
    object tLogNomeOper: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeOper'
      Size = 30
      Calculated = True
    end
  end
  object dsLog: TDataSource
    DataSet = tLog
    Left = 512
    Top = 328
  end
  object tFer: TnxTable
    Database = nxdb
    Timeout = 10000
    TableName = 'Feriado'
    IndexName = 'IData'
    Left = 488
    Top = 232
    object tFerData: TDateField
      FieldName = 'Data'
    end
    object tFerDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object mtHR: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Horas'
        DataType = ftFloat
      end>
    IndexFieldNames = 'ID'
    IndexName = 'mtHRIndex1'
    IndexDefs = <
      item
        Name = 'mtHRIndex1'
        Fields = 'ID'
        Options = [ixUnique, ixCaseInsensitive]
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 440
    Top = 64
    object mtHRID: TStringField
      FieldName = 'ID'
      Size = 12
    end
    object mtHRHoras: TFloatField
      FieldName = 'Horas'
    end
  end
  object tRA: TnxTable
    Database = nxdb
    AfterInsert = tRAAfterInsert
    BeforePost = tRABeforePost
    OnCalcFields = tRACalcFields
    TableName = 'RA'
    IndexName = 'IChave'
    Left = 88
    Top = 424
    object tRASync: TBooleanField
      FieldName = 'Sync'
    end
    object tRATecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tRACliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object tRADataI: TDateField
      FieldName = 'DataI'
    end
    object tRADataF: TDateField
      FieldName = 'DataF'
    end
    object tRALogID: TIntegerField
      FieldName = 'LogID'
    end
    object tRAChaveU: TStringField
      DisplayWidth = 28
      FieldKind = fkCalculated
      FieldName = 'ChaveU'
      Size = 28
      Calculated = True
    end
    object tRANomeCli: TStringField
      DisplayLabel = 'Cliente'
      FieldKind = fkLookup
      FieldName = 'NomeCli'
      LookupDataSet = tAuxCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Cliente'
      Size = 40
      Lookup = True
    end
    object tRANumF: TIntegerField
      FieldName = 'NumF'
    end
    object tRAStatusCli: TWordField
      FieldName = 'StatusCli'
    end
    object tRAStatusTec: TWordField
      FieldName = 'StatusTec'
    end
    object tRADHUpload: TDateTimeField
      FieldName = 'DHUpload'
    end
    object tRAID: TIntegerField
      FieldName = 'ID'
    end
    object tRANomeTec: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTec'
      LookupDataSet = tTec
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Tecnico'
      Size = 30
      Lookup = True
    end
  end
  object tRAOS: TnxTable
    Database = nxdb
    AfterInsert = tRAOSAfterInsert
    BeforePost = tRAOSBeforePost
    OnCalcFields = tRAOSCalcFields
    TableName = 'RAOS'
    IndexFieldNames = 'Tecnico;Cliente;IDRA'
    MasterFields = 'Tecnico;Cliente;ID'
    MasterSource = dsRA
    Left = 136
    Top = 424
    object tRAOSSync: TBooleanField
      FieldName = 'Sync'
    end
    object tRAOSTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tRAOSCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object tRAOSDataOS: TDateTimeField
      FieldName = 'DataOS'
    end
    object tRAOSLogID: TIntegerField
      FieldName = 'LogID'
    end
    object tRAOSChaveU: TStringField
      DisplayWidth = 45
      FieldKind = fkCalculated
      FieldName = 'ChaveU'
      Size = 45
      Calculated = True
    end
    object tRAOSNumF: TIntegerField
      FieldName = 'NumF'
    end
    object tRAOSHoras: TTimeField
      FieldName = 'Horas'
    end
    object tRAOSIDOS: TWordField
      FieldName = 'IDOS'
    end
    object tRAOSIDRA: TIntegerField
      FieldName = 'IDRA'
    end
    object tRAOSChaveOS: TStringField
      FieldKind = fkCalculated
      FieldName = 'ChaveOS'
      Size = 24
      Calculated = True
    end
  end
  object tRAItem: TnxTable
    Database = nxdb
    BeforePost = tRAItemBeforePost
    OnCalcFields = tRAItemCalcFields
    TableName = 'RAItem'
    IndexFieldNames = 'Tecnico;Cliente;IDRA'
    MasterFields = 'Tecnico;Cliente;ID'
    MasterSource = dsRA
    Left = 184
    Top = 424
    object tRAItemSync: TBooleanField
      FieldName = 'Sync'
    end
    object tRAItemTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tRAItemCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object tRAItemTipo: TWordField
      FieldName = 'Tipo'
    end
    object tRAItemValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tRAItemDescr: TMemoField
      FieldName = 'Descr'
      BlobType = ftMemo
    end
    object tRAItemNumF: TIntegerField
      FieldName = 'NumF'
    end
    object tRAItemValorDef: TCurrencyField
      FieldName = 'ValorDef'
    end
    object tRAItemValorCli: TCurrencyField
      FieldName = 'ValorCli'
    end
    object tRAItemValorTec: TCurrencyField
      FieldName = 'ValorTec'
    end
    object tRAItemStatusTec: TWordField
      FieldName = 'StatusTec'
    end
    object tRAItemLogID: TIntegerField
      FieldName = 'LogID'
    end
    object tRAItemStatusCli: TWordField
      FieldName = 'StatusCli'
    end
    object tRAItemChaveU: TStringField
      FieldKind = fkCalculated
      FieldName = 'ChaveU'
      Size = 17
      Calculated = True
    end
    object tRAItemCusteadoPor: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CusteadoPor'
      Calculated = True
    end
    object tRAItemJustDiverg: TMemoField
      FieldName = 'JustDiverg'
      BlobType = ftMemo
    end
    object tRAItemIDRA: TIntegerField
      FieldName = 'IDRA'
    end
    object tRAItemData: TDateField
      FieldName = 'Data'
    end
    object tRAItemID: TWordField
      FieldName = 'ID'
    end
    object tRAItemONServ: TBooleanField
      FieldName = 'ONServ'
    end
    object tRAItemNomeCli: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeCli'
      LookupDataSet = tAuxCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Cliente'
      Size = 40
      Lookup = True
    end
    object tRAItemExcluirServ: TBooleanField
      FieldName = 'ExcluirServ'
    end
    object tRAItemNomeTipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeTipo'
      Size = 12
      Calculated = True
    end
    object tRAItemValorStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'ValorStr'
      Size = 15
      Calculated = True
    end
  end
  object dsRA: TDataSource
    DataSet = tRA
    Left = 88
    Top = 472
  end
  object dsRAOS: TDataSource
    DataSet = tRAOS
    Left = 136
    Top = 472
  end
  object dsRAItem: TDataSource
    DataSet = tRAItem
    Left = 184
    Top = 472
  end
  object tAuxRAOS: TnxTable
    Database = nxdb
    OnCalcFields = tRAOSCalcFields
    TableName = 'RAOS'
    IndexName = 'IOS'
    Left = 248
    Top = 424
  end
  object tAuxRA: TnxTable
    Database = nxdb
    OnCalcFields = tRAOSCalcFields
    TableName = 'RA'
    IndexName = 'IChave'
    Left = 304
    Top = 424
  end
  object tDesp: TnxTable
    Database = nxdb
    Filter = '(ExcluirServ <> True)'
    Filtered = True
    AfterInsert = tDespAfterInsert
    BeforePost = tDespBeforePost
    OnCalcFields = tDespCalcFields
    TableName = 'RAItem'
    Left = 424
    Top = 424
    object tDespChaveU: TStringField
      FieldKind = fkCalculated
      FieldName = 'ChaveU'
      Size = 17
      Calculated = True
    end
    object tDespCusteadoPor: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CusteadoPor'
      Calculated = True
    end
    object tDespNomeCli: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeCli'
      LookupDataSet = tAuxCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Cliente'
      Size = 40
      Lookup = True
    end
    object tDespSync: TBooleanField
      FieldName = 'Sync'
    end
    object tDespTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tDespCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object tDespData: TDateField
      FieldName = 'Data'
    end
    object tDespID: TWordField
      FieldName = 'ID'
    end
    object tDespIDRA: TWordField
      FieldName = 'IDRA'
    end
    object tDespTipo: TWordField
      FieldName = 'Tipo'
    end
    object tDespValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tDespJustDiverg: TMemoField
      FieldName = 'JustDiverg'
      BlobType = ftMemo
    end
    object tDespDescr: TMemoField
      FieldName = 'Descr'
      BlobType = ftMemo
    end
    object tDespNumF: TIntegerField
      FieldName = 'NumF'
    end
    object tDespValorDef: TCurrencyField
      FieldName = 'ValorDef'
    end
    object tDespValorCli: TCurrencyField
      FieldName = 'ValorCli'
    end
    object tDespValorTec: TCurrencyField
      FieldName = 'ValorTec'
    end
    object tDespStatusTec: TWordField
      FieldName = 'StatusTec'
    end
    object tDespLogID: TIntegerField
      FieldName = 'LogID'
    end
    object tDespStatusCli: TWordField
      FieldName = 'StatusCli'
    end
    object tDespONServ: TBooleanField
      FieldName = 'ONServ'
    end
    object tDespExcluirServ: TBooleanField
      FieldName = 'ExcluirServ'
    end
  end
  object dsDesp: TDataSource
    DataSet = tDesp
    Left = 320
    Top = 376
  end
  object repEdit: TcxEditRepository
    Left = 536
    Top = 408
    object repEditStatusTec: TcxEditRepositoryImageComboBoxItem
      Properties.Alignment.Vert = taVCenter
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items = <
        item
          Description = 'Pendente'
          Value = 0
        end
        item
          Description = 'Aprov.Integral'
          Value = 1
        end
        item
          Description = 'Aprov.Diverg'#234'ncia'
          Value = 2
        end
        item
          Description = 'Reprovado'
          Value = 3
        end>
    end
    object repEditStatusCli: TcxEditRepositoryImageComboBoxItem
      Properties.Alignment.Vert = taVCenter
      Properties.Items = <
        item
          Description = 'N'#227'o Paga'
          Value = 0
        end
        item
          Description = 'Pendente'
          Value = 1
        end
        item
          Description = 'Aprov.Integral'
          Value = 2
        end
        item
          Description = 'Aprov.Diverg'#234'ncia'
          Value = 3
        end
        item
          Description = 'N'#227'o Cobrar'
          Tag = 3
          Value = 4
        end>
    end
    object repEditTipoDesp: TcxEditRepositoryImageComboBoxItem
      Properties.Alignment.Vert = taVCenter
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items = <
        item
          Description = 'KM'
          Value = 0
        end
        item
          Description = 'Ped'#225'gio'
          Value = 1
        end
        item
          Description = 'Alimenta'#231#227'o'
          Value = 2
        end
        item
          Description = 'Hospedagem'
          Value = 3
        end
        item
          Description = 'Outros'
          Value = 4
        end>
    end
  end
  object Q: TnxQuery
    Database = nxdb
    Left = 128
    Top = 360
  end
  object tAuxDesc: TnxTable
    Database = nxdb
    Timeout = 10000
    TableName = 'OSFaseDesc'
    IndexFieldNames = 'Cliente;Projeto;Fase;Tecnico;Item'
    MasterFields = 'Cliente;Projeto;Fase;Tecnico;Item'
    MasterSource = dsOSItems
    Left = 552
    Top = 488
    object tAuxDescCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object tAuxDescTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tAuxDescPos: TWordField
      FieldName = 'Pos'
    end
    object tAuxDescTexto: TStringField
      FieldName = 'Texto'
      Size = 70
    end
    object tAuxDescSync: TBooleanField
      FieldName = 'Sync'
    end
    object tAuxDescProjeto: TStringField
      FieldName = 'Projeto'
      Size = 15
    end
    object tAuxDescFase: TStringField
      FieldName = 'Fase'
      Size = 12
    end
    object tAuxDescData: TDateTimeField
      FieldName = 'Data'
    end
    object tAuxDescOS: TSmallintField
      FieldName = 'OS'
    end
    object tAuxDescItem: TIntegerField
      FieldName = 'Item'
    end
    object tAuxDescLogID: TIntegerField
      FieldName = 'LogID'
    end
    object tAuxDescDownOk: TBooleanField
      FieldName = 'DownOk'
    end
    object tAuxDescApagar: TStringField
      FieldName = 'Apagar'
      Size = 1
    end
  end
  object dsMTDescr: TDataSource
    DataSet = mtDescr
    Left = 560
    Top = 168
  end
  object mtDescr: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Tecnico'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Texto'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'Sync'
        DataType = ftBoolean
      end
      item
        Name = 'Projeto'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Fase'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Data'
        DataType = ftDateTime
      end
      item
        Name = 'OS'
        DataType = ftSmallint
      end
      item
        Name = 'Item'
        DataType = ftInteger
      end
      item
        Name = 'LogID'
        DataType = ftInteger
      end
      item
        Name = 'DownOk'
        DataType = ftBoolean
      end
      item
        Name = 'Apagar'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Pos'
        DataType = ftInteger
      end>
    IndexFieldNames = 'Cliente;Projeto;Fase;Tecnico;Item;Pos'
    IndexName = 'mtDescrIndex1'
    IndexDefs = <
      item
        Name = 'mtDescrIndex1'
        Fields = 'Cliente;Projeto;Fase;Tecnico;Item;Pos'
        Options = [ixCaseInsensitive]
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    MasterFields = 'Cliente;Projeto;Fase;Tecnico;Item'
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 504
    Top = 168
    object mtDescrCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object mtDescrTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object mtDescrTexto: TStringField
      FieldName = 'Texto'
      Size = 70
    end
    object mtDescrSync: TBooleanField
      FieldName = 'Sync'
    end
    object mtDescrProjeto: TStringField
      FieldName = 'Projeto'
      Size = 15
    end
    object mtDescrFase: TStringField
      FieldName = 'Fase'
      Size = 12
    end
    object mtDescrData: TDateTimeField
      FieldName = 'Data'
    end
    object mtDescrOS: TSmallintField
      FieldName = 'OS'
    end
    object mtDescrItem: TIntegerField
      FieldName = 'Item'
    end
    object mtDescrLogID: TIntegerField
      FieldName = 'LogID'
    end
    object mtDescrDownOk: TBooleanField
      FieldName = 'DownOk'
    end
    object mtDescrApagar: TStringField
      FieldName = 'Apagar'
      Size = 1
    end
    object mtDescrPos: TIntegerField
      FieldName = 'Pos'
    end
  end
end
