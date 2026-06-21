object Form1: TForm1
  Left = 0
  Top = 0
  BorderWidth = 5
  Caption = 'Google Map Demo'
  ClientHeight = 508
  ClientWidth = 639
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
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 0
    Width = 520
    Height = 508
    Align = alClient
    TabOrder = 0
    OnBeforeNavigate2 = WebBrowser1BeforeNavigate2
    OnDocumentComplete = WebBrowser1DocumentComplete
    ExplicitLeft = 1
    ControlData = {
      4C000000BE350000813400000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E12620C000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 520
    Top = 0
    Width = 119
    Height = 508
    UseDockManager = False
    Align = alRight
    Bevel.Mode = bmCustom
    TabOrder = 1
    object Label1: TLabel
      Left = 7
      Top = 42
      Width = 93
      Height = 65
      Caption = 
        'Click Create Marker then double click the marker on the map to c' +
        'hange the Form'#39's Caption'
      WordWrap = True
    end
    object Button1: TButton
      Left = 7
      Top = 8
      Width = 81
      Height = 25
      Action = CreateMarkerAction
      TabOrder = 0
    end
    object Button2: TButton
      Left = 7
      Top = 120
      Width = 81
      Height = 25
      Action = AddControlAction
      TabOrder = 1
    end
    object Button3: TButton
      Left = 7
      Top = 150
      Width = 81
      Height = 25
      Action = PanMapAction
      TabOrder = 2
    end
    object Button4: TButton
      Left = 16
      Top = 280
      Width = 75
      Height = 25
      Caption = 'Button4'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 16
      Top = 311
      Width = 75
      Height = 25
      Caption = 'Button5'
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 16
      Top = 342
      Width = 75
      Height = 25
      Caption = 'Button6'
      TabOrder = 5
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 16
      Top = 373
      Width = 75
      Height = 25
      Caption = 'Button7'
      TabOrder = 6
      OnClick = Button7Click
    end
  end
  object ActionList1: TActionList
    Left = 543
    Top = 211
    object CreateMarkerAction: TAction
      Caption = 'Create Marker'
      OnExecute = CreateMarkerActionExecute
      OnUpdate = CreateMarkerActionUpdate
    end
    object AddControlAction: TAction
      Caption = 'Add Control'
      OnExecute = AddControlActionExecute
      OnUpdate = CreateMarkerActionUpdate
    end
    object PanMapAction: TAction
      Caption = 'Pan Map'
      OnExecute = PanMapActionExecute
      OnUpdate = CreateMarkerActionUpdate
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 248
    Top = 200
  end
  object PopupMenu1: TPopupMenu
    Left = 136
    Top = 152
    object Dadosdoatendimento1: TMenuItem
      Caption = 'Dados do atendimento'
    end
    object Equipe1: TMenuItem
      Caption = 'Equipe'
    end
    object Enviarmensagemdetexto1: TMenuItem
      Caption = 'Enviar mensagem de texto'
    end
  end
end
