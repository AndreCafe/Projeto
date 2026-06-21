object Form1: TForm1
  Left = 192
  Top = 133
  Width = 544
  Height = 375
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
  object dxDBGrid1: TdxDBGrid
    Left = 0
    Top = 41
    Width = 536
    Height = 307
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'Numero'
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alClient
    TabOrder = 0
    DataSource = FFEngineManager1.DataSource1
    object dxDBGrid1Telefone: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Telefone'
    end
    object dxDBGrid1EspLogradouro: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'EspLogradouro'
    end
    object dxDBGrid1Logradouro: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Logradouro'
    end
    object dxDBGrid1Numero: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Numero'
    end
    object dxDBGrid1Complemento: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Complemento'
    end
    object dxDBGrid1Zona: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Zona'
    end
    object dxDBGrid1Nome: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Nome'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 41
    Align = alTop
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 24
      Top = 8
      Width = 240
      Height = 25
      DataSource = FFEngineManager1.DataSource1
      TabOrder = 0
    end
  end
end
