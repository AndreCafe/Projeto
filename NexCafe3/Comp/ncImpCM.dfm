object dmCM: TdmCM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 376
  Width = 333
  object nxSS: TnxSession
    ServerEngine = nxRSE
    Left = 120
    Top = 16
  end
  object nxDB: TnxDatabase
    Session = nxSS
    AliasName = 'Cybermgr'
    Left = 168
    Top = 16
  end
  object cmAviso: TnxTable
    Database = nxDB
    TableName = 'Aviso'
    Left = 24
    Top = 80
    object cmAvisoMinutos: TWordField
      FieldName = 'Minutos'
    end
    object cmAvisoAvisoTexto: TStringField
      FieldName = 'AvisoTexto'
      Size = 50
    end
    object cmAvisoSegAvisoTexto: TWordField
      FieldName = 'SegAvisoTexto'
    end
    object cmAvisoPiscarAvisoTexto: TBooleanField
      FieldName = 'PiscarAvisoTexto'
    end
    object cmAvisoSom: TBlobField
      FieldName = 'Som'
    end
    object cmAvisoTocarSom: TBooleanField
      FieldName = 'TocarSom'
    end
  end
  object cmCaixa: TnxTable
    Database = nxDB
    TableName = 'Caixa'
    IndexName = 'INumero'
    Left = 72
    Top = 80
    object cmCaixaNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object cmCaixaAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object cmCaixaUsuario: TStringField
      FieldName = 'Usuario'
      Size = 10
    end
    object cmCaixaAbertura: TDateTimeField
      FieldName = 'Abertura'
    end
    object cmCaixaFechamento: TDateTimeField
      FieldName = 'Fechamento'
    end
    object cmCaixaAcesso: TCurrencyField
      FieldName = 'Acesso'
    end
    object cmCaixaAcessoNaoPago: TCurrencyField
      FieldName = 'AcessoNaoPago'
    end
    object cmCaixaAcessoDebPago: TCurrencyField
      FieldName = 'AcessoDebPago'
    end
    object cmCaixaAcessoQuant: TCurrencyField
      FieldName = 'AcessoQuant'
    end
    object cmCaixaVenda: TCurrencyField
      FieldName = 'Venda'
    end
    object cmCaixaVendaNaoPago: TCurrencyField
      FieldName = 'VendaNaoPago'
    end
    object cmCaixaVendaDebPago: TCurrencyField
      FieldName = 'VendaDebPago'
    end
    object cmCaixaVendaQuant: TCurrencyField
      FieldName = 'VendaQuant'
    end
    object cmCaixaSuprimento: TCurrencyField
      FieldName = 'Suprimento'
    end
    object cmCaixaSangria: TCurrencyField
      FieldName = 'Sangria'
    end
    object cmCaixaSaldoAnt: TCurrencyField
      FieldName = 'SaldoAnt'
    end
    object cmCaixaDescontos: TCurrencyField
      FieldName = 'Descontos'
    end
    object cmCaixaTempoAcesso: TFloatField
      FieldName = 'TempoAcesso'
    end
    object cmCaixaTempoManutencao: TFloatField
      FieldName = 'TempoManutencao'
    end
    object cmCaixaObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
  end
  object cmCli: TnxTable
    Database = nxDB
    TableName = 'Contato'
    IndexName = 'ICodigo'
    Left = 120
    Top = 80
    object cmCliCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object cmCliNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object cmCliEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object cmCliBairro: TStringField
      FieldName = 'Bairro'
    end
    object cmCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object cmCliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cmCliCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cmCliNasc: TDateTimeField
      FieldName = 'Nasc'
    end
    object cmCliSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object cmCliObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object cmCliCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object cmCliRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object cmCliEmail: TMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object cmCliTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object cmCliCreditoM: TIntegerField
      FieldName = 'CreditoM'
    end
    object cmCliTempoTotal: TIntegerField
      FieldName = 'TempoTotal'
    end
    object cmCliTempoInicial: TIntegerField
      FieldName = 'TempoInicial'
    end
    object cmCliIsento: TBooleanField
      FieldName = 'Isento'
    end
    object cmCliUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object cmCliPai: TStringField
      FieldName = 'Pai'
      Size = 40
    end
    object cmCliMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object cmCliSenha: TStringField
      FieldName = 'Senha'
    end
    object cmCliUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object cmCliDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object cmCliEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object cmCliEscolaHI: TDateTimeField
      FieldName = 'EscolaHI'
    end
    object cmCliEscolaHF: TDateTimeField
      FieldName = 'EscolaHF'
    end
    object cmCliNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object cmCliDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object cmCliCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object cmCliTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
    object cmCliLimiteDebito: TCurrencyField
      FieldName = 'LimiteDebito'
    end
    object cmCliFoto: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
    object cmCliIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object cmCliAlteradoEm: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object cmCliIncluidoPor: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object cmCliAlteradoPor: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object cmCliInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object cmCliTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
  end
  object cmCor: TnxTable
    Database = nxDB
    TableName = 'Cor'
    Left = 168
    Top = 80
    object cmCorTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object cmCorCor: TIntegerField
      FieldName = 'Cor'
    end
    object cmCorCorFonte: TIntegerField
      FieldName = 'CorFonte'
    end
    object cmCorDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object cmCorReinicia: TBooleanField
      FieldName = 'Reinicia'
    end
  end
  object cmCorP: TnxTable
    Database = nxDB
    TableName = 'CorPrecos'
    IndexName = 'IPrim'
    Left = 24
    Top = 136
    object cmCorPTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object cmCorPCor: TIntegerField
      FieldName = 'Cor'
    end
    object cmCorPPos: TWordField
      FieldName = 'Pos'
    end
    object cmCorPValor: TCurrencyField
      FieldName = 'Valor'
    end
    object cmCorPTempo: TDateTimeField
      FieldName = 'Tempo'
    end
    object cmCorPValorMin: TCurrencyField
      FieldName = 'ValorMin'
    end
    object cmCorPTolerancia: TDateTimeField
      FieldName = 'Tolerancia'
    end
  end
  object cmHPass: TnxTable
    Database = nxDB
    TableName = 'HistPass'
    IndexName = 'INumSeq'
    Left = 72
    Top = 136
    object cmHPassNumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object cmHPassPassaporte: TIntegerField
      FieldName = 'Passaporte'
    end
    object cmHPassTransacao: TIntegerField
      FieldName = 'Transacao'
    end
    object cmHPassDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object cmHPassSegundos: TIntegerField
      FieldName = 'Segundos'
    end
  end
  object MT: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Transacao'
        DataType = ftInteger
      end
      item
        Name = 'Sessao'
        DataType = ftInteger
      end>
    IndexFieldNames = 'Transacao'
    IndexName = 'MTIndex1'
    IndexDefs = <
      item
        Name = 'MTIndex1'
        Fields = 'Transacao'
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
    Left = 256
    Top = 48
    object MTTransacao: TIntegerField
      FieldName = 'Transacao'
    end
    object MTSessao: TIntegerField
      FieldName = 'Sessao'
    end
  end
  object cmHC: TnxTable
    Database = nxDB
    TableName = 'HoraCor'
    IndexName = 'IPrim'
    Left = 120
    Top = 136
    object cmHCTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object cmHCDia: TWordField
      FieldName = 'Dia'
    end
    object cmHCHora: TWordField
      FieldName = 'Hora'
    end
    object cmHCCor: TIntegerField
      FieldName = 'Cor'
    end
  end
  object cmImp: TnxTable
    Database = nxDB
    TableName = 'Impressao'
    IndexName = 'IIDSeq'
    Left = 168
    Top = 136
    object cmImpIDSeq: TAutoIncField
      FieldName = 'IDSeq'
    end
    object cmImpDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object cmImpComputador: TStringField
      FieldName = 'Computador'
      Size = 200
    end
    object cmImpMaquina: TWordField
      FieldName = 'Maquina'
    end
    object cmImpPaginas: TIntegerField
      FieldName = 'Paginas'
    end
    object cmImpImpressora: TStringField
      FieldName = 'Impressora'
      Size = 200
    end
    object cmImpDocumento: TMemoField
      FieldName = 'Documento'
      BlobType = ftMemo
    end
    object cmImpAcesso: TIntegerField
      FieldName = 'Acesso'
    end
    object cmImpResultado: TWordField
      FieldName = 'Resultado'
    end
  end
  object cmMaq: TnxTable
    Database = nxDB
    TableName = 'Maquina'
    IndexName = 'INumero'
    Left = 24
    Top = 192
    object cmMaqNumero: TWordField
      FieldName = 'Numero'
    end
    object cmMaqNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object cmMaqInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object cmMaqContato: TIntegerField
      FieldName = 'Contato'
    end
    object cmMaqTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object cmMaqNomeContato: TStringField
      FieldName = 'NomeContato'
      Size = 40
    end
    object cmMaqInicioTicks: TIntegerField
      FieldName = 'InicioTicks'
    end
    object cmMaqAcesso: TIntegerField
      FieldName = 'Acesso'
    end
    object cmMaqCreditoCli: TIntegerField
      FieldName = 'CreditoCli'
    end
    object cmMaqIsento: TBooleanField
      FieldName = 'Isento'
    end
    object cmMaqMenu: TMemoField
      FieldName = 'Menu'
      BlobType = ftMemo
    end
    object cmMaqRecursos: TMemoField
      FieldName = 'Recursos'
      BlobType = ftMemo
    end
    object cmMaqSinal: TCurrencyField
      FieldName = 'Sinal'
    end
    object cmMaqVendas: TCurrencyField
      FieldName = 'Vendas'
    end
    object cmMaqObsAcesso: TMemoField
      FieldName = 'ObsAcesso'
      BlobType = ftMemo
    end
    object cmMaqLimiteTempo: TIntegerField
      FieldName = 'LimiteTempo'
    end
    object cmMaqLiberaAlemPacote: TBooleanField
      FieldName = 'LiberaAlemPacote'
    end
    object cmMaqTicksParadoPac: TIntegerField
      FieldName = 'TicksParadoPac'
    end
    object cmMaqComputerName: TStringField
      FieldName = 'ComputerName'
      Size = 200
    end
    object cmMaqAguardaPagto: TBooleanField
      FieldName = 'AguardaPagto'
    end
    object cmMaqManutencao: TBooleanField
      FieldName = 'Manutencao'
    end
    object cmMaqCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object cmMaqUsuarioI: TStringField
      FieldName = 'UsuarioI'
      Size = 30
    end
    object cmMaqTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object cmMaqStrPassaportes: TMemoField
      FieldName = 'StrPassaportes'
      BlobType = ftMemo
    end
  end
  object cmPac: TnxTable
    Database = nxDB
    TableName = 'Pacote'
    IndexName = 'ICodigo'
    Left = 72
    Top = 192
    object cmPacCodigo: TWordField
      FieldName = 'Codigo'
    end
    object cmPacHoras: TWordField
      FieldName = 'Horas'
    end
    object cmPacValorTotal: TCurrencyField
      FieldName = 'ValorTotal'
    end
    object cmPacDescr: TStringField
      FieldName = 'Descr'
      Size = 30
    end
  end
  object cmProd: TnxTable
    Database = nxDB
    TableName = 'Produto'
    IndexName = 'ICodigo'
    Left = 120
    Top = 192
    object cmProdCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object cmProdDescricao: TStringField
      FieldName = 'Descricao'
      Size = 55
    end
    object cmProdUnid: TStringField
      FieldName = 'Unid'
      Size = 5
    end
    object cmProdPreco: TCurrencyField
      FieldName = 'Preco'
    end
    object cmProdObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object cmProdImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object cmProdCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object cmProdSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
    end
    object cmProdEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object cmProdCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object cmProdEstoqueACE: TFloatField
      FieldName = 'EstoqueACE'
    end
    object cmProdEstoqueACS: TFloatField
      FieldName = 'EstoqueACS'
    end
    object cmProdPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object cmProdNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
  end
  object cmTA: TnxTable
    Database = nxDB
    TableName = 'TipoAcesso'
    IndexName = 'ICodigo'
    Left = 168
    Top = 192
    object cmTACodigo: TWordField
      FieldName = 'Codigo'
    end
    object cmTANome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
  end
  object cmTPass: TnxTable
    Database = nxDB
    TableName = 'TipoPass'
    IndexName = 'ICodigo'
    Left = 24
    Top = 248
    object cmTPassCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object cmTPassNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object cmTPassValor: TCurrencyField
      FieldName = 'Valor'
    end
    object cmTPassTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object cmTPassTipoExp: TWordField
      FieldName = 'TipoExp'
    end
    object cmTPassExpirarEm: TDateTimeField
      FieldName = 'ExpirarEm'
    end
    object cmTPassMaxSegundos: TIntegerField
      FieldName = 'MaxSegundos'
    end
    object cmTPassObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object cmTPassDia1: TIntegerField
      FieldName = 'Dia1'
    end
    object cmTPassDia2: TIntegerField
      FieldName = 'Dia2'
    end
    object cmTPassDia3: TIntegerField
      FieldName = 'Dia3'
    end
    object cmTPassDia4: TIntegerField
      FieldName = 'Dia4'
    end
    object cmTPassDia5: TIntegerField
      FieldName = 'Dia5'
    end
    object cmTPassDia6: TIntegerField
      FieldName = 'Dia6'
    end
    object cmTPassDia7: TIntegerField
      FieldName = 'Dia7'
    end
  end
  object cmUsuario: TnxTable
    Database = nxDB
    TableName = 'Usuario'
    IndexName = 'IUsername'
    Left = 80
    Top = 248
    object cmUsuarioUsername: TStringField
      FieldName = 'Username'
    end
    object cmUsuarioNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object cmUsuarioAdmin: TBooleanField
      FieldName = 'Admin'
    end
    object cmUsuarioSenha: TStringField
      FieldName = 'Senha'
      Size = 30
    end
    object cmUsuarioGrupos: TMemoField
      FieldName = 'Grupos'
      BlobType = ftMemo
    end
    object cmUsuarioDireitos: TMemoField
      FieldName = 'Direitos'
      BlobType = ftMemo
    end
    object cmUsuarioMaxTempoManut: TIntegerField
      FieldName = 'MaxTempoManut'
    end
    object cmUsuarioMaxMaqManut: TIntegerField
      FieldName = 'MaxMaqManut'
    end
  end
  object mtTran: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Transacao'
        DataType = ftInteger
      end
      item
        Name = 'Tran'
        DataType = ftInteger
      end>
    IndexFieldNames = 'Transacao'
    IndexName = 'MTIndex1'
    IndexDefs = <
      item
        Name = 'MTIndex1'
        Fields = 'Transacao'
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
    Left = 256
    Top = 120
    object IntegerField10: TIntegerField
      FieldName = 'Transacao'
    end
    object mtTranTran: TIntegerField
      FieldName = 'Tran'
    end
  end
  object cmConfig: TnxTable
    Database = nxDB
    TableName = 'Config'
    IndexName = 'INumSeq'
    Left = 168
    Top = 248
    object cmConfigNumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object cmConfigModulos: TMemoField
      FieldName = 'Modulos'
      BlobType = ftMemo
    end
    object cmConfigTiposLancExtra: TMemoField
      FieldName = 'TiposLancExtra'
      BlobType = ftMemo
    end
    object cmConfigProgramasPermitidos: TMemoField
      FieldName = 'ProgramasPermitidos'
      BlobType = ftMemo
    end
    object cmConfigCMGuard: TMemoField
      FieldName = 'CMGuard'
      BlobType = ftMemo
    end
    object cmConfigJanelasExplorer: TMemoField
      FieldName = 'JanelasExplorer'
      BlobType = ftMemo
    end
    object cmConfigFecharProgramas: TBooleanField
      FieldName = 'FecharProgramas'
    end
    object cmConfigAutoExecutar: TStringField
      FieldName = 'AutoExecutar'
      Size = 200
    end
    object cmConfigLimiteTempoPadrao: TDateTimeField
      FieldName = 'LimiteTempoPadrao'
    end
    object cmConfigPacoteTempoReal: TBooleanField
      FieldName = 'PacoteTempoReal'
    end
    object cmConfigPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object cmConfigEncerramentoPrePago: TWordField
      FieldName = 'EncerramentoPrePago'
    end
    object cmConfigProdutoImpressao: TStringField
      FieldName = 'ProdutoImpressao'
      Size = 15
    end
    object cmConfigPermiteCapturaTela: TBooleanField
      FieldName = 'PermiteCapturaTela'
    end
    object cmConfigAlertaFimTempo: TDateTimeField
      FieldName = 'AlertaFimTempo'
    end
    object cmConfigVariosTiposAcesso: TBooleanField
      FieldName = 'VariosTiposAcesso'
    end
    object cmConfigModoPagtoAcesso: TWordField
      FieldName = 'ModoPagtoAcesso'
    end
    object cmConfigMostraPrePagoDec: TBooleanField
      FieldName = 'MostraPrePagoDec'
    end
    object cmConfigTempoMaxAlerta: TDateTimeField
      FieldName = 'TempoMaxAlerta'
    end
    object cmConfigMostraCliCadAntesAvulso: TBooleanField
      FieldName = 'MostraCliCadAntesAvulso'
    end
    object cmConfigAbre1: TDateTimeField
      FieldName = 'Abre1'
    end
    object cmConfigAbre2: TDateTimeField
      FieldName = 'Abre2'
    end
    object cmConfigAbre3: TDateTimeField
      FieldName = 'Abre3'
    end
    object cmConfigAbre4: TDateTimeField
      FieldName = 'Abre4'
    end
    object cmConfigAbre5: TDateTimeField
      FieldName = 'Abre5'
    end
    object cmConfigAbre6: TDateTimeField
      FieldName = 'Abre6'
    end
    object cmConfigAbre7: TDateTimeField
      FieldName = 'Abre7'
    end
    object cmConfigFecha1: TDateTimeField
      FieldName = 'Fecha1'
    end
    object cmConfigFecha2: TDateTimeField
      FieldName = 'Fecha2'
    end
    object cmConfigFecha3: TDateTimeField
      FieldName = 'Fecha3'
    end
    object cmConfigFecha4: TDateTimeField
      FieldName = 'Fecha4'
    end
    object cmConfigFecha5: TDateTimeField
      FieldName = 'Fecha5'
    end
    object cmConfigFecha6: TDateTimeField
      FieldName = 'Fecha6'
    end
    object cmConfigFecha7: TDateTimeField
      FieldName = 'Fecha7'
    end
    object cmConfigCorLivre: TIntegerField
      FieldName = 'CorLivre'
    end
    object cmConfigCorFLivre: TIntegerField
      FieldName = 'CorFLivre'
    end
    object cmConfigCorUsoPrePago: TIntegerField
      FieldName = 'CorUsoPrePago'
    end
    object cmConfigCorFUsoPrePago: TIntegerField
      FieldName = 'CorFUsoPrePago'
    end
    object cmConfigCorUsoPosPago: TIntegerField
      FieldName = 'CorUsoPosPago'
    end
    object cmConfigCorFUsoPosPago: TIntegerField
      FieldName = 'CorFUsoPosPago'
    end
    object cmConfigCorAguardaPagto: TIntegerField
      FieldName = 'CorAguardaPagto'
    end
    object cmConfigCorFAguardaPagto: TIntegerField
      FieldName = 'CorFAguardaPagto'
    end
    object cmConfigCorManutencao: TIntegerField
      FieldName = 'CorManutencao'
    end
    object cmConfigCorFManutencao: TIntegerField
      FieldName = 'CorFManutencao'
    end
    object cmConfigCorPausado: TIntegerField
      FieldName = 'CorPausado'
    end
    object cmConfigCorFPausado: TIntegerField
      FieldName = 'CorFPausado'
    end
    object cmConfigCorDesktop: TIntegerField
      FieldName = 'CorDesktop'
    end
    object cmConfigCorFDesktop: TIntegerField
      FieldName = 'CorFDesktop'
    end
    object cmConfigCampoLocalizaCli: TWordField
      FieldName = 'CampoLocalizaCli'
    end
    object cmConfigManterSaldoCaixa: TBooleanField
      FieldName = 'ManterSaldoCaixa'
    end
    object cmConfigNaoMostrarMsgDebito: TBooleanField
      FieldName = 'NaoMostrarMsgDebito'
    end
    object cmConfigTolerancia: TDateTimeField
      FieldName = 'Tolerancia'
    end
    object cmConfigRegImp98: TBooleanField
      FieldName = 'RegImp98'
    end
    object cmConfigLimitePadraoDebito: TCurrencyField
      FieldName = 'LimitePadraoDebito'
    end
    object cmConfigPortaImpRec: TStringField
      FieldName = 'PortaImpRec'
      Size = 10
    end
    object cmConfigSaltoImpRec: TWordField
      FieldName = 'SaltoImpRec'
    end
    object cmConfigLargImpRec: TWordField
      FieldName = 'LargImpRec'
    end
    object cmConfigCabecalhoImpRec: TMemoField
      FieldName = 'CabecalhoImpRec'
      BlobType = ftMemo
    end
    object cmConfigRodapeImpRec: TMemoField
      FieldName = 'RodapeImpRec'
      BlobType = ftMemo
    end
    object cmConfigImprimirImpRec: TBooleanField
      FieldName = 'ImprimirImpRec'
    end
    object cmConfigMostraProgAtual: TBooleanField
      FieldName = 'MostraProgAtual'
    end
    object cmConfigMostraObs: TBooleanField
      FieldName = 'MostraObs'
    end
    object cmConfigEscondeTextoBotoes: TBooleanField
      FieldName = 'EscondeTextoBotoes'
    end
    object cmConfigEscondeTipoAcesso: TBooleanField
      FieldName = 'EscondeTipoAcesso'
    end
    object cmConfigExigirRG: TBooleanField
      FieldName = 'ExigirRG'
    end
    object cmConfigDesativaRegAutImp: TBooleanField
      FieldName = 'DesativaRegAutImp'
    end
    object cmConfigTipoFDesktop: TStringField
      FieldName = 'TipoFDesktop'
      Size = 3
    end
    object cmConfigTipoFLogin: TStringField
      FieldName = 'TipoFLogin'
      Size = 3
    end
    object cmConfigNumFDesktop: TIntegerField
      FieldName = 'NumFDesktop'
    end
    object cmConfigNumFLogin: TIntegerField
      FieldName = 'NumFLogin'
    end
    object cmConfigMostrarApenasPIN: TBooleanField
      FieldName = 'MostrarApenasPIN'
    end
    object cmConfigTextoPIN: TStringField
      FieldName = 'TextoPIN'
      Size = 30
    end
    object cmConfigAlterarSenhaCli: TBooleanField
      FieldName = 'AlterarSenhaCli'
    end
    object cmConfigVerSenhaCli: TBooleanField
      FieldName = 'VerSenhaCli'
    end
  end
  object cmTran: TnxTable
    Database = nxDB
    TableName = 'Transacao'
    IndexName = 'INumero'
    Left = 24
    Top = 304
    object cmTranNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object cmTranCaixaI: TIntegerField
      FieldName = 'CaixaI'
    end
    object cmTranCaixaF: TIntegerField
      FieldName = 'CaixaF'
    end
    object cmTranCaixaP: TIntegerField
      FieldName = 'CaixaP'
    end
    object cmTranTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object cmTranInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object cmTranFim: TDateTimeField
      FieldName = 'Fim'
    end
    object cmTranDataPagto: TDateTimeField
      FieldName = 'DataPagto'
    end
    object cmTranContato: TIntegerField
      FieldName = 'Contato'
    end
    object cmTranNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object cmTranMaquina: TWordField
      FieldName = 'Maquina'
    end
    object cmTranTipo: TWordField
      FieldName = 'Tipo'
    end
    object cmTranFuncI: TStringField
      FieldName = 'FuncI'
      Size = 10
    end
    object cmTranFuncF: TStringField
      FieldName = 'FuncF'
      Size = 40
    end
    object cmTranTempo: TDateTimeField
      FieldName = 'Tempo'
    end
    object cmTranTempoCobrado: TDateTimeField
      FieldName = 'TempoCobrado'
    end
    object cmTranCredUsado: TIntegerField
      FieldName = 'CredUsado'
    end
    object cmTranCredAnterior: TIntegerField
      FieldName = 'CredAnterior'
    end
    object cmTranDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object cmTranProdutos: TCurrencyField
      FieldName = 'Produtos'
    end
    object cmTranValor: TCurrencyField
      FieldName = 'Valor'
    end
    object cmTranObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object cmTranIsento: TBooleanField
      FieldName = 'Isento'
    end
    object cmTranNaoUsarPacote: TBooleanField
      FieldName = 'NaoUsarPacote'
    end
    object cmTranCodPacote: TWordField
      FieldName = 'CodPacote'
    end
    object cmTranSinal: TCurrencyField
      FieldName = 'Sinal'
    end
    object cmTranTransacaoVinculada: TIntegerField
      FieldName = 'TransacaoVinculada'
    end
    object cmTranValorFinalAcesso: TCurrencyField
      FieldName = 'ValorFinalAcesso'
    end
    object cmTranDescontoProduto: TCurrencyField
      FieldName = 'DescontoProduto'
    end
    object cmTranNumDoc: TStringField
      FieldName = 'NumDoc'
      Size = 15
    end
    object cmTranStatusPagto: TWordField
      FieldName = 'StatusPagto'
    end
    object cmTranT0: TFloatField
      FieldName = 'T0'
    end
    object cmTranT1: TFloatField
      FieldName = 'T1'
    end
    object cmTranT2: TFloatField
      FieldName = 'T2'
    end
    object cmTranT3: TFloatField
      FieldName = 'T3'
    end
    object cmTranT4: TFloatField
      FieldName = 'T4'
    end
    object cmTranT5: TFloatField
      FieldName = 'T5'
    end
    object cmTranT6: TFloatField
      FieldName = 'T6'
    end
    object cmTranT7: TFloatField
      FieldName = 'T7'
    end
    object cmTranT8: TFloatField
      FieldName = 'T8'
    end
    object cmTranT9: TFloatField
      FieldName = 'T9'
    end
    object cmTranT10: TFloatField
      FieldName = 'T10'
    end
    object cmTranT11: TFloatField
      FieldName = 'T11'
    end
    object cmTranT12: TFloatField
      FieldName = 'T12'
    end
    object cmTranT13: TFloatField
      FieldName = 'T13'
    end
    object cmTranT14: TFloatField
      FieldName = 'T14'
    end
    object cmTranT15: TFloatField
      FieldName = 'T15'
    end
    object cmTranT16: TFloatField
      FieldName = 'T16'
    end
    object cmTranT17: TFloatField
      FieldName = 'T17'
    end
    object cmTranT18: TFloatField
      FieldName = 'T18'
    end
    object cmTranT19: TFloatField
      FieldName = 'T19'
    end
    object cmTranT20: TFloatField
      FieldName = 'T20'
    end
    object cmTranT21: TFloatField
      FieldName = 'T21'
    end
    object cmTranT22: TFloatField
      FieldName = 'T22'
    end
    object cmTranT23: TFloatField
      FieldName = 'T23'
    end
  end
  object cmPass: TnxTable
    Database = nxDB
    TableName = 'Passaporte'
    IndexName = 'INumero'
    Left = 80
    Top = 304
    object cmPassNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object cmPassTipoPass: TIntegerField
      FieldName = 'TipoPass'
    end
    object cmPassCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object cmPassExpirou: TBooleanField
      FieldName = 'Expirou'
    end
    object cmPassSenha: TStringField
      FieldName = 'Senha'
    end
    object cmPassPrimeiroUso: TDateTimeField
      FieldName = 'PrimeiroUso'
    end
    object cmPassTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object cmPassTipoExp: TWordField
      FieldName = 'TipoExp'
    end
    object cmPassExpirarEm: TDateTimeField
      FieldName = 'ExpirarEm'
    end
    object cmPassMaxSegundos: TIntegerField
      FieldName = 'MaxSegundos'
    end
    object cmPassSegundos: TIntegerField
      FieldName = 'Segundos'
    end
    object cmPassAcessos: TIntegerField
      FieldName = 'Acessos'
    end
    object cmPassDia1: TIntegerField
      FieldName = 'Dia1'
    end
    object cmPassDia2: TIntegerField
      FieldName = 'Dia2'
    end
    object cmPassDia3: TIntegerField
      FieldName = 'Dia3'
    end
    object cmPassDia4: TIntegerField
      FieldName = 'Dia4'
    end
    object cmPassDia5: TIntegerField
      FieldName = 'Dia5'
    end
    object cmPassDia6: TIntegerField
      FieldName = 'Dia6'
    end
    object cmPassDia7: TIntegerField
      FieldName = 'Dia7'
    end
    object cmPassTransacao: TIntegerField
      FieldName = 'Transacao'
    end
    object cmPassDataCompra: TDateTimeField
      FieldName = 'DataCompra'
    end
    object cmPassValido: TBooleanField
      FieldName = 'Valido'
    end
    object cmPassValor: TCurrencyField
      FieldName = 'Valor'
    end
  end
  object cmMovEst: TnxTable
    Database = nxDB
    TableName = 'MovEst'
    IndexName = 'ITranItem'
    Left = 136
    Top = 304
    object cmMovEstNumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object cmMovEstTransacao: TIntegerField
      FieldName = 'Transacao'
    end
    object cmMovEstProduto: TStringField
      FieldName = 'Produto'
      Size = 15
    end
    object cmMovEstQuant: TFloatField
      FieldName = 'Quant'
    end
    object cmMovEstUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object cmMovEstTotal: TCurrencyField
      FieldName = 'Total'
    end
    object cmMovEstCustoU: TCurrencyField
      FieldName = 'CustoU'
    end
    object cmMovEstItem: TWordField
      FieldName = 'Item'
    end
    object cmMovEstDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object cmMovEstDataMov: TDateTimeField
      FieldName = 'DataMov'
    end
    object cmMovEstDataPag: TDateTimeField
      FieldName = 'DataPag'
    end
    object cmMovEstEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object cmMovEstCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object cmMovEstEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object cmMovEstTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object cmMovEstContato: TIntegerField
      FieldName = 'Contato'
    end
    object cmMovEstCaixaMov: TIntegerField
      FieldName = 'CaixaMov'
    end
    object cmMovEstCaixaPag: TIntegerField
      FieldName = 'CaixaPag'
    end
    object cmMovEstCategoria: TStringField
      FieldName = 'Categoria'
    end
  end
  object cmAux: TnxTable
    Database = nxDB
    TableName = 'Transacao'
    IndexName = 'ITransacaoVinculada'
    Left = 256
    Top = 240
    object cmAuxNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object cmAuxCaixaI: TIntegerField
      FieldName = 'CaixaI'
    end
    object cmAuxCaixaF: TIntegerField
      FieldName = 'CaixaF'
    end
    object cmAuxCaixaP: TIntegerField
      FieldName = 'CaixaP'
    end
    object cmAuxTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object cmAuxInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object cmAuxFim: TDateTimeField
      FieldName = 'Fim'
    end
    object cmAuxDataPagto: TDateTimeField
      FieldName = 'DataPagto'
    end
    object cmAuxContato: TIntegerField
      FieldName = 'Contato'
    end
    object cmAuxNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object cmAuxMaquina: TWordField
      FieldName = 'Maquina'
    end
    object cmAuxTipo: TWordField
      FieldName = 'Tipo'
    end
    object cmAuxFuncI: TStringField
      FieldName = 'FuncI'
      Size = 10
    end
    object cmAuxFuncF: TStringField
      FieldName = 'FuncF'
      Size = 40
    end
    object cmAuxTempo: TDateTimeField
      FieldName = 'Tempo'
    end
    object cmAuxTempoCobrado: TDateTimeField
      FieldName = 'TempoCobrado'
    end
    object cmAuxCredUsado: TIntegerField
      FieldName = 'CredUsado'
    end
    object cmAuxCredAnterior: TIntegerField
      FieldName = 'CredAnterior'
    end
    object cmAuxDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object cmAuxProdutos: TCurrencyField
      FieldName = 'Produtos'
    end
    object cmAuxValor: TCurrencyField
      FieldName = 'Valor'
    end
    object cmAuxObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object cmAuxIsento: TBooleanField
      FieldName = 'Isento'
    end
    object cmAuxNaoUsarPacote: TBooleanField
      FieldName = 'NaoUsarPacote'
    end
    object cmAuxCodPacote: TWordField
      FieldName = 'CodPacote'
    end
    object cmAuxSinal: TCurrencyField
      FieldName = 'Sinal'
    end
    object cmAuxTransacaoVinculada: TIntegerField
      FieldName = 'TransacaoVinculada'
    end
    object cmAuxValorFinalAcesso: TCurrencyField
      FieldName = 'ValorFinalAcesso'
    end
    object cmAuxDescontoProduto: TCurrencyField
      FieldName = 'DescontoProduto'
    end
    object cmAuxNumDoc: TStringField
      FieldName = 'NumDoc'
      Size = 15
    end
    object cmAuxStatusPagto: TWordField
      FieldName = 'StatusPagto'
    end
    object cmAuxT0: TFloatField
      FieldName = 'T0'
    end
    object cmAuxT1: TFloatField
      FieldName = 'T1'
    end
    object cmAuxT2: TFloatField
      FieldName = 'T2'
    end
    object cmAuxT3: TFloatField
      FieldName = 'T3'
    end
    object cmAuxT4: TFloatField
      FieldName = 'T4'
    end
    object cmAuxT5: TFloatField
      FieldName = 'T5'
    end
    object cmAuxT6: TFloatField
      FieldName = 'T6'
    end
    object cmAuxT7: TFloatField
      FieldName = 'T7'
    end
    object cmAuxT8: TFloatField
      FieldName = 'T8'
    end
    object cmAuxT9: TFloatField
      FieldName = 'T9'
    end
    object cmAuxT10: TFloatField
      FieldName = 'T10'
    end
    object cmAuxT11: TFloatField
      FieldName = 'T11'
    end
    object cmAuxT12: TFloatField
      FieldName = 'T12'
    end
    object cmAuxT13: TFloatField
      FieldName = 'T13'
    end
    object cmAuxT14: TFloatField
      FieldName = 'T14'
    end
    object cmAuxT15: TFloatField
      FieldName = 'T15'
    end
    object cmAuxT16: TFloatField
      FieldName = 'T16'
    end
    object cmAuxT17: TFloatField
      FieldName = 'T17'
    end
    object cmAuxT18: TFloatField
      FieldName = 'T18'
    end
    object cmAuxT19: TFloatField
      FieldName = 'T19'
    end
    object cmAuxT20: TFloatField
      FieldName = 'T20'
    end
    object cmAuxT21: TFloatField
      FieldName = 'T21'
    end
    object cmAuxT22: TFloatField
      FieldName = 'T22'
    end
    object cmAuxT23: TFloatField
      FieldName = 'T23'
    end
  end
  object mtItem: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Transacao'
        DataType = ftInteger
      end
      item
        Name = 'ItemID'
        DataType = ftInteger
      end
      item
        Name = 'Tipo'
        DataType = ftInteger
      end>
    IndexFieldNames = 'Transacao'
    IndexName = 'MTIndex1'
    IndexDefs = <
      item
        Name = 'MTIndex1'
        Fields = 'Transacao'
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
    Left = 256
    Top = 184
    object mtItemTransacao: TIntegerField
      FieldName = 'Transacao'
    end
    object mtItemItemID: TIntegerField
      FieldName = 'ItemID'
    end
    object mtItemTipo: TIntegerField
      FieldName = 'Tipo'
    end
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    MaxBytesPerSecond = 0
    PingTime = 0
    Port = 16100
    Left = 24
    Top = 16
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCP
    Left = 72
    Top = 16
  end
  object Q: TnxQuery
    Database = nxDB
    Timeout = 240000
    OnCalcFields = QCalcFields
    SQL.Strings = (
      
        'select contato, sum(valorfinalacesso) acesso, sum(produtos) prod' +
        ', sum(descontoproduto) descprod from transacao'
      'where (statuspagto=3) and ((caixap=0) or (caixap is null))'
      'group by contato')
    Left = 216
    Top = 312
    object Qcontato: TIntegerField
      FieldName = 'contato'
    end
    object Qacesso: TCurrencyField
      FieldName = 'acesso'
    end
    object Qprod: TCurrencyField
      FieldName = 'prod'
    end
    object Qdescprod: TCurrencyField
      FieldName = 'descprod'
    end
    object Qtotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'total'
      Calculated = True
    end
  end
end
