object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Redirs Stats!'
  ClientHeight = 591
  ClientWidth = 1075
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 1075
    Height = 65
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 0
    object lbCalc: TLabel
      Left = 858
      Top = 16
      Width = 169
      Height = 13
      Alignment = taCenter
      Caption = 'Preparando dados. Aguarde ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 373
      Top = 4
      Width = 16
      Height = 29
      Caption = 'A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 444
      Top = 3
      Width = 16
      Height = 29
      Caption = 'B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 515
      Top = 3
      Width = 16
      Height = 29
      Caption = 'C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 586
      Top = 3
      Width = 18
      Height = 29
      Caption = 'D'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 657
      Top = 3
      Width = 15
      Height = 29
      Caption = 'E'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 373
      Top = 35
      Width = 43
      Height = 13
      Caption = 'Acima de'
    end
    object btnAtualiza: TButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'Processar'
      TabOrder = 0
      OnClick = btnAtualizaClick
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 86
      Top = 5
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'Fechar'
      Default = True
      TabOrder = 1
      OnClick = Button2Click
    end
    object cmExp: TButton
      AlignWithMargins = True
      Left = 167
      Top = 5
      Width = 74
      Height = 55
      Align = alLeft
      Caption = 'Exportar'
      TabOrder = 2
      OnClick = cmExpClick
    end
    object edE: TcxSpinEdit
      Left = 657
      Top = 32
      TabOrder = 3
      Value = 9
      Width = 65
    end
    object edD: TcxSpinEdit
      Left = 586
      Top = 32
      TabOrder = 4
      Value = 29
      Width = 65
    end
    object edC: TcxSpinEdit
      Left = 515
      Top = 32
      TabOrder = 5
      Value = 49
      Width = 65
    end
    object edB: TcxSpinEdit
      Left = 444
      Top = 32
      TabOrder = 6
      Value = 99
      Width = 65
    end
    object Button4: TButton
      AlignWithMargins = True
      Left = 247
      Top = 5
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'Imp.Redirs'
      TabOrder = 7
      Visible = False
      OnClick = Button4Click
    end
  end
  object Paginas: TcxPageControl
    Left = 0
    Top = 65
    Width = 1075
    Height = 509
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = tsGeral
    ClientRectBottom = 507
    ClientRectLeft = 2
    ClientRectRight = 1073
    ClientRectTop = 22
    object tsGeral: TcxTabSheet
      Caption = 'Geral'
      ImageIndex = 0
      object gridG: TcxGrid
        Left = 0
        Top = 0
        Width = 1071
        Height = 485
        Align = alClient
        TabOrder = 0
        object tvG: TcxGridDBTableView
          DataController.DataSource = dsRG
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object tvGAno: TcxGridDBColumn
            DataBinding.FieldName = 'Ano'
          end
          object tvGMes: TcxGridDBColumn
            DataBinding.FieldName = 'Mes'
          end
          object tvGDia: TcxGridDBColumn
            DataBinding.FieldName = 'Dia'
          end
          object tvGDS: TcxGridDBColumn
            DataBinding.FieldName = 'DS'
          end
          object tvGLojas: TcxGridDBColumn
            DataBinding.FieldName = 'Lojas'
          end
          object tvGQtd: TcxGridDBColumn
            DataBinding.FieldName = 'Qtd'
          end
          object tvGMedia: TcxGridDBColumn
            DataBinding.FieldName = 'Media'
          end
        end
        object glG: TcxGridLevel
          GridView = tvG
        end
      end
    end
    object tsLoja: TcxTabSheet
      Caption = 'por Loja'
      ImageIndex = 1
      object gridL: TcxGrid
        Left = 0
        Top = 0
        Width = 1071
        Height = 485
        Align = alClient
        TabOrder = 0
        object tvL: TcxGridDBTableView
          DataController.DataSource = dsRL
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object tvLLoja: TcxGridDBColumn
            DataBinding.FieldName = 'Loja'
          end
          object tvLAno: TcxGridDBColumn
            DataBinding.FieldName = 'Ano'
          end
          object tvLMes: TcxGridDBColumn
            DataBinding.FieldName = 'Mes'
          end
          object tvLDias: TcxGridDBColumn
            DataBinding.FieldName = 'Dias'
          end
          object tvLQtd: TcxGridDBColumn
            DataBinding.FieldName = 'Qtd'
          end
          object tvLMedia: TcxGridDBColumn
            DataBinding.FieldName = 'Media'
          end
          object tvLCateg: TcxGridDBColumn
            DataBinding.FieldName = 'Categ'
          end
        end
        object glL: TcxGridLevel
          GridView = tvL
        end
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = 'Categ'
      ImageIndex = 2
      object gridC: TcxGrid
        Left = 0
        Top = 41
        Width = 1071
        Height = 444
        Align = alClient
        TabOrder = 0
        object tvC: TcxGridDBBandedTableView
          DataController.DataSource = dsMT
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Bands = <
            item
              Width = 216
            end
            item
              Caption = 'A'
            end
            item
              Caption = 'B'
            end
            item
              Caption = 'C'
            end
            item
              Caption = 'D'
            end
            item
              Caption = 'E'
            end
            item
              Caption = 'Outros '
            end>
          object tvCAno: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Ano'
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object tvCMes: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Mes'
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object tvCRedirs: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Redirs'
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object tvCLojas: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Lojas'
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object tvCRD: TcxGridDBBandedColumn
            DataBinding.FieldName = 'RD'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object tvCRedirA: TcxGridDBBandedColumn
            Caption = 'Redirs'
            DataBinding.FieldName = 'RedirA'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 52
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object tvCRedirB: TcxGridDBBandedColumn
            Caption = 'Redirs'
            DataBinding.FieldName = 'RedirB'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 52
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object tvCRedirC: TcxGridDBBandedColumn
            Caption = 'Redirs'
            DataBinding.FieldName = 'RedirC'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 52
            Position.BandIndex = 3
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object tvCRedirD: TcxGridDBBandedColumn
            Caption = 'Redirs'
            DataBinding.FieldName = 'RedirD'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 52
            Position.BandIndex = 4
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object tvCRedirE: TcxGridDBBandedColumn
            Caption = 'Redirs'
            DataBinding.FieldName = 'RedirE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 52
            Position.BandIndex = 5
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object tvCLojasA: TcxGridDBBandedColumn
            Caption = 'Lojas'
            DataBinding.FieldName = 'LojasA'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 38
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object tvCLojasB: TcxGridDBBandedColumn
            Caption = 'Lojas'
            DataBinding.FieldName = 'LojasB'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 38
            Position.BandIndex = 2
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object tvCLojasC: TcxGridDBBandedColumn
            Caption = 'Lojas'
            DataBinding.FieldName = 'LojasC'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 38
            Position.BandIndex = 3
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object tvCLojasD: TcxGridDBBandedColumn
            Caption = 'Lojas'
            DataBinding.FieldName = 'LojasD'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 38
            Position.BandIndex = 4
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object tvCLojasE: TcxGridDBBandedColumn
            Caption = 'Lojas'
            DataBinding.FieldName = 'LojasE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 38
            Position.BandIndex = 5
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object tvCRedirAp: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'RedirAp'
            HeaderAlignmentHorz = taRightJustify
            HeaderAlignmentVert = vaCenter
            Width = 42
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object tvCRedirBp: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'RedirBp'
            HeaderAlignmentHorz = taRightJustify
            HeaderAlignmentVert = vaCenter
            Width = 42
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object tvCRedirCp: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'RedirCp'
            HeaderAlignmentHorz = taRightJustify
            HeaderAlignmentVert = vaCenter
            Width = 42
            Position.BandIndex = 3
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object tvCRedirDp: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'RedirDp'
            HeaderAlignmentHorz = taRightJustify
            HeaderAlignmentVert = vaCenter
            Width = 42
            Position.BandIndex = 4
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object tvCRedirEp: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'RedirEp'
            HeaderAlignmentHorz = taRightJustify
            HeaderAlignmentVert = vaCenter
            Width = 42
            Position.BandIndex = 5
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object tvCRedirOp: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'RedirOp'
            HeaderAlignmentHorz = taRightJustify
            HeaderAlignmentVert = vaCenter
            Width = 42
            Position.BandIndex = 6
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object tvCRedirO: TcxGridDBBandedColumn
            Caption = 'Redirs'
            DataBinding.FieldName = 'RedirO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 52
            Position.BandIndex = 6
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object tvCLojasO: TcxGridDBBandedColumn
            Caption = 'Lojas'
            DataBinding.FieldName = 'LojasO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 38
            Position.BandIndex = 6
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object tvCLojasAp: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'LojasAp'
            HeaderAlignmentHorz = taRightJustify
            HeaderAlignmentVert = vaCenter
            Width = 42
            Position.BandIndex = 1
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object tvCLojasBp: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'LojasBp'
            HeaderAlignmentHorz = taRightJustify
            HeaderAlignmentVert = vaCenter
            Width = 42
            Position.BandIndex = 2
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object tvCLojasCp: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'LojasCp'
            HeaderAlignmentHorz = taRightJustify
            HeaderAlignmentVert = vaCenter
            Width = 42
            Position.BandIndex = 3
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object tvCLojasOp: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'LojasOp'
            HeaderAlignmentHorz = taRightJustify
            HeaderAlignmentVert = vaCenter
            Width = 42
            Position.BandIndex = 6
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object tvCLojasDp: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'LojasDp'
            HeaderAlignmentHorz = taRightJustify
            HeaderAlignmentVert = vaCenter
            Width = 42
            Position.BandIndex = 4
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object tvCLojasEp: TcxGridDBBandedColumn
            Caption = '%'
            DataBinding.FieldName = 'LojasEp'
            HeaderAlignmentHorz = taRightJustify
            HeaderAlignmentVert = vaCenter
            Width = 42
            Position.BandIndex = 5
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
        end
        object glC: TcxGridLevel
          GridView = tvC
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1071
        Height = 41
        Align = alTop
        TabOrder = 1
        object Button3: TButton
          Left = 12
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Gerar Dados'
          TabOrder = 0
          OnClick = Button3Click
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Varia'#231#227'o do movimento das lojas'
      ImageIndex = 3
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1071
        Height = 41
        Align = alTop
        TabOrder = 0
        object Button1: TButton
          Left = 12
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Gerar Dados'
          TabOrder = 0
          OnClick = Button1Click
        end
      end
      object gridM: TcxGrid
        Left = 0
        Top = 41
        Width = 1071
        Height = 444
        Align = alClient
        TabOrder = 1
        object tvM: TcxGridDBBandedTableView
          DataController.DataSource = dsMTM
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Bands = <
            item
            end
            item
              Caption = 'A'
            end
            item
              Caption = 'B'
            end
            item
              Caption = 'C'
            end
            item
              Caption = 'D'
            end
            item
              Caption = 'E'
            end>
          object tvMAno: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Ano'
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object tvMMes: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Mes'
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object tvMVLojas: TcxGridDBBandedColumn
            Caption = 'Lojas'
            DataBinding.FieldName = 'VLojas'
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object tvMVMed: TcxGridDBBandedColumn
            Caption = 'Var'
            DataBinding.FieldName = 'VMed'
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object tvMVLojasNeg: TcxGridDBBandedColumn
            Caption = 'Positivo'
            DataBinding.FieldName = 'VLojasPos'
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object tvMVLojasPos: TcxGridDBBandedColumn
            Caption = 'Negativo'
            DataBinding.FieldName = 'VLojasNeg'
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object tvMVLojasA: TcxGridDBBandedColumn
            Caption = 'Lojas'
            DataBinding.FieldName = 'VLojasA'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object tvMVLojasB: TcxGridDBBandedColumn
            Caption = 'Lojas'
            DataBinding.FieldName = 'VLojasB'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object tvMVLojasC: TcxGridDBBandedColumn
            Caption = 'Lojas'
            DataBinding.FieldName = 'VLojasC'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 3
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object tvMVLojasD: TcxGridDBBandedColumn
            Caption = 'Lojas'
            DataBinding.FieldName = 'VLojasD'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 4
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object tvMVLojasE: TcxGridDBBandedColumn
            Caption = 'Lojas'
            DataBinding.FieldName = 'VLojasE'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 5
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object tvMVMedA: TcxGridDBBandedColumn
            Caption = 'Var'
            DataBinding.FieldName = 'VMedA'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object tvMVMedB: TcxGridDBBandedColumn
            Caption = 'Var'
            DataBinding.FieldName = 'VMedB'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object tvMVMedC: TcxGridDBBandedColumn
            Caption = 'Var'
            DataBinding.FieldName = 'VMedC'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 3
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object tvMVMedD: TcxGridDBBandedColumn
            Caption = 'Var'
            DataBinding.FieldName = 'VMedD'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 4
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object tvMVMedE: TcxGridDBBandedColumn
            Caption = 'Var'
            DataBinding.FieldName = 'VMedE'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 5
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
        end
        object glM: TcxGridLevel
          GridView = tvM
        end
      end
    end
  end
  object PB: TProgressBar
    Left = 0
    Top = 574
    Width = 1075
    Height = 17
    Align = alBottom
    TabOrder = 2
    Visible = False
  end
  object nxSession: TnxSession
    ServerEngine = nxRSE
    Left = 144
    Top = 160
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasName = 'Registro'
    Left = 184
    Top = 152
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCP
    Left = 384
    Top = 152
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = 'localhost'
    ServerNameDesigntime = 'localhost'
    Port = 16300
    Left = 344
    Top = 152
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 280
    Top = 272
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object dlgExp: TSaveDialog
    FileName = 'Exportar'
    Filter = 'Excel|*.xls|Html|*.htm|Texto|*.txt'
    FilterIndex = 0
    Left = 88
    Top = 145
  end
  object tR: TnxTable
    Database = nxDB
    TableName = 'OpenStat'
    IndexName = 'IDataLojaH'
    Left = 200
    Top = 232
    object tRData: TDateField
      FieldName = 'Data'
    end
    object tRIP: TStringField
      FieldName = 'IP'
      Size = 15
    end
    object tRH: TWordField
      FieldName = 'H'
    end
    object tRLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tRW: TWordField
      FieldName = 'W'
    end
    object tRQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object tRAno: TWordField
      FieldName = 'Ano'
    end
    object tRMes: TWordField
      FieldName = 'Mes'
    end
    object tRDia: TWordField
      FieldName = 'Dia'
    end
  end
  object tRL: TnxTable
    Database = nxDB
    OnCalcFields = tRLCalcFields
    TableName = 'RedirL'
    IndexName = 'ILojaAnoMes'
    Left = 264
    Top = 232
    object tRLLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tRLAno: TWordField
      FieldName = 'Ano'
    end
    object tRLMes: TWordField
      FieldName = 'Mes'
    end
    object tRLDias: TIntegerField
      FieldName = 'Dias'
    end
    object tRLQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object tRLMedia: TFloatField
      FieldName = 'Media'
    end
    object tRLCateg: TStringField
      FieldKind = fkCalculated
      FieldName = 'Categ'
      Calculated = True
    end
  end
  object tRG: TnxTable
    Database = nxDB
    TableName = 'RedirG'
    IndexName = 'IAnoMesDia'
    Left = 232
    Top = 232
    object tRGAno: TWordField
      FieldName = 'Ano'
    end
    object tRGMes: TWordField
      FieldName = 'Mes'
    end
    object tRGDia: TWordField
      FieldName = 'Dia'
    end
    object tRGDS: TWordField
      FieldName = 'DS'
    end
    object tRGLojas: TIntegerField
      FieldName = 'Lojas'
    end
    object tRGQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object tRGMedia: TFloatField
      FieldName = 'Media'
    end
  end
  object dsRG: TDataSource
    DataSet = tRG
    Left = 336
    Top = 352
  end
  object dsRL: TDataSource
    DataSet = tRL
    Left = 368
    Top = 352
  end
  object mt: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Redirs'
        DataType = ftInteger
      end
      item
        Name = 'Lojas'
        DataType = ftInteger
      end
      item
        Name = 'RD'
        DataType = ftFloat
      end
      item
        Name = 'Ano'
        DataType = ftWord
      end
      item
        Name = 'Mes'
        DataType = ftWord
      end
      item
        Name = 'RedirA'
        DataType = ftInteger
      end
      item
        Name = 'RedirB'
        DataType = ftInteger
      end
      item
        Name = 'RedirC'
        DataType = ftInteger
      end
      item
        Name = 'RedirD'
        DataType = ftInteger
      end
      item
        Name = 'RedirE'
        DataType = ftInteger
      end
      item
        Name = 'LojasA'
        DataType = ftInteger
      end
      item
        Name = 'LojasB'
        DataType = ftInteger
      end
      item
        Name = 'LojasC'
        DataType = ftInteger
      end
      item
        Name = 'LojasD'
        DataType = ftInteger
      end
      item
        Name = 'LojasE'
        DataType = ftInteger
      end
      item
        Name = 'RedirO'
        DataType = ftInteger
      end
      item
        Name = 'LojasO'
        DataType = ftInteger
      end>
    IndexFieldNames = 'Ano;Mes'
    IndexName = 'mtIndex1'
    IndexDefs = <
      item
        Name = 'mtIndex1'
        Fields = 'Ano;Mes'
        Options = [ixPrimary, ixUnique]
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    OnCalcFields = mtCalcFields
    Left = 584
    Top = 232
    object mtRedirs: TIntegerField
      FieldName = 'Redirs'
    end
    object mtLojas: TIntegerField
      FieldName = 'Lojas'
    end
    object mtRD: TFloatField
      FieldName = 'RD'
    end
    object mtAno: TWordField
      FieldName = 'Ano'
    end
    object mtMes: TWordField
      FieldName = 'Mes'
    end
    object mtRedirA: TIntegerField
      FieldName = 'RedirA'
    end
    object mtRedirB: TIntegerField
      FieldName = 'RedirB'
    end
    object mtRedirC: TIntegerField
      FieldName = 'RedirC'
    end
    object mtRedirD: TIntegerField
      FieldName = 'RedirD'
    end
    object mtRedirE: TIntegerField
      FieldName = 'RedirE'
    end
    object mtLojasA: TIntegerField
      FieldName = 'LojasA'
    end
    object mtLojasB: TIntegerField
      FieldName = 'LojasB'
    end
    object mtLojasC: TIntegerField
      FieldName = 'LojasC'
    end
    object mtLojasD: TIntegerField
      FieldName = 'LojasD'
    end
    object mtLojasE: TIntegerField
      FieldName = 'LojasE'
    end
    object mtRedirAp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RedirAp'
      Calculated = True
    end
    object mtRedirBp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RedirBp'
      Calculated = True
    end
    object mtRedirCp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RedirCp'
      Calculated = True
    end
    object mtRedirDp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RedirDp'
      Calculated = True
    end
    object mtRedirEp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RedirEp'
      Calculated = True
    end
    object mtRedirOp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RedirOp'
      Calculated = True
    end
    object mtRedirO: TIntegerField
      FieldName = 'RedirO'
    end
    object mtLojasO: TIntegerField
      FieldName = 'LojasO'
    end
    object mtLojasAp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'LojasAp'
      Calculated = True
    end
    object mtLojasBp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'LojasBp'
      Calculated = True
    end
    object mtLojasCp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'LojasCp'
      Calculated = True
    end
    object mtLojasOp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'LojasOp'
      Calculated = True
    end
    object mtLojasDp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'LojasDp'
      Calculated = True
    end
    object mtLojasEp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'LojasEp'
      Calculated = True
    end
    object mtVLojas: TIntegerField
      FieldName = 'VLojas'
    end
    object mtVPerc: TFloatField
      FieldName = 'VPerc'
    end
    object mtVMed: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VMed'
      Calculated = True
    end
    object mtVLojasNeg: TIntegerField
      FieldName = 'VLojasNeg'
    end
    object mtVLojasPos: TIntegerField
      FieldName = 'VLojasPos'
    end
  end
  object dsMT: TDataSource
    DataSet = mt
    Left = 616
    Top = 232
  end
  object tRLA: TnxTable
    Database = nxDB
    TableName = 'RedirL'
    IndexName = 'ILojaAnoMes'
    Left = 328
    Top = 232
    object tRLALoja: TIntegerField
      FieldName = 'Loja'
    end
    object tRLAAno: TWordField
      FieldName = 'Ano'
    end
    object tRLAMes: TWordField
      FieldName = 'Mes'
    end
    object tRLADias: TIntegerField
      FieldName = 'Dias'
    end
    object tRLAQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object tRLAMedia: TFloatField
      FieldName = 'Media'
    end
  end
  object mtM: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Redirs'
        DataType = ftInteger
      end
      item
        Name = 'Lojas'
        DataType = ftInteger
      end
      item
        Name = 'RD'
        DataType = ftFloat
      end
      item
        Name = 'Ano'
        DataType = ftWord
      end
      item
        Name = 'Mes'
        DataType = ftWord
      end
      item
        Name = 'RedirA'
        DataType = ftInteger
      end
      item
        Name = 'RedirB'
        DataType = ftInteger
      end
      item
        Name = 'RedirC'
        DataType = ftInteger
      end
      item
        Name = 'RedirD'
        DataType = ftInteger
      end
      item
        Name = 'RedirE'
        DataType = ftInteger
      end
      item
        Name = 'LojasA'
        DataType = ftInteger
      end
      item
        Name = 'LojasB'
        DataType = ftInteger
      end
      item
        Name = 'LojasC'
        DataType = ftInteger
      end
      item
        Name = 'LojasD'
        DataType = ftInteger
      end
      item
        Name = 'LojasE'
        DataType = ftInteger
      end
      item
        Name = 'RedirO'
        DataType = ftInteger
      end
      item
        Name = 'LojasO'
        DataType = ftInteger
      end>
    IndexFieldNames = 'Ano;Mes'
    IndexName = 'mtIndex1'
    IndexDefs = <
      item
        Name = 'mtIndex1'
        Fields = 'Ano;Mes'
        Options = [ixPrimary, ixUnique]
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    OnCalcFields = mtMCalcFields
    Left = 520
    Top = 320
    object mtMAno: TWordField
      FieldName = 'Ano'
    end
    object mtMMes: TWordField
      FieldName = 'Mes'
    end
    object mtMVLojas: TIntegerField
      FieldName = 'VLojas'
    end
    object mtMVPerc: TFloatField
      FieldName = 'VPerc'
    end
    object mtMVMed: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VMed'
      Calculated = True
    end
    object mtMVLojasNeg: TIntegerField
      FieldName = 'VLojasNeg'
    end
    object mtMVLojasPos: TIntegerField
      FieldName = 'VLojasPos'
    end
    object mtMVLojasA: TIntegerField
      FieldName = 'VLojasA'
    end
    object mtMVLojasB: TIntegerField
      FieldName = 'VLojasB'
    end
    object mtMVLojasC: TIntegerField
      FieldName = 'VLojasC'
    end
    object mtMVLojasD: TIntegerField
      FieldName = 'VLojasD'
    end
    object mtMVLojasE: TIntegerField
      FieldName = 'VLojasE'
    end
    object mtMVPercA: TFloatField
      FieldName = 'VPercA'
    end
    object mtMVPercB: TFloatField
      FieldName = 'VPercB'
    end
    object mtMVPercC: TFloatField
      FieldName = 'VPercC'
    end
    object mtMVPercD: TFloatField
      FieldName = 'VPercD'
    end
    object mtMVPercE: TFloatField
      FieldName = 'VPercE'
    end
    object mtMVMedA: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VMedA'
      Calculated = True
    end
    object mtMVMedB: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VMedB'
      Calculated = True
    end
    object mtMVMedC: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VMedC'
      Calculated = True
    end
    object mtMVMedD: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VMedD'
      Calculated = True
    end
    object mtMVMedE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VMedE'
      Calculated = True
    end
  end
  object dsMTM: TDataSource
    DataSet = mtM
    Left = 552
    Top = 320
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'cliente'
    IndexName = 'ICodigo'
    Left = 200
    Top = 200
    object tCliCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object tCliTipo: TWordField
      FieldName = 'Tipo'
    end
    object tCliSenha: TStringField
      FieldName = 'Senha'
      Size = 30
    end
    object tCliCadastroEm: TDateTimeField
      FieldName = 'CadastroEm'
    end
    object tCliCadastroPor: TStringField
      FieldName = 'CadastroPor'
      Size = 30
    end
    object tCliAtualizadoEm: TDateTimeField
      FieldName = 'AtualizadoEm'
    end
    object tCliAtualizadoPor: TStringField
      FieldName = 'AtualizadoPor'
      Size = 30
    end
    object tCliLoja: TStringField
      FieldName = 'Loja'
      Size = 50
    end
    object tCliRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 50
    end
    object tCliPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object tCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object tCliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tCliEndereco: TnxMemoField
      FieldName = 'Endereco'
      BlobType = ftMemo
    end
    object tCliCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object tCliBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object tCliSerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
    object tCliCodEquip: TStringField
      FieldName = 'CodEquip'
      Size = 60
    end
    object tCliNumMaq: TWordField
      FieldName = 'NumMaq'
    end
    object tCliCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 19
    end
    object tCliIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object tCliObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tCliTelefones: TnxMemoField
      FieldName = 'Telefones'
      BlobType = ftMemo
    end
    object tCliEmailReg: TnxMemoField
      FieldName = 'EmailReg'
      BlobType = ftMemo
    end
    object tCliFormaPagto: TnxMemoField
      FieldName = 'FormaPagto'
      BlobType = ftMemo
    end
    object tCliLicMaq: TWordField
      FieldName = 'LicMaq'
    end
    object tCliLicTipo: TWordField
      FieldName = 'LicTipo'
    end
    object tCliLicVenc: TDateField
      FieldName = 'LicVenc'
    end
    object tCliManInicio: TDateField
      FieldName = 'ManInicio'
    end
    object tCliManVenc: TDateField
      FieldName = 'ManVenc'
    end
    object tCliProprietarios: TnxMemoField
      FieldName = 'Proprietarios'
      BlobType = ftMemo
    end
    object tCliGerente: TStringField
      FieldName = 'Gerente'
      Size = 50
    end
    object tCliTipoLoja: TWordField
      FieldName = 'TipoLoja'
    end
    object tCliEmailTec: TnxMemoField
      FieldName = 'EmailTec'
      BlobType = ftMemo
    end
    object tCliValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tCliValorRec: TCurrencyField
      FieldName = 'ValorRec'
    end
    object tCliEmitirNF: TBooleanField
      FieldName = 'EmitirNF'
    end
    object tCliMessenger: TnxMemoField
      FieldName = 'Messenger'
      BlobType = ftMemo
    end
    object tCliICQ: TnxMemoField
      FieldName = 'ICQ'
      BlobType = ftMemo
    end
    object tCliUObtemLic: TDateTimeField
      FieldName = 'UObtemLic'
    end
    object tCliUVersao: TStringField
      FieldName = 'UVersao'
      Size = 10
    end
    object tCliCAno: TWordField
      FieldName = 'CAno'
    end
    object tCliCMes: TWordField
      FieldName = 'CMes'
    end
    object tCliCDia: TWordField
      FieldName = 'CDia'
    end
    object tCliAAno: TWordField
      FieldName = 'AAno'
    end
    object tCliAMes: TWordField
      FieldName = 'AMes'
    end
    object tCliADia: TWordField
      FieldName = 'ADia'
    end
    object tCliUAno: TWordField
      FieldName = 'UAno'
    end
    object tCliUMes: TWordField
      FieldName = 'UMes'
    end
    object tCliUDia: TWordField
      FieldName = 'UDia'
    end
    object tCliUDias: TWordField
      FieldName = 'UDias'
    end
    object tCliMotivoDesist: TStringField
      FieldName = 'MotivoDesist'
      Size = 30
    end
    object tCliLastAdminPopup: TDateTimeField
      FieldName = 'LastAdminPopup'
    end
    object tCliutmccn: TIntegerField
      FieldName = 'utmccn'
    end
    object tCliutmctr: TIntegerField
      FieldName = 'utmctr'
    end
    object tCliutmcct: TIntegerField
      FieldName = 'utmcct'
    end
    object tCliutmcsr: TIntegerField
      FieldName = 'utmcsr'
    end
    object tCliutmcmd: TIntegerField
      FieldName = 'utmcmd'
    end
    object tCliNegociacao: TWordField
      FieldName = 'Negociacao'
    end
    object tCliStatus: TIntegerField
      FieldName = 'Status'
    end
    object tCliContatarEm: TDateTimeField
      FieldName = 'ContatarEm'
    end
    object tCliPrograma: TWordField
      FieldName = 'Programa'
    end
    object tCliBloqueado: TBooleanField
      FieldName = 'Bloqueado'
    end
    object tCliCliente: TBooleanField
      FieldName = 'Cliente'
    end
    object tCliAtivado: TBooleanField
      FieldName = 'Ativado'
    end
    object tCliCodAtivacao: TStringField
      FieldName = 'CodAtivacao'
      Size = 10
    end
    object tCliEmailConta: TStringField
      FieldName = 'EmailConta'
      Size = 200
    end
    object tCliAtivadoEm: TDateTimeField
      FieldName = 'AtivadoEm'
    end
    object tCliTipoConta: TWordField
      FieldName = 'TipoConta'
    end
    object tCliPremiumAte: TDateTimeField
      FieldName = 'PremiumAte'
    end
    object tCliCodDesc: TStringField
      FieldName = 'CodDesc'
      Size = 10
    end
    object tCliRedirT: TIntegerField
      FieldName = 'RedirT'
    end
    object tCliRedirI: TDateTimeField
      FieldName = 'RedirI'
    end
    object tCliCampanha: TStringField
      FieldName = 'Campanha'
      Size = 50
    end
  end
end
