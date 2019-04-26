object FormPrintGuard: TFormPrintGuard
  Left = 0
  Top = 0
  Caption = ' printGuard'
  ClientHeight = 320
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    671
    320)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 27
    Width = 457
    Height = 285
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = dmPrintGuard.dsTablePrintList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1datahora: TcxGridDBColumn
        Caption = 'Hora'
        DataBinding.FieldName = 'datahora'
        HeaderAlignmentHorz = taCenter
        SortIndex = 0
        SortOrder = soDescending
        Width = 136
      end
      object cxGrid1DBTableView1maquina: TcxGridDBColumn
        Caption = 'M'#225'quina'
        DataBinding.FieldName = 'maquina'
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object cxGrid1DBTableView1paginas: TcxGridDBColumn
        Caption = 'P'#225'ginas'
        DataBinding.FieldName = 'paginas'
        HeaderAlignmentHorz = taCenter
        Width = 81
      end
      object cxGrid1DBTableView1IDPrinter: TcxGridDBColumn
        DataBinding.FieldName = 'IDPrinter'
        Width = 44
      end
      object cxGrid1DBTableView1TipoImpressao: TcxGridDBColumn
        Caption = 'Tipo de Impress'#227'o'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        OnCustomDrawCell = cxGrid1DBTableView1TipoImpressaoCustomDrawCell
        OnGetDataText = cxGrid1DBTableView1TipoImpressaoGetDataText
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 168
      end
      object cxGrid1DBTableView1id: TcxGridDBColumn
        DataBinding.FieldName = 'id'
        Visible = False
      end
      object cxGrid1DBTableView1FileName: TcxGridDBColumn
        DataBinding.FieldName = 'FileName'
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxButtonImprimir: TcxButton
    Left = 471
    Top = 48
    Width = 192
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 1
    OnClick = cxButtonImprimirClick
  end
end
