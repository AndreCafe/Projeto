object FrmImpPrePagoValido: TFrmImpPrePagoValido
  Left = 225
  Top = 234
  BorderStyle = bsDialog
  Caption = 'Imprimir Cart'#245'es Pr'#233'-Pagos'
  ClientHeight = 190
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
    Width = 261
    Height = 21
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
    TabOrder = 0
  end
  object edQuant: TcxSpinEdit
    Left = 79
    Top = 48
    Width = 73
    Height = 21
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Value = 1
  end
  object btnImprimir: TcxButton
    Left = 16
    Top = 145
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    Default = True
    TabOrder = 2
    OnClick = btnImprimirClick
  end
  object btnFechar: TcxButton
    Left = 104
    Top = 145
    Width = 75
    Height = 25
    Caption = '&Fechar'
    TabOrder = 3
    OnClick = btnFecharClick
  end
  object btnEditar: TcxButton
    Left = 208
    Top = 145
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
  object RP: TfrReport
    Dataset = dbPassaporte
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    Left = 224
    Top = 48
    ReportForm = {
      190000003E0700001900000000130065446F635072696E746572205044462050
      726F00FFFFFFFFFF09000000340800009A0B0000240000002400000024000000
      2400000000FFFF00000000FFFF000000000000000000000000030400466F726D
      000F0000FFDC000000780000007C0100002C010000040000000200E80000000B
      004D617374657244617461310002010000000024000000F50200009000000030
      00050001000000000000000000FFFFFF1F000000000C0064625061737361706F
      72746500000000000000FFFF0000000000020000000100000000000000020000
      0056010000000000000100000000000002004D010000050042616E6431000201
      00000000E0FFFFFFF5020000140000003000020001000000000000000000FFFF
      FF1F00000000000000000000000000FFFF000000000002000000010000000000
      000001000000C800000014000000010000000000000A0C005466725368617065
      566965770000AD01000006005368617065310002002400000024000000560100
      00900000000100000001000000000000000000FFFFFF1F2C0200000000000000
      00000000FFFF00000000000200000001000000000000003A02000005004D656D
      6F31000200A20000006D000000C8000000140000000300000001000000000000
      000000FFFFFF1F2C02000000000001000F005B74506173732E2253656E686122
      5D00000000FFFF00000000000200000001000000000500417269616C000A0000
      00020000000000080000000100020000000000FFFFFF00000000020000000000
      00000000C802000005004D656D6F3300020032000000550000006C0000001400
      00000300000001000000000000000000FFFFFF1F2C020000000000010010004E
      6F6D6520646520557375E172696F3A00000000FFFF0000000000020000000100
      0000000500417269616C000A0000000000000000000900000001000200000000
      00FFFFFF0000000002000000000000000A0B0054667252696368566965770000
      1504000005005269636831000200320000009100000038010000140000000100
      000001000000000000000000FFFFFF1F2C020000000000000000000000FFFF00
      0000000002000000010000000001150400007B5C727466315C616E73695C616E
      7369637067313235325C64656666305C6465666C616E67313034367B5C666F6E
      7474626C7B5C66305C666E696C5C66636861727365743020417269616C3B7D7B
      5C66315C666E696C204D532053616E732053657269663B7D7D0D0A7B5C636F6C
      6F7274626C203B5C726564305C677265656E305C626C7565303B7D0D0A5C7669
      65776B696E64345C7563315C706172645C6366315C66733230205B7450617373
      2E2256616C6F72225D202D205B74506173732E224D696E75746F73225D5C6220
      205C6230206D696E2E5C66315C66733136200D0A5C706172207D0D0A000000BB
      04000005004D656D6F34000200300000002F0000003C01000010000000030000
      0001000000000000000000FFFFFF1F2C020000000000010028004E6F6D652064
      61204C6F6A61202D2043617274E36F2064652041636573736F205072E92D5061
      676F00000000FFFF00000000000200000001000000000500417269616C000A00
      0000020000000000020000000100020000000000FFFFFF000000000200000000
      00000000004005000005004D656D6F35000200A2000000550000006000000014
      0000000300000001000000000000000000FFFFFF1F2C02000000000001000700
      5052455041474F00000000FFFF00000000000200000001000000000500417269
      616C000A000000020000000000080000000100020000000000FFFFFF00000000
      02000000000000000000C405000005004D656D6F36000200320000006D000000
      6C000000140000000300000001000000000000000000FFFFFF1F2C0200000000
      000100060053656E68613A00000000FFFF000000000002000000010000000005
      00417269616C000A000000000000000000080000000100020000000000FFFFFF
      000000000200000000000000FEFEFF0000000012000000050074506173730000
      00000D0074506173732E41636573736F73000000000D0074506173732E436C69
      656E7465000000000A0074506173732E44696131000000000A0074506173732E
      44696132000000000A0074506173732E44696133000000000A0074506173732E
      44696134000000000A0074506173732E44696135000000000A0074506173732E
      44696136000000000A0074506173732E44696137000000000D0074506173732E
      45787069726F7500000000110074506173732E4D6178536567756E646F730000
      0000110074506173732E5072696D6569726F55736F000000000E007450617373
      2E536567756E646F7300000000100074506173732E5469706F41636573736F00
      0000000D0074506173732E5469706F457870000000000E0074506173732E5469
      706F50617373000000000F0074506173732E5472616E736163616F0000000000
      000000FC000000000000000000000000000000005800DEF76E86B3A7E24041AA
      620F5CB6E240}
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
      OnGetText = tPassValorGetText
    end
  end
  object dbPassaporte: TfrDBDataSet
    DataSet = tPass
    Left = 288
    Top = 48
  end
  object frnxComponents1: TfrnxComponents
    Left = 192
    Top = 48
  end
  object frRichObject1: TfrRichObject
    Left = 352
    Top = 8
  end
  object frBarCodeObject1: TfrBarCodeObject
    Left = 320
    Top = 8
  end
  object frShapeObject1: TfrShapeObject
    Left = 288
    Top = 8
  end
  object frCheckBoxObject1: TfrCheckBoxObject
    Left = 256
    Top = 8
  end
  object frCrossObject1: TfrCrossObject
    Left = 224
    Top = 8
  end
  object frDialogControls1: TfrDialogControls
    Left = 192
    Top = 8
  end
  object Designer: TfrDesigner
    Left = 256
    Top = 48
  end
end
