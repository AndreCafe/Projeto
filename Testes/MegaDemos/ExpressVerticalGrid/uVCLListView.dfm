inherited frmVCLListView: TfrmVCLListView
  Width = 736
  inherited plTop: TPanel
    Width = 736
  end
  inherited pnlSeparator: TPanel
    Top = 60
    Width = 736
  end
  inherited pnlDescription: TPanel
    Width = 736
    inherited lblRight1: TLabel
      Left = 731
    end
    inherited lblTop1: TLabel
      Width = 736
    end
    inherited lblBottom1: TLabel
      Width = 736
    end
    inherited pnlHintInternal: TPanel
      Width = 726
      inherited lblRight2: TLabel
        Left = 721
      end
      inherited lblTop2: TLabel
        Width = 726
      end
      inherited lblBottom2: TLabel
        Width = 726
      end
      inherited lblDescription: TLabel
        Width = 716
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 25
    Width = 736
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = 548
      Top = 13
      Width = 26
      Height = 13
      Caption = '&View:'
    end
    object Label2: TLabel
      Left = 4
      Top = 13
      Width = 43
      Height = 13
      Caption = 'A&ddress:'
    end
    object cbxAddress: TcxShellComboBox
      Left = 61
      Top = 9
      Width = 444
      Height = 21
      Properties.DropDownWidth = 250
      Properties.Root.BrowseFolder = bfDesktop
      ShellListView = lvItems
      TabOrder = 0
    end
    object cbxView: TcxComboBox
      Left = 579
      Top = 9
      Width = 120
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'Icon'
        'SmallIcon'
        'List'
        'Report')
      TabOrder = 1
      OnClick = cbxViewClick
    end
  end
  object lvItems: TcxShellListView
    Left = 0
    Top = 60
    Width = 736
    Height = 172
    Align = alClient
    DragDropSettings.AllowDragObjects = True
    DragDropSettings.DropEffect = [deCopy, deMove, deLink]
    DragDropSettings.DefaultDropEffect = deMove
    DragDropSettings.Scroll = False
    ParentColor = False
    Root.BrowseFolder = bfDesktop
    TabOrder = 4
  end
end
