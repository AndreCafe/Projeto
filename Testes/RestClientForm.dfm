object RestForm: TRestForm
  Left = 0
  Top = 0
  Caption = 'Delphi REST Client'
  ClientHeight = 484
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 766
    Height = 484
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'RSS'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 758
        Height = 41
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 11
          Width = 51
          Height = 16
          Caption = 'URL feed'
        end
        object btnUpdate: TButton
          Left = 659
          Top = 7
          Width = 75
          Height = 25
          Caption = 'Get'
          TabOrder = 1
          OnClick = btnUpdateClick
        end
        object cbFeeds: TComboBox
          Left = 86
          Top = 8
          Width = 567
          Height = 24
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 0
          Text = 'http://blogs.embarcadero.com/andreanolanusse/feed'
          Items.Strings = (
            'http://blogs.embarcadero.com/andreanolanusse/feed'
            'http://feeds.delphifeeds.com/delphifeeds')
        end
      end
      object ListBox1: TListBox
        Left = 0
        Top = 41
        Width = 758
        Height = 412
        Align = alClient
        ItemHeight = 16
        TabOrder = 1
      end
    end
    object Google: TTabSheet
      Caption = 'Google'
      ImageIndex = 1
      object LbCities: TListBox
        Left = 0
        Top = 41
        Width = 258
        Height = 412
        Align = alLeft
        ItemHeight = 16
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 258
        Top = 41
        Width = 500
        Height = 412
        Align = alClient
        DataSource = DataSource1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 758
        Height = 41
        Align = alTop
        Caption = 'Panel2'
        ShowCaption = False
        TabOrder = 2
        object btnGeocoding: TButton
          Left = 11
          Top = 10
          Width = 102
          Height = 25
          Caption = 'Start'
          TabOrder = 0
          OnClick = btnGeocodingClick
        end
      end
    end
    object Yahoo: TTabSheet
      Caption = 'Yahoo'
      ImageIndex = 2
      object Image1: TImage
        Left = 258
        Top = 41
        Width = 500
        Height = 412
        Align = alClient
        ExplicitLeft = 325
        ExplicitTop = 169
        ExplicitWidth = 715
        ExplicitHeight = 460
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 758
        Height = 41
        Align = alTop
        Caption = 'Panel2'
        ShowCaption = False
        TabOrder = 0
        object Button1: TButton
          Left = 11
          Top = 10
          Width = 102
          Height = 25
          Caption = 'Get Map'
          TabOrder = 0
          OnClick = Button1Click
        end
      end
      object lbCitiesY: TListBox
        Left = 0
        Top = 41
        Width = 258
        Height = 412
        Align = alLeft
        ItemHeight = 16
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Translator'
      ImageIndex = 3
      object lbLangTo: TListBox
        Left = 544
        Top = 0
        Width = 214
        Height = 453
        Align = alRight
        ItemHeight = 16
        Items.Strings = (
          'pt=Portuguese'
          'en=English'
          'es=Spanish'
          'ar=Arabic'
          'bg=Bulgarian'
          'ca=Catalan'
          'zh-CN=Chinese simpl.'
          'zh-TW=Chinese trad.'
          'hr=Croatian'
          'cs=Czech'
          'da=Danish'
          'nl=Dutch'
          'tl=Filipino'
          'fi=Finnish'
          'fr=French'
          'de=German'
          'el=Greek'
          'iw=Hebrew'
          'hi=Hindi'
          'id=Indonesian'
          'it=Italian'
          'ja=Japanese'
          'ko=Korean'
          'lv=Latvian'
          'lt=Lithuanian'
          'no=Norwegian'
          'pl=Polish'
          'pt=Portuguese'
          'ro=Romanian'
          'ru=Russian'
          'sr=Serbian'
          'sk=Slovak'
          'sl=Slovenian'
          'sv=Swedish'
          'uk=Ukrainian'
          'vi=Vietnamese')
        TabOrder = 0
      end
      object lbLangFrom: TListBox
        Left = 0
        Top = 0
        Width = 185
        Height = 453
        Align = alLeft
        ItemHeight = 16
        Items.Strings = (
          'pt=Portuguese'
          'en=English'
          'es=Spanish'
          'ar=Arabic'
          'bg=Bulgarian'
          'ca=Catalan'
          'zh-CN=Chinese simpl.'
          'zh-TW=Chinese trad.'
          'hr=Croatian'
          'cs=Czech'
          'da=Danish'
          'nl=Dutch'
          'tl=Filipino'
          'fi=Finnish'
          'fr=French'
          'de=German'
          'el=Greek'
          'iw=Hebrew'
          'hi=Hindi'
          'id=Indonesian'
          'it=Italian'
          'ja=Japanese'
          'ko=Korean'
          'lv=Latvian'
          'lt=Lithuanian'
          'no=Norwegian'
          'pl=Polish'
          'pt=Portuguese'
          'ro=Romanian'
          'ru=Russian'
          'sr=Serbian'
          'sk=Slovak'
          'sl=Slovenian'
          'sv=Swedish'
          'uk=Ukrainian'
          'vi=Vietnamese')
        TabOrder = 1
      end
      object Panel4: TPanel
        Left = 185
        Top = 0
        Width = 359
        Height = 453
        Align = alClient
        BevelKind = bkTile
        TabOrder = 2
        DesignSize = (
          355
          449)
        object edSourceText: TEdit
          Left = 6
          Top = 14
          Width = 331
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = 'Welcome to Brazil'
        end
        object btnTraslate: TButton
          Left = 86
          Top = 44
          Width = 177
          Height = 44
          Anchors = [akTop]
          Caption = 'Translate'
          TabOrder = 1
          OnClick = btnTraslateClick
        end
        object Memo1: TMemo
          Left = 6
          Top = 183
          Width = 331
          Height = 130
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
      end
    end
  end
  object XMLDoc: TXMLDocument
    Left = 544
    Top = 416
    DOMVendorDesc = 'MSXML'
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = []
    Left = 488
    Top = 416
  end
  object DataSource1: TDataSource
    DataSet = cdsTown
    Left = 336
    Top = 416
  end
  object cdsTown: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'town'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Latitude'
        DataType = ftFloat
      end
      item
        Name = 'Longitude'
        DataType = ftFloat
      end
      item
        Name = 'Count'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 240
    Top = 424
  end
  object CDSCities: TClientDataSet
    Aggregates = <>
    FileName = 'customer.cds'
    Params = <>
    Left = 192
    Top = 424
  end
end
