object Form1: TForm1
  Left = 192
  Top = 103
  Width = 522
  Height = 273
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 36
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object Cliente: TLabel
    Left = 8
    Top = 60
    Width = 33
    Height = 13
    Caption = 'Projeto'
  end
  object Label3: TLabel
    Left = 8
    Top = 84
    Width = 39
    Height = 13
    Caption = 'Tecnico'
  end
  object Label4: TLabel
    Left = 136
    Top = 36
    Width = 6
    Height = 13
    Caption = 'a'
  end
  object Label5: TLabel
    Left = 8
    Top = 108
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object Label2: TLabel
    Left = 8
    Top = 132
    Width = 23
    Height = 13
    Caption = 'Fase'
  end
  object Label6: TLabel
    Left = 136
    Top = 156
    Width = 6
    Height = 13
    Caption = 'a'
  end
  object Label7: TLabel
    Left = 8
    Top = 156
    Width = 23
    Height = 13
    Caption = 'Hora'
  end
  object Label8: TLabel
    Left = 328
    Top = 8
    Width = 39
    Height = 13
    Caption = 'Label8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 8
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Gerar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object PB: TProgressBar
    Left = 8
    Top = 8
    Width = 313
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 1
  end
  object edProj: TEdit
    Left = 56
    Top = 56
    Width = 73
    Height = 21
    TabOrder = 2
    Text = 'edProj'
  end
  object edCliI: TOvcNumericField
    Left = 56
    Top = 32
    Width = 73
    Height = 21
    Cursor = crIBeam
    DataType = nftLongInt
    CaretIns.BitmapHotSpotX = 0
    CaretIns.BitmapHotSpotY = 0
    CaretIns.Shape = csVertLine
    CaretIns.Align = caLeft
    CaretIns.BlinkTime = 0
    CaretIns.CaretHeight = 10
    CaretIns.CaretWidth = 2
    CaretIns.IsGray = False
    CaretOvr.BitmapHotSpotX = 0
    CaretOvr.BitmapHotSpotY = 0
    CaretOvr.Shape = csBlock
    CaretOvr.Align = caLeft
    CaretOvr.BlinkTime = 0
    CaretOvr.CaretHeight = 10
    CaretOvr.CaretWidth = 2
    CaretOvr.IsGray = False
    Controller = OvcController1
    Borders.BottomBorder.BorderStyle = bpsSolid
    Borders.BottomBorder.Enabled = False
    Borders.BottomBorder.PenColor = clBlack
    Borders.BottomBorder.PenStyle = psSolid
    Borders.BottomBorder.PenWidth = 2
    Borders.LeftBorder.BorderStyle = bpsSolid
    Borders.LeftBorder.Enabled = False
    Borders.LeftBorder.PenColor = clBlack
    Borders.LeftBorder.PenStyle = psSolid
    Borders.LeftBorder.PenWidth = 2
    Borders.RightBorder.BorderStyle = bpsSolid
    Borders.RightBorder.Enabled = False
    Borders.RightBorder.PenColor = clBlack
    Borders.RightBorder.PenStyle = psSolid
    Borders.RightBorder.PenWidth = 2
    Borders.TopBorder.BorderStyle = bpsSolid
    Borders.TopBorder.Enabled = False
    Borders.TopBorder.PenColor = clBlack
    Borders.TopBorder.PenStyle = psSolid
    Borders.TopBorder.PenWidth = 2
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    LabelInfo.Visible = False
    Options = []
    PictureMask = 'iiiiiiiiiii'
    TabOrder = 3
    RangeHigh = {FFFFFF7F000000000000}
    RangeLow = {00000080000000000000}
  end
  object edCliF: TOvcNumericField
    Left = 152
    Top = 32
    Width = 73
    Height = 21
    Cursor = crIBeam
    DataType = nftLongInt
    CaretIns.BitmapHotSpotX = 0
    CaretIns.BitmapHotSpotY = 0
    CaretIns.Shape = csVertLine
    CaretIns.Align = caLeft
    CaretIns.BlinkTime = 0
    CaretIns.CaretHeight = 10
    CaretIns.CaretWidth = 2
    CaretIns.IsGray = False
    CaretOvr.BitmapHotSpotX = 0
    CaretOvr.BitmapHotSpotY = 0
    CaretOvr.Shape = csBlock
    CaretOvr.Align = caLeft
    CaretOvr.BlinkTime = 0
    CaretOvr.CaretHeight = 10
    CaretOvr.CaretWidth = 2
    CaretOvr.IsGray = False
    Controller = OvcController1
    Borders.BottomBorder.BorderStyle = bpsSolid
    Borders.BottomBorder.Enabled = False
    Borders.BottomBorder.PenColor = clBlack
    Borders.BottomBorder.PenStyle = psSolid
    Borders.BottomBorder.PenWidth = 2
    Borders.LeftBorder.BorderStyle = bpsSolid
    Borders.LeftBorder.Enabled = False
    Borders.LeftBorder.PenColor = clBlack
    Borders.LeftBorder.PenStyle = psSolid
    Borders.LeftBorder.PenWidth = 2
    Borders.RightBorder.BorderStyle = bpsSolid
    Borders.RightBorder.Enabled = False
    Borders.RightBorder.PenColor = clBlack
    Borders.RightBorder.PenStyle = psSolid
    Borders.RightBorder.PenWidth = 2
    Borders.TopBorder.BorderStyle = bpsSolid
    Borders.TopBorder.Enabled = False
    Borders.TopBorder.PenColor = clBlack
    Borders.TopBorder.PenStyle = psSolid
    Borders.TopBorder.PenWidth = 2
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    LabelInfo.Visible = False
    Options = []
    PictureMask = 'iiiiiiiiiii'
    TabOrder = 4
    RangeHigh = {FFFFFF7F000000000000}
    RangeLow = {00000080000000000000}
  end
  object edData: TOvcPictureField
    Left = 56
    Top = 104
    Width = 73
    Height = 21
    Cursor = crIBeam
    DataType = pftDate
    CaretIns.BitmapHotSpotX = 0
    CaretIns.BitmapHotSpotY = 0
    CaretIns.Shape = csVertLine
    CaretIns.Align = caLeft
    CaretIns.BlinkTime = 0
    CaretIns.CaretHeight = 10
    CaretIns.CaretWidth = 2
    CaretIns.IsGray = False
    CaretOvr.BitmapHotSpotX = 0
    CaretOvr.BitmapHotSpotY = 0
    CaretOvr.Shape = csBlock
    CaretOvr.Align = caLeft
    CaretOvr.BlinkTime = 0
    CaretOvr.CaretHeight = 10
    CaretOvr.CaretWidth = 2
    CaretOvr.IsGray = False
    Controller = OvcController1
    ControlCharColor = clRed
    Borders.BottomBorder.BorderStyle = bpsSolid
    Borders.BottomBorder.Enabled = False
    Borders.BottomBorder.PenColor = clBlack
    Borders.BottomBorder.PenStyle = psSolid
    Borders.BottomBorder.PenWidth = 2
    Borders.LeftBorder.BorderStyle = bpsSolid
    Borders.LeftBorder.Enabled = False
    Borders.LeftBorder.PenColor = clBlack
    Borders.LeftBorder.PenStyle = psSolid
    Borders.LeftBorder.PenWidth = 2
    Borders.RightBorder.BorderStyle = bpsSolid
    Borders.RightBorder.Enabled = False
    Borders.RightBorder.PenColor = clBlack
    Borders.RightBorder.PenStyle = psSolid
    Borders.RightBorder.PenWidth = 2
    Borders.TopBorder.BorderStyle = bpsSolid
    Borders.TopBorder.Enabled = False
    Borders.TopBorder.PenColor = clBlack
    Borders.TopBorder.PenStyle = psSolid
    Borders.TopBorder.PenWidth = 2
    DecimalPlaces = 0
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 0
    InitDateTime = False
    LabelInfo.Visible = False
    MaxLength = 10
    Options = [efoCaretToEnd]
    PictureMask = 'dd/mm/yyyy'
    TabOrder = 5
    RangeHigh = {25600D00000000000000}
    RangeLow = {00000000000000000000}
  end
  object edFase: TEdit
    Left = 56
    Top = 128
    Width = 73
    Height = 21
    TabOrder = 6
    Text = 'Edit1'
  end
  object edHoraI: TOvcPictureField
    Left = 56
    Top = 152
    Width = 73
    Height = 21
    Cursor = crIBeam
    DataType = pftTime
    CaretIns.BitmapHotSpotX = 0
    CaretIns.BitmapHotSpotY = 0
    CaretIns.Shape = csVertLine
    CaretIns.Align = caLeft
    CaretIns.BlinkTime = 0
    CaretIns.CaretHeight = 10
    CaretIns.CaretWidth = 2
    CaretIns.IsGray = False
    CaretOvr.BitmapHotSpotX = 0
    CaretOvr.BitmapHotSpotY = 0
    CaretOvr.Shape = csBlock
    CaretOvr.Align = caLeft
    CaretOvr.BlinkTime = 0
    CaretOvr.CaretHeight = 10
    CaretOvr.CaretWidth = 2
    CaretOvr.IsGray = False
    Controller = OvcController1
    ControlCharColor = clRed
    Borders.BottomBorder.BorderStyle = bpsSolid
    Borders.BottomBorder.Enabled = False
    Borders.BottomBorder.PenColor = clBlack
    Borders.BottomBorder.PenStyle = psSolid
    Borders.BottomBorder.PenWidth = 2
    Borders.LeftBorder.BorderStyle = bpsSolid
    Borders.LeftBorder.Enabled = False
    Borders.LeftBorder.PenColor = clBlack
    Borders.LeftBorder.PenStyle = psSolid
    Borders.LeftBorder.PenWidth = 2
    Borders.RightBorder.BorderStyle = bpsSolid
    Borders.RightBorder.Enabled = False
    Borders.RightBorder.PenColor = clBlack
    Borders.RightBorder.PenStyle = psSolid
    Borders.RightBorder.PenWidth = 2
    Borders.TopBorder.BorderStyle = bpsSolid
    Borders.TopBorder.Enabled = False
    Borders.TopBorder.PenColor = clBlack
    Borders.TopBorder.PenStyle = psSolid
    Borders.TopBorder.PenWidth = 2
    DecimalPlaces = 0
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 0
    InitDateTime = False
    LabelInfo.Visible = False
    MaxLength = 5
    Options = [efoCaretToEnd]
    PictureMask = 'hh:mm'
    TabOrder = 7
    RangeHigh = {7F510100000000000000}
    RangeLow = {00000000000000000000}
  end
  object edHoraF: TOvcPictureField
    Left = 152
    Top = 152
    Width = 73
    Height = 21
    Cursor = crIBeam
    DataType = pftTime
    CaretIns.BitmapHotSpotX = 0
    CaretIns.BitmapHotSpotY = 0
    CaretIns.Shape = csVertLine
    CaretIns.Align = caLeft
    CaretIns.BlinkTime = 0
    CaretIns.CaretHeight = 10
    CaretIns.CaretWidth = 2
    CaretIns.IsGray = False
    CaretOvr.BitmapHotSpotX = 0
    CaretOvr.BitmapHotSpotY = 0
    CaretOvr.Shape = csBlock
    CaretOvr.Align = caLeft
    CaretOvr.BlinkTime = 0
    CaretOvr.CaretHeight = 10
    CaretOvr.CaretWidth = 2
    CaretOvr.IsGray = False
    Controller = OvcController1
    ControlCharColor = clRed
    Borders.BottomBorder.BorderStyle = bpsSolid
    Borders.BottomBorder.Enabled = False
    Borders.BottomBorder.PenColor = clBlack
    Borders.BottomBorder.PenStyle = psSolid
    Borders.BottomBorder.PenWidth = 2
    Borders.LeftBorder.BorderStyle = bpsSolid
    Borders.LeftBorder.Enabled = False
    Borders.LeftBorder.PenColor = clBlack
    Borders.LeftBorder.PenStyle = psSolid
    Borders.LeftBorder.PenWidth = 2
    Borders.RightBorder.BorderStyle = bpsSolid
    Borders.RightBorder.Enabled = False
    Borders.RightBorder.PenColor = clBlack
    Borders.RightBorder.PenStyle = psSolid
    Borders.RightBorder.PenWidth = 2
    Borders.TopBorder.BorderStyle = bpsSolid
    Borders.TopBorder.Enabled = False
    Borders.TopBorder.PenColor = clBlack
    Borders.TopBorder.PenStyle = psSolid
    Borders.TopBorder.PenWidth = 2
    DecimalPlaces = 0
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 0
    InitDateTime = False
    LabelInfo.Visible = False
    MaxLength = 5
    Options = [efoCaretToEnd]
    PictureMask = 'hh:mm'
    TabOrder = 8
    RangeHigh = {7F510100000000000000}
    RangeLow = {00000000000000000000}
  end
  object edTec: TEdit
    Left = 56
    Top = 80
    Width = 73
    Height = 21
    TabOrder = 9
  end
  object OvcController1: TOvcController
    EntryCommands.TableList = (
      'Default'
      True
      ()
      'WordStar'
      False
      ()
      'Grid'
      False
      ())
    EntryOptions = [efoAutoSelect, efoBeepOnError, efoInsertPushes]
    Epoch = 2000
  end
  object Session: TnxSession
    ActiveDesigntime = True
    ServerEngine = RSE
    Left = 280
    Top = 32
  end
  object DB: TnxDatabase
    ActiveDesigntime = True
    Session = Session
    AliasName = 'diatec'
    Left = 312
    Top = 32
  end
  object tOS: TnxTable
    ActiveRuntime = True
    Database = DB
    TableName = 'OS'
    Left = 248
    Top = 64
    object tOSCliente: TStringField
      FieldName = 'Cliente'
      Size = 6
    end
    object tOSProjeto: TStringField
      FieldName = 'Projeto'
      Size = 6
    end
    object tOSTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tOSData: TDateTimeField
      FieldName = 'Data'
    end
    object tOSID: TWordField
      FieldName = 'ID'
    end
    object tOSInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object tOSTermino: TDateTimeField
      FieldName = 'Termino'
    end
    object tOSTranslado: TDateTimeField
      FieldName = 'Translado'
    end
    object tOSAbono: TDateTimeField
      FieldName = 'Abono'
    end
    object tOSMotivoAbon: TStringField
      FieldName = 'MotivoAbon'
      Size = 2
    end
    object tOSSync: TBooleanField
      FieldName = 'Sync'
    end
    object tOSAssinou: TStringField
      FieldName = 'Assinou'
      Size = 30
    end
    object tOSLocal: TStringField
      FieldName = 'Local'
      Size = 1
    end
    object tOSEntrou: TStringField
      FieldName = 'Entrou'
      Size = 1
    end
    object tOSDataComp: TDateTimeField
      FieldName = 'DataComp'
    end
    object tOSNumAtend: TStringField
      FieldName = 'NumAtend'
      Size = 10
    end
    object tOSLogID: TIntegerField
      FieldName = 'LogID'
    end
    object tOSDownOk: TBooleanField
      FieldName = 'DownOk'
    end
    object tOSGeraReemb: TBooleanField
      FieldName = 'GeraReemb'
    end
    object tOSTipoReemb: TStringField
      FieldName = 'TipoReemb'
      Size = 1
    end
    object tOSOutroLocal: TStringField
      FieldName = 'OutroLocal'
      Size = 6
    end
    object tOSKmDestino: TFloatField
      FieldName = 'KmDestino'
    end
    object tOSPedagio1: TFloatField
      FieldName = 'Pedagio1'
    end
    object tOSPedagio2: TFloatField
      FieldName = 'Pedagio2'
    end
    object tOSPedagio3: TFloatField
      FieldName = 'Pedagio3'
    end
    object tOSPedagio4: TFloatField
      FieldName = 'Pedagio4'
    end
    object tOSMotivo: TStringField
      FieldName = 'Motivo'
      Size = 40
    end
  end
  object RSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = Transp
    Left = 248
    Top = 32
  end
  object Transp: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameDesigntime = 'NexusDB@169.254.59.115'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 344
    Top = 32
  end
  object tOSFase: TnxTable
    ActiveRuntime = True
    Database = DB
    TableName = 'OSFase'
    Left = 280
    Top = 64
    object tOSFaseCliente: TStringField
      FieldName = 'Cliente'
      Size = 6
    end
    object tOSFaseProjeto: TStringField
      FieldName = 'Projeto'
      Size = 10
    end
    object tOSFaseData: TDateTimeField
      FieldName = 'Data'
    end
    object tOSFaseOS: TSmallintField
      FieldName = 'OS'
    end
    object tOSFaseItem: TIntegerField
      FieldName = 'Item'
    end
    object tOSFaseFase: TStringField
      FieldName = 'Fase'
      Size = 12
    end
    object tOSFaseTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tOSFaseHoras: TDateTimeField
      FieldName = 'Horas'
    end
    object tOSFaseSync: TBooleanField
      FieldName = 'Sync'
    end
    object tOSFaseTipoHora: TStringField
      FieldName = 'TipoHora'
      Size = 15
    end
    object tOSFaseOcorrencia: TStringField
      FieldName = 'Ocorrencia'
      Size = 2
    end
    object tOSFaseRevisao: TStringField
      FieldName = 'Revisao'
      Size = 2
    end
    object tOSFaseLogID: TIntegerField
      FieldName = 'LogID'
    end
    object tOSFaseDownOk: TBooleanField
      FieldName = 'DownOk'
    end
  end
  object tOSFaseDesc: TnxTable
    ActiveRuntime = True
    Database = DB
    TableName = 'OSFaseDesc'
    Left = 312
    Top = 64
    object tOSFaseDescCliente: TStringField
      FieldName = 'Cliente'
      Size = 6
    end
    object tOSFaseDescProjeto: TStringField
      FieldName = 'Projeto'
      Size = 10
    end
    object tOSFaseDescFase: TStringField
      FieldName = 'Fase'
      Size = 12
    end
    object tOSFaseDescTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tOSFaseDescItem: TIntegerField
      FieldName = 'Item'
    end
    object tOSFaseDescPos: TWordField
      FieldName = 'Pos'
    end
    object tOSFaseDescTexto: TStringField
      FieldName = 'Texto'
      Size = 70
    end
    object tOSFaseDescSync: TBooleanField
      FieldName = 'Sync'
    end
    object tOSFaseDescData: TDateTimeField
      FieldName = 'Data'
    end
    object tOSFaseDescOS: TSmallintField
      FieldName = 'OS'
    end
    object tOSFaseDescLogID: TIntegerField
      FieldName = 'LogID'
    end
    object tOSFaseDescDownOk: TBooleanField
      FieldName = 'DownOk'
    end
  end
end
