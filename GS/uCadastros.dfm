object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Cadastros Nextar'
  ClientHeight = 591
  ClientWidth = 1224
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 1224
    Height = 43
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 0
    object lbCalc: TLabel
      Left = 772
      Top = 16
      Width = 169
      Height = 13
      Alignment = taCenter
      Caption = 'Preparando dados. Aguarde ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 328
      Top = 13
      Width = 97
      Height = 13
      Caption = 'Inativo = depois de '
    end
    object Label2: TLabel
      Left = 486
      Top = 15
      Width = 19
      Height = 13
      Caption = 'dias'
    end
    object Label6: TLabel
      Left = 725
      Top = 16
      Width = 19
      Height = 13
      Caption = 'dias'
    end
    object Label7: TLabel
      Left = 528
      Top = 14
      Width = 121
      Height = 13
      Caption = 'PREMIUM = vencidos at'#233
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Atualizar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 86
      Top = 5
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Fechar'
      Default = True
      TabOrder = 1
      OnClick = Button2Click
    end
    object cmCidade: TButton
      AlignWithMargins = True
      Left = 247
      Top = 5
      Width = 66
      Height = 33
      Align = alLeft
      Caption = 'Corrigir'#13#10'Cidade'
      TabOrder = 2
      WordWrap = True
      OnClick = cmCidadeClick
    end
    object edDias: TcxSpinEdit
      Left = 431
      Top = 10
      ParentFont = False
      Properties.ImmediatePost = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      Value = 7
      Width = 49
    end
    object edDiasP: TcxSpinEdit
      Left = 655
      Top = 11
      ParentFont = False
      Properties.ImmediatePost = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 4
      Value = 10
      Width = 63
    end
    object cmExp: TButton
      AlignWithMargins = True
      Left = 167
      Top = 5
      Width = 74
      Height = 33
      Align = alLeft
      Caption = 'Exportar'
      TabOrder = 5
      OnClick = cmExpClick
    end
  end
  object nxSession: TnxSession
    ServerEngine = nxRSE
    Left = 144
    Top = 160
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasName = 'Registro'
    Left = 184
    Top = 152
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCP
    Left = 384
    Top = 152
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    Timeout = 60000
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16300
    Left = 344
    Top = 152
  end
  object Timer1: TTimer
    Interval = 200
    OnTimer = Timer1Timer
    Left = 280
    Top = 272
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object dlgExp: TSaveDialog
    FileName = 'Exportar'
    Filter = 'Excel|*.xls|Html|*.htm|Texto|*.txt|Call-Center|*.csv'
    FilterIndex = 3
    Left = 88
    Top = 145
  end
  object tL: TnxTable
    Database = nxDB
    OnCalcFields = tLCalcFields
    TableName = 'cliente'
    IndexName = 'ICodigo'
    Left = 400
    Top = 296
    object tLCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object tLTipo: TWordField
      FieldName = 'Tipo'
    end
    object tLSenha: TStringField
      FieldName = 'Senha'
      Size = 30
    end
    object tLLoja: TStringField
      FieldName = 'Loja'
      Size = 50
    end
    object tLRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 50
    end
    object tLCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object tLUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tLCEP: TStringField
      FieldName = 'CEP'
      Size = 50
    end
    object tLBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object tLSerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
    object tLCodEquip: TStringField
      FieldName = 'CodEquip'
      Size = 60
    end
    object tLNumMaq: TWordField
      FieldName = 'NumMaq'
    end
    object tLObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tLEmailReg: TnxMemoField
      FieldName = 'EmailReg'
      BlobType = ftMemo
    end
    object tLLicMaq: TWordField
      FieldName = 'LicMaq'
    end
    object tLLicTipo: TWordField
      FieldName = 'LicTipo'
    end
    object tLLicVenc: TDateField
      FieldName = 'LicVenc'
    end
    object tLEmailTec: TnxMemoField
      FieldName = 'EmailTec'
      BlobType = ftMemo
    end
    object tLValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tLValorRec: TCurrencyField
      FieldName = 'ValorRec'
    end
    object tLEmitirNF: TBooleanField
      FieldName = 'EmitirNF'
    end
    object tLUObtemLic: TDateTimeField
      FieldName = 'UObtemLic'
    end
    object tLUVersao: TStringField
      FieldName = 'UVersao'
      Size = 10
    end
    object tLCAno: TWordField
      FieldName = 'CAno'
    end
    object tLCMes: TWordField
      FieldName = 'CMes'
    end
    object tLCDia: TWordField
      FieldName = 'CDia'
    end
    object tLAAno: TWordField
      FieldName = 'AAno'
    end
    object tLAMes: TWordField
      FieldName = 'AMes'
    end
    object tLADia: TWordField
      FieldName = 'ADia'
    end
    object tLUAno: TWordField
      FieldName = 'UAno'
    end
    object tLUMes: TWordField
      FieldName = 'UMes'
    end
    object tLUDia: TWordField
      FieldName = 'UDia'
    end
    object tLUDias: TWordField
      FieldName = 'UDias'
    end
    object tLMotivoDesist: TStringField
      FieldName = 'MotivoDesist'
      Size = 30
    end
    object tLAtivado: TBooleanField
      DisplayLabel = 'Ativou'
      FieldName = 'Ativado'
    end
    object tLEmailConta: TStringField
      FieldName = 'EmailConta'
      Size = 200
    end
    object tLAtivadoEm: TDateTimeField
      FieldName = 'AtivadoEm'
    end
    object tLPremiumAte: TDateTimeField
      FieldName = 'PremiumAte'
    end
    object tLCodDesc: TStringField
      FieldName = 'CodDesc'
      Size = 10
    end
    object tLIDias: TIntegerField
      DisplayLabel = 'Inativo '#224
      FieldKind = fkCalculated
      FieldName = 'IDias'
      Calculated = True
    end
    object tLVersao: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Versao'
      Calculated = True
    end
    object tLServEmail: TStringField
      FieldKind = fkCalculated
      FieldName = 'ServEmail'
      Size = 30
      Calculated = True
    end
    object tLFree: TWordField
      FieldKind = fkCalculated
      FieldName = 'Free'
      Calculated = True
    end
    object tLPremium: TWordField
      FieldKind = fkCalculated
      FieldName = 'Premium'
      Calculated = True
    end
    object tLDefinitivo: TWordField
      FieldKind = fkCalculated
      FieldName = 'Definitivo'
      Calculated = True
    end
    object tLJaFoiPremium: TWordField
      FieldKind = fkCalculated
      FieldName = 'JaFoiPremium'
      Calculated = True
    end
    object tLAtivo: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'Ativo'
      Calculated = True
    end
    object tLBounce: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'Bounce'
      Calculated = True
    end
    object tLTeste: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'Teste'
      Calculated = True
    end
    object tLImplantou: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'Implantou'
      Calculated = True
    end
    object tLCadastroEm: TDateTimeField
      FieldName = 'CadastroEm'
    end
    object tLCadastroPor: TStringField
      FieldName = 'CadastroPor'
      Size = 30
    end
    object tLAtualizadoEm: TDateTimeField
      FieldName = 'AtualizadoEm'
    end
    object tLAtualizadoPor: TStringField
      FieldName = 'AtualizadoPor'
      Size = 30
    end
    object tLPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object tLCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 19
    end
    object tLIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object tLFormaPagto: TnxMemoField
      FieldName = 'FormaPagto'
      BlobType = ftMemo
    end
    object tLManInicio: TDateField
      FieldName = 'ManInicio'
    end
    object tLManVenc: TDateField
      FieldName = 'ManVenc'
    end
    object tLGerente: TStringField
      FieldName = 'Gerente'
      Size = 50
    end
    object tLTipoLoja: TWordField
      FieldName = 'TipoLoja'
    end
    object tLMessenger: TnxMemoField
      FieldName = 'Messenger'
      BlobType = ftMemo
    end
    object tLICQ: TnxMemoField
      FieldName = 'ICQ'
      BlobType = ftMemo
    end
    object tLLastAdminPopup: TDateTimeField
      FieldName = 'LastAdminPopup'
    end
    object tLutmccn: TIntegerField
      FieldName = 'utmccn'
    end
    object tLutmctr: TIntegerField
      FieldName = 'utmctr'
    end
    object tLutmcct: TIntegerField
      FieldName = 'utmcct'
    end
    object tLutmcsr: TIntegerField
      FieldName = 'utmcsr'
    end
    object tLutmcmd: TIntegerField
      FieldName = 'utmcmd'
    end
    object tLNegociacao: TWordField
      FieldName = 'Negociacao'
    end
    object tLContatarEm: TDateTimeField
      FieldName = 'ContatarEm'
    end
    object tLPrograma: TWordField
      FieldName = 'Programa'
    end
    object tLBloqueado: TBooleanField
      FieldName = 'Bloqueado'
    end
    object tLCliente: TBooleanField
      FieldName = 'Cliente'
    end
    object tLCodAtivacao: TStringField
      FieldName = 'CodAtivacao'
      Size = 10
    end
    object tLTipoConta: TWordField
      FieldName = 'TipoConta'
    end
    object tLRedirT: TIntegerField
      FieldName = 'RedirT'
    end
    object tLRedirI: TDateTimeField
      FieldName = 'RedirI'
    end
    object tLCampanha: TStringField
      FieldName = 'Campanha'
      Size = 50
    end
    object tLCidade_geoip: TStringField
      FieldName = 'Cidade_geoip'
      Size = 50
    end
    object tLUF_geoip: TStringField
      FieldName = 'UF_geoip'
      Size = 2
    end
    object tLConfirmouLocal: TBooleanField
      FieldName = 'ConfirmouLocal'
    end
    object tLCid: TStringField
      FieldKind = fkCalculated
      FieldName = 'Cid'
      Size = 50
      Calculated = True
    end
    object tLuf2: TStringField
      FieldKind = fkCalculated
      FieldName = 'uf2'
      Size = 2
      Calculated = True
    end
    object tLContaTrocada: TBooleanField
      FieldName = 'ContaTrocada'
    end
    object tLTrocouConta: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'TrocouConta'
      Calculated = True
    end
    object tLContatoCC: TBooleanField
      FieldName = 'ContatoCC'
    end
    object tLContatoCC2: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'ContatoCC2'
      Calculated = True
    end
    object tLOrigem: TStringField
      FieldName = 'Origem'
      Size = 50
    end
    object tLEndereco: TStringField
      FieldName = 'Endereco'
      Size = 70
    end
    object tLProprietario: TStringField
      FieldName = 'Proprietario'
      Size = 70
    end
    object tLTel1: TStringField
      FieldName = 'Tel1'
    end
    object tLTel2: TStringField
      FieldName = 'Tel2'
    end
    object tLTel3: TStringField
      FieldName = 'Tel3'
    end
    object tLTel4: TStringField
      FieldName = 'Tel4'
    end
    object tLTipoTel1: TWordField
      FieldName = 'TipoTel1'
    end
    object tLTipoTel2: TWordField
      FieldName = 'TipoTel2'
    end
    object tLTipoTel3: TWordField
      FieldName = 'TipoTel3'
    end
    object tLTipoTel4: TWordField
      FieldName = 'TipoTel4'
    end
    object tLUpdateCad: TIntegerField
      FieldName = 'UpdateCad'
    end
    object tLUpdateMkt: TIntegerField
      FieldName = 'UpdateMkt'
    end
    object tLUpdateContato: TIntegerField
      FieldName = 'UpdateContato'
    end
    object tLDBounce: TDateTimeField
      FieldName = 'DBounce'
    end
    object tLDInativo: TDateTimeField
      FieldName = 'DInativo'
    end
    object tLInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tLPreRegistro: TBooleanField
      FieldName = 'PreRegistro'
    end
    object tLPreRegistroIP: TStringField
      FieldName = 'PreRegistroIP'
      Size = 15
    end
    object tLPreRegistroEm: TDateTimeField
      FieldName = 'PreRegistroEm'
    end
    object tLCadastroCompleto: TBooleanField
      FieldName = 'CadastroCompleto'
    end
    object tLCadastroCompletoEm: TDateTimeField
      FieldName = 'CadastroCompletoEm'
    end
    object tLRegistroEm: TDateTimeField
      FieldName = 'RegistroEm'
    end
    object tLTels: TnxMemoField
      FieldName = 'Tels'
      BlobType = ftMemo
    end
    object tLProp: TnxMemoField
      FieldName = 'Prop'
      BlobType = ftMemo
    end
    object tLInstalouEm: TDateTimeField
      FieldName = 'InstalouEm'
    end
    object tLStatus: TWordField
      FieldName = 'Status'
    end
    object tLStatusDesde: TDateTimeField
      FieldName = 'StatusDesde'
    end
    object tLRecente: TBooleanField
      FieldName = 'Recente'
    end
    object tLParouRedir: TBooleanField
      FieldName = 'ParouRedir'
    end
    object tLFezRedir: TBooleanField
      FieldName = 'FezRedir'
    end
    object tLRedirU: TDateTimeField
      FieldName = 'RedirU'
    end
    object tLRedirD: TWordField
      FieldName = 'RedirD'
    end
    object tLUsou: TBooleanField
      FieldName = 'Usou'
    end
    object tLSaiu: TBooleanField
      FieldName = 'Saiu'
    end
    object tLVaiVoltar: TBooleanField
      FieldName = 'VaiVoltar'
    end
    object tLVaiVoltarAte: TDateTimeField
      FieldName = 'VaiVoltarAte'
    end
    object tLCCContatoOk: TBooleanField
      FieldName = 'CCContatoOk'
    end
    object tLCCContatoFail: TBooleanField
      FieldName = 'CCContatoFail'
    end
    object tLCCPContatoOk: TDateTimeField
      FieldName = 'CCPContatoOk'
    end
    object tLCCPContatoFail: TDateTimeField
      FieldName = 'CCPContatoFail'
    end
    object tLCCUContatoOk: TDateTimeField
      FieldName = 'CCUContatoOk'
    end
    object tLCCUContatoFail: TDateTimeField
      FieldName = 'CCUContatoFail'
    end
    object tLCCQContatoOK: TIntegerField
      FieldName = 'CCQContatoOK'
    end
    object tLCCQContatoFail: TIntegerField
      FieldName = 'CCQContatoFail'
    end
    object tLCCAgente: TIntegerField
      FieldName = 'CCAgente'
    end
  end
  object dsLojas: TDataSource
    DataSet = tL
    Left = 400
    Top = 336
  end
  object Q: TnxQuery
    Database = nxDB
    Timeout = 240000
    Left = 512
    Top = 160
  end
end
