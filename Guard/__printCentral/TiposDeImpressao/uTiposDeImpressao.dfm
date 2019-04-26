object FormTipoDeImpressao: TFormTipoDeImpressao
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FormTipoDeImpressao'
  ClientHeight = 600
  ClientWidth = 822
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    822
    600)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 17
    Top = 8
    Width = 88
    Height = 13
    Caption = 'Tipos de Impres'#227'o'
  end
  object Label1: TLabel
    Left = 17
    Top = 237
    Width = 91
    Height = 13
    Caption = 'Impressora padr'#227'o'
  end
  object cxButtonCriar: TcxButton
    Left = 527
    Top = 27
    Width = 168
    Height = 62
    Caption = 'Criar novo tipo de impress'#227'o'
    TabOrder = 0
    WordWrap = True
    OnClick = cxButtonCriarClick
  end
  object cxQUITESCROTO: TcxButton
    Left = 709
    Top = 207
    Width = 105
    Height = 28
    Anchors = [akTop, akRight]
    Caption = 'QUIT ESCROTO'
    TabOrder = 1
    WordWrap = True
    OnClick = cxQUITESCROTOClick
  end
  object cxGrid1: TcxGrid
    Left = 17
    Top = 27
    Width = 496
    Height = 200
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnCellClick = cxGrid1DBTableView1CellClick
      DataController.DataSource = dmTipodeImpressao.dsTableTipoImp
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.HideSelection = True
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1ID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        HeaderAlignmentHorz = taCenter
        Width = 30
      end
      object cxGrid1DBTableView1Nome: TcxGridDBColumn
        DataBinding.FieldName = 'Nome'
        HeaderAlignmentHorz = taCenter
        Width = 192
      end
      object cxGrid1DBTableView1Impressora: TcxGridDBColumn
        DataBinding.FieldName = 'Impressora'
        HeaderAlignmentHorz = taCenter
        Width = 212
      end
      object cxGrid1DBTableView1Valor: TcxGridDBColumn
        DataBinding.FieldName = 'Valor'
        HeaderAlignmentHorz = taCenter
        Width = 60
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxButtonAgapar: TcxButton
    Left = 527
    Top = 95
    Width = 168
    Height = 28
    Caption = 'Agapar'
    TabOrder = 3
    WordWrap = True
    OnClick = cxButtonAgaparClick
  end
  object cxButtonModificar: TcxButton
    Left = 527
    Top = 129
    Width = 168
    Height = 62
    Caption = 'Modificar tipo de impress'#227'o'
    TabOrder = 4
    WordWrap = True
    OnClick = cxButtonModificarClick
  end
  object cxButtonJson: TcxButton
    Left = 527
    Top = 197
    Width = 168
    Height = 28
    Caption = 'JSON'
    TabOrder = 5
    WordWrap = True
    OnClick = cxButtonJsonClick
  end
  object Memo1: TMemo
    Left = 17
    Top = 260
    Width = 496
    Height = 317
    Anchors = [akLeft, akTop, akBottom]
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object cxLookupComboBox1: TcxLookupComboBox
    Left = 114
    Top = 233
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        FieldName = 'Nome'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dmTipodeImpressao.dsTableTipoImp
    EditValue = 0
    TabOrder = 7
    Width = 399
  end
end
