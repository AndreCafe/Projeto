inherited FrmConfigEspecies: TFrmConfigEspecies
  Caption = 'Meios de pagamento'
  ClientHeight = 418
  ClientWidth = 742
  Font.Height = -16
  OnDestroy = FormDestroy
  ExplicitWidth = 748
  ExplicitHeight = 443
  PixelsPerInch = 96
  TextHeight = 19
  inherited panPri: TLMDSimplePanel
    Width = 722
    Height = 346
    AutoSize = False
    ExplicitWidth = 722
    ExplicitHeight = 346
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 48
      Height = 48
      AutoSize = True
      Center = True
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000030
        0000003008060000005702F987000000017352474200AECE1CE9000000046741
        4D410000B18F0BFC6105000000097048597300000EBC00000EBC0195BC724900
        000196494441546843EDD8BD4A03411007F0A8A879010B1F22AFA0084A4A2DF4
        297C010B2D445B2BB111AC050B53C8A548215AA5D126124811104505A322A845
        40749C15EE98DB1D0EC31D991DD9851FC94DF663FE69EE921200A8C61635618B
        9AB0454DD8A2266C5113A730B376B28CDAE8138127BED11DDA4463B45FBBF939
        F485B84D7CB1457BB6031C59937DD4A33DDB01B8053E9AD01E60320410160248
        0B01A48907A8D3730785EB47E2F7F607DC6145ABD033F34A5D308715EDF79BC7
        D70AFA20F5419907CDEAD003147D8ED94B34C0C2460487E75DB8EC3EC15ED486
        5932F72FCC5EA2018E9BD7A6968C9D5ACB599305876C809BDEBBA925E3ECEAC1
        599305876C80D3D6BDA925E3A0D171D664C1211B6069BB01CDCE23BCBCF5A17E
        710BF3EB91B3268BD94B34405E66AFA10640F43E90E74F03F3237F452280A1FA
        4E1CCBF52C44A52E98837C151EA7A58500D2420069FF3740CD9AE8A357DAB31D
        60D19AECA35DDA732A80811356D13359E08B3EDA4765DA6FAAF9184E1A455368
        DA23E35CAF4E411BB6A8095BD4842D6AC21635618B7A40E90716036D07A6B170
        C70000000049454E44AE426082}
    end
    object Grid: TcxGrid
      AlignWithMargins = True
      Left = 64
      Top = 28
      Width = 655
      Height = 318
      Margins.Left = 64
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      BorderStyle = cxcbsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object TV: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.DataRowHeight = 52
        OptionsView.GridLineColor = clSilver
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 1
        object TVImg: TcxGridColumn
          Caption = #205'cone'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Images = dmImgEsp.imgs48
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <>
          Properties.LargeImages = dmImgEsp.imgs48
          Properties.ShowDescriptions = False
          OnGetPropertiesForEdit = TVImgGetPropertiesForEdit
          HeaderAlignmentHorz = taCenter
          Styles.Header = cxStyle1
          Width = 74
        end
        object TVNome: TcxGridColumn
          Caption = 'Nome'
          PropertiesClassName = 'TcxTextEditProperties'
          Styles.Header = cxStyle1
          Width = 186
        end
        object TVTroco: TcxGridColumn
          Caption = 'Pode voltar troco?'
          DataBinding.ValueType = 'Boolean'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          HeaderAlignmentHorz = taCenter
          Styles.Header = cxStyle1
          Width = 133
        end
        object TVCred: TcxGridColumn
          Caption = 'Pode deixar troco como cr'#233'dito em conta?'
          DataBinding.ValueType = 'Boolean'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          HeaderAlignmentHorz = taCenter
          Styles.Header = cxStyle1
          Width = 239
        end
        object TVObj: TcxGridColumn
          Visible = False
          VisibleForCustomization = False
        end
      end
      object gl: TcxGridLevel
        GridView = TV
      end
    end
    object LMDSimplePanel2: TLMDSimplePanel
      AlignWithMargins = True
      Left = 64
      Top = 0
      Width = 658
      Height = 28
      Margins.Left = 64
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Bevel.Mode = bmCustom
      ParentColor = True
      TabOrder = 1
      object lbApagar: TcxLabel
        AlignWithMargins = True
        Left = 240
        Top = 0
        Cursor = crHandPoint
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Apagar'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.HotTrack = True
        Style.TextColor = clBlue
        Style.TextStyle = []
        Style.IsFontAssigned = True
        StyleHot.BorderStyle = ebsNone
        StyleHot.TextColor = clBlue
        StyleHot.TextStyle = [fsUnderline]
        Properties.Alignment.Vert = taVCenter
        OnClick = lbApagarClick
        AnchorY = 14
      end
      object lbNovo: TcxLabel
        AlignWithMargins = True
        Left = 189
        Top = 0
        Cursor = crHandPoint
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Novo'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.HotTrack = True
        Style.TextColor = clBlue
        Style.TextStyle = []
        Style.IsFontAssigned = True
        StyleHot.BorderStyle = ebsNone
        StyleHot.TextColor = clBlue
        StyleHot.TextStyle = [fsUnderline]
        Properties.Alignment.Vert = taVCenter
        OnClick = lbNovoClick
        AnchorY = 14
      end
      object lbMeios: TcxLabel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Meios de pagamento:'
        Style.TextStyle = [fsBold]
        Properties.Alignment.Vert = taVCenter
        AnchorY = 14
      end
    end
  end
  inherited LMDSimplePanel1: TLMDSimplePanel
    Top = 376
    Width = 722
    ExplicitTop = 376
    ExplicitWidth = 722
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
end
