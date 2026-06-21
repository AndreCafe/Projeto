inherited fbOpcoes: TfbOpcoes
  Left = 91
  Top = 160
  Caption = 'Op'#231#245'es'
  ClientHeight = 545
  ClientWidth = 864
  OldCreateOrder = True
  ShowHint = True
  OnCreate = FrmBasePaiCreate
  OnDestroy = FrmBasePaiDestroy
  ExplicitWidth = 872
  ExplicitHeight = 573
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 44
    Width = 864
    Height = 501
    ExplicitTop = 44
    ExplicitWidth = 864
    ExplicitHeight = 501
    object Paginas: TcxPageControl
      Left = 0
      Top = 0
      Width = 864
      Height = 501
      ActivePage = tsRec
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Rotate = True
      Style = 8
      TabOrder = 0
      TabPosition = tpLeft
      OnChange = PaginasChange
      ClientRectBottom = 501
      ClientRectLeft = 162
      ClientRectRight = 864
      ClientRectTop = 0
      object tsGeral: TcxTabSheet
        BorderWidth = 5
        Caption = ' &A. Geral            '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 0
        ParentFont = False
        object vgGeral: TcxDBVerticalGrid
          Left = 0
          Top = 0
          Width = 692
          Height = 491
          BorderStyle = cxcbsNone
          Align = alClient
          LookAndFeel.Kind = lfFlat
          OptionsView.CellAutoHeight = True
          OptionsView.CellTextMaxLineCount = 10
          OptionsView.AutoScaleBands = False
          OptionsView.PaintStyle = psDelphi
          OptionsView.GridLineColor = clBtnShadow
          OptionsView.RowHeaderMinWidth = 10
          OptionsView.RowHeaderWidth = 381
          OptionsView.RowHeight = 0
          OptionsView.ValueWidth = 92
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.AllowChangeRecord = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          TabOrder = 0
          OnEditValueChanged = vgGeralEditValueChanged
          DataController.DataSource = DS
          object vgGeralDesativaRegAutImp: TcxDBEditorRow
            Properties.Caption = '1. Desativar registro autom'#225'tico de impress'#245'es'
            Properties.Hint = 
              'Algumas lojas podem apresentar conflitos entre o CM-Guard e o Ho' +
              'tmail/Messenger, quando o registro autom'#225'tico de impress'#245'es esti' +
              'ver ativado. '#13#10'Marque essa op'#231#227'o para desativar o registro autom' +
              #225'tico de impress'#245'es.'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.DataBinding.FieldName = 'DesativaRegAutImp'
          end
          object vgGeralRegImp981: TcxDBEditorRow
            Properties.Caption = '2. Registrar Impress'#245'es em Windows 95, 98 e ME'
            Properties.HeaderAlignmentVert = vaCenter
            Properties.Hint = 
              'O registro de impress'#245'es '#233' autom'#225'tico em m'#225'quinas com Windows XP' +
              ' e 2000. Em m'#225'quinas com 95/98/Me '#233' opcional pois esse recurso p' +
              'ode atrapalhar o funcionamento de alguns jogos.'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.EditProperties.ValueChecked = 'True'
            Properties.EditProperties.ValueGrayed = ''
            Properties.EditProperties.ValueUnchecked = 'False'
            Properties.DataBinding.FieldName = 'RegImp98'
            Properties.Options.ShowEditButtons = eisbAlways
          end
          object vgGeralNomeProdImp1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '3. Produto a ser lan'#231'ado como impress'#227'o'
            Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.ClearKey = 16473
            Properties.EditProperties.DropDownAutoSize = True
            Properties.EditProperties.DropDownRows = 7
            Properties.EditProperties.GridMode = True
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.KeyFieldNames = 'Codigo'
            Properties.EditProperties.ListColumns = <
              item
                FieldName = 'Descricao'
              end>
            Properties.EditProperties.ListOptions.ShowHeader = False
            Properties.EditProperties.MaxLength = 50
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'NomeProdutoImp'
          end
          object vgGeralFecharProgramas1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '4. Fechar programas ao finalizar acesso'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.EditProperties.ReadOnly = False
            Properties.EditProperties.ValueChecked = 'True'
            Properties.EditProperties.ValueGrayed = ''
            Properties.EditProperties.ValueUnchecked = 'False'
            Properties.DataBinding.FieldName = 'FecharProgramas'
          end
          object vgGeralAutoExecutar1: TcxDBEditorRow
            Expanded = False
            Height = 0
            Properties.Caption = '5. Programa a ser executado automaticamente ao iniciar acesso'
            Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.MaxLength = 200
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'AutoExecutar'
          end
          object vgGeralLimiteTempoPadrao1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '6. Limite padr'#227'o de tempo ao liberar acesso'
            Properties.EditPropertiesClassName = 'TcxTimeEditProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'LimiteTempoPadrao'
          end
          object vgGeralPacoteTempoReal1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '7. Abater tempo dos pacotes conforme tempo real de uso'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.EditProperties.ReadOnly = False
            Properties.EditProperties.ValueChecked = 'True'
            Properties.EditProperties.ValueGrayed = ''
            Properties.EditProperties.ValueUnchecked = 'False'
            Properties.DataBinding.FieldName = 'PacoteTempoReal'
          end
          object vgGeralPermiteLoginSemCred1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '8. Permitir login aut'#244'nomo de clientes que n'#227'o tenham cr'#233'dito'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.EditProperties.ReadOnly = False
            Properties.EditProperties.ValueChecked = 'True'
            Properties.EditProperties.ValueGrayed = ''
            Properties.EditProperties.ValueUnchecked = 'False'
            Properties.DataBinding.FieldName = 'PermiteLoginSemCred'
          end
          object vgGeralEncerramentoPrePago1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '9. O que fazer ao encerrar tempo pr'#233'-pago'
            Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.DropDownRows = 7
            Properties.EditProperties.Items = <
              item
                Description = 'Pausar Acesso'
                ImageIndex = 0
                Value = 0
              end
              item
                Description = 'Continuar em modo P'#211'S-PAGO'
                ImageIndex = 1
                Value = 1
              end
              item
                Description = 'Encerrar Acesso'
                ImageIndex = 2
                Value = 2
              end>
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'EncerramentoPrePago'
          end
          object vgGeralMostraPrePagoDec1: TcxDBEditorRow
            Expanded = False
            Height = 0
            Properties.Caption = '10. Mostrar tempo de acessos pr'#233'-pagos em modo Descrescente'
            Properties.HeaderAlignmentVert = vaCenter
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.EditProperties.ReadOnly = False
            Properties.EditProperties.ValueChecked = 'True'
            Properties.EditProperties.ValueGrayed = ''
            Properties.EditProperties.ValueUnchecked = 'False'
            Properties.DataBinding.FieldName = 'MostraPrePagoDec'
            Properties.Options.ShowEditButtons = eisbAlways
          end
          object vgGeralPermiteCapturaTela1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '11. Permitir captura de tela'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.EditProperties.ReadOnly = False
            Properties.EditProperties.ValueChecked = 'True'
            Properties.EditProperties.ValueGrayed = ''
            Properties.EditProperties.ValueUnchecked = 'False'
            Properties.DataBinding.FieldName = 'PermiteCapturaTela'
          end
          object vgGeralVariosTiposAcesso1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '12. Habilitar tabela de pre'#231'os por Tipo de Acesso'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.EditProperties.ReadOnly = False
            Properties.EditProperties.ValueChecked = 'True'
            Properties.EditProperties.ValueGrayed = ''
            Properties.EditProperties.ValueUnchecked = 'False'
            Properties.DataBinding.FieldName = 'VariosTiposAcesso'
          end
          object vgGeralModoPagtoAcesso1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '13. Como deve ser exibida a tela de pagamento do acesso'
            Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.DropDownRows = 7
            Properties.EditProperties.Items = <
              item
                Description = 'Automaticamente ap'#243's finaliza'#231#227'o'
                ImageIndex = 0
                Value = '0'
              end
              item
                Description = 'Atrav'#233's de duplo clique na m'#225'quina'
                ImageIndex = 1
                Value = '1'
              end
              item
                Description = 'Somente atrav'#233's da tela de Caixa'
                ImageIndex = 2
                Value = '2'
              end>
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'ModoPagtoAcesso'
          end
          object vgGeralMostraCliCadAntesAvulso: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '14. Tipo de cliente padr'#227'o na tela de libera'#231#227'o de m'#225'quina'
            Properties.HeaderAlignmentVert = vaCenter
            Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.EditProperties.Items = <
              item
                Description = 'Cliente Avulso'
                ImageIndex = 0
                Value = False
              end
              item
                Description = 'Cliente Cadastrado'
                Value = True
              end>
            Properties.DataBinding.FieldName = 'MostraCliCadAntesAvulso'
          end
          object vgGeralCampoLocalizaCli1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '15. Localizar cliente por'
            Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.DropDownRows = 7
            Properties.EditProperties.Items = <
              item
                Description = 'Nome'
                ImageIndex = 0
                Value = '0'
              end
              item
                Description = 'Username'
                ImageIndex = 1
                Value = '1'
              end
              item
                Description = 'C'#243'digo'
                ImageIndex = 2
                Value = '2'
              end>
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'CampoLocalizaCli'
          end
          object vgGeralManterSaldoCaixa1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '16. Manter Saldo do Caixa'
            Properties.Hint = 
              'Marque essa op'#231#227'o caso deseje que o saldo final de um caixa seja' +
              ' transportado para o saldo inicial do pr'#243'ximo caixa'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.EditProperties.ReadOnly = False
            Properties.EditProperties.ValueChecked = 'True'
            Properties.EditProperties.ValueGrayed = ''
            Properties.EditProperties.ValueUnchecked = 'False'
            Properties.DataBinding.FieldName = 'ManterSaldoCaixa'
          end
          object vgGeralNaoMostrarMsgDebito1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '17. N'#227'o mostrar mensagem de d'#233'bito de cliente'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.EditProperties.ReadOnly = False
            Properties.EditProperties.ValueChecked = 'True'
            Properties.EditProperties.ValueGrayed = ''
            Properties.EditProperties.ValueUnchecked = 'False'
            Properties.DataBinding.FieldName = 'NaoMostrarMsgDebito'
          end
          object vgGeralTolerancia1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '18. Tempo M'#225'ximo de Toler'#226'ncia em uso p'#243's-pago'
            Properties.Hint = 
              'O tempo de toler'#226'ncia representa um tempo extra que o cliente de' +
              ' p'#243's-pago tem antes que o sistema cobre mais uma fra'#231#227'o de tempo' +
              '. '#201' comum que este tempo seja de 2 ou 3 minutos.'
            Properties.EditPropertiesClassName = 'TcxTimeEditProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'Tolerancia'
          end
          object vgGeralMostraProgAtual: TcxDBEditorRow
            Properties.Caption = '19. Monitorar o programa/site que o cliente est'#225' acessando'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.DataBinding.FieldName = 'MostraProgAtual'
          end
          object vgGeralMostraObs: TcxDBEditorRow
            Properties.Caption = '20. Mostrar Observa'#231#245'es dos Acessos na tela de m'#225'quinas'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taCenter
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.DataBinding.FieldName = 'MostraObs'
          end
          object vgExigirRG: TcxDBEditorRow
            Properties.Caption = '21. Exigir RG para Login de clientes cadastrados'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taCenter
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.DataBinding.FieldName = 'ExigirRG'
          end
          object vgGeralDBEditorRow1: TcxDBEditorRow
            Properties.Caption = '22. Limite padr'#227'o para d'#233'bito dos clientes'
            Properties.HeaderAlignmentVert = vaCenter
            Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.UseThousandSeparator = True
            Properties.DataBinding.FieldName = 'LimitePadraoDebito'
          end
          object vgGeralEscondeTipoAcesso: TcxDBEditorRow
            Properties.Caption = '23. N'#227'o mostrar tipo de acesso para clientes'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taCenter
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.DataBinding.FieldName = 'EscondeTipoAcesso'
          end
          object vgGeralAlterarSenha: TcxDBEditorRow
            Properties.Caption = 
              '24. Permitir altera'#231#227'o da senha do cliente diretamente na tela d' +
              'e cadastro'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.DataBinding.FieldName = 'AlterarSenhaCli'
          end
          object vgGeralVerSenha: TcxDBEditorRow
            Properties.Caption = 
              '25. Permitir visualiza'#231#227'o da senha do cliente na tela de cadastr' +
              'o e lista'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.DataBinding.FieldName = 'VerSenhaCli'
          end
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
        object vgMC: TcxVerticalGrid
          Left = 0
          Top = 0
          Width = 692
          Height = 491
          Align = alClient
          LookAndFeel.Kind = lfFlat
          OptionsView.CellTextMaxLineCount = 3
          OptionsView.ShowEditButtons = ecsbAlways
          OptionsView.AutoScaleBands = False
          OptionsView.PaintStyle = psDelphi
          OptionsView.GridLineColor = clBtnShadow
          OptionsView.RowHeaderMinWidth = 30
          OptionsView.RowHeaderWidth = 287
          OptionsView.ValueWidth = 92
          OptionsBehavior.GoToNextCellOnEnter = True
          TabOrder = 0
          OnEditValueChanged = vgMCEditValueChanged
          object vgmAlinhamento: TcxEditorRow
            Expanded = False
            Properties.Caption = '1. Alinhamento da barra de cron'#244'metro'
            Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.DropDownRows = 7
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items = <
              item
                Description = 'Topo'
                ImageIndex = 0
                Value = 0
              end
              item
                Description = 'Rodap'#233
                ImageIndex = 1
                Value = 1
              end
              item
                Description = 'Esquerda'
                ImageIndex = 2
                Value = 2
              end
              item
                Description = 'Direita'
                ImageIndex = 3
                Value = 3
              end>
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.ValueType = 'Variant'
            Properties.Value = Null
          end
          object vgmEsconderCronometro: TcxEditorRow
            Expanded = False
            Properties.Caption = '2. Esconder cron'#244'metro'
            Properties.HeaderAlignmentVert = vaCenter
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.EditProperties.ReadOnly = False
            Properties.EditProperties.ValueChecked = 'True'
            Properties.EditProperties.ValueGrayed = ''
            Properties.EditProperties.ValueUnchecked = 'False'
            Properties.DataBinding.ValueType = 'Variant'
            Properties.Value = Null
          end
          object vgmAposEncerrar: TcxEditorRow
            Expanded = False
            Properties.Caption = '3. O que fazer ap'#243's Finalizar Acesso'
            Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.DropDownRows = 7
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items = <
              item
                Description = 'Mostrar Tela de Login'
                ImageIndex = 0
                Value = 0
              end
              item
                Description = 'Reiniciar a M'#225'quina'
                ImageIndex = 1
                Value = 1
              end
              item
                Description = 'Efetuar Logoff no Windows'
                ImageIndex = 2
                Value = 2
              end>
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.ValueType = 'Integer'
            Properties.Value = Null
          end
          object vgmTempoSumir: TcxEditorRow
            Expanded = False
            Height = 32
            Properties.Caption = 
              '4. Tempo (segundos) para esconder a tela de login'#13#10'    (0 para n' +
              #227'o esconder)'
            Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.AssignedValues.MaxValue = True
            Properties.EditProperties.AssignedValues.MinValue = True
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.ValueType = 'Integer'
            Properties.Value = Null
          end
          object vgMCCategoryRow1: TcxCategoryRow
            Properties.Caption = 'Restri'#231#245'es de acesso ao Windows'
            object vgmMenuIniciar: TcxEditorRow
              Expanded = False
              Properties.Caption = '5. Permitir acesso ao Menu Iniciar'
              Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
              Properties.EditProperties.Alignment = taLeftJustify
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.NullStyle = nssUnchecked
              Properties.EditProperties.ReadOnly = False
              Properties.EditProperties.ValueChecked = 'True'
              Properties.EditProperties.ValueGrayed = ''
              Properties.EditProperties.ValueUnchecked = 'False'
              Properties.DataBinding.ValueType = 'Variant'
              Properties.Value = Null
            end
            object vgmPainelControle: TcxEditorRow
              Expanded = False
              Properties.Caption = '6. Permitir acesso ao Painel de Controle'
              Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
              Properties.EditProperties.Alignment = taLeftJustify
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.NullStyle = nssUnchecked
              Properties.EditProperties.ReadOnly = False
              Properties.EditProperties.ValueChecked = 'True'
              Properties.EditProperties.ValueGrayed = ''
              Properties.EditProperties.ValueUnchecked = 'False'
              Properties.DataBinding.ValueType = 'Variant'
              Properties.Value = Null
            end
            object vgmCtrlAltDel: TcxEditorRow
              Expanded = False
              Properties.Caption = '7. Permitir acesso ao CTRL-ALT-DEL'
              Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
              Properties.EditProperties.Alignment = taLeftJustify
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.NullStyle = nssUnchecked
              Properties.EditProperties.ReadOnly = False
              Properties.EditProperties.ValueChecked = 'True'
              Properties.EditProperties.ValueGrayed = ''
              Properties.EditProperties.ValueUnchecked = 'False'
              Properties.DataBinding.ValueType = 'Variant'
              Properties.Value = Null
            end
            object vgmCmdExec: TcxEditorRow
              Expanded = False
              Properties.Caption = '8. Permitir acesso ao Comando Executar'
              Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
              Properties.EditProperties.Alignment = taLeftJustify
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.NullStyle = nssUnchecked
              Properties.EditProperties.ReadOnly = False
              Properties.EditProperties.ValueChecked = 'True'
              Properties.EditProperties.ValueGrayed = ''
              Properties.EditProperties.ValueUnchecked = 'False'
              Properties.DataBinding.ValueType = 'Variant'
              Properties.Value = Null
            end
            object vgmLiberarRede: TcxEditorRow
              Properties.Caption = '9. Permitir acesso aos Meus Locais de Rede'
              Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.NullStyle = nssUnchecked
              Properties.DataBinding.ValueType = 'Boolean'
              Properties.Value = Null
            end
            object vgmEsconderDrives: TcxEditorRow
              Properties.Caption = '10. Marque os drives que voc'#234' deseja bloquear'
              Properties.EditPropertiesClassName = 'TcxPopupEditProperties'
              Properties.EditProperties.PopupControl = clbDrives
              Properties.EditProperties.OnCloseUp = vgmEsconderDrivesEditPropertiesCloseUp
              Properties.DataBinding.ValueType = 'String'
              Properties.Value = Null
            end
          end
          object vgMCCategoryRow2: TcxCategoryRow
            Properties.Caption = 'Internet Explorer'
            object vgmBloquearDownload: TcxEditorRow
              Expanded = False
              Properties.Caption = '11. N'#227'o permitir download da internet'
              Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
              Properties.EditProperties.Alignment = taLeftJustify
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.NullStyle = nssUnchecked
              Properties.EditProperties.ReadOnly = False
              Properties.EditProperties.ValueChecked = 'True'
              Properties.EditProperties.ValueGrayed = ''
              Properties.EditProperties.ValueUnchecked = 'False'
              Properties.DataBinding.ValueType = 'Variant'
              Properties.Value = Null
            end
            object vgmPaginaInicial: TcxEditorRow
              Expanded = False
              Properties.Caption = '12. P'#225'gina Inicial'
              Properties.EditPropertiesClassName = 'TcxTextEditProperties'
              Properties.EditProperties.Alignment.Horz = taLeftJustify
              Properties.EditProperties.Alignment.Vert = taVCenter
              Properties.EditProperties.MaxLength = 0
              Properties.EditProperties.ReadOnly = False
              Properties.DataBinding.ValueType = 'String'
              Properties.Value = Null
            end
          end
          object vgMCFundoLogin: TcxEditorRow
            Properties.Caption = '13. Imagem de fundo para tela de LOGIN'
            Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
            Properties.EditProperties.Buttons = <
              item
                Caption = 'Clique aqui para selecionar uma imagem'
                Default = True
                Kind = bkText
                LeftAlignment = True
                Width = 500
              end>
            Properties.EditProperties.ViewStyle = vsButtonsAutoWidth
            Properties.EditProperties.OnButtonClick = vgMCEditorRow1EditPropertiesButtonClick
            Properties.DataBinding.ValueType = 'String'
            Properties.Value = Null
          end
          object vgMCFundoDesktop: TcxEditorRow
            Properties.Caption = '14. Imagem de fundo para a '#193'REA DE TRABALHO'
            Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
            Properties.EditProperties.Buttons = <
              item
                Caption = 'Clique aqui para selecionar uma imagem'
                Default = True
                Kind = bkText
              end>
            Properties.EditProperties.ViewStyle = vsButtonsAutoWidth
            Properties.EditProperties.OnButtonClick = vgMCFundoDesktopEditPropertiesButtonClick
            Properties.DataBinding.ValueType = 'String'
            Properties.Value = Null
          end
          object vgmMostrarApenasPIN: TcxEditorRow
            Height = 46
            Properties.Caption = 
              '15. Esconder campo senha da tela de login'#13#10'('#218'til para locais que' +
              ' tem apenas acesso'#13#10'por cart'#227'o de tempo)'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.DataBinding.ValueType = 'String'
            Properties.Value = 'False'
          end
          object vgmTextoPIN: TcxEditorRow
            Height = 32
            Properties.Caption = '16. Texto para o campo NOME DE USU'#193'RIO na tela'#13#10'      de Login'
            Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.MaxLength = 30
            Properties.DataBinding.ValueType = 'String'
            Properties.Value = ''
          end
        end
        object clbDrives: TcxCheckListBox
          Left = 176
          Top = 88
          Width = 209
          Height = 161
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
          TabOrder = 1
          Visible = False
        end
      end
      object tsQdoCairRede: TcxTabSheet
        BorderWidth = 10
        Caption = ' &C. Falha de Rede    '
        ImageIndex = 2
        object rgQdoCairRede: TcxRadioGroup
          Left = 0
          Top = 0
          Align = alTop
          ParentFont = False
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 
                '&1. Permitir que APENAS os acessos PR'#201'-PAGOS continuem normalmen' +
                'te at'#233' que os cr'#233'ditos do cliente terminem.'
              Value = 0
            end
            item
              Caption = '&2. Permitir que todos acessos continuem normalmente.'
              Value = 1
            end
            item
              Caption = 
                '&3. Bloquear todos acessos em andamento at'#233' que a conex'#227'o seja r' +
                'e-estabelecida'
              Value = 2
            end
            item
              Caption = '&4. Fechar o CM-Guard e liberar acesso total em todas m'#225'quinas'
              Value = 3
            end>
          Properties.WordWrap = True
          Properties.OnEditValueChanged = rgQdoCairRedePropertiesEditValueChanged
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.TextStyle = []
          TabOrder = 0
          Height = 137
          Width = 682
        end
        object cxLabel1: TcxLabel
          Left = 3
          Top = -2
          AutoSize = False
          Caption = 
            ' O que fazer quando cair a conex'#227'o de rede entre as m'#225'quinas cli' +
            'entes e o servidor Cyber Manager ? '
          ParentColor = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.Color = clNavy
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clCaptionText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfOffice11
          Style.Shadow = False
          Style.TextStyle = []
          Style.TransparentBorder = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.Kind = lfOffice11
          Height = 20
          Width = 498
        end
      end
      object tsCores: TcxTabSheet
        BorderWidth = 5
        Caption = ' &D. Cores            '
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
          Height = 491
          Align = alLeft
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
            Properties.Caption = '4. M'#225'quina em Uso em Modo Manuten'#231#227'o'
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
          Style.IsFontAssigned = True
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
          Caption = 'M'#225'quina em Modo Manuten'#231#227'o'
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
      end
      object tsRec: TcxTabSheet
        BorderWidth = 5
        Caption = ' &E. Recibos          '
        ImageIndex = 3
        object vgRec: TcxDBVerticalGrid
          Left = 0
          Top = 0
          Width = 692
          Height = 491
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          LookAndFeel.Kind = lfFlat
          OptionsView.CellTextMaxLineCount = 3
          OptionsView.AutoScaleBands = False
          OptionsView.PaintStyle = psDelphi
          OptionsView.GridLineColor = clBtnShadow
          OptionsView.RowHeaderMinWidth = 30
          OptionsView.RowHeaderWidth = 269
          OptionsView.RowHeight = 19
          OptionsView.ValueWidth = 92
          ParentFont = False
          TabOrder = 0
          OnEditValueChanged = vgRecEditValueChanged
          DataController.DataSource = DS
          object vgRecImprimirImpRec1: TcxDBEditorRow
            Expanded = False
            Height = 17
            Properties.Caption = '1. Permitir a impress'#227'o de recibos'
            Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.DropDownRows = 7
            Properties.EditProperties.Items = <
              item
                Description = 'N'#227'o'
                ImageIndex = 0
                Value = 'False'
              end
              item
                Description = 'Sim'
                ImageIndex = 1
                Value = 'True'
              end>
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'ImprimirImpRec'
          end
          object vgRecPortaImpRec1: TcxDBEditorRow
            Expanded = False
            Height = 38
            Properties.Caption = '2. Porta onde est'#225' conectada '#13#10'   a impressora de recibos'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.DropDownListStyle = lsEditFixedList
            Properties.EditProperties.DropDownRows = 7
            Properties.EditProperties.Items.Strings = (
              'LPT1'
              'LPT2'
              'COM1'
              'COM2')
            Properties.EditProperties.MaxLength = 10
            Properties.EditProperties.ReadOnly = False
            Properties.EditProperties.Revertable = True
            Properties.DataBinding.FieldName = 'PortaImpRec'
          end
          object vgRecSaltoImpRec1: TcxDBEditorRow
            Expanded = False
            Height = 35
            Properties.Caption = '3. Quantidade de linhas '#224' saltar ao'#13#10'   final do recibo'
            Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.AssignedValues.MaxValue = True
            Properties.EditProperties.AssignedValues.MinValue = True
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'SaltoImpRec'
          end
          object vgRecLargImpRec1: TcxDBEditorRow
            Expanded = False
            Height = 19
            Properties.Caption = '4. Largura do recibo em caracteres'
            Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.AssignedValues.MaxValue = True
            Properties.EditProperties.AssignedValues.MinValue = True
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'LargImpRec'
          end
          object vgRecCabecalhoImpRec1: TcxDBEditorRow
            Expanded = False
            Height = 62
            Properties.Caption = '5. Cabe'#231'alho'
            Properties.EditPropertiesClassName = 'TcxMemoProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.MaxLength = 0
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'CabecalhoImpRec'
          end
          object vgRecRodapeImpRec1: TcxDBEditorRow
            Expanded = False
            Height = 66
            Properties.Caption = '6. Rodap'#233
            Properties.EditPropertiesClassName = 'TcxMemoProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.MaxLength = 0
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'RodapeImpRec'
          end
        end
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'BarraTabSheet'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmSalvar
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmCancelar
            Visible = True
          end>
        Name = 'BarraTabSheet1'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LargeImages = FrmPri.im32
    MakeDisabledImagesFaded = True
    Left = 96
    Top = 440
    DockControlHeights = (
      0
      0
      44
      0)
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
      UnclickAfterDoing = False
      OnClick = cmSalvarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 41
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Enabled = False
      Hint = 'Cancelar'
      Visible = ivAlways
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 49
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
    Left = 296
    Top = 473
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 152
    Top = 114
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 328
    Top = 464
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
        Name = 'LimitePadraoDebito'
        DataType = ftCurrency
      end
      item
        Name = 'NumSeq'
        DataType = ftAutoInc
      end
      item
        Name = 'Modulos'
        DataType = ftMemo
      end
      item
        Name = 'TiposLancExtra'
        DataType = ftMemo
      end
      item
        Name = 'ProgramasPermitidos'
        DataType = ftMemo
      end
      item
        Name = 'CMGuard'
        DataType = ftMemo
      end
      item
        Name = 'JanelasExplorer'
        DataType = ftMemo
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
        Name = 'ProdutoImpressao'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'PermiteCapturaTela'
        DataType = ftBoolean
      end
      item
        Name = 'AlertaFimTempo'
        DataType = ftDateTime
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
        Name = 'MostraCliCadAntesAvulso'
        DataType = ftBoolean
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
        Name = 'PortaImpRec'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SaltoImpRec'
        DataType = ftWord
      end
      item
        Name = 'LargImpRec'
        DataType = ftWord
      end
      item
        Name = 'CabecalhoImpRec'
        DataType = ftMemo
      end
      item
        Name = 'RodapeImpRec'
        DataType = ftMemo
      end
      item
        Name = 'ImprimirImpRec'
        DataType = ftBoolean
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
        Name = 'ExigirRG'
        DataType = ftBoolean
      end
      item
        Name = 'DesativaRegAutImp'
        DataType = ftBoolean
      end
      item
        Name = 'EscondeTipoAcesso'
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
    object MTLimitePadraoDebito: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'LimitePadraoDebito'
    end
    object MTNumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object MTModulos: TMemoField
      FieldName = 'Modulos'
      BlobType = ftMemo
    end
    object MTTiposLancExtra: TMemoField
      FieldName = 'TiposLancExtra'
      BlobType = ftMemo
    end
    object MTProgramasPermitidos: TMemoField
      FieldName = 'ProgramasPermitidos'
      BlobType = ftMemo
    end
    object MTCMGuard: TMemoField
      FieldName = 'CMGuard'
      BlobType = ftMemo
    end
    object MTJanelasExplorer: TMemoField
      FieldName = 'JanelasExplorer'
      BlobType = ftMemo
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
      FieldName = 'EncerramentoPrePago'
    end
    object MTProdutoImpressao: TStringField
      FieldName = 'ProdutoImpressao'
      Size = 15
    end
    object MTPermiteCapturaTela: TBooleanField
      FieldName = 'PermiteCapturaTela'
    end
    object MTAlertaFimTempo: TDateTimeField
      FieldName = 'AlertaFimTempo'
    end
    object MTVariosTiposAcesso: TBooleanField
      FieldName = 'VariosTiposAcesso'
    end
    object MTModoPagtoAcesso: TWordField
      FieldName = 'ModoPagtoAcesso'
    end
    object MTMostraPrePagoDec: TBooleanField
      FieldName = 'MostraPrePagoDec'
    end
    object MTTempoMaxAlerta: TDateTimeField
      FieldName = 'TempoMaxAlerta'
    end
    object MTMostraCliCadAntesAvulso: TBooleanField
      FieldName = 'MostraCliCadAntesAvulso'
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
      FieldName = 'CorLivre'
    end
    object MTCorFLivre: TIntegerField
      FieldName = 'CorFLivre'
    end
    object MTCorUsoPrePago: TIntegerField
      FieldName = 'CorUsoPrePago'
    end
    object MTCorFUsoPrePago: TIntegerField
      FieldName = 'CorFUsoPrePago'
    end
    object MTCorUsoPosPago: TIntegerField
      FieldName = 'CorUsoPosPago'
    end
    object MTCorFUsoPosPago: TIntegerField
      FieldName = 'CorFUsoPosPago'
    end
    object MTCorAguardaPagto: TIntegerField
      FieldName = 'CorAguardaPagto'
    end
    object MTCorFAguardaPagto: TIntegerField
      FieldName = 'CorFAguardaPagto'
    end
    object MTCorManutencao: TIntegerField
      FieldName = 'CorManutencao'
    end
    object MTCorFManutencao: TIntegerField
      FieldName = 'CorFManutencao'
    end
    object MTCorPausado: TIntegerField
      FieldName = 'CorPausado'
    end
    object MTCorFPausado: TIntegerField
      FieldName = 'CorFPausado'
    end
    object MTCorDesktop: TIntegerField
      FieldName = 'CorDesktop'
    end
    object MTCorFDesktop: TIntegerField
      FieldName = 'CorFDesktop'
    end
    object MTCampoLocalizaCli: TWordField
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
    object MTPortaImpRec: TStringField
      FieldName = 'PortaImpRec'
      Size = 10
    end
    object MTSaltoImpRec: TWordField
      FieldName = 'SaltoImpRec'
    end
    object MTLargImpRec: TWordField
      FieldName = 'LargImpRec'
    end
    object MTCabecalhoImpRec: TMemoField
      FieldName = 'CabecalhoImpRec'
      BlobType = ftMemo
    end
    object MTRodapeImpRec: TMemoField
      FieldName = 'RodapeImpRec'
      BlobType = ftMemo
    end
    object MTImprimirImpRec: TBooleanField
      FieldName = 'ImprimirImpRec'
    end
    object MTMostraProgAtual: TBooleanField
      FieldName = 'MostraProgAtual'
    end
    object MTNomeProdutoImp: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeProdutoImp'
      LookupDataSet = Dados.tbPro
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'ProdutoImpressao'
      Size = 50
      Lookup = True
    end
    object MTMostraObs: TBooleanField
      FieldName = 'MostraObs'
    end
    object MTExigirRG: TBooleanField
      FieldName = 'ExigirRG'
    end
    object MTDesativaRegAutImp: TBooleanField
      FieldName = 'DesativaRegAutImp'
    end
    object MTAlterarSenhaCli: TBooleanField
      FieldName = 'AlterarSenhaCli'
    end
    object MTVerSenhaCli: TBooleanField
      FieldName = 'VerSenhaCli'
    end
    object MTEscondeTipoAcesso: TBooleanField
      FieldName = 'EscondeTipoAcesso'
    end
  end
  object DS: TDataSource
    DataSet = MT
    Left = 232
    Top = 472
  end
  object LMDHint1: TLMDHint
    Bevel.StyleOuter = bvLowered
    Bevel.Mode = bmCustom
    Font.Charset = ANSI_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 240
    Top = 160
  end
end
