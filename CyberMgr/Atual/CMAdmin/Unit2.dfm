object Frame2: TFrame2
  Left = 0
  Top = 0
  Width = 638
  Height = 39
  Align = alBottom
  Color = clBtnFace
  ParentColor = False
  TabOrder = 0
  TabStop = True
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 638
    Height = 39
    UseDockManager = False
    Align = alClient
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 0
    ExplicitWidth = 925
    object cxCheckBox1: TcxCheckBox
      Left = 240
      Top = 8
      Caption = 'Dividir em sub-etapas de'
      TabOrder = 0
      Width = 141
    end
    object cxLabel1: TcxLabel
      Left = 463
      Top = 10
      Caption = 'a cada 15min e 10s'
    end
    object cxCurrencyEdit1: TcxCurrencyEdit
      Left = 381
      Top = 8
      EditValue = 5000c
      Style.BorderStyle = ebsOffice11
      Style.Color = clBtnFace
      TabOrder = 2
      Width = 78
    end
    object cxButton1: TcxButton
      Left = 562
      Top = 8
      Width = 47
      Height = 20
      Caption = 'Excluir'
      TabOrder = 3
      LookAndFeel.Kind = lfOffice11
    end
    object cxCurrencyEdit2: TcxCurrencyEdit
      Left = 158
      Top = 8
      EditValue = 5000c
      Style.BorderStyle = ebsOffice11
      Style.Color = clBtnFace
      TabOrder = 4
      Width = 78
    end
    object cxTimeEdit1: TcxTimeEdit
      Left = 48
      Top = 9
      EditValue = 0.000000000000000000
      Properties.ImmediatePost = True
      Properties.TimeFormat = tfHourMin
      TabOrder = 5
      Width = 57
    end
    object cxLabel2: TcxLabel
      Left = 8
      Top = 10
      Caption = 'Tempo'
    end
    object cxLabel3: TcxLabel
      Left = 127
      Top = 10
      Caption = 'Valor'
    end
  end
end
