inherited fbOpcoes: TfbOpcoes
  Left = 91
  Top = 160
  Caption = 'Op'#231#245'es'
  ClientHeight = 726
  ClientWidth = 889
  OldCreateOrder = True
  ShowHint = True
  OnCreate = FrmBasePaiCreate
  OnDestroy = FrmBasePaiDestroy
  ExplicitTop = -289
  ExplicitWidth = 897
  ExplicitHeight = 753
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 44
    Width = 889
    Height = 682
    ExplicitTop = 44
    ExplicitWidth = 889
    ExplicitHeight = 682
    object Paginas: TcxPageControl
      Left = 217
      Top = 0
      Width = 672
      Height = 682
      ActivePage = tsGeral
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = True
      ParentFont = False
      Style = 9
      TabHeight = 24
      TabOrder = 0
      TabSlants.Positions = []
      ClientRectBottom = 682
      ClientRectRight = 672
      ClientRectTop = 25
      object tsGeral: TcxTabSheet
        BorderWidth = 5
        Caption = '&A. Geral'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 0
        ParentFont = False
        object edPermitirCaptura: TcxDBCheckBox
          Left = 6
          Top = 94
          Caption = 
            '4. Permitir Captura de Tela  das m'#225'quinas clientes atrav'#233's do NC' +
            '-Admin'
          DataBinding.DataField = 'PermiteCapturaTela'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 3
          Width = 377
        end
        object edNaoMostrarDeb: TcxDBCheckBox
          Left = 6
          Top = 115
          Caption = '5. N'#227'o mostrar mensagem de d'#233'bito de cliente'
          DataBinding.DataField = 'NaoMostrarMsgDebito'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 4
          Width = 297
        end
        object edMonitorarSite: TcxDBCheckBox
          Left = 6
          Top = 136
          Caption = '6. Monitorar o programa/site que o cliente est'#225' acessando'
          DataBinding.DataField = 'MostraProgAtual'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 5
          Width = 297
        end
        object edMostrarObs: TcxDBCheckBox
          Left = 6
          Top = 158
          Caption = 
            '7. Mostrar Observa'#231#245'es dos Acessos na tela de m'#225'quinas do NC-Adm' +
            'in'
          DataBinding.DataField = 'MostraObs'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 6
          Width = 403
        end
        object edExigirRG: TcxDBCheckBox
          Left = 6
          Top = 179
          Caption = '8. Exigir RG para Login de clientes cadastrados'
          DataBinding.DataField = 'ExigirRG'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 7
          Width = 329
        end
        object edAlteraSenhaCli: TcxDBCheckBox
          Left = 6
          Top = 200
          Caption = 
            '9. Permitir altera'#231#227'o da senha do cliente diretamente na tela de' +
            ' cadastro'
          DataBinding.DataField = 'AlterarSenhaCli'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 8
          Width = 393
        end
        object edMostrarSenhaCli: TcxDBCheckBox
          Left = 6
          Top = 222
          Caption = 
            '10. Permitir visualiza'#231#227'o da senha do cliente na tela de cadastr' +
            'o e lista'
          DataBinding.DataField = 'VerSenhaCli'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 9
          Width = 385
        end
        object cxLabel16: TcxLabel
          Left = 11
          Top = 8
          Caption = '1. Tipo de cliente padr'#227'o ao iniciar novo acesso'
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object edCliCadPadrao: TcxDBImageComboBox
          Left = 254
          Top = 7
          DataBinding.DataField = 'CliCadPadrao'
          DataBinding.DataSource = DS
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = 'Cliente Avulso'
              ImageIndex = 0
              Value = False
            end
            item
              Description = 'Cliente Cadastrado'
              Value = True
            end>
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 141
        end
        object LabelLocalizarPor: TcxLabel
          Left = 11
          Top = 38
          Caption = '2. Campo padr'#227'o para localiza'#231#227'o de clientes'
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object edCampoLocalizaCli: TcxDBImageComboBox
          Left = 254
          Top = 36
          DataBinding.DataField = 'CampoLocalizaCli'
          DataBinding.DataSource = DS
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = '1-Nome'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = '2-Username'
              Value = 1
            end
            item
              Description = '3-C'#243'digo'
              Value = 2
            end>
          Style.BorderStyle = ebsFlat
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.BorderStyle = ebsFlat
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Width = 141
        end
        object cxLabel17: TcxLabel
          Left = 11
          Top = 67
          Caption = '3. Valor padr'#227'o para limite de d'#233'bito dos clientes'
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object edLimiteDeb: TcxDBCurrencyEdit
          Left = 254
          Top = 65
          DataBinding.DataField = 'LimitePadraoDebito'
          DataBinding.DataSource = DS
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
          Width = 141
        end
        object cbMostraNomeMaq: TcxDBCheckBox
          Left = 6
          Top = 264
          Caption = 
            '12. Mostrar nome alternativo da m'#225'quina na tela de m'#225'quinas do N' +
            'exAdmin'
          DataBinding.DataField = 'MostraNomeMaq'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 13
          Width = 403
        end
        object cxDBCheckBox4: TcxDBCheckBox
          Left = 6
          Top = 243
          Caption = 
            '11. Quando incluir novo cliente salvar o c'#243'digo do cliente no us' +
            'ername'
          DataBinding.DataField = 'SalvarCodUsername'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 14
          Width = 403
        end
        object edSincHora: TcxDBCheckBox
          Left = 6
          Top = 285
          Caption = 
            '13. Sincronizar automaticamente a data e hora das m'#225'quinas clien' +
            'tes com o servidor'
          DataBinding.DataField = 'SincronizarHorarios'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 15
          Width = 451
        end
      end
      object cxTabSheet2: TcxTabSheet
        BorderWidth = 5
        Caption = ' &B. M'#225'quinas Clientes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 1
        ParentFont = False
        object edNoNet: TcxDBImageComboBox
          Left = 10
          Top = 25
          DataBinding.DataField = 'NoNet'
          DataBinding.DataSource = DS
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = 
                '1-Permitir que somente acessos PR'#201'-PAGOS continuem normalmente a' +
                't'#233' que os cr'#233'ditos do cliente terminem.'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = '2-Permitir que todos acessos continuem normalmente.'
              Value = 1
            end
            item
              Description = 
                '3-Bloquear todos acessos em andamento at'#233' que a conex'#227'o seja re-' +
                'estabelecida'
              Value = 2
            end
            item
              Description = '4-Fechar o CM-Guard e liberar acesso total em todas m'#225'quinas'
              Value = 3
            end>
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 585
        end
        object cxLabel1: TcxLabel
          Left = 10
          Top = 8
          Caption = 
            '1. Como proceder na falta de conex'#227'o entre as m'#225'quinas clientes ' +
            'e o servidor ?'
          Transparent = True
        end
        object cxLabel8: TcxLabel
          Left = 10
          Top = 55
          Caption = '2. Alinhamento da barra de cron'#244'metro '
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object edAlinhaBarra: TcxDBImageComboBox
          Left = 261
          Top = 53
          DataBinding.DataField = 'AlinhaBarraGuard'
          DataBinding.DataSource = DS
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = 'Topo'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = 'Rodap'#233
              Value = 1
            end
            item
              Description = 'Esquerda'
              Value = 2
            end
            item
              Description = 'Direita'
              Value = 3
            end>
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Width = 97
        end
        object cxLabel9: TcxLabel
          Left = 10
          Top = 83
          Caption = '3. O que fazer ap'#243's finalizar acesso '
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object edAposFinalizar: TcxDBImageComboBox
          Left = 261
          Top = 81
          DataBinding.DataField = 'AposEncerrar'
          DataBinding.DataSource = DS
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = 'Mostrar Tela de Login'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = 'Reiniciar a M'#225'quina'
              Value = 1
            end
            item
              Description = 'Efetuar Logoff no Windows'
              Value = 2
            end>
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
          Width = 187
        end
        object cxLabel10: TcxLabel
          Left = 10
          Top = 111
          Caption = '4. Tempo (segundos) para esconder a tela de login'
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object edTempoEscondeLogin: TcxDBSpinEdit
          Left = 261
          Top = 110
          DataBinding.DataField = 'TempoSumirLogin'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 3
          Width = 98
        end
        object edPaginaInicial: TcxDBTextEdit
          Left = 261
          Top = 138
          DataBinding.DataField = 'PaginaInicial'
          DataBinding.DataSource = DS
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 4
          Width = 186
        end
        object cxLabel11: TcxLabel
          Left = 10
          Top = 139
          Caption = '5. Paginial Inicial de Internet nas m'#225'quinas clientes'
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxLabel12: TcxLabel
          Left = 10
          Top = 168
          Caption = '6. Programa a ser executado automaticamente no inicio do acesso'
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object edAutoExec: TcxDBTextEdit
          Left = 333
          Top = 167
          DataBinding.DataField = 'AutoExecutar'
          DataBinding.DataSource = DS
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 5
          Width = 186
        end
        object edNomeUsuario: TcxDBTextEdit
          Left = 333
          Top = 196
          DataBinding.DataField = 'TextoPIN'
          DataBinding.DataSource = DS
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 6
          Width = 186
        end
        object cxLabel13: TcxLabel
          Left = 10
          Top = 197
          Caption = '7. Texto para o campo NOME DE USU'#193'RIO na tela de login'
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object edEsconderCrono: TcxDBCheckBox
          Left = 7
          Top = 222
          Caption = '8. N'#227'o mostrar cron'#244'metro para os clientes'
          DataBinding.DataField = 'EsconderCronometro'
          DataBinding.DataSource = DS
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 7
          Transparent = True
          Width = 262
        end
        object edFecharProg: TcxDBCheckBox
          Left = 7
          Top = 245
          Caption = '9. Fechar programas ao finalizar acesso'
          DataBinding.DataField = 'FecharProgramas'
          DataBinding.DataSource = DS
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 8
          Transparent = True
          Width = 230
        end
        object cxLabel14: TcxLabel
          Left = 361
          Top = 112
          Caption = 'M'#237'nimo de 10s (menos que isso n'#227'o esconde)'
          Transparent = True
        end
        object edEsconderSenha: TcxDBCheckBox
          Left = 7
          Top = 268
          Caption = 
            '10. N'#227'o mostrar SENHA na tela de login de clientes ('#250'til para lo' +
            'cais que tem apenas acesso por cart'#227'o de tempo)'
          DataBinding.DataField = 'MostrarApenasPIN'
          DataBinding.DataSource = DS
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 9
          Transparent = True
          Width = 582
        end
        object cxLabel33: TcxLabel
          Left = 8
          Top = 344
          Caption = '13. Desligar automaticamente m'#225'quinas que n'#227'o forem usadas por '
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object edMinutosDesligarMaq: TcxDBSpinEdit
          Left = 333
          Top = 343
          DataBinding.DataField = 'MinutosDesligaMaq'
          DataBinding.DataSource = DS
          Properties.AssignedValues.MinValue = True
          Properties.ImmediatePost = True
          Properties.MaxValue = 255.000000000000000000
          Properties.ValueType = vtInt
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 19
          Width = 64
        end
        object cxLabel34: TcxLabel
          Left = 400
          Top = 345
          Caption = ' minutos. Deixe ZERO para desativar esse recurso'
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object lbChat: TcxLabel
          Left = 8
          Top = 367
          Caption = '14. Chat entre atendente e clientes'
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object edChat: TcxDBImageComboBox
          Left = 190
          Top = 367
          DataBinding.DataField = 'OpcaoChat'
          DataBinding.DataSource = DS
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = 'Deixar janela de chat vis'#237'vel por padr'#227'o'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = 'Deixar janela de chat escondida por padr'#227'o'
              Value = 1
            end
            item
              Description = 'Desativar recurso de chat'
              Value = 2
            end>
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 22
          Width = 267
        end
        object btnFundoLogin: TcxButton
          Left = 9
          Top = 292
          Width = 404
          Height = 22
          Caption = 
            '11. Clique aqui para selecionar uma imagem de fundo para tela de' +
            ' LOGIN              '
          TabOrder = 23
          OnClick = btnFundoLoginClick
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = True
        end
        object btnFundoDesktop: TcxButton
          Left = 9
          Top = 318
          Width = 404
          Height = 22
          Caption = 
            '12. Clique aqui para selecionar uma imagem de fundo para a '#193'REA ' +
            'DE TRABALHO'
          TabOrder = 24
          OnClick = btnFundoDesktopClick
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = True
        end
      end
      object cxTabSheet4: TcxTabSheet
        Caption = '&C. Restri'#231#245'es do Windows'
        ImageIndex = 7
        object clbDrives: TcxCheckListBox
          Left = 14
          Top = 244
          Width = 321
          Height = 115
          Columns = 4
          Items = <
            item
              Text = 'A'
            end
            item
              Text = 'B'
            end
            item
              Text = 'C'
            end
            item
              Text = 'D'
            end
            item
              Text = 'E'
            end
            item
              Text = 'F'
            end
            item
              Text = 'G'
            end
            item
              Text = 'H'
            end
            item
              Text = 'I'
            end
            item
              Text = 'J'
            end
            item
              Text = 'K'
            end
            item
              Text = 'L'
            end
            item
              Text = 'M'
            end
            item
              Text = 'N'
            end
            item
              Text = 'O'
            end
            item
              Text = 'P'
            end
            item
              Text = 'Q'
            end
            item
              Text = 'R'
            end
            item
              Text = 'S'
            end
            item
              Text = 'T'
            end
            item
              Text = 'U'
            end
            item
              Text = 'V'
            end
            item
              Text = 'W'
            end
            item
              Text = 'X'
            end
            item
              Text = 'Y'
            end
            item
              Text = 'Z'
            end>
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          OnClickCheck = clbDrivesClickCheck
        end
        object edBloqPainelCtrl: TcxDBCheckBox
          Left = 9
          Top = 40
          Caption = '&2. Bloquear acesso ao PAINEL DE CONTROLE'
          DataBinding.DataField = 'BloqPainelCtrl'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Width = 361
        end
        object edBloqMenuIniciar: TcxDBCheckBox
          Left = 9
          Top = 13
          Caption = '&1. Bloquear acesso ao MENU INICIAR'
          DataBinding.DataField = 'BloqMenuIniciar'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
          Width = 361
        end
        object edBloqCtrlAltDel: TcxDBCheckBox
          Left = 9
          Top = 67
          Caption = '&3. Bloquear acesso ao CTRL-ALT-DEL'
          DataBinding.DataField = 'BloqCtrlAltDel'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 3
          Width = 361
        end
        object edBloqExecutar: TcxDBCheckBox
          Left = 9
          Top = 94
          Caption = '&4. Bloquear acesso ao comando EXECUTAR'
          DataBinding.DataField = 'BloqExecutar'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 4
          Width = 361
        end
        object edBloqMeusLocaisRede: TcxDBCheckBox
          Left = 9
          Top = 121
          Caption = '&5. Bloquear acesso ao MEUS LOCAIS DE REDE'
          DataBinding.DataField = 'BloqMeusLocaisRede'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 5
          Width = 361
        end
        object edBloqDownloads: TcxDBCheckBox
          Left = 9
          Top = 148
          Caption = '&6. Bloquear DOWNLOADS no Internet Explorer'
          DataBinding.DataField = 'BloqDownload'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 6
          Width = 371
        end
        object cxLabel4: TcxLabel
          Left = 14
          Top = 225
          Caption = '&9. Bloquear acessos aos drives: '
        end
        object cxLabel5: TcxLabel
          Left = 171
          Top = 225
          Cursor = crHandPoint
          AutoSize = False
          Caption = '&Todos'
          Style.HotTrack = True
          StyleHot.BorderStyle = ebsNone
          StyleHot.TextStyle = [fsBold]
          OnClick = cxLabel5Click
          Height = 17
          Width = 41
        end
        object cxLabel6: TcxLabel
          Left = 214
          Top = 225
          Cursor = crHandPoint
          AutoSize = False
          Caption = '&Nenhum'
          Style.HotTrack = True
          StyleHot.BorderStyle = ebsNone
          StyleHot.TextStyle = [fsBold]
          OnClick = cxLabel6Click
          Height = 17
          Width = 61
        end
        object cxDBCheckBox1: TcxDBCheckBox
          Left = 9
          Top = 197
          Caption = '&8. Esconder rel'#243'gio do Windows e '#237'cones que ficam ao seu lado'
          DataBinding.DataField = 'BloqTray'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 10
          Visible = False
          Width = 371
        end
        object cxDBCheckBox2: TcxDBCheckBox
          Left = 9
          Top = 173
          Caption = '&7. Bloquear bot'#227'o direito do mouse'
          DataBinding.DataField = 'BloqBotaoDir'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 11
          Width = 371
        end
      end
      object tsRec: TcxTabSheet
        BorderWidth = 5
        Caption = '&D. Recibos'
        ImageIndex = 3
        object lbRecImprimir: TcxLabel
          Left = 16
          Top = 8
          Caption = '1. Imprimir Recibos ? '
        end
        object edRecImprimir: TcxDBImageComboBox
          Left = 131
          Top = 6
          DataBinding.DataField = 'RecImprimir'
          DataBinding.DataSource = DS
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = 'N'#227'o'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = 'Sim: '#192's Vezes'
              Value = 1
            end
            item
              Description = 'Sim: Sempre'
              Value = 2
            end>
          Properties.OnChange = edRecImprimirPropertiesChange
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Width = 166
        end
        object lbRecMatricial: TcxLabel
          Left = 16
          Top = 31
          Caption = '2. Tipo de Impressora'
        end
        object edRecMatricial: TcxDBImageComboBox
          Left = 131
          Top = 30
          DataBinding.DataField = 'RecMatricial'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = 'Jato de Tinta/Laser'
              ImageIndex = 0
              Value = False
            end
            item
              Description = 'Matricial'
              Value = True
            end>
          Properties.OnChange = edRecMatricialPropertiesChange
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 3
          Width = 166
        end
        object lbRecPorta: TcxLabel
          Left = 32
          Top = 55
          Caption = '2.1 Porta de conex'#227'o da impressora'
        end
        object edRecPorta: TcxDBComboBox
          Left = 214
          Top = 54
          DataBinding.DataField = 'RecPorta'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items.Strings = (
            'LPT1'
            'LPT2'
            'COM1'
            'COM2'
            'COM3'
            'COM4')
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 5
          Width = 83
        end
        object lbRecLargura: TcxLabel
          Left = 32
          Top = 78
          Caption = '2.2 Largura do recibo em caracteres'
        end
        object edRecLargura: TcxDBSpinEdit
          Left = 214
          Top = 78
          DataBinding.DataField = 'RecLargura'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 7
          Width = 83
        end
        object edRecSalto: TcxDBSpinEdit
          Left = 214
          Top = 102
          DataBinding.DataField = 'RecSalto'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 8
          Width = 83
        end
        object lbRecSalto: TcxLabel
          Left = 32
          Top = 102
          Caption = '2.3 Linhas a saltar no fim do recibo'
        end
        object lbRecNomeLoja: TcxLabel
          Left = 16
          Top = 129
          Caption = '3. Nome da Loja'
        end
        object edRecNomeLoja: TcxDBTextEdit
          Left = 131
          Top = 127
          DataBinding.DataField = 'RecNomeLoja'
          DataBinding.DataSource = DS
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 11
          Width = 166
        end
        object lbRecRodape: TcxLabel
          Left = 16
          Top = 152
          Caption = '4. Texto a ser impresso no rodap'#233' dos recibos'
        end
        object edRecRodape: TcxDBMemo
          Left = 30
          Top = 171
          DataBinding.DataField = 'RecRodape'
          DataBinding.DataSource = DS
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 13
          Height = 89
          Width = 268
        end
      end
      object cxTabSheet3: TcxTabSheet
        Caption = '&E.Tarifa'#231#227'o'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 6
        ParentColor = False
        ParentFont = False
        object edLoginSemCred: TcxDBCheckBox
          Left = 9
          Top = 67
          Caption = '&3. Clientes podem se logar mesmo sem ter cr'#233'dito (em p'#243's pago)'
          DataBinding.DataField = 'PermiteLoginSemCred'
          DataBinding.DataSource = DS
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
          Width = 341
        end
        object edCronoDec: TcxDBCheckBox
          Left = 9
          Top = 94
          Caption = '&4. Cron'#244'metro decrescente para sess'#245'es com pagamento antecipado'
          DataBinding.DataField = 'MostraPrePagoDec'
          DataBinding.DataSource = DS
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 4
          Width = 361
        end
        object edVariosTipoAcesso: TcxDBCheckBox
          Left = 9
          Top = 121
          Caption = '&5. Tarifa'#231#227'o diferenciada por Tipo de Acesso'
          DataBinding.DataField = 'VariosTiposAcesso'
          DataBinding.DataSource = DS
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 5
          Width = 361
        end
        object cxLabel3: TcxLabel
          Left = 13
          Top = 176
          Caption = '&7. Tempo M'#225'ximo de Toler'#226'ncia em acessos p'#243's-pagos'
        end
        object edTolerancia: TcxDBTimeEdit
          Left = 281
          Top = 174
          DataBinding.DataField = 'Tolerancia'
          DataBinding.DataSource = DS
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 7
          Width = 83
        end
        object edEscodeTipoAcesso: TcxDBCheckBox
          Left = 9
          Top = 148
          Caption = 
            '&6. N'#227'o permitir que o cliente selecione o tipo de acesso na m'#225'q' +
            'uina cliente'
          DataBinding.DataField = 'EscondeTipoAcesso'
          DataBinding.DataSource = DS
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 6
          Width = 384
        end
        object cxLabel7: TcxLabel
          Left = 13
          Top = 202
          Caption = '8. O que fazer ao encerrar tempo de acesso pr'#233'-pago'
        end
        object edRegValorImp: TcxCheckBox
          Left = 9
          Top = 43
          Caption = 
            '2. Registrar automaticamente os valores das impress'#245'es detectada' +
            's'
          Enabled = False
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          OnClick = edRegValorImpClick
          Width = 374
        end
        object edFimPrePago: TcxDBImageComboBox
          Left = 282
          Top = 201
          DataBinding.DataField = 'EncerramentoPrePago'
          DataBinding.DataSource = DS
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = '1-Pausar Acesso'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = '2-Encerrar Acesso'
              Value = 1
            end>
          Properties.OnChange = edFimPrePagoPropertiesChange
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 10
          Width = 113
        end
        object cxGroupBox1: TcxGroupBox
          Left = 15
          Top = 378
          Caption = ' 13. Tela de Adicionar Tempo '
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 11
          Height = 135
          Width = 500
          object edTempoB1: TcxDBSpinEdit
            Left = 24
            Top = 44
            DataBinding.DataField = 'TempoB1'
            DataBinding.DataSource = DS
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.ImmediatePost = True
            Properties.UseLeftAlignmentOnEditing = False
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 0
            Width = 61
          end
          object cxLabel19: TcxLabel
            Left = 11
            Top = 45
            Caption = '1:'
          end
          object cxLabel20: TcxLabel
            Left = 91
            Top = 45
            Caption = '2:'
          end
          object edTempoB2: TcxDBSpinEdit
            Left = 104
            Top = 44
            DataBinding.DataField = 'TempoB2'
            DataBinding.DataSource = DS
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.ImmediatePost = True
            Properties.UseLeftAlignmentOnEditing = False
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 3
            Width = 61
          end
          object edTempoB3: TcxDBSpinEdit
            Left = 184
            Top = 44
            DataBinding.DataField = 'TempoB3'
            DataBinding.DataSource = DS
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.ImmediatePost = True
            Properties.UseLeftAlignmentOnEditing = False
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 4
            Width = 61
          end
          object cxLabel22: TcxLabel
            Left = 250
            Top = 45
            Caption = '4:'
          end
          object edTempoB4: TcxDBSpinEdit
            Left = 263
            Top = 45
            DataBinding.DataField = 'TempoB4'
            DataBinding.DataSource = DS
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.ImmediatePost = True
            Properties.UseLeftAlignmentOnEditing = False
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 6
            Width = 61
          end
          object edTempoB5: TcxDBSpinEdit
            Left = 343
            Top = 45
            DataBinding.DataField = 'TempoB5'
            DataBinding.DataSource = DS
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.ImmediatePost = True
            Properties.UseLeftAlignmentOnEditing = False
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 7
            Width = 61
          end
          object cxLabel23: TcxLabel
            Left = 330
            Top = 46
            Caption = '5:'
          end
          object cxLabel24: TcxLabel
            Left = 410
            Top = 46
            Caption = '6:'
          end
          object edTempoB6: TcxDBSpinEdit
            Left = 423
            Top = 45
            DataBinding.DataField = 'TempoB6'
            DataBinding.DataSource = DS
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.ImmediatePost = True
            Properties.UseLeftAlignmentOnEditing = False
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 10
            Width = 61
          end
          object cxLabel21: TcxLabel
            Left = 171
            Top = 45
            Caption = '3:'
          end
          object cxLabel18: TcxLabel
            Left = 11
            Top = 22
            Caption = '13.1 - Tempo (em minutos) dos atalhos de tempo'
            Style.TextStyle = []
          end
          object cxLabel25: TcxLabel
            Left = 11
            Top = 78
            Caption = '13.2 - Tipo de Tempo padr'#227'o'
            Style.TextStyle = []
          end
          object edCredPadrao: TcxDBLookupComboBox
            Left = 13
            Top = 95
            DataBinding.DataField = 'NomeTipoCred'
            DataBinding.DataSource = DS
            Properties.ListColumns = <>
            Properties.ListOptions.CaseInsensitive = True
            Properties.ListOptions.ColumnSorting = False
            Properties.ListOptions.ShowHeader = False
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 14
            Width = 145
          end
        end
        object edDetectarImp: TcxCheckBox
          Left = 9
          Top = 16
          Caption = '1. Detectar impress'#245'es realizadas pelos clientes'
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 12
          OnClick = edDetectarImpClick
          Width = 267
        end
        object cxDBCheckBox3: TcxDBCheckBox
          Left = 11
          Top = 308
          Caption = '&10. For'#231'ar cumprimento dos hor'#225'rios permitidos a cada cliente'
          DataBinding.DataField = 'BloquearUsoEmHorarioNP'
          DataBinding.DataSource = DS
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 13
          Width = 384
        end
        object cxDBCheckBox5: TcxDBCheckBox
          Left = 11
          Top = 330
          Caption = 
            '11. Utilizar tarifa'#231#227'o totalizada ao adicionar mais de um cr'#233'dit' +
            'o tempo em mesmo acesso'
          DataBinding.DataField = 'ContinuarCredTempo'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 14
          Width = 460
        end
        object cxDBCheckBox6: TcxDBCheckBox
          Left = 11
          Top = 352
          Caption = 
            '12. N'#227'o guardar cr'#233'dito de tempo restante na conta do cliente ao' +
            ' final do acesso'
          DataBinding.DataField = 'NaoGuardarCreditoCli'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 15
          Width = 460
        end
        object edTempoEPrePago: TcxDBSpinEdit
          Left = 282
          Top = 227
          DataBinding.DataField = 'TempoEPrePago'
          DataBinding.DataSource = DS
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 16
          Width = 113
        end
        object lbTempoEPrePago: TcxLabel
          Left = 127
          Top = 228
          Caption = '8.1 Tempo para Encerrar (seg)'
        end
        object cxLabel36: TcxLabel
          Left = 13
          Top = 256
          Caption = '9. O que fazer ao acabar cr'#233'dito de cart'#227'o de tempo'
        end
        object edEncerramentoCartao: TcxDBImageComboBox
          Left = 282
          Top = 255
          DataBinding.DataField = 'EncerramentoCartao'
          DataBinding.DataSource = DS
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = '1-Pausar Acesso'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = '2-Encerrar Acesso'
              Value = 1
            end>
          Properties.OnChange = edEncerramentoCartaoPropertiesChange
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 19
          Width = 113
        end
        object edTempoECartao: TcxDBSpinEdit
          Left = 282
          Top = 281
          DataBinding.DataField = 'TempoECartao'
          DataBinding.DataSource = DS
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 20
          Width = 113
        end
        object lbTempoECartao: TcxLabel
          Left = 127
          Top = 282
          Caption = '9.1 Tempo para Encerrar (seg)'
        end
        object edAlteraLoginSemCred: TcxDBCheckBox
          Left = 344
          Top = 63
          Caption = '3.1 Essa op'#231#227'o pode ser alterada'#13#10'no cadastro de cada cliente'
          DataBinding.DataField = 'AlteraLoginSemCred'
          DataBinding.DataSource = DS
          ParentFont = False
          Properties.ImmediatePost = True
          Properties.MultiLine = True
          Properties.NullStyle = nssUnchecked
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -9
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 3
          Width = 164
        end
        object edNaoCobrarImpFunc: TcxDBCheckBox
          Left = 265
          Top = 16
          Caption = '1.1  N'#227'o cobrar impress'#245'es de funcion'#225'rios'
          DataBinding.DataField = 'NaoCobrarImpFunc'
          DataBinding.DataSource = DS
          ParentFont = False
          Properties.ImmediatePost = True
          Properties.MultiLine = True
          Properties.NullStyle = nssUnchecked
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -9
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Width = 206
        end
      end
      object cxTabSheet1: TcxTabSheet
        Caption = '&F. Avisos de Fim de Tempo'
        ImageIndex = 5
        object PagAviso: TcxPageControl
          Left = 0
          Top = 0
          Width = 672
          Height = 657
          Align = alClient
          HideTabs = True
          TabOrder = 0
          ClientRectBottom = 657
          ClientRectRight = 672
          ClientRectTop = 0
        end
      end
      object tsCores: TcxTabSheet
        BorderWidth = 5
        Caption = '&G. Cores'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 4
        ParentFont = False
        object vgCor: TcxDBVerticalGrid
          Left = 0
          Top = 0
          Width = 281
          Height = 647
          Align = alLeft
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = True
          OptionsView.PaintStyle = psDelphi
          OptionsView.RowHeaderWidth = 101
          TabOrder = 0
          OnEditValueChanged = vgCorEditValueChanged
          DataController.DataSource = DS
          object vgCorCMaqLivre: TcxCategoryRow
            Properties.Caption = '1. M'#225'quina Livre'
            object vgCorMaqLivre: TcxDBEditorRow
              Height = 17
              Properties.Caption = 'Fundo'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.AllowSelectColor = True
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.CustomColors = <>
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ImmediateUpdateText = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.DataBinding.FieldName = 'CorLivre'
              Properties.Options.ShowEditButtons = eisbAlways
            end
            object vgCorFMaqLivre: TcxDBEditorRow
              Properties.Caption = 'Fonte'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.AllowSelectColor = True
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.CustomColors = <>
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ImmediateUpdateText = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.DataBinding.FieldName = 'CorFLivre'
              Properties.Options.ShowEditButtons = eisbAlways
            end
          end
          object vgCorCUsoPre: TcxCategoryRow
            Properties.Caption = '2. M'#225'quina em Uso Pr'#233'-Pago'
            object vgCorMaqUsoPre: TcxDBEditorRow
              Properties.Caption = 'Fundo'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.AllowSelectColor = True
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.CustomColors = <>
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ImmediateUpdateText = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.DataBinding.FieldName = 'CorUsoPrePago'
              Properties.Options.ShowEditButtons = eisbAlways
            end
            object vgCorFUsoPre: TcxDBEditorRow
              Properties.Caption = 'Fonte'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.AllowSelectColor = True
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.CustomColors = <>
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ImmediateUpdateText = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.DataBinding.FieldName = 'CorFUsoPrePago'
              Properties.Options.ShowEditButtons = eisbAlways
            end
          end
          object vgCorCUsoPos: TcxCategoryRow
            Properties.Caption = '3. M'#225'quina em Uso P'#243's-Pago'
            object vgCorUsoPos: TcxDBEditorRow
              Height = 17
              Properties.Caption = 'Fundo'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.AllowSelectColor = True
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.CustomColors = <>
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ImmediateUpdateText = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.DataBinding.FieldName = 'CorUsoPosPago'
              Properties.Options.ShowEditButtons = eisbAlways
            end
            object vgCorFUsoPos: TcxDBEditorRow
              Properties.Caption = 'Fonte'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.AllowSelectColor = True
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.CustomColors = <>
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ImmediateUpdateText = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.DataBinding.FieldName = 'CorFUsoPosPago'
              Properties.Options.ShowEditButtons = eisbAlways
            end
          end
          object vgCorCUsoManut: TcxCategoryRow
            Properties.Caption = '4. M'#225'quina em Uso por Funcion'#225'rio'
            object vgCorManut: TcxDBEditorRow
              Properties.Caption = 'Fundo'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.AllowSelectColor = True
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.CustomColors = <>
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ImmediateUpdateText = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.DataBinding.FieldName = 'CorManutencao'
              Properties.Options.ShowEditButtons = eisbAlways
            end
            object vgCorFManut: TcxDBEditorRow
              Properties.Caption = 'Fonte'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.AllowSelectColor = True
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.CustomColors = <>
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ImmediateUpdateText = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.DataBinding.FieldName = 'CorFManutencao'
              Properties.Options.ShowEditButtons = eisbAlways
            end
          end
          object vgCorCPausada: TcxCategoryRow
            Properties.Caption = '5. M'#225'quina Pausada '
            object vgCorPausa: TcxDBEditorRow
              Properties.Caption = 'Fundo'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.AllowSelectColor = True
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.CustomColors = <>
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ImmediateUpdateText = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.DataBinding.FieldName = 'CorPausado'
              Properties.Options.ShowEditButtons = eisbAlways
            end
            object vgCorFPausa: TcxDBEditorRow
              Properties.Caption = 'Fonte'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.AllowSelectColor = True
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.CustomColors = <>
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ImmediateUpdateText = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.DataBinding.FieldName = 'CorFPausado'
              Properties.Options.ShowEditButtons = eisbAlways
            end
          end
          object vgCorCategoryRow4: TcxCategoryRow
            Properties.Caption = '6. '#193'rea de Trabalho das M'#225'quinas Clientes'
            object vgCorDesktop: TcxDBEditorRow
              Properties.Caption = 'Fundo'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.AllowSelectColor = True
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.CustomColors = <>
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ImmediateUpdateText = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.DataBinding.FieldName = 'CorDesktop'
              Properties.Options.ShowEditButtons = eisbAlways
            end
            object vgCorFDesktop: TcxDBEditorRow
              Properties.Caption = 'Fonte'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.AllowSelectColor = True
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.CustomColors = <>
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ImmediateUpdateText = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.DataBinding.FieldName = 'CorFDesktop'
              Properties.Options.ShowEditButtons = eisbAlways
            end
          end
          object vgCorCategoryRow1: TcxCategoryRow
            Properties.Caption = '7. M'#225'quina em Manuten'#231#227'o / Fora do Ar'
            object vgCorMaqManut: TcxDBEditorRow
              Properties.Caption = 'Fundo'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.AllowSelectColor = True
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.CustomColors = <>
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ImmediateUpdateText = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.DataBinding.FieldName = 'CorMaqManut'
              Properties.Options.ShowEditButtons = eisbAlways
            end
            object vgCorFMaqManut: TcxDBEditorRow
              Properties.Caption = 'Fonte'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.AllowSelectColor = True
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.CustomColors = <>
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ImmediateUpdateText = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.DataBinding.FieldName = 'CorFMaqManut'
              Properties.Options.ShowEditButtons = eisbAlways
            end
          end
          object vgCorCategoryRow2: TcxCategoryRow
            Properties.Caption = '8. M'#225'quina em Uso por Tempo Previsto'
            object vgCorPrevisao: TcxDBEditorRow
              Properties.Caption = 'Fundo'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.AllowSelectColor = True
              Properties.EditProperties.ColorDialogType = cxcdtCustom
              Properties.EditProperties.CustomColors = <>
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ImmediateUpdateText = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.DataBinding.FieldName = 'CorPrevisao'
              Properties.Options.ShowEditButtons = eisbAlways
            end
            object vgCorFPrevisao: TcxDBEditorRow
              Properties.Caption = 'Fonte'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.AllowSelectColor = True
              Properties.EditProperties.ColorDialogType = cxcdtCustom
              Properties.EditProperties.CustomColors = <>
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ImmediateUpdateText = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.DataBinding.FieldName = 'CorFPrevisao'
              Properties.Options.ShowEditButtons = eisbAlways
            end
          end
        end
        object cxLabel2: TcxLabel
          Left = 288
          Top = 0
          Caption = 'Exemplos:'
          Style.TextStyle = [fsBold]
        end
        object lbLivre: TcxLabel
          Left = 288
          Top = 25
          AutoSize = False
          Caption = 'M'#225'quina Livre'
          ParentColor = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.Color = clBackground
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWhite
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          Height = 25
          Width = 152
        end
        object lbPrePago: TcxLabel
          Left = 288
          Top = 78
          AutoSize = False
          Caption = 'M'#225'quina em Uso Pr'#233'-Pago'
          ParentColor = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.Color = clBackground
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWhite
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Height = 25
          Width = 152
        end
        object lbPosPago: TcxLabel
          Left = 288
          Top = 132
          AutoSize = False
          Caption = 'M'#225'quina em Uso P'#243's-Pago'
          ParentColor = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.Color = clBackground
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWhite
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Height = 25
          Width = 152
        end
        object lbManut: TcxLabel
          Left = 288
          Top = 186
          AutoSize = False
          Caption = 'Funcion'#225'rio Usando'
          ParentColor = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.Color = clBackground
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWhite
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Height = 25
          Width = 152
        end
        object lbPausa: TcxLabel
          Left = 288
          Top = 239
          AutoSize = False
          Caption = 'M'#225'quina Pausada'
          ParentColor = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.Color = clBackground
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWhite
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Height = 25
          Width = 152
        end
        object lbDesktop: TcxLabel
          Left = 288
          Top = 293
          AutoSize = False
          Caption = #193'rea de Trabalho'
          ParentColor = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.Color = clBackground
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWhite
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Height = 25
          Width = 152
        end
        object lbMaqManut: TcxLabel
          Left = 287
          Top = 344
          AutoSize = False
          Caption = 'Em Manuten'#231#227'o  / Fora do ar'
          ParentColor = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.Color = clBackground
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWhite
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Height = 25
          Width = 152
        end
        object lbPrevisao: TcxLabel
          Left = 287
          Top = 398
          AutoSize = False
          Caption = 'Tempo Previsto'
          ParentColor = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.Color = clBackground
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWhite
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Height = 25
          Width = 152
        end
      end
      object tsCaixa: TcxTabSheet
        Caption = '&H. Caixa'
        ImageIndex = 8
        object edManterSaldoCaixa: TcxDBCheckBox
          Left = 15
          Top = 16
          Caption = '&1. Manter Saldo de Caixa'
          DataBinding.DataField = 'ManterSaldoCaixa'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 177
        end
        object edModoPagtoAcesso: TcxDBImageComboBox
          Left = 20
          Top = 58
          DataBinding.DataField = 'ModoPagtoAcesso'
          DataBinding.DataSource = DS
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = '1-Automaticamente ap'#243's finaliza'#231#227'o'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = '2-Atrav'#233's de duplo clique na m'#225'quina'
              Value = 1
            end
            item
              Description = '3-Somente atrav'#233's da tela de Caixa'
              Value = 2
            end>
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Width = 335
        end
        object cxLabel15: TcxLabel
          Left = 19
          Top = 41
          Caption = '2. Como deve ser exibida a tela de pagamento de acesso'
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
        end
        object gbOpcaoPagto: TcxGroupBox
          Left = 14
          Top = 118
          Caption = ' 4. Op'#231#227'o padr'#227'o de pagamento '
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 3
          Height = 168
          Width = 341
          object cxLabel26: TcxLabel
            Left = 12
            Top = 36
            Caption = 'Acesso'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
          end
          object cxLabel27: TcxLabel
            Left = 12
            Top = 83
            Caption = 'Venda Avulsa'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
          end
          object cxLabel28: TcxLabel
            Left = 12
            Top = 106
            Caption = 'Adicionar Tempo'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
          end
          object cxLabel29: TcxLabel
            Left = 12
            Top = 129
            Caption = 'Impress'#227'o'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
          end
          object cbPgAcesso: TcxDBImageComboBox
            Left = 99
            Top = 35
            DataBinding.DataField = 'PgAcesso'
            DataBinding.DataSource = DS
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Items = <
              item
                Description = 'Sim'
                ImageIndex = 0
                Value = True
              end
              item
                Description = 'N'#227'o'
                Value = False
              end>
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 4
            Width = 94
          end
          object cxLabel30: TcxLabel
            Left = 99
            Top = 18
            Caption = 'Pagamento Total ?'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
          end
          object cbPgVendaAvulsa: TcxDBImageComboBox
            Left = 99
            Top = 82
            DataBinding.DataField = 'PgVendaAvulsa'
            DataBinding.DataSource = DS
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Items = <
              item
                Description = 'Sim'
                ImageIndex = 0
                Value = True
              end
              item
                Description = 'N'#227'o'
                Value = False
              end>
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 6
            Width = 94
          end
          object cbPgTempo: TcxDBImageComboBox
            Left = 99
            Top = 105
            DataBinding.DataField = 'PgTempo'
            DataBinding.DataSource = DS
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Items = <
              item
                Description = 'Sim'
                ImageIndex = 0
                Value = True
              end
              item
                Description = 'N'#227'o'
                Value = False
              end>
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 7
            Width = 94
          end
          object cbPgImpressao: TcxDBImageComboBox
            Left = 99
            Top = 128
            DataBinding.DataField = 'PgImp'
            DataBinding.DataSource = DS
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Items = <
              item
                Description = 'Sim'
                ImageIndex = 0
                Value = True
              end
              item
                Description = 'N'#227'o'
                Value = False
              end>
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 8
            Width = 94
          end
          object cxLabel32: TcxLabel
            Left = 12
            Top = 59
            Caption = 'Venda c/ Acesso'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
          end
          object cbPgVendas: TcxDBImageComboBox
            Left = 99
            Top = 58
            DataBinding.DataField = 'PgVendas'
            DataBinding.DataSource = DS
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Items = <
              item
                Description = 'Sim'
                ImageIndex = 0
                Value = True
              end
              item
                Description = 'N'#227'o'
                Value = False
              end>
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 5
            Width = 94
          end
        end
        object gbCaixaEmail: TcxGroupBox
          Left = 14
          Top = 297
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 4
          Height = 267
          Width = 341
          object lbEmailMetodo: TcxLabel
            Left = 12
            Top = 23
            Caption = '5.1 Autentica'#231#227'o SMTP'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
          end
          object edEmailMetodo: TcxDBImageComboBox
            Left = 133
            Top = 21
            DataBinding.DataField = 'EmailMetodo'
            DataBinding.DataSource = DS
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Items = <
              item
                Description = '1-Requer autentica'#231#227'o'
                ImageIndex = 0
                Value = 1
              end
              item
                Description = '2-N'#227'o requer autentica'#231#227'o'
                Value = 0
              end
              item
                Description = '3-Autenticar no servidor POP3'
                Value = 2
              end>
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 1
            Width = 192
          end
          object lbEmailServ: TcxLabel
            Left = 12
            Top = 46
            Caption = '5.2 Servidor SMTP'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
          end
          object edEmailServ: TcxDBMaskEdit
            Left = 133
            Top = 44
            DataBinding.DataField = 'EmailServ'
            DataBinding.DataSource = DS
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 3
            Width = 192
          end
          object lbEmailUsername: TcxLabel
            Left = 12
            Top = 69
            Caption = '5.3 Username'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
          end
          object edEmailUsername: TcxDBMaskEdit
            Left = 133
            Top = 67
            DataBinding.DataField = 'EmailUsername'
            DataBinding.DataSource = DS
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 5
            Width = 192
          end
          object lbEmailSenha: TcxLabel
            Left = 12
            Top = 92
            Caption = '5.4 Senha'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
          end
          object edEmailSenha: TcxDBMaskEdit
            Left = 133
            Top = 90
            DataBinding.DataField = 'EmailSenha'
            DataBinding.DataSource = DS
            Properties.EchoMode = eemPassword
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 7
            Width = 192
          end
          object cxLabel31: TcxLabel
            Left = 32
            Top = 113
            Caption = 'Repetir senha'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
          end
          object edSenha2: TcxTextEdit
            Left = 133
            Top = 113
            Properties.EchoMode = eemPassword
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 9
            Width = 192
          end
          object lbEmailDestino: TcxLabel
            Left = 12
            Top = 136
            Caption = '5.5 Enviar e-mail para'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
          end
          object edEmailDestino: TcxDBMemo
            Left = 133
            Top = 136
            DataBinding.DataField = 'EmailDestino'
            DataBinding.DataSource = DS
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 11
            Height = 89
            Width = 192
          end
          object btnTestarEmail: TcxButton
            Left = 134
            Top = 228
            Width = 190
            Height = 25
            Caption = 'Testar configura'#231#245'es de E-mail'
            TabOrder = 12
            OnClick = btnTestarEmailClick
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = True
          end
        end
        object edEmailEnviarCaixa: TcxDBCheckBox
          Left = 20
          Top = 295
          Caption = '&5. Enviar Caixa por E-mail '
          DataBinding.DataField = 'EmailEnviarCaixa'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.OnChange = edEmailEnviarCaixaPropertiesChange
          Properties.OnEditValueChanged = edEmailEnviarCaixaPropertiesChange
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 5
          OnClick = edEmailEnviarCaixaClick
          Width = 149
        end
        object cxDBCheckBox7: TcxDBCheckBox
          Left = 17
          Top = 85
          Caption = '&3. Ao fechar caixa, gerar relat'#243'rio automaticamente'
          DataBinding.DataField = 'RelCaixaAuto'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 6
          Width = 281
        end
      end
      object tsPatro: TcxTabSheet
        Caption = 'I. Patrocinadores Acesso Gr'#225'tis'
        ImageIndex = 8
        object pagPatro: TcxPageControl
          Left = 0
          Top = 0
          Width = 672
          Height = 657
          Align = alClient
          HideTabs = True
          TabOrder = 0
          ClientRectBottom = 657
          ClientRectRight = 672
          ClientRectTop = 0
        end
      end
    end
    object tvOpcoes: TcxTreeView
      Left = 0
      Top = 0
      Width = 217
      Height = 682
      Align = alLeft
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = True
      Style.Shadow = False
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      AutoExpand = True
      HideSelection = False
      HotTrack = True
      Items.NodeData = {
        0109000000290000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        000841002E00200047006500720061006C003D0000000000000000000000FFFF
        FFFFFFFFFFFF00000000000000001242002E0020004D00E1007100750069006E
        006100200043006C00690065006E0074006500490000000000000000000000FF
        FFFFFFFFFFFFFF00000000000000001843002E00200052006500730074007200
        6900E700F50065007300200064006F002000570069006E0064006F0077007300
        2D0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000A44002E
        002000520065006300690062006F007300310000000000000000000000FFFFFF
        FFFFFFFFFF00000000000000000C45002E002000540061007200690066006100
        E700E3006F00530000000000000000000000FFFFFFFFFFFFFFFF000000000000
        00001D46002E00200041007600690073006F00730020006400650020005400E9
        0072006D0069006E006F002000640065002000540065006D0070006F00290000
        000000000000000000FFFFFFFFFFFFFFFF00000000000000000847002E002000
        43006F00720065007300290000000000000000000000FFFFFFFFFFFFFFFF0000
        0000000000000848002E002000430061006900780061005D0000000000000000
        000000FFFFFFFFFFFFFFFF00000000000000002249002E002000500061007400
        72006F00630069006E00610064006F0072006500730020006400650020004100
        63006500730073006F00200047007200E100740069007300}
      RowSelect = True
      OnChange = tvOpcoesChange
    end
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = FrmPri.im32
    ImageOptions.MakeDisabledImagesFaded = True
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
    Style = bmsUseLookAndFeel
    Left = 96
    Top = 440
    DockControlHeights = (
      0
      0
      44
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmSalvar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmCancelar'
        end>
      OldName = 'BarraTabSheet1'
    end
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmSalvar: TdxBarLargeButton
      Caption = '&Salvar e Aplicar'
      Category = 0
      Enabled = False
      Hint = 'Salvar e Aplicar'
      Visible = ivAlways
      LargeImageIndex = 41
      UnclickAfterDoing = False
      OnClick = cmSalvarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Enabled = False
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 49
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 48
    Top = 456
  end
  inherited CP: TdxComponentPrinter
    Left = 16
    Top = 464
  end
  inherited dlgExp: TSaveDialog
    Left = 608
    Top = 193
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 32
    Top = 266
  end
  inherited pmPeriodo: TdxBarPopupMenu
    Left = 40
    Top = 316
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 632
    Top = 208
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 7383924
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 5475927
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15463404
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = clGreen
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7383924
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9617558
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10733990
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxVerticalGridStyleSheetUserFormat2: TcxVerticalGridStyleSheet
      Caption = 'UserFormat2'
      Styles.Background = cxStyle2
      Styles.Content = cxStyle4
      Styles.Inactive = cxStyle6
      Styles.Selection = cxStyle7
      Styles.Category = cxStyle3
      Styles.Header = cxStyle5
      BuiltIn = True
    end
  end
  object MT: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = False
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'BloquearUsoEmHorarioNP'
        DataType = ftBoolean
      end
      item
        Name = 'BloqTray'
        DataType = ftBoolean
      end
      item
        Name = 'TempoB1'
        DataType = ftWord
      end
      item
        Name = 'TempoB2'
        DataType = ftWord
      end
      item
        Name = 'TempoB3'
        DataType = ftWord
      end
      item
        Name = 'TempoB4'
        DataType = ftWord
      end
      item
        Name = 'TempoB5'
        DataType = ftWord
      end
      item
        Name = 'TempoB6'
        DataType = ftWord
      end
      item
        Name = 'NumSeq'
        DataType = ftAutoInc
      end
      item
        Name = 'FecharProgramas'
        DataType = ftBoolean
      end
      item
        Name = 'AutoExecutar'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'LimiteTempoPadrao'
        DataType = ftDateTime
      end
      item
        Name = 'PacoteTempoReal'
        DataType = ftBoolean
      end
      item
        Name = 'PermiteLoginSemCred'
        DataType = ftBoolean
      end
      item
        Name = 'EncerramentoPrePago'
        DataType = ftWord
      end
      item
        Name = 'PermiteCapturaTela'
        DataType = ftBoolean
      end
      item
        Name = 'VariosTiposAcesso'
        DataType = ftBoolean
      end
      item
        Name = 'ModoPagtoAcesso'
        DataType = ftWord
      end
      item
        Name = 'MostraPrePagoDec'
        DataType = ftBoolean
      end
      item
        Name = 'TempoMaxAlerta'
        DataType = ftDateTime
      end
      item
        Name = 'Abre1'
        DataType = ftDateTime
      end
      item
        Name = 'Abre2'
        DataType = ftDateTime
      end
      item
        Name = 'Abre3'
        DataType = ftDateTime
      end
      item
        Name = 'Abre4'
        DataType = ftDateTime
      end
      item
        Name = 'Abre5'
        DataType = ftDateTime
      end
      item
        Name = 'Abre6'
        DataType = ftDateTime
      end
      item
        Name = 'Abre7'
        DataType = ftDateTime
      end
      item
        Name = 'Fecha1'
        DataType = ftDateTime
      end
      item
        Name = 'Fecha2'
        DataType = ftDateTime
      end
      item
        Name = 'Fecha3'
        DataType = ftDateTime
      end
      item
        Name = 'Fecha4'
        DataType = ftDateTime
      end
      item
        Name = 'Fecha5'
        DataType = ftDateTime
      end
      item
        Name = 'Fecha6'
        DataType = ftDateTime
      end
      item
        Name = 'Fecha7'
        DataType = ftDateTime
      end
      item
        Name = 'CorLivre'
        DataType = ftInteger
      end
      item
        Name = 'CorFLivre'
        DataType = ftInteger
      end
      item
        Name = 'CorUsoPrePago'
        DataType = ftInteger
      end
      item
        Name = 'CorFUsoPrePago'
        DataType = ftInteger
      end
      item
        Name = 'CorUsoPosPago'
        DataType = ftInteger
      end
      item
        Name = 'CorFUsoPosPago'
        DataType = ftInteger
      end
      item
        Name = 'CorAguardaPagto'
        DataType = ftInteger
      end
      item
        Name = 'CorFAguardaPagto'
        DataType = ftInteger
      end
      item
        Name = 'CorManutencao'
        DataType = ftInteger
      end
      item
        Name = 'CorFManutencao'
        DataType = ftInteger
      end
      item
        Name = 'CorPausado'
        DataType = ftInteger
      end
      item
        Name = 'CorFPausado'
        DataType = ftInteger
      end
      item
        Name = 'CorDesktop'
        DataType = ftInteger
      end
      item
        Name = 'CorFDesktop'
        DataType = ftInteger
      end
      item
        Name = 'CampoLocalizaCli'
        DataType = ftWord
      end
      item
        Name = 'ManterSaldoCaixa'
        DataType = ftBoolean
      end
      item
        Name = 'NaoMostrarMsgDebito'
        DataType = ftBoolean
      end
      item
        Name = 'Tolerancia'
        DataType = ftDateTime
      end
      item
        Name = 'RegImp98'
        DataType = ftBoolean
      end
      item
        Name = 'LimitePadraoDebito'
        DataType = ftCurrency
      end
      item
        Name = 'RecPorta'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RecSalto'
        DataType = ftWord
      end
      item
        Name = 'RecLargura'
        DataType = ftWord
      end
      item
        Name = 'RecRodape'
        DataType = ftMemo
      end
      item
        Name = 'RecImprimir'
        DataType = ftWord
      end
      item
        Name = 'RecMatricial'
        DataType = ftBoolean
      end
      item
        Name = 'RecNomeLoja'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'MostraProgAtual'
        DataType = ftBoolean
      end
      item
        Name = 'MostraObs'
        DataType = ftBoolean
      end
      item
        Name = 'EscondeTextoBotoes'
        DataType = ftBoolean
      end
      item
        Name = 'EscondeTipoAcesso'
        DataType = ftBoolean
      end
      item
        Name = 'ExigirRG'
        DataType = ftBoolean
      end
      item
        Name = 'TipoFDesktop'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TipoFLogin'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NumFDesktop'
        DataType = ftInteger
      end
      item
        Name = 'NumFLogin'
        DataType = ftInteger
      end
      item
        Name = 'MostrarApenasPIN'
        DataType = ftBoolean
      end
      item
        Name = 'TextoPIN'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'AlterarSenhaCli'
        DataType = ftBoolean
      end
      item
        Name = 'VerSenhaCli'
        DataType = ftBoolean
      end
      item
        Name = 'CliCadPadrao'
        DataType = ftBoolean
      end
      item
        Name = 'ControlaImp'
        DataType = ftWord
      end
      item
        Name = 'FiltrarWEB'
        DataType = ftBoolean
      end
      item
        Name = 'SiteRedirFiltro'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'BloqDownload'
        DataType = ftBoolean
      end
      item
        Name = 'BloqMenuIniciar'
        DataType = ftBoolean
      end
      item
        Name = 'BloqPainelCtrl'
        DataType = ftBoolean
      end
      item
        Name = 'BloqCtrlAltDel'
        DataType = ftBoolean
      end
      item
        Name = 'BloqExecutar'
        DataType = ftBoolean
      end
      item
        Name = 'BloqMeusLocaisRede'
        DataType = ftBoolean
      end
      item
        Name = 'PaginaInicial'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'EsconderCronometro'
        DataType = ftBoolean
      end
      item
        Name = 'AposEncerrar'
        DataType = ftWord
      end
      item
        Name = 'AlinhaBarraGuard'
        DataType = ftWord
      end
      item
        Name = 'NoNet'
        DataType = ftWord
      end
      item
        Name = 'TempoSumirLogin'
        DataType = ftWord
      end
      item
        Name = 'EmailMetodo'
        DataType = ftWord
      end
      item
        Name = 'EmailServ'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'EmailUsername'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'EmailSenha'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'EmailDestino'
        DataType = ftMemo
      end
      item
        Name = 'EmailEnviarCaixa'
        DataType = ftBoolean
      end
      item
        Name = 'CredPadraoTipo'
        DataType = ftWord
      end
      item
        Name = 'CredPadraoCod'
        DataType = ftInteger
      end
      item
        Name = 'PgVendas'
        DataType = ftBoolean
      end
      item
        Name = 'PgAcesso'
        DataType = ftBoolean
      end
      item
        Name = 'PgTempo'
        DataType = ftBoolean
      end
      item
        Name = 'PgImp'
        DataType = ftBoolean
      end
      item
        Name = 'EsconderDrives'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDTipoCred'
        DataType = ftInteger
      end
      item
        Name = 'MostraNomeMaq'
        DataType = ftBoolean
      end
      item
        Name = 'BloqBotaoDir'
        DataType = ftBoolean
      end
      item
        Name = 'PgVendaAvulsa'
        DataType = ftBoolean
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
    Left = 136
    Top = 456
    object MTCorPrevisao: TIntegerField
      FieldName = 'CorPrevisao'
    end
    object MTCorFPrevisao: TIntegerField
      FieldName = 'CorFPrevisao'
    end
    object MTRelCaixaAuto: TBooleanField
      FieldName = 'RelCaixaAuto'
    end
    object MTEncerramentoCartao: TWordField
      Alignment = taLeftJustify
      FieldName = 'EncerramentoCartao'
    end
    object MTTempoEPrePago: TWordField
      Alignment = taLeftJustify
      FieldName = 'TempoEPrePago'
    end
    object MTTempoECartao: TWordField
      Alignment = taLeftJustify
      FieldName = 'TempoECartao'
    end
    object MTCorMaqManut: TIntegerField
      FieldName = 'CorMaqManut'
    end
    object MTCorFMaqManut: TIntegerField
      FieldName = 'CorFMaqManut'
    end
    object MTSincronizarHorarios: TBooleanField
      FieldName = 'SincronizarHorarios'
    end
    object MTSalvarCodUsername: TBooleanField
      FieldName = 'SalvarCodUsername'
    end
    object MTOpcaoChat: TWordField
      Alignment = taLeftJustify
      FieldName = 'OpcaoChat'
    end
    object MTMinutosDesligaMaq: TWordField
      FieldName = 'MinutosDesligaMaq'
    end
    object MTBloquearUsoEmHorarioNP: TBooleanField
      FieldName = 'BloquearUsoEmHorarioNP'
    end
    object MTBloqTray: TBooleanField
      FieldName = 'BloqTray'
    end
    object MTTempoB1: TWordField
      FieldName = 'TempoB1'
    end
    object MTTempoB2: TWordField
      FieldName = 'TempoB2'
    end
    object MTTempoB3: TWordField
      FieldName = 'TempoB3'
    end
    object MTTempoB4: TWordField
      FieldName = 'TempoB4'
    end
    object MTTempoB5: TWordField
      FieldName = 'TempoB5'
    end
    object MTTempoB6: TWordField
      FieldName = 'TempoB6'
    end
    object MTNumSeq: TAutoIncField
      Alignment = taLeftJustify
      FieldName = 'NumSeq'
    end
    object MTFecharProgramas: TBooleanField
      FieldName = 'FecharProgramas'
    end
    object MTAutoExecutar: TStringField
      FieldName = 'AutoExecutar'
      Size = 200
    end
    object MTLimiteTempoPadrao: TDateTimeField
      FieldName = 'LimiteTempoPadrao'
    end
    object MTPacoteTempoReal: TBooleanField
      FieldName = 'PacoteTempoReal'
    end
    object MTPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object MTEncerramentoPrePago: TWordField
      Alignment = taLeftJustify
      FieldName = 'EncerramentoPrePago'
    end
    object MTPermiteCapturaTela: TBooleanField
      FieldName = 'PermiteCapturaTela'
    end
    object MTVariosTiposAcesso: TBooleanField
      FieldName = 'VariosTiposAcesso'
    end
    object MTModoPagtoAcesso: TWordField
      Alignment = taLeftJustify
      FieldName = 'ModoPagtoAcesso'
    end
    object MTMostraPrePagoDec: TBooleanField
      FieldName = 'MostraPrePagoDec'
    end
    object MTTempoMaxAlerta: TDateTimeField
      FieldName = 'TempoMaxAlerta'
    end
    object MTAbre1: TDateTimeField
      FieldName = 'Abre1'
    end
    object MTAbre2: TDateTimeField
      FieldName = 'Abre2'
    end
    object MTAbre3: TDateTimeField
      FieldName = 'Abre3'
    end
    object MTAbre4: TDateTimeField
      FieldName = 'Abre4'
    end
    object MTAbre5: TDateTimeField
      FieldName = 'Abre5'
    end
    object MTAbre6: TDateTimeField
      FieldName = 'Abre6'
    end
    object MTAbre7: TDateTimeField
      FieldName = 'Abre7'
    end
    object MTFecha1: TDateTimeField
      FieldName = 'Fecha1'
    end
    object MTFecha2: TDateTimeField
      FieldName = 'Fecha2'
    end
    object MTFecha3: TDateTimeField
      FieldName = 'Fecha3'
    end
    object MTFecha4: TDateTimeField
      FieldName = 'Fecha4'
    end
    object MTFecha5: TDateTimeField
      FieldName = 'Fecha5'
    end
    object MTFecha6: TDateTimeField
      FieldName = 'Fecha6'
    end
    object MTFecha7: TDateTimeField
      FieldName = 'Fecha7'
    end
    object MTCorLivre: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CorLivre'
    end
    object MTCorFLivre: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CorFLivre'
    end
    object MTCorUsoPrePago: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CorUsoPrePago'
    end
    object MTCorFUsoPrePago: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CorFUsoPrePago'
    end
    object MTCorUsoPosPago: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CorUsoPosPago'
    end
    object MTCorFUsoPosPago: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CorFUsoPosPago'
    end
    object MTCorAguardaPagto: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CorAguardaPagto'
    end
    object MTCorFAguardaPagto: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CorFAguardaPagto'
    end
    object MTCorManutencao: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CorManutencao'
    end
    object MTCorFManutencao: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CorFManutencao'
    end
    object MTCorPausado: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CorPausado'
    end
    object MTCorFPausado: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CorFPausado'
    end
    object MTCorDesktop: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CorDesktop'
    end
    object MTCorFDesktop: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CorFDesktop'
    end
    object MTCampoLocalizaCli: TWordField
      Alignment = taLeftJustify
      FieldName = 'CampoLocalizaCli'
    end
    object MTManterSaldoCaixa: TBooleanField
      FieldName = 'ManterSaldoCaixa'
    end
    object MTNaoMostrarMsgDebito: TBooleanField
      FieldName = 'NaoMostrarMsgDebito'
    end
    object MTTolerancia: TDateTimeField
      FieldName = 'Tolerancia'
    end
    object MTRegImp98: TBooleanField
      FieldName = 'RegImp98'
    end
    object MTLimitePadraoDebito: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'LimitePadraoDebito'
    end
    object MTRecPorta: TStringField
      FieldName = 'RecPorta'
      Size = 10
    end
    object MTRecSalto: TWordField
      Alignment = taLeftJustify
      FieldName = 'RecSalto'
    end
    object MTRecLargura: TWordField
      Alignment = taLeftJustify
      FieldName = 'RecLargura'
    end
    object MTRecRodape: TMemoField
      FieldName = 'RecRodape'
      BlobType = ftMemo
    end
    object MTRecImprimir: TWordField
      Alignment = taLeftJustify
      FieldName = 'RecImprimir'
    end
    object MTRecMatricial: TBooleanField
      FieldName = 'RecMatricial'
    end
    object MTRecNomeLoja: TStringField
      FieldName = 'RecNomeLoja'
      Size = 40
    end
    object MTMostraProgAtual: TBooleanField
      FieldName = 'MostraProgAtual'
    end
    object MTMostraObs: TBooleanField
      FieldName = 'MostraObs'
    end
    object MTEscondeTextoBotoes: TBooleanField
      FieldName = 'EscondeTextoBotoes'
    end
    object MTEscondeTipoAcesso: TBooleanField
      FieldName = 'EscondeTipoAcesso'
    end
    object MTExigirRG: TBooleanField
      FieldName = 'ExigirRG'
    end
    object MTTipoFDesktop: TStringField
      FieldName = 'TipoFDesktop'
      Size = 3
    end
    object MTTipoFLogin: TStringField
      FieldName = 'TipoFLogin'
      Size = 3
    end
    object MTNumFDesktop: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'NumFDesktop'
    end
    object MTNumFLogin: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'NumFLogin'
    end
    object MTMostrarApenasPIN: TBooleanField
      FieldName = 'MostrarApenasPIN'
    end
    object MTTextoPIN: TStringField
      FieldName = 'TextoPIN'
      Size = 30
    end
    object MTAlterarSenhaCli: TBooleanField
      FieldName = 'AlterarSenhaCli'
    end
    object MTVerSenhaCli: TBooleanField
      FieldName = 'VerSenhaCli'
    end
    object MTCliCadPadrao: TBooleanField
      FieldName = 'CliCadPadrao'
    end
    object MTControlaImp: TWordField
      Alignment = taLeftJustify
      FieldName = 'ControlaImp'
    end
    object MTFiltrarWEB: TBooleanField
      FieldName = 'FiltrarWEB'
    end
    object MTSiteRedirFiltro: TStringField
      FieldName = 'SiteRedirFiltro'
      Size = 80
    end
    object MTBloqDownload: TBooleanField
      FieldName = 'BloqDownload'
    end
    object MTBloqMenuIniciar: TBooleanField
      FieldName = 'BloqMenuIniciar'
    end
    object MTBloqPainelCtrl: TBooleanField
      FieldName = 'BloqPainelCtrl'
    end
    object MTBloqCtrlAltDel: TBooleanField
      FieldName = 'BloqCtrlAltDel'
    end
    object MTBloqExecutar: TBooleanField
      FieldName = 'BloqExecutar'
    end
    object s: TBooleanField
      FieldName = 'BloqMeusLocaisRede'
    end
    object MTPaginaInicial: TStringField
      FieldName = 'PaginaInicial'
      Size = 200
    end
    object sal: TBooleanField
      FieldName = 'EsconderCronometro'
    end
    object MTAposEncerrar: TWordField
      Alignment = taLeftJustify
      FieldName = 'AposEncerrar'
    end
    object MTAlinhaBarraGuard: TWordField
      Alignment = taLeftJustify
      FieldName = 'AlinhaBarraGuard'
    end
    object MTNoNet: TWordField
      Alignment = taLeftJustify
      FieldName = 'NoNet'
    end
    object MTTempoSumirLogin: TWordField
      Alignment = taLeftJustify
      FieldName = 'TempoSumirLogin'
    end
    object MTEmailMetodo: TWordField
      Alignment = taLeftJustify
      FieldName = 'EmailMetodo'
    end
    object MTEmailServ: TStringField
      FieldName = 'EmailServ'
      Size = 50
    end
    object MTEmailUsername: TStringField
      FieldName = 'EmailUsername'
      Size = 50
    end
    object MTEmailSenha: TStringField
      FieldName = 'EmailSenha'
      Size = 50
    end
    object MTEmailDestino: TMemoField
      FieldName = 'EmailDestino'
      BlobType = ftMemo
    end
    object MTEmailEnviarCaixa: TBooleanField
      FieldName = 'EmailEnviarCaixa'
    end
    object MTCredPadraoTipo: TWordField
      FieldName = 'CredPadraoTipo'
    end
    object MTCredPadraoCod: TIntegerField
      FieldName = 'CredPadraoCod'
    end
    object MTPgVendas: TBooleanField
      FieldName = 'PgVendas'
    end
    object MTPgAcesso: TBooleanField
      FieldName = 'PgAcesso'
    end
    object MTPgTempo: TBooleanField
      FieldName = 'PgTempo'
    end
    object MTContinuarCredTempo: TBooleanField
      FieldName = 'ContinuarCredTempo'
    end
    object MTNaoGuardarCreditoCli: TBooleanField
      FieldName = 'NaoGuardarCreditoCli'
    end
    object MTPgImp: TBooleanField
      FieldName = 'PgImp'
    end
    object MTEsconderDrives: TStringField
      FieldName = 'EsconderDrives'
      Size = 30
    end
    object MTIDTipoCred: TIntegerField
      FieldName = 'IDTipoCred'
    end
    object MTNomeTipoCred: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTipoCred'
      LookupDataSet = tTT
      LookupKeyFields = 'ID'
      LookupResultField = 'Descr'
      KeyFields = 'IDTipoCred'
      Size = 50
      Lookup = True
    end
    object MTMostraNomeMaq: TBooleanField
      FieldName = 'MostraNomeMaq'
    end
    object MTBloqBotaoDir: TBooleanField
      FieldName = 'BloqBotaoDir'
    end
    object MTPgVendaAvulsa: TBooleanField
      FieldName = 'PgVendaAvulsa'
    end
    object MTAlteraLoginSemCred: TBooleanField
      FieldName = 'AlteraLoginSemCred'
    end
    object MTNaoCobrarImpFunc: TBooleanField
      FieldName = 'NaoCobrarImpFunc'
    end
  end
  object DS: TDataSource
    DataSet = MT
    OnDataChange = DSDataChange
    Left = 136
    Top = 488
  end
  object LMDHint1: TLMDHint
    Bevel.StyleOuter = bvLowered
    Bevel.Mode = bmCustom
    Font.Charset = ANSI_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 32
    Top = 296
  end
  object t: TcxGridPopupMenu
    PopupMenus = <>
    Left = 72
    Top = 208
  end
  object FM: TFormManager
    BarMgr = BarMgr
    PageControl = PagAviso
    Left = 336
    Top = 264
  end
  object tTT: TkbmMemTable
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
    Left = 136
    Top = 264
    object tTTDescr: TStringField
      FieldName = 'Descr'
    end
    object tTTTipo: TSmallintField
      FieldName = 'Tipo'
    end
    object tTTCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tTTMinutos: TIntegerField
      FieldName = 'Minutos'
    end
    object tTTValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tTTTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tTTID: TAutoIncField
      FieldName = 'ID'
    end
  end
  object FM2: TFormManager
    BarMgr = BarMgr
    PageControl = pagPatro
    Left = 336
    Top = 320
  end
end
