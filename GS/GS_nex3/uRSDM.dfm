object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 301
  Width = 454
  object mwNXDBCP: TkbmMWNexusDBConnectionPool
    MetaData = mwNXMD
    Database = nxDB
    Session = nxSession
    Left = 94
    Top = 80
  end
  object mwPS: TkbmMWPooledSession
    ConnectionPool = mwNXDBCP
    AutoSessionName = False
    SessionName = 'mwPS'
    Left = 22
    Top = 80
  end
  object mwNXMD: TkbmMWNexusDBMetaData
    FieldNameQuote = '"'
    FieldNameCase = kbmmwncUnaltered
    TableNameQuote = '"'
    TableNameCase = kbmmwncUnaltered
    QuoteAllFieldNames = False
    QuoteTableName = True
    StringQuote = '"'
    QuoteStringQuote = '"'
    DateLayout = 'yyyy-mm-dd'
    TimeLayout = 'hh:mm:ss.zzz'
    DateTimeLayout = 'yyyy-mm-dd hh:mm:ss.zzz'
    TrueValue = 'TRUE'
    FalseValue = 'FALSE'
    PrependTableName = False
    Left = 160
    Top = 80
  end
  object nxSession: TnxSession
    ServerEngine = dmServidorBD.ServerEngine
    Left = 24
    Top = 16
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasPath = 'c:\meus programas\nexreg\dados'
    Left = 96
    Top = 16
  end
  object mwServ: TkbmMWServer
    Active = False
    CPUAffinityMask = 1
    GarbageCollection = True
    GarbageInterval = 60
    EnableDefaultService = False
    ShutdownWait = 60
    EarlyAuthentication = False
    Left = 224
    Top = 80
  end
  object TCPIP: TkbmMWTCPIPIndyServerTransport
    Server = mwServ
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 3000
      end>
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    TransportStateOptions = []
    StringConversion = mwscFixed
    Left = 280
    Top = 16
  end
  object TCPHTTP: TkbmMWTCPIPIndyServerTransport
    Server = mwServ
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 3001
      end>
    StreamFormat = 'HTTP'
    VerifyTransfer = False
    TransportStateOptions = []
    StringConversion = mwscFixed
    Left = 280
    Top = 80
  end
  object qSeq: TnxQuery
    Database = nxDB
    Left = 24
    Top = 144
  end
  object tCorpo: TnxTable
    Database = nxDB
    TableName = 'EmailCorpo'
    IndexName = 'IProcessou'
    Left = 96
    Top = 144
    object tCorpoAssunto: TStringField
      FieldName = 'Assunto'
      Size = 100
    end
    object tCorpoInclusao: TDateTimeField
      FieldName = 'Inclusao'
    end
    object tCorpoTipo: TWordField
      FieldName = 'Tipo'
    end
    object tCorpoEnviarEm: TDateTimeField
      FieldName = 'EnviarEm'
    end
    object tCorpoProcessou: TBooleanField
      FieldName = 'Processou'
    end
    object tCorpoCType: TStringField
      FieldName = 'CType'
      Size = 100
    end
    object tCorpoAnexos: TnxMemoField
      FieldName = 'Anexos'
      BlobType = ftMemo
    end
    object tCorpoCorpo: TnxMemoField
      FieldName = 'Corpo'
      BlobType = ftMemo
    end
    object tCorpoDestino: TnxMemoField
      FieldName = 'Destino'
      BlobType = ftMemo
    end
    object tCorpoID: TAutoIncField
      FieldName = 'ID'
    end
  end
  object tEnvio: TnxTable
    Database = nxDB
    TableName = 'EmailEnvio'
    IndexName = 'IEnviar'
    Left = 160
    Top = 144
    object tEnvioID: TAutoIncField
      FieldName = 'ID'
    end
    object tEnvioCorpo: TIntegerField
      FieldName = 'Corpo'
    end
    object tEnvioInclusao: TDateTimeField
      FieldName = 'Inclusao'
    end
    object tEnvioEnvio: TDateTimeField
      FieldName = 'Envio'
    end
    object tEnvioTentativas: TWordField
      FieldName = 'Tentativas'
    end
    object tEnvioEnviar: TBooleanField
      FieldName = 'Enviar'
    end
    object tEnvioMsgErro: TMemoField
      FieldName = 'MsgErro'
      BlobType = ftMemo
    end
    object tEnvioOK: TBooleanField
      FieldName = 'OK'
    end
    object tEnvioDestino: TMemoField
      FieldName = 'Destino'
      BlobType = ftMemo
    end
  end
  object tEmail: TTimer
    Interval = 10000
    OnTimer = tEmailTimer
    Left = 224
    Top = 144
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'cliente'
    IndexName = 'ICodigo'
    Left = 280
    Top = 144
    object tCliTipo: TWordField
      FieldName = 'Tipo'
    end
    object tCliEmailReg: TMemoField
      FieldName = 'EmailReg'
      BlobType = ftMemo
    end
    object tCliLicMaq: TWordField
      FieldName = 'LicMaq'
    end
    object tCliLicTipo: TWordField
      FieldName = 'LicTipo'
    end
    object tCliLicVenc: TDateField
      FieldName = 'LicVenc'
    end
    object tCliEmailTec: TMemoField
      FieldName = 'EmailTec'
      BlobType = ftMemo
    end
    object tCliCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
  end
  object SMTP: TIdSMTP
    MaxLineAction = maException
    Host = 'pop.nextar.com.br'
    Port = 587
    AuthenticationType = atLogin
    Password = 'delphi9856'
    Username = 'contas@nextar.com.br'
    Left = 24
    Top = 200
  end
  object pop: TIdPOP3
    MaxLineAction = maException
    Host = 'pop.nextar.com.br'
    Password = 'delphi9856'
    Username = 'contas@nextar.com.br'
    Left = 96
    Top = 200
  end
  object TCPIPMsg: TkbmMWTCPIPIndyMessagingServerTransport
    Server = mwServ
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 5000
      end>
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    OnDisconnected = TCPIPMsgDisconnected
    StringConversion = mwscFixed
    Direction = [mwmdSubscribe, mwmdPublish]
    Subscriptions.Strings = (
      'MSG.>'
      'SUB.>'
      'REQ.>')
    NodeID = 'server'
    InboundMessageQueue = msgQIn
    OutboundMessageQueue = msgQOut
    AutoRelay = True
    RelayOptions = [mwmroSubscribed, mwmroUnsubscribed, mwroPeerSubscribe]
    RelayTypes = [mwmtUnknown, mwmtRequest, mwmtResponse, mwmtServiceCall, mwmtMessage, mwmtSubscribe, mwmtUnsubscribe, mwmtCache, mwmtThrottle]
    AutoRelayAlt = False
    RelayOptionsAlt = [mwmroSubscribed, mwmroUnsubscribed, mwroPeerSubscribe]
    RelayTypesAlt = [mwmtUnknown, mwmtRequest, mwmtResponse, mwmtServiceCall, mwmtMessage, mwmtSubscribe, mwmtUnsubscribe, mwmtCache, mwmtThrottle]
    Left = 160
    Top = 200
  end
  object tConexao: TnxTable
    Database = nxDB
    TableName = 'Conexao'
    IndexName = 'IAbertaThreadID'
    Left = 224
    Top = 200
    object tConexaoID: TAutoIncField
      FieldName = 'ID'
    end
    object tConexaoAberta: TBooleanField
      FieldName = 'Aberta'
    end
    object tConexaoTipo: TWordField
      FieldName = 'Tipo'
    end
    object tConexaoHD: TStringField
      FieldName = 'HD'
      Size = 60
    end
    object tConexaoLogin: TDateTimeField
      FieldName = 'Login'
    end
    object tConexaoLogout: TDateTimeField
      FieldName = 'Logout'
    end
    object tConexaoLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tConexaoUsuario: TStringField
      FieldName = 'Usuario'
      Size = 30
    end
    object tConexaoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tConexaoStatus: TStringField
      FieldName = 'Status'
      Size = 30
    end
    object tConexaoIP: TStringField
      FieldName = 'IP'
    end
    object tConexaoThreadID: TIntegerField
      FieldName = 'ThreadID'
    end
  end
  object msgQIn: TkbmMWMemoryMessageQueue
    Left = 288
    Top = 200
  end
  object msgQOut: TkbmMWMemoryMessageQueue
    Left = 344
    Top = 144
  end
  object Timer1: TTimer
    Enabled = False
    Left = 344
    Top = 88
  end
  object TCP2: TkbmMWTCPIPIndyServerTransport
    Server = mwServ
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 3010
      end>
    StreamFormat = 'ZIPPED'
    VerifyTransfer = False
    TransportStateOptions = []
    StringConversion = mwscFixed
    Left = 336
    Top = 16
  end
  object Msg: TIdMessage
    AttachmentEncoding = 'MIME'
    Body.Strings = (
      '<html xmlns:o="urn:schemas-microsoft-com:office:office"'
      'xmlns:w="urn:schemas-microsoft-com:office:word"'
      'xmlns:st1="urn:schemas-microsoft-com:office:smarttags"'
      'xmlns="http://www.w3.org/TR/REC-html40">'
      ''
      '<head>'
      
        '<meta http-equiv=Content-Type content="text/html; charset=window' +
        's-1252">'
      '<meta name=ProgId content=Word.Document>'
      '<meta name=Generator content="Microsoft Word 11">'
      '<meta name=Originator content="Microsoft Word 11">'
      '<link rel=File-List href="convite_arquivos/filelist.xml">'
      
        '<title>ENCONTRO NACIONAL DE LAN HOUSES E CYBER CAF'#201'S, NO CAMPUS ' +
        'PARTY BRASIL'
      '2009</title>'
      
        '<o:SmartTagType namespaceuri="urn:schemas-microsoft-com:office:s' +
        'marttags"'
      ' name="PersonName"/>'
      '<!--[if gte mso 9]><xml>'
      ' <o:DocumentProperties>'
      '  <o:Author>joao lucio borges</o:Author>'
      '  <o:LastAuthor>joao lucio borges</o:LastAuthor>'
      '  <o:Revision>2</o:Revision>'
      '  <o:TotalTime>2</o:TotalTime>'
      '  <o:Created>2009-01-09T17:51:00Z</o:Created>'
      '  <o:LastSaved>2009-01-09T17:53:00Z</o:LastSaved>'
      '  <o:Pages>1</o:Pages>'
      '  <o:Words>267</o:Words>'
      '  <o:Characters>1528</o:Characters>'
      '  <o:Company>Kille'#174'Soft</o:Company>'
      '  <o:Lines>12</o:Lines>'
      '  <o:Paragraphs>3</o:Paragraphs>'
      '  <o:CharactersWithSpaces>1792</o:CharactersWithSpaces>'
      '  <o:Version>11.6360</o:Version>'
      ' </o:DocumentProperties>'
      '</xml><![endif]--><!--[if gte mso 9]><xml>'
      ' <w:WordDocument>'
      '  <w:SpellingState>Clean</w:SpellingState>'
      '  <w:GrammarState>Clean</w:GrammarState>'
      '  <w:PunctuationKerning/>'
      '  <w:ValidateAgainstSchemas/>'
      '  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>'
      '  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>'
      
        '  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderTex' +
        't>'
      '  <w:Compatibility>'
      '   <w:BreakWrappedTables/>'
      '   <w:SnapToGridInCell/>'
      '   <w:WrapTextWithPunct/>'
      '   <w:UseAsianBreakRules/>'
      '   <w:DontGrowAutofit/>'
      '  </w:Compatibility>'
      '  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>'
      ' </w:WordDocument>'
      '</xml><![endif]--><!--[if gte mso 9]><xml>'
      ' <w:LatentStyles DefLockedState="false" LatentStyleCount="156">'
      ' </w:LatentStyles>'
      '</xml><![endif]--><!--[if !mso]><object'
      
        ' classid="clsid:38481807-CA0E-42D2-BF39-B33AF135CC4D" id=ieooui>' +
        '</object>'
      '<style>'
      'st1\:*{behavior:url(#ieooui) }'
      '</style>'
      '<![endif]-->'
      '<style>'
      '<!--'
      ' /* Style Definitions */'
      ' p.MsoNormal, li.MsoNormal, div.MsoNormal'
      #9'{mso-style-parent:"";'
      #9'margin:0cm;'
      #9'margin-bottom:.0001pt;'
      #9'mso-pagination:widow-orphan;'
      #9'font-size:12.0pt;'
      #9'font-family:"Times New Roman";'
      #9'mso-fareast-font-family:"Times New Roman";}'
      'a:link, span.MsoHyperlink'
      #9'{color:blue;'
      #9'text-decoration:underline;'
      #9'text-underline:single;}'
      'a:visited, span.MsoHyperlinkFollowed'
      #9'{color:purple;'
      #9'text-decoration:underline;'
      #9'text-underline:single;}'
      'p'
      #9'{mso-margin-top-alt:auto;'
      #9'margin-right:0cm;'
      #9'mso-margin-bottom-alt:auto;'
      #9'margin-left:0cm;'
      #9'mso-pagination:widow-orphan;'
      #9'font-size:12.0pt;'
      #9'font-family:"Times New Roman";'
      #9'mso-fareast-font-family:"Times New Roman";}'
      'span.SpellE'
      #9'{mso-style-name:"";'
      #9'mso-spl-e:yes;}'
      'span.GramE'
      #9'{mso-style-name:"";'
      #9'mso-gram-e:yes;}'
      '@page Section1'
      #9'{size:612.0pt 792.0pt;'
      #9'margin:72.0pt 90.0pt 72.0pt 90.0pt;'
      #9'mso-header-margin:35.4pt;'
      #9'mso-footer-margin:35.4pt;'
      #9'mso-paper-source:0;}'
      'div.Section1'
      #9'{page:Section1;}'
      '-->'
      '</style>'
      '<!--[if gte mso 10]>'
      '<style>'
      ' /* Style Definitions */'
      ' table.MsoNormalTable'
      #9'{mso-style-name:"Tabela normal";'
      #9'mso-tstyle-rowband-size:0;'
      #9'mso-tstyle-colband-size:0;'
      #9'mso-style-noshow:yes;'
      #9'mso-style-parent:"";'
      #9'mso-padding-alt:0cm 5.4pt 0cm 5.4pt;'
      #9'mso-para-margin:0cm;'
      #9'mso-para-margin-bottom:.0001pt;'
      #9'mso-pagination:widow-orphan;'
      #9'font-size:10.0pt;'
      #9'font-family:"Times New Roman";'
      #9'mso-ansi-language:#0400;'
      #9'mso-fareast-language:#0400;'
      #9'mso-bidi-language:#0400;}'
      '</style>'
      '<![endif]-->'
      '</head>'
      ''
      
        '<body lang=EN-US link=blue vlink=purple style='#39'tab-interval:36.0' +
        'pt'#39'>'
      ''
      '<div class=Section1>'
      ''
      
        '<p class=MsoNormal><b><span lang=PT-BR style='#39'font-size:10.0pt;f' +
        'ont-family:'
      
        'Arial;color:red;mso-ansi-language:PT-BR'#39'>ENCONTRO NACIONAL DE LA' +
        'N HOUSES E'
      
        'CYBER CAF'#201'S, NO CAMPUS PARTY BRASIL 2009!</span></b><span lang=P' +
        'T-BR'
      
        'style='#39'font-size:10.0pt;font-family:Arial;mso-ansi-language:PT-B' +
        'R'#39'> <o:p></o:p></span></p>'
      ''
      
        '<p><span lang=PT-BR style='#39'font-size:10.0pt;font-family:Arial;co' +
        'lor:red;'
      
        'mso-ansi-language:PT-BR'#39'>Campus <span class=SpellE>Party</span>,' +
        ' '#233' o maior'
      
        'evento de inova'#231#227'o tecnol'#243'gica e entretenimento do mundo!&nbsp; ' +
        '</span><span'
      
        'lang=PT-BR style='#39'font-size:10.0pt;font-family:Arial;mso-ansi-la' +
        'nguage:PT-BR'#39'><o:p></o:p></span></p>'
      ''
      
        '<p><span lang=PT-BR style='#39'font-size:10.0pt;font-family:Arial;ms' +
        'o-ansi-language:'
      
        'PT-BR'#39'>A Nextar, em parceria com a ABCID (</span><span style='#39'fo' +
        'nt-size:10.0pt;'
      
        'font-family:Arial'#39'><a href="http://www.abcid.com.br" target="_bl' +
        'ank"><span'
      
        'lang=PT-BR style='#39'mso-ansi-language:PT-BR'#39'>www.abcid.com.br</spa' +
        'n></a></span><span'
      
        'lang=PT-BR style='#39'font-size:10.0pt;font-family:Arial;mso-ansi-la' +
        'nguage:PT-BR'#39'>),'
      
        'convida voc'#234', para participar do encontro nacional de <span clas' +
        's=SpellE>Lan</span>'
      
        '<span class=SpellE>Houses</span> e Cyber Caf'#233's que acontecer'#225' no' +
        's dias 23 e 24'
      
        'de Janeiro de 2009, no </span><span style='#39'font-size:10.0pt;font' +
        '-family:Arial'#39'><a'
      
        'href="http://www.campusparty.com.br" target="_blank"><span lang=' +
        'PT-BR'
      
        'style='#39'mso-ansi-language:PT-BR'#39'>Campus <span class=SpellE>Party<' +
        '/span> Brasil</span></a></span><span'
      
        'lang=PT-BR style='#39'font-size:10.0pt;font-family:Arial;mso-ansi-la' +
        'nguage:PT-BR'#39'>,'
      
        '<st1:PersonName ProductID="em S'#227'o Paulo." w:st="on">em S'#227'o Paulo' +
        '.</st1:PersonName>'
      '<o:p></o:p></span></p>'
      ''
      
        '<p><span lang=PT-BR style='#39'font-size:10.0pt;font-family:Arial;ms' +
        'o-ansi-language:'
      
        'PT-BR'#39'>N'#227'o perca essa chance compreender o <span class=GramE>que' +
        ' <span'
      
        'class=SpellE>que</span></span> acontece no Brasil e no Mundo nes' +
        'se ramo e'
      
        'descobrir possibilidades de potencializar seu espa'#231'o de acesso e' +
        ' ganhar mais'
      
        'dinheiro, de maneira melhor e mais eficiente e principalmente, d' +
        'e gra'#231'a. Parece'
      
        'bom demais? E '#233'. Justamente isso, como melhorar seu espa'#231'o, ser'#227 +
        'o apresentadas'
      
        'v'#225'rias iniciativas vitoriosas, cases de coisas que est'#227'o dando c' +
        'erto, n'#227'o ser'#225
      
        'um evento do que PODE acontecer, '#233' um evento que vai mostrar o q' +
        'ue J'#193' EST'#193
      
        'acontecendo. E que pode ser aplicado na sua <span class=SpellE>l' +
        'an</span> para'
      
        'que voc'#234' possa tirar o p'#233' da lama e fazer SUCESSO.<o:p></o:p></s' +
        'pan></p>'
      ''
      
        '<p><span lang=PT-BR style='#39'font-size:10.0pt;font-family:Arial;ms' +
        'o-ansi-language:'
      
        'PT-BR'#39'>Os interessados devem<b> confirmar a participa'#231#227'o</b> at'#233 +
        ' o dia <b>12/01/2009'
      
        '(segunda-feira)</b>, enviando um email para </span><span style='#39 +
        'font-size:10.0pt;'
      
        'font-family:Arial'#39'><a href="mailto:rita@nextar.com.br" target="_' +
        'blank"><span'
      
        'lang=PT-BR style='#39'mso-ansi-language:PT-BR'#39'>rita@nextar.com.br</s' +
        'pan></a></span><span'
      
        'lang=PT-BR style='#39'font-size:10.0pt;font-family:Arial;mso-ansi-la' +
        'nguage:PT-BR'#39'>,'
      
        'com nome completo, RG e CPF. A participa'#231#227'o '#233' gratuita desde que' +
        ' seja <span'
      
        'class=GramE>confirmada</span> por esse email, caso contr'#225'rio, di' +
        'retamente no'
      
        'local do evento, o custo '#233' de R$150,00. Aproveite essa oportunid' +
        'ade.<o:p></o:p></span></p>'
      ''
      
        '<p class=MsoNormal style='#39'margin-bottom:12.0pt'#39'><b><span lang=PT' +
        '-BR'
      
        'style='#39'font-size:10.0pt;font-family:Arial;mso-ansi-language:PT-B' +
        'R'#39'>Links:</span></b><span'
      
        'lang=PT-BR style='#39'font-size:10.0pt;font-family:Arial;mso-ansi-la' +
        'nguage:PT-BR'#39'><br>'
      
        'FAQ e programa'#231#227'o completa do evento:<b> </b></span><span style=' +
        #39'font-size:'
      
        '10.0pt;font-family:Arial;color:black'#39'><a href="http://www.xrio.c' +
        'om.br/cp.htm"'
      
        'target="_blank"><span lang=PT-BR style='#39'mso-ansi-language:PT-BR'#39 +
        '>www.xrio.com.br/cp.htm</span></a></span><span'
      
        'lang=PT-BR style='#39'font-size:10.0pt;font-family:Arial;color:black' +
        ';mso-ansi-language:'
      'PT-BR'#39'><br>'
      
        'Saiba tudo sobre o Campus <span class=SpellE>Party</span>:&nbsp;' +
        ' </span><span'
      'style='#39'font-size:10.0pt;font-family:Arial;color:black'#39'><a'
      
        'href="http://www.campusparty.com.br" target="_blank"><span lang=' +
        'PT-BR'
      
        'style='#39'mso-ansi-language:PT-BR'#39'>www.campusparty.com.br</span></a' +
        '></span><span'
      
        'lang=PT-BR style='#39'font-size:10.0pt;font-family:Arial;color:black' +
        ';mso-ansi-language:'
      'PT-BR'#39'><br>'
      
        'ABCID: </span><span style='#39'font-size:10.0pt;font-family:Arial;co' +
        'lor:black'#39'><a'
      'href="http://www.abcid.com.br" target="_blank"><span lang=PT-BR'
      
        'style='#39'mso-ansi-language:PT-BR'#39'>www.abcid.com.br</span></a></spa' +
        'n><span'
      
        'lang=PT-BR style='#39'font-size:10.0pt;font-family:Arial;mso-ansi-la' +
        'nguage:PT-BR'#39'><o:p></o:p></span></p>'
      ''
      
        '<p class=MsoNormal><span class=SpellE><span style='#39'font-size:10.' +
        '0pt;font-family:'
      
        'Arial'#39'>Equipe</span></span><span style='#39'font-size:10.0pt;font-fa' +
        'mily:Arial'#39'><br>'
      'Nextar Software<o:p></o:p></span></p>'
      ''
      '</div>'
      ''
      '</body>'
      ''
      '</html>')
    BccList = <>
    CCList = <>
    Encoding = meMIME
    From.Address = 'contas@nextar.com.br'
    From.Name = 'NexCaf'#233
    From.Text = '"NexCaf'#233'" <contas@nextar.com.br>'
    Priority = mpHighest
    Recipients = <
      item
      end>
    ReplyTo = <
      item
        Address = 'contas@nextar.com.br'
        Text = 'contas@nextar.com.br'
      end>
    Sender.Address = 'contas@nextar.com.br'
    Sender.Text = 'contas@nextar.com.br'
    Left = 168
    Top = 16
  end
  object IdIMAP41: TIdIMAP4
    MaxLineAction = maException
    Left = 360
    Top = 224
  end
end
