object Form19: TForm19
  Left = 0
  Top = 0
  Caption = 'TESTE PRINT PDF'
  ClientHeight = 288
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 39
    Width = 114
    Height = 25
    Caption = 'Imprime via Adobe'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 8
    Width = 114
    Height = 25
    Caption = 'Mamatha Print'
    TabOrder = 1
    OnClick = Button2Click
  end
  object A: TAcroPDF
    Left = 293
    Top = 0
    Width = 191
    Height = 288
    Align = alRight
    TabOrder = 2
    ExplicitLeft = 344
    ExplicitHeight = 254
    ControlData = {00090000BE130000C41D0000}
  end
  object Button3: TButton
    Left = 184
    Top = 39
    Width = 75
    Height = 25
    Caption = 'PS Printer ?'
    TabOrder = 3
  end
  object gPDF: TgtPDFDocument
    About = 'Gnostice PDFtoolkit (www.gnostice.com)'
    Version = '4.0.1'
    OpenAfterSave = False
    MergeOptions = []
    EMailAfterSave = False
    ShowSetupDialog = False
    Left = 392
    Top = 16
  end
  object gPrint: TgtPDFPrinter
    Collate = True
    Copies = 1
    Options = [poPageNums]
    About = 'Gnostice PDFtoolkit (www.gnostice.com)'
    Scaling = psNone
    Version = '4.0.1'
    ShowSetupDialog = False
    AutoRotate = False
    Left = 432
    Top = 16
  end
end
