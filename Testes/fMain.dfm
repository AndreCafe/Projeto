object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'GoogleMaps in Delphi'
  ClientHeight = 411
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    605
    411)
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 8
    Top = 8
    Width = 458
    Height = 378
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 8
    ExplicitWidth = 610
    ExplicitHeight = 422
    ControlData = {
      4C000000562F0000112700000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object btnAddMarker: TButton
    Left = 472
    Top = 232
    Width = 125
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Add Marker'
    TabOrder = 6
    OnClick = btnAddMarkerClick
    ExplicitLeft = 624
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 392
    Width = 605
    Height = 19
    Panels = <>
    SimplePanel = True
    ExplicitLeft = -192
    ExplicitTop = 340
    ExplicitWidth = 801
  end
  object btnGeocode: TButton
    Left = 472
    Top = 55
    Width = 125
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Geocode'
    TabOrder = 1
    OnClick = btnGeocodeClick
    ExplicitLeft = 624
  end
  object leLat: TLabeledEdit
    Left = 472
    Top = 144
    Width = 125
    Height = 21
    Anchors = [akTop, akRight]
    EditLabel.Width = 39
    EditLabel.Height = 13
    EditLabel.Caption = 'Latitude'
    TabOrder = 4
    Text = '37.05173494'
    ExplicitLeft = 624
  end
  object leLng: TLabeledEdit
    Left = 472
    Top = 184
    Width = 125
    Height = 21
    Anchors = [akTop, akRight]
    EditLabel.Width = 47
    EditLabel.Height = 13
    EditLabel.Caption = 'Longitude'
    TabOrder = 5
    Text = '-122.03160858'
    ExplicitLeft = 624
  end
  object mmGeocode: TMemo
    Left = 472
    Top = 8
    Width = 126
    Height = 41
    Anchors = [akTop, akRight]
    Lines.Strings = (
      'Rego Park, NY')
    TabOrder = 0
    ExplicitLeft = 624
  end
  object btnCenterMap: TButton
    Left = 472
    Top = 263
    Width = 125
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Center map on'
    TabOrder = 7
    OnClick = btnCenterMapClick
    ExplicitLeft = 624
  end
  object rbAPI: TRadioButton
    Left = 472
    Top = 88
    Width = 33
    Height = 17
    Hint = 'The "correct" way to do it'
    Anchors = [akTop, akRight]
    Caption = 'API'
    Checked = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TabStop = True
    ExplicitLeft = 624
  end
  object rbCheat: TRadioButton
    Left = 528
    Top = 88
    Width = 49
    Height = 17
    Hint = 'Seems to be more accurate'
    Anchors = [akTop, akRight]
    Caption = 'Cheat'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    ExplicitLeft = 680
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 184
    Top = 112
  end
end
