object FrmRegistro: TFrmRegistro
  Left = 255
  Top = 183
  BorderStyle = bsDialog
  Caption = 'Registro'
  ClientHeight = 384
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Paginas: TcxPageControl
    Left = 0
    Top = 0
    Width = 507
    Height = 299
    ActivePage = tsNaoLic
    Align = alClient
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
    Options = [pcoGoDialog]
    Style = 6
    TabOrder = 0
    ExplicitWidth = 460
    ExplicitHeight = 292
    ClientRectBottom = 299
    ClientRectRight = 507
    ClientRectTop = 24
    object tsLicenca: TcxTabSheet
      BorderWidth = 10
      Caption = 'Licen'#231'a de Uso'
      ImageIndex = 0
      ExplicitWidth = 460
      ExplicitHeight = 268
      object rgRegistro: TcxRadioGroup
        Left = 0
        Top = 180
        Align = alClient
        Caption = ' O que voc'#234' deseja fazer ? '
        ItemIndex = 0
        ParentColor = False
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = '&1. Fechar esta tela'
            Value = True
          end
          item
            Caption = '&2. Alterar minha licen'#231'a de uso'
          end
          item
            Caption = '&3. E&xibir ou alterar os dados cadastrais da loja'
          end>
        Properties.WordWrap = True
        Style.BorderStyle = ebsUltraFlat
        Style.Color = clBtnFace
        Style.HotTrack = True
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = True
        Style.Shadow = False
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        ExplicitTop = 178
        ExplicitWidth = 440
        ExplicitHeight = 70
        Height = 75
        Width = 487
      end
      object cxLabel4: TcxLabel
        Left = 0
        Top = 172
        Align = alTop
        AutoSize = False
        Transparent = True
        ExplicitTop = 170
        ExplicitWidth = 440
        Height = 8
        Width = 487
      end
      object vgLic: TcxVerticalGrid
        Left = 0
        Top = 44
        Width = 487
        Height = 128
        Styles.Content = cxStyle17
        Styles.Header = cxStyle14
        Align = alTop
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = True
        OptionsView.PaintStyle = psDelphi
        OptionsView.RowHeaderWidth = 124
        OptionsData.CancelOnExit = False
        ParentFont = False
        TabOrder = 2
        ExplicitTop = 42
        ExplicitWidth = 440
        object vgLicCodigo: TcxEditorRow
          Height = 30
          Properties.Caption = '1. C'#243'digo da Loja'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.CharCase = ecUpperCase
          Properties.EditProperties.HideSelection = False
          Properties.EditProperties.MaskKind = emkRegExprEx
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = '0129-jdjf'
        end
        object vgLicNumero: TcxEditorRow
          Height = 30
          Properties.Caption = '2. N'#250'mero da Licen'#231'a'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = '0000-0000-0000-0000'
        end
        object vgLicTipo: TcxEditorRow
          Properties.Caption = '3. Tipo'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object vgLicExpira: TcxEditorRow
          Properties.Caption = '4. Expira em'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object vgLicMaq: TcxEditorRow
          Properties.Caption = '5. M'#225'quinas'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
          Properties.EditProperties.HideSelection = False
          Properties.EditProperties.ImmediatePost = True
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
      end
      object cxLabel10: TcxLabel
        Left = 0
        Top = 27
        Align = alTop
        Caption = 'Dados da sua licen'#231'a de uso:'
        ParentFont = False
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Transparent = True
        ExplicitTop = 21
        ExplicitWidth = 440
      end
      object lbSucesso: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Registro conclu'#237'do com sucesso ! '
        ParentFont = False
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -19
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Transparent = True
        Visible = False
        ExplicitWidth = 440
      end
    end
    object tsNaoLic: TcxTabSheet
      BorderWidth = 10
      Caption = 'Software N'#227'o Licenciado'
      ImageIndex = 1
      ExplicitWidth = 460
      ExplicitHeight = 268
      object rgNaoLic: TcxRadioGroup
        Left = 0
        Top = 99
        Align = alTop
        Caption = ' O que voc'#234' deseja fazer ? '
        ItemIndex = 0
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 
              '&1. Continuar usando em Modo Demonstra'#231#227'o'#13#10'     (nessa op'#231#227'o voc' +
              #234' est'#225' limitado ao controle de 2 m'#225'quinas apenas)'
            Value = True
          end
          item
            Caption = 
              '&2. Testar gratuitamente por 7 dias'#13#10'     (nessa op'#231#227'o voc'#234' pode' +
              'r'#225' controlar TODAS m'#225'quinas de sua loja)'
          end
          item
            Caption = '&3. J'#225' tenho um registro, vou digitar meu c'#243'digo de loja.'
          end>
        Properties.WordWrap = True
        Style.BorderStyle = ebs3D
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.HotTrack = True
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = True
        Style.Shadow = False
        Style.TransparentBorder = False
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Height = 148
        Width = 487
      end
      object cxLabel6: TcxLabel
        Left = 0
        Top = 45
        Align = alTop
        AutoSize = False
        Caption = 
          'O Cyber Manager n'#227'o est'#225' licenciado para ser executado nesta m'#225'q' +
          'uina e por isso est'#225' funcionando em modo demonstra'#231#227'o. Neste mod' +
          'o o sistema funciona sem nenhuma restri'#231#227'o de recursos, por'#233'm es' +
          't'#225' limitado ao controle de 2 m'#225'quinas apenas.'
        ParentFont = False
        Properties.LabelEffect = cxleCool
        Properties.WordWrap = True
        Style.BorderStyle = ebsNone
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        Transparent = True
        ExplicitTop = 49
        ExplicitWidth = 440
        Height = 54
        Width = 487
      end
      object cxLabel5: TcxLabel
        Left = 0
        Top = 17
        Align = alTop
        AutoSize = False
        Caption = 'Funcionando em Modo Demonstra'#231#227'o'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Transparent = True
        ExplicitTop = 21
        ExplicitWidth = 440
        Height = 28
        Width = 487
      end
      object lbExpirou: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Sua licen'#231'a de uso tempor'#225'ria expirou em 31/05/2004'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Transparent = True
        Visible = False
        ExplicitWidth = 440
      end
    end
    object tsDadosCad: TcxTabSheet
      BorderWidth = 10
      Caption = 'Dados Cadastrais'
      ImageIndex = 7
      ExplicitWidth = 460
      ExplicitHeight = 268
      object cxLabel20: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 
          'Para exibir ou alterar os dados cadastrais da loja digite a senh' +
          'a e clique em avan'#231'ar:'
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        ExplicitWidth = 440
        ExplicitHeight = 30
      end
      object cxLabel21: TcxLabel
        Left = 0
        Top = 44
        Caption = 'Senha da Loja: '
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Transparent = True
      end
      object edSenha: TcxTextEdit
        Left = 0
        Top = 62
        ParentFont = False
        Properties.EchoMode = eemPassword
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 2
        Width = 177
      end
    end
    object tsRegistro1: TcxTabSheet
      Tag = 2
      BorderWidth = 10
      Caption = 'Registro 1 / 5 - Loja'
      ImageIndex = 2
      ExplicitWidth = 460
      ExplicitHeight = 268
      object vgCad1: TcxDBVerticalGrid
        Left = 0
        Top = 45
        Width = 487
        Height = 127
        Styles.Header = cxStyle14
        Align = alTop
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = True
        OptionsView.ShowEditButtons = ecsbAlways
        OptionsView.RowHeaderWidth = 184
        OptionsView.RowHeight = 21
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsBehavior.AllowChangeRecord = False
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        TabOrder = 0
        DataController.DataSource = dsReg
        ExplicitWidth = 440
        object vgCad1Loja: TcxDBEditorRow
          Properties.Caption = 'Nome da Loja'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.DataBinding.FieldName = 'Loja'
        end
        object vgCad1TipoLoja: TcxDBEditorRow
          Properties.Caption = 'Tipo da Loja'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
          Properties.EditProperties.Columns = 3
          Properties.EditProperties.DefaultValue = 0
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.Items = <
            item
              Caption = 'Cyber Caf'#233
              Value = 0
            end
            item
              Caption = 'Lan House'
              Value = 1
            end
            item
              Caption = 'Ambos'
              Value = 2
            end>
          Properties.EditProperties.ReadOnly = False
          Properties.DataBinding.FieldName = 'TipoLoja'
        end
        object vgCad1NumMaq: TcxDBEditorRow
          Properties.Caption = 'Quantidade de M'#225'quinas Clientes'
          Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.ImmediatePost = True
          Properties.DataBinding.FieldName = 'NumMaq'
        end
        object vgCad1Proprietario: TcxDBEditorRow
          Height = 35
          Properties.Caption = 'Propriet'#225'rio(s)'
          Properties.EditPropertiesClassName = 'TcxMemoProperties'
          Properties.DataBinding.FieldName = 'Proprietarios'
        end
        object vgCad1Gerente: TcxDBEditorRow
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.DataBinding.FieldName = 'Gerente'
        end
      end
      object cxLabel2: TcxLabel
        Left = 0
        Top = 27
        Align = alTop
        AutoSize = False
        Caption = 
          'Digite as informa'#231#245'es requisitadas abaixo e clique no bot'#227'o "Ava' +
          'n'#231'ar":'
        Transparent = True
        ExplicitWidth = 440
        Height = 18
        Width = 487
      end
      object lbOpReg1: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        AutoSize = False
        Caption = 'Registrando o Cyber Manager para Teste Gratuito'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Transparent = True
        ExplicitWidth = 440
        Height = 27
        Width = 487
      end
    end
    object tsRegistro2: TcxTabSheet
      Tag = 3
      BorderWidth = 10
      Caption = 'Registro 2 / 5 - Endere'#231'o'
      ImageIndex = 1
      ExplicitWidth = 460
      ExplicitHeight = 268
      object vgCad2: TcxDBVerticalGrid
        Left = 0
        Top = 45
        Width = 487
        Height = 167
        Styles.Header = cxStyle14
        Align = alTop
        LookAndFeel.NativeStyle = True
        OptionsView.ShowEditButtons = ecsbAlways
        OptionsView.RowHeaderWidth = 86
        OptionsView.RecordsInterval = 1
        OptionsBehavior.AlwaysShowEditor = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        TabOrder = 0
        DataController.DataSource = dsReg
        ExplicitWidth = 440
        object vgCad2Pais: TcxDBEditorRow
          Properties.Caption = 'Pa'#237's'
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.LookupItems.Strings = (
            'Brasil')
          Properties.DataBinding.FieldName = 'Pais'
        end
        object vgCad2Cidade: TcxDBEditorRow
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.DataBinding.FieldName = 'Cidade'
        end
        object vgCad2UF: TcxDBEditorRow
          Properties.Caption = 'Estado'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.CharCase = ecUpperCase
          Properties.DataBinding.FieldName = 'UF'
        end
        object vgCad2CEP: TcxDBEditorRow
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.EditMask = '00000\-000'
          Properties.DataBinding.FieldName = 'CEP'
        end
        object vgCad2Endereco: TcxDBEditorRow
          Options.CanAutoHeight = False
          Height = 45
          Properties.Caption = 'Endere'#231'o'
          Properties.EditPropertiesClassName = 'TcxMemoProperties'
          Properties.EditProperties.AutoSelect = True
          Properties.DataBinding.FieldName = 'Endereco'
        end
        object vgCad2Telefones: TcxDBEditorRow
          Height = 45
          Properties.Caption = 'Telefone(s)'
          Properties.EditPropertiesClassName = 'TcxMemoProperties'
          Properties.DataBinding.FieldName = 'Telefones'
        end
      end
      object cxLabel3: TcxLabel
        Left = 0
        Top = 27
        Align = alTop
        AutoSize = False
        Caption = 
          'Digite as informa'#231#245'es requisitadas abaixo e clique no bot'#227'o "Ava' +
          'n'#231'ar":'
        Transparent = True
        ExplicitWidth = 440
        Height = 18
        Width = 487
      end
      object lbOpReg2: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        AutoSize = False
        Caption = 'Registrando o Cyber Manager para Teste Gratuito'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Transparent = True
        ExplicitWidth = 440
        Height = 27
        Width = 487
      end
    end
    object tsRegistro3: TcxTabSheet
      BorderWidth = 10
      Caption = 'Registro 3 / 5 - Senha'
      ImageIndex = 2
      ExplicitWidth = 460
      ExplicitHeight = 268
      object cxLabel8: TcxLabel
        Left = 0
        Top = 27
        Align = alTop
        AutoSize = False
        Caption = 
          'Digite as informa'#231#245'es requisitadas abaixo e clique no bot'#227'o "Ava' +
          'n'#231'ar":'
        Transparent = True
        ExplicitWidth = 440
        Height = 26
        Width = 487
      end
      object lbOpReg3: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        AutoSize = False
        Caption = 'Registrando o Cyber Manager para Teste Gratuito'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Transparent = True
        ExplicitWidth = 440
        Height = 27
        Width = 487
      end
      object cxGroupBox2: TcxGroupBox
        Left = 0
        Top = 53
        Align = alTop
        Caption = ' Senha da Loja '
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 2
        ExplicitWidth = 440
        Height = 172
        Width = 487
        object cxLabel13: TcxLabel
          Left = 16
          Top = 85
          Caption = 
            'A senha de registro da loja deve ser mantida em sigilo e ser'#225' re' +
            'quisitada'#13#10'nas seguintes situa'#231#245'es:'#13#10#13#10'- Altera'#231#227'o de dados cada' +
            'strais;'#13#10'- Instalar o programa em outra m'#225'quina ou outro disco r' +
            #237'gido.'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Transparent = True
        end
        object cxLabel14: TcxLabel
          Left = 16
          Top = 46
          Caption = 'Digite a senha novamente:'
          Transparent = True
        end
        object cxLabel15: TcxLabel
          Left = 72
          Top = 22
          Caption = 'Senha da Loja:'
          Transparent = True
        end
        object edSenha1: TcxDBTextEdit
          Left = 152
          Top = 22
          DataBinding.DataField = 'Senha'
          DataBinding.DataSource = dsReg
          Properties.EchoMode = eemPassword
          Properties.ReadOnly = False
          TabOrder = 3
          Width = 121
        end
        object edSenha2: TcxTextEdit
          Left = 152
          Top = 48
          Properties.EchoMode = eemPassword
          Properties.MaxLength = 30
          TabOrder = 4
          Width = 121
        end
      end
    end
    object tsRegistro4: TcxTabSheet
      BorderWidth = 10
      Caption = 'Registro 4 / 5 - E-mail'
      ImageIndex = 3
      ExplicitWidth = 460
      ExplicitHeight = 268
      object cxLabel16: TcxLabel
        Left = 0
        Top = 27
        Align = alTop
        AutoSize = False
        Caption = 
          'Digite as informa'#231#245'es requisitadas abaixo e clique no bot'#227'o "Ava' +
          'n'#231'ar":'
        Transparent = True
        ExplicitWidth = 440
        Height = 26
        Width = 487
      end
      object lbOpReg4: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        AutoSize = False
        Caption = 'Registrando o Cyber Manager para Teste Gratuito'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Transparent = True
        ExplicitWidth = 440
        Height = 27
        Width = 487
      end
      object cxGroupBox3: TcxGroupBox
        Left = 0
        Top = 166
        Align = alTop
        Caption = 
          ' E-mail(s) para envio de comunicados t'#233'cnicos e sobre novas vers' +
          #245'es  '
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsUltraFlat
        Style.Edges = [bTop]
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        ExplicitWidth = 440
        Height = 100
        Width = 487
        object edEmailTec: TcxDBMemo
          Left = 2
          Top = 16
          Align = alClient
          DataBinding.DataField = 'EmailTec'
          DataBinding.DataSource = dsReg
          Style.BorderStyle = ebsSingle
          TabOrder = 0
          ExplicitWidth = 436
          Height = 82
          Width = 483
        end
      end
      object cxLabel11: TcxLabel
        Left = 0
        Top = 153
        Align = alTop
        AutoSize = False
        Transparent = True
        ExplicitWidth = 440
        Height = 13
        Width = 487
      end
      object cxGroupBox1: TcxGroupBox
        Left = 0
        Top = 53
        Align = alTop
        Caption = ' E-mail(s) para envio de informa'#231#245'es confidenciais de registro '
        ParentFont = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsUltraFlat
        Style.Edges = [bTop]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clMaroon
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.HotTrack = True
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        ExplicitWidth = 440
        Height = 100
        Width = 487
        object edEmailReg: TcxDBMemo
          Left = 2
          Top = 16
          Align = alClient
          DataBinding.DataField = 'EmailReg'
          DataBinding.DataSource = dsReg
          ParentFont = False
          Style.BorderStyle = ebsSingle
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          TabOrder = 0
          ExplicitWidth = 436
          Height = 82
          Width = 483
        end
      end
    end
    object tsRegistro5: TcxTabSheet
      BorderWidth = 10
      Caption = 'Registro 5 / 5 - Conclus'#227'o'
      ImageIndex = 4
      ExplicitWidth = 460
      ExplicitHeight = 268
      object lbRegConcluir: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        AutoSize = False
        Caption = 'Concluir o Registro'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Transparent = True
        ExplicitWidth = 440
        Height = 27
        Width = 487
      end
      object cxLabel18: TcxLabel
        Left = 0
        Top = 27
        Align = alTop
        AutoSize = False
        Caption = 
          'Voc'#234' est'#225' prestes a concluir o registro de sua loja. Todas infor' +
          'ma'#231#245'es digitadas poder'#227'o ser alteradas a qualquer momento. Cliqu' +
          'e no bot'#227'o "Avan'#231'ar" para concluir o registro.'
        Properties.WordWrap = True
        Transparent = True
        ExplicitWidth = 440
        Height = 62
        Width = 487
      end
    end
    object tsAlteraLic1: TcxTabSheet
      BorderWidth = 10
      Caption = 'Alterando a Licen'#231'a'
      ImageIndex = 8
      ExplicitWidth = 460
      ExplicitHeight = 268
      object vgLic1: TcxVerticalGrid
        Left = 0
        Top = 105
        Width = 487
        Height = 65
        Styles.Background = cxStyle19
        Styles.Content = cxStyle2
        Styles.Selection = cxStyle10
        Align = alTop
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = True
        OptionsView.CellAutoHeight = True
        OptionsView.PaintStyle = psDelphi
        OptionsView.RowHeaderWidth = 118
        OptionsView.ShowEmptyRowImage = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsData.CancelOnExit = False
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 440
        object vgLic1HD: TcxEditorRow
          Height = 30
          Properties.Caption = '1. N'#250'mero de S'#233'rie'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.AutoSelect = False
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = 'cmaskhdf12983929sdkjh89287'
        end
        object vgLic1Codigo: TcxEditorRow
          Height = 30
          Properties.Caption = '2. C'#243'digo da Loja'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.CharCase = ecUpperCase
          Properties.EditProperties.HideSelection = False
          Properties.EditProperties.EditMask = 'aaaa\-9999'
          Properties.EditProperties.ReadOnly = False
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = ''
          Styles.Header = cxStyle11
        end
      end
      object lbInstAlteraLic1: TcxLabel
        Left = 0
        Top = 25
        Align = alTop
        AutoSize = False
        Caption = 
          'Caso voc'#234' ainda n'#227'o o possua ou o tenha perdido, entre em contat' +
          'o com a Cybermgr.com para obt'#234'-lo.'#13#10#13#10'Telefone: (48) 338-1171'#13#10'M' +
          'essenger: suporte@cybermgr.com ou francinybartolo@hotmail.com'
        ParentFont = False
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        ExplicitWidth = 440
        Height = 80
        Width = 487
      end
      object cxLabel7: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        AutoSize = False
        Caption = 'Digite o C'#243'digo da Loja e clique em avan'#231'ar.'#13#10
        ParentFont = False
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        ExplicitWidth = 440
        Height = 25
        Width = 487
      end
    end
    object tsAlteraLic2: TcxTabSheet
      BorderWidth = 10
      Caption = 'Alterando a Licen'#231'a'
      ImageIndex = 9
      ExplicitWidth = 460
      ExplicitHeight = 268
      object vgLic2: TcxVerticalGrid
        Left = 0
        Top = 115
        Width = 487
        Height = 96
        Styles.Background = cxStyle19
        Styles.Content = cxStyle2
        Styles.Selection = cxStyle10
        Align = alTop
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = True
        OptionsView.CellAutoHeight = True
        OptionsView.PaintStyle = psDelphi
        OptionsView.RowHeaderWidth = 144
        OptionsView.ShowEmptyRowImage = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsData.CancelOnExit = False
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 440
        object vgLic2HD: TcxEditorRow
          Height = 30
          Properties.Caption = '1. N'#250'mero de S'#233'rie'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.AutoSelect = False
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = ''
        end
        object vgLic2Codigo: TcxEditorRow
          Height = 30
          Properties.Caption = '2. C'#243'digo da Loja'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.AutoSelect = False
          Properties.EditProperties.CharCase = ecUpperCase
          Properties.EditProperties.HideSelection = False
          Properties.EditProperties.EditMask = 'aaaa\-9999'
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = ''
        end
        object vgLic2Numero: TcxEditorRow
          Height = 30
          Properties.Caption = '3. N'#250'mero da Licen'#231'a'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.EditMask = '9999\-9999\-9999\-9999'
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = ''
          Styles.Header = cxStyle11
        end
      end
      object lbContato: TcxLabel
        Left = 0
        Top = 69
        Align = alTop
        AutoSize = False
        Caption = 
          'Telefone: (48) 338-1171'#13#10'Messenger: suporte@cybermgr.com ou fran' +
          'cinybartolo@hotmail.com'
        ParentFont = False
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        ExplicitWidth = 440
        Height = 46
        Width = 487
      end
      object lbInstrucao: TcxLabel
        Left = 0
        Top = 29
        Align = alTop
        AutoSize = False
        Caption = 
          'Digite o seu n'#250'mero de licen'#231'a e clique em avan'#231'ar. Caso voc'#234' ai' +
          'nda n'#227'o o possua ou o tenha perdido, entre em contato com a Cybe' +
          'rmgr.com para obt'#234'-lo.'
        ParentFont = False
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        ExplicitWidth = 440
        Height = 40
        Width = 487
      end
      object lbCab: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        AutoSize = False
        Caption = 
          'N'#227'o foi poss'#237'vel obter o seu n'#250'mero de licen'#231'a de forma autom'#225'ti' +
          'ca. '
        ParentFont = False
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        ExplicitWidth = 440
        Height = 29
        Width = 487
      end
    end
    object tsAlteraLic3: TcxTabSheet
      BorderWidth = 10
      Caption = 'Alterando a Licen'#231'a'
      ImageIndex = 10
      ExplicitWidth = 460
      ExplicitHeight = 268
      object edSenhaLj: TcxTextEdit
        Left = 0
        Top = 171
        ParentFont = False
        Properties.EchoMode = eemPassword
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Width = 177
      end
      object lbSenha: TcxLabel
        Left = 0
        Top = 153
        Caption = 'Senha da Loja: '
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Transparent = True
      end
      object lbTransf: TcxLabel
        Left = 0
        Top = 113
        Align = alTop
        AutoSize = False
        Caption = 
          'Para concluir a transfer'#234'ncia digite a senha da loja e clique em' +
          ' avan'#231'ar:'
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        ExplicitWidth = 440
        Height = 40
        Width = 487
      end
      object rgOutroHD: TcxRadioGroup
        Left = 0
        Top = 30
        Align = alTop
        Caption = ' O que voc'#234' deseja fazer ? '
        ItemIndex = 0
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = '&1. Usar o Cyber Manager em Modo Demonstra'#231#227'o nessa m'#225'quina'
            Value = True
          end
          item
            Caption = '&2. Transferir minha licen'#231'a de uso para essa m'#225'quina'
          end>
        Properties.WordWrap = True
        Style.BorderStyle = ebs3D
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.LookAndFeel.NativeStyle = True
        Style.Shadow = False
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 3
        ExplicitWidth = 440
        Height = 83
        Width = 487
      end
      object cxLabel9: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        AutoSize = False
        Caption = 'Sua licen'#231'a de uso est'#225' habilitada para outro computador'
        ParentFont = False
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        ExplicitWidth = 440
        Height = 30
        Width = 487
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 299
    Width = 507
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 292
    ExplicitWidth = 460
    object btnVoltar: TcxButton
      Left = 8
      Top = 8
      Width = 89
      Height = 25
      Caption = '<< &Voltar'
      TabOrder = 0
      OnClick = btnVoltarClick
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
    end
    object btnAvancar: TcxButton
      Left = 166
      Top = 8
      Width = 137
      Height = 25
      Caption = '&Avan'#231'ar >>'
      Default = True
      TabOrder = 1
      OnClick = btnAvancarClick
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
    end
    object btnFechar: TcxButton
      Left = 376
      Top = 8
      Width = 73
      Height = 25
      Caption = '&Fechar'
      TabOrder = 2
      OnClick = btnFecharClick
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
    end
  end
  object panErro: TPanel
    Left = 0
    Top = 340
    Width = 507
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    Color = clBlack
    TabOrder = 6
    ExplicitTop = 333
    ExplicitWidth = 460
    object lbErro: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      Caption = 'Mensagem de Erro'
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.WordWrap = True
      Style.Color = clBlack
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      ExplicitWidth = 460
    end
    object lbHost: TcxLabel
      Left = 0
      Top = 17
      Align = alTop
      Caption = 'Host'
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.WordWrap = True
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      ExplicitWidth = 460
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    Style = bmsOffice11
    SunkenBorder = True
    UseSystemFont = True
    Left = 240
    Top = 272
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'Registrar'
      Category = 0
      Hint = 'Registrar'
      Visible = ivAlways
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Caption = 'Fechar'
      Category = 0
      Hint = 'Fechar'
      Visible = ivAlways
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 274
    Top = 276
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clDefault
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clOlive
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clDefault
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713983
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6579300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8559005
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clDefault
    end
  end
  object mwClient: TkbmMWSimpleClient
    Transport = TCPIP
    Left = 176
    Top = 272
  end
  object TCPIP: TkbmMWTCPIPIndyClientTransport
    Active = False
    Port = 3000
    Host = 'joaoborges.dyndns.org'
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    TransportStateOptions = []
    MaxRetries = 0
    MaxRetriesAlternative = 0
    RequestTimeout = 30
    MinClientPort = 0
    MaxClientPort = 0
    ConnectTimeout = 60
    StringConversion = mwscFixed
    Left = 80
    Top = 272
  end
  object CP: TkbmMWClientConnectionPool
    Transport = TCPIP
    Left = 144
    Top = 272
  end
  object mwSession: TkbmMWPooledSession
    ConnectionPool = CP
    AutoSessionName = False
    SessionName = 'Session'
    Left = 208
    Top = 272
  end
  object dsReg: TDataSource
    DataSet = mtReg
    Left = 16
    Top = 272
  end
  object mtReg: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Senha'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CadastroEm'
        DataType = ftDateTime
      end
      item
        Name = 'CadastroPor'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'AtualizadoEm'
        DataType = ftDateTime
      end
      item
        Name = 'AtualizadoPor'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Loja'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'RazaoSocial'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Pais'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Endereco'
        DataType = ftMemo
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SerieHD'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NumMaq'
        DataType = ftWord
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 19
      end
      item
        Name = 'IE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Telefones'
        DataType = ftMemo
      end
      item
        Name = 'EmailReg'
        DataType = ftMemo
      end
      item
        Name = 'FormaPagto'
        DataType = ftMemo
      end
      item
        Name = 'LicMaq'
        DataType = ftWord
      end
      item
        Name = 'LicTipo'
        DataType = ftWord
      end
      item
        Name = 'LicVenc'
        DataType = ftDate
      end
      item
        Name = 'ManInicio'
        DataType = ftDate
      end
      item
        Name = 'ManVenc'
        DataType = ftDate
      end
      item
        Name = 'Proprietarios'
        DataType = ftMemo
      end
      item
        Name = 'Gerente'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TipoLoja'
        DataType = ftWord
      end
      item
        Name = 'EmailTec'
        DataType = ftMemo
      end>
    IndexDefs = <>
    SortOptions = []
    Persistent = True
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
    DefaultFormat = MTBSF
    AllDataFormat = MTBSF
    Left = 48
    Top = 272
    object mtRegCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object mtRegSenha: TStringField
      FieldName = 'Senha'
      Size = 30
    end
    object mtRegCadastroEm: TDateTimeField
      FieldName = 'CadastroEm'
    end
    object mtRegCadastroPor: TStringField
      FieldName = 'CadastroPor'
      Size = 30
    end
    object mtRegAtualizadoEm: TDateTimeField
      FieldName = 'AtualizadoEm'
    end
    object mtRegAtualizadoPor: TStringField
      FieldName = 'AtualizadoPor'
      Size = 30
    end
    object mtRegLoja: TStringField
      FieldName = 'Loja'
      Size = 50
    end
    object mtRegRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 50
    end
    object mtRegPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object mtRegCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object mtRegUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object mtRegEndereco: TMemoField
      FieldName = 'Endereco'
      BlobType = ftMemo
    end
    object mtRegCEP: TStringField
      FieldName = 'CEP'
      Size = 50
    end
    object mtRegBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object mtRegSerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
    object mtRegNumMaq: TWordField
      FieldName = 'NumMaq'
    end
    object mtRegCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 19
    end
    object mtRegIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object mtRegObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object mtRegTelefones: TMemoField
      FieldName = 'Telefones'
      BlobType = ftMemo
    end
    object mtRegEmailReg: TMemoField
      FieldName = 'EmailReg'
      BlobType = ftMemo
    end
    object mtRegFormaPagto: TMemoField
      FieldName = 'FormaPagto'
      BlobType = ftMemo
    end
    object mtRegLicMaq: TWordField
      FieldName = 'LicMaq'
    end
    object mtRegLicTipo: TWordField
      FieldName = 'LicTipo'
    end
    object mtRegLicVenc: TDateField
      FieldName = 'LicVenc'
    end
    object mtRegManInicio: TDateField
      FieldName = 'ManInicio'
    end
    object mtRegManVenc: TDateField
      FieldName = 'ManVenc'
    end
    object mtRegProprietarios: TMemoField
      FieldName = 'Proprietarios'
      BlobType = ftMemo
    end
    object mtRegGerente: TStringField
      FieldName = 'Gerente'
      Size = 50
    end
    object mtRegTipoLoja: TWordField
      FieldName = 'TipoLoja'
    end
    object mtRegEmailTec: TMemoField
      FieldName = 'EmailTec'
      BlobType = ftMemo
    end
  end
  object MTBSF: TkbmBinaryStreamFormat
    Version = '3.00'
    sfUsingIndex = [sfSaveUsingIndex]
    sfData = [sfSaveData, sfLoadData]
    sfCalculated = []
    sfLookup = []
    sfNonVisible = [sfSaveNonVisible, sfLoadNonVisible]
    sfBlobs = [sfSaveBlobs, sfLoadBlobs]
    sfDef = [sfSaveDef, sfLoadDef]
    sfIndexDef = [sfSaveIndexDef, sfLoadIndexDef]
    sfFiltered = [sfSaveFiltered]
    sfIgnoreRange = [sfSaveIgnoreRange]
    sfIgnoreMasterDetail = [sfSaveIgnoreMasterDetail]
    sfDeltas = []
    sfDontFilterDeltas = []
    sfAppend = []
    sfFieldKind = [sfSaveFieldKind]
    sfFromStart = [sfLoadFromStart]
    sfDataTypeHeader = [sfSaveDataTypeHeader, sfLoadDataTypeHeader]
    BufferSize = 16384
    Left = 112
    Top = 272
  end
end
