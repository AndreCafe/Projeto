object Form21: TForm21
  Left = 0
  Top = 0
  Caption = 'Form21'
  ClientHeight = 374
  ClientWidth = 888
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 194
    Top = 0
    Width = 694
    Height = 374
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 194
    Height = 374
    ActivePage = TabSheet3
    Align = alLeft
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object LMDSimplePanel1: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 186
        Height = 346
        Align = alClient
        Bevel.Mode = bmCustom
        TabOrder = 0
        object Button6: TButton
          Left = 3
          Top = 208
          Width = 142
          Height = 25
          Caption = 'Change Home Page'
          TabOrder = 0
          OnClick = Button6Click
        end
        object Button5: TButton
          Left = 3
          Top = 129
          Width = 75
          Height = 25
          Caption = 'Button5'
          TabOrder = 1
          OnClick = Button5Click
        end
        object Button4: TButton
          Left = 3
          Top = 101
          Width = 75
          Height = 25
          Caption = 'Button4'
          TabOrder = 2
          OnClick = Button4Click
        end
        object Button2: TButton
          Left = 3
          Top = 39
          Width = 169
          Height = 25
          Caption = 'Remove Chrome Extension'
          TabOrder = 3
          OnClick = Button2Click
        end
        object Button1: TButton
          Left = 3
          Top = 8
          Width = 169
          Height = 25
          Caption = 'Add Chrome Extension'
          TabOrder = 4
          OnClick = Button1Click
        end
        object Button3: TButton
          Left = 3
          Top = 70
          Width = 169
          Height = 25
          Caption = 'Extensions Folder'
          TabOrder = 5
          OnClick = Button3Click
        end
        object Edit1: TEdit
          Left = 8
          Top = 176
          Width = 164
          Height = 21
          TabOrder = 6
          Text = 'http://opentab.nexcafe.com.br'
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Firefox'
      ImageIndex = 1
      object Button7: TButton
        Left = 3
        Top = 3
        Width = 180
        Height = 25
        Caption = 'Profile Folders'
        TabOrder = 0
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 4
        Top = 80
        Width = 142
        Height = 25
        Caption = 'Change Home Page'
        TabOrder = 1
        OnClick = Button8Click
      end
      object Edit2: TEdit
        Left = 3
        Top = 48
        Width = 174
        Height = 21
        TabOrder = 2
        Text = 'http://opentab.nexcafe.com.br'
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      object Button9: TButton
        Left = 4
        Top = 80
        Width = 142
        Height = 25
        Caption = 'Change Home Page'
        TabOrder = 0
        OnClick = Button9Click
      end
      object Edit3: TEdit
        Left = 3
        Top = 53
        Width = 174
        Height = 21
        TabOrder = 1
        Text = 'http://opentab.nexcafe.com.br'
      end
      object Button10: TButton
        Left = 8
        Top = 120
        Width = 138
        Height = 25
        Caption = 'Change All'
        TabOrder = 2
        OnClick = Button10Click
      end
    end
  end
  object LMDSysInfo1: TLMDSysInfo
    Left = 344
    Top = 64
  end
end
