object FrmImpPrePago: TFrmImpPrePago
  Left = 218
  Top = 216
  BorderStyle = bsDialog
  Caption = 'Imprimir Cart'#245'es de Tempo'
  ClientHeight = 243
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 54
    Height = 13
    Caption = 'Passaporte'
  end
  object Label2: TLabel
    Left = 16
    Top = 52
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object edTipo: TcxLookupComboBox
    Left = 79
    Top = 20
    Properties.DropDownAutoSize = True
    Properties.DropDownListStyle = lsEditList
    Properties.DropDownSizeable = True
    Properties.GridMode = True
    Properties.HideSelection = False
    Properties.ImmediatePost = True
    Properties.IncrementalFiltering = False
    Properties.KeyFieldNames = 'Codigo'
    Properties.ListColumns = <
      item
        FieldName = 'Nome'
      end
      item
        HeaderAlignment = taCenter
        FieldName = 'Minutos'
      end
      item
        HeaderAlignment = taCenter
        FieldName = 'Valor'
      end>
    Properties.ListOptions.CaseInsensitive = True
    Properties.ListSource = Dados.dsTipoPass
    Properties.Revertable = True
    EditValue = 0
    Style.LookAndFeel.NativeStyle = False
    Style.PopupBorderStyle = epbsDefault
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 0
    Width = 261
  end
  object edQuant: TcxSpinEdit
    Left = 79
    Top = 48
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Value = 1
    Width = 73
  end
  object btnImprimir: TcxButton
    Left = 16
    Top = 143
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    Default = True
    TabOrder = 2
    OnClick = btnImprimirClick
  end
  object btnFechar: TcxButton
    Left = 104
    Top = 143
    Width = 75
    Height = 25
    Caption = '&Fechar'
    TabOrder = 3
    OnClick = btnFecharClick
  end
  object btnEditar: TcxButton
    Left = 208
    Top = 143
    Width = 161
    Height = 25
    Caption = 'Editar Formato de Impress'#227'o'
    TabOrder = 4
    OnClick = btnEditarClick
  end
  object rbInvalido: TcxRadioButton
    Left = 16
    Top = 80
    Width = 345
    Height = 17
    Caption = 
      'Gerar cart'#245'es inv'#225'lidos (precisam ser vendidos para permitir uso' +
      ')'
    Checked = True
    TabOrder = 5
    TabStop = True
  end
  object rbValido: TcxRadioButton
    Left = 16
    Top = 104
    Width = 353
    Height = 17
    Caption = 'Gerar cart'#245'es v'#225'lidos'
    TabOrder = 6
  end
  object btnGerar: TcxButton
    Left = 16
    Top = 184
    Width = 353
    Height = 41
    Caption = 
      '&Gerar c'#243'digos dos cart'#245'es em um arquivo externo'#13#10'(para impress'#227 +
      'o por gr'#225'ficas ou outros m'#233'todos)'
    Default = True
    TabOrder = 7
    OnClick = btnGerarClick
  end
  object tPass: TnxTable
    Database = Dados.db
    OnCalcFields = tPassCalcFields
    TableName = 'Passaporte'
    IndexName = 'INumero'
    Left = 320
    Top = 48
    object tPassNumero: TAutoIncField
      FieldName = 'Numero'
      Visible = False
    end
    object tPassTipoPass: TIntegerField
      FieldName = 'TipoPass'
    end
    object tPassCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tPassExpirou: TBooleanField
      FieldName = 'Expirou'
    end
    object tPassSenha: TStringField
      DisplayLabel = 'Password'
      FieldName = 'Senha'
    end
    object tPassPrimeiroUso: TDateTimeField
      FieldName = 'PrimeiroUso'
    end
    object tPassTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tPassTipoExp: TWordField
      FieldName = 'TipoExp'
    end
    object tPassExpirarEm: TDateTimeField
      FieldName = 'ExpirarEm'
    end
    object tPassMaxSegundos: TIntegerField
      FieldName = 'MaxSegundos'
    end
    object tPassSegundos: TIntegerField
      FieldName = 'Segundos'
    end
    object tPassAcessos: TIntegerField
      FieldName = 'Acessos'
    end
    object tPassDia1: TIntegerField
      FieldName = 'Dia1'
    end
    object tPassDia2: TIntegerField
      FieldName = 'Dia2'
    end
    object tPassDia3: TIntegerField
      FieldName = 'Dia3'
    end
    object tPassDia4: TIntegerField
      FieldName = 'Dia4'
    end
    object tPassDia5: TIntegerField
      FieldName = 'Dia5'
    end
    object tPassDia6: TIntegerField
      FieldName = 'Dia6'
    end
    object tPassDia7: TIntegerField
      FieldName = 'Dia7'
    end
    object tPassTransacao: TIntegerField
      FieldName = 'Transacao'
    end
    object tPassDataCompra: TDateTimeField
      FieldName = 'DataCompra'
    end
    object tPassMinutos: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Minutos'
      Calculated = True
    end
    object tPassValido: TBooleanField
      FieldName = 'Valido'
    end
    object tPassValor: TCurrencyField
      FieldName = 'Valor'
      DisplayFormat = '#.00'
    end
  end
  object dbPassaporte: TfrxDBDataset
    UserName = 'dbPassaporte'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Numero=Numero'
      'TipoPass=TipoPass'
      'Cliente=Cliente'
      'Expirou=Expirou'
      'Senha=Senha'
      'PrimeiroUso=PrimeiroUso'
      'TipoAcesso=TipoAcesso'
      'TipoExp=TipoExp'
      'ExpirarEm=ExpirarEm'
      'MaxSegundos=MaxSegundos'
      'Segundos=Segundos'
      'Acessos=Acessos'
      'Dia1=Dia1'
      'Dia2=Dia2'
      'Dia3=Dia3'
      'Dia4=Dia4'
      'Dia5=Dia5'
      'Dia6=Dia6'
      'Dia7=Dia7'
      'Transacao=Transacao'
      'DataCompra=DataCompra'
      'Minutos=Minutos'
      'Valido=Valido'
      'Valor=Valor')
    DataSet = tPass
    Left = 288
    Top = 48
  end
  object frxRichObject1: TfrxRichObject
    Left = 352
    Top = 8
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 320
    Top = 8
  end
  object frxCheckBoxObject1: TfrxCheckBoxObject
    Left = 256
    Top = 8
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 224
    Top = 8
  end
  object frxDialogControls1: TfrxDialogControls
    Left = 192
    Top = 8
  end
  object Designer: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    Restrictions = []
    RTLLanguage = False
    Left = 256
    Top = 48
  end
  object RP: TfrxReport
    Version = '3.18'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38205.610160335600000000
    ReportOptions.LastChange = 38671.896023101850000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 224
    Top = 48
    Datasets = <
      item
        DataSet = dbPassaporte
        DataSetName = 'dbPassaporte'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 209.385826771654000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Columns = 2
        ColumnWidth = 359.055118110236000000
        DataSet = dbPassaporte
        DataSetName = 'dbPassaporte'
        RowCount = 0
        object Shape1: TfrxShapeView
          Width = 359.055350000000000000
          Height = 209.007874020000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo4: TfrxMemoView
          Left = 11.338590000000000000
          Top = 9.984230000000000000
          Width = 183.716450000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'CART'#195#402'O DE ACESSO PR'#195#8240'-PAGO')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 71.811070000000000000
          Top = 143.622140000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = 'Valor'
          DataSet = dbPassaporte
          DataSetName = 'dbPassaporte'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dbPassaporte."Valor"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 15.118120000000000000
          Top = 143.622140000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Valor:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 15.118120000000000000
          Top = 170.078850000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Tempo:')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 71.811070000000000000
          Top = 170.078850000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataSet = dbPassaporte
          DataSetName = 'dbPassaporte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dbPassaporte."Minutos"] min.')
          ParentFont = False
        end
        object BarCode1: TfrxBarCodeView
          Left = 15.118120000000000000
          Top = 49.133889999999990000
          Width = 142.000000000000000000
          Height = 86.929190000000000000
          BarType = bcCode39
          CalcCheckSum = True
          Expression = '<dbPassaporte."Senha">'
          Rotation = 0
          Text = '12345678'
          Zoom = 1.000000000000000000
        end
        object Rich1: TfrxRichView
          Left = 219.212740000000000000
          Top = 11.338590000000000000
          Width = 128.504020000000000000
          Height = 185.196970000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6465
            666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C5C66636861
            7273657430205461686F6D613B7D7B5C66315C666E696C205461686F6D613B7D
            7D0D0A5C766965776B696E64345C7563315C706172645C716A5C625C66305C66
            73313620496E737472755C2765375C27663565733A5C62305C7061720D0A5C70
            61720D0A456D205C69206E6F6D65206465207573755C27653172696F205C6930
            20646967697465205C62205052455041474F5C6230202065206E612073656E68
            6120646967697465205C62205B64625061737361706F7274652E2253656E6861
            225D205C6230206520636C69717565206E6F20626F745C2765336F2022454E54
            524152222E205C7061720D0A5C7061720D0A4361736F2065786973746120756D
            206C6569746F7220646520635C2766336469676F206465206261727261732062
            617374612066617A65722061206C65697475726120646F20635C276633646967
            6F20696D70726573736F2E5C66315C7061720D0A7D0D0A00}
        end
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Background = False
    Creator = 'FastReport (http://www.fast-report.com)'
    HTMLTags = True
    Left = 256
    Top = 104
  end
  object frxMailExport1: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    Left = 304
    Top = 112
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 200
    Top = 112
  end
  object SaveDlg: TSaveDialog
    DefaultExt = 'TXT'
    FileName = 'cartoes.txt'
    Filter = 'Arquivo Texto|*.TXT'
    Left = 152
    Top = 104
  end
end
