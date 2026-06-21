inherited frmPreview: TfrmPreview
  Caption = 'Preview'
  ClientWidth = 601
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDescription: TcxGroupBox
    Style.BorderStyle = ebsNone
    ExplicitWidth = 601
    Width = 601
    inherited cxGroupBox6: TcxGroupBox
      ExplicitWidth = 587
      Width = 587
      inherited pnlHintInternal: TPanel
        Width = 585
        ExplicitWidth = 585
        inherited lblRight2: TLabel
          Left = 580
          ExplicitLeft = 580
        end
        inherited lblTop2: TLabel
          Width = 585
          ExplicitWidth = 585
        end
        inherited lblBottom2: TLabel
          Width = 585
          ExplicitWidth = 585
        end
        inherited lblDescription: TLabel
          Width = 575
          ExplicitWidth = 575
        end
      end
    end
  end
  inherited gbTreeListPlace: TcxGroupBox
    Top = 44
    ExplicitTop = 44
    ExplicitWidth = 601
    ExplicitHeight = 228
    Height = 228
    Width = 601
    inherited cxGroupBox4: TcxGroupBox
      ExplicitHeight = 217
      Height = 217
    end
    inherited cxGroupBox5: TcxGroupBox
      Left = 593
      ExplicitLeft = 593
      ExplicitHeight = 217
      Height = 217
    end
    inherited cxGroupBox2: TcxGroupBox
      ExplicitWidth = 597
      Width = 597
    end
    inherited tlDB: TcxDBTreeList
      Width = 585
      Height = 217
      ExplicitWidth = 585
      ExplicitHeight = 217
    end
  end
  object cxGroupBox3: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 2
    DesignSize = (
      601
      44)
    Height = 44
    Width = 601
    object cxGroupBox1: TcxGroupBox
      Left = 7
      Top = 7
      Anchors = [akLeft, akTop, akRight, akBottom]
      PanelStyle.Active = True
      TabOrder = 0
      Height = 37
      Width = 587
      object cxLabel1: TcxLabel
        Left = 147
        Top = 9
        Caption = 'Place:'
        Transparent = True
      end
      object chkVisible: TcxCheckBox
        Left = 16
        Top = 9
        Caption = 'Visible'
        TabOrder = 1
        Transparent = True
        OnClick = chkVisibleClick
        Width = 65
      end
      object cbPlace: TcxComboBox
        Left = 186
        Top = 8
        Properties.Items.Strings = (
          'Bottom'
          'Top')
        Properties.OnChange = cbPlacePropertiesChange
        TabOrder = 2
        Text = 'cbPlace'
        Width = 121
      end
      object cxLabel2: TcxLabel
        Left = 383
        Top = 9
        Caption = 'Column:'
        Transparent = True
      end
      object cbColumn: TcxComboBox
        Left = 432
        Top = 8
        Properties.OnChange = cbColumnPropertiesChange
        TabOrder = 4
        Text = 'cbColumn'
        Width = 121
      end
    end
  end
end
