object Form1: TForm1
  Left = 179
  Top = 97
  Width = 378
  Height = 340
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
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 370
    Height = 8
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 8
    Width = 6
    Height = 297
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 364
    Top = 8
    Width = 6
    Height = 297
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 305
    Width = 370
    Height = 8
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
  end
  object PageControl: TPageControl
    Left = 6
    Top = 8
    Width = 358
    Height = 297
    ActivePage = tsSummaryGroups
    Align = alClient
    TabIndex = 2
    TabOrder = 4
    object tsBands: TTabSheet
      Caption = '  Bands  '
      object Panel12: TPanel
        Left = 244
        Top = 6
        Width = 106
        Height = 257
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object BAddBand: TButton
          Left = 8
          Top = 0
          Width = 91
          Height = 22
          Caption = '&Add'
          TabOrder = 0
        end
        object BDeleteBand: TButton
          Left = 8
          Top = 29
          Width = 91
          Height = 22
          Caption = '&Delete'
          TabOrder = 1
        end
        object BUpBand: TButton
          Left = 8
          Top = 58
          Width = 91
          Height = 22
          Caption = 'Move &Up'
          TabOrder = 2
        end
        object BDownBand: TButton
          Left = 8
          Top = 87
          Width = 91
          Height = 22
          Caption = 'Move Dow&n'
          TabOrder = 3
        end
        object BRestoreDefault: TButton
          Left = 8
          Top = 116
          Width = 91
          Height = 22
          Caption = 'Rest&ore Defaults'
          TabOrder = 4
        end
      end
      object Panel13: TPanel
        Left = 0
        Top = 0
        Width = 350
        Height = 6
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
      end
      object Panel15: TPanel
        Left = 0
        Top = 263
        Width = 350
        Height = 6
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
      end
      object Panel24: TPanel
        Left = 0
        Top = 6
        Width = 6
        Height = 257
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 3
      end
      object LBands: TListBox
        Left = 6
        Top = 6
        Width = 238
        Height = 257
        Align = alClient
        DragMode = dmAutomatic
        ItemHeight = 13
        MultiSelect = True
        PopupMenu = pmBands
        TabOrder = 4
      end
    end
    object tsColumns: TTabSheet
      Caption = '  Columns  '
      object Panel5: TPanel
        Left = 0
        Top = 6
        Width = 6
        Height = 257
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 350
        Height = 6
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
      end
      object Panel8: TPanel
        Left = 0
        Top = 263
        Width = 350
        Height = 6
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
      end
      object pnButtons: TPanel
        Left = 244
        Top = 6
        Width = 106
        Height = 257
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 3
        object BAdd: TButton
          Left = 8
          Top = 0
          Width = 91
          Height = 22
          Caption = '&Add...'
          TabOrder = 0
        end
        object BDelete: TButton
          Left = 8
          Top = 29
          Width = 91
          Height = 22
          Caption = '&Delete'
          TabOrder = 1
        end
        object BUp: TButton
          Left = 8
          Top = 87
          Width = 91
          Height = 22
          Caption = 'Move &Up'
          TabOrder = 3
        end
        object BDown: TButton
          Left = 8
          Top = 116
          Width = 91
          Height = 22
          Caption = 'Move Dow&n'
          TabOrder = 4
        end
        object BWizard: TButton
          Left = 8
          Top = 145
          Width = 91
          Height = 22
          Caption = 'Add All &Fields...'
          TabOrder = 5
        end
        object BRestore: TButton
          Left = 8
          Top = 174
          Width = 91
          Height = 22
          Caption = 'Rest&ore Defaults'
          TabOrder = 6
        end
        object BChange: TButton
          Left = 8
          Top = 58
          Width = 91
          Height = 22
          Caption = '&Change type...'
          TabOrder = 2
        end
        object BRestoreWidths: TButton
          Left = 8
          Top = 203
          Width = 91
          Height = 22
          Caption = 'Restore &Widths'
          TabOrder = 7
        end
      end
      object CListBox: TListBox
        Left = 6
        Top = 6
        Width = 238
        Height = 257
        Align = alClient
        DragMode = dmAutomatic
        ItemHeight = 13
        MultiSelect = True
        PopupMenu = pmColumns
        TabOrder = 4
      end
    end
    object tsSummaryGroups: TTabSheet
      Caption = '  Summary  '
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 350
        Height = 6
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
      end
      object Panel10: TPanel
        Left = 0
        Top = 263
        Width = 350
        Height = 6
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
      end
      object pnItems: TPanel
        Left = 177
        Top = 6
        Width = 173
        Height = 257
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object Panel11: TPanel
          Left = 167
          Top = 0
          Width = 6
          Height = 257
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 167
          Height = 257
          Align = alClient
          Caption = ' SummaryItems '
          TabOrder = 1
          object LItems: TListBox
            Left = 8
            Top = 19
            Width = 151
            Height = 201
            Align = alClient
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            PopupMenu = pmItems
            TabOrder = 0
          end
          object Panel14: TPanel
            Left = 2
            Top = 19
            Width = 6
            Height = 201
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel20: TPanel
            Left = 159
            Top = 19
            Width = 6
            Height = 201
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
          end
          object Panel22: TPanel
            Left = 2
            Top = 15
            Width = 163
            Height = 4
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 3
          end
          object Panel23: TPanel
            Left = 2
            Top = 220
            Width = 163
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 4
            object BAddItem: TButton
              Left = 8
              Top = 7
              Width = 68
              Height = 22
              Caption = 'Add'
              TabOrder = 0
            end
            object BDeleteItem: TButton
              Left = 86
              Top = 7
              Width = 68
              Height = 22
              Caption = 'Delete'
              TabOrder = 1
            end
          end
        end
      end
      object pnGroups: TPanel
        Left = 0
        Top = 6
        Width = 177
        Height = 257
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 3
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 6
          Height = 257
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
        end
        object Panel16: TPanel
          Left = 170
          Top = 0
          Width = 7
          Height = 257
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
        end
        object GroupBox1: TGroupBox
          Left = 6
          Top = 0
          Width = 164
          Height = 257
          Align = alClient
          Caption = ' SummaryGroups '
          TabOrder = 2
          object LGroups: TListBox
            Left = 8
            Top = 19
            Width = 148
            Height = 201
            Align = alClient
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            PopupMenu = pmGroups
            TabOrder = 0
          end
          object Panel17: TPanel
            Left = 2
            Top = 19
            Width = 6
            Height = 201
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel18: TPanel
            Left = 156
            Top = 19
            Width = 6
            Height = 201
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
          end
          object Panel19: TPanel
            Left = 2
            Top = 15
            Width = 160
            Height = 4
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 3
          end
          object Panel21: TPanel
            Left = 2
            Top = 220
            Width = 160
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 4
            object BAddGroup: TButton
              Left = 8
              Top = 7
              Width = 68
              Height = 22
              Caption = 'Add'
              TabOrder = 0
            end
            object BDeleteGroup: TButton
              Left = 86
              Top = 7
              Width = 68
              Height = 22
              Caption = 'Delete'
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  object pmColumns: TPopupMenu
    Left = 228
    Top = 6
    object miAdd: TMenuItem
      Caption = '&Add...'
      ShortCut = 45
    end
    object miDelete: TMenuItem
      Caption = '&Delete'
      ShortCut = 46
    end
    object miChangetype: TMenuItem
      Caption = '&Change type...'
    end
    object miUp: TMenuItem
      Caption = 'Move &Up'
    end
    object miDown: TMenuItem
      Caption = 'Move Dow&n'
    end
    object miWizard: TMenuItem
      Caption = 'Add All &Fields'
    end
    object miRestore: TMenuItem
      Caption = 'Rest&ore Defaults'
    end
    object miRestoreDefaultWidths: TMenuItem
      Caption = 'Restore &Widths'
    end
    object miSelectAll: TMenuItem
      Caption = '&Select All'
    end
  end
  object pmGroups: TPopupMenu
    Left = 260
    Top = 6
    object miAddGroup: TMenuItem
      Caption = '&Add'
      ShortCut = 45
    end
    object miDeleteGroup: TMenuItem
      Caption = '&Delete'
      ShortCut = 46
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object miSellectGroup: TMenuItem
      Caption = '&Select All'
    end
  end
  object pmItems: TPopupMenu
    Left = 294
    Top = 6
    object miAddItem: TMenuItem
      Caption = '&Add'
      ShortCut = 45
    end
    object miDeleteItem: TMenuItem
      Caption = '&Delete'
      ShortCut = 46
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object miSelectItems: TMenuItem
      Caption = '&Select All'
    end
  end
  object pmBands: TPopupMenu
    Left = 194
    Top = 6
    object miAddBand: TMenuItem
      Caption = '&Add'
      ShortCut = 45
    end
    object miDeleteBand: TMenuItem
      Caption = '&Delete'
      ShortCut = 46
    end
    object miUpBand: TMenuItem
      Caption = 'Move &Up'
    end
    object miDownBand: TMenuItem
      Caption = 'Move Dow&n'
    end
    object miRestoreBands: TMenuItem
      Caption = 'Rest&ore Defaults'
    end
    object miAllBands: TMenuItem
      Caption = '&Select All'
    end
  end
end
