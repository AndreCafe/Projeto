inherited fbClientes: TfbClientes
  Left = 64
  Top = 153
  Width = 785
  Height = 511
  Caption = 'Clientes'
  OldCreateOrder = True
  OnCreate = FrmBasePaiCreate
  OnDestroy = FrmBasePaiDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 44
    Width = 777
    Height = 440
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 777
      Height = 440
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
      object tvCli: TcxGridDBTableView
        OnDblClick = tvCliDblClick
        DataController.DataSource = DM.dsCli
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.KeyFieldNames = 'Codigo'
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0 itens'
            Kind = skCount
            FieldName = 'Codigo'
            Column = tvCliCodigo
          end
          item
            Format = '0'
            Kind = skSum
            Position = spFooter
            FieldName = 'LicMaq'
            Column = tvCliLicMaq
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0'
            Kind = skCount
            FieldName = 'Codigo'
            Column = tvCliCodigo
          end
          item
            Format = '0'
            Kind = skSum
            FieldName = 'LicMaq'
            Column = tvCliLicMaq
          end
          item
            Format = '0'
            Kind = skSum
            FieldName = 'NumMaq'
            Column = tvCliNumMaq
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Insert.Visible = False
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Edit.Visible = False
        NavigatorButtons.Post.Visible = False
        NavigatorButtons.Cancel.Visible = False
        NavigatorButtons.Refresh.Visible = False
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = tvCliLoja
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.Navigator = True
        OptionsView.Footer = True
        Preview.Column = tvCliTelefones
        Preview.MaxLineCount = 0
        Styles.StyleSheet = FrmPri.GridTableViewStyleSheetDevExpress
        OnColumnPosChanged = tvCliColumnPosChanged
        object tvCliCodigo: TcxGridDBColumn
          Width = 79
          DataBinding.FieldName = 'Codigo'
        end
        object tvCliStatus: TcxGridDBColumn
          Caption = 'Status'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.ListColumns = <>
          Properties.ListFieldIndex = -1
          OnCustomDrawCell = tvCliStatusCustomDrawCell
          Width = 134
          DataBinding.FieldName = 'DescrStatus'
        end
        object tvCliContatarEm: TcxGridDBColumn
          Caption = 'Contatar em'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 94
          DataBinding.FieldName = 'ContatarEm'
        end
        object tvCliLoja: TcxGridDBColumn
          HeaderAlignmentVert = vaCenter
          Width = 201
          DataBinding.FieldName = 'Loja'
        end
        object tvCliLicTipo: TcxGridDBColumn
          Caption = 'Tipo Licen'#231'a'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = 'Tempor'#225'ria'
              Value = 1
            end
            item
              Description = 'Definitiva'
              Value = 2
            end
            item
              Description = 'Teste Gratuito'
              Value = 3
            end
            item
              Description = 'Prospect'
              Value = 4
            end>
          Width = 106
          DataBinding.FieldName = 'LicTipo'
        end
        object tvCliLicVenc: TcxGridDBColumn
          Caption = 'Vencimento'
          Width = 88
          DataBinding.FieldName = 'LicVenc'
        end
        object tvCliLicMaq: TcxGridDBColumn
          Caption = 'Licen'#231'a-Maq.'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 87
          DataBinding.FieldName = 'LicMaq'
        end
        object tvCliTelefones: TcxGridDBColumn
          PropertiesClassName = 'TcxMemoProperties'
          Width = 140
          DataBinding.FieldName = 'Telefones'
        end
        object tvCliDBColumn1: TcxGridDBColumn
          Caption = 'Ultimo Request'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 123
          DataBinding.FieldName = 'UObtemLic'
        end
        object tvCliDBColumn2: TcxGridDBColumn
          Caption = 'Ult.Vers'#227'o'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 89
          DataBinding.FieldName = 'UVersao'
        end
        object tvCliNumMaq: TcxGridDBColumn
          Caption = 'M'#225'quinas'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 93
          DataBinding.FieldName = 'NumMaq'
        end
        object tvCliTipoLoja: TcxGridDBColumn
          Caption = 'Tipo Loja'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Vert = taVCenter
          Properties.Items = <
            item
              Description = 'Cyber Caf'#233
              Value = 0
            end
            item
              Description = 'Lan House'
              Value = 1
            end
            item
              Description = 'Ambos'
              Value = 2
            end>
          Width = 89
          DataBinding.FieldName = 'TipoLoja'
        end
        object tvCliUF: TcxGridDBColumn
          Width = 46
          DataBinding.FieldName = 'UF'
        end
        object tvCliCidade: TcxGridDBColumn
          DataBinding.FieldName = 'Cidade'
        end
        object tvCliSenha: TcxGridDBColumn
          Width = 112
          DataBinding.FieldName = 'Senha'
        end
        object tvCliProprietarios: TcxGridDBColumn
          Width = 94
          DataBinding.FieldName = 'Proprietarios'
        end
        object tvCliCadastroEm: TcxGridDBColumn
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ImmediatePost = True
          Width = 127
          DataBinding.FieldName = 'Data Cadastro'
        end
        object tvCliCadastroPor: TcxGridDBColumn
          Width = 97
          DataBinding.FieldName = 'Cadastro Por'
        end
        object tvCliAtualizadoEm: TcxGridDBColumn
          Caption = 'Atualizado Em'
          DataBinding.FieldName = 'AtualizadoEm'
        end
        object tvCliAtualizadoPor: TcxGridDBColumn
          Caption = 'Atualizado Por'
          DataBinding.FieldName = 'AtualizadoPor'
        end
        object tvCliRazaoSocial: TcxGridDBColumn
          Caption = 'Raz'#227'o Social'
          DataBinding.FieldName = 'RazaoSocial'
        end
        object tvCliPais: TcxGridDBColumn
          Caption = 'Pa'#237's'
          Width = 138
          DataBinding.FieldName = 'Pais'
        end
        object tvCliEndereco: TcxGridDBColumn
          Caption = 'Endere'#231'o'
          Width = 192
          DataBinding.FieldName = 'Endereco'
        end
        object tvCliCEP: TcxGridDBColumn
          Width = 64
          DataBinding.FieldName = 'CEP'
        end
        object tvCliBairro: TcxGridDBColumn
          Width = 122
          DataBinding.FieldName = 'Bairro'
        end
        object tvCliSerieHD: TcxGridDBColumn
          Caption = 'Num. S'#233'rie'
          Width = 169
          DataBinding.FieldName = 'SerieHD'
        end
        object tvCliCNPJ: TcxGridDBColumn
          DataBinding.FieldName = 'CNPJ'
        end
        object tvCliIE: TcxGridDBColumn
          DataBinding.FieldName = 'IE'
        end
        object tvCliObs: TcxGridDBColumn
          Width = 85
          DataBinding.FieldName = 'Obs'
        end
        object tvCliEmailReg: TcxGridDBColumn
          Caption = 'E-mail Registro'
          Width = 109
          DataBinding.FieldName = 'EmailReg'
        end
        object tvCliFormaPagto: TcxGridDBColumn
          Caption = 'Negocia'#231#227'o'
          Width = 126
          DataBinding.FieldName = 'FormaPagto'
        end
        object tvCliManInicio: TcxGridDBColumn
          Width = 85
          DataBinding.FieldName = 'ManInicio'
        end
        object tvCliManVenc: TcxGridDBColumn
          Width = 87
          DataBinding.FieldName = 'ManVenc'
        end
        object tvCliEmailTec: TcxGridDBColumn
          Caption = 'E-mail T'#233'cnico'
          Width = 122
          DataBinding.FieldName = 'EmailTec'
        end
        object tvCliGerente: TcxGridDBColumn
          Width = 179
          DataBinding.FieldName = 'Gerente'
        end
        object tvCliFonteStatus: TcxGridDBColumn
          Visible = False
          MinWidth = 64
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          DataBinding.FieldName = 'FonteStatus'
        end
        object tvCliFundoStatus: TcxGridDBColumn
          Visible = False
          MinWidth = 64
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          DataBinding.FieldName = 'FundoStatus'
        end
      end
      object glCli: TcxGridLevel
        GridView = tvCli
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
            Item = cmNovo
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = cmEditar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = cmApagar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmAtualizar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmMostrarTel
            Visible = True
          end>
        Name = 'BarraTabSheet'
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
    DockControlHeights = (
      0
      0
      44
      0)
    inherited cmNovo: TdxBarLargeButton
      OnClick = cmNovoClick
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      OnClick = cmEditarClick
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      OnClick = cmApagarClick
      ImageIndex = 12
    end
    inherited cmAtualizar: TdxBarLargeButton
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = 46
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object cmMostrarTel: TdxBarButton
      Caption = 'Mostrar Telefones'
      Category = 0
      Hint = 'Mostrar Telefones'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = cmMostrarTelClick
    end
  end
end
