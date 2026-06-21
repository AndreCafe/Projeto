object cxCustomTreeListDemoUnitForm: TcxCustomTreeListDemoUnitForm
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'cxCustomTreeListDemoUnitForm'
  ClientHeight = 320
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDescription: TcxGroupBox
    Left = 0
    Top = 272
    Align = alBottom
    PanelStyle.Active = True
    Style.Edges = []
    TabOrder = 0
    Visible = False
    DesignSize = (
      385
      48)
    Height = 48
    Width = 385
    object cxGroupBox6: TcxGroupBox
      Left = 7
      Top = 7
      Anchors = [akLeft, akTop, akRight, akBottom]
      PanelStyle.Active = True
      TabOrder = 0
      DesignSize = (
        371
        33)
      Height = 33
      Width = 371
      object pnlHintInternal: TPanel
        Left = 1
        Top = 1
        Width = 369
        Height = 31
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvNone
        BevelWidth = 4
        Color = clInfoBk
        ParentBackground = False
        TabOrder = 0
        object lblLeft2: TLabel
          Left = 0
          Top = 5
          Width = 5
          Height = 21
          Align = alLeft
          AutoSize = False
        end
        object lblRight2: TLabel
          Left = 364
          Top = 5
          Width = 5
          Height = 21
          Align = alRight
          AutoSize = False
        end
        object lblTop2: TLabel
          Left = 0
          Top = 0
          Width = 369
          Height = 5
          Align = alTop
          AutoSize = False
        end
        object lblBottom2: TLabel
          Left = 0
          Top = 26
          Width = 369
          Height = 5
          Align = alBottom
          AutoSize = False
        end
        object lblDescription: TLabel
          Left = 5
          Top = 5
          Width = 359
          Height = 21
          Align = alClient
          AutoSize = False
          Transparent = True
          WordWrap = True
        end
      end
    end
  end
end
