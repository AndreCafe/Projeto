object Form1: TForm1
  Left = 192
  Top = 114
  Width = 433
  Height = 260
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 72
    Top = 40
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 72
    Top = 72
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object Label4: TLabel
    Left = 72
    Top = 96
    Width = 32
    Height = 13
    Caption = 'Label4'
  end
  object btnserveron: TButton
    Left = 256
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 0
    OnClick = btnserveronClick
  end
  object btnserveroff: TButton
    Left = 336
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Disconnect'
    TabOrder = 1
    OnClick = btnserveroffClick
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 8
    Width = 17
    Height = 17
    Caption = 'To'
    TabOrder = 2
  end
  object StaticText2: TStaticText
    Left = 0
    Top = 40
    Width = 27
    Height = 17
    Caption = 'From'
    TabOrder = 3
  end
  object StaticText3: TStaticText
    Left = 0
    Top = 72
    Width = 40
    Height = 17
    Caption = 'Subject'
    TabOrder = 4
  end
  object Memo1: TMemo
    Left = 8
    Top = 112
    Width = 345
    Height = 105
    Lines.Strings = (
      'Memo1')
    TabOrder = 5
  end
  object StaticText4: TStaticText
    Left = 0
    Top = 96
    Width = 27
    Height = 17
    Caption = 'Date'
    TabOrder = 6
  end
  object IdSMTPServer1: TIdSMTPServer
    Bindings = <>
    Intercept = LogFile
    OnConnect = IdSMTPServer1Connect
    OnException = IdSMTPServer1Exception
    TerminateWaitTime = 50000
    OnExecute = IdSMTPServer1Execute
    CommandHandlers = <>
    ExceptionReply.Code = '500'
    ExceptionReply.Text.Strings = (
      'Unknown Internal Error')
    Greeting.Code = '220'
    Greeting.Text.Strings = (
      'Welcome to the INDY SMTP Server')
    MaxConnectionReply.Code = '300'
    MaxConnectionReply.Text.Strings = (
      'Too many connections. Try again later.')
    ReplyTexts = <>
    ReplyUnknownCommand.Code = '500'
    ReplyUnknownCommand.Text.Strings = (
      'Syntax Error')
    ReplyUnknownCommand.EnhancedCode.StatusClass = 5
    ReplyUnknownCommand.EnhancedCode.Subject = 5
    ReplyUnknownCommand.EnhancedCode.Details = 2
    ReplyUnknownCommand.EnhancedCode.Available = True
    ReplyUnknownCommand.EnhancedCode.ReplyAsStr = '5.5.2'
    OnMsgReceive = IdSMTPServer1MsgReceive
    OnUserLogin = IdSMTPServer1UserLogin
    OnMailFrom = IdSMTPServer1MailFrom
    OnRcptTo = IdSMTPServer1RcptTo
    OnReceived = IdSMTPServer1Received
    ServerName = 'Indy SMTP Server'
    Left = 392
    Top = 40
  end
  object ado1: TADOTable
    Connection = ADOConnection1
    TableDirect = True
    TableName = 'email'
    Left = 352
    Top = 40
  end
  object q: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 312
    Top = 40
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\SM' +
      'TPS\messages.mdb;Mode=Share Deny None;Extended Properties="";Per' +
      'sist Security Info=False;Jet OLEDB:System database="";Jet OLEDB:' +
      'Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine' +
      ' Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Parti' +
      'al Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New' +
      ' Database Password="";Jet OLEDB:Create System Database=False;Jet' +
      ' OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Com' +
      'pact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OL' +
      'EDB:SFP=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 280
    Top = 40
  end
  object LogFile: TIdServerInterceptLogFile
    Filename = 'c:\smtps\intercept.txt'
    Left = 280
    Top = 72
  end
  object mess: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 312
    Top = 72
  end
end
