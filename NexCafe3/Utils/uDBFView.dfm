object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Form13'
  ClientHeight = 582
  ClientWidth = 977
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
  object cxGrid1: TcxGrid
    Left = 0
    Top = 41
    Width = 977
    Height = 541
    Align = alClient
    TabOrder = 0
    object TV: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.KeyFieldNames = 'NRO_LLAM'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0'
          Kind = skCount
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.Footer = True
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = TV
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 977
    Height = 41
    Align = alTop
    TabOrder = 1
    object Button1: TButton
      Left = 12
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 94
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object tF: TDbf
    FilePath = 'C:\Meus Programas\LogicMove\LMxVital\'
    IndexDefs = <
      item
        Options = []
      end>
    TableName = 'UNID_C.DBF'
    TableLevel = 25
    Left = 192
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = tF
    Left = 264
    Top = 216
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 352
    Top = 8
  end
  object nxSe: TnxSession
    ServerEngine = nxRSE
    Left = 640
    Top = 184
  end
  object nxDatabase1: TnxDatabase
    Session = nxSe
    AliasName = 'cad'
    Left = 696
    Top = 184
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCP
    Left = 784
    Top = 184
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    MaxBytesPerSecond = 0
    PingTime = 0
    Port = 16400
    Left = 640
    Top = 248
  end
  object tUnit: TnxTable
    Database = nxDatabase1
    TableName = 'Unit'
    Left = 736
    Top = 184
    object tUnitID: TAutoIncField
      FieldName = 'ID'
    end
    object tUnitUserCode: TStringField
      FieldName = 'UserCode'
      Size = 10
    end
    object tUnitBase: TIntegerField
      FieldName = 'Base'
    end
    object tUnitStatus: TWordField
      FieldName = 'Status'
    end
    object tUnitStatusOn: TDateTimeField
      FieldName = 'StatusOn'
    end
    object tUnitStatusOnGMT: TSmallintField
      FieldName = 'StatusOnGMT'
    end
    object tUnitNumber: TIntegerField
      FieldName = 'Number'
    end
    object tUnitType: TIntegerField
      FieldName = 'Type'
    end
    object tUnitDispatch: TIntegerField
      FieldName = 'Dispatch'
    end
    object tUnitQueueSize: TIntegerField
      FieldName = 'QueueSize'
    end
    object tUnitName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object tUnitMDT: TIntegerField
      FieldName = 'MDT'
    end
    object tUnitEnable: TBooleanField
      FieldName = 'Enable'
    end
    object tUnitActive: TBooleanField
      FieldName = 'Active'
    end
    object tUnitNotes: TMemoField
      FieldName = 'Notes'
      BlobType = ftMemo
    end
    object tUnitBusy: TBooleanField
      FieldName = 'Busy'
    end
    object tUnitBusyOn: TDateTimeField
      FieldName = 'BusyOn'
    end
    object tUnitBusyOnGMT: TSmallintField
      FieldName = 'BusyOnGMT'
    end
    object tUnitLastDispatch: TIntegerField
      FieldName = 'LastDispatch'
    end
    object tUnitGPSlogID: TIntegerField
      FieldName = 'GPSlogID'
    end
    object tUnitGPSlogOn: TDateTimeField
      FieldName = 'GPSlogOn'
    end
    object tUnitTeam1: TIntegerField
      FieldName = 'Team1'
    end
    object tUnitTeam2: TIntegerField
      FieldName = 'Team2'
    end
    object tUnitTeam3: TIntegerField
      FieldName = 'Team3'
    end
    object tUnitTeam4: TIntegerField
      FieldName = 'Team4'
    end
    object tUnitTeam5: TIntegerField
      FieldName = 'Team5'
    end
    object tUnitUALogID: TIntegerField
      FieldName = 'UALogID'
    end
    object tUnitOnBase: TBooleanField
      FieldName = 'OnBase'
    end
    object tUnitImage: TGraphicField
      FieldName = 'Image'
      BlobType = ftGraphic
    end
    object tUnitReturning: TBooleanField
      FieldName = 'Returning'
    end
  end
end
