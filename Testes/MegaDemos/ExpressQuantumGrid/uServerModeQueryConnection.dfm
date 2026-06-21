object ServerModeQueryConnectionForm: TServerModeQueryConnectionForm
  Left = 579
  Top = 121
  BorderStyle = bsDialog
  Caption = 'ExpressQuantumGrid Server Mode Query Demo'
  ClientHeight = 597
  ClientWidth = 489
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
    Width = 489
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 578
    Width = 489
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 36
    Width = 489
    Height = 542
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      489
      542)
    object lbSQLServer: TcxLabel
      Left = 20
      Top = 290
      Anchors = [akLeft, akBottom]
      Caption = 'SQL Server:'
      Transparent = True
    end
    object lbDatabase: TcxLabel
      Left = 20
      Top = 317
      Anchors = [akLeft, akBottom]
      Caption = 'Database:'
      Transparent = True
    end
    object lbLoginName: TcxLabel
      Left = 20
      Top = 469
      Anchors = [akLeft, akBottom]
      Caption = 'Login name:'
      Transparent = True
    end
    object lbPassword: TcxLabel
      Left = 20
      Top = 495
      Anchors = [akLeft, akBottom]
      Caption = 'Password:'
      Transparent = True
    end
    object lbRecordCount: TcxLabel
      Left = 295
      Top = 442
      Anchors = [akLeft, akBottom]
      Caption = 'Record count:'
      Transparent = True
    end
    object edSQLServer: TcxTextEdit
      Left = 114
      Top = 289
      Anchors = [akLeft, akBottom]
      Properties.OnChange = edSQLServerPropertiesChange
      TabOrder = 5
      Text = 'localhost'
      Width = 167
    end
    object rgConnectUsing: TcxRadioGroup
      Left = 20
      Top = 397
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
      Width = 261
    end
    object edLoginName: TcxTextEdit
      Left = 86
      Top = 468
      Anchors = [akLeft, akBottom]
      Enabled = False
      Properties.OnChange = edLoginNamePropertiesChange
      TabOrder = 7
      Text = 'sa'
      Width = 195
    end
    object edPassword: TcxTextEdit
      Left = 86
      Top = 495
      Anchors = [akLeft, akBottom]
      Enabled = False
      Properties.EchoMode = eemPassword
      Properties.OnChange = edPasswordPropertiesChange
      TabOrder = 8
      Width = 195
    end
    object btAddRecordsAndStartDemo: TcxButton
      Left = 295
      Top = 468
      Width = 170
      Height = 21
      Anchors = [akLeft, akBottom]
      Caption = 'Add Records and Start Demo'
      Enabled = False
      TabOrder = 9
      OnClick = btAddRecordsAndStartDemoClick
    end
    object btStartDemo: TcxButton
      Left = 295
      Top = 495
      Width = 170
      Height = 21
      Anchors = [akLeft, akBottom]
      Caption = 'Start Demo'
      Enabled = False
      TabOrder = 10
      OnClick = btStartDemoClick
    end
    object seCount: TcxSpinEdit
      Left = 368
      Top = 441
      Anchors = [akLeft, akBottom]
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.DisplayFormat = '#,###'
      Properties.Increment = 50000.000000000000000000
      Properties.LargeIncrement = 100000.000000000000000000
      Properties.MinValue = 50000.000000000000000000
      TabOrder = 11
      Value = 100000
      Width = 97
    end
    object ProgressBar: TcxProgressBar
      Left = 7
      Top = 522
      TabStop = False
      Anchors = [akLeft, akRight, akBottom]
      AutoSize = False
      Properties.PeakValue = 50.000000000000000000
      Properties.ShowTextStyle = cxtsText
      TabOrder = 12
      Height = 10
      Width = 475
    end
    object cxMemo1: TcxMemo
      Left = 7
      Top = 8
      TabStop = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        
          'In this demo, the grid control needs to be connected to data tab' +
          'les (Orders and Customers) on a '
        
          'Microsoft SQL Server instance. Please use this window to configu' +
          're the connection and data '
        'settings.'
        ''
        '1. Select a connection object.'
        
          '2. Specify the name of an existing Microsoft SQL Server instance' +
          ' that will contain the target '
        'database.'
        '3. Test the settings by clicking "Test connection".'
        
          '4. If the connection succeeds, do one of the following. On the f' +
          'irst run, specify the number of '
        
          'records in the Orders table and click the Add Records and Start ' +
          'Demo button. A new database '
        
          'and two tables populated with sample data will be created, and t' +
          'hen a query that joins the '
        
          'tables will be executed. After this, the demo will start with th' +
          'e grid control bound to the query'#39's '
        
          'result set. On subsequent runs, you can add more records to the ' +
          'Orders table or just start the '
        'demo without generating additional data.')
      Properties.ReadOnly = True
      TabOrder = 13
      Height = 211
      Width = 475
    end
    object lbOrdersTableName: TcxLabel
      Left = 20
      Top = 344
      Anchors = [akLeft, akBottom]
      Caption = 'Orders Table:'
      Transparent = True
    end
    object edDatabase: TcxTextEdit
      Left = 114
      Top = 316
      Anchors = [akLeft, akBottom]
      Enabled = False
      TabOrder = 15
      Text = 'ServerModeGridDemo'
      Width = 167
    end
    object edOrdersTableName: TcxTextEdit
      Left = 114
      Top = 343
      Anchors = [akLeft, akBottom]
      Enabled = False
      TabOrder = 16
      Text = 'ServerModeGridOrdersDemo'
      Width = 167
    end
    object btTestConnection: TcxButton
      Left = 295
      Top = 413
      Width = 170
      Height = 22
      Anchors = [akLeft, akBottom]
      Caption = 'Test connection'
      TabOrder = 17
      OnClick = btTestConnectionClick
    end
    object lbCurrentCount: TcxLabel
      Left = 297
      Top = 232
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
      Height = 175
      Width = 168
      AnchorY = 320
    end
    object rgConnectionObject: TcxRadioGroup
      Left = 20
      Top = 225
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
      Width = 261
    end
    object edCustomersTableName: TcxTextEdit
      Left = 114
      Top = 370
      Anchors = [akLeft, akBottom]
      Enabled = False
      TabOrder = 20
      Text = 'ServerModeGridCustomersDemo'
      Width = 167
    end
    object lbCustomersTableName: TcxLabel
      Left = 20
      Top = 371
      Anchors = [akLeft, akBottom]
      Caption = 'Customers Table:'
      Transparent = True
    end
  end
end
