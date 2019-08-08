object Dados: TDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 568
  Width = 802
  object Session: TnxSession
    ActiveDesigntime = True
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = RSE
    Left = 336
    Top = 72
  end
  object db: TnxDatabase
    ActiveDesigntime = True
    Session = Session
    AliasName = 'nexcafe'
    FailSafe = True
    Left = 424
    Top = 72
  end
  object tbCli: TnxTable
    Database = db
    Timeout = 10000
    FilterOptions = [foCaseInsensitive]
    TableName = 'Cliente'
    IndexName = 'IID'
    Left = 88
    Top = 8
    object tbCliNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tbCliEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object tbCliBairro: TStringField
      FieldName = 'Bairro'
    end
    object tbCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object tbCliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tbCliCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tbCliSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tbCliObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tbCliCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object tbCliRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object tbCliTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object tbCliEmail: TMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object tbCliIsento: TBooleanField
      FieldName = 'Isento'
    end
    object tbCliUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object tbCliSenha: TStringField
      FieldName = 'Senha'
    end
    object tbCliUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object tbCliDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tbCliEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object tbCliNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object tbCliDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object tbCliCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object tbCliTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
    object tbCliTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
    object tbCliAlteradoEm: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object tbCliIncluidoPor: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object tbCliAlteradoPor: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object tbCliIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object tbCliPai: TStringField
      FieldName = 'Pai'
      Size = 40
    end
    object tbCliMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object tbCliEscolaHI: TDateTimeField
      FieldName = 'EscolaHI'
    end
    object tbCliEscolaHF: TDateTimeField
      FieldName = 'EscolaHF'
    end
    object tbCliInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tbCliLimiteDebito: TCurrencyField
      FieldName = 'LimiteDebito'
    end
    object tbCliFoto: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
    object tbCliID: TAutoIncField
      FieldName = 'ID'
    end
    object tbCliMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object tbCliMinutosUsados: TFloatField
      FieldName = 'MinutosUsados'
    end
    object tbCliMinutosIniciais: TFloatField
      FieldName = 'MinutosIniciais'
    end
    object tbCliValorCred: TCurrencyField
      FieldName = 'ValorCred'
    end
    object tbCliHP1: TIntegerField
      FieldName = 'HP1'
    end
    object tbCliHP2: TIntegerField
      FieldName = 'HP2'
    end
    object tbCliHP3: TIntegerField
      FieldName = 'HP3'
    end
    object tbCliHP4: TIntegerField
      FieldName = 'HP4'
    end
    object tbCliHP5: TIntegerField
      FieldName = 'HP5'
    end
    object tbCliHP6: TIntegerField
      FieldName = 'HP6'
    end
    object tbCliHP7: TIntegerField
      FieldName = 'HP7'
    end
    object tbCliNaoGuardarCredito: TBooleanField
      FieldName = 'NaoGuardarCredito'
    end
    object tbCliPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object tbCliPassaportes: TFloatField
      FieldName = 'Passaportes'
    end
    object tbCliTitEleitor: TStringField
      FieldName = 'TitEleitor'
      Size = 13
    end
    object tbCliFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object tbCliFidTotal: TFloatField
      FieldName = 'FidTotal'
    end
    object tbCliFidResg: TFloatField
      FieldName = 'FidResg'
    end
    object tbCliAniversario: TStringField
      FieldName = 'Aniversario'
      Size = 4
    end
    object tbCliCotaImpEspecial: TBooleanField
      FieldName = 'CotaImpEspecial'
    end
    object tbCliCotaImpDia: TIntegerField
      FieldName = 'CotaImpDia'
    end
    object tbCliCotaImpMes: TIntegerField
      FieldName = 'CotaImpMes'
    end
    object tbCliSemFidelidade: TBooleanField
      FieldName = 'SemFidelidade'
    end
    object tbCliCHorario: TIntegerField
      FieldName = 'CHorario'
    end
    object tbCliOpCHorario: TWordField
      FieldName = 'OpCHorario'
    end
    object tbCliFornecedor: TBooleanField
      FieldName = 'Fornecedor'
    end
  end
  object tbPro: TnxTable
    Database = db
    Timeout = 10000
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    OnCalcFields = tbProCalcFields
    TableName = 'Produto'
    IndexName = 'IID'
    Left = 144
    Top = 8
    object tbProUnid: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'Unid'
      Size = 5
    end
    object tbProPreco: TCurrencyField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'Preco'
    end
    object tbProObs: TMemoField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tbProImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object tbProEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object tbProCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object tbProEstoqueACE: TFloatField
      FieldName = 'EstoqueACE'
    end
    object tbProEstoqueACS: TFloatField
      FieldName = 'EstoqueACS'
    end
    object tbProEstoqueFinal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'EstoqueFinal'
      Calculated = True
    end
    object tbProDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object tbProCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object tbProSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
    end
    object tbProPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object tbProPermiteVendaFracionada: TBooleanField
      FieldName = 'PermiteVendaFracionada'
    end
    object tbProNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tbProID: TAutoIncField
      FieldName = 'ID'
    end
    object tbProFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
    object tbProFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object tbProFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object tbProEstoqueMin: TFloatField
      FieldName = 'EstoqueMin'
    end
    object tbProEstoqueMax: TFloatField
      FieldName = 'EstoqueMax'
    end
    object tbProAbaixoMin: TBooleanField
      FieldName = 'AbaixoMin'
    end
    object tbProAbaixoMinDesde: TDateTimeField
      FieldName = 'AbaixoMinDesde'
    end
    object tbProEstoqueRepor: TFloatField
      FieldName = 'EstoqueRepor'
    end
    object tbProplus: TBooleanField
      FieldName = 'plus'
    end
    object tbProplusURL: TnxMemoField
      FieldName = 'plusURL'
      BlobType = ftMemo
    end
    object tbProplusCodParceiro: TStringField
      FieldName = 'plusCodParceiro'
      Size = 15
    end
    object tbProplusCodProduto: TStringField
      FieldName = 'plusCodProduto'
      Size = 15
    end
    object tbProAtivo: TBooleanField
      FieldName = 'Ativo'
    end
    object tbPromd5Imagem: TStringField
      FieldName = 'md5Imagem'
      Size = 32
    end
    object tbProlastProdModif: TDateTimeField
      FieldName = 'lastProdModif'
    end
    object tbProuploadR: TWordField
      FieldName = 'uploadR'
    end
    object tbProuploadS: TWordField
      FieldName = 'uploadS'
    end
    object tbProfk_produ: TIntegerField
      FieldName = 'fk_produ'
    end
    object tbProbatchUID: TGuidField
      FieldName = 'batchUID'
      Size = 38
    end
    object tbProCadastroRapido: TBooleanField
      FieldName = 'CadastroRapido'
    end
    object tbProIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object tbProPrecoAuto: TBooleanField
      FieldName = 'PrecoAuto'
    end
    object tbProMargem: TFloatField
      FieldName = 'Margem'
    end
    object tbProCodigo: TStringField
      FieldName = 'Codigo'
      Size = 30
    end
    object tbProComissaoPerc: TFloatField
      FieldName = 'ComissaoPerc'
    end
    object tbProComissaoLucro: TBooleanField
      FieldName = 'ComissaoLucro'
    end
  end
  object tbTran: TnxTable
    Database = db
    Timeout = 10000
    TableName = 'Tran'
    IndexName = 'IID'
    Left = 192
    Top = 64
    object tbTranID: TAutoIncField
      FieldName = 'ID'
    end
    object tbTranDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tbTranCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tbTranTipo: TWordField
      FieldName = 'Tipo'
    end
    object tbTranFunc: TStringField
      FieldName = 'Func'
    end
    object tbTranTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tbTranDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tbTranPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tbTranObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tbTranCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tbTranCanceladoPor: TStringField
      FieldName = 'CanceladoPor'
      Size = 30
    end
    object tbTranCanceladoEm: TDateTimeField
      FieldName = 'CanceladoEm'
    end
    object tbTranCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tbTranMaq: TWordField
      FieldName = 'Maq'
    end
    object tbTranNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object tbTranSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tbTranDescr: TStringField
      FieldName = 'Descr'
      Size = 50
    end
    object tbTranDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tbTranQtdTempo: TFloatField
      FieldName = 'QtdTempo'
    end
    object tbTranFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object tbTranTotLiq: TCurrencyField
      FieldName = 'TotLiq'
    end
    object tbTranplusID: TGuidField
      FieldName = 'plusID'
      Size = 38
    end
    object tbTranplusTran: TBooleanField
      FieldName = 'plusTran'
    end
    object tbTranDebitoAnt: TCurrencyField
      FieldName = 'DebitoAnt'
    end
    object tbTranDebitoPago: TCurrencyField
      FieldName = 'DebitoPago'
    end
    object tbTranCreditoAnt: TCurrencyField
      FieldName = 'CreditoAnt'
    end
    object tbTranCredito: TCurrencyField
      FieldName = 'Credito'
    end
    object tbTranCreditoUsado: TCurrencyField
      FieldName = 'CreditoUsado'
    end
    object tbTranCredValor: TBooleanField
      FieldName = 'CredValor'
    end
    object tbTranTroco: TCurrencyField
      FieldName = 'Troco'
    end
    object tbTranPagFunc: TStringField
      FieldName = 'PagFunc'
    end
    object tbTranPagPend: TBooleanField
      FieldName = 'PagPend'
    end
    object tbTranCaixaPag: TIntegerField
      FieldName = 'CaixaPag'
    end
    object tbTranDescPerc: TFloatField
      FieldName = 'DescPerc'
    end
    object tbTranDescPorPerc: TBooleanField
      FieldName = 'DescPorPerc'
    end
    object tbTranTipoPag: TWordField
      FieldName = 'TipoPag'
    end
    object tbTranRecVer: TIntegerField
      FieldName = 'RecVer'
    end
  end
  object tbMovEst: TnxTable
    Database = db
    Timeout = 10000
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    TableName = 'MovEst'
    IndexName = 'ITranItem'
    Left = 256
    Top = 8
    object tbMovEstID: TAutoIncField
      FieldName = 'ID'
    end
    object tbMovEstTran: TIntegerField
      FieldName = 'Tran'
    end
    object tbMovEstProduto: TIntegerField
      FieldName = 'Produto'
    end
    object tbMovEstQuant: TFloatField
      FieldName = 'Quant'
    end
    object tbMovEstUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tbMovEstTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tbMovEstCustoU: TCurrencyField
      FieldName = 'CustoU'
    end
    object tbMovEstItem: TWordField
      FieldName = 'Item'
    end
    object tbMovEstDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tbMovEstPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tbMovEstDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tbMovEstEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tbMovEstCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tbMovEstEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object tbMovEstTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object tbMovEstCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tbMovEstCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tbMovEstCategoria: TStringField
      FieldName = 'Categoria'
    end
    object tbMovEstNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tbMovEstPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tbMovEstDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tbMovEstITran: TIntegerField
      FieldName = 'ITran'
    end
    object tbMovEstSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tbMovEstFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object tbMovEstFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object tbMovEstplusID: TGuidField
      FieldName = 'plusID'
      Size = 38
    end
    object tbMovEstplusTran: TBooleanField
      FieldName = 'plusTran'
    end
    object tbMovEstPermSemEstoque: TBooleanField
      FieldName = 'PermSemEstoque'
    end
    object tbMovEstRecVer: TIntegerField
      FieldName = 'RecVer'
    end
    object tbMovEstComissao: TCurrencyField
      FieldName = 'Comissao'
    end
    object tbMovEstComissaoPerc: TFloatField
      FieldName = 'ComissaoPerc'
    end
    object tbMovEstComissaoLucro: TBooleanField
      FieldName = 'ComissaoLucro'
    end
  end
  object tbConfig: TnxTable
    Database = db
    Timeout = 10000
    TableName = 'Config'
    Left = 248
    Top = 240
    object tbConfigNumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object tbConfigFecharProgramas: TBooleanField
      FieldName = 'FecharProgramas'
    end
    object tbConfigAutoExecutar: TStringField
      FieldName = 'AutoExecutar'
      Size = 200
    end
    object tbConfigLimiteTempoPadrao: TDateTimeField
      FieldName = 'LimiteTempoPadrao'
    end
    object tbConfigPacoteTempoReal: TBooleanField
      FieldName = 'PacoteTempoReal'
    end
    object tbConfigPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object tbConfigEncerramentoPrePago: TWordField
      FieldName = 'EncerramentoPrePago'
    end
    object tbConfigPermiteCapturaTela: TBooleanField
      FieldName = 'PermiteCapturaTela'
    end
    object tbConfigVariosTiposAcesso: TBooleanField
      FieldName = 'VariosTiposAcesso'
    end
    object tbConfigModoPagtoAcesso: TWordField
      FieldName = 'ModoPagtoAcesso'
    end
    object tbConfigMostraPrePagoDec: TBooleanField
      FieldName = 'MostraPrePagoDec'
    end
    object tbConfigTempoMaxAlerta: TDateTimeField
      FieldName = 'TempoMaxAlerta'
    end
    object tbConfigAbre1: TDateTimeField
      FieldName = 'Abre1'
    end
    object tbConfigAbre2: TDateTimeField
      FieldName = 'Abre2'
    end
    object tbConfigAbre3: TDateTimeField
      FieldName = 'Abre3'
    end
    object tbConfigAbre4: TDateTimeField
      FieldName = 'Abre4'
    end
    object tbConfigAbre5: TDateTimeField
      FieldName = 'Abre5'
    end
    object tbConfigAbre6: TDateTimeField
      FieldName = 'Abre6'
    end
    object tbConfigAbre7: TDateTimeField
      FieldName = 'Abre7'
    end
    object tbConfigFecha1: TDateTimeField
      FieldName = 'Fecha1'
    end
    object tbConfigFecha2: TDateTimeField
      FieldName = 'Fecha2'
    end
    object tbConfigFecha3: TDateTimeField
      FieldName = 'Fecha3'
    end
    object tbConfigFecha4: TDateTimeField
      FieldName = 'Fecha4'
    end
    object tbConfigFecha5: TDateTimeField
      FieldName = 'Fecha5'
    end
    object tbConfigFecha6: TDateTimeField
      FieldName = 'Fecha6'
    end
    object tbConfigFecha7: TDateTimeField
      FieldName = 'Fecha7'
    end
    object tbConfigCorLivre: TIntegerField
      FieldName = 'CorLivre'
    end
    object tbConfigCorFLivre: TIntegerField
      FieldName = 'CorFLivre'
    end
    object tbConfigCorUsoPrePago: TIntegerField
      FieldName = 'CorUsoPrePago'
    end
    object tbConfigCorFUsoPrePago: TIntegerField
      FieldName = 'CorFUsoPrePago'
    end
    object tbConfigCorUsoPosPago: TIntegerField
      FieldName = 'CorUsoPosPago'
    end
    object tbConfigCorFUsoPosPago: TIntegerField
      FieldName = 'CorFUsoPosPago'
    end
    object tbConfigCorAguardaPagto: TIntegerField
      FieldName = 'CorAguardaPagto'
    end
    object tbConfigCorFAguardaPagto: TIntegerField
      FieldName = 'CorFAguardaPagto'
    end
    object tbConfigCorManutencao: TIntegerField
      FieldName = 'CorManutencao'
    end
    object tbConfigCorFManutencao: TIntegerField
      FieldName = 'CorFManutencao'
    end
    object tbConfigCorPausado: TIntegerField
      FieldName = 'CorPausado'
    end
    object tbConfigCorFPausado: TIntegerField
      FieldName = 'CorFPausado'
    end
    object tbConfigCorDesktop: TIntegerField
      FieldName = 'CorDesktop'
    end
    object tbConfigCorFDesktop: TIntegerField
      FieldName = 'CorFDesktop'
    end
    object tbConfigCampoLocalizaCli: TWordField
      FieldName = 'CampoLocalizaCli'
    end
    object tbConfigManterSaldoCaixa: TBooleanField
      FieldName = 'ManterSaldoCaixa'
    end
    object tbConfigNaoMostrarMsgDebito: TBooleanField
      FieldName = 'NaoMostrarMsgDebito'
    end
    object tbConfigTolerancia: TDateTimeField
      FieldName = 'Tolerancia'
    end
    object tbConfigRegImp98: TBooleanField
      FieldName = 'RegImp98'
    end
    object tbConfigLimitePadraoDebito: TCurrencyField
      FieldName = 'LimitePadraoDebito'
    end
    object tbConfigRecPorta: TStringField
      DisplayWidth = 100
      FieldName = 'RecPorta'
      Size = 100
    end
    object tbConfigRecSalto: TWordField
      FieldName = 'RecSalto'
    end
    object tbConfigRecLargura: TWordField
      FieldName = 'RecLargura'
    end
    object tbConfigRecRodape: TMemoField
      FieldName = 'RecRodape'
      BlobType = ftMemo
    end
    object tbConfigRecImprimir: TWordField
      FieldName = 'RecImprimir'
    end
    object tbConfigRecMatricial: TBooleanField
      FieldName = 'RecMatricial'
    end
    object tbConfigRecNomeLoja: TStringField
      FieldName = 'RecNomeLoja'
      Size = 40
    end
    object tbConfigMostraProgAtual: TBooleanField
      FieldName = 'MostraProgAtual'
    end
    object tbConfigMostraObs: TBooleanField
      FieldName = 'MostraObs'
    end
    object tbConfigEscondeTextoBotoes: TBooleanField
      FieldName = 'EscondeTextoBotoes'
    end
    object tbConfigEscondeTipoAcesso: TBooleanField
      FieldName = 'EscondeTipoAcesso'
    end
    object tbConfigExigirRG: TBooleanField
      FieldName = 'ExigirRG'
    end
    object tbConfigTipoFDesktop: TStringField
      FieldName = 'TipoFDesktop'
      Size = 3
    end
    object tbConfigTipoFLogin: TStringField
      FieldName = 'TipoFLogin'
      Size = 3
    end
    object tbConfigNumFDesktop: TIntegerField
      FieldName = 'NumFDesktop'
    end
    object tbConfigNumFLogin: TIntegerField
      FieldName = 'NumFLogin'
    end
    object tbConfigMostrarApenasPIN: TBooleanField
      FieldName = 'MostrarApenasPIN'
    end
    object tbConfigTextoPIN: TStringField
      FieldName = 'TextoPIN'
      Size = 30
    end
    object tbConfigAlterarSenhaCli: TBooleanField
      FieldName = 'AlterarSenhaCli'
    end
    object tbConfigVerSenhaCli: TBooleanField
      FieldName = 'VerSenhaCli'
    end
    object tbConfigCliCadPadrao: TBooleanField
      FieldName = 'CliCadPadrao'
    end
    object tbConfigControlaImp: TWordField
      FieldName = 'ControlaImp'
    end
    object tbConfigFiltrarWEB: TBooleanField
      FieldName = 'FiltrarWEB'
    end
    object tbConfigSiteRedirFiltro: TStringField
      FieldName = 'SiteRedirFiltro'
      Size = 80
    end
    object tbConfigBloqDownload: TBooleanField
      FieldName = 'BloqDownload'
    end
    object tbConfigBloqMenuIniciar: TBooleanField
      FieldName = 'BloqMenuIniciar'
    end
    object tbConfigBloqPainelCtrl: TBooleanField
      FieldName = 'BloqPainelCtrl'
    end
    object tbConfigBloqCtrlAltDel: TBooleanField
      FieldName = 'BloqCtrlAltDel'
    end
    object tbConfigBloqExecutar: TBooleanField
      FieldName = 'BloqExecutar'
    end
    object tbConfigBloqMeusLocaisRede: TBooleanField
      FieldName = 'BloqMeusLocaisRede'
    end
    object tbConfigPaginaInicial: TStringField
      FieldName = 'PaginaInicial'
      Size = 200
    end
    object tbConfigEsconderCronometro: TBooleanField
      FieldName = 'EsconderCronometro'
    end
    object tbConfigAposEncerrar: TWordField
      FieldName = 'AposEncerrar'
    end
    object tbConfigAlinhaBarraGuard: TWordField
      FieldName = 'AlinhaBarraGuard'
    end
    object tbConfigNoNet: TWordField
      FieldName = 'NoNet'
    end
    object tbConfigTempoSumirLogin: TWordField
      FieldName = 'TempoSumirLogin'
    end
    object tbConfigEmailMetodo: TWordField
      FieldName = 'EmailMetodo'
    end
    object tbConfigEmailServ: TStringField
      FieldName = 'EmailServ'
      Size = 50
    end
    object tbConfigEmailUsername: TStringField
      FieldName = 'EmailUsername'
      Size = 50
    end
    object tbConfigEmailSenha: TStringField
      FieldName = 'EmailSenha'
      Size = 50
    end
    object tbConfigEmailDestino: TMemoField
      FieldName = 'EmailDestino'
      BlobType = ftMemo
    end
    object tbConfigEmailEnviarCaixa: TBooleanField
      FieldName = 'EmailEnviarCaixa'
    end
    object tbConfigEsconderDrives: TStringField
      FieldName = 'EsconderDrives'
      Size = 30
    end
    object tbConfigBloqTray: TBooleanField
      FieldName = 'BloqTray'
    end
    object tbConfigTempoB1: TWordField
      FieldName = 'TempoB1'
    end
    object tbConfigTempoB2: TWordField
      FieldName = 'TempoB2'
    end
    object tbConfigTempoB3: TWordField
      FieldName = 'TempoB3'
    end
    object tbConfigTempoB4: TWordField
      FieldName = 'TempoB4'
    end
    object tbConfigTempoB5: TWordField
      FieldName = 'TempoB5'
    end
    object tbConfigTempoB6: TWordField
      FieldName = 'TempoB6'
    end
    object tbConfigCredPadraoTipo: TWordField
      FieldName = 'CredPadraoTipo'
    end
    object tbConfigCredPadraoCod: TIntegerField
      FieldName = 'CredPadraoCod'
    end
    object tbConfigPgVendas: TBooleanField
      FieldName = 'PgVendas'
    end
    object tbConfigPgAcesso: TBooleanField
      FieldName = 'PgAcesso'
    end
    object tbConfigPgTempo: TBooleanField
      FieldName = 'PgTempo'
    end
    object tbConfigPgImp: TBooleanField
      FieldName = 'PgImp'
    end
    object tbConfigPgVendaAvulsa: TBooleanField
      FieldName = 'PgVendaAvulsa'
    end
    object tbConfigMostraNomeMaq: TBooleanField
      FieldName = 'MostraNomeMaq'
    end
    object tbConfigBloqBotaoDir: TBooleanField
      FieldName = 'BloqBotaoDir'
    end
    object tbConfigBloquearUsoEmHorarioNP: TBooleanField
      FieldName = 'BloquearUsoEmHorarioNP'
    end
    object tbConfigMinutosDesligaMaq: TWordField
      FieldName = 'MinutosDesligaMaq'
    end
    object tbConfigOpcaoChat: TWordField
      FieldName = 'OpcaoChat'
    end
    object tbConfigSalvarCodUsername: TBooleanField
      FieldName = 'SalvarCodUsername'
    end
    object tbConfigCorMaqManut: TIntegerField
      FieldName = 'CorMaqManut'
    end
    object tbConfigCorFMaqManut: TIntegerField
      FieldName = 'CorFMaqManut'
    end
    object tbConfigContinuarCredTempo: TBooleanField
      FieldName = 'ContinuarCredTempo'
    end
    object tbConfigNaoGuardarCreditoCli: TBooleanField
      FieldName = 'NaoGuardarCreditoCli'
    end
    object tbConfigEncerramentoCartao: TWordField
      FieldName = 'EncerramentoCartao'
    end
    object tbConfigTempoEPrePago: TWordField
      FieldName = 'TempoEPrePago'
    end
    object tbConfigTempoECartao: TWordField
      FieldName = 'TempoECartao'
    end
    object tbConfigCorPrevisao: TIntegerField
      FieldName = 'CorPrevisao'
    end
    object tbConfigCorFPrevisao: TIntegerField
      FieldName = 'CorFPrevisao'
    end
    object tbConfigRelCaixaAuto: TBooleanField
      FieldName = 'RelCaixaAuto'
    end
    object tbConfigAlteraLoginSemCred: TBooleanField
      FieldName = 'AlteraLoginSemCred'
    end
    object tbConfigNaoCobrarImpFunc: TBooleanField
      FieldName = 'NaoCobrarImpFunc'
    end
    object tbConfigSincronizarHorarios: TBooleanField
      FieldName = 'SincronizarHorarios'
    end
    object tbConfigMostrarDebitoNoGuard: TBooleanField
      FieldName = 'MostrarDebitoNoGuard'
    end
    object tbConfigBloquearLoginAlemMaxDeb: TBooleanField
      FieldName = 'BloquearLoginAlemMaxDeb'
    end
    object tbConfigClienteNaoAlteraSenha: TBooleanField
      FieldName = 'ClienteNaoAlteraSenha'
    end
    object tbConfigNaoObrigarSenhaCliente: TBooleanField
      FieldName = 'NaoObrigarSenhaCliente'
    end
    object tbConfigNaoVenderAlemEstoque: TBooleanField
      FieldName = 'NaoVenderAlemEstoque'
    end
    object tbConfigCreditoComoValor: TBooleanField
      FieldName = 'CreditoComoValor'
    end
    object tbConfigCliAvulsoNaoEncerra: TBooleanField
      FieldName = 'CliAvulsoNaoEncerra'
    end
    object tbConfigAutoSortGridCaixa: TBooleanField
      FieldName = 'AutoSortGridCaixa'
    end
    object tbConfigAvisoFimTempoAdminS: TWordField
      FieldName = 'AvisoFimTempoAdminS'
    end
    object tbConfigDetectarImpServ: TBooleanField
      FieldName = 'DetectarImpServ'
    end
    object tbConfigAvisoCreditos: TBooleanField
      FieldName = 'AvisoCreditos'
    end
    object tbConfigClientePodeVerCred: TBooleanField
      FieldName = 'ClientePodeVerCred'
    end
    object tbConfigChatAlertaSonoro: TBooleanField
      FieldName = 'ChatAlertaSonoro'
    end
    object tbConfigChatMostraNotificacao: TBooleanField
      FieldName = 'ChatMostraNotificacao'
    end
    object tbConfigModoCredGuard: TWordField
      FieldName = 'ModoCredGuard'
    end
    object tbConfigMsgFimCred: TStringField
      FieldName = 'MsgFimCred'
      Size = 150
    end
    object tbConfigSemLogin: TBooleanField
      FieldName = 'SemLogin'
    end
    object tbConfigFidAtivo: TBooleanField
      FieldName = 'FidAtivo'
    end
    object tbConfigFidSessaoValor: TCurrencyField
      FieldName = 'FidSessaoValor'
    end
    object tbConfigFidSessaoPontos: TIntegerField
      FieldName = 'FidSessaoPontos'
    end
    object tbConfigFidVendaValor: TCurrencyField
      FieldName = 'FidVendaValor'
    end
    object tbConfigFidVendaPontos: TIntegerField
      FieldName = 'FidVendaPontos'
    end
    object tbConfigFidImpValor: TCurrencyField
      FieldName = 'FidImpValor'
    end
    object tbConfigFidImpPontos: TIntegerField
      FieldName = 'FidImpPontos'
    end
    object tbConfigFidParcial: TBooleanField
      FieldName = 'FidParcial'
    end
    object tbConfigFidAutoPremiar: TBooleanField
      FieldName = 'FidAutoPremiar'
    end
    object tbConfigFidTipoPremioAuto: TWordField
      FieldName = 'FidTipoPremioAuto'
    end
    object tbConfigFidPremioAuto: TIntegerField
      FieldName = 'FidPremioAuto'
    end
    object tbConfigAutoObsAoCancelar: TBooleanField
      FieldName = 'AutoObsAoCancelar'
    end
    object tbConfigFidMostrarSaldoGuard: TBooleanField
      FieldName = 'FidMostrarSaldoGuard'
    end
    object tbConfigFidMostrarSaldoAdmin: TBooleanField
      FieldName = 'FidMostrarSaldoAdmin'
    end
    object tbConfigCliCadNaoEncerra: TBooleanField
      FieldName = 'CliCadNaoEncerra'
    end
    object tbConfigImpedirPosPago: TBooleanField
      FieldName = 'ImpedirPosPago'
    end
    object tbConfigAutoLigarMaqCli: TBooleanField
      FieldName = 'AutoLigarMaqCli'
    end
    object tbConfigPastaDownload: TStringField
      FieldName = 'PastaDownload'
      Size = 1024
    end
    object tbConfigBiometria: TBooleanField
      FieldName = 'Biometria'
    end
    object tbConfigPMPausaAutomatica: TBooleanField
      FieldName = 'PMPausaAutomatica'
    end
    object tbConfigPMConfirmaImpCliente: TBooleanField
      FieldName = 'PMConfirmaImpCliente'
    end
    object tbConfigPMMostrarPaginasCli: TBooleanField
      FieldName = 'PMMostrarPaginasCli'
    end
    object tbConfigPMMostrarValorCli: TBooleanField
      FieldName = 'PMMostrarValorCli'
    end
    object tbConfigPMCalcValorCli: TWordField
      FieldName = 'PMCalcValorCli'
    end
    object tbConfigPMPromptValorCli: TStringField
      FieldName = 'PMPromptValorCli'
      Size = 100
    end
    object tbConfigPMObsValorCli: TStringField
      FieldName = 'PMObsValorCli'
      Size = 300
    end
    object tbConfigPubHomePage: TBooleanField
      FieldName = 'PubHomePage'
    end
    object tbConfigPubAd: TBooleanField
      FieldName = 'PubAd'
    end
    object tbConfigPubToolbar: TBooleanField
      FieldName = 'PubToolbar'
    end
    object tbConfigMaxTempoSessao: TWordField
      FieldName = 'MaxTempoSessao'
    end
    object tbConfigFidMsg: TBooleanField
      FieldName = 'FidMsg'
    end
    object tbConfigFidMsgTitulo: TStringField
      FieldName = 'FidMsgTitulo'
      Size = 50
    end
    object tbConfigFidMsgTexto: TnxMemoField
      FieldName = 'FidMsgTexto'
      BlobType = ftMemo
    end
    object tbConfigTarifaPadrao: TIntegerField
      FieldName = 'TarifaPadrao'
    end
    object tbConfigTarifaPorHorario: TBooleanField
      FieldName = 'TarifaPorHorario'
    end
    object tbConfigBloqMeuComputador: TBooleanField
      FieldName = 'BloqMeuComputador'
    end
    object tbConfigBloqLixeira: TBooleanField
      FieldName = 'BloqLixeira'
    end
    object tbConfigFiltrarDesktop: TBooleanField
      FieldName = 'FiltrarDesktop'
    end
    object tbConfigFiltrarMenuIniciar: TBooleanField
      FieldName = 'FiltrarMenuIniciar'
    end
    object tbConfigBloqDownloadExe: TBooleanField
      FieldName = 'BloqDownloadExe'
    end
    object tbConfigBloqMeusDocumentos: TBooleanField
      FieldName = 'BloqMeusDocumentos'
    end
    object tbConfigClassicStartMenu: TBooleanField
      FieldName = 'ClassicStartMenu'
    end
    object tbConfigBloqueiaCliAvulso: TBooleanField
      FieldName = 'BloqueiaCliAvulso'
    end
    object tbConfigExigeDadosMinimos: TBooleanField
      FieldName = 'ExigeDadosMinimos'
    end
    object tbConfigDadosMinimos: TStringField
      FieldName = 'DadosMinimos'
      Size = 300
    end
    object tbConfigCidadePadrao: TStringField
      FieldName = 'CidadePadrao'
      Size = 50
    end
    object tbConfigUFPadrao: TStringField
      FieldName = 'UFPadrao'
      Size = 2
    end
    object tbConfigPedirSaldoI: TBooleanField
      FieldName = 'PedirSaldoI'
    end
    object tbConfigPedirSaldoF: TBooleanField
      FieldName = 'PedirSaldoF'
    end
    object tbConfigPMPausarServ: TBooleanField
      FieldName = 'PMPausarServ'
    end
    object tbConfigPMNaoPausar: TnxMemoField
      FieldName = 'PMNaoPausar'
      BlobType = ftMemo
    end
    object tbConfigPMCotas: TBooleanField
      FieldName = 'PMCotas'
    end
    object tbConfigPMCotasMaxPagDia: TIntegerField
      FieldName = 'PMCotasMaxPagDia'
    end
    object tbConfigPMCotasMaxPagMes: TIntegerField
      FieldName = 'PMCotasMaxPagMes'
    end
    object tbConfigPMCotasOpCota: TWordField
      FieldName = 'PMCotasOpCota'
    end
    object tbConfigPMCotasOpExcesso: TWordField
      FieldName = 'PMCotasOpExcesso'
    end
    object tbConfigPMCotasMaxExcesso: TIntegerField
      FieldName = 'PMCotasMaxExcesso'
    end
    object tbConfigPMCotasPorCli: TBooleanField
      FieldName = 'PMCotasPorCli'
    end
    object tbConfigEmailIdent: TStringField
      FieldName = 'EmailIdent'
    end
    object tbConfigEmailConteudo: TStringField
      FieldName = 'EmailConteudo'
    end
    object tbConfigAlertaAssinatura: TBooleanField
      FieldName = 'AlertaAssinatura'
    end
    object tbConfigCamposCliCC: TnxMemoField
      FieldName = 'CamposCliCC'
      BlobType = ftMemo
    end
    object tbConfigBloqToolbars: TBooleanField
      FieldName = 'BloqToolbars'
    end
    object tbConfigBloqPosPago: TBooleanField
      FieldName = 'BloqPosPago'
    end
    object tbConfigCliCongelado: TBooleanField
      FieldName = 'CliCongelado'
    end
    object tbConfigMinutosDesligaMon: TWordField
      FieldName = 'MinutosDesligaMon'
    end
    object tbConfigQtdMaqOk: TBooleanField
      FieldName = 'QtdMaqOk'
    end
    object tbConfigSenhaAdminOk: TBooleanField
      FieldName = 'SenhaAdminOk'
    end
    object tbConfigFundoWeb: TBooleanField
      FieldName = 'FundoWeb'
    end
    object tbConfigFundoWebURL: TnxMemoField
      FieldName = 'FundoWebURL'
      BlobType = ftMemo
    end
    object tbConfigPMPDF: TBooleanField
      FieldName = 'PMPDF'
    end
    object tbConfigPMReviewCli: TBooleanField
      FieldName = 'PMReviewCli'
    end
    object tbConfigPMReviewAdmin: TBooleanField
      FieldName = 'PMReviewAdmin'
    end
    object tbConfigPosLogin: TWordField
      FieldName = 'PosLogin'
    end
    object tbConfigPMPDFPrintEng: TWordField
      FieldName = 'PMPDFPrintEng'
    end
    object tbConfigPMConfirmaImpAdmin: TBooleanField
      FieldName = 'PMConfirmaImpAdmin'
    end
    object tbConfigAutoCad: TBooleanField
      FieldName = 'AutoCad'
    end
    object tbConfigQuickCad: TBooleanField
      FieldName = 'QuickCad'
    end
    object tbConfigCodProdutoDuplicados: TBooleanField
      FieldName = 'CodProdutoDuplicados'
    end
    object tbConfigRecTipoImpressora: TStringField
      FieldName = 'RecTipoImpressora'
      Size = 32
    end
    object tbConfigRecCortaFolha: TBooleanField
      FieldName = 'RecCortaFolha'
    end
    object tbConfigBRT: TWordField
      FieldName = 'BRT'
    end
    object tbConfigExCookie: TBooleanField
      FieldName = 'ExCookie'
    end
    object tbConfigHPOpenBef: TBooleanField
      FieldName = 'HPOpenBef'
    end
    object tbConfigHomePage_Tab: TBooleanField
      FieldName = 'HomePage_Tab'
    end
    object tbConfigHomePage_LastURL: TDateTimeField
      FieldName = 'HomePage_LastURL'
    end
    object tbConfigHomePage_URL: TStringField
      FieldName = 'HomePage_URL'
      Size = 300
    end
    object tbConfigRecursos: TStringField
      FieldName = 'Recursos'
      Size = 30
    end
    object tbConfigComandaOff: TBooleanField
      FieldName = 'ComandaOff'
    end
    object tbConfigMesasOff: TBooleanField
      FieldName = 'MesasOff'
    end
    object tbConfigConsumoAvulsoOff: TBooleanField
      FieldName = 'ConsumoAvulsoOff'
    end
    object tbConfigFaixaComanda: TStringField
      FieldName = 'FaixaComanda'
      Size = 100
    end
    object tbConfigPrecoAuto: TBooleanField
      FieldName = 'PrecoAuto'
    end
    object tbConfigMargem: TFloatField
      FieldName = 'Margem'
    end
    object tbConfigBanners: TnxMemoField
      FieldName = 'Banners'
      BlobType = ftMemo
    end
    object tbConfigBotoes: TnxMemoField
      FieldName = 'Botoes'
      BlobType = ftMemo
    end
    object tbConfigComissaoPerc: TFloatField
      FieldName = 'ComissaoPerc'
    end
    object tbConfigComissaoLucro: TBooleanField
      FieldName = 'ComissaoLucro'
    end
    object tbConfigCodBarBal: TBooleanField
      FieldName = 'CodBarBal'
    end
    object tbConfigCodBarBalTam: TWordField
      FieldName = 'CodBarBalTam'
    end
    object tbConfigCodBarBalIdent: TStringField
      FieldName = 'CodBarBalIdent'
      Size = 5
    end
    object tbConfigCodBarBalInicioCod: TWordField
      FieldName = 'CodBarBalInicioCod'
    end
    object tbConfigCodBarBalTamCod: TWordField
      FieldName = 'CodBarBalTamCod'
    end
    object tbConfigCodBarBalValor: TBooleanField
      FieldName = 'CodBarBalValor'
    end
    object tbConfigCodBarBalPPInicio: TWordField
      FieldName = 'CodBarBalPPInicio'
    end
    object tbConfigCodBarBalPPTam: TWordField
      FieldName = 'CodBarBalPPTam'
    end
    object tbConfigCodBarBalPPDig: TWordField
      FieldName = 'CodBarBalPPDig'
    end
    object tbConfigConfirmarDebito: TBooleanField
      FieldName = 'ConfirmarDebito'
    end
    object tbConfigDTol: TWordField
      FieldName = 'DTol'
    end
    object tbConfigDVA: TDateTimeField
      FieldName = 'DVA'
    end
    object tbConfigProxAvisoAss: TDateTimeField
      FieldName = 'ProxAvisoAss'
    end
    object tbConfigPreLib: TBooleanField
      FieldName = 'PreLib'
    end
    object tbConfigSky_URL: TStringField
      FieldName = 'Sky_URL'
      Size = 300
    end
    object tbConfigToolbar_URL: TStringField
      FieldName = 'Toolbar_URL'
      Size = 300
    end
    object tbConfigNaoTransferirMaq: TBooleanField
      FieldName = 'NaoTransferirMaq'
    end
    object tbConfigVerBloqueioSites: TBooleanField
      FieldName = 'VerBloqueioSites'
    end
    object tbConfigUrls: TnxMemoField
      FieldName = 'Urls'
      BlobType = ftMemo
    end
    object tbConfigRecVer: TIntegerField
      FieldName = 'RecVer'
    end
  end
  object dsConfig: TDataSource
    DataSet = tbConfig
    Left = 248
    Top = 288
  end
  object RSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCPIP
    Left = 400
    Top = 8
  end
  object mtUsuario: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Username'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Admin'
        DataType = ftBoolean
      end
      item
        Name = 'Senha'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Grupos'
        DataType = ftMemo
      end
      item
        Name = 'Direitos'
        DataType = ftMemo
      end
      item
        Name = 'NumClientes'
        DataType = ftInteger
      end
      item
        Name = 'MaxMaqManut'
        DataType = ftInteger
      end
      item
        Name = 'MaxTempoManut'
        DataType = ftInteger
      end>
    IndexFieldNames = 'Username'
    IndexName = 'mtUsuariosIndex1'
    IndexDefs = <
      item
        Name = 'mtUsuariosIndex1'
        Fields = 'Username'
        Options = [ixPrimary, ixCaseInsensitive]
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
    Left = 104
    Top = 240
    object mtUsuarioUsername: TStringField
      FieldName = 'Username'
      Size = 10
    end
    object mtUsuarioNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object mtUsuarioAdmin: TBooleanField
      FieldName = 'Admin'
    end
    object mtUsuarioSenha: TStringField
      FieldName = 'Senha'
      Size = 10
    end
    object mtUsuarioGrupos: TMemoField
      FieldName = 'Grupos'
      BlobType = ftMemo
    end
    object mtUsuarioDireitos: TMemoField
      FieldName = 'Direitos'
      BlobType = ftMemo
    end
    object mtUsuarioNumClientes: TIntegerField
      FieldName = 'NumClientes'
    end
    object mtUsuarioMaxMaqManut: TIntegerField
      FieldName = 'MaxMaqManut'
    end
    object mtUsuarioMaxTempoManut: TIntegerField
      FieldName = 'MaxTempoManut'
    end
    object mtUsuarioLimiteDesc: TFloatField
      FieldName = 'LimiteDesc'
    end
    object mtUsuarioImg: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'Img'
      Calculated = True
    end
  end
  object dsUsuario: TDataSource
    DataSet = mtUsuario
    Left = 104
    Top = 288
  end
  object tbLayout: TnxTable
    Database = db
    TableName = 'Layout'
    IndexName = 'IPubGridUsuario'
    Left = 32
    Top = 8
    object tbLayoutUsuario: TStringField
      FieldName = 'Usuario'
      Size = 10
    end
    object tbLayoutGrid: TStringField
      FieldName = 'Grid'
      Size = 40
    end
    object tbLayoutNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object tbLayoutPublico: TBooleanField
      FieldName = 'Publico'
    end
    object tbLayoutLayout: TBlobField
      FieldName = 'Layout'
    end
    object tbLayoutFiltro: TBlobField
      FieldName = 'Filtro'
    end
    object tbLayoutUsuarios: TMemoField
      FieldName = 'Usuarios'
      BlobType = ftMemo
    end
  end
  object mtMaquina: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Inicio'
        DataType = ftDateTime
      end
      item
        Name = 'Contato'
        DataType = ftInteger
      end
      item
        Name = 'NomeContato'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'InicioTicks'
        DataType = ftInteger
      end
      item
        Name = 'Acesso'
        DataType = ftInteger
      end
      item
        Name = 'Cliente'
        DataType = ftInteger
      end
      item
        Name = 'ProgramaAtual'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Parado'
        DataType = ftBoolean
      end
      item
        Name = 'LimiteTempo'
        DataType = ftInteger
      end
      item
        Name = 'Menu'
        DataType = ftMemo
      end
      item
        Name = 'TipoAcesso'
        DataType = ftWord
      end>
    IndexName = 'INumero'
    IndexDefs = <
      item
        Name = 'INumero'
        Fields = 'Numero'
        Options = [ixPrimary, ixCaseInsensitive]
      end
      item
        Name = 'IObj'
        Fields = 'ObjectInt'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    Filter = 'Numero <> 9999'
    FilterOptions = []
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    OnCalcFields = mtMaquinaCalcFields
    Left = 32
    Top = 240
    object mtMaquinaNumero: TIntegerField
      FieldName = 'Numero'
    end
    object mtMaquinaNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object mtMaquinaProgramaAtual: TStringField
      FieldName = 'ProgramaAtual'
      Size = 255
    end
    object mtMaquinaMenu: TMemoField
      FieldName = 'Menu'
      BlobType = ftMemo
    end
    object mtMaquinaComputerName: TStringField
      FieldName = 'ComputerName'
      Size = 200
    end
    object mtMaquinaSiteAtual: TStringField
      FieldName = 'SiteAtual'
      Size = 255
    end
    object mtMaquinaIDCliente: TIntegerField
      FieldName = 'IDCliente'
    end
    object mtMaquinaEmManutencao: TBooleanField
      FieldName = 'EmManutencao'
    end
    object mtMaquinaPatrocinio: TStringField
      FieldName = 'Patrocinio'
    end
    object mtMaquinaAvisaFimTempo: TBooleanField
      FieldName = 'AvisaFimTempo'
    end
    object mtMaquinaTemPontos: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'TemPontos'
      Calculated = True
    end
    object mtMaquinaPontosCli: TFloatField
      FieldName = 'PontosCli'
    end
    object mtMaquinaDisplayW: TWordField
      FieldName = 'DisplayW'
    end
    object mtMaquinaDisplayH: TWordField
      FieldName = 'DisplayH'
    end
    object mtMaquinaDisplayWH: TStringField
      FieldKind = fkCalculated
      FieldName = 'DisplayWH'
      Calculated = True
    end
    object mtMaquinaObjectInt: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ObjectInt'
      Calculated = True
    end
    object tMaqRAM: TIntegerField
      FieldName = 'RAM'
    end
    object tMaqCPU: TStringField
      FieldName = 'CPU'
      Size = 50
    end
    object tMaqOS: TStringField
      DisplayWidth = 50
      FieldName = 'OS'
      Size = 50
    end
    object tMaqDrives: TStringField
      FieldName = 'Drives'
      Size = 25
    end
    object tMaqHDTotal: TIntegerField
      FieldName = 'HDTotal'
    end
    object mtMaquinaIP: TStringField
      FieldName = 'IP'
      Size = 30
    end
    object tMaqHDFree: TIntegerField
      FieldName = 'HDFree'
    end
    object mtMaquinaPrinters: TMemoField
      FieldName = 'Printers'
      BlobType = ftMemo
    end
    object mtMaquinaMacAddress: TStringField
      FieldName = 'MacAddress'
      Size = 30
    end
    object mtMaquinaIPConfig: TMemoField
      FieldName = 'IPConfig'
      BlobType = ftMemo
    end
    object mtMaquinaURLLogin: TMemoField
      FieldName = 'URLLogin'
      BlobType = ftMemo
    end
  end
  object dsMaquina: TDataSource
    DataSet = mtMaquina
    Left = 32
    Top = 288
  end
  object tbPacote: TnxTable
    Database = db
    TableName = 'Pacote'
    IndexName = 'IID'
    Left = 264
    Top = 64
    object tbPacoteID: TAutoIncField
      FieldName = 'ID'
    end
    object tbPacoteMinutos: TIntegerField
      FieldName = 'Minutos'
    end
    object tbPacoteValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tbPacoteDescr: TStringField
      FieldName = 'Descr'
      Size = 30
    end
    object tbPacoteFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object tbPacoteFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
  end
  object tbCaixa: TnxTable
    Database = db
    TableName = 'Caixa'
    IndexName = 'IAberto'
    Left = 200
    Top = 8
    object tbCaixaID: TAutoIncField
      Alignment = taLeftJustify
      FieldName = 'ID'
    end
    object tbCaixaAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object tbCaixaUsuario: TStringField
      FieldName = 'Usuario'
    end
    object tbCaixaAbertura: TDateTimeField
      FieldName = 'Abertura'
    end
    object tbCaixaFechamento: TDateTimeField
      FieldName = 'Fechamento'
    end
    object tbCaixaTotalFinal: TCurrencyField
      FieldName = 'TotalFinal'
    end
    object tbCaixaDescontos: TCurrencyField
      FieldName = 'Descontos'
    end
    object tbCaixaCancelamentos: TCurrencyField
      FieldName = 'Cancelamentos'
    end
    object tbCaixaSaldoAnt: TCurrencyField
      FieldName = 'SaldoAnt'
    end
    object tbCaixaObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tbCaixaSangria: TCurrencyField
      FieldName = 'Sangria'
    end
    object tbCaixaSupr: TCurrencyField
      FieldName = 'Supr'
    end
    object tbCaixaReproc: TDateTimeField
      FieldName = 'Reproc'
    end
    object tbCaixaEstSessoesQtd: TIntegerField
      FieldName = 'EstSessoesQtd'
    end
    object tbCaixaEstSessoesTempo: TFloatField
      FieldName = 'EstSessoesTempo'
    end
    object tbCaixaEstUrls: TIntegerField
      FieldName = 'EstUrls'
    end
    object tbCaixaEstSyncOk: TBooleanField
      FieldName = 'EstSyncOk'
    end
    object tbCaixaEstBuscasEng: TnxMemoField
      FieldName = 'EstBuscasEng'
      BlobType = ftMemo
    end
    object tbCaixaEstRes: TnxMemoField
      FieldName = 'EstRes'
      BlobType = ftMemo
    end
    object tbCaixaSaldoF: TCurrencyField
      FieldName = 'SaldoF'
    end
    object tbCaixaQuebra: TCurrencyField
      FieldName = 'Quebra'
    end
    object tbCaixaIDLivre: TStringField
      FieldName = 'IDLivre'
      Size = 10
    end
  end
  object tbHoraCor: TnxTable
    Database = db
    Timeout = 10000
    TableName = 'HTar'
    IndexName = 'IPrim'
    Left = 32
    Top = 64
    object tbHoraCorTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object tbHoraCorDia: TWordField
      FieldName = 'Dia'
    end
    object tbHoraCorHora: TWordField
      FieldName = 'Hora'
    end
    object tbHoraCorCor: TIntegerField
      FieldName = 'Cor'
    end
  end
  object tbTipoAcesso: TnxTable
    Database = db
    Timeout = 10000
    TableName = 'TipoAcesso'
    IndexName = 'IID'
    Left = 256
    Top = 120
    object tbTipoAcessoNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object tbTipoAcessoID: TWordField
      FieldName = 'ID'
    end
  end
  object tbTarifa: TnxTable
    Database = db
    Timeout = 10000
    TableName = 'Tarifa'
    IndexName = 'IPrim'
    Left = 200
    Top = 120
    object tbTarifaTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object tbTarifaCor: TIntegerField
      FieldName = 'Cor'
    end
    object tbTarifaCorFonte: TIntegerField
      FieldName = 'CorFonte'
    end
    object tbTarifaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object tbTarifaReinicia: TBooleanField
      FieldName = 'Reinicia'
    end
    object tbTarifaPrecosStr: TnxMemoField
      FieldName = 'PrecosStr'
      BlobType = ftMemo
    end
    object tbTarifaDivQtd: TIntegerField
      FieldName = 'DivQtd'
    end
    object tbTarifaSemValorMin: TBooleanField
      FieldName = 'SemValorMin'
    end
    object tbTarifaReiniciaDesde: TWordField
      FieldName = 'ReiniciaDesde'
    end
    object tbTarifaDivTipo: TWordField
      FieldName = 'DivTipo'
    end
    object tbTarifaArredondar: TWordField
      FieldName = 'Arredondar'
    end
  end
  object tbETar: TnxTable
    Database = db
    Timeout = 10000
    TableName = 'ETar'
    IndexName = 'IPrim'
    Left = 136
    Top = 120
    object tbETarTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object tbETarCor: TIntegerField
      FieldName = 'Cor'
    end
    object tbETarPos: TWordField
      FieldName = 'Pos'
    end
    object tbETarTempo: TDateTimeField
      FieldName = 'Tempo'
    end
    object tbETarTolerancia: TDateTimeField
      FieldName = 'Tolerancia'
    end
    object tbETarValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tbETarValorMin: TCurrencyField
      FieldName = 'ValorMin'
    end
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer2Timer
    Left = 392
    Top = 232
  end
  object Q: TnxQuery
    Database = db
    SQL.Strings = (
      
        'select Sum(ValorFinalAcesso) as Acessos, Sum(Produtos) as Vendas' +
        ' from Acesso'
      'where (DataPagto is Null) and (Aberto=False)')
    Left = 144
    Top = 176
  end
  object tbTipoPass: TnxTable
    Database = db
    OnCalcFields = tbTipoPassCalcFields
    TableName = 'TipoPass'
    IndexName = 'IID'
    Left = 32
    Top = 120
    object tbTipoPassNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tbTipoPassValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tbTipoPassTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tbTipoPassTipoExp: TWordField
      FieldName = 'TipoExp'
    end
    object tbTipoPassExpirarEm: TDateTimeField
      FieldName = 'ExpirarEm'
    end
    object tbTipoPassMaxSegundos: TIntegerField
      FieldName = 'MaxSegundos'
    end
    object tbTipoPassObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tbTipoPassDia1: TIntegerField
      FieldName = 'Dia1'
    end
    object tbTipoPassDia2: TIntegerField
      FieldName = 'Dia2'
    end
    object tbTipoPassDia3: TIntegerField
      FieldName = 'Dia3'
    end
    object tbTipoPassDia4: TIntegerField
      FieldName = 'Dia4'
    end
    object tbTipoPassDia5: TIntegerField
      FieldName = 'Dia5'
    end
    object tbTipoPassDia6: TIntegerField
      FieldName = 'Dia6'
    end
    object tbTipoPassDia7: TIntegerField
      FieldName = 'Dia7'
    end
    object tbTipoPassMinutos: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Minutos'
      Calculated = True
    end
    object tbTipoPassID: TAutoIncField
      FieldName = 'ID'
    end
    object tbTipoPassFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object tbTipoPassFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
  end
  object tbPass: TnxTable
    Database = db
    TableName = 'Passaporte'
    IndexName = 'ICliExpID'
    Left = 88
    Top = 120
  end
  object tbHPass: TnxTable
    Database = db
    OnCalcFields = tbTipoPassCalcFields
    TableName = 'HPass'
    IndexName = 'ISessaoPass'
    Left = 144
    Top = 64
  end
  object gvRep: TcxGridViewRepository
    Left = 392
    Top = 176
    object TVL: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      FilterBox.CustomizeDialog = False
      DataController.Filter.Active = True
      DataController.KeyFieldNames = 'Codigo'
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = TVLNome
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object TVLNome: TcxGridDBColumn
        DataBinding.FieldName = 'Nome'
        Width = 180
      end
      object TVLUsername: TcxGridDBColumn
        DataBinding.FieldName = 'Username'
        PropertiesClassName = 'TcxMaskEditProperties'
        SortIndex = 0
        SortOrder = soAscending
        Width = 120
      end
      object TVLCodigo: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'Codigo'
        Width = 40
      end
      object TVLDebito: TcxGridDBColumn
        DataBinding.FieldName = 'Debito'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Width = 60
      end
    end
  end
  object tbChat: TnxTable
    Database = db
    OnCalcFields = tbChatCalcFields
    TableName = 'chat'
    IndexName = 'IDataHora'
    Left = 32
    Top = 176
    object tbChatDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tbChatTexto: TMemoField
      FieldName = 'Texto'
      BlobType = ftMemo
    end
    object tbChatDiz: TStringField
      FieldKind = fkCalculated
      FieldName = 'Diz'
      Size = 50
      Calculated = True
    end
    object tbChatMaq: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Maq'
      Calculated = True
    end
    object tbChatID: TAutoIncField
      FieldName = 'ID'
    end
    object tbChatDe: TIntegerField
      FieldName = 'De'
    end
    object tbChatPara: TIntegerField
      FieldName = 'Para'
    end
  end
  object Reg: TLMDIniCtrl
    RegPath = 'Software\NexCafe'
    Left = 344
    Top = 177
  end
  object tabTT: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Descr'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Tipo'
        DataType = ftSmallint
      end
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Minutos'
        DataType = ftInteger
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'TipoAcesso'
        DataType = ftInteger
      end>
    IndexDefs = <>
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
    Left = 176
    Top = 240
    object tabTTDescr: TStringField
      FieldName = 'Descr'
      Size = 40
    end
    object tabTTTipo: TSmallintField
      FieldName = 'Tipo'
    end
    object tabTTCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tabTTMinutos: TIntegerField
      FieldName = 'Minutos'
    end
    object tabTTValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tabTTTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tabTTID: TAutoIncField
      FieldName = 'ID'
    end
    object tabTTPontos: TIntegerField
      FieldName = 'Pontos'
    end
  end
  object tbTempo: TnxTable
    Database = db
    TableName = 'Tempo'
    IndexName = 'IID'
    Left = 336
    Top = 296
    object tbTempoID: TAutoIncField
      FieldName = 'ID'
    end
    object tbTempoDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tbTempoFunc: TStringField
      FieldName = 'Func'
      Size = 30
    end
    object tbTempoTipo: TWordField
      FieldName = 'Tipo'
    end
    object tbTempoMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object tbTempoIDPacPass: TIntegerField
      FieldName = 'IDPacPass'
    end
    object tbTempoPassaporte: TIntegerField
      FieldName = 'Passaporte'
    end
    object tbTempoTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tbTempoDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tbTempoPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tbTempoCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tbTempoMaq: TWordField
      FieldName = 'Maq'
    end
    object tbTempoSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tbTempoCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tbTempoTran: TIntegerField
      FieldName = 'Tran'
    end
    object tbTempoCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tbTempoPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tbTempoDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tbTempoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tbTempoSenha: TStringField
      FieldName = 'Senha'
    end
    object tbTempoTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tbTempoObs: TStringField
      FieldName = 'Obs'
      Size = 50
    end
    object tbTempoCredValor: TBooleanField
      FieldName = 'CredValor'
    end
    object tbTempoFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object tbTempoFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
  end
  object tbSessao: TnxTable
    Database = db
    TableName = 'Sessao'
    IndexName = 'IID'
    Left = 408
    Top = 296
    object tbSessaoID: TAutoIncField
      FieldName = 'ID'
    end
    object tbSessaoInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object tbSessaoTermino: TDateTimeField
      FieldName = 'Termino'
    end
    object tbSessaoMinutosR: TFloatField
      FieldName = 'MinutosR'
    end
    object tbSessaoMinutosC: TFloatField
      FieldName = 'MinutosC'
    end
    object tbSessaoMaq: TWordField
      FieldName = 'Maq'
    end
    object tbSessaoEncerrou: TBooleanField
      FieldName = 'Encerrou'
    end
    object tbSessaoCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tbSessaoTransfMaq: TBooleanField
      FieldName = 'TransfMaq'
    end
    object tbSessaoTipoCli: TWordField
      FieldName = 'TipoCli'
    end
    object tbSessaoCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tbSessaoTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tbSessaoDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tbSessaoPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tbSessaoNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object tbSessaoFuncI: TStringField
      FieldName = 'FuncI'
      Size = 30
    end
    object tbSessaoFuncF: TStringField
      FieldName = 'FuncF'
      Size = 30
    end
    object tbSessaoObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tbSessaoTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tbSessaoCaixaI: TIntegerField
      FieldName = 'CaixaI'
    end
    object tbSessaoCaixaF: TIntegerField
      FieldName = 'CaixaF'
    end
    object tbSessaoTicksI: TIntegerField
      FieldName = 'TicksI'
    end
    object tbSessaoPausado: TBooleanField
      FieldName = 'Pausado'
    end
    object tbSessaoInicioPausa: TIntegerField
      FieldName = 'InicioPausa'
    end
    object tbSessaoMinTicksUsados: TIntegerField
      FieldName = 'MinTicksUsados'
    end
    object tbSessaoMinTicksTotal: TIntegerField
      FieldName = 'MinTicksTotal'
    end
    object tbSessaoFimTicksUsados: TIntegerField
      FieldName = 'FimTicksUsados'
    end
    object tbSessaoStrPausas: TMemoField
      FieldName = 'StrPausas'
      BlobType = ftMemo
    end
    object tbSessaoMinutosCli: TFloatField
      FieldName = 'MinutosCli'
    end
    object tbSessaoMinutosPrev: TFloatField
      FieldName = 'MinutosPrev'
    end
    object tbSessaoMinutosMax: TFloatField
      FieldName = 'MinutosMax'
    end
    object tbSessaoMinutosCliU: TFloatField
      FieldName = 'MinutosCliU'
    end
    object tbSessaoValorCli: TCurrencyField
      FieldName = 'ValorCli'
    end
    object tbSessaoValorCliU: TFloatField
      FieldName = 'ValorCliU'
    end
    object tbSessaoTranI: TIntegerField
      FieldName = 'TranI'
    end
    object tbSessaoTranF: TIntegerField
      FieldName = 'TranF'
    end
    object tbSessaoMaqI: TWordField
      FieldName = 'MaqI'
    end
    object tbSessaoPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tbSessaoDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tbSessaoFimTicksTotal: TIntegerField
      FieldName = 'FimTicksTotal'
    end
    object tbSessaoStrTransfMaq: TMemoField
      FieldName = 'StrTransfMaq'
      BlobType = ftMemo
    end
    object tbSessaoStrFechamentoCaixa: TMemoField
      FieldName = 'StrFechamentoCaixa'
      BlobType = ftMemo
    end
    object tbSessaoPermitirDownload: TBooleanField
      FieldName = 'PermitirDownload'
    end
    object tbSessaoVersaoRegistro: TIntegerField
      FieldName = 'VersaoRegistro'
    end
    object tbSessaoCartaoTempo: TBooleanField
      FieldName = 'CartaoTempo'
    end
    object tbSessaoHP1: TIntegerField
      FieldName = 'HP1'
    end
    object tbSessaoHP2: TIntegerField
      FieldName = 'HP2'
    end
    object tbSessaoHP3: TIntegerField
      FieldName = 'HP3'
    end
    object tbSessaoHP4: TIntegerField
      FieldName = 'HP4'
    end
    object tbSessaoHP5: TIntegerField
      FieldName = 'HP5'
    end
    object tbSessaoHP6: TIntegerField
      FieldName = 'HP6'
    end
    object tbSessaoHP7: TIntegerField
      FieldName = 'HP7'
    end
    object tbSessaoDisableAD: TBooleanField
      FieldName = 'DisableAD'
    end
    object tbSessaoFiltrarWEB: TBooleanField
      FieldName = 'FiltrarWEB'
    end
    object tbSessaoIPs: TnxMemoField
      FieldName = 'IPs'
      BlobType = ftMemo
    end
    object tbSessaoJobID: TIntegerField
      FieldName = 'JobID'
    end
    object tbSessaoJobPages: TWordField
      FieldName = 'JobPages'
    end
    object tbSessaoDesktopSinc: TBooleanField
      FieldName = 'DesktopSinc'
    end
    object tbSessaoPermitirDownloadExe: TBooleanField
      FieldName = 'PermitirDownloadExe'
    end
    object tbSessaoTipoMaq: TWordField
      FieldName = 'TipoMaq'
    end
  end
  object tbImp: TnxTable
    Database = db
    TableName = 'Impressao'
    IndexName = 'IID'
    Left = 440
    Top = 224
    object tbImpID: TAutoIncField
      FieldName = 'ID'
    end
    object tbImpTran: TIntegerField
      FieldName = 'Tran'
    end
    object tbImpCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tbImpManual: TBooleanField
      FieldName = 'Manual'
    end
    object tbImpDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tbImpComputador: TStringField
      FieldName = 'Computador'
      Size = 200
    end
    object tbImpMaquina: TWordField
      FieldName = 'Maquina'
    end
    object tbImpPaginas: TWordField
      FieldName = 'Paginas'
    end
    object tbImpImpressora: TStringField
      FieldName = 'Impressora'
      Size = 200
    end
    object tbImpDocumento: TMemoField
      FieldName = 'Documento'
      BlobType = ftMemo
    end
    object tbImpSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tbImpResultado: TWordField
      FieldName = 'Resultado'
    end
    object tbImpq1: TWordField
      FieldName = 'q1'
    end
    object tbImpq2: TWordField
      FieldName = 'q2'
    end
    object tbImpq3: TWordField
      FieldName = 'q3'
    end
    object tbImpq4: TWordField
      FieldName = 'q4'
    end
    object tbImpq5: TWordField
      FieldName = 'q5'
    end
    object tbImpq6: TWordField
      FieldName = 'q6'
    end
    object tbImpq7: TWordField
      FieldName = 'q7'
    end
    object tbImpq8: TWordField
      FieldName = 'q8'
    end
    object tbImpq9: TWordField
      FieldName = 'q9'
    end
    object tbImpq10: TWordField
      FieldName = 'q10'
    end
    object tbImpv1: TCurrencyField
      FieldName = 'v1'
    end
    object tbImpv2: TCurrencyField
      FieldName = 'v2'
    end
    object tbImpv3: TCurrencyField
      FieldName = 'v3'
    end
    object tbImpv4: TCurrencyField
      FieldName = 'v4'
    end
    object tbImpv5: TCurrencyField
      FieldName = 'v5'
    end
    object tbImpv6: TCurrencyField
      FieldName = 'v6'
    end
    object tbImpv7: TCurrencyField
      FieldName = 'v7'
    end
    object tbImpv8: TCurrencyField
      FieldName = 'v8'
    end
    object tbImpv9: TCurrencyField
      FieldName = 'v9'
    end
    object tbImpv10: TCurrencyField
      FieldName = 'v10'
    end
    object tbImpTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tbImpDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tbImpPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tbImpFunc: TStringField
      FieldName = 'Func'
      Size = 30
    end
    object tbImpCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tbImpCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
  end
  object SimpleCmdHandler: TnxSimpleCommandHandler
    ActiveRuntime = True
    ActiveDesigntime = True
    Left = 240
    Top = 184
  end
  object dsTipoPass: TDataSource
    DataSet = tbTipoPass
    Left = 96
    Top = 176
  end
  object tbPatro: TnxTable
    Database = db
    TableName = 'Patrocinio'
    IndexName = 'INome'
    Left = 464
    Top = 272
    object tbPatroNome: TStringField
      FieldName = 'Nome'
    end
    object tbPatroURLArea1: TMemoField
      FieldName = 'URLArea1'
      BlobType = ftMemo
    end
    object tbPatroURLArea2: TMemoField
      FieldName = 'URLArea2'
      BlobType = ftMemo
    end
    object tbPatroDominiosPerm: TMemoField
      FieldName = 'DominiosPerm'
      BlobType = ftMemo
    end
  end
  object Wav2: TLMDWaveComp
    Wave.Data = {
      58D201005249464650D2010057415645666D7420100000000100020022560000
      885801000400100064617461FCD10100FFFF0000FEFFFDFFFFFF0200FFFF0100
      FFFF0000010003000000020000000000010003000200030000000000FFFF0000
      FEFF0300FFFF0200FDFF010001000100FFFFFDFF000001000000000000000000
      FEFFFDFF00000000FEFF010000000000FDFF0500FFFF02000000010001000000
      FFFFFEFFFFFF0000FFFF0100FEFF000001000200FFFFFFFF01000000FFFFFFFF
      FFFFFFFF000001000000030000000300FFFF0300FEFF0000FEFF020001000000
      0100FFFF00000200FFFFFEFFFFFF0100FEFF0000FFFF00000100FFFF01000000
      FFFF0100FFFF0000FFFF010000000100FFFF010000000100FEFF010000000200
      FFFF0200FFFFFFFFFFFFFFFFFDFF0000FEFFFFFFFEFF0000FEFFFFFFFDFF0100
      FDFF0000FFFF0000FDFF0000FEFF0100FFFF00000100FFFFFEFFFFFF0100FFFF
      FEFFFDFFFFFF000000000000FFFF000000000000FEFF02000000FEFFFDFFFEFF
      FFFF0000FEFF0000FFFF0000FEFFFFFF020004000100000000000000FEFFFEFF
      0100FEFFFFFF000000000000FFFF010000000100000000000100000000000200
      0000010000000200FFFFFEFF0000FEFFFFFF000002000100FFFFFDFFFDFF0000
      FEFF0000FFFFFFFF00000300FFFF00000000FDFF000002000000FFFF02000000
      0200FFFF010001000100010003000200FFFF0000030001000000010002000000
      0100000000000100FFFF00000300040000000100020002000000010000000100
      0000FFFF02000300FFFF000000000500FFFF0200000004000100010000000300
      FFFF010001000500FFFFFEFF00000300FBFFFEFF00000200FDFFFCFFFFFF0000
      0000FDFFFFFF0200FFFFFEFF05000C00FEFF0300040011000000FDFF28005800
      0C002300440092002B006E005200B500FBFF240033004C003400A00003000500
      16005000E2FFCCFFEDFF060067FFE0FEC8FF8BFF8DFF3CFFB7FF69FF9FFF5FFF
      E9FFC0FFC7FFBEFFAAFF3DFF0D002400FDFFF9FF3D00870027004C00B4005B01
      6300FC008800FD009500550199002C0180003C016300B900A8008601FCFF1E00
      1A004F00A4FF73FFDBFFC7FF4CFFCBFEBAFF4EFFA5FF88FF7FFFF6FE61FFF7FE
      62FFABFE7AFF2EFF27FF3FFEEEFFCFFFFAFFF1FF6B00DE0038007C00E700C801
      80004901C7007E01F300160238017402E2002B02D0008A01170186021A007600
      26008700A9FF88FFE4FFFAFFEEFE3AFE54FF8DFE1AFF96FEBBFE86FDC0FEC0FD
      F3FEBDFD69FF0FFFEFFED8FD27002B00EBFFFEFF6400C60010004B002D010702
      190196024D015E02E9010604C8017E03BE01E303F700F8019D01710354000B01
      8D002D01DFFF190007002700E3FE5BFED3FE8DFDBCFEE9FD06FE2AFC21FE7BFC
      27FE38FCD2FECEFD1CFE5FFC2EFF1BFE59FFD6FED0FF83FF04001A000E01C401
      890153034C017E022C025C04F90107043602A9046E010D034F028E044B012C03
      010109027E0071012200630046FF34FF93FE25FD0BFF67FEF5FD34FC27FE87FC
      ABFD74FB67FEE1FC7FFD52FB78FE9DFCF9FE11FE86FFD9FEEDFFEFFFE2005501
      E301DB0388010C037902D2048E022805DA02D6055E02E9040803DC0559023905
      6A01EB02080171024500AE00A9FFDEFF5DFEFBFCC0FEADFD8DFDB5FB3DFDAEFA
      B8FCC8F92CFD40FAB5FCFFF91AFDDCF935FEA3FC69FEC1FC31FFA8FEB0FF18FF
      2E015602D100B90146020A04C0026C057303A60600033B069A0396064303DD06
      35024104F801FF0336016B02B200D0014AFF10FF60FFDCFE14FE03FD3BFDCDFA
      AAFCDEF9B0FC69F97EFCC4F983FC2AF9D3FDD5FBDCFD1EFCB2FE78FD4EFF9CFE
      F6006D013601D3023D02E7033E0384068703AB06B8038107C403BE0620040C08
      B2024205CE023E05DC01AB036E01EB029EFFD1FF43FF4FFE0DFEE0FCCBFCFEF9
      32FC15F9EBFB23F8C0FB87F844FB44F750FC0AF989FCE7F926FDE7FAEAFD4EFC
      6AFFCAFE2300DB001001CB018902AD041D03AA05BB03E30615044107DE04CB08
      20042208E403FD0651035B067402640428019B021C00AEFF7BFF47FFC7FD1EFC
      37FD34FB37FC3DF91DFC4EF92DFBCBF7EEFB58F819FC57F99CFCF0F94FFD8FFB
      91FE49FDA4FF09003C00B700EC017A03D2023905B103CC0605047007E904AD08
      8A04BD082304690706042E075503C70560024B040A01B1016C008D0074FEC0FD
      4FFD13FB32FC64F99DFBBEF7C2FA28F79FFA0FF629FBDCF7D8FA42F7AEFBFAF8
      53FCBAF900FEA5FC6CFE9AFD750063008801FF02D902ED0464038F06AA04DD07
      20057109F90482084505F708B004C507FE03D3065D022504CC0175021C004800
      DDFE91FDA2FDB4FBC7FCC3F9A5FB9BF8DDFA0BF724FB55F7F3FA94F775FB34F8
      D4FB4AF90DFDA6FA78FDCBFCF2FE64FE8700D001290236045803F8064504B007
      2A051D09BF04D4081E05B208CD044F082C056D08E4033A077C030C0575014302
      C5FFDCFEACFD96FBC6FC4AF9FAFBC3F819FBD6F710FB42F747FA60F646FA46F6
      C4F9E0F5F7FA17F798FB7BF963FD47FC03FF0FFFA300B001EC010D04B8025B05
      FA0364061F04B1075D05D408770544090C060C093305D00885042D0613030504
      3A01E500220056FF85FE5EFC1CFE52FB77FCDAF955FC4EF8EFFA43F7CDFAC4F6
      3DFA5EF7F9FA8EF75DFBAAF96DFC54FBD9FD7DFD30FFDBFF8D004D02CE01F404
      57036706EC038008A204A10839053609AD05F1085605CE08260513085B041406
      DE0296041401A500E0FFABFE85FE6BFB1AFDBAFA4DFC76F87AFBE8F7B4FAFDF6
      DBF946F610FA23F62FFA95F680FA1BF8C2FB3CF9FDFC26FCC0FE20FFAAFFAD01
      0102D20383029505E003FE060404D00672051D085405B108C405DD08DE052808
      E804DD06B203A404BB01B3001D01E2FEECFE7FFC65FE58FB2EFDA7F998FC66F9
      5BFB27F8EDFA38F7BDFA50F74DFA49F812FB43F9D3FB32FB57FDC2FD71FEA000
      3C005102A3010E05700291069203CA070D04D5071F0519092C0561092D06F208
      9405A908F404CA064A033C04DD014A000D007EFEC7FEBCFBE1FDE6F9D6FCACF8
      C0FBD1F7E2FAADF623FA82F568F907F69CF943F615FA57F72EFB88F932FC2AFC
      49FE33FF67FF34010A01A1041702AF0590034B07060459072805C4082706E408
      6F06FC086B061009AE050507D004AD04A102DD006A01FBFE0C0000FCC0FEB7FA
      A0FDC6F98BFCCCF8ECFB0CF82AFA0FF754FAA9F7E4F99FF7A5FA5BF9E6FA47FB
      A7FCEDFD0EFEA90028FFED02FB00AA051902B5066E034E089203390851052D09
      A005300927064C090C06BF08A205B1061B041F0416021C000E0175FD4DFFE0FA
      28FE7CF90DFDA6F846FCB7F7EBFA1AF7CAF9AEF58BF9B6F529F9E1F597F990F7
      5DFAEEF908FCF6FC3EFD5500EEFE420293007E040502AA050B03F50638049A07
      5405C5082706DF09A60655090D07F50844068B060E0536045D034200050256FE
      66007AFC1BFFCEFA3FFE10FAAFFCAFF8C4FB2DF882FA77F632FA54F792F9DCF7
      16FA92F9C1FAA0FBBDFB39FE4CFD0B01B6FEB1027B007B058B01FD060F035108
      D103C308B6045E09B905FF093306F708AB06EA08A30581061A055E04C1020900
      9701D1FDB5FF3EFBDFFE67F975FD81F852FC62F76DFBE4F6E9F94CF557F9A1F5
      B1F81EF655F994F7A3F9E2F930FBA1FCC2FCDDFF50FEC201DEFF610475013106
      FD027807DA0353082905ED085F06460ADA06410949077B09C806080727060B05
      0E04A700EA0275FE1D012CFCC0FF7CFA2FFE8EF915FD89F8FCFBE5F7ABFA5FF6
      10FA7FF67FF970F753F9C7F8ABF95EFBC4FAFCFD8EFC650110FE1D031C00AF05
      93019207CE02C108940390099804EB09E805280B6C06CA097A07C309C0060707
      1706DB04970310003C028BFD1D00F1FAE3FE1EF9B7FDDCF77DFCECF66AFB12F6
      C1F9B5F4EEF873F40AF8B7F540F8F6F6F6F8CDF94BFA6BFC52FC3200CDFDFE01
      DBFFAE042701BB06DD021A08D203F60840057A09AD06DE0A6807BF093E08B609
      94074707FC062305A0049100550302FE5501A5FB030002FA9EFEE4F84DFD2FF8
      21FC6DF76EFA64F67AF9FBF5A4F879F79BF89EF837F9AAFB5FFA1DFE61FC0902
      C0FDC803E1FF52062A011B08D1027B09A403FF09F404580A5106610BFD064A0A
      DF07B3093C0741078D06AD04200405009502E7FC8D007BFA10FF88F8CCFD45F7
      76FC6AF664FBA4F59FF981F4A7F8F3F3C1F76FF5C0F7A7F677F8B3F9BBF94BFC
      EBFB670065FD5602ACFF01051001F306E4029B08D60324095805D909DB06E80A
      B807550ABB08BC094808C907A6072E055605FC00BC03B2FDC101A1FB27009CF9
      F2FEC1F87EFDD2F763FC60F76DFA3AF659F9C4F53DF807F719F874F8AFF859FB
      D0F908FEE4FB09024BFD1C0478FF8F06C70053088802EB097503310AE104BB0A
      6306700B4607E00A4108C609D307C7072407BE04D5046A000A0378FC160150FA
      58FFDEF72FFEFFF69AFCAEF58FFB64F57AF9E9F365F892F344F78EF43BF753F6
      D2F702F923F92BFC51FB2D00EBFCBF0238FF4C05D1006A07B9022F09E003BB09
      7005790A2D07740B2E08300B53094B0A0B098B0860088D051E067C0136045EFD
      4A026EFB6200E3F83BFF67F87BFDE6F664FCFCF617FA61F5E9F860F592F7FCF5
      75F72BF8EAF796FA31F9FEFD31FBC601D9FCB304F6FED6069500EA085E02690A
      9503DD0AF504180BBD06F80BAC07650BD108470A77081308CA07EB047C057D00
      6B0302FC8101D9F989FF18F760FE7CF696FCC7F48DFB0EF538F93FF310F86DF3
      BEF6D5F3C1F655F632F7A6F8ACF86CFCC1FA3800A5FC8F03CEFEBD05C0002408
      91029B0915047B0A7B05A30A8C07EB0B8108600BD909BD0A8A097508F708AF05
      A9064A01950406FD9B02CDFA980042F860FFDEF785FD36F659FCA0F6F6F9FEF4
      9BF83EF52AF772F50FF714F861F754FABEF812FEA4FABB018DFC3D057FFE2B07
      79007B092002B40AB0038E0BDD041A0B04076C0CDB07690B3E09CB0ADE080808
      63084B05F8057400DE03FBFBCF015AF9D7FFBAF682FE06F6C7FC65F487FBA5F4
      32F90AF3B9F728F36DF674F340F6E5F5B2F65DF822F81CFC2AFA100037FCB203
      45FE00067C007A083902C6090C04050B5505A00AB307520C9F08600B430A5A0B
      F9098B089F092A0641075D012D0520FD01035DFA1701FBF797FF53F7E0FDEEF5
      56FC0CF60BFAD5F437F8B8F4DEF628F56CF661F7DBF62AFA09F883FD0CFABE01
      F8FB4305FBFDAE071C00E509D901230BA203380CD704700B2E07FE0C2508CE0B
      B509940B730970080F09DB059E06B10069040CFC3302EFF83F0043F6A3FE4CF5
      01FDDEF359FBB8F32AF9A4F224F747F204F605F378F5D0F425F61BF85BF759FB
      A1F916009CFB9903E9FDA4062900DD082C025D0A1904B00B9305280BF607D50C
      3209ED0BC20AF90BBE0A1709420A7F060608BB01A60509FD740309FA6B0175F7
      C0FFAFF601FE61F532FC45F5F5F998F4B2F706F481F608F5C3F58CF662F639FA
      5AF700FD96F9070271FB5C05A3FD7508BEFF610ACF01D20B8C03C20C0B05EA0B
      46073E0D9F083D0CF409CF0B220ADE086F09C2055207ED00AB0498FBA90297F8
      67007BF5CBFE9CF408FD45F34AFBF6F207F954F2D0F6A7F1AFF5E2F204F518F4
      B9F51CF8DDF6F1FA34F937003EFBB0039DFD3E07EAFF60092202EE0A0C043C0C
      C105B00B0308000DA7097E0CF90A320C730BCA09A50A7A06CE085202EA05C8FC
      04040FFA9001DCF60D0059F60AFEFBF448FCC0F4D2F95EF476F79DF317F6E8F4
      5EF5FBF5CDF5FCF9E2F6AAFCF9F8D90102FB5C0521FDBE0878FFDC0A8B011C0C
      7403340D0905550C4707610DF308B50C260AEE0BBB0AA609D109C40514088D01
      07056BFB36039EF8A900E6F439FF45F426FDC7F277FB73F2EFF8F5F1A9F643F1
      3AF595F2A9F48AF317F59AF76CF6A1FA74F8C5FFDBFACC03FAFC5F07AEFF120A
      CD01440B1704DE0CBC05320C3408570DFD091D0D5D0B860C0A0CBE0A320BBD06
      8B0911036406BAFC8A041BFAE60157F65700D4F529FE65F453FC1CF4A8F9C7F3
      2EF70CF396F552F4EDF45AF51CF529F962F655FC2CF83201A1FA8D057CFCC008
      50FFB40B3901740CA103FE0D1105F00C9E07D10D4B09650DB20A5B0C530B910A
      7F0A1A06C3082C02950570FB9F038BF8070174F460FF98F348FD33F254FBAFF1
      CCF85EF144F6AEF0CAF4FFF12FF41AF384F4D2F6F2F582FAD1F72EFF88FA3204
      76FC6D0792FF050B9401AF0B4804B00DC305CB0C8508BF0D530AAB0DE00BD90C
      8B0C6D0BD60B0307190A6403EF06C2FCD804DCF94F02FFF56A000EF55DFEF4F3
      29FC5DF39CF94FF3C3F68FF244F5EEF369F41AF5A2F483F8E4F55AFCA3F7AD00
      41FAF1050CFCCF081DFF950C0401E90CAD03A40E13057D0DC107190E8409D90D
      050B9B0CB40B200BF90A64063709630207068FFBDD032DF865013CF467FFC8F2
      7DFDD1F126FBECF0D0F8EFF0DCF52BF08BF49BF1AEF3D4F21BF41BF665F557FA
      52F794FE12FA4D040FFC62074CFFA20B6C012A0C41041B0EDA05580DA508030E
      9E0A320E320C2D0D0E0D100C5D0C9B07B30AC2037D0740FD4005B2F9C10217F6
      9B0060F4ABFEC2F317FCBBF2B2F9F7F271F61DF20BF58CF3E3F3D5F433F4C9F7
      44F512FC0FF71C00A6F9D60592FBC908A9FEFF0CC500730D8303E60E1D05150E
      C207410ED009570E4A0BDB0C3A0CAF0B760BF406DE09A702940607FC4804EDF7
      D60139F499FFF8F1BBFD73F112FB23F0D4F86EF085F593EF44F411F12EF365F2
      ACF353F5D0F4DBF9C9F614FE8EF91B04ADFB9207F7FE060C52010B0D3904850E
      1306450ECB08620E210BFD0E9D0CAD0DBA0DD30CF80C6F08720B3E040F08D8FD
      B6058EF92F032CF6C700A6F3D5FE50F3EFFBFBF194F969F2FEF580F1A7F4FBF2
      4DF358F4AFF305F79BF470FB7EF6A9FF12F97D0527FB04094DFE230DA3005F0E
      6F032B0F4905F80EDB077F0E3A0A020F9A0B380DC80C3A0CF30B92077E0AFC02
      14076CFCB104B5F733022AF4BEFF38F1E1FDE0F0F6FA72EFBCF8D9EF2CF508EF
      F4F391F0B1F214F23EF3CBF43FF455F953F6E7FD0DF9D10364FBFC07A5FE270C
      4C011F0E2904D80E53063D0FE208AF0E8A0BB80FE30C060E4D0E670D650D0A09
      0C0CA304860836FE180685F9830311F6EF000FF3F4FEAEF2D3FB6FF17CF9CBF1
      AEF50CF14EF470F2CDF2FFF33FF37BF607F4CDFAF3F567FF84F8FA04C9FA4509
      DFFD0B0D88003C0F43034F0F7905BA0FD507A70E9E0A850FCE0B710D530DAE0C
      510C1D081F0B75037F07C2FC2605C7F7820200F4FEFFD4F0FDFD23F0F3FAFEEE
      A4F82BEFF3F4AAEEA7F3EAEF46F2BAF1D0F238F4B8F3A0F8D5F591FD7FF84C03
      07FB2B083BFE160C3701F70E0804270F8D060310EC08080FFE0B5210260D650E
      E90EF20DD60DB409CA0C51050B09AFFEB106CBF9DD03F7F54B01E0F206FFF8F1
      E3FB12F151F917F185F5A7F0EAF3B4F174F299F3B3F2D4F57DF304FA59F5F0FE
      F4F777045AFA4A0972FD010D6400EF0F1D03D00FA3056210D8072E0F030B1D10
      0C0CEE0DEE0D2C0DC20CC908D60B2A04F9072BFDB50514F8CD02CEF34E00A0F0
      F7FD45EFFCFA92EE5AF858EECAF430EE22F317EFF1F149F132F287F346F3E6F7
      2CF507FD14F8EB0296FA1C08FBFD380C10018A0F0E04EA0FBE069D101609C30F
      640CDC10820D0F0F730F730E4C0E790A730D1906870926FF340717FA2204D4F5
      9A01B7F2F9FE28F1EFFBAFF0FEF850F064F547F05EF3EFF028F23DF30BF23BF5
      18F371F9A6F456FE89F73304D6F9190937FD3A0D22004B102003A110B105D110
      0B08DB0F3D0B68106A0C7B0E460E6E0D3B0D6809490CB1047F0890FD170630F8
      1703A3F38E004DF0FDFD7CEE09FBFCED1CF8A4EDC3F4B8EDB7F24EEEC4F1D9F0
      ABF1F0F202F367F787F461FCC5F7C60224FAD307D7FD8E0CD300C70F2904E910
      CA06F1105B09A010900C2611FB0DC20FC20FAC0EE90E3E0BDF0DBC06330AD2FF
      8A076BFA9204FBF5CA0195F21BFF95F0EDFB43F0D9F8D2EF4CF5F0EF03F366F0
      E6F101F383F1BFF4B2F2F8F804F4AEFD22F7DE0350F99808F5FC520DC2FF4E10
      20033E119805E810420859104C0B4F10E20CE90E780E7E0DD90D390AA70C1E05
      3D098AFE620651F8A20303F4BB00EFEF3AFE7AEE00FB96ED19F882ED99F483ED
      76F2F2ED6FF183F042F15DF289F239F70EF48DFB4FF7B402C0F9370783FDC20C
      96005E0F23048611CC0622119E091411AF0C5211790E5A10F50F110F980FBD0B
      2E0E7707FF0AD800CF07C2FA2B0581F6DE01BDF25BFF04F1CBFBC0EFCCF833F0
      02F5B6EFBEF25BF063F148F213F1C3F415F241F883F3ADFC7EF62F03EBF8C607
      83FCB50C94FF8A0F05030112B505C2107108BE107B0B43104C0DA40FB70E040D
      780EE00A020DDA05040ACEFFB206A2F8340411F5D5007EF07EFE75EEE2FA6DED
      21F8D6ED60F48AED5DF2A4EDF8F09CF0F8F059F2EFF159F6B5F3ACFAABF6E401
      7FF9720612FDAE0B8800820F0604731102073611C009DC10EE0CB311D80E5510
      4410250F20100D0D970E2208AF0B2A02240801FB98052FF8FF0170F280FF01F2
      A8FBD0EFBCF8EDF0C8F42DEF88F25AF0EDF0DBF1CCF0C3F373F1AAF72AF3C2FB
      CDF57D02B7F85B06EFFB480C80FFC10EC2022311E805861071088D10BC0B2910
      900D130F0A0FDD0DEE0E2B0B780D7E06A40ABD00190709FA9F04D3F51701F5F0
      A2FEC4EFEEFAA4ED18F831EE4DF46BED24F288EEAFF080EFB5F05EF279F1A3F5
      6AF33DFA15F6F1FF52F9F40590FCAF0A7C00910EBC03D11034078011B8099410
      2C0DD210F80EC01095102E0F6D10760D150FD208330C85049F084FFCED051EF9
      4502DDF384FFBDF2B1FB10F09BF8FFF0AEF469F04CF2D7EF9AF07CF172F059F3
      E0F0E4F6C1F21BFA27F5970060F8E20579FBDD0973FFFB0DA102E00F0806F210
      8D08B50EDD0B9510AF0D0E0F420F150E3E0F760BD90DEB07FF0A5602920750FA
      B50494F75E011CF287FED4F03FFBE3EDE6F78FEF7FF48BED01F2F6ED9EF054EF
      78F016F240F1DFF460F317F9BAF56FFF5CF942044DFCB3088C005B0D7C03F40F
      7207D910BE093B10410DB311090F72109A108F0F74101D0EFC0EBA0A700C3305
      B2085DFEF40584FA62024CF582FFF3F2B5FB54F152F8CAF0E5F4C4EF0DF2A1EF
      A0F014F13AF0B4F21BF141F583F2B5F924F540FE5AF82C0471FBE90759FF9C0D
      B5029E0E5C06F5108008600F040C7510B70D300F6B0F850E1D0F070D520E6D08
      500B2204DD0719FCBD0429F89E0188F236FE10F1DEFACAEEA6F718EE5FF4FBED
      AAF112ED58F0C7EE76F0F4EFE2F04AF4FAF2A7F78CF564FD44F9830332FC1E08
      A8007E0D20046D0F9607BC12260AA610690D6812990F6811AB1075112911FF0E
      9E0FA00BCE0C1707FD0860FF0306A8FA9D02CAF5E9FE69F314FC88F0F2F703F0
      E8F4CFEF61F1D8EEBCF0B2EFD0EFE3F1D4F0F4F48EF2FEF704F5FFFC45F87603
      15FB6607A3FF7B0C6102600F73068A119B08A50F260C4D10A90D5810520FAC0E
      700F350DDE0DC6095E0B3305B207FAFCE00443F8240114F449FE49F0F3FAD6EE
      54F7A1ED58F427EEADF1EBEBBBF01BEE0FF0DCEF71F113F3F3F2D9F6B6F564FC
      DBF83E03B7FCCB068400710D2C040710C507F412690A68112F0DB312580F5512
      E710CC10D9103A108C0FA00CD40C8608470949007705D3FB8B023AF6E8FEADF2
      E1FBC6F0C2F7B2EF36F5B1EF02F22EEEA5F0CCEF36F088F001F166F386F2D7F6
      B6F455FC8FF8AC0257FB5A074BFFE20CBA02680F48064311BA086310390B7310
      100EB010A10E640F490FAE0E6E0D820A9D0BE5053507E0FD720433F875017FF3
      F2FD1DF006FBC4EE23F707ED07F544ED24F1C3EB15F1D6EC5BF09FEED9F136F2
      E5F2C9F614F6B7FB45F9F3024EFC9B07A000680D3E048B10EA0762132A0A1813
      680DA812590F9C133010D711AC104D11330FE10CEA0C4E09C508EE00370623FB
      6E0204F60BFF9AF2BBFB4DF056F8A9EE33F5F6EE12F27DED36F1FEED5FF0DBEF
      1FF144F36EF20AF719F5DFFBB3F7C10254FB92070BFF6A0CF8023510A0053D12
      C708C411D40A9010650DB411FF0D970F2E0FD60E5F0DC50A4D0B8C06B0072DFE
      AB04DEF76E013FF3F1FD77EF71FBB9ED62F78BECF8F4B6ECF4F1ABEB2BF12EEC
      8EF0ECEE96F1DBF191F3D7F697F5A8FB38F92D035CFC0608A400B80DE603A711
      7207C1136D0A29146A0CE112560F5514C80FD7113C11CF11A00E270D980D5109
      F708DB005206E3FA70028EF585FF0EF20DFC1CF0F8F78BEE86F53AEE31F225ED
      18F17DED1CF077EF4FF1A2F223F214F769F4BDFBC4F76B0217FB9807DCFE8E0C
      820244101F06481269087B129C0A10115D0DD3113C0E0410200F090F820DEA0A
      2E0C8C06A807B7FEF40429F87C0103F392FECBEFD9FA7EEDCFF78FECF9F4ECEB
      36F207ECC6F0A9EB08F1B3EE6AF184F10DF3C9F646F54DFB17F999020DFC4708
      1400440D2704DF115B07ED13410A0D155B0C1B13AC0F8914CC0F6D123811A511
      600F950DF90D6A095E09B9018806AEFAF202CEF52BFFE7F1D1FBA9EF37F824EE
      8DF5B1ED3DF2F4ECFDF081EC73F023EF57F0C1F1EBF1CEF6D2F339FBDCF76D02
      7DFA620737FF750C44025110B0058B12F007E512B90ACC119F0D69127B0E9D10
      E90F370FFF0D3D0B620C8F06DE0703FF6605A2F8A90177F3B7FEFFEF6EFB80ED
      04F872EC05F55EEB22F262EBBEF06CEB68F065EEEDF07CF1DAF2AFF6D6F47DFB
      B3F8F301A8FBCB070E000A0D54039A1149072C14FE092315B30C1E146B0FFD13
      8210DE125C111711BE0F0E0E070E1E09150AA302CF0650FB58031CF6AAFF18F2
      34FC8FEF30F81CEE6BF50EED37F224ED82F07AECD2EF05EFEBEF9AF175F1AEF6
      0BF3E4FA3DF77C0108FA2A0798FE1C0CAE010610E9059612410825132B0B1512
      E70DD411470FDE10FD0FB80E970E7C0BE90C9E06F1082F008905EBF8590206F4
      B8FE23F088FBC9EDA0F729EC3AF5B7EBF5F1C1EB89F0E8EBF1EF54EE86F0A6F1
      1AF259F64DF4F9FA75F8680188FB6D07F0FFB90C5603D81073070C14EB095F14
      E10CDF13920F3713E41003136E11CA1053105F0E430E8709990A6903D406E7FB
      CE03F0F676FFC3F25BFC53F0EAF79EEE68F5DAEDB1F13BED4FF0E4EC32EF8CEE
      82EF6BF1EAF0B4F5EAF281FAD5F68A00E2F95F065EFE500BA701210FC8051112
      87088E126E0B64124C0EA411AF0F63117610FC0E0F0F4B0C3A0D150787092D01
      CF05ABF9BA02DDF491FE76F096FB71EE0FF757EC03F5FEEB5CF165EB69F0D5EB
      35EF7DED55F012F17CF17DF522F4AFFAEFF7C500ABFBF206D0FF380C7F032610
      77079413410A5414FF0C7614E30FCC134111BC13B31179118B10EF0E8C0E040A
      F70A4804F206BEFCD903E4F768FF2AF315FCFEF090F764EE2FF5FFED6BF1A3EC
      01F0F5ECB9EEC4ED5BEF08F14BF0C4F4C9F2E2F960F693FF05FA8105D6FDA20A
      DE016D0E7E059C11D8086612670B7B12E70EDF11D60F8911B110730F2B0FA90C
      660DBC07AD090C020B0695FA1803D1F5B6FE04F18BFB48EF09F7A1ECE1F4B5EC
      3FF177EB7BF062EC76EF34ED67F0F3F073F1E6F424F469FAA0F7280068FB5806
      79FF7A0B9A03780F4807A812980AF813F40C0714FB0FD513BA105613A611A611
      2A10C90EAB0E490AEC0AC504680780FDAB03C9F862FFABF3BCFBD7F185F7AFEE
      F4F497EEACF1B6EC4FF058EDDDEE89ED63EFDCF036F03BF4B4F27CF911F6D2FE
      2AFACF04EFFDA7090B02B70D9205811032093712630BEE11D00E2812CE0F2811
      B910E10F1C0FA90CA70D5908F109CD024806A7FBC402F1F6C1FED8F112FB48F0
      0CF733EDA9F472EDD8F1CEEB6EF0C0ECAAEF24ED49F0B8F082F161F4E6F3DFF9
      C0F758FFBBFB8A05ADFF4D0ABA03B70E54076211A70AB513A50C4513DA0F1B14
      9F10D11280110D12F50FBA0EAA0EEC0AC60A5B0527077FFE5703B8F958FF83F4
      77FB8BF2A2F749EF01F5FEEE04F2FBEC2EF04DED22EF5FED5BEF4EF06FF09AF3
      C3F2D0F87FF6FBFD4BFA13042AFE7A0816023A0DB705660F1D094C12820B8A11
      C00EF112C70F1F119010C5102B0F130D9A0D4B09FD0989035C06ADFCB302B8F7
      ACFE7DF2E3FA82F038F794ED8CF43AED06F2C3EB4DF014EC9FEFC3ECDDEFA8EF
      82F1A9F3CEF30AF9CCF7A9FEB7FBE904D5FF8509A503990E5C07C110C00A3714
      020D5713FE0F33150E112713B1111F134110570F980ED40B1C0B12063D0773FF
      780337FA66FF05F57EFB76F29FF796EFC7F476EE18F207ED06F06EEC10EF09ED
      21EF18EF76F0F9F287F2CFF758F655FD37FA530323FEC607F101C90CCA05CA0E
      36096B12A40B8911AF0E881316107A1192105C11760FA80DB00DF209750A4704
      600690FDCE023CF8B4FE3DF3DDFA79F037F72DEE79F4C6EC27F222EC13F03FEB
      87EFA1ECACEF91EE5DF140F397F30CF8B5F73DFEC2FB4B04C4FF0109B203380E
      78077D10E50A4C14320DA8132410AE157211EF13C7119513BF104410D70E740C
      970B120746073700A203E6FA4BFFC3F54BFB77F286F71AF08DF410EEF8F147ED
      9FEF79EBDBEEC4ECA1EECBED1DF046F234F28BF620F6B3FC0BFA46021EFEF306
      0502ED0BD6055C0E4A09F811DA0BE811BC0EB01355107412B8109411F10FDF0E
      E20D920AD00A8505830668FEC70238F9A0FE11F4B2FAB9F055F7B6EE44F4ADEC
      2BF24CECD7EF8FEA58EF45EC48EF81ED2BF167F289F300F792F78EFDC1FB5903
      C8FF5B08BB036C0D7F076010050BCC138B0D6E142810C015D6114515DE11C713
      2911D411C70E040DF00B77084E07F7009F03DCFB3FFF5CF62DFBB5F2A5F764F0
      4AF4EFED27F21BED68EFDDEAD7EE08EC59EED5EC2DF024F110F278F5F9F5A5FB
      E9F94B0102FE0F06D201FC0ABD05070E42093E11F50B66127E0E59137F107B13
      8810811121102B10C90DF30A3A0BEC068B0636FFF1025DFAB5FEC9F4D4FA7AF1
      7FF728EF67F41BED7EF258ECEDEF99EA75EF9AEB41EF16ED2BF167F166F359F6
      70F794FC96FBB902B8FF96078303920C86071B10D40A3213BF0DEC14DD0F8D15
      1C125116AF11DC139A11E112C80E7C0D6D0CA7096407BF01C703C2FC39FF07F7
      33FB5BF3B6F79EF04DF45DEE36F201ED66EF00EBABEE2FEB39EE9CECDEEFF6EF
      F9F1EDF4ABF578FADEF9B500D8FD1105C001070AB3058A0D19097510120C6412
      310EE812AC102014421093118910E310AB0DA40BAE0BF107780620002D0340FB
      90FEC3F5F7FA51F287F7ADEF90F4F0ED7AF28BEC01F006EB46EFEFEA3EEF26ED
      E4F04EF07DF3D7F535F76BFB9DFB26028AFF6E06A003970B7B07780FE60A7512
      DB0DA214D30F52152512B21695112814D6117513C40E860EAF0C7E0A5D07EC02
      D903ACFDFAFE1AF843FB1DF49BF731F17CF424EF0BF207EDA6EF56EB60EE68EA
      61EE68EC7CEFBDEE3AF239F45AF52AF910FAC7FFA7FDD103F801E0088805A20C
      3409A00F010CF1112B0EC71292102E1445102012A0104611B30DD50CB40B9208
      8B06A101110308FC79FEFCF6FEFA1CF3A9F781F0B7F4A8EE73F2BCEC56F07CEB
      23EF70EA83EFDFECC0F056EFF4F331F5E2F63DFAECFB360145FF7905D9038D0A
      11078E0E1C0BCA11950D1414CC0F2C15C4117A16A111DA148E117D13D10EB50F
      900CF20A8B075E049B032AFE0AFF43F930FBDEF4BBF7ECF178F4A1EF1BF242ED
      B4EF8DEB36EED5E972EEE0EB56EFE0ED56F23EF30EF5FAF730FABFFE56FDEF02
      1C02B4074005CD0B8209390FC40B77116F0EE2125A1040149D10351373105C11
      3C0E5A0EAB0B36090C072403DD0289FCC2FE58F8A7FAC3F3C7F72AF17EF40AEF
      7CF21EED18F05CEB0AEF00EA50EF48EC7BF0B3EEB9F30CF4AEF66CF9E1FB3C00
      2BFFB804130487092507FB0D610B7411860D9C131A106C15A6117A16FB11D715
      88119713640F2311670C680BF607B4053B03ADFE3AFF7BFA99FA59F5E6F7A0F2
      12F4EFEF34F29CED4CEF3CEB4DEEACE9F8ED0CEB3BEF59ED06F2F7F112F540F7
      F8F952FD7EFD16023E0272066505050BA009890EF20BE310980EE61247100314
      E2100514801098118D0EA80F880BE2096007B204860273FDD5FEB7F940FA97F4
      FCF745F220F46FEFB7F2BDEDD4EF40EB4EEF35EAE4EE59EBC2F06CEE67F3BCF2
      EEF6A6F8A2FB90FE9BFF0B0400043C087D072D0D660BC510D50D3C1309103915
      C1113F16101291169A110C148E0F32126B0C650C09082607E6028CFF1EFF8FFB
      3CFA32F6E5F787F3D0F311F06CF240EE0DEF10EB8AEECAE9AEEDF5E98FEF21ED
      C2F162F079F552F6C5F99EFBEEFD7E010B020E05C705480A6809D60D2B0C8610
      460E75125A10121493109C1495104A12790E9410BC0B4B0B4F07ED058F029DFE
      B1FED8FA2FFAC3F5EDF72EF332F4FAEFF1F297EEDAEF43EB98EF6EEAC3EE93EA
      FEF044EE1FF348F13EF7DEF75AFB0DFDEFFF5A03CD03DA06CC07840C030BD60F
      F40DCF12980F9614C2118516A011BE16BD11E714480FBA12920CB90DCB07E407
      0803C200CAFE6BFC56FA49F7CAF751F412F4BDF07BF2FCEE5CEF32EBC3EE20EA
      D0ED82E9BCEFE5ECCCF153EFABF592F5ADF94AFA34FE9900F101EC03F8057E09
      1E09BB0C4D0CF90FD20DAD1168102C1430106814C5105A13320ED910120CB50C
      13078C06BC023B005AFE8FFB5FFA28F7BAF719F484F4E1F0F3F214EF25F0A8EB
      8DEFA8EADEEE14EAE2F0BCED21F368F033F7D8F670FBA6FB00006902DC03DC05
      E007910B040BE20E0F0E9112810FE013EB11A3168611B616F91120162F0FFF12
      EE0C350F9307AB082E033F0259FEF4FC76FAAAF852F700F549F473F136F226EF
      93EFA3EB76EEC1E9E4EDEFE874EFE6EBCBF17AEE7DF5EEF3D4F904F930FE60FF
      2202E0020A0649084409E20B530CC50FE20DF8107D10851443108B14E410A214
      590E43114A0C770E0D07A907CC02CF0110FE89FC63FAADF865F7E3F4BCF4A1F1
      B7F25FEF5FF01DEC36EF2BEAFFEEC3E96EF09BEC4CF3A6EFE6F601F5B6FBA7FA
      E1FFE20034040A05D407690A3F0B580E120E3912A20F7F13E5111917A6111417
      0D125F175A0FC813160DF210AA07CD092903BA0321FEE8FD50FAD2F909F772F5
      43F406F2EFF1FCEE8AEFABEB07EEE0E8BDED66E8E6EE41EABDF164ED08F5F4F1
      FAF9D6F7ECFD9FFD72022102E9055207A2095B0B510C6C0F3D0EE8106E10E714
      A7102A15F610F015C90EB312760CFB0F69073809CE023E030BFEB2FD4DFA99F9
      46F7A0F5B7F45CF290F254EF74F065ECF1EE84E9EAEE75E900F0F1EA3DF3F6EE
      87F632F3C3FBA5F9C7FF55FF71048C04C8076309A30BB30D280EE111F20F6C13
      CC112F171B12AD17FB116518DE0FF714300DE2112F08630BEA02BD0428FE05FF
      07FA7CFADBF652F608F45CF2DDF1DFEE84EFD1EBB0ED43E896EDEFE779EEC6E8
      8EF1AEECA2F419F002FA98F6DDFD0DFC9B026A01EF051C06F309B20A5B0CFD0E
      720ECE105B10AB140311E215E2109916470FED13830CC610D7072B0B88024304
      27FE2FFFF9F985FA3EF7D0F69BF4E4F2B9F2B8EF70F0F3ECE6EE7CE9D7EE55E9
      EDEF12EA25F33CEE7FF6A6F1DBFB5DF8D2FFF3FD8A048203D1073008B90BE10C
      EF0D1F11F60FF81274118916311217189D11631828102816F10C63126C08300D
      9D027C053EFE9A00B3F93EFBE5F668F70FF401F305F286EF9FEF64ECDCED68E8
      A9EDEBE77FEE12E88AF1C5EBD5F4E6EEEEF950F501FED3FA9C023E0008062C05
      C909AF09400C270E4E0E6010DD0F2114EA102A1676108C16600F3615220C3111
      2F08F40C43022D0544FEEA00D9F94CFB92F71DF8BFF4C3F31FF3A3F0E9F09AED
      61EF3EEA22EF8DE94CF0D8E963F37FEDB8F6EFF0BFFB01F70500D5FC5C045302
      B00736075E0B870BB00D0010690F4012B8107115C311CA17F110E717DC0FD116
      8A0C52128D08780E560259064EFEE601C9F902FC3BF7A5F85EF4F3F3ABF278F0
      4EF027ED93EE8CE91CEE36E833EF55E8BAF13DEB3FF5B2EED9F9F7F359FE11FA
      4F021FFFF705570469095808F80B320DC30DAE0F490FF2129610DB15DC0F2216
      2F0FC215DD0B49114408290E1702300663FE060207FA56FCACF744F912F5D5F4
      83F393F15FF17AEEC3EF25EB80EF90E9BCF0FAE94AF3BCEC0AF79CF083FB95F5
      48003DFCF703F700F2076E06020B380AA90D3A0F0A0F8E118410B5147411AF17
      B410AB17E80F4617720CB212A608790F4C0266074DFEE302B9F90CFD2EF776F9
      7EF4C4F4BCF238F169F0B8EDC2EE2CEA21EE1FE84BEF5CE894F13FEA78F52EEE
      8AF98EF293FE3AF92B02ABFD440685032D093307240C690C8A0D120F220F7512
      5010A315DE0F34160E0F3416F70B3C124808150F4A02D3071FFE040325FABAFD
      78F7FBF942F5F7F570F362F2AAF123EFF9EFF0EB86EFAFE9E7F01EEA23F3BCEB
      47F729F02AFB27F49D003AFBDE0395FF39089605CA0A1609D40D3B0ED00EF110
      5410111441112317B410AD17AB0F95177D0CB8138E081C107D022C09DDFD8B03
      F8F964FEDCF6DAF9C0F404F686F2B5F1E5F06AEEC7EEA8EA4DEE22E864EFF8E7
      96F143E97CF57EED5BF93BF1D8FE1BF805027DFC7306970209091406510C7B0B
      3E0D890E1B0F041222103B15F60F9E16EA0E8D164B0C79134608CE0F9D02D009
      D4FDC80374FA4EFF11F7A3FA8DF552F74CF3F6F226F20FF0FAEF6AECDEEFFBE9
      E9F0D3E938F348EB27F74EEF2FFB45F38D00D3F9E50394FE2C083E04B20A2808
      A30D1D0D8B0E4A1012105713DF1047169610A117580F2D17A00CA1144C084010
      D502E90A88FDFA035EFAE6FF8EF655FA43F561F783F276F299F1A9EF13EF96EB
      F6EE0BE99CEF44E8F2F169E985F5E6EC86F9C0F0B1FEBEF63002B8FB46061001
      02095505E20B110A200DDB0D8F0EFC10D70F7214AC0F4D16D10E5A163C0C6B14
      2C085310E702930B91FD8704ABFAE500D5F64EFBF9F5D0F81DF3CEF3B0F270F1
      00F0FDEC48F0CDEAADF083E975F342EBE3F627EE56FBCEF260002AF84504CAFD
      FE078802D90A6D07650D9F0BA20E9E0F9E0F7B12E010A1155B105B17510F1917
      6B0C72155708DE10D202570C5DFDFC0464FA1D0181F637FB6EF580F88DF282F3
      16F2BAF053EF40EC76EFDAE9A8EF2EE860F2A1E954F5D3EBE5F98FF078FEFEF4
      9F0215FBEC0532FF3C09D0046A0B6908300D500DF70DE80FC90FD113340FA815
      B70E4C16E30B07153C081011D902E50CA9FDE005B0FA1A0201F76EFC08F6F2F9
      6AF312F50FF371F288F0DCEDBBF0A4EB09F19BE9D3F355EBE6F644ED99FB6DF2
      310074F68204E5FC9A07C400FA0AAD06C40CEB09990EEF0ED00E2D11B410E214
      970F5116380F1A17DE0B7A156508BD119A02120D99FD78063BFABB01C1F682FC
      78F553F9FEF2D5F458F297F1F0EF42EDE0EFABEA10F04DE8A0F2D3E98BF52DEB
      09FA35F066FE84F3BB023CFAC605B2FD24090A04050B2807250DB30C700DF00E
      920F2A13A90EF614B70E79165E0B3E1573084312A702B70D01FEA30753FAA402
      65F70EFECEF571FACDF38CF603F3F6F21DF104EFC6F0E6EB44F1C5E9D5F302EB
      01F782EC83FB6AF135000AF59A04BBFB9F074EFFF90AD405C10CF708A90E600E
      A90E4E10A6109714680FD515400F8F17AA0BF015A30868137F02E70DD2FD2B08
      C7F95002E2F6E6FDECF49CF91FF302F6F6F1FDF145F0ECED93EF7FEA3AF048E8
      49F2FCE89DF548EABAF9CAEE92FE79F2BA029EF80E069DFC3209E6023C0B8A06
      1F0DB80B5E0D6B0E6D0FC812850E9B14A60EED164F0BD1159108F2138E02760E
      14FE93090CFA57036CF7A0FF8BF5EDFA1FF411F802F377F39EF1E4EFDDF0FEEB
      B5F118EAACF352EA61F7F9EB65FB26F0910016F46C04F5F90D0857FEB70A6A04
      E00C39085A0E290DB10ED10F2B10C2133F0F6415020FA4178C0B701676087214
      7302CD0EDCFDBE0982F92003D9F61BFFD0F44CFA4AF32EF7F9F163F2BBF0C8EE
      CFEF8AEA88F09AE859F22DE807F624EAA7F94EEDD4FEB8F19A02DDF66606FCFB
      D7086501660B1806B90CBB0A5D0DFA0DB70E04126C0E5114200EFE163C0B3F16
      46080415B8029F0FFEFDED0A00FA69045CF7BE0097F5F3FB41F4F7F842F371F4
      26F2C7F046F16FEC27F27AEAE8F312EABFF7DBEB50FBCDEEC70086F34E044BF8
      3B0894FD530AC002E40CD707C20DBA0B630E1D0F4D0F9A12ED0EFC14390EFC16
      5D0BAF16070800159202B50F94FD840AAAF94804CCF601001AF53FFB85F31CF8
      A0F28DF347F1BFEF81F03FEB27F17CE9DAF269E86DF644EAD2F990EC17FF55F1
      7C0291F578061FFB88083400440B7C051A0C8509140D2C0DF50DFD10020EBC13
      650D5216180BB716C9076315C702CA10D5FD880B42FA0F0643F7500102F661FD
      78F4C2F9D6F3C6F578F26FF1FFF13CED86F218EB58F4E7E904F8BFEB96FBE1ED
      C700D1F23F04C2F64E08B5FC320A6C01C70CEC06770D8C0A3C0E520EA90EAA11
      990E6814AF0DAF16470B1F1791076515B202E71059FD360BBEF9AE057FF68A00
      55F5A9FC7DF3A1F8F6F29AF481F11DF011F1EEEB61F16DE932F34EE89AF6BEE9
      0FFAB8EB0EFF31F09D027EF48E0612FA900825FF240BA304000CC908CC0C700C
      710D3E10AE0D9713FC0CF815EF0A28177107A815E6023C1298FD1B0C55FAA807
      1CF7260256F6CFFE7DF451FA4BF4DDF6CBF228F29BF2E5EDC7F274EBDFF42FEA
      34F874EBDAFB1FEDB700AEF17404D2F526083EFB2B0A8100840CD605390D040A
      B70D2A0D1C0E1311330EF5132C0D4F16140B61174507C215B702491216FDAE0B
      D6F9470763F6300173F5E0FD87F3ECF83EF3B1F5A6F18FF068F180EC9BF19BE9
      92F37CE8A3F622E951FAF3EAEFFE1FEFCB0299F36106B8F8D0086DFEE30AB603
      F20B3908670C7C0B240DC40F340D1313980CA115C20A7D172B072E16E4025613
      86FDF50C81FA0A0918F7080381F6C5FFB0F41BFB99F4DEF714F3E1F222F3C4EE
      37F3F3EB4DF596EA50F8EDEA23FCDCEC80007BF086042EF5F407CDF9620AF5FF
      2A0C7104250D56094D0D060CD50D4E10B70D4013F90CD015E90A94172107E815
      9E02401323FD7E0CC5F9740859F6150269F5CCFEADF3D9F93DF34FF6DDF16AF1
      C3F11AEDD3F105EAD4F37FE8A9F6C3E892FA75EA96FEDAED0703E0F23C0669F7
      1309C3FD9B0A5602120CC607040C640AD80C170FE10C5D127D0C6F15970A6E17
      18078C16DA02461490FD170E56FAFB0951F7450468F6BB00F9F42DFC92F493F8
      94F313F458F3A0EFAFF37CECA8F5EFEA7FF8C7EA47FC64EC490041EFB90483F4
      AE078DF8920AE6FECC0B2303260D8008B50CCD0A8A0D2D0F2D0D8712B10C4115
      7E0A22171B071C166402CA1344FD7E0DA1F90009B9F69E0342F568FF15F41BFB
      49F3FCF673F2F9F20DF2E9ED7CF2F8EA38F431E9DDF6F1E8A7FA3EEA82FE1FED
      0F036CF20D0651F62709DBFC540A4501C60BD206870B4109800C130E6D0CBF11
      310CC914500A22171B07DC169202BF14E0FD280F36FABA0AD8F7EC0525F64701
      A2F590FD6EF437F922F47DF568F336F04EF476EDB5F533EBABF8C9EA51FCCFEB
      3B009AEEA3047BF3A7078CF7A60AB0FD950B2102F80C3B07870CE409430D200E
      EC0CD211900CA214580AD316FB067A16340213148DFDD40E71F9A9091EF73305
      07F5E5FF8AF47EFCEDF27DF7EEF22CF4F9F198EEFCF2E0EB1DF45CE931F7F5E8
      72FAB2E982FE76ECD2024BF131069EF5F10884FB5C0A6100870B65057E0BB208
      100CBB0C620C3511F80B2614300AF6161507F516940228152BFE7D1014FA5C0B
      4CF87607EFF51102F3F50FFF28F4C7F9A8F4E4F670F30CF1D5F460EEC7F557EB
      F5F81BEB0AFC32EB3C00FCED650431F2CE07E3F6560AF8FBCD0B2801820CA805
      880C33099A0C8C0C0F0D3411090CD3135F0A6B16C4066C16510290148BFD0310
      6BF9600A6CF79A06D1F4DC00B2F4A5FDCEF256F852F37BF5F2F1ACEF86F3B9EC
      3FF4BCE975F757E94AFA29E9C4FE26ECA1021DF0570638F5AE08CBF98E0AC5FF
      EE0AC103880B2F08820B350B6E0CC910470B3D13300A8816A006C6169B028915
      0CFE5F1162FA310C63F8B30809F616030EF60D0064F4EAFAE0F414F8E7F356F2
      64F54BEF2BF60CEC39F982EB1DFCF7EA6800DDED1F0447F1FD0771F6F1095FFA
      D10B6100B90BDF03860C7208C50BF20AF80C8910390BA3124E0ADC151B06DF15
      5602BF1459FD7010ADF9580B64F762071AF50B02C5F453FE31F39AF988F341F6
      A7F20DF1ECF39EEDD4F48DEAAAF7D3E99BFA3CE9C4FE26EC9F0242EF7406D2F4
      800881F87C0A10FF880A56029A0BA507E60A080A740C1010BB0A5C12300A2F16
      FC058016D402F415D1FD1712AFFA6F0D2FF8570971F68704C4F59E00B9F458FC
      D5F485F889F4EAF36CF5C8EFB4F6C5EC48F971EB57FCF7EA420046ED42044DF0
      F007B3F5CC091AF9C10B4AFF9B0B7C02790CBC07780BBF09F60CA20FD60AD311
      0F0A7215B60573157B02321526FD0511F3F9870C48F7EA075BF58F0358F4D3FE
      94F306FB5CF3CDF64AF3B0F2DBF31BEE85F56FEB80F7DBE9F1FA69E983FE79EB
      E602ABEE3D06E9F39F088AF75F0AB3FD9A0A6B01760BA106D00A4409610C350F
      830A1712FA09CD15CB058316E802B416B8FDE112D0FAE30E16F8210A77F64F06
      59F51201DCF4D7FD9DF4FAF8D5F44DF543F5F0EF2EF76DED0BF91EEBAFFCBAEA
      110039ECBB047CEFC10748F4540A05F8A60BCBFD150CB301500C8006CD0B4E09
      B20CB20EE00AAC11BC09F614A605D5155502CA151DFD0012EDF9E20D06F7CB08
      40F5D804F3F351FF9CF352FC16F333F797F3D7F3C2F368EED5F510EC6BF75DE9
      51FB66E971FE9CEA400328EE310698F204090FF7280A47FCFA0AC900450B7005
      110B0809E90B070E960AD91158093F15CD05A1169702CB1602FEBA13A6FAEC0F
      42F8ED0A5BF6520759F5F701E6F4D7FECEF4B6F938F55FF682F5AFF0A2F7F1ED
      27F908EB13FDEDEAFCFF81EB0E050FEF920703F3A10A93F7530B0BFC550C1401
      FF0B1305E80BEE082D0C340DD70A6E1123092B149805C2150402C01551FDD012
      9EF9A80E1AF79B09EEF4CA05F6F35B0052F310FD60F32DF8A0F3B0F41BF429EF
      EAF554ECB7F790E96AFB6AE982FE1DEA6803B8ED2606A3F1230969F6D909C9FA
      300B3B00E20A3204230B9F084D0BC00C950A8B11B0083514D605651649027E16
      55FE6E1476FA56108BF8F30B46F6FF07A2F51903E2F475FF46F5FFFA61F52EF7
      02F6CDF1BFF795EE9BF9A1EB28FD16EB3B005EEBF404BFEE920724F26A0AD8F6
      0C0BD9FA320C2300C90BC403BF0B2208AA0B000CAD0A9F108608501376059D15
      AD018615A5FD741353F91D0F65F7C30AB5F43D063FF4C80103F3B0FDD4F394F9
      90F32FF581F45FF0E6F598EC28F8FDE963FB63E9B6FE0CEA600336ED3B06CAF0
      1209B0F5EA09B9F94F0B46FFF40A49031E0B0908370B020C6F0AFD106D08FD13
      B90581164002AE166EFE41154DFA1E119DF82B0D02F69F08B7F58A04A9F4FEFF
      ACF531FC41F576F777F6D7F2AAF78CEE18FAFBEB0CFDC1EA9E003FEBD604DFED
      CD0760F14F0AC9F5360BE7F9220CFBFEE40B1603A20B5407840B4A0B630AE60F
      3E08F3124405731587018B15ADFD3C1433F9BE0F54F7D80B80F4C30640F40C03
      ECF222FE0AF4A1FA84F3A9F5D5F443F1E6F5C7EC80F84CEA61FB34E918FFDDE9
      3E0376EC720638F0EE08AAF4260A1DF9120B1BFE3D0BE602E90A1407310BA80B
      140A32106D08ED137C055A163202EF167EFEF01550FAC1117EF8340EEAF52F09
      D8F5C3059AF48B00CFF550FD59F5FFF7B9F6AAF39CF7C4EE5DFA33EC20FD90EA
      CC000EEBAE042AEDFA07B4F01D0AA4F4500B17F9F50B9AFD2A0C7202440B4306
      690BD30AF909FA0E2D08BC12E20413159D019A15AAFD91144AF95F1029F7A90C
      A6F47F0748F4130407F3EFFE36F491FBCCF373F6FBF416F2FEF56BEDC9F8EDEA
      82FB7CE930FF13EA1E0318EC7A06EEEF8608A1F30A0AA7F8BA0AE8FC3F0B5402
      6F0AEC05FB0A070B9609FD0E32082E131805B8154C029F167CFEFB15A3FA2A12
      8AF8DA0E6CF6C709F5F584060AF58D01FCF51FFED4F510F9DDF673F404F8C3EF
      9BFA9DEC55FDFDEAD9001BEB9704D5ECEB0738F0C609A3F3520B8DF8B70B4BFC
      300CC001F40A0A05500B340A8809D20D06084212A604AE14B101901585FDBF14
      7FF9F810FDF6530DD9F4400819F4D60466F30D00FFF338FC1BF469F7E6F49CF2
      63F626EEBFF8F6EAD7FBB0E93BFFE7E91D03B5EB5C0654EF6708CAF20D0AF0F7
      870AD5FB510B9501450A1805CB0A5D0A3009390E1308BB12DE04681550027616
      68FE0916EBFAC31253F84E0FA6F6B20AD5F51E077EF5D302CDF583FE5CF63FFA
      DDF6E2F47DF8A8F095FACBECD0FD70EBD00009EBA30476ECBE07BAEFBF09CCF2
      180BBDF78F0B50FB0A0CE900CA0A2904E50A46093C09180DC9077F1165046114
      8E015A156AFDED14A1F96911A0F6C90D0FF52909DAF34A05C2F34D01AEF3AFFC
      A2F4B5F8BEF4F7F2C4F62EEFB3F81BEB52FC29EA25FFB2E9440393EB5006B9EE
      8A0832F2DD0919F7AD0A20FB350B9D00540A6904700A87094209D20DC2072312
      DB0484153102991677FE6C16E8FA631323F8F00FDBF6D10B91F5B707C9F54504
      8AF52AFFC9F66EFBA0F638F5E8F86EF179FADEEC2FFEAFEBB400C3EAE00450EC
      9607E7EEE70920F2EC0A85F6C10B87FACD0B78FF050B8903860A24085B09BC0C
      56078C10850457144301201572FD141587F9F5118DF6760E12F55F0AAEF3F505
      F9F3C50273F347FDD7F4BAF994F462F30AF7F0EF8BF84CEB9BFC6FEA1FFF90E9
      780355EB2106D6EDD00894F1B909EFF5FB0A83FA050B53FFD30A1F04180A6B08
      8A09B00D630750112905B815DD017216A5FEE916D3FA0D1425F8C110B6F6F30C
      7EF58908CEF5780565F5DDFFD0F64CFCAFF6CAF502F90AF282FA1BED67FEE0EB
      D4007EEAFC04F4EB8B07ECED360A7BF1C90A2DF5150CE6F99D0B08FE850B1503
      010ACD06A8097D0CCE069F0FBA044A14CA00C814B0FD5D154DF94C128AF60D0F
      DFF4340BADF3D106D9F3A10376F33AFED4F47AFAC5F45BF405F780F0D6F813EC
      A8FCDAEA60FFD6E9710363EB400672EDD70857F19E09E4F4160B2AFABE0A12FE
      010BB2038C091607A909560DC2062510500535156901C615F6FED216A8FAF813
      77F81C1191F6880DC1F55B09B4F50306B5F5EE00CEF6E3FC23F7FBF6FEF89CF2
      E8FA4AEE53FE33EC3001F4EAE604E8EBB5079EED210AFDF0CA0A3FF40E0C5FF9
      6B0BC0FC8C0B5D02A5097D05A809DD0B59066F0EC804D51375004B14C9FD5815
      16F95512B8F6A80F97F4B60BD7F3D20798F33D04D6F39AFF91F402FB51F5B7F5
      D1F607F154F937ED5EFC05EBE4FF4DEA44034EEB840642EDB308DBF0C1093CF4
      020B81F9AD0A01FD1E0BCD026109130695097D0C7F065E0F5805A9143D017115
      08FF9116AFFA01148BF89A1166F6E20DDDF56E0A9DF58B06FAF565029BF628FD
      A5F763F8BEF8D4F260FB56EF05FE20ECC70172EB960481EB24084DEDE50944F0
      140B82F3CC0B5AF8A70BBCFB890B6001BC0999048109F20A4906FF0D9F044113
      4D002A14B0FD3B1508F9BE1291F632103FF44C0CAFF3FF0849F3D504D6F3D200
      43F453FB99F5F7F68EF61FF1A1F912EE2CFCF5EA5F00A9EA1303AEEAF6061DED
      A8081CF0390ABBF3DE0A86F8240B93FC030BBB01A60995054A09A60BA7064D0F
      F704FF1354019515C2FE8416C5FA59143BF80A124AF6720EA2F5640B6CF5EE06
      00F686037AF696FDDBF75FF98DF800F3B8FB0CF0E9FD1AEC370285EB9C0413EB
      A50833EDDC0987EF870BFDF2CA0B4DF70E0C38FB620BF7FF060A27042309ED09
      4C06FB0D1F0469126A007C1426FDE9140BF90B130EF678102CF4080D14F3C409
      2FF35F059EF3DD013BF4D1FB97F5B0F7A5F67CF1C3F9C7EE27FC14EBB900E3EA
      3D0399EA600721EDB20883EFC00A7EF3D90A9CF78D0B19FCE10A8800F8095305
      E408A70ABD06390FA0043D138701B8155FFE0C16EFFAA514DBF755124CF62E0F
      29F5110C93F5D007D7F55804A2F645FECCF7F6F9DFF8CAF398FB64F011FE71EC
      60029CEBEA04F7EAC708CBEC180AE6EEE00B83F2BE0B10F64F0C8DFA610BAEFE
      420AA503BD089E087406D70DBB038911730074149BFC83141FF98E135FF5C510
      F3F3DA0D79F2AC0A33F3790626F3B30254F4EAFC6AF581F8E3F671F2A1F919EF
      A9FCADEB0301E5EACF0372EACD07B6EC5A0910EF1B0BC0F2250B6DF6E50B4BFB
      0D0B61FFFC098304BF08AF09AB060F0F170499123701A615BAFDF71583FA1815
      EFF69A1207F62F1078F4050D79F50B0967F5110502F7B8FF9AF7A3FA70F9EFF4
      D7FBD9F010FF6EEDF502B1EB08060FEB8D0983ECFD0A64EE6A0CA3F1450CD2F4
      990C82F9700B26FD170A69025D085307D705080DD70280108EFFDC138BFB5514
      0CF8A91336F4481128F3FD0E82F1E90BBAF2E207B1F2CE0390F4A6FE45F55AF9
      97F7E6F30EFAACEFD2FD9DECDD01A9EA670583EAD208EFEBA10A35EEEC0B6CF1
      080C14F5240CA8F9540BB4FDD40919035B086A08D305200E3303FA1110008515
      6AFC33164BF9D615C2F5C7130BF5E11188F3A20E45F5290B4CF5D10678F7E301
      22F81EFCBAFAE8F6D5FCD4F19B004EEE7D04C8EBD607FBEACF0A9EEB600C55ED
      4B0D24F0D50CF3F2890C14F7720B06FB4D0914007C076C0572041F0BA7017E0F
      CEFDB4123EFA0E14ABF6CC1315F3171224F22F10E4F0530D89F20C0AA4F27105
      26F50001E0F50BFBB1F81DF6EDFABCF026FFD0EDE1021CEB9106A7EA9B0978EB
      580B78ED300C3AF01C0C52F3E20BB3F7F60AE3FBF90813019807C706AF048B0C
      55020411FBFE6414EDFB1C168DF8131678F5A814B6F40C13BBF3511064F5240D
      E4F58A0848F820040EF903FEB8FBC6F8E1FD0DF3B1017AEF42053AECB708F8EA
      630B17EBD60C7CEC4B0D73EEEF0C2CF11C0CE9F4FD0A2DF96208C2FDCB06DC03
      3F036A09B200440EC2FC87118BF9CD13BEF5F1137DF28B12ACF16111ADF09C0E
      64F2AC0B01F3EE0699F516037CF6C3FC5BF99FF7ECFB2AF2DEFFB8EEDF03D2EB
      7307D2EA6F0A9BEBD20BF6ECAA0C58EF5E0C4DF2B00B22F6DF0A90FA760862FF
      2507C805AF03140BC9013D10E9FD5A1345FBAE15AEF7C11517F5E71420F4BD13
      9EF3231158F5780E22F6D00993F8A605AFF961FF70FC1FFAB1FE42F48E023CF0
      550613ED9C096AEB4C0C3FEB840D2EECF10DBAED290D0DF02A0C30F3D20ABEF7
      D10706FCFD054D023502B907B2FF040D55FB3A106AF8DF1261F4B0137AF1B312
      52F0FB1116F0950FA4F12E0D04F391089DF5B00459F7C9FE16FA21F921FDCDF3
      05018CEF5605EEECC6081AEBE80BAFEB370D90ECBB0D70EE1F0D0BF1F30B46F4
      D00A34F9BE078CFD4C063B04A002740993001E0F77FC4C12ECF9151541F60D16
      C2F35B15F3F2B01414F34D12D4F4121062F67B0BF8F86507CDFAA10136FDA4FB
      4E0001F6B30320F1F30734EEB70A92EBDB0D79EB610EB6EBA50EE3EC720DBDEE
      FC0B7CF13B0AF8F5CC06F4F908054800DC00AC057FFE260B0DFAC90E6AF7C711
      2CF34413C6F09A12A2EF5912E4EF53107EF13A0EA8F3690A3BF665066BF83C01
      FFFAD6FA73FE02F6C201ABF067066EEE7309E1EBD40C4EEC800D79EC2B0EF7ED
      EC0C14F09D0BD0F2E60985F70207E6FB20054202C601BC0795FF680DAFFB6B11
      21F92C1494F52A1662F38C1579F2521545F33113D9F44A114FF7650D92F9F008
      42FC000412FE1BFDB301F5F758040EF2E208AFEF2A0B32EC6C0E31EC9E0EAFEB
      BE0EA0EC010DC0ED460B55F0130958F4D50575F8A20330FE3C00F10378FDF708
      A0F9400D98F6FC0F21F35D1298F0BE11DFEF03127CF06E1037F2BE0EB6F4A40B
      0AF79207DCF95103A2FB84FC73FF2CF805026EF2F70677F02F0961EDE40CAFED
      290D36EDD50D6CEEE40BA7EFD90A6EF2A1083FF61E06D5FADA03160060012A06
      9EFEF40A5EFBD60F91F82312B2F50D154DF35514E5F2AE14DCF3FF1298F58211
      32F8780EAFFA350A8BFDFB051DFFE6FE9D020BFA0705DFF34F097EF15F0BDAED
      9B0E96ED840E7BEC8E0E11ED170C6CED940AC7EF8607D6F20E0542F7F701D7FB
      A6FF06020AFC380632F9800B97F58C0D1EF3ED105BF04B1029F04211D9F0D70F
      DAF2010F75F58F0C14F8080912FB1405D4FCC6FE420038FAD3029CF42E0763F2
      8C096EEFE80C2EEF560D57EE7B0D24EF490BADEF0F0A25F2550724F55205F9F9
      8B021AFE00018F0489FD91085AFB320EDEF7081010F6CE132AF31D139CF30214
      30F473129FF6C711F4F8080F08FC870B72FE3C074E00E6000F0387FBB605FBF5
      3209E9F2A60BB9EF500EA7EE740E7BEDEB0D73ED580B76ED8D097EEF4906E0F1
      1F0445F6CF00F8F910FF3A002DFBDD0300F9B60926F5980B64F38A0F6EF0120F
      C8F06D102AF1310FCCF3270FFEF5000D57F9520AB5FB34061BFED300660092FB
      A803D4F6D406E9F3FF0994F15C0C73F0800DBFEFC20CBDEFE80A10F0140901F2
      8706B6F4900435F9D401D4FC9300040314FDCD064FFB7D0CB6F7650E64F64912
      93F3F7113FF41813A9F4D31186F7D51194F9410F06FD8E0C03FFF10767019102
      09038CFC2E06DCF7A60810F4DA0B7AF1580D7AEF790E71EE1C0DE0ED0E0BDEED
      470837EFA4053FF17D03B1F5630007F978FE76FE57FBB00290F8E80740F5400A
      06F4710E82F1FC0E43F1DE0F02F2080F3EF53210CAF6DB0DB1FADC0BD8FCE407
      06FFCE027600FFFC990463F9200734F6560AC0F30E0CB1F12D0E8CF1DC0B06F0
      C00A9AF0FC07EBF19F05DDF3CB024DF71F012AFB85FFEB0029FC48044AFAF709
      5AF7990C9DF5CF0FFAF3C91008F4EB11EDF4EA1024F7E71032FA450FC0FDA70D
      C0FFA70898029504B30379FE180710FA700969F64D0D71F4010EE7F12B0FF7EF
      790D44EFB40B60EF3E08D1EFA4068CF2A70242F5CB00ACF889FEDDFDF5FB3F02
      92F809077BF52E0989F3C30C47F17F0D24F1C30E85F2DA0E09F4E20E21F77C0D
      8CFA2E0C95FD7C085FFF7D047900F4FDCE0360FA9705F9F5090A92F43A0B6CF2
      8F0CC3F0CC0ACFEF9109F1EF450791F1960513F4CC022EF7ED00A8FA79FEC7FE
      59FD1B0460FA0B09A9F83F0CF6F5240F2BF5251010F51E12EAF6C9113AF9EC12
      24FC0A11D1FEE90E3F023F0B06042F076005240136071FFCB80907F8C20C9AF5
      FC0DAEF2D00F0BF2C20CC6EF850ACFEE3A0761EF4F0577F1A701E1F3CAFE5EF6
      64FC95FA8AF9A0FEDCF62F037CF5DE072EF2210AEDF0460BD4EFAF0C26F21F0D
      9FF3330E3BF7D50CD0F90F0C8AFC47072DFF8F04C0014B00E00336FC3C07EBF8
      2F0AABF6DD0C07F50D0EC4F3340DFCF2CD0AF2F2680753F2840649F5E30334F8
      5B02D7FB1F00C2FF52FE2104B9FBF70801FA510C20F8B80F24F68C103BF46B10
      65F65410FDF70A11EDFB1B10B5FD0E0EF900C509EE01D605C403F7FF73068AFC
      810830F8410A4DF4D40B38F18A0C67EF3A0B3CEE370865EDB2059AED8B0211EF
      56002BF1B7FEE3F57CFC6AF9C1F9FAFD04F7250269F581065CF3E1095EF2D90B
      BAF1260EF0F2B70DA2F5990F93FA651013FDAF0F8A003C0C4B015808B8039C03
      390516FF650952FC8D0BD3F9F80C3DF6370ED4F4650DFBF3650B1EF45608B5F3
      9D05E8F49B026CF699FFC5F859FE82FC55FBD50061F8DD030AF62207B6F4290A
      A9F3830CEEF29D0DD5F4270E81F6E90E4AFAD10DBBFD530DE200120AD901E005
      53037200790529FC7B09CBF9DB0BCCF6630ECBF4740ECEF28E0D11F1A50BA6F1
      0E09C4F1A8050FF341027DF39FFFFCF6B6FD65FAA2FB17FF11FA7D047DF66707
      D6F4220A41F3380C97F2250E8EF3830EFEF48C0E32F80E0E41FA0D0C36FEA209
      8DFF7906B0008F018102CDFCF305CFF9FD0893F7980AFBF4750BEBF29F0937F1
      F306F0EF650584F02303ABF26A00CBF3FBFDF1F62DFD68FAA8FBF1FFB1FAB704
      ACF8D808FDF6A30B13F5C10CC4F5350F4DF71C1005FA6D1172FDE610A1008A0F
      6F04DF0D0806FD09CF082E075209E201AF0B8EFDFB0D1EFA3B0F3EF75D0F06F5
      E20C00F2A80A5EF1E90682F09C0472F1B90162F397FD53F52FFBB2F755F852FB
      7EF6A0FF4CF30B0330F1DB04D0EEC406A5EDD407B4EFF30811F3740B8BF6000C
      78F9D90A99FC3D08D4FE8D05D000760233031CFE3C06BEFB9B081CF8A60B67F6
      AD0DC2F5260D2CF59B0B82F5F008B1F43A07D0F6AE0468F891025BFBA400A0FE
      DFFD820108FD2D06AAFA450982F9D40C21F7840E5DF6450F90F73610ABF98E10
      70FDD11002FF700E0501020BAE0161067003FE010805E2FD26071CFAAB098BF6
      120A36F32B0BD9F0020AB2EF9707D1EE65036CED5B00A2ED72FD58EEA7FA6FF1
      51F9D6F4B5F79DF981F679FE92F43F023EF4EF06B8F2B30928F2490C5AF30C0D
      C7F6B50E7AFA840F01FE920ED001110EED02710AAC05660740084A04990B7301
      F50DF3FEB40E41FB5D0F1CF9640D73F6EF0BC5F50B08FCF4E004BFF483017CF5
      A5FE32F7AEFDD3FA11FB9CFE87F9EE0134F6D204EDF374060FF20A080BF19409
      CCF1130AF2F3600A62F8A10AEAFB4B0A7DFFDA08D30131065B03ED027E05E1FE
      5A0867FB540BE8F80D0CBFF5D60CDEF32B0C78F1510B85F295081DF2C906CEF3
      7C0372F51A004DF715FFBAFA1BFD6DFE2BFB9B0283F72505E4F5770714F3A409
      EBF25C0BC1F4B50D71F6140EDFF9AA0E6AFC840D75FF390B1C005C0832013204
      6902B0FFAC03D7FAEE063BF813082CF56C09AEF3EF07D1F12C07FAF1690411F1
      C9015DF202FF3AF3C1FB56F503FA47F722F96EFB0FF9120073F7080460F67307
      8DF59B0A4DF6FA0C60F8820FC7FB9A1017FFC711C301ED0F8804DC0DF4063B0B
      1309F607A50A5F04CE0CFBFF910FE5FD0910AEF94D1148F8EA0ED4F53B0C3CF4
      8B07EBF12C04A7F14300CFF151FC60F356FA90F560F72EF9EDF5EBFB93F30200
      81F01802D7ED810470EC6C05C1ED1107F4EF990792F44709DCF7C80876FADD07
      B6FDAC05C600DA0354031901960511FEE70832FCA00928F8EB0B91F7770C17F6
      670CEAF6110925F6BE0770F7560576F8F102A8FAD00108FE1600880102FEC003
      A2FB67075DFA50097FF89C0C61F7480D1AF9111034FB3C0FD2FED40F2A01A40E
      4803AF0C89039C0811044A046C05DBFF5A0637FBC707B3F7E407E2F3120975F1
      A907D1EE8C067BEE8103E8ED97FF66EE8FFB29EE0FF955F026F7C7F28EF59EF6
      0DF45BFAFBF203FF8EF0FE00DAF0650584F16108FBF3C50CBBF6290DA5FBD40F
      18FF320F0302B70EC804E30CFC06EC0A8308DA06520BDC02650EBC007D0F40FE
      7B10A3FB2410E0F9B70ECFF8270B89F7B4078DF78D03D4F79EFF88F82EFDECF8
      46FBF0FB0AF964FE6DF6630185F3AA026EF2CF0533F1D1061BF37D0993F4EA09
      4FF8CB0B74FA0409F0FD7508C0FFCB050A028903CE0390FF29065CFC7B0845F9
      690A7BF6A80B74F5040CCFF4030B93F3A6086AF35B057BF34F02ACF480FF05F6
      D9FDAEF880FC88FBF8FA0BFEE4F89C025FF643055DF5F70846F41D0AD4F5EC0C
      BFF75E0D01FBB80E14FD580D4B00520C50019F08E4024406AE03780254055CFF
      1F06CDFA10084BF89908CFF5A9087EF40C0732F36505F6F26201F9F1E9FED8F2
      F4FB8CF4A1FA5DF740F927FA88F878FD19F76D01D7F4160484F4F7073AF5740A
      B3F76D0DACFA150EDDFEFC0F0502A30F0005D00EB2076B0C170A3C0A960A2306
      590CED02A30DB7FEF60F2FFCBA0F5FF82210A7F6910DB6F4550A07F4740564F2
      91021FF347FD92F309FAEEF480F7EEF68CF5D3F9D9F1AEFB29F072FE03EE9001
      0CED000460EEA20682F1ED0725F4CB09EAF654092AFA8909A3FCCA0777FF1306
      FB01F8028504780046068AFD77094BFBCE0B79F9A60D45F9960C45F83D0B01F9
      500789F8A305A0F9DC023BFA1002BBFCBEFF9BFEFFFE4A01D1FC9D03F3FBB806
      E3F9670971F9BB0B7EF9900D48FC970EEBFD410E3C017B0D9302320CAF037D08
      C2042A051C0604019806CFFC070792F816082AF60A081EF30D0837F11F06BFEF
      25036BEF69FE60EE95FB1EEF8AF8F4EF93F778F251F50EF56AF421F950F2C5FC
      46F14E000EF01804BFF16E08AEF2630B8CF6F00DCCF9180F4DFF960F9A01DD0E
      9D05250E8307640CDD093C09120BF305C70DE002AE0FA8003510FBFDD010E7FB
      3F1020FAD00C69F8CF0841F7AC05DFF7A7019DF770FE56F868FCD9F901FAA4FC
      DEF527FE63F43B0124F2280313F20005D6F1E906F0F46D0893F620092EFAA908
      2EFCEB0794FF98065F0084049902E401030479FEA40678FBBB072BF8BA0A00F7
      450BD7F50C0BFBF4A9084BF40D065EF43802F8F4CDFF6AF604FEA6F87EFC6BFA
      7AFAE2FCDAF86DFFCAF74A0355F647066BF6FF08FDF6390B2BF9260D63FA970D
      ABFEE10D04001F0D5402500A2C034A07F9048404F504A20053076CFD4A087AFA
      AA0961F8190963F6800847F50D0540F45C02C5F314FE16F31EFC51F4C5F973F6
      36F9D6F8B3F769FBF2F658FFE5F44B027EF4850546F5A80996F65E0C4DF9B30D
      3DFCB90E61000D0F75030D0E7B07960C5B09900A230B5907B60B3C03390E9C00
      800FD2FDA51025FB8C0FE7F7920EB2F6590A32F47D07F8F21F0312F3BAFF12F3
      1CFB47F340F91AF5D0F599F781F300FA33F0CBFC93EE220072EDC70227EEA305
      13F021075AF3760900F6040957F9EC08F9FCA10871FF920720011B054203D802
      8A0521015B07DCFD080B53FD640C3BFCAB0C36FBD60AEBF9660907FA45061EFA
      8D04C3FA170245FCA30019FEF3FD95FF7FFD2102C8FB0D0534FB1A08BAF95109
      2AFB870B36FC380CABFE6F0C4F01BA0B6303FB0AF203DD073905D504A3056C01
      F305D1FD5D0656FAB80705F73608B5F42D08B7F28D06B3F09C03D3EF96FF99EF
      5DFB0DEF0BF94BF023F6AEF271F400F5D7F2AFF75BF2F2FB2BF0FBFEDFF02003
      0CF1380789F20F0BC9F4FB0C30F9300FE6FCB00F44014110C2040E0FE407B50D
      6209090BCB0BFA07D70D550580103703DD109E00E111E2FDC310DEFB690E45FA
      D90A86F8DE077DF89703C0F7B9FFC7F738FD31F84DFADFF95AF7FCFB90F4D0FD
      44F38700CEF1D002D0F120054BF3E00564F60F0856F84307F6FBBC06A8FEFF05
      820096042D01FB01A903D2FFAB048BFDD606F7FADB089DF9BC0ACDF8C40936F7
      0409D7F62206BFF50204D2F67500FDF687FE8DF850FC0BFA53FA34FCD8F89FFE
      14F81302FEF68105E4F59607EFF6F309BFF8980BFAFA860C6FFEC20C3201590C
      A3025E0AEB03BE07EE04EF04D1052B023D061BFF6D088EFC080902FAF0098DF8
      1C08FCF58107E8F535038EF474007CF44DFDB6F40BFB9BF63AF8D0F750F7C2FA
      3CF67EFD8CF44F0037F49E030FF55907D6F5E5099CF83F0CEBFB650D4000EB0D
      1D039C0D8706910CD808700AFE09D107490B7204520D13028D0FF7FF420FD7FC
      5A108FFAF10E03F8B50CB7F67A08E5F4AB0565F53E0023F409FC7EF4CCF8BCF4
      45F6E7F605F3A8F8E5F075FB43EF08FE58EE2D0180ED2A030DF0D10547F26307
      6AF5260868F8D0075DFC4208DAFD92061A009F05AB02CD03D60416024D077100
      C4093BFF440C90FE320C41FD3A0C0BFD050AADFB4A0892FCF9043CFC2B031EFD
      580101FE79FF64FF40FEC5007AFDC803E7FBA20507FB61070AFB5008D5FCED09
      F3FD4C099A011A0ACC025208840493068A04EA028905A700460567FDC105DAFA
      B60668F8DA062EF6E90664F44C0583F2150485F20400A1F1B6FCB6F180F965F2
      38F6E0F304F496F5AEF2A6F8D7F15DFB3CF0B1FE06F0C00103F1DF0503F2BA08
      5BF5060C81F8E20CB7FD090F70009D0EC204500E8107C00CBE09520B3A0B0408
      4B0EFC068E1066052D11D302931270006312CAFE6210CBFC4F0D61FB270AEEFA
      AA05DBF9AC00A9F817FEB1F80BFBAAF930F87EFA79F523FCE5F38FFD69F2B3FF
      21F191004BF3FF02C4F4B00361F7760477F97C03CBFC7C03C3FDBC01BCFFFD00
      8F0148FF54032FFE1505E1FCE906B9FB1D092AFB6909D6FAB80816FA2207F0F9
      710435FA73016DFACDFEBBFAB6FD73FCE6FAFEFC7CFAF6FE46F9C1013CF89C03
      77F7A105F7F71D07BEF9F7084EFB260916FF8E0AC4006809D9022108BB037E05
      5305BB03B6056B019506A7FF2F08E9FD9B0810FC1B0960FAD30846F9B0078DF8
      900426F834015FF775FEC3F782FA03F80DF9A1F925F734FB65F64EFD7AF46CFF
      23F4550199F45604BEF5EC062DF8230918FB020A39FF590BB101BC0A14059309
      FA078F0842096606BC0AD403CD0CB602880E5A01D00E02FFCE0FD7FC730F7FFB
      2B0D86F9370ACCF83006D6F717026DF78CFC2FF6E9F96CF695F663F7FBF380F8
      38F10EFAE5EFBFFB8FEE40FE13EEE7FFEBEF7A02C4F12F04BAF460055CF73A05
      91FA2B0523FDE1044FFF1104C601A503E9031D036006630259087601A50B9201
      A60C2A017F0C5B008D0B6700F208DDFF78068CFF2304B0FFFA0248005200FBFF
      D6FF050133FE8A0211FD53035BFC7C0464FC4D0559FD0D0688FEF2050F014706
      750201056D03E6020604560099044EFE7B0452FC4E0471FA840520F92D059AF7
      22051BF6E10491F533033BF5090032F56CFCB5F4A4F94BF5E9F537F63CF49FF7
      9DF2C0F9E1F1FAFB55F059FE06F01A00B2F1EC03F3F2B10661F5290916F9140B
      ECFC890CC7FF6D0C0E04120CBA07B00B0309BE09710B6508C00D9407BF0F8606
      34111E059912FF02F512C1012511E7FFE50EFCFE470B66FDB90787FC9F02CFFA
      CEFFF6F985FC2EFA79F908FABBF68FFAF5F411FB33F386FC7DF26AFD39F301FF
      3CF4F6FFF2F59900C0F7050005FAC5FFF7FB2FFF56FD9EFEFAFE2DFE8F0040FE
      E50146FD40045EFDD306AAFDE007ECFDBC07D2FD0A073FFE1604C8FD9B02D9FD
      870083FEF7FEEBFEE8FC38FF6CFC4500BFFA8D01AEFAF5022FFA06047DFA1105
      76FB3906F6FC9E06DCFEF8064C01DD065D024E056503F2027204F301D3044E00
      0D05E4FE9F06E9FD600786FD9007F3FB3908E4FBE30684FBD2043EFB2E0103FA
      40FF40FAEDFBA1FAEDF9FDFA0CF838FC72F7CEFD14F59EFEF2F47FFF15F63D02
      24F7380411F887059BFB44077DFDE5077300A20758030607A00654063C079204
      22090A033D0A43025C0C9D01970DFC00270E04FFDE0E9EFE070D1FFD390ADFFB
      4A0710FB050476FAB7FEEAF8DFFB89F8A3F80DF983F5E1F8DAF265F91FF2BDFA
      1BF0D2FB61F096FD4CF05AFF6EF223016DF312026DF6A80296F8F402ABFBBB02
      0DFDB802F0FFD9025B013103F603DC02B606A0030C0A29044E0B3104960C7F04
      470BE103C609280361089B02AB06B002AF040B02ED0290014E015301A9FF4A01
      0500220275FECD01B6FE300273FE81022FFF23029FFFF9013F02C5019A01C3FF
      910233FD2C023BFC600262FA510111F91203BEF86D0281F83E03D8F79602F0F7
      030241F84BFFE7F7BCFCB5F7D4F9E8F7DEF741F901F5A5F9F4F364FBC1F214FD
      C5F19CFEBAF1D7FF90F3ED0207F54E05A2F64107A3F92E0939FC9D0A5600190B
      1503F80AFF06750A82088D096F0AE0078B0B4A07920F5B076A10BC06FE110705
      A112A10404121E03780EC400800D1C0048097DFE5D0570FC1C0114FBA6FED6FA
      6FFA4FF98CF830F941F669F9C3F4C0F98FF33DFA07F375FB96F32EFC7EF417FD
      9CF5CEFC85F7A1FD2FF97DFC3BFAA7FCC0FB7AFCF5FC55FD0FFF1BFD6E0186FE
      8504E5FF8E053B0008070F015F050E01560515017103BA00B302710173009301
      96FF35018EFD4901E9FD4902AFFD32038BFD3A034FFDF203E5FDDD04CFFD1804
      56005F05A1014505B7021D041A037701990323012B03DFFE11042BFEF504B3FD
      940521FEB20665FD99068DFDCE0539FD3E04FFFCBE01C0FBF7FECBFB41FD46FC
      8FFA19FC19F97EFC80F7A9FDE8F64CFEE1F599FE3AF791008EF721021BF94203
      17FA520426FDFB057AFFE005180279051A049B04FA05D8030306750106088601
      920AD201580CEA01D30C7700E20DE300670C41FF6F0AF4FD44085CFD5B05D7FC
      6E0101FB8EFD78FA88FAF2F916F8DFF99AF57BF9B3F395FAC6F232FB9FF138FC
      17F146FD93F22EFF13F49400DFF4C600C3F7320239F997011DFB7901A9FCA701
      91FFE5026E01ED0224053C043008B605820A2206410BF005560B1C069C0A7805
      C6099D048008FD032D0725049804E60190038E01940268013902B601E0003800
      6B00770042FF03004EFF4EFF620095FFDE00A4FFD700DDFD360079FBA6FF05FA
      70FFD1F8ACFFBBF71000BFF7C3009AF81701C5F8F000EFF85A0085F955FF32FA
      4BFC7AF9CCFA53FA64F857FBA7F6C1FB03F57FFC9BF493FE71F3D2FFB8F30E01
      A9F4C00205F639056FF74906D0F935088CFC100AE5FF2F0B8402490A7A05430A
      1B07F208FA0849070B0BCA06500E7007BE101D07F31127067912620515121804
      99104802010EEB00970B97FF910775FD18033EFBE8FF22FA78FD77F9B7F910F8
      64F70AF852F507F892F3CEF71AF21CF82BF3CFF92AF3B4FA8EF3F7FA91F4ADFB
      EFF570FBD9F6C9FA6EF868FB69FA7EFCA7FCB5FD4EFFBFFE8A022C01BF044F02
      DC05CF02F7059303E3053E0416057703460494032E0321047601F202B300D102
      3700CE034D00190454FF7403F2FE5003F0FEB9038BFF940380001604F7018304
      14025F038D01A200E50122FFE9027FFEB902F4FC1E04B5FC2605DBFD8F0578FD
      B60552FDFC05C0FD9804CAFDDF017FFC30008AFCCEFDB9FCB8FB39FCE8F967FC
      EBF85AFD53F73BFE61F637FEB4F613FF7AF7A30010F86801BAF9AC02C8FBA304
      E9FD210591FF4B04150208043D03D902C8044F0178067E016509BB01A80B7202
      880CC501570DB7012E0DFC00970B7100790921FF6107D3FE380301FD60FF66FB
      16FD15FB81FA29FB7AF72BFA57F5CDFA59F3E7FA3CF22BFBACF147FCDAF22DFE
      48F36DFF29F4480015F5D8009BF7F50014F9BB005AFBE500D8FD1502A900EC02
      7403DC0386077C05200A01074B0B6F06BE0B3807C00BD106CD0AC905E9097104
      C4086F04CA0668023705F201110443019203470177019DFF5D00A8FEF1FF56FE
      85FF92FE07FF96FD1C002CFEEEFEDFFCB7FD31FAD8FD8BF890FE9AF893FDEDF6
      9BFED0F63AFF5EF8D6FFA7F8F3FF8AF9680099FA2EFFA5FBBEFC3BFB76FAB0FB
      92F969FCA0F766FD4FF6B1FDDFF5C9FF3FF5400102F40E0251F5C00206F79E05
      F7F71C0646FA5C08CBFCFE099BFF490B8B01250A20057B0AD006D508EB08B707
      BC0ABC066B0EE306C810F4060E120E0640135B056313C7043811D002860F0701
      9F0CD2FF880804FD3E04A5FAE801FDF913FEE5F8DBFA24F721F725F7BBF415F6
      BBF22CF6A7F19EF67EF142F86EF1C0F8DCF0E7F960F1CFF963F304FB33F454FA
      FCF530FB38F81FFC87FAA4FD78FD85FEB901B70133046E03E80577043A067C05
      C3063C06FB058E05F40579050B05A70562043C05C002E4048F02E00454025605
      260151045E0063031801D303B4001304F1000B033D02F303F201BB0212015000
      E40179FE860218FE7A02E2FB03039AFB8304DBFB6705AFFCAA05C2FCC40569FD
      D1045AFDDF0112FD05FF89FB78FE71FCE1FB70FC44FA47FC1BF9FCFCF7F74BFE
      7BF5D6FD4AF66DFE14F75C00A9F7FB00ABF8460284FA8E0375FCCF04FBFD3B04
      9E00340487025803690333023F050A01AF08B801550B8102450C2E02260E6B02
      060EE602220C3D01E10AAB005E08CDFF960426FE350162FC2EFFA3FC0DFCAAFB
      17F935FB0CF6C8FA2AF4DAFAB1F23FFB57F219FCB3F255FDE7F2B1FEC2F232FF
      73F4BAFF71F6FA00FDF7500012FA4000A7FCFF000BFFC601FD028E0228072805
      080A77068E0B1F07C70B1407040C3507370B3906CE0A2605E60971047F08A503
      2106170258054401330436011702CBFFC50030FE88005DFE15FFA1FDBBFEE2FC
      18FF05FDECFD4AFCCDFC56FAD3FCC2F8E8FCB2F79DFCAAF6DAFC5DF64BFEF9F6
      5AFFEAF8CBFF19FAFCFFF8FA27FF1CFC86FCC2FC50FA18FC1AFAAFFD68F8CCFE
      69F74FFFA7F66B001EF62902BCF4C502FDF5F90388F7BD0508F92B072AFA5608
      EEFC57099AFFE50AA701CF0AB8044E0A540758093508AE07CB0AED058A0EF105
      3F112A068F1265056B14290501147904E71182027A102D01340D5DFF56091AFD
      7805EFFAD10298F9CDFE2BF8E5FA0CF7FCF6DFF595F4AFF5F0F1A7F5E2F0CDF5
      01F096F65BEFCDF759EE1DF8F4EF56F90BF19BFA3EF25DFABAF3A8FA60F6ACFB
      66F8E8FC82FCBDFED200F3013E0410048D05C405CD069B0671079C07DB06D307
      19077E078007C0074C063307A8045306100527060C0478060C03AF0550029404
      C0025D045F01510317020B038E02D2026B02050260014800CD010EFED0014FFC
      1102F1FAEC01F3F92804F9F9BF0429FB8905BAFB280504FC8E049DFCE00044FC
      D5FEB0FBADFD13FCDFFB61FCFFF961FCC6F8D8FC56F797FD40F529FEC0F53CFF
      98F63A0008F7270135F7F30188F9C60231FB580439FDC804C5FFC104E201C203
      F50140020B054F01F7079F015D0B7002A70CBA02180F24036C0EFF02A90D7D02
      A70BD801B7091401DC058CFF2C031DFEA40000FD3AFEC4FCF1F9BBFB7EF75DFB
      64F599FB7AF395FB80F298FB90F2A8FC0BF28BFDB6F104FE05F41EFF8BF51C00
      E3F675FF7CF845FF84FB81FF99FD66000B0264016E06F1032C0A7D05A10A5F06
      570CCB06E30B3B07A00B0F07C50AC5055C0B87059508CD037007AE021B06D301
      1905DE01B802B500730126FFFAFF10FEF8FE49FDFDFD70FC73FE91FC79FDE7FB
      60FC76FA8AFBFDF70FFC57F756FBF4F56CFBCAF5DAFD74F6A0FE36F8D2FF57F9
      B6FF0AFB64FF70FCE7FB1AFD43FBBDFD3DFACAFEA1F9B8FFFAF78000FEF78F01
      97F6E40232F61104ADF677059DF8E306ACF85F079FFA7B08B7FC2909C8FFA10A
      A8019B0A7105B50A750699082F0809079B0A4605280E0F051A11AC045013B304
      9914A1039A149403E51226027E101101090E88FFEA0970FD3A06B9FAFA0268F9
      98FF55F80AFAF3F6A1F765F613F407F676F14FF532EF45F5C4EEF8F5D6ECE9F6
      12EDD3F7EFEDC5F885EF02FACFEFEAF930F25FFA39F4E6FAA1F7EAFC18FB16FE
      BF00BD01CE03C203030631064B074E074908060909085B09DC08A50919092E09
      E507BE080407E907B906D8076B06C2076005AC07E3035B052703BB049D02C303
      DD01C50245038602C302B301E40153FF0A01B8FC430287FB96005AF9E701A7F8
      62036DF86504F5F8C20485F96705CCFA4A0344FBC000D8FB6FFE64FB6DFDEBFB
      27FBE1FBD9F98FFC0BF8C6FC03F74CFEF2F43DFE85F50200AAF590005FF56A01
      0CF611024BF89F0344FA4B0467FC490565FF13057A000C04F201B4025804FC01
      2B08CD015D0B9B02A90DB902310FB0025C10B5034A0EF8027A0D0703440B7B02
      D307D500FA03AFFEC10244FEB3FE46FD41FBC8FCEBF870FC5AF613FC5BF33EFB
      D7F2F0FB65F1B2FB5AF160FD48F126FD3FF31AFE6EF42CFEDEF5B6FE5AF7ECFD
      3DFA77FE29FDEBFEE500C8FF3306FB012A090904120B7505210C8F06A30CCA06
      EE0B5707E20B9206D20A6F055B09A904AF075903F306B602BA05A70200043702
      B10062FF2F000AFF10FE03FEA9FD20FDD1FDEBFC3DFD70FC39FB87F987FB87F8
      2DFB3CF767FA76F66FFBB1F52AFD54F627FEE4F6FAFFFAF8D6FF88FAF5FEB1FC
      1EFD56FD83FB23FEB2FA09FFA8F97F007AF808010AF88F0237F8E403E3F66A04
      F0F73D064AF84A07EBF8E60711FA8A083FFDB50982FF4D0A5E029E0AC104A709
      1507E10878089D06EA0A6D05590E7B04A9116904DA12A202F714CF023A15ED02
      03139E014011E500B50E1300D109C5FC0A0629FBEE028EF9B1FE8EF8A6FACEF6
      5DF7A7F68FF37BF54EF02DF514EE87F526ECA0F538EC03F744EB2AF7ADEC7BF8
      D8ED55F90DEFC3F9A4F069FAF2F34BFBA3F652FC94FAF4FDF5FF8600A8036303
      7A06D1059708550865096A09E209C90AC509720A0C0A940A4709320ADD08A209
      D8081909A408510901070208E604E7068A041406BD02F1045D037A03BC03F202
      00033F010D02EEFE02020FFD5C01D4FAE30007F9A301C7F73402FAF670035AF7
      8504EEF7ED03D8F801036BFA2F00BAFAB9FDB4FAE1FBC4FA08FA6DFB15F86DFB
      9FF7EBFC6EF6E4FDB9F421FEB0F431FF39F4B70084F4E1014BF5B302ACF79203
      BAF9930429FC6F047DFEFA04EF007E056602ED03D504A802A9081903AF0B0403
      CC0DFC023B109503E7106B041F106F03DC0E0604530CAF03A408C50191055A00
      A602E8FE4300C9FE02FD95FD8EF92AFDD3F67EFC39F48FFB1CF28FFB31F107FC
      6AF1EEFC91F003FC5DF290FCF3F333FD31F51EFD2AF7F2FDC0F9ADFD6BFC5BFD
      F6FF8FFDB204E3FF36081E02940AC103190CDC046A0CEB05380C2906D30A1B06
      C70A5806000919052D085C03A1077C0333062B03C303080252013301FBFF3E00
      02FEEAFE25FEB4FE58FD1EFEC2FCE8FC14FCEEFA75FB90F967FB77F8E0FA80F7
      0EFB4FF643FCFCF50EFE3BF712FF41F8A5FFEFFA79FFE8FC02FD7AFDBFFB25FE
      52FA44FF4DF965005AF81E01D0F83D0261F82503F4F7CE03FEF761058CF82707
      8CF9A308D3FA5B0897FD6D090700F6095502870953053D09DD07DC0864093906
      930BEB04860E6104F91039034C138D02A414FF01E71447021514970103117500
      020E1AFFE00948FDA205FFFAA00163F9D9FE7BF95AFA41F778F637F619F3A2F6
      B9EFFBF533ED1FF6A8EB6CF6D1EA04F7A7EA53F666EBEFF7E6EC1CF9CBEECEF9
      E4F04DFAF2F248FB79F65EFCEBF926FDD9FEF7FF6E030C03CD06BE04EB081B07
      F0097609730AFD09280A000AE60A9B0BDC09FC0A9B0A2B0A1E0A530AB309C209
      D008BF08EA06090884054707C404DC054D043904C603A602E10325025F03A9FF
      0A029DFDA602FFFB290168F92601D9F69D01D1F6AE0295F63103DEF525035AF7
      DE01C2F847FF07F998FCD9F926FA1AFA04F9EAFA42F700FB4EF643FC83F51CFD
      73F458FD49F3FEFD28F43A0026F43902B1F4BE02D0F642042DF9D304C2FBC204
      09FFD60510012A067A036E0454055A03A9089B02670B0503800EB1036B0F9B03
      97113E044F116A041F0FDA03290D3604C90976033A061201D9034FFF27018CFF
      96FD83FDA3FA60FDE5F733FD70F568FCA7F37AFCC7F1D8FCE1F0FDFC73F148FC
      0AF201FC59F427FCC9F5A9FC36F773FCF7F855FC1DFC9EFC99FE1DFC9A0326FE
      6C06FE00A009EB01530B01032D0C0B043E0B89048F0AB10487099D052308B004
      FD079703C5061E03450574037304C403530174026A003C01CEFE1F0161FD15FF
      11FD94FE3CFDB9FEF4FC46FC3FFC39FA6BFC54FA80FAE8F859FB60F73FFC9EF7
      1CFEC2F74DFFE5F7AAFFEDF9E3FEACFB88FEB9FC08FC92FDDAFAB8FEB4F90E01
      A6F877018DF8690294F99003B8F8A903DFF8B20496F9420790FA23086CFBEA07
      DFFD9F089FFF4C091E0356097305C1096D089F08BA0AB706760BB604F10D7303
      D110FE02C012B1012213FFFFAF14C6007D124100CA0F9AFFC30D7EFFB509F5FD
      CE044BFB680148FA49FD5CF916FAE5F62DF66CF662F33AF6B2EF59F6D2ECFFF6
      6CEA18F7A2EAC4F71EEA02F836EB9DF87AED13FA7BEF68FAE9F0FFF950F4BAFA
      66F620FC76F9A6FC85FE81FFD60256029D063F042009AD066A0A0609440B3E0A
      2E0B9C0A800BE20A4E0B290B690A330A2A0AB609840AE9092A0A2C0AF206A008
      B80662088F04AD07C503BC048404640313058B02C7039FFF150312FD5B0254FB
      8801EAF8D20005F72F0181F693015FF67402E9F5D701D6F5A701DDF67BFF26F8
      0AFC40F8EAF92DF948F88CFAEFF57CFA19F52FFB60F47EFDC7F365FD94F36CFE
      1BF48A0077F41402A3F4E60214F61004CAF8220584FCBA0518FE08067201C106
      6903D6054B05660497089503670C4204300E9D03B80F3303B71142048011B803
      D20FCE031D0EAD04170AE203E00609025E0385001C0125FF40FEDCFD24FB59FD
      D0F820FDEBF6E0FCC0F3A2FC77F121FCF5F033FD0CF1EEFC06F262FCADF49FFC
      47F635FC4AF72FFBBAF9DDFB71FCB8FB5CFF6CFB750287FCE305ECFE7A086100
      F0093902210B3903960B8B041909A9048308ED04DD0714058A0671038E054102
      B105070372037B037C008A0292FF6D02C5FDEB01D4FB480098FC590032FDD7FF
      6BFDB7FDB1FC6CFBC2FCAFF90AFC18F9AEFB29F8E1FCFCF797FE22F8FCFEFAF8
      05FF5FF9DDFFFAFB62FFABFD78FD1BFEACFC27FFE6FAD10037F915010EF9F901
      91F928039CF9D203B0F8B504C5F92C0780FA6008E7FB5609B3FDFD08FF00AE09
      4403B50982059B0826090D08730A1306860BFD03EE0D0D03D70FC50297114301
      9A1205007913C5FFB411F0FED10F99FE330D60FEF308B6FCFE033CFBE4FE1EF9
      02FB4FF81BF843F7EFF4A9F689F259F616EF03F7E8EBC8F63FEA81F721EA63F8
      89EA25F90AEB2FF90EED88FA28EF8EFAB6F10FFBEFF4E1FB35F81FFDF9FA15FE
      FCFEA5FFF8033302CB07A204B1099A06CD0B7D08190C8D0A560B130BCC0B910B
      A20B150C3F0ADF0A740AD109250B040A710AB4090A08D2085006A0074D042B07
      220352059B03580453047402F10367008702AFFCB4023CFAED029AF8C601C2F6
      76011AF5770116F504018CF4110097F46B00F5F505FFA3F741FBBFF748F9E6F8
      77F7C0F9B0F571FAF6F3D5FA1AF449FC20F387FDC0F155FE00F3E5005CF3E502
      92F3C7048CF5790566F907075BFC36074EFFF30686033F07DB04550632071405
      2D0AE804AA0CB204360EAE04510FD40335115D046311F003BE101F040C0FD403
      A20B5D03140787012703BFFF920086FE3DFDA8FDFAF986FC16F8D5FC84F566FC
      EDF226FC1EF242FCC4F1A8FCBAF1A0FCB3F201FCE9F4E7FB6CF631FBACF73BFB
      62FA3EFBB9FCBBFBBEFEABFB16024DFCE6051CFE5308E7FF220A4A01EF0BBE02
      100BB503DA089904BA07DC0414066805760457045104F503D9037C03D9022904
      8500AE03F8FEC00206FE970285FC1A0238FC0401F7FC61002DFDC1FE26FC24FC
      41FD44FACCFDBBF9F3FC6FF837FECBF77CFFF1F79FFF56F880FF0DF92B0090FA
      A8FF9CFC26FD84FD19FCC8FE6BFAF8FF3DF96C0171F89701FFF90103FDF91C04
      06F986043DFA5B06C4FA1C08B1FB480911FEF009EB002A0A3C03F809FB05B308
      EE090C08DE0B3006A80D9904D20E9E024B10DC01FA101001E61097FFF41102FF
      DD10C4FE6A0E72FD450C3FFD0A099CFC970290FA37FECFF871FAE9F71DF6F4F6
      F4F251F61EF1FCF67AEDE9F66BEA5AF7D2E91BF805EA2AF919EAF2F9B9EBF2F9
      B4ED68FA09F0E3FA79F275FBD0F69CFC82F9D5FD98FB95FEBBFFD5FF9904B602
      0A087C048D0BE606A30D3B08710D7B09D40CBE0ACD0CAF0B1C0C010CA40AA70B
      800AEB0A2C0A350A780A5F0A16089D09EF06B30700063107190469050004DA03
      240564029E03AAFF3E0293FC5B02F7F9170218F8470015F62801FCF42100A5F3
      9EFF8BF31DFFD9F349FF56F4A3FDD0F590FAC9F6DBF783F76FF5DFF874F353FA
      68F24BFBE7F27DFC11F204FE9BF1ECFE23F34F011EF42B0368F5AB05B3F7E306
      F8F99607EEFC570822009D0864040A08DC069B079709B806760B3D05270F4A05
      04106C0545115A049B12380443124A044B106403C40F7C03160CEF0277062601
      30039FFF51007EFE16FC69FD53FABEFCDEF71FFCCBF4F9FB0DF2F7FB84F106FC
      05F12CFC83F07CFC65F13CFB37F320FB8BF5D3FA88F78AFA5DFB7FFAF6FCD8FA
      3AFEFDFA4101CAFB4405C8FD05071FFF110AE000B60ABE01C80AD30205094304
      9A08B3042E0768055C055105E803BB043E04BC0449030B05D400AE04CBFFB203
      45FFFD03BEFCB40216FE5202BBFE59018FFD45FF55FD5AFD31FE71FBEEFDD7F9
      7BFDCBF873FE23F8C3FDAEF79FFE5FF8DDFE52F9F8FFFCF97EFF9AFBB6FDCFFC
      C8FB04FE8AFA55FF87F86F0068F8A50193F8750294F8A50328F89C047AFA4B06
      64FB6F07A8FD89090DFF170AA001F809CC03E50980061F09F809EB07800C9106
      5E0DA9041B0FCB028711CC012B110801E211EDFF6A1225FF951013FE830E3BFD
      D80CE6FCEC07CEFBED0170FA70FD0AF95DF9BDF73BF500F7E1F2D7F684EF61F6
      50EDF6F61FEA70F7D6E96AF896E924F943E94EFAB4E931FA9DEC01FB16EF52FB
      4BF212FC90F6ACFCB5F98DFDBFFBD0FEFBFF5C00B80482021908CE044C0BD606
      800D2808B10ECC09C10D040B400E830B3B0E3D0C0D0CC10B9F0BEE0A820CE00A
      0B0B230A4C09B2098E0867081C07C207C204BC05D605AD04DA045C02F603E4FF
      0503EDFCD90207FAEB0180F7BA00B5F5C5FF22F4B8FEA3F3D5FD3FF319FDB1F3
      FBFCEBF3AAFBF1F4E8F8AAF5F6F608F781F4FDF737F224F9A6F1DCFA14F1FAFB
      B4F0D2FD3CF03EFFF4F17D016FF372038CF51B06C0F74B07D4FAB20818FDDE08
      D1002D097C0537092808A7083D0A0F07590DE306570F04068B10E00585129005
      3C1339058512FA037912EF0389104803570D960255081201E103A4FF2D0037FE
      BCFC46FDF8F94CFC43F7DCFB20F58FFBAFF129FB5EF1C7FB9CF085FB06F0A5FB
      25F003FB13F20CFBC2F32CFA62F65CFA8EF9B0F91FFC34FA5FFD8BFAF0FF88FB
      1A04EDFC9506FBFE7E08C0FF400AB301140AC0029A08B903F40858046608B105
      B005D90454052E05B00466057C0333054F028A05BD0045053FFFE204F6FD2C04
      57FE6A039DFE3C02E8FEDA0096FD78FE76FE5DFCA7FEBEFA44FE55F940FE67F8
      6DFEF8F810FD60F8C8FD6FF9A6FEC5F965FE28FBFFFCC7FBECFB6FFD3DFAE6FD
      2CF98FFF0EF94F00F1F8DA0182F81803D7F7F9032AFA7105D7FB99073CFD7A08
      9EFF6809A4014B0A37036E092F07B708E90AB708FC0BAB06BD0D5704B90F9C03
      7410F101D9112E0185114800D1104FFFB40FD9FDAB0E4FFDD80B58FCD20800FC
      210211FA93FDD4F88AF9D1F79AF54FF734F250F68CEF52F714EC0CF7E2E9BBF7
      CFE9C5F8ADE8B9F9FBE827FA9DE9E1FAD5EB4DFBD6EE00FC67F24EFCD4F5B9FC
      85F914FEEFFB04FFD1FF34009304D602BF07B204010BBF05DC0D6E08520E6709
      660F0F0AE00F1D0B570F070CEC0DD60A280E500B820CD90ADC0C630A120B200A
      15092809E507DF07AB06B5067B057504ED050D03570480005E025FFD88022AFA
      3E011CF8D1FF41F52DFF20F484FD94F349FBAFF29EFBECF24FFA1BF394F9FDF3
      8CF7B2F4AFF5BEF57AF3D2F619F26EF8EEF068F9CBF0A9FBC6EF97FDDEEFD9FE
      37F28101E1F36C0482F5830511F9D70766FA59099FFD7F09C901BA09C9059E0A
      F1072909950B4308870DB2074010F6064212C906A2121F065A1356055313F504
      7D12C10395111F03C30ECB02D908C8001406F6FE9A0149FECDFD07FD0FFBA2FB
      67F80AFC1CF465FBF6F230FB4BF112FB0EF058FBB5EF00FB1EF09AFA03F16FFA
      24F388FA27F54FF95EF837F942FA14FAC2FBE1F9BFFE87FA5002EEFC0B04E9FD
      CA0722FFC6087301F8084A027A09F00263092E0420080105A2060C0574056C05
      4104A305C2043B06D7029806F8010106C40035068BFF710567FFBE03AE00CF03
      4EFEF20160FE79FF4AFE3BFD59FEE7FB49FE94F914FF2CF9A2FD18F99AFDA4F8
      03FE11F94AFEA6F950FED4FA16FD38FB87FB11FC01FB5AFD68F923FE4CF92CFF
      63F92A016AF86D02A2F81F03F7FA71052AFC2107A7FD90071C00500943016709
      43045009CA06BA08FE095108780B9C063C0DEE047F0E4C0342116D02C310C301
      8D10230035107AFF1C0FF2FEDA0CF1FC420CA2FC64071FFC4D0235FA1BFEACF8
      DAF96EF885F561F754F2C0F633EFAEF75CECCAF7BAEA4CF85CE9B2F87BE90BFA
      38E937FA04EABAFAB4EC6AFB22EF22FCD1F1CCFB5FF6E8FC7BF914FE21FC89FE
      F9FFF6FF7104710257070004AE0BF105620DB107760FE6089E0FCA095210710A
      0B102B0B1C0F7C0B700DAD0ABC0DE10AE20C510B380B740AB1094F09A308E608
      CE06D606C7066D044306D4030004AB00C502A0FDF700A5FAC10080F89FFF82F5
      96FE50F4FCFC7FF3FBFB9AF235FA91F2DCF912F3BFF8E3F39CF61EF4D5F4D9F4
      BFF37DF678F13BF701F122F91BF012FBB1EF22FDCFEFB6FEC6F1770174F30B04
      53F69C0568F8B00739FBA608ACFE100A8E01B4097E05210AE808170A510B9608
      4C0EB1074B110908BE12760750133206B5136F06E013F105A012F203D311F303
      480EED02DF0A04016B0527FF40027BFE64FEEEFC9BFAE9FB63F7CCFB1AF580FB
      3CF220FBBEF090FAE2F0FBFA1BF045FA4FF09FF969F172F9DBF259F91CF5A5F8
      1EF8BDF8A4FA38F9B3FC6BF9D0FEF5F9DA01F8FBC204E4FDDF063AFF8D078000
      0C097D028C0819036B089603100846055706D20539040D050704830674038607
      88021E07AA002707AC006007EDFF020623007F043F006804DCFF37029CFE2900
      61FEF9FDF8FF86FC9FFF8BFA7DFF51F971FF45F9F4FEF9F859FE2AF90EFFD3F9
      52FEBCFA4EFDF5FA11FC5DFB3AFBD8FC18FA5AFD94F9A4FE6AF8D1FF9CF8C401
      4CF8A60268F93C04A0FB9B06C9FD37076DFFEB0711027A08AF04FB0852066507
      53098C07BF0BFC06000D89042A0F56039C10E4029A11AE014910A000B00F7B00
      BF0E9BFF900CC0FD880A6BFDE00669FC89022BFB84FC63F954F9B0F8C1F4E4F7
      EEF058F7EDEDDCF78FEB64F8B7E99DF855E9D5F880E9C7F914EA29FA3DEB5DFA
      C1ECA1FA7FEF7BFB77F3E3FB96F66BFCD6FA71FD66FE97FE50013DFF6F05EA01
      8B097904DE0BD105D20D28070F101A093B1085095C103F0A67105E0BD60E490B
      710D6F0ACD0C180B250C380BBB0A050B9708F6093608D808490741074706D204
      42053E031004E300980114FEF60099FAEF009DF8F5FF3AF670FE40F45FFD9CF3
      B5FB28F39CFAFAF201F91FF3D7F7C8F363F664F430F45AF4B4F2FCF5BDF132F7
      0EF0A1F819EFFEF9ECEFE4FC23EF48FE23F081005DF3EE038DF57F0548F8C006
      E2FB4E0822FF6B099A0169091C062C0AAB092F0A4D0CFE08A50F5D08F1113508
      4E1452081114C807C31401077B14DE06311342055E115204FD0EA303D70A4402
      D10594FF750278FE4EFE3EFD15FAEAFBE3F68CFBAEF389FBD7F1B3FA5BF03DFA
      5BF0F8F978F0B9F942F0AFF89CF01DF8F1F26EF81DF5FEF739F7AEF715FB38F8
      EFFCC6F86CFE2CF93302CBFBBF04C5FDB105C1FE99076200A4080502DF070603
      E907510473072A057A059A054904BB054503B706E302AA079301BF084C00DD07
      7500DA07C9005B07E7FF8D055F00C8042000810301FF230133FFC8FE8C003EFD
      560051FB0C0009FA5D00EBF94E0085F9E1FFA7F91AFF9CF92EFF20FAD2FDD9FA
      DCFBE6FAA0FB08FCC0FAA5FC11F970FD2AF972FE6DF9740079F74B01D0F86A03
      89FB7005A5FC510682FF390720028D07C303860779057A07DE082E07BF0A1F06
      D60CFA04970E86032310B5026411DF021B10F301510FB700970E6100DB0BC9FE
      4609DAFDA606A8FD100244FCA1FC38FA97F922F938F55BF8B9F0F1F796ED62F8
      38EBE7F8D5E9EDF8F8E84DF923EA88F9D1EA72FA0CEB2EFA22ED55FAAFF023FB
      36F35EFB02F7E5FB11FCEAFC81FED9FDD9012DFFD506B101A209A403320C3C05
      020FA2061A10CD07731066093811770A5E10560ACA0FE40A390E720A6D0C710A
      C40B440B340AD90BDD07270A0F0848097D070D0827056B05BC04E6039F03A001
      4E01B1FE4D003DFB4B00DBF8D0FEB5F67AFD12F5D0FC30F4FEFB90F354FA2FF3
      9EF8AEF236F889F327F646F4C8F388F46BF3AAF5D6F19FF66FF0E8F775F096F9
      13F0F5FB98EED9FD97F0B60025F32003CEF5910568F9E90610FCB4071DFFE308
      4402E409B005C4096009B609A00C4A09710EFA07F5115C08C314F40824144108
      D314DC067D15DB06BA1265051411A7046A0F2A04170B950232060900860343FE
      F8FE74FD23FA7AFC7BF6C6FB45F4E6FB0BF23AFB67F08FFAE9F01FFA65F004FA
      61EFCAF8D1F02AF80FF303F8EEF36BF7F1F63DF76FFA6BF700FC2AF892FE45F9
      1302B1FAFA0394FC010645FE030739FFF207FB003B080E03D507FC036F077104
      3107DC053704C80538030D0719035B082901C009F6FFFD084B01190975006108
      47FF0B078100F205CBFF4504FAFE300257FF43FFF5FF5AFD67FFB9FB84FF95FA
      42000CFA990077F9D8FFF4F8D2FFE5F884FF61F92CFE0EFAF1FCC7FA21FDFEFA
      51FB6AFBE6FADCFC56FAE0FD68F96CFF5AF83001A3F9160312FB4F047EFDC106
      84FFED0656012F07DE0353074605920777078B06420A0A06260B6F04E40B2503
      2E0FE602A10FAE02DB0E34021C0FAE00270EE0FF9A0A02FF020986FE2006E0FD
      1102EEFC9CFD34FB62FAB1F96EF56BF914F15DF992ED5EF949ECDFF970EABBF9
      E7E968FA88EA54FAF0EAC8FA90EB07FB0DEEB1FA76F00DFA19F3FDFAE3F634FB
      EBFA70FBE7FE11FD5102BCFE72068BFF280A4C02130D2304430E2605DE109E06
      0A11A20802116009B111190A1D11960A8B0D5C0A5E0D3F0BA50B460BEA09920C
      99088E0B5108330A1A06AB08C40435072E04C504AF024A02E20085FF85FF8DFB
      7EFEF2F818FD12F700FCA5F521FC8AF450FB0DF39FF9AFF2F5F8ACF273F7DAF2
      01F6C5F39AF4DAF422F486F489F23AF610F244F8B4F068F905F16EFB0DF027FE
      5FF10800E1F3EB02E0F6060697F8BB06B8FC0C08AEFFDE08B8017209A0058409
      6E0945093B0AF307970D080816112608BF123208F5135608D71497065714CF05
      4C128405DF10B604CC0EDA03F40BAE02560783002404DEFE73FF3AFEB5FA1EFD
      36F7A2FC79F532FC75F291FB75F1BDFB9EF0CDFA93F0FCF95EF0B3F956F10AF8
      18F222F701F430F75BF5A4F6E5F86EF69DFB00F856FD5EF8DB00B5F9160417FC
      DE0420FDC706FAFE6608C200AC071B023B088C0317095505CF067105B2046606
      9604FB07B80229086402FE097E01380A1C01C80942005A09E6FF6D082500E606
      420005058CFE730268FE5EFF6DFEBDFDF2FDAFFB31FE0EFBF3FF40FA5CFFF7F8
      8BFF6FF8BBFFCCF80FFF82F859FEB0F9ABFD0CFA3EFD09FAE8FC3FFB96FB35FC
      15FB10FD57FBDFFEADF92E0075FAA40114FDAA046BFDFE053AFFAD06B402B007
      8303F706E0049E06B707CC06AE086A05C8081604800BE103C60C3E03000EBD02
      6E0E18039C0D3401AC0CB600170AFCFFB50734FF0E06A8FE2802A4FD01FEF7FB
      C6FAE8FA3AF614FA8CF187F9BBEFD9F90CEDF2F955EBDBF9EBEAFFFACBEA85FA
      BEEB0CFB0CEDFEFA73EEE0F9B3F0C2F903F3E8F9DDF572FACDFA3EFB48FEEEFC
      0C01FBFCA506ABFF4C095001A30BE3026E0F020576101A06D0100C077C123609
      88124C0A4410090A660FA30ACE0DDD0A130CDE0A360B790C3C09E60BF407E60A
      D106BC09A904E607A304D705BA027103E6FFE3FF72FE7CFC30FD16FAD7FABBF7
      0CFBA9F6B0FAFCF4B9F98CF3E8F80AF32CF818F3CDF6FBF208F619F474F4D6F3
      13F4A1F423F31BF675F141F733F2B5F878F2D4FA43F128FC19F31FFF8AF58C02
      6BF6A90492FA9306F4FD1608DEFFEE07D302FF08E1054509A0077608510A7108
      E00C3B08720F4B08111297086513D80828132C0716143A07321132065A104305
      C60EB804630BF3029607500167048CFFB8FF37FE7AFB08FD09F95AFCAAF5F9FB
      73F38CFBCFF1A8FB50F171FAA8F1A3FA15F10DF97EF1A1F74BF20FF770F21BF6
      2DF52BF693F8E3F66EFA87F75AFCE0F7ED0038FAC5019AFB960448FD04075AFF
      60071E00C707DC01C508AA033E080A053907F105BA05A106A904110712048B08
      3E03350A9F01200A1C02A70AFB000F0A2200A008550196072600A50553FEA002
      13FE1000F8FD4DFEF4FCC2FC12FE76FB70FE5DFAF2FE81F972FEDAF81DFF80F8
      20FF30F974FE1EF98AFD0EF9F1FDE5F95FFCB0FA9FFBC3FAABFCA7FC19FCA0FD
      BCFAA1FE18FCDB00E4FC4B0308FEB5041D0148060503FD063C04A906B705C706
      C00608061B08BB05E208E904D409D603B20BF403CE0CE903CE0C5D038C0CCE02
      160C5E029F08E500E107F0FF5A0516008B0111FEF1FD3AFD84FA62FB4DF6CBFA
      7EF288F952F0A1F9C7EDEFF9D6EBDFF988EB0DFA50ECBAFA32ED0CFB6CED09FA
      A4EF94F979F054F93EF264F897F6B4F969FAC8FA61FD78FBF000A7FC7705CAFE
      0C08DE001C0CA402D60EA70414103D05311143078E1114081612F40921116E0A
      660F5B0A910E7C0A650DF30BAE0B250C110A2B0C7809CD0B0F07A10AE005A908
      38054E07CC024B04FBFFD2003AFE5BFD7FFCFFFAACFA06F9E3F925F75CF9C9F5
      6AF8C2F46DF78FF36CF73FF3A2F67FF329F5FBF288F48BF390F35CF44CF265F5
      69F231F615F361F8C1F24EF9CEF29AFBC8F3C5FD4DF5E10052F86A0395FBB605
      6EFEE3060401F707290317086C050A084808C90889097708CE0BCF074B0EC808
      6210CA08C011A508B9124E0875120308E410BD062F10CE052D0EAD05E60AE903
      C607530219042800BF0069FF84FC95FD19FAAEFCDDF68EFC64F494FBA3F305FB
      49F33EFBE7F2BCFA31F239F9B1F2D1F707F2D8F62BF3A2F565F5EAF560F705F6
      7BF9FDF68FFB91F75FFEF0F8560171FBD70305FDC60519FE9906DFFF5007DE01
      CA06C0021E08D404E3064506D6052D06330521079304E6089B03DB09F502560A
      BA02EC0AB601E80A7A01D20959017B086700A606F9FE7E03DFFD8A0088FDD6FE
      CFFC6BFDB4FC7DFB89FDB1FAACFD10FA14FEF5F8ADFEC6F8E1FEA6F8F8FD8CF8
      0EFEADF8DFFC37F9E8FCDAF9BAFC7CFA4CFD49FB1BFDE0FCEEFC5DFE6AFC8DFF
      F3FDFE0115008104D4015B05E503B1064505210772053B06E20655052D080206
      F407EE049A081F049A096D048C0A82040B0BED031C0B5203F7091B030708CD01
      EB0574001E049300D6009FFF85FDADFD09FA4AFC4DF7C5FB13F390FA65F1D0F9
      21EF92FA6AEDDAF964ED2FFA2BEE8DFAB0EE23FB39EF20FA7CF051F96DF1D1F8
      6DF3BDF880F67EF8C5F9B9F939FD2AFB9FFFCDFBCF0341FD22084A00F20A8401
      DD0DDC02870F2B051C1095062F1078072D125D09D1108A0ABF0F3C0AC50ED30A
      A30DB70B930C3B0C4A0B160CF109560C0F08C90B7006260A1E05F8076603F405
      9E00D801CEFDABFE1CFCEDFBAFF9EBF989F87AF7F7F7A9F622F74CF5A4F61EF4
      88F68BF3D7F55BF3D0F491F32DF4A3F38BF222F4FCF204F5F9F2ACF593F3FCF6
      33F452F957F4D8FAA0F488FC20F7CBFF36FAC802A4FC5D04CEFFD506C1016C07
      7B03430746065F071D087D082309E7078D0AAE07580C3508970EE408CD10EB08
      FE10A808BF106308F20F6D07590E0E06180D35068D0AD6044D07B002D803E500
      1A01F7FF83FD9AFEC6FA63FD01F8E7FCDCF5D4FB4BF584FB3CF40BFB48F41EFB
      C0F39BF9DFF2B5F7F9F2B5F613F430F6DDF41CF593F6D6F538F9B8F618FA17F7
      3EFD76F8DC00FFFACC0221FCDC0499FDE4059BFF4D063D018706AD0298077804
      DA06EA054D06A80652056207AF04BE085805000A02045A0A5003CD0AF8026A0B
      4302810A7E01FB0880017107BFFF6204B2FD8501EAFC4FFF03FCE7FDF7FBD7FB
      18FCE1FAC5FC11FA8DFD30F9B5FD55F807FE6AF84FFE8AF85CFD33F853FC9AF8
      57FDADF9F0FC89F946FD9AFA63FE65FCAAFD5AFD9DFD88FE78FF260173015703
      B0028504DC0458062105C6061E0643063407A1056D07C5058707210554074104
      9B0754044F09CE04360A6B041D09B6038F08B10321070503B9047E018F036C01
      AC006900FBFC95FEF9F90CFD6BF7ADFCBAF496FB40F26EFA91F088FA62EF8FFA
      4EEF54FA23EF9BFAADF00EFBB2F04AFA0EF121F906F3F4F864F44CF829F6ACF7
      B9F9D8F8AAFCE1F9B9FE1EFB2F037DFC1207CAFECB094800470D5002850E0C04
      790FB8053C10ED06991026089410BC09BE0F950A650EF30ACF0D980BF20D6F0C
      810B8C0C470A790CE6089A0C94060C0B3405EA080B04BE06DB00AA038FFDFDFF
      33FBF4FC2CF9F1FAB2F768F8B0F628F798F630F623F6B0F474F56EF312F691F3
      84F56FF3CCF354F36AF3DCF35CF3ADF4F3F207F575F4E3F6C4F5ADF839F54DFA
      9EF6E7FBA7F888FE23FB6A0119FECE039300BC051C02F9068B04630705062407
      8507DD07FA08140804098C07BA0A9407B90D9008040FBA08230F4108AE0F2D08
      DF0E03085C0D87069C0C1406180A690559067A032F033801E300AE007BFE72FF
      2AFBA1FD85F952FDA6F7B1FCEFF597FB5CF59FFBDEF538FB65F440FAE5F389F8
      76F47BF7F4F314F621F587F5F7F681F577F8F5F517FA28F79EFCBFF791FFCEF9
      A102A3FBBC0450FD4905CBFEAF06C3005F06FE0127066E037107890514068E06
      1D056F07A3058D081506F1095404CB0ACE03020B5E03E20B46021D0BF801D109
      ED013E083400150636FD5702EEFB1500F4FB7CFEF3FA32FCF2FA2FFB11FC61FA
      14FCCAF8C3FC52F899FE4CF87CFEEBF74CFDD4F722FDFDF7B2FC47F85DFD2CF9
      2CFE29FAE3FE30FB06FFE8FC42FF11FE39000100E802B70227045304BF045705
      A406CA064607B60699060B06A807E60556079D05A7059D04E906A3045F08BF04
      3408EC047507F1033507D0034A06CC031F047502C00262013000F900F4FB17FF
      B5F891FD96F732FD31F540FC4DF2CBFA06F220FB7BF0ACFAE2EF96FAC0F001FB
      C8F160FACEF1A2FAD3F2B6F9ADF3F2F8F6F434F850F739F835F9ABF7DAFC16F9
      26FF96FAA30122FB850676FD450AA7FF710C1401D90E52032310E404090F0106
      C30F2C07AF104F09A10EED09890E460B770E7E0BAD0D6E0C120C010D3F0ADB0C
      0A09390DEF06090C9405200A5B04FD0740016A05BEFC5B01CCFA9DFEF0F8BEFB
      93F633F947F6E4F776F566F6DDF4A2F47FF56DF4D3F528F30FF514F34BF483F3
      C1F23BF36DF251F3F5F325F5E7F3ACF5E5F567F734F7DFF9F9F62DFB5FF946FD
      13FDBE006BFECD022701E4046E04CA06EE0412074D0675075908AB079D08C707
      DC08A107180BB407940C8F07140EBD08E90D6B08820E5408920E6708A20C5F07
      AE0B15068109A5052705CF03460273029F00C8008BFDCDFF64FBA5FE05FA0DFE
      5DF78FFCE9F6BFFC25F6E2FBFBF590FA5EF63DFB29F535F97DF435F780F57EF6
      AAF5D2F577F6A0F4ADF9CDF5ADF965F652FBAAF6100016F90D02F3FAF60378FC
      4306A2FEB3059DFF53058C01FB050A033A060005B404FF055805D607EA043808
      CC051A0AD004660B8103760BF8032A0CCF02A60BD9029B0AF9021D09AA00D106
      7AFDBB03D7FC1001DBFB8BFE10FBD5FCA2FB77FB0CFBAEF972FCF7F86FFDE0F8
      D6FD5AF7CAFEFAF75FFDC4F7E1FB18F78FFCC5F765FD49F954FC11F960FFFDFA
      27FF65FCA0FE58FD470187FF4303F4018E0332034E0627054507200622073B06
      9E077806C407CA05EA063205810600058706810463073304CE07CA0437065304
      90063904A3053304F3023E03CA01430224FF6F0197FA050031F843FF14F663FD
      25F4DDFC9AF20DFCC7F17AFB75F0D8FA29F170FBB5F095FAEAF239FACFF3E0FA
      A6F364F953F593F85AF746F8BEF720F73CFB5DF71CFE23F8D6FEDDF890022EFA
      A507CEFC39093EFE000DD200E90E0603680EC303FF0E2806F10E5A07E80EF308
      630D150AAA0D7E0BDE0CBB0B5F0DD90CE60A970DB209630DFB087E0DC206550C
      1A06E10AF004B408FA00B505DFFDED025DFB0DFF2BF926FCCAF6C5F92DF6E7F7
      D5F4E3F5C4F57EF5DCF43AF474F547F359F5AAF355F343F3B5F224F3F3F2FAF3
      64F27EF403F375F521F695F7CEF5C8F88DF7AAFA88FA4AFD58FC36FF1BFFBA01
      2C036A043C042505590651069F072807E7081B0751093807240A8C07780A2507
      9B0C8207630D2F08D60DCB08680EBD08AA0DB908B00BF707F90A7807E0072D06
      5F0466054101E0039FFEBC01C0FCEE00D8FAE1FF98F971FE16F8C7FDF9F6B2FC
      4BF6A7FBAAF712FBD1F67DFA49F6A6F803F79AF784F616F67EF6CDF426F91EF5
      25F943F4E3F9DCF477FC1DF6F4FFF6F74201ACF989047CFCAE04C5FDD00447FF
      9404D101550434039704EE04420395065E039E0748040C091E05490AD403A10B
      C103C40BBB03340CBB02B20BA403320B9D034F0993014D074DFFD404E9FD6A01
      37FD21FF5BFB13FDF3FB04FB52FCDEF927FD61F9DEFC36F8F2FE27F80FFE05F8
      A4FC93F7E1FCD4F752FC3EF8AFFB5BF820FDC0F95DFE9BFA23FE9BFB3FFF5AFD
      23011CFF5E029800A6040403740625047907ED043808BC051C08CD05C0085805
      6007510531064E043306FB031D070B04500616043806720465057E04BD036004
      CA01D403E8004C03A4FD5C02A6F97401B0F6FDFF0BF5C1FE1EF316FECDF1D5FC
      18F256FC4BF125FC08F1E5FA09F3EEFA4EF4A5FA85F4F6F93DF631F92AF8DAF8
      93F867F772FA17F7E1FC1CF7F5FDCCF68600EAF7980368F9860732FBB109CCFD
      420CFAFF860DD6017A0EF4037F0DE805760D2F07470D3309A20B3D0AB50B270B
      8D0C890CCB0B0C0D4A0AA80D7309D60D9508840DE206A80C3106300BEA040409
      160291069DFE7C0351FC0B00EBF9E2FC93F6DCF988F68AF732F682F657F5EDF4
      E9F418F467F5D5F3CCF330F34CF35FF331F3E4F3FDF190F3E9F145F457F3CAF5
      D1F4F7F694F69AF80FF8CAFA7CFA2AFC21FDDDFE20006201E8023203E105B004
      1707DC057C0850067A0A02071F0A5007070AAA063F0BD1066A0C1107A90CA507
      770D8D08140DA408030CC308720A5708CF09F00715077307120327061C007F04
      63FE010394FB070243FA54003BFADDFF62F863FE40F716FD46F859FCDCF773FB
      B7F735FA88F834F9DAF859F738F8EAF5A2F834F54BF93BF4F3F9AAF3F9FA4FF4
      80FCBDF47EFFABF61E0140F9800209FB1C04E9FC1B0428FFA702DB001E03C502
      BF02F60493011306370291079E03330984039C0A8E03B10B7103760C9103720C
      2403700CC803440B58045A0AD6022D087F00810551FFA202A7FD1000FBFB3CFD
      FDFC98FB3FFD49FAE8FCD3F8DCFD54F870FE51F8D5FDA9F7B6FD04F80AFDCCF7
      F4FBB0F7FDFB69F8A9FC42F9CAFD5BFAFAFE96FB67FFE8FC63011BFE6303D800
      A9040902680654031D088204FA07EF046C081505BF089805D30606058A05E603
      D705A203C105C6035705B403A4041D04A203F6035C0269047B00BD0363FFCD03
      7CFC3E033CF8CE01D7F59900CEF4DDFFA6F2F6FE35F2B5FD12F38AFD66F27DFC
      A4F208FC43F4BEFB29F52DFB54F68EFA79F8D4F9F3F9BFF838FB42F8DAFB6CF7
      89FDA8F6D3FFCCF670016CF7C003E6F776076FFA78099AFC1F0B84FEAD0D0401
      910D4F03440CB3047E0CA806D30B9808B10AAD09DB0AF00A840B5A0CC20A420D
      F009CA0DBF082A0EE2071A0E7406520D83058C0B5F055C0A5C02A6070DFF7304
      8FFC55018CF9F3FDBBF684FA98F644F894F59AF6B4F4E3F4F8F4E4F3CCF483F3
      09F42AF3EEF34CF3C0F2E6F249F25BF351F2F4F34FF3AEF42CF5A8F60CF75CF8
      5BF8A6F959FBB8FB2FFEF0FE3800A000E0039B025F069304C0075F0594091E06
      840A3007B6098407F309CA06F10AAF069F0B3007520C8D07510CDF07E80B3508
      9C0BF108070A3E0816094C080306FD0752028D0699FF050501FEF7032CFBE902
      ADFA49011EFAA40024F972FFBDF855FEACF8FCFC6DF825FC11F928FB7FF955F9
      92F9CCF7D1F9C4F6ADF80FF56CF9E6F3C4FAC8F325FB3EF361FC32F332FF3AF5
      4D0056F703022CF99E03A8FBF802D3FDFA016DFF0702A40149011B045301C605
      9C011107B502E9083703CE0A6E03010CE502DF0C8203700D1903390DCE030E0C
      B204C40B3F03F5095101FD061800000429FE6B0131FD8AFE59FD00FC5DFD9FFA
      B5FD0AF945FED7F77FFED1F799FE1BF827FEACF713FDEFF65EFDACF732FCF7F7
      DAFC73F860FE18FA3DFF40FBA7FFF0FB3F02BCFD370395003204B9010507F202
      E90720041C08C1049408E104DD073C056C0620053305BB030D05FE0266042403
      F2035E03E5021803A10223034101F90386FF7C0345FE770335FB5C03F5F77B02
      CFF5E500D7F3560045F2000075F2AFFE9AF233FE70F303FEE6F346FDA2F471FC
      53F661FC6FF8BFFB9AF958FAFEFB88F9C5FCEDF8F4FCB0F759FF0DF77B0115F7
      7C02CAF608051AF7F60703F9040A54FB7A0C60FDCC0DB1FF190D0302AF0CC803
      760BD805020BF507500A9C099109610AD509F50BE9096B0DE208730E9C07710E
      A206720E5005E50D9E04340CF603170B9A010509BBFE4C059AFBA7014AF9D0FE
      87F78AFB90F5ECF7BFF56AF68AF56BF4EEF4E3F2FBF4E3F26CF5E3F29BF38DF2
      57F334F2B4F35DF38AF2C2F3CAF3DBF4FBF54EF68CF710F884F990F953FCBCFB
      A8FEECFEF400F00057049A023C068304B508EB053709A506620A2307DB0AD507
      400AE306D80ABC068C0BB606AD0B5B077D0B3007DA0B6107F10A7A086F095C08
      C707FD074F05160832027F07FCFE6005AEFC8B0476FBAE038AF9C8019BF90401
      B0F9880042F8E8FEFCF7DCFD3BF9E5FCEBF8A2FBB4F9E1F9E5FA77F820FA81F6
      B5F927F51FFBB3F301FB29F314FC82F236FD7DF2FFFE94F307010FF6B502EDF7
      E40244FAE002A5FC2902ADFED800100126019E039F009A058D00D5069901CA08
      7302D80ABE02C20C72025F0D3702D90D2B032A0E0C03FD0CA2036C0C6D035A0B
      F401C90785FFDC049FFF6102D4FD9DFF00FD3FFC76FE48FBB5FED2F8CBFEE6F7
      B2FFC5F755FF93F77FFE70F771FE36F79CFD7EF7E0FC23F8C3FDD2F8C0FD84F9
      E6FFF9FA1D013FFC750127FD7103DDFFDD046E01E0055A02CB0694036C087904
      ED06B8042B0762047E06C30407056A03D803CB025B030E022803DC0264026B02
      FA002D02D20047037DFE4803F7FBED02B5FAE50337F86A0363F4C601C1F30B01
      12F3BC009FF135FF67F36EFF34F4C1FEEAF3F9FD78F5AEFD0DF721FD61F898FC
      28FBB9FB8BFC37FAF3FDF8F89CFF74F88D0004F7FC01E4F6D004ACF641058CF6
      7D08F3F7570BCAFA740C36FC050DB1FEB80D0E01440C3103210B5205EE0ACB07
      B0091309F508010ADC084D0BBB08540D74085B0E1D06650E6505610EF504460E
      A302550CA902AF0B41017F0921FE5D054CFB3D02F8F93DFF2FF6A4FBA7F57BF8
      DDF5B7F6E9F4FAF39DF545F326F5B2F212F42AF2AFF470F2FEF363F21EF3C3F2
      EBF333F45FF4ABF40FF506F623F901F862FAD9F9F5FB59FBBCFFBFFEC2018000
      23047802C9067204B708BA0532099A06E40A05072B0B9207380B2807B40AC706
      C70A8D06FF0B3B07930B4107B10A3407080B2F083C08DF077606FC077005B008
      F901B80783FEAB0613FD3405A5FA060485F9A60272FA39021EF95F0021F97FFF
      09F96CFE42F8CAFC9AF91CFC8DFAB8FAECF91BF837FBA7F631FB28F537FA48F3
      EBFBA3F2CEFC0BF21AFC5AF12EFFB1F2C400CBF4280173F6640203F93D0255FB
      2901FFFDA1008A009D00200322002A051C00A0068D0069083502090BE702CA0C
      0B028E0D1503670E2703D60E5902070E5704E00D9603FD0B4302130949013A06
      BCFF12030FFE5500A6FEC0FD5FFE45FBE5FE91F92400A8F8BBFE45F723FF1AF7
      DBFF8DF70AFEB8F6D9FD3BF74FFE40F8EFFC23F857FE2AF9F900CDFAC7009DFB
      0202CAFC5D0419FF8D04A50054062B02CA065C033C070004D2066904B4060A04
      EF051104AE045E0382021D02CA01D901440218029D001302CDFFDF0102FF4002
      52FC4A023EFBFB02ECF9920313F73D03D4F4D702F1F258013EF2DA00F2F2EC00
      C4F3000067F451FFAAF639FF25F690FEDEF7D3FDEFFA38FEE2FBB0FC50FD03FB
      940027FA8900BCF8810194F78F0424F7430574F6E9056CF66809A9F7F40A56F9
      0D0C51FB070D7DFDD70C8EFF160C7302BB0AC404690ACF06A109C9081A08B309
      8D073C0BCC08010D81073E0E2706950E5205B30EEC03610EF101B60D1302460C
      5200D20935FEE70614FB0F0395F815FFFCF698FC07F5F8F84EF402F638F579F4
      1DF4CDF238F346F1A2F4A7F12CF4AEF1E7F27AF14CF499F2F9F364F3CEF326F4
      24F7FCF562F9B2F7FEFA60F9AAFD8BFBF100EBFDAB02B100D0050C036907CD04
      6D093006350A63077B0B8907410C1E087C0BA007710AEA06070BF3064B0B1D07
      E00A8B07580A7A076C0926076F07CB073406440829044408AF01F60764FE4807
      B7FB1E055AFB9604FAF9D303A0F9FD013AFA0A012AFAE3FF5CF8A5FEFAF9D9FD
      35FAC4FCABF99FFA11FB0DF9B5FBFFF663FAEEF452FBEEF344FC5EF234FC4BF1
      A4FCAEF192FE3EF279FF78F3D80090F53601D2F79301F7F9C6001CFDC9FFA8FF
      4F00320226004504D7FF45069A0075085302570AA0020C0C1603A10DF702FB0D
      5703A60EC402020F6303E90DDE03510C1903820AC60023077C000E0492FFAC01
      16FE72FE09FF24FCFBFF89FA88FE9AF875FF9FF7D2FF39F712FFA8F6BEFE24F7
      DDFE47F78AFD48F716FE1AF8FAFF2FF99E00A7F9D3015DFB75027EFCE303D5FD
      0A0517002A06F1018906E002AB06BF03F6051904210608048A05C40386031803
      A0010602ED00AD011E0041010100FF013AFE880152FD660185FB5F02F8F9A402
      CEF834034DF77C0300F417030DF3DF019CF32602DAF263016DF4B40062F69400
      66F6A5FFA7F768FF5DFA80FF53FB66FE14FD98FD8DFF87FC8500ABFAB30119F9
      A5037BF8D604C4F662067FF609078CF6F00805F7F90A5BF85E0C6CFA740C65FC
      F40CC0FE4A0B4001160A7203F8090C062209D707890774093E07F90A6007310C
      3007800DAF058F0EB5047C0E8503A80E2301D50D5A006C0C42007E0AE4FCA507
      F6F9750313F93E0072F691FCA6F454F94CF5FBF677F4A8F426F37AF291F403F2
      16F451F104F428F10CF401F220F417F256F4E6F21EF69DF474F808F6DFFA70F7
      C3FC88F97AFE2DFBEB019BFD9D04BF000D06F402EB08E604940966063F0A4407
      BF0B1A08CE0C1608010BD1075E0A0707920A1507880AEF06F609A607FE080C07
      53081B07C805A207340498077D0313088D00B507FBFCBD06C2FCC60565FB0E05
      A6F9A50352FA8C0294FA5E010AF9BCFF37FA62FF92FA52FE50FA92FC91FA71FB
      65FB91F937FB5DF7B7FBC8F5C2FB45F4B7FC57F208FDF3F19FFC96F1E3FD05F2
      CEFF5CF3D9FFEDF4C60003F7460187F9C7FF03FC72FFA4FEA60075016E00C903
      F3FFE205EC000608CC01AD09E602990B0203190DF3031A0E7903EE0EEE02C70E
      90035B0E76043A0D2B02DC0AC7012708FE006B0595FF090205FF82FFDAFF3FFD
      C6FEDAFADDFE2AF995FF5AF809FF1BF705FFD1F682FE04F7CCFDA8F627FE48F7
      B6FE05F8F7FF8FF86B0175F9B00190FA40029FFB940468FD760574FFA405E500
      3F078B02BE0538034605A8038705CE035F055103530295024301A701FDFF4901
      4DFFDF0028FE4B015AFD290115FC92019CF9F20108F84002F1F71E0372F50803
      D6F32E032EF41D03BFF391028AF3F201ACF5D401EDF6580197F7C20022FA1801
      75FB550051FD74FFEEFEF7FEB3008BFD3302E0FBB9033BFA9604A1F80B0747F7
      9807D0F678074DF64B09D2F62C0B05F8EC0A60F9710C99FBA60BCAFD8409B3FF
      E00817029909DE0440080907F606A60846062E0AF705750BEC05B80C6505DF0D
      A004890E8202660E70006F0D4200A90C6EFFF70A48FCD507B7FA830452F8DD00
      28F6EEFC2FF511FAE4F467F752F305F551F30CF3AAF32FF2B6F346F1D6F359F1
      6FF387F1B9F3FAF159F55EF39EF667F4BAF9FCF5F5FB8DF72DFD26F9A0FF0CFB
      CD03F2FD87059B00CC07C402540A4305200A94063A0B9A07C00C50081D0D5408
      420BD707890AFA06490A1B07E109AF06380915074808FA060B07320702040207
      63021307DC018007AFFEFC06E7FC9A060AFCE905DEFAC204B0F99E0366FAA102
      3EFAB50134FA8600A4FACEFF0DFB8CFEA4FB60FD61FBEAFBA8FB14FA7AFC78F8
      19FC41F65BFC7EF4B5FD11F33BFD69F287FCA6F159FE67F217FF77F306FFA8F4
      360094F699FFE1F8A0FE0CFBFDFEAAFD3800920042003603E6FF12058D003C07
      0902420901031E0BE303A20C7B04F50DE2039C0E5503A40EBB04610E8004A30D
      2403890BBC02EB089D012D065700350316006E0098FFF1FD10FF25FCB5FEF8F9
      DEFEC0F8BCFEA0F721FE13F72DFD70F6CDFDBEF608FE5CF712FE80F74E001CF8
      F200FEF83001D9F9B10219FBCC04E5FCB504BDFEF205C6FFCA06C301CB05AD02
      B3053B0358053103D604ED025402430267002E01E7FF32013DFEB20060FDE500
      88FC180145FB9401E3F7E3011FF7E9018BF6D102CBF4510373F48F0320F48B03
      14F43D0395F4B30264F6280269F8B202DEF91302FAFAB40133FD25018DFFE000
      7300CEFFA602ABFE20044FFD290407FB190628F9F007E2F7F30727F7D3074DF6
      8A09A8F6D409D5F7950AB2F8CD0A77FA95097EFC15087AFE9E07860016085003
      5907AA057E0513075905D80898056B0A6B05F60B5D05040D2C04D50DA9011A0E
      8A008A0D4100900C09FF5F0BF3FCBD089EFA100524F8A001ADF64CFE43F5ADFA
      77F456F820F45FF692F2FBF331F399F282F3E7F130F37BF1EDF277F1B4F43BF2
      05F56AF317F732F4BDFAADF5BEFC70F7ADFE3BF96E0108FB7D04A7FDA8066700
      E4083E02FE0AD904A20BBD06830C9C07FF0C3B08D40D63085F0B17082C0A2E07
      1E0A2807E108EE06BF08FE065407E5064605DF0631020107EA00350674FFBA06
      36FEEF060BFC360678FA520595FAD004EEF9710303FA43025EFB150250FAB200
      3FFA52FF9CFBA6FE91FCC0FDE1FB7CFC23FDD8FA7FFC38F970FCEFF64EFD1AF5
      98FDB8F375FD1AF319FD4CF2F0FD93F2A1FEDDF330FFC7F4DBFE45F6D0FE79F8
      73FEA7FAC5FEFEFCFBFFD5FFE7FF5B0295FF3F04430159064D028108C203780A
      6304E40B2504F50C0D04550EDC046C0EAC042C0E8F05BD0D0604F20BC1020609
      0402E00655012B0487FF0A01FAFF16FF8CFF4EFD05FED9FAD0FE63F914FE1EF8
      F5FC35F718FDA1F645FD98F6C9FCD8F61AFEEBF65AFF4DF7D3005FF80C026FF9
      A4023DFABF03EAFBE604D9FD1C051AFF8906F800090663028505BA028304D702
      2D047B0231015102300060015BFE20018EFD230146FD6E010FFB10017DF9A001
      D8F733028AF5A90191F58E028CF5B203EBF34703F8F36303A8F5A203CAF51903
      24F8BA02C7FA3E03A1FA990213FD050215FFE801450191012D031001F2049FFF
      7D04F7FD830615FC2C07F8F91B0882F82609F7F7D108F0F69F08BAF6E609D1F7
      8F09A8F81E09ADF90C08A7FBEB0689FD3B069FFF1406C401F2044F04B5041006
      26047B0714045509FB04290BAE03B30BED01930C9D01FE0D1A006B0DD3FE6D0C
      73FFD70B30FCEE0804FA41057AF867025DF6FEFEABF44BFB26F511F968F308F7
      F4F2B2F466F31BF3C3F20EF28CF3D2F1A4F4B0F117F4EEF102F60BF37AF8E1F3
      38FB0CF5E6FE50F7940149F97E02BBFAA7054DFD2C086B006B0AB202700C2A05
      E20C1407A90D2708BC0D4E086B0D8008F60BB608550ABE075B082B07D508A507
      1C0873072205E306AF0326071A0108074DFEF2055EFE5E0662FC4D06D9F94505
      57F9C00468F913040CF90C039BFA36020FFA5901D7F93A0020FB49FFA2FB7AFE
      9AFCB8FDD0FDDFFCF0FCE5FAF8FC11F905FE61F7B1FD56F52CFE2BF4A9FE90F3
      B6FDFCF245FEF6F224FF2EF40FFF51F522FF96F6B7FE57F89CFEA8FAFDFECEFC
      1EFF09FF95FFE601830029040101B805D6022F0819040F0AF003130B1904850C
      E404260E3604390E3C051B0E4C05AD0DD403DB0B7603970968024407CE00A404
      8F000502BCFF92FFC7FEABFDD2FEDEFB1DFEC0F909FD47F89EFDA9F790FCABF6
      D7FBFEF5FCFC4EF676FD49F6E8FE8EF64701AEF7ED01BCF8FF014EF98A03C7FA
      4B04F0FC5705E8FEAD054700A605BC01540580028404430297034F02FF019102
      29FF6301E5FD1D018DFDA90119FC940131FAC10146F96302AFF67602D4F58002
      9EF51C0359F458034CF48B03CBF4D1036EF5900394F7E4034DF986031EFA2003
      0AFD3E03D8FEDD023100840221036D021A05CF011205FFFF2E07A5FE2108ABFC
      040865FA0D0916F9BC0904F8F70823F70A09D6F64E0998F75509A0F82E0854F9
      3A07D1FA1B069AFCC2042CFE7E03FFFFEE031B03E602C90448023A0608036C08
      BF02C8095502D30A53014E0C50003F0DC5FE310D88FEA40C1FFD4E0B72FC5009
      BAFA6606C6F79302A5F6B3FFE3F5BDFC12F49DF9DAF4FCF7B7F441F694F3D3F3
      D2F3E0F245F5D1F257F4FDF13AF51AF25EF7F3F267F9E3F3A3FC45F564005EF7
      D80221F95C04C6FAED06F7FCB9094200990B01031F0CE204C20DDA061A0E1508
      EE0D5208EA0DE708880CCA088509AA07AE085607A2078907AD06570733048107
      FB01020741FFAB06A2FD6A061EFBC8056AFA850547F925058BF72C04CBF75003
      EAF846031CF8A00101F9C700E6FA6A0060FA05FF0DFB51FEB0FCFBFD35FDAAFC
      4EFDF5FABBFEA2F9C2FE9AF7D1FE99F503FF93F48DFF95F32FFF4AF328FF57F3
      ACFF83F47800CBF579FFD6F6ADFF8CF843FF8CFA32FF73FC43FFB3FE7200B101
      200095031F0197053A02B10791036909BC041E0B36044A0C2A04470D8504170E
      4E04E00D96042C0D13054F0C6B030A0AC4010207770129053500960211FFF5FF
      DEFF82FE7DFE92FCE4FD3EFA63FD04F906FDF7F7A4FB98F6D8FB04F6C8FBA6F5
      EBFCD4F548FE44F6EBFFF6F64B01BFF74002D2F8380305FAE5041EFCB50404FE
      B20427FF0D05A9003505B30196041E02D40347028401D00158FF47012BFE3401
      2CFD93010EFD190285FAB00256F8680238F72803A3F59503D9F35103F2F40904
      8AF450041FF4160439F6420418F8D304C6F8D60366FC270496FE4B04CAFF4403
      700145039F03D3023705EC017307EB00BE0885FF990901FDEF09C1FA050A49F9
      710ABFF7560A7AF72D09F4F6680977F7C7084CF8FF0608F9D10540FA680492FB
      06032DFD490201FFA6019401970051036F0023057100C4068801780874016F0A
      45FFF10A95FECD0B3BFE630CD0FCD10BB3FDFE0A43FDB80990FA9006B3F8BC02
      FDF76500B1F54FFDA8F518FB15F671F935F53EF726F577F533F599F4EEF4BEF3
      C3F578F389F692F342F874F37CFA8FF44EFD27F6100078F7ED0350F9B6054BFB
      350846FDEE0AD2FFAB0B6902030D28049D0E19065C0F6907F00E5508100E7608
      310CCB07EB093A075108E9063A0707075C063A07EE024D07240072068BFE9806
      82FA3806DFF8AD055AF89705A1F6A404DEF4A60367F63203E7F57F02A7F67A01
      27F929010DFA3B0033FA99FE3FFB78FE00FC4CFDBDFD82FCEAFE94FBC8FFC8F9
      F7FF7EF76000B7F53C0094F4950193F33601B7F361009BF33101B1F4CB000BF6
      F3FF48F7BEFF0EF98FFFB0FAE9FEB0FC7DFFFDFEEDFF7F0148007003D8006C05
      7202AF073E048109CA048D0BBB030C0C9004150D0904A70D3804E60D8605A50D
      5305510C3F03DA09F3024407AD0123051B009F02D8FFCC005CFFBEFEA7FD46FC
      77FDF5FA1BFC83F93DFBE5F707FB07F799FA1EF601FB40F5EDFB55F52BFDE9F5
      CBFE23F62B014EF75D0148F8C802A4F9F9032FFBDA03C2FCD60446FED5051100
      AC050B015505D4011E04D901A9025C014200280136FF9A011DFEF401ABFD9102
      87FA0E0313F94603C5F71E0414F56C04F6F4CC045BF524054BF4DB04CAF4EE04
      D2F64005BCF7ED0421FA000565FD3605BDFE8C040301B203AC02C10328049002
      E906500239086A015D0948FF390AD5FC7C0AABFA0B0AE7F8440BD8F7FF0935F7
      C3085AF6EB08DDF63507A9F7530569F82004E0F92A02AFFA9300F2FB95FFF5FD
      22FF060074FEC70179FE9C034EFFB90587005F0796FF5B092AFEE1098FFEE60A
      3CFD630B23FDB20B60FE810B1CFD9909A2FBD10679FB1104E4F96B016FF8F9FE
      B2F838FD19F803FB9EF7B0F8DEF7FDF78CF6BFF694F6C0F5CAF665F57FF7B6F4
      7DF993F435FB31F58BFD61F66201A9F758046DF99C05CDFA9908E1FCE709FFFE
      4B0ABD00A90C20038A0DF8048A0DD805780DD806140D0007780B8C0637092706
      A0074B063B0610064C045C063101780658FF5D063DFC610696F8F8051CF8E605
      9BF65C05F0F43F0456F5CA03BFF54603C3F588028AF745022AF9BF01ECF95000
      7EFB60FF0FFCDBFE55FDE2FD18FF65FDC8FF16FC71012EFA210247F8BB0185F6
      6F025EF51E03B8F4DC01F6F3C20100F4500227F5B80038F666007FF7F5FF30F9
      B0FE3FFA36FE0AFC6DFE68FE12FF980055FF880222009E04EE01D4062B03CF08
      53036E0AA5036F0B3104680C4003190D5E04980D4E059D0D8904F80B6404090A
      EC0324087702E8056201C8031401C7012C0098FFA6FF7DFD95FE52FCEAFCB4FA
      0DFC1DF969FAB9F78BFA77F657FBECF50CFB6AF57EFC96F500FF44F6D6FFCAF6
      80009AF7A002EBF870023DFA69024EFBD60366FD0604BDFEAE0386FF5B035D00
      5703B9003302CA00BEFFB100FCFE0B0176FE560173FCF001D5FAEA0226FACE03
      00F75604E9F479047FF54305F4F45205E0F42B0574F69705C8F7990571F9A605
      DBFB010694FE300618016A058702E004F8037D046E0606048C0757031F090302
      FA0B41000F0CFEFD7D0BE7FBAB0C76FA330CF5F8780A71F72B0AFCF6100961F7
      6F06D1F7A90489F8F6023CF94E00A4F922FEBAFAD5FC8BFCE7FC52FE2FFBCDFF
      32FB5501B0FC75036BFC4C05FBFBD1068EFC1D08B9FBF40873FA9709BEFB240A
      B4FC220A35FC9308B9FC980607FC99044DFB43029FFA4D00DCFA4BFE9CFBBCFC
      34FB26FB7AFA43FA79FA65F9F5F95AF831F973F754FBE6F671FCF5F6E5FCE7F6
      DDFFD1F7020302F9B8041AFAD9067EFBDE0825FD9D09F5FEFB097300780B5502
      0C0CC903ED0B9604D90A5805830BBD05BA09C305BD06C304EA05B8049104AC04
      CD01E104FBFF5705A3FDA605C7F949054CF7D5043AF6E604F5F46E0438F4A003
      9EF305035CF4A7028CF55A027AF6EA0121F9A701F9FAC50063FBA7FFB5FC39FF
      E7FED0FE3EFFC1FD9C016EFCB10348FB130473F95304DFF7AC0593F67D0599F5
      6205A9F4DF0405F5870402F60B0326F7C401EAF7F70041F9E4FF9DFAE5FD1AFC
      12FE4AFE8BFE7D00C1FD1902EEFE1104F400970617018908BF010B0A77027E0B
      9B01540CD8011B0DAC02870DDF03770D0004680CFD03720A50039E0829035306
      87010C04A001A501AF0154000E004DFEB3FEC0FC55FE5CFBF2FBA1F932FB03F8
      A0FB03F738FB3AF6CDFA66F5B8FC41F50BFECCF5AEFF53F6750028F77A0113F8
      D701A1F969019CFABD0232FC8103C9FDD4028FFE65025FFF82032E0089018900
      360000000F008A00A0FE150115FD400264FC7103D9F969043BF8E80485F64005
      33F6BD0521F66C065EF632061EF6E805A0F8380610FAA10638FC6606A8FFD706
      8B0154067C025605F204D7046506A2048F0754032A0AFB01840B7800E00B74FE
      590C53FC880C50FA4F0CEFF8610B7AF7BA0915F7A20870F7A305DCF78203ADF7
      E1015BF813FF11F99DFBCDF96AFB2BFB9CF9C4FCADF8E9FD7BF992FF2EFA8501
      A3F990039BFAEB04FDF94406C8F9440709FA6A088FFA8E0859FC17091EFD8608
      C6FCAB06D6FD0C05FEFD7A03F6FC6E015AFED5FF2AFF4AFFC9FDD6FDD7FDA8FC
      FAFD14FC66FC1EFBD7FC2AFA8EFD90F908FE36F977FEF7F8B9000DF93E031FFA
      B205E6FA2406DBFB2208D2FC7C08B8FE65089FFF0B0A2301C10A57020F092403
      430991033C0904048407BB032006E602D3048C027602E602FE009A037FFEE703
      91FB16045FF95504EBF5EA03DCF4D20368F40C04B9F2050331F2F201E9F31C02
      33F4150259F6820161F9AD014FFA0D0198FB3300DFFDBCFFEEFECFFF1001A4FE
      1E03B6FDC3045EFCC50534FB020756F9C207E5F7D8080FF7FC0766F674077DF6
      E30681F7D20460F8C303E7F8CD0205FAFDFF77FB20FE98FCC2FD1CFED0FCBEFF
      55FD7C0110FE3F03C3FE4F05BEFFAB075B00ED0802003A0AFB008D0B8300AB0C
      F700710C4B03F80C8703110CE202060A0704260849034B065202C8031903E401
      B102A800C200F2FEDFFF3AFD50FE12FCCCFC93FA9AFB3FF9C3FA9FF76EFAD2F6
      4AFAF4F531FB7DF593FD01F6BEFE9AF6EFFE22F72C00D0F793008FF9F90076FA
      2602F4FB430242FDC70192FE460228FF2102E6FF5B0240007F0127005B004200
      F6FF6C0151FF8E02E8FC4703BAFB53041CFA690586F77005DEF70E06F3F78006
      96F6F0058AF77E051BF91806A0FA27062EFDF905E7FF130625019D054F031C05
      EA04730463065E042A08400348092502A40A74009B0B29FFFA0BC7FC510CCEFA
      230CAAF9C50A77F87109D4F76D071AF8EA0456F8BC0269F83500BEF8F9FCA7F9
      C1FAD4F94AF891FA99F7ACFB71F72DFD22F758FEE1F7FDFFC8F8130254F80603
      1AF9990418FA0A06B3F93107DDFA4F0764FD3A087DFDAC07D5FE7B0618004105
      4E00DA03E40060022102550140027A00FE01B2FF6E01B4FE4B001BFE070054FD
      2FFFA4FCDDFE16FB0AFFBBFA82FF3FFAB30013FAF702C5FA3E045DFB0A05C8FB
      310569FC1A0616FEB706DAFEEC0610008C06F200C306F70188052A0279057802
      AC056D020C04D20144027901B30129024EFF99020BFDCD0241FB6A0392F8F403
      0CF663037AF5B1031CF42B0392F35802E5F3B9011BF4D40122F6AD0110F87C01
      F8F92501F2FBC70024FEAD00FBFEF9FF2C012200310392FFA3048FFEFD0567FD
      D707C9FC8008EFFABB0999F9E00923F93C0A6EF84D0863F81B072FF91A06EBF9
      4104A5FAFE0142FB250090FC83FDF2FCA8FBF7FD5BFC2DFF28FCEB00A2FB1202
      06FDCF031FFDB00587FD8F06D8FE2308EEFE5409D2FE280AB3FF650A5401B20A
      C001E3093103B40878023407390337055D03C103840305023F03A0009202BCFF
      670043FE82FF35FDABFE15FC13FDC5FA8FFBBFF87DFB42F84EFB2CF7ACFCC0F6
      C6FD1AF705FF35F7E1FE7AF72CFF3CF8D100A1F9600189FA2E01E1FB51010EFD
      6E0147FE8000FCFEE60183FFB4012400A100FBFF54007B00ECFF82016CFE5302
      1DFE3E03D6FB7E0423FA7B0530F9AA058BF834067CF7CA05B1F8A90574F88A05
      A2F98A0543FCB40515FE740592FFF5046D020305BB03C4041B05E603BC06CE03
      2B083003D408C401C609CC00FC0A77FF580B55FDBF0BABFB090BA2FA920A62F9
      C207FEF86606F6F8BD0431F9C2018CF9FEFE8EF986FC16FA2BF90DFA0CF87DFA
      A9F75EFBFCF69FFC8EF696FD91F7F8FEFBF68300D9F88E011DF946038EF97D04
      9CFA840582FB5F06A9FCA906DDFEA406DDFF2506D7FF32051302D703A4022C03
      9902DD0126045401DA0311018E0221007D02B5FFF6011CFF8F00EBFD9FFFC0FC
      790058FC7A0078FBDF0151FB9B02AAFB2E0490FB7E0303FC6C049EFCBD058EFD
      73056BFEDB0431FF18052C00EF03F200250355017F036001B102B60155010F01
      0801180106FF850115FEA201A0FC300218FAD5029DF84603E4F64A03D6F40203
      9DF465024BF51202AAF4B9016BF6450128F87E0124F9D600B3FB8500A8FEE300
      75FF91006E011000C1023D007104F0FF970528FF5A07D3FE1A08ACFD4F0966FC
      DF0958FB700A95FAD30924FA210829FA1B076AFA0C065DFBA7030DFCBD015FFC
      BDFE17FD71FC73FDB3FBEFFD73FB22FF25FB220039FB3A0115FB9102B8FBD503
      AFFD050542FD7F06E1FD4C07B6FE3D087DFEE008E2FFBA0829028208B301AC07
      FB0145067003E40474038A033203E301A2041A01F0022F00E701F5FEAD0041FE
      CAFFF4FC08FE67FBFDFC53FAC8FC28F932FD26F8B9FDCBF763FEB6F772FF9BF7
      24FF29F89FFFA0F81801B1F9EA00C5FAAD00A2FB880019FD17002DFEE9FFD1FE
      0C009EFF30002D0095FF48000FFFDB0038FEAD01D0FE3D020DFD8703B9FB6604
      14FB58051BF9DE05F5F7A7055EF992051EF9760562F939056EFB03050DFD1D05
      20FE7004BE0164044A037B044304EF03E205A503FE0645030608A602FB081202
      B3091B01020A95FFAC0A1EFED10AA1FCC00A2AFB5F0996FA7A07CBF939069EF9
      6D0402FAA90117FAF0FE18FAA7FB44FA99F928FA36F876FAA4F721FBD7F6AEFB
      8AF6C9FC65F601FEF6F709FF8FF8820075F8F70168F91403F5F9780449FA6905
      D5FCD0053AFE1A065EFEDB053D004505CB01AE0450027103DD03C60201057902
      4E04010288049101E703460110032100390230FFD80185FED20164FD8B0297FC
      CD0200FCA203C8FB6504EEFB4C0420FC62046CFCF40432FD4F04D3FD9F0376FE
      2B03BFFF4602090041013F008E00B5007A00A5005CFF990040FE9400FAFDC400
      65FDE60024FBB70127FA1902E5F8C50244F6BE02A3F523028CF61E028EF59E01
      60F63701FAF7000122F9AD00B6FA4E00EBFD870037FFA00066005A00DC018100
      23033C00E1044200AF054800EA0698FFC907DCFEA608FCFD480907FD5C0A55FC
      5F0913FC2B089FFBBE0715FC76069DFCF60315FD2A0291FDAAFFB7FDD4FDDFFD
      47FC63FE74FCDDFE89FB62FF13FB85008FFB5001CDFC510247FC90036DFC7304
      55FD7D05D3FC640653FDE0064EFF210793FF050771FF4D0621019A05D0017A04
      2202BF025403EC01CA03FE00F5024B0081028DFF5401C7FEC7008DFD23FF7DFC
      B9FE60FB78FE31FAABFE49F939FE4EF8150052F856008CF8FFFF9CF82D0031F9
      AD000CFAF3FFE6FAE1FFF5FBF4FF5DFD03FF11FE21FEE3FE45FEAAFFACFE3B00
      F2FDE80095FD03015DFED701EFFDB002CEFC9303ECFC84049AFB9A050DFAAA05
      2AFA930525FBC40582FA4205DCFBF4041AFDC704E6FE48049C001A04E902FE03
      E203DD03E6047A036405200302079602E7074402BB078E014108BC00DD08B6FF
      550834FEF708F7FC3509F6FBAE07EDFA180656FA7D056FFA80033DFACC007DFA
      D3FE95FA35FC7CFA03FA76FA44F8A6FA41F8E0FA3FF78FFBEBF67DFCCDF77DFD
      9DF8BEFEF8F7BAFFA0F8E7007BF98C027DF963038FFA7D0471FC3905EAFC8E05
      F1FD7B059FFFAB055901D1043E02CE03D0037E03DA041D0388050D03DA048202
      0B05F80117054501A9035A0097038AFF2C04A4FEB90365FDCE037DFCBC0580FC
      A00570FC9C0434FCCA0488FC9004A7FC8C036EFDEA020AFE6202C9FE930029FF
      BFFE81FF92FE92FF3CFE2400CBFC0B00F5FBADFF80FC270012FB880019FAD100
      A3F9C00129F82F029FF61E02ABF60502E9F6EE01B3F6650172F7140130F9B900
      1BFB6E00ADFC8A0072FE65006800D300E500B500550299008C04C9003305E900
      3505800000078C009C07D8FFAF07FDFE37094BFEB309DBFDC6082EFD4F0836FD
      400847FDB5069DFDA30402FE1B0311FE2B0155FEA5FE4FFE5EFD04FE71FD92FE
      77FC15FFD8FB8DFFF7FC8D00B2FC8901EDFBEC013AFC0703B2FC370400FC7C04
      80FC58053EFD79059DFDA605B8FD4A0510FFF6046E00CA039500A602FB00A601
      85022A014002B5004A019CFFE001E8FE65014BFE61FFF7FCACFF44FC110016FB
      50FFE3F9E7FF36F96B0148F9570152F9930056F9DE00ABF9000149FA810092FB
      B6FF3FFC10006DFDB4FE86FE65FD20FFF8FDFDFF48FE1A01F4FC1E013CFD5F01
      00FE470266FDDB0211FD8E033BFDAE0454FC1905A3FB95056AFB7E0537FC6505
      17FCF204B8FC6504DCFEEC037B00CE03EA005F03B40201035A043B033E04BE02
      A3055002F3063E025206B101360617016307BF003207B2FFD4069AFE26075FFD
      F80667FCDC0593FBE50408FB6004BBFA2403F7FA2300D9FAF2FEC9FA00FD0CFB
      14FAACFAB9F84AFA34F9FFFA18F852FBC1F713FCF3F849FDCCF851FE83F820FF
      58F99D0002FAE90145FAF00266FA1304FDFBA1043FFD9105C5FDC705B5FFB205
      B1015E0508028004FF02F3038805F1039D05CD038F05F2022B0699029F050902
      4B04CC008A042A00D804BFFEAE04AFFDA904C2FCA00584FCB00559FC8F0402FC
      ED03E2FB5F0457FCAB02F3FC5A011DFDFA00F0FD1BFF77FE23FD9DFE8EFD64FF
      DBFCB8FF20FB8BFFBBFA94FFA0FAF3FFE9F9240051F9C100EBF8510145F8C101
      1AF73202B6F6CD01EAF7C501D8F76401AFF8DA0016FBBE0084FCBD0000FD5300
      79FF7E002901FD000902E800A103ED0029052E013205FD0015063D014F073901
      5408DB00EA072400760863FF0409DDFE770876FEA407EFFD070800FEF00649FE
      500466FE89039EFE9701A4FEB1FE06FE01FECBFDD6FD21FEBCFC46FEF5FBD1FE
      55FC5BFF28FC0300C8FBDB00FEFBC10103FC8402EAFB4803F5FA9F0393FC1804
      ECFCD404E6FCA00412FE160445FF9C03EAFE5302B5FFCE01490168017E01F900
      8C011000CF01C7FF030103FF3000F3FDD0FF05FDDC00ADFBA400E1FAA1002FFA
      BA0109FA2A020FFAA401D6F9DE0134FA7B0205FBE000D3FB790068FC29006DFD
      E1FE60FE11FE50FF29FE8200B8FDF400FFFC820192FCA4010AFD5002F7FC0B03
      CDFCA8037FFC2904ADFC110540FB660568FB040555FC030589FC79049DFDA403
      C5FFAE03AE002C0359019302E70256025F04770210051F02C105D5013D067301
      2006F9001406D700F3066D005D070400E005F5FEDA05C7FDCB05FAFCE40458FC
      FA038AFBAF0371FBD8017AFBDEFF74FBA2FE85FBCEFC5BFBBAFAE5FADCF9C5FA
      8EF9F1FA84F98AFB6CF80EFC0DF9C6FC83F9D6FD71F918FFD9F9FAFFECFA6D01
      EDFA7202BDFA2103CFFC56049BFD740532FEA005B0FFDC05D600AC055701D604
      4A02A904320470042E0519044C05AA03DD0536038A055A0200056B01DF043C00
      0106F4FE1E050BFE2205FFFCD30559FC9C052DFC45059CFBDC04BAFB1504E6FB
      D50249FCAE015DFC61000BFDCAFEA8FD43FD4DFEE1FBDDFE93FB45FF05FA98FF
      B0F864FF14F9BEFF9CF8620048F87F003AF83C01F2F7F601BCF6120254F7C401
      29F8F101BFF86C010CFA1001DBFB180180FD9500E9FEA8009000B900B8022C01
      9E035A01DB044601FB05FA0078065C019A069601D70776011C088901A1070501
      11082000E807DEFFE0075FFF6C07CAFEB00687FEE205EDFE4A04D4FE6F02D6FE
      600152FECFFF01FE25FE88FD3AFE91FDF3FDE5FD3EFCDEFDECFC2CFE05FD21FF
      15FCE1FF0AFC6E001EFC410164FBA40162FB210214FC390327FCDA0335FCD703
      C9FCE20391FD3F030EFEC40211FE48024FFFB6014D0049019700190126014A00
      EC00E2FF7500DEFEDC0097FDAE0193FCCB011BFC5202FBFA6F02A5FA1603A0FA
      A30382FAD502D5FA780276FB3602D1FBE10041FC9E001FFD310065FE5FFE57FF
      6CFD350090FD09011CFC9E01B7FBD80133FC880268FB3903CDFB570308FC5504
      D4FBC904E7FB12051EFCC5047EFC93047EFDE703C7FEA303F2FFFA02A4017502
      8B024D023A03E401D304C901AC05EE0160060801710690006106930059068700
      27062200C20535004B054EFF43045EFEA803D8FD370417FDEC027EFC8F0109FC
      3A0138FC74FF1DFCE3FD0DFC8DFDB0FBA1FB6AFB2FFA0BFB9BFA25FB7DFA8DFB
      11FAD8FBBBFA7BFC38FAA4FD60FA6EFE25FB92FF13FB5A00AEFB610128FC6802
      17FCD10313FDAF0432FE7C056BFEA405AAFF7805C8007B05230104057E029E04
      0C04B004B0044B04EE04930309052D035E05FE0166059C00B505B6FF6006A3FE
      700639FD28069CFC2E0732FCA906D0FBD10497FB5D04A2FB5A037FFB8001BCFB
      E9003EFCF3FE3CFD8CFC95FDA6FB42FE87FAD8FEFCF83BFF59F85AFF3EF7B6FF
      88F6180073F78000DDF65C01B1F6D30175F717023AF7F701F9F7B901FCF9B201
      0DFB4701A5FCD700F9FEC6004D00EA004101F00001034C0181047E019D05D600
      4E063401000764017307C6012907D6019707FA01AF077A01BA061C01ED06B900
      200702002D0690FFA50535FF5B0551FFDE034EFF1603F4FE070292FE3200ECFD
      CDFF99FD1BFF57FDA0FE5CFDABFE40FDD7FD95FDC6FC41FE3FFDB2FEDBFC4EFF
      C9FB7AFF87FC4F00CDFB0101CBFA160269FBC8024EFB340301FB1203CDFB1003
      62FCE90251FC480246FDFF0182FEF3016EFF8101C7FF3C01F4FFB2006700B8FF
      76008FFE7401E5FDB902E7FCF5020DFC740381FB660459FB630453FBB8033EFB
      B3037AFBAE02B0FB3B0247FC6F0106FDE9FF63FEF5FE02FFE0FDF9FFB1FCCA00
      94FC7B01DEFBD101B6FA430285FBD702F6FB57035BFB100452FCB104B6FCC204
      FCFB99042EFD4B04C1FE12045AFF16032C01BC02C50240022303E901D403B701
      CB049601F5051B011306540038066F00D5050400A3051B00F104FDFFF504DBFF
      060440FFD602CEFE790240FE13026FFD8701FFFCB100E2FC5CFFCCFCDCFECBFC
      04FE89FCC2FC6BFC03FCC8FBC1FBBFFBB6FA97FBAEFBCDFB1FFC02FCC9FACBFC
      3EFB97FDD9FB2BFEC4FBE9FE1AFCA2FF42FDAD0031FC9801A3FC1103ADFDF503
      F8FDA8047FFE270564FF7F05B2FF35058A000605C001FA043803E10412048B04
      B5043C04A70460035E0557026005420146066B007106EAFEBE06E5FDDE0601FD
      CE0687FC9F06F1FB78058CFBFB0315FBD202D3FA250236FBDBFF94FB8BFE6BFC
      2BFDCAFCA5FAA8FD55F958FE17F9EFFEB6F62CFF14F688FFB9F61C0094F6A200
      73F69701AFF72C0215F7310272F76702C5F8630287FA4F02CDFBA00101FEA801
      70FF390127014A017B026C01DA0375018E0521011F06B800A1062B0145071C01
      B50762019707A7019707D2014A077301A2064F011106F9004E0637001706E8FF
      0105E6FF1B04C2FF5104A9FF370241FF9101FAFE0A0130FEF2FFC0FDE1FE5FFD
      F7FF3AFDCDFEE8FCC0FD5EFD0FFEC4FD5AFDC4FDA2FC14FECCFCA8FE08FC1AFF
      2AFBBAFF40FBF5001BFB9101BCFA2102E0FA840298FAD402D1FA6F02B1FB6302
      52FC8A02C4FD71027DFE260227FFF3014AFF79014B007B00A700B5FFE8011BFF
      8E02A9FD9F031BFD07049EFCB5045AFC2305CBFB8F04C2FB860393FB89039CFB
      72023DFC9401C9FC4D01D4FDDCFF59FEF7FDAAFFBBFDAC00A3FC360125FBA301
      9AFB5F027EFBEC0285FB5F0358FC5A04A2FC960438FC760427FDC4047CFD6F04
      00FFF6035700FC028801CD0251021302E603CB0126046801FF04F700BB052E00
      9D0595FF2B05C1FFA30546FF51053DFFB50487FFBB0389FFED0232FF7D0102FF
      BB007EFE0601CCFD6F009DFD06FF8DFDD3FE7EFD81FE75FD08FD32FD38FD4DFD
      68FCAEFCAEFB62FCD9FB52FCB7FC5FFC16FC48FCABFC34FDA6FC91FDAEFCB6FD
      56FD6AFE83FD55FFFFFCECFFEDFDFE00C3FD45024DFE1A03C0FEF903DEFE9504
      78FE1805C2FFE5047100E10459014005DC021F054C03BE049F037C044404E403
      F904B8022105DE01C705EB001C0639FF7C0676FE8A0679FD0407F5FC4106FAFB
      E70460FB9E03E2FAEC02ADFAB300ADFA670011FBBFFEC2FB9CFCF0FBE3FA29FD
      EDF92BFE6FF76CFEC7F61EFF55F6BBFFEFF53D006CF6E4000EF7E301B1F63302
      A4F782025AF8E9024FF9C4025FFBAE02CBFC0B021BFE26025800D8013002A801
      03039401C50465017805D8003306A500E606DD002F08A0000108F7003B087401
      9807910126079701F20553011D061801AC05A2003E053900400413005E041600
      C702B3FF7C0288FFED017DFF990054FEFBFFE2FDE3FFBDFDF0FE47FDBDFE0AFD
      A0FE59FDB9FD14FD57FD03FD3BFD68FD13FCD2FDB6FB26FEDAFBC9FEDBFAC7FF
      4EFBC0007CFA56012AFAE001ECF970029FFA2A0266FA5002E7FBDB02A4FCA202
      47FD6E0208FE6F025BFF2402AFFF7E01D300B900C001FCFFEC02E6FE120330FE
      990484FD52054AFD550542FCAF04CFFBAB0401FCA203C1FBE202FFFB6A03C8FC
      060248FDA800DFFD84FF67FF35FE2900C7FC9D004DFC79016FFBFC01A6FBA702
      E1FB5D0308FCE40352FC65041FFD7D0477FCA304F4FD590415FFEA03C7FFEC02
      D500E902B6023702E2029701E1034101A0049700D404E0FF750468FFEF0415FF
      4205C5FEFF04C4FE4D0410FF990352FF08021BFFD200B3FECF00DBFE2F0060FE
      37FFCBFDA5FE4CFE7AFEFDFD90FDD3FDE2FD11FE27FD09FE84FC15FD73FC3DFD
      8CFC1DFDE8FC08FD84FD39FD0EFD5FFD9DFD76FDDFFDD2FDF8FD08FED0FDDEFE
      97FE60FF14FEFFFFB1FE41018AFF9502D5FE0C03BCFEE203FFFE81040AFF5F04
      B3FFB604BE00EB048101E10400027D04F9024504FD03EB0381044F039A04FC01
      33056501B6052A007005D5FE940604FE780668FDA305C8FB810464FBAD03FCFA
      410269FA51017CFA4E00DAFA91FEFEFA22FD06FCF5FAD5FC5FF99DFD37F86AFE
      3DF6F0FED8F58BFF5DF6A0004EF61801A9F6C401C8F7D402EFF7DA026CF84903
      74FA7303A0FB290307FDA30216FFD30204013E029B020702E203A901F5047201
      E90504015F068D005C07500082089F0057084A001F08F700E40748019706EC00
      0206C000AA053801C3046F0040042700AD0370005C03E4FFFD02F0FF5C02C9FF
      460141FFE50096FE00002CFE86FFB4FD1000C3FDF2FE2DFD48FED3FC87FE20FD
      6BFDF4FC8AFC98FC77FC79FDA4FB50FD01FBCDFD4DFBEDFEEEFA1500D2F95500
      B3F95C0130F9E5014FF950028FF98D025BFAD3028FFB210378FCD102DAFDAF02
      73FFF602E3FF3002C4005E016702380120032E00E70327FF8E05BDFECA05F7FD
      E005DEFCCE05BBFC200502FC0905F9FB2C0407FCA80332FCFF02D5FC8E01EEFD
      7DFF57FE0FFFB1FF47FD5B007FFBBF00BAFBA50183FB7B021AFB8E025CFC8603
      78FC0A0484FC1404EDFC6804E4FD48049FFE9F03F9FF4A030001DA024B022A02
      2E03AC015303DB00560493004904D5FF250410FF9304D9FEEC04CAFE10046FFE
      E10330FFC30225FF7301F7FE9D0011FFB8FF47FF11FFC9FEC5FEF0FEC1FDA8FE
      A4FEBEFE4FFEF2FEAEFDA4FE8FFD6CFECBFD3FFEC2FC75FD04FEA6FDCFFED4FD
      00FE31FD98FE4CFD08FFB8FD9EFE6AFDCCFE84FDFFFE41FE93FE38FECAFE15FF
      E4FE08004DFF2C01E4FEDA0158FEB60227FE6D039EFE3204EBFD1A043FFF7E04
      6C00CC040A016A0405021D04AC034804740333034C04AB02DD04F301AD05E600
      C405CCFF5906F0FE84060BFEF70517FD5A041EFCCC0348FB640335FB0601A4FA
      5800CEFA82FF7EFBD5FCC1FB3DFB7EFC93FA14FED3F75BFE1BF61BFFFFF50400
      E9F5730022F6DE0067F71D0294F75202A6F8C302ECF80803F9FA3A0360FCE502
      ECFDD70261FF7F02D8015002D502B30100045F01AB054101FC055900BD06E5FF
      BD070C003A08EFFF1F080300CA07AA005807B9009806E2006505100177044601
      3E0406014103BF00E4026D00DA03DB008A025E00D80111008201D6FF0A012EFF
      F0FF4EFEA200D2FEF2FF12FE45FF62FD07FF4CFDA7FE11FD09FE8DFC13FDA0FC
      35FC9FFCD4FBB1FC1FFB57FDBBFA08FEA8FAF8FEDBF9ABFFC7F84D00D2F85101
      74F8F20129F8030259F97E02C2FAAF021FFCB7024DFDB602DFFEE502CBFF4102
      EC00140221024901F903F5006C041400860557FFE406C3FEC3060BFE400614FD
      5B06EBFCE805ACFC8B0443FC5304A9FC860333FDE00179FDD300CBFE5AFFDCFF
      A2FD4100BBFB36014BFBCC0169FB2B028DFBC202F9FB49036EFC7A03B0FCE503
      CFFCCE032DFEDA03DDFE6B03A1FFF102BF007B020D023C02C902210128039900
      CE030100C10315FFE00386FEE70360FE550421FE85031CFEFF0272FEB002F1FE
      170125FFAAFF27FFF0FE5EFF64FE67FFC8FD04FF2EFE46FF73FE9DFF30FE28FF
      03FE38FFF1FD3AFF39FEDDFE1CFE94FEA4FED9FE5EFF42FE45FF27FE95FFF7FD
      F0FFB7FD1D00A9FD6BFF71FD99FF85FD24FF17FE2BFF8BFE4BFF22FF45FF2600
      C9FEEB00F5FDA10157FDBD023DFD0E0328FD2803EDFD950363FFE0033800EE03
      1301C7035C029803C80220032B03C7025C041E02FF048601740562003B067FFF
      6206D3FEC605D1FD5B05FBFCF20363FC7303AAFBB80161FB99008FFB97FFB8FB
      32FE36FC23FC46FDE5FA0EFEA6F8C9FEBDF69EFF92F6F7FFCAF69300CEF63601
      7AF7A70102F85D02B6F89902D5F9AA021FFBFA02A9FCDE02F6FD96028AFF7702
      D3013E0220034D019C0312015205A700AD05F4FF500680FF1F073CFFB00744FF
      080760FFB607FBFF02076800E6058600B104AA00A703ED003603F8003803B200
      9802E300D902BE006E02890086016B00A50120008301C5FF6C0080FFD6004DFF
      D100D2FE000073FE1300CCFD6AFF56FDADFE21FDCBFD8EFC20FD85FCEBFBA4FC
      E8FBE0FCFEFA7FFDC8FA65FEE4F911FFA0F8D7FFE8F7A300B8F7DE0058F75C01
      C8F8E401AFF91802C4FA55029AFC7B02CBFD57028BFE650244004D028201F101
      D2024D01C404D100B6051D006E067AFF5407C4FED4063AFE950697FD870629FD
      230508FD0F050FFD94044CFD410322FEFB01F0FEA700BFFFEFFD48002AFDF100
      69FC5B0100FCFF014BFC7C0258FCA7023AFC3203EBFC0C034BFD6303A2FD5503
      B1FE130354FF950290004F02E901BB011002FC00B6027B00E602B0FFAE02E8FE
      6C037AFE0103C0FDB302DCFDF502E9FD640276FE2201ABFEC5002EFFE3FE2FFF
      C3FD4FFF2CFEA1FFAFFDA3FF68FDD5FF2DFEC2FFF4FDDCFFF9FD98FFBDFE99FF
      98FEB2FF19FFA2FF00006CFF350024FF2901D0FE56017EFEF1001AFE8901FCFD
      160145FD520065FD61006EFD5A0012FECAFF92FEE8FF61FFDBFE0000B8FDE200
      03FD780176FCDA0194FC4F0223FDA50265FDDF02F3FE4D03E2FF21031200DD02
      5901EB029501AD02670279021A04C101EB04F900F304F9FFFD0578FF6405AAFE
      A00405FE800428FDD10275FC910121FC7E016BFC1000A2FCC1FE5AFD7EFDD6FD
      2BFBABFE63F919FFC6F8EAFF9BF75100D4F7DD0023F841014AF8BC0161F94C02
      0EFA5A02E6FAB40202FCAA0279FD9002CFFE6802FD0017022B0280017B030101
      81048A00D704F7FFC90573FF5706E5FE060630FEE306B7FEB906D3FE2A0680FF
      F305D0FFCE04110002031600D1029900F201D9005D01DB00DF010E015401CB00
      1701CC007701CC00DE0090004F00780049012F00A100E5FFC70065FF4D01F9FE
      B2006CFEF5FFDFFD03006DFDBCFECAFCB0FDC1FC13FD86FCC2FC01FD1DFC85FD
      38FB27FE23FAD3FE23F992FFECF70600BFF79000E5F72301E9F7860115F9EB01
      F1FA2402E0FBF70117FD3C0246FE3B0201FF37026E013E02EE0287015104CC00
      B00577007F06DBFF950613FF8E07A1FE9906D0FD97051FFDE80545FD710559FD
      6604BBFD0F0475FE2E021BFF1000DDFF0BFF7000E3FDE10084FC7B019AFCDF01
      8AFC3002BDFC8E0232FDD40247FDD702A0FD3503D1FD1A0302FFC902DAFF7F02
      F200D701900161015602C8005F0218009B025DFFA602AFFE4B02E0FD6F02BDFD
      4B02CAFDC201EEFDC80197FEA10000FF30FFFCFE98FE9CFF97FD89FF92FCD2FF
      59FD17005FFD58001BFDFEFF42FE610082FE280045FE2F0028FF700028001800
      2E00B3FF620170FF2102F2FE44029CFE460241FE89027EFDF5010DFD4701EEFC
      FD0010FDE50083FD7D001BFEA5FF7EFEDAFE80FF99FDE7FFB9FCC800FFFB1A01
      D0FB94010BFCDF0194FCB502AAFD8802DDFEC4021DFFC8028AFFB8020401D502
      0B02D902BD02E3018D047001C404B200BC041A0068059FFF1105B2FE8D03B0FD
      1B0346FDB00217FD670107FD1F01ECFDE4FFF3FD0EFE8FFE61FC64FF30FBE6FF
      A7F9100004F9EB0014F9DE005EF95D01F0F9A401A8FA1B02F7FA1402BCFB5C02
      D1FC240228FE3F0218FFB3010201620102021001180352001304ABFF340446FF
      650461FE2005D6FD7205E9FD0105D0FDA5056BFEDF0413FF0D0476FF9303C0FF
      65023500BF001900E500E400CA00D200B200F0001D011001300120017F00D600
      10017C013D011B012A01A2004F019300B9012900910167FFC10133FF88014BFE
      A1006BFDAAFF18FDF8FED5FC23FEF3FC4FFD26FDEEFC82FD8AFB23FE7BFADDFE
      92F92AFF8BF8000049F71200E6F78F00DEF72F01ACF893017CFA810186FBD901
      D3FBCB019BFD0A02FCFE38025500E40161027401F403240164044C00F1052800
      AF066AFF7F0650FE5B0614FE0806A3FDA0056BFD6605E8FD2A0569FE9A0376FE
      8302A5FFCD002F0066FF610031FE1401B5FD7E012BFDA7017AFD4402E4FD5F02
      CEFDA202B6FDD30261FECF0298FECD0248FF9E025700F2010E01D30130015E01
      55027A005602DFFFCA010DFF560250FE1902FBFD7201CEFD8E01A7FD6B0140FE
      2D007DFEFBFF28FFFAFE76FF69FD50FFA8FCABFFBEFC130084FCF0FF3AFD5B00
      89FD6100D7FDEBFF69FE550028FF9900A1FF1700500029000401E9FF900152FF
      7D0244FFFC02ADFEEC02C2FDE6024CFDB502EFFCE301B1FC5F0146FD14014AFD
      5B00BDFD50FF91FEFCFE2EFF55FDC7FFEFFB740081FBAA0090FB2B0120FBBD01
      47FCF80157FD56028BFD5502A8FE6902AAFFC2023E00BA027401A102E6027502
      9903C80172042301F804CC000A05BEFFF40408FF7D04C4FE8703E9FD2B0334FE
      1E025AFE500179FE2F00FDFEDDFE95FFAFFCAEFF93FB390076FAB100E2F97D00
      FEF921018EFA310193FA2401E0FAA801C9FBB9015DFC680123FD8F018BFE7601
      92FFFE006700EA0010026000FD027DFF5303D7FEBC0348FE7E0414FE13049DFD
      810486FD7704D9FD1A0453FE9A03CAFE6F03A8FF5002DEFF4F01BDFF48008700
      1F00BC003600EF009C00170184002301F7001E01DB006F0111015C01D1014801
      D3012401C101B6002D02BF00B0024200340210FF6B0297FEF3011AFEB00056FD
      8DFF77FD2EFFADFDE6FD39FDDBFCC1FD08FC9EFEC7FABFFECEF846FF37F8B7FF
      71F7F7FF09F723002FF7B10081F8BB0079F90D0195FAF400D8FB4F010AFD6D01
      47FE6A011A009A01F00179014803F000320474006505FDFF9A061EFFCC06C4FE
      D10684FE9A061EFE250658FE65057FFE7A0501FF4504A0FF5202F4FF0A01A800
      15000101B0FE4B0156FE7F0160FE3702E9FDC601E6FD4302B0FEAF0273FE6102
      79FE4A0215FF9402CEFF18021200E101E800DA018601E800A701F5FFEF0165FF
      0B02AFFE29025EFE7A01FDFD2801B6FD0701F6FD590048FEA9FFB4FE02FF43FF
      25FE6CFF91FC3AFF3FFCCBFF6FFCE4FF74FC1C00D2FC030089FD320020FE1700
      3EFE430067FF1E00430052005C00F8FF3E01E6FF5A02ECFFEC0239FF300362FE
      000418FEA50374FD0C0312FDC70262FD02025BFD3A0162FD60003FFEABFF9AFE
      66FE22FF20FDEFFFC9FB12006CFB8700D6FAE600E1FA2101C2FB6701B4FC2302
      D5FCAA0124FE170214FF3F029DFF4D02CC0086025802A102E202D5019B035301
      A304DA0027051E00BB049FFFDB0447FF5504D1FE780302FFB90209FF2F029FFF
      C100BCFFD5FEEEFFFDFD8B0073FCB00086FBC300E4FAEF0042FB1C0108FBB500
      79FB5301B8FB350151FCF10081FCF70088FDE800C1FEBB0076FFFA00CEFF3900
      9301ACFF46021BFF9F023BFE5503D1FD3A041AFE67034FFD120474FD5C0422FE
      50035BFEAF02D1FE8802C7FFDB01A6FF7600DFFF6C006D0004009F000600DC00
      4200D70004011001C5001301A7002A0123010401DB0162018E01F500F2011701
      1802F6007A022F00160277FFBD02E6FE0B0239FE10011BFEE4FFD0FDABFFD3FD
      45FE25FEE4FC66FE21FC6CFED7FA7DFFE2F848FF68F874FFFEF71800CFF6D6FF
      6DF7DEFFABF89B0062F99F0020FA3C00F8FBEA007AFCAB00CAFDF000A6FF8101
      7D0130016E02D300CD0380001A05EAFF6006A0FFA7063BFF5807D0FE2407D3FE
      D60639FF01063FFF2A061900C204160008038100EB012F0110015E018BFF8101
      00FFAB014AFFB4018CFED8012FFE1302E8FED801CEFEF80108FEB50100FF9401
      8DFF180221FF8E01C3FFCC00E500D5006700B6FFC800A0FE7E01CBFE920147FE
      DB00ABFD2A014AFE610055FEA5FF67FEE5FE1CFFB2FE55FFD2FD54FFDBFCABFF
      6EFC8FFFDEFCEFFF02FD26004AFDCBFF10FE1B0066FEFCFF85FEBCFFA5FFFAFF
      AE0022009D00C3FF2301FCFF7D02C0FFD4021BFF1603BBFE0B04E3FDD803A5FD
      060379FD17035AFDC602CFFDF80024FE6A003FFEA5FF03FF4FFE86FFE3FC87FF
      4EFC4C00F0FA690095FA2C0006FB25018CFB220100FC310181FCA30159FD9A01
      39FE76010FFF5F0223005F02520104024C022702C5025E014604EE00BD04B200
      B5040100FD04B0FF1105D1FF2304C4FF6103410026037D0084016700E7FFC900
      1AFF3101F0FDFE0062FC4A0142FCEB006EFCF600ECFBF70017FCBF00AEFCAB00
      86FC9E00F3FC2200DDFD750073FE7700C4FEC8FF9FFF9CFF350028FF4A010AFE
      AF01C0FDA3027FFD4D0313FD600399FD1B038AFD6C03E4FDC202A7FEC601FEFE
      CD0144FF3F012400F6FFE6FFE4FF24003500EB00EFFFF7000F00B100E5003601
      B500DF009900070155013701C401490164011F019B01FC007002D400FA017500
      5F02A5FFB302CEFE7F02B5FE670125FE2B0159FEFDFFA3FEB7FE96FE85FDC8FE
      7BFC5FFF06FB4FFF87F9B3FF88F8BCFF34F897FF84F7C8FFBAF73600B2F8E2FF
      55F96500A2F9230082FB120065FC8B002DFDC50033FFBC00E200E700D9017C00
      2F030C0027052200BC056EFFBF0612FF6D0734FF8C0745FFCE0687FFBB065300
      4A065E001505C90080031D01CE02AE014901C0015700E301E0FFB5018DFF0502
      A6FEB601B4FECD0190FECB019FFE81016DFE6701B6FEAA01EEFE3C0118FF0101
      2EFF9200D0FFBFFF18003CFF03007EFE180112FE3C010EFECB0030FE9E00E1FD
      8000BFFE43FFDCFE0DFF0DFF60FE86FF85FDBAFFB1FC7AFFDCFCEEFFD5FCF6FF
      35FD090032FDC3FF22FED2FF7AFEB1FF32FF0000DBFFB1FFDF00E9FF9300BCFF
      7C0170FF550279FFBC02F9FE3E0343FEF003B0FD1F04A1FDC30378FD9E03F2FD
      C70218FEB70196FE4A00F4FE89FF54FFF9FDBAFF7DFC1C00A4FB070031FB9B00
      4AFAAC00EDFAF30041FB180177FB6A01F5FB220147FDB30156FDAE01B5FECE01
      85FF2702BA000E02AB01A301E3028E01E9032201E90484002905510095051C00
      AC054D00E20478004504E10095030C01EE013C0198001F01EFFF93015CFE6A01
      C7FD33014CFD180102FDEE007DFC6B00BCFC750096FC3100EDFC0B00EEFCC5FF
      DDFDC0FF12FE6CFF9DFE47FF10FFA5FE2B0059FE57009DFD9701F8FC4A020BFD
      950210FDF30250FD0303AAFD7E024AFE1B02A6FE73015AFFB500B8FF8500FDFF
      DDFF670096FF9A00E4FFF100A4FF3B01B8FFD700A100030173003401EC006701
      64013D01C801740172010A013C020401E701DB0050024E0069029FFFC202F3FE
      9302AFFE2402AAFE6401DDFEB900FDFE4DFF3EFFE1FD55FF93FC86FFE1FAC2FF
      95F9ADFFF7F8C1FF1DF8C7FFD8F7B8FF2DF8D6FF99F8C2FF8FF9C8FF38FABEFF
      54FBE6FF4AFCEAFF93FD3500B1FE3500CE004A0062012000E502E6FFDA04AFFF
      BD057AFF7F0615FFF3074AFFA507EDFF4A0741003807DF005B064B018A046201
      B00396019B02260279015402D2001F0237002602CEFF030206FFD70102FFC501
      02FFB20191FE790160FE2601F0FE170174FEC500BBFE7600F9FEE4FF46FF63FF
      4EFFABFE4B002AFE9000DDFD0A01E3FDCF0014FE730031FE0900B1FE06FFE9FE
      3CFE24FF07FE70FF14FDAAFFA4FCC8FF3BFDE3FF00FD10000AFDC0FFFAFD88FF
      24FE87FF8BFE89FFC0FFB7FF0A0091FF95007EFF100147FFD70160FFFE011AFF
      E402BFFE25033DFEEA03C9FDE103A2FD0B0402FEBA0372FEBA02B7FE960141FF
      75009DFFBFFED0FFA6FD480080FC9F0051FBAC00E6FADA00BDFA0A0188FAE000
      3EFB0A01A2FB4401C0FB240120FD7501A9FD99018BFEB201BAFFC501D200DE01
      2D018301FD025A01DA03EB00AF0499009D054C0011065B000806B300EE052301
      D8047201D8037B0143027901E6007401E9FF9D0101FF9E01F9FD3D01C1FDE400
      72FD670018FD4D0023FD0C00D6FCA9FF11FD95FF55FD3FFF79FDD3FED3FDB2FE
      4AFEA2FE1BFEC5FD86FF9AFD05002DFDC100A6FCEC01ADFCA6023AFD440261FD
      E502F4FD2A02A9FEFE0002FFCC009FFF2F002F004EFF80009AFFF50088FF1E01
      6DFF5101CEFF2D012000090143001301C5006201170179017F015901C6014901
      A201E9005602EF00EE01AC0054023700C4026DFF0B03E4FED002BFFEF8021AFF
      DC010AFFE2004EFFA7FF79FFCAFD60FF3DFCC9FFEAFA220018F9BDFFF5F8DBFF
      74F8ECFFE0F785FF85F864FF16F995FF16F922FF89FA47FF8EFBA5FFE9FB8EFF
      DAFDBAFFF7FED2FF1A00E3FF7501D8FF1A03C2FF1D046CFFF10570FFF10635FF
      C107B5FF16088000DA07FD002D076D014306E701A3042402BC0373026402E602
      A701EA021301910267005B02DEFF1402AFFF1B02D3FE8A01D8FE780103FF5201
      4CFEAC007EFE980088FE7300FAFDB9FF4EFE22FF26FFF1FEA0FEE3FDF6FF95FD
      A9009DFDA60082FDE800D3FDC4004FFE29FF70FEDDFED5FE28FE52FF31FD72FF
      E6FCD2FFE2FCEAFFA9FCBAFF72FDE3FF8FFD7BFF00FE4DFF6BFE71FF0EFF77FF
      BEFF6AFF7B0077FFDD0059FF310128FFAD012FFF0B02FCFEF202A0FE080308FE
      DA03EDFD5F0444FE0B048FFECA03CEFE350379FF110192FFFBFFFCFFCCFED000
      E0FCE500E1FB0C01DEFB6E0174FA4901C7FA41011EFB4101EFFA040167FB1401
      67FC500160FC2101ADFD6001DBFE7E0154FF4201890089017B014F015E02A600
      B5037A001A058300A1050F005C068D008506EE001C061D0116057301E803AD01
      6F02D3011801B1012000C501BEFFB30181FE390141FEC30009FE750066FD1B00
      35FD81FFB0FD8DFFE7FC08FF52FD83FED6FDA0FE8BFD50FEC6FDFDFD78FE97FD
      78FE19FD7DFF91FC0301C2FC4301B3FC1F023CFD9B02BFFDCB0102FE6701E5FE
      0001A6FFC3FFEAFF75FF97005EFF220107FF17012AFF7901D7FFD0018FFF1D01
      16002D018A006901F600490112015601C9015501F3012301C601D0001202C700
      5E026C001702B0FF8F02F3FE610308FF0D0309FFC7020EFF82021BFFAC005AFF
      34FF4AFFFDFDE2FFC9FB1A0064FA0500C0F90400C6F8DDFF82F8D2FFE4F8CEFF
      82F82FFF1CF91CFF09FA30FF64FA11FF4FFB35FFEEFCA5FF92FD49FF16FF8CFF
      8100F8FF5E016FFF9D025AFF910480FF020682FF1807AFFF280899004608DB00
      C4077D0144071302270684028E04DA0270030603C0023303B7013A033201EC02
      E200D302E8FF570288FF150275FF8101C6FE580190FEAF00BBFEA30011FE4800
      30FEDEFF40FE71FFB9FD89FE25FE08FE27FFA9FD58FF35FD290020FDEB007EFD
      4D0065FDB8FFDAFD94FFABFE55FEA4FE83FDECFE52FD9FFFC5FC81FF61FC96FF
      09FDDFFF85FDAFFF9BFD23FF40FE71FFE9FE2EFF48FF3EFF1C0034FF08015EFF
      2D014AFF780147FFD30102FF1E02CFFEAB024BFE700343FED60381FE7004BDFE
      7604E5FE970343FFD102D7FF84017A0057FFFA002FFE4B0120FD91017FFBAC01
      E4FAC9012EFB1A0265FA9901C4FA460176FB93017FFB2801BEFB410118FD5A01
      FBFD480195FE0E01D4FF93017000FD002301790065026B00150431003F051000
      2D066600DB066100B40691004706220183059B01E303A7018D02D70137018801
      4200B9019EFF8B0134FF3C013BFEC2003AFE3A000CFEE2FF5EFD50FF52FD05FF
      92FD92FE0FFD71FE7CFD42FEECFD16FE5DFD87FD97FDEAFCD6FED6FC76FF94FC
      69007FFC9D0108FDC6011AFDAD019DFDB701C0FE480180FF4C00B7FFC5FFA900
      24FFF000D0FE3C01ABFEBB011BFFF4015AFF9C01C7FFA7010600810173006301
      BD007B0180013B01BE0129011F0232012302C500D0013B002702F3FFBA0243FF
      AE020DFF250313FF8903ECFEBB02C3FEF601F9FE4F017AFF34FFC8FF74FD0200
      47FC31006CFA040038F90700D2F81E00A0F8220081F85FFF12F969FF29F938FF
      EFF9E8FEA8FA43FFE8FB3BFF4CFD1EFF7CFE73FF4BFF92FF740040FF920158FF
      FF0267FFCF046CFF8C06DEFF8507190055086C00860856016208EC015A078E02
      07062303DD044B0320033E034A02CC03DF017C03D5002D033C00FD023C009B02
      53FFE401BAFE6E01D5FEFD005DFE7D00F0FD3F0066FEF7FF97FD41FF3BFD68FE
      6BFD00FE12FEA2FDB7FE0DFD92FFC6FCE6FFB9FC5D0098FC3B0063FDC9FF0FFE
      5BFF2AFE4BFE85FE37FDFAFEE9FC23FF87FCB2FF45FCAAFFF0FCA1FF8CFD8FFF
      00FE95FF71FE2EFFF5FE6DFF9BFF26FF830015FF200184FFDF018DFFA50110FF
      D001F0FED602D5FE690396FEA703D0FE9604DCFE7B04BBFE2C0421FFF303D9FF
      DA029D00F0001D0199FF8A01C0FDC40169FCEE0167FB740290FA5B0296FA3A02
      9FFAC10167FAD301CAFA600165FB80019EFB59011EFD0B0144FE0D01D6FE1801
      A8FFAA0093008A0051012200E902E7FF4004E5FFAF05E1FF6C0696FFE4060F00
      FE069300CA06F700650582013804B001B5026901EB008F016700B901E1FF5201
      C3FE1D0193FEAC000AFE330072FD80FF81FD50FF8BFDB8FE65FD82FE83FD4CFE
      8BFD10FE49FD73FD9EFD40FD99FDF6FCBDFEB8FCC8FF8FFC53009AFC310193FC
      EC0167FD6F0142FE9D0112FF13018CFFF4FF4D0025FF9700B7FE5C0107FEC301
      6DFED701B1FE2A0232FF0A02AFFFEA01A9FFC0011A00B7012401490180016701
      DF0158013602CB00A30167000F022700E202B1FFE40260FF150306FF5003B7FE
      0C035FFE3503E4FE5F0216FFE40091FF31FFB1FF7EFD130097FBDBFFA6FA2C00
      17F93D0098F8FCFFEBF8E6FFEBF8AAFF0BF948FF87F919FFD7F913FF3EFB02FF
      B6FC16FFA3FD39FFB3FEF2FE80FF28FF6D0055FF6F0243FFEA0399FF050592FF
      E50696FFBA07090048080F01EA089B0141088102D606F902C9056A0329049C03
      F3020C044102DE034301C3038D007B031D00410314FF9C0202FFF10197FE5C01
      3CFED00046FE7A000BFE1A0089FD3BFF65FD95FE51FD0EFE68FD92FD6AFE0AFD
      E9FE81FC54FFE4FB100000FC1C00C0FC5A0014FD1A00D8FD09FFE4FD45FE32FE
      50FD9EFE87FC5AFFB2FC23FFE2FC83FFD3FCA3FFCAFD77FF35FE86FF5AFE94FF
      71FF3CFF360049FFB10078FF7B0186FFA50131FFC30139FF8E0204FF05031DFF
      7C03FCFEFB0306FFE203FCFE4B041FFF5E040300770381006D024A01BB00A701
      CEFE0B024AFD1A02EAFBB202D1FA9C028FFABA0267FA8B0245FA2F0287FAD901
      8CFAC80159FB3B01A7FC3C013BFDEB0032FE930017FF42009DFF7400FB00E1FF
      5402E7FF4A03AFFFAF043DFF0C062FFFB60683FF7B07F1FF5907550097060001
      C10529011504860181028A017401AD0178006901B4FF680151FF12015FFEC200
      A4FDFBFFC2FDABFF8EFD08FFB0FDDFFE7DFD8DFE1AFD26FE20FD80FD0AFD78FD
      80FD08FDFBFDFCFC9AFEACFC4AFF4EFC660049FCEB001DFD4101ABFDAF0179FE
      10016AFF7900B4FFE1FF6800AAFE1F0127FE8E011FFEAD013AFE4702ABFE3902
      18FF470237FF0A02B9FFE1016B00900106018401B1013A019D01040198017600
      210255008E02E4FFD402AEFF2B030FFF0C03C6FE1E0370FE7403B3FE5103E6FE
      62024BFFE900C8FF25FFDDFF9DFD0E00BBFB3D0053FA25009EF9170005F94E00
      19F9F0FF69F9B0FF62F99EFF8EF93AFFBFFAFFFEDCFB41FFB6FCD4FEE3FDBBFE
      A2FED6FEC0FF10FF4F010CFFB80269FF320452FF560567FFB006B8FFD6076500
      7F082E015F08F101FC07A702D7064F033705B5031D040604D3021004EC011B04
      0A011F044800D90367FF5703C4FECE0286FEFA015EFE4F011CFEEE0090FD2900
      7DFD5BFF3DFDDFFEEFFC37FE7EFD97FD9BFD44FD3AFE75FCF3FED3FB9FFFDAFB
      EAFF00FC50004BFC8D00F9FC130052FD6DFFBBFD53FE3BFE62FD9BFEF6FCE2FE
      DBFC42FF1DFD7BFF69FDA7FF9EFD9FFF49FE77FFE2FE60FF9FFF71FF390060FF
      C50065FF08013FFF870167FF0D0255FFA60254FF00035BFF510336FFC30310FF
      06049AFF0704EDFF32046300690330010B02E8018D002F02E6FEBA02CAFCDE02
      B9FBC50219FB1A037DFA160382FADF0266FAA102A1FA3602E8FAAC01DAFB8101
      A9FC060145FD87000FFE1C0014FFE2FF4900B6FF5801ABFF96023AFFF603FFFE
      FA04ABFE5906D0FE0A0707FF7907AAFF33070000C0069900A605EE00EE035401
      590256015D0138018200630181FF5B01F4FEF0001EFED60065FD4A0092FD7CFF
      86FD43FF09FDE1FEC0FC44FED5FCF5FDC4FCCDFD33FD4DFDB6FD4EFDFCFD13FD
      DDFEC2FC93FFA1FC6B00F4FCF90043FD3D0125FE6F01BFFE400197FF90001F00
      97FFA200ABFE190133FEA901FBFDE60149FE420272FE4B02ABFE240203FFEF01
      A5FFC70144007101870023012101C800620199007E0169004A02FFFFB502ACFF
      CB0255FFF302CEFE5103A7FE1703B8FE6C0375FE5B0305FF4E0270FF0501C7FF
      4BFF1A0087FD4D00CAFB0B009BFA4A00ABF96E0077F9480057F92E005AF91200
      FBF9A7FF2BFA93FFF6FA3FFF20FC0FFFF4FCCDFE02FED4FE2EFFF6FEB3003FFF
      A0012FFF40034AFFAC0456FFE20584FFDA06F4FFF50781008608430130081702
      BC07CB02A40661038F04D1037303D0038502EC03470138043B00FD03A5FFA503
      AFFE6E0357FE8C024AFEFD01A8FD530147FD8700ECFCB3FFFFFC39FF2AFD78FE
      54FD1DFE5BFD5CFD28FEB6FCA1FE2BFC36FFFAFBEEFFB8FB5500F5FB3B002AFC
      D900A1FC480032FD54FFABFD59FEEAFDB3FD52FE1DFD9EFE06FD25FF36FD67FF
      59FD7EFF9FFD8BFF73FE74FF00FF80FF63FF80FFC8FF54FFB5002FFFF70080FF
      A7017CFFA102B5FFB302B5FF470395FF96037DFFCE03F3FFD403F0FF44047500
      B0030E012E038C01C0011602EAFFEC0255FEDA02E7FC200357FB3103EDFA4703
      4CFA0C03FFF9200345FAB102E6FA4102C1FAB301D1FB42018FFCC00059FD3800
      9CFEFCFFDFFFB2FFF70069FFF8013BFF5103FCFE830477FE910572FE830679FE
      5F07DEFEA10766FF6207F2FFB70629005005C7007D03D700820228010A011C01
      20001D011EFFF1003CFE2801C2FD9F00DBFD690026FDDAFF18FD16FFAFFC9EFE
      5BFC92FEAFFCFBFD66FDC6FD27FDA6FDEFFD38FD96FEF3FCFEFE13FDD7FF09FD
      C70020FDE5009DFD5C0152FE8701FAFED2008CFF2E004B0055FF99006EFE1B01
      07FEA201B4FD2A02C3FDF30121FE43028AFE2E0236FF050271FFD001EAFF6001
      2F00B800F400AC0025017000170254007102F7FFEE0275FF4403FEFE310322FF
      2503B7FEA703A7FE2A03CFFE1703EEFE200258FF6B00F5FFBEFE0900B1FD1D00
      9AFB6F009CFA5700F8F9770036F9660065F9460025FA370035FA1100ABFAA3FF
      91FB4EFF2BFCEFFEA0FDE7FEF4FEF5FE3A0024FF7C0126FFC5024DFFDB0328FF
      5E0579FF1D06A4FF3B07FDFFE207C0005C087601D80702023407F8028E055B03
      4B04B503D9023804A90120046D00E70376FF390481FEDA03B1FE4403ECFDEF02
      9DFDE90144FDDD009BFC4900A2FC87FF38FDCAFE40FD50FE6BFD97FD36FEF2FC
      27FE58FCDDFED0FBB8FFA5FBF0FF8FFB55007AFBDB0002FC4B0053FC1000C5FC
      4EFF7AFD64FEDBFD92FD27FE3CFDAFFE97FC10FF3DFD49FF78FD88FF30FEAAFF
      C8FED7FF32FFC0FF8BFF6AFF3B00AAFFBC007CFF6E017AFF3D020E00E302F6FF
      5D03A6FFA8031C0090034600F0031C00FD03C500CC031001A503370130022802
      C9009A0290FFFB02C3FD540312FC7C0344FB69030EFA7F03EDF93D0366FA3703
      98FA0003BBFA360282FBA401AEFBE500C1FC18001AFEE8FF15FF80FF95001BFF
      D001E8FEC102BBFE29045EFE410530FEE90500FE010721FE7307ABFE4707E2FE
      1107A8FFEE050700920450003E030101D90159018A00F00075FF4E01ABFE6801
      31FE3501F6FD22015DFDC50034FD9DFFA5FC5FFF52FCC9FE0EFD83FE06FD54FE
      7CFDE4FD28FE85FD78FE99FDC1FE1EFDBEFF07FD0F0049FD5F003CFD2001A5FD
      FD007AFEC500E4FE910083FF95FF6100FCFEAD0025FE490149FD840141FDF301
      AEFDFB01F0FD2602CFFE0F023CFF270222FF60010D0021018400D900EB005100
      930118005E024D00B0026BFF450361FF70032FFF860316FF5F03DFFE800311FF
      4A03CCFE970233FF2701AAFF3B00DDFF8CFE9300CCFC7800B1FB90005DFAD300
      73F9C500EDF994001EFAE7007EFA6E0004FB0C0067FBCBFFEBFB43FF45FDBFFE
      76FE11FFB2FFA2FE4B01EDFEF301E0FEAB033EFFCA041CFFB90576FF970677FF
      6A072E0041078B009507490139071F02C20596028A043F03490306049101FC03
      9D00010480FF3004F3FE080427FEF5032DFE78039FFD7D021FFD85018FFCEB00
      BBFCD3FFF3FC8BFFF4FC98FECCFDCCFDDAFD50FD22FEEBFC02FFF5FB90FFE8FB
      BFFF56FB410056FB550078FB4200E3FB420014FCE4FFE0FCF7FE48FD84FED8FD
      39FD5BFE22FD94FE35FD0AFF6CFD72FFF2FD92FFD1FEC5FFBAFED5FF7DFF97FF
      3300AFFF8700B6FF0F01ACFF0F02CDFF8102FEFF3503F9FF9E034B00C4033900
      CA03D000B703D100B00305011B0358014902FB01520132023900020389FE9003
      0DFD70038FFBC1035DFAD50324FA740348FA6E0345FA2503FCFA9102EBFA0502
      BFFB5C01A0FC8000BDFDF7FFB0FE6BFF4200E8FE1D01AAFE4C022DFEE7032CFE
      9904FEFD8805C8FD7C06B1FDAB0613FEE70626FEF506B6FE4D066CFF1305D7FF
      FC0356006302D70013013001FDFF43010FFF6601BAFEB2010FFE9D01F3FD0F01
      71FDB80013FD3100D3FC6DFF11FD29FF2DFDF0FE63FD41FECCFD12FE32FEF9FD
      EEFE9DFD78FF69FDCBFF6AFD560032FD32008EFD6C00C6FDB80032FE2C00E3FE
      9AFF73FF33FF04002FFEA2004BFD000170FD3C014AFDCC0184FDCE0152FEB101
      AFFE9C01E6FE770195FF1C012B00F100BD007F0037012200D801DDFF7602D3FF
      0C039BFF760353FFD30336FFB2035CFF3D0310FF360328FF7A023EFFC90168FF
      B200DCFF7DFF6E0002FEB4007DFCDA005CFB0E018FFA140131FA360146FA0501
      CAFAC10014FBA2004AFB4D007BFCCBFFF5FCB6FF22FE20FF94FFC5FE8A00CCFE
      8D01D7FE1403AFFE68042DFF16052CFF37062BFF64066FFFA5061F00D4065A00
      C60619010C06E001DF0476026703D90232028403DD00E003E1FFCA0302FFE703
      8EFE1004BAFDA203CDFDF70240FD6C0207FD8801CFFCBD0000FDF0FF30FD3BFF
      37FD62FED2FDCCFD57FE38FDC4FEDBFC4AFF07FCF0FFA4FBDEFF70FBE4FF8EFB
      66006DFB2D0001FCB3FF31FCB2FF90FC9FFE2EFDC0FDE0FD63FD1DFE7BFDCCFE
      42FD44FF04FE79FF4DFE8CFFD9FED3FF54FFDBFF4200DBFF9E0000002301D1FF
      6501C3FF4502EAFFE6023F0083034E00E6038A000004B900C503FF0082032501
      45037B0169029F01940130027A00720261FF0C03A9FD5D0350FCB50356FBC603
      82FA170450FAA303BAFA4A03AEFAE40212FB9002B2FBD3019EFC3F0119FD7700
      8CFE99FF4EFF0CFF6600C5FED40155FE3E0305FE4E04FFFD2705BCFDA3056DFD
      F50579FD5306C6FD7806FBFD0106A6FE5C0523FF0A0491FFF502F7FFDA01B300
      A9001801ADFF8601DCFE6001A8FE9D0100FE8C0107FE44018DFDD70074FD9100
      72FDBEFFB3FD3EFFB8FD1BFFC3FDBAFE98FE3AFEFAFE45FE7DFFD3FDF1FF79FD
      E3FF6AFDFDFF8DFD3E00B8FD6C00F5FD050068FEB4FFAEFE07FF22FF48FE9FFF
      BDFD690033FDB20016FD4F0146FDA30197FD890127FE6301C9FE930142FF5B01
      EFFF2C019400D300EA005100400109001202FFFFBA02D8FF3503E0FF890364FF
      9F035CFF480382FFF60275FFE20264FFF101B3FF2301ADFF1A00BEFFE6FE7B00
      45FDA20077FCE70085FB6601DEFA7E01FDFA290108FB23015CFBDB0013FCCB00
      AAFC83006EFD150030FE98FF2BFF2FFF2200D7FE690116FF9502F1FEC303DDFE
      D50425FF39052BFFE10524FF0E0699FF2706F1FF14066200A7051101A3046601
      6903E5014B027402290110030500A2034DFFC8037CFE5D0312FEAE038AFD5603
      C9FDC90230FD560237FD750142FD480039FDE4FF3BFD4EFFEFFD95FE78FEFCFD
      B0FE62FD64FF8EFC8BFF37FC95FF99FB1500ACFB1600C0FBF9FF8DFBC5FFDAFB
      4FFF13FCF8FE2EFC6CFEDAFCCAFDD5FD6FFDFCFDABFDD3FEB6FD49FF2FFE63FF
      BCFE9FFF37FF1400EEFF1700CB0038000F0116007D014800BC014D00BE028400
      4A03C700C4031301AE038A00C10328014A037E0148037B01B902E001B4012402
      C800F701ABFF5C0280FEEA0244FD120314FC830318FB9E03BEFA8203B0FA5303
      ABFAE90251FB9002A9FB850250FC8A016FFDFD00DAFD4C00FBFE77FF0700F6FE
      2D010DFF440223FEA503EFFD3904D5FDCE0499FD86056DFDB705BCFDC205A8FD
      DC0512FE070553FE5C04C0FE1E031CFF60029FFF24014D003C00FC005BFF0701
      DFFE3E0161FEB80146FE810154FE8101E9FD2601FCFD5C00FAFDF0FFF9FDCFFF
      3FFE68FFA0FE5AFFF6FEC0FE60FF60FEB5FF13FECEFFDFFD1C0084FD2F0015FE
      F7FFE0FD1100E5FD68FF44FE10FF58FE96FE8EFEE3FD63FF2DFDDCFF09FD3500
      D2FCC90022FD2F0191FD50010AFE7301A4FE3C018FFF2901DDFFDA008000A000
      EC00B90074016B0038023500DC0227000C03080017038BFF4903D0FF4903D6FF
      0D03D7FF5F02D8FFB101C5FFC600C1FFB7FFDDFFE0FE1D008BFDBB0056FCDD00
      E1FBF4007EFB44016AFB3101AEFB0A0138FC4701A6FC0A01ABFD560057FE2900
      E1FED4FF000061FFEE0083FF0A0261FF2003F4FEC103FEFE9B0434FF2D056FFF
      AA0578FFBA05B5FFB405D2FF1B052E00A3049900DD03350180027C018101BE01
      4100730230FFCD0282FEFD02EEFD290383FD5B0350FD080352FD9D0238FDF201
      48FD110133FD550084FDD7FFD0FD88FF26FED1FECEFED0FDF2FE76FD45FFBCFC
      DBFF54FC0D0026FC380024FC4C00A2FB0400AAFB8FFFE8FBA3FFDAFBFCFE4BFC
      19FEC4FCE9FD40FD53FDC3FD81FD97FEFCFD61FF63FECDFFD1FEF4FF95FF0200
      4E000F00D7003C005A019100C301F4005402D100FD02FB0051030E01C1036A01
      7C0350018F03B5019503EE01020307023D02FC018F012E026000190255FF2902
      51FE8D02CFFCF202B3FBBA0204FBF4028FFA1503B1FAD402C5FAC50254FB8502
      15FCD301B1FCF00078FD93007FFE13006EFF87FF570024FFEC01B2FE690210FE
      5703E5FD730408FEE90421FE54059AFDB005B8FD9905A9FD46050AFEE60460FE
      0304FCFED8021BFFD7015EFF9300F9FFE7FF980014FF040183FE530184FEBC01
      59FEB80160FE3C016CFE1B0147FE960054FE2A00B8FEFDFFDFFE030033FF6DFF
      7AFFD3FE7BFFD9FEF6FF66FE4C0054FE16001BFE5B001DFE1600CAFDB6FFDEFD
      79FF2CFEDAFE42FEE9FD50FE3BFD9CFEBAFC0CFF38FC92FF6DFC2F0087FC0601
      05FDFE00E9FD0A016AFEB20048FFB200E8FFAF002D00CC002701D500EB018E00
      62025800C4024B0055038C002B03660082036100A5037300F80227008E021500
      FA01450033011D000D001500D6FE4900ADFDA800ADFC8F00EDFB0C01D8FB3801
      C2FB5601A8FB4901B9FC360183FDD600CAFD4800CBFE1F0086FF1A005E00B4FF
      820182FFD30268FF040347FFE10331FF9104D2FF0905DFFF740579FF460592FF
      2805B9FFD6042C000E04840045030001FD0104017C000E016DFF8701C5FE4A02
      BAFD950239FD9F0251FDD502F6FC7E025BFDCA017AFDB2015CFDE2007FFD3300
      06FEBEFF71FE76FFE3FEA9FE28FF3DFE66FFD4FDA5FF43FD0300E0FC420072FC
      930046FC2D0004FC5200DCFBF7FF26FC38FF26FCD7FE1FFC15FE78FC59FD06FD
      31FDADFD3BFDA0FE5CFD8CFF1BFE9FFFF1FEFDFF61FFE9FF63003C00D200B000
      4101FC003A021B01A702300125033A018503AF01C1031B027D0325029E031F02
      5B034D02EF02010276025A028C01620293001C0252FF0602E2FD1302D5FC2D02
      B0FB4F02BAFA700269FA790290FA7E02C1FA2302C2FBE00173FC8101F6FC9600
      BAFD3A00B7FE2300D7FF3FFFDD00EEFEE501B2FECB027AFE800351FE2904C1FE
      F7044DFE4D05E3FD3705C4FD9205EEFD460574FE4D048DFEB803C4FE900227FF
      3C0109FF7300C3FFA8FF9B008BFEF70054FE080195FEA4016CFE6C01A4FE3901
      99FE41015CFEBA00C6FE650026FF2E0099FFFDFFAFFFD1FFC3FF83FFF1FF35FF
      2800F5FE310063FE230004FE36001CFEC2FFD2FDB2FFB5FD37FF25FE32FEA4FD
      98FDC9FDD5FC1DFE55FC6EFED6FBE8FEB5FBD9FFF4FB3200B7FC6E008BFDA700
      37FE6B0005FFA9004EFFF2004D00CF0084012601F201D500A602D20004032801
      2C034F015A03F000AC0305013803B30016038000D502D200F701B20075015B00
      6D002A00F3FE230014FE72001CFDA60015FCAD00CAFB0C01E5FBF30033FCEF00
      2BFD3201E8FDF5006FFE300020FF6100F0FF0F002E01C9FF0D02CAFFB5029CFF
      5A039EFFD703EEFF1F04D1FFEE04E3FFFB048CFFC60445FFC80493FF48043D00
      4D03D7FFB2025B0031018C00D9FF5B00DBFE0301C5FDBC0100FDB30107FDFD01
      DBFC3F02FEFC080255FDCC0138FD78016DFDDF00F7FD35001BFED8FFD9FEA5FF
      40FF62FF3FFFB0FECDFF84FE0900B2FD2900F3FC6600DCFCBB00A9FC4200F3FB
      450034FCBBFF19FC26FFDAFB9EFE2AFCE8FD7CFC73FDBFFC07FD9DFDDDFC45FE
      B1FD3EFF41FEA7FFD7FEC6FF79FF16003100C3007600BF00BE014B017102D101
      B10286017C03FE019B039D02B7037102D403690276038402FC023902C4023D02
      25024C024C0130029900C20137FF9A01FBFDA60124FDDF01AEFBB101F2FADA01
      8CFAD3019DFAA9012BFBD201F9FBC1015BFC1D0121FDBE000BFE420026FFDDFF
      5700B9FF51014CFF0B02C7FED10229FF6603C0FE21049FFE7E049BFE870407FE
      E704BCFDFE0429FE88044FFE41042DFE6803B1FE0002CCFE2D01FEFE160096FF
      E4FEFDFF88FE87004DFEF80047FE5601AAFE9D01BDFE7001ABFE200115FFF600
      60FF8F0085FF430013004E00D3FF2300D6FFDFFF23009CFF30000AFF2F0078FE
      1A0030FE1C00EBFDC2FFA2FD8AFF5EFDFAFE35FD1CFE80FD45FD7BFD63FC7EFD
      F5FB3AFE67FB65FE89FB09FF1BFC1B009DFC670086FD35001CFEB700C2FEE500
      97FFDF00820055013301890106025B019B02AD01BA02CD016503D70193039A01
      600369016A031D012B0304019502B1002B02C8007B014E004900260046FF4900
      4EFE620023FD6E00B1FC9E0079FCB20098FCB100FCFC18019CFD090111FED700
      C5FE6900B2FF27008A001700550120004A02CEFFE202E7FF6303C9FFD703C1FF
      2404F5FF1804CEFF45041DFF3D043DFFDA0327FF840379FFCE02A5FFE101EDFF
      B900CAFF8AFF3A0032FE72005FFDE400EAFC4E019AFCA001C9FCD301F4FCFD01
      F5FCAF016FFD6101E9FDFE0061FE6C008CFE2D0041FFF3FF2EFFB3FFB2FF70FF
      1800E7FE4C0021FE5900ABFD99001BFDB000CBFC94003BFC960019FC1000E3FB
      39FF47FCE3FE1EFCF5FD65FC78FDB6FC33FD38FD3BFD35FEA4FD3DFF65FE7DFF
      19FFDCFF6DFF33005500B900DD001601A901A8013402C901A9022002C5027502
      2003D4024103EC025603BE02F502A602BE02800238024202D30108021801DC01
      3E005901DCFE530102FE5201BDFC4C01C8FB3C0157FB610125FB46011CFB5D01
      F1FB580177FC4F01EAFCDD00F0FD7A00E8FE30009FFF1200D000C3FFA9018DFF
      14026DFF2D0353FF900341FF23046FFF7104E9FE9F0459FE89041BFE9F042CFE
      1F043EFE950369FECB029EFEA801AEFE930002FFD2FF81FFB8FED6FF98FE4100
      2AFEBF0063FE290162FE4D018BFE6401B8FE21012AFFD10053FFBD00A0FF9300
      F9FF7600BDFF6100240049005600CEFF160066FF6500C4FE340043FEDDFFD5FD
      E8FF65FD9EFF3FFDC4FE06FD3EFE14FDB1FD2DFD60FC42FD4FFC9BFDD6FBFCFD
      D1FBD4FE66FC82FFFDFC01007AFD20005EFE8A00F5FED400E6FF2101BD008F01
      5201B201C801C601600250026F025E020203750216035E02E302FB01D9028A01
      AA0279013002FA00FD019000FD0078001A001F005CFF09002DFE440059FD3E00
      20FD3F00A9FC680006FD6A00CEFD8C00F3FDB100C3FE8D008AFF430048002400
      270113000E022F002902FAFFFA020B0076030F00A203100031042F002C041200
      C7034EFF0B042EFF7D032AFF090324FF470253FF65019EFFFDFF67FF2FFFF8FF
      F3FD440046FD6400DBFCEB008FFC1801D1FC4A01E1FCB301EBFC9301A5FD1801
      DFFD040138FE8B00EEFE35000EFF5C0017FF0900D4FFAAFF010075FF0C00A3FE
      BF00FCFD57008EFD7200FEFC93006DFC6D0047FCF0FFF1FBB2FF1FFCD0FE3CFC
      4AFE77FCE6FDD4FCADFD21FDD7FDFDFD56FE09FF63FE5DFF6DFFE0FFD5FF7000
      7B00BD006E01430100020E022C02F301AE027202CA021603DA021303F5027203
      CE024F037302A90236029E029A0164025101C601A5007E0179FF1101F0FE9700
      C7FDFA008EFCE50000FCB800AAFBBF0031FB890006FC7A003DFCF00094FCB900
      87FD6B006DFE540058FFF0FF9700FDFF1C01FCFFA101C3FF7502ABFF3403B8FF
      88039FFF2804D4FFE5034BFF2A04C8FE410496FE150471FECA0352FE1203B7FE
      280275FE5501DBFE4C0067FF60FF98FFC2FEC5FF5BFE610030FE3A0063FE0401
      35FE5C015AFE1C01FBFEF9001BFFEC009EFF7700D0FFB0009EFFAD00D2FF4800
      49005A003200E9FF68003FFF4E00CAFEDEFF3EFEE6FF7BFDE4FF59FD57FFB7FC
      15FFA7FC35FEADFC88FDEEFC0DFD0FFDACFC8AFD4FFC79FDA5FC88FEBBFC19FF
      19FDCAFFE3FD2B006CFEAA0011FFBE0031009401C700D80155012702A4019A02
      1E02E302610205038E025203A402C0026902610202023702D101A401E0014F01
      2F01D0008F002C000200FDFFE9FE550024FEEEFFEFFD3F0062FDF7FF51FDE2FF
      ADFDFBFFF1FD800053FE18004FFF3B00F6FFE6FF0901FCFFB401F3FF4D021E00
      AE02F7FF35032F007703EBFFED034300D8032900A703DEFF9B0380FF790358FF
      FF02EDFEC102E3FED20111FFBF0018FFB3FF9AFFBCFEDEFFE6FD25003FFD4800
      F4FC9300A3FCBB0083FC5601B7FC44012DFD5D0194FD1D0112FEEF006EFE8F00
      A6FEC000D8FE53008FFF6B009BFF23000000ABFF2700D3FE420071FE3100B9FD
      890042FD48009DFC350027FCF7FFE5FB79FF25FCE4FE64FC9EFEB0FC37FEC7FC
      51FE21FD7CFE04FEB7FEC9FEE1FE7DFF8BFFD8FF26004C00E300C0009B017C01
      EB01F50136025E025802AE02DD024C03DD028503AF02B20346022403DA01F802
      720196022D015C02BC00D3010F0035010CFF8D0078FE84008FFDB200F4FCA800
      36FC670009FC6000DBFB120029FC4D0097FC810032FD6700D4FD0300F9FE0300
      19000500C500060060010A0011020400A0020C003603F8FFC0031E00B803FBFF
      93039FFFD8032CFF0E0418FFC103AFFE680353FEA50287FEC001B5FEEA0002FF
      610091FF81FFB2FFDBFED7FF7DFE12006CFE910046FECC0091FE2601BEFEF600
      20FF02014BFFCF009FFF9C00CBFFB200D2FF8C000B005B0038007D001600E3FF
      F7FF1FFFD8FFA0FEBEFF1EFE92FF57FD92FF03FD22FF7BFC9DFE1FFC12FE77FC
      84FDB1FC36FD08FDE0FC37FDE3FC72FDD7FC3AFE1CFD1DFF7FFD94FF56FE4200
      F7FE9C009FFFF4004F009601C5004A024E017D02CF0121031A028E034E02A503
      2502BD031D025203D901E302D901B8026A01FB015101A501C500F4000C005100
      97FF2E00F5FE560072FEF7FF27FE0300E6FD2000DBFD9BFF18FED9FF92FE0900
      3DFFE6FF05000100A100EAFF7701B2FF2602E9FF8602DCFF3C0305009F034900
      9903F2FFA703DEFFB60310004003A0FF520365FF160347FF8E02B0FEC70160FE
      2201E5FE3500E9FE67FF5BFF8BFEAAFFF2FDD3FF35FD4700C9FC7500B9FCCF00
      D1FC2901DAFC30015BFD5101CDFD9201F5FD1C0172FEBE00FBFEFA0037FFA800
      B2FFB800C5FFE100BBFFDCFFE4FF2EFFE8FFBAFE370008FE420080FD0D00D5FC
      CBFF0DFCD8FFFBFB55FF47FC2BFF58FC0DFFE2FC8BFEDBFC8BFEF4FCE9FE15FE
      FFFEBCFE8AFF12FF1F00DEFFA80026002001B600BE019301E70103026A026102
      8A020703A3027C039102B9031302C903BB0120037901DA021D018E02AC000802
      2600C7015CFFF800AEFE5B0037FE79008EFD55002DFD500092FC5C001DFC2100
      71FCD3FFA3FC3D0034FD04000EFE220097FE48002CFFFDFF6C00220016016B00
      AD0121007D027400D7029700080324007E03350075031C00870393FF86036CFF
      72032EFF2B039CFEB002A7FEE60194FE9501AEFEE80025FF280068FFAAFF86FF
      01FF190078FEEFFFB1FE6A00C6FED000D0FEF100E3FEFB0028FF1A0153FFBB00
      B6FFA200FDFF99002B0080000A008700C3FF6100F4FFD2FFAEFF62FF7CFF79FE
      9EFFDBFD53FF8EFDD3FE8CFCD5FE33FC78FE2CFCF7FDF6FBC8FD3FFC89FD08FD
      01FDEDFC31FD60FD2DFD3EFEACFDC9FE1DFE75FFB4FE61002DFF8700D7FF4A01
      2F00B90100015A027A010103C6019A03E401DB03FE014604A0011604C601B503
      A70177037401C8020A012302B500C6015600FC00EFFF8A009FFF5E003BFF0300
      CCFE22003AFE08004FFE090052FEBEFFA3FEA1FF2DFF6EFFD1FFD2FF2100A4FF
      030199FF8E01AEFF5B028DFFB602AFFF3B035100310300007403E1FF2B03BFFF
      540376FF1C034EFFCF023BFF530281FE0D024EFE210159FEAC0043FE1C00C4FE
      60FF2FFF6DFE2FFFEAFDA1FF5AFD270001FD2F0013FDAA0033FDE60046FD4801
      39FD7801DFFDAE0124FEA5019EFE8201F8FE230167FF730141FF4F018FFFF800
      9CFF8D00D1FFDEFFBCFFCFFEFCFF79FEC8FFEEFDE8FFFBFC84FF97FCD2FF3FFC
      7EFF26FC62FF8FFC1FFF98FC24FFBDFCE5FEF9FC5AFF81FDD0FF78FE080041FF
      52008CFFE50005002F01D800A301F7002A02DE015602730258029D0233022C03
      3302B503BB0176037B0136030C01D902C7005502F1FFDC01BEFF790111FFC600
      A1FE570018FEF7FFD9FD220010FD3000E4FCF0FFADFC2C00F8FC26003DFDE6FF
      C9FD420024FE5700F1FE080073FF250083005F0048014E00BA01AE002102DE00
      B302B300CF02C8000F036A004A033F0012030500F70247FFD202F6FE9B02BDFE
      21024FFECD0164FE3801C7FED900F0FE140045FFB3FFCBFF4CFF8AFF24FFF7FF
      F2FE380043FF6200FCFEC0001CFFC1004CFF9A00C0FFD500DBFFD4001E00B900
      F0FFC60000008F00C8FF3B00DCFF0F00B3FF18FF73FF74FE02FF9AFD13FF1BFD
      CEFEC0FC85FE7AFC69FE17FC02FE57FCA6FD97FC99FDA3FC81FD49FD7CFD2CFD
      D0FDA6FD07FECBFE66FE8CFFBCFE13004AFFDE00BBFF4A016C00D001C700C402
      63016A035901980381010F049301EF03A20146043601CB0355017103E900EF02
      A000680275008C0158007F01D1FFCC00A0FF2B003CFF1C00F8FEF4FFC9FE92FF
      F6FEE3FF16FFC7FF5EFF84FF93FFA5FF2400B1FFB300B6FF1E0179FFF7016EFF
      560281FF9502A7FFDF02A3FF370302000C039BFF26035BFFE40257FF9B0279FF
      1A0288FEE401A0FE5601E9FDFF00EDFD2B001EFECFFF9EFE06FFD7FE82FE3CFF
      08FE87FFE4FD1C0065FDA00070FDEC0074FD230165FD8401AFFD3E011EFEAE01
      5EFEC301D6FE8D0114FF94012BFF9A0170FF950196FF54019FFF2501B2FFEAFF
      A5FF63FF5AFF3FFEBBFFF5FD9FFF39FDB2FFD4FC86FF65FC6DFFBCFC32FFB6FC
      65FFE1FC58FFF4FC91FFF8FCADFF44FDF1FF81FE1600DEFE930078FFD8009FFF
      5D017A009C0105010802C40123024602190289020A02AA02F8010D0381017B03
      0A01C002C30050021F000C02DEFF8B0188FFFE000DFF170189FE5B0030FE0000
      9BFD0B008AFD3C0060FDD2FF64FD270096FD2900F6FD7400F2FD6B00ABFEBF00
      3CFF9300D8FFA5009F00740044010A017A01CD002502BD008802CC00C702CB00
      C4026700C5025B007E0228005C024EFF5C02F6FE1802A8FEBF0178FE37015EFE
      F60077FE7300B7FE4100DDFEF5FF1AFF9AFFAEFF6DFFD7FF6EFF2C003BFF6B00
      5DFFCC0075FF4F009CFFCC00CEFF8E0046008B00FAFF70002D0089001D003300
      0D004D00DAFF0800ABFF62FF1AFFA1FEC4FEC0FDD5FE35FD9AFE0DFD72FE74FC
      26FE6DFCB4FD8CFCC0FDA1FCDAFDEEFCDCFD8AFDDCFDB6FDFDFD20FE34FE6DFF
      64FEDEFF06FF740049FFD200C4FF90012F000A02DF00BA02FB0044035001B103
      620198035F012F043F014F041701B903A100EC029900BE027A00B50142005401
      1B002801F0FF800062FFEDFF74FFEEFF8EFFC8FF61FFB7FF91FF9EFFD1FFA8FF
      E7FFB9FF260087FFB2008DFFFD00D0FF8601AAFF10024FFF6B020300940299FF
      0B038EFFFC02D4FF0A03DDFF9B0247FF6F027AFFBB0125FF870197FE360144FE
      B7004EFE290018FEC8FF5EFE1CFF68FED0FE05FF81FEFFFE22FE8BFFC3FD3900
      CEFD880085FDC300B6FD6201E9FD8F01D8FD850151FE1602ACFEE201EAFEA101
      35FF93019EFF6D016DFF4C01DDFF6301DAFFBE008BFF56006FFF57FF84FF7EFE
      5AFFF9FDA0FFD0FD92FFA6FC82FFE2FC2EFFAFFCAFFFA7FCAFFFDBFCDCFF69FD
      CBFF27FD2900DFFD3800A4FE7F003EFFF00084FFFC00F5FF1C016B00AD011401
      D4014B01E601CD0104023402B70135028101FF023A01180398009602EAFFD501
      DDFFC80120FFFE0007FFEA00B0FE7F0028FE2D00CEFDCCFF04FEF1FF98FD0200
      C6FD8D00EFFDE6FF04FE830049FE9700EDFE9200E7FE77009BFF3A011E009A00
      E400A00051013C01F301D8005202AB0089021401A302DC009B02740069024D00
      F301E2FF000252FFE101D2FE7A01CCFE48017CFEFF0087FE84005AFE940026FF
      1F00C9FE080076FFBEFFB3FFB4FFE3FF80FFC7FFEDFF940072FF550095FFA000
      E6FF9F00F4FF9E000C0034008C0043001400ECFF07002D002400DDFFD2FF91FF
      2BFF3AFF16FF4DFE8FFE91FD4BFE8AFD56FE43FD26FE7EFCE9FDE0FCA6FDBEFC
      E3FDF7FCEAFD78FDF3FD21FE02FEF8FD67FED6FE7FFE6AFFF0FE5C003FFF9B00
      84FF6201B3FF870185005402A7005B0242011803230124034E0163034301BF03
      1401D803A9003E038D00BE0227003002EAFFB90101003601BDFFB9005FFF2900
      AFFFD6FF77FFA5FF69FFC5FFD0FF2800FDFF75FF2000D6FF8700ADFFE000B2FF
      B9008CFF62012C00BA0188FF54027FFF8502ADFFF202AFFFF8027EFF0B03EEFF
      CF0292FF92027CFFDF011BFF80011CFFF0007CFEB90052FE100011FEBAFF41FE
      18FF60FEEFFE8BFE91FE34FF30FE5BFF23FEFCFFEDFD6E00D4FDB30008FEAE00
      16FE4B01DAFD840128FED8017CFEDE01D0FEE30139FF6D01B2FF7A0177FF2D01
      D7FF7A01FBFFCE00020079008BFFE8FF86FF43FF22FF5AFE38FF52FE43FFA5FD
      6FFFF5FC39FFEAFC5DFF04FD7FFFDFFCE0FF58FDDBFFA2FD2800B0FD58002AFE
      B400B7FEC70068FF0501B0FF44014D0036018A00AD012401F00127010402C901
      AA01F001CC012B0259016B02D700A0026600F801E4FFCE0102FF5101D2FE1701
      7DFE850030FE5100A9FDAFFFEFFDBDFF84FDA8FF99FD2300E9FD6A005DFE4400
      59FE8500CBFEA20029FFAE0043FFE700D2FF4B019E00EB001501DB009701F100
      1702FF007702E500AF020E01A60297009C0281004302F5FF0302FCFF900139FF
      AC0103FF040179FED200A4FEA8004EFE7A009BFE0900EDFE2F0028FF04007BFF
      F4FF0000FBFFE6FF21000000BAFF5F00CBFFBF00CEFFC9000900C10011009800
      470038005E0024001D000B0026001A001C0069FFBBFF58FF22FFEFFED1FE6EFE
      3AFEB6FD03FECAFDEFFD0BFDCAFDDBFC90FDA9FCAEFD0FFD92FD02FD13FEDCFD
      18FE38FE5BFEB4FEABFEF2FE26FFDDFF17FF9300A2FF1201EDFF95010900FE01
      9400340215017F020A0111034F011F036C0120035D014E0310014A03CA00C502
      50008902E2FFEC01BDFF8C018CFFA80086FF810027FFB2FF6CFF83FF63FF4DFF
      87FFE4FFDEFFACFF5C00E1FF6D00CEFFBF00D0FFE800BCFF2101350068011100
      F001F2FF4002B0FFA702B8FF9102C6FFF102DFFFEC02ABFF880276FF390239FF
      D5010EFF0E013CFF8A00A0FE6F0076FE9FFF10FE35FF41FEFCFE24FE96FECAFE
      43FEEEFE69FE93FF46FE080051FEB9003CFECD006DFE2E014EFE5E016BFE0B02
      85FEF101F7FE11020FFFD3016DFF9901BBFF5301C5FF7D01D7FF0C011C009300
      F4FF3D009FFFBBFF5AFF31FF12FF92FEFBFE1AFEF9FE6DFD1DFF29FD15FF8AFC
      16FFFFFC3BFFFBFCF2FF76FDF8FFBDFD63005AFEAD0027FEE10036FFEA00B4FF
      73011B00630155006A01D400A501F400D5017A01AC01BA01DA0102028D01CB01
      4B01EE01C100FE013B00E2019BFF5601E8FE270181FEE2001BFE0500F5FD1A00
      83FD95FFACFD67FF87FD72FFC7FD49001FFE2800ABFEA800CBFE91001EFFE800
      58FFFA00CBFF5B011D003C01CE006A012D01D400AD014401DC01400194020701
      96029300A202A8007902F7FF30020300BF011E008A014AFF4F01DAFECF008DFE
      95006DFE5C002DFE35009FFE1E00A3FE3E0044FF2F0074FF670042002E003600
      4E006E000C00830026004701F0FFA3004B00CF0015009A00400065002F00FFFF
      42004E00F4FF90FF010050FF97FF05FF14FFDEFE6FFE55FE24FED4FDABFD57FD
      8FFD1BFD75FDC9FC63FD89FC4CFD3BFD89FD24FD16FEE9FD50FE8FFEB8FE44FF
      E8FE3FFF4FFF80007AFFD100FBFF590122009601690011027A0016020A01D602
      0F01C902760122034901A2027601BC02ED009502BD0096023800D801E9FFA001
      75FF05016FFF4C004EFF230023FF9FFF2BFF4EFF6CFF34FF9FFFAFFF1200BDFF
      89002300B900FBFFDF004D001D0110006B0156008C013B00FB016400FD01B8FF
      620245005502F0FFCD02DDFF980267FF880272FFF201D8FEA80133FFEE0015FF
      8500BDFEF7FF4CFE92FF27FEDDFE0DFEC2FE54FE56FEA0FE65FEF3FE6BFEB9FF
      A0FE1700A8FEF80093FE5301B7FEB101ABFE9801DDFE4402D9FEFE0126FF0502
      10FFC7016DFFCE01ABFF1401F4FF0A01DDFF9A0022005100D2FF83FFBFFF93FF
      3AFFCCFE1BFF3DFEB4FEAEFDE2FE7AFDABFED5FCF4FEA3FCD8FEFDFC41FF11FD
      BEFF9DFD450014FE6E00C2FEBB000EFFEE00BFFF1F012A006A018F007B017200
      6A01F00055013D018D01AE017B016901D001E901620167013F01770193007101
      38009D0173FFC50011FFA60059FE8A001DFEEEFFB0FD94FFB1FD95FF70FD4FFF
      BFFD47FFDFFD420077FE9900ABFEBC002EFF220174FF9201A7FF2D011400A001
      75008E01BB00810104011B019E018701C20110016302E5008E025600A4024200
      4F02C6FF4102B7FFB10174FF93013CFF020172FED80054FE38003AFE330023FE
      CEFF40FE4200BCFE1F0069FF6700ADFF61008A005600C7004700FE007100CF00
      5C0079011C0007010900E200FEFFD2000D00CC001800DBFF2D001600EAFF89FF
      D1FF1DFF79FF9EFE53FFC7FE6CFED5FD17FEBDFD9EFD5BFD72FDFCFC12FDD1FC
      5FFDC2FC02FDEDFC88FD68FDF3FD3FFE93FEBDFEB7FEA6FF30FF220058FFBF00
      F0FF4F012E00C5014E00A10163002A0285001F02C600BF023C0168029201CE02
      6301290279013F022701D901ED00F0017C0023012300F70085FF8C0066FF0A00
      13FF87FF3BFF6DFFFCFEE2FE65FF15FF8FFFABFF230003004F005B00DE009E00
      F000AB00300196006301E300830178007701B500C3013100EA0148002E021100
      6F022700590234FF470267FFEC01DFFE7501D0FE0401A9FE9C00F2FEBEFF04FE
      7CFF0BFEE6FEF0FD89FE26FE4FFE40FEA4FE1BFF6CFEC4FFC4FE5500D5FE1E01
      E7FECC01EDFEF80132FF030234FF7C022BFF47020FFF210250FFE8017FFFCD01
      B4FFF700FAFFFD00FFFF4D00F7FF1400090039FFFDFF0FFF73FF64FE30FF37FE
      D4FE76FDB0FE52FD95FEC3FCB5FE71FCB1FEADFC37FF6CFD7BFF9AFD1A0079FE
      7A0030FFA0009DFFF8001A006E01F1005101F3005901BD005901420131013701
      4B019A01920190018101D7014B012B0136014401B4000A015B00F800ABFF6200
      2FFF65008CFE090019FEC0FFB6FD53FFABFD48FF6AFDFDFEBEFD61FF05FE0B00
      58FEC100BCFEF8005FFF5C019DFFB301FEFFDC013300C6016200C1019900B101
      FA00100169015301D00141012002DE003F020800B0021D00600272FF3D022EFF
      F5013BFF87010CFFEA0034FED3002AFE4300F8FDFDFFD0FDDEFF06FE1C00D5FE
      16002EFF6100F4FF5400A100730013016000580185007D018000AE0129007401
      E1FF5301FFFFF500F5FFF200EFFF550012002C00BDFF9FFF9FFF3DFF8BFF95FE
      66FF7FFE9BFE0BFE32FEBDFD97FD5EFD6FFD31FD23FDB7FC42FDB4FC24FD15FD
      74FDA1FDD0FD27FE98FE1DFFD9FED0FF36FF4900A5FF31012100BF012900D201
      8E00BA01860005029400BB01E2004F0240014C0274012B026801C0019701BA01
      49012C011C0131019900C4005B005800B6FF050063FFBBFF34FF26FF17FFFCFE
      DFFEE4FE4EFF01FF73FFA8FFC7FF3A002900A000DA00F400DD004C0130016101
      3B015C015201FA005F0108019A017F00C801BF00DA0187000D0262001A028AFF
      410286FFE50108FF9601E3FE0C01CAFE8F0094FEEBFF2EFE8CFFFFFDE9FEA8FD
      9DFEFAFD5AFE40FE99FECCFE98FEA5FFE7FE6B00EEFEDD0023FFA10131FF5502
      6CFF05026EFF7C0250FF30024FFFED016DFF9A018BFFD401B3FFFA00FAFFB200
      E7FF26001600B6FF1E000EFF1100D5FE7BFF40FE3CFFEDFDC4FE4BFDA4FE5AFD
      75FED4FC89FE97FC80FEEAFCD3FE79FD39FFD4FDE6FFBBFE34007DFF7F00DEFF
      CD00CD0036014F0132016F014D0139015A014C01180130014001CC015E016E01
      81019A01330122016101D900DD00A1008300F200DFFF10007EFF0200C5FED1FF
      50FE5FFFEDFD14FFB8FD41FF78FDC9FED7FD25FF09FEDEFF6FFE7A00BAFEF700
      64FF9101A6FFD801F2FF1202470002026000B101BD00AC01DB00110167015E01
      86012301F601BC00230226009B0209005C0250FF40024EFFE60112FF9D01A4FE
      FE0047FEE50024FE32008CFDF0FF06FEB8FFF4FDFDFF96FEE0FF47FF4700F8FF
      4400740042006E0155009A017000A2016F0000021B00670112004501D3FF5A01
      CCFFF000B3FF6A00F9FF4300AAFF94FFBCFF40FF84FFE4FE8AFF80FEB7FEE9FD
      8CFEC0FDE2FD46FDA4FD55FD28FDDDFC51FDE9FC20FD44FD74FDB8FDCEFD4FFE
      9BFE64FFDBFEB5FF48FF9700BDFF61012700C6014A00DE019C00F801C600B101
      8A00CD01F60021022A01D4018101E00178017001E6010B01620110015501B000
      D3000D00A5000900EFFF7FFFADFF31FF22FF44FF00FFE5FEB5FE6DFE46FF1FFF
      45FF62FFB3FFFEFFD2FFAC006B00270180005701CF00B3011401A101F2006101
      230139013B01F0008D0103017F01AB00D3015600DF01160017029FFFD0014FFF
      BC0141FF1D01C6FED40079FE29006EFEFFFF06FE0FFFC6FDE5FE05FE82FEF5FD
      BDFEA5FEA6FE6EFF1BFF0300F4FED10010FF90013FFFD40185FF2C0295FF3902
      83FFBD017FFFD60169FF8E0180FF2401AEFFE000FAFF6800E3FFE4FF0400D1FF
      F7FF41FF2C00B7FEA5FF3AFEA3FFCDFDF9FE5CFDD3FE55FD63FE06FD86FEDEFC
      60FE19FDADFE97FDEBFE48FE91FF02FFD9FFC1FF3F0071007E00E100F1006401
      F600B9012E0158012E017E01F500810109018201300158016501A50137010601
      6E01DD00F100D100C30056005500CCFF0800B0FF47FF47FFBFFE25FF31FE09FF
      EFFDF0FEB6FDBFFE1CFE06FF20FE90FF85FE5800A9FEDA004BFF420190FFC601
      EAFFCA013800EC014A00E1019100CF01D100370143015C017401FF00C101C500
      0F0244005E0234005902A2FF570246FF0D02F6FEC101E3FE380146FE0A014DFE
      450012FEEAFFDBFDD0FFE3FDECFFA4FED1FF18FF1000B9FF0500B200D9FF2D01
      1D007B014200D4012F000C02F1FF9801E0FFA701BBFF5401BAFFFD00C6FF4300
      C9FF3F009FFFC2FFA8FF95FF7FFF01FF95FFCFFE15FFFBFDD4FEC8FD55FE77FD
      F3FD5CFD91FDE1FC71FDE7FC78FD1AFD7FFD97FDEBFD3DFE53FE3BFFB7FEE8FF
      15FF7C00A1FF31010700A8013D00CD018200C301B700030292007D010001A801
      260181015C01A50157013101BD014F016301D700750186004F01EAFFE500CDFF
      66004AFFE9FF36FF6BFFFFFE0AFFF4FEF1FE97FE02FF05FF30FF8BFF63FF2B00
      99FFC10005003801660088017D00A601F200F301BD00C301EF00B701FD002301
      62013B014F01BF00A101AA00AD014400D9012C00D90176FFF10160FF8E01E5FE
      1701AAFE840052FE2E0062FE67FFDFFD0FFFE5FDF3FEF0FDB7FE66FEC2FE19FF
      08FFDDFF14FF9300EBFE1D0165FF850160FFC60179FF1B0276FFD10176FFDF01
      54FF6901A2FF2101A3FF8300F4FF8400D5FFD4FFFBFFD3FFFDFF25FF3700D1FE
      CEFF3DFEC9FFFEFD43FF86FDC4FE7DFDA8FE26FD8BFE12FD64FE32FD80FE97FD
      CAFE47FEFEFE27FF76FFC3FFEBFF7A003D000C016F005101A300F801D600DA01
      FF00D901E0007E0140019F011601180133017C014A011B016001EB00F600B100
      05016C00BE00D7FF42009CFFF2FF47FF48FF1BFFADFEECFE68FEC9FE27FE98FE
      30FEDDFE4EFE5CFF60FE3000A8FEC7003BFF060184FFA701E3FFC60142000902
      2D00FD01A300EA01F40033012A0155015701F7008E01C400BC01780011023700
      5902D5FF4F027EFF3402FBFEC901D0FE790179FE1C012EFE670035FEF4FFFFFD
      CBFFD5FD73FF62FE94FF2FFFACFF86FF9CFFA300B7FF1101EBFF5101F0FFA301
      02001802DCFFD7019DFFBF01C9FF6D01AAFF2401A4FF9B00CCFF6100A3FF1E00
      90FFB6FFF3FF1DFFB0FFD0FE76FF73FE1FFFA2FDBCFEB1FD2AFE5AFD19FE1FFD
      A0FD01FD9EFD52FD8CFD48FDDAFD33FE49FEEEFEA0FEABFFFCFE3B008CFFD600
      C3FF3D01EBFFDA017500B9018300FC01A000AA010E01590137016A012C017C01
      8B0111017601E500A1010E0168012A0066011E00F1009FFFB60067FFEFFF02FF
      E2FF3CFF37FFC2FEF4FED8FE04FFBDFE14FF8CFFF9FE060084FFAE00C0FF0401
      E5FFB80147008F018B00140298001402DF00AD0122016A013C0152016801F900
      4C01A800C801A5009A010100D9011D00D70166FFCB0127FF0401B5FE1A0198FE
      6B001AFEDCFF6BFE60FFB8FD3EFFFBFD97FE33FED1FEF4FEC4FE54FFF3FE8A00
      F6FE9A0021FF420167FF980179FFA8016DFFB20192FFAC01A3FF590153FF1501
      BBFFD100C6FF4200C8FF2900D6FFBEFF4D0080FFE6FFE9FE1C009EFEB1FFC9FD
      93FF03FEF4FE49FDE6FE81FD7AFE1BFD77FE43FD1BFE63FD9AFE63FEC8FEBFFE
      19FFB9FF9FFF42001100B90006004D016800D001C500C301AE00F301F100D001
      070177011901AD0110014A017001260140010A0172010201EC004E000E016100
      950066FF4E0050FFABFF28FF70FF15FF90FE94FE8BFEC1FE6CFE85FE66FE28FF
      6AFEDAFFE2FE6C000AFFC20072FF3701C2FF8101FCFFC2014400C80178007701
      E7007601080102012B0104013D01B700CC017A00A7011000210253000A028DFF
      EF0155FF8E01E5FEA001B1FEF10063FEAB0080FE050004FEB8FF1CFE64FF4CFE
      7EFFC9FE4FFFABFF80FF42006FFFC00081FF4A01DDFFA901D6FF6B01CEFF0402
      C5FFA001BEFF820198FF4401C5FF1F01A5FF5100D4FF7500B2FF0100EEFFB3FF
      BFFF1FFFC0FFCBFE3BFF17FE45FFEAFDC6FE94FD89FE65FD2EFE19FDF5FD08FD
      A9FD77FDF4FDD6FD27FE98FE80FE3BFFE8FEFDFF3BFF2400A7FF2201F0FF1B01
      43009D0173008101A800C2019100330104017B011A01FA0049011D015F01EA00
      9A01EC0036018C0069015C00310191FFEC0081FF6C0060FF1A00FCFE86FF00FF
      36FFC7FE0DFFCAFE15FF27FF1BFF29003EFF3900ABFF2001D7FF41010C00D401
      4E00B801A5004A028B00A501F100D701FE004F01140162012801D5009001EC00
      84017500BC017500A401D8FF9E018FFF4F0114FF1401CCFEC500A7FE510045FE
      A6FF0DFE60FFD9FD32FF2FFEE3FE48FEFDFE4EFFFDFE8BFFFAFE6E0002FFB600
      81FF570166FFF1009AFF9A017EFF200195FF72016EFFFA00AFFFD600B2FF3500
      EDFF6800C9FFE6FF1100C4FF06004BFFF0FFBCFEBEFF4FFEACFF2FFE4CFFE1FD
      0FFF69FDE3FE68FD6EFE1AFD52FE83FD58FEF5FD8EFEB9FEADFE0EFF35FF1C00
      4EFF5800D9FF4701F1FF53017900FD017900B601B20014029A00B9010601C801
      F5007101480179014F0148014F013C011701F7004501950006010900CD00AFFF
      74007AFFF0FF10FF8DFFF7FE2DFF7DFE0AFF99FECCFECAFEF1FE82FFE6FEAAFF
      60FF8A0067FFA600D7FF2D01F1FF62015700AF0149003001D2006001A9000501
      F500DD00F800BF005F01BD005E015600BC0143009701F7FFA10176FF7D0148FF
      4901FCFE0B01CBFEA00073FE24005BFEC0FF15FE9CFF66FE48FF8BFE56FF38FF
      1BFFB5FF3EFF8C0042FFE600ABFF93018CFF8801E4FFC50181FFAD01C1FFDA01
      98FF7E01CDFF2A019FFFF100F8FFC600C9FF660002002200F8FFCCFFE5FFFAFE
      9FFFD0FE86FF76FE45FF12FE09FF6EFDBDFE4CFD6CFEE8FC4CFE1BFD16FE72FD
      48FEE9FD67FE61FEBFFE4EFFD8FEAAFF8AFF7A008AFFB9000D00260127003501
      7500680154003401D2003F01CF00510122010E0129012E015E0114013001D800
      5401900026015B001601CCFFB20099FF570057FF21003CFFB9FFD2FE76FFFCFE
      51FF19FF4EFF9DFF2CFFFEFF95FFD100AFFF1701FCFF9A011000F20180003B02
      7400E501D400EC01BF00B0010E017B01DF007001380146014F0111018501B900
      680159008901DCFF4901A5FF0A0106FFEE00DAFE910080FE0C00F1FDBEFFB0FD
      7AFFF3FD21FFC2FD1BFF40FEF1FEE4FEFCFE78FFFCFEE3FF58FFC6004EFFB200
      9CFFC7005CFFDE009AFF220176FFED00AAFFD10095FF9E00CEFF7C00C5FF4200
      FAFF1A000900D5FFF0FF35FFB8FFF0FE9FFFBEFE6DFF6EFE4AFFEBFD12FF97FD
      D1FE56FD8DFE79FD59FEBDFD7BFE47FE82FECEFECEFE92FFF2FE07006BFF0A01
      81FF2B0116009A013200D4016C00EE017500D001C4000C02C500DB011E019D01
      3901BB0144018401480123016001FE002A016B001301E3FFD10092FF780038FF
      4600EDFEFAFF9AFEAFFF64FE59FF50FE4FFFD3FE25FF20FF73FFD1FF79FF2B00
      B4FFC000CBFFFA002D0061014A004B01990033019200E300B4000801A800F100
      F000C8001401CE004901AC0043011B004C0102002101CAFFFE0025FFEF000FFF
      9400E5FE4C006CFEFCFF30FEB0FF53FE59FF37FE53FFB9FE06FF3CFF12FF0900
      18FFA40047FF3E0152FF6801B3FFC40181FF8401BDFFC001C0FFDA01C4FF7701
      B3FF2901EAFF4001EBFFF00014008B00350051000A00AAFFE0FF0EFFC5FFAAFE
      9FFF87FE80FFC7FD49FF20FDF5FEDBFCB6FEECFC6BFEA4FC75FE57FD60FEE6FD
      91FE4CFEA2FEDCFE11FFFFFF28FFF7FFB8FF6900E1FFF2001C00070138001501
      66004F0174005701D3003301FD00680117015E013C014F013C01D9001601A800
      29016000E200FEFFA3008EFF9B00D9FF2F0022FFF1FF0CFFB8FF1BFF99FF86FF
      4FFF9EFFABFF8D008EFFEB00B5FF5A01F1FFA7013800360267004A02A000F201
      AE00DA01C800D501B90079010501500130019D015801EC00520183006E013100
      2E01EEFF0E01F6FE1C0139FFB9007DFE87003AFE27009BFDD2FFA2FD7AFF59FD
      62FFB1FD02FFE2FDF6FEE1FEE1FE48FFECFEE8FF29FF560066FF9C0041FF7600
      9AFFE9007BFF0A017CFF9E0096FFAA00A0FF86009CFFA900EAFF570003006200
      D1FF9DFFD9FF79FFAEFFE0FE9AFF44FF8CFF59FE5CFFF5FD0AFF6EFDC4FEAAFD
      82FE4DFD9EFE40FE70FE6EFE8BFE0AFFACFE95FFF0FEA6001DFFCC00C9FF6001
      F0FFA3011E00CE01610013027800DB01A50014020801D0011F01EB014B01BF01
      7C01E7015C01F1006F01EA006B01360024010900080136FFFA0083FF750088FE
      61009EFEFBFF1BFEB6FFBDFE81FF9DFE9BFF3EFF65FF9AFF94FF3D00B9FF5700
      F5FF090146004E01610005015600DA007200F1005C00DD00B400C300D6003301
      E700960005019E000401EBFFF9002F00F00062FFF20099FF8200E9FE93003BFF
      1E0065FEDEFF80FEAAFF59FE5AFF9EFE09FF82FE17FFBCFFD0FE0300F1FED200
      2EFF10015DFFC00166FF8F01CFFFC60191FFEC01B3FF9401D3FF6901CBFF0E01
      FAFF7C011D00A2002B00BC001200FDFF2700B0FFF8FFD5FE030032FFCDFF23FE
      9BFF8CFD5EFFD5FC1BFFE8FCD2FE48FCDDFE12FD6DFE00FD85FEB5FD79FED6FD
      BFFE13FFF0FE85FF71FFF1FF93FF3900F8FFC6001000F3003500AC0072005501
      93003401B3004401120173011001EA010201230149013C012301F3001401D600
      1301F6FFE40068006E00CBFF7E00B4FF00003EFFDDFF00008CFFAFFF82FF3E00
      54FFDA00A8FF6001B8FF56011C003C023B006802750005028000DA01A600B001
      93007801EF005C01EA00A3011D0101014301CE004301FEFF4E01200030014FFF
      2A010FFFE7007FFEC70059FE55009DFD3B00B6FDC9FF49FD83FF32FD3FFF19FD
      09FF21FE99FE4BFEF8FE3BFFE1FEA1FF1BFF300030FF3F006DFF9C002FFFF400
      87FF900074FFA1008AFFA8009DFFF200B4FF8400C5FFD800EAFF5900DBFFE7FF
      CCFFC8FFC1FFD9FF98FF11FF7DFFB6FE4BFF18FE18FF0FFED1FEB6FDD7FE40FE
      81FE1BFE90FED0FE59FEE9FEC9FE0500E6FEC7006FFFF200B7FF51011700AA01
      1800D3019B00A601AE00EE01E300C701030192014F01BB013701E7018D018701
      9A0123018001AC007A0180005B018BFF2E0196FFF50005FFD100ADFE520026FE
      28007FFEB1FF52FE95FFABFE5BFF29FF80FFA5FF7FFF1A00E4FFAB00E6FFF500
      2E0007011D00B50050009B002300CB008500CC006E00F200A00002019600D400
      E5005500D900B200D8002D00E300BBFFA60080FF670060FF5100E2FE3200EFFE
      B2FFBDFE81FF7BFE26FF6FFEF0FE51FFCDFEBFFFFFFE4100E5FEBF0043FF6501
      47FF4F019FFF860192FFDD01D2FF6E01ABFF2E01ECFF5B01DFFF4E011A00DA00
      1E00D00045007F003E00EDFF45005CFF1C001BFFFFFF96FEB5FFCDFD91FF13FD
      5DFF12FD1AFF82FC02FF70FC9BFEB4FC75FE05FD5BFEF4FCA3FE01FEA3FE0BFF
      28FF3AFF49FFCAFF8CFF6D00CCFF80004800A9002E001D018700470186000201
      D2008301F10000023801F1012601D9013B01B801200175012B01E4001701FC00
      DE00AB00AF002D006F00F4FF2D000C00D8FFFEFFA6FF2A0060FFA0008FFF1301
      99FF5A01F0FFFA0109004602430035025300AC01BA00A90189005C01D8002001
      BF003101DD002C01EB008E004A013A000E015B0029019CFF2201DFFEF300BAFE
      CC0021FEB80085FD4D0083FD050051FDA5FFA8FC36FFA7FCFCFE64FDB7FEB6FD
      BBFE53FEB9FE03FFF6FEA8FFF2FECBFF51FF43002FFF8E007EFF940064FF6B00
      71FFCA0071FFFB00ADFFF80090FFFF00EEFF2401D7FFB500E9FF7400C8FF3700
      CFFF04007EFF47FF97FFDAFE30FFA1FE06FF4DFEFCFE3AFE8BFE66FE79FE9AFE
      8FFE82FE96FE68FFB7FE38004CFF8F0060FFEE00C8FF65011D00480174008E01
      8800C301E900A701D000330149019D0149019201A901BB019B015501B3010C01
      7D018900AD0121005F01C8FF530175FF0D01D2FEAE0065FE610076FE260068FE
      B3FF52FE8CFFACFE85FF32FF5FFF9AFFA5FF4600ACFFC800CBFFDB0005008700
      3100DF000200C5007500B2003700B800650040018600C100AF00D6006A000701
      D700C80096001A00A30031008300D1FF740058FF1A002EFF070024FF8CFFA6FE
      4FFF87FEFCFEDDFECEFE5AFFE3FECAFFD0FE3E00F3FEED0025FF0A016DFF1801
      91FF4101EAFF6601BFFFDE00D8FFFB00EAFF01011D00DE001B007A005F00B500
      0D00190066009FFF2C003CFF2E0008FF0D00FEFDEDFF8AFD5BFF26FD7DFFB0FC
      23FF7DFCACFEC6FC97FEB5FC7CFEBBFC4CFE79FDA4FE69FEDDFED2FE00FF73FF
      6BFFFCFFABFF2E000200A80029001C015B0069016B001701D100A401CC00F101
      44016E022601280241013A023E0103026801CC012E01860148017701D900E100
      AC007C0063008D003000B000EAFF1C00D1FF7A0075FFD300ABFF1901CDFF7701
      C5FF03022A00CC01530073014200A5017F003701C500F3008400A500DE00BF00
      E5005300EA001800E900E5FF1A01A9FFE20006FF0E01C3FEBA0052FEBC00DDFD
      64004CFD230062FDB8FFE0FC95FFCAFC04FFCAFCF4FE62FDD1FEDCFDA0FE7CFE
      AAFE1FFFD5FEB6FFFAFECBFF40FF3F0055FFB60060FF910083FFA80076FF2301
      C2FF1D01D0FF0F01B6FF9001AAFF1F010300F000ABFFEE00F2FFC700DCFF0000
      97FFC8FF60FF28FF79FFEBFE00FFB1FEECFEB5FEAAFE95FE8BFEABFE89FEE8FE
      C2FEDEFFD7FE0A005CFF6B0091FFA600F0FFF9006700FC0078005801A9004401
      FA00F30024011A013A013A018E0187017B0128019B01EF00A201DD00B8018C00
      A001EBFF8901DDFF2F0138FF1E01C3FE8C00DDFE6600F9FE1E0047FEC3FFCCFE
      6FFFF6FEA6FF7EFF6BFFFEFF8CFF7100D8FF5500D2FFBF00E3FFBD001500BE00
      1000D6003400B2004600DE00420026016A00EF006100F0006900FE00A000A300
      A200A100580056008A00F2FF250086FFEAFF89FFC5FF1BFF85FF19FF1CFFB7FE
      1AFF22FFE3FE80FFDBFEEEFFE9FE3C0009FFD4003DFF6E008AFFDE0098FFEA00
      E6FFC300DFFF9400F6FFD60038006A0032006700240061003B00D7FF3700C4FF
      220073FF4F0009FF1F009CFEEFFF01FECDFF56FD7FFF38FD4EFFCAFC1BFFA1FC
      ACFEC3FCA8FEE2FC79FEFFFC6EFE29FEAFFE69FEFDFE0DFF10FF74FF93FF1C00
      DBFF4B00F0FFFB0053001C019000650194009901E4000702F700780212018A02
      370183024601E30250018B026D013F024801200232018B0104013601A5004301
      7A00050139008900E5FFC700C5FFA400A9FF1601A2FF3C01D1FF4B01FEFF2301
      22004A014D00DF005B00EF006F007D00AE003A0082002D00AF002F00B90099FF
      9E00B7FFB7005FFFDB00FCFEB800D5FEBB0086FEA500CEFD56009DFD220071FD
      F4FF22FD72FFDFFC5AFFDEFCFBFE14FDC4FE96FDBCFE26FEBBFEAFFEA7FE31FF
      F0FE5AFF1BFF21003AFF38007DFF840088FFC70096FF2301BAFF2701C3FF8001
      CFFF7B01D1FF6E01C3FF8101DFFF8701D6FF2701EAFF0C01C5FF5700ABFF1600
      52FF9FFF63FF50FFFBFEE3FED9FEE9FEC0FE9EFE9FFEF0FE90FE73FFF0FE7FFF
      01FFCEFF62FF1A00B8FF3600170065005500B400BB00A500D6009C001A01C300
      4C01D6004F01E50088010A019001D600870100019D01AD00BD01A10084010A00
      8F01CEFF3B0162FFF10066FF92000DFF6600F8FEEAFFD6FED6FF2BFF78FF75FF
      8EFFF0FF73FF0300AAFF5D00B2FF6700E7FFB100DEFFC9001A00D2001200AA00
      1000FA002E00110139000A01230037014F0024014200F7004100E4006E00C200
      4800340033001600F9FFA5FFDDFF6EFF73FFF6FE7AFFF8FE0EFFB7FEFCFE39FF
      D6FE3EFFEFFEA7FFDFFECDFF38FF09003FFF0500ADFF6500C9FF270000005500
      0600480039007A001D00110053003E00450002003800D2FF2F009FFF2D0067FF
      300006FF170075FEF6FF4CFEA7FFAFFD7EFF3DFD1BFFD6FC0DFF07FDC6FED7FC
      9FFE3DFD84FEB8FDBAFE3AFE9EFE57FE20FF4BFF40FF80FFA4FF3400D9FF5B00
      49002D0152001701B200C601D100F801F700A4020A01B7023401ED0224012F03
      48012C035501E6025901E502570175022401E201FB00AD01B2007A017A00E700
      2900AC001200F400C1FF9500CCFFE500AFFFBA00E6FFE500ECFF55003800C000
      38004B0071003A0055009CFF8200F0FF890097FF9F009CFF80005EFF95007BFF
      6100ACFE7800CDFE8E0083FE70002AFE4B00B5FD2300A2FDE9FF13FDA8FFCBFC
      85FFDCFC25FF02FDE9FE5EFDC3FE97FDC6FE50FEABFE9FFED7FE42FFE3FE95FF
      3BFF730062FF2B00A3FFF400A1FF2B01C4FFA701C5FF7D01FDFF5102F0FFE801
      E8FF1E02CCFFF801E3FF0C02EAFF6C01EDFF6D01CDFFC7009FFF63006DFF8CFF
      43FF3BFF29FFDDFE00FFBFFEDAFEB6FED1FEE9FEE7FEFCFEF0FEE3FE49FF71FF
      7EFF5AFFDCFFE3FF2D00D1FF80003E00AC00EAFFFB0089002F01770054010401
      6901D9007F010A016C01CD0086013C018901C1008F01070179012F005B011A00
      210186FFE300A8FFA10022FF560047FF16003BFFDEFF55FFB2FFBCFF99FFD9FF
      93FF23009FFF4900BCFFB100D7FFA700E7FFFC00F1FFA500F8FFFE001A001D01
      2F008101280042012200AD010A0004010A003C011C00C1002900FC0010001600
      F2FF0B00DEFF27FFBCFF20FF95FF86FE63FFC3FE2FFFA6FE0CFFB0FEFDFEBEFE
      0BFF39FF13FF60FF33FF81FF68FFE3FFBEFFB3FFD4FFD0FFFCFFFCFF19003C00
      2F0009003F0062005B001B00380044001E00C6FF1800FDFF230057FF0A0057FF
      F3FF74FECCFF7DFEABFF70FD6DFF4EFD47FFF8FC2EFF46FDEDFEFCFCD7FEA4FD
      E1FEC6FDCEFE1CFEE1FE91FE38FF4EFF6FFFBEFFB8FF3B00FBFFBF0043002801
      6300A501BE003402DF00E6020301F30201014B031D0168032B01DD0346017303
      4101CA035401FF023401B40228011102FF001602DB0036018A0023016F00BB00
      3C00AD001A005600FBFF8300E6FF4200EAFF3500F9FF10001F0002002400B2FF
      300065FF27005AFF68006DFF60003DFF6B0028FF5B0030FF4200B2FE1600A5FE
      460075FE2D0059FE170099FDFBFFADFDF7FF04FDAEFFF3FCB2FFA3FC65FFF9FC
      34FF01FDFBFE56FDF4FEB5FDD2FE5AFED4FED7FEDDFE80FFFDFE140038FF6900
      63FFA60080FF68019CFFC101CCFF2002E0FF81020200A102F5FFAC02FAFFB802
      DAFFD902F8FF4802DDFF1502E3FF5F01BAFFF200C6FF26008BFFA2FF94FF26FF
      60FFCFFE56FF93FE34FF8FFE39FF82FE12FF5AFE44FF85FE5BFFCAFEA1FFE0FE
      F0FF2EFF2F0057FF59006DFFAF00DDFFF800350004018A004901A8004F01DB00
      4801E5005901540184013301550130015B01C90055016B0043012E00FF002400
      0801D1FFA200ADFF7A00B8FF340094FF1F00D7FFC0FFFAFFB9FF35009BFF4B00
      A0FFAD00A3FFA400B9FFFC00B8FFF100C7FF2701EDFF53010000800110006E01
      0A00B301F0FF5C01F4FF4901F6FF0801E9FFDB00F9FF3500DEFFF5FFDBFF52FF
      C0FFEFFED6FF98FE76FF45FE80FF49FE52FFFBFD2DFF1EFE17FF3CFE34FFB5FE
      12FFABFE2FFF31FF6AFF0AFF86FF49FF92FF93FFE4FFF8FFFEFFE4FF1A004D00
      3A001600420061002B00330025006B001C00D2FFFCFFB5FFF3FF0FFFD2FFD3FE
      CFFF4BFEB1FFDCFDA5FFB9FD78FF75FD6DFF81FD43FF97FD1FFFE2FD05FFE0FD
      1BFF85FE0FFFF0FE53FF7EFF8AFFE4FFB2FFA500E8FFF0004F00CD0180001B02
      B200E6020401ED0204018F030F01B2034A0136043C01D9033A010B043D017203
      390112032B019F0232015C021F01BC01E8005F01D500010180008A005B003D00
      2A000F00F6FFF6FFD9FF95FFD3FF89FFCBFF4FFFC2FF49FFEAFFF2FEEEFF35FF
      0900E7FE2700E3FE2E00ABFE2B00FBFE140080FE280099FEF9FF33FEF6FF21FE
      F8FF8FFDD7FF94FDCCFF35FDD8FF13FDC1FFCFFC87FF0EFD8DFF01FD56FF35FD
      0AFF95FD25FF21FEECFE94FEDDFE3DFFECFEE4FFFCFE4100F9FECB004BFF7501
      6CFF07029EFF5302E0FFC402ECFF0203F9FF3303220030030E008603FEFFDD02
      03008002E0FFED01CFFF8601DEFFA400E6FF4A00D1FFA0FFD5FF0AFFB2FF7BFE
      A4FF67FE68FFF3FD71FFD7FD5EFFB5FD60FF0CFE72FFE9FDB8FF4FFEBCFF9FFE
      1F00F9FE520021FFA300B8FFCE00F4FF23012E001B01A7005B010E015E013D01
      450152016601600134013B011B01F2003D01BF002901D0000B0167001B015500
      CB0046006D003F005600D0FF24007400B8FF5500CBFF560071FF6B0073FFEF00
      5CFFB7009FFF44018BFF4901C9FF7701C5FF3001FBFF9101EBFF8401F9FF9401
      FFFF2801ECFF2E01C9FFA700EBFF2900C4FFDCFFCAFF77FFDCFFCDFED8FF7DFE
      C2FF4FFEB7FFCBFD93FFADFD61FF92FD65FFC3FD1FFFB0FD3BFF08FE02FF31FE
      06FFA0FE2FFF85FE70FF76FF6BFF65FFF0FFBFFFF6FFDCFF04007F0029000900
      5900A4001200A600420064000D00F3FFF0FFEDFFDDFF47FFF6FF29FFE0FFC2FE
      EFFF98FED0FF31FEC1FF03FE9FFF06FE73FF2DFE6AFF21FE57FF54FE39FFFFFE
      40FF10FF65FFD2FF71FF7100D7FF290101005B015A004D028A007A02D4001B03
      FD003C03440107043001F703490115043801DF031401F603140108033C01F402
      0601A1023C01FD0124016001EE005501BA0071009D0003004100E4FF22007DFF
      E7FF0DFF9BFFE9FE8CFFD5FE8BFFBFFE95FFE3FEC5FFA0FECBFFDBFEDEFF61FE
      02007CFE09009EFE100098FE1B0036FEFEFF8DFED2FF24FECCFFD1FDB9FFB8FD
      C8FFBDFDC1FF40FDD1FF6EFDB9FF53FDA5FF6EFD90FF4AFD8CFFD9FD45FF29FE
      2AFF62FE04FFD7FED8FEACFFCBFE190010FF9B000FFFAB0160FFEB019BFF5102
      D2FFF602E0FF35031F0023031800850342008C0323004A031300E202F0FF5F02
      EDFFC301E2FF51010C008F00FDFF2D00E7FF60FFE9FFA6FED3FF5AFEC2FF11FE
      B6FF6BFD98FF59FD67FF62FD68FF3BFD71FFA2FDB2FF13FED3FF5AFE2800ACFE
      50003CFFA40098FFD100F0FF400146003801E1005E012901430145013C01A101
      0801810123014701F7005E0118015C010B0104010E010101D500DE00BA00AB00
      730099004F00860007006500B6FF6B007FFF54004EFFBB004FFFF10067FF2201
      86FF38017FFF9301B2FF4201C3FF5301FDFF7A01FFFF3C0110000C01E2FF1101
      E2FFB200AAFF1400D1FFB0FFB2FF63FFD2FFCAFEC4FF6EFED8FF3AFEBEFFBDFD
      D7FF5BFDB8FF5BFDA1FF65FD61FFEEFC31FF38FD02FF7EFD05FFE2FD0CFF27FE
      3DFFEDFE6AFF18FF9CFF87FFDBFFD5FFF8FF580026004300380081004E00BF00
      2B00E90022007A00EBFF7100EAFF2300E6FFD5FFECFF8CFFEAFF80FFEBFF06FF
      D5FFBFFEEAFFBDFEDAFFBAFEBBFF63FE88FF7AFE6EFFE4FE3DFF08FF5BFF98FF
      7FFF3D00ABFFD800F0FF16012D00310275006802C600C502100115034101B603
      4D01A2034001FD032501CE031301B1030C013C030F013703090185020C013602
      0E016501F3005C01D5009300BC002200690079FF35001BFFE9FF99FE99FF77FE
      65FF6CFE6DFF30FE53FF4EFE6BFF44FE89FF80FE99FF66FEC7FF48FEFAFF43FE
      FEFF59FEFFFF0DFEEAFF70FEC2FF2AFEAAFFFDFDA0FFB8FDA3FF20FEA6FF6BFD
      B1FFE4FDAAFFAAFDD0FFE9FDB4FFC9FDD0FF53FEA0FF22FE6DFF80FE1EFFA5FE
      09FF73FFF0FE000010FFA50012FF2D014EFF0E027DFF5602BEFFF302E7FF5A03
      400037032500510348007B0355007C032D00FE020500BD020D000402E8FFB901
      DFFFC7000E008900F2FFB2FFFDFF21FF0D006CFE0E0062FEEDFF23FDD4FF26FD
      8BFFF3FC80FFE0FC67FFDCFC8FFF95FDA7FF75FDEDFF28FE0400E5FE7E0060FF
      AA0090FF0B0131002C016B004301EB002A013A0128018801F700BE010401AF01
      DE00DE01D800D301E600B901EC006501CC00D301DA004801A70030015F00DE00
      4600C500EAFF800095FFA6006FFF8D004AFFB8002DFFAA005BFF2D015AFF4901
      8CFF5D01BDFF0A01E8FF4901F0FFA6001500A500D4FFA100DDFF2F00B0FFC5FF
      A9FFA8FF96FF13FFB9FF8EFEA4FF84FECFFF0AFEDAFFD9FDEAFF9CFDE2FF2FFD
      CBFFFEFC98FFE6FC6DFFD1FC1EFF23FD25FF5FFD18FFADFD08FF3CFE41FF06FF
      7BFF60FF98FFF9FFE4FF3B002900730010008F004500DB00480004012700FA00
      0800E400EFFFE700CAFF9600E2FF4D00DCFF4100F7FF01000800BAFF1100A8FF
      060037FF1A00D8FEC6FFDCFEB3FFFCFE9BFF10FF81FF72FF7EFF93FFACFF2C00
      CCFFE8001000A70166003502B2008F02F0008A021A0105033C0149034D014E03
      1D01630309018203FF001003CC000603D800CF02EE005402D400A001D2008001
      E500F700AD001D0089009CFF59002FFFFDFF9EFEBEFF2BFE80FF33FE3EFF9AFD
      2FFF97FD27FFF6FD41FF3AFE86FF20FEA3FF49FEB7FFF7FDDFFFF3FDDDFFE0FD
      CBFF2DFECDFFF6FDA4FF1EFE79FFD6FD80FF2EFE8FFFF5FDA5FF34FEB7FF51FE
      D2FF93FEDDFF53FEE0FFA8FED7FFB9FECAFFCBFE7CFF1AFF57FF8DFF43FFC6FF
      2FFF3E0018FF10015AFFC70165FF5102B5FFDB02F3FF51032C00160334005103
      620050035C0043035600C5022B00F202F6FF0C02E0FFBF01E6FF3301E6FFDB00
      120007001A00DAFF1600C6FE240054FE160098FDF0FF40FDC5FFD5FCBAFFC9FC
      76FF60FC8CFFC4FC86FF13FDCBFFABFDDEFF74FE4D0023FF7C0053FFC600C6FF
      E500560029018A001401100118015601EC00D301DA00C301A8003902CC005602
      B6007F02CD002402CA007102CB00F701B200C5019B0081016E0085012400DB00
      F0FFF70094FF65006DFF74003CFF71004FFFC80053FFE5009EFF3601A1FFBF00
      DAFFAC00DAFF9200FFFF0100DEFFECFFEEFFC2FFAFFF35FF9DFF05FF76FF02FF
      9FFF59FE90FF57FEBEFF34FEBFFFDAFDD9FF6FFDCFFF7CFDE1FFF4FCB9FF19FD
      93FFE3FC67FF1DFD2EFFEAFC24FF5CFD06FFD6FD29FFD0FE47FF1FFF93FFD6FF
      ACFF1E00F7FF70001300D0004100230142001A014400250100002501ECFF2101
      CBFF4001EBFF1301DDFFF9001300F9001C009E0035004C003700470040008FFF
      17008CFF000081FFFBFF4AFFCFFF1CFFBEFFBDFFC4FFB2FFE6FF840016004101
      6A00B70195000102D4008902070188023601DE023C01EE023301CC02E500D602
      D500D902AF00A602AC00C702AA007A02B200DA019D006801A900E9009A007500
      7600D4FF530076FF1000A9FEC5FF18FE7FFF7EFD4EFF97FD20FF3BFD1BFF67FD
      22FFBCFD5FFFEBFD6EFFBAFD98FF1CFEB4FFD0FDC5FFABFDB9FFD0FDC8FFC8FD
      A0FFAFFD79FF2BFE77FF31FE83FF5DFE90FFB5FEBEFFC1FEC5FFD0FEE1FF15FF
      F7FF2FFFFFFF50FFF8FFB8FFD8FF79FFADFFD8FF7CFF090072FF560047FFE100
      6FFFE00181FFF801B4FFA402E4FFFD02200054033300330367006E036B00F102
      50008A0221003D0201003002DDFFA801E5FF5101E2FFE20000006400030094FF
      130040FF2D0082FE1D00B6FDFEFF72FDF4FFDAFCE4FF74FCAFFF54FCB2FF76FC
      9FFF79FCA8FF52FDDBFFA4FD28006CFE49001BFF9600DAFFC7000F000201D700
      0001BD00FE004001CF00A701B0001E028A0053029D000B039300D5029B00FC02
      A600D702B400C7029E007502A4007F028300FA014800810109001401CFFFAD00
      95FF73006DFF660062FF750067FF4D0089FF8E009AFF7500D0FF6B00DDFFDEFF
      DDFFB8FFE1FFE9FEDEFFB7FEAAFF84FE97FF8BFE7CFF1BFE6AFF59FE6EFFB2FD
      99FFAEFD95FF83FDB8FF98FDC0FF1DFDD9FF6CFDBEFFF4FCAEFFF5FC88FF13FD
      53FF36FD2CFF34FD2BFFF5FD2CFF78FE43FF00FF7AFFDBFFAFFF4D00D6FFD100
      10002D013500740143005C0139006D0110006C01FBFFB401F0FFCC01E7FFF801
      F6FF81011B00A6011C003C01420046016200BA005A00AC004B00E7FF5600D2FF
      3900A0FF2700A7FF0E007EFFFFFFD4FFF1FFD8FF26006400580019019200A301
      BB00F801F10051020F011C0210010F0200015302D1002B029300150284005502
      6A0047026700E0016300EA01640041015B00E500660082005100380035005AFF
      1500E7FEC8FF32FE92FFCDFD63FF74FD2CFF5FFD15FF25FD30FF4CFD37FF9DFD
      5DFFE4FD92FFE9FD9FFFDFFDA5FF88FDC1FF72FDB3FF97FDA8FFD1FD8BFF08FE
      84FF65FE6AFF7BFE8CFF9DFEA5FF25FFCCFF34FFE2FF90FF0800DFFF1C00E5FF
      2000E4FF0A004C00F0FF4B00BFFF6300A8FFCD008DFF040195FF7101AEFF2B02
      C6FF8302F3FFC90223003703380010034D00DF027200B302480050022300FC01
      1000F201EDFF8E01CAFF2A01E6FFA300E1FF5A00EAFFA1FF050030FF2100A2FE
      1000F6FD1A004EFD08001DFDFFFFBEFCDFFF80FCC5FF98FCABFF86FCADFFA8FC
      CCFF6CFD00002DFE4000C0FE6B00C3FF9900F2FFC6004300D300C500C9004D01
      AC0092018A003F0275006F026E00EF0283003E036E00680387002B038F005D03
      9700DE029300D3029F00880266000A023500860114004001CFFFA30092FF4D00
      95FF200086FF0D008BFF0E00B3FFF1FFCAFFC9FFCAFF4DFFDAFFD0FEDDFF71FE
      C8FF2CFEB4FFC2FD8AFFF9FD70FF9BFD55FF77FD63FF58FD66FF75FD83FF1AFD
      98FFAAFDB6FF58FDC9FF36FDD4FF4FFDB5FF76FD9BFF51FD73FFC1FD56FF9DFD
      41FF04FE55FFBFFE5AFF80FF80FFFBFFB8FFC400D1FFF100000049012B00BB01
      3C00C9013800DC013800F8010D00170203002B020B0060020D00200216004002
      4100D5014D00AE017400610188000E0191008000790062007D00E1FF5500E6FF
      40009EFF1E008EFF1D0092FF2E0000004E003B008000050195001D01B8000B01
      D0004901CB005501B20041019400A3015B00680142004C014000CF012B00B401
      110069012F0034010F00B600230026003A0031002C00B3FFFBFF2EFFF0FFA7FE
      A5FF3CFE76FFCAFD58FF9EFD41FF63FD38FFA0FD58FFA3FD6CFFC6FD8CFFEAFD
      A6FFE9FDAEFFB6FDBBFFE9FDBEFFD4FDB2FFFEFDA6FF50FE94FF80FE89FFCEFE
      9FFFFFFEA8FF39FFCAFFAAFFEEFF0200170005002900670043007F002F007A00
      1C00DC00E6FFD200DEFF9000D1FF2201C6FF8D01C5FFD401F5FF4402EDFF5F02
      050043024200840241007C02320052025100F6012800A001F8FF6F01F5FF3C01
      D7FFDF00BCFF8A00CDFF3F00DBFF9EFFEDFF4EFF1500E8FE1A0065FE2200EDFD
      160084FD0A0022FDF4FFEDFCE4FFB8FCC0FFF4FCCFFF16FDDFFF6BFDFEFF38FE
      3000F1FE56003FFF7300E9FF98006D009F0096009E0049018500C9017400EB01
      6F00770264001203530051035A007C0361005E035E003B0393000C039900F202
      8800BA027D0056025D008801200035010500BB00C9FF3100A7FFE6FFA8FFD2FF
      AEFF72FFB7FF32FFD6FF14FFC0FFB5FEBEFF40FEC7FFDCFDAEFFA1FD99FF5DFD
      92FF1BFD62FF5AFD48FF3BFD5BFFF6FC51FF32FD61FF61FD84FF57FDAAFF84FD
      B1FFC8FDC5FF93FDC1FFDCFDAAFF23FE82FF27FE8CFF4BFE7FFFC6FE72FF69FF
      7CFFF0FFB5FF6300B1FFCA00E4FF3701100076012100030226005F024E002D02
      490056023400930226008B0217008802190082021C005E02440017026E00F401
      7D00BF018C006101AD00CF00930079008700220084009DFF68007FFF2D0087FF
      4D004AFF3B0066FF4A00E4FF6700F8FF8A004200700067008900950085008700
      7800D1005500DB004700EC001C00DE00FFFF2901E4FF4501E6FF0601DFFFC500
      E1FFB800FDFF370009001E00FDFFF7FFEEFF77FFE3FFBFFEAFFF84FE93FF2AFE
      67FFDBFD5CFFBDFD4EFFB6FD75FFE0FD89FFBEFDAAFF05FE93FF00FEB4FFE9FD
      B9FFC3FDC9FF49FEC6FF1BFED8FF63FEA1FFD2FEABFF28FFB7FF11FFC5FFBAFF
      D2FFE4FF0600350019005A003E00D5004900B5004D00E4003C00F3001F002301
      0500F500FDFF3C01E6FFA601DEFFB7010E00D9010100F8010900EE011E00B901
      29000E020F00D9013500A20119003201FDFF2C01D5FFBD00C9FF9D00A9FF1400
      B9FF1E00C6FF63FFF3FF53FFECFFEDFE0400ABFE0D00D0FD1800E4FDFCFF65FD
      10002EFDE6FF33FDD2FF8FFDE0FF59FDF4FFE5FD040069FE2E00DBFE3B0046FF
      4E00EEFF67005E007A00C700870084017B00F3016800520261006F024E001E03
      3800350359007003570042035A005C038000E7029300FD027400A20287005102
      640055014100170114006E00F1FF1800C3FF58FFD1FF73FFC4FFDEFED3FF8CFE
      C5FF59FEB3FF26FEA1FF69FDB3FF57FD9FFF60FD9BFFE6FC7FFFE0FC5AFF0DFD
      4CFFF2FC4FFFD4FC4AFF45FD61FF56FD6DFF7BFD8FFFBCFDADFF25FEB9FF1AFE
      C5FF72FEC2FF97FEAAFF0DFF9DFFF0FE9CFF8DFF8BFF0100B3FF9B00CFFFC700
      DAFF6201EDFF7E010E00BD01130032024100C2024A00920249009B024300C702
      3700BB02220082023B00A102300082024C00FB01700003028200DA0183002901
      A900A0009B0071009300D1FF8B0082FF64006DFF42002EFF4700EBFE4A0036FF
      4C002BFF4D0047FF450034FF440081FF4600BCFF4E00080048003B0023007A00
      06007A00F6FF6C00CCFFD200C7FFEB00CDFFBA00C4FFA300CCFF9C00E7FF5600
      E8FF2000F3FF2700F6FFB5FFDEFF10FFC8FFF7FEADFFB2FE8EFF52FE95FF28FE
      92FF6DFE96FF1AFEAEFF1BFEA5FF28FEA5FF0EFEBEFF08FEC7FF4AFECDFF86FE
      DDFF86FEC8FFC2FEB7FFE8FECCFF4EFFC0FF6BFFD1FF9AFFECFF030002002900
      1A004B004100D6005400F1005800DA004D000A0138005A012300F7000F004301
      05008E012200A7010E0093011400B9010B0089010C0054010C0096012500D601
      0F005D0102000B01F0FFFC00D2FF8800CFFF5500BFFF4100B2FFE4FFC9FF57FF
      D2FF58FFE3FFFCFE0200A7FE07002CFE0C00F2FD1800B9FD0500A0FDE2FF85FD
      F9FFDAFDEAFFE1FD050034FE1400B3FE200012FF1A000AFF4300EAFF42008A00
      640012015600A40155001A02480037024D0085022900110345002F033D003703
      460021035A0018036B00D1026A00960282005E027B00CD01690011014800BF00
      24002A001700CEFF050063FFF7FF22FFE6FF8EFEDCFF3AFEAFFF9DFDD1FF7EFD
      ADFF3FFDAAFFFAFC97FF0DFD93FF01FD62FFC3FC73FFF3FC4FFF22FD4CFFFFFC
      4CFF32FD60FF84FD67FF91FD9AFFEFFD90FF6CFEC6FFACFEC5FFF2FEC3FF38FF
      BAFFA2FFC8FFD1FFAAFF3C00CEFFE300EBFF6601E0FF6901F7FFBC010300F801
      0F001B0224009302450018033B00E9024300CF023800E7024B00DE024200B902
      42007302380052025800CE014E0087018B0069018700F200990022009400F4FF
      9A00AEFF6D0014FF7700FFFE5500FCFE5B00ACFE5700B5FE4800D9FE3500BEFE
      44009BFE1D00FFFE260076FF2700B7FFF7FFDEFFEEFF1B00EDFF4200C6FF2A00
      B6FFBD00BFFFBE00A0FF8F00ABFF8100BCFFAF00C4FF5600CEFF4A00EDFF1D00
      E1FFBEFFE6FF54FFC0FF2FFFCAFF0DFFC1FFFCFECDFFC8FEC0FFDEFEC9FF98FE
      B6FF4EFED0FF44FED2FF68FED6FF56FED7FF78FED7FFBCFECAFFB7FEE0FF0CFF
      CBFF2AFFD7FF6DFFE1FF70FFE0FF96FFEDFFC7FF1A00360014002B0035008B00
      5A00BB003B00B8003D00C90043002E012900FE0029005C013B00A1012500D101
      1D0088011D008D0110004D010A006F010D006001F8FF7001FAFF4B01DEFFE000
      DEFFD200CEFFD800CBFF7500B9FFFFFFBEFFD2FFB0FF51FFCFFF12FFD7FFFCFE
      F2FFB2FE02001CFE0600F5FDF5FFE9FD040002FEF1FFDFFD0A0042FE220060FE
      1B0089FE1800C9FE330072FF240051FF350007004B00BD002A00360129007701
      4300350232004C0231009A023D00F202220016032E00F1023300D4024200A502
      45009502610013025A00A70166003D014600A1003A001E002A00000029009DFF
      190006FF1900C0FEEAFF2DFEE8FFC0FDCFFF50FDD0FF40FDBAFFE3FCA7FFC9FC
      86FFA0FC86FFEEFC6BFFCCFC6CFFFBFC73FF13FD58FF1AFD5EFF12FD73FFC0FD
      77FFDBFD8CFF60FEBCFF93FEB0FF06FFB0FF25FFC5FFDEFFC5FF0400D1FFB800
      F0FF2401E9FFAD010300310203006202130063021A00AB022900E0021F00E702
      3A0028032F00350330000B0334001C03420024033B00B402480057024100CC01
      4A00B101550008016E00DC00840042008100C3FF6D00F6FE710028FF5A009EFE
      5A0099FE700076FE5F0082FE4E0017FE4E0081FE3B0056FE220089FE2B0098FE
      0900FBFEE9FF28FFD9FFA4FFD1FFCDFFC4FF3D00BEFF5B00A5FF5600A4FFA000
      98FF990099FF8200B2FF8A00C0FF8A00BAFF1D00D7FF1C00D0FFB3FFC1FFA5FF
      C3FF4FFFDAFF8CFFD7FF43FFE7FF71FFECFFE6FEE6FF26FFE3FFB1FEEAFFB7FE
      F0FFA8FEE8FFCCFED6FF66FEE4FFECFEDBFFEBFED4FF35FFEBFF4AFFF3FF6DFF
      E4FF2FFFF4FF9FFF0500C8FF0F00190029005300410029003B0056002D008300
      3400BF003700DA0047004E013B002D014000BC013500C0012900D40128008E01
      2A00930106003001FDFF6E01F0FFFE00DEFF2301CAFFDB00CDFFDE00BBFF8700
      BEFF8D00B2FFA8FFB4FFA9FFB4FF72FFC9FF0FFFD7FFE7FEEFFFBFFEE4FF0EFE
      E4FF06FEEDFF16FEECFFFEFD00004DFE1D007AFE1F00ACFE2700FFFE330063FF
      300094FF32002F00370014003100A6001A0019011C00A5011C00F80132009502
      24005D022600B0021C00A4022200B90225007F024E006D024E00DF014E00BD01
      4800FB004800A90035004F003B00BEFF34006DFF3B005CFF2600B4FE260047FE
      1A003DFE02008FFDE7FF46FDDBFF24FDBCFFAAFC96FF86FC96FFCCFC82FFB3FC
      70FF05FD76FF0AFD77FF13FD65FF29FD73FFABFD79FFE2FD93FF9AFE9FFFBCFE
      B9FF0EFFACFF6DFFB8FFDEFFB8FF5200E2FFF500F1FF45010100D30104006402
      1C00CD021C001E0335004D0336002B03320057031D003E032A00370327006203
      2E0025032C00F8023500D10231004A023400C0014500A7014D0023015C00AC00
      67005F006D00A7FF5B000EFF6100C2FE59004FFE56001AFE5B0011FE6700EFFD
      5600EBFD5B001CFE46001AFE410046FE20005CFE110059FEE9FF7FFED4FFDDFE
      B8FF4AFFBAFFD4FFB3FF0200A7FF2E008DFF430093FF80008CFFAE00A0FFD500
      B9FFA600C9FF9E00B5FF6800BEFF3F00C7FF2A00CAFFFDFFD7FFB0FFE9FFCCFF
      F2FFA7FFF9FF9AFF17008EFF170088FF150048FF090044FFFDFFF3FEEEFFCAFE
      EAFFE9FEE5FFF0FEECFF24FFE5FF49FFF1FF3DFFEFFF2DFF000072FFFAFF8EFF
      1A00CBFF2600140035002E003100220033006B00280078003500C7004000CE00
      4E001E0141001C01450080014400B9014400DF013B009B012F00940101003C01
      E6FF1301D9FF0701CAFF0401C5FFA800BBFF9E00ABFF4000A0FFEEFFAFFFBAFF
      B1FF92FFC2FF59FFCCFF2BFFCFFFF3FECFFF99FED7FF8CFED5FF2EFEEEFF34FE
      ECFF3CFE030068FE0E008BFE2C0017FF2E0047FF4800BBFF3F000C0034007000
      220050001F00D80008001F011000AE010E00FE011C0058021000250215004E02
      160073022500820239003402530017024900A7013B003E013B00F10036007600
      3E00BFFF42005CFF3B0012FF3B00A4FE450077FE3F0021FE4200EAFD26009DFD
      FBFF5FFDD1FFC8FCC3FFC8FC9BFF8EFCA1FFBCFC86FFE2FC79FF07FD6FFFE8FC
      73FF66FD70FF93FD88FF08FE8BFF63FE97FFF5FE9DFF1BFFA6FFBFFF9FFF1B00
      B8FF8300BEFFF100DAFF7C01EDFFBD0106004F021500CB022F00480340007B03
      4C00AE033F00AF0327006D03230071031600510321002E032900D5022200B902
      1C0014022E00DE0132005D014C00F90053008E0055003D0046008DFF540054FF
      3D00C2FE540038FE4800DEFD4300CAFD46003BFD500095FD4D009FFD6100B4FD
      4D00F1FD38004CFE150030FEF7FF67FEC9FFB7FEC6FFE1FEAAFF67FF9FFFBBFF
      99FFF2FF8CFF160087FF560090FF93009BFFDB00AEFFCF00B7FFF300B3FFE600
      B5FFDA00B3FFA300C0FF8300D7FF0100DFFF0500E3FFC5FF1000DEFF1700BBFF
      3F00B3FF4200B3FF3900CBFF160052FF150032FFF9FF27FF0200D0FEF8FF06FF
      F0FF47FFECFFE5FEF9FF0FFFECFF65FF150036FF110080FF2200CBFF2200C5FF
      270013001400670025003F001E0089002300A0002C00C6002D00E60040003001
      4A002C015000B1014F00AB014300C6011600AE0104004F01E1FF2801CEFF2301
      BEFFDD00BDFFA2009BFF7200B2FF23009CFFF5FFC0FFA6FFBEFF64FFCBFF60FF
      BCFF14FFCBFFECFEB7FF10FFD1FF79FED5FF60FEE0FF82FEDFFF55FE06005EFE
      0600F0FE3600CEFE440050FF4B00EEFF3E001600290068001A00CC000C00C100
      0A0049010100B1010700BF01F0FFF8010D000B020F00D5011D00240227000B02
      4200BB012700BA01450069012E00F9003700980023000500400068FF250015FF
      47009FFE3C0075FE5F00FDFD5A00BAFD5300D6FD2D00A3FD140032FDDCFF40FD
      D2FFD8FCBCFFB5FC9FFF0CFD87FF1DFD81FF07FD76FF7EFD79FF87FD95FFF3FD
      8DFF73FE9FFFC3FE87FF44FFA1FFF0FF94FF1100AAFFAF00A8FF2901CBFF4D01
      B7FFF401F1FF5602090073022E00050338008D036000A7033700F6034D000604
      2900AD032C008403130067031C0009030B00BD02220045021B0016022E005501
      5000D6004B0086004E001D004A0073FF3C0043FF3700AAFE4700FBFD3400C1FD
      3C008DFD2C0015FD42001FFD4000E7FC67001DFD4B0055FD5A009DFD1A00E9FD
      12004BFEE2FF3EFECDFFADFEA5FF2EFFADFF48FF79FFC5FF85FF1B0084FF1600
      93FF670092FFCF00B2FFD5009FFF0401ADFF3701AFFF2F01B4FFF700C5FFDB00
      C1FFAD00CEFF9100EAFF3B0006004F001800F0FF5800CAFF4E00D1FF59001E00
      4C00C7FF4700D4FF1A008BFF31006DFF07004EFF0E0067FFEEFF39FF05003DFF
      F5FFFCFE160047FF0D0057FF31005DFF160092FF1A00F2FF1A00CEFF19000300
      09004D001E0031000E006A001000BE002700AE003B009C004C00170153004F01
      4A009F012E0095012400C101F1FF5301F2FF4101BAFF2801AFFF1C0198FF7C00
      ABFF8A0091FF3300C1FFE5FFBCFF98FFC5FFBBFFBDFF3CFFCDFF38FFB0FFEFFE
      D6FFEBFEC2FF83FED9FF96FECDFF98FEEBFFA2FE020076FE2500BBFE39002FFF
      50004EFF5300EBFF3C006A003B0089002300B20005003E01FAFF5201FCFF9901
      DEFFBC01F0FFDB01F7FF8C011900D7011300AD013400D8012100590132006401
      1600D2003F0089002800F9FF2200E3FF1D0022FF4800CAFE3C006DFE630000FE
      7300B1FD6B00C6FD4D00ABFD4F0097FD230051FD01006BFDE1FF5EFDC3FF4FFD
      A8FF74FD8AFF83FD90FF82FD89FF97FD91FF55FE90FF55FEAAFFE9FE8DFF54FF
      9AFFDEFF9BFFFDFFA6FFAA0090FFF900B7FF8401AAFFCB01CDFF5C02E1FF5D02
      1F00BA02240012034D00D5034800C8035200F7033C0003043B00ED0329009403
      12009503FBFF1F0309005F020C000B021A009F013900F70042006B003C003200
      42007DFF4D00F9FE32006CFE46003AFE2F0078FD32005FFD200010FD3D00BDFC
      3C004BFC5600BCFC4900CFFC5B0019FD430072FD3000FEFD0B00F7FDF9FF99FE
      AEFFF8FEA8FF76FF88FF80FF76FF000068FF330085FF5D0089FFB6009BFF2301
      A6FF4F01A5FF2601ADFF6E01ABFF4301BEFF1801C2FF2401BFFF3201CEFF9D00
      070077001800560042001B005900D4FF6B0039005D00F5FF7A00EDFF5500B7FF
      4E0009002900A4FF1D00AFFF020075FF030053FFF2FFF3FE100022FF0B004AFF
      1C004BFF230047FF22008AFF13007EFF1D0093FF0500CBFFFCFF0C0005001D00
      FEFF29000E00760025005600380096003B00D3004E005C013700300136008401
      13009601F8FFBC01D5FF8001BBFFAC018EFF21019CFFD1008EFF7B00A2FF8700
      AFFFE6FFC1FFF1FFAFFFA3FFCDFF73FFC4FF10FFCCFF14FFCBFFDFFEC8FFBCFE
      CAFFA8FEE3FF9AFEF0FF5DFE120053FE2E00BEFE350007FF4E0046FF5600A3FF
      4B0037003B004C002800F600FDFF2D01F7FF7301D8FF2C01DAFF9D01DDFF6301
      F2FF8A01FDFF5F012500A60116003A012D001D012F00C5002900B4001A000300
      2D00000013007DFF2C00E1FE430060FE54004EFE6100CDFD70009EFD6800B7FD
      640078FD540085FD3100A3FD1800E3FDE8FFBDFDBEFFE3FDA6FFB7FD90FFEFFD
      7EFFD8FD97FF57FE8DFF96FEA0FF1DFF9FFF1AFFABFFD5FF9DFFE6FFA8FF9300
      89FFCC0098FF76019AFF9701B3FF0C02CEFF3C02F3FFAD020700CE0232002B03
      420078034B00A1035400B50343001A042A0004042900AF030D008B03F7FFDB02
      0A0050020700D60121007C013500930048006A003E0086FF5B002EFF45006EFE
      4E0039FE3B008FFD30006DFD2300B2FC3900ADFC2E0031FC420033FC420040FC
      48009AFC42006FFC3F0016FD1F008BFD030009FED0FF9EFEABFF23FF8BFF57FF
      60FF98FF5BFF1F005FFF5D0064FFB30076FFCB009DFF4F0192FF3301ADFF7501
      B0FF7C01B7FFB701B2FF4201C7FFAF01C1FF3001F7FFF0000300A3002E00B700
      4E0007006B0052006A00FBFF9000F0FF7D00070072004D0067001A004D002A00
      2000C3FF190090FF070080FF030041FF160056FF1A004CFF320031FF310025FF
      33007BFF23002CFF1A00A7FFF4FF8BFFFEFFC5FFEAFF99FFF7FF1A00FDFFDCFF
      17005D001500340037009700240093002F001C0116004B010500D001E3FFA401
      D1FFEE0199FF920197FF43018BFF230185FFFE00A2FF7B00B3FF7B00B1FF4200
      D0FFA5FFDDFFBAFFCDFF58FFDDFF2DFFD7FFFCFECFFFFAFED2FF57FEF0FFBFFE
      F1FF5AFE1C0096FE23008CFE4D00D1FE4B00ABFE520082FF4500B9FF40006B00
      0D0093000C00F100EDFFE500D2FF3E01C7FF2B01E4FF7D01E1FF3F0103003F01
      0E003E012700F9002500CC002B00A5002E0061002700FBFF1600F0FF22002FFF
      3B0009FF2E0089FE540052FE6400D1FD6100DCFD65004EFD6F00C1FD4B00C9FD
      42002BFE1E003AFEFBFF76FECBFF00FEB5FFA0FE8CFF79FE9FFFC2FE92FFF0FE
      A8FF4CFFB2FF34FFBAFFDCFFAFFF1900BBFF5D009FFFD400A1FF28019FFF7B01
      9FFFB301AEFF1602CBFF4D02E3FF9402060090022000F0022F00E30243004E03
      3B009E034100E10336008C031C00B4030500F8021000CA02F5FF27020A00D901
      1E00F7003500C2003D00E4FF5F008CFF5100DDFE5E0059FE4A00D6FD460089FD
      3600D9FC2900A3FC1D0063FC370019FC330023FC380027FC48000AFC3D006AFC
      1E00EEFC1A0072FDF0FF40FEC5FF93FEA2FF1AFF80FF65FF64FFF7FF4DFF3D00
      5AFFE00067FFE20077FF5C0180FF5901ABFFA601A7FFB001B1FFD301C5FF9301
      C9FFC601BEFF6E01E3FF6101F4FF2B011300F200310080005C0071006B000100
      8600060085001800990010008400240070003A00650000004000DDFF2000E0FF
      22008EFF21009FFF180080FF320072FF380039FF2E0047FF2E0030FF260077FF
      0A0054FF00007FFFEEFF83FFEEFF99FFD8FFB4FFEAFF1C00F7FFEBFF05001500
      F9FF1C00180078000700DD00F7FF5501F7FF5D01E5FFA701B1FF9A01A3FF9601
      97FFA2018BFF550187FFF700A5FFE500B6FFA000BFFF6100D2FF3500F0FFABFF
      F0FF82FFDFFF5AFFF7FF1BFFE7FFD7FEDEFFC1FEF5FF64FE140098FE0F0092FE
      350079FE430073FE4E00CDFE460019FF4B00E0FF2F001D001C006B00FBFF9700
      F2FFC700D2FF0201C7FF5501D7FF2201EBFF3901ECFF41010900FB001C000901
      1700CC002C005200330022002200F9FF180074FF240051FF2300DFFE3A006FFE
      460037FE6100EFFD5500A1FD6700DAFD6700B9FD63000BFE340049FE2A005FFE
      FAFF76FED6FFBDFEBEFFAFFEB8FF1DFF9FFF60FFAFFF7BFFB2FFCFFFB8FF0600
      B8FF1E00B5FF8E00B1FFD300B0FFF600A2FF4F01A1FF7B01A9FFC8019FFF0D02
      BFFF2502DCFF4202F4FF9102FDFF55022300CC0223000A033700FD0230001103
      340034030E00B9020D00BA0201005B021400DC01090069012900E90033005600
      4400F1FF4D0033FF65008DFE5A004BFE550098FD45003DFD3900EFFC2C007DFC
      28003DFC2C0040FC2F00F5FB2B0015FC29002FFC300075FC0F00F1FC0500ABFD
      E4FFFAFDC6FFBFFE94FF06FF8AFF9DFF59FF120056FF810058FFE1006AFF7801
      6CFF7E0186FFC10195FF0602ABFFDC01B6FFEC01D2FF0702C7FFB401D2FF9701
      DEFF8B0101001D011300EB00360087005500410067002200860022009300E4FF
      A20037008B00E3FF7E00EFFF6100FBFF5300DCFF380097FF3A00CBFF3400A7FF
      3400B8FF3300B5FF4200A4FF2B0065FF2E006EFF1C006EFF150097FFF7FF6CFF
      F0FF6DFFD8FFA1FFD4FF82FFD3FFBEFFDCFFF0FFE5FFE8FFE4FFE6FFEFFF7F00
      EFFFA500EDFFF000DCFF2801CBFF4101ABFF3D019DFF8E018DFF610197FF6601
      9AFF1201AFFF0F01B8FFEB00D1FFC000D6FF3D00F2FF0000F5FFA8FFF8FF65FF
      F1FF5AFFF8FFFEFEF6FFABFE0A008CFE17007DFE1E006AFE2E006FFE3B006CFE
      42009AFE4300CFFE42006CFF2800B2FF1E00F7FF00001100EFFF8800D2FF8700
      D6FFDE00CCFF2401E7FF1B01EAFFFA00FDFF2601FCFFE4001A00A6001D007A00
      290029001B00E8FF1D009EFF1A0062FF2C00F5FE380097FE41001FFE470025FE
      5300F0FD610005FE6100FDFD62004AFE42004BFE2E00ABFE0000B5FEF5FFF2FE
      D5FF01FFCCFF80FFB5FFD4FFCCFF2F00B7FF5500C5FFA600B9FFA600C5FFD800
      ACFF4301C1FF4701B0FF7D01ADFF9D019FFFCA01B3FFBD01B2FF1E02C8FFED01
      E4FF1602F6FF100206004D021C004E022D008D0222003D0224007C020D001402
      09000F02FAFFB90116009A011000DD003000D700290052005200C6FF45003AFF
      5F00BFFE4E0033FE5B00B6FD360078FD4400FBFC3500A7FC34004EFC230078FC
      330015FC1C002DFC1F005CFC1B00B4FC0E00A9FCF1FFCBFDDEFFE9FDCCFFA0FE
      9BFFFCFE86FFC5FF64FFCBFF62FFC7004FFF15017BFFA70172FFBA0188FF0002
      8BFF1702B5FF4B02ACFF0502D6FF3702CAFF0502E7FF9901EAFFB9011A006801
      1F00D0004B0074004D007D007400DEFF89001E009A00D3FF9B00EAFF9B008AFF
      8700FFFF7100A1FF6900D3FF47005BFF4600F3FF3900A2FF4200F5FF2E00D8FF
      3700EFFF1C0054FF2500E2FF0500A5FF1000A3FFEDFFB8FFECFFB0FFCBFF7BFF
      D4FFAFFFB6FFD1FFCDFFB2FFCAFFECFFD7FFC5FFD5FF4200E3FF7D00D5FFB700
      D9FFBC00C7FF4901ADFFBC00A5FF6D0194FF4E019FFF5D01AEFFE800BDFF8201
      B8FFD300DFFF0901DDFF8500F1FF5C00F7FFB2FF0600BEFFF6FF54FF120041FF
      0B00AFFE1F00B0FE17007CFE2E0056FE2F0060FE3D005BFE39004AFE490081FE
      37000DFF2B0007FF2900BAFF060099FFECFF1000D7FF2E00D3FFBF00CAFFA400
      E6FF4001E3FFC600F0FF1801EAFFF6000200FE0008005D001500AC000200E9FF
      2300FBFF1800C5FF29006AFF3B00C3FE4500C7FE35006AFE56005BFE5E006BFE
      570053FE5D006CFE4D0096FE3800E5FE1C0009FF100048FFE9FF50FFE2FFF2FF
      CEFF0D00DFFFA600C5FF9300C6FFFA00BEFFD000C7FF5E01AEFF2101C8FFA001
      B2FF5A01B4FF9A01ACFF9D01BBFFA801AEFF7201CAFFC601D4FF6E01EFFF7901
      F6FFBB010500CC011E0094011900E0011600B9011100710110009D01F7FF5501
      1D0020011900BF002200A500250035004400100030004FFF4E0015FF42006AFE
      4D0011FE3700A2FD4A007DFD3800E5FC3800CDFC22008FFC2E0093FC1C0068FC
      1600AAFC1200C5FC0A0014FDF7FF79FDE8FF23FED7FF89FEAAFFF6FE94FF9FFF
      70FFFBFF71FF820063FF37017AFF900177FFB7018BFF400282FF4302ABFF5202
      AAFF5002C1FF4002CAFFDA01F2FFE401F0FFB3011F0068012D00F30042008C00
      4E005400740038008100F7FF9200DFFF9D00BAFF9E008DFF9400A6FF7E00C9FF
      7500AFFF560092FF5500C5FF4200D8FF4900E9FF2D00F5FF31000A001700BAFF
      1B00C7FFFFFFDCFF0200C5FFE9FFA3FFE7FFBEFFCBFFABFFCCFF7CFFB9FFC2FF
      BBFF9EFFBEFF99FFC8FFC2FFBDFF0100C4FF2200CDFF7B00C6FF8A00C3FFCB00
      B4FFEF00ADFF24019FFF3A01B6FF5501B2FFFB00BEFF3701BCFF3901DCFF1E01
      D7FFCC00F0FF8900F4FF13000800BEFF0400A9FF210055FF2000F2FE25008CFE
      23007DFE2F003AFE34003EFE380034FE3D0036FE410030FE3A00B7FE2F00CAFE
      2E003EFF0C0070FFF2FFC8FFD9FFC5FFDCFF7400C8FF7400DFFFC300D9FFE300
      DFFF1001D4FF0401ECFF0801EBFFA400F9FF6700FCFF5500110006001800F1FF
      240099FF33001CFF3500C4FE3400DFFE4400ABFE5500B7FE52008BFE5800C2FE
      4F00B1FE490034FF2C0054FF1F00A8FFFDFF91FFFBFF1E00E0FF5400F0FFB200
      D6FFED00D2FF2901C6FF1B01C9FF5901B8FF5501C1FF6A01C1FF7401B6FF6E01
      B7FF6801BDFF5901BDFF3F01C6FF1E01D9FF5B01DEFF0901E6FF3E01F0FF3901
      0C003C0106001001110080010900360110004501FBFF1D011E00050115008000
      1A0098001800500032001600250097FF340043FF3A00B1FE41002EFE3B00FDFD
      4400ABFD420040FD3200CBFC3000BEFC2E0077FC29009DFC0F0096FC1700CEFC
      0500DAFCFBFF78FDE5FFDCFDE7FFA7FEB0FFCCFEA3FF86FF80FFC7FF82FF6800
      6CFFD20081FF970176FFAF017EFF1D0279FF7F0294FF5E02A0FF4A02B6FF4E02
      CDFF2F02E7FFD201FCFFDF01180077013500F9003A009C005400B30061003800
      7E002C008400D2FFA200F2FF960081FFA400FAFF8300C5FF8600E7FF5C0086FF
      6300DAFF4900C4FF5200FDFF34000E002F001D001900F2FF1000D6FFFEFFE2FF
      FDFFD1FFECFFA7FFDFFF8BFFD7FF96FFCEFF38FFC8FF7DFFBFFF75FFC3FFA0FF
      B5FF5DFFB9FFFDFFB1FFC5FFCAFF3600B8FF4C00C7FFDE00B1FFAC00B7FF3C01
      A2FF3001BEFF5501B2FF1501BEFF7E01BAFF5501D2FF5901D5FF1D01EAFFC200
      F4FF530007000B000D00E1FF1D0059FF2D0015FF2D0075FE350072FE3C0017FE
      470039FE3500CDFD440002FE3800ACFD400059FE2F006BFE3500FCFE0900D3FE
      020078FFE6FF60FFE5FF0800CFFF2800D8FF9E00CAFFAA00C9FF1701C6FF1D01
      D1FF0901DAFFDA00E8FFB900F8FFB20004005E00190061002700DDFF3500AAFF
      34005BFF40008CFF3B0010FF55004EFF5000DFFE620061FF53003CFF5600BFFF
      35008EFF33001C001100CBFF0B005D00FBFF7C00F8FFD200E2FFD700DAFF4901
      D2FF3001C4FF3C01C0FF4C01C5FF4301C2FF2701C0FF0901CAFFEB00CBFFB100
      CDFFC600CAFF9100D9FFD300CDFF5F00E2FFC200DFFF7A00FCFFD600F9FF8A00
      0A001D010000BF0009001201FEFFD8000C00F1000C0086000B00B9000C006B00
      1A0075002000F8FF2600B2FF320050FF3100DBFE380062FE400023FE4800A7FD
      3B0029FD430046FD3500DAFC3100E8FC1C00C2FC220017FD0500DBFC0300A8FD
      F2FFCEFDE5FF7BFEC2FF98FEB8FF53FF9AFF8AFF8BFF2E007EFF7E007FFF4D01
      75FF710177FFF30180FF2A0283FF480296FF1002ACFF4A02CAFF1702DFFFD001
      0200BA011A007201340033013900C5005100C2005C00520074004D007F00F8FF
      99004E008A00E8FF8F00F7FF8D000000890034006900C8FF6A001E0059000200
      450008004100210032006B00180012000300FFFF0300FFFFF3FFF1FFF0FFB2FF
      EDFF7EFFE9FF60FFDDFF28FFD8FF43FFC2FF55FFBEFF5EFFB2FF1CFFB8FF99FF
      AEFFABFFB9FFEDFFB2FF1700B7FF8500B3FF8900B8FF0401B2FF2301B1FF2701
      B2FF1901B5FF4B01C5FF6D01CFFF7001D6FF3801E0FFFF00EDFFA400F5FF3800
      1100F0FF230092FF2E00E8FE3B00A3FE490085FE3E0008FE4800FFFD4200D7FD
      3E00C9FD3700B0FD38002FFE260044FE250080FE1A00D5FE05000FFFF8FF55FF
      E1FF96FFD0FF0A00D0FF4D00CDFFA800C1FFFE00C4FF2201C0FF1501C5FF0901
      D7FFFA00F3FFD5000000B5001400950023003F0033001C003200D7FF3F00CBFF
      4600AAFF49009EFF4D0092FF5600BDFF4B00DDFF4A00CFFF4E002F0039002800
      29003E001A005B000B009C00FFFFA800FDFFFE00E1FF0A01D8FF1E01C5FFFE00
      BEFF0001C6FFD500CFFFD800C7FF6B00D7FF4D00D6FF2C00CAFF2200CBFF0500
      D1FF0B00C8FF0600D5FF0300D7FF3200DBFF4500E5FF6500F0FF7E00FCFFDE00
      FBFFD100FBFFE300F7FFAB000600D300030099001A00EC001200970016008000
      14000A002200E9FF23003CFF3B00F1FE42006EFE4C00F0FD4D00AAFD480083FD
      3F0026FD3B000FFD1E0001FD1F000DFD0E0036FDF5FF7AFDF6FFE0FDEFFF37FE
      D2FFD0FEC0FFF0FEB8FF8AFF88FF9CFF90FF64008CFFC70088FF68017AFF8301
      85FFF8017AFFF80192FF1702A2FFFE01C7FF0702DDFFB701FBFFA80111005901
      380049013200D3005500CC005C009C00670077006C0075007E0069007F006800
      8900420094008A00800035007900400061001C00620047005300320046007100
      2C00400020004800FAFF030004000000F9FFC2FFF3FFB2FFEAFF2FFFFBFF21FF
      D6FFDDFEDFFFE1FECCFFE8FEC3FFF0FEB2FFE9FEB8FF22FFA1FF64FFAAFF91FF
      AAFFFAFFACFF3900B8FF8A00AFFFC500ABFFF700B2FFEF00B9FF1C01BEFF4501
      D3FF8901C3FF5401CDFF6001CEFF2301E1FFC900EFFF670013002B0014008AFF
      330003FF3500E2FE490082FE42002FFE480016FE3400E2FD3D00C7FD2900E4FD
      2F000DFE2C005FFE23008CFE1B00E4FE10000AFFF6FF54FFE6FF5BFFE6FFE7FF
      D5FF3800DBFF7B00CAFFDE00BEFFFD00BDFF1401CDFF1401D1FF2101F2FFDA00
      FCFFD00014009300260071003E002A003B002E00510008004100FFFF4800E0FF
      46002B00480008004C00540052006300480078003B0050002F0093001C008B00
      1A0096000E00DF00FAFFD300E5FFDB00D2FFDA00C8FFE900C8FFAF00C2FF9E00
      C8FF3C00C8FF1700CDFFB2FFD1FFA6FFDAFF6DFFCBFF99FFD2FF43FFCFFFB7FF
      C2FF85FFCBFFCFFFD3FFDDFFD8FF5200E5FF4C00F2FFAC00ECFFB200F5FFCC00
      FDFFB8000600D5001600F3001300DB001100CD001100B2000E0089001A000400
      2F00E6FF340027FF3E00C6FE4D0031FE52003EFE510097FD5200BAFD3B003DFD
      2B006BFD160039FD110099FD030099FDFBFF31FEEAFF4FFEDFFFDDFEBFFF05FF
      B5FF67FFA5FF9BFF98FF280094FF830092FFF4007CFF5B0179FF6A0185FFDE01
      89FFC001A6FFEC01BCFF9C01D7FFBD01F1FF3E011E0071012E0000014A002701
      4800BA005B00EF005D0095006B00EF006D0094008900EF008000AC008B00CC00
      8000870072009E0066006B006B00730058006200450048002F005B0015001100
      100023000100CCFF0000B3FFEDFF1BFFEEFF26FFE4FF85FEF7FFA6FEDCFF59FE
      DFFFABFEC5FF5BFEBEFFF2FEA6FFBFFEB3FF63FF9BFF58FFABFFF9FFA6FF0900
      AEFF8B00A8FF9800B3FF0701B1FF0801C0FF2D01C8FF6E01C5FF7201C9FF6F01
      C0FF5701D1FF6201D8FFD200F7FFBB00FCFFFBFF1F00C4FF1A00F4FE47001CFF
      43006EFE540086FE3A00F2FD49003CFE2500D2FD3A0039FE2B0018FE300085FE
      1B0076FE1D0005FF0900F9FE03004EFFF2FF6AFFEBFFCBFFEAFF0900D3FF5F00
      D0FFBC00C1FFC400C6FF1B01C0FFE400E6FF2B01D9FFB1000100E80009006600
      3A00B0002F002F00570091003B0026004E007200370038005000B00039005B00
      4E00CD0048008E004E00CC00330084003000E5002600AD001A00C5001200C200
      FDFFBE00E6FFC700CDFF8E00DAFFAB00C1FF3400CDFF4200B7FF9FFFD1FFAAFF
      C1FF17FFE7FF2FFFCFFFBEFEE5FF1FFFC3FFD7FED8FF5CFFBEFF35FFCDFFC7FF
      BBFF94FFDDFF3B00D7FF2400E7FFA600EAFF9700FAFFF900F6FFE5000D001301
      16002B0105001D0109000F010C00EC001600D8000F00540034002500220062FF
      420017FF3E0073FE62007CFE4900D5FD5D00F1FD3B007CFD3E00CCFD150089FD
      1E0005FEFDFFCAFD010045FEE6FF46FEE5FFE0FEC7FFF6FEC1FF54FFB1FF74FF
      A8FF10009EFF49008EFFB20084FF15017AFF360183FF6A0185FF8701A4FFA301
      A5FF4101D2FF6E01EDFF10011A0036012200D8004E0019013D00BE0056000C01
      5B00EA00650034015B00D500800017017A00DE008300ED007E00B2007A00EA00
      67008F007100A2005E00910047006D002F0045001A0021001600EEFF02008EFF
      FBFF72FFE9FFF2FEEEFFD0FEE9FF63FEF7FF5BFEE2FF23FEDEFF45FECAFF40FE
      C2FFCFFEAEFFD0FEA5FF54FF93FF73FFA3FFE4FFA1FFF7FFA5FFA200ABFFB400
      B2FFFA00ACFF2D01C7FF6801BFFF7B01BDFF9801C3FF8A01C4FF6801C6FF4501
      DFFFF000EBFF9A00F8FFF7FF150091FF230024FF3600E0FE4A005BFE4E0063FE
      4E0001FE4B002FFE3A0028FE35004DFE2F0027FE2A007BFE250086FE1C00DBFE
      100009FF0B0030FFFCFF6AFFF3FFD0FFE6FF1400D5FF6100CFFFA300C9FFBF00
      B8FFF200C5FFEB00D1FFF000D8FFD100F6FFD900140091001900BE0039006D00
      4500820048009E004900D9004900D5003600FE004600DC004200EF004C00F000
      4700E3003B00D7002E00DA002E00C2001F00D6001200D10004009800E7FF8D00
      DDFF3C00D2FF1700C5FFC2FFBFFF8AFFC3FF23FFC7FF13FFD4FF98FED0FF8BFE
      DBFF59FEDAFF68FEDBFF8BFED2FF18FFD2FF29FFB3FF8CFFC5FFBFFFCFFF0200
      D7FF5500DEFFB800EFFFD200E4FF0801FAFF4101030061010300A20103006E01
      04006B01FDFF31010900FA000D0093001A004E002B0095FF340059FF4000DAFE
      4B007BFE530002FE5400FAFD5B00B0FD3E00F9FD2D00F2FD1600FCFD0F0008FE
      FEFF44FEF8FF73FEE4FFBDFEDAFFD0FEBCFF0BFFBDFF73FFACFFB8FF9EFF2E00
      92FF7D0091FFA30071FFCA0079FF300186FFFA0093FF2601ACFF1201D2FF1F01
      E3FFE50004000F012700CB004000FE00550007015D0062015C006A015E006501
      6C005D01760074018A003C017D003A0181002B017500EB007400EB006C00FA00
      6800CA004A009000380062001B00DBFF1500BEFFFCFF48FFFCFF0CFFF2FFB5FE
      F7FF7FFEE4FF0AFEF0FF0AFEE8FFC6FDE0FFE8FDDCFF30FED0FF84FEAAFFC7FE
      9FFF48FFA1FF6DFF9AFFCDFFA3FF3200A5FF7400A0FFB1009DFF0001ACFF4701
      ADFF8001BBFFA701B1FF9701B9FF9E01B0FF4101C2FF1701CAFFC900F0FF6E00
      F5FFF0FF1000C6FF18002EFF3600CBFE48007AFE630059FE61003CFE60006CFE
      48005FFE480085FE420090FE3A00B3FE390002FF2F00FBFE1A00FFFE11005AFF
      1000A7FFF1FFD1FFF5FF5400E0FF5B00D1FF7800B5FFB100C2FFDD00B5FFA700
      D2FFD100D7FFBE00F1FFCD00F1FFA80017009C00260077004A0093004200BA00
      4E001D0139001D013E001801400046014C003D0143001F013B0010013500F200
      2A00B2002A00DA002200C7001F00B200FFFF5D00EBFF3600D5FFD3FFD7FF9DFF
      BBFF32FFD5FF1AFFC9FFB4FED2FF79FECAFF4CFEEAFF23FED9FFE0FDF1FF49FE
      E6FF85FEE2FFCAFECAFF48FFD1FFB3FFC8FFE6FFD9FF4200DAFFAD00DDFFB500
      DBFF2201E4FF4B01F0FFA501F7FFB801FBFFE301F0FFBB01F7FFB301E6FF4401
      FDFF100100009E001A003E001200C8FF330089FF2E00E8FE4C0092FE500030FE
      680006FE4F0006FE4E0014FE320020FE2E0039FE150057FE160069FE0300B8FE
      EBFF96FED9FFE1FED5FF0FFFC1FF6DFFB2FFB0FFAFFF2F0093FF1A0087FF6B00
      78FF8A0085FFB20080FFA700A5FFE100A7FFBD00CBFFFA00D9FFE3000700D300
      2100DA004700F50042001A0160007D015700A101670098016C00D2017B00A801
      6D009D0174006B0174006E016D00110174002D016D00E5006000EC0045005D00
      350037001600C2FF160075FFFCFFEAFE0700F8FEF2FF5CFEF7FF1DFEEEFFEEFD
      FEFFBCFDE8FF85FDF6FFEEFDDDFF16FECEFF68FEB7FFF7FEB8FF47FF9FFFB9FF
      A2FF000099FF560093FF710095FFF40098FFFE00A9FF8F01A8FF7F01A8FF9D01
      A5FF9601B0FFA7019FFF1801BFFF2201C7FF8900DDFF4600E6FFDEFF1400B8FF
      16000DFF4200D6FE510079FE67007AFE610072FE670088FE5500BDFE6000C4FE
      4D00DBFE49001BFF430026FF2C0000FF230073FF240079FF1300C3FFFEFF0400
      FAFF6100D6FF2800D0FF9C00BFFF6E00C4FF9E00B6FF7A00CFFFAC00C9FF7A00
      EFFFBF00F0FF770015009B0022008400350092002F00D1004400230131001C01
      3A0058013B005C0135003E012C003C012E0016012400EE002700BE002B00CA00
      1C007B0016007D00F8FFF4FFEDFFE4FFE4FF5DFFE0FF35FFC8FFCDFEE7FFBFFE
      CEFF3AFEDCFF4BFEECFFF7FDF9FFE5FDE1FFF3FDFEFF47FEEBFF6DFEEAFF15FF
      E1FF62FFE4FFE2FFD2FF5800D3FFB100CAFFF100D4FF3701D1FF6E01D5FF9101
      EAFFF201E9FFCF01DEFFF801E5FFC601E7FF9501DAFF3701F5FF1501F1FF6E00
      020037000900AFFF290063FF3500C9FE510094FE4A001EFE610029FE51000EFE
      4E0044FE430044FE3B0062FE17007FFE1E00ABFE0300AAFEEAFFCAFEE6FFF0FE
      DEFFFEFEC4FF65FFC3FF9AFFACFFE2FF96FFF7FF93FF2A0086FF10008BFF7C00
      8CFF6A009CFFA800ADFF9600D7FFBB00DEFFA6000E00F0001D00DE0033001C01
      420051015A009A015000C801660001026400F2016700FB016100DD016A00AE01
      66007F0173003E0161001F016700E2005200AF003A0032003400EAFF270046FF
      0E0022FF0800B1FE0D007BFEF7FF03FE0500E3FDFFFF83FDFBFF9EFDF0FF84FD
      F0FFD7FDDDFF18FEDDFF89FEBEFFDDFEB8FF7AFFA4FFCBFF99FF430087FF9F00
      95FFBD0081FF090193FF430195FF820199FF8C0195FFA7019EFF640199FF5401
      ABFF0401B2FFE300BFFF7D00D7FF3C00F0FFC0FF0F0097FF300004FF4100E5FE
      5100B7FE6B00B9FE6800A6FE7800E5FE6D00E3FE680010FF590047FF5E0069FF
      3C0081FF400073FF29008CFF2100B7FF1200DDFF0B000300EAFF3F00E9FF0E00
      CBFF3B00C8FF3200BEFF5500BEFF3C00BDFF9100D7FF3800E4FF6100F5FF4900
      06006E00100071002500BF002D00C7002F0018012F0033012F00560124008801
      2F006F011C00580120003E011C00F1002300BD001400CB001E006F0000002A00
      0400CFFFF0FF75FFF0FF07FFE3FF00FFEAFF85FEE1FF6DFEF8FF0EFEF4FF03FE
      F8FFCCFDFCFFEFFD0100E6FDFDFF79FE0800ABFE000028FFEAFFA2FFE8FF1000
      D7FF8200D3FF2001CAFF4901CDFF7501C3FFAF01D1FFB801C9FF0802DCFF1B02
      CBFFE601D5FF9501CCFF7301DDFF0701D7FFFB00F7FF6B00F3FF0900140091FF
      230041FF3A00B7FE3B00BDFE540052FE540055FE610059FE5B0062FE4C0060FE
      3F00ADFE2E00AEFE2200E3FE100012FFFDFF02FFE1FF15FFE4FF4EFFCBFF59FF
      C5FF9FFFB1FFC9FFAEFFB2FF8CFFDEFF9EFFDFFF89FF18009CFF4600A2FF6700
      C7FF4300D1FF9500F0FF7300FBFFB9001E00FC00300033014B0048014F00A301
      5600C3015800000263002B0260001602600006026100D00156007B0161007201
      570023015600C50041008A004400FDFF230084FF290045FF1100EDFE160076FE
      09004FFE1600E3FD0300ABFD09009AFDF5FF88FDFAFFA5FDF2FF0FFEF0FF48FE
      D6FFB3FECBFF1BFFB0FF78FFA5FF14009DFF92008DFFB70084FFF90080FF2D01
      84FF410182FF98018FFF9F0187FF600195FF2D018CFF0D01AAFFD100AFFFA600
      CBFF4900DEFFF2FF0900A1FF10004EFF350025FF4400FCFE6000DDFE6E00F3FE
      880010FF7F00F6FE7F0036FF740058FF6B008EFF6100C7FF5200ECFF3D00C1FF
      2A00E0FF2100FFFF0C00100008002900E7FF2200E0FF1000C9FF1900C3FF0D00
      B2FF2600C5FF3500C0FF1300D9FF1B00DEFF3200F0FF2200F1FF3A0010009B00
      1A0093002900D1002200F0002900160129002E0125007D0128005D0123004F01
      1A001A011300D9002000AF0010009E00140038000700E3FF070077FFF4FF22FF
      FCFFE6FEEBFFABFEFBFF59FEF6FF1FFE0A0004FEFFFFCEFD0700FCFDFEFFEEFD
      110053FE0B0098FE12001FFF030060FFF2FFF6FFE4FF4900DFFFFB00D7FF5101
      CBFFA601C3FFBD01B9FFEF01C2FFF801BEFF4A02C6FF1702BCFFC701C4FF8901
      BDFF3301D3FFEB00D1FFB000F0FF4200F7FFAFFF160086FF1A00EFFE3800D7FE
      3800ABFE560096FE580060FE6A00ADFE5B005FFE5500ABFE4200CAFE3C000AFF
      2A00FEFE1A0069FF05001FFFEAFF51FFE2FF6BFFD1FF8BFFC6FF7FFFB1FFA6FF
      A9FF93FF92FF9BFF98FFBEFF8CFFDBFFA5FF0600AFFFF7FFC7FF2E00CFFF3700
      F2FF7600F5FF90001C0023012C00080141007C013F0074015400D9015100E301
      5D004E025900FD015B0030025600B10151009E01510062015300390148009200
      3E0067003A00ACFF24004EFF230023FF1A00B6FE180034FE11001EFE1C00DCFD
      080078FD0F00C9FDFEFF97FD0300E4FDF7FF2FFEF1FFAEFED3FFB2FECEFF76FF
      AFFFA3FFA7FF5F009FFF88008DFFF7007DFFF70080FF650174FF4A017CFFB001
      82FF5B017EFF430180FFF00090FFE5009FFF9300B5FF7A00CFFF1100E1FFD1FF
      05008CFF190038FF380048FF4F002DFF65002CFF730039FF8D006DFF820029FF
      8300B3FF7D00B3FF7400E6FF6700F7FF600042004200E1FF33004B001D001F00
      10003B0001001400ECFF2300D1FFC0FFCBFF0100BCFFC8FFB7FFE4FFC5FFDCFF
      C3FFC3FFC5FFBEFFDEFFF8FFE4FFFAFFF0FF21000500730009006A001100A100
      1C00C0001A00F8001D0004011F00500116002B011D0033011600C7000B00E200
      1100940011007200080009000E00B9FF030013FFFBFF0DFF0100D0FE03007DFE
      020041FE0D0036FE0B00DCFD17001CFE160034FE18004FFE1A009DFE1A000CFF
      09005EFF0D00D1FFF6FF4B00E9FFAA00E6FF4401DDFF7401C3FFC001C5FFF101
      B6FF1B02B3FF2302BBFF4902B3FFE401ADFF8E01B3FF4801B8FFFD00C3FFA800
      DBFF7E00DCFFE9FFF5FF9BFF070025FF1C0006FF2E00C5FE4500C9FE4200ABFE
      5B00A6FE5B008CFE5B00BAFE4D00D4FE4D00F0FE37001FFF34003DFF1B0034FF
      0B0065FFF2FF79FFE6FF80FFD7FF98FFCBFF8FFFB3FF79FFA9FF69FFA2FF8BFF
      9FFF99FFAAFFD1FFACFFBCFFB6FFDDFFC2FFEFFFE0FF4200EDFF7F000B00DF00
      1000DC002800360132004A014600AA014000B601560007024A00EE0156000702
      5500CE015100BD014200670150005C0145000301420093003700FAFF2E00A6FF
      240022FF2800E2FE1E00A4FE160027FE1700F3FD0F00D9FD1800DBFD1000CAFD
      0B0028FEF8FF02FEFBFF7EFEE4FFB1FEE1FF30FFC5FF5CFFBBFF1C00A6FF2D00
      A7FFB2008BFFC5008BFF340179FF3F0183FF9D017AFF5E0186FF63017DFFE500
      89FFE50091FF9E00AEFF8D00BAFF3E00CBFF0300E8FFC5FF03008FFF220086FF
      400061FF570095FF5B0061FF7A008EFF800087FF8A00CAFF8000AAFF83003800
      6C00E5FF76004D005B001B0050006A00340022002D009900100012000E002E00
      E4FFD7FFDAFFDCFFCBFF9FFFCAFFE9FFBEFF97FFC5FFABFFB9FF92FFC6FFABFF
      D9FFCFFFE2FF0300E9FF1F00F0FF2100FCFF6600030061001000C4000C009700
      1000FA000A00B200190004011000A2001200D7000A005A001600A90009001800
      19000800040051FF090047FF0400B4FE1200F6FE03006BFE120070FE090035FE
      18006CFE210069FE2400C4FE1B00CFFE210012FF170083FF1600CCFF0C004800
      FBFF8700EEFF0401E9FF2A01DBFFB901CCFF9D01C7FF1602B8FFF901BAFF4B02
      B4FFDA01B6FFEE01AAFF2A01B5FF3001B5FF9400C8FFA000C7FFE9FFDDFFE2FF
      E1FF59FF030058FF1300EDFE2B0017FF2F00CBFE4700E8FE4300C3FE5700DBFE
      5500D3FE4F00E9FE3B000BFF470017FF320054FF280043FF18008EFF060082FF
      F2FFB2FFEBFF80FFD7FFA3FFC5FF4EFFBCFF99FFB2FF56FFB5FFB7FFB3FF87FF
      B6FFEFFFB6FFB1FFCEFF3500DBFF3600F2FFBD00F7FFAC000E00180113000F01
      33006C01310078013E00B001340091014B00BB014100A0015100930148006D01
      49004B013E000B015000C70037006B003600C6FF2F0085FF2C00F6FE2000CEFE
      24006FFE13005EFE0F00EFFD18003EFE120006FE0C003DFE020046FEFCFFB0FE
      F0FFA2FEF0FF46FFD3FF5BFFD1FFC8FFB4FFF7FFB8FF77009FFF7200A4FFF100
      8AFF050194FF6B0182FF550195FF740182FF2C0193FFED0092FFB200A5FF8A00
      A5FF4700C5FF0A00C7FFF7FFE6FFC0FF0500C4FF1F00A7FF2E00ABFF5100B0FF
      5B00DDFF6700B2FF8100F6FF7A00CAFF7A00EBFF7600FBFF7A0041006700FBFF
      6C006B004B003B0046005B002700380020005F00FFFFDFFFFCFFF1FFD7FFADFF
      DBFF94FFC2FF7DFFC7FF92FFB2FF62FFBFFF79FFB9FF91FFCAFFC5FFC9FFE7FF
      DCFF1600DEFF2D00ECFF4100FCFF5F00FBFF7400FBFF7B0004006B000A009300
      08006A001B009800100068001300670016002B001E0033000B00ADFF1D0093FF
      0D001AFF1700DDFE1000ABFE1800C1FE090079FE1B00ACFE1400A0FE2200D6FE
      1A00FEFE200073FF16007FFF2200F8FF11002B000A009100F9FFBF00F3FF1A01
      E6FF3A01DFFF7001D7FFB201C6FFDD01BFFF0D02BEFFFA01BEFFEA01B0FF9201
      BBFF4501B1FFE000B7FF8000BDFF1F00CAFFE3FFC6FF86FFE4FF74FFEDFF18FF
      080011FF1200F2FE2E0023FF2E00D8FE480016FF4400EAFE5000FFFE4800E7FE
      45001BFF4200F6FE420043FF300059FF260093FF160087FF0600B8FFF3FFB2FF
      EDFFC5FFDCFF8AFFC8FF84FFC0FF6AFFBEFF81FFBAFF9FFFB3FFADFFC3FFCDFF
      BEFFFDFFCEFF6200E0FF9500F6FFF100F8FFE700140029011900230123005C01
      29003C0138004A0131000E0142005D0142002701490031014200E7004600DD00
      3B0065003D0056002E00BFFF30004EFF2900DDFE2200BDFE1B007FFE180080FE
      0D0046FE080045FE090054FE000083FE0000C9FEFAFFECFEF7FF25FFE5FF61FF
      DDFFBEFFD1FFD2FFCAFF2D00B7FF4200B8FF8C00A6FFCA009FFF34019AFF3301
      9FFF6A0192FF43019DFF510199FFDD009EFFBD00A6FF5500B9FF4400BBFFEDFF
      D1FF0B00DDFFC2FFF7FFAFFF0F00B8FF2900CFFF3E00D4FF520005006000FBFF
      6C00FBFF7800FDFF7800F7FF7400E4FF750009006D0017006100210059004C00
      450035003200490022004B0016003F00F8FFD8FFE8FFB5FFD6FF6CFFCCFF6DFF
      BEFF57FFBCFF61FFB0FF45FFAEFF74FFB5FFA9FFCAFFFEFFCFFF0100DCFF2200
      E2FF1A00E7FF3800F0FF290001003900FDFF0000050017000B00290016004000
      1A002F0022002C001C0011001E001A001A00E6FF1C0099FF1A0030FF1D00F2FE
      1700DDFE1D00FBFE1900E9FE1200D3FE180010FF180031FF16007DFF1D00D2FF
      2000140012001A00120089000900BF000300D200F8FFF400F6FF4A01E1FF3C01
      DDFFA701D2FFC001D1FFEC01C5FFB301C7FFE401BDFF8801BCFF3001B2FFA300
      C3FF7300BFFF0600C8FFD7FFCAFF98FFD8FF61FFDDFF06FFFCFF2AFF070025FF
      1A0021FF250024FF340022FF400022FF4C0011FF490019FF4800EDFE48002DFF
      3B0025FF3A0076FF320073FF2000A3FF1100ADFF0D001000F5FFD2FFECFFDEFF
      D9FF8EFFCEFF9BFFC2FF81FFC9FFCBFFB7FF90FFBCFFD2FFB6FFEAFFC9FF5700
      D7FFA100EBFFDD00F1FFD0000300F90008000A011E000A012900FE003000D300
      2E00C9003D00D2004100DB004E00AA004C00BD0047007700410099003D002E00
      3900E6FF350047FF2B0022FF2100B7FE2000DBFE110097FE090072FE03007CFE
      0000C8FEF4FFD3FEFFFF39FFF2FF45FFEFFF67FFE4FFA0FFE2FFE2FFCFFFE7FF
      D0FF1200C1FF3B00C0FF7700B0FFCA00B4FFE700ACFF4B01B1FF4B01A1FF4F01
      ACFF4C01A1FF1E01AAFF8000B1FF8A00C5FF5700BFFF0E00D3FFF4FFDFFFF2FF
      F3FFABFF0800DEFF2100F5FF2F0006003F00090055000E006700130074001A00
      6E00E5FF7600EEFF710005007100E5FF6200150067003800420022003F003800
      260070001D002300F7FF0300F5FFB6FFD2FF8BFFD1FF67FFBEFF56FFBEFF3CFF
      A4FF42FFAAFF41FFA5FF87FFBBFFDAFFB8FFC4FFCAFFE4FFD1FF1300DEFFE7FF
      E6FFF4FFFCFF0A00FBFFBCFF0100BFFF1500EAFF1A00D2FF2500DEFF24000F00
      2C00FCFF1F003100300006002300C9FF310092FF1C004EFF280029FF1A0049FF
      240035FF0B0028FF220078FF0B0092FF1600DEFF12002F002100480007007000
      1900BD000700C2000200E100F9FFE300FBFFFC00EAFF3001E6FF5001DEFF5501
      D5FFAA01D2FF8F01C5FF8501CDFF7F01BDFF1901BCFF8B00B9FF6100CAFF0600
      B5FFA7FFD2FF84FFCCFF32FFDDFF10FFE0FF17FF00001EFFFBFF25FF1C003AFF
      1F001AFF3A003FFF390031FF420004FF3D001CFF4A003AFF3B002BFF450080FF
      3B0092FF2700ADFF2000EDFF19002E0004002000F4FF1700EAFFDFFFCDFFC2FF
      D1FFC1FFC8FFB8FFC8FFCFFFB9FFCAFFBFFFE4FFB8FF1F00D1FF6900D2FF6700
      ECFF9D00F0FF9F00010092000C00A2002500A0001C006100330068003A004900
      4200480047003C004D00560041003B0042005F00430035003A00FDFF38009DFF
      26003FFF1C0010FF180002FF1000EDFE0400DDFE0100D8FEE9FFE4FEEAFF32FF
      F0FF73FFEBFF96FFE4FFACFFE6FFDCFFD2FFECFFD4FF2500D5FF2D00D0FF5100
      C8FF7200C8FFAF00C1FFDA00BEFF1D01BDFF3101BAFF5D01BEFF5401B7FF3E01
      BCFFD300BFFF9900BEFF5200CBFF4200DCFF0000DDFFDAFFEDFFC0FFFDFFB3FF
      0700CEFF2100F9FF3A0002004400F0FF5700F0FF6500E9FF6400DCFF6C00D8FF
      6F00E3FF6D00E1FF6900F3FF6100FFFF4E002800450030002F00660023004600
      08002F00EFFFD9FFD7FFB3FFCEFF73FFBEFF73FFB3FF4EFFAAFF49FF9AFF2DFF
      96FF43FF9FFF6CFFACFFA4FFB3FF99FFC4FFB3FFD0FFA1FFDDFFA1FFE7FFB6FF
      FBFFB6FF040099FF110091FF1D00A6FF2D00AAFF2500E8FF3400090035003000
      3900420032002E003700F0FF2900CCFF25009EFF2400ACFF2300AAFF1900B7FF
      1400A5FF0B00D3FF0900F0FF10004E00110068000E007F0008008D000800BA00
      0300C3000500E800FDFFDE00FAFFE400EEFFF600EDFF2301DFFF3701DFFF5A01
      D2FF5A01D5FF4F01CAFF2801C0FFA600B9FF5A00BFFF0800BAFFCBFFC5FF86FF
      C6FF51FFC7FFFCFECCFFFCFEE4FF0CFFF2FF1FFF03001EFF150027FF200003FF
      2F0031FF360032FF420046FF440045FF47006DFF480073FF4800B3FF3700E4FF
      35001F00290058001E006E0008006700F8FF4600DDFF0D00E1FFFAFFD7FF0700
      CCFFE4FFBFFFD5FFB8FFD9FFB3FFE8FFC3FFFBFFCEFF3000D8FF2800E6FF2300
      F1FF190004003300160018001F0029002A0000003A00F7FF3B00DDFF4900F7FF
      4C0012004B002900470046004D0053003B0022003400E6FF2300B7FF1C0079FF
      16006FFF0C0067FFFBFF4FFFF0FF2FFFE0FF53FFE4FF5EFFE6FF9EFFDEFFB6FF
      DEFFC3FFDCFFD6FFDAFF1A00DEFF1C00E6FF5F00DBFF6400DEFF5F00D7FF8A00
      D7FFD800D8FFF500DAFF3301D1FF5501D9FF5301D2FF5801CCFF0A01CAFFC200
      D1FF8600D2FF6A00DDFF1400D9FFFDFFE1FFAAFFECFFA5FF0000A7FF1700C8FF
      2300B1FF3000BEFF410093FF5300C8FF5A00C4FF6700CBFF6400BCFF6900D1FF
      6400D1FF6100090055001E004D003B00350073002C0063000B005600F6FF2F00
      DFFFEEFFD7FF9CFFBDFFBEFFB5FF5BFF9EFF5AFF93FF34FF91FF3AFF9CFF2CFF
      9FFF76FFAAFF36FFB4FF57FFC4FF3FFFD7FF6CFFE8FF6AFFFDFF99FF050060FF
      1A008CFF230078FF3400B0FF3800F0FF4B00260044003D004900770040007500
      40005B003400560037000A002500230029001A0010001C001000EAFF06001A00
      0C00F7FFFDFF500009003800FEFF5B00FBFF450005009900060082000300D500
      01009300FDFFB900F3FFB200F4FFEB00EEFF0201EDFF4301DDFF2101DFFF3701
      D1FF2301CBFFD400BAFF8700CBFF3400B3FFF0FFBEFFAAFFB7FF81FFBFFF1EFF
      BDFF25FFDFFFF0FEDEFF15FFF0FF00FFFBFF03FF1200E1FE24004BFF390022FF
      390061FF48005EFF48008FFF4D008FFF5300FEFF4900030040004E003D008900
      3000BA0013009E0010009C00F4FF7500EEFF3500DAFF1A00D2FF0500B8FFEDFF
      BFFFABFFB5FFC8FFC5FFABFFBEFFA2FFCCFF96FFD2FFABFFE8FF71FFF0FFB1FF
      1300A0FF0D00B2FF1D008BFF3100B1FF39009AFF3C00DDFF4F00E4FF49002300
      43004A004D006B003A006400320064002D002D001F00F2FF0B00F6FF0900D5FF
      F0FFC5FFF1FFAAFFE2FFADFFE1FF83FFD7FFB3FFDBFFB9FFCEFFC5FFE1FFC3FF
      DBFF1700E4FF1700E6FF4D00E9FF4A00E3FF7100F3FF8300ECFFD900EEFFEE00
      EDFF1F01E6FF4301E7FF5F01E6FF5C01DDFF3601DBFFE500DDFF9900D0FF7D00
      DEFF2B00D7FFFBFFDEFFAFFFEAFF97FFF7FF59FFF6FF72FF110047FF130048FF
      29003FFF420080FF4C006FFF4B0098FF5D009EFF5600C0FF5C00BFFF5F001800
      4E0017003F003C0038007C0028009F0014008D0006007900E7FF3D00DBFFF9FF
      C0FFDDFFB4FF9DFFA5FF7BFF9BFF3BFF96FF1FFF9FFF04FF92FF01FF9FFFC8FE
      B0FFEDFEBCFFE8FECEFFF0FEEAFF09FFECFF48FF05001AFF1C005FFF250077FF
      3900BEFF4200DCFF450034004A0067005300B9004800C5005200E5003F00AE00
      36008F002E008D002300990011005F001B00610004003E00FEFF1100FAFF2200
      F9FF2700F0FF0E0000002A00F7FF4900F8FF4E00FAFF7A00FCFF6700FDFF9100
      FBFFA000FBFFC500F4FFDE00EAFF1801E4FFF900EAFF3601D7FF2701D5FFE700
      CDFF9E00C2FF7800B7FFFAFFC8FFE8FFB6FF89FFC3FF43FFC5FF07FFCEFFE8FE
      CDFFAEFEE7FFD3FEEAFFABFE0900D6FE1400FCFE22000DFF300028FF400089FF
      430092FF5500CAFF5100080046002600480067003E00B2003500D4002B00E600
      1C00DA000000A300FAFF9C00E4FF3B00DEFF2000CEFFEFFFCDFFB5FFBEFF6AFF
      BEFF82FFB4FF0CFFC6FF16FFC7FF10FFDAFF18FFE5FFF6FEF6FF43FFFDFF18FF
      1C005FFF22005EFF310095FF3800A5FF3B00EBFF3D00FEFF43007C0042008C00
      3F00B6003A00C8002600910022006D001300890005005800FDFF1C00FAFF2700
      E2FFDAFFDFFFC5FFD9FFC4FFD7FFBEFFD4FF9FFFE2FFF0FFD7FFD2FFDEFF1F00
      E4FF0700F0FF5300F2FF5C00FCFFA800F8FF9800F5FF0901F4FFF100F9FF4001
      F7FF5C01F2FF6501EEFF1401E8FF0D01E2FFB300E4FF8000E4FF4500DFFFF5FF
      E4FFA7FFE4FF6DFFEBFF2DFFF0FF0EFFFDFF03FF0700D7FE18001BFF210002FF
      2F0035FF39004DFF420095FF4D008EFF550002004900E3FF46002A0040006700
      3500B200290097001F00E30004008D00EEFF7B00E5FF5000D3FF1A00C4FFC8FF
      BEFFAEFFAFFF51FF9FFF15FF9FFFF1FEA1FFB6FEA2FFA0FEADFF88FEBDFFA0FE
      C5FF9AFED8FFDDFEF0FFE8FE050043FF160043FF2900A3FF3100B1FF3D001600
      460042004E00D1004F00D10051002E014D001901450019014000020139002101
      2D00D2002300C400190085000A004E0001003300FDFF1400F7FFF4FFF3FFEFFF
      F1FF0000ECFFECFFF0FF3B00F3FF2100F7FF5600FDFF6000FCFFA200F3FF7100
      F4FFEB00F0FFD200E9FF1401E9FF0401E3FF2301D4FFAF00D4FFCC00D2FF7400
      CCFF4D00CBFFE0FFC9FFB4FFC3FF3DFFC8FF1BFFCDFFD8FED6FFC7FEE0FF9FFE
      E9FFA5FEF7FFCAFE0500C9FE15001BFF250034FF33008FFF3E00A2FF47001A00
      4600000048007A00470098003F0003013900DB00300029011D00CC001000F900
      09009900FBFF9700F0FF1000E9FF0A00D2FF7CFFCAFF7AFFC6FF1AFFC3FFEAFE
      C5FFABFECCFFB0FECEFF84FED7FFA5FEE6FFDDFEF6FFDFFE070026FF120042FF
      1A007EFF280096FF2E001600350025003B00AC003500A2002E00FE003200CC00
      2A0021012300C7002200040112009F000500A600FEFF3C00F5FF5600E7FFF0FF
      E2FF0000DFFFB8FFE1FFD1FFDAFFABFFDDFFEDFFE2FF0500E6FF2900F0FF4000
      FFFF7800F7FF9300F8FFB000FDFF0401FDFF0301FBFF3C0102002D01F7FF3C01
      F1FFEA00F6FF1F01F7FFBD00F7FFA300F1FF2400EBFFF2FFEDFF61FFEEFF6BFF
      EFFF02FFF8FFFCFEF7FFA5FEF8FFCCFE0700B0FE0E00FFFE1400F7FE23003BFF
      2A0064FF300094FF3900CFFF35000C002F0035002F0074002600C5001C00A800
      1000C3000000AE00F7FFA600F1FF6B00E5FF6000DEFFDEFFCDFFAAFFBEFF51FF
      BCFF4CFFB5FFE2FEB2FFC5FEB6FF77FEB8FF78FEBFFF61FECCFFA4FEDCFFBAFE
      ECFFEEFE00001BFF0C005CFF1F008CFF3000F1FF3500450043008B004A00EA00
      43000A0147003D014900520144006C014700440146005001370009012F00E400
      2000B00017009A000A004200FDFF2F00F7FFE4FFF3FFCEFFE6FFC8FFE6FFE7FF
      E9FFEAFFE4FF0C00E9FF1000F0FF2E00E8FF5E00E9FF7300EAFFA200E6FFC700
      E2FFD800E2FFC500DBFFE000D6FFA800D8FFB500DCFF8200DEFF4D00D6FFE2FF
      DAFFA9FFDAFF4FFFD8FF36FFDCFFF9FEE6FFDDFEDDFF9DFEEAFFB0FEF7FFCEFE
      0100F6FE050002FF1C0047FF22007BFF2F00AEFF340011003D00460037006B00
      3B00AC003500F5003400D2002200FE001E00E9001A00D8001200AF0009008D00
      06000F00F4FFD3FFE4FF79FFE5FF43FFD4FF03FFCBFFC0FEC9FF66FECFFF6DFE
      CAFF5EFED5FF84FEDBFFA4FEE9FFB1FEEFFFDFFE040028FF090067FF1700AAFF
      160019002C0052002200AC002800DF0022001D012B002301210043012F003201
      28003001220003011900E7001700B90005008600FBFF5300F0FF2700EAFFE9FF
      E6FFEDFFE4FFF0FFE6FFDEFFE1FF0900E5FF1700EEFF2200FBFF4C00F0FF8700
      FBFF7F00F7FFD200FCFFE800F7FFF6000100F800EEFF0E01F9FFCC00F7FFDB00
      0500A100FAFF590002000800FCFFCAFF03007FFFF6FF41FFFDFF0BFFF0FFC9FE
      EDFFB7FEF0FFA4FE0300CBFEFAFFC5FE0000DEFE0C00FCFE100052FF180073FF
      1E00E6FF1A00E8FF13002E00190057001300B20010009E00FEFFC400FFFF9200
      F7FFAC00F8FF7B00F0FF4E00F5FFFDFFDEFFBEFFDFFF5BFFD7FF3FFFCFFF08FF
      BEFF9EFEC8FF9EFEC2FF83FECEFF85FED2FF9CFEE1FFD5FEE4FFB1FEFBFF27FF
      090061FF1C00BEFF1F00D8FF2F006500360076003B0017013C00250146008F01
      3E00550142008D014D006D01450080014200240140002E013300D60022009400
      1900660003002700FBFFEAFFF0FFEFFFECFFD1FFE2FFB8FFDFFFDEFFD7FFB7FF
      E3FFF8FFDDFFFEFFDEFF2E00D9FF1D00DDFF8D00D4FF5B00DDFFCC00D3FFA000
      D5FFBF00D2FF7900DEFFB900DEFF3A00E6FF4D00E7FFD1FFF5FFC8FFF0FF71FF
      F1FF5AFFEDFFF7FEEAFFFCFEE7FFC4FEF3FFECFEF7FFF6FEFAFFF8FE07000AFF
      0F0040FF1C0093FF2300CEFF25001E00240015002E00730026007E002E00EE00
      2400DD001E00EE001600A8002000F0001200750015007E000F0010000C00C5FF
      FEFF58FFFBFF67FFE2FFD6FED7FFB5FED0FF78FED2FF77FECAFF59FED2FF91FE
      D6FF7AFEDCFFA7FEE6FFE1FEF7FF35FFF8FF8CFFFAFFAFFF0900070010005C00
      1200D20018000D011B006E011B003D01270068012B0073012F0088012D004501
      2E0036012800E7002200C8000C00750005006900FCFF3500F7FF1F00EFFFFAFF
      F0FF2300E7FFF5FFECFF1000F4FF3400F5FF3000EEFF4800F2FF7600F1FF8500
      F1FFA300F6FFD900F3FFBF00EEFFBD00F3FFBD00FDFF8800FDFF5D0004002F00
      0800DFFF0900B2FF0B007EFF0B002CFFFDFFF6FEF5FFD7FEF2FFB7FEF2FFCAFE
      F0FFC4FEF2FFBEFEF3FFDBFEFBFF09FF030056FF03008CFF0300B4FF0200D4FF
      0400180005004E0008009300FDFFAC00FAFFA000FBFFA500FDFF9E00FBFF7D00
      00005600FDFF1700FBFFBBFFFCFF9FFFF8FF57FFE4FF22FFDCFFE0FED8FFBFFE
      D3FFA5FED5FFD0FEDEFFB6FEE3FFE2FEEFFF07FFFDFF41FF020071FF0C00E7FF
      1400E7FF1C0047002400AB002E00FA002A00360133008001380070013E008401
      43009C014C0085014200570145001B013E00E7003300AC001E00740015002200
      01002100F5FFDDFFEBFFD6FFE7FFC8FFDDFFCBFFDFFFA7FFDEFFE4FFD6FFCCFF
      D0FFFBFFD4FFFDFFD1FF3200CEFF4900D2FF8800CBFF6800CFFF8600DAFF7300
      E2FF6E00E4FF5500F0FF2500F2FFD7FFFDFFC8FF03009AFF040056FFFCFF48FF
      FCFF06FFF2FF03FFFCFF29FFF8FF25FFFDFF14FF030053FF130053FF1000A8FF
      1700DBFF1600E8FF1A0002001C005F00230067001C00BA001600C2001500A300
      1A00A4001800B20016006100160047001200EEFF120095FF140079FF060045FF
      F1FFF6FEE8FFC6FED9FF86FED3FF78FED1FF9EFED2FF92FED1FFAAFEDEFFD5FE
      DEFFF0FEE2FF41FFE6FF9EFFF1FFBEFFF4FF110003007500FFFFBB0006002501
      0A004B011B00560120008E012B00880129008301340092013600230139000E01
      2F0006012600B500170077000F00870003002700FDFF2300F9FF4000F5FF0E00
      F7FF0800F2FF1E00EFFF0900EBFF2400F2FF4E00EDFF3900EEFF7100E5FF7100
      E5FF6A00E9FF7400F5FF7B00F6FF3B00FFFF4800FBFFDFFF0500BAFF0A008FFF
      100072FF060019FF070024FFF8FFC6FEF2FFDFFEEFFFDDFEEFFFE2FEE8FFD7FE
      F0FF05FFF2FF0DFFF1FF5AFFF0FF6BFFF6FF7DFFF5FFD4FFF8FFEEFFF9FF1F00
      F6FF7100F0FF6A00F7FF56000100AC00FFFF68000300600003003D0006000300
      0900AAFF1100E9FF03006DFFFDFF5DFFF0FF25FFEBFF0BFFE5FFE8FEEAFF2FFF
      E5FFFDFEEEFF39FFEFFF39FFF7FF69FFF9FFAAFF0200ECFF0500F9FF16006B00
      130093001600E3001C003B01250049012B005E01390081013900820138005001
      40005B01460000014000FE003500B9002C008E001A0049000D002E00FDFFD0FF
      F6FF0C00E6FFC0FFE6FFB8FFDFFFB7FFD7FFBCFFCFFF8BFFD5FFF6FFCCFFC5FF
      D0FFDEFFC8FF1800C6FF2E00C3FF1700D7FF5B00D5FF4500E2FF3F00E3FF3D00
      EEFF0000F7FFE6FF0500C0FF0500AAFF0A0086FF070076FF030034FF020061FF
      FDFF4EFFFAFF54FFFFFF59FF050072FF050063FF0900B3FF0900ACFF1000D6FF
      1000F1FF16001C000D00390010007D0009005F001700780011006F0017005700
      14004200180018001300C0FF1E00B1FF130093FF0C004DFFFFFF34FFF5FFFAFE
      E7FFC7FEE4FFD5FED8FFD8FED7FFCDFED7FFF7FED5FFFAFEDAFF1CFFDDFF6DFF
      DEFF94FFE6FFC5FFF0FF2600ECFF6100F5FFBE00FCFF0E01090031010D004E01
      1E006F01200074012B008101320072013E004B0138003F01350019012F00EF00
      2900CC001B008D00160067000A0056000000360001002000FDFF2100F3FFF3FF
      F1FFF0FFF2FFFFFFEFFFF7FFEDFFFDFFE5FF1E00E4FF1B00E4FF2900EEFF2E00
      F0FF2300F4FF0900F2FFF9FF0000C2FF0700B3FF0B0081FF09006AFF0A004EFF
      03002FFFFEFF14FFFBFF1BFFF0FF09FFE6FF0BFFEAFF13FFEBFF18FFEAFF34FF
      EAFF59FFEDFF60FFEEFF80FFECFFABFFF1FFD1FFEDFF0C00ECFF2900F2FF3E00
      FBFF4800FBFF64000100500006005B000C002600110010001800F1FF1500EAFF
      1000BAFF0B00B5FF050076FFFEFF6EFFF9FF67FFF5FF6DFFF0FF57FFF2FF76FF
      F3FF83FFF9FF9CFFFBFFBEFFFDFFE6FF0300050009004D00070099001000C900
      1500FA001A001901230037012C0033012E00540137003901400030013E000D01
      3A000F013000C7002B00AD0020007B0014004D0005001400FAFF0B00EBFFE5FF
      E9FFD4FFE1FFBEFFD9FFBEFFD2FF92FFD3FFA2FFCCFFA2FFCBFFBEFFC6FFD0FF
      C9FFFCFFCBFF0300D2FF0E00D7FF1400DFFF1400E4FF0C00F5FFF1FF0400EFFF
      0300D9FF0800CCFF0C00B6FF0C00B4FF0C009CFF100096FF030093FF020085FF
      040074FF05008EFF05008EFF0900A3FF0800AAFF0E00BEFF0600B6FF0C00EAFF
      090000000A001A000B00250011002B000B0017001000230017000D001800F3FF
      1B00C8FF1C00BFFF120099FF0B0088FF070068FFFDFF58FFF4FF2EFFE6FF2FFF
      E2FF2BFFDAFF1BFFD8FF27FFD6FF4EFFDDFF5EFFD5FF7BFFDEFFB6FFE1FFD4FF
      E2FF1300E6FF7600F5FFB800F5FFE20001001D0109003301150050011D006901
      2F008B01370074013B00750138004B0138005501380011013100FB002B00C700
      21009F00120055000B0063000C002500FFFF0B00FBFFF0FFF5FFE0FFF0FFAAFF
      EAFFC0FFEAFFC8FFE2FFCFFFE5FFD3FFE5FFEDFFE7FFE6FFE8FFC9FFEEFFCAFF
      F1FFC7FF0100AEFF040094FF0600B2FF030071FF030062FF020060FF030067FF
      FAFF1AFFF2FF58FFEAFF18FFEAFF22FFEAFF26FFE9FF53FFE7FF39FFE7FF6DFF
      E8FF66FFE6FF8CFFEAFFA4FFE9FFD7FFEEFFF4FFF1FF2300F4FF0D00F7FF4700
      03004E00090035001500480017003C001A00200016001000180025001400E2FF
      1400FBFF0900C8FF0200C3FFFFFF9EFFFDFFAEFFF7FF93FFFBFFB6FFFAFFA7FF
      F9FFE1FFFAFFD6FFFDFFFBFFFCFF2400020084000B007A000F00DD000E00E500
      1600F4002100190129003001330027013A003001350017012E00E9002F00F700
      2B00B60022008D001600700005002300F9FFF0FFF1FF0000EBFFAAFFE3FFA8FF
      D8FF90FFD2FF80FFCFFF62FFCBFF8BFFC6FF79FFC9FFA9FFC8FFB9FFCDFFD2FF
      D0FFDFFFD8FFEDFFDCFFE6FFEEFF0700FAFFFAFF03000200040009000B00EAFF
      0B00E7FF1400F7FF1400D9FF1100BEFF0600B7FF090088FF090093FF09008FFF
      080088FF0A008DFF050085FF030080FF0500ABFF0400ACFF0400B2FF0500EBFF
      0500ECFF0300DAFF09000B000B0000001600E5FF160004001900E6FF1300CDFF
      1300CAFF0800C8FF0B00ADFFFEFFA8FFF7FF7CFFE8FF5DFFEAFF50FFDEFF4AFF
      E0FF5FFFD9FF61FFD9FF75FFD3FF94FFDBFFB7FFD8FFD1FFE1FF1E00E5FF5100
      F0FF9700F1FFCD00F9FFFA000500170114005B01220062012F00900138007D01
      35007B013B006A013C0076013F003901340021012F00DE001F0091001F006C00
      12004E0013000F000300E2FF0000C3FFF1FF95FFF5FF95FFE4FF81FFE7FF80FF
      E1FF81FFE4FF9CFFDDFF8CFFE5FFA7FFE0FF8EFFECFF9EFFF4FF9BFFFCFFBAFF
      FBFF8FFFFEFF9CFFFFFF86FF020092FF000080FFFCFF81FFF7FF54FFECFF3BFF
      EEFF2BFFECFF30FFEBFF28FFE6FF2BFFEBFF3CFFDFFF33FFE4FF55FFE2FF79FF
      EBFF97FFE5FFA4FFF0FFE7FFE7FFEDFFF7FF1500F6FF2A0009004D000B004200
      180071001300530021005C001A0056001F006C001A004E00170041000C000900
      0F00EFFF0500DBFF0400C2FF0300BEFFFEFFBAFFFBFFBBFFF8FFC5FFF9FFE3FF
      F9FFE6FFFFFF1F00FCFF390006007600010091000C00C5001000C8002200FE00
      22000B01330031012A001001320013012D00060133000E012300D8002200B900
      090060000A002700FBFF0C00FBFFE1FFEDFFA5FFE8FF8BFFD6FF68FFD6FF4BFF
      CFFF6EFFCBFF54FFC8FF5FFFC8FF74FFC8FFA8FFCBFF95FFD2FFC6FFD7FFC1FF
      E9FFE2FFEEFFF2FFFCFF1F00FDFF0000090009000A00050019002A0010000500
      180009000B00D8FF1100BCFF090097FF1500A2FF080076FF100067FF050076FF
      0A0073FFFFFF75FF08007DFF030092FF060098FFFDFFB9FF0100C0FF0300DFFF
      0900D4FF100000001100090010000E001000F0FF15001F000F00F6FF0F001100
      02000100FEFFF2FFF0FFA7FFF2FFB6FFE6FF8FFFEAFF80FFDCFF73FFE4FF8BFF
      D4FF8AFFDCFFA8FFD5FFC1FFE5FFE9FFDDFF0600ECFF5400EAFF9400F5FFB200
      F7FFE7000F001F0116004101250062012C009C0135007401390080013E008E01
      3F008E0139005701340041012900D2002800AB001C006B001C0036000F00EBFF
      0C00C8FFF7FF84FFFBFF8BFFECFF5EFFF0FF55FFE3FF4CFFE6FF5BFFDAFF51FF
      E4FF6DFFDEFF56FFEAFF62FFE8FF80FFF5FF8FFFF1FF9BFFF8FF9BFFF8FF90FF
      FEFF9BFFFBFFB1FFFBFF9BFFF5FF9CFFF0FF6FFFEFFF64FFEBFF4BFFEDFF3FFF
      E8FF27FFECFF4AFFE4FF2FFFEAFF4EFFE1FF62FFE9FF6DFFE8FF84FFF0FFD2FF
      E7FFC5FFF6FFF2FFF7FF180005002D0009004E0016008200100062001C007500
      1C008D00220090001D009C001C009B001400650013004D000F002F000A00F9FF
      0600E2FF0200CBFF0300C2FFFBFFCEFFFBFFCEFFF7FFC5FFFEFFE1FFFAFFF2FF
      02003500FDFF4C0006006800070083001800B4001A00CC0024000A012200FE00
      2E00F60029000A012A0011012300FB002100FE001000B10010007A0005005A00
      FBFF1300F7FFDBFFF0FFBEFFE4FF7BFFDDFF64FFDBFF67FFD1FF43FFD4FF4EFF
      D0FF6EFFCFFF65FFCCFF79FFD6FF9BFFD7FF86FFE6FFAEFFE8FFDFFFF6FFE2FF
      F6FFF0FF020007000500FBFF100009000B001D00100020000B00F4FF1000ECFF
      0C00CCFF0D00A3FF0A0079FF0E0084FF0B0071FF0A0054FF090062FF020065FF
      050058FF05008CFF01009FFF000091FF0600AFFF0300C5FF1000D2FF1000FFFF
      10000F000B000100110019000A001D001000360006004300FFFF3000F7FF1000
      F6FF1700EAFFD8FFECFFC6FFE0FFBEFFE1FFA6FFDEFFA5FFDDFFD2FFDBFFB3FF
      E0FFC0FFE0FFF3FFE4FF1D00E9FF3E00F0FF7D00F7FF9C000300BB001000F700
      1B00360123003F0129004F01360060013500600138005C013800690134004B01
      2A0004012D00EE0020009C001C004E00160018001000F7FF03009AFF02008AFF
      F4FF60FFF5FF41FFEEFF40FFEAFF54FFE2FF2FFFE3FF3DFFDFFF37FFEAFF43FF
      EAFF58FFEAFF7BFFF0FF6BFFF0FF8BFFF0FF8AFFF8FF91FFF6FF9FFFF1FF9FFF
      F1FFA3FFF0FFACFFECFFA3FFEAFF74FFE9FF67FFE6FF4BFFEAFF50FFE7FF53FF
      EDFF53FFE6FF41FFEAFF63FFEEFF80FFF2FFBAFFEEFFB6FFF7FFE4FFF7FFE4FF
      030015000A00400012006F0010004D001A007E0019008600220094001E00AB00
      1E00B8001600870018008A000E0075000C00380006001600030000000100DEFF
      0000DCFFFDFFE4FFFCFFBCFFFDFFC6FFFAFFD7FFFDFF0100FAFF120000003A00
      04003D000F007A00100093001D00BE001800BD002200E2002200D1002400F700
      1B00EF001F00F2001100CC001000BF000300820003005500F5FF1600F3FFF7FF
      EAFFAEFFE6FF9FFFDEFF74FFDDFF58FFDDFF60FFD8FF6BFFD6FF5DFFD6FF63FF
      D7FF7FFFDCFF6DFFE8FFA2FFEAFFAEFFF0FFBFFFF4FFB8FFFFFFEAFFFDFFD6FF
      0A00F9FF0700EFFF0C0000000500EDFF100006000500D2FF0800C7FF030093FF
      0B0095FF03006BFF0A0079FF06004DFF070054FF050066FF0A007DFF050080FF
      04009FFF05009FFF0900AAFF0B00EBFF0C00F9FF1000FDFF090006000D002E00
      0B0019000F0058000400480006004D00F8FF3B00F8FF5B00EAFF2000EBFF2200
      E0FFF2FFE4FFF5FFDBFFC9FFE3FFE6FFDDFFC7FFE2FFDBFFE4FFD7FFE9FF0F00
      E7FF1800F0FF4200F6FF6800FEFF89000E00C0001400DD001B00F10024000101
      2C0023012D001E01350046012E00230134001B012D000A012B00FE001E009B00
      20009E0011003A00140007000700D8FF0500C0FFFBFF4FFFFDFF73FFF6FF51FF
      F6FF3BFFEBFF34FFEBFF3EFFE9FF25FFEBFF48FFEDFF62FFEEFF62FFEBFF62FF
      EDFF65FFF3FF8CFFECFF86FFF4FF9CFFF0FF95FFEEFFA1FFE8FF8EFFEFFFCBFF
      E0FF8FFFE8FF95FFE3FF71FFE8FF7EFFE4FF53FFEDFF88FFE6FF4AFFF3FF81FF
      F0FF89FFF8FFA5FFF8FFB6FFFDFFE7FFFDFFD1FF090022000C00480010003B00
      17006B00160073001A006B001E008E002000B7001B0079001D00A90013008100
      15008700070067000900650001000E0003002C00FAFFE2FF03000000F7FFCBFF
      FFFFE6FFFDFFCCFFFFFFFEFFFBFFDCFF05002800000024000A004D0010007900
      11008000160086001B00BB001700B0001A00B2001C00E9001400A4001600B900
      0C00B80005009000FCFF5700FBFF7600EEFFEAFFF0FF0500E6FFC9FFE7FFAEFF
      E2FF75FFE6FFA6FFE0FF4CFFE6FF89FFDEFF5AFFE6FF73FFE6FF76FFECFFA7FF
      F0FF90FFF6FFBFFFF6FF95FFFDFFB8FFFFFFCCFF0200C5FF0600C6FF0500CBFF
      0600BDFF0500D1FF0400E6FFFFFFABFF0500CBFFFDFF8AFF040091FF030082FF
      03008EFF030050FF0D00AEFF050067FF0C009FFF0C00AAFF0B00C8FF0A00AFFF
      120029000C00EFFF10001C001000210009002E000900250009005F0005003300
      03005200FDFF5000F6FF4000F0FF4E00E6FF3800E6FF1900DEFF1000DEFF0500
      DCFFDDFFE1FF0A00DFFFDDFFE7FF0300E8FFF9FFF0FF1900F4FF1500FCFF6100
      010049000D00A40012009B001A00B9002200C4002300EA002800C0002F001801
      2E00DA002E00D8002F00DD002500CC0021008A001C00A00013004E000B001C00
      0C0010000100D9FFFEFFB3FFFDFFA3FFFBFF82FFF7FF67FFF9FF6EFFF2FF44FF
      F1FF69FFF3FF58FFF2FF6DFFF0FF6DFFF2FF87FFF0FF54FFEFFF8FFFEEFF6DFF
      EFFF8CFFEDFF78FFECFF8FFFEAFF78FFE4FFA5FFE2FF7EFFE2FFAAFFE1FF84FF
      DFFF80FFE4FF85FFE4FF8EFFE8FF73FFEFFFAAFFF1FFA3FFF6FF99FF0100D7FF
      0300DCFF0800EBFF0F001F0010004200140033001C0072001900580017006C00
      1C006C001B0081001A0065001C008A0015005E000C007A000B00540005005600
      FEFF2C00FDFF3400FBFFFEFFF5FF0C00FAFFF0FFFAFFF5FFF7FFF1FFFBFFFAFF
      FFFF01000200110006001E000B0048000D006A001200600016008A0014008400
      12008200150093001400AA001400790012009E000A00780003006E00FEFF5B00
      F7FF5C00F0FF1100EEFF1C00E7FFE4FFE2FFD7FFE6FFBEFFE4FFB7FFE3FF92FF
      E9FF9FFFEAFF86FFEBFF85FFF0FF92FFF6FF97FFF5FF9AFFFDFFADFFFEFFB1FF
      FDFF9DFFFDFFA4FF020099FF0100AAFF050093FF0500B2FFFFFF91FFFEFF9BFF
      FFFF9AFFFCFFB8FFFDFF84FFFCFF9FFFFBFF8FFFFCFF8CFF020091FF0300B8FF
      050099FF0B00C4FF0D00CBFF1000DAFF1100EFFF1300160010001B0015003A00
      120041000D00350008004C00060039000300490003004400FDFF4800F1FF2700
      EAFF4400E7FF2300E3FF2500E0FF1600DEFF2000D9FFFAFFDDFF0A00E0FFFBFF
      E1FF0900E6FF0000F0FF2900F2FF2300FFFF3700080045000D00710016007A00
      20009B001E00A1002200940026009D002600A8002900AD002E00A00029009E00
      210075001D007C0018006200100051000C00300007001E00FEFFE7FFFCFFEDFF
      FBFFC5FFF9FFB4FFF6FF9BFFF9FF9FFFF7FF80FFF8FF8FFFF9FF7EFFFBFF87FF
      FAFF87FFF9FF9BFFF5FF85FFF0FF7DFFEEFF6DFFEAFF68FFECFF73FFEAFF73FF
      E4FF72FFE2FF64FFE1FF6AFFDBFF70FFDEFF86FFDEFF80FFDCFF80FFDDFF80FF
      E8FF99FFE7FF96FFF0FFBDFFF8FFCBFFFEFFE6FF0400EAFF10001A0012001700
      18003E001D00550021006C001E005C001E006E001A006C001A0061001B006B00
      1800660012004F000A003F00050048000000350000003100F9FF2A00F7FF1F00
      F1FF0D00F6FF1000F1FFFCFFF8FF0B00F8FF1000FBFF2000FFFF22000C003700
      0900310010005600160078001700720010006B00170074001000640010006C00
      110087000F00620007004F0003004A00FBFF4200F6FF2300F3FF3000EBFF0C00
      EAFFFCFFE6FFE7FFE6FFE8FFE4FFC7FFEAFFCDFFE7FFBAFFEFFFBEFFF1FFACFF
      FAFFB3FFFAFFABFF0500B6FF0300BEFF0800B8FF0300A1FF060098FFFEFF8CFF
      03007DFF030092FF030078FFFDFF77FF01006DFFF9FF73FFF9FF68FFFBFF90FF
      F7FF76FFF4FF91FFF9FF91FFFBFFA4FFFCFF99FF0600E4FF0600D4FF0C00FCFF
      1000050016001C00150017001C005D00160054001A00610012005D0010005300
      0500540007005C00FDFF5B00FDFF3600F3FF3500EFFF1B00E4FF2D00E5FF1300
      DEFF2300DEFF0500D8FF1A00DDFF0100DCFF2100E1FFF2FFE9FF2700EEFF1A00
      F3FF3F0000003100090059000F0039001C0080001D0079002300820024007200
      27007100240064002C0083002200750027005700220056001B00310012003200
      13003300060026000700FDFF03002100FDFFDEFFF7FFF6FFFBFFD6FFF6FFE4FF
      F8FFB5FFF9FFEAFFFBFFABFFFCFFD0FF0000AFFF0200D7FFFEFFB2FFFBFFBEFF
      F8FF8BFFF3FF97FFEBFF6DFFEDFF80FFE7FF6DFFE4FF5FFFE1FF5CFFE2FF59FF
      D8FF51FFDDFF5DFFD9FF74FFDCFF62FFDDFF93FFE2FF87FFE4FF9EFFF0FFB2FF
      F1FFECFFFEFFD2FF07002B000D00090014003E00210043001F007D0024005B00
      2A009400230057002000740021006E001A00740015004D0016005D000E002C00
      0800350002003300FFFF2300F7FF2100F4FF1C00F1FF1D00F1FF1500EDFF1C00
      F2FF0300F7FF3400F8FF1700FFFF5300060037000900530010004E0015008000
      130051001600820015004E0012005200110055000D0067000800270009004600
      00001B00FBFF0900F7FF1400F0FF0D00EBFFF0FFEFFF0100E7FFFCFFE5FFDCFF
      E8FFECFFE6FFD0FFEAFFDEFFF1FFD2FFF6FFDEFFF9FFC5FF0300E6FF0700CAFF
      0B00F1FF0A00BFFF0E00C0FF0B0094FF0900A0FF05007BFF05008BFFFEFF5AFF
      00006AFFFEFF5AFFFAFF58FFF6FF5DFFF7FF64FFF0FF5EFFF4FF88FFF6FF9DFF
      F4FF8EFFF8FFC7FFFDFFC9FF0100E4FF060010000C002F000E001A0019006700
      180067001A0081001A00840019008A0010005F0010007B0004006100FFFF5D00
      F9FF4A00F7FF3800EEFF2200ECFF2900E4FF1A00E1FF1200DDFF0C00DEFF0300
      DBFF1000DDFF0400DEFF0E00E4FF0300EBFF1600F2FF1A00FCFF420003001F00
      10005C00160054001E0056002000550026006700230031002900530023004600
      22002F001D002800210029001700070016000C000C000B000900FBFF04000D00
      0300FCFFFBFF0000F7FFF0FFF4FFF7FFF4FFDAFFF7FF0300F7FFDDFFFBFFFAFF
      FDFFE6FF010005000200ECFF05000000FDFFCAFFFDFFC8FFF9FFA1FFF8FFB0FF
      ECFF89FFEBFF72FFE6FF63FFE5FF61FFDEFF47FFE1FF55FFD9FF58FFDBFF3AFF
      DDFF6CFFDEFF76FFDEFF80FFE6FF8BFFEAFFBEFFF0FFA5FFFAFFECFF0000F3FF
      09001C0010001D001C0067002000570025008A0024006B002900810023006700
      220072001A00550017005B000F003600100038000900320003002600FCFF2200
      FBFF1B00F6FF1B00F1FF0F00F0FF1E00F0FF1100EFFF2900F1FF0B00F9FF3800
      F7FF2100FDFF4A00050045000D0076000D004B0016007F001100550014006100
      14004D001100570009001D000900300003000F0002000400FDFF0000F7FF0000
      F2FFE6FFF0FFF0FFEDFFF7FFECFFE7FFE9FFECFFE4FFD7FFEBFFE1FFEAFFCAFF
      EFFFE6FFF3FFD1FFFCFFF0FFFEFFD8FF090009000A00DEFF0F00EEFF0D00BEFF
      1000C3FF0E009BFF0C00AAFF050074FF050079FFFFFF54FFFDFF60FFFDFF54FF
      F7FF58FFF2FF4DFFF6FF67FFF6FF6EFFF0FF7BFFF7FFADFFF4FFA9FFFAFFC1FF
      FCFFE2FF030001000200FFFF0E004D000D004F0019007400160082001700A500
      1600830017009F000E007D000B007D0002005400FBFF5B00F7FF3D00F4FF3700
      ECFF2300E7FF2700E4FF0A00E0FF0C00E2FF1300DDFF0000E0FF0300DEFF0500
      E6FF0900EAFF0400F2FF1000F2FF040005002F0006002E0013003D001A004200
      210049001E002E002900530024002F0023001D00220016001E000D001A00F1FF
      1A0009001300F7FF0E00EAFF0C00FBFF0300F8FF0500FDFFFDFF0100FCFF0200
      F6FFF3FFFAFFFDFFF2FFF1FFFBFF0600F7FF0100FDFF1600FDFF180005001C00
      FFFF050005000D00FFFFECFF0000E5FFFAFFCEFFF7FFADFFF0FF94FFEEFF87FF
      E8FF68FFE6FF68FFE2FF67FFDEFF4BFFE1FF62FFDEFF62FFE2FF68FFE4FF87FF
      E7FF9FFFE6FF8CFFF4FFBCFFF2FFC5FFFDFFD9FF030000000F00290011003500
      1E0060001E006100250073002400820026007E0021006B001E00640017004A00
      150042001000450009002B0005003200FEFF2000FBFF2300F8FF1500F7FF2500
      F0FF1600F2FF2E00F0FF1600F4FF2900F2FF1E00F9FF2900F9FF300002004E00
      050042000E005A000C005B00130056001200610012005700100034000F002700
      07001E000500FAFF04000500FCFFF4FFF9FFF1FFF6FFEAFFF4FFF5FFEFFFD7FF
      F1FFF4FFEBFFEAFFECFFF0FFEAFFDCFFF0FFE3FFEFFFCAFFF6FFE7FFF8FFE5FF
      0000F9FF0300F0FF0A00F0FF0C00E4FF1000E9FF1000E0FF1000CDFF0F00B9FF
      0B0099FF09008EFF040073FF02006FFFFBFF59FFFBFF67FFF6FF5CFFF6FF79FF
      F4FF6DFFF8FF94FFF2FF92FFF8FFBAFFF7FFBAFFFAFFD7FFFCFFD8FF04001000
      030026000A0051000F00620012007C001300800016009F001300A70010009300
      0C008A0007007A0003006100FBFF4B00F7FF5200F0FF2F00ECFF3100E6FF1900
      E7FF2400E2FF0200E6FF1700E3FF0500E5FF1100E6FFF9FFECFF0000F0FFF0FF
      F7FF0100FAFF000004001A000A00100010001C001A0026001F002D001F002200
      21002000230012001E00F5FF1F00FBFF1A00EAFF1700E9FF1000E3FF1000F5FF
      0800E5FF0900F3FF0200EFFF03000100FBFFF9FFFBFF1100F7FF0300F9FF0300
      F6FFF8FFFAFF1400FAFF1500FBFF1C00FDFF1B0002001A000200120002001A00
      01000E00FDFFF7FFFBFFE4FFF7FFC3FFF6FFB2FFEEFF90FFEAFF82FFE6FF77FF
      E6FF7BFFDFFF64FFE6FF7FFFE4FF76FFE5FF7DFFE6FF92FFEEFFA6FFEBFF94FF
      F3FFB2FFFAFFC5FF0000D3FF0500FFFF0E00200012002A00190039001E005D00
      2000600020006E001D0069001D006B001A00500016005500100039000D003600
      0400280003003400FCFF1E00FBFF2300F6FF2200F7FF2700F2FF2500F3FF2F00
      F2FF1A00F5FF1800F7FF1A00F9FF1C00FDFF3700000035000300350008003C00
      0C0055000C0037000F004D000C002C000C00220009000B0008001A000100E4FF
      0000F6FFFAFFEBFFF7FFEAFFF3FFDEFFF2FFEEFFF0FFD6FFF0FFE5FFEEFFEDFF
      EFFFF0FFF0FFDDFFF2FFD9FFF6FFD5FFF8FFD6FFFBFFEAFF0000E4FF0500E6FF
      0900DBFF0E00F7FF0E00D7FF1000EBFF0F00C7FF1000C8FF0C00A4FF0900ABFF
      040074FF02008BFFFDFF70FFFBFF7FFFF9FF7AFFF7FF97FFF7FF80FFF7FFAAFF
      F6FFB1FFF6FFBAFFFBFFD1FFFAFFE4FFFEFFEAFF010010000500360005003900
      0D0066000E006A00100082000E0081000D00A700090088000900980005007500
      00007B00F9FF4400F4FF5500F0FF3500EDFF3D00EAFF2300E8FF3100E6FF0E00
      E6FF2000EAFF1300E9FF0800EEFFFBFFF0FFF9FFF7FFE4FFFAFFF3FF0000FAFF
      0500EAFF0E0003001000FAFF1600FFFF1900FBFF1A0005001A00E3FF1F000400
      1A00E4FF1900E4FF1700D2FF1300E6FF0E00CAFF0C00F1FF0600E2FF0200F0FF
      FFFFEFFFFDFF0C00FCFF0000F9FF1900FBFF0800F9FF1000FAFF0400F9FF0C00
      FCFF1900FBFF1200FEFF2200FEFF1A0001001B00FDFF1000FFFF1C00FDFFF6FF
      FDFFFFFFF8FFDDFFF7FFC5FFF2FFA9FFEEFFABFFEAFF86FFEBFF9FFFE7FF8CFF
      E6FF8BFFEAFF94FFE8FF9EFFEBFF8EFFF0FFB4FFF4FFACFFF6FFAEFFFEFFD1FF
      0200D8FF0700E4FF0C000A0013001F001400210019004200190042001A004E00
      180059001900640014004B00110046000C003400080031000300240001003500
      FBFF3100FAFF2700F8FF2F00F5FF3C00F6FF2900F6FF2F00F6FF2E00F7FF1600
      FBFF2200FBFF2900FFFF20000400290005003400050022000900340008002C00
      08001E000900220009001E000500090005000D000300F1FFFDFFE1FFFBFFF5FF
      F9FFEDFFF4FFE3FFF2FFF1FFF1FFE8FFF0FFE6FFF0FF0000F2FFF8FFF4FFE6FF
      F6FFDFFFF9FFE4FFFBFFD3FFFDFFDDFF0400DEFF0500E3FF0900D3FF0B00E3FF
      0C00DDFF0D00CCFF0F00CCFF0D00CDFF0C00B3FF0900AAFF0500A0FF03008CFF
      020095FFFDFF9AFFFCFF9AFFF9FFA4FFF8FFB2FFF7FFB2FFFAFFD4FFFAFFD4FF
      FBFFE0FFFDFFF7FFFFFF050003000A000500360007003F0008004A000A006900
      0900730009006D0005008700080094000300800002008000FDFF6D00FAFF5300
      F4FF4200F4FF4E00EFFF3B00EFFF3500EBFF2D00EAFF2D00EBFF1700F0FF2200
      EFFF0900F4FF0000F7FFF0FFFBFFEEFF0000E6FF0500EAFF0900DCFF0D00DBFF
      1000E4FF1000D6FF1500D7FF1600DDFF1800DBFF1600D7FF1700EAFF1300CBFF
      1300C8FF0E00D1FF0E00E1FF0600D6FF0500F8FFFFFFF2FFFEFFFBFFFAFF0800
      FDFF2600F8FF1100FAFF1A00F8FF1900FAFF1500FAFF1300FDFF2400FCFF1A00
      FDFF1A0000002600FDFF1700FEFF1500FFFF1000FDFF0A00FBFFF7FFFDFFFFFF
      F7FFD1FFF7FFCBFFF4FFBEFFF3FFB9FFF0FFA7FFF0FFBAFFEAFF9EFFF0FFB2FF
      EEFFB3FFF3FFBCFFF4FFB1FFF9FFC5FFFAFFBBFF0200CEFF0300DBFF0900EAFF
      0C00F2FF10000700100018001200160012002F00110035001200470010004200
      10004F0009002D00090036000500310003003800FDFF2E00FFFF4800F7FF2600
      F8FF3D00F7FF4000F9FF3B00F6FF2900FCFF4000F9FF1F00FEFF2700FFFF2C00
      030020000300160007001D000500160007000B000800150005000A0008001500
      05000D00030009000200F2FF0100F4FFFCFFE2FFFFFFF7FFF9FFE9FFF7FFF7FF
      F3FFECFFF6FF0100F0FFF7FFF7FF0400F2FFF9FFF7FFF7FFF5FFDBFFFCFFE8FF
      FCFFE1FF0100D7FF0200D9FF0600E4FF0600CCFF0800CAFF0900D9FF0900BEFF
      0A00CCFF0B00D0FF0900C2FF0600ACFF0700BAFF0300A1FF0500B2FF0000B3FF
      FEFFB9FFFAFFB4FFFDFFD4FFF7FFD1FFFDFFE7FFFBFFE6FFFDFFF3FFFCFFF5FF
      03000E00FFFF1000050028000500360006004000050050000500590003006100
      0300630001007700FEFF7300FCFF6B00F9FF5F00F7FF5C00F5FF4300F5FF4F00
      F0FF4800F0FF3800EEFF2B00F0FF3800EEFF1A00F4FF1E00F4FF1000F8FFFEFF
      FBFFEEFF0000F0FF0100DEFF0800D5FF0A00D2FF0D00BFFF0E00BCFF1000BAFF
      1000B8FF1200BEFF1200C8FF1000C1FF1000C8FF0F00C1FF0C00C7FF0B00CAFF
      0A00DFFF0500E1FF0300F4FFFFFF0000FDFF1000FBFF1400FDFF2200F8FF2200
      FBFF2300FAFF2300FBFF2300FBFF1E00FDFF2300FCFF2900FDFF1A00FEFF1A00
      FDFF1100FDFF1000FDFF0900FDFF1500FBFF0000FCFFFBFFF8FFE9FFF8FFDFFF
      F7FFD3FFF7FFD2FFF5FFC7FFF7FFC9FFF3FFC8FFF4FFCAFFF6FFCBFFF8FFD0FF
      F9FFC7FFFBFFC6FFFDFFCBFF0100C5FF0500D4FF0800DDFF0A00EAFF0B00E8FF
      0E0003000B00FDFF0C000D000B0016000A002700070023000800320003002700
      04002B0002002E00FFFF3800FDFF3600FDFF4200F9FF3800F9FF3E00FBFF4300
      F9FF3C00FBFF3D00FDFF3400FDFF2F00FFFF1F00040027000300100005001500
      05000000070007000400F6FF0700FDFF0300F7FF050002000300F0FF0200FBFF
      FEFFEAFFFFFFEDFFFDFFE7FFFDFFF4FFFBFFF0FFFAFFFAFFF7FFFFFFF7FFFFFF
      F6FF0300F5FFFBFFF7FF0000F8FFF6FFF9FFF0FFFBFFE0FF0000EBFFFDFFCEFF
      0300DCFF0300CBFF0500C7FF0300B8FF0900D1FF0400B7FF0700CEFF0700C9FF
      0600CAFF0300BBFF0600C8FF0300BDFF0400CBFF0300CEFF0200DCFFFEFFE3FF
      FEFFE7FFFDFFF3FFFFFFFBFF01000000FEFF0000020012000200070003001C00
      0300200006003400030023000400420002003A0002005200FDFF4200FFFF5C00
      FAFF5000F9FF5B00F7FF4D00F7FF5600F2FF3800F5FF4C00F3FF4600F1FF3C00
      F1FF3400F4FF3500F4FF1C00F6FF1B00FBFF1800FBFFF8FFFFFFF7FF0200E1FF
      0500D6FF0600C8FF0C00C8FF0A00A5FF0F00B8FF0D00A1FF0F00AFFF0D00A7FF
      1000BEFF0B00AAFF0C00C6FF0900BBFF0800D1FF0700D1FF0900EEFF0400F1FF
      0300080001000F00FDFF2000FDFF2200FDFF2C00FDFF3400FBFF2E00FDFF3600
      FBFF3100FDFF2C00FDFF2500FFFF2B00FBFF1000FEFF1C00FCFF0900FDFF1000
      FCFF0500FDFF1300F9FFF7FFFCFF0B00F9FFF0FFFAFFECFFF9FFE5FFFBFFEDFF
      F9FFDCFFFAFFECFFF9FFE3FFF7FFDBFFFBFFE0FFFDFFE1FFFEFFD7FFFFFFD6FF
      0300D4FF0100CCFF0600D7FF0600D2FF0900DDFF0700D2FF0900E8FF0500E7FF
      0900FBFF0600FDFF0600100003000A0004002900FFFF1D00FFFF2200FEFF2C00
      FEFF3B00FBFF3300FDFF4C00FBFF4900FBFF4200FDFF4F00FEFF4E00FDFF4200
      0100410002003900010021000500240005000F00060009000500FCFF0600FCFF
      0300EAFF0500F7FF0300E3FF0400F0FF0100EAFF0100EFFFFDFFE2FFFEFFF0FF
      FCFFEBFFFDFFF9FFFBFFFBFFFBFF0500F8FF0100FAFF0300F9FF0B00FAFF0100
      FAFFFDFFFCFFFFFFFBFFF8FFFCFFE3FF0000EEFF0000D8FF0100C8FF0300CAFF
      0300CCFF0100B1FF0500CDFF0400C0FF0500C6FF0500CAFF0400D7FF0200C5FF
      0500DCFF0300D8FF0300E5FF0200F3FF0300FBFFFFFFFBFF0200080001000900
      02001000030018000300150002001A0004001C000400250005001C0004002500
      03001D0001002C00FFFF2000FFFF3800FDFF2F00FCFF3C00FAFF3C00F7FF4900
      F5FF3700F7FF4900F3FF3A00F5FF3C00F5FF3F00F4FF3F00F3FF2900F9FF3700
      F7FF2300FAFF1600FDFF1600FFFF0000FFFFEBFF0500E9FF0500D7FF0900B8FF
      0A00C0FF0A00AAFF0900A5FF0A009FFF0A00AAFF0A0097FF0B00B2FF0900ADFF
      0800BFFF0700BBFF0600D8FF0500D9FF0500F5FF0300FDFF0300160000001500
      02002E00FDFF2F00FFFF3A00FFFF3B00FDFF4100FCFF3500FEFF3800FDFF2F00
      FEFF2200FEFF2200FCFF1000FBFF1000FDFF0B00FBFF0A00FCFFFAFFFDFF0D00
      F9FFF1FFFBFFFAFFFBFFF7FFFBFFF6FFFBFFE1FFFCFF0000F9FFEEFFFCFFF4FF
      FBFFF1FFFDFFF3FFFDFFDDFF0000EFFFFFFFE0FF0300DEFF0300D7FF0400DBFF
      0500D2FF0700D2FF0600D2FF0500CBFF0500D3FF0500D8FF0400E7FF0300E4FF
      0300FCFFFEFFF7FFFFFF0B00FDFF1100FDFF2300FBFF1E00FDFF3F00FAFF3800
      FDFF4D00FDFF4C00FDFF5300FDFF450001005500FEFF43000300420003003800
      03002E000500170007001600050003000500F5FF0500F4FF0300E3FF0400DEFF
      0300D8FF0200DFFFFFFFD5FFFFFFE5FFFDFFDFFFFEFFE9FFFCFFE7FFFDFFFCFF
      FBFFF1FFFCFF0700FAFF0000FCFF0900FBFF0000FDFF1000FBFF0000FDFF0200
      FDFFFAFFFDFFF2FFFFFFE2FF0200E1FF0000D1FF0100C5FF0200CBFF0000BEFF
      0300C4FF0300C3FF0200CCFF0100C5FF0300DDFF0000D4FF0400E8FF0100E8FF
      0300FFFF0100FDFF0400160001000E0003001C0002001A000400270003001D00
      05002C0003002100040022000400200005001C00040016000100130000001A00
      FDFF1100FEFF1D00FBFF1900FBFF1E00F7FF1A00F8FF2F00F4FF1C00F7FF2C00
      F3FF2500F5FF3500F4FF2C00F7FF3B00F6FF2300FBFF2E00FAFF1C00FDFF1C00
      FFFF0900020005000200ECFF0500E9FF0600D9FF0700C8FF0900B8FF0900B2FF
      0800AAFF0700A0FF0900A5FF070099FF0800A9FF0500ABFF0600C5FF0400BEFF
      0500DBFF0300E0FF0400FFFF0100070003002500000019000200330000003700
      02004900FFFF410000004A00FEFF390000004000FEFF3600FFFF2E00FFFF1E00
      FCFF1700FBFF0900FCFF0900FCFF0400FAFFF1FFFDFFFBFFFAFFF0FFFBFFF5FF
      FBFFEEFFFCFFF9FFFAFFE7FFFDFFFCFFFBFFF7FFFDFFFDFFFDFFEAFFFEFFF9FF
      FEFFEAFF0200F8FF0200EBFF0400F1FF0300DCFF0400E1FF0500D7FF0500D5FF
      0500CCFF0500D2FF0300CAFF0300D1FF0300DBFF0100DDFF0100EAFFFDFFF5FF
      FDFFFDFFFDFF0800FDFF1B00FBFF1B00FDFF3900FBFF3B00FCFF4400FDFF4700
      FFFF5800FDFF480003005D0003004D0004004800050039000500370005001B00
      05001900050003000500FAFF0500F0FF0200E6FF0300D6FF0100D5FF0000D2FF
      0000D3FFFFFFD3FFFDFFD2FFFDFFD9FFFDFFDFFFFDFFF4FFFBFFF6FFFDFFFBFF
      FDFFFAFFFDFF0900FDFF0300FEFF1100FDFF0A00FDFFFFFF0000FBFF00000000
      FFFFE9FF0100EAFF0100E0FFFFFFD7FF0100D2FF0000D7FF0000C6FF0000C9FF
      0200D0FF0000D4FF0200DEFF0100E1FF0100E7FF0200FDFF0200090003000F00
      03001C000300180003001F0004002E000400350005002D000600330005002D00
      04002C000500240003002400030015000100120000001000FDFF0D00FCFFFFFF
      FBFF0900FBFF0C00F7FF0600F7FF0800F7FF1100F6FF0800F6FF1600F7FF2200
      F6FF1A00F8FF1C00F9FF1C00FBFF1A00FCFF1D00FEFF1C0000000D0003000900
      0300FAFF0500EEFF0600E6FF0700D7FF0800C5FF0900C5FF0800B9FF0500B2FF
      0600AFFF0500B0FF0500ABFF0500BBFF0400C1FF0300C7FF0300D3FF0300EBFF
      0300FDFF02000900020019000200220001002A00010041000200480000004500
      0100460001004600FFFF3C00FFFF3B00FFFF3400FDFF2200FDFF1F00FDFF1400
      FBFF0600FCFF0300FCFFF8FFFBFFEDFFFBFFF3FFFBFFECFFFBFFE4FFFBFFECFF
      FCFFF2FFFBFFEFFFFDFFF7FFFDFFF6FFFEFFF1FF0000F4FF0100FBFF0200F7FF
      0300F6FF0400F1FF0400EEFF0400E4FF0500E5FF0500E0FF0400D9FF0400DCFF
      0300DAFF0200D1FF0100DAFF0100DEFFFEFFDEFFFDFFECFFFCFFF3FFFCFFF7FF
      FBFF0C00FDFF1C00FBFF2200FDFF3700FDFF3900FEFF3B00FEFF4C0000005200
      01004B000300540004004800040041000500380005002F0005001A0005001300
      050003000300F7FF0300EAFF0200DFFF0100D4FFFFFFD1FF0100CDFFFDFFCBFF
      FDFFC8FFFDFFD2FFFDFFDDFFFBFFDFFFFDFFECFFFCFFEFFFFDFFF0FFFDFFFDFF
      FEFF0700FDFF000000000E00FFFF0500FFFFFCFFFFFF0000FFFF0000FFFFECFF
      0000F3FF0100EAFFFFFFDDFF0100E0FFFFFFDFFF0000D3FFFFFFDDFF0100DDFF
      FFFFDDFF0100E9FF0000F0FF0200FDFF01000700030010000200160004002200
      0300240004003200040032000500360004002F000400300004002A0003002A00
      02001D0003001D0001001300FEFF0700FEFF0500FCFF0000FBFFF1FFFBFFF7FF
      FAFFF5FFF7FFE9FFF8FFF9FFF7FFF9FFF7FFF9FFF7FF0500F9FF0D00F8FF0200
      FBFF1100FBFF1000FDFF1000FFFF10000200120002000100040005000300F5FF
      0500F4FF0500EAFF0600E2FF0600D5FF0600D3FF0500C6FF0500C5FF0500C0FF
      0500BEFF0300C0FF0200C5FF0300D2FF0200DEFF0100EAFF0300FAFF03000A00
      00000B0003002400010029000100310002003B0002004900FFFF360001004500
      FFFF3A00FEFF3400FEFF3000FEFF2E00FDFF1600FDFF1B00FDFF0900FCFFFFFF
      FDFFF9FFFCFFEEFFFBFFE4FFFCFFE8FFFBFFE4FFFBFFE2FFFDFFEDFFFDFFE7FF
      FEFFF0FFFEFFEFFF0000F6FF0000F0FF0100FBFF0200F6FF0300FEFF0300F0FF
      0400F7FF0300EEFF0300F1FF0300E9FF0400F0FF0200DDFF0300E7FF0200E4FF
      0000DEFF0000E1FF0000E6FFFCFFDEFFFDFFEEFFFDFFFAFFFCFFFAFFFDFF0E00
      FDFF1800FCFF2100FEFF2E00FEFF3800FEFF3100010048000200420002004300
      03003E0003003E0003002D000300350003001F0003001A000300090003000100
      0300F0FF0300EBFF0100D8FF0100D4FFFEFFCAFFFEFFCAFFFDFFCDFFFDFFCEFF
      FDFFD2FFFDFFDDFFFDFFDFFFFDFFE4FFFDFFF2FFFDFFEBFFFFFFFFFFFFFF0000
      FEFF00000000FFFFFFFF0800FFFFF9FF000007000000FEFFFEFFF8FF0000F8FF
      0000FAFF0000E8FF0100F3FF0100E9FF0000E4FF0000E9FF0000EFFF0000F0FF
      0100FAFF0000020002000600020013000300170003001F000400230003002900
      04002E00030030000300250003002D00030023000200250002001E0000001800
      01000900FFFF0900FEFFFEFFFDFFFCFFFDFFF0FFFBFFE8FFFBFFE9FFFAFFE8FF
      F9FFE2FFFAFFEDFFF9FFF0FFF9FFECFFFAFFFCFFFBFF0000FBFFFAFFFDFF0400
      FEFF0D000000020000000A0002000500030000000300FEFF030001000500F6FF
      0500F4FF0500EDFF0500E8FF0600E1FF0500DEFF0500D9FF0400D4FF0400D2FF
      0300DDFF0300DFFF0300E7FF0100F4FF0100FDFF010005000100100000001600
      0300220001002B0001002E000000350001003400FFFF2F0000003400FEFF2F00
      FDFF2500FDFF2400FEFF1C00FDFF0E00FEFF0F00FDFF0300FDFFF3FFFDFFF0FF
      FDFFEEFFFDFFE4FFFDFFE6FFFDFFE6FFFDFFE5FFFEFFE9FFFEFFECFFFFFFF0FF
      FFFFF0FF0100F6FF0100F8FF0200FAFF0200F8FF0200FBFF0100F4FF0300FAFF
      0200F8FF0200F8FF0200F1FF0300F6FF0100EAFF0300F3FF0100ECFF0000EBFF
      0000ECFFFFFFF1FFFEFFEDFFFEFFFBFFFDFF0000FDFF0200FDFF1000FDFF1900
      FDFF1C00FFFF270000002F0001002E0002003800010032000300320003002D00
      03002F0002002200030024000300110003001000030000000300FDFF0200ECFF
      0100E9FF0000D9FF0100DAFFFEFFD0FFFEFFD4FFFEFFD3FFFDFFD7FFFDFFDDFF
      FDFFE4FFFDFFE2FFFDFFEDFFFEFFF7FFFFFFF2FF00000100FEFFFFFFFFFFFFFF
      00000000FFFF0B00FFFFFDFF00000B00FFFF0100000003000100FDFF00000300
      0000F4FF0200FEFF0100F3FF0200F9FF0200F7FF0100FFFF0100FCFF02000900
      0200070002001200020015000300190003002000030022000300230003002300
      0200220002001C00030023000100160000001B0000001000FFFF0900FFFFFFFF
      FFFF0300FEFFF0FFFDFFF6FFFDFFEAFFFDFFE7FFFDFFE1FFFBFFEAFFFBFFDFFF
      FBFFECFFFBFFEAFFFBFFEFFFFDFFF5FFFDFFFDFFFDFFF9FFFFFF020000000300
      0000000001000400020002000200020003000100030003000400FBFF0400FCFF
      0400F5FF0500F7FF0400ECFF0300F0FF0400E9FF0300E9FF0300E6FF0300F2FF
      0200EEFF0100F9FF0000FFFF0000030000000700000017000100170000001E00
      00002200000022000000230000002500FEFF2200FFFF2200FDFF2100FDFF1700
      FEFF1800FEFF0E00FDFF0500FEFF0200FEFFFCFFFEFFEFFFFEFFF1FFFEFFECFF
      FDFFE9FFFDFFEAFFFDFFECFFFFFFE7FFFEFFEFFFFFFFEFFF0000F4FF0000F2FF
      0000F7FF0200F8FF0200F7FF0100F8FF0200FCFF0100F8FF0200FAFF0100FDFF
      0100FBFF0100F7FF0100FAFF0000F6FF0200F6FF0000F7FF0000F4FF0000F5FF
      0000F9FFFEFFFAFFFFFFFEFFFDFF0300FEFF0500FEFF0E00FFFF1600FFFF1900
      00002000000022000000200001002300020022000200220002001E0002001D00
      020015000300100002000900030004000100FBFF0200F7FF0100EFFF0000E8FF
      FFFFDFFF0000E3FFFEFFDCFFFFFFDDFFFEFFDDFFFEFFE0FFFDFFE2FFFEFFEAFF
      FEFFECFFFEFFF2FFFFFFF7FFFFFFF8FFFFFFFDFF00000000FFFF000000000200
      00000600FFFF040000000800000005000100060001000300010006000100FDFF
      020001000100FEFF020002000100020002000500010003000100090000000A00
      0200110001001200020016000200150002001700020016000200170000001200
      0100120001001000FFFF0C000000090000000300FFFFFFFFFFFFFAFFFFFFFBFF
      FDFFEFFFFDFFEFFFFDFFE8FFFDFFE9FFFDFFE5FFFDFFE9FFFCFFE4FFFDFFEAFF
      FCFFECFFFDFFF6FFFDFFF3FFFEFFFBFFFEFFF7FF0000FEFF0000FFFF01000300
      0100010002000500020003000300040003000300030001000300FFFF0300FEFF
      0300FDFF0300F8FF0300F8FF0300F6FF0300F7FF0200F7FF0100FBFF0000F7FF
      00000100000003000000090000000A0000001200000010000000180000001600
      00001900FFFF160000001A00FFFF1600FFFF1600FFFF1000FFFF1000FFFF0900
      FFFF0700FFFF0200FFFFFCFFFFFFF8FFFFFFF5FFFFFFF2FFFFFFF0FFFFFFF0FF
      FFFFEAFFFFFFEEFFFFFFF0FF0000F3FF0000F1FF0000F7FF0000F4FF0100FBFF
      0100F9FF0000FBFF0100F8FF0100FDFF0100FBFF000000000100FEFF0000FDFF
      0100FDFF0100FFFF0100FBFF0000FDFF0000FBFF0000FBFF0000FDFF0000FDFF
      FFFFFDFFFFFF0000FFFF0500FFFF0900FFFF0F00000010000000130000001500
      0000170000001600010018000100140001001700010013000100100001000B00
      0100080001000200020001000000F9FF0000F5FF0000F1FF0000ECFFFFFFE9FF
      0000E6FFFEFFE4FFFEFFE5FFFEFFEAFFFEFFEAFFFEFFEEFFFFFFF0FFFFFFF2FF
      FFFFF7FFFFFFFCFFFFFFFDFFFFFF000000000100000003000000060000000800
      0000050000000800010008000100080001000900010005000100050001000500
      010005000100050000000500010005000100090001000A0001000B0001000D00
      01000E0001000F000100100001000E0000000B0001000B000000090000000900
      00000800000003000000000000000000FFFFFBFFFFFFF8FFFFFFF6FFFEFFF1FF
      FEFFEFFFFEFFEFFFFEFFEAFFFDFFEBFFFDFFEBFFFDFFF0FFFDFFF0FFFEFFF4FF
      FEFFF4FFFFFFF9FFFFFFFBFF0000FEFF00000000000000000100010001000500
      0100050002000500020005000200030003000500020003000200030002000000
      020001000200FDFF0200FFFF0100FBFF0000FEFF0100FEFF0000030000000200
      00000600000005000000090000000B0000000E0000000C000000100000000D00
      00000F000000100000000D00FFFF09000000070000000600FFFF030000000300
      FFFFFEFFFFFFFDFF0000F8FF0000F8FF0000F4FFFFFFF5FFFFFFF2FFFFFFF6FF
      FFFFF2FF0000F7FF0000F6FF0000F9FF0000F8FF0000FCFF0000FAFF0000FCFF
      0000FCFF0000FDFF0000FFFF000000000000FFFF0100FFFF010000000100FFFF
      010000000000FFFF0000FFFF0000FEFF0000FFFF0000FDFF0000000000000000
      0000030000000400000007000000080000000C0000000C0000000E0000000C00
      00000E0000000D0000000E0001000C0000000900000006000100050000000300
      000000000000FDFF0000FBFF0000F7FF0000F4FF0000F1FFFFFFEFFFFFFFEFFF
      FFFFF0FFFEFFF0FFFFFFF0FFFFFFF3FFFFFFF4FFFFFFF7FF0000FAFFFFFFFBFF
      0000FDFF0000FEFF000001000000030000000400000005000100050001000500
      0000070001000800010007000100070001000600010005000000050001000500
      0100050001000500000005000100050000000500000006000000070000000800
      0000060000000600000005000000040000000500000004000000010000000000
      0000FEFF0000FDFF0000FBFFFFFFFBFFFFFFF8FFFFFFF7FFFFFFF5FFFFFFF3FF
      FFFFF3FFFFFFF2FFFFFFF3FFFFFFF4FFFFFFF6FFFEFFF7FFFFFFFAFFFFFFFBFF
      0000FDFF0000FEFF000000000000010000000300000003000100050001000500
      0100050001000400010005000100040001000400010003000100020001000000
      0000000000000000000000000000000000000100000002000000020000000300
      0000040000000500000005000000060000000500000007000000050000000600
      0000050000000500000003000000030000000000000001000000FEFF0000FDFF
      0000FCFF0000FBFF0000FBFF0000FBFF0000FBFF0000FAFF0000FBFF0000FBFF
      0000FBFF0000FCFF0000FCFF0000FCFF0000FDFF0000FDFF0000FFFF00000000
      0000000000000000010000000000FFFF00000000000000000000000000000000
      000000000000FFFF000000000000000000000000000000000000010000000100
      0000030000000300000003000000050000000400000005000000050000000500
      0000050000000500000003000000030000000200000000000000000000000000
      0000FDFF0000FDFF0000FBFF0000FBFF0000FBFF0000F9FF0000F9FF0000FBFF
      0000FAFF0000FBFF0000FCFF0000FDFF0000FDFF0000FEFF0000FFFF00000000
      0000010000000200000002000000030000000300000003000000030000000300
      0000030000000300000003000000030000000300000003000000030000000300
      0000030000000300000002000000020000000300000002000000030000000200
      0000010000000100000001000000000000000000000000000000FFFF0000FFFF
      0000FEFF0000FDFF0000FDFF0000FCFF0000FCFF0000FCFF0000FCFF0000FCFF
      0000FCFF0000FDFF0000FDFF0000FDFF0000FDFF0000FEFF0000FFFF00000000
      0000000000000000000001000000020000000100000002000000020000000100
      0000010000000200000001000000010000000100000000000000000000000000
      0000000000000000000000000000000000000000000001000000000000000100
      0000000000000100000000000000010000000000000001000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000004C49535428000000494E464F49434F501B000000
      31393938204D6963726F736F667420436F72706F726174696F6E0000}
    Left = 304
    Top = 240
  end
  object ER: TcxEditRepository
    Left = 280
    Top = 352
    object erSimNao: TcxEditRepositoryImageComboBoxItem
      Properties.Alignment.Horz = taCenter
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items = <
        item
          Description = 'N'#227'o'
          ImageIndex = 0
          Value = False
        end
        item
          Description = 'Sim'
          Value = True
        end>
    end
    object erFidelidade: TcxEditRepositoryImageComboBoxItem
      Properties.Alignment.Horz = taCenter
      Properties.Images = im16
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items = <
        item
          Description = 'N'#227'o'
          Value = False
        end
        item
          Description = 'Sim'
          ImageIndex = 0
          Value = True
        end>
      Properties.ShowDescriptions = False
    end
    object erTipoTran: TcxEditRepositoryImageComboBoxItem
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items = <
        item
          Description = 'Inicio de Sess'#227'o'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Fim de Sess'#227'o'
          ImageIndex = 1
          Value = 1
        end
        item
          Description = 'Cr'#233'dito de Tempo'
          ImageIndex = 2
          Value = 2
        end
        item
          Description = 'Remover Tempo'
          ImageIndex = 3
          Value = 3
        end
        item
          Description = 'Venda'
          ImageIndex = 4
          Value = 4
        end
        item
          Description = 'Compra'
          ImageIndex = 5
          Value = 5
        end
        item
          Description = 'Entrada de Estoque'
          ImageIndex = 6
          Value = 6
        end
        item
          Description = 'Sa'#237'da de Estoque'
          ImageIndex = 7
          Value = 7
        end
        item
          Description = 'Pagamento de D'#233'bito'
          ImageIndex = 11
          Value = 8
        end
        item
          Description = 'Suprimento de Caixa'
          ImageIndex = 12
          Value = 9
        end
        item
          Description = 'Sangria de Caixa'
          ImageIndex = 13
          Value = 10
        end
        item
          Description = 'Impress'#227'o'
          Value = 11
        end
        item
          Description = 'Transf.M'#225'quina'
          Value = 12
        end
        item
          Description = 'Corre'#231#227'o de Caixa'
          Value = 13
        end
        item
          Description = 'Corre'#231#227'o Fidelidade'
          Value = 14
        end>
    end
    object erTipoItem: TcxEditRepositoryImageComboBoxItem
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items = <
        item
          Description = 'Uso do computador'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Produto'
          Value = 1
        end
        item
          Description = 'Cr'#233'dito de Tempo'
          Value = 2
        end
        item
          Description = 'Impress'#227'o'
          Value = 4
        end
        item
          Description = 'Corre'#231#227'o nos pontos'
          Value = 5
        end>
    end
    object erFidOpe: TcxEditRepositoryImageComboBoxItem
      Properties.Images = im16
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items = <
        item
          Description = 'Ac'#250'mulo de Pontos'
          ImageIndex = 0
          Value = 1
        end
        item
          Description = 'Resgate de Pr'#234'mio'
          ImageIndex = 1
          Value = 2
        end
        item
          Description = 'Corre'#231#227'o nos Pontos'
          ImageIndex = 2
          Value = 3
        end>
    end
    object erTipoPremioAuto: TcxEditRepositoryImageComboBoxItem
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items = <
        item
          Description = 'Pacote'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Passaporte'
          Value = 1
        end>
    end
    object erTarifa: TcxEditRepositoryColorComboBox
      Properties.CustomColors = <
        item
          Color = clBlack
        end>
      Properties.DefaultColor = clWhite
      Properties.DefaultDescription = 'Selecione uma tarifa'
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.NamingConvention = cxncNone
      Properties.PrepareList = cxplNone
      Properties.OnInitPopup = erTarifaPropertiesInitPopup
    end
  end
  object im16: TcxImageList
    FormatVersion = 1
    DesignInfo = 22544712
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000070000001A0000002500000027000000270000
          00250000001A0000000700000000000000000000000000000000000000000000
          0000000000000000000000000019000000620000008B00000091000000910000
          008A000000600000001800000000000000000000000000000000000000000000
          00000000000000000000026706CF0E8E18FF0B8A15FF0A8814FF098512FF004F
          02CF000000790000001F00000000000000000000000000000000000000000000
          00010000000100000001036A07CF51DA7BFF3ACF69FF39CD67FF32C25BFF0151
          02D00000007B0000002000000001000000010000000100000000000000070000
          001A0000002100000022046807D05CE084FF3ED46EFF3DD36DFF34C55FFF0252
          03D0000000850000003A000000210000002000000019000000070000001B0000
          00640000007F00000080046309D364E48AFF41D771FF3FD56FFF37C861FF0252
          04D0000000A3000000860000007D0000007C000000620000001A07770DD5066E
          0DD8056A0CD905680BD908810EF156E282FF44DA74FF41D872FF39CB64FF0371
          07ED035805D5035704D5025603D5015403D50000008B0000002521A72DFF60E4
          87FF4BDD79FF4ADC78FF49DC77FF4AE07AFF46DD77FF44DB75FF40D670FF3BCD
          67FF39CB65FF36C862FF33C45EFF0A8413FF000000910000002722A92FFF76F0
          99FF5EEA8AFF5AE888FF56E684FF53E481FF4EE17DFF47DE78FF44DB75FF41D8
          72FF3FD56FFF3DD36DFF39CD67FF0B8715FF000000910000002724AB30FF7EF3
          9FFF68EE91FF64ED8EFF60EA8BFF59E886FF54E482FF4EE17DFF46DD77FF44DA
          74FF41D771FF3ED46EFF3ACF69FF0C8916FF0000008B0000002525AD32FF91F7
          ABFF8DF6A8FF8BF5A6FF89F4A5FF7AF09BFF59E886FF53E481FF4ADF7AFF5BE4
          86FF67E58CFF5EE186FF53DB7CFF0F8D1AFF000000620000001A077E10CE087B
          10CF07790FCF07770FCF0A8A14EF89F4A5FF60EA8BFF56E684FF45D872FF077C
          0DED046309D3056809D0046809CF036607CF0000001900000007000000000000
          0001000000010000000107770FCF8BF5A6FF64ED8EFF5AE888FF45D771FF045C
          09D00000007B0000002000000001000000010000000100000000000000000000
          0000000000000000000008790FCF8DF6A8FF68EE91FF5EEA8AFF46D872FF045E
          09CF000000790000001F00000000000000000000000000000000000000000000
          00000000000000000000097A10CF91F7ABFF7FF39FFF76F099FF58DF7FFF0563
          0BCE000000600000001800000000000000000000000000000000000000000000
          00000000000000000000087D12CE26AD33FF25AB32FF23A930FF21A62EFF066E
          0CC90000001A0000000700000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000001000000090000001800000022000000230000
          001B0000000D0000000300000000000000000000000000000000000000000000
          0000000000000000000200000012000000390000006700000082000000840000
          006E000000430000001900000004000000000000000000000000000000000000
          000000000001000000110013195B004864B7006F9BE9006F9EEE004765C70011
          19A00000008F0000005300000016000000010000000000000000000000000000
          000000000007002A37620691C0F42AC6EAFF4BE5FFFF4BE5FFFF0EB3E1FF0082
          B6FD002231A70000008B00000038000000080000000000000000000000000000
          000000121829089BC7F14DE9FFFF34CAECFF25B3DAFF20ADD6FF52CAE1FF36DC
          FDFF007BB0FB000B0F9C0000005A000000130000000000000000000000000000
          000000556F8639D2F3FF1DC3EDFF2BC0E5FF4BE6FFFF32DFFFFF18ACD7FF2FB1
          D4FF08ABDBFF002F44AD00000068000000180000000000000000000000000000
          000000799EAE43DFFCFF2AD7FEFF43D6F3FF57EAFFFF42E4FFFF1CC1EBFF73EC
          F9FF20C5EDFF004665BD00000060000000150000000000000000000000000000
          0000007598A142DEFBFF10C6F3FF4EDCF5FF68EFFFFF52E9FFFF24C6EDFF28B1
          D7FF1CC0EAFF003E57AE000000410000000B0000000000000000000000000000
          00000042535632D1F2FF26DBFFFF15CBF7FF45D7F5FF34CFF2FF36CCEFFF5FF2
          FFFF039ECFFE001D28780000001D000000020000000000000000000000000000
          0000000102020089ABBA41DAF7FF2ED9FEFF28D7FEFF37DCFEFF45DEFBFF18B8
          E2FF005773AE0000002700000006000000000000000000000000000000000000
          00000000000000080A0D006F8F9F0DC2F0FA26D2FAFF20CCF6FF009DCCEE0039
          4CA50001015D0000001E00000004000000000000000000000000000000000000
          0000000000000000000F1E1110635F4042D4646871FF665662FF61242ADC0612
          03A2000000900000004D00000012000000000000000000000000000000000000
          0000000000022E20205B9D6A69F9BE7876FFC47378FF5D8F47FF0D9615FF0E7A
          15FE021D05A40000008000000027000000030000000000000000000000000000
          00000202020A986A69E2DA8786FFD58183FFAA8670FF07B529FF11AD25FF0B9B
          16FF096E14EC0002008F00000036000000070000000000000000000000000000
          0000261B1B34CB8C89FFF39091FFE9888BFF939A6BFF12BA38FF18B331FF14B1
          29FF0B8516FF0216047B00000028000000050000000000000000000000000000
          00001D161624B38382ECB68582F9AF7B7AF899756CF5319744F31A9737F11792
          2FF1117B22DB021104360000000A000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000020000
          000E0000001F0000002000000019000000100000000900000003000000010000
          0001000000000000000000000000000000000000000000000000000000090000
          0037000000740000007C00000068000000520000003C0000002A0000001E0000
          0014000000090000000100000000000000000000000000000000281B1B4E9F70
          70F3856262D8482F2DB6251919A20E0A0A9A010101970000008B000000760000
          005A000000300000000A0000000000000000000000000000000037242465D1AA
          A8FEFFFFFFFF98A9FFFFF0D8D4FFD3B1B3FFAC898AF36D4C4CCB3C2727AE160F
          0F940000005B00000015000000000000000000000000000000003E292973D8B2
          AEFEFFF7E0FF99A3E8FFFFF1D8FFF9E1CEFFFFECDDFFFFF5F1FFFAE6E7FF4F34
          34B800000061000000160000000000000000000000000000000048303081DFBB
          B3FEFFF6DDFF9DA5E8FFF8E3D0FFD6C9C6FFFFF7F3FFFFEBDDFFFFE0CDFF412B
          2BAD0000005800000012000000000000000000000000000000005236368EE7C7
          C5FEFFFEF4FFA0B1FDFFF0E7E2FF424B53FF78716AFFB6B28DFFFED9CAFF3422
          23A50000005700000013000000000000000000000000000000005B3C3C9BF0D3
          D1FEFFFAE9FFA3ACEBFFFFF4DDFF669EA8FF24A942FF139A2BFF367D32FF2719
          1AA2000000720000002700000005000000000000000000000000654444A9F6D9
          D0FEFFF6E0FFA4AEEAFFFFF4E0FF4EBB72FF62FF96FF52E17BFF1E9C33FF0038
          02BA0000009C0000006000000020000000040000000000000000744F4FB6FAE4
          DEFEFFFDEFFFA8B7F5FFFFFBF5FF99D9A4FF3BDC6CFF64FE96FF4DDA74FF1E96
          2FFF012E03B0000000990000005A0000001D0000000400000000825B5BC4FCEB
          E8FEFFFFF4FFAABAF5FFFFF8E9FFFFF4EEFF64CF86FF4AE779FF63FB95FF49D3
          6CFF168E25FE002501AA00000096000000550000001900000002936869D1FDEA
          DDFEFFFAE2FFB0BBEEFFFFF8DFFFFFF2E0FFFFEFDFFF4BCD71FF55F386FF5DFE
          90FF5BA169FF6E6E67FE201F1DA800000090000000470000000EA77878DFE1DA
          DCFDE2E4E3FFA8B3D6FFB3B4B3FFA1A2A3FFA6A2A4FFACAEADFF25C056FF8ABF
          99FFDFD4D2FF6A77C1FF1624B2FC000117A0000000720000001CB78585ECC1B7
          B6FD817E81FF69656CFF6D6261FF908080FF887878FE7B6667F03A5140E5CFC6
          C1FA7992F3FF3862F2FF1F36C7FF00007DE300000065000000185F4949A86750
          50BC3F3A3AC7454343E0494747E2403D3DCB404040CD454646CF212120783B40
          59732B50E5FE436CF4FF1625B8FF00005FBE0000002D00000008141414293F41
          41B334343498292929781F1F1F5C151515430D0D0D2B05050514000000030000
          00010B1162830C14A0F2000067B600000B290000000800000001}
      end>
  end
  object nxTCPIP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    CommandHandler = SimpleCmdHandler
    Timeout = 20000
    OnConnectionLost = nxTCPIPConnectionLost
    ServerNameDesigntime = '127.0.0.1'
    Port = 16200
    WatchdogInterval = 15000
    LostConnectionTimeout = 30000
    CallbackThreadCount = 2
    Left = 312
    Top = 16
  end
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 32
    Top = 352
  end
  object PClient: TRtcHttpPortalClient
    UserNotify = True
    OnLogIn = PClientLogIn
    OnUserLoggedIn = PClientUserLoggedIn
    OnUserLoggedOut = PClientUserLoggedOut
    AutoSyncEvents = True
    DataEncrypt = 16
    DataForceEncrypt = True
    RetryOtherCalls = 5
    MultiThreaded = True
    GatePort = '16205'
    Left = 116
    Top = 396
  end
  object PFileTrans: TRtcPFileTransfer
    GAllowBrowse = False
    GAllowBrowse_Super = False
    Left = 172
    Top = 396
  end
  object PDesktopControl: TRtcPDesktopControl
    Client = PClient
    OnNewUI = PDesktopControlNewUI
    Left = 244
    Top = 396
  end
  object mtImp: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'JobID'
        DataType = ftInteger
      end
      item
        Name = 'Computer'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Maquina'
        DataType = ftWord
      end
      item
        Name = 'PrinterName'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'PrinterShare'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'PrinterPort'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'PrinterServer'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'User'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'Pages'
        DataType = ftInteger
      end
      item
        Name = 'TotalPages'
        DataType = ftInteger
      end
      item
        Name = 'Copies'
        DataType = ftInteger
      end
      item
        Name = 'ClientPages'
        DataType = ftInteger
      end
      item
        Name = 'PrinterIndex'
        DataType = ftInteger
      end
      item
        Name = 'Pausou'
        DataType = ftBoolean
      end
      item
        Name = 'Liberacao'
        DataType = ftWord
      end
      item
        Name = 'ImpID'
        DataType = ftInteger
      end
      item
        Name = 'Status'
        DataType = ftWord
      end
      item
        Name = 'PrtHandle'
        DataType = ftInteger
      end
      item
        Name = 'Document'
        DataType = ftMemo
      end
      item
        Name = 'Spooling'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'PrinterIndex;JobID'
    IndexName = 'mtImpIndex1'
    IndexDefs = <
      item
        Name = 'mtImpIndex1'
        Fields = 'PrinterIndex;JobID'
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
    AfterDelete = mtImpAfterDelete
    OnCalcFields = mtImpCalcFields
    Left = 392
    Top = 392
    object mtImpJobID: TIntegerField
      FieldName = 'JobID'
    end
    object mtImpComputer: TStringField
      FieldName = 'Computer'
      Size = 100
    end
    object mtImpMaquina: TWordField
      FieldName = 'Maquina'
    end
    object mtImpPrinterName: TStringField
      FieldName = 'PrinterName'
      Size = 300
    end
    object mtImpPrinterShare: TStringField
      FieldName = 'PrinterShare'
      Size = 300
    end
    object mtImpPrinterPort: TStringField
      FieldName = 'PrinterPort'
      Size = 300
    end
    object mtImpPrinterServer: TStringField
      FieldName = 'PrinterServer'
      Size = 300
    end
    object mtImpUser: TStringField
      FieldName = 'User'
      Size = 300
    end
    object mtImpPages: TIntegerField
      FieldName = 'Pages'
    end
    object mtImpTotalPages: TIntegerField
      FieldName = 'TotalPages'
    end
    object mtImpCopies: TIntegerField
      FieldName = 'Copies'
    end
    object mtImpClientPages: TIntegerField
      FieldName = 'ClientPages'
    end
    object mtImpPrinterIndex: TIntegerField
      FieldName = 'PrinterIndex'
    end
    object mtImpPausou: TBooleanField
      FieldName = 'Pausou'
    end
    object mtImpLiberacao: TWordField
      FieldName = 'Liberacao'
    end
    object mtImpImpID: TIntegerField
      FieldName = 'ImpID'
    end
    object mtImpStatus: TWordField
      FieldName = 'Status'
    end
    object mtImpPrtHandle: TIntegerField
      FieldName = 'PrtHandle'
    end
    object mtImpDocument: TMemoField
      FieldName = 'Document'
      BlobType = ftMemo
    end
    object mtImpPaginasReg: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'PaginasReg'
      Calculated = True
    end
    object mtImpSpooling: TBooleanField
      FieldName = 'Spooling'
    end
  end
  object GL: TLMDGenericList
    Left = 456
    Top = 352
    object TLMDGenericListItem
      Internal = {
        08A65F01003C3F786D6C2076657273696F6E3D22312E312220656E636F64696E
        673D227574662D38223F3E0D0A3C5265736F757263657320436F646550616765
        3D2231323532223E0D0A20203C537472526573204E616D653D22312220546578
        743D224F4B222F3E0D0A20203C537472526573204E616D653D22322220546578
        743D2243616E63656C6172222F3E0D0A20203C537472526573204E616D653D22
        332220546578743D22546F646173222F3E0D0A20203C537472526573204E616D
        653D22342220546578743D2250C3A167696E6120617475616C222F3E0D0A2020
        3C537472526573204E616D653D22352220546578743D2250C3A167696E61733A
        222F3E0D0A20203C537472526573204E616D653D22362220546578743D225175
        656272612064652070C3A167696E61222F3E0D0A20203C537472526573204E61
        6D653D22372220546578743D22496E74657276616C6F2064652070C3A167696E
        6173222F3E0D0A20203C537472526573204E616D653D22382220546578743D22
        436F6E666967757261C3A7C3B56573206465204578706F727461C3A7C3A36F22
        2F3E0D0A20203C537472526573204E616D653D22392220546578743D22496E66
        6F726D65206EC3BA6D65726F7320652F6F7520696E74657276616C6F73206465
        2070C3A167696E61732C20736570617261646F7320706F722076C3AD7267756C
        61732E2045782E3A20312C332C352D3132222F3E0D0A20203C53747252657320
        4E616D653D223130302220546578743D2256697375616C697A6172222F3E0D0A
        20203C537472526573204E616D653D223130312220546578743D22496D707269
        6D6972222F3E0D0A20203C537472526573204E616D653D223130322220546578
        743D22496D7072696D6972222F3E0D0A20203C537472526573204E616D653D22
        3130332220546578743D224162726972222F3E0D0A20203C537472526573204E
        616D653D223130342220546578743D224162726972222F3E0D0A20203C537472
        526573204E616D653D223130352220546578743D2253616C766172222F3E0D0A
        20203C537472526573204E616D653D223130362220546578743D2253616C7661
        72222F3E0D0A20203C537472526573204E616D653D223130372220546578743D
        224578706F72746172222F3E0D0A20203C537472526573204E616D653D223130
        382220546578743D224578706F72746172222F3E0D0A20203C53747252657320
        4E616D653D223130392220546578743D224C6F63616C697A6172222F3E0D0A20
        203C537472526573204E616D653D223131302220546578743D224C6F63616C69
        7A6172222F3E0D0A20203C537472526573204E616D653D223131312220546578
        743D2250C3A167696E6120496E7465697261222F3E0D0A20203C537472526573
        204E616D653D223131322220546578743D2250C3A167696E6120496E74656972
        61222F3E0D0A20203C537472526573204E616D653D223131332220546578743D
        2254616D616E686F2064612050C3A167696E61222F3E0D0A20203C5374725265
        73204E616D653D223131342220546578743D2254616D616E686F2064612050C3
        A167696E61222F3E0D0A20203C537472526573204E616D653D22313135222054
        6578743D2231303025222F3E0D0A20203C537472526573204E616D653D223131
        362220546578743D2231303025222F3E0D0A20203C537472526573204E616D65
        3D223131372220546578743D22447561732050C3A167696E6173222F3E0D0A20
        203C537472526573204E616D653D223131382220546578743D22447561732050
        C3A167696E6173222F3E0D0A20203C537472526573204E616D653D2231313922
        20546578743D225A6F6F6D222F3E0D0A20203C537472526573204E616D653D22
        3132302220546578743D224D617267656E73222F3E0D0A20203C537472526573
        204E616D653D223132312220546578743D224D617267656E73222F3E0D0A2020
        3C537472526573204E616D653D223132322220546578743D22526573756D6F22
        2F3E0D0A20203C537472526573204E616D653D223132332220546578743D2252
        6573756D6F222F3E0D0A20203C537472526573204E616D653D22313234222054
        6578743D2241756D656E7461205A6F6F6D222F3E0D0A20203C53747252657320
        4E616D653D223132352220546578743D2241756D656E7461205A6F6F6D222F3E
        0D0A20203C537472526573204E616D653D223132362220546578743D2244696D
        696E7569205A6F6F6D222F3E0D0A20203C537472526573204E616D653D223132
        372220546578743D2244696D696E7569205A6F6F6D222F3E0D0A20203C537472
        526573204E616D653D223132382220546578743D224D61726361646F72222F3E
        0D0A20203C537472526573204E616D653D223132392220546578743D224D6172
        6361646F7220646F2072656C6174C3B372696F222F3E0D0A20203C5374725265
        73204E616D653D223133302220546578743D224D696E696174757261222F3E0D
        0A20203C537472526573204E616D653D223133312220546578743D224D696E69
        617475726120646F2072656C6174C3B372696F222F3E0D0A20203C5374725265
        73204E616D653D223133322220546578743D22456469746172222F3E0D0A2020
        3C537472526573204E616D653D223133332220546578743D2245646974617220
        50C3A167696E61222F3E0D0A20203C537472526573204E616D653D2231333422
        20546578743D225072696D65697261222F3E0D0A20203C537472526573204E61
        6D653D223133352220546578743D225072696D656972612050C3A167696E6122
        2F3E0D0A20203C537472526573204E616D653D223133362220546578743D2241
        6E746572696F72222F3E0D0A20203C537472526573204E616D653D2231333722
        20546578743D2250C3A167696E6120416E746572696F72222F3E0D0A20203C53
        7472526573204E616D653D223133382220546578743D225072C3B378696D6122
        2F3E0D0A20203C537472526573204E616D653D223133392220546578743D2250
        72C3B378696D612050C3A167696E61222F3E0D0A20203C537472526573204E61
        6D653D223134302220546578743D22C39A6C74696D61222F3E0D0A20203C5374
        72526573204E616D653D223134312220546578743D22C39A6C74696D612050C3
        A167696E61222F3E0D0A20203C537472526573204E616D653D22313432222054
        6578743D224EC3BA6D65726F2064612050C3A167696E61222F3E0D0A20203C53
        7472526573204E616D653D223135302220546578743D2254656C612043686569
        61222F3E0D0A20203C537472526573204E616D653D223135312220546578743D
        224578706F72746172207061726120504446222F3E0D0A20203C537472526573
        204E616D653D223135322220546578743D22456E7669617220706F7220656D61
        696C222F3E0D0A20203C537472526573204E616D653D227A6D50616765576964
        74682220546578743D2254616D616E686F2064612050C3A167696E61222F3E0D
        0A20203C537472526573204E616D653D227A6D57686F6C655061676522205465
        78743D2250C3A167696E6120496E7465697261222F3E0D0A20203C5374725265
        73204E616D653D223230302220546578743D22496D7072696D6972222F3E0D0A
        20203C537472526573204E616D653D223230312220546578743D22496D707265
        73736F7261222F3E0D0A20203C537472526573204E616D653D22323032222054
        6578743D2250C3A167696E6173222F3E0D0A20203C537472526573204E616D65
        3D223230332220546578743D224EC3BA6D65726F2064652063C3B37069617322
        2F3E0D0A20203C537472526573204E616D653D223230342220546578743D2241
        677275706172222F3E0D0A20203C537472526573204E616D653D223230352220
        546578743D2243C3B370696173222F3E0D0A20203C537472526573204E616D65
        3D223230362220546578743D22496D7072696D6972222F3E0D0A20203C537472
        526573204E616D653D223230372220546578743D224F7574726173204F70C3A7
        C3B56573222F3E0D0A20203C537472526573204E616D653D2232303822205465
        78743D224F6E64653A222F3E0D0A20203C537472526573204E616D653D223230
        392220546578743D2250726F7072696564616465732E2E2E222F3E0D0A20203C
        537472526573204E616D653D223231302220546578743D22496D7072696D6972
        2070617261206172717569766F222F3E0D0A20203C537472526573204E616D65
        3D223231312220546578743D224F7264656D222F3E0D0A20203C537472526573
        204E616D653D223231322220546578743D224E6F6D653A222F3E0D0A20203C53
        7472526573204E616D653D223231332220546578743D224D6F646F20696D7072
        6573736F7261222F3E0D0A20203C537472526573204E616D653D223231342220
        546578743D2243C3B370696120646120696D7072657373C3A36F222F3E0D0A20
        203C537472526573204E616D653D223231362220546578743D2244697265C3A7
        C3A36F222F3E0D0A20203C537472526573204E616D653D227070416C6C222054
        6578743D22546F6461732061732070C3A167696E6173222F3E0D0A20203C5374
        72526573204E616D653D2270704F64642220546578743D2250C3A167696E6173
        20C3AD6D7061726573222F3E0D0A20203C537472526573204E616D653D227070
        4576656E2220546578743D2250C3A167696E6173207061726573222F3E0D0A20
        203C537472526573204E616D653D22706744656661756C742220546578743D22
        50616472C3A36F222F3E0D0A20203C537472526573204E616D653D22706D4465
        6661756C742220546578743D2250616472C3A36F222F3E0D0A20203C53747252
        6573204E616D653D22706D53706C69742220546578743D225265706172746972
        2070C3A167696E6173206772616E646573222F3E0D0A20203C53747252657320
        4E616D653D22706D4A6F696E2220546578743D224A756E7461722070C3A16769
        6E61732070657175656E6173222F3E0D0A20203C537472526573204E616D653D
        22706D5363616C652220546578743D22457363616C61222F3E0D0A20203C5374
        72526573204E616D653D22706F4469726563742220546578743D224469726574
        612028312D3929222F3E0D0A20203C537472526573204E616D653D22706F5265
        76657273652220546578743D22496E76657273612028392D3129222F3E0D0A20
        203C537472526573204E616D653D223330302220546578743D224C6F63616C69
        7A617220546578746F222F3E0D0A20203C537472526573204E616D653D223330
        312220546578743D22546578746F2070617261206C6F63616C697A61723A222F
        3E0D0A20203C537472526573204E616D653D223330322220546578743D224F70
        C3A7C3B56573206465207065737175697361222F3E0D0A20203C537472526573
        204E616D653D223330332220546578743D225375627374697475697220706F72
        222F3E0D0A20203C537472526573204E616D653D223330342220546578743D22
        50657371756973617220646F20696EC3AD63696F222F3E0D0A20203C53747252
        6573204E616D653D223330352220546578743D224469666572656E6369617220
        6D6169C3BA7363756C6173206465206D696EC3BA7363756C6173222F3E0D0A20
        203C537472526573204E616D653D223430302220546578743D22436F6E666967
        757261C3A7C3B565732064612070C3A167696E61222F3E0D0A20203C53747252
        6573204E616D653D223430312220546578743D224C617267757261222F3E0D0A
        20203C537472526573204E616D653D223430322220546578743D22416C747572
        61222F3E0D0A20203C537472526573204E616D653D223430332220546578743D
        2254616D616E686F222F3E0D0A20203C537472526573204E616D653D22343034
        2220546578743D224F7269656E7461C3A7C3A36F222F3E0D0A20203C53747252
        6573204E616D653D223430352220546578743D224573717565726461222F3E0D
        0A20203C537472526573204E616D653D223430362220546578743D2253757065
        72696F72222F3E0D0A20203C537472526573204E616D653D2234303722205465
        78743D2244697265697461222F3E0D0A20203C537472526573204E616D653D22
        3430382220546578743D22496E666572696F72222F3E0D0A20203C5374725265
        73204E616D653D223430392220546578743D224D617267656E73222F3E0D0A20
        203C537472526573204E616D653D223431302220546578743D22526574726174
        6F222F3E0D0A20203C537472526573204E616D653D223431312220546578743D
        22506169736167656D222F3E0D0A20203C537472526573204E616D653D223431
        322220546578743D224F7574726F73222F3E0D0A20203C537472526573204E61
        6D653D223431332220546578743D2241706C69636172206E612070C3A167696E
        6120617475616C222F3E0D0A20203C537472526573204E616D653D2234313422
        20546578743D2241706C6963617220656D20746F6461732061732070C3A16769
        6E6173222F3E0D0A20203C537472526573204E616D653D223530302220546578
        743D22496D7072696D6972222F3E0D0A20203C537472526573204E616D653D22
        3530312220546578743D22496D70726573736F7261222F3E0D0A20203C537472
        526573204E616D653D223530322220546578743D2250C3A167696E6173222F3E
        0D0A20203C537472526573204E616D653D223530332220546578743D2243C3B3
        70696173222F3E0D0A20203C537472526573204E616D653D2235303422205465
        78743D224EC3BA6D65726F2064652063C3B370696173222F3E0D0A20203C5374
        72526573204E616D653D223530352220546578743D224F70C3A7C3B56573222F
        3E0D0A20203C537472526573204E616D653D223530362220546578743D22436F
        6D616E646F7320646520657363617065222F3E0D0A20203C537472526573204E
        616D653D223530372220546578743D22496D7072696D69722070617261206172
        717569766F222F3E0D0A20203C537472526573204E616D653D22353038222054
        6578743D2243C3B36469676F2064652070C3A167696E61204F454D222F3E0D0A
        20203C537472526573204E616D653D223530392220546578743D225073657564
        6F6772C3A16669636F222F3E0D0A20203C537472526573204E616D653D223531
        302220546578743D224172717569766F20646520696D7072657373C3A36F2028
        2A2E70726E297C2A2E70726E222F3E0D0A20203C537472526573204E616D653D
        226D62436F6E6669726D2220546578743D22436F6E6669726D61C3A7C3A36F22
        2F3E0D0A20203C537472526573204E616D653D226D624572726F722220546578
        743D224572726F222F3E0D0A20203C537472526573204E616D653D226D62496E
        666F2220546578743D22496E666F726D61C3A7C3A36F222F3E0D0A20203C5374
        72526573204E616D653D22787243616E7446696E64436C617373222054657874
        3D22436C61737365206EC3A36F20656E636F6E7472616461222F3E0D0A20203C
        537472526573204E616D653D2270725669727475616C2220546578743D225669
        727475616C222F3E0D0A20203C537472526573204E616D653D22707244656661
        756C742220546578743D2250616472C3A36F222F3E0D0A20203C537472526573
        204E616D653D227072437573746F6D2220546578743D22506572736F6E616C69
        7A61646F222F3E0D0A20203C537472526573204E616D653D22656E556E636F6E
        6E4865616465722220546578743D2243616265C3A7616C686F2F526F646170C3
        A920646573636F6E65637461646F222F3E0D0A20203C537472526573204E616D
        653D22656E556E636F6E6E47726F75702220546578743D22477275706F207365
        6D2062616E6461206465206461646F73222F3E0D0A20203C537472526573204E
        616D653D22656E556E636F6E6E47466F6F7465722220546578743D2253656D20
        63616265C3A7616C686F20646520677275706F2070617261222F3E0D0A20203C
        537472526573204E616D653D22656E42616E64506F732220546578743D22506F
        7369C3A7C3A36F20696E636F72726574612064612062616E64613A222F3E0D0A
        20203C537472526573204E616D653D2264624E6F74436F6E6E2220546578743D
        2244617461536574202573206EC3A36F20657374C3A120636F6E65637461646F
        2061206461646F73222F3E0D0A20203C537472526573204E616D653D22646246
        6C644E6F74466F756E642220546578743D2243616D706F206EC3A36F20656E63
        6F6E747261646F3A222F3E0D0A20203C537472526573204E616D653D22636C44
        534E6F74496E636C2220546578743D222864617461736574206EC3A36F206573
        74C3A120696E636C75C3AD646F20656D205265706F72742E4461746153657473
        29222F3E0D0A20203C537472526573204E616D653D22636C556E6B6E6F776E56
        61722220546578743D2256617269C3A176656C206F752063616D706F20646520
        6461646F7320646573636F6E68656369646F3A222F3E0D0A20203C5374725265
        73204E616D653D22636C5363724572726F722220546578743D224572726F206E
        6F2073637269707420656D2025733A202573222F3E0D0A20203C537472526573
        204E616D653D22636C44534E6F7445786973742220546578743D224461746173
        657420262333383B2333343B2573262333383B2333343B206EC3A36F20657869
        737465222F3E0D0A20203C537472526573204E616D653D22636C4572726F7273
        2220546578743D224572726F28732920656E636F6E747261646F2873293A222F
        3E0D0A20203C537472526573204E616D653D22636C457870724572726F722220
        546578743D224572726F206E612065787072657373C3A36F222F3E0D0A20203C
        537472526573204E616D653D22636C46503366696C65732220546578743D2252
        656C6174C3B372696F2050726570617261646F222F3E0D0A20203C5374725265
        73204E616D653D22636C536176696E672220546578743D2253616C76616E646F
        206172717569766F2E2E2E222F3E0D0A20203C537472526573204E616D653D22
        636C43616E63656C2220546578743D2243616E63656C6172222F3E0D0A20203C
        537472526573204E616D653D22636C436C6F73652220546578743D2246656368
        6172222F3E0D0A20203C537472526573204E616D653D22636C5072696E74696E
        672220546578743D22496D7072696D696E646F2070C3A167696E61222F3E0D0A
        20203C537472526573204E616D653D22636C4C6F6164696E672220546578743D
        22436172726567616E646F206172717569766F2E2E2E222F3E0D0A20203C5374
        72526573204E616D653D22636C506167654F662220546578743D2250C3A16769
        6E61202564206465202564222F3E0D0A20203C537472526573204E616D653D22
        636C4669727374506173732220546578743D225072696D6569726F2070617373
        6F3A2070C3A167696E61222F3E0D0A20203C537472526573204E616D653D2263
        6C4E6F5072696E746572732220546578743D224E656E68756D6120696D707265
        73736F726120696E7374616C616461206E6F2073697374656D61222F3E0D0A20
        203C537472526573204E616D653D22636C4465636F6D70726573734572726F72
        2220546578743D224572726F20646520646573636F6D7072657373C3A36F2064
        6520666C75786F222F3E0D0A20203C537472526573204E616D653D2263724669
        6C6C4D782220546578743D22507265656E6368656E646F206F2063726F73732D
        7461622E2E2E222F3E0D0A20203C537472526573204E616D653D226372427569
        6C644D782220546578743D22436F6E73747275696E646F206F2063726F73732D
        7461622E2E2E222F3E0D0A20203C537472526573204E616D653D22707252756E
        6E696E6746697273742220546578743D225072696D6569726F20706173736F3A
        2070C3A167696E61202564222F3E0D0A20203C537472526573204E616D653D22
        707252756E6E696E672220546578743D22507265706172616E646F2070C3A167
        696E61202564222F3E0D0A20203C537472526573204E616D653D227072507269
        6E74696E672220546578743D22496D7072696D696E646F2070C3A167696E6120
        2564222F3E0D0A20203C537472526573204E616D653D2270724578706F727469
        6E672220546578743D224578706F7274616E646F2070C3A167696E6120256422
        2F3E0D0A20203C537472526573204E616D653D2275436D2220546578743D2263
        6D222F3E0D0A20203C537472526573204E616D653D2275496E63682220546578
        743D22706F6C222F3E0D0A20203C537472526573204E616D653D227550697822
        20546578743D227078222F3E0D0A20203C537472526573204E616D653D227543
        6861722220546578743D22636172222F3E0D0A20203C537472526573204E616D
        653D2264757044656661756C742220546578743D2250616472C3A36F222F3E0D
        0A20203C537472526573204E616D653D22647570566572742220546578743D22
        566572746963616C222F3E0D0A20203C537472526573204E616D653D22647570
        486F727A2220546578743D22486F72697A6F6E74616C222F3E0D0A20203C5374
        72526573204E616D653D2264757053696D706C2220546578743D2253696D706C
        6573222F3E0D0A20203C537472526573204E616D653D22534C616E674E6F7446
        6F756E642220546578743D224C696E67756167656D25736EC3A36F20656E636F
        6E7472616461222F3E0D0A20203C537472526573204E616D653D2253496E7661
        6C69644C616E67756167652220546578743D224964656E746966696361C3A7C3
        A36F206465206C696E67756167656D20696E76C3A16C696461222F3E0D0A2020
        3C537472526573204E616D653D2253496452656465636C617265642220546578
        743D224964656E746966696361646F72206465636C617261646F206E6F76616D
        656E74653A222F3E0D0A20203C537472526573204E616D653D2253556E6B6E6F
        776E547970652220546578743D225469706F20646573636F6E68656369646F3A
        222F3E0D0A20203C537472526573204E616D653D2253496E636F6D7061746962
        6C6554797065732220546578743D225469706F7320696E636F6D706174C3AD76
        656973222F3E0D0A20203C537472526573204E616D653D22534964556E646563
        6C617265642220546578743D224964656E746966696361646F72206EC3A36F20
        6465636C617261646F3A222F3E0D0A20203C537472526573204E616D653D2253
        436C61737352657175697265642220546578743D225469706F20646520636C61
        7373652072657175657269646F222F3E0D0A20203C537472526573204E616D65
        3D2253496E64657852657175697265642220546578743D22496E646963652072
        657175657269646F222F3E0D0A20203C537472526573204E616D653D22535374
        72696E674572726F722220546578743D22537472696E6773206EC3A36F20706F
        737375656D2070726F707269656461646573206F75206DC3A9746F646F73222F
        3E0D0A20203C537472526573204E616D653D2253436C6173734572726F722220
        546578743D22436C61737365202573206EC3A36F2074656D20756D612070726F
        70726965646164652070616472C3A36F222F3E0D0A20203C537472526573204E
        616D653D2253417272617952657175697265642220546578743D225469706F20
        7665746F722072657175657269646F222F3E0D0A20203C537472526573204E61
        6D653D225356617252657175697265642220546578743D2256617269C3A17665
        6C20726571756572696461222F3E0D0A20203C537472526573204E616D653D22
        534E6F74456E6F756768506172616D732220546578743D2253656D20706172C3
        A26D6574726F7320737566696369656E746573222F3E0D0A20203C5374725265
        73204E616D653D2253546F6F4D616E79506172616D732220546578743D225061
        72C3A26D6574726F732064656D616973222F3E0D0A20203C537472526573204E
        616D653D22534C65667443616E7441737369676E65642220546578743D224C61
        646F20657371756572646F206EC3A36F20706F64652073657220617472696275
        C3AD646F222F3E0D0A20203C537472526573204E616D653D2253466F72457272
        6F722220546578743D225061726120756D206C61C3A76F20612076617269C3A1
        76656C206465766520736572206E756DC3A972696361222F3E0D0A20203C5374
        72526573204E616D653D22534576656E744572726F722220546578743D224D61
        6E6970756C61646F72206465206576656E746F20646576652073657220756D20
        70726F636564696D656E746F222F3E0D0A20203C537472526573204E616D653D
        223630302220546578743D22457870616E6465207475646F222F3E0D0A20203C
        537472526573204E616D653D223630312220546578743D22436F6D7072696D65
        207475646F222F3E0D0A20203C537472526573204E616D653D22636C5374724E
        6F74466F756E642220546578743D2254657874206E6F7420666F756E64222F3E
        0D0A20203C537472526573204E616D653D22636C43616E7452656E2220546578
        743D22436F756C64206E6F742072656E616D652025732C206974207761732069
        6E74726F647563656420696E2074686520616E636573746F72207265706F7274
        222F3E0D0A20203C537472526573204E616D653D22636C4369725265664E6F74
        416C6C6F772220546578743D2243697263756C6172206368696C642072656665
        72656E6365206973206E6F7420616C6C6F776564222F3E0D0A20203C53747252
        6573204E616D653D22636C4475704E616D652220546578743D224475706C6963
        617465206E616D65222F3E0D0A20203C537472526573204E616D653D22636C45
        72726F72496E4578702220546578743D224572726F7220696E2043616C632065
        787072657373696F6E3A222F3E0D0A20203C537472526573204E616D653D2265
        78704D746D2220546578743D2254696D656F75742065787069726564222F3E0D
        0A20203C537472526573204E616D653D226572496E76616C6964496D67222054
        6578743D22496E76616C696420696D61676520666F726D6174222F3E0D0A2020
        3C537472526573204E616D653D225265706F72745469746C652220546578743D
        225265706F72745469746C65222F3E0D0A20203C537472526573204E616D653D
        225265706F727453756D6D6172792220546578743D225265706F727453756D6D
        617279222F3E0D0A20203C537472526573204E616D653D225061676548656164
        65722220546578743D2250616765486561646572222F3E0D0A20203C53747252
        6573204E616D653D2250616765466F6F7465722220546578743D225061676546
        6F6F746572222F3E0D0A20203C537472526573204E616D653D22486561646572
        2220546578743D22486561646572222F3E0D0A20203C537472526573204E616D
        653D22466F6F7465722220546578743D22466F6F746572222F3E0D0A20203C53
        7472526573204E616D653D224D6173746572446174612220546578743D224D61
        7374657244617461222F3E0D0A20203C537472526573204E616D653D22446574
        61696C446174612220546578743D2244657461696C44617461222F3E0D0A2020
        3C537472526573204E616D653D2253756264657461696C446174612220546578
        743D2253756264657461696C44617461222F3E0D0A20203C537472526573204E
        616D653D2244617461342220546578743D224461746134222F3E0D0A20203C53
        7472526573204E616D653D2244617461352220546578743D224461746135222F
        3E0D0A20203C537472526573204E616D653D2244617461362220546578743D22
        4461746136222F3E0D0A20203C537472526573204E616D653D2247726F757048
        65616465722220546578743D2247726F7570486561646572222F3E0D0A20203C
        537472526573204E616D653D2247726F7570466F6F7465722220546578743D22
        47726F7570466F6F746572222F3E0D0A20203C537472526573204E616D653D22
        4368696C642220546578743D224368696C64222F3E0D0A20203C537472526573
        204E616D653D22436F6C756D6E4865616465722220546578743D22436F6C756D
        6E486561646572222F3E0D0A20203C537472526573204E616D653D22436F6C75
        6D6E466F6F7465722220546578743D22436F6C756D6E466F6F746572222F3E0D
        0A20203C537472526573204E616D653D224F7665726C61792220546578743D22
        4F7665726C6179222F3E0D0A20203C537472526573204E616D653D22325F355F
        696E7465726C65617665642220546578743D22325F355F696E7465726C656176
        6564222F3E0D0A20203C537472526573204E616D653D22325F355F696E647573
        747269616C2220546578743D22325F355F696E647573747269616C222F3E0D0A
        20203C537472526573204E616D653D22325F355F6D6174726978222054657874
        3D22325F355F6D6174726978222F3E0D0A20203C537472526573204E616D653D
        22436F646533392220546578743D22436F64653339222F3E0D0A20203C537472
        526573204E616D653D22436F6465333920457874656E6465642220546578743D
        22436F6465333920457874656E646564222F3E0D0A20203C537472526573204E
        616D653D22436F6465313238412220546578743D22436F646531323841222F3E
        0D0A20203C537472526573204E616D653D22436F646531323842222054657874
        3D22436F646531323842222F3E0D0A20203C537472526573204E616D653D2243
        6F6465313238432220546578743D22436F646531323843222F3E0D0A20203C53
        7472526573204E616D653D22436F646539332220546578743D22436F64653933
        222F3E0D0A20203C537472526573204E616D653D22436F646539332045787465
        6E6465642220546578743D22436F6465393320457874656E646564222F3E0D0A
        20203C537472526573204E616D653D224D53492220546578743D224D5349222F
        3E0D0A20203C537472526573204E616D653D22506F73744E6574222054657874
        3D22506F73744E6574222F3E0D0A20203C537472526573204E616D653D22436F
        64656261722220546578743D22436F6465626172222F3E0D0A20203C53747252
        6573204E616D653D2245414E382220546578743D2245414E38222F3E0D0A2020
        3C537472526573204E616D653D2245414E31332220546578743D2245414E3133
        222F3E0D0A20203C537472526573204E616D653D225550435F41222054657874
        3D225550435F41222F3E0D0A20203C537472526573204E616D653D225550435F
        45302220546578743D225550435F4530222F3E0D0A20203C537472526573204E
        616D653D225550435F45312220546578743D225550435F4531222F3E0D0A2020
        3C537472526573204E616D653D225550432053757070322220546578743D2255
        5043205375707032222F3E0D0A20203C537472526573204E616D653D22555043
        2053757070352220546578743D22555043205375707035222F3E0D0A20203C53
        7472526573204E616D653D2245414E313238412220546578743D2245414E3132
        3841222F3E0D0A20203C537472526573204E616D653D2245414E313238422220
        546578743D2245414E31323842222F3E0D0A20203C537472526573204E616D65
        3D2245414E313238432220546578743D2245414E31323843222F3E0D0A20203C
        537472526573204E616D653D227270456469745265702220546578743D224564
        6974205265706F72742E2E2E222F3E0D0A20203C537472526573204E616D653D
        22727045646974416C6961732220546578743D2245646974204669656C647320
        416C69617365732E2E2E222F3E0D0A20203C537472526573204E616D653D2232
        3030302220546578743D22496E737065746F72206465204F626A65746F73222F
        3E0D0A20203C537472526573204E616D653D226F6950726F702220546578743D
        2250726F707269656461646573222F3E0D0A20203C537472526573204E616D65
        3D226F694576656E742220546578743D224576656E746F73222F3E0D0A20203C
        537472526573204E616D653D22323130302220546578743D22C38172766F7265
        206465204461646F73222F3E0D0A20203C537472526573204E616D653D223231
        30312220546578743D224461646F73222F3E0D0A20203C537472526573204E61
        6D653D22323130322220546578743D2256617269C3A176656973222F3E0D0A20
        203C537472526573204E616D653D22323130332220546578743D2246756EC3A7
        C3B56573222F3E0D0A20203C537472526573204E616D653D2232313034222054
        6578743D2243726961722063616D706F222F3E0D0A20203C537472526573204E
        616D653D22323130352220546578743D2243726961722072C3B374756C6F222F
        3E0D0A20203C537472526573204E616D653D22323130362220546578743D2243
        6C6173736573222F3E0D0A20203C537472526573204E616D653D2264744E6F44
        6174612220546578743D2253656D206461646F7320646973706F6EC3AD766569
        732E222F3E0D0A20203C537472526573204E616D653D2264744E6F4461746131
        2220546578743D2253656C6563696F6E6520262333383B2333343B52656C6174
        C3B372696F7C4461646F732E2E2E262333383B2333343B206D656E7520706172
        612061646963696F6E6172206461646F73206578697374656E74657320616F20
        7365752072656C6174C3B372696F2C206F7520696E746572726F6D706572206F
        7320262333383B2333343B6461646F73262333383B2333343B20746162756C61
        6E646F206520637269616E646F206E6F7661732073C3A9726965732064652064
        61646F73222F3E0D0A20203C537472526573204E616D653D2264744461746122
        20546578743D224461646F73222F3E0D0A20203C537472526573204E616D653D
        2264745379735661722220546578743D2256617269C3A17665697320646F2053
        697374656D61222F3E0D0A20203C537472526573204E616D653D226474566172
        2220546578743D2256617269C3A176656973222F3E0D0A20203C537472526573
        204E616D653D22647446756E632220546578743D2246756EC3A7C3B56573222F
        3E0D0A20203C537472526573204E616D653D22323230302220546578743D22C3
        8172766F72652064652052656C6174C3B372696F222F3E0D0A20203C53747252
        6573204E616D653D22323330302220546578743D224162726972204172717569
        766F20646520536372697074222F3E0D0A20203C537472526573204E616D653D
        22323330312220546578743D2253616C76617220536372697074207061726120
        4172717569766F222F3E0D0A20203C537472526573204E616D653D2232333032
        2220546578743D22457865637574617220536372697074222F3E0D0A20203C53
        7472526573204E616D653D22323330332220546578743D225365677569722044
        656E74726F222F3E0D0A20203C537472526573204E616D653D22323330342220
        546578743D2246696E616C697A617220536372697074222F3E0D0A20203C5374
        72526573204E616D653D22323330352220546578743D224176616C696172222F
        3E0D0A20203C537472526573204E616D653D22323330362220546578743D224C
        696E67756167656D3A222F3E0D0A20203C537472526573204E616D653D223233
        30372220546578743D22416C696E686172222F3E0D0A20203C53747252657320
        4E616D653D22323330382220546578743D22416C696E68617220C3A020457371
        7565726461222F3E0D0A20203C537472526573204E616D653D22323330392220
        546578743D2243656E7472616C697A6172222F3E0D0A20203C53747252657320
        4E616D653D22323331302220546578743D22416C696E68617220C3A020446972
        65697461222F3E0D0A20203C537472526573204E616D653D2232333131222054
        6578743D22416C696E686172204163696D61222F3E0D0A20203C537472526573
        204E616D653D22323331322220546578743D2243656E7472616C697A61722056
        6572746963616C6D656E7465222F3E0D0A20203C537472526573204E616D653D
        22323331332220546578743D22416C696E6861722041626169786F222F3E0D0A
        20203C537472526573204E616D653D22323331342220546578743D2245737061
        C3A7616D656E746F20486F72697A6F6E74616C222F3E0D0A20203C5374725265
        73204E616D653D22323331352220546578743D2245737061C3A7616D656E746F
        20566572746963616C222F3E0D0A20203C537472526573204E616D653D223233
        31362220546578743D2243656E7472616C697A617220486F72697A6F6E74616C
        6D656E7465206E612042616E6461222F3E0D0A20203C537472526573204E616D
        653D22323331372220546578743D2243656E7472616C697A6172205665727469
        63616C6D656E7465206E612042616E6461222F3E0D0A20203C53747252657320
        4E616D653D22323331382220546578743D224D65736D61204C61726775726122
        2F3E0D0A20203C537472526573204E616D653D22323331392220546578743D22
        4D65736D6120416C74757261222F3E0D0A20203C537472526573204E616D653D
        22323332302220546578743D22546578746F222F3E0D0A20203C537472526573
        204E616D653D22323332312220546578743D22457374696C6F222F3E0D0A2020
        3C537472526573204E616D653D22323332322220546578743D224E6F6D652064
        6120466F6E7465222F3E0D0A20203C537472526573204E616D653D2232333233
        2220546578743D2254616D616E686F20646120466F6E7465222F3E0D0A20203C
        537472526573204E616D653D22323332342220546578743D224E65677269746F
        222F3E0D0A20203C537472526573204E616D653D22323332352220546578743D
        224974C3A16C69636F222F3E0D0A20203C537472526573204E616D653D223233
        32362220546578743D225375626C696E6861646F222F3E0D0A20203C53747252
        6573204E616D653D22323332372220546578743D22436F7220646120466F6E74
        65222F3E0D0A20203C537472526573204E616D653D2232333238222054657874
        3D224465737461717565222F3E0D0A20203C537472526573204E616D653D2232
        3332392220546578743D22526F7461C3A7C3A36F20646F20546578746F222F3E
        0D0A20203C537472526573204E616D653D22323333302220546578743D22416C
        696E68617220C3A0204573717565726461222F3E0D0A20203C53747252657320
        4E616D653D22323333312220546578743D2243656E7472616C697A6172222F3E
        0D0A20203C537472526573204E616D653D22323333322220546578743D22416C
        696E68617220C3A02044697265697461222F3E0D0A20203C537472526573204E
        616D653D22323333332220546578743D224A757374696669636172222F3E0D0A
        20203C537472526573204E616D653D22323333342220546578743D22416C696E
        686172204163696D61222F3E0D0A20203C537472526573204E616D653D223233
        33352220546578743D2243656E7472616C697A617220566572746963616C6D65
        6E7465222F3E0D0A20203C537472526573204E616D653D223233333622205465
        78743D22416C696E6861722041626169786F222F3E0D0A20203C537472526573
        204E616D653D22323333372220546578743D22426F726461222F3E0D0A20203C
        537472526573204E616D653D22323333382220546578743D224C696E68612041
        63696D61222F3E0D0A20203C537472526573204E616D653D2232333339222054
        6578743D224C696E68612041626169786F222F3E0D0A20203C53747252657320
        4E616D653D22323334302220546578743D224C696E686120C3A0204573717565
        726461222F3E0D0A20203C537472526573204E616D653D223233343122205465
        78743D224C696E686120C3A02044697265697461222F3E0D0A20203C53747252
        6573204E616D653D22323334322220546578743D22546F646173206173204C69
        6E68617320646120426F726461222F3E0D0A20203C537472526573204E616D65
        3D22323334332220546578743D2253656D20426F726461222F3E0D0A20203C53
        7472526573204E616D653D22323334342220546578743D22536F6D627261222F
        3E0D0A20203C537472526573204E616D653D22323334352220546578743D2243
        6F722064652046756E646F222F3E0D0A20203C537472526573204E616D653D22
        323334362220546578743D22436F7220646120426F726461222F3E0D0A20203C
        537472526573204E616D653D22323334372220546578743D22457374696C6F20
        646120426F726461222F3E0D0A20203C537472526573204E616D653D22323334
        382220546578743D224C61726775726120646120426F726461222F3E0D0A2020
        3C537472526573204E616D653D22323334392220546578743D2250616472C3A3
        6F222F3E0D0A20203C537472526573204E616D653D2232333530222054657874
        3D224E6F766F2052656C6174C3B372696F222F3E0D0A20203C53747252657320
        4E616D653D22323335312220546578743D2241627269722052656C6174C3B372
        696F222F3E0D0A20203C537472526573204E616D653D22323335322220546578
        743D2253616C7661722052656C6174C3B372696F222F3E0D0A20203C53747252
        6573204E616D653D22323335332220546578743D2256697375616C697A617222
        2F3E0D0A20203C537472526573204E616D653D22323335342220546578743D22
        4E6F76612050C3A167696E612064652052656C6174C3B372696F222F3E0D0A20
        203C537472526573204E616D653D22323335352220546578743D224E6F766120
        50C3A167696E61206465204469C3A16C6F676F222F3E0D0A20203C5374725265
        73204E616D653D22323335362220546578743D2252656D6F7665722050C3A167
        696E61222F3E0D0A20203C537472526573204E616D653D223233353722205465
        78743D22436F6E666967757261C3A7C3B565732064612050C3A167696E61222F
        3E0D0A20203C537472526573204E616D653D22323335382220546578743D2256
        617269C3A176656973222F3E0D0A20203C537472526573204E616D653D223233
        35392220546578743D225265636F72746172222F3E0D0A20203C537472526573
        204E616D653D22323336302220546578743D22436F70696172222F3E0D0A2020
        3C537472526573204E616D653D22323336312220546578743D22436F6C617222
        2F3E0D0A20203C537472526573204E616D653D22323336322220546578743D22
        436F7069617220466F726D617461C3A7C3A36F222F3E0D0A20203C5374725265
        73204E616D653D22323336332220546578743D2244657366617A6572222F3E0D
        0A20203C537472526573204E616D653D22323336342220546578743D22526566
        617A6572222F3E0D0A20203C537472526573204E616D653D2232333635222054
        6578743D2241677275706172222F3E0D0A20203C537472526573204E616D653D
        22323336362220546578743D2244657361677275706172222F3E0D0A20203C53
        7472526573204E616D653D22323336372220546578743D224D6F737472617220
        4772616465222F3E0D0A20203C537472526573204E616D653D22323336382220
        546578743D22416C696E686172206E61204772616465222F3E0D0A20203C5374
        72526573204E616D653D22323336392220546578743D22416A757374617220C3
        A0204772616465222F3E0D0A20203C537472526573204E616D653D2232333730
        2220546578743D225A6F6F6D222F3E0D0A20203C537472526573204E616D653D
        22323337312220546578743D2246657272616D656E746120457874726173222F
        3E0D0A20203C537472526573204E616D653D22323337322220546578743D2253
        656C6563696F6E61722046657272616D656E7461222F3E0D0A20203C53747252
        6573204E616D653D22323337332220546578743D2246657272616D656E746120
        4DC3A36F222F3E0D0A20203C537472526573204E616D653D2232333734222054
        6578743D2246657272616D656E7461205A6F6F6D222F3E0D0A20203C53747252
        6573204E616D653D22323337352220546578743D2246657272616D656E746120
        45646974617220546578746F222F3E0D0A20203C537472526573204E616D653D
        22323337362220546578743D2246657272616D656E746120436F706961722046
        6F726D617461C3A7C3A36F222F3E0D0A20203C537472526573204E616D653D22
        323337372220546578743D22496E73657269722042616E6461222F3E0D0A2020
        3C537472526573204E616D653D22323337382220546578743D2226616D703B41
        72717569766F222F3E0D0A20203C537472526573204E616D653D223233373922
        20546578743D2226616D703B456469746172222F3E0D0A20203C537472526573
        204E616D653D22323338302220546578743D224C6F63616C697A61722E2E2E22
        2F3E0D0A20203C537472526573204E616D653D22323338312220546578743D22
        4C6F63616C697A6172205072C3B378696D6F222F3E0D0A20203C537472526573
        204E616D653D22323338322220546578743D22537562737469747569722E2E2E
        222F3E0D0A20203C537472526573204E616D653D22323338332220546578743D
        2226616D703B52656C6174C3B372696F222F3E0D0A20203C537472526573204E
        616D653D22323338342220546578743D224461646F732E2E2E222F3E0D0A2020
        3C537472526573204E616D653D22323338352220546578743D224F70C3A7C3B5
        65732E2E2E222F3E0D0A20203C537472526573204E616D653D22323338362220
        546578743D22457374696C6F2E2E2E222F3E0D0A20203C537472526573204E61
        6D653D22323338372220546578743D224526616D703B7869626972222F3E0D0A
        20203C537472526573204E616D653D22323338382220546578743D2242617272
        61732064652046657272616D656E746173222F3E0D0A20203C53747252657320
        4E616D653D22323338392220546578743D2250616472C3A36F222F3E0D0A2020
        3C537472526573204E616D653D22323339302220546578743D22546578746F22
        2F3E0D0A20203C537472526573204E616D653D22323339312220546578743D22
        426F726461222F3E0D0A20203C537472526573204E616D653D22323339322220
        546578743D2250616C65746120646520416C696E68616D656E746F222F3E0D0A
        20203C537472526573204E616D653D22323339332220546578743D2246657272
        616D656E746120457874726173222F3E0D0A20203C537472526573204E616D65
        3D22323339342220546578743D22496E737065746F72206465204F626A65746F
        73222F3E0D0A20203C537472526573204E616D653D2232333935222054657874
        3D22C38172766F7265206465204461646F73222F3E0D0A20203C537472526573
        204E616D653D22323339362220546578743D22C38172766F7265206465205265
        6C6174C3B372696F222F3E0D0A20203C537472526573204E616D653D22323339
        372220546578743D2252C3A967756173222F3E0D0A20203C537472526573204E
        616D653D22323339382220546578743D224775696173222F3E0D0A20203C5374
        72526573204E616D653D22323339392220546578743D2252656D6F7665722047
        75696173222F3E0D0A20203C537472526573204E616D653D2232343030222054
        6578743D224F70C3A7C3B565732E2E2E222F3E0D0A20203C537472526573204E
        616D653D22323430312220546578743D22416A26616D703B756461222F3E0D0A
        20203C537472526573204E616D653D22323430322220546578743D22436F6E74
        65C3BA646F20646120416A7564612E2E2E222F3E0D0A20203C53747252657320
        4E616D653D22323430332220546578743D22536F627265206F20466173745265
        706F72742E2E2E222F3E0D0A20203C537472526573204E616D653D2232343034
        2220546578743D224F7264656D20646520546162756C61C3A7C3A36F2E2E2E22
        2F3E0D0A20203C537472526573204E616D653D22323430352220546578743D22
        44657366617A6572222F3E0D0A20203C537472526573204E616D653D22323430
        362220546578743D22526566617A6572222F3E0D0A20203C537472526573204E
        616D653D22323430372220546578743D225265636F72746172222F3E0D0A2020
        3C537472526573204E616D653D22323430382220546578743D22436F70696172
        222F3E0D0A20203C537472526573204E616D653D22323430392220546578743D
        22436F6C6172222F3E0D0A20203C537472526573204E616D653D223234313022
        20546578743D2241677275706172222F3E0D0A20203C537472526573204E616D
        653D22323431312220546578743D2244657361677275706172222F3E0D0A2020
        3C537472526573204E616D653D22323431322220546578743D2252656D6F7665
        72222F3E0D0A20203C537472526573204E616D653D2232343133222054657874
        3D2252656D6F7665722050C3A167696E61222F3E0D0A20203C53747252657320
        4E616D653D22323431342220546578743D2253656C6563696F6E617220547564
        6F222F3E0D0A20203C537472526573204E616D653D2232343135222054657874
        3D224564697461722E2E2E222F3E0D0A20203C537472526573204E616D653D22
        323431362220546578743D225472617A65722070617261204672656E7465222F
        3E0D0A20203C537472526573204E616D653D22323431372220546578743D2245
        6E766961722070617261205472C3A173222F3E0D0A20203C537472526573204E
        616D653D22323431382220546578743D224E6F766F2E2E2E222F3E0D0A20203C
        537472526573204E616D653D22323431392220546578743D224E6F766F205265
        6C6174C3B372696F222F3E0D0A20203C537472526573204E616D653D22323432
        302220546578743D224E6F76612050C3A167696E61222F3E0D0A20203C537472
        526573204E616D653D22323432312220546578743D224E6F766F204469C3A16C
        6F676F222F3E0D0A20203C537472526573204E616D653D223234323222205465
        78743D2241627269722E2E2E222F3E0D0A20203C537472526573204E616D653D
        22323432332220546578743D2253616C766172222F3E0D0A20203C5374725265
        73204E616D653D22323432342220546578743D2253616C76617220636F6D6F2E
        2E2E222F3E0D0A20203C537472526573204E616D653D22323432352220546578
        743D2256617269C3A1766569732E2E2E222F3E0D0A20203C537472526573204E
        616D653D22323432362220546578743D22436F6E666967757261C3A7C3B56573
        2064612050C3A167696E612E2E2E222F3E0D0A20203C537472526573204E616D
        653D22323432372220546578743D2256697375616C697A6172222F3E0D0A2020
        3C537472526573204E616D653D22323432382220546578743D2253616972222F
        3E0D0A20203C537472526573204E616D653D22323432392220546578743D2254
        C3AD74756C6F20646F2052656C6174C3B372696F222F3E0D0A20203C53747252
        6573204E616D653D22323433302220546578743D2253756DC3A172696F20646F
        2052656C6174C3B372696F222F3E0D0A20203C537472526573204E616D653D22
        323433312220546578743D2243616265C3A7616C686F2064612050C3A167696E
        61222F3E0D0A20203C537472526573204E616D653D2232343332222054657874
        3D22526F646170C3A92064612050C3A167696E61222F3E0D0A20203C53747252
        6573204E616D653D22323433332220546578743D2243616265C3A7616C686F22
        2F3E0D0A20203C537472526573204E616D653D22323433342220546578743D22
        526F646170C3A9222F3E0D0A20203C537472526573204E616D653D2232343335
        2220546578743D224461646F73204D6573747265222F3E0D0A20203C53747252
        6573204E616D653D22323433362220546578743D224461646F73206465204465
        74616C6865222F3E0D0A20203C537472526573204E616D653D22323433372220
        546578743D224461646F73206465205375622D646574616C6865222F3E0D0A20
        203C537472526573204E616D653D22323433382220546578743D224461646F73
        20346F2E206EC3AD76656C222F3E0D0A20203C537472526573204E616D653D22
        323433392220546578743D224461646F7320356F2E206EC3AD76656C222F3E0D
        0A20203C537472526573204E616D653D22323434302220546578743D22446164
        6F7320366F2E206EC3AD76656C222F3E0D0A20203C537472526573204E616D65
        3D22323434312220546578743D2243616265C3A7616C686F2064652047727570
        6F222F3E0D0A20203C537472526573204E616D653D2232343432222054657874
        3D22526F646170C3A920646520477275706F222F3E0D0A20203C537472526573
        204E616D653D22323434332220546578743D2246696C6861222F3E0D0A20203C
        537472526573204E616D653D22323434342220546578743D2243616265C3A761
        6C686F20646520436F6C756E61222F3E0D0A20203C537472526573204E616D65
        3D22323434352220546578743D22526F646170C3A920646520436F6C756E6122
        2F3E0D0A20203C537472526573204E616D653D22323434362220546578743D22
        46756E646F222F3E0D0A20203C537472526573204E616D653D22323434372220
        546578743D2242616E64617320566572746963616973222F3E0D0A20203C5374
        72526573204E616D653D22323434382220546578743D2243616265C3A7616C68
        6F222F3E0D0A20203C537472526573204E616D653D2232343439222054657874
        3D22526F646170C3A9222F3E0D0A20203C537472526573204E616D653D223234
        35302220546578743D224461646F73204D6573747265222F3E0D0A20203C5374
        72526573204E616D653D22323435312220546578743D224461646F7320646520
        446574616C6865222F3E0D0A20203C537472526573204E616D653D2232343532
        2220546578743D224461646F73206465205375622D646574616C6865222F3E0D
        0A20203C537472526573204E616D653D22323435332220546578743D22436162
        65C3A7616C686F20646520477275706F222F3E0D0A20203C537472526573204E
        616D653D22323435342220546578743D22526F646170C3A92064652047727570
        6F222F3E0D0A20203C537472526573204E616D653D2232343535222054657874
        3D2246696C6861222F3E0D0A20203C537472526573204E616D653D2232343536
        2220546578743D2230C2B0222F3E0D0A20203C537472526573204E616D653D22
        323435372220546578743D223435C2B0222F3E0D0A20203C537472526573204E
        616D653D22323435382220546578743D223930C2B0222F3E0D0A20203C537472
        526573204E616D653D22323435392220546578743D22313830C2B0222F3E0D0A
        20203C537472526573204E616D653D22323436302220546578743D22323730C2
        B0222F3E0D0A20203C537472526573204E616D653D2232343631222054657874
        3D22436F6E666967757261C3A7C3B5657320646120466F6E7465222F3E0D0A20
        203C537472526573204E616D653D22323436322220546578743D224E65677269
        746F222F3E0D0A20203C537472526573204E616D653D22323436332220546578
        743D224974C3A16C69636F222F3E0D0A20203C537472526573204E616D653D22
        323436342220546578743D225375626C696E6861646F222F3E0D0A20203C5374
        72526573204E616D653D22323436352220546578743D22536F62726573637269
        746F222F3E0D0A20203C537472526573204E616D653D22323436362220546578
        743D2253756273637269746F222F3E0D0A20203C537472526573204E616D653D
        22323436372220546578743D22436F6E64656E7361646F222F3E0D0A20203C53
        7472526573204E616D653D22323436382220546578743D224C6172676F222F3E
        0D0A20203C537472526573204E616D653D22323436392220546578743D223132
        20637069222F3E0D0A20203C537472526573204E616D653D2232343730222054
        6578743D22313520637069222F3E0D0A20203C537472526573204E616D653D22
        323437312220546578743D2252656C6174C3B372696F20282A2E667233297C2A
        2E667233222F3E0D0A20203C537472526573204E616D653D2232343732222054
        6578743D224172717569766F732050617363616C20282A2E706173297C2A2E70
        61737C4172717569766F7320432B2B20282A2E637070297C2A2E6370707C4172
        717569766F73204A61766153637269707420282A2E6A73297C2A2E6A737C4172
        717569766F7320426173696320282A2E7662297C2A2E76627C546F646F73206F
        73206172717569766F737C2A2E2A222F3E0D0A20203C537472526573204E616D
        653D22323437332220546578743D224172717569766F732050617363616C2028
        2A2E706173297C2A2E7061737C4172717569766F7320432B2B20282A2E637070
        297C2A2E6370707C4172717569766F73204A61766153637269707420282A2E6A
        73297C2A2E6A737C4172717569766F7320426173696320282A2E7662297C2A2E
        76627C546F646F73206F73206172717569766F737C2A2E2A222F3E0D0A20203C
        537472526573204E616D653D22323437342220546578743D22436F6E6578C3B5
        65732E2E2E222F3E0D0A20203C537472526573204E616D653D22323437352220
        546578743D224964696F6D61222F3E0D0A20203C537472526573204E616D653D
        22323437362220546578743D22506F6E746F20646520706172616461222F3E0D
        0A20203C537472526573204E616D653D22323437372220546578743D2246756E
        63696F6E61722070656C6F20637572736F72222F3E0D0A20203C537472526573
        204E616D653D22323437382220546578743D2241646963696F6E612062616E64
        612066696C6861222F3E0D0A20203C537472526573204E616D653D226473436D
        2220546578743D2243656E74C3AD6D6574726F73222F3E0D0A20203C53747252
        6573204E616D653D226473496E63682220546578743D22506F6C656761646173
        222F3E0D0A20203C537472526573204E616D653D226473506978222054657874
        3D22506978656C73222F3E0D0A20203C537472526573204E616D653D22647343
        686172732220546578743D2243617261637465726573222F3E0D0A20203C5374
        72526573204E616D653D226473436F64652220546578743D2243C3B36469676F
        222F3E0D0A20203C537472526573204E616D653D226473446174612220546578
        743D2244617461222F3E0D0A20203C537472526573204E616D653D2264735061
        67652220546578743D2250C3A167696E61222F3E0D0A20203C53747252657320
        4E616D653D22647352657046696C7465722220546578743D2252656C6174C3B3
        72696F20282A2E667233297C2A2E667233222F3E0D0A20203C53747252657320
        4E616D653D226473436F6D707252657046696C7465722220546578743D225265
        6C6174C3B372696F20636F6D7061637461646F20282A2E667233297C2A2E6672
        33222F3E0D0A20203C537472526573204E616D653D2264735361766550726576
        6965774368616E6765732220546578743D2253616C76617220616C74657261C3
        A7C3B56573207061726120612070C3A167696E612064652076697375616C697A
        61C3A7C3A36F3F222F3E0D0A20203C537472526573204E616D653D2264735361
        76654368616E676573546F2220546578743D2253616C76617220616C74657261
        C3A7C3B565732070617261222F3E0D0A20203C537472526573204E616D653D22
        647343616E744C6F61642220546578743D22496D706F7373C3AD76656C206361
        727265676172206172717569766F222F3E0D0A20203C537472526573204E616D
        653D2264735374796C6546696C652220546578743D22457374696C6F222F3E0D
        0A20203C537472526573204E616D653D22647343616E7446696E6450726F6322
        20546578743D22496D706F7373C3AD76656C206C6F63616C697A6172206F2070
        726F636564696D656E746F207072696E636970616C2E222F3E0D0A20203C5374
        72526573204E616D653D226473436C6561725363726970742220546578743D22
        4973736F206C696D706172C3A120746F646F206F2063C3B36469676F2E204465
        73656A6120636F6E74696E7561723F222F3E0D0A20203C537472526573204E61
        6D653D2264734E6F5374796C652220546578743D224E656E68756D2065737469
        6C6F222F3E0D0A20203C537472526573204E616D653D2264735374796C655361
        6D706C652220546578743D224578656D706C6F20646520657374696C6F222F3E
        0D0A20203C537472526573204E616D653D226473546578744E6F74466F756E64
        2220546578743D22546578746F25736EC3A36F20656E636F6E747261646F222F
        3E0D0A20203C537472526573204E616D653D2264735265706C61636522205465
        78743D22537562737469747569722065737461206F636F7272C3AA6E63696120
        6465257320203F222F3E0D0A20203C537472526573204E616D653D2232363030
        2220546578743D22536F627265206F20466173745265706F7274222F3E0D0A20
        203C537472526573204E616D653D22323630312220546578743D225669736974
        65206E6F7373612070C3A167696E612070617261206D61697320696E666F726D
        61C3A7C3B565733A222F3E0D0A20203C537472526573204E616D653D22323630
        322220546578743D2256656E6461733A222F3E0D0A20203C537472526573204E
        616D653D22323630332220546578743D225375706F7274653A222F3E0D0A2020
        3C537472526573204E616D653D22323730302220546578743D224F70C3A7C3B5
        65732064612050C3A167696E61222F3E0D0A20203C537472526573204E616D65
        3D22323730312220546578743D22506170656C222F3E0D0A20203C5374725265
        73204E616D653D22323730322220546578743D224C617267757261222F3E0D0A
        20203C537472526573204E616D653D22323730332220546578743D22416C7475
        7261222F3E0D0A20203C537472526573204E616D653D22323730342220546578
        743D2254616D616E686F222F3E0D0A20203C537472526573204E616D653D2232
        3730352220546578743D224F7269656E7461C3A7C3A36F222F3E0D0A20203C53
        7472526573204E616D653D22323730362220546578743D224573717565726461
        222F3E0D0A20203C537472526573204E616D653D22323730372220546578743D
        225375706572696F72222F3E0D0A20203C537472526573204E616D653D223237
        30382220546578743D2244697265697461222F3E0D0A20203C53747252657320
        4E616D653D22323730392220546578743D22496E666572696F72222F3E0D0A20
        203C537472526573204E616D653D22323731302220546578743D224D61726765
        6E73222F3E0D0A20203C537472526573204E616D653D22323731312220546578
        743D224F726967656D20646F20506170656C222F3E0D0A20203C537472526573
        204E616D653D22323731322220546578743D225072696D656972612070C3A167
        696E61222F3E0D0A20203C537472526573204E616D653D223237313322205465
        78743D224F75747261732070C3A167696E6173222F3E0D0A20203C5374725265
        73204E616D653D22323731342220546578743D225265747261746F222F3E0D0A
        20203C537472526573204E616D653D22323731352220546578743D2250616973
        6167656D222F3E0D0A20203C537472526573204E616D653D2232373136222054
        6578743D224F7574726173204F70C3A7C3B56573222F3E0D0A20203C53747252
        6573204E616D653D22323731372220546578743D22436F6C756E6173222F3E0D
        0A20203C537472526573204E616D653D22323731382220546578743D224EC3BA
        6D65726F222F3E0D0A20203C537472526573204E616D653D2232373139222054
        6578743D224C617267757261222F3E0D0A20203C537472526573204E616D653D
        22323732302220546578743D22506F7369C3A7C3B56573222F3E0D0A20203C53
        7472526573204E616D653D22323732312220546578743D224F7574726F73222F
        3E0D0A20203C537472526573204E616D653D22323732322220546578743D2244
        75706C6578222F3E0D0A20203C537472526573204E616D653D22323732332220
        546578743D22496D7072696D697220706172612070C3A167696E6120616E7465
        72696F72222F3E0D0A20203C537472526573204E616D653D2232373234222054
        6578743D224D617267656E7320657370656C686F222F3E0D0A20203C53747252
        6573204E616D653D22323732352220546578743D22416C747572612065787465
        6E736120656D206D6F646F20646520646573656E686F222F3E0D0A20203C5374
        72526573204E616D653D22323732362220546578743D224C6172677572612064
        652070C3A167696E6120696E66696E697461222F3E0D0A20203C537472526573
        204E616D653D22323732372220546578743D22416C747572612064652070C3A1
        67696E6120696E66696E697461222F3E0D0A20203C537472526573204E616D65
        3D22323830302220546578743D224573636F6C6861206F732044617461736574
        7320646F2052656C6174C3B372696F222F3E0D0A20203C537472526573204E61
        6D653D22323930302220546578743D224564697461722056617269C3A1766569
        73222F3E0D0A20203C537472526573204E616D653D2232393031222054657874
        3D2243617465676F726961222F3E0D0A20203C537472526573204E616D653D22
        323930322220546578743D2256617269C3A176656C222F3E0D0A20203C537472
        526573204E616D653D22323930332220546578743D22456469746172222F3E0D
        0A20203C537472526573204E616D653D22323930342220546578743D2252656D
        6F766572222F3E0D0A20203C537472526573204E616D653D2232393035222054
        6578743D224C69737461222F3E0D0A20203C537472526573204E616D653D2232
        3930362220546578743D224361727265676172222F3E0D0A20203C5374725265
        73204E616D653D22323930372220546578743D2253616C766172222F3E0D0A20
        203C537472526573204E616D653D22323930382220546578743D222045787072
        657373C3A36F3A222F3E0D0A20203C537472526573204E616D653D2232393039
        2220546578743D22446963696F6EC3A172696F20282A2E666433297C2A2E6664
        33222F3E0D0A20203C537472526573204E616D653D2232393130222054657874
        3D22446963696F6EC3A172696F20282A2E666433297C2A2E666433222F3E0D0A
        20203C537472526573204E616D653D2276614E6F5661722220546578743D2228
        6E656E68756D612076617269C3A176656C20646566696E69646129222F3E0D0A
        20203C537472526573204E616D653D2276615661722220546578743D22566172
        69C3A176656973222F3E0D0A20203C537472526573204E616D653D2276614475
        704E616D652220546578743D224E6F6D65206475706C696361646F222F3E0D0A
        20203C537472526573204E616D653D22333030302220546578743D224F70C3A7
        C3B5657320646520446573656E686F222F3E0D0A20203C537472526573204E61
        6D653D22333030312220546578743D224772616465222F3E0D0A20203C537472
        526573204E616D653D22333030322220546578743D225469706F222F3E0D0A20
        203C537472526573204E616D653D22333030332220546578743D2254616D616E
        686F222F3E0D0A20203C537472526573204E616D653D22333030342220546578
        743D22466F726D756CC3A172696F206465206469C3A16C6F676F3A222F3E0D0A
        20203C537472526573204E616D653D22333030352220546578743D224F757472
        6F73222F3E0D0A20203C537472526573204E616D653D22333030362220546578
        743D22466F6E746573222F3E0D0A20203C537472526573204E616D653D223330
        30372220546578743D224A616E656C612064652043C3B36469676F222F3E0D0A
        20203C537472526573204E616D653D22333030382220546578743D2245646974
        6F72206465204D656D6F222F3E0D0A20203C537472526573204E616D653D2233
        3030392220546578743D2254616D616E686F222F3E0D0A20203C537472526573
        204E616D653D22333031302220546578743D2254616D616E686F222F3E0D0A20
        203C537472526573204E616D653D22333031312220546578743D22436F726573
        222F3E0D0A20203C537472526573204E616D653D22333031322220546578743D
        2245737061C3A76F20656E7472652062616E6461733A222F3E0D0A20203C5374
        72526573204E616D653D22333031332220546578743D22636D222F3E0D0A2020
        3C537472526573204E616D653D22333031342220546578743D22706F6C222F3E
        0D0A20203C537472526573204E616D653D22333031352220546578743D227074
        222F3E0D0A20203C537472526573204E616D653D22333031362220546578743D
        227074222F3E0D0A20203C537472526573204E616D653D223330313722205465
        78743D227074222F3E0D0A20203C537472526573204E616D653D223330313822
        20546578743D2243656E74C3AD6D6574726F733A222F3E0D0A20203C53747252
        6573204E616D653D22333031392220546578743D22506F6C6567616461733A22
        2F3E0D0A20203C537472526573204E616D653D22333032302220546578743D22
        506978656C733A222F3E0D0A20203C537472526573204E616D653D2233303231
        2220546578743D224D6F7374726172206772616465222F3E0D0A20203C537472
        526573204E616D653D22333032322220546578743D22416C696E686172206E61
        206772616465222F3E0D0A20203C537472526573204E616D653D223330323322
        20546578743D224D6F7374726172206F20656469746F72206170C3B37320696E
        7365726972222F3E0D0A20203C537472526573204E616D653D22333032342220
        546578743D225573617220617320636F6E666967757261C3A7C3B56573206465
        20666F6E746520646F206F626A65746F222F3E0D0A20203C537472526573204E
        616D653D22333032352220546578743D2245737061C3A76F2064652074726162
        616C686F222F3E0D0A20203C537472526573204E616D653D2233303236222054
        6578743D224A616E656C61732064652046657272616D656E7461222F3E0D0A20
        203C537472526573204E616D653D22333032372220546578743D22436F722064
        61206772616465204C4344222F3E0D0A20203C537472526573204E616D653D22
        333032382220546578743D22436F6C6F6361C3A7C3A36F206C69767265206465
        2062616E646173222F3E0D0A20203C537472526573204E616D653D2233303239
        2220546578743D224D6F7374726172206C697374612064652063616D706F7320
        64726F702D646F776E222F3E0D0A20203C537472526573204E616D653D223330
        33302220546578743D224D6F73747261722074656C6120646520696E69636961
        6C697A61C3A7C3A36F222F3E0D0A20203C537472526573204E616D653D223330
        33312220546578743D225265737461757261722070616472C3B56573222F3E0D
        0A20203C537472526573204E616D653D22333033322220546578743D224D6F73
        747261722072C3B374756C6F206461732062616E646173222F3E0D0A20203C53
        7472526573204E616D653D22333130302220546578743D2253656C6563696F6E
        61722044617461536574222F3E0D0A20203C537472526573204E616D653D2233
        3130312220546578743D225175616E7469646164652064652072656769737472
        6F733A222F3E0D0A20203C537472526573204E616D653D2264624E6F74417373
        69676E65642220546578743D225B6EC3A36F2064657369676E61646F5D222F3E
        0D0A20203C537472526573204E616D653D22333230302220546578743D224772
        75706F222F3E0D0A20203C537472526573204E616D653D223332303122205465
        78743D225175656272617220656D222F3E0D0A20203C537472526573204E616D
        653D22333230322220546578743D224F70C3A7C3B56573222F3E0D0A20203C53
        7472526573204E616D653D22333230332220546578743D2243616D706F206465
        204461646F73222F3E0D0A20203C537472526573204E616D653D223332303422
        20546578743D2245787072657373C3B56573222F3E0D0A20203C537472526573
        204E616D653D22333230352220546578743D224D616E74657220677275706F20
        756E69646F222F3E0D0A20203C537472526573204E616D653D22333230362220
        546578743D22496E6963696172206E6F76612070C3A167696E61222F3E0D0A20
        203C537472526573204E616D653D22333230372220546578743D224D6F737472
        6172206E6F20726573756D6F222F3E0D0A20203C537472526573204E616D653D
        22333330302220546578743D224D656D6F20646F2053697374656D61222F3E0D
        0A20203C537472526573204E616D653D22333330312220546578743D2242616E
        6461206465204461646F73222F3E0D0A20203C537472526573204E616D653D22
        333330322220546578743D2244617461536574222F3E0D0A20203C5374725265
        73204E616D653D22333330332220546578743D2243616D706F222F3E0D0A2020
        3C537472526573204E616D653D22333330342220546578743D2246756EC3A7C3
        A36F222F3E0D0A20203C537472526573204E616D653D22333330352220546578
        743D2245787072657373C3A36F222F3E0D0A20203C537472526573204E616D65
        3D22333330362220546578743D2256616C6F7220616772656761646F222F3E0D
        0A20203C537472526573204E616D653D22333330372220546578743D22566172
        69C3A176656C20646F2073697374656D61222F3E0D0A20203C53747252657320
        4E616D653D22333330382220546578743D22436F6E7461722062616E64617320
        696E766973C3AD76656973222F3E0D0A20203C537472526573204E616D653D22
        333330392220546578743D22546578746F222F3E0D0A20203C53747252657320
        4E616D653D22333331302220546578743D22546F74616C206465206578656375
        C3A7C3A36F222F3E0D0A20203C537472526573204E616D653D22616741676772
        65676174652220546578743D22496E736572697220416772656761646F222F3E
        0D0A20203C537472526573204E616D653D227674312220546578743D225B4441
        54455D222F3E0D0A20203C537472526573204E616D653D227674322220546578
        743D225B54494D455D222F3E0D0A20203C537472526573204E616D653D227674
        332220546578743D225B50414745235D222F3E0D0A20203C537472526573204E
        616D653D227674342220546578743D225B544F54414C5041474553235D222F3E
        0D0A20203C537472526573204E616D653D227674352220546578743D225B5041
        4745235D206465205B544F54414C5041474553235D222F3E0D0A20203C537472
        526573204E616D653D227674362220546578743D225B4C494E45235D222F3E0D
        0A20203C537472526573204E616D653D22333430302220546578743D224F626A
        65746F204F4C45222F3E0D0A20203C537472526573204E616D653D2233343031
        2220546578743D22496E73657269722E2E2E222F3E0D0A20203C537472526573
        204E616D653D22333430322220546578743D224564697461722E2E2E222F3E0D
        0A20203C537472526573204E616D653D22333430332220546578743D22466563
        686172222F3E0D0A20203C537472526573204E616D653D226F6C537472657463
        6865642220546578743D22457374696361646F222F3E0D0A20203C5374725265
        73204E616D653D22333530302220546578743D22456469746F722064652043C3
        B36469676F20646520426172726173222F3E0D0A20203C537472526573204E61
        6D653D22333530312220546578743D2243C3B36469676F222F3E0D0A20203C53
        7472526573204E616D653D22333530322220546578743D225469706F20646520
        4261727261222F3E0D0A20203C537472526573204E616D653D22333530332220
        546578743D225A6F6F6D3A222F3E0D0A20203C537472526573204E616D653D22
        333530342220546578743D224F70C3A7C3B56573222F3E0D0A20203C53747252
        6573204E616D653D22333530352220546578743D22526F7461C3A7C3A36F222F
        3E0D0A20203C537472526573204E616D653D22333530362220546578743D2243
        616C63756C617220536F6D6120646520436F6E74726F6C65222F3E0D0A20203C
        537472526573204E616D653D22333530372220546578743D22546578746F222F
        3E0D0A20203C537472526573204E616D653D22333530382220546578743D2230
        C2B0222F3E0D0A20203C537472526573204E616D653D22333530392220546578
        743D223930C2B0222F3E0D0A20203C537472526573204E616D653D2233353130
        2220546578743D22313830C2B0222F3E0D0A20203C537472526573204E616D65
        3D22333531312220546578743D22323730C2B0222F3E0D0A20203C5374725265
        73204E616D653D22626343616C63436865636B73756D2220546578743D224361
        6C63756C617220536F6D6120646520436F6E74726F6C65222F3E0D0A20203C53
        7472526573204E616D653D22626353686F77546578742220546578743D224D6F
        737472617220546578746F222F3E0D0A20203C537472526573204E616D653D22
        333630302220546578743D22456469746172204170656C69646F73222F3E0D0A
        20203C537472526573204E616D653D22333630312220546578743D2250726573
        73696F6E6520456E746572207061726120656469746172206F206974656D222F
        3E0D0A20203C537472526573204E616D653D22333630322220546578743D2241
        70656C69646F20646F2044617461736574222F3E0D0A20203C53747252657320
        4E616D653D22333630332220546578743D224170656C69646F7320646F732063
        616D706F73222F3E0D0A20203C537472526573204E616D653D22333630342220
        546578743D225265646566696E6972222F3E0D0A20203C537472526573204E61
        6D653D22333630352220546578743D22417475616C697A6172222F3E0D0A2020
        3C537472526573204E616D653D22616C557365724E616D652220546578743D22
        4E6F6D6520646F20757375C3A172696F222F3E0D0A20203C537472526573204E
        616D653D22616C4F726967696E616C2220546578743D224E6F6D65206F726967
        696E616C222F3E0D0A20203C537472526573204E616D653D2233373030222054
        6578743D22456469746F7220646520506172C3A26D6574726F73222F3E0D0A20
        203C537472526573204E616D653D2271704E616D652220546578743D224E6F6D
        65222F3E0D0A20203C537472526573204E616D653D2271704461746154797065
        2220546578743D225469706F206465204461646F222F3E0D0A20203C53747252
        6573204E616D653D22717056616C75652220546578743D2256616C6F72222F3E
        0D0A20203C537472526573204E616D653D22333830302220546578743D224C69
        6761C3A7C3A36F204D65737472652D446574616C6865222F3E0D0A20203C5374
        72526573204E616D653D22333830312220546578743D2243616D706F73204465
        74616C6865222F3E0D0A20203C537472526573204E616D653D22333830322220
        546578743D2243616D706F73204D6573747265222F3E0D0A20203C5374725265
        73204E616D653D22333830332220546578743D2243616D706F73204C69676164
        6F73222F3E0D0A20203C537472526573204E616D653D22333830342220546578
        743D2241646963696F6E6172222F3E0D0A20203C537472526573204E616D653D
        22333830352220546578743D224C696D706172222F3E0D0A20203C5374725265
        73204E616D653D22333930302220546578743D224D656D6F72616E646F222F3E
        0D0A20203C537472526573204E616D653D22333930312220546578743D22496E
        73657269722045787072657373C3A36F222F3E0D0A20203C537472526573204E
        616D653D22333930322220546578743D22496E73657269722041677265676164
        6F222F3E0D0A20203C537472526573204E616D653D2233393033222054657874
        3D22496E736572697220466F726D617461C3A7C3A36F222F3E0D0A20203C5374
        72526573204E616D653D22333930342220546578743D2251756562726172206C
        696E686173222F3E0D0A20203C537472526573204E616D653D22333930352220
        546578743D22546578746F222F3E0D0A20203C537472526573204E616D653D22
        333930362220546578743D22466F726D61746F222F3E0D0A20203C5374725265
        73204E616D653D22333930372220546578743D224465737461717565222F3E0D
        0A20203C537472526573204E616D653D22343030302220546578743D22466967
        757261222F3E0D0A20203C537472526573204E616D653D223430303122205465
        78743D224361727265676172222F3E0D0A20203C537472526573204E616D653D
        22343030322220546578743D22436F70696172222F3E0D0A20203C5374725265
        73204E616D653D22343030332220546578743D22436F6C6172222F3E0D0A2020
        3C537472526573204E616D653D22343030342220546578743D224C696D706172
        222F3E0D0A20203C537472526573204E616D653D227069456D70747922205465
        78743D2256617A696F222F3E0D0A20203C537472526573204E616D653D223431
        30302220546578743D22456469746F72206465204772C3A16669636F222F3E0D
        0A20203C537472526573204E616D653D22343130312220546578743D22416469
        63696F6E61722053C3A9726965222F3E0D0A20203C537472526573204E616D65
        3D22343130322220546578743D2252656D6F7665722053C3A9726965222F3E0D
        0A20203C537472526573204E616D653D22343130332220546578743D22456469
        746172204772C3A16669636F222F3E0D0A20203C537472526573204E616D653D
        22343130342220546578743D22466F6E74652064612042616E6461222F3E0D0A
        20203C537472526573204E616D653D22343130352220546578743D224461646F
        73206669786F73222F3E0D0A20203C537472526573204E616D653D2234313036
        2220546578743D2244617461736574222F3E0D0A20203C537472526573204E61
        6D653D22343130372220546578743D22466F6E7465206465204461646F73222F
        3E0D0A20203C537472526573204E616D653D22343130382220546578743D2256
        616C6F726573222F3E0D0A20203C537472526573204E616D653D223431303922
        20546578743D2253656C6563696F6E6520612073C3A9726965206F7520616469
        63696F6E6520756D206E6F766F206772C3A16669636F2E222F3E0D0A20203C53
        7472526573204E616D653D22343131342220546578743D224F7574726173206F
        70C3A7C3B56573222F3E0D0A20203C537472526573204E616D653D2234313135
        2220546578743D224D61696F726573204E2076616C6F726573222F3E0D0A2020
        3C537472526573204E616D653D22343131362220546578743D224D61696F7265
        73204E2072C3B374756C6F73222F3E0D0A20203C537472526573204E616D653D
        22343131372220546578743D224F7264656E61C3A7C3A36F222F3E0D0A20203C
        537472526573204E616D653D22343132362220546578743D2258206569786F73
        222F3E0D0A20203C537472526573204E616D653D22636833442220546578743D
        22566973C3A36F203344222F3E0D0A20203C537472526573204E616D653D2263
        68417869732220546578743D224D6F7374726172206569786F222F3E0D0A2020
        3C537472526573204E616D653D226368736F4E6F6E652220546578743D224E65
        6E68756D222F3E0D0A20203C537472526573204E616D653D226368736F417363
        656E64696E672220546578743D224372657363656E7465222F3E0D0A20203C53
        7472526573204E616D653D226368736F44657363656E64696E67222054657874
        3D2244656372657363656E7465222F3E0D0A20203C537472526573204E616D65
        3D2263687874546578742220546578743D22546578746F222F3E0D0A20203C53
        7472526573204E616D653D22636878744E756D6265722220546578743D224E75
        6DC3A97269636F222F3E0D0A20203C537472526573204E616D653D2263687874
        446174652220546578743D2244617461222F3E0D0A20203C537472526573204E
        616D653D22343230302220546578743D22456469746F72205269636820546578
        74222F3E0D0A20203C537472526573204E616D653D2234323031222054657874
        3D224162726972204172717569766F222F3E0D0A20203C537472526573204E61
        6D653D22343230322220546578743D2253616C766172204172717569766F222F
        3E0D0A20203C537472526573204E616D653D22343230332220546578743D2244
        657366617A6572222F3E0D0A20203C537472526573204E616D653D2234323034
        2220546578743D22466F6E7465222F3E0D0A20203C537472526573204E616D65
        3D22343230352220546578743D22496E73657269722045787072657373C3A36F
        222F3E0D0A20203C537472526573204E616D653D22343230362220546578743D
        224E65677269746F222F3E0D0A20203C537472526573204E616D653D22343230
        372220546578743D224974C3A16C69636F222F3E0D0A20203C53747252657320
        4E616D653D22343230382220546578743D225375626C696E6861646F222F3E0D
        0A20203C537472526573204E616D653D22343230392220546578743D22416C69
        6E68617220C3A0206573717565726461222F3E0D0A20203C537472526573204E
        616D653D22343231302220546578743D2243656E7472616C697A6172222F3E0D
        0A20203C537472526573204E616D653D22343231312220546578743D22416C69
        6E686120C3A02064697265697461222F3E0D0A20203C537472526573204E616D
        653D22343231322220546578743D224A757374696669636172222F3E0D0A2020
        3C537472526573204E616D653D22343231332220546578743D224D6172636164
        6F726573222F3E0D0A20203C537472526573204E616D653D2234333030222054
        6578743D22456469746F722043726F73732D746162222F3E0D0A20203C537472
        526573204E616D653D22343330312220546578743D22466F6E74652064652044
        61646F73222F3E0D0A20203C537472526573204E616D653D2234333032222054
        6578743D2244696D656E73C3B56573222F3E0D0A20203C537472526573204E61
        6D653D22343330332220546578743D224C696E686173222F3E0D0A20203C5374
        72526573204E616D653D22343330342220546578743D22436F6C756E6173222F
        3E0D0A20203C537472526573204E616D653D22343330352220546578743D2243
        C3A96C756C6173222F3E0D0A20203C537472526573204E616D653D2234333036
        2220546578743D224573747275747572612043726F73732D746162222F3E0D0A
        20203C537472526573204E616D653D22343330372220546578743D2243616265
        C3A7616C686F206465204C696E6861222F3E0D0A20203C537472526573204E61
        6D653D22343330382220546578743D2243616265C3A7616C686F20646520436F
        6C756E61222F3E0D0A20203C537472526573204E616D653D2234333039222054
        6578743D22546F74616C20676572616C206C696E6861222F3E0D0A20203C5374
        72526573204E616D653D22343331302220546578743D22546F74616C20676572
        616C20636F6C756E61222F3E0D0A20203C537472526573204E616D653D223433
        31312220546578743D2254726F636172206C696E6861732F636F6C756E617322
        2F3E0D0A20203C537472526573204E616D653D22343331322220546578743D22
        53656C6563696F6E6120657374696C6F222F3E0D0A20203C537472526573204E
        616D653D22343331332220546578743D2253616C766120657374696C6F20636F
        7272656E74652E2E2E222F3E0D0A20203C537472526573204E616D653D223433
        31342220546578743D2245786962652074C3AD74756C6F222F3E0D0A20203C53
        7472526573204E616D653D22343331352220546578743D224578696265206361
        6E746F222F3E0D0A20203C537472526573204E616D653D223433313622205465
        78743D225265696D7072696D652063616265C3A7616C686F20656D206E6F7661
        2070C3A167696E61222F3E0D0A20203C537472526573204E616D653D22343331
        372220546578743D2254616D616E686F206175746F6DC3A17469636F222F3E0D
        0A20203C537472526573204E616D653D22343331382220546578743D22417272
        65646F6E646120626F72646173206461732063C3A96C756C6173222F3E0D0A20
        203C537472526573204E616D653D22343331392220546578743D22496D707269
        6D652061626169786F206461206163726F7373222F3E0D0A20203C5374725265
        73204E616D653D22343332302220546578743D2243C3A96C756C6173204C6164
        6F2061204C61646F222F3E0D0A20203C537472526573204E616D653D22343332
        312220546578743D224C696761722063C3A96C756C617320696775616973222F
        3E0D0A20203C537472526573204E616D653D22343332322220546578743D224E
        656E68756D222F3E0D0A20203C537472526573204E616D653D22343332332220
        546578743D22536F6D61222F3E0D0A20203C537472526573204E616D653D2234
        3332342220546578743D224D696E222F3E0D0A20203C537472526573204E616D
        653D22343332352220546578743D224DC3A178222F3E0D0A20203C5374725265
        73204E616D653D22343332362220546578743D224DC3A9646961222F3E0D0A20
        203C537472526573204E616D653D22343332372220546578743D22436F6E7461
        72222F3E0D0A20203C537472526573204E616D653D2234333238222054657874
        3D224372657363656E74652028412D5A29222F3E0D0A20203C53747252657320
        4E616D653D22343332392220546578743D2244656372657363656E746520285A
        2D4129222F3E0D0A20203C537472526573204E616D653D223433333022205465
        78743D2253656D204F7264656E61C3A7C3A36F222F3E0D0A20203C5374725265
        73204E616D653D22637253744E616D652220546578743D22446967697465206F
        206E6F6D6520646F20657374696C6F3A222F3E0D0A20203C537472526573204E
        616D653D226372526573697A652220546578743D225061726120726564696D65
        6E73696F617220612063726F73732D7461622C20616C7465726520612070726F
        707269656461646520262333383B2333343B4175746F53697A65262333383B23
        33343B20706172612046616C736F2E222F3E0D0A20203C537472526573204E61
        6D653D226372537562746F74616C2220546578743D225375622D746F74616C22
        2F3E0D0A20203C537472526573204E616D653D2263724E6F6E65222054657874
        3D224E656E68756D222F3E0D0A20203C537472526573204E616D653D22637253
        756D2220546578743D22536F6D61222F3E0D0A20203C537472526573204E616D
        653D2263724D696E2220546578743D224DC3AD6E696D6F222F3E0D0A20203C53
        7472526573204E616D653D2263724D61782220546578743D224DC3A178696D6F
        222F3E0D0A20203C537472526573204E616D653D226372417667222054657874
        3D224DC3A9646961222F3E0D0A20203C537472526573204E616D653D22637243
        6F756E742220546578743D22436F6E746172222F3E0D0A20203C537472526573
        204E616D653D2263724173632220546578743D22412D5A222F3E0D0A20203C53
        7472526573204E616D653D226372446573632220546578743D225A2D41222F3E
        0D0A20203C537472526573204E616D653D22343430302220546578743D224564
        69746F722064652045787072657373C3B56573222F3E0D0A20203C5374725265
        73204E616D653D22343430312220546578743D2245787072657373C3A36F3A22
        2F3E0D0A20203C537472526573204E616D653D22343530302220546578743D22
        466F726D61746F206465204578696269C3A7C3A36F222F3E0D0A20203C537472
        526573204E616D653D22343530312220546578743D2243617465676F72696122
        2F3E0D0A20203C537472526573204E616D653D22343530322220546578743D22
        466F726D61746F222F3E0D0A20203C537472526573204E616D653D2234353033
        2220546578743D22537472696E6720646520666F726D617461C3A7C3A36F3A22
        2F3E0D0A20203C537472526573204E616D653D22343530342220546578743D22
        536570617261646F7220646563696D616C3A222F3E0D0A20203C537472526573
        204E616D653D22666B546578742220546578743D22546578746F202873656D20
        666F726D617461C3A7C3A36F29222F3E0D0A20203C537472526573204E616D65
        3D22666B4E756D6265722220546578743D224EC3BA6D65726F222F3E0D0A2020
        3C537472526573204E616D653D22666B4461746554696D652220546578743D22
        446174612F486F7261222F3E0D0A20203C537472526573204E616D653D22666B
        426F6F6C65616E2220546578743D224CC3B36769636F222F3E0D0A20203C5374
        72526573204E616D653D22666B4E756D626572312220546578743D2231323334
        2E353B2567222F3E0D0A20203C537472526573204E616D653D22666B4E756D62
        6572322220546578743D22313233342E35303B25322E3266222F3E0D0A20203C
        537472526573204E616D653D22666B4E756D626572332220546578743D22312C
        3233342E35303B25322E326E222F3E0D0A20203C537472526573204E616D653D
        22666B4E756D626572342220546578743D2224312C3233342E35303B25322E32
        6D222F3E0D0A20203C537472526573204E616D653D22666B4461746554696D65
        312220546578743D2232382F31312F323030323B64642F6D6D2F79797979222F
        3E0D0A20203C537472526573204E616D653D22666B4461746554696D65322220
        546578743D223238206E6F7620323030323B6464206D6D6D2079797979222F3E
        0D0A20203C537472526573204E616D653D22666B4461746554696D6533222054
        6578743D223238206465204E6F76656D62726F20646520323030323B64202623
        33383B2333343B6465262333383B2333343B206D6D6D6D20262333383B233334
        3B6465262333383B2333343B2079797979222F3E0D0A20203C53747252657320
        4E616D653D22666B4461746554696D65342220546578743D2230323A31343B68
        683A6D6D222F3E0D0A20203C537472526573204E616D653D22666B4461746554
        696D65352220546578743D2230323A3134616D3B68683A6D6D20616D2F706D22
        2F3E0D0A20203C537472526573204E616D653D22666B4461746554696D653622
        20546578743D2230323A31343A30303B68683A6D6D3A7373222F3E0D0A20203C
        537472526573204E616D653D22666B4461746554696D65372220546578743D22
        30323A3134682C203238206465204E6F76656D62726F20646520323030323B68
        683A6D6D262333383B2333343B68262333383B2333343B2C2064642026233338
        3B2333343B6465262333383B2333343B206D6D6D6D20262333383B2333343B64
        65262333383B2333343B2079797979222F3E0D0A20203C537472526573204E61
        6D653D22666B426F6F6C65616E312220546578743D22302C313B302C31222F3E
        0D0A20203C537472526573204E616D653D22666B426F6F6C65616E3222205465
        78743D224EC3A36F2C53696D3B4EC3A36F2C53696D222F3E0D0A20203C537472
        526573204E616D653D22666B426F6F6C65616E332220546578743D225F2C783B
        5F2C78222F3E0D0A20203C537472526573204E616D653D22666B426F6F6C6561
        6E342220546578743D2246616C736F2C5665726461646569726F3B46616C736F
        2C5665726461646569726F222F3E0D0A20203C537472526573204E616D653D22
        343630302220546578743D224465737461717565222F3E0D0A20203C53747252
        6573204E616D653D22343630312220546578743D22436F722E2E2E222F3E0D0A
        20203C537472526573204E616D653D22343630322220546578743D22436F722E
        2E2E222F3E0D0A20203C537472526573204E616D653D22343630332220546578
        743D22436F6E6469C3A7C3A36F222F3E0D0A20203C537472526573204E616D65
        3D22343630342220546578743D22466F6E7465222F3E0D0A20203C5374725265
        73204E616D653D22343630352220546578743D2246756E646F222F3E0D0A2020
        3C537472526573204E616D653D22343630362220546578743D224E6567726974
        6F222F3E0D0A20203C537472526573204E616D653D2234363037222054657874
        3D224974C3A16C69636F222F3E0D0A20203C537472526573204E616D653D2234
        3630382220546578743D225375626C696E6861646F222F3E0D0A20203C537472
        526573204E616D653D22343630392220546578743D225472616E73706172656E
        7465222F3E0D0A20203C537472526573204E616D653D22343631302220546578
        743D224F7574726F222F3E0D0A20203C537472526573204E616D653D22343730
        302220546578743D22436F6E666967757261C3A7C3A36F20646F2052656C6174
        C3B372696F222F3E0D0A20203C537472526573204E616D653D22343730312220
        546578743D22476572616C222F3E0D0A20203C537472526573204E616D653D22
        343730322220546578743D22436F6E666967757261C3A7C3B565732064612069
        6D70726573736F7261222F3E0D0A20203C537472526573204E616D653D223437
        30332220546578743D2243C3B370696173222F3E0D0A20203C53747252657320
        4E616D653D22343730342220546578743D22476572616C222F3E0D0A20203C53
        7472526573204E616D653D22343730352220546578743D2253656E6861222F3E
        0D0A20203C537472526573204E616D653D22343730362220546578743D224167
        72757061722063C3B370696173222F3E0D0A20203C537472526573204E616D65
        3D22343730372220546578743D22446F697320506173736F73222F3E0D0A2020
        3C537472526573204E616D653D22343730382220546578743D22496D7072696D
        69722073652076617A696F222F3E0D0A20203C537472526573204E616D653D22
        343730392220546578743D22446573637269C3A7C3A36F222F3E0D0A20203C53
        7472526573204E616D653D22343731302220546578743D224E6F6D65222F3E0D
        0A20203C537472526573204E616D653D22343731312220546578743D22446573
        637269C3A7C3A36F222F3E0D0A20203C537472526573204E616D653D22343731
        322220546578743D22466967757261222F3E0D0A20203C537472526573204E61
        6D653D22343731332220546578743D224175746F72222F3E0D0A20203C537472
        526573204E616D653D22343731342220546578743D224D61696F72222F3E0D0A
        20203C537472526573204E616D653D22343731352220546578743D224D656E6F
        72222F3E0D0A20203C537472526573204E616D653D2234373136222054657874
        3D22456469C3A7C3A36F222F3E0D0A20203C537472526573204E616D653D2234
        3731372220546578743D2247657261C3A7C3A36F222F3E0D0A20203C53747252
        6573204E616D653D22343731382220546578743D2243726961646F222F3E0D0A
        20203C537472526573204E616D653D22343731392220546578743D224D6F6469
        66696361646F222F3E0D0A20203C537472526573204E616D653D223437323022
        20546578743D22446573637269C3A7C3A36F222F3E0D0A20203C537472526573
        204E616D653D22343732312220546578743D2256657273C3A36F222F3E0D0A20
        203C537472526573204E616D653D22343732322220546578743D2250726F6375
        7261722E2E2E222F3E0D0A20203C537472526573204E616D653D223437323322
        20546578743D22416A7573746120686572616EC3A761222F3E0D0A20203C5374
        72526573204E616D653D22343732342220546578743D2253656C6563696F6E65
        2061206F70C3A7C3A36F3A222F3E0D0A20203C537472526573204E616D653D22
        343732352220546578743D224E656E68756D6120616C74657261C3A7C3A36F22
        2F3E0D0A20203C537472526573204E616D653D22343732362220546578743D22
        44657374616361206F2072656C6174C3B372696F2062617365222F3E0D0A2020
        3C537472526573204E616D653D22343732372220546578743D22486572616EC3
        A76120646F2072656C6174C3B372696F2062617365203A222F3E0D0A20203C53
        7472526573204E616D653D22343732382220546578743D22486572616EC3A761
        222F3E0D0A20203C537472526573204E616D653D22726550726E4F6E506F7274
        2220546578743D22656D222F3E0D0A20203C537472526573204E616D653D2272
        694E6F74496E686572697465642220546578743D22457374652072656C6174C3
        B372696F206EC3A36F20C3A9206865726461646F2E222F3E0D0A20203C537472
        526573204E616D653D227269496E686572697465642220546578743D22457374
        652072656C6174C3B372696F20C3A9206865726461646F20646F2072656C6174
        C3B372696F3A202573222F3E0D0A20203C537472526573204E616D653D223438
        30302220546578743D224C696E686173222F3E0D0A20203C537472526573204E
        616D653D22343930302220546578743D2253514C222F3E0D0A20203C53747252
        6573204E616D653D22343930312220546578743D2247657261646F7220646520
        436F6E73756C746173222F3E0D0A20203C537472526573204E616D653D223530
        30302220546578743D2253656E6861222F3E0D0A20203C537472526573204E61
        6D653D22353030312220546578743D22456E74726520636F6D20612073656E68
        613A222F3E0D0A20203C537472526573204E616D653D22353130302220546578
        743D22456469746F7220646520457374696C6F73222F3E0D0A20203C53747252
        6573204E616D653D22353130312220546578743D22436F722E2E2E222F3E0D0A
        20203C537472526573204E616D653D22353130322220546578743D22466F6E74
        652E2E2E222F3E0D0A20203C537472526573204E616D653D2235313033222054
        6578743D22426F7264612E2E2E222F3E0D0A20203C537472526573204E616D65
        3D22353130342220546578743D2241646963696F6E6172222F3E0D0A20203C53
        7472526573204E616D653D22353130352220546578743D2252656D6F76657222
        2F3E0D0A20203C537472526573204E616D653D22353130362220546578743D22
        456469746172222F3E0D0A20203C537472526573204E616D653D223531303722
        20546578743D224361727265676172222F3E0D0A20203C537472526573204E61
        6D653D22353130382220546578743D2253616C766172222F3E0D0A20203C5374
        72526573204E616D653D22353230302220546578743D22456469746F72206465
        20426F726461222F3E0D0A20203C537472526573204E616D653D223532303122
        20546578743D22426F726461222F3E0D0A20203C537472526573204E616D653D
        22353230322220546578743D224C696E686120646120426F726461222F3E0D0A
        20203C537472526573204E616D653D22353230332220546578743D22536F6D62
        7261222F3E0D0A20203C537472526573204E616D653D22353230342220546578
        743D224C696E6861204163696D61222F3E0D0A20203C537472526573204E616D
        653D22353230352220546578743D224C696E68612041626169786F222F3E0D0A
        20203C537472526573204E616D653D22353230362220546578743D224C696E68
        6120C3A0204573717565726461222F3E0D0A20203C537472526573204E616D65
        3D22353230372220546578743D224C696E686120C3A02044697265697461222F
        3E0D0A20203C537472526573204E616D653D22353230382220546578743D2254
        6F646173206173206C696E68617320646120626F726461222F3E0D0A20203C53
        7472526573204E616D653D22353230392220546578743D2253656D20426F7264
        61222F3E0D0A20203C537472526573204E616D653D2235323130222054657874
        3D22436F7220646120426F726461222F3E0D0A20203C537472526573204E616D
        653D22353231312220546578743D22457374696C6F20646120426F726461222F
        3E0D0A20203C537472526573204E616D653D22353231322220546578743D224C
        61726775726120646120426F726461222F3E0D0A20203C537472526573204E61
        6D653D22353231332220546578743D22536F6D627261222F3E0D0A20203C5374
        72526573204E616D653D22353231342220546578743D22436F7220646120536F
        6D627261222F3E0D0A20203C537472526573204E616D653D2235323135222054
        6578743D224C61726775726120646120536F6D627261222F3E0D0A20203C5374
        72526573204E616D653D22353330302220546578743D224E6F766F204974656D
        222F3E0D0A20203C537472526573204E616D653D22353330312220546578743D
        224974656E73222F3E0D0A20203C537472526573204E616D653D223533303222
        20546578743D224D6F64656C6F73222F3E0D0A20203C537472526573204E616D
        653D22353330332220546578743D22486572616EC3A76120646F2072656C6174
        C3B372696F222F3E0D0A20203C537472526573204E616D653D22353430302220
        546578743D224F7264656D20646520546162756C61C3A7C3A36F222F3E0D0A20
        203C537472526573204E616D653D22353430312220546578743D22436F6E7472
        6F6C6573206C69737461646F73206E61206F7264656D20646520746162756C61
        C3A7C3A36F3A222F3E0D0A20203C537472526573204E616D653D223534303222
        20546578743D22506172612043696D61222F3E0D0A20203C537472526573204E
        616D653D22353430332220546578743D225061726120426169786F222F3E0D0A
        20203C537472526573204E616D653D22353530302220546578743D224176616C
        696172222F3E0D0A20203C537472526573204E616D653D223535303122205465
        78743D2245787072657373C3A36F222F3E0D0A20203C537472526573204E616D
        653D22353530322220546578743D22526573756C7461646F222F3E0D0A20203C
        537472526573204E616D653D22353630302220546578743D2241737369737465
        6E74652064652052656C6174C3B372696F222F3E0D0A20203C53747252657320
        4E616D653D22353630312220546578743D224461646F73222F3E0D0A20203C53
        7472526573204E616D653D22353630322220546578743D2243616D706F73222F
        3E0D0A20203C537472526573204E616D653D22353630332220546578743D2247
        7275706F73222F3E0D0A20203C537472526573204E616D653D22353630342220
        546578743D224C656961757465222F3E0D0A20203C537472526573204E616D65
        3D22353630352220546578743D22457374696C6F222F3E0D0A20203C53747252
        6573204E616D653D22353630362220546578743D22506173736F20312E205365
        6C6563696F6E65206F20636F6E6A756E746F206465206461646F732E222F3E0D
        0A20203C537472526573204E616D653D22353630372220546578743D22506173
        736F20322E2053656C6563696F6E65206F732063616D706F7320612073657265
        6D206578696269646F732E222F3E0D0A20203C537472526573204E616D653D22
        353630382220546578743D22506173736F20332E204372696520677275706F73
        20286F7063696F6E616C292E222F3E0D0A20203C537472526573204E616D653D
        22353630392220546578743D22506173736F20342E20446566696E612061206F
        7269656E7461C3A7C3A36F2064612070C3A167696E612065206F206C65696175
        746520646F73206461646F732E222F3E0D0A20203C537472526573204E616D65
        3D22353631302220546578743D22506173736F20352E204573636F6C6861206F
        20657374696C6F20646F2072656C6174C3B372696F2E222F3E0D0A20203C5374
        72526573204E616D653D22353631312220546578743D2241646963696F6E6172
        20262336323B222F3E0D0A20203C537472526573204E616D653D223536313222
        20546578743D2241646963696F6E617220746F646F7320262336323B26233632
        3B222F3E0D0A20203C537472526573204E616D653D2235363133222054657874
        3D22262336303B2052656D6F766572222F3E0D0A20203C537472526573204E61
        6D653D22353631342220546578743D22262336303B262336303B2052656D6F76
        657220746F646F73222F3E0D0A20203C537472526573204E616D653D22353631
        352220546578743D2241646963696F6E617220262336323B222F3E0D0A20203C
        537472526573204E616D653D22353631362220546578743D22262336303B2052
        656D6F766572222F3E0D0A20203C537472526573204E616D653D223536313722
        20546578743D2243616D706F732073656C6563696F6E61646F733A222F3E0D0A
        20203C537472526573204E616D653D22353631382220546578743D2243616D70
        6F7320646973706F6EC3AD766569733A222F3E0D0A20203C537472526573204E
        616D653D22353631392220546578743D22477275706F733A222F3E0D0A20203C
        537472526573204E616D653D22353632302220546578743D224F7269656E7461
        C3A7C3A36F222F3E0D0A20203C537472526573204E616D653D22353632312220
        546578743D224C656961757465222F3E0D0A20203C537472526573204E616D65
        3D22353632322220546578743D225265747261746F222F3E0D0A20203C537472
        526573204E616D653D22353632332220546578743D22506169736167656D222F
        3E0D0A20203C537472526573204E616D653D22353632342220546578743D2254
        6162756C6172222F3E0D0A20203C537472526573204E616D653D223536323522
        20546578743D22456D20636F6C756E6173222F3E0D0A20203C53747252657320
        4E616D653D22353632362220546578743D22416A75737461722063616D706F73
        20C3A0206C6172677572612064612070C3A167696E61222F3E0D0A20203C5374
        72526573204E616D653D22353632372220546578743D22262336303B26233630
        3B20566F6C746172222F3E0D0A20203C537472526573204E616D653D22353632
        382220546578743D225072C3B378696D6F20262336323B262336323B222F3E0D
        0A20203C537472526573204E616D653D22353632392220546578743D2246696E
        616C697A6172222F3E0D0A20203C537472526573204E616D653D223536333022
        20546578743D224E6F766120746162656C612E2E2E222F3E0D0A20203C537472
        526573204E616D653D22353633312220546578743D224E6F766120636F6E7375
        6C74612E2E2E222F3E0D0A20203C537472526573204E616D653D223536333222
        20546578743D2253656C6563696F6E6120636F6E6578C3A36F20636F6D206120
        62617365206465206461646F733A222F3E0D0A20203C537472526573204E616D
        653D22353633332220546578743D2253656C6563696F6E61206120746162656C
        613A222F3E0D0A20203C537472526573204E616D653D22353633342220546578
        743D226F75222F3E0D0A20203C537472526573204E616D653D22353633352220
        546578743D224372696120612071756572792E2E2E222F3E0D0A20203C537472
        526573204E616D653D22353633362220546578743D22436F6E66696775726120
        636F6E6578C3B56573222F3E0D0A20203C537472526573204E616D653D22777A
        5374642220546578743D22417373697374656E74652064652052656C6174C3B3
        72696F2050616472C3A36F222F3E0D0A20203C537472526573204E616D653D22
        777A444D502220546578743D22417373697374656E74652064652052656C6174
        C3B372696F204D617472696369616C222F3E0D0A20203C537472526573204E61
        6D653D22777A537464456D7074792220546578743D2252656C6174C3B372696F
        2050616472C3A36F222F3E0D0A20203C537472526573204E616D653D22777A44
        4D50456D7074792220546578743D2252656C6174C3B372696F204D6174726963
        69616C222F3E0D0A20203C537472526573204E616D653D223537303022205465
        78743D22417373697374656E746520646520436F6E6578C3A36F222F3E0D0A20
        203C537472526573204E616D653D22353730312220546578743D22436F6E6578
        C3A36F222F3E0D0A20203C537472526573204E616D653D223537303222205465
        78743D224573636F6C6861206F207469706F20646520636F6E6578C3A36F3A22
        2F3E0D0A20203C537472526573204E616D653D22353730332220546578743D22
        4573636F6C6861206F2062616E636F206465206461646F733A222F3E0D0A2020
        3C537472526573204E616D653D22353730342220546578743D224C6F67696E22
        2F3E0D0A20203C537472526573204E616D653D22353730352220546578743D22
        53656E6861222F3E0D0A20203C537472526573204E616D653D22353730362220
        546578743D22546578746F206465206C6F67696E222F3E0D0A20203C53747252
        6573204E616D653D22353730372220546578743D2255736172206C6F67696E2F
        73656E68613A222F3E0D0A20203C537472526573204E616D653D223537303822
        20546578743D22546162656C61222F3E0D0A20203C537472526573204E616D65
        3D22353730392220546578743D224573636F6C6861206F206E6F6D6520646120
        746162656C613A222F3E0D0A20203C537472526573204E616D653D2235373130
        2220546578743D2246696C7472617220726567697374726F733A222F3E0D0A20
        203C537472526573204E616D653D22353731312220546578743D22436F6E7375
        6C7461222F3E0D0A20203C537472526573204E616D653D223537313222205465
        78743D22436CC3A17573756C612053514C3A222F3E0D0A20203C537472526573
        204E616D653D22353731332220546578743D22436F6E73747275746F72206465
        20436F6E73756C746173222F3E0D0A20203C537472526573204E616D653D2235
        3731342220546578743D22416C746572617220506172C3A26D6574726F732064
        6120436F6E73756C7461222F3E0D0A20203C537472526573204E616D653D2266
        74416C6C46696C65732220546578743D22546F646F73206F7320617271756976
        6F73222F3E0D0A20203C537472526573204E616D653D22667450696374757265
        732220546578743D2246696775726173222F3E0D0A20203C537472526573204E
        616D653D22667444422220546578743D2242616E636F73206465204461646F73
        222F3E0D0A20203C537472526573204E616D653D2266745269636846696C6522
        20546578743D224172717569766F205269636854657874222F3E0D0A20203C53
        7472526573204E616D653D2266745465787446696C652220546578743D224172
        717569766F20646520546578746F222F3E0D0A20203C537472526573204E616D
        653D2270724E6F7441737369676E65642220546578743D22284EC3A36F206465
        7369676E61646F29222F3E0D0A20203C537472526573204E616D653D22707249
        6E7650726F702220546578743D2256616C6F722064652070726F707269656461
        646520696E76C3A16C69646F222F3E0D0A20203C537472526573204E616D653D
        2270724475706C2220546578743D224E6F6D65206475706C696361646F222F3E
        0D0A20203C537472526573204E616D653D227072506963742220546578743D22
        2846696775726129222F3E0D0A20203C537472526573204E616D653D226D7645
        7870722220546578743D225065726D697469722045787072657373C3B5657322
        2F3E0D0A20203C537472526573204E616D653D226D7653747265746368222054
        6578743D2245737469636172222F3E0D0A20203C537472526573204E616D653D
        226D7653747265746368546F4D61782220546578743D22457374696361722061
        74C3A920416C74757261204DC3A178696D61222F3E0D0A20203C537472526573
        204E616D653D226D7653686966742220546578743D224465736C6F636172222F
        3E0D0A20203C537472526573204E616D653D226D7653686966744F7665722220
        546578743D224465736C6F636172205175616E646F20536F627265706F73746F
        222F3E0D0A20203C537472526573204E616D653D226D7656697369626C652220
        546578743D22566973C3AD76656C222F3E0D0A20203C537472526573204E616D
        653D226D765072696E7461626C652220546578743D22496D7072696D6972222F
        3E0D0A20203C537472526573204E616D653D226D76466F6E742220546578743D
        22466F6E74652E2E2E222F3E0D0A20203C537472526573204E616D653D226D76
        466F726D61742220546578743D22466F726D61746F206465204578696269C3A7
        C3A36F2E2E2E222F3E0D0A20203C537472526573204E616D653D226D76436C65
        61722220546578743D224C696D70617220436F6E7465C3BA646F222F3E0D0A20
        203C537472526573204E616D653D226D764175746F5769647468222054657874
        3D224C617267757261204175746F6DC3A174696361222F3E0D0A20203C537472
        526573204E616D653D226D7657577261702220546578743D2251756562726172
        204C696E686173222F3E0D0A20203C537472526573204E616D653D226D765375
        7070726573732220546578743D2253757072696D69722056616C6F7265732052
        6570657469646F73222F3E0D0A20203C537472526573204E616D653D226D7648
        6964655A2220546578743D224F63756C746172205A65726F73222F3E0D0A2020
        3C537472526573204E616D653D226D7648544D4C2220546578743D225065726D
        6974697220546167732048544D4C222F3E0D0A20203C537472526573204E616D
        653D226C76446961676F6E616C2220546578743D22446961676F6E616C222F3E
        0D0A20203C537472526573204E616D653D2270764175746F53697A6522205465
        78743D2254616D616E686F204175746F6DC3A17469636F222F3E0D0A20203C53
        7472526573204E616D653D22707643656E7465722220546578743D2243656E74
        726F222F3E0D0A20203C537472526573204E616D653D22707641737065637422
        20546578743D224D616E7465722050726F706F7263696F6E616C696461646522
        2F3E0D0A20203C537472526573204E616D653D22627653706C69742220546578
        743D225065726D69746972204469766973C3A36F222F3E0D0A20203C53747252
        6573204E616D653D2262764B6565704368696C642220546578743D224D616E74
        65722046696C6861204A756E746F222F3E0D0A20203C537472526573204E616D
        653D2262765072696E744368696C642220546578743D22496D7072696D697220
        46696C686120536520496E766973C3AD76656C222F3E0D0A20203C5374725265
        73204E616D653D2262765374617274506167652220546578743D22496E696369
        6172204E6F76612050C3A167696E61222F3E0D0A20203C537472526573204E61
        6D653D2262765072696E744966456D7074792220546578743D22496D7072696D
        697220536520446574616C68652056617A696F222F3E0D0A20203C5374725265
        73204E616D653D2262764B65657044657461696C2220546578743D224D616E74
        657220446574616C6865204A756E746F222F3E0D0A20203C537472526573204E
        616D653D2262764B656570466F6F7465722220546578743D224D616E74657220
        526F646170C3A9204A756E746F222F3E0D0A20203C537472526573204E616D65
        3D22627652657072696E742220546578743D225265696D7072696D697220656D
        206E6F76612070C3A167696E61222F3E0D0A20203C537472526573204E616D65
        3D2262764F6E46697273742220546578743D22496D7072696D6972206E612070
        72696D656972612070C3A167696E61222F3E0D0A20203C537472526573204E61
        6D653D2262764F6E4C6173742220546578743D22496D7072696D6972206E6120
        C3BA6C74696D612070C3A167696E61222F3E0D0A20203C537472526573204E61
        6D653D2262764B65657047726F75702220546578743D224D616E746572206A75
        6E746F222F3E0D0A20203C537472526573204E616D653D226276466F6F746572
        4166746572456163682220546578743D22526F646170C3A9206170C3B3732063
        616461206C696E6861222F3E0D0A20203C537472526573204E616D653D226276
        4472696C6C446F776E2220546578743D224C616EC3A761207061726120626169
        786F20286472696C6C2D646F776E29222F3E0D0A20203C537472526573204E61
        6D653D2262765265736574506167654E6F2220546578743D2252657374617572
        61206EC3BA6D65726F2064652070C3A167696E6173222F3E0D0A20203C537472
        526573204E616D653D227372506172656E742220546578743D22496D7072696D
        697220656D20506169222F3E0D0A20203C537472526573204E616D653D226276
        4B6565704865616465722220546578743D224D616E7465722043616265C3A761
        6C686F204A756E746F222F3E0D0A20203C537472526573204E616D653D226F62
        436174447261772220546578743D22446573656E686172222F3E0D0A20203C53
        7472526573204E616D653D226F624361744F746865722220546578743D224F75
        74726F73206F626A65746F73222F3E0D0A20203C537472526573204E616D653D
        226F624361744F74686572436F6E74726F6C732220546578743D224F7574726F
        7320636F6E74726F6C6573222F3E0D0A20203C537472526573204E616D653D22
        6F62446961674C696E652220546578743D224C696E686120646961676F6E616C
        222F3E0D0A20203C537472526573204E616D653D226F62526563742220546578
        743D22526574C3A26E67756C6F222F3E0D0A20203C537472526573204E616D65
        3D226F62526F756E64526563742220546578743D22526574C3A26E67756C6F20
        61727265646F6E6461646F222F3E0D0A20203C537472526573204E616D653D22
        6F62456C6C697073652220546578743D22456C69707365222F3E0D0A20203C53
        7472526573204E616D653D226F62547269616E2220546578743D22547269C3A2
        6E67756C6F222F3E0D0A20203C537472526573204E616D653D226F624469616D
        6F6E642220546578743D224469616D616E7465222F3E0D0A20203C5374725265
        73204E616D653D226F624C6162656C2220546578743D224C6162656C20646520
        436F6E74726F6C65222F3E0D0A20203C537472526573204E616D653D226F6245
        6469742220546578743D224564697420646520636F6E74726F6C65222F3E0D0A
        20203C537472526573204E616D653D226F624D656D6F432220546578743D224D
        656D6F72616E646F20646520436F6E74726F6C65222F3E0D0A20203C53747252
        6573204E616D653D226F62427574746F6E2220546578743D22426F74C3A36F20
        646520636F6E74726F6C65222F3E0D0A20203C537472526573204E616D653D22
        6F624368426F78432220546578743D22436865636B426F7820646520636F6E74
        726F6C65222F3E0D0A20203C537472526573204E616D653D226F625242757474
        6F6E2220546578743D22526164696F427574746F6E20646520636F6E74726F6C
        65222F3E0D0A20203C537472526573204E616D653D226F624C426F7822205465
        78743D224C697374426F7820646520636F6E74726F6C65222F3E0D0A20203C53
        7472526573204E616D653D226F6243426F782220546578743D22436F6D626F42
        6F7820646520636F6E74726F6C65222F3E0D0A20203C537472526573204E616D
        653D226F6244617465456469742220546578743D224461746545646974206465
        20636F6E74726F6C65222F3E0D0A20203C537472526573204E616D653D226F62
        496D616765432220546578743D22496D6167656D20646520636F6E74726F6C65
        222F3E0D0A20203C537472526573204E616D653D226F6250616E656C22205465
        78743D2250616E656C20646520636F6E74726F6C65222F3E0D0A20203C537472
        526573204E616D653D226F624772426F782220546578743D2247726F7570426F
        7820646520636F6E74726F6C65222F3E0D0A20203C537472526573204E616D65
        3D226F624242746E2220546578743D2242697442746E20646520636F6E74726F
        6C65222F3E0D0A20203C537472526573204E616D653D226F625342746E222054
        6578743D225370656564427574746F6E20646520636F6E74726F6C65222F3E0D
        0A20203C537472526573204E616D653D226F624D456469742220546578743D22
        4D61736B4564697420646520636F6E74726F6C65222F3E0D0A20203C53747252
        6573204E616D653D226F6243684C422220546578743D22436865636B4C697374
        426F7820646520636F6E74726F6C65222F3E0D0A20203C537472526573204E61
        6D653D226F6244424C6F6F6B75702220546578743D2244424C6F6F6B7570436F
        6D626F426F7820646520636F6E74726F6C65222F3E0D0A20203C537472526573
        204E616D653D226F62426576656C2220546578743D224F626A65746F20426576
        656C222F3E0D0A20203C537472526573204E616D653D226F6253686170652220
        546578743D224F626A65746F20466F726D61222F3E0D0A20203C537472526573
        204E616D653D226F62546578742220546578743D224F626A65746F2054657874
        6F222F3E0D0A20203C537472526573204E616D653D226F625379735465787422
        20546578743D22546578746F20646F2053697374656D61222F3E0D0A20203C53
        7472526573204E616D653D226F624C696E652220546578743D224F626A65746F
        204C696E6861222F3E0D0A20203C537472526573204E616D653D226F62506963
        747572652220546578743D224F626A65746F20466967757261222F3E0D0A2020
        3C537472526573204E616D653D226F6242616E642220546578743D224F626A65
        746F2042616E6461222F3E0D0A20203C537472526573204E616D653D226F6244
        61746142616E642220546578743D2242616E6461206465204461646F73222F3E
        0D0A20203C537472526573204E616D653D226F62537562526570222054657874
        3D224F626A65746F205375622D72656C6174C3B372696F222F3E0D0A20203C53
        7472526573204E616D653D226F62446C67506167652220546578743D22466F72
        6D756CC3A172696F206465204469616C6F676F222F3E0D0A20203C5374725265
        73204E616D653D226F62526570506167652220546578743D2250C3A167696E61
        2064652052656C6174C3B372696F222F3E0D0A20203C537472526573204E616D
        653D226F625265706F72742220546578743D224F626A65746F2052656C6174C3
        B372696F222F3E0D0A20203C537472526573204E616D653D226F625269636822
        20546578743D224F626A65746F205269636854657874222F3E0D0A20203C5374
        72526573204E616D653D226F624F4C452220546578743D224F626A65746F204F
        4C45222F3E0D0A20203C537472526573204E616D653D226F624368426F782220
        546578743D224F626A65746F20436865636B426F78222F3E0D0A20203C537472
        526573204E616D653D226F6243686172742220546578743D224F626A65746F20
        4772C3A16669636F222F3E0D0A20203C537472526573204E616D653D226F6242
        6172432220546578743D224F626A65746F2043C3B36469676F20646520426172
        726173222F3E0D0A20203C537472526573204E616D653D226F6243726F737322
        20546578743D224F626A65746F2043726F73732D746162222F3E0D0A20203C53
        7472526573204E616D653D226F62444243726F73732220546578743D224F626A
        65746F2044422043726F73732D746162222F3E0D0A20203C537472526573204E
        616D653D226F62477261642220546578743D224F626A65746F20477261646965
        6E7465222F3E0D0A20203C537472526573204E616D653D226F62444D50546578
        742220546578743D22546578746F204D617472696369616C222F3E0D0A20203C
        537472526573204E616D653D226F62444D504C696E652220546578743D224F62
        6A65746F204C696E6861204D617472696369616C222F3E0D0A20203C53747252
        6573204E616D653D226F62444D50436D642220546578743D224F626A65746F20
        436F6D616E646F204D617472696369616C222F3E0D0A20203C53747252657320
        4E616D653D226F6242444544422220546578743D2242616E636F206465204461
        646F7320424445222F3E0D0A20203C537472526573204E616D653D226F624244
        4554622220546578743D22546162656C6120424445222F3E0D0A20203C537472
        526573204E616D653D226F62424445512220546578743D22436F6E73756C7461
        20424445222F3E0D0A20203C537472526573204E616D653D226F62424445436F
        6D70732220546578743D22436F6D706F6E656E74657320424445222F3E0D0A20
        203C537472526573204E616D653D226F6249425844422220546578743D224261
        6E636F206465204461646F7320494258222F3E0D0A20203C537472526573204E
        616D653D226F6249425854622220546578743D22546162656C6120494258222F
        3E0D0A20203C537472526573204E616D653D226F62494258512220546578743D
        22436F6E73756C746120494258222F3E0D0A20203C537472526573204E616D65
        3D226F62494258436F6D70732220546578743D22436F6D706F6E656E74657320
        494258222F3E0D0A20203C537472526573204E616D653D226F6241444F444222
        20546578743D2242616E636F206465204461646F732041444F222F3E0D0A2020
        3C537472526573204E616D653D226F6241444F54622220546578743D22546162
        656C612041444F222F3E0D0A20203C537472526573204E616D653D226F624144
        4F512220546578743D22436F6E73756C74612041444F222F3E0D0A20203C5374
        72526573204E616D653D226F6241444F436F6D70732220546578743D22436F6D
        706F6E656E7465732041444F222F3E0D0A20203C537472526573204E616D653D
        226F6244425844422220546578743D2242616E636F206465204461646F732044
        4258222F3E0D0A20203C537472526573204E616D653D226F6244425854622220
        546578743D22546162656C6120444258222F3E0D0A20203C537472526573204E
        616D653D226F62444258512220546578743D22436F6E73756C74612044425822
        2F3E0D0A20203C537472526573204E616D653D226F62444258436F6D70732220
        546578743D22436F6D706F6E656E74657320444258222F3E0D0A20203C537472
        526573204E616D653D226F6246494244422220546578743D2242616E636F2064
        65204461646F7320464942222F3E0D0A20203C537472526573204E616D653D22
        6F6246494254622220546578743D22546162656C6120464942222F3E0D0A2020
        3C537472526573204E616D653D226F62464942512220546578743D22436F6E73
        756C746120464942222F3E0D0A20203C537472526573204E616D653D226F6246
        4942436F6D70732220546578743D22436F6D706F6E656E74657320464942222F
        3E0D0A20203C537472526573204E616D653D226374537472696E672220546578
        743D22537472696E67222F3E0D0A20203C537472526573204E616D653D226374
        446174652220546578743D2244617461206520486F7261222F3E0D0A20203C53
        7472526573204E616D653D226374436F6E762220546578743D22436F6E766572
        73C3B56573222F3E0D0A20203C537472526573204E616D653D226374466F726D
        61742220546578743D22466F726D617461C3A7C3A36F222F3E0D0A20203C5374
        72526573204E616D653D2263744D6174682220546578743D224D6174656DC3A1
        7469636F222F3E0D0A20203C537472526573204E616D653D2263744F74686572
        2220546578743D224F7574726F222F3E0D0A20203C537472526573204E616D65
        3D22496E74546F5374722220546578743D22436F6E766572746520756D207661
        6C6F7220696E746569726F20656D20737472696E67222F3E0D0A20203C537472
        526573204E616D653D22466C6F6174546F5374722220546578743D22436F6E76
        6572746520756D2076616C6F7220666C6F617420656D20737472696E67222F3E
        0D0A20203C537472526573204E616D653D2244617465546F5374722220546578
        743D22436F6E766572746520756D61206461746120656D20737472696E67222F
        3E0D0A20203C537472526573204E616D653D2254696D65546F53747222205465
        78743D22436F6E766572746520756D6120686F726120656D20737472696E6722
        2F3E0D0A20203C537472526573204E616D653D224461746554696D65546F5374
        722220546578743D22436F6E766572746520756D2076616C6F7220646174612D
        652D686F726120656D20737472696E67222F3E0D0A20203C537472526573204E
        616D653D22566172546F5374722220546578743D22436F6E766572746520756D
        2076616C6F722076617269616E7420656D20737472696E67222F3E0D0A20203C
        537472526573204E616D653D22537472546F496E742220546578743D22436F6E
        766572746520756D6120737472696E6720656D2076616C6F7220696E74656972
        6F222F3E0D0A20203C537472526573204E616D653D22537472546F496E743634
        2220546578743D22436F6E766572746520756D6120737472696E6720656D2076
        616C6F7220496E743634222F3E0D0A20203C537472526573204E616D653D2253
        7472546F466C6F61742220546578743D22436F6E766572746520756D61207374
        72696E6720656D2076616C6F7220646520706F6E746F20666C757475616E7465
        222F3E0D0A20203C537472526573204E616D653D22537472546F446174652220
        546578743D22436F6E766572746520756D6120737472696E6720656D20646174
        61222F3E0D0A20203C537472526573204E616D653D22537472546F54696D6522
        20546578743D22436F6E766572746520756D6120737472696E6720656D20686F
        7261222F3E0D0A20203C537472526573204E616D653D22537472546F44617465
        54696D652220546578743D22436F6E766572746520756D6120737472696E6720
        656D20666F726D61746F20646174612D652D686F7261222F3E0D0A20203C5374
        72526573204E616D653D22466F726D61742220546578743D225265746F726E61
        20756D6120737472696E6720666F726D6174616461206D6F6E74616461206465
        20756D612073C3A972696520646520617267756D656E746F7320656D20766574
        6F72222F3E0D0A20203C537472526573204E616D653D22466F726D6174466C6F
        61742220546578743D22466F726D61746120756D2076616C6F7220646520706F
        6E746F20666C757475616E7465222F3E0D0A20203C537472526573204E616D65
        3D22466F726D61744461746554696D652220546578743D22466F726D61746120
        756D2076616C6F7220646520646174612D652D686F7261222F3E0D0A20203C53
        7472526573204E616D653D22466F726D61744D61736B54657874222054657874
        3D225265746F726E6120756D6120737472696E6720666F726D61746164612075
        73616E646F20756D61206DC3A1736361726120646520656469C3A7C3A36F222F
        3E0D0A20203C537472526573204E616D653D22456E636F646544617465222054
        6578743D225265746F726E6120756D207469706F20544461746554696D652070
        61726120756D20416E6F2C204DC3AA7320652044696120657370656369666963
        61646F73222F3E0D0A20203C537472526573204E616D653D224465636F646544
        6174652220546578743D2253657061726120756D20544461746554696D652065
        6D20416E6F2C204DC3AA73206520446961222F3E0D0A20203C53747252657320
        4E616D653D22456E636F646554696D652220546578743D225265746F726E6120
        756D207469706F20544461746554696D6520656D20486F72612C204D696E7574
        6F732C20536567756E646F732E2065204D696C69736567756E646F732E206573
        7065636966696361646F73222F3E0D0A20203C537472526573204E616D653D22
        4465636F646554696D652220546578743D2253657061726120756D2054446174
        6554696D6520656D20686F7261732C206D696E75746F732C20736567756E646F
        732065206D696C69736567756E646F73222F3E0D0A20203C537472526573204E
        616D653D22446174652220546578743D225265746F726E612061206461746120
        617475616C222F3E0D0A20203C537472526573204E616D653D2254696D652220
        546578743D225265746F726E61206120686F726120617475616C222F3E0D0A20
        203C537472526573204E616D653D224E6F772220546578743D225265746F726E
        61206120646174612065206120686F726120617475616C222F3E0D0A20203C53
        7472526573204E616D653D224461794F665765656B2220546578743D22526574
        6F726E61206F206469612064612073656D616E61207061726120612064617461
        20657370656369666963616461222F3E0D0A20203C537472526573204E616D65
        3D2249734C656170596561722220546578743D22496E64696361207365206F20
        616E6F2065737065636966696361646F20C3A920626973736578746F222F3E0D
        0A20203C537472526573204E616D653D2244617973496E4D6F6E746822205465
        78743D225265746F726E61206F206EC3BA6D65726F2064652064696173206E6F
        206DC3AA732065737065636966696361646F222F3E0D0A20203C537472526573
        204E616D653D224C656E6774682220546578743D225265746F726E61206F2074
        616D616E686F20646520756D6120737472696E67222F3E0D0A20203C53747252
        6573204E616D653D22436F70792220546578743D225265746F726E6120756D61
        207375622D737472696E6720646520756D6120737472696E67222F3E0D0A2020
        3C537472526573204E616D653D22506F732220546578743D225265746F726E61
        20756D6120706F7369C3A7C3A36F20646520756D61207375622D737472696E67
        20646520756D6120737472696E67222F3E0D0A20203C537472526573204E616D
        653D2244656C6574652220546578743D2252656D6F766520756D61207375622D
        737472696E6720646520756D6120737472696E67222F3E0D0A20203C53747252
        6573204E616D653D22496E736572742220546578743D22496E7365726520756D
        6120207375622D737472696E6720656D20756D6120737472696E67222F3E0D0A
        20203C537472526573204E616D653D225570706572636173652220546578743D
        22436F6E766572746520746F646F73206F73206361726163746572657320656D
        20756D6120737472696E672070617261206D6169C3BA7363756C6F222F3E0D0A
        20203C537472526573204E616D653D224C6F776572636173652220546578743D
        22436F6E766572746520746F646F73206F73206361726163746572657320656D
        20756D6120737472696E672070617261206D696EC3BA7363756C6F222F3E0D0A
        20203C537472526573204E616D653D225472696D2220546578743D2252657469
        7261206F732065737061C3A76F73206E6F20696EC3AD63696F2065206E6F2066
        696D20646520756D6120737472696E67222F3E0D0A20203C537472526573204E
        616D653D224E616D65436173652220546578743D22436F6E7665727465206F20
        7072696D6569726F2063617261637465726520646520756D612070616C617672
        6120656D206D6169C3BA7363756C6F222F3E0D0A20203C537472526573204E61
        6D653D22436F6D70617265546578742220546578743D22436F6D706172612064
        75617320737472696E6773222F3E0D0A20203C537472526573204E616D653D22
        4368722220546578743D22436F6E766572746520756D2076616C6F7220696E74
        6569726F20656D20636172616374657265286368617229222F3E0D0A20203C53
        7472526573204E616D653D224F72642220546578743D22436F6E766572746520
        756D2076616C6F722063617261637465726528636861722920656D20696E7465
        69726F222F3E0D0A20203C537472526573204E616D653D225365744C656E6774
        682220546578743D2244657465726D696E61206F2074616D616E686F20646520
        756D6120737472696E67222F3E0D0A20203C537472526573204E616D653D2252
        6F756E642220546578743D2241727265646F6E646120756D2076616C6F722065
        6D20706F6E746F20666C757475616E746520616F206EC3BA6D65726F20696E74
        6569726F206D616973207072C3B378696D6F222F3E0D0A20203C537472526573
        204E616D653D225472756E632220546578743D225472756E636120756D207661
        6C6F7220656D20706F6E746F20666C757475616E7465207061726120696E7465
        69726F222F3E0D0A20203C537472526573204E616D653D22496E742220546578
        743D225265746F726E61206120706172746520696E746569726120646520756D
        61206EC3BA6D65726F207265616C222F3E0D0A20203C537472526573204E616D
        653D22467261632220546578743D225265746F726E6120612070617274652066
        726163696F6EC3A172696120646520756D206EC3BA6D65726F207265616C222F
        3E0D0A20203C537472526573204E616D653D22537172742220546578743D2252
        65746F726E612061207261697A20717561647261646120646F206EC3BA6D6572
        6F2065737065636966696361646F222F3E0D0A20203C537472526573204E616D
        653D224162732220546578743D225265746F726E61206F2076616C6F72206162
        736F6C75746F222F3E0D0A20203C537472526573204E616D653D2253696E2220
        546578743D225265746F726E61206F2073656E6F20646520756D20C3A26E6775
        6C6F2028656D2072616469616E6F7329222F3E0D0A20203C537472526573204E
        616D653D22436F732220546578743D225265746F726E61206F20636F73656E6F
        20646520756D20C3A26E67756C6F2028656D2072616469616E6F7329222F3E0D
        0A20203C537472526573204E616D653D2241726354616E2220546578743D2252
        65746F726E61206F206172636F74616E67656E7465222F3E0D0A20203C537472
        526573204E616D653D2254616E2220546578743D225265746F726E6120612074
        616E67656E7465222F3E0D0A20203C537472526573204E616D653D2245787022
        20546578743D225265746F726E61206F206578706F6E656E6369616C222F3E0D
        0A20203C537472526573204E616D653D224C6E2220546578743D225265746F72
        6E61206F206C6F67617269746D6F206E61747572616C20646520756D61206578
        7072657373C3A36F207265616C222F3E0D0A20203C537472526573204E616D65
        3D2250692220546578743D225265746F726E61206F206EC3BA6D65726F20332E
        313431353932362E2E2E222F3E0D0A20203C537472526573204E616D653D2249
        6E632220546578743D22496E6372656D656E746120756D2076616C6F72222F3E
        0D0A20203C537472526573204E616D653D224465632220546578743D22446563
        72656D656E746120756D2076616C6F72222F3E0D0A20203C537472526573204E
        616D653D225261697365457863657074696F6E2220546578743D224372696120
        756D612065786365C3A7C3A36F222F3E0D0A20203C537472526573204E616D65
        3D2253686F774D6573736167652220546578743D224D6F7374726120756D6120
        6361697861206465206D656E736167656D222F3E0D0A20203C53747252657320
        4E616D653D2252616E646F6D697A652220546578743D22496E69636961206F20
        67657261646F72206465206EC3BA6D65726F7320616C656174C3B372696F7322
        2F3E0D0A20203C537472526573204E616D653D2252616E646F6D222054657874
        3D225265746F726E6120756D206EC3BA6D65726F20616C656174C3B372696F22
        2F3E0D0A20203C537472526573204E616D653D2256616C6964496E7422205465
        78743D225265746F726E61205665726461646569726F20736520612073747269
        6E672065737065636966696361646120636F6E74C3A9756D20756D20696E7465
        69726F2076C3A16C69646F222F3E0D0A20203C537472526573204E616D653D22
        56616C6964466C6F61742220546578743D225265746F726E6120566572646164
        6569726F207365206120737472696E672065737065636966696361646120636F
        6E74C3A96D20756D612076616C6F7220656D20706F6E746F20666C757475616E
        7465222F3E0D0A20203C537472526573204E616D653D2256616C696444617465
        2220546578743D225265746F726E61205665726461646569726F207365206120
        737472696E672065737065636966696361646120636F6E74C3A96D20756D6120
        646174612076C3A16C696461222F3E0D0A20203C537472526573204E616D653D
        224949462220546578743D225265746F726E61205472756556616C7565207365
        206120457870722065737065636966696361646120C3A9205665726461646569
        72612C206361736F20636F6E7472C3A172696F207265746F726E612046616C73
        6556616C7565222F3E0D0A20203C537472526573204E616D653D224765742220
        546578743D22536F6D656E746520706172612075736F20696E7465726E6F222F
        3E0D0A20203C537472526573204E616D653D225365742220546578743D22536F
        6D656E746520706172612075736F20696E7465726E6F222F3E0D0A20203C5374
        72526573204E616D653D22496E707574426F782220546578743D224D6F737472
        6120756D61206361697861206465206469C3A16C6F676F20646520656E747261
        646120717565207065726D69746520616F20757375C3A172696F20666F726E65
        63657220756D6120737472696E67222F3E0D0A20203C537472526573204E616D
        653D22496E70757451756572792220546578743D224D6F7374726120756D6120
        6361697861206465206469C3A16C6F676F20646520656E747261646120717565
        207065726D69746520616F20757375C3A172696F20666F726E6563657220756D
        6120737472696E67222F3E0D0A20203C537472526573204E616D653D224D6573
        73616765446C672220546578743D224D6F7374726120756D6120636169786120
        6465206D656E736167656D222F3E0D0A20203C537472526573204E616D653D22
        4372656174654F6C654F626A6563742220546578743D224372696120756D206F
        626A65746F204F4C45222F3E0D0A20203C537472526573204E616D653D225661
        7241727261794372656174652220546578743D224372696120756D207665746F
        722076617269616E7465222F3E0D0A20203C537472526573204E616D653D2256
        6172547970652220546578743D225265746F726E61206F207469706F20646520
        756D2076616C6F722076617269616E7465222F3E0D0A20203C53747252657320
        4E616D653D224461794F662220546578743D225265746F726E61206F20646961
        20646F206DC3AA732028312E2E333129206461206461746120696E666F726D61
        6461222F3E0D0A20203C537472526573204E616D653D224D6F6E74684F662220
        546578743D225265746F726E61206F206EC3BA6D65726F20646F206DC3AA7320
        28312E2E313229206461206461746120696E666F726D616461222F3E0D0A2020
        3C537472526573204E616D653D22596561724F662220546578743D225265746F
        726E61206F20616E6F206461206461746120696E666F726D616461222F3E0D0A
        20203C537472526573204E616D653D2263744167677265676174652220546578
        743D22416772656761C3A7C3A36F222F3E0D0A20203C537472526573204E616D
        653D2253756D2220546578743D2243616C63756C61206120736F6D6120646520
        4578707220706172612061206C696E6861206465206461646F73206461204261
        6E6461222F3E0D0A20203C537472526573204E616D653D224176672220546578
        743D2243616C63756C612061206DC3A964696120646520457870722070617261
        2061206C696E6861206465206461646F732064612042616E6461222F3E0D0A20
        203C537472526573204E616D653D224D696E2220546578743D2243616C63756C
        61206F206DC3AD6E696D6F206465204578707220706172612061206C696E6861
        206465206461646F732064612042616E6461222F3E0D0A20203C537472526573
        204E616D653D224D61782220546578743D2243616C63756C61206F206DC3A178
        696D6F206465204578707220706172612061206C696E6861206465206461646F
        732064612042616E6461222F3E0D0A20203C537472526573204E616D653D2243
        6F756E742220546578743D2243616C63756C61206F206EC3BA6D65726F206465
        206C696E686173206465206461646F73222F3E0D0A20203C537472526573204E
        616D653D22777A4442436F6E6E2220546578743D22417373697374656E746520
        6465204E6F766120436F6E6578C3A36F222F3E0D0A20203C537472526573204E
        616D653D22777A44425461626C652220546578743D22417373697374656E7465
        206465204E6F766120546162656C61222F3E0D0A20203C537472526573204E61
        6D653D22777A444251756572792220546578743D22417373697374656E746520
        6465204E6F766120436F6E73756C7461222F3E0D0A20203C537472526573204E
        616D653D22353830302220546578743D22436F6E6578C3B56573222F3E0D0A20
        203C537472526573204E616D653D22353830312220546578743D224372696172
        222F3E0D0A20203C537472526573204E616D653D22353830322220546578743D
        224578636C756972222F3E0D0A20203C537472526573204E616D653D2263704E
        616D652220546578743D224E6F6D65222F3E0D0A20203C537472526573204E61
        6D653D226370436F6E6E5374722220546578743D22537472696E672064652063
        6F6E6578C3A36F222F3E0D0A20203C537472526573204E616D653D2273746172
        744372656174654E65772220546578743D224372696172206E6F766F2072656C
        6174C3B372696F222F3E0D0A20203C537472526573204E616D653D2273746172
        74437265617465426C616E6B2220546578743D2243726961722072656C6174C3
        B372696F20656D206272616E636F222F3E0D0A20203C537472526573204E616D
        653D2273746172744F70656E5265706F72742220546578743D22416272697220
        72656C6174C3B372696F222F3E0D0A20203C537472526573204E616D653D2273
        746172744F70656E4C6173742220546578743D22416272697220C3BA6C74696D
        6F2072656C6174C3B372696F222F3E0D0A20203C537472526573204E616D653D
        22737461727445646974416C69617365732220546578743D2245646974617220
        616C696173657320646520636F6E6578C3A36F222F3E0D0A20203C5374725265
        73204E616D653D22737461727448656C702220546578743D22416A756461222F
        3E0D0A20203C537472526573204E616D653D22353930302220546578743D2252
        656CC3B367696F73222F3E0D0A20203C537472526573204E616D653D22353930
        312220546578743D2241646963696F6E612072656CC3B367696F202877617463
        6829222F3E0D0A20203C537472526573204E616D653D22353930322220546578
        743D224578636C75692072656CC3B367696F2028776174636829222F3E0D0A20
        203C537472526573204E616D653D22353930332220546578743D224564697461
        2072656CC3B367696F2028776174636829222F3E0D0A20203C53747252657320
        4E616D653D22363030302220546578743D224572726F20646520686572616EC3
        A761222F3E0D0A20203C537472526573204E616D653D22363030312220546578
        743D22412062617365206520686572616EC3A76120646F732072656C6174C3B3
        72696F7320636F6E74C3A96D206F626A65746F73206475706C696361646F732E
        204F2071756520766F63C3AA20646573656A612066617A6572203F222F3E0D0A
        20203C537472526573204E616D653D22363030322220546578743D224578636C
        7569206475706C696361646F73222F3E0D0A20203C537472526573204E616D65
        3D22363030332220546578743D2252656E6F6D656961206475706C696361646F
        73222F3E0D0A20203C537472526573204E616D653D226473436F6C6F724F7468
        2220546578743D224F746865722E2E2E222F3E0D0A20203C537472526573204E
        616D653D22383030302220546578743D224578706F7274617220706172612045
        7863656C222F3E0D0A20203C537472526573204E616D653D2238303031222054
        6578743D22457374696C6F73222F3E0D0A20203C537472526573204E616D653D
        22383030322220546578743D2246696775726173222F3E0D0A20203C53747252
        6573204E616D653D22383030332220546578743D224D6573636C61722063C3A9
        6C756C6173222F3E0D0A20203C537472526573204E616D653D22383030342220
        546578743D224578706F727461C3A7C3A36F2072C3A170696461222F3E0D0A20
        203C537472526573204E616D653D22383030352220546578743D225759534957
        5947222F3E0D0A20203C537472526573204E616D653D22383030362220546578
        743D22436F6D6F20746578746F222F3E0D0A20203C537472526573204E616D65
        3D22383030372220546578743D2246756E646F222F3E0D0A20203C5374725265
        73204E616D653D22383030382220546578743D224162726972206F2045786365
        6C206465706F6973206465206578706F72746172222F3E0D0A20203C53747252
        6573204E616D653D22383030392220546578743D224172717569766F20646F20
        457863656C20207B2A2E786C73297C2A2E786C73222F3E0D0A20203C53747252
        6573204E616D653D22383031302220546578743D222E786C73222F3E0D0A2020
        3C537472526573204E616D653D22383130302220546578743D224578706F7274
        6172207061726120457863656C2028584D4C29222F3E0D0A20203C5374725265
        73204E616D653D22383130312220546578743D22457374696C6F73222F3E0D0A
        20203C537472526573204E616D653D22383130322220546578743D2257595349
        575947222F3E0D0A20203C537472526573204E616D653D223831303322205465
        78743D2246756E646F222F3E0D0A20203C537472526573204E616D653D223831
        30342220546578743D224162726972206F20457863656C206465706F69732064
        65206578706F72746172222F3E0D0A20203C537472526573204E616D653D2238
        3130352220546578743D224172717569766F20584D4C20646F20457863656C20
        282A2E786C73297C2A2E786C73222F3E0D0A20203C537472526573204E616D65
        3D22383130362220546578743D222E786C73222F3E0D0A20203C537472526573
        204E616D653D22383230302220546578743D224578706F727461722070617261
        20746162656C612048544D4C222F3E0D0A20203C537472526573204E616D653D
        22383230312220546578743D224162726972206465706F697320646520657870
        6F72746172222F3E0D0A20203C537472526573204E616D653D22383230322220
        546578743D22457374696C6F73222F3E0D0A20203C537472526573204E616D65
        3D22383230332220546578743D22466967757261222F3E0D0A20203C53747252
        6573204E616D653D22383230342220546578743D22546F64617320656D20756D
        61207061737461222F3E0D0A20203C537472526573204E616D653D2238323035
        2220546578743D224C6172677572612066697861222F3E0D0A20203C53747252
        6573204E616D653D22383230362220546578743D224E6176656761646F722064
        652070C3A167696E6173222F3E0D0A20203C537472526573204E616D653D2238
        3230372220546578743D224D756C74692D70C3A167696E61222F3E0D0A20203C
        537472526573204E616D653D22383230382220546578743D224E617665676164
        6F72204D6F7A696C6C61222F3E0D0A20203C537472526573204E616D653D2238
        3230392220546578743D2246756E646F222F3E0D0A20203C537472526573204E
        616D653D22383231302220546578743D224172717569766F2048544D4C20282A
        2E68746D6C297C2A2E68746D6C222F3E0D0A20203C537472526573204E616D65
        3D22383231312220546578743D222E68746D6C222F3E0D0A20203C5374725265
        73204E616D653D22383330302220546578743D224578706F7274617220706172
        6120546578746F2028696D70726573736F7261206D617472696369616C29222F
        3E0D0A20203C537472526573204E616D653D22383330312220546578743D2256
        697375616C697A6172206C696761646F2F6465736C696761646F222F3E0D0A20
        203C537472526573204E616D653D22383330322220546578743D222050726F70
        7269656461646573206465204578706F727461C3A7C3A36F222F3E0D0A20203C
        537472526573204E616D653D22383330332220546578743D2251756562726173
        2064652070C3A167696E61222F3E0D0A20203C537472526573204E616D653D22
        383330342220546578743D2250C3A167696E612064652063C3B36469676F204F
        454D222F3E0D0A20203C537472526573204E616D653D22383330352220546578
        743D224C696E6861732076617A696173222F3E0D0A20203C537472526573204E
        616D653D22383330362220546578743D2245737061C3A76F73206E6F20696EC3
        AD63696F222F3E0D0A20203C537472526573204E616D653D2238333037222054
        6578743D2250C3A167696E61733A222F3E0D0A20203C537472526573204E616D
        653D22383330382220546578743D22496E666F726D65206EC3BA6D65726F7320
        652F6F7520696E74657276616C6F2064652070C3A167696E6173207365706172
        61646F7320706F722076C3AD7267756C61732E2045782E3A20312C332C352D31
        32222F3E0D0A20203C537472526573204E616D653D2238333039222054657874
        3D22457363616C6F6E616D656E746F222F3E0D0A20203C537472526573204E61
        6D653D22383331302220546578743D22457363616C612058222F3E0D0A20203C
        537472526573204E616D653D22383331312220546578743D22457363616C6120
        59222F3E0D0A20203C537472526573204E616D653D2238333132222054657874
        3D22426F72646173222F3E0D0A20203C537472526573204E616D653D22383331
        332220546578743D224E656E68756D61222F3E0D0A20203C537472526573204E
        616D653D22383331342220546578743D2253696D706C6573222F3E0D0A20203C
        537472526573204E616D653D22383331352220546578743D224772C3A1666963
        61222F3E0D0A20203C537472526573204E616D653D2238333136222054657874
        3D22536F6D656E746520636F6D2070C3A167696E612064652063C3B36469676F
        204F454D222F3E0D0A20203C537472526573204E616D653D2238333137222054
        6578743D22496D7072696D6972206465706F6973206465206578706F72746172
        222F3E0D0A20203C537472526573204E616D653D22383331382220546578743D
        2253616C76617220636F6E666967757261C3A7C3B56573222F3E0D0A20203C53
        7472526573204E616D653D22383331392220546578743D2256697375616C697A
        6172222F3E0D0A20203C537472526573204E616D653D22383332302220546578
        743D224C6172677572613A222F3E0D0A20203C537472526573204E616D653D22
        383332312220546578743D22416C747572613A222F3E0D0A20203C5374725265
        73204E616D653D22383332322220546578743D2250C3A167696E61222F3E0D0A
        20203C537472526573204E616D653D22383332332220546578743D224D616973
        205A6F6F6D222F3E0D0A20203C537472526573204E616D653D22383332342220
        546578743D224D656E6F73205A6F6F6D222F3E0D0A20203C537472526573204E
        616D653D22383332352220546578743D224172717569766F2064652074657874
        6F2028696D70726573736F7261206D617472696369616C29282A2E70726E297C
        2A2E70726E222F3E0D0A20203C537472526573204E616D653D22383332362220
        546578743D222E70726E222F3E0D0A20203C537472526573204E616D653D2238
        3430302220546578743D22496D7072696D6972222F3E0D0A20203C5374725265
        73204E616D653D22383430312220546578743D22496D70726573736F7261222F
        3E0D0A20203C537472526573204E616D653D22383430322220546578743D224E
        6F6D65222F3E0D0A20203C537472526573204E616D653D223834303322205465
        78743D22436F6E666967757261C3A7C3A36F2E2E2E222F3E0D0A20203C537472
        526573204E616D653D22383430342220546578743D2243C3B370696173222F3E
        0D0A20203C537472526573204E616D653D22383430352220546578743D224EC3
        BA6D65726F2064652063C3B370696173222F3E0D0A20203C537472526573204E
        616D653D22383430362220546578743D22436F6E666967757261C3A7C3A36F20
        696E696369616C20646120696D70726573736F7261222F3E0D0A20203C537472
        526573204E616D653D22383430372220546578743D225469706F20646520696D
        70726573736F7261222F3E0D0A20203C537472526573204E616D653D22383430
        382220546578743D222E667069222F3E0D0A20203C537472526573204E616D65
        3D22383430392220546578743D224D6F64656C6F20696E696369616C20646120
        696D70726573736F726120282A2E667069297C2A2E667069222F3E0D0A20203C
        537472526573204E616D653D22383431302220546578743D222E667069222F3E
        0D0A20203C537472526573204E616D653D22383431312220546578743D224D6F
        64656C6F20696E696369616C20646120696D70726573736F726120282A2E6670
        69297C2A2E667069222F3E0D0A20203C537472526573204E616D653D22383530
        302220546578743D224578706F72746172207061726120525446222F3E0D0A20
        203C537472526573204E616D653D22383530312220546578743D224669677572
        6173222F3E0D0A20203C537472526573204E616D653D22383530322220546578
        743D2257595349575947222F3E0D0A20203C537472526573204E616D653D2238
        3530332220546578743D224162726972206465706F6973206465206578706F72
        746172222F3E0D0A20203C537472526573204E616D653D223835303422205465
        78743D224172717569766F2052544620282A2E727466297C2A2E727466222F3E
        0D0A20203C537472526573204E616D653D22383530352220546578743D222E72
        7466222F3E0D0A20203C537472526573204E616D653D22383630302220546578
        743D22436F6E666967757261C3A7C3B56573206465204578706F727461C3A7C3
        A36F222F3E0D0A20203C537472526573204E616D653D22383630312220546578
        743D22436F6E666967757261C3A7C3B5657320646120496D6167656D222F3E0D
        0A20203C537472526573204E616D653D22383630322220546578743D22517561
        6C6964616465204A504547222F3E0D0A20203C537472526573204E616D653D22
        383630332220546578743D225265736F6C75C3A7C3A36F202864706929222F3E
        0D0A20203C537472526573204E616D653D22383630342220546578743D224172
        717569766F7320736570617261646F73222F3E0D0A20203C537472526573204E
        616D653D22383630352220546578743D22526564757A69722070C3A167696E61
        222F3E0D0A20203C537472526573204E616D653D22383630362220546578743D
        224D6F6E6F63726F6DC3A17469636F222F3E0D0A20203C537472526573204E61
        6D653D22383730302220546578743D224578706F727461722070617261205044
        46222F3E0D0A20203C537472526573204E616D653D2238373031222054657874
        3D22436F6D7061637461646F222F3E0D0A20203C537472526573204E616D653D
        22383730322220546578743D22466F6E74657320656D62757469646173222F3E
        0D0A20203C537472526573204E616D653D22383730332220546578743D22496D
        7072657373C3A36F206F74696D697A616461222F3E0D0A20203C537472526573
        204E616D653D22383730342220546578743D22496E64696365222F3E0D0A2020
        3C537472526573204E616D653D22383730352220546578743D2246756E646F22
        2F3E0D0A20203C537472526573204E616D653D22383730362220546578743D22
        4162726972206465706F6973206465206578706F72746172222F3E0D0A20203C
        537472526573204E616D653D22383730372220546578743D224172717569766F
        205044462041646F626520282A2E706466297C2A2E706466222F3E0D0A20203C
        537472526573204E616D653D22383730382220546578743D222E706466222F3E
        0D0A20203C537472526573204E616D653D225254466578706F72742220546578
        743D224172717569766F20525446222F3E0D0A20203C537472526573204E616D
        653D22424D506578706F72742220546578743D22496D6167656D20424D50222F
        3E0D0A20203C537472526573204E616D653D224A5045476578706F7274222054
        6578743D22496D6167656D204A504547222F3E0D0A20203C537472526573204E
        616D653D22544946466578706F72742220546578743D22496D6167656D205449
        4646222F3E0D0A20203C537472526573204E616D653D22546578744578706F72
        742220546578743D22546578746F2028696D70726573736F7261206D61747269
        6369616C29222F3E0D0A20203C537472526573204E616D653D22586C734F4C45
        6578706F72742220546578743D22546162656C6120457863656C20284F4C4529
        222F3E0D0A20203C537472526573204E616D653D2248544D4C6578706F727422
        20546578743D224172717569766F2048544D4C222F3E0D0A20203C5374725265
        73204E616D653D22586C73584D4C6578706F72742220546578743D2254616265
        6C6120457863656C2028584D4C29222F3E0D0A20203C537472526573204E616D
        653D225044466578706F72742220546578743D224172717569766F2050444622
        2F3E0D0A20203C537472526573204E616D653D2250726F677265737357616974
        2220546578743D22506F72206661766F722C2061677561726465222F3E0D0A20
        203C537472526573204E616D653D2250726F6772657373526F77732220546578
        743D22446566696E696E646F206C696E686173222F3E0D0A20203C5374725265
        73204E616D653D2250726F6772657373436F6C756D6E732220546578743D2244
        6566696E696E646F20636F6C756E6173222F3E0D0A20203C537472526573204E
        616D653D2250726F67726573735374796C65732220546578743D22446566696E
        696E646F20657374696C6F73222F3E0D0A20203C537472526573204E616D653D
        2250726F67726573734F626A656374732220546578743D224578706F7274616E
        646F206F626A65746F73222F3E0D0A20203C537472526573204E616D653D2254
        4946466578706F727446696C7465722220546578743D22496D6167656D205449
        464620282A2E746966297C2A2E746966222F3E0D0A20203C537472526573204E
        616D653D22424D506578706F727446696C7465722220546578743D22496D6167
        656D20424D5020282A2E626D70297C2A2E626D70222F3E0D0A20203C53747252
        6573204E616D653D224A5045476578706F727446696C7465722220546578743D
        22496D6167656D204A50454720282A2E6A7067297C2A2E6A7067222F3E0D0A20
        203C537472526573204E616D653D2248544D4C4E617646697273742220546578
        743D22496EC3AD63696F222F3E0D0A20203C537472526573204E616D653D2248
        544D4C4E6176507265762220546578743D22416E746572696F72222F3E0D0A20
        203C537472526573204E616D653D2248544D4C4E61764E657874222054657874
        3D2253656775696E7465222F3E0D0A20203C537472526573204E616D653D2248
        544D4C4E61764C6173742220546578743D2246696D222F3E0D0A20203C537472
        526573204E616D653D2248544D4C4E6176526566726573682220546578743D22
        417475616C697A6172222F3E0D0A20203C537472526573204E616D653D224854
        4D4C4E61765072696E742220546578743D22496D7072696D6972222F3E0D0A20
        203C537472526573204E616D653D2248544D4C4E6176546F74616C2220546578
        743D2250C3A167696E6173222F3E0D0A20203C537472526573204E616D653D22
        383830302220546578743D224578706F72746172207061726120546578746F22
        2F3E0D0A20203C537472526573204E616D653D22383830312220546578743D22
        4172717569766F7320746578746F20282A2E747874297C2A2E747874222F3E0D
        0A20203C537472526573204E616D653D22383830322220546578743D222E7478
        74222F3E0D0A20203C537472526573204E616D653D2253696D706C6554657874
        4578706F72742220546578743D224172717569766F20546578746F222F3E0D0A
        20203C537472526573204E616D653D22383835302220546578743D224578706F
        72746172207061726120435356222F3E0D0A20203C537472526573204E616D65
        3D22383835312220546578743D224172717569766F2043535620282A2E637376
        297C2A2E637376222F3E0D0A20203C537472526573204E616D653D2238383532
        2220546578743D222E637376222F3E0D0A20203C537472526573204E616D653D
        22383835332220546578743D22536570617261646F72222F3E0D0A20203C5374
        72526573204E616D653D224353564578706F72742220546578743D2241727175
        69766F20435356222F3E0D0A20203C537472526573204E616D653D2238393030
        2220546578743D224578706F72746172207061726120452D6D61696C222F3E0D
        0A20203C537472526573204E616D653D22383930312220546578743D22452D6D
        61696C222F3E0D0A20203C537472526573204E616D653D223839303222205465
        78743D22436F6E7461222F3E0D0A20203C537472526573204E616D653D223839
        30332220546578743D22436F6E6578C3A36F222F3E0D0A20203C537472526573
        204E616D653D22383930342220546578743D2244657374696E6174C3A172696F
        222F3E0D0A20203C537472526573204E616D653D22383930352220546578743D
        22416E65786F222F3E0D0A20203C537472526573204E616D653D223839303622
        20546578743D22466F726D61746F222F3E0D0A20203C537472526573204E616D
        653D22383930372220546578743D22456E64657265C3A76F20646520656D6169
        6C222F3E0D0A20203C537472526573204E616D653D2238393038222054657874
        3D224E6F6D65222F3E0D0A20203C537472526573204E616D653D223839303922
        20546578743D225365727669646F72222F3E0D0A20203C537472526573204E61
        6D653D22383931302220546578743D224C6F67696E222F3E0D0A20203C537472
        526573204E616D653D22383931312220546578743D22456D6974656E7465222F
        3E0D0A20203C537472526573204E616D653D22383931322220546578743D224D
        656E736167656D222F3E0D0A20203C537472526573204E616D653D2238393133
        2220546578743D22546578746F222F3E0D0A20203C537472526573204E616D65
        3D22383931342220546578743D224F7267616E697A61C3A7C3A36F222F3E0D0A
        20203C537472526573204E616D653D22383931352220546578743D2253656E68
        61222F3E0D0A20203C537472526573204E616D653D2238393136222054657874
        3D22506F727461222F3E0D0A20203C537472526573204E616D653D2238393137
        2220546578743D224C656D627261722070726F707269656461646573222F3E0D
        0A20203C537472526573204E616D653D22383931382220546578743D2243616D
        706F732072657175657269646F73206EC3A36F20657374C3A36F20707265656E
        636869646F73222F3E0D0A20203C537472526573204E616D653D223839313922
        20546578743D22436F6E666967757261C3A7C3B56573206465206578706F7274
        61C3A7C3A36F206176616EC3A761646173222F3E0D0A20203C53747252657320
        4E616D653D22383932302220546578743D22417373696E6174757261222F3E0D
        0A20203C537472526573204E616D653D22383932312220546578743D22437269
        6172222F3E0D0A20203C537472526573204E616D653D22383932322220546578
        743D22417373756E746F222F3E0D0A20203C537472526573204E616D653D2238
        3932332220546578743D224174656E63696F73616D656E7465222F3E0D0A2020
        3C537472526573204E616D653D22383932342220546578743D22456E76696172
        206D656E736167656D2070617261222F3E0D0A20203C537472526573204E616D
        653D22456D61696C4578706F72742220546578743D22452D6D61696C222F3E0D
        0A20203C537472526573204E616D653D22466173745265706F727446696C6522
        20546578743D224172717569766F20466173745265706F7274222F3E0D0A2020
        3C537472526573204E616D653D224769666578706F727446696C746572222054
        6578743D224172717569766F2047494620282A2E676966297C2A2E676966222F
        3E0D0A20203C537472526573204E616D653D224749466578706F727422205465
        78743D22496D6167656D20474946222F3E0D0A20203C537472526573204E616D
        653D22383935302220546578743D22436F6E74C3AD6E756F222F3E0D0A20203C
        537472526573204E616D653D22383935312220546578743D2243616265C3A761
        6C686F2F526F646170C3A92064612070C3A167696E61222F3E0D0A20203C5374
        72526573204E616D653D22383935322220546578743D22546578746F222F3E0D
        0A20203C537472526573204E616D653D22383935332220546578743D22436162
        65C3A7616C686F2F526F646170C3A9222F3E0D0A20203C537472526573204E61
        6D653D22383935342220546578743D224E656E68756D222F3E0D0A20203C5374
        72526573204E616D653D224F44534578706F727446696C746572222054657874
        3D224162726520646F63756D656E746F206172717569766F2053707265616473
        6865657420282A2E6F6473297C2A2E6F6473222F3E0D0A20203C537472526573
        204E616D653D224F44534578706F72742220546578743D224162726520646F63
        756D656E746F205370726561647368656574222F3E0D0A20203C537472526573
        204E616D653D224F44544578706F727446696C7465722220546578743D224162
        726520646F63756D656E746F206172717569766F20746578746F20282A2E6F64
        74297C2A2E6F6474222F3E0D0A20203C537472526573204E616D653D224F4454
        4578706F72742220546578743D224162726520646F63756D656E746F20746578
        746F222F3E0D0A20203C537472526573204E616D653D22383936302220546578
        743D222E6F6473222F3E0D0A20203C537472526573204E616D653D2238393631
        2220546578743D222E6F6474222F3E0D0A20203C537472526573204E616D653D
        22383936322220546578743D225365677572616EC3A761222F3E0D0A20203C53
        7472526573204E616D653D22383936332220546578743D224F70C3A7C3B56573
        206465207365677572616EC3A761222F3E0D0A20203C537472526573204E616D
        653D22383936342220546578743D2250726F7072696574C3A172696F2073656E
        6861222F3E0D0A20203C537472526573204E616D653D22383936352220546578
        743D22557375C3A172696F2073656E6861222F3E0D0A20203C53747252657320
        4E616D653D22383936362220546578743D22496D7072696D6972206F20646F63
        756D656E746F222F3E0D0A20203C537472526573204E616D653D223839363722
        20546578743D224D6F64696669636172206F20646F63756D656E746F222F3E0D
        0A20203C537472526573204E616D653D22383936382220546578743D22436F70
        69617220746578746F2065206772C3A16669636F73222F3E0D0A20203C537472
        526573204E616D653D22383936392220546578743D2241646963696F6E617220
        6F75206D6F6469666963617220616E6F7461C3A7C3B565732064652074657874
        6F222F3E0D0A20203C537472526573204E616D653D2238393730222054657874
        3D22504446205365677572616EC3A761222F3E0D0A20203C537472526573204E
        616D653D22383937312220546578743D22496E666F726D61C3A7C3B565732064
        6F20646F63756D656E746F222F3E0D0A20203C537472526573204E616D653D22
        383937322220546578743D22496E666F726D61C3A7C3B56573222F3E0D0A2020
        3C537472526573204E616D653D22383937332220546578743D2254C3AD74756C
        6F222F3E0D0A20203C537472526573204E616D653D2238393734222054657874
        3D224175746F72222F3E0D0A20203C537472526573204E616D653D2238393735
        2220546578743D22417373756E746F222F3E0D0A20203C537472526573204E61
        6D653D22383937362220546578743D2250616C6176726173206368617665222F
        3E0D0A20203C537472526573204E616D653D22383937372220546578743D2243
        726961646F72222F3E0D0A20203C537472526573204E616D653D223839373822
        20546578743D2250726F6475746F72222F3E0D0A20203C537472526573204E61
        6D653D22383937392220546578743D22417574656E74696361C3A7C3A36F222F
        3E0D0A20203C537472526573204E616D653D22383938302220546578743D2250
        65726D697373C3B56573222F3E0D0A20203C537472526573204E616D653D2238
        3938312220546578743D2256697375616C697A61646F72222F3E0D0A20203C53
        7472526573204E616D653D22383938322220546578743D22507265666572C3AA
        6E6369617320646F2076697375616C697A61646F72222F3E0D0A20203C537472
        526573204E616D653D22383938332220546578743D224573636F6E6465722062
        617272612064652066657272616D656E746173222F3E0D0A20203C5374725265
        73204E616D653D22383938342220546578743D224573636F6E64657220626172
        7261206465206D656E75222F3E0D0A20203C537472526573204E616D653D2238
        3938352220546578743D224573636F6E64657220696E7465726661636520646F
        20757375C3A172696F222F3E0D0A20203C537472526573204E616D653D223839
        38362220546578743D22416A7573746172206A616E656C61222F3E0D0A20203C
        537472526573204E616D653D22383938372220546578743D2243656E7472616C
        697A6172206A616E656C61222F3E0D0A20203C537472526573204E616D653D22
        383938382220546578743D22457363616C6120646520696D7072657373C3A36F
        222F3E0D0A20203C537472526573204E616D653D22383938392220546578743D
        22436F6E6669726D616F206465206C656974757261222F3E0D0A20203C537472
        526573204E616D653D22393130312220546578743D224578706F727420746F20
        444246222F3E0D0A20203C537472526573204E616D653D223931303222205465
        78743D226442617365202844424629206578706F7274222F3E0D0A20203C5374
        72526573204E616D653D22393130332220546578743D222E646266222F3E0D0A
        20203C537472526573204E616D653D22393130342220546578743D224661696C
        656420746F206C6F6164207468652066696C65222F3E0D0A20203C5374725265
        73204E616D653D22393130352220546578743D224661696C757265222F3E0D0A
        20203C537472526573204E616D653D22393130362220546578743D224669656C
        64206E616D6573222F3E0D0A20203C537472526573204E616D653D2239313037
        2220546578743D224175746F6D61746963616C6C79222F3E0D0A20203C537472
        526573204E616D653D22393130382220546578743D224D616E75616C6C79222F
        3E0D0A20203C537472526573204E616D653D22393130392220546578743D224C
        6F61642066726F6D2066696C65222F3E0D0A20203C537472526573204E616D65
        3D22393131302220546578743D22546578742066696C657320282A2E74787429
        7C2A2E7478747C416C6C2066696C65737C2A2E2A222F3E0D0A20203C53747252
        6573204E616D653D22393131312220546578743D224442462066696C65732028
        2A2E646266297C2A2E6462667C416C6C2066696C65737C2A2E2A222F3E0D0A20
        203C537472526573204E616D653D226578704D61696C41646472222054657874
        3D2241646472657373206F72206164647265737365732064656C696D69746564
        20627920636F6D6D61222F3E0D0A20203C537472526573204E616D653D227072
        6F704163746976652220546578743D2245737065636966696361207365206F20
        4461746173657420657374C3A12061626572746F206F75206EC3A36F222F3E0D
        0A20203C537472526573204E616D653D2270726F704163746976652E54667278
        486967686C696768742220546578743D2245737065636966696361207365206F
        20646573746171756520657374C3A120617469766F222F3E0D0A20203C537472
        526573204E616D653D2270726F70416C6961734E616D652220546578743D224F
        206E6F6D6520646F20616C69617320424445222F3E0D0A20203C537472526573
        204E616D653D2270726F70416C69676E2220546578743D2244657465726D696E
        61206F20616C696E68616D656E746F20646F206F626A65746F20656D2072656C
        61C3A7C3A36F20C3A02062616E6461206F752070C3A167696E61222F3E0D0A20
        203C537472526573204E616D653D2270726F70416C69676E6D656E7422205465
        78743D224F20616C696E68616D656E746F20646F20746578746F20646F206F62
        6A65746F222F3E0D0A20203C537472526573204E616D653D2270726F70416C6C
        6F77416C6C55702220546578743D224573706563696669636120736520746F64
        6F73206F7320737065656420627574746F6E73206E6F20677275706F20706F64
        656D20736572206465736D61726361646F7320616F206D65736D6F2074656D70
        6F222F3E0D0A20203C537472526573204E616D653D2270726F70416C6C6F7745
        6469742220546578743D2244657465726D696E61207365206F20757375C3A172
        696F20706F6465206564697461722061732070C3A167696E617320646F207265
        6C6174C3B372696F2070726570617261646F222F3E0D0A20203C537472526573
        204E616D653D2270726F70416C6C6F7745787072657373696F6E732220546578
        743D2244657465726D696E61207365206F206F626A65746F2064652074657874
        6F20706F646520636F6E7465722065787072657373C3B565732064656E74726F
        20646F20746578746F222F3E0D0A20203C537472526573204E616D653D227072
        6F70416C6C6F774772617965642220546578743D225065726D697465206F2065
        737461646F206E756C6F20646F7320636865636B626F786573222F3E0D0A2020
        3C537472526573204E616D653D2270726F70416C6C6F7748544D4C5461677322
        20546578743D2244657465726D696E61207365206F206F626A65746F20646520
        746578746F20706F646520636F6E74657220746167732048544D4C206E6F2073
        657520636F6E7465C3BA646F222F3E0D0A20203C537472526573204E616D653D
        2270726F70416C6C6F7753706C69742220546578743D2244657465726D696E61
        20736520612062616E646120706F646520646976696469722073657520636F6E
        7465C3BA646F20656E7472652070C3A167696E6173222F3E0D0A20203C537472
        526573204E616D653D2270726F70417574686F722220546578743D224F206175
        746F7220646F2072656C6174C3B372696F20222F3E0D0A20203C537472526573
        204E616D653D2270726F704175746F53697A652E546672785069637475726556
        6965772220546578743D2244657465726D696E61207365206120666967757261
        206465766520646566696E6972207365752074616D616E686F206175746F6D61
        746963616D656E7465222F3E0D0A20203C537472526573204E616D653D227072
        6F704175746F57696474682220546578743D2244657465726D696E6120736520
        6F206F626A65746F20646520746578746F206465766520646566696E69722073
        7561206C617267757261206175746F6D61746963616D656E7465222F3E0D0A20
        203C537472526573204E616D653D2270726F704261636B506963747572652220
        546578743D2241206669677572612064652066756E646F2064612070C3A16769
        6E61222F3E0D0A20203C537472526573204E616D653D2270726F704261725479
        70652220546578743D224F207469706F20646F2063C3B36469676F2064652062
        617272617320222F3E0D0A20203C537472526573204E616D653D2270726F7042
        6576656C496E6E65722220546578743D224F207469706F2064652072656C6576
        6F20696E7465726E6F222F3E0D0A20203C537472526573204E616D653D227072
        6F70426576656C4F757465722220546578743D224F207469706F206465207265
        6C65766F2065787465726E6F222F3E0D0A20203C537472526573204E616D653D
        2270726F70426576656C57696474682220546578743D2241206C617267757261
        20646F2072656C65766F222F3E0D0A20203C537472526573204E616D653D2270
        726F70426F726465722220546578743D2244657465726D696E61207365206120
        626F7264612065787465726E61206465766520736572206D6F73747261646120
        6F75206EC3A36F222F3E0D0A20203C537472526573204E616D653D2270726F70
        426F726465725374796C652220546578743D224F20657374696C6F206461206A
        616E656C61222F3E0D0A20203C537472526573204E616D653D2270726F70426F
        74746F6D4D617267696E2220546578743D224F2074616D616E686F206461206D
        617267656D20696E666572696F722064612070C3A167696E61222F3E0D0A2020
        3C537472526573204E616D653D2270726F7042727573685374796C6522205465
        78743D224F20657374696C6F20646F2070696E63656C20757361646F20706172
        61206F2066756E646F20646F206F626A65746F222F3E0D0A20203C5374725265
        73204E616D653D2270726F7043616C63436865636B53756D2220546578743D22
        44657465726D696E61207365206F2063C3B36469676F20646520626172726173
        20646576652063616C63756C6172206F2064C3AD6769746F2076657269666963
        61646F72206175746F6D61746963616D656E7465222F3E0D0A20203C53747252
        6573204E616D653D2270726F7043616E63656C2220546578743D224465746572
        6D696E61207365206F20626F74C3A36F20646576652073657220617469766164
        6F207175616E646F2061207465636C612045736320666F72207072657373696F
        6E61646120222F3E0D0A20203C537472526573204E616D653D2270726F704361
        7074696F6E2220546578743D224F2072C3B374756C6F20646F20636F6E74726F
        6C6520222F3E0D0A20203C537472526573204E616D653D2270726F7043656C6C
        4669656C64732220546578743D224E6F6D657320646F732063616D706F732064
        6F20424420726570726573656E74616D2061732063C3A96C756C617320646F20
        6372757A616D656E746F20222F3E0D0A20203C537472526573204E616D653D22
        70726F7043656C6C4C6576656C732220546578743D224EC3BA6D65726F206465
        206EC3AD766569732064652063C3A96C756C617320222F3E0D0A20203C537472
        526573204E616D653D2270726F7043656E7465722220546578743D2244657465
        726D696E61207365206120696D6167656D2064657665207365722063656E7472
        616C697A6164612064656E74726F20646F20636F6E74726F6C6520222F3E0D0A
        20203C537472526573204E616D653D2270726F70436861727365742220546578
        743D224F20636F6E6A756E746F20646520636172616374657265732064612066
        6F6E746520222F3E0D0A20203C537472526573204E616D653D2270726F704368
        617253706163696E672220546578743D225175616E7469646164652064652070
        6978656C7320656E74726520646F6973206361726163746572657320222F3E0D
        0A20203C537472526573204E616D653D2270726F70436865636B436F6C6F7222
        20546578743D224120636F72206461206D6172636120222F3E0D0A20203C5374
        72526573204E616D653D2270726F70436865636B65642220546578743D224465
        7465726D696E61207365206F20636F6E74726F6C6520657374C3A1206D617263
        61646F20222F3E0D0A20203C537472526573204E616D653D2270726F70436865
        636B5374796C652220546578743D224F20657374696C6F206461206D61726361
        20222F3E0D0A20203C537472526573204E616D653D2270726F704368696C6422
        20546578743D2242616E64612066696C686120636F6E65637461646120612065
        7374612062616E646120222F3E0D0A20203C537472526573204E616D653D2270
        726F70436C69707065642220546578743D2244657465726D696E61207175616E
        646F206F20746578746F206465766520736572206170617261646F2064656E74
        726F20646F73206C696D6974657320646F73206F626A65746F73222F3E0D0A20
        203C537472526573204E616D653D2270726F70436F6C6C617465222054657874
        3D22436F6E666967757261C3A7C3A36F2070616472C3A36F2064652061677275
        70616D656E746F20222F3E0D0A20203C537472526573204E616D653D2270726F
        70436F6C6F722E54466F6E742220546578743D224120636F7220646F20746578
        746F20222F3E0D0A20203C537472526573204E616D653D2270726F70436F6C6F
        722220546578743D224120636F7220646F206F626A65746F222F3E0D0A20203C
        537472526573204E616D653D2270726F70436F6C6F722E546672784672616D65
        2220546578743D224120636F7220646120626F72646120222F3E0D0A20203C53
        7472526573204E616D653D2270726F70436F6C6F722E54667278486967686C69
        6768742220546578743D2244657465726D696E61206120636F7220646F206F62
        6A65746F207365206F2064657374617175652028686967686C69676874292065
        7374C3A120617469766F20222F3E0D0A20203C537472526573204E616D653D22
        70726F70436F6C756D6E4669656C64732220546578743D224E6F6D657320646F
        732063616D706F7320646F20424420726570726573656E74616E646F20617320
        636F6C756E617320646F206372757A616D656E746F20222F3E0D0A20203C5374
        72526573204E616D653D2270726F70436F6C756D6E4761702220546578743D22
        4F2065737061C3A76F20656E74726520636F6C756E61732064612062616E6461
        20222F3E0D0A20203C537472526573204E616D653D2270726F70436F6C756D6E
        4C6576656C732220546578743D224EC3BA6D65726F206465206EC3AD76656973
        20646520636F6C756E617320222F3E0D0A20203C537472526573204E616D653D
        2270726F70436F6C756D6E732220546578743D224EC3BA6D65726F2064652063
        6F6C756E6173206E612062616E646120222F3E0D0A20203C537472526573204E
        616D653D2270726F70436F6C756D6E57696474682220546578743D2241206C61
        726775726120646120636F6C756E612064612062616E6461222F3E0D0A20203C
        537472526573204E616D653D2270726F70436F6E646974696F6E222054657874
        3D224120636F6E6469C3A7C3A36F206465206167727570616D656E746F2E204F
        20677275706F206972C3A12071756562726172207365206F2076616C6F722064
        657374612065787072657373C3A36F206D7564617220222F3E0D0A20203C5374
        72526573204E616D653D2270726F70436F6E646974696F6E2E54667278486967
        686C696768742220546578743D22537472696E672064652065787072657373C3
        A36F2E20536520657374612065787072657373C3A36F20666F72205665726461
        64656972612C206F20646573746171756520736572C3A1206174697661646F2E
        20222F3E0D0A20203C537472526573204E616D653D2270726F70436F6E6E6563
        7465642220546578743D22496E64696361207365206120636F6E6578C3A36F20
        636F6D206F2062616E636F206465206461646F7320657374C3A1206174697661
        222F3E0D0A20203C537472526573204E616D653D2270726F70436F6E76657274
        4E756C6C732220546578743D2244657465726D696E612073652076616C6F7265
        73206E756C6F7320646F20424420736572C3A36F20636F6E7665727469646F73
        207061726120302C2046616C736F206F7520737472696E672076617A69612022
        2F3E0D0A20203C537472526573204E616D653D2270726F70436F706965732220
        546578743D224F206EC3BA6D65726F2070616472C3A36F2064652063C3B37069
        617320222F3E0D0A20203C537472526573204E616D653D2270726F7043757273
        6F722220546578743D224F20637572736F7220646F206F626A65746F20222F3E
        0D0A20203C537472526573204E616D653D2270726F7044617461626173654E61
        6D652220546578743D224F206E6F6D6520646F2062616E636F20646520646164
        6F7320222F3E0D0A20203C537472526573204E616D653D2270726F7044617461
        4669656C642220546578743D2245737065636966696361206F2063616D706F20
        646F207175616C206F206F626A65746F206F6274C3A96D207365757320646164
        6F7320222F3E0D0A20203C537472526573204E616D653D2270726F7044617461
        5365742220546578743D224C696761206F206F626A65746F20616F2064617461
        7365742071756520636F6E74C3A96D206F2063616D706F2071756520656C6520
        726570726573656E746120222F3E0D0A20203C537472526573204E616D653D22
        70726F70446174652220546578743D224F2076616C6F72206465206461746120
        646F20636F6E74726F6C6520222F3E0D0A20203C537472526573204E616D653D
        2270726F7044617465466F726D61742220546578743D22457370656369666963
        61206F20666F726D61746F20656D207175652061206461746120C3A920617072
        6573656E7461646120222F3E0D0A20203C537472526573204E616D653D227072
        6F70446563696D616C536570617261746F722220546578743D224F2073657061
        7261646F7220646563696D616C20222F3E0D0A20203C537472526573204E616D
        653D2270726F7044656661756C742220546578743D2244657465726D696E6120
        7365206F20626F74C3A36F20C3A9206F20626F74C3A36F2070616472C3A36F20
        222F3E0D0A20203C537472526573204E616D653D2270726F7044656648656967
        68742220546578743D22416C747572612070616472C3A36F206461206C696E68
        6120222F3E0D0A20203C537472526573204E616D653D2270726F704465736372
        697074696F6E2E546672785265706F72744F7074696F6E732220546578743D22
        4120646573637269C3A7C3A36F20646F2072656C6174C3B372696F222F3E0D0A
        20203C537472526573204E616D653D2270726F704465736372697074696F6E22
        20546578743D224120646573637269C3A7C3A36F20646F2072656C6174C3B372
        696F222F3E0D0A20203C537472526573204E616D653D2270726F70446961676F
        6E616C2220546578743D22496E64696361207175652061206C696E686120C3A9
        20646961676F6E616C20222F3E0D0A20203C537472526573204E616D653D2270
        726F70446973706C6179466F726D61742220546578743D224F20666F726D6174
        6F20646F2076616C6F72206578696269646F20222F3E0D0A20203C5374725265
        73204E616D653D2270726F70446F75626C65506173732220546578743D224465
        7465726D696E61207365206F206D6563616E69736D6F20646F2072656C6174C3
        B372696F2064657665207265616C697A617220756D20736567756E646F207061
        73736F20222F3E0D0A20203C537472526573204E616D653D2270726F70446F77
        6E2220546578743D2244657465726D696E61207365206F207370656564206275
        74746F6E20657374C3A1207072657373696F6E61646F206F75206EC3A36F2022
        2F3E0D0A20203C537472526573204E616D653D2270726F70446F776E5468656E
        4163726F73732220546578743D2244657465726D696E6120636F6D6F20756D61
        20746162656C61206372757A616461206772616E646520736572C3A120646976
        696469646120656E7472652070C3A167696E617320222F3E0D0A20203C537472
        526573204E616D653D2270726F704472697665724E616D652220546578743D22
        4F206E6F6D6520646F2064726976657220424445222F3E0D0A20203C53747252
        6573204E616D653D2270726F7044726F70536861646F772220546578743D2244
        657465726D696E61207365206F206F626A65746F20706F7373756920736F6D62
        726120222F3E0D0A20203C537472526573204E616D653D2270726F704475706C
        65782220546578743D2245737065636966696361206F206D6F646F206475706C
        6578207061726120612070C3A167696E6120222F3E0D0A20203C537472526573
        204E616D653D2270726F70456469744D61736B2220546578743D224573706563
        69666963612061206DC3A173636172612071756520726570726573656E746120
        71756520746578746F20C3A92076C3A16C69646F2070617261206F20636F6E74
        726F6C65204564697420636F6D206DC3A1736361726120222F3E0D0A20203C53
        7472526573204E616D653D2270726F70456E61626C65642220546578743D2244
        657465726D696E61207365206F20636F6E74726F6C6520657374C3A120686162
        696C697461646F20222F3E0D0A20203C537472526573204E616D653D2270726F
        70456E67696E654F7074696F6E732220546578743D224173206F70C3A7C3B565
        7320646F206D6563616E69736D6F20646F2072656C6174C3B372696F20222F3E
        0D0A20203C537472526573204E616D653D2270726F7045787072657373696F6E
        2220546578743D224F2076616C6F722064657374612065787072657373C3A36F
        20736572C3A1206578696269646F206E6F206F626A65746F20222F3E0D0A2020
        3C537472526573204E616D653D2270726F7045787072657373696F6E44656C69
        6D69746572732220546578743D224F7320636172616374657265732071756520
        736572C3A36F20757361646F7320706172612064656C696D6974617220617320
        65787072657373C3B5657320636F6E7469646173206E6F20746578746F222F3E
        0D0A20203C537472526573204E616D653D2270726F704669656C64416C696173
        65732220546578743D224F73206170656C69646F7320646F732063616D706F73
        20646F206461746173657420222F3E0D0A20203C537472526573204E616D653D
        2270726F7046696C7465722220546578743D224120636F6E6469C3A7C3A36F20
        64652066696C74726167656D2070617261206F206461746173657420222F3E0D
        0A20203C537472526573204E616D653D2270726F7046696C7465726564222054
        6578743D2244657465726D696E61207365206F20646174617365742064657665
        2066696C74726172206F7320726567697374726F73207573616E646F20612063
        6F6E6469C3A7C3A36F206E612070726F70726965646164652046696C74657220
        222F3E0D0A20203C537472526573204E616D653D2270726F70466C6F77546F22
        20546578743D224F206F626A65746F20646520746578746F20717565206D6F73
        74726172C3A1206F20746578746F20717565206EC3A36F20636F75626572206E
        6F206F626A65746F20222F3E0D0A20203C537472526573204E616D653D227072
        6F70466F6E742220546578743D224F7320617472696275746F7320646120666F
        6E746520646F206F626A65746F20222F3E0D0A20203C537472526573204E616D
        653D2270726F70466F6F7465724166746572456163682220546578743D224465
        7465726D696E6120736520612062616E646120646520726F646170C3A9206465
        766572C3A120736572206D6F737472616461206170C3B3732063616461206C69
        6E6861206465206461646F7320222F3E0D0A20203C537472526573204E616D65
        3D2270726F70466F726D61745374722220546578743D224120737472696E6720
        646520666F726D617461C3A7C3A36F20222F3E0D0A20203C537472526573204E
        616D653D2270726F704672616D652220546578743D224F732061747269627574
        6F7320646120626F72646120646F206F626A65746F222F3E0D0A20203C537472
        526573204E616D653D2270726F70476170582220546578743D224120656E6465
        6E7461C3A7C3A36F20657371756572646120646F20746578746F20222F3E0D0A
        20203C537472526573204E616D653D2270726F70476170592220546578743D22
        4120656E64656E7461C3A7C3A36F207375706572696F7220646F20746578746F
        20222F3E0D0A20203C537472526573204E616D653D2270726F70476C79706822
        20546578743D224120696D6167656D20646F20636F6E74726F6C6520222F3E0D
        0A20203C537472526573204E616D653D2270726F7047726F7570496E64657822
        20546578743D225065726D69746520616F7320737065656420627574746F6E73
        2066756E63696F6E6172206A756E746F7320636F6D6F20756D20677275706F20
        222F3E0D0A20203C537472526573204E616D653D2270726F7048416C69676E22
        20546578743D224F20616C696E68616D656E746F20686F72697A6F6E74616C20
        646F20746578746F222F3E0D0A20203C537472526573204E616D653D2270726F
        704865696768742220546578743D224120616C7475726120646F206F626A6574
        6F20222F3E0D0A20203C537472526573204E616D653D2270726F70486964655A
        65726F732220546578743D2244657465726D696E61207365206F206F626A6574
        6F20646520746578746F206573636F6E646572C3A1206F732076616C6F726573
        207A657261646F73222F3E0D0A20203C537472526573204E616D653D2270726F
        70486967686C696768742220546578743D224F7320617472696275746F732064
        6F20646573746171756520636F6E646963696F6E616C20222F3E0D0A20203C53
        7472526573204E616D653D2270726F70496E6465784E616D652220546578743D
        224F206E6F6D6520646F20C3AD6E6469636520222F3E0D0A20203C5374725265
        73204E616D653D2270726F70496E6974537472696E672220546578743D225374
        72696E6720646520696E696369616C697A61C3A7C3A36F20646120696D707265
        73736F726120706172612072656C6174C3B372696F73206D6174726963696169
        7320222F3E0D0A20203C537472526573204E616D653D2270726F704974656D73
        2220546578743D224974656E73206465206C6973746120646F206F626A65746F
        20222F3E0D0A20203C537472526573204E616D653D2270726F704B6565704173
        70656374526174696F2220546578743D224D616E746572206F2074616D616E68
        6F2070726F706F7263696F6E616C20646120696D6167656D20222F3E0D0A2020
        3C537472526573204E616D653D2270726F704B6565704368696C642220546578
        743D2244657465726D696E6120736520612062616E646120736572C3A120696D
        707265737361206A756E746F206465207375612062616E64612066696C686120
        222F3E0D0A20203C537472526573204E616D653D2270726F704B656570466F6F
        7465722220546578743D2244657465726D696E6120736520612062616E646120
        736572C3A120696D707265737361206A756E746F2064652073657520726F6461
        70C3A920222F3E0D0A20203C537472526573204E616D653D2270726F704B6565
        704865616465722220546578743D2244657465726D696E612073652061206261
        6E646120736572C3A120696D707265737361206A756E746F20636F6D20736575
        2063616265C3A7616C686F20222F3E0D0A20203C537472526573204E616D653D
        2270726F704B656570546F6765746865722220546578743D2244657465726D69
        6E6120736520612062616E646120736572C3A120696D707265737361206A756E
        746F20646520746F6461732073756173207375622D62616E64617320222F3E0D
        0A20203C537472526573204E616D653D2270726F704B696E642E54667278466F
        726D61742220546578743D224F207469706F20646520666F726D617461C3A7C3
        A36F20222F3E0D0A20203C537472526573204E616D653D2270726F704B696E64
        2220546578743D224F207469706F20646520626F74C3A36F222F3E0D0A20203C
        537472526573204E616D653D2270726F704C6172676544657369676E48656967
        68742220546578743D2244657465726D696E6120736520612070C3A167696E61
        20706F7373756972C3A120616C7475726120657874656E7361206E6F206D6F64
        6F20646520646573656E686F20222F3E0D0A20203C537472526573204E616D65
        3D2270726F704C61796F75742220546578743D224F206C65696175746520646F
        20676C79706820646F20626F74C3A36F20222F3E0D0A20203C53747252657320
        4E616D653D2270726F704C6566742220546578743D224120636F6F7264656E61
        646120657371756572646120646F206F626A65746F20222F3E0D0A20203C5374
        72526573204E616D653D2270726F704C6566744D617267696E2220546578743D
        224F2074616D616E686F206461206D617267656D206573717565726461206461
        2070C3A167696E61222F3E0D0A20203C537472526573204E616D653D2270726F
        704C696E65732220546578743D224F20746578746F20646F206F626A65746F20
        222F3E0D0A20203C537472526573204E616D653D2270726F704C696E65537061
        63696E672220546578743D2241207175616E7469646164652064652070697865
        6C7320656E7472652064756173206C696E68617320646520746578746F20222F
        3E0D0A20203C537472526573204E616D653D2270726F704C6F67696E50726F6D
        70742220546578743D2244657465726D696E61207365206F206469C3A16C6F67
        6F206465206C6F67696E206465766572C3A120736572206D6F73747261646F20
        222F3E0D0A20203C537472526573204E616D653D2270726F704D617267696E22
        20546578743D2244657465726D696E61206F206EC3BA6D65726F206465207069
        78656C7320656E747265206120626F72646120646120696D6167656D20652061
        20626F72646120646F20626F74C3A36F20222F3E0D0A20203C53747252657320
        4E616D653D2270726F704D61737465722220546578743D224F20646174617365
        74206D657374726520222F3E0D0A20203C537472526573204E616D653D227072
        6F704D61737465724669656C64732220546578743D224F732063616D706F7320
        6C696761646F7320706F722072656C61C3A7C3A36F206D65737472652D646574
        616C686520222F3E0D0A20203C537472526573204E616D653D2270726F704D61
        784C656E6774682220546578743D2254616D616E686F206DC3A178696D6F2064
        6F20746578746F222F3E0D0A20203C537472526573204E616D653D2270726F70
        4D617857696474682220546578743D224C617267757261206DC3A178696D6120
        646120636F6C756E6120222F3E0D0A20203C537472526573204E616D653D2270
        726F704D656D6F2220546578743D224F20746578746F20646F206F626A65746F
        222F3E0D0A20203C537472526573204E616D653D2270726F704D696E57696474
        682220546578743D224C617267757261206DC3AD6E696D6120646120636F6C75
        6E6120222F3E0D0A20203C537472526573204E616D653D2270726F704D697272
        6F724D617267696E732220546578743D22457370656C6861206173206D617267
        656E73206E61732070C3A167696E617320706172657320222F3E0D0A20203C53
        7472526573204E616D653D2270726F704D6F64616C526573756C742220546578
        743D2244657465726D696E61207365206520636F6D6F206F20626F74C3A36F20
        66656368612073657520666F726D756CC3A172696F206D6F64616C20222F3E0D
        0A20203C537472526573204E616D653D2270726F704E616D652E54466F6E7422
        20546578743D224F206E6F6D6520646120666F6E746520222F3E0D0A20203C53
        7472526573204E616D653D2270726F704E616D652E546672785265706F72744F
        7074696F6E732220546578743D224F206E6F6D6520646F2072656C6174C3B372
        696F20222F3E0D0A20203C537472526573204E616D653D2270726F704E616D65
        2220546578743D224F206E6F6D6520646F206F626A65746F20222F3E0D0A2020
        3C537472526573204E616D653D2270726F704E756D476C797068732220546578
        743D22496E64696361206F206EC3BA6D65726F20646520696D6167656E73206E
        6F206772C3A16669636F2065737065636966696361646F206E612070726F7072
        69656461646520476C79706820222F3E0D0A20203C537472526573204E616D65
        3D2270726F704F70656E44617461536F757263652220546578743D2244657465
        726D696E61207365206120666F6E7465206465206461646F7320646576652073
        657220616265727461206175746F6D61746963616D656E7465206F75206EC3A3
        6F20222F3E0D0A20203C537472526573204E616D653D2270726F704F7269656E
        746174696F6E2220546578743D2241206F7269656E7461C3A7C3A36F20646120
        70C3A167696E6120222F3E0D0A20203C537472526573204E616D653D2270726F
        704F75746C696E65546578742220546578743D224F20746578746F2071756520
        736572C3A1206D6F73747261646F206E6F20636F6E74726F6C65206465207265
        73756D6F2064612076697375616C697A61C3A7C3A36F20222F3E0D0A20203C53
        7472526573204E616D653D2270726F704F75746C696E6556697369626C652220
        546578743D2241207669736962696C696461646520646F20636F6E74726F6C65
        20646520726573756D6F2064612076697375616C697A61C3A7C3A36F20222F3E
        0D0A20203C537472526573204E616D653D2270726F704F75746C696E65576964
        74682220546578743D2241206C61726775726120646F20636F6E74726F6C6520
        646520726573756D6F2064612076697375616C697A61C3A7C3A36F20222F3E0D
        0A20203C537472526573204E616D653D2270726F70506167654E756D62657273
        2E546672785072696E744F7074696F6E732220546578743D224F206EC3BA6D65
        726F206461732070C3A167696E6173206120736572656D20696D707265737361
        732E222F3E0D0A20203C537472526573204E616D653D2270726F705061706572
        4865696768742220546578743D224120616C747572612064612070C3A167696E
        6120222F3E0D0A20203C537472526573204E616D653D2270726F705061706572
        57696474682220546578743D2241206C6172677572612064612070C3A167696E
        6120222F3E0D0A20203C537472526573204E616D653D2270726F705061726167
        726170684761702220546578743D224120656E64656E7461C3A7C3A36F206461
        207072696D65697261206C696E686120646F20706172C3A1677261666F20222F
        3E0D0A20203C537472526573204E616D653D2270726F70506172616D732E5466
        727842444544617461626173652220546578743D224F7320706172C3A26D6574
        726F7320646120636F6E6578C3A36F20222F3E0D0A20203C537472526573204E
        616D653D2270726F70506172616D732220546578743D224F7320706172C3A26D
        6574726F7320646120717565727920222F3E0D0A20203C537472526573204E61
        6D653D2270726F70506172656E74466F6E742220546578743D2244657465726D
        696E61207365206F206F626A65746F2075736172C3A1206120666F6E74652064
        6520736575206F626A65746F2070616920222F3E0D0A20203C53747252657320
        4E616D653D2270726F7050617373776F72642220546578743D22412073656E68
        6120646F2072656C6174C3B372696F222F3E0D0A20203C537472526573204E61
        6D653D2270726F7050617373776F7264436861722220546578743D22496E6469
        6361206F206361726163746572652C20736520616C67756D2C20612073657220
        6D6F73747261646F206E6F206C7567617220646F732063617261637465726573
        20726561697320646967697461646F73206E6F20636F6E74726F6C6520222F3E
        0D0A20203C537472526573204E616D653D2270726F7050696374757265222054
        6578743D22412066696775726120222F3E0D0A20203C537472526573204E616D
        653D2270726F70506963747572652E546672785265706F72744F7074696F6E73
        2220546578743D224120666967757261206465736372697469766120646F2072
        656C6174C3B372696F20222F3E0D0A20203C537472526573204E616D653D2270
        726F70506F736974696F6E2220546578743D224120706F7369C3A7C3A36F2069
        6E696369616C206461206A616E656C6120222F3E0D0A20203C53747252657320
        4E616D653D2270726F70507265766965774F7074696F6E732220546578743D22
        4173206F70C3A7C3B565732064652076697375616C697A61C3A7C3A36F20646F
        2072656C6174C3B372696F20222F3E0D0A20203C537472526573204E616D653D
        2270726F705072696E7461626C652220546578743D225365206F206F626A6574
        6F20736572C3A120696D70726573736F2E204F626A65746F7320636F6D205072
        696E7461626C653D46616C736520736572C3A36F2076697375616C697A61646F
        732C206D6173206EC3A36F20696D70726573736F73222F3E0D0A20203C537472
        526573204E616D653D2270726F705072696E744368696C644966496E76697369
        626C652220546578743D2244657465726D696E6120736520612062616E646120
        66696C686120736572C3A120696D707265737361206361736F20737561206261
        6E6461207061692073656A6120696E766973C3AD76656C20222F3E0D0A20203C
        537472526573204E616D653D2270726F705072696E7465722220546578743D22
        4F206E6F6D6520646120696D70726573736F72612071756520736572C3A12073
        656C6563696F6E616461207175616E646F20657374652072656C6174C3B37269
        6F20666F722061626572746F206F752065786563757461646F20222F3E0D0A20
        203C537472526573204E616D653D2270726F705072696E74496644657461696C
        456D7074792220546578743D2244657465726D696E6120736520612062616E64
        61206465206461646F7320736572C3A120696D707265737361206361736F2073
        7561207375622D62616E646120657374656A612076617A696120222F3E0D0A20
        203C537472526573204E616D653D2270726F705072696E744966456D70747922
        20546578743D2244657465726D696E6120736520612070C3A167696E61207365
        72C3A120696D707265737361206361736F20746F646F73206F73207365757320
        646174617365747320657374656A616D2076617A696F7320222F3E0D0A20203C
        537472526573204E616D653D2270726F705072696E744F6E4669727374506167
        652220546578743D2244657465726D696E6120736520612062616E6461207365
        72C3A120696D707265737361206E61207072696D656972612070C3A167696E61
        20222F3E0D0A20203C537472526573204E616D653D2270726F705072696E744F
        6E4C617374506167652220546578743D2244657465726D696E61207365206120
        62616E646120736572C3A120696D707265737361206E6120C3BA6C74696D6120
        70C3A167696E6120222F3E0D0A20203C537472526573204E616D653D2270726F
        705072696E744F6E506172656E742220546578743D2244657465726D696E6120
        7365206F207375622D72656C6174C3B372696F20736572C3A120696D70726573
        736F20656D207375612062616E64612070616920222F3E0D0A20203C53747252
        6573204E616D653D2270726F705072696E744F6E50726576696F757350616765
        2220546578743D2244657465726D696E6120736520612070C3A167696E612070
        6F64652073657220676572616461206E6F2065737061C3A76F206C6976726520
        64612070C3A167696E612067657261646120616E746572696F726D656E746520
        222F3E0D0A20203C537472526573204E616D653D2270726F705072696E744F70
        74696F6E732220546578743D224F70C3A7C3B5657320646520696D7072657373
        C3A36F20646F2072656C6174C3B372696F222F3E0D0A20203C53747252657320
        4E616D653D2270726F705072696E7450616765732220546578743D2244657465
        726D696E61206120696D7072657373C3A36F20646520746F6461732061732070
        C3A167696E61732C20736F6D656E746520617320C3AD6D7061726573206F7520
        736F6D656E746520617320706172657320222F3E0D0A20203C53747252657320
        4E616D653D2270726F7052616E6765426567696E2220546578743D2244657465
        726D696E61206F20706F6E746F20696E696369616C206465206E6176656761C3
        A7C3A36F206E6F206461746173657420222F3E0D0A20203C537472526573204E
        616D653D2270726F7052616E6765456E642220546578743D2244657465726D69
        6E61206F20706F6E746F2066696E616C206465206E6176656761C3A7C3A36F20
        6E6F206461746173657420222F3E0D0A20203C537472526573204E616D653D22
        70726F7052616E6765456E64436F756E742220546578743D2244657465726D69
        6E61206F206EC3BA6D65726F20646520726567697374726F73206E6F20646174
        617365742073652052616E6765456E6420666F72207265436F756E74222F3E0D
        0A20203C537472526573204E616D653D2270726F70526561644F6E6C79222054
        6578743D2244657465726D696E61207365206F206F626A65746F206465207465
        78746F20C3A920736F6D656E7465206C65697475726120222F3E0D0A20203C53
        7472526573204E616D653D2270726F7052657065617448656164657273222054
        6578743D2244657465726D696E61207365206F732063616265C3A7616C686F73
        20646520636F6C756E612065206C696E686120736572C3A36F207265696D7072
        6573736F7320656D20756D61206E6F76612070C3A167696E6120222F3E0D0A20
        203C537472526573204E616D653D2270726F705265706F72744F7074696F6E73
        2220546578743D224173206F70C3A7C3B5657320646F2072656C6174C3B37269
        6F222F3E0D0A20203C537472526573204E616D653D2270726F7052657072696E
        744F6E4E6577506167652220546578743D2244657465726D696E612073652061
        2062616E646120736572C3A1207265696D70726573736120656D20756D61206E
        6F76612070C3A167696E6120222F3E0D0A20203C537472526573204E616D653D
        2270726F705265737472696374696F6E732220546578743D22436F6E6A756E74
        6F2064652073696E61697320646520726573747269C3A7C3A36F20222F3E0D0A
        20203C537472526573204E616D653D2270726F7052696768744D617267696E22
        20546578743D224F2074616D616E686F206461206D617267656D206469726569
        74612064612070C3A167696E6120222F3E0D0A20203C537472526573204E616D
        653D2270726F70526F746174696F6E2E54667278426172436F64655669657722
        20546578743D2241206F7269656E7461C3A7C3A36F20646F2063C3B36469676F
        2064652062617272617320222F3E0D0A20203C537472526573204E616D653D22
        70726F70526F746174696F6E2220546578743D224120726F7461C3A7C3A36F20
        646F20746578746F20222F3E0D0A20203C537472526573204E616D653D227072
        6F70526F77436F756E742220546578743D224EC3BA6D65726F20646520726567
        697374726F73207669727475616973206E612062616E6461206465206461646F
        7320222F3E0D0A20203C537472526573204E616D653D2270726F70526F774669
        656C64732220546578743D224E6F6D657320646F732063616D706F7320646520
        424420726570726573656E74616E646F206173206C696E686173206465206372
        757A616D656E746F20222F3E0D0A20203C537472526573204E616D653D227072
        6F70526F774C6576656C732220546578743D224EC3BA6D65726F206465206EC3
        AD76656973206465206C696E68617320222F3E0D0A20203C537472526573204E
        616D653D2270726F7052544C52656164696E672220546578743D224465746572
        6D696E61207365206F206F626A65746F20646520746578746F206D6F73747261
        72C3A12073657520636F6E7465C3BA646F206E6F2073656E7469646F20646120
        646972656974612070617261206120657371756572646120222F3E0D0A20203C
        537472526573204E616D653D2270726F7053657373696F6E4E616D6522205465
        78743D224F206E6F6D652064612073657373C3A36F20424445222F3E0D0A2020
        3C537472526573204E616D653D2270726F70536861646F77436F6C6F72222054
        6578743D224120636F7220646120736F6D62726120222F3E0D0A20203C537472
        526573204E616D653D2270726F70536861646F7757696474682220546578743D
        2241206C61726775726120646120736F6D62726120222F3E0D0A20203C537472
        526573204E616D653D2270726F7053686170652220546578743D224F20746970
        6F20646520666F726D6120222F3E0D0A20203C537472526573204E616D653D22
        70726F7053686966744D6F64652220546578743D224F20636F6D706F7274616D
        656E746F206465206465736C6F63616D656E746F20646F206F626A65746F2022
        2F3E0D0A20203C537472526573204E616D653D2270726F7053686F77436F6C75
        6D6E4865616465722220546578743D2244657465726D696E61207365206F2063
        72757A616D656E746F206D6F7374726172C3A1206F732063616265C3A7616C68
        6F732064617320636F6C756E6173222F3E0D0A20203C537472526573204E616D
        653D2270726F7053686F77436F6C756D6E546F74616C2220546578743D224465
        7465726D696E61207365206F206372757A616D656E746F206D6F7374726172C3
        A1206F20746F74616C20676572616C20646120636F6C756E6120222F3E0D0A20
        203C537472526573204E616D653D2270726F7053686F77526F77486561646572
        2220546578743D2244657465726D696E61207365206F206372757A616D656E74
        6F206D6F7374726172C3A1206F732063616265C3A7616C686F7320646173206C
        696E68617320222F3E0D0A20203C537472526573204E616D653D2270726F7053
        686F77526F77546F74616C2220546578743D2244657465726D696E6120736520
        6F206372757A616D656E746F206D6F7374726172C3A1206F20746F74616C2067
        6572616C206461206C696E686120222F3E0D0A20203C537472526573204E616D
        653D2270726F7053686F774469616C6F672220546578743D2244657465726D69
        6E61207365206F206469C3A16C6F676F20646520696D7072657373C3A36F2073
        6572C3A1206D6F73747261646F206E61206A616E656C61206465207669737561
        6C697A61C3A7C3A36F20222F3E0D0A20203C537472526573204E616D653D2270
        726F7053686F77546578742220546578743D2244657465726D696E6120736520
        6F206F626A65746F2063C3B36469676F20646520626172726173206D6F737472
        6172C3A120746578746F20656D20666F726D61746F206C6567C3AD76656C2022
        2F3E0D0A20203C537472526573204E616D653D2270726F7053697A6522205465
        78743D224F2074616D616E686F20646120666F6E746520222F3E0D0A20203C53
        7472526573204E616D653D2270726F70536F727465642220546578743D224465
        7465726D696E61207365206F73206974656E7320657374C3A36F206F7264656E
        61646F73206F75206EC3A36F222F3E0D0A20203C537472526573204E616D653D
        2270726F7053706163696E672220546578743D2244657465726D696E61206F20
        6EC3BA6D65726F20646520706978656C7320656E747265206120696D6167656D
        2065206F20746578746F222F3E0D0A20203C537472526573204E616D653D2270
        726F7053514C2220546578743D2241206465636C617261C3A7C3A36F2053514C
        20222F3E0D0A20203C537472526573204E616D653D2270726F7053746172744E
        6577506167652220546578743D22496E6963696120756D61206E6F76612070C3
        A167696E6120616E74657320646520696D7072696D697220612062616E646120
        222F3E0D0A20203C537472526573204E616D653D2270726F7053747265746368
        2220546578743D22457374696361206120666967757261207061726120636162
        6572206E6F73206C696D6974657320646F206F626A65746F20222F3E0D0A2020
        3C537472526573204E616D653D2270726F705374726574636865642220546578
        743D2244657465726D696E61207365206F206F626A65746F20706F6465207365
        7220657374696361646F20222F3E0D0A20203C537472526573204E616D653D22
        70726F70537472657463684D6F64652220546578743D224D6F646F2070617261
        2065737469636172206F206F626A65746F20222F3E0D0A20203C537472526573
        204E616D653D2270726F705374796C652E54466F6E742220546578743D224F20
        657374696C6F20646120666F6E746520222F3E0D0A20203C537472526573204E
        616D653D2270726F705374796C652220546578743D224F20657374696C6F2064
        6F20636F6E74726F6C6520222F3E0D0A20203C537472526573204E616D653D22
        70726F705374796C652E546672784672616D652220546578743D224F20657374
        696C6F20646120626F72646120646F206F626A65746F20222F3E0D0A20203C53
        7472526573204E616D653D2270726F7053757070726573735265706561746564
        2220546578743D2253757072696D652076616C6F72657320726570657469646F
        7320222F3E0D0A20203C537472526573204E616D653D2270726F705461626C65
        4E616D652220546578743D224F206E6F6D6520646120746162656C6120646520
        6461646F7320222F3E0D0A20203C537472526573204E616D653D2270726F7054
        61672220546578743D224F206EC3BA6D65726F206465206D6172636120646F20
        6F626A65746F20222F3E0D0A20203C537472526573204E616D653D2270726F70
        5461675374722220546578743D224120737472696E67206465206D6172636120
        646F206F626A65746F20222F3E0D0A20203C537472526573204E616D653D2270
        726F70546578742220546578743D224F20746578746F20646F206F626A65746F
        222F3E0D0A20203C537472526573204E616D653D2270726F705469746C654265
        666F72654865616465722220546578743D2244657465726D696E61207365206F
        2074C3AD74756C6F20646F2072656C6174C3B372696F20646576652073657220
        6D6F73747261646F20616E74657320646F2063616265C3A7616C686F20646120
        70C3A167696E61222F3E0D0A20203C537472526573204E616D653D2270726F70
        546F702220546578743D224120636F6F7264656E616461207375706572696F72
        20646F206F626A65746F20222F3E0D0A20203C537472526573204E616D653D22
        70726F70546F704D617267696E2220546578743D224F2074616D616E686F2064
        61206D617267656D207375706572696F722064612070C3A167696E6120222F3E
        0D0A20203C537472526573204E616D653D2270726F705479702220546578743D
        224F207469706F20646120626F72646120222F3E0D0A20203C53747252657320
        4E616D653D2270726F70556E6465726C696E65732220546578743D2244657465
        726D696E61207365206F206F626A65746F20646520746578746F206D6F737472
        6172C3A1206C696E686173206465206772616465206170C3B373206361646120
        6C696E686120646520746578746F20222F3E0D0A20203C537472526573204E61
        6D653D2270726F7055524C2220546578743D224F2055524C20646F206F626A65
        746F20222F3E0D0A20203C537472526573204E616D653D2270726F7055736572
        4E616D652220546578743D224E6F6D6520646F20757375C3A172696F20646F20
        6F626A65746F206465206461646F732E2045737465206E6F6D6520736572C3A1
        206D6F73747261646F206E6120C3A172766F7265206465206461646F7320222F
        3E0D0A20203C537472526573204E616D653D2270726F7056416C69676E222054
        6578743D224F20616C696E68616D656E746F20766572746963616C20646F2074
        6578746F222F3E0D0A20203C537472526573204E616D653D2270726F70566572
        73696F6E4275696C642220546578743D22496E666F726D61C3A7C3A36F206465
        2076657273C3A36F2C20636F6D70696C61C3A7C3A36F20222F3E0D0A20203C53
        7472526573204E616D653D2270726F7056657273696F6E4D616A6F7222205465
        78743D22496E666F726D61C3A7C3A36F2064652076657273C3A36F2C20766572
        73C3A36F206D61696F7220222F3E0D0A20203C537472526573204E616D653D22
        70726F7056657273696F6E4D696E6F722220546578743D22496E666F726D61C3
        A7C3A36F2064652076657273C3A36F2C2076657273C3A36F206D656E6F722022
        2F3E0D0A20203C537472526573204E616D653D2270726F7056657273696F6E52
        656C656173652220546578743D22496E666F726D61C3A7C3A36F206465207665
        7273C3A36F2C206C6962657261C3A7C3A36F20222F3E0D0A20203C5374725265
        73204E616D653D2270726F7056697369626C652220546578743D225669736962
        696C696461646520646F206F626A65746F222F3E0D0A20203C53747252657320
        4E616D653D2270726F7057696474682220546578743D224C6172677572612064
        6F206F626A65746F20222F3E0D0A20203C537472526573204E616D653D227072
        6F7057696474682E546672784672616D652220546578743D2241206C61726775
        726120646120626F72646120222F3E0D0A20203C537472526573204E616D653D
        2270726F7057696E646F7753746174652220546578743D2245737461646F2069
        6E696369616C206461206A616E656C6120222F3E0D0A20203C53747252657320
        4E616D653D2270726F70576F7264427265616B2220546578743D225175656272
        61722070616C617672617320656D20727573736F20222F3E0D0A20203C537472
        526573204E616D653D2270726F70576F7264577261702220546578743D224465
        7465726D696E61207365206F206F626A65746F20646520746578746F20696E73
        657265207265746F726E6F7320646520636172726F2073756176657320706172
        6120717565206F20746578746F20717565627265206E61206D617267656D2064
        69726569746120222F3E0D0A20203C537472526573204E616D653D2270726F70
        5A6F6F6D2E54667278426172436F6465566965772220546578743D225A6F6F6D
        732070617261206F2063C3B36469676F2064652062617272617320222F3E0D0A
        20203C537472526573204E616D653D2270726F70436F6E6E656374696F6E4E61
        6D652220546578743D224E6F6D6520646120636F6E6578C3A36F20C3A0206261
        7365206465206461646F73207573616461206E6F2072656C6174C3B372696F20
        222F3E0D0A20203C537472526573204E616D653D2270726F7043757276652220
        546578743D224375727661747572612064617320626F7264617320646F206F62
        6A65746F20726F756E6472656374616E676C6520222F3E0D0A20203C53747252
        6573204E616D653D2270726F704472696C6C446F776E2220546578743D224465
        7465726D696E61207365206F20677275706F206C616EC3A761646F2070617261
        20626169786F20286472696C6C2D646F776E2920222F3E0D0A20203C53747252
        6573204E616D653D2270726F70466F6E745374796C652220546578743D224573
        74696C6F20646120666F6E7465206D617472696369616C222F3E0D0A20203C53
        7472526573204E616D653D2270726F7048696465496653696E676C6544617461
        5265636F72642220546578743D224573636F6E6461206F20726F646170C3A920
        736520756D20677275706F20746976657220736F6D656E746520756D20726567
        697374726F206465206461646F7320222F3E0D0A20203C537472526573204E61
        6D653D2270726F704F75746C696E65457870616E642220546578743D22446574
        65726D696E6120736520657870616E6465206F2072656C6174C3B372696F2070
        61726120666F7261206461206C696E6861206F75206EC3A36F20222F3E0D0A20
        203C537472526573204E616D653D2270726F70506C61696E43656C6C73222054
        6578743D2244657465726D696E6120736520696D7072696D6520617320646976
        65727361732063C3A96C756C6173206C61646F2061206C61646F206F7520656D
        70696C6861646F222F3E0D0A20203C537472526573204E616D653D2270726F70
        5072696E744D6F64652220546578743D224D6F64616C69646164652064652069
        6D7072657373C3A36F3A206E6F726D616C2C20696D7072696D6520756D612070
        C3A167696E61206772616E64652072657061727469646120656D207065717565
        6E61732070C3A167696E61732C206F752064697665727361732070C3A167696E
        61732070657175656E617320656D20756D61206772616E646520222F3E0D0A20
        203C537472526573204E616D653D2270726F705072696E744F6E536865657422
        20546578743D2254616D616E686F20646F20706170656C207061726120696D70
        72657373C3A36F20646F2072656C6174C3B372696F2E20557361646F20736520
        5072696E744D6F6465206EC3A36F20666F7220706D44656661756C7420222F3E
        0D0A20203C537472526573204E616D653D2270726F705265736574506167654E
        756D626572732220546578743D225265737461757261206EC3BA6D65726F2F74
        6F74616C2064652070C3A167696E6173207175616E646F20696D7072696D6972
        206F20677275706F2E20536520666F722075736164612061206F70C3A7C3A36F
        2053746172744E65775061676520736574616461207061726120747275652022
        2F3E0D0A20203C537472526573204E616D653D2270726F705265766572736522
        20546578743D2244657465726D696E6120736520696D7072696D652070C3A167
        696E6173206E61206F7264656D20696E76657274696461222F3E0D0A20203C53
        7472526573204E616D653D2270726F7053686F77466F6F74657249664472696C
        6C446F776E2220546578743D2244657465726D696E61207365206D6F73747261
        206F20726F646170C3A920646F20677275706F207175616E646F206F20677275
        706F20666F72206C616EC3A761646F207061726120626169786F20286472696C
        6C2D646F776E2920222F3E0D0A20203C537472526573204E616D653D2270726F
        7053697A654D6F64652220546578743D224578696265206D6F646F20646F206F
        626A65746F204F4C4520222F3E0D0A20203C537472526573204E616D653D2270
        726F7056657273696F6E2220546578743D2256657273C3A36F20646F20466173
        745265706F727420222F3E0D0A20203C537472526573204E616D653D2270726F
        7057696465426172526174696F2220546578743D2252656C617469766F206120
        6C617267757261206461732062617272617320646F206F626A65746F20626172
        636F646520222F3E0D0A20203C537472526573204E616D653D2270726F705779
        73697779672220546578743D2244657465726D696E6120736520757361206F20
        63616E76617320646120696D70726573736F7261207061726120666F726D6174
        6172206F20746578746F206F626A65746F2072696368746578742E204120696D
        70726573736F7261206465766572C3A120657374617220696E7374616C616461
        20652070726F6E74612E20222F3E0D0A20203C537472526573204E616D653D22
        70726F704172726F77456E642220546578743D2244657465726D696E61207365
        20657874726169206120736574612064612065787472656D6964616465206461
        206C696E686120222F3E0D0A20203C537472526573204E616D653D2270726F70
        4172726F774C656E6774682220546578743D22436F6D7072696D656E746F2064
        61207365746120222F3E0D0A20203C537472526573204E616D653D2270726F70
        4172726F77536F6C69642220546578743D2244657465726D696E612073652065
        787472616920756D61207365746120636F6D206C696E68612073C3B36C696461
        20222F3E0D0A20203C537472526573204E616D653D2270726F704172726F7753
        746172742220546578743D2244657465726D696E612073652065787472616920
        756D612073657461206E6F20696EC3AD63696F206461206C696E6861222F3E0D
        0A20203C537472526573204E616D653D2270726F704172726F77576964746822
        20546578743D224C617267757261206461207365746120222F3E0D0A20203C53
        7472526573204E616D653D2270726F70436C6F736544617461536F7572636522
        20546578743D2244657465726D696E61207365206665636861206F2064617461
        736574207175616E646F206F2072656C6174C3B372696F20C3A92066696E616C
        697A61646F20222F3E0D0A20203C537472526573204E616D653D2270726F7044
        617461626173652220546578743D22436F6E6578C3A36F20C3A0204261736520
        6465204461646F7320222F3E0D0A20203C537472526573204E616D653D227072
        6F70496E6465784669656C644E616D65732220546578743D224E6F6D65732064
        6520696E6469636520646F732063616D706F7320222F3E0D0A20203C53747252
        6573204E616D653D2270726F70436F6D6D616E6454696D654F75742220546578
        743D225175616E7469646164652064652074656D706F206E6563657373C3A172
        696F2070617261206578656375746172206120717565727920222F3E0D0A2020
        3C537472526573204E616D653D2270726F70457870616E644472696C6C446F77
        6E2220546578743D2244657465726D696E6120736520657870616E646520746F
        646F73206F7320656C656D656E746F73206472696C6C2D646F776E206E6F2069
        6EC3AD63696F20646F2072656C6174C3B372696F222F3E0D0A20203C53747252
        6573204E616D653D2270726F70577973697779672E546672784D656D6F566965
        772220546578743D2244657465726D696E61207365206D6F73747261206F2074
        6578746F206E6F206D6F646F205759534957594720222F3E0D0A20203C537472
        526573204E616D653D2270726F704C6566744C696E652220546578743D224C69
        6E686120657371756572646120646520756D2071756164726F20222F3E0D0A20
        203C537472526573204E616D653D2270726F70546F704C696E65222054657874
        3D224C696E6861207375706572696F7220646520756D2071756164726F20222F
        3E0D0A20203C537472526573204E616D653D2270726F7052696768744C696E65
        2220546578743D224C696E6861206469726569746120646520756D2071756164
        726F20222F3E0D0A20203C537472526573204E616D653D2270726F70426F7474
        6F6D4C696E652220546578743D224C696E686120696E666572696F7220646520
        756D2071756164726F222F3E0D0A20203C537472526573204E616D653D227072
        6F70436F6C6F722E546672784672616D654C696E652220546578743D22412063
        6F72206461206C696E686120646F2071756164726F20222F3E0D0A20203C5374
        72526573204E616D653D2270726F705374796C652E546672784672616D654C69
        6E652220546578743D224F20657374696C6F206461206C696E686120646F2071
        756164726F222F3E0D0A20203C537472526573204E616D653D2270726F705769
        6474682E546672784672616D654C696E652220546578743D2241206C61726775
        7261206461206C696E686120646F2071756164726F20222F3E0D0A20203C5374
        72526573204E616D653D2270726F7046696C654C696E6B2220546578743D2245
        787072657373C3A36F206F75206E6F6D6520646F206172717569766F20717565
        20636F6E74C3A96D20756D6120696D6167656D20222F3E0D0A20203C53747252
        6573204E616D653D2270726F70456E646C65737357696474682220546578743D
        224D6F64616C69646164652064652070C3A167696E6120456E646C6573732E20
        536520747275652C2061206C6172677572612064612070C3A167696E61206372
        6573636572C3A120646570656E64656E646F20646F206EC3BA6D65726F206465
        20726567697374726F73206465206461646F73206E656C6120222F3E0D0A2020
        3C537472526573204E616D653D2270726F70456E646C65737348656967687422
        20546578743D224D6F64616C69646164652064652070C3A167696E6120456E64
        6C6573732E20536520747275652C206F2074616D616E686F2064612070C3A167
        696E612063726573636572C3A120646570656E64656E646F20646F206EC3BA6D
        65726F20646520726567697374726F73206465206461646F73206E656C612022
        2F3E0D0A20203C537472526573204E616D653D2270726F704164644865696768
        742220546578743D2241646963696F6E6120756D61207175616E746964616465
        2064652065737061C3A76F2065737065636966696361646120C3A020616C7475
        72612064612063C3A96C756C6120222F3E0D0A20203C537472526573204E616D
        653D2270726F7041646457696474682220546578743D2241646963696F6E6120
        756D61207175616E7469646164652064652065737061C3A76F20657370656369
        66696361646120C3A0206C6172677572612064612063C3A96C756C6120222F3E
        0D0A20203C537472526573204E616D653D2270726F70416C6C6F774475706C69
        63617465732220546578743D2244657465726D696E6120736520612063C3A96C
        756C6120706F6465206163656974617220737472696E6720636F6D2076616C6F
        726573206475706C696361646F7320222F3E0D0A20203C537472526573204E61
        6D653D2270726F704A6F696E457175616C43656C6C732220546578743D224465
        7465726D696E61207365206F2063726F73737461622064657665206A756E7461
        722061732063C3A96C756C617320636F6D2076616C6F72657320696775616973
        20222F3E0D0A20203C537472526573204E616D653D2270726F704E6578744372
        6F73732220546578743D22506F6E746569726F2070617261206F207072C3B378
        696D6F2063726F73737461622071756520736572C3A1206D6F73747261646F20
        6C61646F2061206C61646F20222F3E0D0A20203C537472526573204E616D653D
        2270726F704E65787443726F73734761702220546578743D2241626572747572
        6120656E747265206F206C61646F2061206C61646F20646F2063726F73737461
        6220222F3E0D0A20203C537472526573204E616D653D2270726F7053686F7743
        6F726E65722220546578743D2244657465726D696E61207365206F2063726F73
        73746162206465766520696E6469636172206F7320656C656D656E746F732064
        652063616E746F20657371756572646F207375706572696F7220222F3E0D0A20
        203C537472526573204E616D653D2270726F7053757070726573734E756C6C52
        65636F7264732220546578743D2244657465726D696E61207365206F2063726F
        73737461622072657072696D6520726567697374726F7320636F6D20746F646F
        73206F732076616C6F726573206E756C6F7320222F3E0D0A20203C5374725265
        73204E616D653D2270726F7053686F775469746C652220546578743D22446574
        65726D696E61207365206F2063726F7373746162206578696265206F2074C3AD
        74756C6F222F3E0D0A20203C537472526573204E616D653D2270726F70417574
        6F53697A652220546578743D2244657465726D696E61207365206F2063726F73
        737461622063617272656761206F2074616D616E686F206175746F6D61746963
        616D656E7465222F3E0D0A20203C537472526573204E616D653D2270726F7053
        686F7748696E742220546578743D2244657465726D696E6573206966206F626A
        6563742073686F756C642073686F772068696E74207768656E206D6F76652063
        7572736F72206F6E206974222F3E0D0A20203C537472526573204E616D653D22
        70726F7048696E742220546578743D2248696E742074657874222F3E0D0A2020
        3C537472526573204E616D653D2270726F70506170657253697A652220546578
        743D22506170657253697A65222F3E0D0A20203C537472526573204E616D653D
        2270726F7050616765436F756E742220546578743D22436F756E74206F662070
        61676573222F3E0D0A20203C537472526573204E616D653D2270726F70426163
        6B5069637475726556697369626C652220546578743D2244657465726D696E65
        732069662074686520706167652073686F756C6420646973706C617920612062
        61636B67726F756E642070696374757265222F3E0D0A20203C53747252657320
        4E616D653D2270726F704261636B506963747572655072696E7461626C652220
        546578743D2244657465726D696E65732069662074686520706167652073686F
        756C64207072696E742061206261636B67726F756E642070696374757265222F
        3E0D0A20203C537472526573204E616D653D2270726F7048696768745175616C
        6974792220546578743D2253686F77207069637475726520696E206869676820
        7175616C697479222F3E0D0A20203C537472526573204E616D653D2270726F70
        4C6F636B547970652220546578743D2253706563696669657320746865206C6F
        636B207479706520746F20757365207768656E206F70656E696E672061206461
        7461736574222F3E0D0A20203C537472526573204E616D653D2270726F704967
        6E6F7265447570506172616D732220546578743D2249676E6F7265206475706C
        696361746520706172616D657465727320696E20506172616D456469746F7222
        2F3E0D0A20203C537472526573204E616D653D2270726F705472616E73706172
        656E742220546578743D2244657465726D696E61746573206966207468652070
        6963747572652063616E206265207472616E73706172656E74222F3E0D0A2020
        3C537472526573204E616D653D2270726F705472616E73706172656E74436F6C
        6F722220546578743D225472616E73706172656E7420636F6C6F72222F3E0D0A
        20203C537472526573204E616D653D2270726F7049676E6F72654E756C6C7322
        20546578743D22416C6C6F7720746F20696E676E6F7265204E756C6C73207661
        6C75657320696E204368617274222F3E0D0A20203C537472526573204E616D65
        3D2270726F7053686F77436C696C6449664472696C6C446F776E222054657874
        3D2244657465726D696E61746573206966206368696C642062616E642073686F
        776E2069662067726F7570206973206472696C6C646F776E222F3E0D0A3C2F52
        65736F75726365733E0D0A0A4272617A696C2E667263}
    end
  end
  object tbCHora: TnxTable
    Database = db
    TableName = 'CHorario'
    IndexName = 'IID'
    Left = 32
    Top = 392
  end
  object mtPrev: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexFieldNames = 'Status;Fim;Maq'
    IndexDefs = <
      item
        Name = 'mtPrevIndex1'
        Fields = 'Status;Fim;Maq'
        Options = [ixCaseInsensitive]
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
    Left = 600
    Top = 200
    object mtPrevMaq: TWordField
      FieldName = 'Maq'
    end
    object mtPrevStatus: TWordField
      FieldName = 'Status'
    end
    object mtPrevSessaoObj: TIntegerField
      FieldName = 'SessaoObj'
    end
    object mtPrevInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object mtPrevFim: TDateTimeField
      FieldName = 'Fim'
    end
    object mtPrevFimPrev: TStringField
      FieldName = 'FimPrev'
      Size = 30
    end
  end
  object dsPrev: TDataSource
    DataSet = mtPrev
    Left = 648
    Top = 200
  end
  object tbCriar: TnxTable
    Database = db
    Timeout = 120000
    TableName = 'EmailCriar'
    IndexName = 'IID'
    Left = 576
    Top = 64
    object tbCriarID: TAutoIncField
      FieldName = 'ID'
    end
    object tbCriarTipo: TIntegerField
      FieldName = 'Tipo'
    end
    object tbCriarParametros: TMemoField
      FieldName = 'Parametros'
      BlobType = ftMemo
    end
    object tbCriarDestino: TMemoField
      FieldName = 'Destino'
      BlobType = ftMemo
    end
  end
  object mtTipoImp: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexName = 'IID'
    IndexDefs = <
      item
        Name = 'IID'
        Fields = 'ID'
        Options = [ixCaseInsensitive]
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
    OnCalcFields = mtTipoImpCalcFields
    Left = 568
    Top = 336
    object mtTipoImpID: TWordField
      FieldName = 'ID'
    end
    object mtTipoImpNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object mtTipoImpImpressora: TStringField
      FieldName = 'Impressora'
      Size = 500
    end
    object mtTipoImpValor: TCurrencyField
      FieldName = 'Valor'
    end
    object mtTipoImpImgID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ImgID'
    end
    object mtTipoImpShowImp: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'ShowImp'
      Calculated = True
    end
  end
  object dsTipoImp: TDataSource
    DataSet = mtTipoImp
    Left = 560
    Top = 392
  end
  object tbIC: TnxTable
    Database = db
    TableName = 'infoCampanha'
    IndexName = 'IIP'
    Left = 504
    Top = 136
    object tbICIP: TStringField
      FieldName = 'IP'
      Size = 15
    end
    object tbICcampanha: TStringField
      FieldName = 'campanha'
      Size = 50
    end
    object tbICutmccn: TStringField
      FieldName = 'utmccn'
      Size = 250
    end
    object tbICutmctr: TStringField
      FieldName = 'utmctr'
      Size = 250
    end
    object tbICutmcct: TStringField
      FieldName = 'utmcct'
      Size = 250
    end
    object tbICutmcmd: TStringField
      FieldName = 'utmcmd'
      Size = 250
    end
    object tbICutmcsr: TStringField
      FieldName = 'utmcsr'
      Size = 250
    end
  end
  object mtPrintDoc: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexName = 'IArq'
    IndexDefs = <
      item
        Name = 'IArq'
        Fields = 'Arq'
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
    OnCalcFields = mtPrintDocCalcFields
    Left = 504
    Top = 72
    object mtPrintDocArq: TStringField
      FieldName = 'Arq'
      Size = 38
    end
    object mtPrintDocDoc: TStringField
      FieldName = 'Doc'
      Size = 200
    end
    object mtPrintDocPag: TIntegerField
      FieldName = 'Pag'
    end
    object mtPrintDocSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object mtPrintDocTipoImp: TIntegerField
      FieldName = 'TipoImp'
    end
    object mtPrintDocMaq: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Maq'
      Calculated = True
    end
    object mtPrintDocNomeTipoImp: TStringField
      FieldName = 'NomeTipoImp'
      Size = 50
    end
  end
  object mtPausadas: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexName = 'IPausadasID'
    IndexDefs = <
      item
        Name = 'IPausadasID'
        Fields = 'ID'
        Options = [ixCaseInsensitive]
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
    Left = 656
    Top = 312
    object mtPausadasPDF: TBooleanField
      FieldName = 'PDF'
    end
    object mtPausadasID: TStringField
      FieldName = 'ID'
      Size = 38
    end
    object mtPausadasDoc: TStringField
      FieldName = 'Doc'
      Size = 200
    end
    object mtPausadasMaq: TIntegerField
      FieldName = 'Maq'
    end
    object mtPausadasComputador: TStringField
      FieldName = 'Computador'
      Size = 100
    end
    object mtPausadasImpTipo: TStringField
      FieldName = 'ImpTipo'
      Size = 100
    end
    object mtPausadasPrinterIndex: TIntegerField
      FieldName = 'PrinterIndex'
    end
    object mtPausadasJobID: TIntegerField
      FieldName = 'JobID'
    end
    object mtPausadasPag: TIntegerField
      FieldName = 'Pag'
    end
  end
  object tbProdD: TnxTable
    Database = db
    TableName = 'prodd'
    IndexName = 'uq_codbar'
    Left = 32
    Top = 448
    object tbProdDcodbar: TStringField
      FieldName = 'codbar'
      Required = True
      Size = 14
    end
    object tbProdDfk_user: TIntegerField
      FieldName = 'fk_user'
    end
    object tbProdDdescricao: TStringField
      FieldName = 'descricao'
      Size = 55
    end
    object tbProdDunid: TStringField
      FieldName = 'unid'
      Size = 5
    end
    object tbProdDimagem: TGraphicField
      FieldName = 'imagem'
      BlobType = ftGraphic
    end
    object tbProdDmd5: TStringField
      FieldName = 'md5'
      Size = 32
    end
    object tbProdDcategoria: TStringField
      FieldName = 'categoria'
      Size = 35
    end
    object tbProdDid_upd: TIntegerField
      FieldName = 'id_upd'
      Required = True
    end
  end
  object tbEspecie: TnxTable
    Database = db
    TableName = 'Especie'
    IndexName = 'IID'
    Left = 512
    Top = 208
    object tbEspecieID: TWordField
      FieldName = 'ID'
    end
    object tbEspecieTipo: TWordField
      FieldName = 'Tipo'
    end
    object tbEspecieNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tbEspeciePermiteTroco: TBooleanField
      FieldName = 'PermiteTroco'
    end
    object tbEspeciePermiteVarios: TBooleanField
      FieldName = 'PermiteVarios'
    end
    object tbEspeciePermiteCred: TBooleanField
      FieldName = 'PermiteCred'
    end
    object tbEspecieImg: TWordField
      FieldName = 'Img'
    end
  end
end
