inherited fbCartoes: TfbCartoes
  Left = 32
  Top = 177
  Caption = 'Lista de Cart'#245'es'
  ClientHeight = 570
  ClientWidth = 933
  OldCreateOrder = True
  WindowState = wsMaximized
  OnClose = FrmBasePaiClose
  ExplicitWidth = 941
  ExplicitHeight = 597
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 927
    Height = 564
    ExplicitLeft = 3
    ExplicitTop = 3
    ExplicitWidth = 927
    ExplicitHeight = 564
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 927
      Height = 36
      ExplicitWidth = 927
      ExplicitHeight = 36
    end
    object LMDSimplePanel1: TLMDSimplePanel
      AlignWithMargins = True
      Left = 0
      Top = 41
      Width = 927
      Height = 523
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Bevel.Mode = bmStandard
      Color = clWhite
      TabOrder = 1
      object bdcGrid: TdxBarDockControl
        Left = 1
        Top = 1
        Width = 925
        Height = 22
        Align = dalTop
        BarManager = BarMgr
      end
      object Grid: TcxGrid
        Left = 1
        Top = 57
        Width = 925
        Height = 465
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 1
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        object TV: TcxGridDBTableView
          OnDblClick = cmEditarClick
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Delete.Enabled = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Enabled = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Enabled = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Enabled = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.Visible = True
          DataController.DataModeController.GridMode = True
          DataController.DataModeController.SyncMode = False
          DataController.DataSource = dsTab
          DataController.Filter.MaxValueListCount = 1000
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Filter.Active = True
          DataController.Filter.AutoDataSetFilter = True
          DataController.KeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <
            item
              Links = <>
              SummaryItems.Separator = ', '
              SummaryItems = <
                item
                  Kind = skCount
                end>
            end>
          Filtering.ColumnPopup.MaxDropDownItemCount = 12
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.Header = False
          Preview.AutoHeight = False
          object TVStatus: TcxGridDBColumn
            DataBinding.FieldName = 'Status'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Images = cxImageList1
            Properties.Items = <
              item
                Description = 'N'#227'o expirados'
                ImageIndex = 0
                Value = 0
              end
              item
                Description = 'Expirados'
                ImageIndex = 1
                Value = 1
              end
              item
                Description = 'Inv'#225'lido'
                ImageIndex = 2
                Value = 2
              end>
            Properties.ShowDescriptions = False
            Options.Editing = False
            Options.Focusing = False
            Width = 30
          end
          object TVSenha: TcxGridDBColumn
            DataBinding.FieldName = 'Senha'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 20
            Properties.ReadOnly = True
            Options.Editing = False
            Options.Focusing = False
            Width = 100
          end
          object TVTempoTotal: TcxGridDBColumn
            Caption = 'T. Total'
            DataBinding.FieldName = 'MaxSegundos'
            PropertiesClassName = 'TcxTextEditProperties'
            OnCustomDrawCell = TVTempoTotalCustomDrawCell
            OnGetDisplayText = TVTempoTotalGetDisplayText
            HeaderAlignmentHorz = taCenter
            Options.Focusing = False
            Width = 57
          end
          object TVTempoUsado: TcxGridDBColumn
            Caption = 'T. Usado'
            DataBinding.FieldName = 'Segundos'
            PropertiesClassName = 'TcxTextEditProperties'
            OnCustomDrawCell = TVTempoUsadoCustomDrawCell
            OnGetDisplayText = TVTempoUsadoGetDisplayText
            HeaderAlignmentHorz = taCenter
            Options.Focusing = False
            Width = 110
          end
          object TVNome: TcxGridDBColumn
            DataBinding.FieldName = 'Nome'
            PropertiesClassName = 'TcxTextEditProperties'
            Options.Editing = False
            Options.Focusing = False
          end
          object TVAcessos: TcxGridDBColumn
            Caption = 'N'#186' Acessos'
            DataBinding.FieldName = 'Acessos'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.MaxLength = 0
            Properties.ReadOnly = False
            Visible = False
            HeaderAlignmentHorz = taCenter
            Options.Focusing = False
            VisibleForCustomization = False
            Width = 134
          end
          object TVPrimeiroUso: TcxGridDBColumn
            Caption = 'Primeiro Uso'
            DataBinding.FieldName = 'PrimeiroUso'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.DateButtons = [btnClear, btnToday]
            Properties.DateOnError = deToday
            Visible = False
            HeaderAlignmentHorz = taCenter
            Options.Focusing = False
            VisibleForCustomization = False
            Width = 109
          end
        end
        object GL: TcxGridLevel
          GridView = TV
        end
      end
      object edSenha: TcxTextEdit
        Left = 225
        Top = 202
        Properties.OnChange = edSenhaPropertiesChange
        Style.BorderColor = 15263976
        Style.BorderStyle = ebsSingle
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.Color = 11796479
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.TextStyle = [fsBold]
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Visible = False
        Width = 168
      end
      object dxBarDockControl2: TdxBarDockControl
        AlignWithMargins = True
        Left = 1
        Top = 26
        Width = 925
        Height = 21
        Margins.Left = 0
        Margins.Right = 0
        Margins.Bottom = 10
        Align = dalTop
        BarManager = BarMgr
      end
    end
  end
  inherited BarMgr: TdxBarManager
    ImageOptions.LargeImages = dmImagens.im24
    Top = 200
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmImprimeCartao'
        end>
    end
    object BarMgrBar2: TdxBar [1]
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockControl = bdcGrid
      DockedDockControl = bdcGrid
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 967
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmEditar2'
        end
        item
          Visible = True
          ItemName = 'cmExpirar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmSubMostrar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmLegenda'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object BarMgrBar3: TdxBar [2]
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Custom 2'
      CaptionButtons = <>
      Color = clWhite
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 967
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmEncontrar'
        end
        item
          Visible = True
          ItemName = 'cmContEdBusca'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      LargeImageIndex = 2
      OnClick = cmEditarClick
      ShowCaption = True
      ImageIndex = 13
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmAtualizar: TdxBarLargeButton
      GlyphLayout = glTop
    end
    inherited cmExportar: TdxBarLargeButton
      LargeImageIndex = 47
      GlyphLayout = glTop
    end
    inherited cmImprimir: TdxBarLargeButton
      LargeImageIndex = 7
      GlyphLayout = glTop
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmImprimeCartao: TdxBarLargeButton
      Caption = 'Imprimir novos cart'#245'es'
      Category = 0
      Hint = 'Imprimir novos cart'#245'es'
      Visible = ivAlways
      LargeImageIndex = 21
      OnClick = cmImprimeCartaoClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmEditar2: TdxBarButton
      Caption = 'Editar'
      Category = 0
      Hint = 'Editar'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ImageIndex = 75
      PaintStyle = psCaptionGlyph
      OnClick = cmEditarClick
    end
    object cmExpirar: TdxBarButton
      Caption = 'Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ImageIndex = 66
      PaintStyle = psCaptionGlyph
      OnClick = cmExpirarClick
    end
    object cmSubMostrar: TdxBarSubItem
      Caption = 'Mostrar: N'#227'o Expirados'
      Category = 0
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmMostrar'
        end>
    end
    object cmMostrar: TdxBarListItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      OnClick = cmMostrarClick
      ItemIndex = 0
      Items.Strings = (
        'N'#227'o expirados'
        'Expirados'
        'Todos')
      ShowCheck = True
    end
    object cmContEdBusca: TdxBarControlContainerItem
      Caption = 'edBusca'
      Category = 0
      Hint = 'edBusca'
      Visible = ivAlways
      Control = edSenha
    end
    object cmEncontrar: TdxBarStatic
      Caption = 'Encontrar por senha'
      Category = 0
      Hint = 'Encontrar por senha'
      Style = FrmPri.cxStyle40
      Visible = ivAlways
      Width = 130
    end
    object cmLegenda: TdxBarSubItem
      Caption = 'Legenda'
      Category = 0
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end>
    end
    object dxBarButton1: TdxBarButton
      Caption = 'Cart'#245'es com cr'#233'dito de tempo dispon'#237'vel'
      Category = 0
      Hint = 'Cart'#245'es com cr'#233'dito de tempo dispon'#237'vel'
      Visible = ivAlways
      ImageIndex = 80
    end
    object dxBarButton2: TdxBarButton
      Caption = 'Cart'#245'es expirados'
      Category = 0
      Hint = 'Cart'#245'es expirados'
      Visible = ivAlways
      ImageIndex = 81
    end
    object dxBarButton3: TdxBarButton
      Caption = 'Cart'#245'es inv'#225'lidos (n'#227'o foram vendidos ainda)'
      Category = 0
      Hint = 'Cart'#245'es inv'#225'lidos (n'#227'o foram vendidos ainda)'
      Visible = ivAlways
      ImageIndex = 82
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 24
    Top = 201
  end
  inherited CP: TdxComponentPrinter
    Left = 136
    Top = 250
  end
  inherited dlgExp: TSaveDialog
    Left = 136
    Top = 185
  end
  inherited pmLay: TdxBarPopupMenu
    Top = 130
  end
  inherited pmPeriodo: TdxBarPopupMenu
    Left = 208
    Top = 212
  end
  object Tab: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    OnCalcFields = TabCalcFields
    TableName = 'Passaporte'
    IndexName = 'ICliExpID'
    Left = 24
    Top = 171
    object TabTipoPass: TIntegerField
      FieldName = 'TipoPass'
    end
    object TabCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object TabExpirou: TBooleanField
      FieldName = 'Expirou'
    end
    object TabSenha: TStringField
      FieldName = 'Senha'
    end
    object TabPrimeiroUso: TDateTimeField
      FieldName = 'PrimeiroUso'
    end
    object TabTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object TabTipoExp: TWordField
      FieldName = 'TipoExp'
    end
    object TabExpirarEm: TDateTimeField
      FieldName = 'ExpirarEm'
    end
    object TabMaxSegundos: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'MaxSegundos'
    end
    object TabSegundos: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'Segundos'
    end
    object TabAcessos: TIntegerField
      FieldName = 'Acessos'
    end
    object TabDia1: TIntegerField
      FieldName = 'Dia1'
    end
    object TabDia2: TIntegerField
      FieldName = 'Dia2'
    end
    object TabDia3: TIntegerField
      FieldName = 'Dia3'
    end
    object TabDia4: TIntegerField
      FieldName = 'Dia4'
    end
    object TabDia5: TIntegerField
      FieldName = 'Dia5'
    end
    object TabDia6: TIntegerField
      FieldName = 'Dia6'
    end
    object TabDia7: TIntegerField
      FieldName = 'Dia7'
    end
    object TabDataCompra: TDateTimeField
      FieldName = 'DataCompra'
    end
    object TabValido: TBooleanField
      FieldName = 'Valido'
    end
    object TabValor: TCurrencyField
      FieldName = 'Valor'
    end
    object TabTempoTotal: TTimeField
      FieldKind = fkCalculated
      FieldName = 'TempoTotal'
      Calculated = True
    end
    object TabTempoUsado: TTimeField
      FieldKind = fkCalculated
      FieldName = 'TempoUsado'
      Calculated = True
    end
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabTran: TIntegerField
      FieldName = 'Tran'
    end
    object TabSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object TabStatus: TWordField
      FieldKind = fkCalculated
      FieldName = 'Status'
      Calculated = True
    end
    object TabNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object TabCartao: TBooleanField
      FieldName = 'Cartao'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 56
    Top = 171
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 50
    Left = 102
    Top = 170
  end
  object cxImageList1: TcxImageList
    Height = 24
    Width = 24
    FormatVersion = 1
    DesignInfo = 20971648
    ImageInfo = <
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000100000008000000100000001A0000001C0000
          000F000000040000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000C0000002F0000004F0000006A000000710000
          004B000000220000000A00000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000004031F064B032A088A04570DBB048011DE011E04A10000
          00980000006F0000003C00000018000000060000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001000100160A871CD657C667FF7AD589FFC8F6D4FF33B844FE0264
          0CC5010C02A10000008E0000005E0000002D0000001100000004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000070847117C2FB944FFD9FBE2FFE9FFF4FFDEFFEAFFBDF0C8FF97E7
          A8FF10A320F7033C08AD000301A0000000800000004D000000220000000A0000
          0001000000000000000000000000000000000000000000000000000000000000
          0001010E03260E9A23E885D994FFEFFFF6FFE1FFEBFFD8FDE5FF4FB754FF51B7
          57FFD0FFE1FF60CF72FF04830DE3021F04A300000099000000700000003D0000
          0019000000060000000100000000000000000000000000000000000000000000
          00090B56189031BB49FFFEFFFFFFEAFFF3FFEBFFF6FFE0FFECFFE4FFF2FFB0E6
          BBFF30A535FF81D28DFFBBFBCEFF31B942FE02630AC6010C02A10000008E0000
          005F0000002E0000001100000004000000000000000000000000000000020317
          07350BA125EECAF1D3FFF5FFFAFFDDF9E4FF269928FFEBFFF7FFCCEAD8FF92A9
          9BFFC2E4D1FF82D38DFF2E9F33FFB0F1C1FF8AE8A0FF11A31FF8023C08AE0003
          019F000000800000004D000000220000000A00000001000000000000000B0E6A
          21A767CE7BFFF7FFFBFFFCFFFFFF4CAE4EFF55B258FFAFE4B8FF66BE6CFFDBF9
          E8FF9DB6A7FF9CBAA7FFBBECCCFF50B659FF4CAF53FFC1FFD7FF5BCF6EFF0383
          0DE4022104A300000099000000700000003A000000110000000204210A3E2FBD
          4EFEC4EDCCFFFFFFFFFFD6F2DAFF007E00FFF4FFFEFF108B0FFF8ED296FF47AA
          4CFF7BCC84FFC2E6CFFF93AF9EFFAED5BDFFA6E6B6FF309B34FF7ACC88FFB2FD
          CAFF30B942FE02640AC7010D02A1000000820000003500000008178C31C568D0
          7FFFFFFFFFFF8DCF8FFF008900FF81C984FF9CD7A0FF1B941DFF74C279FF339D
          35FF007000FFC6F8D5FFA8E2B4FFACCDB9FF94B6A1FFB3DEC4FF7FD18CFF2A93
          30FFA7EBBAFF85E398FF16A523F8011603990000004E0000000F107729A8B2E7
          BEFFFFFFFFFFFFFFFFFF73C273FF5FBB62FF008600FFA7DEAEFF007C00FFBCEB
          C5FF62B969FF45A649FF3B9F3FFF58B35EFFDDFFF0FF95B3A0FFCFFFE3FFC3FE
          D7FF90DBA0FFD0FFE6FF50C863FF011A04A00000006B0000001A072E114473D5
          8BFFFFFFFFFFCAEACBFFFEFFFFFFF0FEF5FF76C479FF73C276FF4EAE51FF188F
          19FFC3F1CDFF007300FF007900FF8AD195FF178418FF84CF8FFFD2FFE6FFCAFF
          DEFFC9FFDCFFCBFFDFFF7DDC8FFF04610DC50000006C0000001A06250D3036BB
          56F2C8EFD3FFDEEFDCFF32A233FF9ED5A1FFFFFFFFFFBFE8C4FF008500FF79C5
          7DFF2B992EFF007800FF82C988FF7CC685FF268F29FF78C481FF9BDBA7FFA9E6
          B6FFCDFFDFFFD6FFE8FF56CA68FF0A7716D1000000430000000C000000000418
          091D11812CAA5ECF7BFEFBFFFFFF9AD19AFF35A037FFD5F1DAFFFFFFFFFFD0F3
          D6FF178E18FF078309FFDDFFE9FF007100FF47A54CFFEFFFFDFF006C00FF9AD9
          A5FFD7FFE8FFA8EEB9FF24B337FE021B06770000001E00000002000000000000
          00000000000008371445179E39D694E0A7FFFDFFFFFF59AF5AFF5CB25FFFF2FF
          FAFFF8FFFFFF61B664FF58B05BFF3DA041FFDEFFE9FF73BE7AFF2A8E2DFFE5FF
          F4FFDAFFE8FF5ACB6DFF065F13B70000003A0000000900000000000000000000
          00000000000000000000000501070D5D21782FBA52F3C7F2D3FFD8EFDAFF3299
          33FF97D19CFFFFFFFFFFA7DBADFF329933FF7EC484FF007000FFC6F1D1FFE3FF
          EEFFC0F5CFFF08A01FF50111046A000000190000000100000000000000000000
          0000000000000000000000000000000000000418091E11832CAB5BCE77FEF1FF
          F9FF95CB97FF359735FFD0F0D8FFFFFFFFFF70BC74FF006E00FFD1F6DBFFF2FF
          FBFF2FBB49FF094E14A700000033000000070000000000000000000000000000
          000000000000000000000000000000000000000000000000000009391446189E
          38D78DE1A3FFF7FFFAFF58A758FF5AA95CFFEFFFF6FFD7F5DEFFF2FFFAFF8ADD
          9AFF159B2DEA020D036000000015000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000005
          01070E5C217A2DB94FF3C2F3D0FFCEE6D0FFE5F8E9FFF6FFFBFFE2FBEAFF3AC2
          56FF094415970000002900000005000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000419091E10822AAC55CC72FEE8FCEFFF98E2A8FF71D487FF129A
          32DF000100310000000C00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000008351347159733D20F7426AA0836115D0624
          0C3B000000070000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000010000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000100000008000000100000001A0000001C0000
          000F000000040000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000C0000002F0000004F0000006A000000710000
          004B000000220000000A00000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000406102B4B0815408A0D2987BB1139C6DE040E2BA10000
          00980000006F0000003C00000018000000060000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001000102161C41C7D6678CFFFF89A7FFFFD4E3FFFF4471FDFE0C2C
          91C5020510A10000008E0000005E0000002D0000001100000004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000071124607C4470FFFFE2EDFFFFF4FCFFFFEAF5FEFFC8D7FAFFA8C2
          FFFF2050F1F7081B57AD010104A0000000800000004D000000220000000A0000
          0001000000000000000000000000000000000000000000000000000000000000
          0001030811262353DFE894B0FFFFF6FDFFFFEBF5FFFFE5F0FFFF5471EFFF5772
          ECFFE1F0FEFF7297FFFF0D3BCDE3040E2CA300000099000000700000003D0000
          0019000000060000000100000000000000000000000000000000000000000000
          0009183275904976FFFFFFFFFFFFF3F9FFFFF6FDFFFFECF7FFFFF2FEFFFFBBCC
          F1FF3551E7FF8DA2EFFFCEE5FFFF4271FDFE0A2B93C6020610A10000008E0000
          005F0000002E000000110000000400000000000000000000000000000002070D
          1C352559E7EED3DFFFFFFAFFFFFFE4EDFDFF2842DDFFF7FFFFFFD8E1E7FF9BA2
          A7FFD1DCDFFF8DA1F1FF334ADDFFC1D4F7FFA0BFFFFF1F50F3F8081B59AE0101
          049F000000800000004D000000220000000A00000001000000000000000B213F
          8EA77B9DFFFFFBFDFFFFFFFFFFFF4E66E8FF586FE7FFBECAF6FF6C7FE7FFE8F3
          F3FFA7B0B3FFA7B2B7FFCCDCEBFF596FE3FF5367DBFFD7ECFFFF6E96FFFF0D38
          CEE4040E2DA300000099000000700000003A00000011000000020A142A3E4E7E
          FEFECCDAFFFFFFFFFFFFDAE2FBFF0010DDFFFEFFFFFF0F2BD7FF96A5EEFF4C60
          DEFF8496ECFFCFDCE2FF9EA8AEFFBDCAD2FFB6C8EFFF3447D3FF8899E5FFCAE4
          FFFF4270FDFE0A2B95C7020612A10000008200000035000000083157C0C57FA2
          FFFFFFFFFFFF8FA2F7FF001FE6FF99ABF3FFA9B8F3FF1D38DDFF90A0ECFF354C
          D9FF0001C2FFD5E4FDFFB4C3ECFFB9C4CBFFA1ACB4FFC4D3D9FF8C9FE9FF303E
          C6FFBACCF0FF98B8FFFF2353F3F8030A20990000004E0000000F294BA4A8BED0
          FFFFFFFFFFFFFFFFFFFF7389F3FF627AEFFF001DDEFFB5C3F5FF0010D2FFCEDA
          F9FF7788E5FF495BD7FF3F50D3FF5E70DAFFF0FFFFFFA0ABB1FFE3F7FFFFD7EA
          FEFFA0B1ECFFE6F8FFFF638AFFFF040C28A00000006B0000001A111E3F448BAB
          FFFFFFFFFFFFCBD4FAFFFFFFFFFFF5F9FFFF798DF0FF768AECFF5168E4FF2F47
          DBFFCDDAF8FF0006C4FF0013C2FF95A5E8FF1827C0FF8F9EE7FFE6F7FFFFDEEF
          FFFFDCEFFFFFDFF2FFFF8FAEFFFF0D2C95C50000006C0000001A0D182F305684
          F1F2D3E0FFFFDCE0FAFF3350E9FFA1AFF3FFFFFFFFFFC4CFF8FF001CD9FF7D8F
          EAFF2E44D7FF0010C7FF8899E7FF8593E3FF2938C6FF818FDFFFA7B4E9FFB6C7
          F0FFDFF1FFFFE8F6FFFF688EFFFF163AB3D1000000430000000C000000000910
          1C1D2C52A7AA7BA0FEFEFFFFFFFF9AA8F2FF374FE0FFDAE2FBFFFFFFFFFFD6E0
          FBFF1833D6FF091FCEFFE9F4FFFF0004BDFF4C5CD4FFFDFFFFFF0001ADFFA5B2
          E9FFE8F6FFFFB9D0FFFF3767FDFE060E25770000001E00000002000000000000
          000000000000142443453964D4D6A7C1FFFFFFFFFFFF5A6CE3FF5F70E2FFFAFF
          FFFFFFFFFFFF6476E3FF5B6DDEFF4153D5FFE9F4FFFF7A87DDFF2D3AC2FFF4FF
          FFFFE8F5FFFF6D93FFFF133085B70000003A0000000900000000000000000000
          0000000000000000000001030607213B7578527EF2F3D3E3FFFFDADDF6FF3346
          D4FF9CA7E9FFFFFFFFFFADB9F1FF3347D3FF99A8E9FF0005B7FFD1DBF7FFEEFA
          FFFFCFE0FFFF1F52EFF50409166A000000190000000100000000000000000000
          00000000000000000000000000000000000009101D1E2C51A8AB779DFEFEF9FF
          FFFF97A1E7FF3545CEFFD8DFF7FFFFFFFFFF7483E1FF0000B9FFDBE4FAFFFBFF
          FFFF4977FFFF142B6AA700000033000000070000000000000000000000000000
          0000000000000000000000000000000000000000000000000000142444463863
          D5D7A3BEFFFFFAFEFEFF5863D1FF5C67D0FFF6FCFFFFDEE7FAFFFAFFFFFF9AB7
          FFFF2D5BDCEA0307106000000015000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000103
          0607213A777A4F7DF2F3D0E2FFFFD0D2F0FFE9EEFBFFFBFFFFFFEAF3FFFF5682
          FFFF152958970000002900000005000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000009101D1E2A51A9AC729AFEFEEFF4FFFFA8C1FFFF87A7FFFF325F
          D5DF000002310000000C00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000132245473360D0D22648A1AA11214C5D0C17
          2F3B000000070000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000010000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000100000008000000100000001A0000001C0000
          000F000000040000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000C0000002F0000004F0000006A000000710000
          004B000000220000000A00000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000004001E264B0029378A005471BB007CA5DE001D27A10000
          00980000006F0000003C00000018000000060000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001000102160083AAD645C3E5FF67D3EBFFAFF6FBFF21B4DDFE0060
          80C5000B0FA10000008E0000005E0000002D0000001100000004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000070045587C1AB4E0FFC7FAFDFFD5FFFFFFC6FFFFFFA5E7ECFF7DE6
          F6FF029ECCF7003A4DAD000304A0000000800000004D000000220000000A0000
          0001000000000000000000000000000000000000000000000000000000000000
          0001000D11260096C5E873D7EFFFDEFFFFFFCDFFFFFFC2FDFDFF4696B6FF4596
          B5FFAFFFFFFF47CEE9FF007FAAE3001F29A300000099000000700000003D0000
          0019000000060000000100000000000000000000000000000000000000000000
          000900556F901AB7E5FFF3FFFFFFDAFFFFFFD7FFFFFFC9FFFFFFC8FFFFFF97DF
          E6FF297DA4FF6BBED0FF94FEFFFF1EB5DEFE006082C6000B0FA10000008E0000
          005F0000002E0000001100000004000000000000000000000000000000020016
          1C35009DCDEEBDF0FAFFE9FFFFFFCFF7F9FF236F99FFD5FFFFFFB5EBEAFF82A9
          A9FFA7E7E4FF6DBFD3FF25779EFF8CEAEEFF67E9F7FF039FCDF8003A4EAE0003
          049F000000800000004D000000220000000A00000001000000000000000B0069
          88A752CCEEFFEFFFFFFFF0FFFFFF488AAEFF4E92B2FF9FD8E4FF5AA1BEFFC1FC
          F9FF89B8B6FF85BCBAFF9CECECFF4295B5FF3B8EAEFF95FFFFFF3ECEEAFF0080
          ABE4001F2AA300000099000000700000003A00000011000000020020293E13BC
          EAFEB9EDF9FFFEFFFFFFCDEDF2FF00477EFFE4FFFFFF0E5B8BFF80C0D2FF4089
          AAFF6BB5CCFFA6E8E6FF7FB1AFFF90D8D5FF84E0E6FF26749BFF5EBACBFF87FF
          FFFF1CB4DDFE006182C7000D11A10000008200000035000000080089B0C552CE
          F0FFFFFFFFFF8AB8CFFF005389FF7BB3C9FF92C6D7FF186694FF69AAC2FF2C75
          9DFF003870FFACF6F8FF8DD9E2FF91D0CDFF7DB7B6FF91E1DEFF65BED1FF216A
          91FF80E3E9FF62E3F3FF089FCCF800151C990000004E0000000F007598A8A7E6
          F8FFFFFFFFFFFBFFFFFF6FA7C2FF5B9BBBFF005186FF9CD1DEFF00457CFFAAE5
          EBFF579DB9FF3D82A6FF337A9FFF4A95B3FFB7FFFFFF7FB5B3FFA7FFFFFF9BFF
          FEFF73CEDBFFA3FFFFFF37C4E4FF001821A00000006B0000001A002E3A445BD2
          F3FFFFFFFFFFC9E0EAFFF7FFFFFFE8FEFEFF70AAC4FF6CA8C2FF488DAEFF1662
          8FFFAFEBF1FF003D73FF004679FF78C0D1FF145684FF6EBCCFFFAEFFFFFFA6FF
          FFFFA3FFFFFFA5FFFFFF5FDAEEFF005D7CC50000006C0000001A00242F3015B8
          E5F2BFEFFBFFE0E5EBFF3379A1FF99C4D5FFFFFFFFFFB5DEE8FF005185FF6FAC
          C5FF277099FF004478FF72B5C9FF6DB0C6FF21658FFF67AFC4FF82CEDBFF8DDE
          E6FFABFFFFFFB1FFFFFF3DC7E6FF007298D1000000430000000C000000000017
          1C1D0081A7AA43CFF5FEF6FFFFFF99BCCEFF34789FFFCBECF1FFF7FFFFFFC2ED
          F3FF15618EFF075283FFC8FFFFFF003971FF3F83A5FFCFFFFFFF00366CFF83CB
          D9FFB7FFFFFF8BECF7FF0FAEDDFE001A22770000001E00000002000000000000
          00000000000000374345009CC9D67EE1F9FFFAFFFFFF578DAEFF5892B1FFE5FF
          FFFFE7FFFFFF5998B6FF4F90B0FF377BA0FFC6FFFFFF66A6BEFF25658EFFC8FF
          FFFFBEFFFFFF42C9E9FF005B79B70000003A0000000900000000000000000000
          0000000000000000000000050607005C75780FB8E5F3B9F6FFFFD3E6EBFF306F
          98FF8EBED1FFF2FFFFFF9BCFDBFF2E7199FF72AFC4FF003A70FFB1ECF1FFCAFF
          FFFFA8F4FBFF009DD0F50011166A000000190000000100000000000000000000
          00000000000000000000000000000000000000181D1E0081A7AB3CCEF4FEE6FF
          FFFF91B6C9FF326E96FFC3EBF0FFEFFFFFFF68A2BCFF00366EFFBFF2F6FFDDFF
          FFFF17B7E5FF004C62A700000033000000070000000000000000000000000000
          000000000000000000000000000000000000000000000000000000374446009C
          C6D776E0FAFFEFFFFFFF5585A5FF5589A9FFE0FFFFFFC8F2F5FFE1FFFFFF74DB
          F2FF0097C3EA000C106000000015000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000005
          0607005B757A0CB8E6F3B2F5FFFFC7DDE3FFDAF5F7FFEAFFFFFFD3FCFEFF20BE
          EAFF004256970000002900000005000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000181D1E0080A8AC38CBF2FEDFFDFEFF84DFF5FF5AD2F1FF0097
          C7DF000101310000000C00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000003544470094C1D2007395AA0035455D0023
          2D3B000000070000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000010000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
end
