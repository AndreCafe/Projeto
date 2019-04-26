inherited FrmFST: TFrmFST
  Caption = 'NexCaf'#233
  ClientHeight = 256
  ClientWidth = 441
  KeyPreview = True
  OnCloseQuery = FormCloseQuery
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  ExplicitWidth = 449
  ExplicitHeight = 283
  PixelsPerInch = 96
  TextHeight = 13
  object Paginas: TcxPageControl
    Left = 0
    Top = 0
    Width = 441
    Height = 256
    Align = alClient
    TabOrder = 0
    Properties.HideTabs = True
    LookAndFeel.NativeStyle = False
    OnChange = PaginasChange
    OnPageChanging = PaginasPageChanging
    ClientRectBottom = 256
    ClientRectRight = 441
    ClientRectTop = 0
  end
  object TimerOnTop: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerOnTopTimer
    Left = 32
    Top = 32
  end
end
