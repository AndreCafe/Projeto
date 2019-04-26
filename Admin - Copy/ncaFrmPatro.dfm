object FrmPatro: TFrmPatro
  Left = 291
  Top = 231
  ActiveControl = edNome
  BorderStyle = bsDialog
  Caption = 'Patrocinador'
  ClientHeight = 319
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 44
    Width = 411
    Height = 275
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 10
    TabOrder = 4
    ExplicitTop = 32
    ExplicitHeight = 287
    object cxLabel1: TcxLabel
      Left = 16
      Top = 16
      Caption = 'Nome'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object gbTexto: TcxGroupBox
      Left = 10
      Top = 111
      Align = alBottom
      Caption = ' Sites Permitidos Acessar Gratuitamente '
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      ExplicitTop = 123
      Height = 154
      Width = 391
      object edDominiosPerm: TcxDBMemo
        Left = 11
        Top = 23
        DataBinding.DataField = 'DominiosPerm'
        DataBinding.DataSource = dsTab
        Style.BorderStyle = ebsFlat
        TabOrder = 0
        Height = 118
        Width = 367
      end
    end
    object edNome: TcxDBTextEdit
      Left = 104
      Top = 15
      DataBinding.DataField = 'Nome'
      DataBinding.DataSource = dsTab
      Style.BorderStyle = ebsFlat
      TabOrder = 2
      Width = 243
    end
    object cxLabel2: TcxLabel
      Left = 16
      Top = 41
      Caption = 'URL Principal'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object cxLabel3: TcxLabel
      Left = 16
      Top = 67
      Caption = 'URL Secund'#225'ria'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object edURL1: TcxTextEdit
      Left = 104
      Top = 40
      Style.BorderStyle = ebsFlat
      TabOrder = 5
      Text = 'edURL1'
      Width = 284
    end
    object edURL2: TcxTextEdit
      Left = 105
      Top = 67
      Style.BorderStyle = ebsFlat
      TabOrder = 6
      Text = 'edURL2'
      Width = 284
    end
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
    ImageOptions.LargeImages = dmImagens.im32
    ImageOptions.MakeDisabledImagesFaded = True
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 192
    Top = 8
    DockControlHeights = (
      0
      0
      44
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
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      LargeImageIndex = 41
      OnClick = cmGravarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 49
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmAvisoSonoro: TdxBarLargeButton
      Caption = 'Selecionar um arquivo de som para esse aviso'
      Category = 0
      Hint = 'Selecionar um arquivo de som para esse aviso'
      Visible = ivAlways
      LargeImageIndex = 51
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmOuvir: TdxBarButton
      Caption = '&Ouvir'
      Category = 0
      Hint = 'Ouvir'
      Visible = ivAlways
    end
    object cmSelecionarSom: TdxBarButton
      Caption = 'Selecionar Arquivo Som'
      Category = 0
      Hint = 'Selecionar Arquivo Som'
      Visible = ivAlways
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
        Name = 'Nome'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'URLArea1'
        DataType = ftMemo
      end
      item
        Name = 'URLArea2'
        DataType = ftMemo
      end
      item
        Name = 'DominiosPerm'
        DataType = ftMemo
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
    Left = 224
    Top = 8
    object TabNome: TStringField
      FieldName = 'Nome'
    end
    object TabURLArea1: TMemoField
      FieldName = 'URLArea1'
      BlobType = ftMemo
    end
    object TabURLArea2: TMemoField
      FieldName = 'URLArea2'
      BlobType = ftMemo
    end
    object TabDominiosPerm: TMemoField
      FieldName = 'DominiosPerm'
      BlobType = ftMemo
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 224
    Top = 40
  end
  object pmAvisoSom: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <
      item
        Visible = True
        ItemName = 'cmSelecionarSom'
      end
      item
        Visible = True
        ItemName = 'cmOuvir'
      end>
    UseOwnFont = False
    Left = 192
    Top = 40
  end
end
