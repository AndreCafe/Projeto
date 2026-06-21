inherited frameEditors: TframeEditors
  ExplicitWidth = 906
  ExplicitHeight = 599
  inherited plTop: TPanel
    ExplicitWidth = 906
  end
  inherited pnlSeparator: TPanel
    Width = 805
    ParentColor = False
    TabOrder = 3
  end
  object pnCustomize: TPanel [2]
    Left = 602
    Top = 25
    Width = 203
    Height = 689
    Align = alRight
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    ExplicitLeft = 248
    ExplicitHeight = 234
    object Bevel3: TBevel
      Left = 8
      Top = 38
      Width = 193
      Height = 371
    end
    object Label114: TLabel
      Left = 16
      Top = 79
      Width = 29
      Height = 13
      Caption = 'Co&lor:'
    end
    object Label115: TLabel
      Left = 16
      Top = 103
      Width = 28
      Height = 13
      Caption = 'St&yle:'
    end
    object edButtonTransparence: TLabel
      Left = 16
      Top = 162
      Width = 28
      Height = 13
      Caption = 'Styl&e:'
    end
    object Label117: TLabel
      Left = 16
      Top = 186
      Width = 70
      Height = 13
      Caption = 'T&ransparence:'
    end
    object Label2: TLabel
      Left = 13
      Top = 55
      Width = 32
      Height = 13
      Caption = 'Border'
    end
    object Bevel4: TBevel
      Left = 64
      Top = 61
      Width = 127
      Height = 3
      Shape = bsTopLine
    end
    object Bevel5: TBevel
      Left = 51
      Top = 144
      Width = 140
      Height = 3
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 13
      Top = 138
      Width = 32
      Height = 13
      Caption = 'Button'
    end
    object Label4: TLabel
      Left = 13
      Top = 221
      Width = 29
      Height = 13
      Caption = 'Edges'
    end
    object Bevel6: TBevel
      Left = 51
      Top = 227
      Width = 140
      Height = 3
      Shape = bsTopLine
    end
    object Label5: TLabel
      Left = 13
      Top = 299
      Width = 28
      Height = 13
      Caption = 'Other'
    end
    object Bevel7: TBevel
      Left = 51
      Top = 305
      Width = 136
      Height = 3
      Shape = bsTopLine
    end
    object Bevel8: TBevel
      Left = 0
      Top = 0
      Width = 3
      Height = 689
      Align = alLeft
      Shape = bsLeftLine
      ExplicitHeight = 529
    end
    object Label19: TLabel
      Left = 21
      Top = 323
      Width = 29
      Height = 13
      Caption = 'Co&lor:'
    end
    object pnlStyleControllerProperties: TPanel
      Left = 5
      Top = 4
      Width = 196
      Height = 29
      BevelOuter = bvNone
      Color = clBtnShadow
      TabOrder = 0
      object lblStyleControllerProperties: TLabel
        Left = 4
        Top = 5
        Width = 159
        Height = 14
        Caption = 'StyleController Properties'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
      end
    end
    object edBorderColor: TcxButtonEdit
      Left = 87
      Top = 75
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ViewStyle = vsHideCursor
      Properties.OnButtonClick = edBorderColorButtonClick
      Style.BorderStyle = ebsFlat
      TabOrder = 1
      OnDblClick = edBorderColorDblClick
      Width = 104
    end
    object edBorderStyle: TcxComboBox
      Left = 87
      Top = 99
      Properties.Items.Strings = (
        'ebsNone'
        'ebsSingle'
        'ebsThick'
        'ebsFlat'
        'ebs3D'
        'ebsUltraFlat')
      Properties.OnChange = edBorderStyleChange
      Style.BorderStyle = ebsFlat
      TabOrder = 2
      Width = 104
    end
    object edButtonViewStyle: TcxComboBox
      Left = 87
      Top = 158
      Properties.Items.Strings = (
        'btsDefault'
        'bts3D'
        'btsFlat'
        'btsSimple'
        'btsHotFlat'
        'btsUltraFlat')
      Properties.OnChange = edButtonViewStyleChange
      Style.BorderStyle = ebsFlat
      TabOrder = 3
      Width = 104
    end
    object ButtonTransparence: TcxComboBox
      Left = 111
      Top = 182
      Properties.Items.Strings = (
        'ebtNone'
        'ebtInactive'
        'ebtAlways'
        'ebtHideInactive'
        'ebtHideUnselected')
      Properties.OnChange = ButtonTransparenceChange
      Style.BorderStyle = ebsFlat
      TabOrder = 4
      Width = 80
    end
    object cbLeft: TcxCheckBox
      Left = 16
      Top = 241
      Caption = 'Left'
      Properties.OnChange = cbLeftChange
      Style.BorderStyle = ebsFlat
      TabOrder = 5
      Transparent = True
      Width = 60
    end
    object cbRight: TcxCheckBox
      Left = 16
      Top = 260
      Caption = 'Right'
      Properties.OnChange = cbRightChange
      Style.BorderStyle = ebsFlat
      TabOrder = 6
      Transparent = True
      Width = 60
    end
    object cbTop: TcxCheckBox
      Left = 84
      Top = 241
      Caption = 'Top'
      Properties.OnChange = cbTopChange
      Style.BorderStyle = ebsFlat
      TabOrder = 7
      Transparent = True
      Width = 60
    end
    object cbBottom: TcxCheckBox
      Left = 84
      Top = 260
      Caption = 'Bottom'
      Properties.OnChange = cbBottomChange
      Style.BorderStyle = ebsFlat
      TabOrder = 8
      Transparent = True
      Width = 69
    end
    object cbHotTrack: TcxCheckBox
      Left = 16
      Top = 351
      Caption = '&HotTrack'
      Properties.OnChange = cbHotTrackChange
      Style.BorderStyle = ebsFlat
      TabOrder = 10
      Transparent = True
      Width = 97
    end
    object cbShadow: TcxCheckBox
      Left = 112
      Top = 350
      Caption = 'Shado&w'
      Properties.OnChange = cbShadowChange
      Style.BorderStyle = ebsFlat
      TabOrder = 11
      Transparent = True
      Width = 81
    end
    object cbNativeStyle: TcxCheckBox
      Left = 16
      Top = 376
      Caption = 'NativeStyle'
      Properties.OnChange = cbNativeStyleChange
      Style.BorderStyle = ebsFlat
      TabOrder = 12
      Transparent = True
      Width = 101
    end
    object edColor: TcxButtonEdit
      Left = 87
      Top = 319
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ViewStyle = vsHideCursor
      Properties.OnButtonClick = edColorButtonClick
      Style.BorderStyle = ebsFlat
      Style.Shadow = False
      Style.ButtonStyle = btsDefault
      TabOrder = 9
      OnDblClick = edColorDblClick
      Width = 100
    end
  end
  object pnForm: TPanel [3]
    Left = 0
    Top = 28
    Width = 537
    Height = 501
    BevelOuter = bvNone
    TabOrder = 4
    object PaintBox: TPaintBox
      Left = 0
      Top = 0
      Width = 537
      Height = 501
      Align = alClient
    end
    object lbFirstName: TLabel
      Left = 8
      Top = 35
      Width = 109
      Height = 13
      Caption = 'First-Nick-Birth &Names:'
      Color = clBtnFace
      FocusControl = edFirstName
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label16: TLabel
      Left = 8
      Top = 62
      Width = 130
      Height = 13
      Caption = '&Birthdate-Country-Gender:'
      Color = clBtnFace
      FocusControl = edBirthDate
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 11
      Top = 290
      Width = 41
      Height = 13
      Caption = '&Caption:'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label12: TLabel
      Left = 11
      Top = 318
      Width = 44
      Height = 13
      Caption = '&Tag Line:'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label13: TLabel
      Left = 11
      Top = 343
      Width = 26
      Height = 13
      Caption = '&Year:'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label14: TLabel
      Left = 165
      Top = 347
      Width = 70
      Height = 13
      Caption = '&Runtime (sec):'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label15: TLabel
      Left = 11
      Top = 377
      Width = 59
      Height = 13
      Caption = '&Plot Outline:'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object edRuntime: TcxDBTextEdit
      Left = 244
      Top = 343
      DataBinding.DataField = 'RUNTIME'
      DataBinding.DataSource = dmMain.dsMovies
      Style.StyleController = StyleController
      TabOrder = 10
      Width = 66
    end
    object edYear: TcxDBTextEdit
      Left = 79
      Top = 344
      DataBinding.DataField = 'YEAR'
      DataBinding.DataSource = dmMain.dsMovies
      Style.StyleController = StyleController
      TabOrder = 9
      Width = 72
    end
    object edTagLine: TcxDBTextEdit
      Left = 79
      Top = 316
      DataBinding.DataField = 'TAGLINE'
      DataBinding.DataSource = dmMain.dsMovies
      Style.StyleController = StyleController
      TabOrder = 8
      Width = 231
    end
    object btnNextFilm: TcxButton
      Left = 428
      Top = 467
      Width = 100
      Height = 23
      Caption = 'Next Film'
      CommandLinkHint = ''
      LookAndFeel.Kind = lfStandard
      TabOrder = 14
      OnClick = btnNextFilmClick
    end
    object btnPrevFilm: TcxButton
      Left = 325
      Top = 467
      Width = 100
      Height = 23
      Caption = 'Previous Film'
      CommandLinkHint = ''
      LookAndFeel.Kind = lfStandard
      TabOrder = 13
      OnClick = btnPrevFilmClick
    end
    object edFilmImage: TcxDBImage
      Left = 325
      Top = 286
      DataBinding.DataField = 'PHOTO'
      DataBinding.DataSource = dmMain.dsMovies
      Properties.GraphicClassName = 'TJPEGImage'
      Properties.Stretch = True
      Style.StyleController = StyleController
      TabOrder = 12
      Height = 173
      Width = 203
    end
    object edFirstName: TcxDBTextEdit
      Left = 166
      Top = 32
      DataBinding.DataField = 'FIRSTNAME'
      DataBinding.DataSource = dmMain.dsMovieStars
      Style.StyleController = StyleController
      TabOrder = 0
      Width = 115
    end
    object edGender: TcxDBImageComboBox
      Left = 408
      Top = 60
      RepositoryItem = dmMain.edrepGenderImageCombo
      DataBinding.DataField = 'GENDER'
      DataBinding.DataSource = dmMain.dsMovieStars
      Properties.Items = <
        item
          Description = 'Unknown'
          ImageIndex = 7
          Value = ''
        end
        item
          Description = 'Male'
          ImageIndex = 8
          Value = 'M'
        end
        item
          Description = 'Female'
          ImageIndex = 9
          Value = 'F'
        end>
      Style.StyleController = StyleController
      TabOrder = 5
      Width = 120
    end
    object edBirthDate: TcxDBDateEdit
      Left = 166
      Top = 60
      DataBinding.DataField = 'DATEOFBIRTH'
      DataBinding.DataSource = dmMain.dsMovieStars
      Style.StyleController = StyleController
      TabOrder = 3
      Width = 115
    end
    object edBiorgaphy: TcxDBMemo
      Left = 8
      Top = 106
      DataBinding.DataField = 'BIOGRAPHY'
      DataBinding.DataSource = dmMain.dsMovieStars
      Style.StyleController = StyleController
      TabOrder = 6
      Height = 153
      Width = 519
    end
    object edBirthName: TcxDBTextEdit
      Left = 408
      Top = 32
      DataBinding.DataField = 'BIRTHNAME'
      DataBinding.DataSource = dmMain.dsMovieStars
      Style.StyleController = StyleController
      TabOrder = 2
      Width = 120
    end
    object edNickName: TcxDBTextEdit
      Left = 287
      Top = 33
      DataBinding.DataField = 'NICKNAME'
      DataBinding.DataSource = dmMain.dsMovieStars
      Style.StyleController = StyleController
      TabOrder = 1
      Width = 120
    end
    object edCountry: TcxDBLookupComboBox
      Left = 284
      Top = 60
      RepositoryItem = dmMain.edrepMovieCountryLookupCombo
      DataBinding.DataField = 'BIRTHCOUNTRY'
      DataBinding.DataSource = dmMain.dsMovieStars
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Name'
        end>
      Properties.ListSource = dmMain.dsMovieContries
      Style.StyleController = StyleController
      TabOrder = 4
      Width = 120
    end
    object edFilmCaption: TcxDBTextEdit
      Left = 79
      Top = 287
      DataBinding.DataField = 'CAPTION'
      DataBinding.DataSource = dmMain.dsMovies
      Style.StyleController = StyleController
      TabOrder = 7
      Width = 231
    end
    object edPlotOutline: TcxDBMemo
      Left = 79
      Top = 374
      DataBinding.DataField = 'PLOTOUTLINE'
      DataBinding.DataSource = dmMain.dsMovies
      Style.StyleController = StyleController
      TabOrder = 11
      Height = 85
      Width = 231
    end
    object lbBiography: TcxLabel
      Left = 3
      Top = 86
      AutoSize = False
      Caption = 'Biography'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.LineOptions.Alignment = cxllaBottom
      Properties.LineOptions.Visible = True
      Transparent = True
      Height = 19
      Width = 524
    end
    object lbDetails: TcxLabel
      Left = 3
      Top = 11
      AutoSize = False
      Caption = 'Person'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.LineOptions.Alignment = cxllaBottom
      Properties.LineOptions.Visible = True
      Transparent = True
      Height = 19
      Width = 524
    end
  end
  inherited pnlDescription: TPanel
    Top = 714
    Width = 805
    inherited lblRight1: TLabel
      Left = 800
      ExplicitLeft = 901
    end
    inherited lblTop1: TLabel
      Width = 805
      ExplicitWidth = 906
    end
    inherited lblBottom1: TLabel
      Width = 805
      ExplicitWidth = 906
    end
    inherited pnlHintInternal: TPanel
      Width = 795
      inherited lblRight2: TLabel
        Left = 790
        ExplicitLeft = 891
      end
      inherited lblTop2: TLabel
        Width = 795
        ExplicitWidth = 896
      end
      inherited lblBottom2: TLabel
        Width = 795
        ExplicitWidth = 896
      end
      inherited lblDescription: TLabel
        Width = 785
        ExplicitWidth = 886
      end
    end
  end
  object lbFilm: TcxLabel [5]
    Left = 3
    Top = 290
    AutoSize = False
    Caption = 'Movie'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Properties.LineOptions.Alignment = cxllaBottom
    Properties.LineOptions.Visible = True
    Transparent = True
    Height = 19
    Width = 524
  end
  inherited dsMainSource: TDataSource
    Left = 112
    Top = 200
  end
  object ColorDialog: TColorDialog
    Options = [cdFullOpen]
    Left = 188
    Top = 144
  end
  object StyleController: TcxEditStyleController
    Style.BorderStyle = ebs3D
    Style.Color = clWindow
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.HotTrack = False
    Style.LookAndFeel.NativeStyle = False
    Style.ButtonStyle = btsDefault
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    Left = 248
    Top = 184
    PixelsPerInch = 96
  end
  object dsPhotos: TDataSource
    Left = 200
    Top = 200
  end
end
