inherited fbTarefas: TfbTarefas
  Caption = 'Tarefas'
  ClientHeight = 604
  ClientWidth = 1035
  ExplicitWidth = 1051
  ExplicitHeight = 640
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Width = 1035
    Height = 604
    ExplicitWidth = 727
    ExplicitHeight = 505
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 1035
      Height = 44
      ExplicitWidth = 727
      ExplicitHeight = 44
    end
    object panFiltro: TLMDSimplePanel
      Left = 0
      Top = 44
      Width = 1035
      Height = 42
      UseDockManager = False
      Align = alTop
      Bevel.Mode = bmEdge
      TabOrder = 0
      ExplicitWidth = 727
      object btnFiltro: TPngSpeedButton
        Left = 2
        Top = 2
        Width = 80
        Height = 38
        Align = alLeft
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = '&Filtrar'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnFiltroClick
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F80000002D744558744372656174696F6E2054696D65006A65752E20352064E9
          632E20323030322031323A32313A3130202B30313030603BD286000000077449
          4D45000000000000000973942E000000097048597300000AF000000AF00142AC
          3498000004454944415478DAED546B4C9B65183D6D69E9455B4A8B4087ED0A94
          E188355822E1B21250278680192112652626841FCA626630D31013E5C72461D1
          2CD94CC86604D90F939119244288612C0C46C1D9C555B6768361050AD2D25684
          F2B5F482CFF7A54BC81C2331D91FE39B9C7CED7B39E7B9BCEFE1E1310FDE7F5F
          A0AAAA2A213939D9CCE3F1623D3D3D5334B54588FE1B013E619BFDD1DCDC9CE2
          F3F9F243A190716B6BEB759A2A100804080683D37EBF7FD8ED769F713A9DAEB8
          D8F623052A2A2AC41919195F8AC5E2FA8D8D0D7752525250A5521D904AA57C89
          4482C4C444D01A28030ECBCBCB181919712F2D2D9D9A9E9EEE228E3542645781
          EAEAEA2F6432D9FB2C199503696969080402601806143D280B84C3618E9CCFE7
          73DF582C86A9A9294C4E4E5EA78CDA289B51E2DA24C4FE21505959E9A428754D
          4D4D484F4F472412614BC17D5D2E172852783C1EACAEAE725F5690DDA7D7EB39
          C1D9D9D9A8C562E9A5204E2D2C2CD88933B8B36CBCB2B2328742A138D0D0D0C0
          91984C2650FD31303000AD560BABD50AAFD70B2A1B8442212862D4D5D5A1BEBE
          1E54468EC46EBF8DF6F6CF18614242F74DDBAF67ADD61BF7EEF787979F9FFFAE
          48243AD3D5D5C59F9999C1DCDC1C6C361B5A5A5A909797C71174767662E2DA38
          341A0DBC3E3FA857686D6D05F58B7A24C4777D9711E629108A4471FBFA0F6E8B
          65FC2D87C361A1A31BEC2D52E4E4E41CA3DA7F52545424B4DBED686C6C844EA7
          434A8A1A3E8ABEAF7F14119E04EEE5592C3A6F414B6B35353550C8E59877F9A0
          D96F44417E061602C095311B2EB4BF3338363EF129714FB30202426A7676F651
          AA6B9B52A91473871572A855C998BCE142797929D49A34B8183ECE9F6C817771
          16AF1DA985549C0846928DE2B20208A8BD1E6AF322E1EBF75E760F0C0D7F4CBC
          FDF7DF4102419D9999594F38495757F614452F14CA906AAC84292F19013AB8C4
          0053D72CE83F7B02F224155E2A3743945787FD595AF0A9AD1B61C01788A0F7C3
          C37F0C0D5F39479CDD3B1F1A9B899A1A5B9D9B9BDB515A52A294A518F05CD51B
          90D1130C53847F52DB7E7338F0D547B53F7BBCFEBB2F969B8F18CADF96A4995E
          052F1A05130A23FABB05E7DA9A46EECCDC1B23BE6F1EB40A564449F5AF361A9F
          3DFD7C71A55C5FD30C1145B74D580F5109462FE07CC707DFAEACB8E7295BE650
          E9A113FB5E382A153CA9813CB68289BECF038343C317E93AB3B6F2FDC3BC88B5
          0CA5C160A8359B4B4EEF331F934AD53A44A31188427FE16AF7F1F5C1A11F2F46
          A3D161DA673B78F019B3F6E98CE34A853CCB393F3F73D376EBA7CDCD4DD64606
          08BFEC66769C486161E19B997A7D47AAA1582CA6EB78D73A18BA3C72B5776D6D
          CD49EB970877083282916022A8081E82951527F81FE5A6AC888AEEFE2B4FC864
          879960504826B74EA97B699EADEF244B10374C562489904808C5E739EBD8CBAE
          05F18359045DDC02E6097371929DB6BD936BFB6193BB0D768F982089FF671EF4
          9BBD0E3FD6F1BFC09EE36F7076B7AE4F32B2880000000049454E44AE426082}
        ExplicitTop = -2
      end
      object panFil: TLMDSimplePanel
        Left = 82
        Top = 2
        Width = 951
        Height = 38
        UseDockManager = False
        Align = alClient
        Bevel.BorderSides = [fsLeft]
        Bevel.Mode = bmEdge
        TabOrder = 0
        ExplicitWidth = 643
        object cbMinhasTarefas: TcxCheckBox
          Left = 6
          Top = 9
          Caption = 'Apenas minhas tarefas'
          State = cbsChecked
          TabOrder = 0
          OnClick = cbMinhasTarefasClick
          Width = 140
        end
        object cxLabel1: TcxLabel
          Left = 152
          Top = 10
          Caption = 'Situa'#231#227'o:'
        end
        object rgPendente: TcxRadioButton
          Left = 204
          Top = 11
          Width = 69
          Height = 17
          Caption = 'Pendente'
          Checked = True
          TabOrder = 2
          TabStop = True
          OnClick = btnFiltroClick
        end
        object rgResolvida: TcxRadioButton
          Left = 276
          Top = 11
          Width = 69
          Height = 17
          Caption = 'Resolvida'
          TabOrder = 3
          OnClick = btnFiltroClick
        end
        object rgQualquer: TcxRadioButton
          Left = 348
          Top = 11
          Width = 69
          Height = 17
          Caption = 'Qualquer'
          TabOrder = 4
          OnClick = btnFiltroClick
        end
      end
    end
    object LMDSimplePanel4: TLMDSimplePanel
      Left = 0
      Top = 86
      Width = 1035
      Height = 6
      UseDockManager = False
      Align = alTop
      Bevel.Mode = bmCustom
      TabOrder = 1
      Visible = False
      ExplicitWidth = 727
      object teste: TcxCheckBox
        Left = 88
        Top = -32
        Caption = 'teste'
        TabOrder = 0
        Width = 121
      end
    end
    object Grid: TcxGrid
      Left = 0
      Top = 92
      Width = 1035
      Height = 512
      Align = alClient
      TabOrder = 2
      LookAndFeel.Kind = lfOffice11
      ExplicitWidth = 727
      ExplicitHeight = 413
      object TV: TcxGridDBTableView
        OnDblClick = cmEditarClick
        NavigatorButtons.ConfirmDelete = False
        DataController.DataModeController.GridMode = True
        DataController.DataSource = dsTab
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        Preview.Column = TVTexto
        Preview.Visible = True
        object TVID: TcxGridDBColumn
          Caption = 'N.'
          DataBinding.FieldName = 'ID'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
        end
        object TVLoja: TcxGridDBColumn
          Caption = 'Loja'
          DataBinding.FieldName = 'NomeLoja'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Codigo'
          Properties.ListColumns = <
            item
              FieldName = 'Loja'
            end>
          Width = 145
        end
        object TVRealizarEm: TcxGridDBColumn
          Caption = 'Realizar Em'
          DataBinding.FieldName = 'RealizarEm'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
        end
        object TVDataHora: TcxGridDBColumn
          Caption = 'Lan'#231'ado em'
          DataBinding.FieldName = 'DataHora'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
        end
        object TVPor: TcxGridDBColumn
          DataBinding.FieldName = 'Por'
          Width = 77
        end
        object TVPara: TcxGridDBColumn
          DataBinding.FieldName = 'Para'
          Width = 77
        end
        object TVTexto: TcxGridDBColumn
          DataBinding.FieldName = 'Texto'
          PropertiesClassName = 'TcxMemoProperties'
        end
        object TVPendente: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'Pendente'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.Items = <
            item
              Description = 'Pendente'
              ImageIndex = 0
              Value = True
            end
            item
              Description = 'Resolvido'
              Value = False
            end>
          OnCustomDrawCell = TVPendenteCustomDrawCell
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 96
        end
        object TVResolvidoEm: TcxGridDBColumn
          Caption = 'Resolvido em'
          DataBinding.FieldName = 'ResolvidoEm'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = FrmPri.im32
    Left = 232
    Top = 216
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'cmNovo'
        end
        item
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          Visible = True
          ItemName = 'cmApagar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmAtualizar'
        end>
    end
    inherited cmNovo: TdxBarLargeButton
      OnClick = cmNovoClick
      ShowCaption = True
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      OnClick = cmEditarClick
      ShowCaption = True
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      OnClick = cmApagarClick
      ShowCaption = True
      ImageIndex = 12
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object dxBarCombo1: TdxBarCombo
      Caption = 'Usu'#225'rio'
      Category = 0
      Hint = 'Usu'#225'rio'
      Visible = ivAlways
      ShowCaption = True
      Width = 100
      ItemIndex = -1
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 40
    Top = 201
  end
  inherited CP: TdxComponentPrinter
    Left = 168
    Top = 242
  end
  inherited dlgExp: TSaveDialog
    Left = 40
    Top = 257
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 336
    Top = 250
  end
  inherited pmPeriodo: TdxBarPopupMenu
    Left = 296
    Top = 252
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 72
    Top = 256
  end
  object Tab: TnxTable
    Database = DM.nxDB
    TableName = 'Tarefas'
    IndexName = 'IID'
    Left = 104
    Top = 216
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object TabPor: TStringField
      FieldName = 'Por'
      Size = 10
    end
    object TabPara: TStringField
      FieldName = 'Para'
      Size = 10
    end
    object TabLoja: TIntegerField
      FieldName = 'Loja'
    end
    object TabTexto: TMemoField
      FieldName = 'Texto'
      BlobType = ftMemo
    end
    object TabPendente: TBooleanField
      FieldName = 'Pendente'
    end
    object TabResolvidoEm: TDateTimeField
      FieldName = 'ResolvidoEm'
    end
    object TabRealizarEm: TDateTimeField
      FieldName = 'RealizarEm'
    end
    object TabNomeLoja: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeLoja'
      LookupDataSet = DM.tCli
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Loja'
      KeyFields = 'Loja'
      Size = 50
      Lookup = True
    end
  end
end
