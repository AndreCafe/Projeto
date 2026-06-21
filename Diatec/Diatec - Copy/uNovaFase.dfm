object FrmNovaFase: TFrmNovaFase
  Left = 0
  Top = 0
  Caption = 'Selecione a nova fase para esse apontamento'
  ClientHeight = 444
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    Bevel.Mode = bmEdge
    TabOrder = 0
    object btnOk: TcxButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Ok'
      Default = True
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancelar: TcxButton
      Left = 91
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object TreeFase: TcxDBTreeList
    Left = 0
    Top = 41
    Width = 624
    Height = 403
    Align = alClient
    Bands = <
      item
        Caption.AlignHorz = taCenter
      end>
    BufferedPaint = True
    DataController.DataSource = DM.dsFase
    DataController.ParentField = 'FasePai'
    DataController.KeyField = 'ID'
    DataController.StateIndexFieldName = 'IconIndex'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
    OptionsBehavior.DragCollapse = False
    OptionsBehavior.ExpandOnDblClick = False
    OptionsBehavior.ExpandOnIncSearch = True
    OptionsBehavior.IncSearchItem = cxDBTreeList1ID
    OptionsBehavior.ShowHourGlass = False
    OptionsBehavior.WaitForExpandNodeTime = 0
    OptionsBehavior.IncSearch = True
    OptionsCustomizing.BandCustomizing = False
    OptionsCustomizing.BandVertSizing = False
    OptionsCustomizing.ColumnCustomizing = False
    OptionsCustomizing.ColumnVertSizing = False
    OptionsData.CancelOnExit = False
    OptionsData.Editing = False
    OptionsData.CaseInsensitive = True
    OptionsData.Deleting = False
    OptionsSelection.CellSelect = False
    OptionsSelection.HideFocusRect = False
    OptionsView.CellTextMaxLineCount = -1
    OptionsView.ExtPaintStyle = True
    ParentColor = False
    Preview.AutoHeight = False
    Preview.MaxLineCount = 2
    RootValue = -1
    TabOrder = 1
    object cxDBTreeList1Cliente: TcxDBTreeListColumn
      PropertiesClassName = 'TcxMaskEditProperties'
      Properties.Alignment.Horz = taCenter
      Properties.MaxLength = 6
      Properties.ReadOnly = True
      Visible = False
      DataBinding.FieldName = 'Cliente'
      Position.ColIndex = 14
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1Projeto: TcxDBTreeListColumn
      PropertiesClassName = 'TcxMaskEditProperties'
      Properties.Alignment.Horz = taCenter
      Properties.MaxLength = 10
      Properties.ReadOnly = True
      Visible = False
      DataBinding.FieldName = 'Projeto'
      Position.ColIndex = 15
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1ID: TcxDBTreeListColumn
      PropertiesClassName = 'TcxMaskEditProperties'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.MaxLength = 12
      Properties.ReadOnly = True
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      DataBinding.FieldName = 'ID'
      Width = 117
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
    end
    object cxDBTreeList1Sync: TcxDBTreeListColumn
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.Alignment = taCenter
      Properties.Glyph.Data = {
        F6010000424DF601000000000000760000002800000030000000100000000100
        0400000000008001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99999FF
        FFFFFFFFFFFFFFFFFFFFFFFFFC0FFFFFFFFFFFF999999999FFFFFFFFFFC0FFFF
        FFFFFFFFCCC0FFFFFFFFFF99FFFFFF999FFFFFFFFCCC0FFFFFFFFFFFCCC0FFFF
        FFFFF9999FFFFFF999FFFFFFFCCC0FFFFFFFFFFCCCCC0FFFFFFFF9F999FFFFFF
        99FFFFFFCCCCC0FFFFFFFFCCCCCC0FFFFFFF99FF999FFFFFF99FFFFCCCCCC0FF
        FFFFF7CC0FCCC0FFFFFF99FFF999FFFFF99FFF7CC0FCCC0FFFFF7C0FFFFCC0FF
        FFFF99FFFF999FFFF99FF7C0FFFFCC0FFFFFFFFFFFFCCC0FFFFF99FFFFF999FF
        F99FFFFFFFFFCCC0FFFFFFFFFFFFCC0FFFFF99FFFFFF999FF99FFFFFFFFFFCC0
        FFFFFFFFFFFFFCC0FFFFF99FFFFFF999F9FFFFFFFFFFFFCC0FFFFFFFFFFFFF7C
        0FFFF999FFFFFF9999FFFFFFFFFFFFF7C0FFFFFFFFFFFFF7C0FFFF999FFFFFF9
        9FFFFFFFFFFFFFFF7C0FFFFFFFFFFFFFFCCFFFF999999999FFFFFFFFFFFFFFFF
        FFCCFFFFFFFFFFFFFFFFFFFFF99999FFFFFFFFFFFFFFFFFFFFFF}
      Properties.GlyphCount = 3
      Properties.NullStyle = nssUnchecked
      Properties.ReadOnly = True
      Properties.ValueChecked = 'True'
      Properties.ValueGrayed = ''
      Properties.ValueUnchecked = 'False'
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      DataBinding.FieldName = 'Sync'
      Width = 56
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1HR: TcxDBTreeListColumn
      PropertiesClassName = 'TcxMaskEditProperties'
      Properties.Alignment.Horz = taCenter
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = 'H.R.'
      DataBinding.FieldName = 'HR'
      Width = 54
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1Nome: TcxDBTreeListColumn
      PropertiesClassName = 'TcxMaskEditProperties'
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaxLength = 50
      Properties.ReadOnly = True
      DataBinding.FieldName = 'Nome'
      Width = 116
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1Inicio: TcxDBTreeListColumn
      PropertiesClassName = 'TcxDateEditProperties'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.DateButtons = [btnClear, btnToday]
      Properties.DateOnError = deToday
      Properties.InputKind = ikRegExpr
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = 'Inicio Prev'
      DataBinding.FieldName = 'Inicio'
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1DatReI: TcxDBTreeListColumn
      PropertiesClassName = 'TcxMaskEditProperties'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = 'Inicio Real'
      DataBinding.FieldName = 'DatReI'
      Position.ColIndex = 5
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1Termino: TcxDBTreeListColumn
      PropertiesClassName = 'TcxDateEditProperties'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.DateButtons = [btnClear, btnToday]
      Properties.DateOnError = deToday
      Properties.InputKind = ikRegExpr
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = 'T'#233'rmino Prev'
      DataBinding.FieldName = 'Termino'
      Position.ColIndex = 6
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1DatReF: TcxDBTreeListColumn
      PropertiesClassName = 'TcxMaskEditProperties'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = 'T'#233'rmino Real'
      DataBinding.FieldName = 'DatReF'
      Position.ColIndex = 7
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1Horas: TcxDBTreeListColumn
      PropertiesClassName = 'TcxMaskEditProperties'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      DataBinding.FieldName = 'Horas'
      Width = 51
      Position.ColIndex = 8
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1PercEst: TcxDBTreeListColumn
      PropertiesClassName = 'TcxMaskEditProperties'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = 'P.Estimado'
      DataBinding.FieldName = 'PercEst'
      Width = 74
      Position.ColIndex = 9
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1PercRealizado: TcxDBTreeListColumn
      PropertiesClassName = 'TcxTextEditProperties'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = 'P.Realizado'
      DataBinding.FieldName = 'PercRealizado'
      Width = 78
      Position.ColIndex = 10
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1IDRetag: TcxDBTreeListColumn
      PropertiesClassName = 'TcxMaskEditProperties'
      Properties.Alignment.Horz = taRightJustify
      Properties.MaxLength = 20
      Properties.ReadOnly = True
      Visible = False
      DataBinding.FieldName = 'IDRetag'
      Position.ColIndex = 16
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object TreeFaseSumario: TcxDBTreeListColumn
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.Alignment = taRightJustify
      Properties.NullStyle = nssUnchecked
      Properties.ReadOnly = True
      Properties.ValueChecked = 'True'
      Properties.ValueGrayed = ''
      Properties.ValueUnchecked = 'False'
      Visible = False
      DataBinding.FieldName = 'Sumario'
      Position.ColIndex = 11
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1FasePai: TcxDBTreeListColumn
      PropertiesClassName = 'TcxMaskEditProperties'
      Properties.Alignment.Horz = taRightJustify
      Properties.MaxLength = 12
      Properties.ReadOnly = True
      Visible = False
      DataBinding.FieldName = 'FasePai'
      Position.ColIndex = 13
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeList1DataVld: TcxDBTreeListColumn
      PropertiesClassName = 'TcxMaskEditProperties'
      Properties.Alignment.Horz = taRightJustify
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      Caption.Text = 'Validado em'
      DataBinding.FieldName = 'DataVld'
      Position.ColIndex = 12
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
end
