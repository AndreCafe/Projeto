object Form1: TForm1
  Left = 2
  Top = 140
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 688
    Height = 446
    ActivePage = cxTabSheet3
    Align = alClient
    TabOrder = 0
    ClientRectBottom = 446
    ClientRectRight = 688
    ClientRectTop = 23
    object cxTabSheet1: TcxTabSheet
      Caption = 'cxTabSheet1'
      ImageIndex = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 688
        Height = 423
        Align = alClient
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          DataController.DataSource = DataSource1
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          object cxGrid1DBTableView1id: TcxGridDBColumn
            DataBinding.FieldName = 'id'
          end
          object cxGrid1DBTableView1idpessoajuridica: TcxGridDBColumn
            DataBinding.FieldName = 'idpessoajuridica'
          end
          object cxGrid1DBTableView1idpessoa: TcxGridDBColumn
            DataBinding.FieldName = 'idpessoa'
          end
          object cxGrid1DBTableView1UserName: TcxGridDBColumn
            DataBinding.FieldName = 'UserName'
          end
          object cxGrid1DBTableView1Attribute: TcxGridDBColumn
            DataBinding.FieldName = 'Attribute'
          end
          object cxGrid1DBTableView1op: TcxGridDBColumn
            DataBinding.FieldName = 'op'
          end
          object cxGrid1DBTableView1Value: TcxGridDBColumn
            DataBinding.FieldName = 'Value'
          end
          object cxGrid1DBTableView1CheckInTime: TcxGridDBColumn
            DataBinding.FieldName = 'CheckInTime'
          end
          object cxGrid1DBTableView1CheckOutTime: TcxGridDBColumn
            DataBinding.FieldName = 'CheckOutTime'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'cxTabSheet2'
      ImageIndex = 1
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 688
        Height = 423
        Align = alClient
        TabOrder = 0
        object cxGrid2DBTableView1: TcxGridDBTableView
          DataController.DataSource = DataSource2
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          object cxGrid2DBTableView1RadAcctId: TcxGridDBColumn
            DataBinding.FieldName = 'RadAcctId'
          end
          object cxGrid2DBTableView1AcctSessionId: TcxGridDBColumn
            DataBinding.FieldName = 'AcctSessionId'
          end
          object cxGrid2DBTableView1AcctUniqueId: TcxGridDBColumn
            DataBinding.FieldName = 'AcctUniqueId'
          end
          object cxGrid2DBTableView1UserName: TcxGridDBColumn
            DataBinding.FieldName = 'UserName'
          end
          object cxGrid2DBTableView1Realm: TcxGridDBColumn
            DataBinding.FieldName = 'Realm'
          end
          object cxGrid2DBTableView1NASIPAddress: TcxGridDBColumn
            DataBinding.FieldName = 'NASIPAddress'
          end
          object cxGrid2DBTableView1NASPortId: TcxGridDBColumn
            DataBinding.FieldName = 'NASPortId'
          end
          object cxGrid2DBTableView1NASPortType: TcxGridDBColumn
            DataBinding.FieldName = 'NASPortType'
          end
          object cxGrid2DBTableView1AcctStartTime: TcxGridDBColumn
            DataBinding.FieldName = 'AcctStartTime'
          end
          object cxGrid2DBTableView1AcctStopTime: TcxGridDBColumn
            DataBinding.FieldName = 'AcctStopTime'
          end
          object cxGrid2DBTableView1AcctSessionTime: TcxGridDBColumn
            DataBinding.FieldName = 'AcctSessionTime'
          end
          object cxGrid2DBTableView1AcctAuthentic: TcxGridDBColumn
            DataBinding.FieldName = 'AcctAuthentic'
          end
          object cxGrid2DBTableView1ConnectInfo_start: TcxGridDBColumn
            DataBinding.FieldName = 'ConnectInfo_start'
          end
          object cxGrid2DBTableView1ConnectInfo_stop: TcxGridDBColumn
            DataBinding.FieldName = 'ConnectInfo_stop'
          end
          object cxGrid2DBTableView1AcctInputOctets: TcxGridDBColumn
            DataBinding.FieldName = 'AcctInputOctets'
          end
          object cxGrid2DBTableView1AcctOutputOctets: TcxGridDBColumn
            DataBinding.FieldName = 'AcctOutputOctets'
          end
          object cxGrid2DBTableView1CalledStationId: TcxGridDBColumn
            DataBinding.FieldName = 'CalledStationId'
          end
          object cxGrid2DBTableView1CallingStationId: TcxGridDBColumn
            DataBinding.FieldName = 'CallingStationId'
          end
          object cxGrid2DBTableView1AcctTerminateCause: TcxGridDBColumn
            DataBinding.FieldName = 'AcctTerminateCause'
          end
          object cxGrid2DBTableView1ServiceType: TcxGridDBColumn
            DataBinding.FieldName = 'ServiceType'
          end
          object cxGrid2DBTableView1FramedProtocol: TcxGridDBColumn
            DataBinding.FieldName = 'FramedProtocol'
          end
          object cxGrid2DBTableView1FramedIPAddress: TcxGridDBColumn
            DataBinding.FieldName = 'FramedIPAddress'
          end
          object cxGrid2DBTableView1AcctStartDelay: TcxGridDBColumn
            DataBinding.FieldName = 'AcctStartDelay'
          end
          object cxGrid2DBTableView1AcctStopDelay: TcxGridDBColumn
            DataBinding.FieldName = 'AcctStopDelay'
          end
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = cxGrid2DBTableView1
        end
      end
      object Button1: TButton
        Left = 256
        Top = 184
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 1
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'cxTabSheet3'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 688
        Height = 153
        Align = alTop
        TabOrder = 0
        object Memo1: TMemo
          Left = 1
          Top = 1
          Width = 536
          Height = 151
          Align = alLeft
          Lines.Strings = (
            'Memo1')
          TabOrder = 0
        end
        object Button2: TButton
          Left = 568
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Button2'
          TabOrder = 1
          OnClick = Button2Click
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 153
        Width = 688
        Height = 270
        Align = alClient
        DataSource = DataSource3
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object qCheck: TmySQLQuery
    Database = DB
    SQL.Strings = (
      'select * from radcheck')
    Left = 24
    Top = 8
  end
  object DB: TmySQLDatabase
    DatabaseName = 'dbradius'
    UserName = 'cybermgr'
    UserPassword = '0o9i8u7y6t'
    Host = 'mysql.cbroom.com.br'
    ConnectOptions = []
    Params.Strings = (
      'Port=3306'
      'TIMEOUT=30'
      'Host=mysql.cbroom.com.br'
      'DatabaseName=dbradius'
      'UID=cybermgr'
      'PWD=0o9i8u7y6t')
    Left = 144
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = qCheck
    Left = 80
    Top = 16
  end
  object qAcct: TmySQLQuery
    Database = DB
    SQL.Strings = (
      'select * from radacct'
      'where (acctsessionid like '#39'scyber%'#39')')
    Left = 216
    Top = 32
    object qAcctRadAcctId: TLargeintField
      FieldName = 'RadAcctId'
    end
    object qAcctAcctSessionId: TStringField
      FieldName = 'AcctSessionId'
      Size = 32
    end
    object qAcctAcctUniqueId: TStringField
      FieldName = 'AcctUniqueId'
      Size = 32
    end
    object qAcctUserName: TStringField
      FieldName = 'UserName'
      Size = 64
    end
    object qAcctRealm: TStringField
      FieldName = 'Realm'
      Size = 64
    end
    object qAcctNASIPAddress: TStringField
      FieldName = 'NASIPAddress'
      Size = 15
    end
    object qAcctNASPortId: TIntegerField
      FieldName = 'NASPortId'
    end
    object qAcctNASPortType: TStringField
      FieldName = 'NASPortType'
      Size = 32
    end
    object qAcctAcctStartTime: TDateTimeField
      FieldName = 'AcctStartTime'
    end
    object qAcctAcctStopTime: TDateTimeField
      FieldName = 'AcctStopTime'
    end
    object qAcctAcctSessionTime: TIntegerField
      FieldName = 'AcctSessionTime'
    end
    object qAcctAcctAuthentic: TStringField
      FieldName = 'AcctAuthentic'
      Size = 32
    end
    object qAcctConnectInfo_start: TStringField
      FieldName = 'ConnectInfo_start'
      Size = 32
    end
    object qAcctConnectInfo_stop: TStringField
      FieldName = 'ConnectInfo_stop'
      Size = 32
    end
    object qAcctAcctInputOctets: TLargeintField
      FieldName = 'AcctInputOctets'
    end
    object qAcctAcctOutputOctets: TLargeintField
      FieldName = 'AcctOutputOctets'
    end
    object qAcctCalledStationId: TStringField
      FieldName = 'CalledStationId'
      Size = 50
    end
    object qAcctCallingStationId: TStringField
      FieldName = 'CallingStationId'
      Size = 50
    end
    object qAcctAcctTerminateCause: TStringField
      FieldName = 'AcctTerminateCause'
      Size = 32
    end
    object qAcctServiceType: TStringField
      FieldName = 'ServiceType'
      Size = 32
    end
    object qAcctFramedProtocol: TStringField
      FieldName = 'FramedProtocol'
      Size = 32
    end
    object qAcctFramedIPAddress: TStringField
      FieldName = 'FramedIPAddress'
      Size = 15
    end
    object qAcctAcctStartDelay: TIntegerField
      FieldName = 'AcctStartDelay'
    end
    object qAcctAcctStopDelay: TIntegerField
      FieldName = 'AcctStopDelay'
    end
  end
  object DataSource2: TDataSource
    DataSet = qAcct
    Left = 280
    Top = 55
  end
  object Q: TmySQLQuery
    Database = DB
    Left = 376
    Top = 104
  end
  object DataSource3: TDataSource
    DataSet = Q
    Left = 400
    Top = 63
  end
end
