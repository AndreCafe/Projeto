object frmDrillDown: TfrmDrillDown
  Left = 278
  Top = 278
  Width = 660
  Height = 445
  ActiveControl = cxGrid1
  Caption = 'Drill Down Form'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 353
    Width = 652
    Height = 58
    Align = alBottom
    TabOrder = 0
    object cxHyperLinkEdit1: TcxHyperLinkEdit
      Left = 2
      Top = 30
      TabStop = False
      ParentColor = True
      Properties.ReadOnly = True
      Properties.SingleClick = True
      Style.BorderStyle = ebsNone
      Style.HotTrack = False
      TabOrder = 0
      Text = 'http://www.devexpress.com/Products/VCL/ExQuantumGrid/'
      OnClick = cxHyperLinkEdit1Click
      Width = 305
    end
    object cxLabel1: TcxLabel
      Left = 1
      Top = 1
      Align = alTop
      Caption = 
        'The ExpressQuantumGrid Suite allows you to view drill down data ' +
        'source and can be purchased separately via our website. You can ' +
        'learn more at:'
      Properties.WordWrap = True
      Transparent = True
      Width = 650
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 652
    Height = 353
    Align = alClient
    TabOrder = 1
    object TableView: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = TableView
    end
  end
end
