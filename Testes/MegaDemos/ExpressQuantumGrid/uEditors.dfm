inherited frameEditors: TframeEditors
  Width = 961
  Height = 584
  inherited plTop: TPanel
    Width = 961
  end
  inherited pnlSeparator: TPanel
    Width = 961
    ParentColor = False
    TabOrder = 3
  end
  object pnCustomize: TPanel [2]
    Left = 758
    Top = 57
    Width = 203
    Height = 482
    Align = alRight
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object Bevel3: TBevel
      Left = 8
      Top = 38
      Width = 193
      Height = 371
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
    object Bevel6: TBevel
      Left = 51
      Top = 227
      Width = 140
      Height = 3
      Shape = bsTopLine
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
      Height = 482
      Align = alLeft
      Shape = bsLeftLine
    end
    object Label114: TcxLabel
      Left = 16
      Top = 79
      Caption = 'Co&lor:'
    end
    object Label115: TcxLabel
      Left = 16
      Top = 103
      Caption = 'St&yle:'
    end
    object edButtonTransparence: TcxLabel
      Left = 16
      Top = 162
      Caption = 'Styl&e:'
    end
    object Label117: TcxLabel
      Left = 16
      Top = 186
      Caption = 'T&ransparence:'
    end
    object Label2: TcxLabel
      Left = 13
      Top = 55
      Caption = 'Border'
    end
    object Label3: TcxLabel
      Left = 13
      Top = 138
      Caption = 'Button'
    end
    object Label4: TcxLabel
      Left = 13
      Top = 221
      Caption = 'Edges'
    end
    object Label5: TcxLabel
      Left = 13
      Top = 299
      Caption = 'Other'
    end
    object Label19: TcxLabel
      Left = 21
      Top = 323
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
      object lblStyleControllerProperties: TcxLabel
        Left = 4
        Top = 5
        Caption = 'StyleController Properties'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold, fsItalic]
        Style.IsFontAssigned = True
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
  inherited pnlDescription: TPanel
    Top = 539
    Width = 961
    inherited lblRight1: TcxLabel
      Left = 956
    end
    inherited lblTop1: TcxLabel
      Width = 961
    end
    inherited lblBottom1: TcxLabel
      Width = 961
    end
    inherited pnlHintInternal: TPanel
      Width = 951
      inherited lblRight2: TcxLabel
        Left = 946
      end
      inherited lblTop2: TcxLabel
        Width = 951
      end
      inherited lblBottom2: TcxLabel
        Width = 951
      end
      inherited lblDescription: TcxLabel
        Width = 941
      end
    end
  end
  object pnForm: TPanel [4]
    Left = 2
    Top = 58
    Width = 537
    Height = 497
    BevelOuter = bvNone
    TabOrder = 4
    object PaintBox: TPaintBox
      Left = 0
      Top = 0
      Width = 537
      Height = 497
      Align = alClient
    end
    object bvlDetails: TBevel
      Left = 55
      Top = 18
      Width = 478
      Height = 4
      Shape = bsTopLine
    end
    object bvlBiography: TBevel
      Left = 115
      Top = 93
      Width = 412
      Height = 4
      Shape = bsTopLine
    end
    object bvlActs: TBevel
      Left = 150
      Top = 274
      Width = 377
      Height = 4
      Shape = bsTopLine
    end
    object lbFirstName: TcxLabel
      Left = 8
      Top = 35
      Caption = 'First-Nick-Birth &Names:'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Transparent = True
    end
    object lbDetails: TcxLabel
      Left = 3
      Top = 11
      Caption = 'Details'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object lbBiography: TcxLabel
      Left = 3
      Top = 86
      Caption = 'Biography-Photos'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object Label16: TcxLabel
      Left = 8
      Top = 62
      Caption = '&Birthdate-Country-Gender:'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Transparent = True
    end
    object lbFilm: TcxLabel
      Left = 3
      Top = 267
      Caption = '&Act in a film (Read-Only)'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object Label9: TcxLabel
      Left = 11
      Top = 290
      Caption = '&Caption:'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Transparent = True
    end
    object Label12: TcxLabel
      Left = 11
      Top = 318
      Caption = '&Tag Line:'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Transparent = True
    end
    object Label13: TcxLabel
      Left = 11
      Top = 343
      Caption = '&Year:'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Transparent = True
    end
    object Label14: TcxLabel
      Left = 165
      Top = 347
      Caption = '&Runtime (min):'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Transparent = True
    end
    object Label15: TcxLabel
      Left = 11
      Top = 377
      Caption = '&Plot Outline:'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Transparent = True
    end
    object Label18: TcxLabel
      Left = 8
      Top = 442
      Caption = 'Person Line:'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Transparent = True
    end
    object Label20: TcxLabel
      Left = 8
      Top = 472
      Caption = 'Person Description:'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Transparent = True
    end
    object edRuntime: TcxDBTextEdit
      Left = 244
      Top = 343
      DataBinding.DataField = 'Runtime'
      DataBinding.DataSource = dmMain.dsMovies
      Style.StyleController = StyleController
      TabOrder = 12
      Width = 66
    end
    object edYear: TcxDBTextEdit
      Left = 79
      Top = 344
      DataBinding.DataField = 'Year'
      DataBinding.DataSource = dmMain.dsMovies
      Style.StyleController = StyleController
      TabOrder = 11
      Width = 72
    end
    object edTagLine: TcxDBTextEdit
      Left = 79
      Top = 316
      DataBinding.DataField = 'TagLine'
      DataBinding.DataSource = dmMain.dsMovies
      Style.StyleController = StyleController
      TabOrder = 10
      Width = 231
    end
    object btnNextFilm: TcxButton
      Left = 428
      Top = 467
      Width = 100
      Height = 23
      Caption = 'Next Film'
      TabOrder = 19
      OnClick = btnNextFilmClick
      LookAndFeel.Kind = lfStandard
    end
    object btnPrevFilm: TcxButton
      Left = 325
      Top = 467
      Width = 100
      Height = 23
      Caption = 'Previous Film'
      TabOrder = 17
      OnClick = btnPrevFilmClick
      LookAndFeel.Kind = lfStandard
    end
    object edFilmImage: TcxDBImage
      Left = 325
      Top = 286
      DataBinding.DataField = 'Photo'
      DataBinding.DataSource = dmMain.dsMovieStarsPhotos
      Properties.GraphicClassName = 'TJPEGImage'
      Properties.Stretch = True
      Style.StyleController = StyleController
      TabOrder = 16
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
      Width = 304
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
      Left = 284
      Top = 32
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
      Properties.ListColumns = <>
      Style.StyleController = StyleController
      TabOrder = 4
      Width = 120
    end
    object edPhoto: TcxDBImage
      Left = 325
      Top = 106
      DataBinding.DataField = 'Photo'
      DataBinding.DataSource = dmMain.dsMovieStarsPhotos
      Properties.GraphicClassName = 'TJPEGImage'
      Properties.Stretch = True
      Style.StyleController = StyleController
      TabOrder = 18
      Height = 122
      Width = 203
    end
    object btnPrevPhoto: TcxButton
      Left = 325
      Top = 236
      Width = 100
      Height = 23
      Caption = 'Previous Photo'
      TabOrder = 7
      OnClick = btnPrevPhotoClick
      LookAndFeel.Kind = lfStandard
    end
    object btnNextPhoto: TcxButton
      Left = 428
      Top = 236
      Width = 100
      Height = 23
      Caption = 'Next Photo'
      TabOrder = 8
      OnClick = btnNextPhotoClick
      LookAndFeel.Kind = lfStandard
    end
    object edFilmCaption: TcxDBTextEdit
      Left = 79
      Top = 287
      DataBinding.DataField = 'Caption'
      DataBinding.DataSource = dmMain.dsMovies
      Style.StyleController = StyleController
      TabOrder = 9
      Width = 231
    end
    object edPersonDescription: TcxDBTextEdit
      Left = 128
      Top = 469
      DataBinding.DataField = 'Description'
      DataBinding.DataSource = dmMain.dsProjects
      Style.StyleController = StyleController
      TabOrder = 15
      Width = 184
    end
    object edPersonLine: TcxDBLookupComboBox
      Left = 79
      Top = 439
      RepositoryItem = dmMain.edrepMoviePersonsLineLookupCombo
      DataBinding.DataField = 'PersonLineID'
      DataBinding.DataSource = dmMain.dsMovies
      Properties.ListColumns = <>
      Style.StyleController = StyleController
      TabOrder = 14
      Width = 232
    end
    object edPlotOutline: TcxDBMemo
      Left = 79
      Top = 374
      DataBinding.DataField = 'PlotOutline'
      DataBinding.DataSource = dmMain.dsMovies
      Style.StyleController = StyleController
      TabOrder = 13
      Height = 59
      Width = 231
    end
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
end
