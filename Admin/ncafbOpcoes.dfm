inherited fbOpcoes: TfbOpcoes
  Left = 91
  Top = 160
  Caption = 'Op'#231#245'es'
  ClientHeight = 780
  ClientWidth = 618
  OldCreateOrder = True
  ShowHint = True
  ExplicitWidth = 626
  ExplicitHeight = 807
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    Width = 618
    Height = 780
    ExplicitWidth = 618
    ExplicitHeight = 780
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 618
      Height = 36
      ExplicitWidth = 618
      ExplicitHeight = 36
    end
    object nbOpcoes: TdxNavBar
      Left = 0
      Top = 36
      Width = 618
      Height = 744
      Align = alClient
      ActiveGroupIndex = 0
      TabOrder = 1
      View = 18
      ViewStyle.ColorSchemeName = 'Black'
      object nbOpcoesGroup1: TdxNavBarGroup
        Caption = 'A.  Geral'
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        OptionsGroupControl.AllowControlResizing = True
        OptionsGroupControl.ShowControl = True
        OptionsGroupControl.UseControl = True
        Links = <>
      end
      object nbgMaqCli: TdxNavBarGroup
        Caption = 'B.  M'#225'quinas Clientes'
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        OptionsGroupControl.AllowControlResizing = True
        OptionsGroupControl.ShowControl = True
        OptionsGroupControl.UseControl = True
        OptionsExpansion.Expanded = False
        Links = <>
      end
      object nbgRestrWindows: TdxNavBarGroup
        Caption = 'C.  Restri'#231#245'es do Windows'
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        OptionsGroupControl.AllowControlResizing = True
        OptionsGroupControl.ShowControl = True
        OptionsGroupControl.UseControl = True
        OptionsExpansion.Expanded = False
        Links = <>
      end
      object nbgRecibos: TdxNavBarGroup
        Caption = 'D.  Recibos'
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        OptionsGroupControl.AllowControlResizing = True
        OptionsGroupControl.ShowControl = True
        OptionsGroupControl.UseControl = True
        OptionsExpansion.Expanded = False
        Links = <>
      end
      object nbgTarifacao: TdxNavBarGroup
        Caption = 'E.  Tarifa'#231#227'o'
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        OptionsGroupControl.AllowControlResizing = True
        OptionsGroupControl.ShowControl = True
        OptionsGroupControl.UseControl = True
        OptionsExpansion.Expanded = False
        Links = <>
      end
      object nbgAvisoFimTempo: TdxNavBarGroup
        Caption = 'F.  Avisos de Fim de Tempo'
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        OptionsGroupControl.AllowControlResizing = True
        OptionsGroupControl.ShowControl = True
        OptionsGroupControl.UseControl = True
        OptionsExpansion.Expanded = False
        Links = <>
      end
      object nbgCores: TdxNavBarGroup
        Caption = 'G.  Cores'
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        OptionsGroupControl.AllowControlResizing = True
        OptionsGroupControl.ShowControl = True
        OptionsGroupControl.UseControl = True
        OptionsExpansion.Expanded = False
        Links = <>
      end
      object nbgCaixa: TdxNavBarGroup
        Caption = 'H.  Caixa'
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        OptionsGroupControl.AllowControlResizing = True
        OptionsGroupControl.ShowControl = True
        OptionsGroupControl.UseControl = True
        OptionsExpansion.Expanded = False
        Links = <>
      end
      object nbgFidelidade: TdxNavBarGroup
        Caption = 'I.  Fidelidade - Premia'#231#227'o de Clientes por Ac'#250'mulo de Pontos'
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        OptionsGroupControl.AllowControlResizing = True
        OptionsGroupControl.ShowControl = True
        OptionsGroupControl.UseControl = True
        OptionsExpansion.Expanded = False
        Links = <>
      end
      object nbgPub: TdxNavBarGroup
        Caption = 'J.  Publicidade'
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        Visible = False
        OptionsGroupControl.AllowControlResizing = True
        OptionsGroupControl.ShowControl = True
        OptionsGroupControl.UseControl = True
        OptionsExpansion.Expanded = False
        Links = <>
      end
      object nbgImp: TdxNavBarGroup
        Caption = 'L.  Impress'#245'es'
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        Visible = False
        OptionsGroupControl.AllowControlResizing = True
        OptionsGroupControl.ShowControl = True
        OptionsGroupControl.UseControl = True
        Links = <>
      end
      object nbgFundo: TdxNavBarGroup
        Caption = 'L.  Fundo de tela  e  Posi'#231#227'o de Login'
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        OptionsGroupControl.AllowControlResizing = True
        OptionsGroupControl.ShowControl = True
        OptionsGroupControl.UseControl = True
        OptionsExpansion.Expanded = False
        Links = <>
      end
      object nbgPatro: TdxNavBarGroup
        Caption = 'N.  Patrocinadores de Acesso Gr'#225'tis'
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        Visible = False
        OptionsGroupControl.ShowControl = True
        OptionsGroupControl.UseControl = True
        Links = <>
      end
      object nbgMeiosPagamento: TdxNavBarGroup
        Caption = 'M. Meios de Pagamento'
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        OptionsGroupControl.AllowControlResizing = True
        OptionsGroupControl.ShowControl = True
        OptionsGroupControl.UseControl = True
        Links = <>
      end
      object nbOpcoesItem1: TdxNavBarItem
        Caption = 'Geral'
      end
      object nbgGeralControl: TdxNavBarGroupControl
        Left = 0
        Top = 19
        Width = 602
        Height = 660
        Caption = 'nbgGeralControl'
        TabOrder = 0
        GroupIndex = 0
        OriginalHeight = 660
        object panGeral: TLMDSimplePanel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 589
          Height = 620
          Margins.Left = 10
          Margins.Top = 10
          Margins.Bottom = 30
          Align = alClient
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          TabOrder = 0
          object edCliCadPadrao: TcxDBImageComboBox
            Left = 254
            Top = 7
            DataBinding.DataField = 'CliCadPadrao'
            DataBinding.DataSource = DS
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Items = <
              item
                Description = 'Cliente SEM cadastro'
                ImageIndex = 0
                Value = False
              end
              item
                Description = 'Cliente COM cadastro'
                Value = True
              end>
            Properties.OnEditValueChanged = edCliCadPadraoPropertiesEditValueChanged
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            Width = 141
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
          object LabelLocalizarPor: TcxLabel
            Left = 11
            Top = 80
            Caption = '3. Campo padr'#227'o para localiza'#231#227'o de clientes'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            Transparent = True
          end
          object edCampoLocalizaCli: TcxDBImageComboBox
            Left = 254
            Top = 78
            DataBinding.DataField = 'CampoLocalizaCli'
            DataBinding.DataSource = DS
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
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.BorderStyle = ebsFlat
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 6
            Width = 141
          end
          object cxLabel17: TcxLabel
            Left = 11
            Top = 109
            Caption = '4. Valor padr'#227'o para limite de d'#233'bito dos clientes'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            Transparent = True
          end
          object edLimiteDeb: TcxDBCurrencyEdit
            Left = 254
            Top = 107
            DataBinding.DataField = 'LimitePadraoDebito'
            DataBinding.DataSource = DS
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 8
            Width = 141
          end
          object cxDBCheckBox8: TcxDBCheckBox
            Left = 397
            Top = 101
            Caption = '4.1 Bloquear login se ultrapassar limite'
            DataBinding.DataField = 'BloquearLoginAlemMaxDeb'
            DataBinding.DataSource = DS
            Properties.ImmediatePost = True
            Properties.MultiLine = True
            Properties.NullStyle = nssUnchecked
            Style.BorderStyle = ebsFlat
            TabOrder = 9
            Width = 121
          end
          object edPermitirCaptura: TcxDBCheckBox
            Left = 6
            Top = 136
            Caption = 
              '5. Permitir Captura de Tela  das m'#225'quinas clientes atrav'#233's do Ne' +
              'xAdmin'
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
            TabOrder = 10
            Width = 377
          end
          object edNaoMostrarDeb: TcxDBCheckBox
            Left = 6
            Top = 157
            Caption = '6. N'#227'o mostrar mensagem de d'#233'bito de cliente'
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
            TabOrder = 11
            Width = 297
          end
          object edMonitorarSite: TcxDBCheckBox
            Left = 6
            Top = 178
            Caption = '7. Monitorar o programa/site que o cliente est'#225' acessando'
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
            TabOrder = 12
            Width = 297
          end
          object edMostrarObs: TcxDBCheckBox
            Left = 6
            Top = 200
            Caption = 
              '8. Mostrar Observa'#231#245'es dos Acessos na tela de m'#225'quinas do NexAdm' +
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
            TabOrder = 13
            Width = 403
          end
          object edExigirRG: TcxDBCheckBox
            Left = 6
            Top = 221
            Caption = '9. Exigir RG para Login de clientes cadastrados'
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
            TabOrder = 14
            Width = 329
          end
          object edAlteraSenhaCli: TcxDBCheckBox
            Left = 6
            Top = 242
            Caption = 
              '10. Permitir altera'#231#227'o da senha do cliente diretamente na tela d' +
              'e cadastro'
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
            TabOrder = 15
            Width = 393
          end
          object edMostrarSenhaCli: TcxDBCheckBox
            Left = 6
            Top = 264
            Caption = 
              '11. Permitir visualiza'#231#227'o da senha do cliente na tela de cadastr' +
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
            TabOrder = 16
            Width = 385
          end
          object cxDBCheckBox4: TcxDBCheckBox
            Left = 6
            Top = 285
            Caption = 
              '12. Quando incluir novo cliente salvar o c'#243'digo do cliente no us' +
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
            TabOrder = 17
            Width = 403
          end
          object cbMostraNomeMaq: TcxDBCheckBox
            Left = 6
            Top = 306
            Caption = 
              '13. Mostrar nome alternativo da m'#225'quina na tela de m'#225'quinas do N' +
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
            TabOrder = 18
            Width = 403
          end
          object cxDBCheckBox9: TcxDBCheckBox
            Left = 6
            Top = 327
            Caption = '14. N'#227'o obrigar cria'#231#227'o de senha de acesso para os clientes'
            DataBinding.DataField = 'NaoObrigarSenhaCliente'
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
            TabOrder = 19
            Width = 451
          end
          object edNaoVenderAlemEstoque: TcxDBCheckBox
            Left = 6
            Top = 348
            Caption = 
              '15. N'#227'o permitir venda de produtos que n'#227'o tenham saldo suficien' +
              'te em estoque'
            DataBinding.DataField = 'NaoVenderAlemEstoque'
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
            TabOrder = 20
            Width = 451
          end
          object cxDBCheckBox13: TcxDBCheckBox
            Left = 6
            Top = 367
            Caption = 
              '16. Permitir a ordena'#231#227'o dos dados de caixa por qualquer coluna ' +
              'ao clicar no cabe'#231'alho.'#13#10'      (N'#227'o '#233' recomend'#225'vel para computad' +
              'ores com pouca mem'#243'ria RAM)'
            DataBinding.DataField = 'AutoSortGridCaixa'
            DataBinding.DataSource = DS
            Properties.ImmediatePost = True
            Properties.MultiLine = True
            Properties.NullStyle = nssUnchecked
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 21
            Width = 491
          end
          object edAvisoFimTempoS: TcxDBSpinEdit
            Left = 414
            Top = 402
            DataBinding.DataField = 'AvisoFimTempoAdminS'
            DataBinding.DataSource = DS
            Properties.ImmediatePost = True
            Properties.Increment = 5.000000000000000000
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 22
            Width = 67
          end
          object cxLabel31: TcxLabel
            Left = 31
            Top = 419
            Caption = '(para configurar avisos para o cliente use a op'#231#227'o F.)'
            Transparent = True
          end
          object cxLabel35: TcxLabel
            Left = 11
            Top = 403
            Caption = 
              '17. Tempo (em segundos) para repetir aviso sonoro de fim de temp' +
              'o no NexAdmin'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            Transparent = True
          end
          object cxDBCheckBox17: TcxDBCheckBox
            Left = 6
            Top = 442
            Caption = '18. Tocar aviso sonoro ao receber mensagem de CHAT no NexAdmin'
            DataBinding.DataField = 'ChatAlertaSonoro'
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
            TabOrder = 25
            Width = 451
          end
          object cxDBCheckBox18: TcxDBCheckBox
            Left = 6
            Top = 465
            Caption = 
              '19. Mostrar notifica'#231#227'o ao receber mensagem de CHAT (semelhante ' +
              'ao MSN Messenger)'
            DataBinding.DataField = 'ChatMostraNotificacao'
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
            TabOrder = 26
            Width = 451
          end
          object edBiometria: TcxDBCheckBox
            Left = 3
            Top = 593
            Caption = '24. Usar leitor biom'#233'trico para identificar clientes'
            DataBinding.DataField = 'Biometria'
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
            TabOrder = 30
            Width = 267
          end
          object cbBloqueiaCliAvulso: TcxDBCheckBox
            Left = 398
            Top = 2
            AutoSize = False
            Caption = '1.1 N'#227'o permitir acesso de cliente SEM cadastro'
            DataBinding.DataField = 'BloqueiaCliAvulso'
            DataBinding.DataSource = DS
            Properties.ImmediatePost = True
            Properties.MultiLine = True
            Properties.NullStyle = nssUnchecked
            Style.BorderStyle = ebsFlat
            TabOrder = 1
            Height = 33
            Width = 163
          end
          object edDadosMin: TcxDBCheckComboBox
            Left = 26
            Top = 51
            DataBinding.DataField = 'DadosMinimos'
            DataBinding.DataSource = DS
            Properties.EmptySelectionText = 'Selecione os campos m'#237'nimos necess'#225'rios'
            Properties.EditValueFormat = cvfIndices
            Properties.ImmediateDropDownWhenActivated = True
            Properties.ImmediatePost = True
            Properties.Items = <>
            Style.BorderStyle = ebsFlat
            TabOrder = 3
            Text = 'Selecione os campos m'#237'nimos necess'#225'rios'
            Width = 369
          end
          object cxLabel56: TcxLabel
            Left = 11
            Top = 492
            Caption = '20. Cidade padr'#227'o ao cadastrar novo cliente:'
          end
          object cxLabel57: TcxLabel
            Left = 11
            Top = 519
            Caption = '21. Estado padr'#227'o ao cadastrar novo cliente:'
          end
          object edCidadePadrao: TcxDBTextEdit
            Left = 240
            Top = 492
            DataBinding.DataField = 'CidadePadrao'
            DataBinding.DataSource = DS
            Style.BorderStyle = ebsFlat
            TabOrder = 27
            Width = 217
          end
          object edUFPadrao: TcxDBTextEdit
            Left = 240
            Top = 519
            DataBinding.DataField = 'UFPadrao'
            DataBinding.DataSource = DS
            Style.BorderStyle = ebsFlat
            TabOrder = 28
            Width = 52
          end
          object cbExigeDadosMin: TcxDBCheckBox
            Left = 6
            Top = 31
            Caption = '2. S'#243' liberar acesso se preencher dados cadastrais m'#237'nimos'
            DataBinding.DataField = 'ExigeDadosMinimos'
            DataBinding.DataSource = DS
            Properties.NullStyle = nssUnchecked
            Properties.OnEditValueChanged = cbExigeDadosMinPropertiesEditValueChanged
            Style.BorderStyle = ebsFlat
            TabOrder = 2
            Width = 339
          end
          object edCamposCliCC: TcxPopupEdit
            Left = 360
            Top = 542
            Properties.PopupAutoSize = False
            Properties.PopupHeight = 400
            Properties.PopupWidth = 431
            Properties.OnCloseUp = edCamposCliCCPropertiesCloseUp
            Properties.OnInitPopup = edCamposCliCCPropertiesInitPopup
            Style.BorderStyle = ebsFlat
            TabOrder = 33
            Text = 'Clique para configurar'
            Width = 130
          end
          object cxLabel61: TcxLabel
            Left = 11
            Top = 544
            Caption = 
              '22. Padronizar digita'#231#227'o de dados dos clientes (MAI'#218'SCULA/min'#250'sc' +
              'ula)'
          end
          object edNaoTransferirMaq: TcxDBCheckBox
            Left = 3
            Top = 566
            Caption = '23. N'#227'o permitir transferir acesso para outra m'#225'quina'
            DataBinding.DataField = 'NaoTransferirMaq'
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
            TabOrder = 29
            Width = 332
          end
        end
      end
      object nbgMaqCliControl: TdxNavBarGroupControl
        Left = 0
        Top = 38
        Width = 602
        Height = 496
        TabOrder = 1
        GroupIndex = 1
        OriginalHeight = 496
        object LMDScrollBox6: TLMDScrollBox
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 589
          Height = 456
          Margins.Left = 10
          Margins.Top = 10
          Margins.Bottom = 30
          Align = alClient
          TabOrder = 0
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          object edAutoLigarMaqCli: TcxDBCheckBox
            Left = 8
            Top = 413
            Caption = 
              '17. Ligar m'#225'quina cliente automaticamente ao iniciar acesso ('#201' n' +
              'ecess'#225'rio que a m'#225'quina possua recurso de Wake On Lan)'
            DataBinding.DataField = 'AutoLigarMaqCli'
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
            Width = 625
          end
          object edSemLogin: TcxDBCheckBox
            Left = 8
            Top = 393
            Caption = '16. N'#227'o permitir login na m'#225'quina cliente'
            DataBinding.DataField = 'SemLogin'
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
            Width = 229
          end
          object edCliCadNaoEncerra: TcxDBCheckBox
            Left = 8
            Top = 373
            Caption = 
              '15. Bloquear o encerramento de acesso de cliente cadastrado dire' +
              'tamente na m'#225'quina cliente'
            DataBinding.DataField = 'CliCadNaoEncerra'
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
            Width = 489
          end
          object cxDBCheckBox12: TcxDBCheckBox
            Left = 8
            Top = 354
            Caption = 
              '14. Bloquear o encerramento de acesso de cliente avulso diretame' +
              'nte na m'#225'quina cliente'
            DataBinding.DataField = 'CliAvulsoNaoEncerra'
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
            Width = 497
          end
          object cxDBCheckBox11: TcxDBCheckBox
            Left = 8
            Top = 334
            Caption = '13. Mostrar valor de d'#233'bitos na m'#225'quina cliente'
            DataBinding.DataField = 'MostrarDebitoNoGuard'
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
            Width = 315
          end
          object cxDBCheckBox10: TcxDBCheckBox
            Left = 8
            Top = 314
            Caption = 
              '12. N'#227'o permitir que o cliente altere a senha diretamente nas m'#225 +
              'quinas clientes'
            DataBinding.DataField = 'ClienteNaoAlteraSenha'
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
            Width = 419
          end
          object edChat: TcxDBImageComboBox
            Left = 190
            Top = 292
            DataBinding.DataField = 'OpcaoChat'
            DataBinding.DataSource = DS
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
            TabOrder = 6
            Width = 267
          end
          object lbChat: TcxLabel
            Left = 8
            Top = 292
            Caption = '11. Chat entre atendente e clientes'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            Transparent = True
          end
          object cxLabel34: TcxLabel
            Left = 400
            Top = 270
            Caption = ' minutos. Deixe ZERO para desativar esse recurso'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            Transparent = True
          end
          object edMinutosDesligarMaq: TcxDBSpinEdit
            Left = 333
            Top = 268
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
            TabOrder = 9
            Width = 64
          end
          object cxLabel33: TcxLabel
            Left = 8
            Top = 269
            Caption = '10. Desligar automaticamente m'#225'quinas que n'#227'o forem usadas por '
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            Transparent = True
          end
          object edEsconderSenha: TcxDBCheckBox
            Left = 7
            Top = 241
            Caption = 
              '9. N'#227'o mostrar SENHA na tela de login de clientes ('#250'til para loc' +
              'ais que tem apenas acesso por cart'#227'o de tempo)'
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
            TabOrder = 11
            Transparent = True
            Width = 582
          end
          object edFecharProg: TcxDBCheckBox
            Left = 7
            Top = 218
            Caption = '8. Fechar programas ao finalizar acesso'
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
            TabOrder = 12
            Transparent = True
            Width = 230
          end
          object edEsconderCrono: TcxDBCheckBox
            Left = 7
            Top = 195
            Caption = '7. N'#227'o mostrar cron'#244'metro para os clientes'
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
            TabOrder = 13
            Transparent = True
            Width = 262
          end
          object edNomeUsuario: TcxDBTextEdit
            Left = 333
            Top = 169
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
            TabOrder = 14
            Width = 186
          end
          object cxLabel13: TcxLabel
            Left = 10
            Top = 170
            Caption = '6. Texto para o campo NOME DE USU'#193'RIO na tela de login'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            Transparent = True
          end
          object edAutoExec: TcxDBTextEdit
            Left = 333
            Top = 140
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
            TabOrder = 16
            Width = 186
          end
          object cxLabel12: TcxLabel
            Left = 10
            Top = 141
            Caption = '5. Programa a ser executado automaticamente no inicio do acesso'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            Transparent = True
          end
          object edPaginaInicial: TcxDBTextEdit
            Left = 261
            Top = 111
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
            TabOrder = 18
            Width = 186
          end
          object cxLabel11: TcxLabel
            Left = 10
            Top = 112
            Caption = '4. Paginial Inicial de Internet nas m'#225'quinas clientes'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            Transparent = True
          end
          object edTempoEscondeLogin: TcxDBSpinEdit
            Left = 261
            Top = 83
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
            TabOrder = 20
            Width = 98
          end
          object cxLabel10: TcxLabel
            Left = 10
            Top = 84
            Caption = '3. Tempo (segundos) para esconder a tela de login'
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            Transparent = True
          end
          object edAposFinalizar: TcxDBImageComboBox
            Left = 261
            Top = 54
            DataBinding.DataField = 'AposEncerrar'
            DataBinding.DataSource = DS
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
            TabOrder = 22
            Width = 187
          end
          object cxLabel9: TcxLabel
            Left = 10
            Top = 56
            Caption = '2. O que fazer ap'#243's finalizar acesso '
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            Transparent = True
          end
          object cxLabel8: TcxLabel
            Left = 18
            Top = 506
            Caption = '2. Alinhamento da barra de cron'#244'metro '
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            Transparent = True
            Visible = False
          end
          object edNoNet: TcxDBImageComboBox
            Left = 10
            Top = 25
            DataBinding.DataField = 'NoNet'
            DataBinding.DataSource = DS
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
              end>
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 25
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
          object cxLabel14: TcxLabel
            Left = 361
            Top = 85
            Caption = 'M'#237'nimo de 10s (menos que isso n'#227'o esconde)'
            Transparent = True
          end
          object cxDBCheckBox7: TcxDBCheckBox
            Left = 8
            Top = 433
            Caption = 
              '18. Utilizo sistema de restaura'#231#227'o autom'#225'tica (ou congelamento) ' +
              'de Windows nas m'#225'quinas clientes'
            DataBinding.DataField = 'CliCongelado'
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
            TabOrder = 28
            Width = 625
          end
        end
      end
      object nbgRestrWindowsControl: TdxNavBarGroupControl
        Left = 0
        Top = 57
        Width = 846
        Height = 560
        TabOrder = 5
        GroupIndex = 2
        OriginalHeight = 560
        object clbDrives: TcxCheckListBox
          Left = 29
          Top = 404
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
          TabOrder = 18
          OnClickCheck = clbDrivesClickCheck
        end
        object cxLabel6: TcxLabel
          Left = 241
          Top = 385
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
        object cxLabel5: TcxLabel
          Left = 198
          Top = 385
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
        object cxLabel4: TcxLabel
          Left = 29
          Top = 385
          Caption = '&15. Bloquear acessos aos drives: '
        end
        object edBloqLixeira: TcxDBCheckBox
          Left = 25
          Top = 303
          Caption = '&12. Remover '#237'cone "Lixeira" da '#225'rea de trabalho'
          DataBinding.DataField = 'BloqLixeira'
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
          TabOrder = 12
          Width = 371
        end
        object edBloqMeuComputador: TcxDBCheckBox
          Left = 25
          Top = 279
          Caption = '&11. Remover '#237'cone "Meu Computador" da '#225'rea de trabalho'
          DataBinding.DataField = 'BloqMeuComputador'
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
        object edBloqBotaoDir: TcxDBCheckBox
          Left = 25
          Top = 229
          Caption = '&9. Bloquear bot'#227'o direito do mouse'
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
          TabOrder = 9
          Width = 371
        end
        object cbBloqDownloadExe: TcxDBCheckBox
          Left = 25
          Top = 204
          Caption = 
            '&8. Bloquear DOWNLOADS de Programas (Internet Explorer e Firefox' +
            ')'
          DataBinding.DataField = 'BloqDownloadExe'
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
          Width = 371
        end
        object edBloqDownloads: TcxDBCheckBox
          Left = 25
          Top = 179
          Caption = '&7. Bloquear DOWNLOADS (Somente Internet Explorer)'
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
          TabOrder = 7
          Width = 371
        end
        object edBloqMeusLocaisRede: TcxDBCheckBox
          Left = 25
          Top = 153
          Caption = '&6. Remover '#237'cone "Meus Locais de Rede"'
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
          TabOrder = 6
          Width = 232
        end
        object edBloqExecutar: TcxDBCheckBox
          Left = 25
          Top = 127
          Caption = '&5. Bloquear acesso ao comando EXECUTAR'
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
          TabOrder = 5
          Width = 361
        end
        object edBloqCtrlAltDel: TcxDBCheckBox
          Left = 25
          Top = 101
          Caption = '&4. Bloquear acesso ao CTRL-ALT-DEL'
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
          TabOrder = 4
          Width = 361
        end
        object edBloqPainelCtrl: TcxDBCheckBox
          Left = 25
          Top = 75
          Caption = '&3. Bloquear acesso ao PAINEL DE CONTROLE'
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
          TabOrder = 3
          Width = 361
        end
        object cbFiltrarDesktop: TcxDBCheckBox
          Left = 25
          Top = 49
          Caption = '&2. Filtrar itens da '#193'REA DE TRABALHO'
          DataBinding.DataField = 'FiltrarDesktop'
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
          Width = 232
        end
        object cbFiltrarMenuIniciar: TcxDBCheckBox
          Left = 233
          Top = 22
          Caption = 
            'Filtrar itens do menu iniciar (somente nas m'#225'quinas clientes com' +
            ' Windows XP)'
          DataBinding.DataField = 'FiltrarMenuIniciar'
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
          Width = 408
        end
        object edBloqMenuIniciar: TcxDBCheckBox
          Left = 25
          Top = 23
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
          TabOrder = 0
          Width = 214
        end
        object edBloqMeusDocs: TcxDBCheckBox
          Left = 25
          Top = 329
          Caption = '&13. Remover '#237'cone "Meus Documentos" da '#225'rea de trabalho'
          DataBinding.DataField = 'BloqMeusDocumentos'
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
          Width = 325
        end
        object edClassicStartMenu: TcxDBImageComboBox
          Left = 189
          Top = 355
          DataBinding.DataField = 'ClassicStartMenu'
          DataBinding.DataSource = DS
          Properties.Items = <
            item
              Description = 'Novo menu do Windows XP/Vista/7'
              ImageIndex = 0
              Value = False
            end
            item
              Description = 'Estilo cl'#225'ssico/antigo do Windows'
              Value = True
            end>
          Style.BorderStyle = ebsFlat
          TabOrder = 14
          Width = 268
        end
        object cxLabel55: TcxLabel
          Left = 29
          Top = 355
          Caption = '14. Estilo visual do menu iniciar'
        end
        object edBloqToolbars: TcxDBCheckBox
          Left = 25
          Top = 254
          Caption = '&10. Bloquear barra de atalhos da barra de tarefas do Windows'
          DataBinding.DataField = 'BloqToolbars'
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
          Width = 371
        end
      end
      object nbgRecibosControl: TdxNavBarGroupControl
        Left = 0
        Top = 76
        Width = 618
        Height = 412
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        GroupIndex = 3
        OriginalHeight = 412
      end
      object nbgTarifacaoControl: TdxNavBarGroupControl
        Left = 0
        Top = -74
        Width = 601
        Height = 700
        TabOrder = 7
        GroupIndex = 4
        OriginalHeight = 700
        object LMDScrollBox1: TLMDScrollBox
          Left = 0
          Top = 0
          Width = 601
          Height = 700
          Align = alClient
          TabOrder = 0
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          object edLoginSemCred: TcxDBCheckBox
            Left = 17
            Top = 22
            Caption = '&1. Clientes podem se logar mesmo sem ter cr'#233'dito (em p'#243's pago)'
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
            TabOrder = 0
            Width = 341
          end
          object edAlteraLoginSemCred: TcxDBCheckBox
            Left = 359
            Top = 18
            Caption = '1.1 Essa op'#231#227'o pode ser alterada'#13#10'no cadastro de cada cliente'
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
            TabOrder = 1
            Width = 164
          end
          object edCronoDec: TcxDBCheckBox
            Left = 17
            Top = 49
            Caption = '&2. Cron'#244'metro decrescente para sess'#245'es com pagamento antecipado'
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
            TabOrder = 2
            Width = 361
          end
          object edEscodeTipoAcesso: TcxDBCheckBox
            Left = 17
            Top = 77
            Caption = 
              '&3. N'#227'o permitir que o cliente selecione o Grupo de Tarifas na m' +
              #225'quina cliente'
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
            TabOrder = 3
            Width = 409
          end
          object cxLabel3: TcxLabel
            Left = 21
            Top = 105
            Caption = '&4. Tempo M'#225'ximo de Toler'#226'ncia em acessos p'#243's-pagos'
          end
          object edTolerancia: TcxDBTimeEdit
            Left = 289
            Top = 103
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
            TabOrder = 5
            Width = 83
          end
          object edFimPrePago: TcxDBImageComboBox
            Left = 290
            Top = 130
            DataBinding.DataField = 'EncerramentoPrePago'
            DataBinding.DataSource = DS
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
            TabOrder = 6
            Width = 113
          end
          object edTempoEPrePago: TcxDBSpinEdit
            Left = 290
            Top = 156
            DataBinding.DataField = 'TempoEPrePago'
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
            Width = 113
          end
          object edEncerramentoCartao: TcxDBImageComboBox
            Left = 290
            Top = 184
            DataBinding.DataField = 'EncerramentoCartao'
            DataBinding.DataSource = DS
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
            TabOrder = 8
            Width = 113
          end
          object edTempoECartao: TcxDBSpinEdit
            Left = 290
            Top = 210
            DataBinding.DataField = 'TempoECartao'
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
            TabOrder = 9
            Width = 113
          end
          object lbTempoECartao: TcxLabel
            Left = 131
            Top = 211
            Caption = '6.1 Tempo para Encerrar (seg)'
          end
          object cxLabel36: TcxLabel
            Left = 21
            Top = 185
            Caption = '6. O que fazer ao acabar cr'#233'dito de cart'#227'o de tempo'
          end
          object lbTempoEPrePago: TcxLabel
            Left = 135
            Top = 157
            Caption = '5.1 Tempo para Encerrar (seg)'
          end
          object cxLabel7: TcxLabel
            Left = 21
            Top = 131
            Caption = '5. O que fazer ao encerrar tempo de acesso pr'#233'-pago'
          end
          object cxDBCheckBox3: TcxDBCheckBox
            Left = 19
            Top = 237
            Caption = '&7. For'#231'ar cumprimento dos hor'#225'rios permitidos a cada cliente'
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
            TabOrder = 14
            Width = 384
          end
          object cxDBCheckBox5: TcxDBCheckBox
            Left = 19
            Top = 259
            Caption = '8. Valor m'#237'nimo apenas no inicio do acesso'
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
            TabOrder = 15
            Width = 460
          end
          object cxDBCheckBox6: TcxDBCheckBox
            Left = 19
            Top = 280
            Caption = 
              '9. N'#227'o guardar cr'#233'dito de tempo restante na conta do cliente ao ' +
              'final do acesso'
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
            TabOrder = 16
            Width = 460
          end
          object cxGroupBox1: TcxGroupBox
            Left = 23
            Top = 307
            Caption = ' 10. Tela de Adicionar Tempo '
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 17
            Height = 135
            Width = 500
            object edTempoB1: TcxDBSpinEdit
              Left = 24
              Top = 44
              DataBinding.DataField = 'TempoB1'
              DataBinding.DataSource = DS
              Properties.Alignment.Horz = taCenter
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
              Caption = '10.1 - Tempo (em minutos) dos atalhos de tempo'
              Style.TextStyle = []
            end
            object cxLabel25: TcxLabel
              Left = 11
              Top = 78
              Caption = '10.2 - Tipo de Tempo padr'#227'o'
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
              Width = 232
            end
          end
          object edCreditoComoValor: TcxDBCheckBox
            Left = 19
            Top = 448
            Caption = '11. Guardar cr'#233'dito de tempo como VALOR'
            DataBinding.DataField = 'CreditoComoValor'
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
            TabOrder = 18
            Width = 230
          end
          object cxDBCheckBox15: TcxDBCheckBox
            Left = 19
            Top = 469
            Caption = 
              '12. Alertar cliente sobre cr'#233'ditos com restri'#231#245'es de uso na sess' +
              #227'o atual'
            DataBinding.DataField = 'AvisoCreditos'
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
            TabOrder = 19
            Width = 374
          end
          object edModoCredGuard: TcxDBImageComboBox
            Left = 25
            Top = 513
            DataBinding.DataField = 'ModoCredGuard'
            DataBinding.DataSource = DS
            Properties.Items = <
              item
                Description = 'Mostrar apenas o tempo v'#225'lido para a sess'#227'o atual'
                ImageIndex = 0
                Value = 0
              end
              item
                Description = 
                  'Mostrar o tempo total no cron'#244'metro incluindo cr'#233'ditos inv'#225'lidos' +
                  ' para a sess'#227'o'
                Value = 1
              end>
            Style.BorderStyle = ebsFlat
            TabOrder = 20
            Width = 446
          end
          object cxLabel37: TcxLabel
            Left = 22
            Top = 496
            Caption = 
              '13. Como exibir os cr'#233'ditos dispon'#237'veis no cron'#244'metro da m'#225'quina' +
              ' cliente'
          end
          object cxLabel38: TcxLabel
            Left = 22
            Top = 538
            Caption = 
              '14. Mensagem de fim de cr'#233'dito a ser exibida quando o cliente ai' +
              'nda possui outros cr'#233'ditos inv'#225'lidos para a sess'#227'o atual:'
          end
          object edMsgFimCred: TcxDBTextEdit
            Left = 25
            Top = 556
            DataBinding.DataField = 'MsgFimCred'
            DataBinding.DataSource = DS
            Style.BorderStyle = ebsFlat
            TabOrder = 23
            Width = 624
          end
          object LMDSimplePanel1: TLMDSimplePanel
            Left = 25
            Top = 652
            Width = 100
            Height = 37
            Bevel.Mode = bmCustom
            TabOrder = 24
          end
          object cxDBSpinEdit1: TcxDBSpinEdit
            Left = 376
            Top = 583
            DataBinding.DataField = 'MaxTempoSessao'
            DataBinding.DataSource = DS
            Properties.Alignment.Horz = taCenter
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
            TabOrder = 25
            Width = 71
          end
          object cxLabel52: TcxLabel
            Left = 21
            Top = 584
            Caption = 
              '15. Limite m'#225'ximo de tempo das sess'#245'es. Deixe 0 para n'#227'o haver l' +
              'imite.'
          end
          object cxLabel53: TcxLabel
            Left = 451
            Top = 584
            Caption = 'minutos.'
          end
          object cxDBCheckBox16: TcxDBCheckBox
            Left = 19
            Top = 623
            Caption = '13. Permitir que o cliente veja detalhes dos seus cr'#233'ditos'
            DataBinding.DataField = 'ClientePodeVerCred'
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
            TabOrder = 28
            Visible = False
            Width = 407
          end
        end
      end
      object nbgAvisoFimTempoControl: TdxNavBarGroupControl
        Left = 0
        Top = 114
        Width = 618
        Height = 277
        TabOrder = 8
        GroupIndex = 5
        OriginalHeight = 277
      end
      object nbgCoresControl: TdxNavBarGroupControl
        Left = 0
        Top = 131
        Width = 1003
        Height = 509
        TabOrder = 9
        GroupIndex = 6
        OriginalHeight = 509
        object LMDScrollBox5: TLMDScrollBox
          AlignWithMargins = True
          Left = 25
          Top = 25
          Width = 975
          Height = 459
          Margins.Left = 25
          Margins.Top = 25
          Margins.Bottom = 25
          Align = alClient
          TabOrder = 0
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          object vgCor: TcxDBVerticalGrid
            AlignWithMargins = True
            Left = 5
            Top = 5
            Width = 281
            Height = 449
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Align = alLeft
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = True
            OptionsView.PaintStyle = psDelphi
            OptionsView.RowHeaderWidth = 101
            Navigator.Buttons.CustomButtons = <>
            TabOrder = 0
            OnEditValueChanged = vgCorEditValueChanged
            DataController.DataSource = DS
            Version = 1
            object vgCorCMaqLivre: TcxCategoryRow
              Properties.Caption = '1. M'#225'quina Livre'
              ID = 0
              ParentID = -1
              Index = 0
              Version = 1
            end
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
              ID = 1
              ParentID = 0
              Index = 0
              Version = 1
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
              ID = 2
              ParentID = 0
              Index = 1
              Version = 1
            end
            object vgCorCUsoPre: TcxCategoryRow
              Properties.Caption = '2. M'#225'quina em Uso Pr'#233'-Pago'
              ID = 3
              ParentID = -1
              Index = 1
              Version = 1
            end
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
              ID = 4
              ParentID = 3
              Index = 0
              Version = 1
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
              ID = 5
              ParentID = 3
              Index = 1
              Version = 1
            end
            object vgCorCUsoPos: TcxCategoryRow
              Properties.Caption = '3. M'#225'quina em Uso P'#243's-Pago'
              ID = 6
              ParentID = -1
              Index = 2
              Version = 1
            end
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
              ID = 7
              ParentID = 6
              Index = 0
              Version = 1
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
              ID = 8
              ParentID = 6
              Index = 1
              Version = 1
            end
            object vgCorCUsoManut: TcxCategoryRow
              Properties.Caption = '4. M'#225'quina em Uso por Funcion'#225'rio'
              ID = 9
              ParentID = -1
              Index = 3
              Version = 1
            end
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
              ID = 10
              ParentID = 9
              Index = 0
              Version = 1
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
              ID = 11
              ParentID = 9
              Index = 1
              Version = 1
            end
            object vgCorCPausada: TcxCategoryRow
              Properties.Caption = '5. M'#225'quina Pausada '
              ID = 12
              ParentID = -1
              Index = 4
              Version = 1
            end
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
              ID = 13
              ParentID = 12
              Index = 0
              Version = 1
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
              ID = 14
              ParentID = 12
              Index = 1
              Version = 1
            end
            object vgCorCategoryRow4: TcxCategoryRow
              Properties.Caption = '6. '#193'rea de Trabalho das M'#225'quinas Clientes'
              ID = 15
              ParentID = -1
              Index = 5
              Version = 1
            end
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
              ID = 16
              ParentID = 15
              Index = 0
              Version = 1
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
              ID = 17
              ParentID = 15
              Index = 1
              Version = 1
            end
            object vgCorCategoryRow1: TcxCategoryRow
              Properties.Caption = '7. M'#225'quina em Manuten'#231#227'o / Fora do Ar'
              ID = 18
              ParentID = -1
              Index = 6
              Version = 1
            end
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
              ID = 19
              ParentID = 18
              Index = 0
              Version = 1
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
              ID = 20
              ParentID = 18
              Index = 1
              Version = 1
            end
            object vgCorCategoryRow2: TcxCategoryRow
              Properties.Caption = '8. M'#225'quina em Uso por Tempo Previsto'
              ID = 21
              ParentID = -1
              Index = 7
              Version = 1
            end
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
              ID = 22
              ParentID = 21
              Index = 0
              Version = 1
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
              ID = 23
              ParentID = 21
              Index = 1
              Version = 1
            end
          end
          object lbPrevisao: TcxLabel
            Left = 287
            Top = 407
            AutoSize = False
            Caption = 'Tempo Previsto'
            ParentColor = False
            ParentFont = False
            Style.Color = clBackground
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWhite
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Height = 25
            Width = 152
            AnchorX = 363
            AnchorY = 420
          end
          object lbMaqManut: TcxLabel
            Left = 287
            Top = 353
            AutoSize = False
            Caption = 'Em Manuten'#231#227'o  / Fora do ar'
            ParentColor = False
            ParentFont = False
            Style.Color = clBackground
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWhite
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Height = 25
            Width = 152
            AnchorX = 363
            AnchorY = 366
          end
          object lbDesktop: TcxLabel
            Left = 288
            Top = 302
            AutoSize = False
            Caption = #193'rea de Trabalho'
            ParentColor = False
            ParentFont = False
            Style.Color = clBackground
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWhite
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Height = 25
            Width = 152
            AnchorX = 364
            AnchorY = 315
          end
          object lbPausa: TcxLabel
            Left = 288
            Top = 248
            AutoSize = False
            Caption = 'M'#225'quina Pausada'
            ParentColor = False
            ParentFont = False
            Style.Color = clBackground
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWhite
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Height = 25
            Width = 152
            AnchorX = 364
            AnchorY = 261
          end
          object lbManut: TcxLabel
            Left = 288
            Top = 195
            AutoSize = False
            Caption = 'Funcion'#225'rio Usando'
            ParentColor = False
            ParentFont = False
            Style.Color = clBackground
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWhite
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Height = 25
            Width = 152
            AnchorX = 364
            AnchorY = 208
          end
          object lbPosPago: TcxLabel
            Left = 288
            Top = 141
            AutoSize = False
            Caption = 'M'#225'quina em Uso P'#243's-Pago'
            ParentColor = False
            ParentFont = False
            Style.Color = clBackground
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWhite
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Height = 25
            Width = 152
            AnchorX = 364
            AnchorY = 154
          end
          object lbPrePago: TcxLabel
            Left = 288
            Top = 87
            AutoSize = False
            Caption = 'M'#225'quina em Uso Pr'#233'-Pago'
            ParentColor = False
            ParentFont = False
            Style.Color = clBackground
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWhite
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Height = 25
            Width = 152
            AnchorX = 364
            AnchorY = 100
          end
          object cxLabel2: TcxLabel
            Left = 288
            Top = 9
            Caption = 'Exemplos:'
            Style.TextStyle = [fsBold]
          end
          object lbLivre: TcxLabel
            Left = 288
            Top = 34
            AutoSize = False
            Caption = 'M'#225'quina Livre'
            ParentColor = False
            ParentFont = False
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
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Height = 25
            Width = 152
            AnchorX = 364
            AnchorY = 47
          end
        end
      end
      object nbgCaixaControl: TdxNavBarGroupControl
        Left = 0
        Top = 152
        Width = 618
        Height = 377
        TabOrder = 10
        GroupIndex = 7
        OriginalHeight = 377
        object LMDScrollBox4: TLMDScrollBox
          Left = 0
          Top = 0
          Width = 618
          Height = 377
          Align = alClient
          TabOrder = 0
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          object edManterSaldoCaixa: TcxDBCheckBox
            Left = 15
            Top = 16
            Caption = 
              '&1. Manter Saldo de Caixa (O saldo final de um caixa ser'#225' o sald' +
              'o inicial do pr'#243'ximo)'
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
            Width = 466
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
          object edModoPagtoAcesso: TcxDBImageComboBox
            Left = 20
            Top = 58
            DataBinding.DataField = 'ModoPagtoAcesso'
            DataBinding.DataSource = DS
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
            TabOrder = 2
            Width = 335
          end
          object edRelCaixaAuto: TcxDBCheckBox
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
            TabOrder = 3
            Width = 281
          end
          object edAutoObsAoCancelar: TcxDBCheckBox
            Left = 17
            Top = 107
            Caption = 
              '&4. Ao cancelar transa'#231#227'o do caixar mostrar tela de observa'#231#245'es ' +
              'automaticamente'
            DataBinding.DataField = 'AutoObsAoCancelar'
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
            Width = 440
          end
          object gbOpcaoPagto: TcxGroupBox
            Left = 19
            Top = 191
            Caption = ' 7. Op'#231#227'o padr'#227'o de pagamento '
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 5
            Height = 168
            Width = 267
            object cxLabel26: TcxLabel
              Left = 12
              Top = 45
              Caption = 'Acesso'
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
            end
            object cxLabel27: TcxLabel
              Left = 12
              Top = 92
              Caption = 'Venda Avulsa'
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
            end
            object cxLabel28: TcxLabel
              Left = 12
              Top = 115
              Caption = 'Adicionar Tempo'
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
            end
            object cxLabel29: TcxLabel
              Left = 12
              Top = 138
              Caption = 'Impress'#227'o'
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
            end
            object cbPgAcesso: TcxDBImageComboBox
              Left = 99
              Top = 44
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
              Top = 27
              Caption = 'Pagamento Total ?'
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
            end
            object cbPgVendaAvulsa: TcxDBImageComboBox
              Left = 99
              Top = 91
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
              Top = 114
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
              Top = 137
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
              Top = 68
              Caption = 'Venda c/ Acesso'
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
            end
            object cbPgVendas: TcxDBImageComboBox
              Left = 99
              Top = 67
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
          object cxDBCheckBox1: TcxDBCheckBox
            Left = 17
            Top = 129
            Caption = '&5. Solicitar Saldo Inicial na abertura do caixa'
            DataBinding.DataField = 'PedirSaldoI'
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
          object cxDBCheckBox2: TcxDBCheckBox
            Left = 17
            Top = 152
            Caption = '&6. Solicitar Saldo Final no fechamento do caixa'
            DataBinding.DataField = 'PedirSaldoF'
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
            Width = 281
          end
        end
      end
      object nbgFidelidadeControl: TdxNavBarGroupControl
        Left = 0
        Top = 26
        Width = 1003
        Height = 672
        TabOrder = 11
        GroupIndex = 8
        OriginalHeight = 672
        object panSemFidelidade: TLMDSimplePanel
          Left = 0
          Top = 0
          Width = 1003
          Height = 40
          Align = alTop
          Bevel.Mode = bmCustom
          TabOrder = 0
          object lbSemFidelidade: TcxLabel
            Left = 0
            Top = 0
            Align = alClient
            Caption = 
              '      Esse recurso est'#225' desativado na sua loja. Para ativar '#233' ne' +
              'cess'#225'rio comprar uma atualiza'#231#227'o do NexCaf'#233'.'
            ParentColor = False
            ParentFont = False
            Style.Color = clBtnFace
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextColor = clRed
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taLeftJustify
            Properties.Alignment.Vert = taVCenter
            Properties.WordWrap = True
            Width = 1003
            AnchorY = 20
          end
        end
        object panDadosFid: TLMDSimplePanel
          Left = 0
          Top = 40
          Width = 1003
          Height = 632
          Align = alClient
          Bevel.Mode = bmCustom
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object LMDScrollBox3: TLMDScrollBox
            Left = 0
            Top = 0
            Width = 1003
            Height = 632
            Align = alClient
            TabOrder = 0
            Bevel.Mode = bmStandard
            Bevel.StandardStyle = lsNone
            object cbFidAtivo: TcxDBCheckBox
              Left = 16
              Top = 16
              Caption = '&1. Ativar programa de pontos / fideliza'#231'ao de clientes'
              DataBinding.DataField = 'FidAtivo'
              DataBinding.DataSource = DS
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Style.BorderStyle = ebsFlat
              TabOrder = 0
              OnClick = cbFidAtivoClick
              Width = 313
            end
            object cbComputador: TcxGroupBox
              Left = 21
              Top = 43
              Caption = ' &2. Uso do computador '
              Style.BorderStyle = ebsFlat
              TabOrder = 1
              Height = 89
              Width = 273
              object cxLabel39: TcxLabel
                Left = 12
                Top = 24
                Caption = 'Acumular'
              end
              object edFidSessaoPontos: TcxDBSpinEdit
                Left = 66
                Top = 23
                DataBinding.DataField = 'FidSessaoPontos'
                DataBinding.DataSource = DS
                Properties.ImmediatePost = True
                Properties.Increment = 10.000000000000000000
                Properties.LargeIncrement = 100.000000000000000000
                Style.BorderStyle = ebsFlat
                TabOrder = 1
                Width = 99
              end
              object cxLabel40: TcxLabel
                Left = 171
                Top = 25
                Caption = 'pontos'
              end
              object cxLabel41: TcxLabel
                Left = 13
                Top = 50
                Caption = 'A cada'
              end
              object edFidSessaoValor: TcxDBCurrencyEdit
                Left = 66
                Top = 49
                DataBinding.DataField = 'FidSessaoValor'
                DataBinding.DataSource = DS
                Style.BorderStyle = ebsFlat
                TabOrder = 4
                Width = 99
              end
              object cxLabel42: TcxLabel
                Left = 171
                Top = 51
                Caption = 'gastos (e pagos)'
              end
            end
            object cbProdutos: TcxGroupBox
              Left = 21
              Top = 138
              Caption = ' &3. Compra de produtos'
              Style.BorderStyle = ebsFlat
              TabOrder = 2
              Height = 89
              Width = 273
              object cxLabel43: TcxLabel
                Left = 12
                Top = 24
                Caption = 'Acumular'
              end
              object edFidVendaPontos: TcxDBSpinEdit
                Left = 66
                Top = 23
                DataBinding.DataField = 'FidVendaPontos'
                DataBinding.DataSource = DS
                Properties.ImmediatePost = True
                Properties.Increment = 10.000000000000000000
                Properties.LargeIncrement = 100.000000000000000000
                Style.BorderStyle = ebsFlat
                TabOrder = 1
                Width = 99
              end
              object cxLabel44: TcxLabel
                Left = 171
                Top = 25
                Caption = 'pontos'
              end
              object cxLabel45: TcxLabel
                Left = 13
                Top = 50
                Caption = 'A cada'
              end
              object edFidVendaValor: TcxDBCurrencyEdit
                Left = 66
                Top = 49
                DataBinding.DataField = 'FidVendaValor'
                DataBinding.DataSource = DS
                Style.BorderStyle = ebsFlat
                TabOrder = 4
                Width = 99
              end
              object cxLabel46: TcxLabel
                Left = 171
                Top = 51
                Caption = 'gastos (e pagos)'
              end
            end
            object cbImpressoes: TcxGroupBox
              Left = 21
              Top = 229
              Caption = '&4. Impress'#245'es'
              Style.BorderStyle = ebsFlat
              TabOrder = 3
              Height = 89
              Width = 273
              object cxLabel47: TcxLabel
                Left = 12
                Top = 24
                Caption = 'Acumular'
              end
              object edFidImpPontos: TcxDBSpinEdit
                Left = 66
                Top = 23
                DataBinding.DataField = 'FidImpPontos'
                DataBinding.DataSource = DS
                Properties.ImmediatePost = True
                Properties.Increment = 10.000000000000000000
                Properties.LargeIncrement = 100.000000000000000000
                Style.BorderStyle = ebsFlat
                TabOrder = 1
                Width = 99
              end
              object cxLabel48: TcxLabel
                Left = 171
                Top = 25
                Caption = 'pontos'
              end
              object cxLabel49: TcxLabel
                Left = 13
                Top = 50
                Caption = 'A cada'
              end
              object edFidImpValor: TcxDBCurrencyEdit
                Left = 66
                Top = 49
                DataBinding.DataField = 'FidImpValor'
                DataBinding.DataSource = DS
                Style.BorderStyle = ebsFlat
                TabOrder = 4
                Width = 99
              end
              object cxLabel50: TcxLabel
                Left = 171
                Top = 51
                Caption = 'gastos (e pagos)'
              end
            end
            object cbFidParcial: TcxDBCheckBox
              Left = 16
              Top = 331
              Caption = 
                '&5. Pontua'#231#227'o proporcional quando valor for menor do que o indic' +
                'ado acima'
              DataBinding.DataField = 'FidParcial'
              DataBinding.DataSource = DS
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Style.BorderStyle = ebsFlat
              TabOrder = 4
              Width = 393
            end
            object edFidAutoPremiar: TcxDBCheckBox
              Left = 17
              Top = 355
              Caption = '&6. Premiar clientes automaticamente'
              DataBinding.DataField = 'FidAutoPremiar'
              DataBinding.DataSource = DS
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Style.BorderStyle = ebsFlat
              TabOrder = 5
              OnClick = cbFidAtivoClick
              Width = 212
            end
            object lbFidPremio: TcxLabel
              Left = 34
              Top = 381
              Caption = '6.1 Pr'#234'mio (Cr'#233'dito Promocional) '
            end
            object edFidPremio: TcxDBLookupComboBox
              Left = 199
              Top = 380
              DataBinding.DataField = 'NomePremioPass'
              DataBinding.DataSource = DS
              Properties.Alignment.Horz = taLeftJustify
              Properties.ImmediatePost = True
              Properties.ListColumns = <>
              Properties.OnInitPopup = edFidPremioPropertiesInitPopup
              Style.BorderStyle = ebsFlat
              TabOrder = 7
              Width = 170
            end
            object edFidMostrarSaldoAdmin: TcxDBCheckBox
              Left = 13
              Top = 558
              Caption = 
                '&7. Mostrar saldo de pontos do cliente na lista de m'#225'quinas do N' +
                'exAdmin'
              DataBinding.DataField = 'FidMostrarSaldoAdmin'
              DataBinding.DataSource = DS
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Style.BorderStyle = ebsFlat
              TabOrder = 9
              OnClick = cbFidAtivoClick
              Width = 400
            end
            object edFidMostrarSaldoGuard: TcxDBCheckBox
              Left = 13
              Top = 580
              Caption = 
                '&8. Mostrar saldo de pontos do cliente na m'#225'quina cliente (NexGu' +
                'ard)'
              DataBinding.DataField = 'FidMostrarSaldoGuard'
              DataBinding.DataSource = DS
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Style.BorderStyle = ebsFlat
              TabOrder = 10
              OnClick = cbFidAtivoClick
              Width = 376
            end
            object LMDSimplePanel2: TLMDSimplePanel
              Left = 17
              Top = 604
              Width = 100
              Height = 22
              Bevel.Mode = bmCustom
              TabOrder = 11
            end
            object gbFidMsg: TcxGroupBox
              Left = 34
              Top = 407
              Caption = '&6.2 Mensagem de premia'#231#227'o'
              Style.BorderStyle = ebs3D
              TabOrder = 8
              Height = 143
              Width = 451
              object edFidMsg: TcxDBCheckBox
                Left = 8
                Top = 20
                Caption = 'Mostrar mensagem de premia'#231#227'o na m'#225'quina cliente'
                DataBinding.DataField = 'FidMsg'
                DataBinding.DataSource = DS
                Properties.ImmediatePost = True
                Properties.NullStyle = nssUnchecked
                Style.BorderStyle = ebsFlat
                TabOrder = 0
                OnClick = cbFidAtivoClick
                Width = 281
              end
              object lbFidMsgTitulo: TcxLabel
                Left = 16
                Top = 48
                Caption = 'Titulo da Mensagem'
              end
              object lbFidMsgTexto: TcxLabel
                Left = 16
                Top = 71
                Caption = 'Texto da Mesangem'
              end
              object edFidMsgTitulo: TcxDBTextEdit
                Left = 120
                Top = 48
                DataBinding.DataField = 'FidMsgTitulo'
                DataBinding.DataSource = DS
                Style.BorderStyle = ebsFlat
                TabOrder = 3
                Width = 324
              end
              object edFidMsgTexto: TcxDBMemo
                Left = 120
                Top = 74
                DataBinding.DataField = 'FidMsgTexto'
                DataBinding.DataSource = DS
                Style.BorderStyle = ebsFlat
                TabOrder = 4
                Height = 61
                Width = 324
              end
            end
          end
        end
      end
      object nbgPubControl: TdxNavBarGroupControl
        Left = 0
        Top = 0
        Width = 618
        Height = 744
        TabOrder = 12
        GroupIndex = 9
        OriginalHeight = 172
        object LMDSimplePanel5: TLMDSimplePanel
          Left = 0
          Top = 0
          Width = 618
          Height = 40
          Align = alTop
          Bevel.Mode = bmCustom
          TabOrder = 0
          object cxLabel51: TcxLabel
            Left = 0
            Top = 0
            Align = alClient
            Caption = 
              '      A desativa'#231#227'o da publicidade s'#243' tem efeito para assinantes' +
              ' do NexCaf'#233' Premium'
            ParentColor = False
            ParentFont = False
            Style.Color = clBtnFace
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextColor = clRed
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taLeftJustify
            Properties.Alignment.Vert = taVCenter
            Properties.WordWrap = True
            Width = 618
            AnchorY = 20
          end
        end
        object cxDBCheckBox22: TcxDBCheckBox
          AlignWithMargins = True
          Left = 16
          Top = 56
          Margins.Left = 16
          Margins.Top = 16
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Caption = '&1. Mostrar banner com publicidade nas m'#225'quinas clientes'
          DataBinding.DataField = 'PubAd'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.BorderStyle = ebsFlat
          TabOrder = 1
          OnClick = cbFidAtivoClick
          Width = 602
        end
        object cxDBCheckBox20: TcxDBCheckBox
          AlignWithMargins = True
          Left = 16
          Top = 76
          Margins.Left = 16
          Margins.Top = 10
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Caption = 
            '&3. Ao iniciar acesso do cliente abrir automaticamente p'#225'gina de' +
            ' internet definida pelo sistema de publicidade'
          DataBinding.DataField = 'PubHomePage'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.BorderStyle = ebsFlat
          TabOrder = 2
          OnClick = cbFidAtivoClick
          ExplicitTop = 97
          Width = 602
        end
        object cxDBCheckBox21: TcxDBCheckBox
          AlignWithMargins = True
          Left = 16
          Top = 66
          Margins.Left = 16
          Margins.Top = 10
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Caption = '&2. Mostrar barra de ferramentas'
          DataBinding.DataField = 'PubToolbar'
          DataBinding.DataSource = DS
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Style.BorderStyle = ebsFlat
          TabOrder = 3
          OnClick = cbFidAtivoClick
          ExplicitTop = 87
          Width = 602
        end
      end
      object nbgImpControl: TdxNavBarGroupControl
        Left = 0
        Top = 0
        Width = 618
        Height = 744
        TabOrder = 14
        GroupIndex = 10
        OriginalHeight = 460
        object pgImp: TcxPageControl
          AlignWithMargins = True
          Left = 20
          Top = 20
          Width = 549
          Height = 704
          Margins.Left = 20
          Margins.Top = 20
          Margins.Right = 20
          Margins.Bottom = 20
          Align = alLeft
          TabOrder = 0
          Properties.ActivePage = cxTabSheet1
          Properties.CustomButtons.Buttons = <>
          Properties.ShowFrame = True
          Properties.Style = 9
          Properties.TabSlants.Positions = []
          LookAndFeel.NativeStyle = False
          TabSlants.Positions = []
          ClientRectBottom = 703
          ClientRectLeft = 1
          ClientRectRight = 548
          ClientRectTop = 20
          object cxTabSheet1: TcxTabSheet
            Caption = 'Registro das Impress'#245'es'
            ImageIndex = 0
            object edDetectarImp: TcxCheckBox
              AlignWithMargins = True
              Left = 15
              Top = 15
              Margins.Left = 15
              Margins.Top = 15
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Caption = '1. Detectar impress'#245'es realizadas pelos clientes'
              ParentFont = False
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
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
              TabOrder = 0
              OnClick = edDetectarImpClick
              Width = 532
            end
            object edRegValorImp: TcxCheckBox
              AlignWithMargins = True
              Left = 15
              Top = 20
              Margins.Left = 15
              Margins.Top = 5
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Caption = 
                '2. Registrar automaticamente os valores das impress'#245'es detectada' +
                's'
              ParentFont = False
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
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
              OnClick = edRegValorImpClick
              ExplicitTop = 41
              Width = 532
            end
            object edNaoCobrarImpFunc: TcxDBCheckBox
              AlignWithMargins = True
              Left = 15
              Top = 25
              Margins.Left = 15
              Margins.Top = 5
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Caption = '3. N'#227'o cobrar impress'#245'es de funcion'#225'rios'
              DataBinding.DataField = 'NaoCobrarImpFunc'
              DataBinding.DataSource = DS
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.MultiLine = True
              Properties.NullStyle = nssUnchecked
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
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
              TabOrder = 2
              ExplicitTop = 67
              Width = 532
            end
            object cxDBCheckBox14: TcxDBCheckBox
              AlignWithMargins = True
              Left = 15
              Top = 30
              Margins.Left = 15
              Margins.Top = 5
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Caption = '4. Detectar impress'#245'es realizadas no servidor'
              DataBinding.DataField = 'DetectarImpServ'
              DataBinding.DataSource = DS
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.MultiLine = True
              Properties.NullStyle = nssUnchecked
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
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
              ExplicitTop = 93
              Width = 532
            end
            object edPMPDF: TcxDBCheckBox
              AlignWithMargins = True
              Left = 15
              Top = 35
              Margins.Left = 15
              Margins.Top = 5
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Caption = 
                '5. Utilizar Impressora NexCaf'#233' para detectar e revisar impress'#245'e' +
                's'
              DataBinding.DataField = 'PMPDF'
              DataBinding.DataSource = DS
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.MultiLine = True
              Properties.NullStyle = nssUnchecked
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
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
              TabOrder = 4
              ExplicitTop = 119
              Width = 532
            end
            object edPMPDFPrintEng: TcxDBImageComboBox
              Left = 231
              Top = 141
              DataBinding.DataField = 'PMPDFPrintEng'
              DataBinding.DataSource = DS
              Properties.DefaultDescription = 'Usar Adobe'
              Properties.ImmediateDropDownWhenActivated = True
              Properties.ImmediatePost = True
              Properties.ImmediateUpdateText = True
              Properties.Items = <
                item
                  Description = 'Usar Adobe'
                  ImageIndex = 0
                  Value = 0
                end
                item
                  Description = 'Usar CLPrint'
                  Value = 1
                end>
              Style.BorderStyle = ebsFlat
              TabOrder = 5
              Width = 121
            end
            object lbPDFPrintEng: TcxLabel
              Left = 101
              Top = 143
              Caption = '5.1 M'#233'todo de impress'#227'o'
            end
          end
          object cxTabSheet2: TcxTabSheet
            Caption = 'Pausa Autom'#225'tica'
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object cxLabel54: TcxLabel
              AlignWithMargins = True
              Left = 15
              Top = 15
              Margins.Left = 15
              Margins.Top = 15
              Align = alTop
              Caption = 
                'Aten'#231#227'o: Esse recurso s'#243' funciona corretamente com impressoras c' +
                'onectadas no mesmo computador onde est'#225' instalado o NexServ.'
              Style.TextColor = clRed
              Style.TextStyle = []
              Properties.WordWrap = True
              Width = 529
            end
            object edPMPausaAutomatica: TcxDBCheckBox
              AlignWithMargins = True
              Left = 15
              Top = 53
              Margins.Left = 15
              Margins.Top = 5
              Margins.Right = 15
              Margins.Bottom = 0
              Align = alTop
              Caption = '1. Pausar automaticamente e aguardar confirma'#231#227'o da impress'#227'o'
              DataBinding.DataField = 'PMPausaAutomatica'
              DataBinding.DataSource = DS
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.MultiLine = True
              Properties.NullStyle = nssUnchecked
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
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
              OnClick = edPMPausaAutomaticaClick
              Width = 517
            end
            object edPMPausarServ: TcxDBCheckBox
              AlignWithMargins = True
              Left = 15
              Top = 58
              Margins.Left = 15
              Margins.Top = 5
              Margins.Right = 15
              Margins.Bottom = 0
              Align = alTop
              Caption = '2. Pausar impress'#245'es realizadas no SERVIDOR'
              DataBinding.DataField = 'PMPausarServ'
              DataBinding.DataSource = DS
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.MultiLine = True
              Properties.NullStyle = nssUnchecked
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
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
              TabOrder = 2
              OnClick = edPMConfirmaImpCliClick
              ExplicitTop = 79
              Width = 517
            end
            object panPMNaoPausar: TLMDSimplePanel
              AlignWithMargins = True
              Left = 0
              Top = 64
              Width = 547
              Height = 92
              Margins.Left = 0
              Margins.Top = 6
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Bevel.Mode = bmCustom
              TabOrder = 3
              ExplicitTop = 106
              object lbPMNaoPausar: TcxLabel
                AlignWithMargins = True
                Left = 33
                Top = 0
                Margins.Left = 33
                Margins.Top = 0
                Align = alTop
                Caption = 
                  '3. N'#195'O pausar impress'#245'es vindas dos seguintes computadores (NOME' +
                  ' DO COMPUTADOR)'
                ParentFont = False
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
              end
              object edPMNaoPausar: TcxDBMemo
                AlignWithMargins = True
                Left = 76
                Top = 20
                Margins.Left = 76
                Margins.Top = 0
                Margins.Right = 10
                Margins.Bottom = 10
                Align = alLeft
                DataBinding.DataField = 'PMNaoPausar'
                DataBinding.DataSource = DS
                Enabled = False
                ParentFont = False
                Properties.ScrollBars = ssVertical
                Style.BorderStyle = ebsFlat
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 1
                Height = 62
                Width = 449
              end
            end
            object edPMConfirmaImpCli: TcxDBCheckBox
              AlignWithMargins = True
              Left = 15
              Top = 161
              Margins.Left = 15
              Margins.Top = 5
              Margins.Right = 15
              Margins.Bottom = 0
              Align = alTop
              Caption = '4. Perguntar ao cliente se confirma impress'#227'o'
              DataBinding.DataField = 'PMConfirmaImpCliente'
              DataBinding.DataSource = DS
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.MultiLine = True
              Properties.NullStyle = nssUnchecked
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
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
              TabOrder = 4
              OnClick = edPMConfirmaImpCliClick
              ExplicitTop = 203
              Width = 517
            end
            object edPMMostrarPaginasCli: TcxDBCheckBox
              AlignWithMargins = True
              Left = 30
              Top = 166
              Margins.Left = 30
              Margins.Top = 5
              Margins.Right = 15
              Margins.Bottom = 0
              Align = alTop
              Caption = '4.1   Mostrar quantidade de p'#225'ginas na pergunta'
              DataBinding.DataField = 'PMMostrarPaginasCli'
              DataBinding.DataSource = DS
              Enabled = False
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.MultiLine = True
              Properties.NullStyle = nssUnchecked
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
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
              TabOrder = 5
              ExplicitTop = 229
              Width = 502
            end
            object edPMMostrarValorCli: TcxDBCheckBox
              AlignWithMargins = True
              Left = 30
              Top = 171
              Margins.Left = 30
              Margins.Top = 5
              Margins.Right = 15
              Margins.Bottom = 0
              Align = alTop
              Caption = '4.2   Mostrar valor da impress'#227'o na pergunta'
              DataBinding.DataField = 'PMMostrarValorCli'
              DataBinding.DataSource = DS
              Enabled = False
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.MultiLine = True
              Properties.NullStyle = nssUnchecked
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
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
              TabOrder = 6
              OnClick = edPMMostrarValorCliClick
              ExplicitTop = 255
              Width = 502
            end
            object LMDSimplePanel3: TLMDSimplePanel
              Left = 0
              Top = 171
              Width = 547
              Height = 31
              Align = alTop
              Bevel.Mode = bmCustom
              TabOrder = 7
              object lbPMCalcValorCli: TcxLabel
                AlignWithMargins = True
                Left = 72
                Top = 5
                Margins.Left = 72
                Margins.Top = 5
                Align = alLeft
                Caption = '4.2.1   Valor da impress'#227'o a ser mostrado na pergunta'
                Enabled = False
                ParentFont = False
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
              end
              object edPMCalcValorCli: TcxDBImageComboBox
                Left = 345
                Top = 5
                DataBinding.DataField = 'PMCalcValorCli'
                DataBinding.DataSource = DS
                Enabled = False
                ParentFont = False
                Properties.Items = <
                  item
                    Description = 'Valor m'#237'nimo e valor m'#225'ximo'
                    ImageIndex = 0
                    Value = 0
                  end
                  item
                    Description = 'Valor m'#237'nimo'
                    Value = 1
                  end
                  item
                    Description = 'Valor m'#225'ximo'
                    Value = 2
                  end>
                Style.BorderStyle = ebsFlat
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 1
                Width = 180
              end
            end
            object LMDSimplePanel4: TLMDSimplePanel
              Left = 0
              Top = 202
              Width = 547
              Height = 91
              Align = alTop
              Bevel.Mode = bmCustom
              TabOrder = 8
              ExplicitTop = 307
              object lbPMObs: TcxLabel
                AlignWithMargins = True
                Left = 48
                Top = 0
                Margins.Left = 48
                Margins.Top = 0
                Align = alTop
                Caption = '4.3   Observa'#231#227'o a ser mostrada no rodap'#233' da pergunta'
                Enabled = False
                ParentFont = False
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
              end
              object edPMObs: TcxDBMemo
                AlignWithMargins = True
                Left = 76
                Top = 20
                Margins.Left = 76
                Margins.Top = 0
                Margins.Right = 10
                Margins.Bottom = 10
                Align = alLeft
                DataBinding.DataField = 'PMObsValorCli'
                DataBinding.DataSource = DS
                Enabled = False
                ParentFont = False
                Properties.ScrollBars = ssVertical
                Style.BorderStyle = ebsFlat
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 1
                Height = 61
                Width = 449
              end
            end
            object lbPausaDesativada: TcxLabel
              Left = 384
              Top = 40
              AutoSize = False
              Caption = 
                'Esse recurso est'#225' desativado. '#201' necess'#225'rio comprar uma atualiza'#231 +
                #227'o do NexCaf'#233' para ativa-lo.'
              ParentColor = False
              ParentShowHint = False
              ShowHint = True
              Style.Color = clYellow
              Style.TextStyle = [fsBold]
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.WordWrap = True
              Height = 44
              Width = 321
              AnchorX = 545
              AnchorY = 62
            end
          end
          object tsCotas: TcxTabSheet
            Caption = 'Cotas de Impress'#227'o'
            ImageIndex = 2
            object edPMCotasPorCli: TcxDBCheckBox
              AlignWithMargins = True
              Left = 15
              Top = 120
              Margins.Left = 15
              Margins.Top = 5
              Margins.Right = 15
              Margins.Bottom = 0
              Align = alTop
              Caption = '4. Permitir cotas diferenciadas por cliente'
              DataBinding.DataField = 'PMCotasPorCli'
              DataBinding.DataSource = DS
              ParentFont = False
              Properties.Alignment = taLeftJustify
              Properties.ImmediatePost = True
              Properties.MultiLine = True
              Properties.NullStyle = nssUnchecked
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
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
              TabOrder = 0
              OnClick = edPMConfirmaImpCliClick
              Width = 517
            end
            object edPMCotas: TcxDBCheckBox
              AlignWithMargins = True
              Left = 15
              Top = 53
              Margins.Left = 15
              Margins.Top = 5
              Margins.Right = 15
              Margins.Bottom = 0
              Align = alTop
              Caption = '1. Controlar Cotas de Impress'#227'o'
              DataBinding.DataField = 'PMCotas'
              DataBinding.DataSource = DS
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.MultiLine = True
              Properties.NullStyle = nssUnchecked
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
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
              OnClick = edPMPausaAutomaticaClick
              Width = 517
            end
            object cxLabel58: TcxLabel
              AlignWithMargins = True
              Left = 15
              Top = 15
              Margins.Left = 15
              Margins.Top = 15
              Align = alTop
              Caption = 
                'Aten'#231#227'o: Esse recurso s'#243' funciona corretamente com impressoras c' +
                'onectadas no mesmo computador onde est'#225' instalado o NexServ.'
              Style.TextColor = clRed
              Style.TextStyle = []
              Properties.WordWrap = True
              Width = 529
            end
            object panPMCotasMaxPagDia: TLMDSimplePanel
              Left = 0
              Top = 53
              Width = 547
              Height = 31
              Align = alTop
              Bevel.Mode = bmCustom
              TabOrder = 3
              object lbPMCotasMaxPagDia: TcxLabel
                AlignWithMargins = True
                Left = 33
                Top = 5
                Margins.Left = 33
                Margins.Top = 5
                Align = alLeft
                Caption = '2. Cota di'#225'ria de impress'#227'o. P'#225'ginas:'
                ParentFont = False
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
              end
              object edPMCotasMaxPagDia: TcxDBSpinEdit
                Left = 228
                Top = 5
                DataBinding.DataField = 'PMCotasMaxPagDia'
                DataBinding.DataSource = DS
                Style.BorderStyle = ebsFlat
                TabOrder = 1
                Width = 73
              end
              object lbPMCotasMaxPagDia2: TcxLabel
                Left = 306
                Top = 6
                Caption = 'Deixe 0 caso n'#227'o exista limita'#231#227'o di'#225'ria.'
              end
            end
            object panPMCotasMaxPagMes: TLMDSimplePanel
              Left = 0
              Top = 84
              Width = 547
              Height = 31
              Align = alTop
              Bevel.Mode = bmCustom
              TabOrder = 4
              object lbPMCotasMaxPagMes: TcxLabel
                AlignWithMargins = True
                Left = 33
                Top = 5
                Margins.Left = 33
                Margins.Top = 5
                Align = alLeft
                Caption = '3. Cota mensal de impress'#227'o.  P'#225'ginas:'
                ParentFont = False
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
              end
              object edPMCotasMaxPagMes: TcxDBSpinEdit
                Left = 228
                Top = 4
                DataBinding.DataField = 'PMCotasMaxPagMes'
                DataBinding.DataSource = DS
                Style.BorderStyle = ebsFlat
                TabOrder = 1
                Width = 73
              end
              object lbPMCotasMaxPagMes2: TcxLabel
                Left = 307
                Top = 6
                Caption = 'Deixe 0 caso n'#227'o exista limita'#231#227'o mensal.'
              end
            end
            object LMDSimplePanel6: TLMDSimplePanel
              Left = 0
              Top = 120
              Width = 547
              Height = 31
              Align = alTop
              Bevel.Mode = bmCustom
              TabOrder = 5
              object lbPMCotasOpCota: TcxLabel
                AlignWithMargins = True
                Left = 33
                Top = 5
                Margins.Left = 33
                Margins.Top = 5
                Align = alLeft
                Caption = '5. Quando cliente imprimir DENTRO da cota: '
                ParentFont = False
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
              end
              object edPMCotasOpCota: TcxDBImageComboBox
                Left = 252
                Top = 4
                DataBinding.DataField = 'PMCotasOpCota'
                DataBinding.DataSource = DS
                Properties.ImmediatePost = True
                Properties.ImmediateUpdateText = True
                Properties.Items = <
                  item
                    Description = 'Liberar impress'#227'o automaticamente'
                    ImageIndex = 0
                    Value = 0
                  end
                  item
                    Description = 'Aguardar libera'#231#227'o da impress'#227'o'
                    Value = 1
                  end>
                Style.BorderStyle = ebsFlat
                TabOrder = 1
                Width = 285
              end
            end
            object LMDSimplePanel7: TLMDSimplePanel
              Left = 0
              Top = 151
              Width = 547
              Height = 72
              Align = alTop
              Bevel.Mode = bmCustom
              TabOrder = 6
              object lbPMCotasOpExcesso: TcxLabel
                AlignWithMargins = True
                Left = 33
                Top = 5
                Margins.Left = 33
                Margins.Top = 5
                Caption = '6. Quando cliente imprimir ACIMA da cota: '
                ParentFont = False
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
              end
              object edPMCotasOpExcesso: TcxDBImageComboBox
                Left = 252
                Top = 4
                DataBinding.DataField = 'PMCotasOpExcesso'
                DataBinding.DataSource = DS
                Properties.ImmediatePost = True
                Properties.ImmediateUpdateText = True
                Properties.Items = <
                  item
                    Description = 'Cancelar impress'#227'o automaticamente'
                    ImageIndex = 0
                    Value = 0
                  end
                  item
                    Description = 'Permitir que o atende libere a impress'#227'o'
                    Value = 1
                  end>
                Style.BorderStyle = ebsFlat
                TabOrder = 1
                Width = 285
              end
              object lbPMCotasMaxExcesso: TcxLabel
                AlignWithMargins = True
                Left = 33
                Top = 31
                Margins.Left = 33
                Margins.Top = 5
                Caption = '6.1 M'#225'ximo de p'#225'ginas permitido liberar acima da cota:'
                ParentFont = False
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
              end
              object edPMCotasMaxExcesso: TcxDBSpinEdit
                Left = 303
                Top = 31
                DataBinding.DataField = 'PMCotasMaxExcesso'
                DataBinding.DataSource = DS
                Style.BorderStyle = ebsFlat
                TabOrder = 3
                Width = 73
              end
            end
          end
        end
      end
      object nbgFundoControl: TdxNavBarGroupControl
        Left = 0
        Top = 228
        Width = 692
        Height = 353
        TabOrder = 13
        GroupIndex = 11
        OriginalHeight = 353
        object cxGroupBox2: TcxGroupBox
          Left = 16
          Top = 16
          Caption = ' Tela de LOGIN '
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextStyle = [fsBold]
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Height = 185
          Width = 433
          object btnFundoLogin2: TcxButton
            Left = 52
            Top = 50
            Width = 153
            Height = 41
            Caption = 'Selecionar imagem'
            TabOrder = 1
            OnClick = btnFundoLoginClick
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = True
            OptionsImage.Glyph.Data = {
              36100000424D3610000000000000360000002800000020000000200000000100
              2000000000000010000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0001000000010000000100000001000000010000000100000001000000010000
              0001000000010000000100000001000000010000000100000001000000010000
              0001000000010000000100000001000000010000000100000001000000010000
              0001000000010000000100000001000000010000000100000000000000070000
              001C000000270000002700000027000000270000002700000027000000270000
              0027000000270000002700000027000000270000002700000027000000270000
              0027000000270000002700000027000000270000002700000027000000270000
              0027000000270000002700000027000000270000001F000000080000001C0000
              006A0000008D0000009100000092000000920000009200000092000000920000
              0092000000920000009200000092000000920000009200000092000000920000
              0092000000920000009200000092000000920000009200000092000000920000
              009200000092000000920000009200000090000000730000001FC0978DE6D7A9
              9EFFD6A79CFFD4A69CFFD5A59BFFD3A59BFFD4A49BFFD2A39BFFD3A19BFFD1A2
              9AFFD2A09AFFD09F9AFFD0A09AFFD19E99FFCF9D99FFD09C99FFCE9D98FFCF9B
              98FFCD9A97FFCD9997FFCC9A97FFCC9898FFCB9796FFCB9896FFCB9697FFCB96
              97FFCB9697FFCB9697FFCC9798FFCC9999FF0000009000000027BF948AE6FFFD
              EFFFFFFCEEFFFFFDEDFFFFFCEFFFFFFCEFFFFFFCEFFFFFFCF1FFFFFCF0FFFFFD
              F0FFFFFDF1FFFFFDEFFFFFFDEFFFFFFDF0FFFFFCEEFFFFFCEDFFFFFCEEFFFFFB
              ECFFFFFBE9FFFFFAE8FFFFFAE8FFFFF9E5FFFFF9E4FFFFF8E3FFFFF8E1FFFFF7
              DFFFFFF6DEFFFFF6DCFFFFFBDEFFCC9899FF0000009200000027BE9488E6FFF9
              ECFFFFF7EAFFFFFAEFFFFFFBF5FFFFFDF5FFFFFCF5FFFFFCF5FFFFFCF7FFFFFC
              F7FFFFFCF5FFFFFCF5FFFFFDF6FFFFFBF4FFFFFBF5FFFFFBF4FFFFFCF3FFFFFA
              F2FFFFFBF1FFFFF9F0FFFFFAEFFFFFF9EDFFFFFAECFFFFF9E9FFFFF8E8FFFFF8
              E5FFFFF3DEFFFFEFD8FFFFF6DCFFCB9798FF0000009200000027BF9788E6FFF8
              ECFFFFFCF0FFAFBBACFF5AAE6DFF60AF70FF60B070FF60B06FFF60B16EFF61AF
              6EFF61AF6DFF60B06CFF60AE6CFF60AF69FF5FB069FF5FAE67FF60AF66FF5FAE
              65FF60B065FF5EB063FF5FAC61FF5DA55EFF5E9E5DFF619B61FF639962FF6197
              63FFB8C4B0FFFFF3DEFFFFF6DDFFCB9798FF0000009200000027C19789E6FFF9
              EFFFFFFCF4FFA1BFA3FF15BC3DFF1DBB43FF1CBA41FF1BB93FFF19B73BFF17B5
              36FF15B332FF13B12EFF11AF28FF0EAD24FF0DAB21FF0AA91DFF07A417FF0096
              09FF008900FF007C00FF007600FF007200FF006F00FF006C00FF006900FF0061
              00FF94B38FFFFFF5E1FFFFF7DEFFCB9898FF0000009200000027C09789E6FFFB
              EFFFFFFDF4FFA2C0A5FF1DBF47FF25BE4CFF24BD4BFF22BB46FF20B943FF1EB7
              3EFF1CB53AFF19B235FF17B131FF16B02FFF10A923FF06930CFF008400FF0080
              00FF007F00FF007D00FF007900FF007600FF007300FF007100FF006E00FF0067
              00FF97B592FFFFF6E4FFFFF7E0FFCC9998FF0000009200000027C1988AE6FFFA
              F3FFFFFEF7FFA2C0A7FF20C24DFF28C151FF27C050FF25BE4BFF22BB48FF20B9
              42FF1EB73DFF1CB539FF19B335FF099A13FF008700FF008600FF008500FF0082
              00FF008000FF007E00FF007B00FF007800FF007500FF007300FF007100FF006A
              00FF96B692FFFFF6E5FFFFF8E1FFCD9A99FF0000009200000027C2998AE6FFFB
              F3FFFFFEF7FFA3C1A7FF23C554FF2BC456FF29C253FF27C04FFF24BD4AFF23BC
              46FF20BA43FF19B234FF039305FF008C00FF008A00FF007F00FF007500FF0F81
              2DFF128838FF018103FF007B00FF007A00FF007700FF007500FF007400FF006D
              00FF96B592FFFFF7E6FFFFF8E2FFCF9B98FF0000009200000027C39A8AE6FFFD
              F6FFFFFFFAFFA2C0A9FF27C959FF2DC65BFF2BC458FF28C152FF27C04EFF26C1
              4CFF15A72CFF009100FF008B00FF007A00FF07711AFF2F93ADFF4AAEFFFF4CB1
              FFFF4BB0FFFF4AAEFFFF168D53FF007B00FF007A00FF007800FF007600FF0072
              00FF96B692FFFFF7E7FFFFF9E3FFCE9C9AFF0000009200000027C39B8BE6FFFC
              F6FFFFFFFAFFA4C2AAFF29CB5FFF30C960FF2DC65BFF2AC557FF24C14DFF027F
              0EFF005900FF005C00FF146D11FF338E99FF3DA4FFFF3EA4FFFF3CA2FFFF3BA1
              FFFF3BA1FFFF3CA2FFFF3FA3FFFF188B68FF007B00FF007B00FF007900FF0075
              00FF95B790FFFFF8E8FFFFF9E4FFCF9D99FF0000009200000027C49C8AE6FFFD
              F7FFFFFFFDFFA3C3ACFF2DD065FF33CF65FF2DCB5EFF0F9E2BFF2B7E2EFF82A7
              8CFFB5C4C6FFC6CEDAFFD4D4E3FF73AFF5FF2A94FFFF2F95FFFF2F95FFFF2F95
              FFFF2F95FFFF2F95FFFF2F95FFFF3498FFFF128760FF007D00FF007D00FF0078
              00FF95B890FFFFF8E9FFFFF8E5FFD09F99FF0000009200000027C69D8DE6FFFD
              FAFFFFFFFEFF9CB39DFF038616FF027F12FF117014FF99AF9BFFD6D2DEFFCECF
              D6FFCBCDD2FFC8CDD1FFCACDD0FFB1C2D8FF1886FFFF248AFFFF248AFFFF248A
              FFFF248AFFFF248AFFFF248AFFFF248AFFFF238AFFFF329278FF007D00FF0076
              00FF91B78BFFFFF8EAFFFFFAE6FFD2A09BFF0000009200000027C6A08CE6FFFE
              FAFFFFFFFFFFA3B2A1FF327D2EFF81A47BFFDAD1D3FFD5D0CFFFD1CECBFFCDCC
              C9FFCDCCCAFFCCCCCAFFCCCCCBFFD4D0CAFF6AA2E8FF0D7AFFFF197FFFFF197F
              FFFF197FFFFF197FFFFF197FFFFF147EFFFF2787FDFFD2D1D9FFCCCED5FFAFC2
              B9FFD3D1D4FFFFF7E7FFFFF9E6FFD1A19AFF0000009200000027C7A08CE6FFFE
              FBFFFFFFFFFFC7C3C2FFE0D1CAFFDDD1CAFFDBD2C8FFC3BCB4FFB7B1AAFFD5CE
              C6FFD2CDC4FFD5CFC8FFD3CEC6FFD4CFC7FFDBD2C5FF6FA0E3FF016EFFFF0470
              FFFF0771FFFF0671FFFF006DFFFF3486F4FFC7C9CDFFCFCDCBFFCDCDCCFFCCCD
              CFFFD1CFCDFFFFF7E6FFFFF9E7FFD2A29CFF0000009200000027C8A18EE6FFFE
              FCFFFFFFFFFFC4C1BEFFDECDBCFFD0C1B3FF968D84FF90877EFFC9BEB0FFD5C8
              BCFFE2D4C8FF9C948CFFCAC0B4FFB6ADA5FFD9CDC2FFDFD1C0FFCCC8C5FF7EA3
              DCFF6196E5FF6D9BE0FFABB8D0FFE0D1C1FFD5CDC5FFD1CCC5FFD1CCC6FFD0CC
              C6FFD2CECAFFFFF7E8FFFFF9E9FFD4A49BFF0000009200000027C9A48DE6FFFF
              FEFFFFFFFFFFC4C1BDFFE2CDB6FFE1CDB8FFE4D0BAFFE4D1BCFFE3D0BCFFAB9E
              90FF797068FF968B80FF958A7FFFC5B6A8FFDCCEBCFFDCCCBCFFDCCDBCFFE1CF
              BCFFE2D0BCFFE1D0BDFFDCCEBEFFD9CDBFFFD7CCBFFFD7CCC0FFD6CCC0FFD6CC
              C1FFD2CFC8FFFFF7E7FFFFF9E8FFD3A59BFF0000009200000027C9A48DE6FEFF
              FDFFFFFFFFFFC4BFBBFFE9CDB1FFE7CDB2FFE6CDB3FFE7CFB4FFE1C9B1FFDDC5
              AFFFF6DBC2FFB1A190FFE9D2BBFFE3CEB7FFE2CCB7FFE0CCB6FFE0CCB7FFDFCC
              B7FFDFCCB8FFDECCB8FFDECCB9FFDDCCB9FFDDCCBAFFDCCCBAFFDCCCBBFFDBCC
              BBFFD3CDC6FFFFF7E9FFFFFBE8FFD4A69DFF0000009200000027CAA58EE6FEFF
              FDFFFFFFFFFFC5BFBAFFEFCEACFFCCB397FFE8C8ABFFDEC2A6FF48433DFF4842
              3CFF665C52FFBAA58EFFEACFB1FFE7CCB0FFE6CCB0FFE6CCB1FFE5CCB1FFE5CC
              B2FFE4CCB2FFE4CCB3FFE4CCB3FFE3CCB4FFE3CCB4FFE2CCB5FFE2CCB5FFE2CC
              B6FFD5CDC4FFFFF8E9FFFFFAE8FFD6A79CFF0000009200000027CBA68EE6FEFE
              FDFFFFFFFFFFC5C0BAFFF5CDA5FFF0CBA6FF907C68FF6E6052FFC8AB8EFFFCD9
              B2FFF7D4B0FFF1CFACFFEDCCABFFECCCAAFFECCCABFFECCCABFFEBCCACFFEBCC
              ACFFEACCADFFEACCADFFE9CCAEFFE9CCAEFFE8CCAFFFE8CCAFFFE7CCB0FFE8CC
              AFFFD6CEC2FFFFF8E9FFFFF9E8FFD8A89EFF0000009200000027CCA78FE6FFFE
              FFFFFFFFFFFFC8BFB7FFFDCFA0FFFBCFA2FFFFD3A5FFFFD5A7FFFDD1A5FFF8CE
              A3FFF7CDA3FFF6CDA4FFF6CDA4FFF5CDA5FFF5CDA5FFF4CDA6FFF4CDA6FFF3CD
              A7FFF3CDA7FFF1CDA8FFF2CDA8FFF0CDA9FFF1CDA9FFEFCDAAFFF0CDAAFFEFCD
              AAFFD7CDC0FFFFF8E9FFFFF9E8FFD7A99DFF0000009200000027CCA98EE6FFFE
              FDFFFFFFFFFFBAB5B1FFCAAE91FFC9AE95FFC9AF96FFCBB097FFCAB298FFCCB1
              99FFCCB39AFFCDB49BFFCDB69CFFCEB59EFFCEB79FFFCEB8A0FFCFB8A2FFCFB9
              A3FFD1BAA4FFD0BBA5FFD2BBA6FFD2BDA8FFD4BEA9FFD3BFABFFD5C1ACFFD5C0
              ABFFCEC7C0FFFFF7E9FFFFFAE8FFD8AA9DFF0000009200000027CCAA8EE6FFFE
              FEFFFFFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFF
              FDFFFFFEFAFFFFFCF8FFFFFDF7FFFFFBF4FFFFFAF2FFFFFBF1FFFFF9EFFFFFF7
              ECFFFFF7EAFFFFF4E5FFFFF8E8FFD9AB9FFF0000009000000027CEAB92E6FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FEFFFFFFFCFFFFFFF9FFFFFEF9FFFFFFF6FFFFFDF4FFFFFCF2FFFFFBF1FFFFFC
              EFFFFFFAECFFFFF9EAFFFFFEEDFFDBAEA0FF000000730000001FE0BCA1F4EAC4
              A7FFEAC3A6FFE8C2A6FFE9C0A4FFE7BFA4FFE7C0A4FFE6BEA5FFE6BDA3FFE5BC
              A3FFE5BCA3FFE4BBA4FFE3B9A2FFE3B8A2FFE3B9A3FFE2B7A1FFE1B6A1FFE1B5
              A2FFE0B6A2FFE0B4A1FFDFB3A1FFDFB2A1FFDDB3A0FFDEB1A0FFDCB09FFFDDAF
              9FFFDBAEA0FFDCAF9EFFDBAFA0FFDAAFA1FF0000001F00000008000000000000
              0001000000010000000100000001000000010000000100000001000000010000
              0001000000010000000100000001000000010000000100000001000000010000
              0001000000010000000100000001000000010000000100000001000000010000
              0001000000010000000100000001000000010000000100000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000}
          end
          object rbFundoWeb: TcxRadioButton
            Left = 21
            Top = 112
            Width = 228
            Height = 17
            Caption = '2- Usar p'#225'gina web como fundo de tela'
            TabOrder = 2
            OnClick = rbFundoWebClick
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
          end
          object cxLabel62: TcxLabel
            Left = 40
            Top = 135
            Caption = 'URL:'
          end
          object edFundoWebURL: TcxTextEdit
            Left = 72
            Top = 136
            Properties.OnChange = edFundoWebURLPropertiesEditValueChanged
            Properties.OnEditValueChanged = edFundoWebURLPropertiesEditValueChanged
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 4
            Width = 345
          end
          object rbFundoImg: TcxRadioButton
            Left = 21
            Top = 27
            Width = 188
            Height = 17
            Caption = '1- Usar imagem como fundo de tela'
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = rbFundoImgClick
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
          end
        end
        object btnFundoDesktop2: TcxButton
          Left = 30
          Top = 245
          Width = 153
          Height = 41
          Caption = 'Selecionar imagem'
          TabOrder = 1
          OnClick = btnFundoDesktopClick
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = True
          OptionsImage.Glyph.Data = {
            36100000424D3610000000000000360000002800000020000000200000000100
            2000000000000010000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0001000000010000000100000001000000010000000100000001000000010000
            0001000000010000000100000001000000010000000100000001000000010000
            0001000000010000000100000001000000010000000100000001000000010000
            0001000000010000000100000001000000010000000100000000000000070000
            001C000000270000002700000027000000270000002700000027000000270000
            0027000000270000002700000027000000270000002700000027000000270000
            0027000000270000002700000027000000270000002700000027000000270000
            0027000000270000002700000027000000270000001F000000080000001C0000
            006A0000008D0000009100000092000000920000009200000092000000920000
            0092000000920000009200000092000000920000009200000092000000920000
            0092000000920000009200000092000000920000009200000092000000920000
            009200000092000000920000009200000090000000730000001FC0978DE6D7A9
            9EFFD6A79CFFD4A69CFFD5A59BFFD3A59BFFD4A49BFFD2A39BFFD3A19BFFD1A2
            9AFFD2A09AFFD09F9AFFD0A09AFFD19E99FFCF9D99FFD09C99FFCE9D98FFCF9B
            98FFCD9A97FFCD9997FFCC9A97FFCC9898FFCB9796FFCB9896FFCB9697FFCB96
            97FFCB9697FFCB9697FFCC9798FFCC9999FF0000009000000027BF948AE6FFFD
            EFFFFFFCEEFFFFFDEDFFFFFCEFFFFFFCEFFFFFFCEFFFFFFCF1FFFFFCF0FFFFFD
            F0FFFFFDF1FFFFFDEFFFFFFDEFFFFFFDF0FFFFFCEEFFFFFCEDFFFFFCEEFFFFFB
            ECFFFFFBE9FFFFFAE8FFFFFAE8FFFFF9E5FFFFF9E4FFFFF8E3FFFFF8E1FFFFF7
            DFFFFFF6DEFFFFF6DCFFFFFBDEFFCC9899FF0000009200000027BE9488E6FFF9
            ECFFFFF7EAFFFFFAEFFFFFFBF5FFFFFDF5FFFFFCF5FFFFFCF5FFFFFCF7FFFFFC
            F7FFFFFCF5FFFFFCF5FFFFFDF6FFFFFBF4FFFFFBF5FFFFFBF4FFFFFCF3FFFFFA
            F2FFFFFBF1FFFFF9F0FFFFFAEFFFFFF9EDFFFFFAECFFFFF9E9FFFFF8E8FFFFF8
            E5FFFFF3DEFFFFEFD8FFFFF6DCFFCB9798FF0000009200000027BF9788E6FFF8
            ECFFFFFCF0FFAFBBACFF5AAE6DFF60AF70FF60B070FF60B06FFF60B16EFF61AF
            6EFF61AF6DFF60B06CFF60AE6CFF60AF69FF5FB069FF5FAE67FF60AF66FF5FAE
            65FF60B065FF5EB063FF5FAC61FF5DA55EFF5E9E5DFF619B61FF639962FF6197
            63FFB8C4B0FFFFF3DEFFFFF6DDFFCB9798FF0000009200000027C19789E6FFF9
            EFFFFFFCF4FFA1BFA3FF15BC3DFF1DBB43FF1CBA41FF1BB93FFF19B73BFF17B5
            36FF15B332FF13B12EFF11AF28FF0EAD24FF0DAB21FF0AA91DFF07A417FF0096
            09FF008900FF007C00FF007600FF007200FF006F00FF006C00FF006900FF0061
            00FF94B38FFFFFF5E1FFFFF7DEFFCB9898FF0000009200000027C09789E6FFFB
            EFFFFFFDF4FFA2C0A5FF1DBF47FF25BE4CFF24BD4BFF22BB46FF20B943FF1EB7
            3EFF1CB53AFF19B235FF17B131FF16B02FFF10A923FF06930CFF008400FF0080
            00FF007F00FF007D00FF007900FF007600FF007300FF007100FF006E00FF0067
            00FF97B592FFFFF6E4FFFFF7E0FFCC9998FF0000009200000027C1988AE6FFFA
            F3FFFFFEF7FFA2C0A7FF20C24DFF28C151FF27C050FF25BE4BFF22BB48FF20B9
            42FF1EB73DFF1CB539FF19B335FF099A13FF008700FF008600FF008500FF0082
            00FF008000FF007E00FF007B00FF007800FF007500FF007300FF007100FF006A
            00FF96B692FFFFF6E5FFFFF8E1FFCD9A99FF0000009200000027C2998AE6FFFB
            F3FFFFFEF7FFA3C1A7FF23C554FF2BC456FF29C253FF27C04FFF24BD4AFF23BC
            46FF20BA43FF19B234FF039305FF008C00FF008A00FF007F00FF007500FF0F81
            2DFF128838FF018103FF007B00FF007A00FF007700FF007500FF007400FF006D
            00FF96B592FFFFF7E6FFFFF8E2FFCF9B98FF0000009200000027C39A8AE6FFFD
            F6FFFFFFFAFFA2C0A9FF27C959FF2DC65BFF2BC458FF28C152FF27C04EFF26C1
            4CFF15A72CFF009100FF008B00FF007A00FF07711AFF2F93ADFF4AAEFFFF4CB1
            FFFF4BB0FFFF4AAEFFFF168D53FF007B00FF007A00FF007800FF007600FF0072
            00FF96B692FFFFF7E7FFFFF9E3FFCE9C9AFF0000009200000027C39B8BE6FFFC
            F6FFFFFFFAFFA4C2AAFF29CB5FFF30C960FF2DC65BFF2AC557FF24C14DFF027F
            0EFF005900FF005C00FF146D11FF338E99FF3DA4FFFF3EA4FFFF3CA2FFFF3BA1
            FFFF3BA1FFFF3CA2FFFF3FA3FFFF188B68FF007B00FF007B00FF007900FF0075
            00FF95B790FFFFF8E8FFFFF9E4FFCF9D99FF0000009200000027C49C8AE6FFFD
            F7FFFFFFFDFFA3C3ACFF2DD065FF33CF65FF2DCB5EFF0F9E2BFF2B7E2EFF82A7
            8CFFB5C4C6FFC6CEDAFFD4D4E3FF73AFF5FF2A94FFFF2F95FFFF2F95FFFF2F95
            FFFF2F95FFFF2F95FFFF2F95FFFF3498FFFF128760FF007D00FF007D00FF0078
            00FF95B890FFFFF8E9FFFFF8E5FFD09F99FF0000009200000027C69D8DE6FFFD
            FAFFFFFFFEFF9CB39DFF038616FF027F12FF117014FF99AF9BFFD6D2DEFFCECF
            D6FFCBCDD2FFC8CDD1FFCACDD0FFB1C2D8FF1886FFFF248AFFFF248AFFFF248A
            FFFF248AFFFF248AFFFF248AFFFF248AFFFF238AFFFF329278FF007D00FF0076
            00FF91B78BFFFFF8EAFFFFFAE6FFD2A09BFF0000009200000027C6A08CE6FFFE
            FAFFFFFFFFFFA3B2A1FF327D2EFF81A47BFFDAD1D3FFD5D0CFFFD1CECBFFCDCC
            C9FFCDCCCAFFCCCCCAFFCCCCCBFFD4D0CAFF6AA2E8FF0D7AFFFF197FFFFF197F
            FFFF197FFFFF197FFFFF197FFFFF147EFFFF2787FDFFD2D1D9FFCCCED5FFAFC2
            B9FFD3D1D4FFFFF7E7FFFFF9E6FFD1A19AFF0000009200000027C7A08CE6FFFE
            FBFFFFFFFFFFC7C3C2FFE0D1CAFFDDD1CAFFDBD2C8FFC3BCB4FFB7B1AAFFD5CE
            C6FFD2CDC4FFD5CFC8FFD3CEC6FFD4CFC7FFDBD2C5FF6FA0E3FF016EFFFF0470
            FFFF0771FFFF0671FFFF006DFFFF3486F4FFC7C9CDFFCFCDCBFFCDCDCCFFCCCD
            CFFFD1CFCDFFFFF7E6FFFFF9E7FFD2A29CFF0000009200000027C8A18EE6FFFE
            FCFFFFFFFFFFC4C1BEFFDECDBCFFD0C1B3FF968D84FF90877EFFC9BEB0FFD5C8
            BCFFE2D4C8FF9C948CFFCAC0B4FFB6ADA5FFD9CDC2FFDFD1C0FFCCC8C5FF7EA3
            DCFF6196E5FF6D9BE0FFABB8D0FFE0D1C1FFD5CDC5FFD1CCC5FFD1CCC6FFD0CC
            C6FFD2CECAFFFFF7E8FFFFF9E9FFD4A49BFF0000009200000027C9A48DE6FFFF
            FEFFFFFFFFFFC4C1BDFFE2CDB6FFE1CDB8FFE4D0BAFFE4D1BCFFE3D0BCFFAB9E
            90FF797068FF968B80FF958A7FFFC5B6A8FFDCCEBCFFDCCCBCFFDCCDBCFFE1CF
            BCFFE2D0BCFFE1D0BDFFDCCEBEFFD9CDBFFFD7CCBFFFD7CCC0FFD6CCC0FFD6CC
            C1FFD2CFC8FFFFF7E7FFFFF9E8FFD3A59BFF0000009200000027C9A48DE6FEFF
            FDFFFFFFFFFFC4BFBBFFE9CDB1FFE7CDB2FFE6CDB3FFE7CFB4FFE1C9B1FFDDC5
            AFFFF6DBC2FFB1A190FFE9D2BBFFE3CEB7FFE2CCB7FFE0CCB6FFE0CCB7FFDFCC
            B7FFDFCCB8FFDECCB8FFDECCB9FFDDCCB9FFDDCCBAFFDCCCBAFFDCCCBBFFDBCC
            BBFFD3CDC6FFFFF7E9FFFFFBE8FFD4A69DFF0000009200000027CAA58EE6FEFF
            FDFFFFFFFFFFC5BFBAFFEFCEACFFCCB397FFE8C8ABFFDEC2A6FF48433DFF4842
            3CFF665C52FFBAA58EFFEACFB1FFE7CCB0FFE6CCB0FFE6CCB1FFE5CCB1FFE5CC
            B2FFE4CCB2FFE4CCB3FFE4CCB3FFE3CCB4FFE3CCB4FFE2CCB5FFE2CCB5FFE2CC
            B6FFD5CDC4FFFFF8E9FFFFFAE8FFD6A79CFF0000009200000027CBA68EE6FEFE
            FDFFFFFFFFFFC5C0BAFFF5CDA5FFF0CBA6FF907C68FF6E6052FFC8AB8EFFFCD9
            B2FFF7D4B0FFF1CFACFFEDCCABFFECCCAAFFECCCABFFECCCABFFEBCCACFFEBCC
            ACFFEACCADFFEACCADFFE9CCAEFFE9CCAEFFE8CCAFFFE8CCAFFFE7CCB0FFE8CC
            AFFFD6CEC2FFFFF8E9FFFFF9E8FFD8A89EFF0000009200000027CCA78FE6FFFE
            FFFFFFFFFFFFC8BFB7FFFDCFA0FFFBCFA2FFFFD3A5FFFFD5A7FFFDD1A5FFF8CE
            A3FFF7CDA3FFF6CDA4FFF6CDA4FFF5CDA5FFF5CDA5FFF4CDA6FFF4CDA6FFF3CD
            A7FFF3CDA7FFF1CDA8FFF2CDA8FFF0CDA9FFF1CDA9FFEFCDAAFFF0CDAAFFEFCD
            AAFFD7CDC0FFFFF8E9FFFFF9E8FFD7A99DFF0000009200000027CCA98EE6FFFE
            FDFFFFFFFFFFBAB5B1FFCAAE91FFC9AE95FFC9AF96FFCBB097FFCAB298FFCCB1
            99FFCCB39AFFCDB49BFFCDB69CFFCEB59EFFCEB79FFFCEB8A0FFCFB8A2FFCFB9
            A3FFD1BAA4FFD0BBA5FFD2BBA6FFD2BDA8FFD4BEA9FFD3BFABFFD5C1ACFFD5C0
            ABFFCEC7C0FFFFF7E9FFFFFAE8FFD8AA9DFF0000009200000027CCAA8EE6FFFE
            FEFFFFFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFF
            FDFFFFFEFAFFFFFCF8FFFFFDF7FFFFFBF4FFFFFAF2FFFFFBF1FFFFF9EFFFFFF7
            ECFFFFF7EAFFFFF4E5FFFFF8E8FFD9AB9FFF0000009000000027CEAB92E6FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FEFFFFFFFCFFFFFFF9FFFFFEF9FFFFFFF6FFFFFDF4FFFFFCF2FFFFFBF1FFFFFC
            EFFFFFFAECFFFFF9EAFFFFFEEDFFDBAEA0FF000000730000001FE0BCA1F4EAC4
            A7FFEAC3A6FFE8C2A6FFE9C0A4FFE7BFA4FFE7C0A4FFE6BEA5FFE6BDA3FFE5BC
            A3FFE5BCA3FFE4BBA4FFE3B9A2FFE3B8A2FFE3B9A3FFE2B7A1FFE1B6A1FFE1B5
            A2FFE0B6A2FFE0B4A1FFDFB3A1FFDFB2A1FFDDB3A0FFDEB1A0FFDCB09FFFDDAF
            9FFFDBAEA0FFDCAF9EFFDBAFA0FFDAAFA1FF0000001F00000008000000000000
            0001000000010000000100000001000000010000000100000001000000010000
            0001000000010000000100000001000000010000000100000001000000010000
            0001000000010000000100000001000000010000000100000001000000010000
            0001000000010000000100000001000000010000000100000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
        end
        object cxLabel63: TcxLabel
          Left = 16
          Top = 225
          Caption = '3- Imagem de fundo para '#193'REA DE TRABALHO'
          Style.TextStyle = [fsBold]
        end
        object pan_poslogin: TLMDSimplePanel
          Left = 461
          Top = 22
          Width = 212
          Height = 307
          Bevel.Mode = bmEdge
          TabOrder = 3
          object im_poslogin_centro: TcxImage
            Left = 16
            Top = 19
            Cursor = crHandPoint
            AutoSize = True
            Picture.Data = {
              0A544A504547496D616765BB080000FFD8FFE000104A46494600010101006000
              600000FFDB004300010101010101010101010101010202030202020202040303
              0203050405050504040405060706050507060404060906070808080808050609
              0A09080A07080808FFDB00430101010102020204020204080504050808080808
              0808080808080808080808080808080808080808080808080808080808080808
              08080808080808080808080808FFC0001108004C006603012200021101031101
              FFC4001F0000010501010101010100000000000000000102030405060708090A
              0BFFC400B5100002010303020403050504040000017D01020300041105122131
              410613516107227114328191A1082342B1C11552D1F02433627282090A161718
              191A25262728292A3435363738393A434445464748494A535455565758595A63
              6465666768696A737475767778797A838485868788898A92939495969798999A
              A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
              D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
              01010101010101010000000000000102030405060708090A0BFFC400B5110002
              0102040403040705040400010277000102031104052131061241510761711322
              328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
              292A35363738393A434445464748494A535455565758595A636465666768696A
              737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
              A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
              E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00E5E8
              A28AFF00A503FE7DC28A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
              028A28A0028A2A87FC1293FE0949FB0D7ED4DFB0D7C25F8DBF1B7E12EA7E2BF8
              93AADD6B115FDFC5E24D4ED16758353B9823FDD413A46088E24048519C64E492
              4FF3AF8FBE3EAE065866F0DEDD57E7FB6E16E4705D213BDF9FCAD63F7AF047C1
              17C64F109623D8BA3C9F614AFCCA6FACA36B72F9DEE5FA2BF41FFE1C3FFF0004
              C3FF00A207ADFF00E165ACFF00F2551FF0E1FF00F8261FFD103D6FFF000B2D67
              FF0092ABF9BBFE2A074BFE85ABFF00074BFF00949FBFFF00C48E54FF00A183FF
              00C151FF00E5A7E7C515FA0FFF000E1FFF008261FF00D103D6FF00F0B2D67FF9
              2A8FF870FF00FC130FFE881EB7FF008596B3FF00C9547FC540E97FD0B57FE0E9
              7FF290FF00891CA9FF004307FF0082A3FF00CB4FCF8A2BF41FFE1C3FFF0004C3
              FF00A207ADFF00E165ACFF00F2557E32F85BE0A7C38FD9CBF6E5FDBD7E097C21
              D0E6F0CFC36D06EBC25169760F7735D35BACBA6493C999666791C992690E598E
              3200E0003F4AF093E97D1E2ACFA86491C0AA7ED79BDEF68E56B4273D9D38DEFC
              B6DD5AF73F3EF143E8B12E1AC96B66F2C63A9ECEDEEFB34AF79463BAA92B5B9A
              FB74B1F49D14515FDA27F238514514005145140057E83FFC107FFE5187F00FFE
              BFBC43FF00A79BCAFCF8AFD07FF820FF00FCA30FE01FFD7F7887FF004F3795FE
              727ED03FE165BE95BFF4AA27F7CFD073F89987AD2FFD26A9F6C7ECD5F157C65F
              12FC5DFB5E691E2CBDB5BBB1F087C55B8F0AE86B15BAC660D39743D22EC23951
              F3B79B7D7277B738603A015F08F853F69EFDAAA4F829F07BF6EDD6FE247C3AD5
              3E1078C3C47A1D8C9F0AA1F0E08E7D2B4BD5B57834D816DF58F34CB3EA56FF00
              698A6943C6227293C61130AE3EDAD53F613FD9A755F8A3AE7C6593C33F1074EF
              1FEA7ACC3E20D467D37E207886C2D2F7508D22459E5B0B7BE4B563B2DA042A62
              DACA8030238AB5A27EC33FB2B7873E2941F18F46F84F6B69E3487549B5CB68CE
              AD7F269565A9CA497BDB7D21A73610DD16677F3E381640ECCC1833127FCCA3FD
              0F3F3E340FDB23E3C9F0BFECD5FB4E78D7F680F873E0CF007C4AF10429A7FC3C
              9FE1BEAB7B6361A4497F15A1B5BAF10584770F6BAB29BAB750F70B15BBDC6E8F
              6ED5765F3FF087FC1453F687D17E2EFC0FD5FE20EA5E1CD57F67D95FC4D6FF00
              10255D3E1825D1ADC78E354F0FE9BA909401B6181A0D2E39B9C796F248412091
              FA5C7FE09F3FB1F9F1EBFC471F072D535C6D6C7895AC9759D457466D58482517
              A746171F60371E6287F33C8DC586739AEA2CBF62CFD992C34AF1468707C2EB59
              348D6BC3FACF85B53B79B53BD992EF4BD4F51B8D46FA021E638F36EEF2E66DEB
              874DFB519155540045FB0EFC55F197C71FD90BF676F8BDF10AF6D751F1BF88BC
              2B63AAEA93C16EB0472DC48996658D005519EC38AFE78FE247FCA4F3FE0A4BFF
              005FDE0CFF00D3357F513F0BFE197823E0CFC3CF077C2AF86BA27FC237E01D02
              C22D3349B0FB4CD71F64B68C6113CD99DE47C0FE276627B9AFE5DBE247FCA4F3
              FE0A4BFF005FDE0CFF00D3357F50FD0F7FE4BCC17ACFFF004D563F9CBE955FF2
              45E2FD23FF00A7691DED14515FED79FE420514514005145140057CD9F053C2DF
              B72FECE5F0E343F843F04BF6F5D4FC07F0DB4C7B87B0D2E2F879A65CADBB4D33
              CD21F36777918B4923B1CB1C6EC0C0000FA4E8AFCF38F7C29C8789BD97F6DD0F
              6BECB9B97DF9C6DCD6BFC0D5EFCAB7BDADA1F77C15E25E75C3BED3FB22B7B3F6
              96E6F7632BF2DEDF1276B733DBBEA705FF000B23FE0A79FF004925D6FF00F0D9
              68D47FC2C8FF00829E7FD24975BFFC365A3577B457E77FF12A7C07FF00404FFF
              0006D5FF00E4CFBCFF008997E34FFA0C5FF82A97FF0022705FF0B23FE0A79FF4
              925D6FFF000D968D47FC2C8FF829E7FD24975BFF00C365A3577B451FF12A7C07
              FF00404FFF0006D5FF00E4C3FE265F8D3FE8317FE0AA5FFC89C17FC2C8FF0082
              9E7FD24975BFFC365A35711F0CBE197C47F0FF00C47F8C5F17BE2F7C629BE34F
              C49F1A3E98FAA6A8FA1C3A5B3359C3243193142ED193E5BC6BF2AA7FAB04E492
              6BDD28AFA2E14FA3F7096498FA799E598570AD4EFCAFDA5495AE9C5E92934F49
              35AAD2E783C4DE38F13E71829E5D986254E8CED75C94D5ECD496B18A7BA4F47D
              028A28AFD94FC9828A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
              8A28A0028A28A00FFFD9}
            Properties.ShowFocusRect = False
            Style.BorderColor = clRed
            Style.BorderStyle = ebsNone
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.BorderColor = clRed
            StyleFocused.BorderStyle = ebsNone
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.BorderColor = clBlue
            StyleHot.BorderStyle = ebsThick
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            OnClick = im_poslogin_centroClick
          end
          object im_poslogin_topo: TcxImage
            Left = 16
            Top = 115
            Cursor = crHandPoint
            AutoSize = True
            Picture.Data = {
              0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
              00660000004C0802000000108A5565000000097048597300000EC400000EC401
              952B0E1B000002544944415478DAED9BE16E823014857B5BD4B937F0DF5ECBB7
              DA5BF8825B32B5A5A3F71A24CE398F0BA984F3257648291C3E4207A695CD66E3
              088274CA76BB5DED189361BBDD9E94754BDDF7ABEEACEA676DBFBEAFEA7732DC
              DB8D3D4F91BF955DB57021E2E736F355F69BA63BFDDEDE78A250590D6557ED5C
              7557FB649F4699BBD997CD4ED93D9ADCCCBBFF2117761C1F322E94D54E32194E
              CA6AC79818F2F6DED6CE3031A80C86CA60A80C0656B6F7D22F2FB4E95753CA97
              6329632865C859CB527D9030EA09784B9263571EA5441197EDD4BA4FD6B0A9FF
              EEDCB2CD54F6F4CA0E520EDD0C8E1B35F56BCC1AB1C44BBA66950E5DF9195E47
              55B65005FB45B962212D7B41A65234A75E4197F4DAADA86C02CA9288DD77B385
              CA60F0EE3FC82A51190295C1CAA248C31B136A406554064365300F3C64746F42
              B5535785CA606065E2BA370E5F3B764DA80CE691D7F225BB7FA8019551190C95
              C150190C95C150190C95C150190C95C150190C95C150190C95C150190C95C13C
              3024AF75FC89116C4265A0B2565A9FA90C81CA38BC1886CA60F00106DE35F396
              4C653078F7EFC43B3ECA2250D9030F1956EA50766B6A43C4FD798282AD4FBA65
              9671FD8ACD86381DA51CD846D9EC7D19B36E132392A60D7938BC9DCA9E595954
              297EA04FDC20B3FEB1F5DE95E90B392F4755B64A2A22174136356898C79F2649
              444D52AAFF3F9E90CAC657D66AA46338C75A6BE88F26F4CBA22710FDF9A6180F
              4BB28E454AD4695FC14EC897E9405FBE5C309B9EE6B56CFEFDBF8BCAC65746A8
              0C86CA60A80C86CA60A80C86CA60A80C86CA60A80C86CA60A80CE61BC5E4696F
              BC2F76A00000000049454E44AE426082}
            Properties.ShowFocusRect = False
            Style.BorderColor = clRed
            Style.BorderStyle = ebsThick
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.BorderColor = clRed
            StyleFocused.BorderStyle = ebsNone
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.BorderColor = clBlue
            StyleHot.BorderStyle = ebsThick
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            OnClick = im_poslogin_topoClick
          end
          object im_poslogin_rodape: TcxImage
            Left = 16
            Top = 210
            Cursor = crHandPoint
            AutoSize = True
            Picture.Data = {
              0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
              00660000004C0802000000108A5565000000097048597300000EC400000EC401
              952B0E1B000002564944415478DAED9BFF4EC23014857BDB01EA1BF09FAFC55B
              F916BCA02602EDEAEE2D190B207A304B993B5F421DEB7E9C7ECBEA465A797D6B
              1D41102A43A132182A83A132182A83A132182A83A132182A83A132182A83A132
              182A83A132182A838195EDBCF4CB0BDBF5B3D1F2E9A0650C5A869CADD4EABD84
              511BE04B921CBBF2201A455C2E4DEB3ED9C2A6FEBB73CB3653D9C32BDB8B9EBA
              199C375AEA97982DA2C64BB66695F65DF9115E4655B63005BB855EB19096BDA0
              A2522CA75D4197ECDAADA86C02CA9248B9EF660B95C1E0DD7F9055A232042A83
              954591863726B4039551190C95C1DCF190D1BD09D54E5D152A83819589EBDE38
              7CEDD835A132987B5ECB97ECFEA11DA88CCA60A80C86CA60A80C86CA60A80C86
              CA60A80C86CA60A80C86CA60A80C86CA60A80CE68E2179ADE34F8CE02E54062A
              6BA5F599CA10A88CC38B61A80C061F60E05D336FC954068377FF4EBCE3A32C02
              95DDF190514A1BCA5E762D43C4FD698242599F6CCB2CE3FA95321BE278163D71
              1965B3F33A66BD4C8C489636E4E1F0762A7B6465D1A4F8813E7183CCF6A7ACF7
              4EA72FE4BC1C55D92A9988AC82CAD4A0611E7F9C24112D8956FF7D3C21958DAF
              ACB54887708AF56CA1DF9BD02F8B3520FAD34D311E25C9735429D1A67D85D220
              AFD3813EBD5EB0323DCD5BD9FCF97F1795E1CAD6EBF5A84DFA7FA8B2ED765B3B
              C664D86C364765DD52F7FDAABB527559DBAFEFABFA830C8F76E3C853E4676557
              2D9C89B8DC66BECABED3F44BBFB7379E28545643D9553B57DDD56EECC3287337
              FBB2D929FB8D2637F3EE7FC8991DC7878C3365B5934C86A3B2DA3126C617A623
              696F59D05B2D0000000049454E44AE426082}
            Properties.ShowFocusRect = False
            Style.BorderColor = clRed
            Style.BorderStyle = ebsNone
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.BorderColor = clRed
            StyleFocused.BorderStyle = ebsNone
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.BorderColor = clBlue
            StyleHot.BorderStyle = ebsThick
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            OnClick = im_poslogin_rodapeClick
          end
          object rb_poslogin_centro: TcxRadioButton
            Left = 128
            Top = 52
            Width = 72
            Height = 17
            Cursor = crHandPoint
            Caption = 'Centro'
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = rb_poslogin_centroClick
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            Transparent = True
          end
          object rb_poslogin_topo: TcxRadioButton
            Left = 128
            Top = 147
            Width = 74
            Height = 17
            Cursor = crHandPoint
            Caption = 'Topo'
            Checked = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            TabStop = True
            OnClick = rb_poslogin_centroClick
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
          end
          object rb_poslogin_rodape: TcxRadioButton
            Left = 128
            Top = 240
            Width = 68
            Height = 17
            Cursor = crHandPoint
            Caption = 'Rodap'#233
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnClick = rb_poslogin_centroClick
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
          end
        end
        object cxLabel64: TcxLabel
          Left = 472
          Top = 14
          Caption = ' 4- Posi'#231#227'o da janela de login '
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
      end
      object nbgPatroControl: TdxNavBarGroupControl
        Left = 0
        Top = 0
        Width = 618
        Height = 744
        Caption = 'nbgPatroControl'
        TabOrder = 15
        GroupIndex = 12
        OriginalHeight = 41
      end
      object nbgMeiosPagamentoControl: TdxNavBarGroupControl
        Left = 0
        Top = 872
        Width = 602
        Height = 300
        Caption = 'nbgMeiosPagamentoControl'
        TabOrder = 16
        GroupIndex = 13
        OriginalHeight = 300
      end
    end
  end
  inherited BarMgr: TdxBarManager
    ImageOptions.LargeImages = dmImagens.im24
    ImageOptions.MakeDisabledImagesFaded = True
    LookAndFeel.Kind = lfFlat
    Left = 312
    Top = 592
    DockControlHeights = (
      0
      0
      0
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
      LargeImageIndex = 5
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
      LargeImageIndex = 4
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 424
    Top = 304
  end
  inherited CP: TdxComponentPrinter
    Left = 216
    Top = 600
  end
  inherited dlgExp: TSaveDialog
    Left = 56
    Top = 513
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 248
    Top = 594
  end
  inherited pmPeriodo: TdxBarPopupMenu
    Left = 224
    Top = 484
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 160
    Top = 544
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
        Name = 'PMPDFPrintEng'
        DataType = ftWord
      end
      item
        Name = 'PMPDF'
        DataType = ftBoolean
      end
      item
        Name = 'PMReviewCli'
        DataType = ftBoolean
      end
      item
        Name = 'PMReviewAdmin'
        DataType = ftBoolean
      end
      item
        Name = 'PosLogin'
        DataType = ftWord
      end
      item
        Name = 'CliCongelado'
        DataType = ftBoolean
      end
      item
        Name = 'BloqToolbars'
        DataType = ftBoolean
      end
      item
        Name = 'BloqPosPago'
        DataType = ftBoolean
      end
      item
        Name = 'EmailIdent'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EmailConteudo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PMCotas'
        DataType = ftBoolean
      end
      item
        Name = 'PMCotasMaxPagDia'
        DataType = ftInteger
      end
      item
        Name = 'PMCotasMaxPagMes'
        DataType = ftInteger
      end
      item
        Name = 'PMCotasOpCota'
        DataType = ftWord
      end
      item
        Name = 'PMCotasOpExcesso'
        DataType = ftWord
      end
      item
        Name = 'PMCotasMaxExcesso'
        DataType = ftInteger
      end
      item
        Name = 'PMCotasPorCli'
        DataType = ftBoolean
      end
      item
        Name = 'PMPausarServ'
        DataType = ftBoolean
      end
      item
        Name = 'PedirSaldoI'
        DataType = ftBoolean
      end
      item
        Name = 'PedirSaldoF'
        DataType = ftBoolean
      end
      item
        Name = 'BloqMeusDocumentos'
        DataType = ftBoolean
      end
      item
        Name = 'ClassicStartMenu'
        DataType = ftBoolean
      end
      item
        Name = 'BloqDownloadExe'
        DataType = ftBoolean
      end
      item
        Name = 'FiltrarDesktop'
        DataType = ftBoolean
      end
      item
        Name = 'FiltrarMenuIniciar'
        DataType = ftBoolean
      end
      item
        Name = 'BloqMeuComputador'
        DataType = ftBoolean
      end
      item
        Name = 'BloqLixeira'
        DataType = ftBoolean
      end
      item
        Name = 'FidMsg'
        DataType = ftBoolean
      end
      item
        Name = 'FidMsgTitulo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PubHomePage'
        DataType = ftBoolean
      end
      item
        Name = 'PubAd'
        DataType = ftBoolean
      end
      item
        Name = 'PubToolbar'
        DataType = ftBoolean
      end
      item
        Name = 'Biometria'
        DataType = ftBoolean
      end
      item
        Name = 'FidMostrarSaldoGuard'
        DataType = ftBoolean
      end
      item
        Name = 'FidMostrarSaldoAdmin'
        DataType = ftBoolean
      end
      item
        Name = 'CliCadNaoEncerra'
        DataType = ftBoolean
      end
      item
        Name = 'ImpedirPosPago'
        DataType = ftBoolean
      end
      item
        Name = 'AutoLigarMaqCli'
        DataType = ftBoolean
      end
      item
        Name = 'AutoObsAoCancelar'
        DataType = ftBoolean
      end
      item
        Name = 'FidAutoPremiar'
        DataType = ftBoolean
      end
      item
        Name = 'FidTipoPremioAuto'
        DataType = ftWord
      end
      item
        Name = 'FidPremioAuto'
        DataType = ftInteger
      end
      item
        Name = 'FidAtivo'
        DataType = ftBoolean
      end
      item
        Name = 'FidSessaoValor'
        DataType = ftCurrency
      end
      item
        Name = 'FidSessaoPontos'
        DataType = ftInteger
      end
      item
        Name = 'FidVendaValor'
        DataType = ftCurrency
      end
      item
        Name = 'FidVendaPontos'
        DataType = ftInteger
      end
      item
        Name = 'FidImpValor'
        DataType = ftCurrency
      end
      item
        Name = 'FidImpPontos'
        DataType = ftInteger
      end
      item
        Name = 'FidParcial'
        DataType = ftBoolean
      end
      item
        Name = 'AvisoCreditos'
        DataType = ftBoolean
      end
      item
        Name = 'ClientePodeVerCred'
        DataType = ftBoolean
      end
      item
        Name = 'DetectarImpServ'
        DataType = ftBoolean
      end
      item
        Name = 'BloqueiaCliAvulso'
        DataType = ftBoolean
      end
      item
        Name = 'ExigeDadosMinimos'
        DataType = ftBoolean
      end
      item
        Name = 'DadosMinimos'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'CidadePadrao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'UFPadrao'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'AvisoFimTempoAdminS'
        DataType = ftWord
      end
      item
        Name = 'CliAvulsoNaoEncerra'
        DataType = ftBoolean
      end
      item
        Name = 'AutoSortGridCaixa'
        DataType = ftBoolean
      end
      item
        Name = 'CorPrevisao'
        DataType = ftInteger
      end
      item
        Name = 'CorFPrevisao'
        DataType = ftInteger
      end
      item
        Name = 'RelCaixaAuto'
        DataType = ftBoolean
      end
      item
        Name = 'EncerramentoCartao'
        DataType = ftWord
      end
      item
        Name = 'ChatAlertaSonoro'
        DataType = ftBoolean
      end
      item
        Name = 'ChatMostraNotificacao'
        DataType = ftBoolean
      end
      item
        Name = 'TempoEPrePago'
        DataType = ftWord
      end
      item
        Name = 'MaxTempoSessao'
        DataType = ftWord
      end
      item
        Name = 'TempoECartao'
        DataType = ftWord
      end
      item
        Name = 'CorMaqManut'
        DataType = ftInteger
      end
      item
        Name = 'CorFMaqManut'
        DataType = ftInteger
      end
      item
        Name = 'SincronizarHorarios'
        DataType = ftBoolean
      end
      item
        Name = 'SalvarCodUsername'
        DataType = ftBoolean
      end
      item
        Name = 'OpcaoChat'
        DataType = ftWord
      end
      item
        Name = 'MinutosDesligaMaq'
        DataType = ftWord
      end
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
        Size = 100
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
        Name = 'ContinuarCredTempo'
        DataType = ftBoolean
      end
      item
        Name = 'NaoGuardarCreditoCli'
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
        Name = 'BloqBotaoDir'
        DataType = ftBoolean
      end
      item
        Name = 'MostraNomeMaq'
        DataType = ftBoolean
      end
      item
        Name = 'MostrarDebitoNoGuard'
        DataType = ftBoolean
      end
      item
        Name = 'BloquearLoginAlemMaxDeb'
        DataType = ftBoolean
      end
      item
        Name = 'ClienteNaoAlteraSenha'
        DataType = ftBoolean
      end
      item
        Name = 'NaoVenderAlemEstoque'
        DataType = ftBoolean
      end
      item
        Name = 'NaoObrigarSenhaCliente'
        DataType = ftBoolean
      end
      item
        Name = 'PgVendaAvulsa'
        DataType = ftBoolean
      end
      item
        Name = 'AlteraLoginSemCred'
        DataType = ftBoolean
      end
      item
        Name = 'NaoCobrarImpFunc'
        DataType = ftBoolean
      end
      item
        Name = 'ModoCredGuard'
        DataType = ftWord
      end
      item
        Name = 'MsgFimCred'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'CreditoComoValor'
        DataType = ftBoolean
      end
      item
        Name = 'SemLogin'
        DataType = ftBoolean
      end
      item
        Name = 'PMPausaAutomatica'
        DataType = ftBoolean
      end
      item
        Name = 'PMConfirmaImpCliente'
        DataType = ftBoolean
      end
      item
        Name = 'PMMostrarPaginasCli'
        DataType = ftBoolean
      end
      item
        Name = 'PMMostrarValorCli'
        DataType = ftBoolean
      end
      item
        Name = 'PMCalcValorCli'
        DataType = ftWord
      end
      item
        Name = 'PMPromptValorCli'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PMObsValorCli'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'FidMsgTexto'
        DataType = ftMemo
      end
      item
        Name = 'PMNaoPausar'
        DataType = ftMemo
      end
      item
        Name = 'CamposCliCC'
        DataType = ftMemo
      end
      item
        Name = 'FundoWeb'
        DataType = ftBoolean
      end
      item
        Name = 'FundoWebURL'
        DataType = ftMemo
      end
      item
        Name = 'NaoTransferirMaq'
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
    Left = 200
    Top = 536
    object MTPMPDFPrintEng: TWordField
      Alignment = taLeftJustify
      FieldName = 'PMPDFPrintEng'
    end
    object MTPMPDF: TBooleanField
      FieldName = 'PMPDF'
    end
    object MTPMReviewCli: TBooleanField
      FieldName = 'PMReviewCli'
    end
    object MTPMReviewAdmin: TBooleanField
      FieldName = 'PMReviewAdmin'
    end
    object MTPosLogin: TWordField
      FieldName = 'PosLogin'
    end
    object MTCliCongelado: TBooleanField
      FieldName = 'CliCongelado'
    end
    object MTBloqToolbars: TBooleanField
      FieldName = 'BloqToolbars'
    end
    object MTBloqPosPago: TBooleanField
      FieldName = 'BloqPosPago'
    end
    object MTEmailIdent: TStringField
      FieldName = 'EmailIdent'
    end
    object MTEmailConteudo: TStringField
      FieldName = 'EmailConteudo'
    end
    object MTPMCotas: TBooleanField
      FieldName = 'PMCotas'
    end
    object MTPMCotasMaxPagDia: TIntegerField
      FieldName = 'PMCotasMaxPagDia'
    end
    object MTPMCotasMaxPagMes: TIntegerField
      FieldName = 'PMCotasMaxPagMes'
    end
    object MTPMCotasOpCota: TWordField
      Alignment = taLeftJustify
      FieldName = 'PMCotasOpCota'
    end
    object MTPMCotasOpExcesso: TWordField
      Alignment = taLeftJustify
      FieldName = 'PMCotasOpExcesso'
    end
    object MTPMCotasMaxExcesso: TIntegerField
      FieldName = 'PMCotasMaxExcesso'
    end
    object MTPMCotasPorCli: TBooleanField
      FieldName = 'PMCotasPorCli'
    end
    object MTPMPausarServ: TBooleanField
      FieldName = 'PMPausarServ'
    end
    object MTPedirSaldoI: TBooleanField
      FieldName = 'PedirSaldoI'
    end
    object MTPedirSaldoF: TBooleanField
      FieldName = 'PedirSaldoF'
    end
    object MTBloqMeusDocumentos: TBooleanField
      FieldName = 'BloqMeusDocumentos'
    end
    object MTClassicStartMenu: TBooleanField
      FieldName = 'ClassicStartMenu'
    end
    object MTBloqDownloadExe: TBooleanField
      FieldName = 'BloqDownloadExe'
    end
    object MTFiltrarDesktop: TBooleanField
      FieldName = 'FiltrarDesktop'
    end
    object MTFiltrarMenuIniciar: TBooleanField
      FieldName = 'FiltrarMenuIniciar'
    end
    object MTBloqMeuComputador: TBooleanField
      FieldName = 'BloqMeuComputador'
    end
    object MTBloqLixeira: TBooleanField
      FieldName = 'BloqLixeira'
    end
    object MTFidMsg: TBooleanField
      FieldName = 'FidMsg'
    end
    object MTFidMsgTitulo: TStringField
      FieldName = 'FidMsgTitulo'
      Size = 50
    end
    object MTPubHomePage: TBooleanField
      FieldName = 'PubHomePage'
    end
    object MTPubAd: TBooleanField
      FieldName = 'PubAd'
    end
    object MTPubToolbar: TBooleanField
      FieldName = 'PubToolbar'
    end
    object MTVerBloqueioSites: TBooleanField
      FieldName = 'VerBloqueioSites'
    end
    object MTBiometria: TBooleanField
      FieldName = 'Biometria'
    end
    object MTFidMostrarSaldoGuard: TBooleanField
      FieldName = 'FidMostrarSaldoGuard'
    end
    object MTFidMostrarSaldoAdmin: TBooleanField
      FieldName = 'FidMostrarSaldoAdmin'
    end
    object MTCliCadNaoEncerra: TBooleanField
      FieldName = 'CliCadNaoEncerra'
    end
    object MTImpedirPosPago: TBooleanField
      FieldName = 'ImpedirPosPago'
    end
    object MTAutoLigarMaqCli: TBooleanField
      FieldName = 'AutoLigarMaqCli'
    end
    object MTAutoObsAoCancelar: TBooleanField
      FieldName = 'AutoObsAoCancelar'
    end
    object MTFidAutoPremiar: TBooleanField
      FieldName = 'FidAutoPremiar'
    end
    object MTFidTipoPremioAuto: TWordField
      Alignment = taLeftJustify
      FieldName = 'FidTipoPremioAuto'
    end
    object MTFidPremioAuto: TIntegerField
      FieldName = 'FidPremioAuto'
    end
    object MTFidAtivo: TBooleanField
      FieldName = 'FidAtivo'
    end
    object MTFidSessaoValor: TCurrencyField
      FieldName = 'FidSessaoValor'
    end
    object MTFidSessaoPontos: TIntegerField
      FieldName = 'FidSessaoPontos'
    end
    object MTFidVendaValor: TCurrencyField
      FieldName = 'FidVendaValor'
    end
    object MTFidVendaPontos: TIntegerField
      FieldName = 'FidVendaPontos'
    end
    object MTFidImpValor: TCurrencyField
      FieldName = 'FidImpValor'
    end
    object MTFidImpPontos: TIntegerField
      FieldName = 'FidImpPontos'
    end
    object MTFidParcial: TBooleanField
      FieldName = 'FidParcial'
    end
    object MTAvisoCreditos: TBooleanField
      FieldName = 'AvisoCreditos'
    end
    object MTClientePodeVerCred: TBooleanField
      FieldName = 'ClientePodeVerCred'
    end
    object MTDetectarImpServ: TBooleanField
      FieldName = 'DetectarImpServ'
    end
    object MTBloqueiaCliAvulso: TBooleanField
      FieldName = 'BloqueiaCliAvulso'
    end
    object MTExigeDadosMinimos: TBooleanField
      FieldName = 'ExigeDadosMinimos'
    end
    object MTDadosMinimos: TStringField
      FieldName = 'DadosMinimos'
      Size = 300
    end
    object MTCidadePadrao: TStringField
      FieldName = 'CidadePadrao'
      Size = 50
    end
    object MTUFPadrao: TStringField
      FieldName = 'UFPadrao'
      Size = 2
    end
    object MTAvisoFimTempoAdminS: TWordField
      FieldName = 'AvisoFimTempoAdminS'
    end
    object MTCliAvulsoNaoEncerra: TBooleanField
      FieldName = 'CliAvulsoNaoEncerra'
    end
    object MTAutoSortGridCaixa: TBooleanField
      FieldName = 'AutoSortGridCaixa'
    end
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
    object MTChatAlertaSonoro: TBooleanField
      FieldName = 'ChatAlertaSonoro'
    end
    object MTChatMostraNotificacao: TBooleanField
      FieldName = 'ChatMostraNotificacao'
    end
    object MTTempoEPrePago: TWordField
      Alignment = taLeftJustify
      FieldName = 'TempoEPrePago'
    end
    object MTMaxTempoSessao: TWordField
      FieldName = 'MaxTempoSessao'
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
      DisplayWidth = 100
      FieldName = 'RecPorta'
      Size = 100
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
    object MTBloqBotaoDir: TBooleanField
      FieldName = 'BloqBotaoDir'
    end
    object MTMostraNomeMaq: TBooleanField
      FieldName = 'MostraNomeMaq'
    end
    object MTMostrarDebitoNoGuard: TBooleanField
      FieldName = 'MostrarDebitoNoGuard'
    end
    object MTBloquearLoginAlemMaxDeb: TBooleanField
      FieldName = 'BloquearLoginAlemMaxDeb'
    end
    object MTClienteNaoAlteraSenha: TBooleanField
      FieldName = 'ClienteNaoAlteraSenha'
    end
    object MTNaoVenderAlemEstoque: TBooleanField
      FieldName = 'NaoVenderAlemEstoque'
      LookupDataSet = Dados.mtMaquina
    end
    object MTNaoObrigarSenhaCliente: TBooleanField
      FieldName = 'NaoObrigarSenhaCliente'
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
    object MTModoCredGuard: TWordField
      Alignment = taLeftJustify
      FieldName = 'ModoCredGuard'
    end
    object MTMsgFimCred: TStringField
      FieldName = 'MsgFimCred'
      Size = 150
    end
    object MTCreditoComoValor: TBooleanField
      FieldName = 'CreditoComoValor'
    end
    object MTSemLogin: TBooleanField
      FieldName = 'SemLogin'
    end
    object MTPMPausaAutomatica: TBooleanField
      FieldName = 'PMPausaAutomatica'
    end
    object MTPMConfirmaImpCliente: TBooleanField
      FieldName = 'PMConfirmaImpCliente'
    end
    object MTPMMostrarPaginasCli: TBooleanField
      FieldName = 'PMMostrarPaginasCli'
    end
    object MTPMMostrarValorCli: TBooleanField
      FieldName = 'PMMostrarValorCli'
    end
    object MTPMCalcValorCli: TWordField
      Alignment = taLeftJustify
      FieldName = 'PMCalcValorCli'
    end
    object MTPMPromptValorCli: TStringField
      FieldName = 'PMPromptValorCli'
      Size = 100
    end
    object MTPMObsValorCli: TStringField
      FieldName = 'PMObsValorCli'
      Size = 300
    end
    object MTNomePremioPass: TStringField
      FieldKind = fkLookup
      FieldName = 'NomePremioPass'
      LookupDataSet = tTipoPass
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'FidPremioAuto'
      Size = 40
      Lookup = True
    end
    object MTFidMsgTexto: TMemoField
      FieldName = 'FidMsgTexto'
      BlobType = ftMemo
    end
    object MTPMNaoPausar: TMemoField
      FieldName = 'PMNaoPausar'
      BlobType = ftMemo
    end
    object MTCamposCliCC: TMemoField
      FieldName = 'CamposCliCC'
      BlobType = ftMemo
    end
    object MTFundoWeb: TBooleanField
      FieldName = 'FundoWeb'
    end
    object MTFundoWebURL: TMemoField
      FieldName = 'FundoWebURL'
      BlobType = ftMemo
    end
    object MTNaoTransferirMaq: TBooleanField
      FieldName = 'NaoTransferirMaq'
    end
  end
  object DS: TDataSource
    DataSet = MT
    OnDataChange = DSDataChange
    Left = 280
    Top = 488
  end
  object LMDHint1: TLMDHint
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clInfoText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Options = [hoRightAngledNose]
    BackgroundedBevel = False
    Left = 280
    Top = 592
  end
  object t: TcxGridPopupMenu
    PopupMenus = <>
    Left = 344
    Top = 592
  end
  object FM: TFormManager
    BarMgr = BarMgr
    Left = 264
    Top = 312
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
    Left = 320
    Top = 480
    object tTTDescr: TStringField
      FieldName = 'Descr'
      Size = 40
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
    Left = 216
    Top = 312
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <>
    StorageName = 'cxPropertiesStore1'
    Left = 384
    Top = 304
  end
  object tPacote: TnxTable
    Database = Dados.db
    Filter = '(Fidelidade=True) and (FidPontos>0)'
    Filtered = True
    OnCalcFields = tPacoteCalcFields
    TableName = 'Pacote'
    IndexName = 'IID'
    Left = 112
    Top = 528
    object tPacoteID: TAutoIncField
      FieldName = 'ID'
    end
    object tPacoteMinutos: TIntegerField
      FieldName = 'Minutos'
    end
    object tPacoteValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tPacoteDescr: TStringField
      FieldName = 'Descr'
      Size = 30
    end
    object tPacoteFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object tPacoteFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
    object tPacoteNome: TStringField
      FieldKind = fkCalculated
      FieldName = 'Nome'
      Size = 30
      Calculated = True
    end
  end
  object tTipoPass: TnxTable
    Database = Dados.db
    Filter = '(Fidelidade=True) and (FidPontos>0) '
    Filtered = True
    TableName = 'TipoPass'
    IndexName = 'IID'
    Left = 872
    Top = 432
    object tTipoPassNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tTipoPassValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tTipoPassTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tTipoPassTipoExp: TWordField
      FieldName = 'TipoExp'
    end
    object tTipoPassExpirarEm: TDateTimeField
      FieldName = 'ExpirarEm'
    end
    object tTipoPassMaxSegundos: TIntegerField
      FieldName = 'MaxSegundos'
    end
    object tTipoPassObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tTipoPassDia1: TIntegerField
      FieldName = 'Dia1'
    end
    object tTipoPassDia2: TIntegerField
      FieldName = 'Dia2'
    end
    object tTipoPassDia3: TIntegerField
      FieldName = 'Dia3'
    end
    object tTipoPassDia4: TIntegerField
      FieldName = 'Dia4'
    end
    object tTipoPassDia5: TIntegerField
      FieldName = 'Dia5'
    end
    object tTipoPassDia6: TIntegerField
      FieldName = 'Dia6'
    end
    object tTipoPassDia7: TIntegerField
      FieldName = 'Dia7'
    end
    object tTipoPassMinutos: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Minutos'
      Calculated = True
    end
    object tTipoPassID: TAutoIncField
      FieldName = 'ID'
    end
    object tTipoPassFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object tTipoPassFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
  end
end
