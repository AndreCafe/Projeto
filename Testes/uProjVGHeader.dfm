object Form1: TForm1
  Left = 319
  Top = 114
  Width = 237
  Height = 152
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxVerticalGrid1: TcxVerticalGrid
    Left = 0
    Top = 0
    Width = 229
    Height = 118
    Align = alClient
    TabOrder = 0
    OnDrawRowHeader = cxVerticalGrid1DrawRowHeader
    object cxVerticalGrid1EditorRow1: TcxEditorRow
      Properties.Caption = '0'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
    end
    object cxVerticalGrid1EditorRow2: TcxEditorRow
      Properties.Caption = '1'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
    end
    object cxVerticalGrid1MultiEditorRow1: TcxMultiEditorRow
      Properties.Editors = <
        item
          Caption = '0'
          DataBinding.ValueType = 'String'
          Value = Null
        end
        item
          Caption = '1'
          DataBinding.ValueType = 'String'
          Value = Null
        end
        item
          Caption = '2'
          DataBinding.ValueType = 'String'
          Value = Null
        end>
      Properties.SeparatorKind = skString
      Properties.SeparatorString = #0
    end
  end
end
