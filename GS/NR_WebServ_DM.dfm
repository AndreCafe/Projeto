object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 551
  Width = 943
  object dpOpen: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpOpenCheckRequest
    OnDataReceived = dpOpenDataReceived
    Left = 440
    Top = 16
  end
  object HS: TRtcHttpServer
    MultiThreaded = True
    ServerAddr = '184.107.18.216'
    ServerPort = '80'
    OnSessionClose = HSSessionClose
    Left = 400
    Top = 16
  end
  object dpCriaConta: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpCriaContaCheckRequest
    OnDataReceived = dpCriaContaDataReceived
    Left = 160
    Top = 56
  end
  object dpAtivar: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpAtivarCheckRequest
    OnDataReceived = dpAtivarDataReceived
    Left = 160
    Top = 120
  end
  object dpTransferir: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpTransferirCheckRequest
    OnDataReceived = dpTransferirDataReceived
    Left = 232
    Top = 56
  end
  object dpBoleto: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpBoletoCheckRequest
    OnDataReceived = dpBoletoDataReceived
    Left = 88
    Top = 120
  end
  object dpAssinar: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpAssinarCheckRequest
    OnDataReceived = dpAssinarDataReceived
    Left = 24
    Top = 56
  end
  object dpEsqueci: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpEsqueciCheckRequest
    OnDataReceived = dpEsqueciDataReceived
    Left = 24
    Top = 120
  end
  object dpDados: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpDadosCheckRequest
    OnDataReceived = dpDadosDataReceived
    Left = 88
    Top = 56
  end
  object dpTrocarSenha: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpTrocarSenhaCheckRequest
    OnDataReceived = dpTrocarSenhaDataReceived
    Left = 232
    Top = 120
  end
  object rsmNexServ: TRtcServerModule
    Server = HS
    ModuleFileName = '/app'
    FunctionGroup = rfgGeral
    Left = 360
    Top = 96
  end
  object rfgGeral: TRtcFunctionGroup
    Left = 448
    Top = 96
  end
  object rfChecaConta: TRtcFunction
    Group = rfgGeral
    FunctionName = 'checaconta'
    OnExecute = rfChecaContaExecute
    Left = 512
    Top = 96
  end
  object dpListaLans: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpListaLansCheckRequest
    OnDataReceived = dpListaLansDataReceived
    Left = 232
    Top = 224
  end
  object dpWebTabs: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpWebTabsCheckRequest
    OnDataReceived = dpWebTabsDataReceived
    Left = 48
    Top = 208
  end
  object dpLogoff: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpLogoffCheckRequest
    OnDataReceived = dpLogoffDataReceived
    Left = 384
    Top = 232
  end
  object dpRedirAjuda: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpRedirAjudaCheckRequest
    OnDataReceived = dpRedirAjudaDataReceived
    Left = 464
    Top = 192
  end
  object dpValidar: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpValidarCheckRequest
    OnDataReceived = dpValidarDataReceived
    Left = 136
    Top = 280
  end
  object dpSenhaPorEmail: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpSenhaPorEmailCheckRequest
    OnDataReceived = dpSenhaPorEmailDataReceived
    Left = 136
    Top = 200
  end
  object dpAdminPopup: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpAdminPopupCheckRequest
    OnDataReceived = dpAdminPopupDataReceived
    Left = 48
    Top = 280
  end
  object dpContaAtivada: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpContaAtivadaCheckRequest
    OnDataReceived = dpContaAtivadaDataReceived
    Left = 232
    Top = 288
  end
  object strAnalytics: TLMDStrList
    Items.Strings = (
      '<script type="text/javascript">'
      ''
      '  var _gaq = _gaq || [];'
      '  _gaq.push(['#39'_setAccount'#39', '#39'UA-5155507-3'#39']);'
      '  _gaq.push(['#39'_setDomainName'#39', '#39'.nextar.com.br'#39']);'
      '  _gaq.push(['#39'_trackPageview'#39']);'
      ''
      '  (function() {'
      
        '    var ga = document.createElement('#39'script'#39'); ga.type = '#39'text/j' +
        'avascript'#39'; ga.async = true;'
      
        '    ga.src = ('#39'https:'#39' == document.location.protocol ? '#39'https://' +
        'ssl'#39' : '#39'http://www'#39') + '#39'.google-analytics.com/ga.js'#39';'
      
        '    var s = document.getElementsByTagName('#39'script'#39')[0]; s.parent' +
        'Node.insertBefore(ga, s);'
      '  })();'
      ''
      '</script>'
      ''
      ''
      '')
    Sorted = False
    Duplicates = dupAccept
    Left = 312
    Top = 192
  end
  object dpContaCriada: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpContaCriadaCheckRequest
    OnDataReceived = dpContaCriadaDataReceived
    Left = 368
    Top = 296
  end
  object dpCriarContaBasica: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpCriarContaBasicaCheckRequest
    OnDataReceived = dpCriarContaBasicaDataReceived
    Left = 480
    Top = 272
  end
  object dpMailchimp_Signup: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpMailchimp_SignupCheckRequest
    OnDataReceived = dpMailchimp_SignupDataReceived
    Left = 544
    Top = 168
  end
  object dpUpdate: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpUpdateCheckRequest
    OnDataReceived = dpUpdateDataReceived
    Left = 608
    Top = 272
  end
  object dpGetAutoconnInfo: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpGetAutoconnInfoCheckRequest
    OnDataReceived = dpGetAutoconnInfoDataReceived
    Left = 288
    Top = 376
  end
  object dpObtemReg: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpObtemRegCheckRequest
    OnDataReceived = dpObtemRegDataReceived
    Left = 56
    Top = 360
  end
  object dpObtemChaveSeg: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpObtemChaveSegCheckRequest
    OnDataReceived = dpObtemChaveSegDataReceived
    Left = 152
    Top = 360
  end
  object dpReconfirma: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpReconfirmaCheckRequest
    OnDataReceived = dpReconfirmaDataReceived
    Left = 56
    Top = 432
  end
  object dpEsqueci2: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpEsqueci2CheckRequest
    OnDataReceived = dpEsqueci2DataReceived
    Left = 160
    Top = 432
  end
  object dpSalvaInfoCampanha: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpSalvaInfoCampanhaCheckRequest
    OnDataReceived = dpSalvaInfoCampanhaDataReceived
    Left = 264
    Top = 440
  end
  object dpObtemInfoCampanha: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpObtemInfoCampanhaCheckRequest
    OnDataReceived = dpObtemInfoCampanhaDataReceived
    Left = 448
    Top = 440
  end
  object dpCorrigirEmail: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpCorrigirEmailCheckRequest
    OnDataReceived = dpCorrigirEmailDataReceived
    Left = 424
    Top = 368
  end
  object dpVerDadosLoja: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpVerDadosLojaCheckRequest
    OnDataReceived = dpVerDadosLojaDataReceived
    Left = 696
    Top = 432
  end
  object dpContaSessao: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpContaSessaoCheckRequest
    OnDataReceived = dpContaSessaoDataReceived
    Left = 632
    Top = 32
  end
end
