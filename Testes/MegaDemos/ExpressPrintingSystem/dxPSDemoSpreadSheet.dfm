object frSpreadSheetFrame: TfrSpreadSheetFrame
  Left = 0
  Top = 0
  ClientHeight = 485
  ClientWidth = 648
  Color = clBtnFace
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxSpreadSheet: TcxSpreadSheet
    Left = 0
    Top = 0
    Width = 648
    Height = 485
    Align = alClient
    DefaultStyle.Font.Name = 'Tahoma'
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = []
    PainterType = ptOfficeXPStyle
  end
end
