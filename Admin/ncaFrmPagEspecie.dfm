object FrmPagEspecie: TFrmPagEspecie
  Left = 0
  Top = 0
  ActiveControl = gridEsp
  BorderStyle = bsDialog
  Caption = 'Pagamento'
  ClientHeight = 573
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = tvEspKeyUp
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object panPri: TLMDSimplePanel
    AlignWithMargins = True
    Left = 15
    Top = 15
    Width = 576
    Height = 393
    Margins.Left = 15
    Margins.Top = 15
    Margins.Right = 15
    Margins.Bottom = 15
    Align = alClient
    Bevel.Mode = bmStandard
    Color = clWhite
    TabOrder = 0
    object gridEsp: TcxGrid
      Left = 1
      Top = 81
      Width = 574
      Height = 266
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Align = alClient
      BorderStyle = cxcbsNone
      TabOrder = 0
      OnEnter = gridEspEnter
      OnExit = gridEspExit
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      object tvEsp: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        OnCanFocusRecord = tvEspCanFocusRecord
        OnCanSelectRecord = tvEspCanSelectRecord
        OnCustomDrawCell = tvEspCustomDrawCell
        OnFocusedRecordChanged = tvEspFocusedRecordChanged
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        DataController.OnAfterPost = tvEspDataControllerAfterPost
        DataController.OnDataChanged = tvEspDataControllerDataChanged
        OptionsBehavior.PostponedSynchronization = False
        OptionsBehavior.AlwaysShowEditor = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.PullFocusing = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.EditAutoHeightBorderColor = clYellow
        OptionsView.GridLineColor = 14869218
        OptionsView.GridLines = glHorizontal
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        OptionsView.IndicatorWidth = 22
        Styles.Selection = cxStyle2
        object tvEspImg: TcxGridColumn
          Caption = 'Total '#224' Pagar:'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Images = cxImageList1
          Properties.Items = <
            item
              Description = 'Pagamento Pendente'
            end
            item
              Description = 'Dinheiro'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = 'Cart'#227'o Cr'#233'dito'
              ImageIndex = 1
              Value = 1
            end
            item
              Description = 'Cart'#227'o D'#233'bito'
              ImageIndex = 2
              Value = 2
            end
            item
              Description = 'Cheque'
              ImageIndex = 3
              Value = 3
            end>
          Properties.MultiLineText = True
          Properties.ShowDescriptions = False
          BestFitMaxWidth = 56
          HeaderAlignmentHorz = taRightJustify
          MinWidth = 56
          Options.Editing = False
          Options.Focusing = False
          Styles.OnGetContentStyle = tvEspImgStylesGetContentStyle
          Width = 56
        end
        object tvEspDescr: TcxGridColumn
          OnCustomDrawCell = tvEspDescrCustomDrawCell
          Options.Focusing = False
          Width = 200
        end
        object tvEspValor: TcxGridColumn
          Caption = 'R$ 100,00'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = tvEspValorPropertiesChange
          OnGetDisplayText = tvEspValorGetDisplayText
          HeaderAlignmentHorz = taRightJustify
          Styles.OnGetContentStyle = tvEspValorStylesGetContentStyle
          Width = 245
        end
      end
      object glEsp: TcxGridLevel
        GridView = tvEsp
      end
    end
    object LMDSimplePanel3: TLMDSimplePanel
      Left = 1
      Top = 347
      Width = 574
      Height = 45
      Align = alBottom
      Bevel.BorderSides = [fsTop]
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsSingleRaised
      TabOrder = 1
      object pgTrocoCred: TcxPageControl
        Left = 1
        Top = 1
        Width = 572
        Height = 43
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = tsTroco
        Properties.CustomButtons.Buttons = <>
        Properties.HideTabs = True
        ClientRectBottom = 43
        ClientRectRight = 572
        ClientRectTop = 0
        object tsFalta: TcxTabSheet
          Caption = 'tsFalta'
          ImageIndex = 0
          object cbDebitar: TLMDCheckBox
            Left = 12
            Top = 13
            Width = 118
            Height = 21
            Cursor = crHandPoint
            Caption = 'Deixar em d'#233'bito'
            Alignment.Alignment = agTopLeft
            Alignment.Spacing = 4
            TabOrder = 0
            OnClick = cbDebitarClick
            OnChange = cbDebitarChange
          end
          object lbValorFalta: TcxLabel
            AlignWithMargins = True
            Left = 450
            Top = 0
            Cursor = crHandPoint
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 5
            Margins.Bottom = 0
            Align = alRight
            Caption = 'R$3,50'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -32
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextColor = 75226
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            AnchorX = 567
            AnchorY = 22
          end
          object lbFalta: TcxLabel
            AlignWithMargins = True
            Left = 389
            Top = 0
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alRight
            Caption = 'Falta'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -19
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.TextColor = 75226
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
            StyleFocused.TextStyle = [fsBold]
            Properties.Alignment.Vert = taVCenter
            AnchorY = 22
          end
          object btnConfigDeb: TMyImage
            Left = 136
            Top = 11
            Width = 22
            Height = 25
            Cursor = crHandPoint
            OnClick = btnConfigDebClick
            MouseOverDrawMode = idmNormal
            MouseOffDrawMode = idmFaded
            MouseDownDrawMode = idmDingy
            ImageList = cxImageList3
            ImageIndex = 0
            Colorize = False
          end
        end
        object tsTroco: TcxTabSheet
          Caption = 'tsTroco'
          ImageIndex = 1
          object cbCreditar: TcxCheckBox
            Left = 25
            Top = 0
            Cursor = crHandPoint
            Margins.Left = 8
            Align = alLeft
            Caption = 'Salvar troco como cr'#233'dito em conta'
            Style.BorderStyle = ebsFlat
            TabOrder = 0
            Width = 233
          end
          object lbTroco: TcxLabel
            AlignWithMargins = True
            Left = 382
            Top = 0
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alRight
            Caption = 'Troco'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -19
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.TextColor = 7645480
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
            StyleFocused.TextStyle = [fsBold]
            Properties.Alignment.Vert = taVCenter
            AnchorY = 22
          end
          object lbValorTroco: TcxLabel
            AlignWithMargins = True
            Left = 450
            Top = 0
            Cursor = crHandPoint
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 5
            Margins.Bottom = 0
            Align = alRight
            Caption = 'R$3,50'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -32
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextColor = 7645480
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            AnchorX = 567
            AnchorY = 22
          end
          object btnPremium: TcxButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 22
            Height = 37
            Cursor = crHandPoint
            Hint = 'Recurso exclusivo para assinantes Premium!'
            Margins.Right = 0
            Align = alLeft
            Caption = 'Premium'
            TabOrder = 3
            OnClick = btnPremiumClick
            LookAndFeel.Kind = lfOffice11
            OptionsImage.ImageIndex = 85
            OptionsImage.Images = dmImagens.im16
            PaintStyle = bpsGlyph
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.AllowAllUp = True
            SpeedButtonOptions.Flat = True
            SpeedButtonOptions.Transparent = True
          end
        end
        object tsOk: TcxTabSheet
          Caption = 'tsOk'
          ImageIndex = 2
          ExplicitWidth = 0
          ExplicitHeight = 0
          object imgOk: TImage
            Left = 532
            Top = 0
            Width = 40
            Height = 40
            Align = alRight
            AutoSize = True
            Center = True
            Picture.Data = {
              0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
              00280000002808060000008CFEB86D000000097048597300000EC400000EC401
              952B0E1B0000017B4944415478DAEDD5414E84301406E016A3C2A827D395132F
              E3C495C1CB185C0D1733CEA851A9FFC332018696425B20A66F4343F3E8971F5A
              B810822DB9780006600006E03F065E67E949BEDEFC2C17F8FC2858149D01F9B5
              3820D22BCA4151701D7216E00157D51FF214C8EFD98147B82692BEC9C6FCA440
              25AE02A2F2BB073E0B509B9CAC366E32E098E48C81741450F34D96C6DBF5E663
              4A5C2F90703C8ADE30BC048E9009AEEFD6B89ED76A04ACE3AA7B25F2E529D9DE
              DE2B914071EC44619B9C1628713B0C2FDA7384C4E2E7407C0E4E8E16A4358BC2
              08D70994384A28E9EEE00C091232CE6BDFA449724371DDC02C5DA17BA7EEE00C
              3D0298A89DA46B5C27900A9B61C5544809A4A1449649FAC029815A640D58437A
              C169814A640BA87DB825AE172891B459F643812E7046C023A401D015CE185822
              714043B627A0B6F03C57B84140898C01D0FEEA5CE20603FB90AE71A380251267
              1F2E0DA40FDC68A0441E8E205F382BA0445E01F7EA0B670D9CA2023000E7AE00
              B4AD5FA8EF83C06439C6730000000049454E44AE426082}
            ExplicitLeft = 541
            ExplicitTop = 1
          end
        end
        object tsErro: TcxTabSheet
          Caption = 'tsErro'
          ImageIndex = 3
          object imgWarning: TImage
            AlignWithMargins = True
            Left = 537
            Top = 3
            Width = 32
            Height = 37
            Align = alRight
            AutoSize = True
            Center = True
            Picture.Data = {
              0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
              0020000000200806000000737A7AF40000002A744558744372656174696F6E20
              54696D65004D692035204D727A20323030332030313A31363A3336202B303130
              302D49F2060000000774494D4507D303050C15157B72B5580000000970485973
              00000AF000000AF00142AC34980000000467414D410000B18F0BFC6105000006
              C54944415478DAED977B7015D51DC73FBB7B1FB949B879131E3A3C820DA10182
              54A160D552C08651343A54D1D60E0CD58E050B035528A828D832986A03B6204E
              2118AB058410B560CBC33F441379D8848460879AAA81240D49C8E3E6BE77B7BF
              DD1B5E9649AD429DCEF4CC9CD97BCF9EBBDFCFEFB9E72A7CC543F99F04282FC6
              DD7992C7A251EE350D525029F726B2E4C64554FD57000E16B19DA4AFDF9935F1
              119CEE78FE71E2754EBC53D2D53F8DEBC7CCE3C32B0AF0D1460A1ABBE3B6E7CD
              785DD1C39D187A08CDE5A0A976270D875EDD7BF3CF9972C5009A7E8FE7F8A7D4
              5C3375E9D0848C3CCC681798114C338A33CECD91AD0BCC2467D75DD7CEA3F48A
              0054FD96C7F53E439F1C36E959F4E0690C1187B00DA16A26FEB6BFF3C1CE7575
              A94E72273E41E0B202346C66D047AD1CCBB9754D82EA8CC7D403B63088076C88
              300EB793E3FB8B0936D72DFBF6A33C7D5901AA37B0D539F03B33FA8DFC2146D4
              87A29AA2DD0C860FD39128DE08C9C3C298869FF75E5EEFEB1B4FCEF8C59CBC2C
              00F57F6052431B7BB3A76D544C118A745463D6AFA7EEA441C480BCE1B229732A
              614F369A23427D5505CD5595AF4C7E8CFBBE34405D118E46930FAEBE6ED6486F
              FFEBC5D26E7C471631657132F5AD5E123C1EFAA56B94AFAD45BF6A06BAEA96AA
              3078EFA5AD464A5CF4A6F10B39F0A5008E6DE4E1909A513474D22AA29133A8FE
              6A766DDBCC03CF0D2433DD85DBED462781A5DFAFE7FE7B3238A30E475323B435
              36F097B2C347FA9F62DC8412D9F245003EDD42467D031F664D5996EA8C4F91C4
              0BE2F49753BC7937CB5F1A487A8ADB0650B404BE37A98565F3C39CD147811AC0
              ED51797F5B85196AF33D98FF382F7E2180A32FB041CB1CFBA3017973D0C3ADB2
              3B84335CC3EED232E63E3F848C1417717171184A3C0FDF5DCFEC991AEDFA60D9
              1794B2D4898403EC5F57DD9C9548F6D8E5B4FF47009F6C61ECC946DE1F31FD59
              4DD7AD32F361D5BC43394D6BF526C6CFCDA15F9AC30688187D7879C521B2460D
              26A827A008A8A245A44D1BD4BE7D8AC6AA8E5FDFB692059F1B400A4CD9B79603
              43720B26A40EBE095D628FDD5782A029A4858B185130024FBC4742E092C44CA4
              A2740F1D9171F2CB800084A54CA53959D3ADB37BF5A970461279372EE6F8E702
              38B8891F44C2899B73F30B9548B04556FCE701548334F54D16FD5265DFE18178
              3C6E265CEBA370450D1DBE1C11F6CB0C9F837008C0C9EA003565813FDDF10CDF
              FDB700D56BF09EEEE678F62DF307C4255F25FDBEB3473C60C7D60A431FE7092A
              0F553267E5752426785836B79669B744E80C26F700846CEBB140D4289E3E5176
              15464DB79F82C94F51D62B404511AB5DE9C37F9675C3022276A7BBC07ADBBD32
              B528299E1D7CB3E066227A1215656584952C74331C13D76257CB03D65ECD055D
              A7E18FBFE06F5A3AB9F73E45E89200C7D691DDD846D598BB7FE55630300CDF79
              F7DBD68B75D65589909A7890D2B7343E6E4A65C1FC5ABADA06D9D6AB5A30262E
              10AA66C855D246156708C481126839CA928242565D12E09D67D89536223F7F40
              EEED76D999A6FF02F75BD6FB63574BC0112239E9A83C3D44B73F53DE0122A876
              8B603026EE300440B63B445C0014513225BB4BE6D199964CCEAD4FD3701140D5
              5A6E6B0D38CBBE31738324DE19A904B1FE2C80254A4C1C81D05C5296F595049A
              5B71792075880B7FAA57842DB8580F50455813001C175B796C3FD4945272CFF3
              DC7F0EE05D39E3B59EA066F4F49F0EF3F6CD95B75D9B00F82F06E8B15E158B95
              D61ADE78A38979BFC99224F4B261F127E4DFD142204E95FB115B5C7512F3C025
              AA6CCB12FBE579C3CCE728B7EFEF5CCAC2B4AB07178E99BE9A90BFD1163E07F0
              19EB1567186FF3DB8C9FDD97AE480ADE442F7DD3DDBCF9CA7E429A6AC7DDB6DE
              69F713DBF59F1D8D7F85D255ECFB493193EDDBDB1FE5F0B8194BC726A65F831E
              6DBF00A0FB22002BC9AC98A7040EB270553C3B0E0C22C9EBE5F6C96778F289C3
              848D1ECB9D3161A59746FFC21C423FFE1D71F696D71EE1E3490FAC1FA4680E39
              6476D9C2368095F5C42CB7ADB7A6C4D9A9B49310ADE4B53D9922E6E2CEBBEA89
              8ABF0D5597F300F694A37AAF63DD2C3A1E2A26D906D8B2881D63A63D58D0FF6B
              DF221292CE67744B11C64A5095FA3795EEF3006AC086D01C3E129DD2275C41C2
              A66203AB2EDD8EBBE5FEDE46F51E29C957D9F4D02666DB006F2D67A42FC8BBA3
              A6CEEA93396CB4AC587DE27C0F50949E50683EDB238AA33B06E2942BDD222895
              61AD49E9F5360C39151CFDB3FCB1D9469DC7C1C4592FD2742E4A7B9733FA7417
              2BE4E830511635F3AC0BE5998619CBE6B38F57E4BB7DC230A5FC75FB542A1FE4
              BE114B3C7BBFB5C7202A9F0DABFECDD85ABB34A6BD495E56DEB786967F69445F
              C5F83FC03F013528EA3FDF9955DC0000000049454E44AE426082}
            ExplicitLeft = 553
          end
          object lbErro: TcxLabel
            Left = 226
            Top = 0
            Align = alRight
            Caption = 'Desconto n'#227'o pode ser maior que o valor a ser pago'
            Style.TextStyle = [fsBold]
            Properties.Alignment.Vert = taVCenter
            Properties.WordWrap = True
            Width = 308
            AnchorY = 22
          end
        end
        object tsPassou: TcxTabSheet
          Caption = 'tsPassou'
          ImageIndex = 4
          object cxLabel3: TcxLabel
            AlignWithMargins = True
            Left = 450
            Top = 0
            Cursor = crHandPoint
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 5
            Margins.Bottom = 0
            Align = alRight
            Caption = 'R$3,50'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -32
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextColor = clYellow
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            AnchorX = 567
            AnchorY = 22
          end
          object cxLabel4: TcxLabel
            AlignWithMargins = True
            Left = 369
            Top = 0
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alRight
            Caption = 'Passou'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -19
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.TextColor = clYellow
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
            StyleFocused.TextStyle = [fsBold]
            Properties.Alignment.Vert = taVCenter
            AnchorY = 22
          end
        end
      end
    end
    object LMDSimplePanel7: TLMDSimplePanel
      Left = 1
      Top = 1
      Width = 574
      Height = 40
      Margins.Left = 0
      Margins.Top = 1
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Bevel.BorderSides = [fsBottom]
      Bevel.EdgeStyle = etRaisedInner
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsSingleRaised
      TabOrder = 2
      object lbTotalPagar: TcxLabel
        Left = 447
        Top = 1
        Align = alRight
        Caption = 'R$ 100,00'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -24
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.TextColor = clBlack
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        AnchorX = 573
        AnchorY = 20
      end
      object cxLabel6: TcxLabel
        AlignWithMargins = True
        Left = 7
        Top = 1
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Total '#224' Pagar'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.TextColor = clBlack
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        AnchorX = 97
        AnchorY = 20
      end
      object cbDebAnt: TcxCheckBox
        AlignWithMargins = True
        Left = 112
        Top = 4
        Cursor = crHandPoint
        Margins.Left = 15
        Align = alLeft
        Caption = 'Pagar d'#233'bitos anteriores'
        ParentFont = False
        Style.BorderStyle = ebsFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clRed
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 2
        Visible = False
        OnClick = cbDebAntClick
        Width = 265
      end
    end
    object panDesconto: TLMDSimplePanel
      Left = 1
      Top = 41
      Width = 574
      Height = 40
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 1
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Bevel.BorderSides = [fsBottom]
      Bevel.EdgeStyle = etRaisedInner
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsSingleRaised
      TabOrder = 3
      OnClick = panDescontoClick
      object lbDesc: TcxLabel
        AlignWithMargins = True
        Left = 7
        Top = 1
        Cursor = crHandPoint
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Desconto (F3):'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.HotTrack = True
        Style.TextColor = clBlack
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        StyleHot.BorderStyle = ebsNone
        StyleHot.TextStyle = [fsBold, fsUnderline]
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        OnClick = lbDescClick
        AnchorX = 107
        AnchorY = 20
      end
      object lbDesconto: TcxLabel
        Left = 447
        Top = 1
        Cursor = crHandPoint
        Align = alRight
        Caption = 'R$ 100,00'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -24
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.HotTrack = True
        Style.TextColor = clRed
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        StyleHot.BorderStyle = ebsNone
        StyleHot.TextStyle = [fsBold, fsUnderline]
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        OnClick = lbDescClick
        AnchorX = 573
        AnchorY = 20
      end
      object lbPercDesc: TcxLabel
        AlignWithMargins = True
        Left = 370
        Top = 1
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 20
        Margins.Bottom = 0
        Align = alRight
        Caption = '(10%)'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.HotTrack = True
        Style.TextColor = clRed
        Style.TextStyle = []
        Style.IsFontAssigned = True
        StyleHot.BorderStyle = ebsNone
        StyleHot.TextStyle = [fsUnderline]
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        OnClick = lbDescClick
        AnchorX = 427
        AnchorY = 20
      end
    end
  end
  object LMDSimplePanel2: TLMDSimplePanel
    AlignWithMargins = True
    Left = 15
    Top = 524
    Width = 576
    Height = 34
    Margins.Left = 15
    Margins.Top = 0
    Margins.Right = 15
    Margins.Bottom = 15
    Align = alBottom
    Bevel.Mode = bmCustom
    TabOrder = 1
    object btnSalvar: TcxButton
      Left = 0
      Top = 0
      Width = 97
      Height = 34
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Salvar (F2)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = btnSalvarClick
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
    end
    object cxButton3: TcxButton
      Left = 544
      Top = 0
      Width = 32
      Height = 34
      Cursor = crHandPoint
      Hint = 'Configurar op'#231#227'o para tela de pagamento'
      Align = alRight
      Default = True
      TabOrder = 1
      OnClick = cxButton3Click
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.Glyph.Data = {
        76060000424D7606000000000000360000002800000014000000140000000100
        2000000000004006000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000434343A36868
        68FF686868FF3030307300000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000636363F4666666FF666666FF4F4F4FC4000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000595959DB4A4A4AB4000000000000000000000000676767FF6767
        67FF676767FF656565FC000000000000000000000000676767FF5B5B5BE10000
        000000000000000000000000000000000000575757D6676767FF676767FF6767
        67FF36363685676767FF676767FF676767FF676767FF666666FF686868FF4141
        41A3676767FF676767FF676767FF5D5D5DE60000000000000000000000000000
        0000676767FF676767FF666666FF666666FF666666FF666666FF666666FF6565
        65FD656565FD666666FF666666FF666666FF676767FF676767FF676767FF4949
        49B40000000000000000000000000000000000000000676767FF666666FF6868
        68FF686868FF686868FF686868FF686868FF686868FF686868FF686868FF6666
        66FF676767FF676767FF676767FF000000000000000000000000000000000000
        000000000000444444A7666666FF686868FF686868FF686868FF686868FF6868
        68FF686868FF686868FF686868FF666666FF676767FF676767FF303030750000
        00000000000000000000000000000000000000000000676767FF666666FF6868
        68FF686868FF686868FF2929296300000000000000002E2E2E6E686868FF6666
        66FF676767FF676767FF676767FF0000000000000000000000002E2E2E6C4E4E
        4EBD636363F5676767FF666666FF686868FF686868FF2C2C2C6B000000000000
        000000000000000000003333337B666666FF676767FF676767FF676767FF6767
        67FF666666FC454545AA686868FF666666FF676767FF676767FF656565FD6868
        68FF686868FF0000000000000000000000000000000000000000000000006666
        66FF676767FF676767FF676767FF676767FF676767FF676767FF686868FF6666
        66FF676767FF676767FF656565FD686868FF686868FF00000000000000000000
        0000000000000000000000000000666666FF676767FF676767FF676767FF6767
        67FF676767FF676767FF454545A8646464FA666666FF666666FF666666FF6868
        68FF686868FF38383888000000000000000000000000000000004040409A6666
        66FF666666FF666666FF666666FF626262F54E4E4EC02D2D2D6E000000000000
        000000000000686868FF666666FF686868FF686868FF686868FF3E3E3E950000
        000000000000434343A0686868FF686868FF686868FF686868FF686868FF0000
        000000000000000000000000000000000000000000002B2B2B6A666666FF6666
        66FF666666FF666666FF666666FF666666FF666666FF666666FF686868FF6565
        65FD656565FD666666FF3D3D3D97000000000000000000000000000000000000
        000000000000656565FA676767FF676767FF676767FF676767FF676767FF6767
        67FF676767FF666666FF686868FF656565FD676767FE676767FF676767FF0000
        000000000000000000000000000000000000454545A7676767FF676767FF6767
        67FF676767FF676767FF676767FF676767FF676767FF666666FF686868FF6666
        66FF676767FF676767FF676767FF676767FF0000000000000000000000000000
        0000585858DA676767FF676767FF676767FF3C3C3C93676767FF676767FF6767
        67FF676767FF666666FF686868FF24242458666666FD676767FF676767FF5B5B
        5BE00000000000000000000000000000000000000000565656D5676767FF0000
        00000000000000000000606060EE676767FF676767FF666666FF000000000000
        000000000000454545A95D5D5DE5000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000004C4C4CB96767
        67FF676767FF666666FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000002B2B2B67676767FF676767FF464646AF000000000000
        0000000000000000000000000000000000000000000000000000}
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Flat = True
    end
    object btnCancelar: TcxButton
      AlignWithMargins = True
      Left = 112
      Top = 0
      Width = 74
      Height = 34
      Cursor = crHandPoint
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Cancel = True
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ModalResult = 2
      ParentFont = False
      TabOrder = 2
      OnClick = btnCancelarClick
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.AllowAllUp = True
      SpeedButtonOptions.Flat = True
    end
  end
  object LMDSimplePanel5: TLMDSimplePanel
    AlignWithMargins = True
    Left = 15
    Top = 423
    Width = 576
    Height = 86
    Margins.Left = 15
    Margins.Top = 0
    Margins.Right = 15
    Margins.Bottom = 15
    Align = alBottom
    Bevel.Mode = bmStandard
    Color = clWhite
    TabOrder = 2
    object cxLabel1: TcxLabel
      Left = 1
      Top = 1
      Align = alTop
      Caption = 'Observa'#231#245'es:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object meObs: TcxMemo
      Left = 1
      Top = 18
      Cursor = crHandPoint
      Align = alClient
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      StyleFocused.BorderStyle = ebsNone
      TabOrder = 1
      Height = 67
      Width = 574
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Scalable = True
    Left = 40
    Top = 128
    PixelsPerInch = 96
    object ValorStyle: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clHighlight
    end
    object EspStyle: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = 3815994
    end
    object EspStyle_Focus: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 11206655
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object ValorStyle_Focus: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 11206655
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object cxImageList1: TcxImageList
    Height = 48
    Width = 48
    FormatVersion = 1
    DesignInfo = 18350288
    ImageInfo = <
      item
        Image.Data = {
          36240000424D3624000000000000360000002800000030000000300000000100
          2000000000000024000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000222C
          134170923FD785AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF70923FD7222C134100000000000000007092
          3FD785AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF70923FD7000000000000000085AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFFF7F9F3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87AE4FFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF8DB358FFFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96B965FF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFFB5CD92FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF5F8F0FFC5D8AAFFA2C177FF92B55EFF92B55EFFA2C1
          77FFC5D8AAFFF5F8F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDD29EFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF97B966FFF5F8F0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCFDFB9FF8BB154FF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF8BB154FFCFDFB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F9F3FF9ABB
          6AFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFF93B65FFFA1BF74FFC4D7A8FFF8FAF5FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC1D5A4FF85AD4BFF85AD4BFF85AD4BFF85AD4BFFDAE6C9FFDAE6C9FF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFFC1D5A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FB
          F6FFC5D8AAFFA1C074FF93B65FFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6E3
          C2FF85AD4BFF85AD4BFF87AE4EFFA3C178FFBAD19AFFFFFFFFFFFFFFFFFFBBD1
          9BFF9FBE71FF85AD4BFF85AD4BFF85AD4BFFD6E3C2FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FBF7FF90B4
          5BFF85AD4BFFA8C57FFFF3F7EDFFFFFFFFFFF9FBF7FFFEFEFEFFFFFFFFFFFBFC
          FAFFFFFFFFFFDDE8CDFF8FB45AFF85AD4BFF90B45BFFF9FBF7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDDDB5FF85AD
          4BFF98B967FFFBFCFAFFFFFFFFFFC5D8AAFF88AF4FFFFDFDFCFFFFFFFFFF89AF
          50FFC7D9ACFFFFFFFFFFE6EEDAFF85AD4BFF85AD4BFFCDDDB5FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5C37BFF85AD
          4BFFACC785FFF2F6ECFFE3ECD6FF85AD4BFF85AD4BFFFEFEFEFFFFFFFFFF85AD
          4BFF85AD4CFFF8FAF5FFFFFFFFFF96B965FF85AD4BFFA5C37BFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8CB256FF85AD
          4BFF85AD4BFF85AD4BFF8BB154FF85AD4BFF86AD4CFFFFFFFFFFFFFFFFFF85AD
          4BFFA9C580FFFEFEFEFFFBFCF9FF8CB256FF85AD4BFF8CB256FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFBF7FF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF88AF4FFFA6C37CFFFFFFFFFFFFFFFFFFEDF3
          E5FFFFFFFFFFFBFCFAFFB2CB8DFF85AD4BFF85AD4BFF85AD4BFFFAFBF8FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FBF6FF85AD4BFF85AD
          4BFF85AD4BFF8DB257FFC8DAAEFFF6F9F2FFFFFFFFFFFFFFFFFFFEFEFEFFE6EE
          DAFFC9DAAFFF96B864FF85AD4BFF85AD4BFF85AD4BFF85AD4BFFF9FBF7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8CB256FF85AD
          4BFF86AD4CFFE6EEDAFFFFFFFFFFE6EEDAFFAEC887FFFDFEFCFFFDFDFCFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF8CB256FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5C37BFF85AD
          4BFF98BA68FFFFFFFFFFFFFFFFFF8DB358FF85AD4BFFFDFDFCFFFDFDFCFF85AD
          4BFF8AB052FF93B660FF85AD4BFF85AD4BFF85AD4BFFA5C37BFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDDDB6FF85AD
          4BFF8DB256FFFAFBF8FFFFFFFFFFADC786FF85AD4BFFFDFDFCFFFDFDFCFF85AD
          4BFFC5D8A9FFFFFFFFFFD9E5C7FF85AD4BFF85AD4BFFCDDDB5FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FBF7FF90B4
          5BFF85AD4BFFAFC988FFFAFCF8FFFEFEFEFFE4EDD8FFFEFEFEFFFEFEFEFFE6EE
          DAFFFFFFFFFFF2F6ECFF99BA69FF85AD4BFF90B45BFFF9FBF7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6E3
          C3FF85AD4BFF85AD4BFF92B65EFFBCD29CFFD2E1BDFFFDFDFCFFFDFEFDFFD4E2
          C0FFB7CF95FF8BB154FF85AD4BFF85AD4BFFD6E3C3FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF1
          E0FFB5CD92FF96B965FF88AF50FF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFF88AF50FF97B966FFBCD29DFFF5F8F0FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC2D6A5FF85AD4BFF85AD4BFF85AD4BFF85AD4BFFD9E5C7FFDDE8CEFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFFC2D6A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0DFBAFF87AE
          4EFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF93B660FFF2F6EDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFD0DFB9FF8BB155FF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF8BB155FFD0DFB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9F0DEFF87AE4DFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFFB3CC90FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF5F8F0FFC5D8AAFFA3C177FF92B65EFF92B65EFFA3C1
          77FFC5D8AAFFF5F8F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3CC90FF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF8DB257FFFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95B762FF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF000000000000000085AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFFF7F9F3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87AE4EFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF00000000000000007092
          3FD785AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF70923FD70000000000000000222C
          134170923FD785AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF70923FD7222C134100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36240000424D3624000000000000360000002800000030000000300000000100
          2000000000000024000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000201010349311A68875A2FC0AD743CF6B3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFAD743CF6875A2FC049311A68020101030000000000000000000000000403
          020681572EB8B3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFF81572EB8040302060000000000000000593C
          207FB3783EFFBB8753FFE7D4C2FFFCFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFCFAF8FFE7D4C2FFBB8753FFB3783EFF593C207F00000000000000009664
          34D5B3783EFFEDDFD2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFEDDFD2FFB3783EFF966434D50000000000000000B177
          3DFCB3783EFFFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFDFDFFB3783EFFB1773DFC0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFF919191FF9E9E9EFF9090
          90FF929292FFC0C0C0FF838383FFB2B2B2FF909090FF9F9F9FFF9A9A9AFFA6A6
          A6FF989898FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FF858585FFACACACFF9797
          97FF9A9A9AFF979797FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFF969696FF9E9E9EFF939393FF7C7C
          7CFFBCBCBCFF9C9C9CFFB7B7B7FF9D9D9DFF9A9A9AFF979797FFA9A9A9FFB9B9
          B9FF9A9A9AFFC7C7C7FFB2B2B2FFB4B4B4FFC7C7C7FFBDBDBDFF9A9A9AFF8282
          82FF858585FF989898FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFABABABFF9A9A9AFFACACACFF9A9A
          9AFFC5C5C5FFA8A8A8FFA4A4A4FFA8A8A8FF9E9E9EFFA6A6A6FF9E9E9EFFBEBE
          BEFFB0B0B0FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFA8A8A8FFA4A4A4FFA6A6
          A6FFA8A8A8FFADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFB4B4B4FFA1A1A1FFB2B2B2FFA1A1
          A1FFB4B4B4FFA8A8A8FFC7C7C7FFB7B7B7FFC7C7C7FFC4C4C4FFA1A1A1FFC0C0
          C0FFBBBBBBFFB7B7B7FFC7C7C7FFA8A8A8FFB5B5B5FFC7C7C7FFB0B0B0FFB4B4
          B4FFA9A9A9FFBCBCBCFFC1C1C1FFBEBEBEFFA6A6A6FFC7C7C7FFC0C0C0FFA1A1
          A1FFC4C4C4FFBEBEBEFFBCBCBCFFA1A1A1FFBCBCBCFFA1A1A1FFB4B4B4FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C7FF9B9B9BFFB5B5B5FF9C9C
          9CFFC1C1C1FF8E8E8EFF979797FF7D7D7DFFBBBBBBFFC6C6C6FFAFAFAFFF9090
          90FF929292FF989898FFC1C1C1FF888888FF939393FFC7C7C7FFADADADFF8181
          81FF898989FFC0C0C0FF9A9A9AFF8F8F8FFF979797FFBBBBBBFFC3C3C3FFA4A4
          A4FF8E8E8EFF858585FFA5A5A5FFA8A8A8FF9E9E9EFF969696FFBEBEBEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B3FF999999FFB7B7B7FF8D8D
          8DFFB6B6B6FF858585FFC0C0C0FF6D6D6DFFC7C7C7FFC7C7C7FF818181FFBABA
          BAFFB4B4B4FFAAAAAAFF979797FF858585FF929292FFC7C7C7FF909090FF8C8C
          8CFF868686FFB8B8B8FF878787FF9A9A9AFF979797FFC7C7C7FFB9B9B9FF8B8B
          8BFFC1C1C1FF7E7E7EFFAFAFAFFF999999FFA8A8A8FFABABABFF969696FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B378
          3EFFB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EFFB3783EFF0000000000000000B076
          3DFBB3783EFFFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFDFDFCFFB3783EFFB0763DFB00000000000000009161
          32CEB3783EFFE9D9C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE9D9C9FFB3783EFF916132CE00000000000000004F36
          1D70B3783EFFB8824CFFE1C9B2FFF6EFE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF6EFE8FFE1C9B2FFB8824CFFB3783EFF4F361D7000000000000000000201
          01037A522BADB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFF7A522BAD0201010300000000000000000000
          0000000000003B28155479512AAD9E6A37E1B3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFF9E6A37E179512AAD3B281554000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36240000424D3624000000000000360000002800000030000000300000000100
          2000000000000024000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000906
          030D583B1F7E8F6032CCB0763DFBB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFAD743CF6875A2FC0493119680201010300000000120C061A9A67
          35DBB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFF81572DB804030106775029AAB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFF593C1F7FAF753DF9B378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFF966434D5B3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB1773DFCB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFD7B99AFFDEC5ACFFD8BA9CFFDEC5ADFFDDC4
          ABFFC79B71FFE5D2BEFFCEA883FFDFC6AEFFD7B99AFFDABDA1FFD3B392FFDBC0
          A5FFDBBFA4FFC49668FFC49668FFC49668FFC49668FFE4CFBBFFD0AC89FFDBC0
          A5FFDBBFA4FFDABDA1FFDBC0A5FFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFDCC1A7FFD8BA9CFFDDC4AAFFE9D8C8FFC89E
          75FFD9BB9EFFCBA47DFFD9BB9EFFDABDA2FFDBC0A4FFD3AF8EFFCAA17AFFE6D3
          C0FFDABDA1FFC49668FFCEA883FFCDA680FFC49668FFC89E75FFDABDA1FFE6D3
          C0FFDABDA1FFE4D0BDFFDABEA3FFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFD2AF8CFFDABDA1FFD1AD8BFFDABDA2FFC496
          6AFFD3B08FFFD5B495FFD3B08FFFD8BA9CFFD3B392FFD8BA9DFFC89D73FFD3B3
          92FFCFAA85FFC49668FFC49668FFC49668FFC49668FFD3B08FFFD5B495FFD3B3
          92FFCFAA85FFD3B08FFFD0AB88FFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFCDA680FFD6B698FFCEA883FFD6B698FFCDA6
          80FFD3B08FFFC49668FFCBA47DFFC49668FFC4976CFFD6B798FFC79B70FFD3B1
          8FFFC99F76FFCBA47DFFC49668FFD3B08FFFCCA57EFFC49668FFCFAA85FFCDA6
          80FFCDA681FFD2AF8DFFC89F76FFC69A6FFFC89D73FFD3B392FFC49668FFC79B
          71FFD6B697FFC4986CFFC89D74FFC89F76FFD6B697FFC89E75FFD6B698FFCDA6
          80FFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFC49668FFDABCA0FFCCA57FFFD9BB9EFFC69A
          6FFFE0C8B1FFDBC0A4FFE8D7C6FFC99F76FFC49668FFCFAB86FFDFC7AFFFDEC5
          ACFFDDC4ABFFDABEA3FFC69A6FFFE3CEB9FFDDC4ABFFC49668FFD0AC88FFE7D4
          C2FFDDC4ABFFE3CDB8FFC79B71FFDABDA1FFDFC7AFFFDBC0A5FFC9A077FFC598
          6CFFD5B495FFE0C8B0FFE4D0BCFFD4B393FFD3B08FFFD7BA9CFFDCC1A7FFC89D
          74FFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFCDA681FFDABEA2FFCBA47CFFE0C8B1FFCCA4
          7EFFE4CFBCFFC79B70FFF0E5DAFFC49668FFC49668FFE7D3C1FFCAA179FFE7D4
          C2FFCDA680FFD2AF8CFFDCC1A5FFE4CFBCFFDEC4ABFFC49668FFDFC6AEFFE1CA
          B3FFDFC6AEFFE4CFBAFFCBA27BFFE3CEB9FFDABDA1FFDBC0A4FFC49668FFCAA1
          7AFFE1CBB5FFC69A6FFFE8D6C5FFCFAB87FFDABEA2FFD3B18FFFD1AE8CFFDCC1
          A6FFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3793FFFB77F48FFB57B43FFB9844FFFB57C
          44FFB9844FFFB3783EFFB7804AFFB3783EFFB3783EFFBB8754FFB57D45FFB780
          4AFFB8814BFFBB8754FFB8824CFFB8824CFFB57D45FFB3783EFFB67E46FFB780
          4AFFB57D45FFB8824CFFB9834EFFBB8754FFB3793FFFBB8753FFB3783EFFB47A
          41FFBB8754FFB47B42FFB67D46FFB47B42FFBB8753FFB3793FFFBA8450FFB47B
          42FFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFCDA781FFF9F4EFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFCFFB47A40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFE2CD
          B7FFB37940FFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFFAF6F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFCFFB47A40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC5986CFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB47A40FFB47A40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFCFFB47A40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC89D74FFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB47A40FFB47A40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFCFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB47A40FFB47A40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFCFFB47A40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC89D74FFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB47A40FFB47A40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFCFFB47A40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC89D74FFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB47A40FFB47A40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFCFFB47A40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC89D74FFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB47A40FFB47A40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFCFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB47A40FFB47A40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFCFFB47A40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC89D74FFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFFAF6F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFCFFB47A40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC39466FFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFCEA782FFF9F5F1FFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFCFFB47A40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFDFC6
          ADFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB0763DFBAC733CF5B378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFF916132CE704B27A0B378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFF4F351B700D0804129262
          33D0B3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFF79512AAD02010103000000000403
          01064931196882572DB9A26D38E7B3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFF9E6A37E179512AAD3B2814540000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36240000424D3624000000000000360000002800000030000000300000000100
          2000000000000024000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000202A
          123E6E8E3ED284AC4BFE85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF70923FD7222C134100000000000000006E8E
          3ED285AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF739641DD000000000000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF88AF50FF85AD4BFF040502070000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1FFD1D1D1FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFBABABAFFEEEEEEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF88AF50FF85AD4BFF040502070000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACACACFFE7E7E7FFFDFD
          FDFFD4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFB5B5B5FFEFEFEFFFF8F8F8FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF88AF50FF85AD4BFF040502070000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBEBFF878787FFA2A2
          A2FF9A9A9AFF818181FFAEAEAEFF8E8E8EFFF8F8F8FF616161FF878787FFB2B2
          B2FF959595FF9E9E9EFFBABABAFFDEDEDEFFD4D4D4FFFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF88AF50FF85AD4BFF040502070000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFFFFFFFFFFADADADFFA6A6A6FFA6A6A6FFA6A6
          A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFEEEEEEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9D9FFE4E4E4FFD1D1
          D1FFB9B9B9FFCFCFCFFF949494FFFEFEFEFFFFFFFFFFFEFEFEFFC6C6C6FF9292
          92FFD1D1D1FFB2B2B2FF9D9D9DFF7D7D7DFF404040FF676767FFB6B6B6FF8787
          87FFDEDEDEFFFFFFFFFFFFFFFFFF88AF50FF85AD4BFF040502070000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C4FFBFBF
          BFFFC9C9C9FFCCCCCCFFAAAAAAFFC7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFC5C5
          C5FF868686FFFFFFFFFFFFFFFFFFFFFFFFFFC9C9C9FFE7E7E7FF707070FFBABA
          BAFFE4E4E4FFFFFFFFFFFFFFFFFF88AF50FF85AD4BFF040502070000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFFFFFFFFFFADADADFFA6A6A6FFA6A6A6FFA6A6
          A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFBCBCBCFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFB
          FBFFD3D3D3FFF8F8F8FFFAFAFAFFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFDBDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFABABABFFFAFAFAFF9393
          93FFCCCCCCFFFFFFFFFFFFFFFFFF88AF50FF85AD4BFF040502070000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7
          F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7
          F7FFDDDDDDFFFFFFFFFFFFFFFFFF88AF50FF85AD4BFF040502070000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262
          62FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
          69FF626262FFFFFFFFFFFFFFFFFF88AF50FF85AD4BFF040502070000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFFFFFFFFFF7B7B7BFF626262FF626262FF6262
          62FF626262FF626262FF626262FF626262FF626262FF626262FF626262FF6262
          62FF626262FF626262FF626262FF626262FF626262FF626262FF626262FF6262
          62FF626262FF626262FF626262FF626262FF626262FFB9B9B9FFFFFFFFFF6262
          62FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF626262FFFFFFFFFFFFFFFFFF86AE4EFF85AD4BFF020301040000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262
          62FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF626262FFFFFFFFFFFFFFFFFF86AE4DFF85AD4BFF020301040000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFFADADADFFA6A6A6FFA6A6A6FFA6A6A6FFF7F7
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262
          62FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF626262FFFFFFFFFFFFFFFFFF86AE4DFF85AD4BFF020301040000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262
          62FF626262FF626262FF626262FF626262FF626262FF626262FF626262FF6262
          62FF626262FFFFFFFFFFFFFFFFFF86AE4DFF85AD4BFF020301040000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF86AE4DFF85AD4BFF020301040000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF86AE4DFF85AD4BFF020301040000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFF7B7B7BFF626262FF626262FF626262FF6262
          62FF626262FF626262FF626262FF626262FF626262FF626262FF626262FF6262
          62FFD7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8FFA6A6A6FFA6A6
          A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFFCFCFCFFA8A8A8FFA6A6A6FFA6A6
          A6FFA6A6A6FFFCFCFCFFFFFFFFFF86AE4DFF85AD4BFF020301040000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF86AE4DFF85AD4BFF020301040000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFF7B7B7BFF626262FF626262FF626262FF6262
          62FF626262FF626262FF626262FFD7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8FFA6A6A6FFA6A6
          A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6
          A6FFA6A6A6FFFCFCFCFFFFFFFFFF86AE4DFF85AD4BFF020301040000000083AA
          4AFB85AD4BFFFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF86AE4DFF85AD4BFF020301040000000085AD
          4BFF85AD4BFFFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF86AE4DFF85AD4BFF040502080000000083AA
          4AFB85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF020301040000000083AA
          4AFB85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF02030104000000006E8E
          3ED285AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF729440DA0000000000000000202A
          123E6E8E3ED284AC4BFE85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF70923FD7222C134100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36240000424D3624000000000000360000002800000030000000300000000100
          2000000000000024000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000045311D60AD7A48F0B8824DFFB8824DFFB882
          4DFF735230A00000000000000000000000000000000000000000000000007352
          30A0B8824DFFB8824DFFB8824DFFAD7A48F045311D6000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000017100A20B8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFF000000000000000000000000000000000000000000000000B882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000045311D60B8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFF2E2113400000000000000000000000000000000017100A20B882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF17100A20000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000A27244E0B8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF735230A0000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000051392270B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF2E2113400000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000023180E30B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFAD7A48F02318
          0E30000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000C08
          0510A27244E0B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFF875F38BB0000000000000000B882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFAD7A
          48F02E2113400000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008B62
          3AC0B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFF875F38BB0000000000000000B882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFF68492B900C080510000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000735230A0B882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFAC7948EE875F38BB624529884A341F6600000000000000009368
          3ECCB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFA27244E045311D600000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000045311D60B8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFAC79
          48EE4A341F660000000000000000000000000000000000000000000000000000
          000019110A22875F38BBB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFA27244E05C4127800C0805100000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002E211340B8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFF0C0905110000000000000000000000000000000000000000000000000000
          00000000000000000000875F38BBB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFAD7A48F03A29
          1850000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000C080510AD7A48F0B8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFF4A341F663D2B1A557B5733AA9F7143DDB8824DFFB8824DFF93683ECC251A
          0F33000000000000000019110A22B8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFF5C4127800C08051000000000000000000000000000000000000000000000
          0000000000000000000000000000735230A0B8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFAC7948EEB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF9F71
          43DD0000000000000000000000009F7143DDB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFF2E21134000000000000000000000000000000000000000000000
          000000000000000000000C080510AD7A48F0B8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFAC79
          48EE000000000000000000000000875F38BBB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFAD7A48F05C412780000000000000000000000000000000000000
          0000000000000000000051392270B8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF4A34
          1F660000000000000000000000009F7143DDB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFF000000000000000000000000000000000000
          00005C412780B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF7B5733AA312315440000
          0000000000000000000031231544B8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFF000000000000000000000000000000000000
          0000AD7A48F0B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFF9F7143DD563D24770C09051100000000000000000000
          0000000000000C09051193683ECCB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFF000000000000000000000000000000000000
          0000B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFF6E4E2E990C090511000000000000000000000000000000000000
          00003123154493683ECCB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFF000000000000000000000000000000000000
          0000B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFF7B5733AA00000000000000000000000000000000000000003D2B1A55875F
          38BBB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFF68492B90000000000000000000000000000000000000
          00005C412780B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFF251A0F330000000000000000000000004A341F669F7143DDB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFAD7A
          48F0735230A02E21134000000000000000000000000000000000000000000000
          0000000000000000000017100A20B8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFF00000000000000000000000062452988B8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF5C41
          2780000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000735230A0B8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFF0C09051100000000000000007B5733AAB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFAD7A48F00C08
          0510000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000017100A20AD7A48F0B8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFF4A341F6600000000000000000C0905116E4E2E99AC7948EEB8824DFFAC79
          48EE7B5733AA31231544B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF45311D600000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000005C412780B8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFAC7948EE0C09051100000000000000000000000000000000000000000000
          000000000000000000007B5733AAB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFA27244E0000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000966A3FD0B8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFAC7948EE4A341F66000000000000000000000000000000000000
          000000000000000000006E4E2E99B8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF2E211340000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000017100A20AD7A48F0B882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFAC7948EE6245298800000000000000006245
          2988875F38BBAC7948EEB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFF45311D6000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000023180E30AD7A
          48F0B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFF875F38BB0000000000000000B882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFF735230A00000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000002318
          0E30A27244E0B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFF875F38BB0000000000000000B882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFAD7A48F00C0805100000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000C0805107F5A35B0B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFF735230A0000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000002E211340A27244E0B8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFF45311D60000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002E2113407F5A35B0B8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFF966A3FD08B623AC08B623AC0AD7A48F0B8824DFFB882
          4DFFB8824DFFB8824DFF17100A20000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000C0805103A29
          18505C4127807F5A35B08B623AC08B623AC08B623AC08B623AC08B623AC06849
          2B9045311D6017100A200000000000000000000000000C0805105C412780B882
          4DFFB8824DFFA27244E000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000004531
          1D60B8824DFF735230A000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00005C4127803A29185000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object cxHintStyleController1: TcxHintStyleController
    HintStyleClassName = 'TcxHintStyle'
    HintStyle.CaptionFont.Charset = DEFAULT_CHARSET
    HintStyle.CaptionFont.Color = clWindowText
    HintStyle.CaptionFont.Height = -11
    HintStyle.CaptionFont.Name = 'Tahoma'
    HintStyle.CaptionFont.Style = []
    HintStyle.Font.Charset = DEFAULT_CHARSET
    HintStyle.Font.Color = clWindowText
    HintStyle.Font.Height = -11
    HintStyle.Font.Name = 'Tahoma'
    HintStyle.Font.Style = []
    Left = 128
    Top = 128
  end
  object cxImageList2: TcxImageList
    Height = 48
    Width = 48
    FormatVersion = 1
    DesignInfo = 13631776
    ImageInfo = <
      item
        Image.Data = {
          36240000424D3624000000000000360000002800000030000000300000000100
          2000000000000024000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          0001000000010000000100000001000000010000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000001000000040000000E000000190000
          001F0000002400000025000000240000001F000000170000000C000000030000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000300000010000000290000004A000000680000
          007B000000860000008B000000870000007A0000006300000043000000240000
          000E000000030000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001000000050000001A0003054D001E2A8E003B56B600557CD60068
          98ED006D93F2006795EE005176D4003148B4000F179D00010197000000780000
          00470000001B0000000400000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00010000000D0000002B00212F7C00618EE41386B0F825A3CAFC1EAAD0FD089E
          CEFE0092C6FE0088BAFD007BADFD006FA2FD006A9BFC004E75D9001019A00000
          0090000000590000001E00000004000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          000E00040643002A3B96057AAAF744B5CEF33EC2E0FE1FAED7FF12A0CCFF0594
          C5FF0090C2FF008ABEFF007FB2FF0072A6FF00699AFE006A9CFC006A9BFA0029
          3CAD000000920000005000000011000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000040018
          214D006993E224A0C5FD3FC0DDFE2AB6DAFF0FA4D2FF0094C9FF008BC0FF007F
          B4FF0077ABFF0577A8FF2195BCFF2EA8CCFF0977A7FF00699DFF0079AAFA006A
          9CF7001E2CA40000007B00000021000000010000000100000002000000030000
          0002000000010000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000080B1A0071
          9FE550C3D5F760D8EAFE5FD8EBFF66DDEDFF6ADFEFFF66DDEDFF60D7EAFF53C9
          E0FF3EB2D1FF1585B1FF005D94FF0B7FAEFF41C4E0FF29A6CAFF017EB1FF007B
          AAF2005C87E30000008B000000320000001A00000022000000290000002B0000
          0029000000230000001B00000010000000060000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000002B3D5F209A
          BEF584F1F7FE85F2F7FF7EEDF5FF76E7F3FF70E3F1FF68DFEFFF62DAEBFF5BD7
          EAFF56D3E9FF5BD9ECFF54C7DDFF1B8AB5FF0080B4FF32BCDDFF2DB5D9FF028E
          BFFD006898F6000102970000006000000067000304800003058C0002038F0000
          008D000000830000006E000000500000002E0000001400000004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000003950783BB3
          D1FA87F4F9FF79E9F3FF72E5F1FF6CE1EFFF65DDEDFF5FD8EBFF59D4E9FF52D0
          E7FF4CCCE4FF46C8E2FF3FC4E1FF46C9E4FF27A5CBFF0B99C9FF2BB6DAFF16A4
          CFFE005D89E9000D12A3003A54B600618FE20070A0F6006F9FF8006B9BF6005E
          8AE300405EC2001B28A40004059B00000083000000520000001F000000050000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000045618C51C8
          E0FE7AEBF5FF70E4F1FF6AE0EFFF64DBECFF5DD7EAFF57D3E8FF50CFE6FF4ACB
          E4FF44C6E2FF3EC2E0FF37BEDEFF31B9DBFF32BBDDFF1DA8D1FF21AFD7FF17A5
          CFFE0070A3FB0A83B3FC27A5CAFD21ABD1FC099ECEFE0090C4FE0083B7FE0078
          ACFD006DA1FD006B9CFE00608BED001E29A70000009400000058000000140000
          0001000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000506D9845BE
          D9F973E6F1FF68DEEEFF62DAECFF5BD6EAFF55D2E7FF4FCDE5FF49C9E3FF42C5
          E1FF3CC1DFFF35BDDDFF2FB8DBFF29B4D9FF23B0D7FF21AFD5FF18AAD4FF0994
          C5FE34ACCDFE5ED7EAFE43C6E2FF41C4E1FF3DC1E1FF3DBFDDFF3BB6D6FF31A7
          CAFF1583AFFF006397FF0074A8FD006E9FFB002A3AAE00000082000000240000
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000003549621193
          BEF26DDFEDFC61DAECFF5AD5E9FF53D0E7FF4DCCE5FF47C8E3FF40C4E0FF3AC0
          DEFF34BBDCFF2EB7DAFF27B3D8FF21AFD6FF1AACD4FF18AAD5FF0D9BC9FC29A6
          CCFF82F1F8FF79EAF4FF81EEF7FF78E9F4FF6DE2F0FF66DDEDFF5ED9ECFF58D5
          E9FF5CD9EDFF57CDE1FF2DA2C6FF0083B5F900618FEF0001018E0000002A0000
          0002000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000030405006B
          91C021A3CAF85BD3E7FD53D1E7FF4CCCE4FF45C7E2FF3FC3E0FF38BEDEFF32BA
          DCFF2CB6DAFF25B2D8FF1FAFD6FF19AAD5FF13A4CFFD078BBCFD007BAFFD53C7
          DEFE88F5FAFF78E8F3FF6FE3F0FF68DEEEFF60D9EBFF59D4E9FF52D0E6FF4BCB
          E4FF43C6E1FF3CC1E0FF3CC2E0FF36B7D8FE006A9BF90002038F0000002C0000
          0003000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000009
          0C1000658AAC0A98C6FB36B8D8FC46C6E0FE3FC4E0FF36BDDEFF30B9DBFF2AB5
          D9FF25B2D7FF1EADD6FF18AAD5FF10A0CEFE0385B7FC00405BBD003950B057CC
          E2FE77E8F3FF6DE2F0FF66DDEDFF5ED8EBFF57D3E8FF50CEE6FF49C9E3FF41C4
          E1FF3AC0DEFF33BBDCFF2BB6DAFF2DB7DBFE0777A5FB000305890000002A0000
          0006000000030000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000002E3F4C00688EBF018FC0FD109BC8FE30B5D7FE2DB5D8FE20AE
          D6FF14A7D3FF0C9AC9FF0587B8FE007AABFE006A97F100567EE100587AD154CC
          E2FE6EE2F1FF64DBECFF5CD7EAFF55D2E7FF4ECDE5FF46C8E3FF3FC3E0FF38BE
          DEFF31B9DBFF2AB5D9FF22B0D7FF1CADD5FE0474A6F900040579000000370000
          002C000000270000001200000004000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000003042660E8DB8FA5ED5E6FD55D2E8FF37BEDDFF1AAA
          D4FF0098CBFF008CBFFF0080B3FF0074A7FF006699FD006795F00072A2F61BA3
          CDFE68DDEDFE5BD6EAFF53D0E7FF4CCBE4FF44C7E2FF3DC2E0FF36BDDDFF2FB8
          DBFF27B3D8FF20AED7FF1AACD6FF0C94C5FE004568C10000007E0006007B0005
          00890000007E0000004D0000001F000000070000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000001005678A55DCEDFFB72E5F1FF4ECDE5FF31BADCFF14A7
          D2FF0095C9FF008ABDFF007EB1FF0072A5FF00699BFF0075A8FF0077A7EF0079
          ABF617A0CBFE4BC9E2FE4ECCE5FE44C7E2FF3CC1E0FF35BDDDFF2EB8DBFF26B3
          D9FF1FAFD7FF17A9D5FF0991C7FF005E8CDF01200CA7034104C2027306F80361
          06EB001401A300000096000000650000002E0000000E00000002000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000001005C82B168D8E8FE69E0EFFF4CCCE5FF36BDDEFF25B2
          D8FF14A4D0FF0F98C5FF0785B6FF0071A4FF00689BFF0079ACFF0088BBFC0066
          96F4002939A2006F99D10E9BC8FD1DA5CEFE22ABD2FF20A9D1FE18A4D1FF109B
          CEFF078EC7FE017FA8FE05775EFC08720CF506890CFF049A0AFF029D06FD0A8C
          12FD016F03FD003001B6000300A00000007B0000004200000018000000050000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000001007CACE175E0E9F975E7F3FF73E6F2FF6DE1F0FF4ECD
          E5FF2CB6DAFF0AA1D0FF0194C6FF0186B8FF0075A8FF0073A6FF0085B3F70069
          99F500080CA10000007F00131A54002F446F003B568E003A569E01434EB30666
          47DE0C7C2AF80C8B11FE0B9B11FF08A311FF06A10DFF049E09FF019B05FF129A
          21FD007F00FF007703FF015003DC000B00A20000008F0000005A000000260000
          000A000000010000000000000000000000000000000000000000000000000000
          000000000000000102050084B6F37DE5EAF67AEBF5FF7BEAF4FF5FD9EBFF44C7
          E2FF29B4D9FF0DA2D1FF0093C7FF0085B9FF0078ACFF00699DFF006B9DFE0073
          A5F9005C89E50006099E000000830006007A052608990D5B12CC11901CFD109D
          1DFF0DA61AFF0BA618FF09A314FF08A211FF069F0DFF049D09FF019B04FF1AA7
          2EFE007F00FF008000FF007A00FF006603F8002100AA0001009D000000710000
          0039000000130000000400000000000000000000000000000000000000000000
          0000000000000004060C0087B7F66BD3DDF071E4F1FF5FD8EBFF35BDDDFF12A6
          D2FF0A99CAFF1396C2FF219AC2FF35ABCBFF43C1DCFF31ACCEFF1184B2FF007E
          B1FE0075A6F3024C44C70D5218BD40894DF612A029FF12AA26FF10AB23FF0FA9
          1FFF0DA61BFF0BA418FF09A214FF08A110FF069F0DFF049D09FF019A03FF23B4
          3DFE008100FF008000FF007E00FF007D00FF007001FE004000CB000600A10000
          00860000004F0000001F00000007000000010000000000000000000000000000
          00000000000000080B190086B5F15ED2E3FA5ED8EBFF41C4E1FF24B1D7FF089F
          CEFF0091C4FF0086B9FF007AAEFF006CA0FF00659BFF199AC4FF38C1E1FF22AC
          D5FF12949AFE679F67FFA09E9FFF9B949AFF0FAF24FF12AB26FF10A922FF0FA8
          1FFF0DA61BFF0BA418FF09A214FF07A010FF069F0CFF029B05FF009700FF2EC6
          51FF007F00FF008200FF008000FF007E00FF007D00FE007500FE005B00EE0015
          00A400000097000000670000002F0000000D0000000100000000000000000000
          000000000000002D3E581FA4C9F77AEBF4FF52D0E7FF37BDDDFF19ABD5FF0098
          CCFF008CC1FF007FB4FF0075AAFF00699DFF00689CFF007AAEFF0D9AC8FF20B1
          D9FF48A5C4FFAEA5A5FFA5A4A5FF999899FF0DAE24FF12AB26FF10A922FF0FA8
          1FFF0DA61BFF0BA416FF07A011FF059E0BFF12AB21FF2DC64CFF46DF76FF46E0
          7DFF31C554FF028602FF008000FF008000FF007E00FF007C00FF007800FE006B
          00FE003200B9000200A00000007A000000370000000900000000000000000000
          00000000000000516D8C41BEDBF977E8F3FF74E5F2FF75E6F2FF79E9F3FF79EA
          F4FF72E5F2FF65DBEBFF54CBE0FF40AECCFF1A82ACFF0079AEFF0192C4FF0DA8
          D6FF6EA7B9FFADA9A9FFA8A8A8FF9E9C9DFF0DAE23FF12AB26FF10A922FF0EA7
          1DFF0AA315FF15AE26FF2FC84FFF47E076FF48E17DFF3ED773FF37D06AFF35CE
          68FF37D16CFF3FD871FF139D21FF007F00FF007F00FF007D00FF007B00FF007A
          00FE006F00FE005000DF000A009C000000630000001700000000000000000000
          000000000000005F81A35BD2E5FB89F4F9FF79EAF3FF71E3F0FF67DEEEFF5FD8
          EBFF57D3E8FF4ECDE5FF46C9E3FF3FC4E2FF46CAE5FF44C0DBFF0B96C6FF88AE
          BBFFB6B0AEFFAFAEAEFFADADADFFA2A0A1FF0BAD21FF0FA921FF18B12CFF31CA
          51FF46DF75FF49E27FFF3ED772FF37D06AFF35CE68FF3BD46EFF3DD670FF2FC7
          61FF30C761FF2FC55FFF39D16DFF2ABA49FF008200FF007E00FF007D00FF007B
          00FF007900FE007400FE003500BA0000007B0000001F00000001000000000000
          000000000000006C92B35ED6E6FB79E9F3FF6DE2F0FF65DCEDFF5DD7EAFF54D1
          E7FF4CCCE4FF44C6E2FF3CC1DFFF34BBDCFF2CB6DAFF22B1D8FF48B8D5FFC0B6
          B4FFB4B4B4FFB2B2B2FFB2B1B1FFA3A2A2FF27CD4CFF43E073FF4BE580FF3FD8
          73FF38D16BFF36CF69FF3CD56FFF49E27CFF59F28CFF62FB95FF64FD97FF51E9
          83FF31C55FFF2BBE58FF2BBC56FF2CBD58FF34C75FFF0F9519FF007D00FF007D
          00FF007A00FF007900FF004A00D30000008A0000002700000001000000000000
          000000000000005C7D96229DBEE472E2EFFC64DCEEFF5AD5EAFF52D0E6FF4ACA
          E4FF42C5E1FF3ABFDEFF31BADCFF29B4D9FF21AFD6FF13A9D5FF3DACCCFFC0BA
          B9FFB8B8B8FFB5B9B6FFBCC7BFFFC4CFC8FF98B5A3FF4CC073FF33D369FF3BD6
          6FFF47E07AFF55EE88FF5DF690FF5BF48EFF5CF58FFF5DF690FF5DF691FF60F9
          94FF61FA95FF45D974FF29B954FF27B551FF27B34FFF2CBB55FF20AA38FF007E
          00FF007C00FF007B00FF006300F0000000920000003200000005000000000000
          00000000000000101418007DAAD21DA4A7F450D0C7FF51CEEDFF49C9EAFF3FC3
          E5FF37BEE1FF2FB8DFFF27B3DCFF1EACDAFF10A5D6FF33A9CDFFB2BDC0FFCCCE
          CCFFD9DCDAFFE1E4E2FFDBDADAFFCECDCDFFC5C1C3FFB2ABAFFF82A48DFF60D7
          87FF53F689FF57F18CFF59F28EFF5BF490FF5BF490FF56EF8AFF4EE77CFF43DC
          6BFF38D15BFF2FC849FF1BB32FFF0AA115FF059D0AFF009A00FF1AA335FF26B0
          48FF098910FE007C00FF006C00FE00050095000000400000000A000000000000
          000000000000000000000007090C117546B72EC555FF31C866FF33C587FF31C1
          97FF2DBD9FFF26B8A2FF23B695FF2FC692FF6BD39CFFF8E8ECFFF9F4F5FFEEEB
          EDFFDFDFDFFFD2D2D2FFC2C2C2FFB5B5B5FFA9A9A9FFA2A2A2FF9D9B9DFF9B95
          99FF8A9D90FF2CC84FFF25BE41FF1BB431FF11AA21FF0AA318FF09A214FF09A2
          13FF07A010FF07A00EFF059E0DFF059E0BFF039C08FF019B03FF129924FF1DA0
          3BFF20A13EFE129223FE007001FE000F008D000000410000000C000000000000
          000000000000000000000000000117712DA831C962FF2FC85FFF2CC659FF2CC4
          54FE32C459F83CD36AFB47E079FF42DC73FF3AD86EFF5CD985FFB1DBBCFF9FCF
          AAFFB3B2B3FFABABABFFA8A8A8FFA6A6A6FFA5A5A5FFA4A4A4FFA2A2A2FFA1A1
          A1FF999498FF0DAA22FF11AB24FF10A921FF0FA81FFF0DA61CFF0CA519FF0AA3
          16FF09A214FF08A111FF069F0EFF059E0BFF039C08FF019B03FF119A20FF1693
          2EFE138B2CF70E771EEC066B0CF5001F00810000002200000006000000000000
          00000000000000000000000000011C8C3BC432CA64FE2FC25EF735BF5FF238C7
          66F438CE67FD33CC62FF2FC85CFF2BC455FF26BF4FFF22BD48FF1BBB42FF1BBA
          3FFFB8B1B6FFAFAFAFFFAEAEAEFFACACACFFAAAAAAFFA9A9A9FFA7A7A7FFA6A6
          A6FF9F9A9FFF11AA26FF12AB25FF10A922FF0FA81FFF0DA61CFF0CA519FF0AA3
          16FF09A213FF08A111FF069F0EFF059E0BFF039C08FF019B03FF1BA930FF0374
          07FC05630AEB024804BF0133018C000A002A0000000700000001000000000000
          000000000000000000000000000121A344DE32C863FE30C762FE2FC85FFF2EC7
          5CFF2CC559FF2BC456FF29C253FF28C151FF26BF4EFF25BE4BFF23BC48FF24BA
          47FFBEB5BCFFB4B4B4FFB2B2B2FFB1B1B1FFAFAFAFFFAEAEAEFFACACACFFABAB
          ABFFA4A1A4FF10AB25FF12AC25FF10A922FF0FA81FFF0DA61CFF0CA519FF0AA3
          16FF09A213FF08A10FFF059E0CFF049D08FF019A04FF009700FF23B63EFF0078
          00FF033107B2000000860000002C000000050000000000000000000000000000
          0000000000000000000000000001187432A531C963FF30C962FF2FC85FFF2DC6
          5CFF2CC559FF2AC356FF29C253FF28C150FF26BF4DFF25BE4BFF23BC48FF27BB
          49FFC3BAC1FFB9B9B9FFB7B7B7FFB5B5B5FFB4B4B4FFB2B2B2FFB1B1B1FFB1B1
          B1FFACA6ACFF11A925FF0FA923FF0FA820FF0DA61CFF0BA418FF09A214FF09A2
          13FF0EA71BFF16AF26FF1DB633FF25BE3FFF2DC64DFF35CE5BFF3ED66EFF007B
          00FF05670AEB00010099000000480000000D0000000000000000000000000000
          0000000000000000000000000001197733A932CB65FF30C962FF2FC85FFF2DC6
          5CFF2CC559FF2AC356FF29C253FF27C050FF26BF4DFF24BD4BFF22BC48FF2CBB
          4DFFC8BFC6FFBEBEBEFFBCBCBCFFBBBBBBFFB9B9B9FFB6B6B6FFB5B5B5FFB3B3
          B3FFAEA9ADFF21B73DFF2AC44AFF31CA54FF38D15EFF3DD668FF43DC73FF47E0
          7BFF47E07DFF44DD79FF3FD974FF3DD672FF3BD46FFF38D16CFF3CD672FF139C
          22FF027A06FE0117039E00000061000000160000000000000000000000000000
          00000000000000000000000000001D883BBD32CA64FF30C962FF2FC85FFF2DC6
          5CFF2CC559FF29C255FF28C152FF26BF4EFF25BE4BFF22BB47FF21BB44FF31BD
          52FFCEC4CBFFC1C1C1FFC2C2C2FFC6C6C6FFCACACAFFD0D0D0FFD5D5D5FFDADA
          DAFFE1DEE0FF76C993FF42E279FF43DD78FF45DD79FF49DF7BFF4FE280FF54E5
          82FF57EA87FF5BEE8AFF5FF38FFF5FF590FF38D16BFF38D16BFF38D16CFF2FC2
          53FF007C00FF033007B0000000730000001C0000000100000000000000000000
          0000000000000000000000000000219B44D031CA64FE2EC861FF2EC75EFF2FC6
          5EFE34CA60FD38CF65FC3DD36BFC44DC72FE49E378FF4EE97FFF51EE84FF57EC
          8AFFDBEEE3FFF9F5F8FFF8F8F8FFF5F5F5FFF1F1F1FFEFEFEFFFECECECFFE8E8
          E8FFE6E5E6FFDEDEDEFF84DB9EFF84FFA8FF85FFA8FF81FFA7FF7EFFA5FF7AFF
          A3FF77FFA2FF73FF9FFF70FF9EFF6EFF9EFF47E079FF39D26CFF38D16BFF3DD6
          73FE048806FE05480AC500000082000000220000000100000000000000000000
          000000000000000000000000000025AA4BE242D370F758EC8AFB5AEE8BFB5BF3
          8EFD5DF28DFE61F592FF68F495FF72F59AFF7BF69EFF84F7A4FF8BF7A8FF91FA
          ABFF9CFCB3FFE6FAEAFFF8F4F7FFF2F1F2FFEEEEEEFFEBEBEBFFE8E8E8FFE5E5
          E5FFE2E2E2FFE2E1E2FFD0D4D0FF84ECA2FF84FFA7FF81FFA6FF7EFFA4FF7AFF
          A3FF77FFA1FF74FFA0FF71FF9EFF6FFF9EFF5FF490FF38D26CFF39D26CFF3AD3
          6EFF1DAB35FE03610ADF0000008E0000002B0000000300000000000000000000
          00000000000000000000000000000D3C1B4C23A249E13ECF6CF95EF58EFC5DF7
          91FF5DF591FFA5FCB8FFC9FFCAFFC0FFC5FFBBFFC4FFB7FFC1FFB3FFC0FFB0FF
          BDFFABFFBBFFA6FFB8FFD6F7DCFFF3EFF2FFECECECFFE9E9E9FFE7E7E7FFE4E4
          E4FFE1E1E1FFDEDEDEFFDEDCDDFFBCCBC0FF83F8A5FF84FFA8FF82FFA5FF7EFF
          A5FF7BFFA3FF78FFA2FF76FFA0FF73FFA0FF73FFA1FF41D973FF3AD36DFF3AD3
          6DFF30C35AFA04730AF90002008F000000350000000700000000000000000000
          000000000000000000000000000000000000020D06111A75359B2FBE5BF950E4
          80FA5EF790FE57F48DFF87F8A6FFC2FFC6FFBBFFC3FFB6FFC0FFB3FFBFFFB1FF
          BEFFAEFFBCFFAAFFBAFFA4FFB6FFC8F6D1FFEFEBEEFFE9E8E9FFE5E5E5FFE2E2
          E2FFDFDFDFFFDCDCDCFFDBDBDBFFDBD8DBFFAAC9B3FF85FFA8FF83FFA7FF7AFB
          A1FF72F99BFF69F496FF61F090FF5AED89FF53EA86FF44DE79FF3DD672FE3BD2
          70FA38C96CF20B7D15F7000E017B0000002E0000000700000000000000000000
          00000000000000000000000000000000000000000000000000000C381A4525A3
          4BDB3FD16EFA5CF28CFC59F58EFF70F699FFBAFEC2FFBDFFC4FFBAFFC2FFB7FF
          C2FFB4FFC0FFB3FFBFFFAFFFBDFFA5FFB7FFB4F8C3FFEBE6EAFFE7E4E6FFE3E1
          E2FFE2DFE1FFE0DCDFFFDED9DCFFDCD7DBFFDFD3DCFF7DBF93FD3ACE6AF738C5
          65F533BE5EF52EB657F329AC4DF222A344F11E9839F0178D30EE138223EE0C78
          1AF00A7314F3087311F20119034B0000000C0000000100000000000000000000
          000000000000000000000000000000000000000000000000000000000000020A
          040D1A73369130C260F94EE37FFA5BF68FFE62F692FF90FBABFF85F9A5FF78F5
          9CFE6DF295FE61EF8DFE54E986FD49E27CFD3FDD74FD5FD684FCC3DACAFEB3D7
          BCFFA2D0AFFF91CCA2FF81C694FF72C088FE65BB7CFC51B06AF51C9F3EE3198C
          37CF167A2DBB106924A80D581C940B47167F0839106B052C0C57031F07420214
          042C000A01190002000800000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000C33193D26A54FD53DD470FC45DE78FE3ED873FE39D46DFE35CD
          68FE30C660FB2DBB59F527B253E423A04ACF208E41BB197B37A8136A2E940F58
          247F0D481E6B0B391857072A1041041B0B2C020D051900020108000000020000
          0001000000010000000100000001000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000108030A14542966135229690F4020560B2E1641071E
          0E2C030F06180002010700000001000000010000000100000001000000010000
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36240000424D3624000000000000360000002800000030000000300000000100
          2000000000000024000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000100000001000000010000000100000001000000010000
          0001000000010000000100000001000000010000000100000001000000010000
          0001000000010000000100000001000000010000000100000001000000010000
          0001000000010000000100000001000000010000000100000001000000010000
          0001000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000050000001400000021000000240000002400000025000000250000
          0025000000250000002500000025000000250000002500000025000000250000
          0025000000250000002500000025000000250000002500000025000000250000
          0025000000250000002500000025000000250000002500000025000000240000
          0024000000210000001400000005000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000500000023000000590000007E000000890000008A0000008A0000008A0000
          008A0000008A0000008A0000008A0000008A0000008A0000008A0000008A0000
          008A0000008A0000008A0000008A0000008A0000008A0000008A0000008A0000
          008A0000008A0000008A0000008A0000008A0000008A0000008A0000008A0000
          00890000007D0000005800000022000000050000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000303
          031A4040409E6F6F6FE5747474EE737373EE727272EE717171EE707070EE6D6D
          6DEE6C6C6CEE6C6C6CEE696969EE696969EE696969EE696969EE666666EE6565
          65EE646464EE636363EE626262EE616161EE606060EE606060EE5D5D5DEE5B5B
          5BEE5A5A5AEE595959EE595959EE595959EE585858EE575757EE575757EE5050
          50E5252525AE0101019800000059000000140000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000004949
          4994959595FED4D4D4FFD9D9D9FFD9D9D9FFD9D9D9FFD8D8D8FFD8D8D8FFD8D8
          D8FFD7D7D7FFD7D7D7FFD6D6D6FFD5D5D5FFD5D5D5FFD4D4D4FFD3D3D3FFD2D2
          D2FFD2D2D2FFD1D1D1FFD0D0D0FFCFCFCFFFCECECEFFCDCDCDFFCBCBCBFFCACA
          CAFFC9C9C9FFC8C8C8FFC7C7C7FFC5C5C5FFC4C4C4FFC3C3C3FFC1C1C1FFBABA
          BAFF737373FE262626AF00000080000000210000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000017B7B
          7BE8D6D6D6FFEDEDEDFFE9E9E9FFEBEBEBFFEAEAEAFFEAEAEAFFEBEBEBFFE9E9
          E9FFE9E9E9FFEAEAEAFFE8E8E8FFE9E9E9FFE7E7E7FFE8E8E8FFE6E6E6FFE5E5
          E5FFE4E4E4FFE3E3E3FFE2E2E2FFE1E1E1FFE0E0E0FFDFDFDFFFDEDEDEFFDDDD
          DDFFDDDDDDFFDADADAFFD9D9D9FFD8D8D8FFD8D8D8FFD5D5D5FFD5D5D5FFD6D6
          D6FFBABABAFF535353E90000008B000000250000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000018080
          80F4DDDDDDFFEBEBEBFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEAEAFFEAEAEAFFE9E9E9FFE9E9E9FFE8E8E8FFE7E7E7FFE6E6E6FFE6E6
          E6FFE5E5E5FFE4E4E4FFE3E3E3FFE2E2E2FFE1E1E1FFE0E0E0FFDEDEDEFFDDDD
          DDFFDCDCDCFFDBDBDBFFD9D9D9FFD8D8D8FFD7D7D7FFD5D5D5FFD4D4D4FFD5D5
          D5FFC4C4C4FF5B5B5BF40000008C000000250000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000018181
          81F4DFDFDFFFEDEDEDFFECECECFFECECECFFECECECFFECECECFFECECECFFEDED
          ECFFF2F0ECFFF6F2EBFFF8F4EBFFF7F3EAFFF5F2EAFFEFEDE9FFE9E9E8FFE7E7
          E7FFE6E6E6FFE5E5E5FFE5E5E4FFEAE4E3FFEDE5E2FFEEE4E1FFEDE3E1FFE9E1
          DEFFE3DEDDFFDDDDDCFFDBDBDBFFD9D9D9FFD8D8D8FFD6D6D6FFD5D5D5FFD5D5
          D5FFC4C4C4FF5C5C5CF40000008D000000260000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000018181
          81F4E0E0E0FFF0F0F0FFEEEEEEFFEEEEEEFFEEEEEEFFEFEEEEFFF5F3EEFFF9F6
          EEFFA8BEF3FF638DF8FF4576FAFF4474FAFF6088F8FFA3B8F1FFF4F1E9FFF1EF
          E9FFEAE9E8FFF0EAE8FFF0E8E6FF9AD0E1FF55BFDEFF37B6DCFF39B5DBFF57BC
          DBFF9CCCDCFFE9E1DEFFE3DEDCFFDBDADAFFD9D9D9FFD8D8D8FFD6D6D6FFD6D6
          D6FFC5C5C5FF5D5D5DF40000008D000000260000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000018080
          80F4E2E2E2FFF0F0F0FFF0F0F0FFF0F0F0FFF1F1F0FFFEFAF0FFAAC0F5FF175A
          FEFF054EFFFF0A50FFFF0B51FFFF0A4EFFFF074AFFFF0043FFFF0D4BFFFF9FB4
          F2FFFFF5E9FF98D3E6FF00ABDEFF00A7DDFF00A8DCFF00A7DBFF00A6DAFF00A5
          D9FF00A2D8FF06A6D7FF9BCBDBFFE9DEDCFFDBDADAFFD9D9D9FFD7D7D7FFD7D7
          D7FFC6C6C6FF5E5E5EF40000008D000000260000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000018080
          80F4E3E3E3FFF2F2F2FFF2F2F2FFF3F3F2FFFFFCF2FF729DFAFF0653FFFF145C
          FFFF145CFFFF145BFFFF1359FFFF1256FFFF1054FFFF0F51FFFF0C4DFFFF003A
          FFFF27A3E9FF00ACE0FF00ADE0FF00ADE0FF00ACDFFF00ABDEFF00AADDFF00A8
          DBFF00A7DAFF00A5D8FF00A1D7FF63BDD9FFEADFDCFFDBDADAFFD8D8D8FFD9D9
          D9FFC7C7C7FF616161F40000008D000000260000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000018080
          80F4E5E5E5FFF4F4F4FFF3F3F3FFFFFBF4FF90B2F9FF0B5BFFFF1863FFFF1863
          FFFF1762FFFF1660FFFF155EFFFF145BFFFF1359FFFF1156FFFF104EFFFF0780
          F1FF00B5E2FF00B0E3FF00B0E3FF00AFE2FF00AEE1FF00ADE0FF00ACDFFF00AB
          DEFF00A9DCFF00A8DBFF00A6D9FF00A1D7FF7EC4D9FFE5DEDCFFD9D9D9FFD8D8
          D8FFC8C8C8FF616161F40000008D000000260000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000018282
          82F4E6E6E6FFF6F6F6FFF8F7F5FFE4EBF7FF0E61FFFF1A69FFFF1B69FFFF1B68
          FFFF1A67FFFF1965FFFF1863FFFF1760FFFF155DFFFF1359FFFF0F62FBFF00BA
          E5FF00B4E6FF00B3E6FF00B3E6FF00B2E5FF00B1E4FF00B0E3FF00AFE2FF00AD
          E0FF00ACDFFF00AADDFF00A8DBFF00A6D9FF00A2D7FFCFD8DCFFDDDBDAFFD9D9
          D9FFC8C8C8FF626262F40000008D000000260000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000018181
          81F4E8E8E8FFF8F8F8FFFFFEF7FF72A4FDFF176BFFFF1E6FFFFF1E6FFFFF1E6E
          FFFF1D6CFFFF1C6AFFFF1B68FFFF1965FFFF1762FFFF175BFFFF0798F1FF00B9
          E9FF00B6E9FF00B6E9FF00B6E9FF00B5E8FF00B4E7FF00B2E5FF00B1E4FF00AF
          E2FF00AEE1FF00ACDFFF00AADDFF00A8DBFF00A5D9FF5ABCD9FFE6DEDCFFDADA
          DAFFC9C9C9FF636363F40000008D000000260000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000018181
          81F4E9E9E9FFFCFBFBFFFFFFF9FF2677FFFF2074FFFF2175FFFF2174FFFF2173
          FFFF2072FFFF1F70FFFF1D6DFFFF1C6AFFFF1B66FFFF195EFFFF00BAEDFF00BA
          ECFF00B9ECFF00B9ECFF00B8EBFF00B7EAFF00B6E9FF00B5E8FF00B3E6FF00B2
          E5FF00B0E3FF00AEE1FF00ACDFFF00A9DCFF00A7DAFF0BA9D9FFECDFDBFFDBDB
          DBFFCACACAFF636363F40000008D000000260000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000018282
          82F4ECECECFFFDFDFBFFF2F5FBFF1470FEFF247AFFFF247AFFFF247AFFFF2479
          FFFF2377FFFF2175FFFF2072FFFF1E6EFFFF1C6BFFFF176FFDFF00C1EEFF00BC
          EFFF00BCEFFF00BCEFFF00BBEEFF00BAEDFF00B9ECFF00B7EAFF00B6E9FF00B4
          E7FF00B2E5FF00B0E3FF00ADE0FF00ABDEFF00A9DCFF00A4D9FFDADBDDFFDEDD
          DDFFCBCBCBFF646464F40000008D000000260000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000018181
          81F4ECECECFFFFFFFDFFE6F0FDFF1876FFFF2780FFFF2780FFFF2780FFFF267E
          FFFF257CFFFF247AFFFF2276FFFF2073FFFF1E6FFFFF1778FDFF00C3F1FF00BF
          F2FF00BFF2FF00BFF2FF00BEF1FF00BDF0FF00BBEEFF00BAEDFF00B8EBFF00B6
          E9FF00B3E6FF00B1E4FF00AFE2FF00ACDFFF00AADDFF00A5DBFFCAD8DCFFDEDD
          DCFFCCCCCCFF666666F40000008D000000260000000100000000000000000000
          0000000000000000000000000000000000010000000100000001000000018383
          83F4EFEFEFFFFFFFFFFFF6F9FEFF1A7BFFFF2A85FFFF2A86FFFF2A85FFFF2984
          FFFF2881FFFF267EFFFF247BFFFF2277FFFF2072FFFF1A76FDFF00C7F4FF00C1
          F4FF00C2F5FF00C1F4FF00C1F4FF00BFF2FF00BEF1FF00BCEFFF00BAEDFF00B8
          EBFF00B5E8FF00B3E6FF00B0E3FF00AEE1FF00ABDEFF00A6DCFFDADCDDFFDFDE
          DEFFCCCCCCFF666666F40000008D000000260000000100000000000000000000
          0000000000000000000000000005000000140000002100000024000000258181
          81F4F0F0F0FFFFFFFFFFFFFFFFFF2F8CFFFF2C8BFFFF2D8BFFFF2D8BFFFF2C89
          FFFF2B86FFFF2983FFFF277FFFFF247AFFFF2375FFFF206CFEFF00C5F7FF00C5
          F7FF00C5F8FF00C4F7FF00C3F6FF00C2F5FF00C0F3FF00BEF1FF00BCEFFF00B9
          ECFF00B7EAFF00B4E7FF00B1E4FF00AFE2FF00ACDFFF09ADDDFFEEE2DEFFDDDD
          DDFFCDCDCDFF696969F40000008D000000260000000100000000000000000000
          0000000000000000000500000023000000590000007E000000890000008BC4C4
          C4FAF4F4F4FFFFFFFFFFFFFFFFFFA6D0FFFF9CCAFFFF9FCCFFFF9FCBFFFF9ECA
          FFFF9DC9FFFF9CC7FFFF9BC5FFFF9AC2FFFF99C0FFFF98BCFFFF8DD7FDFF88E6
          FDFF88E5FDFF88E5FDFF88E4FCFF88E4FCFF88E2FAFF88E2FAFF88E0F8FF88E0
          F7FF88DEF5FF88DDF4FF88DCF3FF00B0E3FF00ACE0FF58C1DFFFEAE2E0FFDFDF
          DFFFCECECEFF696969F40000008D000000260000000100000000000000000000
          0000000000000303031A4040409E6F6F6FE5747474EE737373EE727272EE7F7F
          7FFE878787FF858585FF848484FF838484FF727A82FF727981FF717880FF7178
          80FF6E757DFF6D747CFF6C727BFF6B717AFF6A7079FF696E78FF676E77FF6574
          77FF637174FF606E72FF5F6D71FF5E6C6FFF5E6C6FFF5D6B6EFF5C696DFF5B68
          6CFF5B686CFF566A70FF5C95A5FF51C8EAFF00ABE1FFD1DDE1FFE2E0DFFFDEDE
          DEFFCECECEFF6A6A6AF40000008D000000260000000100000000000000000000
          00000000000049494994959595FED4D4D4FFDBD9D9FFDDD9D8FFDDDAD9FFDCD8
          D7FFDCD8D8FFDCD9D8FFDBD7D7FFDBD8D7FFDAD7D6FFD9D6D5FFDAD6D5FFD8D5
          D4FFD7D4D3FFD6D3D2FFD7D4D2FFD5D2D1FFD4D1D0FFD3D0CFFFD2CFCEFFD2CF
          CEFFCFCCCBFFCECBCAFFCDCAC9FFCCC9C8FFCBC9C8FFC9C6C5FFC8C5C4FFC7C4
          C3FFC3C2C1FFBABABAFF737373FF5D94A5FFA5DCEBFFECE3E1FFE1E1E0FFE0E0
          E0FFCFCFCFFF6B6B6BF40000008D000000260000000100000000000000000000
          0000000000017B7B7BE8D6D6D6FFF3EDEBFFDDE8ECFFC0E4EDFFC2E4EDFFC2E3
          EDFFC2E4ECFFC2E2ECFFC2E3EBFFC2E1EAFFC1E0E9FFC1E1EAFFC1E0E8FFC0DF
          E7FFC0DEE6FFBFDDE5FFBEDCE5FFBEDCE4FFBDD9E3FFBBD8E1FFBAD7E0FFB9D6
          DFFFBAD6DEFFB8D5DEFFB7D2DBFFB6D1DAFFB5D1D9FFB4D0D9FFB3CDD6FFB1CC
          D5FFC9D2D4FFDBD8D6FFBABABAFF626B6EFFF6EEECFFE3E3E2FFE0E0E0FFDFDF
          DFFFCFCFCFFF6C6C6CF40000008D000000260000000100000000000000000000
          000000000001808080F4E0DDDDFFD7E9EEFF00C8FFFF00C6FBFF00C5FAFF00C3
          F8FF00C1F6FF00BFF4FF00BDF2FF00BAF0FF00B8EDFF00B6EBFF00B4E9FF00B2
          E7FF00B2E7FF00AFE4FF00ADE2FF00AAE0FF00AADFFF00A7DDFF00A5DBFF00A3
          D9FF00A3D8FF00A0D6FF00A0D5FF009DD3FF009CD2FF009BD1FF009AD0FF0099
          CFFF0099CFFFC6D1D4FFC7C5C4FF686868FFEEEDEDFFE2E2E2FFE0E0E0FFDFDF
          DFFFD0D0D0FF6E6E6EF40000008D000000260000000100000000000000000000
          000000000001818181F4E5E0DFFFB3E6F2FF00C8FDFF00C7FAFF00C5F8FF00C3
          F6FF00C1F4FF00BFF2FF00BDF0FF00BCEFFF00BAEDFF00B8EBFF00B6E9FF00B4
          E7FF00B2E5FF00B0E3FF00AFE2FF00ADE0FF00ABDEFF00A9DCFF00A7DAFF00A6
          D9FF00A4D7FF00A2D5FF00A1D4FF009FD2FF009DD0FF009CCFFF009BCEFF009A
          CDFF0096CCFFA0C7D2FFC9C6C4FF696969FFEDEDEDFFE2E2E2FFE0E0E0FFDFDF
          DFFFD0D0D0FF6F6F6FF40000008C000000250000000100000000000000000000
          000000000001818181F4E5E0DFFFB7E7F3FF00C8FDFF00C7FAFF00C5F8FF00C3
          F6FF00C1F4FF00BFF2FF00BDF0FF00BBEEFF00B9ECFF00B7EAFF00B5E8FF00B3
          E6FF00B2E5FF00B0E3FF00AEE1FF00ACDFFF00AADDFF00A9DCFF00A7DAFF00A5
          D8FF00A3D6FF00A1D4FF00A0D3FF009ED1FF009CCFFF009BCEFF0099CCFF0099
          CCFF0096CCFFA3C7D4FFCAC7C5FF6A6A6AFFEDEDEDFFE2E2E2FFE0E0E0FFE1E1
          E1FFD0D0D0FF707070F40000008B000000250000000100000000000000000000
          000000000001808080F4E8E4E2FFB7E8F4FF00C8FDFF00C7FAFF00C5F8FF00C3
          F6FF00C1F4FF00BFF2FF00BDF0FF00BBEEFF00B9ECFF00B7EAFF00B5E8FF00B3
          E6FF00B1E4FF00B0E3FF00AEE1FF00ACDFFF00AADDFF00A8DBFF00A6D9FF00A4
          D7FF00A3D6FF00A1D4FF009FD2FF009DD0FF009BCEFF009ACDFF0099CCFF0099
          CCFF0096CCFFA4C9D5FFCBC8C6FF6B6B6BFFEDEDEDFFE2E2E2FFE0E0E0FFE0E0
          E0FFD1D1D1FF727272F400000080000000220000000000000000000000000000
          000000000001808080F4E9E4E3FFB1E8F6FF00C8FDFF00C7FAFF00C5F8FF00C3
          F6FF00C1F4FF00BFF2FF00BDF0FF00BBEEFF00B9ECFF00B7EAFF00B5E8FF00B3
          E6FF00B1E4FF00AFE2FF00ADE0FF00ACDFFF00AADDFF00A8DBFF00A6D9FF00A4
          D7FF00A2D5FF00A0D3FF009ED1FF009DD0FF009BCEFF0099CCFF0099CCFF0099
          CCFF0096CCFFA6C8D5FFCCC9C7FF6D6D6DFFEDEDEDFFE3E3E3FFE1E1E1FFE3E3
          E3FFCACACAFF6C6C6CEA0000005B000000140000000000000000000000000000
          000000000001808080F4EBE7E5FFAFEAF8FF00C6FDFF00C6FAFF00C4F8FF00C2
          F6FF00C0F4FF00BEF2FF00BCF0FF00BAEEFF00B7ECFF00B5EAFF00B3E8FF00B1
          E6FF00AFE4FF00ADE2FF00ABE0FF00ABDFFF00A8DDFF00A6DBFF00A4D9FF00A2
          D7FF00A0D5FF009ED3FF009CD1FF009ACFFF0097CDFF0097CCFF0097CCFF0097
          CCFF0094CCFFA3C9D6FFCDCAC9FF6D6D6DFFE4E4E4FFD7D7D7FFD5D5D5FFCFCF
          CFFF8D8D8DFE3E3E3EA100000024000000050000000000000000000000000000
          000000000001828282F4E9E6E6FFDAF1F7FF85E2F8FF8AE1F8FF8AE0F7FF8ADF
          F6FF8ADEF5FF8ADDF4FF8BDCF3FF89DBF2FF89DBF0FF88D8EFFF88D7EEFF87D7
          ECFF87D4EBFF86D4EAFF86D1E8FF85D1E7FF84CEE5FF82CEE3FF83CBE2FF82C9
          E0FF80C9DEFF7FC6DDFF80C4DBFF7FC4DBFF7EC2D8FF7CBFD6FF7BC0D5FF7ABE
          D4FF75BDD4FFC4D3D9FFCAC9C8FF6A6A6AFFBEBEBEFA777777F4787878F47575
          75EB464646970303031B00000006000000000000000000000000000000000000
          000000000001818181F4E9E9E8FFFCF9F8FFFFF8F7FFFFF8F7FFFFF8F7FFFFF8
          F7FFFFF9F7FFFFF9F7FFFFFAF8FFFFF8F6FFFEF7F5FFFEF8F6FFFDF6F4FFFCF5
          F3FFFBF4F2FFFAF4F2FFF8F1EFFFF7F0EEFFF6F0EEFFF4EDEBFFF3ECEBFFF2EC
          EAFFF0E9E8FFEFE9E7FFEDE6E5FFEAE4E3FFEAE4E2FFE7E1E0FFE7E1DFFFE4DE
          DCFFE2DDDCFFDEDCDBFFC9C9C9FF636363F40000008D00000027000000010000
          0001000000010000000100000000000000000000000000000000000000000000
          000000000001818181F4E9E9E9FFFBFBFBFFF9F9F9FFF9F9F9FFF9F9F9FFF9F9
          F9FFF9F9F9FFF9F9F9FFF8F8F8FFF8F8F8FFF7F7F7FFF6F6F6FFF5F5F5FFF4F4
          F4FFF3F3F3FFF2F2F2FFF1F1F1FFEFEFEFFFEEEEEEFFEDEDEDFFEBEBEBFFEAEA
          EAFFE8E8E8FFE7E7E7FFE5E5E5FFE3E3E3FFE2E2E2FFE0E0E0FFDFDFDFFFDDDD
          DDFFDBDBDBFFDBDBDBFFCACACAFF636363F40000008D00000026000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001828282F4ECECECFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
          FBFFFBFBFBFFFBFBFBFFFAFAFAFFF9F9F9FFF9F9F9FFF8F8F8FFF7F7F7FFF6F6
          F6FFF5F5F5FFF3F3F3FFF2F2F2FFF1F1F1FFEFEFEFFFEEEEEEFFECECECFFEBEB
          EBFFE9E9E9FFE8E8E8FFE6E6E6FFE4E4E4FFE3E3E3FFE1E1E1FFE0E0E0FFDEDE
          DEFFDCDCDCFFDDDDDDFFCBCBCBFF646464F40000008D00000026000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001818181F4ECECECFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
          FDFFFDFDFDFFFCFCFCFFFCFCFCFFFBFBFBFFFAFAFAFFF9F9F9FFF8F8F8FFF7F7
          F7FFF6F6F6FFF5F5F5FFF3F3F3FFF2F2F2FFF0F0F0FFEFEFEFFFEDEDEDFFECEC
          ECFFEAEAEAFFE9E9E9FFE7E7E7FFE5E5E5FFE4E4E4FFE2E2E2FFE0E0E0FFDFDF
          DFFFDDDDDDFFDCDCDCFFCCCCCCFF666666F40000008D00000026000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001838383F4EFEFEFFFFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
          FEFFFEFEFEFFFEFEFEFFFFFFFFFFFDFDFDFFFCFCFCFFFBFBFBFFFAFAFAFFF9F9
          F9FFF7F7F7FFF6F6F6FFF4F4F4FFF3F3F3FFF1F1F1FFF0F0F0FFEEEEEEFFEDED
          EDFFEBEBEBFFE9E9E9FFE8E8E8FFE6E6E6FFE4E4E4FFE3E3E3FFE1E1E1FFDFDF
          DFFFDEDEDEFFDEDEDEFFCCCCCCFF666666F40000008D00000026000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001828282F4F0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFCFCFCFFFBFBFBFFFAFA
          FAFFF9F9F9FFF7F7F7FFF6F6F6FFF4F4F4FFF2F2F2FFF1F1F1FFEFEFEFFFEEEE
          EEFFECECECFFEAEAEAFFE8E8E8FFE7E7E7FFE5E5E5FFE3E3E3FFE2E2E2FFE0E0
          E0FFDEDEDEFFDDDDDDFFCDCDCDFF696969F40000008D00000026000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001848484F4EFF0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFF
          FFFFFDFFFFFFFAFFFFFFFAFEFFFFF7FCFFFFF5FAFEFFF5F9FDFFF3F7FBFFF1F5
          F9FFF0F5F8FFEEF2F6FFECF0F3FFEAEEF1FFE9EEF1FFE7ECEEFFE5EAECFFE3E7
          EAFFE2E6E8FFDFE0E1FFCECECEFF696969F40000008D00000026000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001838383F4EFF1F4FFFFE9C9FFFBC370FFF9C376FFF7C176FFF5BF
          76FFF3BD76FFF1BB76FFEFB976FFEDB776FFEBB476FFE9B277FFE6B075FFE4AD
          76FFE1AB75FFDEA873FFDBA572FFD9A273FFD69F72FFD39D71FFD09A6FFFCD97
          6EFFCA946FFFC7916EFFC58E6DFFC28B6CFFBF886BFFBC8669FFBB856AFFBA84
          69FFB87D60FFDAD6D2FFCECFD0FF6A6A6AF40000008D00000026000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001858585F4EFF3F8FFFFD596FFF88A00FFF48B00FFF18800FFED84
          00FFE97F00FFE57B00FFE17700FFDC7200FFDA7000FFD56B00FFD16700FFCD63
          00FFCB6000FFC65C00FFC25800FFBE5400FFBA5000FFB64C00FFB34900FFAF45
          00FFAB4100FFA73C00FFA23800FFA03600FF9B3100FF972D00FF972D00FF972D
          00FF932200FFD8CCC6FFD0D1D2FF6B6B6BF40000008D00000026000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001848484F4EFF3F8FFFFD69AFFF88E00FFF58F00FFF18B00FFED87
          00FFE98300FFE57F00FFE17B00FFDE7800FFDA7400FFD67000FFD26C00FFCE68
          00FFCB6500FFC76100FFC35D00FFC05A00FFBC5600FFB85200FFB44E00FFB04A
          00FFAD4700FFA94300FFA53F00FFA23C00FF9E3800FF9B3500FF993300FF9933
          00FF952800FFD8CDC8FFCFD1D2FF6C6C6CF40000008D00000026000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001868686F4EFF3F8FFFFD9A2FFF99000FFF58F00FFF18B00FFED87
          00FFEA8400FFE68000FFE27C00FFDE7800FFDA7400FFD77100FFD36D00FFCF69
          00FFCB6500FFC86200FFC45E00FFC05A00FFBD5700FFB95300FFB54F00FFB14B
          00FFAE4800FFAA4400FFA74100FFA33D00FFA03A00FF9D3700FF9A3400FF9933
          00FF952800FFD8CDC8FFD1D2D3FF6E6E6EF40000008D00000026000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001858585F4EFF3F8FFFFDAA3FFF98F00FFF58F00FFF28C00FFEE88
          00FFEA8400FFE68000FFE37D00FFDF7900FFDB7500FFD77100FFD36D00FFD06A
          00FFCC6600FFC96300FFC55F00FFC15B00FFBE5800FFBA5400FFB65000FFB34D
          00FFAF4900FFAC4600FFA84200FFA53F00FFA23C00FF9F3900FF9D3700FF9B35
          00FF962900FFD8CEC8FFD0D2D3FF6F6F6FF40000008C00000025000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001878787F4EFF3F7FFFFD99FFFFA8F00FFF69000FFF28C00FFEE88
          00FFEB8500FFE78100FFE37D00FFE07A00FFDC7600FFD87200FFD46E00FFD16B
          00FFCD6700FFCA6400FFC66000FFC35D00FFBF5900FFBB5500FFB85200FFB44E
          00FFB14B00FFAE4800FFAB4500FFA84200FFA53F00FFA23C00FFA03A00FF9F39
          00FF9A2C00FFD9CEC8FFD0D2D2FF707070F40000008B00000025000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000898989F4F2F3F6FFFFF2D8FFFB8E00FFF78A00FFF38600FFEF82
          00FFEC7F00FFE87A00FFE37600FFDF7100FFDC6E00FFD86A00FFD36600FFD063
          00FFCB5E00FFC95C00FFC45700FFC25400FFBD4F00FFBA4C00FFB74A00FFB345
          00FFB04200FFAD3F00FFAA3C00FFA73900FFA53700FFA23400FFA13300FF9E2F
          00FFA54208FFE1E4E6FFD2D2D3FF727272F40000008000000022000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000838383E9EBEBEBFFFFFFFFFFFFFFFEFFFFF8EDFFFFF9EEFFFFF8
          EEFFFFF8EEFFFFF7EEFFFEF8EEFFFEF6EEFFFDF7EEFFFEF6EEFFFDF7EEFFFEF6
          EFFFFDF5EDFFFBF3ECFFF9F1E9FFF7EFE9FFF5EDE6FFF3EBE4FFF1E9E3FFEEE7
          E1FFEDE5E0FFEAE3DEFFE8E1DCFFE6DFDBFFE6DDD9FFE3DBD6FFE1D9D6FFDFD8
          D2FFE3E7E7FFE4E6E6FFCBCBCBFF6C6C6CEA0000005B00000014000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000055555592A4A4A4FFEDEDEDFFF2F3F4FFF2F3F5FFF2F3F5FFF3F3
          F5FFF1F2F4FFF1F2F4FFF1F2F4FFF2F2F4FFF2F2F4FFF2F2F4FFF2F3F4FFF1F2
          F3FFF1F3F3FFEFF0F1FFEEEFF0FFECEDEEFFEAEAECFFE9EAEBFFE7E7E9FFE4E5
          E6FFE4E5E6FFE1E2E3FFE1E2E3FFDEDFE0FFDCDDDEFFDCDCDDFFD9DADAFFD8D9
          D9FFD5D6D6FFCFCFCFFF8D8D8DFE3E3E3EA10000002400000005000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000404040855555593848484EC878787F4858585F4848484F48383
          83F4828282F4838383F4818181F4808080F47F7F7FF47E7E7EF47E7E7EF47C7C
          7CF47B7B7BF47B7B7BF47A7A7AF47A7A7AF47A7A7AF4797979F47A7A7AF47878
          78F4797979F4797979F4787878F4787878F4797979F4777777F4777777F47878
          78F4787878F4757575EB464646970303031B0000000600000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000100000001000000010000
          0001000000010000000100000001000000010000000100000001000000010000
          0001000000010000000100000001000000010000000100000001000000010000
          0001000000010000000100000001000000010000000100000001000000010000
          0001000000010000000100000001000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36240000424D3624000000000000360000002800000030000000300000000100
          2000000000000024000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001000000010000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000100000007000000140000
          001D0000001F0000001A00000010000000050000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000200000011000000310000005A0000
          00750000007B0000006D000000500000002E0000001800000009000000020000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000001000000120E060051451D00A2773200D08034
          00D9642900C4281100A30401009C00000088000000640000003D000000210000
          000F000000050000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000092B1300609E4100ECBE5F18FFCC762BFFCE77
          28FFC96E21FFB5530AFE9B3E00EF4A1E00B31007009D00000094000000750000
          004F0000002C0000001700000009000000020000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000001B0B0036A54300F0D88B4DFFF1B06CFFE29444FFE394
          44FFE29241FFE3923FFFD68130FFBF5F13FFAC4300FC752F00CD260F00A30201
          009C00000085000000620000003B000000200000000F00000004000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000017A3300ACC46A20FFFCCA96FFE29443FFE29445FFE192
          42FFE09040FFDF903DFFE08E3CFFE18F3BFFDB8936FFC66A1CFFB14D04FF953C
          00EB461C00B10E06009E00000093000000740000004D0000002B000000160000
          0009000000020000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000002AA4500E6E5A168FFEFAE6AFFE39240FFE39444FFE294
          44FFE19242FFE0903FFFDF8E3CFFDE8C3AFFDD8C38FFDF8B35FFDE8C36FFD077
          25FFB9590EFFAA4300FD6E2C00C9230E00A20201009B00000083000000600000
          003A0000001F0000000E00000004000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000D080412E79F59F9FCECDCFFFFFAF4FFF6D6B3FFEBAE70FFE291
          3EFFE2903DFFE19040FFE08F3EFFDF8E3CFFDE8C39FFDD8A36FFDC8834FFDC89
          32FFDE8931FFD7812BFFC26316FFAC4903FE903800E8411A00AE0C04009E0000
          0091000000710000004A0000002A000000150000000800000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000120C0619E8A15AFCFCEFE3FFFFF9F4FFFFF5ECFFFFF8F2FFFEEF
          E2FFF2C99FFFE6A15AFFE08B36FFE08C38FFDF8D3AFFDE8B38FFDD8A36FFDC88
          33FFDB8630FFDB852FFFDB852CFFDA842BFFCA6F1CFFB5530BFFA44000FB6829
          00C51F0C00A00101009B000000830000005D000000370000001E0000000D0000
          0004000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000170F091EEBA45BFEFCF3E9FFFFF8F1FFFFF4EAFFFFF3E8FFFFF5
          E9FFFFFBEEFFFFFDF2FFFFE8D2FFEFBC8AFFE29545FFDD8830FFDE8933FFDD89
          35FFDC8732FFDB852FFFDA842DFFD9832AFFD98228FFDA8228FFD37922FFBE5D
          10FFAB4502FF8A3700E53B1800AC0904009D000000900000006F000000480000
          0028000000140000000700000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000001D140C25EDA55EFEFDF6F1FFFFF8F2FFFFF4EBFFFFF5E9FFF9F0
          E7FF1C8AB6FF54A1BFFFBFD2D5FFFFF9EBFFFFFAEDFFFDDCBCFFEAAF74FFDE89
          35FFDB852CFFDC862EFFDB852FFFDA832CFFD98129FFD88127FFD87F25FFD87F
          22FFD87E22FFC56715FFB24D07FFA33F00FA612500C21B0B00A00201009B0000
          00800000005A000000350000001C0000000C0000000300000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000024190F2EEEA861FEFEF9F7FFFFF9F2FFFFF5ECFFFFF5EBFFD9E0
          DFFF42AED0FF45CAE4FF1AA3CBFF1289B9FF63A4BFFFCED7D6FFFFFAE9FFFFF5
          E3FFF8CEA6FFE6A15DFFDB8227FFD98027FFDA8229FFD98128FFD87F26FFD77D
          23FFD77B22FFD67C1FFFD77C1EFFCE7018FFB9570BFFA54200FE843200E03615
          00AB0803009D0000008E0000006D000000460000002700000013000000070000
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000002C1F1236F0AA65FFFEFDFBFFFFF8F3FFFFF6EDFFFFF7EDFFD3DE
          DFFF48B1D2FF52D1E8FF4CCEE5FF47CCE5FF36BCDCFF1198C5FF1887B4FF71A8
          BDFFDCDDD7FFFFFAE7FFFFEED6FFF4C18FFFE19445FFD87B1FFFD77D23FFD87F
          24FFD77D22FFD67B20FFD5791DFFD5781AFFD67919FFD47718FFC1600FFFAE49
          05FF9E3C00F85B2200BF190A00A0010000990000007E00000058000000300000
          0012000000030000000000000000000000000000000000000000000000000000
          0000000000003223153EF1AE69FFFFFFFFFFFFF8F2FFFFF6EFFFFFF7EEFFCADB
          DFFF4FB8D5FF56D6EBFF4FCFE7FF4ACBE4FF47C9E4FF43C8E3FF3DC6E2FF2AB3
          D6FF088EBEFF1D86B1FF80ADBFFFE7E1D6FFFFFAE5FFFFE3C4FFEDB379FFDC86
          30FFD6781AFFD57A1EFFD67A1FFFD5791CFFD4771AFFD47617FFD37414FFD476
          13FFC9690FFFB55207FFA64001FF813200DE331400A80702009D000000840000
          004D000000180000000300000000000000000000000000000000000000000000
          0000000000003A291A47F2B16DFFFFFFFFFFFFF8F3FFFFF7F0FFFFF8EFFFC0D9
          DFFF3E9BB8FF4FBACBFF59DCF2FF53D5EDFF4CCEE7FF46CAE4FF43C5E1FF3EC3
          E1FF3AC2E0FF34BEDFFF1FA9D1FF0288B9FF2986AFFF8CB2BFFFF3E6D8FFFFF6
          E0FFFDD5ADFFE6A461FFD77A1FFFD47515FFD47719FFD47619FFD37516FFD373
          14FFD27211FFD3720EFFCF6F0EFFBD5908FFAA4603FF933700EF250E00A40000
          008F0000004A0000001100000001000000000000000000000000000000000000
          000000000000402F1E4DF3B472FFFFFFFFFFFFF9F4FFFFF7F1FFFFFAF0FFB8D8
          E1FF26758FFF213D41FF22494FFF36818DFF49B9CEFF4FD5EFFF49CEE9FF42C7
          E3FF3EC3E0FF39BFDEFF35BDDEFF31BCDDFF2AB8DCFF15A1CAFF0080B4FF3188
          ADFFB5C5C7FFFFF0DBFFFFEAD4FFF1C395FFE09549FFD37212FFD27211FFD273
          13FFD27213FFD17110FFD1700EFFD06E0BFFD26F09FFBE5D0BFFA03D00FB1F0C
          00A2000000820000002F00000006000000000000000000000000000000000000
          00000000000049352157F4B878FFFFFFFFFFFFF9F4FFFFF8F2FFFFFAF1FFAED3
          DEFF66C8E2FF67E5F5FF4FB0BEFF34737CFF1C3A40FF1F484FFF378FA0FF4ACF
          E8FF43C6E2FF3EC3E0FF3AC1E0FF35BEDEFF30BBDBFF2DB7DBFF28B6DAFF20B1
          DAFF147EACFFFFEED4FFFFE8D1FFFFE9D3FFFFECD7FFFDE3C7FFEDB57EFFDB86
          31FFD06D08FFD06F0CFFD0700EFFCF6E0DFFD06C0AFFD16D07FFBD5A09FF8F35
          00EA0402009C0000005500000012000000000000000000000000000000000000
          000000000000513C2560F6BB7FFFFFFFFFFFFFFAF5FFFFF9F3FFFFFBF4FFA6D0
          DCFF6AC7E0FF6BE3F1FF66E1F1FF64E2F4FF60DFF4FF38818EFF265A63FF50D5
          EEFF49CAE4FF45C8E3FF3EBCD8FF38BCDAFF39C6E7FF32BFE2FF2CB9DDFF28B7
          DCFF1C83AEFFFFEFD5FFFFE7D1FFFFE7CFFFFFE7CFFFFFE6CEFFFFE8D1FFFFEC
          D5FFFAD7B4FFE7A767FFD4781BFFCE6804FFCE6C07FFCE6C08FFD06D08FFAE4B
          08FF311200A8000000750000001D000000000000000000000000000000000000
          000000000000573F2967F6BF87FFFFFFFFFFFFFAF6FFFFF9F5FFFFFBF4FF9CCD
          DDFF74D1E7FF74EFFCFF6EE5F4FF67DFEFFF64E0F3FF4498A5FF2A5E66FF57D9
          F0FF4ECDE5FF4ACDE7FF39A2B7FF183339FF1E5460FF278297FF2FADCDFF2FC4
          E7FF1D87B3FFFFF1D7FFFFE8D2FFFFE7D0FFFFE6CFFFFFE6CDFFFFE5CBFFFFE4
          CBFFFFE5CBFFFFE7D0FFFFEAD1FFF5CA9EFFE1994FFFD06C0AFFCE6700FFBF5D
          0BFF6A2700CD0000008800000024000000000000000000000000000000000000
          0000000000005F472F6EF7C48DFFFFFFFFFFFFFBF7FFFFFAF6FFFFFCF5FF97CD
          E0FF2D6678FF3E6D72FF53A2ABFF66D5E3FF6EEDFEFF4CA5B2FF2E6268FF5BDD
          F2FF54D1E7FF50D0E8FF3FA7BBFF255863FF359BB1FF226271FF14343CFF153F
          49FF1A7DA6FFFFF1D8FFFFE9D3FFFFE8D2FFFFE7D0FFFFE6CEFFFFE5CDFFFFE5
          CBFFFFE4C9FFFFE3C8FFFFE3C7FFFFE4C8FFFFE6CDFFFFE4C8FFF0BC85FFD484
          37FF9E4000F00000008E00000026000000010000000000000000000000000000
          000000000000664D3376F8C796FFFFFFFFFFFFFBF9FFFFFBF7FFFFFEF6FF8CC9
          DDFF6CBACDFF59A3A8FF3D6A6FFF284042FF325A5FFF376D73FF366E75FF61E1
          F5FF59D5E9FF55D4EBFF42A4B6FF2B656FFF49D4F1FF42CCEAFF3FC9E8FF31A0
          B9FF1C82ABFFFFF3D9FFFFE9D4FFFFE8D3FFFFE8D1FFFFE7CFFFFFE6CEFFFFE5
          CCFFFFE4CBFFFFE3C9FFFFE3C7FFFFE2C6FFFFE1C4FFFFE1C3FFFFE4CAFFF7CA
          9EFFC35E00F90000008E00000026000000010000000000000000000000000000
          0000000000006F53387EF9CC9CFFFFFFFFFFFFFCFAFFFFFBF8FFFFFEFAFF82C4
          DCFF89DBEDFF84F8FDFF81F6FFFF77E9F4FF5EB9C3FF3A6E74FF397179FF68E5
          F5FF5FD8EBFF5BD8EDFF46A7B8FF316B77FF51D9F2FF48CCE7FF43C7E2FF40C9
          E6FF188AB6FFFFF1DAFFFFEAD5FFFFE9D4FFFFE8D2FFFFE7D1FFFFE7CFFFFFE6
          CDFFFFE5CCFFFFE4CAFFFFE3C9FFFFE2C7FFFFE2C5FFFFE1C4FFFFE2C5FFF4C7
          99FFC25E00F90000008F00000027000000010000000000000000000000000000
          00000000000077593C86FAD1A4FFFFFFFFFFFFFDFBFFFFFCF9FFFFFFFAFF78C0
          DAFF94E3F2FF88F9FDFF82F0F8FF7DEDF6FF7CF2FCFF57A6AEFF3C7077FF6CE8
          F7FF64DCEDFF60DDEFFF4CADBCFF284C53FF388190FF41AABDFF49CEE7FF47D1
          EEFF188BB9FFFFF1DBFFFFEAD7FFFFEAD5FFFFE9D4FFFFE8D2FFFFE7D0FFFFE6
          CFFFFFE5CDFFFFE5CBFFFFE4CAFFFFE3C8FFFFE2C6FFFFE1C5FFFFE4C6FFF6C8
          9BFFC36200F90000008E00000026000000010000000000000000000000000000
          0000000000017D5F408DFBD3ABFFFFFFFFFFFFFDFCFFFFFCFBFFFFFFFBFF71C1
          DCFF6BA3AEFF71C2C4FF85F0F5FF87FBFFFF83FAFFFF5AA8AFFF407379FF73EC
          F9FF6AE0EFFF66DFF1FF51AFBDFF34646CFF3E8B98FF2A555DFF203C42FF2B61
          6AFF1582ACFFFFF3DCFFFFEBD8FFFFEAD6FFFFE9D5FFFFE9D3FFFFE8D1FFFFE7
          D0FFFFE6CEFFFFE5CDFFFFE4CBFFFFE4C9FFFFE3C8FFFFE2C6FFFFE3C7FFF5C9
          9DFFC56404F90000008E00000026000000010000000000000000000000000000
          00000000000185664694FDD7B2FFFFFFFFFFFFFEFEFFFFFDFCFFFFFFFCFF68C1
          DDFF6999A2FF466A68FF364B4AFF43696AFF5A9CA0FF518E93FF45787DFF78F0
          FBFF6FE3F0FF6DE3F3FF54AEBAFF3E7781FF61E5F8FF5ADDF3FF51CAE0FF3F9A
          AAFF1682ACFFFFF5DDFFFFEBD9FFFFEBD7FFFFEAD6FFFFE9D4FFFFE8D3FFFFE7
          D1FFFFE7CFFFFFE6CEFFFFE5CCFFFFE4CAFFFFE3C9FFFFE3C7FFFFE5CAFFF5CA
          9FFFC66809F80000008C00000025000000010000000000000000000000000000
          0000000000018E6E4C9CFCDAB7FFFFFFFFFFFFFEFEFFFFFEFDFFFFFFFDFF5EB9
          D9FFB0F5FCFF9BFFFFFF8DF1F4FF6FBCBEFF548A8CFF3A5A5CFF497D81FF7FF4
          FDFF75E7F2FF71E8F5FF58AFB9FF43818AFF67E6F9FF5EDAEDFF59D6EBFF56D8
          EEFF1A90BCFFFFF3DFFFFFECDAFFFFEBD9FFFFEAD7FFFFEAD5FFFFE9D4FFFFE8
          D2FFFFE7D1FFFFE6CFFFFFE6CDFFFFE5CCFFFFE4CAFFFFE3C8FFFFE4CBFFF3C7
          9AFFBC620CF10000008B00000025000000010000000000000000000000000000
          000000000001987451A5FDDDBEFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFFF54B6
          D8FFB5F2F8FF98FFFFFF98FFFFFF96FFFFFF95FFFFFF69B5B8FF4B7D80FF83F7
          FFFF7BEBF4FF78ECF7FF5EB3BDFF3B6267FF50A2ADFF5CC8D7FF61E0F4FF5FE0
          F4FF1B92BFFFFFF4E0FFFFEDDBFFFFECDAFFFFEBD8FFFFEAD6FFFFE9D5FFFFE9
          D3FFFFE8D2FFFFE7D0FFFFE6CEFFFFE5CDFFFFE5CBFFFFE4CAFFFFE5CCFFF5C7
          9CFFBD6710F10000008B00000025000000010000000000000000000000000000
          000000000001A07B56ADFDE0C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4AB5
          DAFFB2EDF1FF9BFFFFFF9EFFFFFF9CFFFFFF99FFFFFF6DB6B7FF538688FF89FB
          FFFF80EFF6FF7CF1FAFF61B7BFFF406A6FFF457A7FFF304C51FF2F4F53FF3E78
          7EFF1887B1FFFFF6E1FFFFEDDDFFFFECDBFFFFECD9FFFFEBD8FFFFEAD6FFFFE9
          D4FFFFE8D3FFFFE8D1FFFFE7D0FFFFE6CEFFFFE5CCFFFFE4CBFFFFE7CCFFF4C8
          9EFFBF6914F10000008B00000025000000010000000000000000000000000000
          000000000001A8815CB4FFE3C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF46B8
          DFFF5B6C6EFF455E5EFF598484FF6EACACFF84D9D9FF6DB0B0FF578A8BFF90FF
          FFFF86F2F8FF83F3FAFF66B9C0FF508B91FF78F5FFFF70EAF8FF60C7D6FF4F9D
          A6FF1684AEFFFFF5E2FFFFEEDEFFFFEDDCFFFFECDAFFFFEBD9FFFFEBD7FFFFEA
          D5FFFFE9D4FFFFE8D2FFFFE7D1FFFFE7CFFFFFE6CEFFFFE5CCFFFFE6CDFFF4C9
          A0FFC06C19F10000008B00000025000000010000000000000000000000000000
          000000000001B08A62BAFEE7CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3BB1
          D8FFC8FFFFFF8CEEEDFF79C1C1FF619494FF496868FF3E5454FF5B8D8EFF94FF
          FFFF8BF6FAFF8AF8FDFF69B7BCFF58959AFF7DF4FEFF74E9F5FF6FE6F3FF70E8
          F6FF1D97C2FFFFF6E2FFFFF0DFFFFFEEDDFFFFEDDCFFFFECDAFFFFEBD8FFFFEA
          D7FFFFEAD5FFFFE9D4FFFFE8D2FFFFE7D0FFFFE6CFFFFFE6CDFFFFE8D0FFF6CC
          A1FFC16D1BF10000008B00000025000000010000000000000000000000000000
          000000000001B99066C3FFE9D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF32AB
          D5FFC8FFFFFF98FFFFFF9CFFFFFF9EFFFFFF9EFFFFFF91F2F2FF86DCDCFF98FF
          FFFF91FAFCFF8EFCFEFF6EBABCFF4A7073FF66B6BCFF73DDE7FF78F0FDFF77F0
          FBFF1E99C5FFFFF6E5FFFFEFE0FFFFEEDFFFFFEDDDFFFFEDDBFFFFECDAFFFFEB
          D8FFFFEAD6FFFFE9D5FFFFE9D3FFFFE8D2FFFFE7D0FFFFE6CEFFFFE7D0FFF5CC
          A3FFC3701EF10000008B00000025000000010000000000000000000000000000
          000000000001C19769CBFFEBD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2DA9
          D5FFCAFFFFFF97FFFFFF99FFFFFF99FFFFFF99FFFFFF9AFFFFFF9AFFFFFF99FE
          FEFF97FDFEFF93FBFDFF86E7EBFF67ABAEFF538185FF3F595CFF3E5E5FFF5087
          8AFF178FB8FFFFF6E6FFFFF1E1FFFFEFE0FFFFEEDEFFFFEDDCFFFFECDBFFFFEC
          D9FFFFEBD7FFFFEAD6FFFFE9D4FFFFE8D3FFFFE8D1FFFFE7D0FFFFE8D1FFF6CD
          A5FFC47122F10000008B00000025000000010000000000000000000000000000
          000000000001CA9C6ED3FFECDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF25A6
          D3FFD2FFFFFFA4FFFFFF9EFFFFFF9CFFFFFF9AFFFFFF99FFFFFF99FFFFFF99FF
          FFFF98FEFEFF98FFFFFF93FDFEFF91FEFFFF8DFDFFFF88FAFFFF78DDE4FF66B5
          B9FF1589B3FFFFF7E7FFFFF0E3FFFFEFE1FFFFEFDFFFFFEEDEFFFFEDDCFFFFEC
          DAFFFFEBD9FFFFEBD7FFFFEAD5FFFFE9D4FFFFE8D2FFFFE7D1FFFFEAD2FFF6CE
          A7FFC57426F10000008B00000024000000010000000000000000000000000000
          000000000001D2A478DAFFF1E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95D5
          EAFF29A8D3FF27A7D4FF49BADDFF70D4EBFF99EEF6FFB2FFFFFFA6FFFFFF9EFF
          FFFF9CFFFFFF99FFFFFF97FFFFFF93FBFDFF8EF8FBFF89F6FAFF86F5FBFF88F7
          FDFF1D9FC9FFFFF8E7FFFFF1E4FFFFF0E2FFFFEFE1FFFFEEDFFFFFEEDDFFFFED
          DCFFFFECDAFFFFEBD8FFFFEAD7FFFFEAD5FFFFE9D4FFFFE8D2FFFFE9D3FFF6CF
          A9FFC7792BF10000008B00000024000000010000000000000000000000000000
          000000000000C6823DE0F9E0C7FFFEE8D4FFFBE4CDFFFEF3E8FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFD9F0FAFF9CD7EBFF5DBDDEFF2DA8D4FF27A6D3FF4BBB
          DDFF72D3E9FF9BEFF7FFB7FFFFFFA3FFFFFF99FFFFFF91FDFCFF8AF6FBFF8AF9
          FCFF1E9ECAFFFFF7E8FFFFF3E5FFFFF1E3FFFFF0E2FFFFEFE0FFFFEEDEFFFFED
          DDFFFFEDDBFFFFECD9FFFFEBD8FFFFEAD6FFFFE9D5FFFFE9D3FFFFEBD4FFF7D1
          ABFFC87A2EF10000008900000024000000010000000000000000000000000000
          000000000000A04900D1EFBD8EFFFDD6B1FFF7BB7CFFF6B97AFFF5B676FFF6C0
          88FFF7CDA2FFFADCBEFFFFECDAFFFFFEF8FFFFFFFFFFFFFFFFFFFFFFFFFFDBEF
          F7FF9DD4E7FF5FB9D8FF2CA3CEFF30A5D0FF4DB9DAFF73D2E8FF96EBF4FFADFF
          FFFF1EA0CCFFFFF8E9FFFFF2E6FFFFF1E5FFFFF0E3FFFFF0E1FFFFEFE0FFFFEE
          DEFFFFEDDCFFFFECDBFFFFEBD9FFFFEBD7FFFFEAD6FFFFE9D4FFFFEAD7FFF7D1
          ACFFC27A32EC0000008700000024000000010000000000000000000000000000
          0000000000007F3D00A5E4A363FFFFE2C7FFF8BE82FFF7BD83FFF6BB80FFF5B9
          7CFFF4B778FFF3B473FFF2B16EFFF1AE6AFFF2B171FFF3BF8CFFF7CFA8FFFCE0
          C6FFFFF3E3FFFFFFFDFFFFFFFFFFFFFFFDFFDDECF1FF9ED2E1FF61B5D4FF34A2
          CAFF39A5CCFFFFF8EBFFFFF3E8FFFFF2E6FFFFF1E4FFFFF0E3FFFFEFE1FFFFEF
          DFFFFFEEDEFFFFEDDCFFFFECDAFFFFEBD9FFFFEAD7FFFFEAD5FFFFECD7FFF7D0
          A9FFBC7632E70000008700000024000000010000000000000000000000000000
          0000000000004724005CD17416FEFFEFDFFFF9C38DFFF8BE85FFF7BD82FFF6BB
          7FFFF5B97DFFF4B77AFFF3B577FFF2B374FFF1B272FFF0AF6DFFEFAC68FFEEA9
          62FFEDA55EFFECA65EFFEFB273FFF3C191FFF9D1ADFFFFE5CDFFFFF8ECFFFFFF
          FAFFFFFFF7FFFFF9F1FFFFF6EEFFFFF5EAFFFFF3E6FFFFF1E4FFFFF0E2FFFFEF
          E0FFFFEEDFFFFFEEDDFFFFEDDBFFFFECDAFFFFEBD8FFFFEAD6FFFFEBD8FFF7D0
          ABFFBC7A36E70000008600000024000000010000000000000000000000000000
          00000000000008030008B15500E1EEBB8BFFFFDDBDFFF8BF84FFF7BE84FFF6BC
          81FFF5BA7FFFF4B87CFFF4B679FFF3B576FFF2B374FFF1B171FFF0AF6EFFEFAD
          6BFFEEAC69FFEDAA66FFECA862FFEBA55DFFEAA159FFE8A053FFE89C4EFFE9A2
          59FFEDB277FFF1C394FFF5D3B3FFFBE7D4FFFFF6EEFFFFF8F0FFFFF6EBFFFFF3
          E8FFFFF1E4FFFFEFDFFFFFEDDEFFFFECDBFFFFECD9FFFFEBD8FFFFECD9FFF8D3
          ADFFBD7B39E70000008600000023000000010000000000000000000000000000
          0000000000000000000048230052CB6300FCF8D7B5FFFED4ACFFF8BF84FFF7BD
          83FFF6BB80FFF5BA7EFFF4B87BFFF3B678FFF2B475FFF1B273FFF1B170FFF0AF
          6DFFEFAD6BFFEEAB68FFEDA965FFECA762FFEBA660FFEAA45DFFE9A25AFFE8A0
          57FFE79D53FFE69B4DFFE49848FFE49443FFE49443FFE7A25DFFECB57CFFF1C7
          9BFFF7DABBFFFDECDAFFFFF4EAFFFFF3E6FFFFF1E2FFFFEEDEFFFFEFDDFFF8D4
          B0FFC07E3EE70000008400000022000000010000000000000000000000000000
          000000000000000000000000000066310073CB6500FDEDB986FFFFDBB7FFFBC6
          93FFF9C188FFF8BE85FFF6BB80FFF5B87BFFF3B577FFF2B475FFF1B272FFF0B0
          6FFFEFAE6CFFEEAC6AFFEDAB67FFEDA964FFECA761FFEBA55FFFEAA35CFFE9A2
          59FFE8A057FFE79E54FFE69C51FFE59A4EFFE4994CFFE39648FFE39344FFE290
          3EFFE08D38FFDF8B36FFE19342FFE6A462FFEDB883FFF3CBA3FFFBE2C8FFF9D7
          B5FFBE7E41E60000007A0000001F000000000000000000000000000000000000
          00000000000000000000000000000000000048230052B45600E1CE6904FED77F
          28FFDC8C3CFFE1974EFFE7A35FFFEDAF6FFFF2B87FFFF7C18DFFF6BF88FFF3B6
          7AFFF2B374FFF0B16FFFEFAE6BFFEEAB67FFECA863FFEBA661FFEAA55EFFE9A3
          5BFFE9A158FFE89F56FFE79D53FFE69B50FFE59A4DFFE4984BFFE39649FFE295
          46FFE19343FFE19141FFE08F3DFFDF8C38FFDE8934FFDC862EFFDC832AFFD277
          22FF813600D40000006200000017000000000000000000000000000000000000
          0000000000000000000000000000000000000000000004020006351A003E5328
          00676C350087894200A5A14D00C3BC5A00E1C45F00F8CA6200FFCF6C0AFFD67D
          25FFDA8735FFDE9142FFE39B53FFE7A35FFFEDAD6DFFF0B375FFF0B172FFEDAA
          65FFEAA55DFFE9A25BFFE8A157FFE69E53FFE69B4FFFE5994DFFE4984BFFE396
          48FFE29445FFE19243FFE09140FFE08F3DFFDF8D3BFFDE8B38FFDF8B37FFCE73
          22FF562600AF0000003D0000000A000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000100000001000000020803000A1D0E0025381B00465128
          00666D360086884100A4A14D00C2B85900E0C15C00F6C65F00FECB6807FFD276
          1EFFD6802DFFD98839FFDE8F43FFE1984FFFE59E57FFE9A45DFFE9A25BFFE69D
          52FFE5984AFFE39746FFE29344FFE19140FFE08F3DFFDF8E3CFFDE8D3CFFBB5A
          07FB1F0E006C0000001900000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000100000001000000010905000B1D0E0025371A00465026
          006669320086843E00A49C4900C2B65500E1BE5800F7C25B00FEC66105FFCB6D
          16FFCF7623FFD47D2DFFD78534FFDB893AFFDA8838FFD57E2BFFC16008FE5929
          008E0000001B0000000400000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000100000001000000010703000B1A0C0025311800454822
          00655E2C0085773600A38C4000C1A54C00E0A54A00E1833D00BA391A005A0000
          000D000000030000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000100000001000000010000000100000001000000010000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36240000424D3624000000000000360000002800000030000000300000000100
          2000000000000024000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000100000001000000020000000200000002000000020000
          0002000000020000000200000002000000020000000200000002000000020000
          0002000000020000000200000002000000020000000200000002000000020000
          0002000000020000000200000002000000020000000200000002000000020000
          0002000000020000000200000002000000020000000200000002000000020000
          0002000000020000000200000002000000010000000100000000000000000000
          000100000004000000090000000D0000000E0000000E0000000E0000000E0000
          000E0000000E0000000E0000000E0000000E0000000E0000000E0000000E0000
          000E0000000E0000000E0000000E0000000E0000000E0000000E0000000E0000
          000E0000000E0000000E0000000E0000000E0000000E0000000E0000000E0000
          000E0000000E0000000E0000000E0000000E0000000E0000000E0000000E0000
          000E0000000E0000000E0000000E0000000D0000000900000004000000000101
          01030100000C0000001900000023000000260000002600000026000000260000
          0026000000260000002600000026000000260000002600000026000000260000
          0026000000260000002600000026000000260000002600000026000000260000
          0026000000260000002600000026000000260000002600000026000000260000
          0026000000260000002600000026000000260000002600000026000000260000
          0026000000260000002600000026000000230000001A0000000C000000006F62
          5CA6A39087EFA49188F0A38F86F0A18E84F09F8C82F09D8A80F09B887EF09986
          7CF0988479F0968177F0937F75F0917C72F08F7A70F08D786DF08B766BF08974
          68F0887267F0867066F0856F64F0846E63F0846E63F0846E63F0846E63F0846E
          63F0846E63F0846E63F0846E63F0846E63F0846E63F0846E63F0846E63F0846E
          63F0846E63F0846E63F0846E63F0846E63F0846E63F0846E63F0846E63F0846E
          63F0846E63F0846E63F0846E63F0846E63F04F423BB60000001500000000A28F
          86ECFAF5F0FEFCF8F3FFFCF8F3FFFCF8F3FFFCF8F3FFFCF8F3FFFCF8F3FFFCF8
          F3FFFCF8F3FFFCF7F3FFFCF7F3FFFCF7F3FFFCF7F3FFFBF7F3FFFBF7F2FFFBF6
          F2FFFBF6F2FFFBF6F2FFFBF6F2FFFBF6F2FFFAF5F1FFFAF5F1FFFAF5F1FFFAF5
          F1FFFAF5F1FFFAF4F1FFFAF4F0FFF9F4F0FFF9F4F0FFF9F3F0FFF9F3F0FFF9F3
          F0FFF9F3EFFFF8F3EFFFF8F3EFFFF8F2EFFFF8F2EFFFF8F2EFFFF8F2EFFFF8F2
          EFFFF8F2EEFFF8F2EEFFF8F1EEFFF8F1EEFF877267F00202011F00000000A28F
          86ECFAF5F0FEFEF2E8FFFEF1E6FFFEF1E6FFFEF1E6FFFEF1E6FFFEF1E6FFFEF1
          E6FFFEF1E6FFFDF1E5FFFDF1E5FFFDF1E5FFFDF0E4FFFCF0E4FFFCEFE4FFFCEF
          E3FFFCEEE3FFFBEEE2FFFBEDE2FFFAEDE2FFFAECE1FFDDD1C7FFCCC1B8FFF9EA
          E0FFF8EADFFFF8E9DFFFF7E9DEFFF7E8DEFFB5AAA3FFE6D8CFFFF6E6DCFFF5E6
          DCFFF5E5DBFFF4E5DBFFF4E4DBFFF3E4DAFFF3E3DAFFF3E3DAFFF2E2D9FFF2E2
          D9FFF2E1D9FFF1E1D8FFF2E3DAFFF8F1EEFF877267F00202022000000000A28F
          86ECFAF5F0FEFEF2E6FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFEF1E4FFFEF1E3FFFEF0E3FFFEF0E3FFFDEFE2FFFDEFE2FFFCEE
          E2FFFCEEE1FFFCEDE1FFFBEDE0FFFBECE0FFFAEBDFFFFAEBDFFFA99F97FFE1D4
          C9FFF7E7DCFFCEC2B8FFF8E8DCFFF7E7DCFFF7E6DBFFAFA49CFFE7D7CDFFEFDF
          D4FFF5E4D9FFF4E3D9FFF4E3D8FFF3E2D8FFF3E2D7FFF3E1D7FFF2E1D7FFF2E0
          D6FFF2E0D6FFF1DFD6FFF1E1D8FFF8F2EEFF877267F00202022000000000A28F
          86ECFAF5F0FEFEF2E6FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFEF1E4FFFEF1E3FFFEF0E3FFFEF0E3FFFDEFE2FFFDEF
          E2FFFCEEE2FFFCEEE1FFFCEDE1FFFBEDE0FFFBECE0FFFAEBDFFFE6D9CEFF847C
          76FF9E958EFF968D86FF7D7670FFA99F97FF8A817BFFF0E1D6FF5D5854FF827A
          74FFACA099FF908680FF988E87FFB2A69FFFD5C5BCFFCABCB3FFF2E1D7FFF2E1
          D7FFF2E0D6FFF2E0D6FFF2E1D8FFF8F2EEFF877267F00202022000000000A28F
          86ECFAF5F0FEFEF2E6FFFFF1E4FFA6A09AFFA6A09AFFA6A09AFFA6A09AFFA6A0
          9AFFA6A09AFFA6A09AFFA6A09AFFA5A09AFFAAA49EFFFEF0E3FFFEF0E3FFFDEF
          E2FFFDEFE2FFFCEEE2FFFCEEE1FFFCEDE1FFFBEDE0FFFBECE0FFD6C9BFFFE0D3
          C8FFCDC1B7FFB5AAA2FFCABDB4FF918882FFF7E7DCFFF7E7DCFFF6E6DBFFC0B4
          ABFF8D847FFFC9BCB3FFAB9F98FF968C85FF776F6AFF3D3936FF625C58FFAEA2
          9BFF817772FFD2C3BBFFF2E2D8FFF8F2EFFF877267F00202022000000000A28F
          86ECFAF5F0FEFEF2E6FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFEF1E4FFFEF1E3FFFEF0E3FFFEF0
          E3FFFDEFE2FFFDEFE2FFFCEEE2FFFCEEE1FFFCEDE1FFFBEDE0FFFBECE0FFC1B5
          ACFFBBB0A7FFC5B9B0FFC7BBB2FFA59B94FFC2B6ADFFF8E8DCFFF7E7DCFFF7E6
          DBFFBFB3ABFF817973FFF5E4DAFFF5E4D9FFF4E3D9FFC0B3ABFFDDCDC4FF6B63
          5FFFB2A59EFFD9C9C0FFF2E2D9FFF8F2EFFF877267F00202011F00000000A28F
          86ECFAF5F0FEFEF2E6FFFFF1E4FFA6A09AFFA6A09AFFA6A09AFFA6A09AFFA6A0
          9AFFA6A09AFFA6A09AFFA6A09AFFA6A09AFFA6A09AFFA5A09AFFD1C8BEFFFEF0
          E3FFFEF0E3FFFDEFE2FFFDEFE2FFFCEEE2FFFCEEE1FFFCEDE1FFFBEDE0FFFBEC
          E0FFF7E8DCFFCFC2B8FFF3E4D8FFF4E5DAFFA49A93FFF8E8DDFFF8E8DCFFF7E7
          DCFFF7E6DBFFD3C6BCFFF6E5DAFFF5E4DAFFF5E4D9FFEFDFD4FFA39891FFEFDE
          D4FF8C837DFFC3B5ADFFF3E3D9FFF8F2EFFF877267F00202011F00000000A28F
          86ECFAF5F0FEFEF2E6FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFEF1E4FFFEF1
          E3FFFEF0E3FFFEF0E3FFFDEFE2FFFDEFE2FFFCEEE2FFFCEEE1FFFCEDE1FFFBED
          E0FFFBECE0FFFAEBDFFFFAEBDFFFF9EADEFFF9E9DEFFF8E9DDFFF8E8DDFFF8E8
          DCFFEFE0D6FFEFE0D5FFEEDFD5FFEEDED4FFEEDED4FFEDDDD3FFEDDDD3FFECDC
          D2FFECDBD2FFD3C4BCFFF3E3D9FFF8F2EFFF877267F00202011F00000000A28F
          86ECFAF5F0FEFEF2E6FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFEF1
          E4FFFEF1E3FFFEF0E3FFFEF0E3FFFDEFE2FFFDEFE2FFFCEEE2FFFCEEE1FFFCED
          E1FFFBEDE0FFFBECE0FFFAEBDFFFFAEBDFFFF9EADEFFF9E9DEFFF8E9DDFFF8E8
          DDFF626262FF696868FF696868FF696868FF696868FF696868FF696868FF6968
          68FF696868FF626262FFF3E3DAFFF8F2EFFF877267F00202011F00000000A28F
          86ECFAF5F0FEFEF2E6FFFFF1E4FF626262FF626262FF626262FF626262FF6262
          62FF626262FF626262FF626262FF626262FF626262FF626262FF626262FF6262
          62FF626262FF626262FF626262FF626262FF626262FF626262FF626262FF6262
          62FF626262FF626262FF626262FF626262FF626262FF626262FFB6ADA7FFF8E9
          DDFF626262FFF8E8DCFFF7E7DCFFF7E6DBFFF6E6DBFFF6E5DAFFF5E4DAFFF5E4
          D9FFF4E3D9FF626262FFF4E4DAFFF8F3EFFF857065F00101011C00000000A28F
          86ECFAF5F0FEFEF2E6FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFEF1E4FFFEF1E3FFFEF0E3FFFEF0E3FFFDEFE2FFFDEFE2FFFCEE
          E2FFFCEEE1FFFCEDE1FFFBEDE0FFFBECE0FFFAEBDFFFFAEBDFFFF9EADEFFF9E9
          DEFF626262FFF8E8DDFFF8E8DCFFF7E7DCFFF7E6DBFFF6E6DBFFF6E5DAFFF5E4
          DAFFF5E4D9FF626262FFF4E5DBFFF8F3EFFF857065F00101011C00000000A28F
          86ECFAF5F0FEFEF2E6FFA6A09AFFA6A09AFFA6A09AFFA6A09AFFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFEF1E4FFFEF1E3FFFEF0E3FFFEF0E3FFFDEFE2FFFDEF
          E2FFFCEEE2FFFCEEE1FFFCEDE1FFFBEDE0FFFBECE0FFFAEBDFFFFAEBDFFFF9EA
          DEFF626262FFF8E9DDFFF8E8DDFFF8E8DCFFF7E7DCFFF7E6DBFFF6E6DBFFF6E5
          DAFFF5E4DAFF626262FFF5E5DBFFF9F3EFFF857065F00101011C00000000A28F
          86ECFAF5F0FEFEF2E6FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFEF1E4FFFEF1E3FFFEF0E3FFFEF0E3FFFDEF
          E2FFFDEFE2FFFCEEE2FFFCEEE1FFFCEDE1FFFBEDE0FFFBECE0FFFAEBDFFFFAEB
          DFFF626262FF626262FF626262FF626262FF626262FF626262FF626262FF6262
          62FF626262FF626262FFF5E5DCFFF9F3F0FF857065F00101011C00000000A28F
          86ECFAF5F0FEFEF2E6FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFEF1E4FFFEF1E3FFFEF0E3FFFEF0
          E3FFFDEFE2FFFDEFE2FFFCEEE2FFFCEEE1FFFCEDE1FFFBEDE0FFFBECE0FFFAEB
          DFFFFAEBDFFFF9EADEFFF9E9DEFFF8E9DDFFF8E8DDFFF8E8DCFFF7E7DCFFF7E6
          DBFFF6E6DBFFF6E5DAFFF6E6DCFFF9F3F0FF857065F00101011C00000000A28F
          86ECFAF5F0FEFEF2E6FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFEF1E4FFFEF1E3FFFEF0
          E3FFFEF0E3FFFDEFE2FFFDEFE2FFFCEEE2FFFCEEE1FFFCEDE1FFFBEDE0FFFBEC
          E0FFFAEBDFFFFAEBDFFFF9EADEFFF9E9DEFFF8E9DDFFF8E8DDFFF8E8DCFFF7E7
          DCFFF7E6DBFFF6E6DBFFF6E7DDFFF9F3F0FF857065F00101011C00000000A28F
          86ECFAF5F0FEFEF2E6FF626262FF626262FF626262FF626262FF626262FF6262
          62FF626262FF626262FF626262FF626262FF626262FF626262FF626262FF6262
          62FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFEF1E4FFFEF1
          E3FFFEF0E3FFFEF0E3FFFDEFE2FFF7EADDFFA49E99FFA49E99FFA49E99FFA49E
          98FFA49E98FFA49D98FFA49D98FFA39D97FFA8A19BFFF3E4D9FFA39C97FFA39C
          97FFA29B97FFA79F9AFFF6E7DDFFF9F4F0FF857065F00101011C00000000A28F
          86ECFAF5F0FEFEF2E6FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFEF1
          E4FFFEF1E3FFFEF0E3FFFEF0E3FFFDEFE2FFFDEFE2FFFCEEE2FFFCEEE1FFFCED
          E1FFFBEDE0FFFBECE0FFFAEBDFFFFAEBDFFFF9EADEFFF9E9DEFFF8E9DDFFF8E8
          DDFFF8E8DCFFF7E7DCFFF7E8DEFFF9F4F0FF857065F00101011C00000000A28F
          86ECFAF5F0FEFEF2E6FF626262FF626262FF626262FF626262FF626262FF6262
          62FF626262FF626262FF626262FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFEF1E4FFFEF1E3FFFEF0E3FFF8EBDEFFA59F99FFA59F99FFA49E99FFA49E
          99FFA49E99FFA49E98FFA49E98FFA49D98FFA49D98FFA39D97FFA39C97FFA39C
          97FFA39C97FFA8A09BFFF7E8DEFFFAF4F0FF857065F00101011C00000000A28F
          86ECFAF5F0FEFEF2E6FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFEF1E4FFFEF1E3FFFEF0E3FFFEF0E3FFFDEFE2FFFDEFE2FFFCEE
          E2FFFCEEE1FFFCEDE1FFFBEDE0FFFBECE0FFFAEBDFFFFAEBDFFFF9EADEFFF9E9
          DEFFF8E9DDFFF8E8DDFFF8E9DFFFFAF4F1FF857065F00101011C00000000A28F
          86ECFAF5F0FEFEF2E6FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF1E4FFFFF1E4FFFEF1E4FFFEF1E3FFFEF0E3FFFEF0E3FFFDEFE2FFFDEF
          E2FFFCEEE2FFFCEEE1FFFCEDE1FFFBEDE0FFFBECE0FFFAEBDFFFFAEBDFFFF9EA
          DEFFF9E9DEFFF8E9DDFFF8EADFFFFAF5F1FF857065F00101011B000000003F72
          3DF712671CFF12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF1267
          1CFF12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF1267
          1CFF12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF1267
          1CFF12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF1267
          1CFF12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF1267
          1CFF12671CFF12671CFF12671CFF12671CFF336930FA01010117000000001467
          1DFE1B8028FF1F852DFF238A32FF278F38FF2B943DFF309943FF349E48FF38A3
          4DFF3CA852FF40AC56FF43B05AFF46B35EFF48B761FF4AB964FF4CBA65FF4DBC
          67FF4DBC67FF4CBB66FF4BB964FF49B762FF47B55FFF44B15CFF41AE58FF3EAA
          54FF3AA54FFF36A14AFF329C45FF2E9740FF29923BFF258D35FF218830FF1D83
          2BFF197E26FF167A22FF12761EFF0F721AFF0D6F17FF0B6D14FF0A6C13FF0A6C
          13FF0A6C13FF0A6C13FF0A6C13FF0A6C13FF11671BFF01020116000000001467
          1DFE1B8028FF1F852DFF238A32FF278F38FF2B943DFF309943FF349E48FF38A3
          4DFF3CA852FF40AC56FF43B05AFF46B35EFF48B761FF4AB964FF4CBA65FF4DBC
          67FF4DBC67FF4CBB66FF4BB964FF49B762FF47B55FFF44B15CFF41AE58FF3EAA
          54FF3AA54FFF36A14AFF329C45FF2E9740FF29923BFF258D35FF218830FF1D83
          2BFF197E26FF167A22FF12761EFF0F721AFF0D6F17FF0B6D14FF0A6C13FF0A6C
          13FF0A6C13FF0A6C13FF0A6C13FF0A6C13FF12671BFF0104010B000000001852
          1DC112671CFE12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF1267
          1CFF12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF1267
          1CFF12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF1267
          1CFF12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF1267
          1CFF12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF12671CFF1267
          1CFF12671CFF12671CFF12671CFF12671CFF144F19C400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object TimerDesc: TTimer
    Enabled = False
    Interval = 100
    Left = 288
    Top = 128
  end
  object TimerDesc2: TTimer
    Enabled = False
    Interval = 2000
    Left = 328
    Top = 120
  end
  object TimerCred: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = TimerCredTimer
    Left = 464
    Top = 112
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 480
    Top = 168
  end
  object cxImageList3: TcxImageList
    Height = 12
    Width = 12
    FormatVersion = 1
    DesignInfo = 12583000
    ImageInfo = <
      item
        Image.Data = {
          76020000424D760200000000000036000000280000000C0000000C0000000100
          2000000000004002000000000000000000000000000000000000000000000000
          00000000000000000000000000005F5F5FFF5F5F5FFF00000000000000000000
          0000000000000000000000000000000000004E4E4EC900000000070707135F5F
          5FFF5F5F5FFF02020206000000005D5D5DF40000000000000000000000005A5A
          5AE75F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F
          5FFF4E4E4ECC0000000000000000000000005F5F5FFF5F5F5FFF5F5F5FFF5F5F
          5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF0000000000000000000000000000
          00005F5F5FFF5F5F5FFF5F5F5FFF1111112C1111112C5F5F5FFF5F5F5FFF5F5F
          5FFF0A0A0A1A00000000616161FF5F5F5FFF5F5F5FFF5F5F5FFF151515380000
          000000000000141414355F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF616161FF5F5F
          5FFF5F5F5FFF5F5F5FFF1A1A1A440000000000000000191919415F5F5FFF5F5F
          5FFF5F5F5FFF5F5F5FFF00000000020202055F5F5FFF5F5F5FFF5F5F5FFF1E1E
          1E501E1E1E505F5F5FFF5F5F5FFF5F5F5FFF0000000000000000000000000000
          00005F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F
          5FFF0202020500000000000000004B4B4BBB5F5F5FFF5F5F5FFF5F5F5FFF5F5F
          5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5D5D5DF900000000000000000000
          0000595959EA00000000000000005F5F5FFF5F5F5FFF0404040A000000004848
          48BC000000000000000000000000000000000000000000000000000000005F5F
          5FFF5F5F5FFF0000000000000000000000000000000000000000}
      end>
  end
end
