object frmGridForms: TfrmGridForms
  Left = 192
  Top = 107
  Width = 521
  Height = 409
  ActiveControl = edNome
  Caption = 'Reposit'#243'rio de Formul'#225'rios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 513
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object lbNome: TLabel
      Left = 171
      Top = 14
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object btnOk: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = btnOkClick
      Kind = bkOK
    end
    object btnCancelar: TBitBtn
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      Kind = bkCancel
    end
    object edNome: TEdit
      Left = 208
      Top = 10
      Width = 289
      Height = 21
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 513
    Height = 341
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 503
      Height = 331
      ActivePage = TabSheet1
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Formul'#225'rios'
        object Grid: TdxDBGrid
          Left = 0
          Top = 0
          Width = 495
          Height = 303
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'Nome'
          ShowGroupPanel = True
          SummaryGroups = <>
          SummarySeparator = ', '
          Align = alClient
          TabOrder = 0
          OnDblClick = GridDblClick
          DataSource = dmTouche.dsForms
          Filter.Criteria = {00000000}
          LookAndFeel = lfFlat
          OptionsBehavior = [edgoAutoSearch, edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
          OptionsView = [edgoBandHeaderWidth, edgoIndicator, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
          PreviewFieldName = 'PAS'
          PreviewLines = 0
          object GridNome: TdxDBGridMaskColumn
            Width = 244
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Nome'
          end
          object GridModulo: TdxDBGridMaskColumn
            Width = 180
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Modulo'
          end
          object GridCriadoEm: TdxDBGridDateColumn
            Width = 81
            BandIndex = 0
            RowIndex = 0
            FieldName = 'CriadoEm'
          end
        end
      end
      object TabSheet2: TTabSheet
        BorderWidth = 5
        Caption = 'PAS'
        ImageIndex = 1
        object DCDBMemo1: TDCDBMemo
          Left = 0
          Top = 0
          Width = 485
          Height = 293
          Cursor = crIBeam
          PrintOptions = [poShowProgress]
          LineNumColor = clBlack
          LineNumAlign = taRightJustify
          StringsOptions = [soBackUnindents, soGroupUndo, soForceCutCopy, soAutoIndent, soSmartTab, soFindTextAtCursor, soOverwriteBlocks]
          SyntaxParser = DelphiParser1
          TabStops = '9,17'
          KeyMapping = 'Default'
          SelColor = clWhite
          SelBackColor = clNavy
          MatchBackColor = clBlack
          GutterBackColor = clWindow
          HideScrollBars = True
          ScrollBars = ssBoth
          Options = [moThumbTracking, moColorSyntax]
          GutterBrush.Color = clBtnFace
          MarginPen.Color = clGrayText
          BkgndOption = boNone
          LineSeparator.Options = []
          LineSeparator.Pen.Color = clGrayText
          LineHighlight.Visible = False
          LineHighlight.Shape = shDoubleLine
          SpecialSymbols.EOLStringBinary = {01000000B6}
          SpecialSymbols.EOFStringBinary = {010000005F}
          UseDefaultMenu = False
          ReadOnly = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          PrinterFont.Charset = DEFAULT_CHARSET
          PrinterFont.Color = clBlack
          PrinterFont.Height = -13
          PrinterFont.Name = 'Courier New'
          PrinterFont.Style = []
          UsePrinterFont = False
          TemplateFont.Charset = DEFAULT_CHARSET
          TemplateFont.Color = clWindowText
          TemplateFont.Height = -11
          TemplateFont.Name = 'MS Sans Serif'
          TemplateFont.Style = []
          AutoDisplay = True
          DataField = 'PAS'
          BlockIndent = 1
          SpacesInTab = 8
          Align = alClient
          UseDockManager = False
          TabOrder = 0
          TabStop = True
          CodeTemplates = <>
          TemplatesType = 'None'
          HideCaret = False
          UseGlobalOptions = False
        end
      end
      object TabSheet3: TTabSheet
        BorderWidth = 5
        Caption = 'DFM'
        ImageIndex = 2
        object DCDBMemo2: TDCDBMemo
          Left = 0
          Top = 0
          Width = 485
          Height = 293
          Cursor = crIBeam
          PrintOptions = [poShowProgress]
          LineNumColor = clBlack
          LineNumAlign = taRightJustify
          StringsOptions = [soBackUnindents, soGroupUndo, soForceCutCopy, soAutoIndent, soSmartTab, soFindTextAtCursor, soOverwriteBlocks]
          SyntaxParser = DFMParser1
          TabStops = '9,17'
          KeyMapping = 'Default'
          SelColor = clWhite
          SelBackColor = clNavy
          MatchBackColor = clBlack
          GutterBackColor = clWindow
          HideScrollBars = True
          ScrollBars = ssBoth
          Options = [moThumbTracking, moColorSyntax]
          GutterBrush.Color = clBtnFace
          MarginPen.Color = clGrayText
          BkgndOption = boNone
          LineSeparator.Options = []
          LineSeparator.Pen.Color = clGrayText
          LineHighlight.Visible = False
          LineHighlight.Shape = shDoubleLine
          SpecialSymbols.EOLStringBinary = {01000000B6}
          SpecialSymbols.EOFStringBinary = {010000005F}
          UseDefaultMenu = False
          ReadOnly = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          PrinterFont.Charset = DEFAULT_CHARSET
          PrinterFont.Color = clBlack
          PrinterFont.Height = -13
          PrinterFont.Name = 'Courier New'
          PrinterFont.Style = []
          UsePrinterFont = False
          TemplateFont.Charset = DEFAULT_CHARSET
          TemplateFont.Color = clWindowText
          TemplateFont.Height = -11
          TemplateFont.Name = 'MS Sans Serif'
          TemplateFont.Style = []
          AutoDisplay = True
          DataField = 'DFM'
          BlockIndent = 1
          SpacesInTab = 8
          Align = alClient
          UseDockManager = False
          TabOrder = 0
          TabStop = True
          CodeTemplates = <>
          TemplatesType = 'None'
          HideCaret = False
          UseGlobalOptions = False
        end
      end
      object TabSheet4: TTabSheet
        BorderWidth = 5
        Caption = 'Descri'#231#227'o'
        ImageIndex = 3
        object DBMemo3: TDBMemo
          Left = 0
          Top = 0
          Width = 485
          Height = 293
          Align = alClient
          DataField = 'Descricao'
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
    end
  end
  object DelphiParser1: TDelphiParser
    Left = 88
    Top = 136
  end
  object DFMParser1: TDFMParser
    Left = 344
    Top = 88
  end
end
