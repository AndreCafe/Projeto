object Form18: TForm18
  Left = 0
  Top = 0
  Caption = 'Junta Clientes de 2 Lojas'
  ClientHeight = 388
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnProcessar: TcxButton
    Left = 18
    Top = 121
    Width = 121
    Height = 35
    Caption = 'Processar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnProcessarClick
  end
  object cxLabel1: TcxLabel
    Left = 18
    Top = 16
    Caption = 'Pasta onde se encontram os dados da outra loja:'
  end
  object edDir: TLMDBrowseEdit
    Left = 18
    Top = 39
    Width = 367
    Height = 19
    Bevel.StyleInner = bvNormal
    Bevel.StyleOuter = bvRaised
    Bevel.BorderWidth = 1
    Bevel.Mode = bmStandard
    Caret.BlinkRate = 530
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    CustomButtons = <
      item
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000D0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          300000000000000000007777777777770000FB8B8B8BB8B70000F8B8B8B88B87
          0000F8B8B8B88B870000FB8B8B8BB8B70000F8B8B8B88B870000FB8B8B8BB8B7
          0000FFFFFFFFFFF700003B8B8B877777300078B8B87333333000333333333333
          30003333333333333000}
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Index = 0
        DisplayName = 'TLMDSpecialButton'
        ImageIndex = 0
        ListIndex = 0
        UsePngGlyph = False
      end>
    CustomButtonWidth = 18
    CustomButtonParentCtlXP = False
    Path = 'C:\nexcafe'
    StartFolder = bfoDesktop
    StartWithLast = True
  end
  object PB: TcxProgressBar
    Left = 18
    Top = 66
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 2
    Visible = False
    Width = 367
  end
  object lbProgresso: TcxLabel
    Left = 16
    Top = 87
    AutoSize = False
    Caption = 'Progresso'
    Visible = False
    Height = 17
    Width = 65
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 176
    Width = 602
    Height = 212
    Align = alBottom
    Enabled = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 323
    Top = 131
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 5
    OnClick = Button1Click
  end
  object nxSession1: TnxSession
    ActiveDesigntime = True
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRSE
    Left = 176
    Top = 96
  end
  object nxDBD: TnxDatabase
    Session = nxSession1
    AliasName = 'NexCafe'
    Left = 176
    Top = 128
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16200
    Left = 208
    Top = 96
  end
  object tDCli: TnxTable
    Database = nxDBD
    TableName = 'Cliente'
    IndexName = 'IUsername'
    Left = 240
    Top = 96
    object tDCliID: TAutoIncField
      FieldName = 'ID'
    end
    object tDCliNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tDCliEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object tDCliBairro: TStringField
      FieldName = 'Bairro'
    end
    object tDCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object tDCliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tDCliCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tDCliSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tDCliObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tDCliCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object tDCliRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object tDCliTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object tDCliEmail: TnxMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object tDCliMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object tDCliPassaportes: TFloatField
      FieldName = 'Passaportes'
    end
    object tDCliMinutosUsados: TFloatField
      FieldName = 'MinutosUsados'
    end
    object tDCliMinutosIniciais: TFloatField
      FieldName = 'MinutosIniciais'
    end
    object tDCliIsento: TBooleanField
      FieldName = 'Isento'
    end
    object tDCliUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object tDCliPai: TStringField
      FieldName = 'Pai'
      Size = 40
    end
    object tDCliMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object tDCliSenha: TStringField
      FieldName = 'Senha'
    end
    object tDCliUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object tDCliDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tDCliEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object tDCliEscolaHI: TDateTimeField
      FieldName = 'EscolaHI'
    end
    object tDCliEscolaHF: TDateTimeField
      FieldName = 'EscolaHF'
    end
    object tDCliNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object tDCliDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object tDCliCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object tDCliTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
    object tDCliLimiteDebito: TCurrencyField
      FieldName = 'LimiteDebito'
    end
    object tDCliFoto: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
    object tDCliIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object tDCliAlteradoEm: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object tDCliIncluidoPor: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object tDCliAlteradoPor: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object tDCliTitEleitor: TStringField
      FieldName = 'TitEleitor'
      Size = 13
    end
    object tDCliFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object tDCliFidTotal: TFloatField
      FieldName = 'FidTotal'
    end
    object tDCliFidResg: TFloatField
      FieldName = 'FidResg'
    end
    object tDCliAniversario: TStringField
      FieldName = 'Aniversario'
      Size = 4
    end
    object tDCliCotaImpEspecial: TBooleanField
      FieldName = 'CotaImpEspecial'
    end
    object tDCliCotaImpDia: TIntegerField
      FieldName = 'CotaImpDia'
    end
    object tDCliCotaImpMes: TIntegerField
      FieldName = 'CotaImpMes'
    end
    object tDCliSemFidelidade: TBooleanField
      FieldName = 'SemFidelidade'
    end
    object tDCliNaoGuardarCredito: TBooleanField
      FieldName = 'NaoGuardarCredito'
    end
    object tDCliPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object tDCliCHorario: TIntegerField
      FieldName = 'CHorario'
    end
    object tDCliOpCHorario: TWordField
      FieldName = 'OpCHorario'
    end
    object tDCliHP1: TIntegerField
      FieldName = 'HP1'
    end
    object tDCliHP2: TIntegerField
      FieldName = 'HP2'
    end
    object tDCliHP3: TIntegerField
      FieldName = 'HP3'
    end
    object tDCliHP4: TIntegerField
      FieldName = 'HP4'
    end
    object tDCliHP5: TIntegerField
      FieldName = 'HP5'
    end
    object tDCliHP6: TIntegerField
      FieldName = 'HP6'
    end
    object tDCliHP7: TIntegerField
      FieldName = 'HP7'
    end
    object tDCliInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tDCliTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
    object tDCliFornecedor: TBooleanField
      FieldName = 'Fornecedor'
    end
    object tDCliValorCred: TCurrencyField
      FieldName = 'ValorCred'
    end
  end
  object nxDBO: TnxDatabase
    Session = nxSession1
    AliasPath = 'c:\nexcafe'
    Left = 440
    Top = 104
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCP
    Left = 208
    Top = 128
  end
  object tOCli: TnxTable
    Database = nxDBO
    TableName = 'Cliente'
    Left = 352
    Top = 96
    object tOCliID: TAutoIncField
      FieldName = 'ID'
    end
    object tOCliNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tOCliEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object tOCliBairro: TStringField
      FieldName = 'Bairro'
    end
    object tOCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object tOCliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tOCliCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tOCliSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tOCliObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tOCliCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object tOCliRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object tOCliTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object tOCliEmail: TnxMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object tOCliMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object tOCliPassaportes: TFloatField
      FieldName = 'Passaportes'
    end
    object tOCliMinutosUsados: TFloatField
      FieldName = 'MinutosUsados'
    end
    object tOCliMinutosIniciais: TFloatField
      FieldName = 'MinutosIniciais'
    end
    object tOCliIsento: TBooleanField
      FieldName = 'Isento'
    end
    object tOCliUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object tOCliPai: TStringField
      FieldName = 'Pai'
      Size = 40
    end
    object tOCliMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object tOCliSenha: TStringField
      FieldName = 'Senha'
    end
    object tOCliUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object tOCliDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tOCliEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object tOCliEscolaHI: TDateTimeField
      FieldName = 'EscolaHI'
    end
    object tOCliEscolaHF: TDateTimeField
      FieldName = 'EscolaHF'
    end
    object tOCliNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object tOCliDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object tOCliCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object tOCliTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
    object tOCliLimiteDebito: TCurrencyField
      FieldName = 'LimiteDebito'
    end
    object tOCliFoto: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
    object tOCliIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object tOCliAlteradoEm: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object tOCliIncluidoPor: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object tOCliAlteradoPor: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object tOCliTitEleitor: TStringField
      FieldName = 'TitEleitor'
      Size = 13
    end
    object tOCliFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object tOCliFidTotal: TFloatField
      FieldName = 'FidTotal'
    end
    object tOCliFidResg: TFloatField
      FieldName = 'FidResg'
    end
    object tOCliAniversario: TStringField
      FieldName = 'Aniversario'
      Size = 4
    end
    object tOCliCotaImpEspecial: TBooleanField
      FieldName = 'CotaImpEspecial'
    end
    object tOCliCotaImpDia: TIntegerField
      FieldName = 'CotaImpDia'
    end
    object tOCliCotaImpMes: TIntegerField
      FieldName = 'CotaImpMes'
    end
    object tOCliSemFidelidade: TBooleanField
      FieldName = 'SemFidelidade'
    end
    object tOCliNaoGuardarCredito: TBooleanField
      FieldName = 'NaoGuardarCredito'
    end
    object tOCliPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object tOCliCHorario: TIntegerField
      FieldName = 'CHorario'
    end
    object tOCliOpCHorario: TWordField
      FieldName = 'OpCHorario'
    end
    object tOCliHP1: TIntegerField
      FieldName = 'HP1'
    end
    object tOCliHP2: TIntegerField
      FieldName = 'HP2'
    end
    object tOCliHP3: TIntegerField
      FieldName = 'HP3'
    end
    object tOCliHP4: TIntegerField
      FieldName = 'HP4'
    end
    object tOCliHP5: TIntegerField
      FieldName = 'HP5'
    end
    object tOCliHP6: TIntegerField
      FieldName = 'HP6'
    end
    object tOCliHP7: TIntegerField
      FieldName = 'HP7'
    end
    object tOCliInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tOCliTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
    object tOCliFornecedor: TBooleanField
      FieldName = 'Fornecedor'
    end
    object tOCliValorCred: TCurrencyField
      FieldName = 'ValorCred'
    end
  end
  object tOPass: TnxTable
    Database = nxDBO
    TableName = 'Passaporte'
    Left = 312
    Top = 96
    object tOPassID: TAutoIncField
      FieldName = 'ID'
    end
    object tOPassNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tOPassTipoPass: TIntegerField
      FieldName = 'TipoPass'
    end
    object tOPassCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tOPassExpirou: TBooleanField
      FieldName = 'Expirou'
    end
    object tOPassSenha: TStringField
      FieldName = 'Senha'
    end
    object tOPassPrimeiroUso: TDateTimeField
      FieldName = 'PrimeiroUso'
    end
    object tOPassTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tOPassTipoExp: TWordField
      FieldName = 'TipoExp'
    end
    object tOPassExpirarEm: TDateTimeField
      FieldName = 'ExpirarEm'
    end
    object tOPassMaxSegundos: TIntegerField
      FieldName = 'MaxSegundos'
    end
    object tOPassSegundos: TIntegerField
      FieldName = 'Segundos'
    end
    object tOPassAcessos: TIntegerField
      FieldName = 'Acessos'
    end
    object tOPassDia1: TIntegerField
      FieldName = 'Dia1'
    end
    object tOPassDia2: TIntegerField
      FieldName = 'Dia2'
    end
    object tOPassDia3: TIntegerField
      FieldName = 'Dia3'
    end
    object tOPassDia4: TIntegerField
      FieldName = 'Dia4'
    end
    object tOPassDia5: TIntegerField
      FieldName = 'Dia5'
    end
    object tOPassDia6: TIntegerField
      FieldName = 'Dia6'
    end
    object tOPassDia7: TIntegerField
      FieldName = 'Dia7'
    end
    object tOPassTran: TIntegerField
      FieldName = 'Tran'
    end
    object tOPassDataCompra: TDateTimeField
      FieldName = 'DataCompra'
    end
    object tOPassValido: TBooleanField
      FieldName = 'Valido'
    end
    object tOPassValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tOPassSessao: TIntegerField
      FieldName = 'Sessao'
    end
  end
  object tDPass: TnxTable
    Database = nxDBD
    TableName = 'Passaporte'
    IndexName = 'ICliExpID'
    Left = 280
    Top = 128
    object tDPassID: TAutoIncField
      FieldName = 'ID'
    end
    object tDPassNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tDPassTipoPass: TIntegerField
      FieldName = 'TipoPass'
    end
    object tDPassCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tDPassExpirou: TBooleanField
      FieldName = 'Expirou'
    end
    object tDPassSenha: TStringField
      FieldName = 'Senha'
    end
    object tDPassPrimeiroUso: TDateTimeField
      FieldName = 'PrimeiroUso'
    end
    object tDPassTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tDPassTipoExp: TWordField
      FieldName = 'TipoExp'
    end
    object tDPassExpirarEm: TDateTimeField
      FieldName = 'ExpirarEm'
    end
    object tDPassMaxSegundos: TIntegerField
      FieldName = 'MaxSegundos'
    end
    object tDPassSegundos: TIntegerField
      FieldName = 'Segundos'
    end
    object tDPassAcessos: TIntegerField
      FieldName = 'Acessos'
    end
    object tDPassDia1: TIntegerField
      FieldName = 'Dia1'
    end
    object tDPassDia2: TIntegerField
      FieldName = 'Dia2'
    end
    object tDPassDia3: TIntegerField
      FieldName = 'Dia3'
    end
    object tDPassDia4: TIntegerField
      FieldName = 'Dia4'
    end
    object tDPassDia5: TIntegerField
      FieldName = 'Dia5'
    end
    object tDPassDia6: TIntegerField
      FieldName = 'Dia6'
    end
    object tDPassDia7: TIntegerField
      FieldName = 'Dia7'
    end
    object tDPassTran: TIntegerField
      FieldName = 'Tran'
    end
    object tDPassDataCompra: TDateTimeField
      FieldName = 'DataCompra'
    end
    object tDPassValido: TBooleanField
      FieldName = 'Valido'
    end
    object tDPassValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tDPassSessao: TIntegerField
      FieldName = 'Sessao'
    end
  end
  object tMovEst: TnxTable
    Database = nxDBD
    TableName = 'MovEst'
    IndexName = 'IID'
    Left = 320
    Top = 232
    object tMovEstID: TAutoIncField
      FieldName = 'ID'
    end
    object tMovEstTran: TIntegerField
      FieldName = 'Tran'
    end
    object tMovEstProduto: TIntegerField
      FieldName = 'Produto'
    end
    object tMovEstQuant: TFloatField
      FieldName = 'Quant'
    end
    object tMovEstUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tMovEstTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tMovEstCustoU: TCurrencyField
      FieldName = 'CustoU'
    end
    object tMovEstItem: TWordField
      FieldName = 'Item'
    end
    object tMovEstDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tMovEstPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tMovEstPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tMovEstDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tMovEstDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tMovEstEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tMovEstCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tMovEstEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object tMovEstCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tMovEstCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tMovEstCategoria: TStringField
      FieldName = 'Categoria'
    end
    object tMovEstNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tMovEstITran: TIntegerField
      FieldName = 'ITran'
    end
    object tMovEstTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object tMovEstSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tMovEstFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object tMovEstFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
  end
  object tDeb: TnxTable
    Database = nxDBD
    TableName = 'Debito'
    IndexName = 'ICliData'
    Left = 232
    Top = 232
    object tDebData: TDateTimeField
      FieldName = 'Data'
    end
    object tDebCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tDebValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tDebTipo: TWordField
      FieldName = 'Tipo'
    end
    object tDebID: TIntegerField
      FieldName = 'ID'
    end
  end
end
