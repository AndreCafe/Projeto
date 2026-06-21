inherited FrmBase3: TFrmBase3
  Caption = 'FrmBase3'
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    object ComboBox1: TComboBox
      Left = 40
      Top = 32
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'ComboBox1'
    end
    object ComboBox2: TComboBox
      Left = 48
      Top = 64
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'ComboBox2'
    end
    object ComboBox3: TComboBox
      Left = 48
      Top = 104
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'ComboBox3'
    end
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      0
      0
      0)
  end
end
