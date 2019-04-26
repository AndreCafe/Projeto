object Form17: TForm17
  Left = 0
  Top = 0
  Caption = 'Teste de fechamento'
  ClientHeight = 467
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 773
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 18
      Height = 13
      Caption = 'EXE'
    end
    object edProg: TEdit
      Left = 32
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'msnmsgr.exe'
    end
    object Button1: TButton
      Left = 159
      Top = 8
      Width = 82
      Height = 25
      Caption = 'WM_CLOSE'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 247
      Top = 7
      Width = 75
      Height = 25
      Caption = 'WM_QUIT'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 328
      Top = 8
      Width = 57
      Height = 25
      Caption = 'EXIT'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 391
      Top = 8
      Width = 74
      Height = 25
      Caption = 'Terminate'
      TabOrder = 4
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 470
      Top = 8
      Width = 123
      Height = 25
      Caption = 'Lista de processos'
      TabOrder = 5
      OnClick = Button5Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 65
    Width = 773
    Height = 402
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Processos'
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 765
        Height = 374
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Windows'
      ImageIndex = 1
      object meWin: TMemo
        Left = 0
        Top = 0
        Width = 765
        Height = 374
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Diff'
      ImageIndex = 2
      object meDif: TMemo
        Left = 0
        Top = 0
        Width = 765
        Height = 374
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object WL: TWinList
    Left = 144
    Top = 136
  end
  object wl2: TWinList
    Left = 248
    Top = 144
  end
end
