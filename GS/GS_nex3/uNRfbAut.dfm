inherited fbAut: TfbAut
  Caption = 'fbAut'
  ClientHeight = 412
  ClientWidth = 692
  ExplicitWidth = 708
  ExplicitHeight = 448
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Width = 692
    Height = 412
    ExplicitWidth = 692
    ExplicitHeight = 412
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 692
      Height = 60
      ExplicitWidth = 692
      ExplicitHeight = 60
    end
    object Grid: TcxGrid
      Left = 0
      Top = 157
      Width = 692
      Height = 255
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object TV: TcxGridDBTableView
        OnDblClick = cmEditarClick
        NavigatorButtons.ConfirmDelete = False
        DataController.DataModeController.GridMode = True
        DataController.DataSource = dsTab
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.Navigator = True
        OptionsView.Indicator = True
        object TVEnviouCli: TcxGridDBColumn
          Caption = 'Enviou'
          DataBinding.FieldName = 'EnviouCli'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = 'N'#227'o'
              ImageIndex = 0
              Value = False
            end
            item
              Description = 'Sim'
              Value = True
            end>
          OnCustomDrawCell = TVEnviouCliCustomDrawCell
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Focusing = False
          Width = 56
        end
        object TVAtiva: TcxGridDBColumn
          DataBinding.FieldName = 'Ativa'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = 'N'#227'o'
              ImageIndex = 0
              Value = False
            end
            item
              Description = 'Sim'
              Value = True
            end>
          OnCustomDrawCell = TVAtivaCustomDrawCell
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Focusing = False
          Width = 49
        end
        object TVPrograma: TcxGridDBColumn
          Caption = 'Prog'
          DataBinding.FieldName = 'Programa'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = 'Cyber'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = 'NEX'
              Value = 1
            end>
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Focusing = False
          Width = 45
        end
        object TVTipo: TcxGridDBColumn
          DataBinding.FieldName = 'Tipo'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <
            item
              Description = 'Tempor'#225'ria'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = 'Definitiva'
              Value = 2
            end
            item
              Description = 'Teste Gratu'#237'to'
              Value = 3
            end
            item
              Description = 'Loca'#231#227'o'
              Value = 4
            end
            item
              Description = 'Free/Premium'
              Value = 5
            end>
          Options.Focusing = False
          Width = 79
        end
        object TVMaquinas: TcxGridDBColumn
          Caption = 'Maq'
          DataBinding.FieldName = 'Maquinas'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Focusing = False
          Width = 44
        end
        object TVVencimento: TcxGridDBColumn
          DataBinding.FieldName = 'Vencimento'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Focusing = False
          Width = 81
        end
        object TVNomeLoja: TcxGridDBColumn
          DataBinding.FieldName = 'NomeLoja'
          Options.Focusing = False
          Width = 171
        end
        object TVAutorizacao: TcxGridDBColumn
          Caption = 'Autoriza'#231#227'o'
          DataBinding.FieldName = 'Autorizacao'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
        end
        object TVCodigoEquip: TcxGridDBColumn
          Caption = 'Serial HD/Cod. Equip.'
          DataBinding.FieldName = 'CodigoEquip'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 177
        end
        object TVCriadaEm: TcxGridDBColumn
          Caption = 'Criada Em'
          DataBinding.FieldName = 'CriadaEm'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ImmediatePost = True
          Options.Focusing = False
          Width = 107
        end
        object TVCriadaPor: TcxGridDBColumn
          Caption = 'Criada Por'
          DataBinding.FieldName = 'CriadaPor'
          Options.Focusing = False
          Width = 74
        end
        object TVInativadaEm: TcxGridDBColumn
          Caption = 'Inativada Em'
          DataBinding.FieldName = 'InativadaEm'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ImmediatePost = True
          Options.Focusing = False
          Width = 107
        end
        object TVInativadaPor: TcxGridDBColumn
          Caption = 'Inativada Por'
          DataBinding.FieldName = 'InativadaPor'
          Options.Focusing = False
          Width = 88
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
    object LMDSimplePanel1: TLMDSimplePanel
      Left = 0
      Top = 60
      Width = 692
      Height = 97
      Align = alTop
      Bevel.BorderSides = [fsBottom, fsLeft, fsRight]
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      TabOrder = 1
      object Paginas: TcxPageControl
        Left = 72
        Top = 0
        Width = 620
        Height = 97
        ActivePage = cxTabSheet2
        Align = alClient
        TabOrder = 0
        ClientRectBottom = 97
        ClientRectRight = 620
        ClientRectTop = 24
        object cxTabSheet1: TcxTabSheet
          Caption = 'N'#227'o Enviadas'
          ImageIndex = 0
          object cxLabel1: TcxLabel
            Left = 6
            Top = 16
            Caption = 'Mostrar licen'#231'as que ainda n'#227'o foram enviadas para o cliente'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -16
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
        end
        object cxTabSheet2: TcxTabSheet
          Caption = 'Expirar'
          ImageIndex = 1
          object rgVencRecentes: TcxRadioButton
            Left = 6
            Top = 10
            Width = 339
            Height = 17
            Caption = 'Licen'#231'as vencidas recentemente ou vencendo nos pr'#243'ximos dias '
            Checked = True
            TabOrder = 0
            TabStop = True
            LookAndFeel.Kind = lfFlat
          end
          object edVencI: TcxDateEdit
            Left = 216
            Top = 37
            EditValue = 39069d
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.BorderStyle = ebsFlat
            TabOrder = 1
            Width = 86
          end
          object cxLabel2: TcxLabel
            Left = 310
            Top = 39
            Caption = 'a'
          end
          object edVencF: TcxDateEdit
            Left = 326
            Top = 37
            EditValue = 39069d
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.BorderStyle = ebsFlat
            TabOrder = 3
            Width = 86
          end
          object edProxVenc: TcxSpinEdit
            Left = 347
            Top = 8
            Properties.ImmediatePost = True
            Style.BorderStyle = ebsFlat
            TabOrder = 4
            Value = 3
            Width = 65
          end
          object rgDataVenc: TcxRadioButton
            Left = 6
            Top = 39
            Width = 205
            Height = 17
            Caption = 'Por data de vencimento da licen'#231'a. De'
            TabOrder = 5
            LookAndFeel.Kind = lfFlat
          end
        end
        object cxTabSheet3: TcxTabSheet
          Caption = 'Serial HD / Cod.Equip'
          ImageIndex = 2
          object cxLabel3: TcxLabel
            Left = 6
            Top = 4
            Caption = 'N'#250'mero de S'#233'rie / Cod. Equipamento'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object edHD: TcxTextEdit
            Left = 6
            Top = 27
            ParentFont = False
            Style.BorderStyle = ebsFlat
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Width = 227
          end
          object rbBuscaExata: TcxRadioButton
            Left = 253
            Top = 24
            Width = 84
            Height = 17
            Caption = 'Exata'
            TabOrder = 2
            OnClick = rbAtivasClick
            LookAndFeel.Kind = lfFlat
          end
          object rbBuscaAprox: TcxRadioButton
            Left = 253
            Top = 40
            Width = 84
            Height = 17
            Caption = 'Aproximada'
            TabOrder = 3
            OnClick = rbAtivasClick
            LookAndFeel.Kind = lfFlat
          end
          object cxLabel5: TcxLabel
            Left = 253
            Top = 4
            Caption = 'Tipo de Busca'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
        end
        object cxTabSheet4: TcxTabSheet
          Caption = 'Todas'
          ImageIndex = 3
          object cxLabel4: TcxLabel
            Left = 6
            Top = 16
            Caption = 'Todas licen'#231'as'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -16
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object rbAtivas: TcxRadioButton
            Left = 118
            Top = 21
            Width = 59
            Height = 17
            Caption = 'Ativas'
            Checked = True
            TabOrder = 1
            TabStop = True
            OnClick = rbAtivasClick
            LookAndFeel.Kind = lfFlat
          end
          object rbInativas: TcxRadioButton
            Left = 177
            Top = 21
            Width = 59
            Height = 17
            Caption = 'Inativas'
            TabOrder = 2
            OnClick = rbAtivasClick
            LookAndFeel.Kind = lfFlat
          end
          object rbTodas: TcxRadioButton
            Left = 247
            Top = 21
            Width = 107
            Height = 17
            Caption = 'Ativas E Inativas'
            TabOrder = 3
            OnClick = rbAtivasClick
            LookAndFeel.Kind = lfFlat
          end
        end
      end
      object LMDSimplePanel2: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 72
        Height = 97
        Align = alLeft
        Bevel.Mode = bmEdge
        TabOrder = 1
        object btnEncontrar: TPngSpeedButton
          Left = 2
          Top = 2
          Width = 68
          Height = 93
          Align = alClient
          Caption = '&Encontrar'
          Flat = True
          Layout = blGlyphTop
          Spacing = 0
          OnClick = btnEncontrarClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F80000002D744558744372656174696F6E2054696D65006A65752E20352064E9
            632E20323030322031323A32313A3130202B30313030603BD286000000077449
            4D45000000000000000973942E000000097048597300000AF000000AF00142AC
            3498000004454944415478DAED546B4C9B65183D6D69E9455B4A8B4087ED0A94
            E188355822E1B21250278680192112652626841FCA626630D31013E5C72461D1
            2CD94CC86604D90F939119244288612C0C46C1D9C555B6768361050AD2D25684
            F2B5F482CFF7A54BC81C2331D91FE39B9C7CED7B39E7B9BCEFE1E1310FDE7F5F
            A0AAAA2A213939D9CCE3F1623D3D3D5334B54588FE1B013E619BFDD1DCDC9CE2
            F3F9F243A190716B6BEB759A2A100804080683D37EBF7FD8ED769F713A9DAEB8
            D8F623052A2A2AC41919195F8AC5E2FA8D8D0D7752525250A5521D904AA57C89
            4482C4C444D01A28030ECBCBCB181919712F2D2D9D9A9E9EEE228E3542645781
            EAEAEA2F6432D9FB2C199503696969080402601806143D280B84C3618E9CCFE7
            73DF582C86A9A9294C4E4E5EA78CDA289B51E2DA24C4FE21505959E9A428754D
            4D4D484F4F472412614BC17D5D2E172852783C1EACAEAE725F5690DDA7D7EB39
            C1D9D9D9A8C562E9A5204E2D2C2CD88933B8B36CBCB2B2328742A138D0D0D0C0
            91984C2650FD31303000AD560BABD50AAFD70B2A1B8442212862D4D5D5A1BEBE
            1E54468EC46EBF8DF6F6CF18614242F74DDBAF67ADD61BF7EEF787979F9FFFAE
            48243AD3D5D5C59F9999C1DCDC1C6C361B5A5A5A909797C71174767662E2DA38
            341A0DBC3E3FA857686D6D05F58B7A24C4777D9711E629108A4471FBFA0F6E8B
            65FC2D87C361A1A31BEC2D52E4E4E41CA3DA7F52545424B4DBED686C6C844EA7
            434A8A1A3E8ABEAF7F14119E04EEE5592C3A6F414B6B35353550C8E59877F9A0
            D96F44417E061602C095311B2EB4BF3338363EF129714FB30202426A7676F651
            AA6B9B52A91473871572A855C998BCE142797929D49A34B8183ECE9F6C817771
            16AF1DA985549C0846928DE2B20208A8BD1E6AF322E1EBF75E760F0C0D7F4CBC
            FDF7DF4102419D9999594F38495757F614452F14CA906AAC84292F19013AB8C4
            0053D72CE83F7B02F224155E2A3743945787FD595AF0A9AD1B61C01788A0F7C3
            C37F0C0D5F39479CDD3B1F1A9B899A1A5B9D9B9BDB515A52A294A518F05CD51B
            90D1130C53847F52DB7E7338F0D547B53F7BBCFEBB2F969B8F18CADF96A4995E
            052F1A05130A23FABB05E7DA9A46EECCDC1B23BE6F1EB40A564449F5AF361A9F
            3DFD7C71A55C5FD30C1145B74D580F5109462FE07CC707DFAEACB8E7295BE650
            E9A113FB5E382A153CA9813CB68289BECF038343C317E93AB3B6F2FDC3BC88B5
            0CA5C160A8359B4B4EEF331F934AD53A44A31188427FE16AF7F1F5C1A11F2F46
            A3D161DA673B78F019B3F6E98CE34A853CCB393F3F73D376EBA7CDCD4DD64606
            08BFEC66769C486161E19B997A7D47AAA1582CA6EB78D73A18BA3C72B5776D6D
            CD49EB970877083282916022A8081E82951527F81FE5A6AC888AEEFE2B4FC864
            879960504826B74EA97B699EADEF244B10374C562489904808C5E739EBD8CBAE
            05F18359045DDC02E6097371929DB6BD936BFB6193BB0D768F982089FF671EF4
            9BBD0E3FD6F1BFC09EE36F7076B7AE4F32B2880000000049454E44AE426082}
          ExplicitLeft = 1
          ExplicitTop = 0
          ExplicitHeight = 91
        end
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = FrmPri.im32
    Left = 272
    Top = 224
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          Visible = True
          ItemName = 'cmAtualizar'
        end
        item
          Visible = True
          ItemName = 'cmLayout'
        end>
    end
    inherited cmNovo: TdxBarLargeButton
      GlyphLayout = glTop
      ShowCaption = True
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      OnClick = cmEditarClick
      GlyphLayout = glTop
      ShowCaption = True
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmAtualizar: TdxBarLargeButton
      GlyphLayout = glTop
    end
    inherited cmLayout: TdxBarLargeButton
      LargeImageIndex = 17
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 40
    Top = 209
  end
  inherited CP: TdxComponentPrinter
    Top = 154
  end
  inherited pmLay: TdxBarPopupMenu
    Top = 218
  end
  object Tab: TnxTable
    Database = DM.nxDB
    OnCalcFields = TabCalcFields
    TableName = 'Autorizacao'
    IndexName = 'IID'
    Left = 88
    Top = 216
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabPrograma: TWordField
      FieldName = 'Programa'
    end
    object TabLoja: TIntegerField
      FieldName = 'Loja'
    end
    object TabAutorizacao: TStringField
      FieldName = 'Autorizacao'
      Size = 30
    end
    object TabVencimento: TDateField
      FieldName = 'Vencimento'
    end
    object TabCodigoEquip: TStringField
      FieldName = 'CodigoEquip'
      Size = 30
    end
    object TabMaquinas: TWordField
      FieldName = 'Maquinas'
    end
    object TabTipo: TWordField
      Alignment = taLeftJustify
      FieldName = 'Tipo'
    end
    object TabCriadaEm: TDateTimeField
      FieldName = 'CriadaEm'
    end
    object TabCriadaPor: TStringField
      FieldName = 'CriadaPor'
      Size = 30
    end
    object TabInativadaEm: TDateTimeField
      FieldName = 'InativadaEm'
    end
    object TabInativadaPor: TStringField
      FieldName = 'InativadaPor'
      Size = 30
    end
    object TabAtiva: TBooleanField
      FieldName = 'Ativa'
    end
    object TabObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabGerar: TBooleanField
      FieldName = 'Gerar'
    end
    object TabEnviouCli: TBooleanField
      FieldName = 'EnviouCli'
    end
    object TabNomeLoja: TStringField
      DisplayLabel = 'Loja'
      FieldKind = fkLookup
      FieldName = 'NomeLoja'
      LookupDataSet = DM.tCli
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Loja'
      KeyFields = 'Loja'
      Size = 50
      Lookup = True
    end
    object TabCodLoja: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CodLoja'
      Calculated = True
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 128
    Top = 232
  end
end
