object FrmEspecie: TFrmEspecie
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Meio de pagamento'
  ClientHeight = 270
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 19
  object cxLabel2: TcxLabel
    Left = 27
    Top = 86
    AutoSize = False
    Caption = 'Selecione um '#237'cone para representar esse meio de pagamento'
    Style.TextColor = clGray
    Properties.Alignment.Vert = taVCenter
    Properties.WordWrap = True
    Height = 60
    Width = 450
    AnchorY = 116
  end
  object cxLabel1: TcxLabel
    Left = 24
    Top = 136
    Caption = #205'cone'
  end
  object cxLabel4: TcxLabel
    Left = 24
    Top = 56
    Caption = 'Nome'
  end
  object edDBImg: TcxDBImageComboBox
    Left = 83
    Top = 136
    Cursor = crHandPoint
    AutoSize = False
    DataBinding.DataField = 'Img'
    DataBinding.DataSource = dsTab
    Properties.Images = dmImgEsp.imgs48
    Properties.ImmediateDropDownWhenActivated = True
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    Properties.Items = <>
    Properties.LargeImages = dmImgEsp.imgs48
    Properties.ShowDescriptions = False
    Style.BorderStyle = ebsFlat
    Style.StyleController = FrmPri.cxEditStyleController1
    TabOrder = 3
    Height = 60
    Width = 78
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 83
    Top = 55
    HelpType = htKeyword
    DataBinding.DataField = 'Nome'
    DataBinding.DataSource = dsTab
    Style.BorderStyle = ebsFlat
    Style.StyleController = FrmPri.cxEditStyleController1
    TabOrder = 4
    Width = 326
  end
  object cxDBCheckBox1: TcxDBCheckBox
    Left = 62
    Top = 219
    Caption = 'Permite voltar troco'
    DataBinding.DataField = 'PermiteTroco'
    DataBinding.DataSource = dsTab
    TabOrder = 8
    Width = 347
  end
  object BarMgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmImagens.im16
    ImageOptions.LargeImages = dmImagens.im24
    ImageOptions.MakeDisabledImagesFaded = True
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = False
    Left = 376
    Top = 160
    DockControlHeights = (
      0
      0
      36
      0)
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Controles'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 67
      FloatTop = 344
      FloatClientWidth = 69
      FloatClientHeight = 44
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmGravar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Controles'
      OneOnRow = True
      Row = 0
      SizeGrip = False
      UseOwnFont = True
      Visible = True
      WholeRow = True
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Ok'
      Category = 0
      Hint = 'Ok'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmGravarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
  object Tab: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftWord
      end
      item
        Name = 'Tipo'
        DataType = ftWord
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'PermiteTroco'
        DataType = ftBoolean
      end
      item
        Name = 'PermiteVarios'
        DataType = ftBoolean
      end
      item
        Name = 'PermiteCred'
        DataType = ftBoolean
      end
      item
        Name = 'Img'
        DataType = ftWord
      end
      item
        Name = 'RecVer'
        DataType = ftInteger
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
    Left = 216
    Top = 160
    object TabID: TWordField
      FieldName = 'ID'
    end
    object TabTipo: TWordField
      FieldName = 'Tipo'
    end
    object TabNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object TabPermiteTroco: TBooleanField
      FieldName = 'PermiteTroco'
    end
    object TabPermiteVarios: TBooleanField
      FieldName = 'PermiteVarios'
    end
    object TabPermiteCred: TBooleanField
      FieldName = 'PermiteCred'
    end
    object TabImg: TWordField
      FieldName = 'Img'
    end
    object TabRecVer: TIntegerField
      FieldName = 'RecVer'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 248
    Top = 160
  end
end
