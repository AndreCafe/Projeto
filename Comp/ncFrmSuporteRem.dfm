object FrmSuporte: TFrmSuporte
  Left = 358
  Top = 199
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Suporte Nextar'
  ClientHeight = 165
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 341
    Height = 165
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 0
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 32
      Height = 165
      Align = alLeft
      AutoSize = True
      Picture.Data = {
        0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
        00200000001B08060000001DC78D9A000000097048597300000B1300000B1301
        009A9C18000002A44944415478DAB5964D888D6114C79FEB6B284CA67CD49021
        14499A08D988054B518AA26692E4233316B2B3A16C3029C5020B566CCC866635
        B310220B9395AF195F33731BAE213586B95EBFBFE7DCE99DA94BF33CEF7DEAD7
        B9F7F6BCE7FCCF799F7B9E934B92C469E572B9699885B00AD6C21A97ED7A0A8F
        A113DE1277F06F5C09B0E09B6017D4D903BF331630C16C37DC867689C8498405
        3F0ED3A100FD3098B10025391B6AE03B9C870E05AF8616CBBC60EA1ED8A62C97
        92DBE07C956BAC124D12B0114EDBA69B94E56AC681472D5E7703669F7D3D2501
        4761070CC34104BCAEB08045982B3019DA24E01CD4C30F6840405F6AF314CCBC
        C8987DF8FC99F2297FD79C3F133D630534B2B937B5793EA63952C0057C7E2823
        A0F77F0296C841A480667CBE0A15300BB3D5F9BF6AC852976BC3E79750016A1E
        13232B50C4E748531B97804AACF156A0CAF9FB21E615A8EF0F850AA8C51C8E4C
        FA123E3F860A5886B91C590135B717A102E662F64656E0063EF36504E425E02C
        AC832113D093DAAC76591D29E02B3E7F8D11701DA64297041C80DD508426363F
        8F0CF8CF858015988BCEFFBD5B25A0DEAAA06C5B551E447CAB50F0199846D8EE
        FCE577520274E19C802DCE9F038D4C4FE025BCB712167978019F9747C49FE9FC
        A8A7914FE56F57E2A591AC8E2FC760B5291B707E20E98233A04BE988D9D035C9
        F9F3A44A3F831662779704A8E5AAE16C737E40A9B5873A9C9F90F6C34A7B5867
        250910A0C434EA6930BDA7E4D4A273A9A958AF43A3920EE44E7BA8D3CAB5D832
        50D91E05045710CD04791351482CF088001331C7F9F16CA9FDA4335165EAEFC2
        2DF81CF80A74210D27E980690104D7FB39049B2DDBD27A0777E03E7BFB038397
        5DA533A0E6A07EB0DEF90EA58C35C53C546089605FD653F228013A747B4003C8
        1B0B2EFB0906D2F779D6EB0FF06B319A04DAF2FC0000000049454E44AE426082}
      ExplicitHeight = 105
    end
    object LMDSimplePanel2: TLMDSimplePanel
      AlignWithMargins = True
      Left = 42
      Top = 0
      Width = 299
      Height = 165
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Bevel.Mode = bmCustom
      TabOrder = 0
      object cxLabel1: TcxLabel
        AlignWithMargins = True
        Left = 0
        Top = 30
        Margins.Left = 0
        Margins.Top = 10
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = 
          'Use essa op'#231#227'o para abrir uma conversa via WhatsApp com'#13#10'o atend' +
          'imento do NexCaf'#233'.'#13#10#13#10
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        Properties.WordWrap = True
        Width = 299
      end
      object cxLabel2: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Chamar o suporte NexCaf'#233
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object btnOk: TcxButton
        Left = 40
        Top = 86
        Width = 153
        Height = 33
        Cursor = crHandPoint
        Caption = 'Abrir conversa'
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnOkClick
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
      end
    end
  end
end
