inherited fbOpcoes: TfbOpcoes
  Left = 91
  Top = 160
  Width = 620
  Height = 486
  Caption = 'Op'#231#245'es'
  OldCreateOrder = True
  OnCreate = FrmBasePaiCreate
  OnDestroy = FrmBasePaiDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 42
    Width = 612
    Height = 417
    object cxPageControl1: TcxPageControl
      Left = 0
      Top = 0
      Width = 612
      Height = 417
      ActivePage = cxTabSheet2
      Align = alClient
      Style = 8
      TabOrder = 0
      ClientRectBottom = 417
      ClientRectRight = 612
      ClientRectTop = 24
      object tsGeral: TcxTabSheet
        Caption = '&1. Geral'
        ImageIndex = 0
        object VG: TcxDBVerticalGrid
          Left = 0
          Top = 0
          Width = 612
          Height = 393
          BorderStyle = cxcbsNone
          Align = alClient
          LookAndFeel.Kind = lfFlat
          OptionsView.CellAutoHeight = True
          OptionsView.CellTextMaxLineCount = 10
          OptionsView.AutoScaleBands = False
          OptionsView.PaintStyle = psDelphi
          OptionsView.GridLineColor = clBtnShadow
          OptionsView.RowHeaderMinWidth = 10
          OptionsView.RowHeaderWidth = 335
          OptionsView.RowHeight = 0
          OptionsView.ValueWidth = 92
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.AllowChangeRecord = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          TabOrder = 0
          DataController.DataSource = DS
          object VGRegImp981: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '1. Registrar Impress'#245'es em Windows 95, 98 e ME'
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
          object VGNomeProdImp1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '2. Produto a ser lan'#231'ado como impress'#227'o'
            Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.ClearKey = 16473
            Properties.EditProperties.DropDownRows = 7
            Properties.EditProperties.ImmediateDropDown = False
            Properties.EditProperties.ListColumns = <>
            Properties.EditProperties.ListOptions.ShowHeader = False
            Properties.EditProperties.MaxLength = 50
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'NomeProdImp'
          end
          object VGFecharProgramas1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '3. Fechar programas ao finalizar acesso'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.EditProperties.ReadOnly = False
            Properties.EditProperties.ValueChecked = 'True'
            Properties.EditProperties.ValueGrayed = ''
            Properties.EditProperties.ValueUnchecked = 'False'
            Properties.DataBinding.FieldName = 'FecharProgramas'
          end
          object VGAutoExecutar1: TcxDBEditorRow
            Expanded = False
            Height = 0
            Properties.Caption = '4. Programa a ser executado automaticamente ao iniciar acesso'
            Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.MaxLength = 200
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'AutoExecutar'
          end
          object VGLimiteTempoPadrao1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '5. Limite padr'#227'o de tempo ao liberar acesso'
            Properties.EditPropertiesClassName = 'TcxTimeEditProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'LimiteTempoPadrao'
          end
          object VGPacoteTempoReal1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '6. Abater tempo dos pacotes conforme tempo real de uso'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.EditProperties.ReadOnly = False
            Properties.EditProperties.ValueChecked = 'True'
            Properties.EditProperties.ValueGrayed = ''
            Properties.EditProperties.ValueUnchecked = 'False'
            Properties.DataBinding.FieldName = 'PacoteTempoReal'
          end
          object VGPermiteLoginSemCred1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '7. Permitir login aut'#244'nomo de clientes que n'#227'o tenham cr'#233'dito'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.EditProperties.ReadOnly = False
            Properties.EditProperties.ValueChecked = 'True'
            Properties.EditProperties.ValueGrayed = ''
            Properties.EditProperties.ValueUnchecked = 'False'
            Properties.DataBinding.FieldName = 'PermiteLoginSemCred'
          end
          object VGEncerramentoPrePago1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '8. O que fazer ao encerrar tempo pr'#233'-pago'
            Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.DropDownRows = 7
            Properties.EditProperties.Items = <
              item
                Description = 'Pausar Acesso'
                ImageIndex = 0
                Value = '0'
              end
              item
                Description = 'Continuar em modo P'#211'S-PAGO'
                ImageIndex = 1
                Value = '1'
              end
              item
                Description = 'Encerrar Acesso'
                ImageIndex = 2
                Value = '2'
              end>
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'EncerramentoPrePago'
          end
          object VGAlertaFimTempo1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '9. Alertar cliente que tempo est'#225' acabando quando faltar'
            Properties.EditPropertiesClassName = 'TcxTimeEditProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'AlertaFimTempo'
          end
          object VGTempoMaxAlerta1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '10. Mostrar alerta por no m'#225'ximo'
            Properties.EditPropertiesClassName = 'TcxTimeEditProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'TempoMaxAlerta'
          end
          object VGMostraPrePagoDec1: TcxDBEditorRow
            Expanded = False
            Height = 0
            Properties.Caption = '11. Mostrar tempo de acessos pr'#233'-pagos em modo Descrescente'
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
          object VGPermiteCapturaTela1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '12. Permitir captura de tela'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.EditProperties.ReadOnly = False
            Properties.EditProperties.ValueChecked = 'True'
            Properties.EditProperties.ValueGrayed = ''
            Properties.EditProperties.ValueUnchecked = 'False'
            Properties.DataBinding.FieldName = 'PermiteCapturaTela'
          end
          object VGVariosTiposAcesso1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '13. Habilitar tabela de pre'#231'os por Tipo de Acesso'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.EditProperties.ReadOnly = False
            Properties.EditProperties.ValueChecked = 'True'
            Properties.EditProperties.ValueGrayed = ''
            Properties.EditProperties.ValueUnchecked = 'False'
            Properties.DataBinding.FieldName = 'VariosTiposAcesso'
          end
          object VGModoPagtoAcesso1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '14. Como deve ser exibida a tela de pagamento do acesso'
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
                Description = 'Somente atrav'#233's da aba "Transa'#231#245'es"'
                ImageIndex = 2
                Value = '2'
              end>
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'ModoPagtoAcesso'
          end
          object VGMostraCliCadAntesAvulso: TcxDBEditorRow
            Expanded = False
            Height = 32
            Properties.Caption = 
              '15. Mostrar cliente cadastrado antes do cliente avulso na tela d' +
              'e'#13#10'      libera'#231#227'o de m'#225'quina'
            Properties.HeaderAlignmentVert = vaCenter
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.MultiLine = True
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.EditProperties.ReadOnly = False
            Properties.EditProperties.ValueChecked = 'True'
            Properties.EditProperties.ValueGrayed = ''
            Properties.EditProperties.ValueUnchecked = 'False'
            Properties.DataBinding.FieldName = 'MostraCliCadAntesAvulso'
          end
          object VGCampoLocalizaCli1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '16. Localizar cliente por'
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
          object VGManterSaldoCaixa1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '17. Manter Saldo do Caixa'
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
          object VGNaoMostrarMsgDebito1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '18. N'#227'o mostrar mensagem de d'#233'bito de cliente'
            Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.NullStyle = nssUnchecked
            Properties.EditProperties.ReadOnly = False
            Properties.EditProperties.ValueChecked = 'True'
            Properties.EditProperties.ValueGrayed = ''
            Properties.EditProperties.ValueUnchecked = 'False'
            Properties.DataBinding.FieldName = 'NaoMostrarMsgDebito'
          end
          object VGTolerancia1: TcxDBEditorRow
            Expanded = False
            Properties.Caption = '19. Tempo de Toler'#226'ncia para p'#243's-pago'
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
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = '&2. M'#225'quinas Clientes'
        ImageIndex = 1
        object vgMC: TcxVerticalGrid
          Left = 0
          Top = 0
          Width = 612
          Height = 393
          Align = alClient
          LookAndFeel.Kind = lfFlat
          OptionsView.CellTextMaxLineCount = 3
          OptionsView.AutoScaleBands = False
          OptionsView.PaintStyle = psDelphi
          OptionsView.GridLineColor = clBtnShadow
          OptionsView.RowHeaderMinWidth = 30
          OptionsView.RowHeaderWidth = 268
          OptionsView.ValueWidth = 92
          OptionsBehavior.GoToNextCellOnEnter = True
          TabOrder = 0
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
                Value = '0'
              end
              item
                Description = 'Rodap'#233
                ImageIndex = 1
                Value = '1'
              end
              item
                Description = 'Esquerda'
                ImageIndex = 2
                Value = '2'
              end
              item
                Description = 'Direita'
                ImageIndex = 3
                Value = '3'
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
                Value = '0'
              end
              item
                Description = 'Reiniciar a M'#225'quina'
                ImageIndex = 1
                Value = '1'
              end
              item
                Description = 'Efetuar Logoff no Windows'
                ImageIndex = 2
                Value = '2'
              end>
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.ValueType = 'Variant'
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
            Properties.DataBinding.ValueType = 'Float'
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
              Properties.DataBinding.ValueType = 'String'
              Properties.Value = 'False'
            end
          end
          object vgMCCategoryRow2: TcxCategoryRow
            Properties.Caption = 'Internet Explorer'
            object vgmBloquearDownload: TcxEditorRow
              Expanded = False
              Properties.Caption = '10. N'#227'o permitir download da internet'
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
              Properties.Caption = '11. P'#225'gina Inicial'
              Properties.EditPropertiesClassName = 'TcxTextEditProperties'
              Properties.EditProperties.Alignment.Horz = taLeftJustify
              Properties.EditProperties.Alignment.Vert = taVCenter
              Properties.EditProperties.MaxLength = 0
              Properties.EditProperties.ReadOnly = False
              Properties.DataBinding.ValueType = 'String'
              Properties.Value = Null
            end
          end
        end
      end
      object cxTabSheet3: TcxTabSheet
        BorderWidth = 10
        Caption = '&3. Quando cair a conex'#227'o de rede'
        ImageIndex = 2
        object rgQdoCairRede: TcxRadioGroup
          Left = 0
          Top = 0
          Width = 592
          Height = 137
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
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.TextStyle = []
          TabOrder = 0
        end
        object cxLabel1: TcxLabel
          Left = 3
          Top = -2
          Width = 498
          Height = 20
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
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.Kind = lfOffice11
        end
      end
      object tsCores: TcxTabSheet
        Caption = '&4. Cores'
        ImageIndex = 4
        object vgCor: TcxDBVerticalGrid
          Left = 0
          Top = 0
          Width = 612
          Height = 393
          Align = alClient
          OptionsView.PaintStyle = psDelphi
          OptionsView.RowHeaderWidth = 101
          TabOrder = 0
          DataController.DataSource = DS
          object vgCorCMaqLivre: TcxCategoryRow
            Properties.Caption = '1. M'#225'quina Livre'
            object vgCorMaqLivre: TcxDBEditorRow
              Height = 17
              Properties.Caption = 'Fundo'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.ColorDialogType = cxcdtCustom
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.EditProperties.Items = <>
              Properties.EditProperties.PrepareInfo = ''
              Properties.DataBinding.FieldName = 'CorLivre'
            end
            object vgCorFMaqLivre: TcxDBEditorRow
              Properties.Caption = 'Fonte'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.ColorDialogType = cxcdtCustom
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.EditProperties.Items = <>
              Properties.EditProperties.PrepareInfo = ''
              Properties.DataBinding.FieldName = 'CorFLivre'
            end
          end
          object vgCorCUsoPre: TcxCategoryRow
            Properties.Caption = '2. M'#225'quina em Uso Pr'#233'-Pago'
            object vgCorMaqUsoPre: TcxDBEditorRow
              Properties.Caption = 'Fundo'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.ColorDialogType = cxcdtCustom
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.EditProperties.Items = <>
              Properties.EditProperties.PrepareInfo = ''
              Properties.DataBinding.FieldName = 'CorUsoPrePago'
            end
            object vgCorFUsoPre: TcxDBEditorRow
              Properties.Caption = 'Fonte'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.ColorDialogType = cxcdtCustom
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.EditProperties.Items = <>
              Properties.EditProperties.PrepareInfo = ''
              Properties.DataBinding.FieldName = 'CorFUsoPrePago'
            end
          end
          object vgCorCUsoPos: TcxCategoryRow
            Properties.Caption = '3. M'#225'quina em Uso P'#243's-Pago'
            object vgCorUsoPos: TcxDBEditorRow
              Height = 17
              Properties.Caption = 'Fundo'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.ColorDialogType = cxcdtCustom
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.EditProperties.Items = <>
              Properties.EditProperties.PrepareInfo = ''
              Properties.DataBinding.FieldName = 'CorUsoPosPago'
            end
            object vgCorFUsoPos: TcxDBEditorRow
              Properties.Caption = 'Fonte'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.ColorDialogType = cxcdtCustom
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.EditProperties.Items = <>
              Properties.EditProperties.PrepareInfo = ''
              Properties.DataBinding.FieldName = 'CorFUsoPosPago'
            end
          end
          object vgCorCUsoManut: TcxCategoryRow
            Properties.Caption = '4. M'#225'quina em Uso em Modo Manuten'#231#227'o'
            object vgCorManut: TcxDBEditorRow
              Properties.Caption = 'Fundo'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.ColorDialogType = cxcdtCustom
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.EditProperties.Items = <>
              Properties.EditProperties.PrepareInfo = ''
              Properties.DataBinding.FieldName = 'CorManutencao'
            end
            object vgCorFManut: TcxDBEditorRow
              Properties.Caption = 'Fonte'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.ColorDialogType = cxcdtCustom
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.EditProperties.Items = <>
              Properties.EditProperties.PrepareInfo = ''
              Properties.DataBinding.FieldName = 'CorFManutencao'
            end
          end
          object vgCorCPausada: TcxCategoryRow
            Properties.Caption = '5. M'#225'quina Pausada '
            object vgCorPausa: TcxDBEditorRow
              Properties.Caption = 'Fundo'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.ColorDialogType = cxcdtCustom
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.EditProperties.Items = <>
              Properties.EditProperties.PrepareInfo = ''
              Properties.DataBinding.FieldName = 'CorPausado'
            end
            object vgCorFPausa: TcxDBEditorRow
              Properties.Caption = 'Fonte'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.ColorDialogType = cxcdtCustom
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.EditProperties.Items = <>
              Properties.EditProperties.PrepareInfo = ''
              Properties.DataBinding.FieldName = 'CorFPausado'
            end
          end
          object vgCorCategoryRow4: TcxCategoryRow
            Properties.Caption = '6. '#193'rea de Trabalho das M'#225'quinas Clientes'
            object vgCorDesktop: TcxDBEditorRow
              Properties.Caption = 'Fundo'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.ColorDialogType = cxcdtCustom
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.EditProperties.Items = <>
              Properties.EditProperties.PrepareInfo = ''
              Properties.DataBinding.FieldName = 'CorDesktop'
            end
            object vgCorFDesktop: TcxDBEditorRow
              Properties.Caption = 'Fonte'
              Properties.EditPropertiesClassName = 'TcxColorComboBoxProperties'
              Properties.EditProperties.BeepOnError = True
              Properties.EditProperties.ColorDialogType = cxcdtCustom
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.ShowDescriptions = False
              Properties.EditProperties.Items = <>
              Properties.EditProperties.PrepareInfo = ''
              Properties.DataBinding.FieldName = 'CorFDesktop'
            end
          end
        end
      end
      object cxTabSheet4: TcxTabSheet
        Caption = '&5. Recibos'
        ImageIndex = 3
        object tsRecibos: TcxDBVerticalGrid
          Left = 0
          Top = 0
          Width = 612
          Height = 393
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
          DataController.DataSource = DS
          object tsRecibosImprimirImpRec1: TcxDBEditorRow
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
          object tsRecibosPortaImpRec1: TcxDBEditorRow
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
          object tsRecibosSaltoImpRec1: TcxDBEditorRow
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
          object tsRecibosLargImpRec1: TcxDBEditorRow
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
          object tsRecibosCabecalhoImpRec1: TcxDBEditorRow
            Expanded = False
            Height = 62
            Properties.Caption = '5. Cabe'#231'alho'
            Properties.EditPropertiesClassName = 'TcxMemoProperties'
            Properties.EditProperties.Alignment = taLeftJustify
            Properties.EditProperties.MaxLength = 0
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'CabecalhoImpRec'
          end
          object tsRecibosRodapeImpRec1: TcxDBEditorRow
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
    Left = 176
    Top = 360
    DockControlHeights = (
      0
      0
      42
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
    Left = 144
    Top = 360
  end
  inherited CP: TdxComponentPrinter
    Left = 112
    Top = 360
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 176
    Top = 328
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
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.08b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 112
    Top = 328
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
  end
  object DS: TDataSource
    DataSet = MT
    Left = 144
    Top = 328
  end
end
