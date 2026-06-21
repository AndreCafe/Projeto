inherited fbLog: TfbLog
  Left = 278
  Top = 118
  Caption = 'Log'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 398
      Height = 244
      Align = alClient
      TabOrder = 0
      object tvLog: TcxGridDBTableView
        DataController.DataModeController.GridMode = True
        DataController.DataSource = DM.dsLog
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.Filter.SupportedLike = False
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'Valor'
          end
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'ValorPago'
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Insert.Visible = False
        NavigatorButtons.Delete.Enabled = False
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Edit.Enabled = False
        NavigatorButtons.Edit.Visible = False
        NavigatorButtons.Post.Visible = False
        NavigatorButtons.Cancel.Enabled = False
        NavigatorButtons.Cancel.Visible = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.Navigator = True
        OptionsView.Footer = True
        OptionsView.Indicator = True
        OptionsView.NewItemRowInfoText = 'Clique aqui para adicionar um novo item'
        Styles.StyleSheet = FrmPri.GridTableViewStyleSheetDevExpress
        object tvLogNum: TcxGridDBColumn
          SortOrder = soAscending
          Width = 67
          DataBinding.FieldName = 'Num'
        end
        object tvLogOperacao: TcxGridDBColumn
          Caption = 'Opera'#231#227'o'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <
            item
              Description = 'Obtem Licen'#231'a'
              Value = 1
            end
            item
              Description = 'Obtem Cadastro'
              Value = 2
            end
            item
              Description = 'Modo Demo'
              Value = 3
            end
            item
              Description = 'Troca HD'
              Value = 4
            end
            item
              Description = 'Teste Gratu'#237'to'
              Value = 5
            end
            item
              Description = 'Atualiza Cadastro'
              Tag = 6
              Value = 6
            end>
          Width = 168
          DataBinding.FieldName = 'OperID'
        end
        object tvLogDataHora: TcxGridDBColumn
          Caption = 'Data/Hora'
          DataBinding.FieldName = 'DataHora'
        end
        object tvLogLoja: TcxGridDBColumn
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'Loja'
        end
        object tvLogNomeLoja: TcxGridDBColumn
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownSizeable = True
          Properties.GridMode = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Codigo'
          Properties.ListColumns = <
            item
              FieldName = 'Loja'
            end>
          Properties.ListOptions.CaseInsensitive = True
          Properties.Revertable = True
          Width = 177
          DataBinding.FieldName = 'NomeLoja'
        end
        object tvLogOk: TcxGridDBColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = 'Ok'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 44
          DataBinding.FieldName = 'OK'
        end
        object tvLogHD: TcxGridDBColumn
          Caption = 'HD'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Vert = taVCenter
          Width = 155
          DataBinding.FieldName = 'SerieHD'
        end
        object tvLogDetalhes: TcxGridDBColumn
          PropertiesClassName = 'TcxMemoProperties'
          Properties.AutoSelect = True
          Width = 213
          DataBinding.FieldName = 'Detalhes'
        end
        object tvLogIP: TcxGridDBColumn
          Width = 129
          DataBinding.FieldName = 'IP'
        end
      end
      object glLog: TcxGridLevel
        GridView = tvLog
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      0
      26
      0)
  end
end
