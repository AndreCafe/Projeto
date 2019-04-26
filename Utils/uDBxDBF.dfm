object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Importa'#231#227'o do Tina Soft'
  ClientHeight = 518
  ClientWidth = 1056
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 1056
    Height = 453
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 1056
    Height = 49
    Align = alTop
    Bevel.Mode = bmEdge
    TabOrder = 1
    ExplicitTop = 10
    object Button1: TButton
      Left = 14
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 112
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object PB: TProgressBar
    Left = 0
    Top = 49
    Width = 1056
    Height = 16
    Align = alTop
    TabOrder = 2
  end
  object Tab: TTable
    DatabaseName = 'c:\meus programas\nexcafe'
    SessionName = 'SessionBDE'
    TableName = 'LNTabCli.DB'
    Left = 128
    Top = 96
    object TabCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object TabNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object TabEnderecoCliente: TStringField
      FieldName = 'EnderecoCliente'
      Size = 50
    end
    object TabBairroCliente: TStringField
      FieldName = 'BairroCliente'
      Size = 30
    end
    object TabCepCliente: TStringField
      FieldName = 'CepCliente'
    end
    object TabCidadeCliente: TStringField
      FieldName = 'CidadeCliente'
      Size = 30
    end
    object TabEstadoCliente: TStringField
      FieldName = 'EstadoCliente'
    end
    object TabDDDFoneCliente: TStringField
      FieldName = 'DDDFoneCliente'
      Size = 5
    end
    object TabFoneCliente: TStringField
      FieldName = 'FoneCliente'
    end
    object TabCategoriaCliente: TIntegerField
      FieldName = 'CategoriaCliente'
    end
    object TabNumeroUltimoPedido: TIntegerField
      FieldName = 'NumeroUltimoPedido'
    end
    object TabDataNasc: TDateField
      FieldName = 'DataNasc'
    end
    object TabCredito: TFloatField
      FieldName = 'Credito'
    end
  end
  object DataSource1: TDataSource
    DataSet = Tab
    Left = 168
    Top = 96
  end
  object Database1: TDatabase
    SessionName = 'Default'
    Left = 104
    Top = 280
  end
  object Session1: TSession
    Active = True
    NetFileDir = 'C:\MEUS PROGRAMAS\NEXCAFE'
    SessionName = 'SessionBDE'
    Left = 272
    Top = 176
  end
  object TabDBF: TDbf
    FilePath = 'c:\meus programas\nexcafe\'
    IndexDefs = <>
    OpenMode = omAutoCreate
    TableName = 'LNTabCli.dbf'
    TableLevel = 4
    Left = 464
    Top = 184
    object TabDBFCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object TabDBFNOMECLIENT: TStringField
      FieldName = 'NOMECLIENT'
      Size = 50
    end
    object TabDBFENDERECOCL: TStringField
      FieldName = 'ENDERECOCL'
      Size = 50
    end
    object TabDBFBAIRROCLIE: TStringField
      FieldName = 'BAIRROCLIE'
      Size = 30
    end
    object TabDBFCEPCLIENTE: TStringField
      FieldName = 'CEPCLIENTE'
    end
    object TabDBFCIDADECLIE: TStringField
      FieldName = 'CIDADECLIE'
      Size = 30
    end
    object TabDBFESTADOCLIE: TStringField
      FieldName = 'ESTADOCLIE'
    end
    object TabDBFDDDFONECLI: TStringField
      FieldName = 'DDDFONECLI'
      Size = 5
    end
    object TabDBFFONECLIENT: TStringField
      FieldName = 'FONECLIENT'
    end
    object TabDBFCATEGORIAC: TIntegerField
      FieldName = 'CATEGORIAC'
    end
    object TabDBFNUMEROULTI: TIntegerField
      FieldName = 'NUMEROULTI'
    end
    object TabDBFDATANASC: TDateField
      FieldName = 'DATANASC'
    end
    object TabDBFCREDITO: TFloatField
      FieldName = 'CREDITO'
    end
  end
end
