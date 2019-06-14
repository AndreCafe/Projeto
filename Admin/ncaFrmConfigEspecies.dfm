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
        4D410000B18F0BFC6105000000206348524D00007A26000080840000FA000000
        80E8000075300000EA6000003A98000017709CBA513C00000009704859730000
        0EB100000EB1019C8C1FDA0000019549444154684363FCFFFF3FC39006200F0C
        653CA41D0F4E3D4339F4473D3018620F2309D9556C0E01E2AB40FC1B88FF0F12
        FC0FE88E2740DC08C4CCC80187E201A0A42310FF1D248EC61578CDF83CB06A90
        3B1EE4A957F83C3058920C2177B0C13C819E8408691C2CF2ECA31E18E0BC321A
        03039D17466360C4C7C0364ADA51C0028471208B515D4A1C8FAE97DE151938E4
        8121A80BC45F28288A410D4D778CFE00050612952760A1472D7B06DC03AEB55B
        FF2F3F78E7FFD93BAFFF4FDD7AF5BF3D89CDF701F7C0BAE3F7816E4080DEF597
        888A49580C0EB8071EBEFA8CE28103979F0D2D0FECBBF414C5037377DD185A1E
        0868D9F5FFF88D97FFDF7EFAF17FDB9947FF5D6AB60E2D0F505A1AD13D0F001D
        8C5C0F50326800EAE4870E840740496448D7C4B0344E515B683874EA47FB0324
        157794963658F48FC6C0680C5098AC4693D0A04D42EB298C5A7A78EC3DBE8ACC
        7F087860324E0F403BDCD9404FBC19841EF90174D32C20E6C0EB01A82798800A
        458158721061566CC331A3D3ACD41CA422C7ACD1182027D4A8A9673406A8199A
        E498050055EFE086B7574D1D0000000049454E44AE426082}
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
