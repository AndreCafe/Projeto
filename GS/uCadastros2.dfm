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
      Left = 468
      Top = 15
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
    object cmExp: TButton
      AlignWithMargins = True
      Left = 167
      Top = 5
      Width = 74
      Height = 33
      Align = alLeft
      Caption = 'Exportar'
      TabOrder = 3
      OnClick = cmExpClick
    end
  end
  object Grid: TcxGrid
    Left = 0
    Top = 43
    Width = 1224
    Height = 548
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 63
    ExplicitTop = 88
    ExplicitWidth = 250
    ExplicitHeight = 200
    object tvGrid: TcxGridDBTableView
      DataController.DataSource = dsLojas
      DataController.KeyFieldNames = 'Codigo'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.Footer = True
      object tvGridCodigo: TcxGridDBColumn
        DataBinding.FieldName = 'Codigo'
      end
      object tvGridTipo: TcxGridDBColumn
        DataBinding.FieldName = 'Tipo'
      end
      object tvGridSenha: TcxGridDBColumn
        DataBinding.FieldName = 'Senha'
      end
      object tvGridCadastroEm: TcxGridDBColumn
        DataBinding.FieldName = 'CadastroEm'
      end
      object tvGridCadastroCompleto: TcxGridDBColumn
        DataBinding.FieldName = 'CadastroCompleto'
        Width = 85
      end
      object tvGridCadastroCompletoEm: TcxGridDBColumn
        DataBinding.FieldName = 'CadastroCompletoEm'
      end
      object tvGridCadastroPor: TcxGridDBColumn
        DataBinding.FieldName = 'CadastroPor'
      end
      object tvGridRegistroEm: TcxGridDBColumn
        DataBinding.FieldName = 'RegistroEm'
      end
      object tvGridAtualizadoEm: TcxGridDBColumn
        DataBinding.FieldName = 'AtualizadoEm'
      end
      object tvGridAtualizadoPor: TcxGridDBColumn
        DataBinding.FieldName = 'AtualizadoPor'
      end
      object tvGridLoja: TcxGridDBColumn
        DataBinding.FieldName = 'Loja'
      end
      object tvGridRazaoSocial: TcxGridDBColumn
        DataBinding.FieldName = 'RazaoSocial'
      end
      object tvGridPais: TcxGridDBColumn
        DataBinding.FieldName = 'Pais'
      end
      object tvGridCidade: TcxGridDBColumn
        DataBinding.FieldName = 'Cidade'
      end
      object tvGridCidade_geoip: TcxGridDBColumn
        DataBinding.FieldName = 'Cidade_geoip'
      end
      object tvGridUF_geoip: TcxGridDBColumn
        DataBinding.FieldName = 'UF_geoip'
      end
      object tvGridUF: TcxGridDBColumn
        DataBinding.FieldName = 'UF'
      end
      object tvGridEndereco: TcxGridDBColumn
        DataBinding.FieldName = 'Endereco'
      end
      object tvGridCEP: TcxGridDBColumn
        DataBinding.FieldName = 'CEP'
      end
      object tvGridBairro: TcxGridDBColumn
        DataBinding.FieldName = 'Bairro'
      end
      object tvGridSerieHD: TcxGridDBColumn
        DataBinding.FieldName = 'SerieHD'
      end
      object tvGridCodEquip: TcxGridDBColumn
        DataBinding.FieldName = 'CodEquip'
      end
      object tvGridNumMaq: TcxGridDBColumn
        DataBinding.FieldName = 'NumMaq'
      end
      object tvGridCNPJ: TcxGridDBColumn
        DataBinding.FieldName = 'CNPJ'
      end
      object tvGridIE: TcxGridDBColumn
        DataBinding.FieldName = 'IE'
      end
      object tvGridObs: TcxGridDBColumn
        DataBinding.FieldName = 'Obs'
      end
      object tvGridTels: TcxGridDBColumn
        DataBinding.FieldName = 'Tels'
      end
      object tvGridEmailReg: TcxGridDBColumn
        DataBinding.FieldName = 'EmailReg'
      end
      object tvGridFormaPagto: TcxGridDBColumn
        DataBinding.FieldName = 'FormaPagto'
      end
      object tvGridLicMaq: TcxGridDBColumn
        DataBinding.FieldName = 'LicMaq'
      end
      object tvGridLicTipo: TcxGridDBColumn
        DataBinding.FieldName = 'LicTipo'
      end
      object tvGridLicVenc: TcxGridDBColumn
        DataBinding.FieldName = 'LicVenc'
      end
      object tvGridManInicio: TcxGridDBColumn
        DataBinding.FieldName = 'ManInicio'
      end
      object tvGridManVenc: TcxGridDBColumn
        DataBinding.FieldName = 'ManVenc'
      end
      object tvGridProp: TcxGridDBColumn
        DataBinding.FieldName = 'Prop'
      end
      object tvGridProprietario: TcxGridDBColumn
        DataBinding.FieldName = 'Proprietario'
      end
      object tvGridGerente: TcxGridDBColumn
        DataBinding.FieldName = 'Gerente'
      end
      object tvGridTipoLoja: TcxGridDBColumn
        DataBinding.FieldName = 'TipoLoja'
      end
      object tvGridEmailTec: TcxGridDBColumn
        DataBinding.FieldName = 'EmailTec'
      end
      object tvGridValor: TcxGridDBColumn
        DataBinding.FieldName = 'Valor'
      end
      object tvGridValorRec: TcxGridDBColumn
        DataBinding.FieldName = 'ValorRec'
      end
      object tvGridEmitirNF: TcxGridDBColumn
        DataBinding.FieldName = 'EmitirNF'
      end
      object tvGridMessenger: TcxGridDBColumn
        DataBinding.FieldName = 'Messenger'
      end
      object tvGridICQ: TcxGridDBColumn
        DataBinding.FieldName = 'ICQ'
      end
      object tvGridUObtemLic: TcxGridDBColumn
        DataBinding.FieldName = 'UObtemLic'
      end
      object tvGridUVersao: TcxGridDBColumn
        DataBinding.FieldName = 'UVersao'
      end
      object tvGridXVersao: TcxGridDBColumn
        DataBinding.FieldName = 'XVersao'
      end
      object tvGridContaTrocada: TcxGridDBColumn
        DataBinding.FieldName = 'ContaTrocada'
      end
      object tvGridCAno: TcxGridDBColumn
        DataBinding.FieldName = 'CAno'
      end
      object tvGridCMes: TcxGridDBColumn
        DataBinding.FieldName = 'CMes'
      end
      object tvGridCDia: TcxGridDBColumn
        DataBinding.FieldName = 'CDia'
      end
      object tvGridAAno: TcxGridDBColumn
        DataBinding.FieldName = 'AAno'
      end
      object tvGridAMes: TcxGridDBColumn
        DataBinding.FieldName = 'AMes'
      end
      object tvGridADia: TcxGridDBColumn
        DataBinding.FieldName = 'ADia'
      end
      object tvGridUAno: TcxGridDBColumn
        DataBinding.FieldName = 'UAno'
      end
      object tvGridUMes: TcxGridDBColumn
        DataBinding.FieldName = 'UMes'
      end
      object tvGridUDia: TcxGridDBColumn
        DataBinding.FieldName = 'UDia'
      end
      object tvGridUDias: TcxGridDBColumn
        DataBinding.FieldName = 'UDias'
      end
      object tvGridMotivoDesist: TcxGridDBColumn
        DataBinding.FieldName = 'MotivoDesist'
      end
      object tvGridLastAdminPopup: TcxGridDBColumn
        DataBinding.FieldName = 'LastAdminPopup'
      end
      object tvGridCampanha: TcxGridDBColumn
        DataBinding.FieldName = 'Campanha'
      end
      object tvGridutmccn: TcxGridDBColumn
        DataBinding.FieldName = 'utmccn'
      end
      object tvGridutmctr: TcxGridDBColumn
        DataBinding.FieldName = 'utmctr'
      end
      object tvGridutmcct: TcxGridDBColumn
        DataBinding.FieldName = 'utmcct'
      end
      object tvGridutmcsr: TcxGridDBColumn
        DataBinding.FieldName = 'utmcsr'
      end
      object tvGridutmcmd: TcxGridDBColumn
        DataBinding.FieldName = 'utmcmd'
      end
      object tvGridNegociacao: TcxGridDBColumn
        DataBinding.FieldName = 'Negociacao'
      end
      object tvGridContatarEm: TcxGridDBColumn
        DataBinding.FieldName = 'ContatarEm'
      end
      object tvGridPrograma: TcxGridDBColumn
        DataBinding.FieldName = 'Programa'
      end
      object tvGridBloqueado: TcxGridDBColumn
        DataBinding.FieldName = 'Bloqueado'
      end
      object tvGridCliente: TcxGridDBColumn
        DataBinding.FieldName = 'Cliente'
      end
      object tvGridAtivado: TcxGridDBColumn
        DataBinding.FieldName = 'Ativado'
      end
      object tvGridCodAtivacao: TcxGridDBColumn
        DataBinding.FieldName = 'CodAtivacao'
      end
      object tvGridEmailConta: TcxGridDBColumn
        DataBinding.FieldName = 'EmailConta'
      end
      object tvGridAtivadoEm: TcxGridDBColumn
        DataBinding.FieldName = 'AtivadoEm'
      end
      object tvGridTipoConta: TcxGridDBColumn
        DataBinding.FieldName = 'TipoConta'
      end
      object tvGridPremiumAte: TcxGridDBColumn
        DataBinding.FieldName = 'PremiumAte'
      end
      object tvGridCodDesc: TcxGridDBColumn
        DataBinding.FieldName = 'CodDesc'
      end
      object tvGridOrigem: TcxGridDBColumn
        DataBinding.FieldName = 'Origem'
      end
      object tvGridRedirT: TcxGridDBColumn
        DataBinding.FieldName = 'RedirT'
      end
      object tvGridRedirI: TcxGridDBColumn
        DataBinding.FieldName = 'RedirI'
      end
      object tvGridTel1: TcxGridDBColumn
        DataBinding.FieldName = 'Tel1'
      end
      object tvGridTel2: TcxGridDBColumn
        DataBinding.FieldName = 'Tel2'
      end
      object tvGridTel3: TcxGridDBColumn
        DataBinding.FieldName = 'Tel3'
      end
      object tvGridTel4: TcxGridDBColumn
        DataBinding.FieldName = 'Tel4'
      end
      object tvGridTipoTel1: TcxGridDBColumn
        DataBinding.FieldName = 'TipoTel1'
      end
      object tvGridTipoTel2: TcxGridDBColumn
        DataBinding.FieldName = 'TipoTel2'
      end
      object tvGridTipoTel3: TcxGridDBColumn
        DataBinding.FieldName = 'TipoTel3'
      end
      object tvGridTipoTel4: TcxGridDBColumn
        DataBinding.FieldName = 'TipoTel4'
      end
      object tvGridUpdateCad: TcxGridDBColumn
        DataBinding.FieldName = 'UpdateCad'
      end
      object tvGridUpdateMkt: TcxGridDBColumn
        DataBinding.FieldName = 'UpdateMkt'
      end
      object tvGridUpdateContato: TcxGridDBColumn
        DataBinding.FieldName = 'UpdateContato'
      end
      object tvGridDBounce: TcxGridDBColumn
        DataBinding.FieldName = 'DBounce'
      end
      object tvGridDInativo: TcxGridDBColumn
        DataBinding.FieldName = 'DInativo'
      end
      object tvGridInstalouEm: TcxGridDBColumn
        DataBinding.FieldName = 'InstalouEm'
      end
      object tvGridBounce: TcxGridDBColumn
        DataBinding.FieldName = 'Bounce'
      end
      object tvGridInativo: TcxGridDBColumn
        DataBinding.FieldName = 'Inativo'
      end
      object tvGridConfirmouLocal: TcxGridDBColumn
        DataBinding.FieldName = 'ConfirmouLocal'
      end
      object tvGridPreRegistro: TcxGridDBColumn
        DataBinding.FieldName = 'PreRegistro'
      end
      object tvGridPreRegistroIP: TcxGridDBColumn
        DataBinding.FieldName = 'PreRegistroIP'
      end
      object tvGridPreRegistroEm: TcxGridDBColumn
        DataBinding.FieldName = 'PreRegistroEm'
      end
      object tvGridContatoCC: TcxGridDBColumn
        DataBinding.FieldName = 'ContatoCC'
      end
      object tvGridStatus: TcxGridDBColumn
        DataBinding.FieldName = 'Status'
      end
      object tvGridStatusDesde: TcxGridDBColumn
        DataBinding.FieldName = 'StatusDesde'
      end
      object tvGridRecente: TcxGridDBColumn
        DataBinding.FieldName = 'Recente'
      end
      object tvGridParouRedir: TcxGridDBColumn
        DataBinding.FieldName = 'ParouRedir'
      end
      object tvGridPremium: TcxGridDBColumn
        DataBinding.FieldName = 'Premium'
      end
      object tvGridFezRedir: TcxGridDBColumn
        DataBinding.FieldName = 'FezRedir'
      end
      object tvGridRedirU: TcxGridDBColumn
        DataBinding.FieldName = 'RedirU'
      end
      object tvGridRedirD: TcxGridDBColumn
        DataBinding.FieldName = 'RedirD'
      end
      object tvGridUsou: TcxGridDBColumn
        DataBinding.FieldName = 'Usou'
      end
      object tvGridSaiu: TcxGridDBColumn
        DataBinding.FieldName = 'Saiu'
      end
      object tvGridVaiVoltar: TcxGridDBColumn
        DataBinding.FieldName = 'VaiVoltar'
      end
      object tvGridVaiVoltarAte: TcxGridDBColumn
        DataBinding.FieldName = 'VaiVoltarAte'
      end
      object tvGridCCContatoOk: TcxGridDBColumn
        DataBinding.FieldName = 'CCContatoOk'
      end
      object tvGridCCContatoFail: TcxGridDBColumn
        DataBinding.FieldName = 'CCContatoFail'
      end
      object tvGridCCPContatoOk: TcxGridDBColumn
        DataBinding.FieldName = 'CCPContatoOk'
      end
      object tvGridCCPContatoFail: TcxGridDBColumn
        DataBinding.FieldName = 'CCPContatoFail'
      end
      object tvGridCCUContatoOk: TcxGridDBColumn
        DataBinding.FieldName = 'CCUContatoOk'
      end
      object tvGridCCUContatoFail: TcxGridDBColumn
        DataBinding.FieldName = 'CCUContatoFail'
      end
      object tvGridCCQContatoOK: TcxGridDBColumn
        DataBinding.FieldName = 'CCQContatoOK'
      end
      object tvGridCCQContatoFail: TcxGridDBColumn
        DataBinding.FieldName = 'CCQContatoFail'
      end
      object tvGridCCAgente: TcxGridDBColumn
        DataBinding.FieldName = 'CCAgente'
      end
    end
    object glGrid: TcxGridLevel
      GridView = tvGrid
    end
  end
  object nxSession: TnxSession
    ActiveDesigntime = True
    ServerEngine = nxRSE
    Left = 144
    Top = 160
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession
    AliasName = 'Registro'
    Left = 184
    Top = 152
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCP
    Left = 384
    Top = 152
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
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
    object tLCadastroEm: TDateTimeField
      FieldName = 'CadastroEm'
    end
    object tLCadastroCompleto: TBooleanField
      FieldName = 'CadastroCompleto'
    end
    object tLCadastroCompletoEm: TDateTimeField
      FieldName = 'CadastroCompletoEm'
    end
    object tLCadastroPor: TStringField
      FieldName = 'CadastroPor'
      Size = 30
    end
    object tLRegistroEm: TDateTimeField
      FieldName = 'RegistroEm'
    end
    object tLAtualizadoEm: TDateTimeField
      FieldName = 'AtualizadoEm'
    end
    object tLAtualizadoPor: TStringField
      FieldName = 'AtualizadoPor'
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
    object tLPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object tLCidade: TStringField
      FieldName = 'Cidade'
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
    object tLUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tLEndereco: TStringField
      FieldName = 'Endereco'
      Size = 70
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
    object tLCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 19
    end
    object tLIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object tLObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tLTels: TnxMemoField
      FieldName = 'Tels'
      BlobType = ftMemo
    end
    object tLEmailReg: TnxMemoField
      FieldName = 'EmailReg'
      BlobType = ftMemo
    end
    object tLFormaPagto: TnxMemoField
      FieldName = 'FormaPagto'
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
    object tLManInicio: TDateField
      FieldName = 'ManInicio'
    end
    object tLManVenc: TDateField
      FieldName = 'ManVenc'
    end
    object tLProp: TnxMemoField
      FieldName = 'Prop'
      BlobType = ftMemo
    end
    object tLProprietario: TStringField
      FieldName = 'Proprietario'
      Size = 70
    end
    object tLGerente: TStringField
      FieldName = 'Gerente'
      Size = 50
    end
    object tLTipoLoja: TWordField
      FieldName = 'TipoLoja'
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
    object tLMessenger: TnxMemoField
      FieldName = 'Messenger'
      BlobType = ftMemo
    end
    object tLICQ: TnxMemoField
      FieldName = 'ICQ'
      BlobType = ftMemo
    end
    object tLUObtemLic: TDateTimeField
      FieldName = 'UObtemLic'
    end
    object tLUVersao: TStringField
      FieldName = 'UVersao'
      Size = 10
    end
    object tLXVersao: TWordField
      FieldName = 'XVersao'
    end
    object tLContaTrocada: TBooleanField
      FieldName = 'ContaTrocada'
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
    object tLLastAdminPopup: TDateTimeField
      FieldName = 'LastAdminPopup'
    end
    object tLCampanha: TStringField
      FieldName = 'Campanha'
      Size = 50
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
    object tLAtivado: TBooleanField
      FieldName = 'Ativado'
    end
    object tLCodAtivacao: TStringField
      FieldName = 'CodAtivacao'
      Size = 10
    end
    object tLEmailConta: TStringField
      FieldName = 'EmailConta'
      Size = 200
    end
    object tLAtivadoEm: TDateTimeField
      FieldName = 'AtivadoEm'
    end
    object tLTipoConta: TWordField
      FieldName = 'TipoConta'
    end
    object tLPremiumAte: TDateTimeField
      FieldName = 'PremiumAte'
    end
    object tLCodDesc: TStringField
      FieldName = 'CodDesc'
      Size = 10
    end
    object tLOrigem: TStringField
      FieldName = 'Origem'
      Size = 50
    end
    object tLRedirT: TIntegerField
      FieldName = 'RedirT'
    end
    object tLRedirI: TDateTimeField
      FieldName = 'RedirI'
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
    object tLInstalouEm: TDateTimeField
      FieldName = 'InstalouEm'
    end
    object tLBounce: TBooleanField
      FieldName = 'Bounce'
    end
    object tLInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tLConfirmouLocal: TBooleanField
      FieldName = 'ConfirmouLocal'
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
    object tLContatoCC: TBooleanField
      FieldName = 'ContatoCC'
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
    object tLPremium: TBooleanField
      FieldName = 'Premium'
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
