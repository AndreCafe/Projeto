inherited cxUnboundTreeListDemoUnitForm: TcxUnboundTreeListDemoUnitForm
  Caption = 'cxUnboundTreeListDemoUnitForm'
  ClientHeight = 455
  ClientWidth = 760
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDescription: TcxGroupBox
    Top = 407
    DesignSize = (
      760
      48)
    Width = 760
    inherited cxGroupBox6: TcxGroupBox
      DesignSize = (
        745
        33)
      Width = 745
      inherited pnlHintInternal: TPanel
        Width = 743
        inherited lblRight2: TLabel
          Left = 738
        end
        inherited lblTop2: TLabel
          Width = 743
        end
        inherited lblBottom2: TLabel
          Width = 743
        end
        inherited lblDescription: TLabel
          Width = 733
        end
      end
    end
  end
  object gbTreeListPlace: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 1
    Height = 407
    Width = 760
    object cxGroupBox4: TcxGroupBox
      Left = 2
      Top = 9
      Align = alLeft
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 0
      Height = 396
      Width = 6
    end
    object cxGroupBox5: TcxGroupBox
      Left = 752
      Top = 9
      Align = alRight
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 1
      Height = 396
      Width = 6
    end
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 2
      Height = 7
      Width = 756
    end
    object tlUnbound: TcxTreeList
      Left = 8
      Top = 9
      Width = 744
      Height = 396
      Align = alClient
      Bands = <>
      TabOrder = 3
    end
  end
end
