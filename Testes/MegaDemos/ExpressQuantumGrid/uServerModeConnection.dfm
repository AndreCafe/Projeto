object ServerModeConnectionForm: TServerModeConnectionForm
  Left = 579
  Top = 121
  BorderStyle = bsDialog
  Caption = 'ExpressQuantumGrid Server Mode Demo'
  ClientHeight = 554
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescription: TcxLabel
    Left = 0
    Top = 0
    Align = alTop
    Caption = 
      'This demo shows a grid control'#39's capabilities when bound to a la' +
      'rge amount of data in Server Mode via a dbExpress or ADO connect' +
      'ion.'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taCenter
    Properties.WordWrap = True
    Transparent = True
    Width = 454
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 535
    Width = 454
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 36
    Width = 454
    Height = 499
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      454
      499)
    object lbSQLServer: TcxLabel
      Left = 20
      Top = 264
      Anchors = [akLeft, akBottom]
      Caption = 'SQL Server:'
      Transparent = True
    end
    object lbDatabase: TcxLabel
      Left = 20
      Top = 289
      Anchors = [akLeft, akBottom]
      Caption = 'Database:'
      Transparent = True
    end
    object lbLoginName: TcxLabel
      Left = 20
      Top = 421
      Anchors = [akLeft, akBottom]
      Caption = 'Login name:'
      Transparent = True
    end
    object lbPassword: TcxLabel
      Left = 20
      Top = 447
      Anchors = [akLeft, akBottom]
      Caption = 'Password:'
      Transparent = True
    end
    object lbRecordCount: TcxLabel
      Left = 263
      Top = 394
      Anchors = [akLeft, akBottom]
      Caption = 'Record count:'
      Transparent = True
    end
    object edSQLServer: TcxTextEdit
      Left = 80
      Top = 263
      Anchors = [akLeft, akBottom]
      Properties.OnChange = edSQLServerPropertiesChange
      TabOrder = 5
      Text = 'localhost'
      Width = 157
    end
    object rgConnectUsing: TcxRadioGroup
      Left = 20
      Top = 341
      Anchors = [akLeft, akBottom]
      Caption = ' Connect using: '
      Properties.Items = <
        item
          Caption = 'Windows authentication'
        end
        item
          Caption = 'SQL Server authentication'
        end>
      Properties.OnChange = rgConnectUsingPropertiesChange
      ItemIndex = 0
      TabOrder = 6
      Height = 65
      Width = 217
    end
    object edLoginName: TcxTextEdit
      Left = 86
      Top = 420
      Anchors = [akLeft, akBottom]
      Enabled = False
      Properties.OnChange = edLoginNamePropertiesChange
      TabOrder = 7
      Text = 'sa'
      Width = 151
    end
    object edPassword: TcxTextEdit
      Left = 86
      Top = 447
      Anchors = [akLeft, akBottom]
      Enabled = False
      Properties.EchoMode = eemPassword
      Properties.OnChange = edPasswordPropertiesChange
      TabOrder = 8
      Width = 151
    end
    object btAddRecordsAndStartDemo: TcxButton
      Left = 263
      Top = 420
      Width = 168
      Height = 21
      Anchors = [akLeft, akBottom]
      Caption = 'Add Records and Start Demo'
      Enabled = False
      TabOrder = 9
      OnClick = btAddRecordsAndStartDemoClick
    end
    object btStartDemo: TcxButton
      Left = 263
      Top = 447
      Width = 168
      Height = 21
      Anchors = [akLeft, akBottom]
      Caption = 'Start Demo'
      Enabled = False
      TabOrder = 10
      OnClick = btStartDemoClick
    end
    object seCount: TcxSpinEdit
      Left = 336
      Top = 393
      Anchors = [akLeft, akBottom]
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.DisplayFormat = '#,###'
      Properties.Increment = 50000.000000000000000000
      Properties.LargeIncrement = 100000.000000000000000000
      Properties.MinValue = 50000.000000000000000000
      TabOrder = 11
      Value = 100000
      Width = 95
    end
    object ProgressBar: TcxProgressBar
      Left = 7
      Top = 479
      TabStop = False
      Anchors = [akLeft, akRight, akBottom]
      AutoSize = False
      Properties.PeakValue = 50.000000000000000000
      Properties.ShowTextStyle = cxtsText
      TabOrder = 12
      Height = 10
      Width = 440
    end
    object cxMemo1: TcxMemo
      Left = 7
      Top = 8
      TabStop = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        
          'In this demo, the grid control needs to be connected to a data t' +
          'able on a Microsoft SQL '
        
          'Server instance. Please use this window to configure the connect' +
          'ion and data settings.'
        ''
        '1. Select a connection object.'
        
          '2. Specify the name of an existing Microsoft SQL Server instance' +
          ' that will contain the '
        'target database.'
        '3. Test the settings by clicking "Test connection".'
        
          '4. If the connection succeeds, do one of the following. On the f' +
          'irst run, specify the '
        
          'number of records in the target table and click the Add Records ' +
          'and Start Demo button. A '
        
          'new database and a table populated with sample data will be crea' +
          'ted, and then the demo '
        
          'will start with the grid control bound to the table. On subseque' +
          'nt runs, you can add more '
        
          'records to the table or just start the demo without generating a' +
          'dditional data.')
      Properties.ReadOnly = True
      TabOrder = 13
      Height = 185
      Width = 440
    end
    object lbTableName: TcxLabel
      Left = 20
      Top = 314
      Anchors = [akLeft, akBottom]
      Caption = 'Table:'
      Transparent = True
    end
    object edDatabase: TcxTextEdit
      Left = 80
      Top = 288
      Anchors = [akLeft, akBottom]
      Enabled = False
      TabOrder = 15
      Text = 'ServerModeGridDemo'
      Width = 157
    end
    object edTableName: TcxTextEdit
      Left = 80
      Top = 314
      Anchors = [akLeft, akBottom]
      Enabled = False
      TabOrder = 16
      Text = 'ServerModeGridTableDemo'
      Width = 157
    end
    object btTestConnection: TcxButton
      Left = 263
      Top = 365
      Width = 168
      Height = 22
      Anchors = [akLeft, akBottom]
      Caption = 'Test connection'
      TabOrder = 17
      OnClick = btTestConnectionClick
    end
    object lbCurrentCount: TcxLabel
      Left = 263
      Top = 199
      Anchors = [akLeft, akBottom]
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Vert = taVCenter
      Properties.WordWrap = True
      Transparent = True
      Height = 122
      Width = 168
      AnchorY = 260
    end
    object rgConnectionObject: TcxRadioGroup
      Left = 20
      Top = 199
      Anchors = [akLeft, akBottom]
      Caption = 'Connection object: '
      Properties.Items = <
        item
          Caption = 'ADO'
        end
        item
          Caption = 'dbExpress'
        end>
      Properties.OnChange = rgConnectionObjectPropertiesChange
      ItemIndex = 0
      TabOrder = 19
      Height = 58
      Width = 217
    end
  end
end
