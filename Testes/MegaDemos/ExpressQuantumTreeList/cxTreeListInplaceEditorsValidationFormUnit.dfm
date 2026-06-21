inherited frmInplaceEditorsValidation: TfrmInplaceEditorsValidation
  ActiveControl = cxGroupBox6
  Caption = 'Inplace Editors Validation'
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox5: TcxGroupBox
    Left = 379
    Top = 54
    Align = alRight
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 1
    Height = 218
    Width = 6
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 54
    Align = alLeft
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 2
    Height = 218
    Width = 6
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 48
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 3
    Height = 6
    Width = 385
  end
  object cxTreeList1: TcxTreeList
    Left = 6
    Top = 54
    Width = 373
    Height = 218
    Align = alClient
    Bands = <
      item
      end>
    Navigator.Buttons.CustomButtons = <>
    OptionsBehavior.CellHints = True
    TabOrder = 4
    Data = {
      00000500DB0300000F00000044617461436F6E74726F6C6C6572310500000012
      000000546378537472696E6756616C7565547970651200000054637853747269
      6E6756616C75655479706512000000546378537472696E6756616C7565547970
      6512000000546378537472696E6756616C756554797065120000005463785374
      72696E6756616C75655479706506000000445855464D540000040000004A006F
      0068006E00010019000000310032003300200048006F006D00650020004C0061
      006E0065002C00200048006F006D0065007300760069006C006C006500010144
      5855464D54000005000000480065006E00720079000100160000003400330036
      00200031007300740020004100760065002C00200043006C006500760065006C
      0061006E006400000E0000002800380030003000290020003200340034002D00
      3100300036003900000F00000069006E0066006F00400068006F00740062006F
      0078002E0063006F006D00445855464D540000050000004600720061006E006B
      00000600000048006F006C006D0065007300001C000000330034003900200047
      007200610070006800690063002000440065007300690067006E0020004C002C
      0020004E00650077006D0061006E000101445855464D540000070000004C0065
      0074006900630069006100000400000046006F007200640001000E0000002800
      350035003500290020003700370036002D003100350036003600000B00000066
      006F0072006400400068006F00740062006F007800445855464D540000050000
      004B006100720065006E00000600000048006F006C006D006500730001000E00
      00002800350035003500290020003300340032002D0032003500370034000144
      5855464D5400000500000052006F0067006500720000090000004D0069006300
      680065006C0073006F006E00001E000000330039003200300020004D00690063
      00680065006C0073006F006E002000440072002E002C00200042007200690064
      006700650066006F0072006400000E0000002800350035003500290020003900
      350034002D003500310038003800001100000072006F006700650072006D0040
      006D0079006D00610069006C002E0062006F0078000600000000000000080000
      00000000000000FFFFFFFFFFFFFFFFFFFFFFFF01000000080000000000000000
      00FFFFFFFFFFFFFFFFFFFFFFFF0200000008000000000000000000FFFFFFFFFF
      FFFFFFFFFFFFFF0300000008000000000000000000FFFFFFFFFFFFFFFFFFFFFF
      FF0400000008000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0500000008
      020000000000000000FFFFFFFFFFFFFFFFFFFFFFFF1A0006000000}
    object cxTreeList1ColumnFirstName: TcxTreeListColumn
      PropertiesClassName = 'TcxTextEditProperties'
      Properties.OnValidate = cxTreeList1ColumnFirstNamePropertiesValidate
      Caption.Text = 'First Name'
      DataBinding.ValueType = 'String'
      Width = 100
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
      OnValidateDrawValue = cxTreeList1ColumnFirstNameValidateDrawValue
    end
    object cxTreeList1ColumnLastName: TcxTreeListColumn
      PropertiesClassName = 'TcxTextEditProperties'
      Properties.OnValidate = cxTreeList1ColumnLastNamePropertiesValidate
      Caption.Text = 'Last Name'
      DataBinding.ValueType = 'String'
      Width = 100
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
      OnValidateDrawValue = cxTreeList1ColumnLastNameValidateDrawValue
    end
    object cxTreeList1ColumnAddress: TcxTreeListColumn
      PropertiesClassName = 'TcxComboBoxProperties'
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '123 Home Lane, Homesville'
        '436 1st Ave, Cleveland'
        '349 Graphic Design L, Newman'
        '3920 Michelson Dr., Bridgeford')
      Properties.OnValidate = cxTreeList1ColumnAddressPropertiesValidate
      Caption.Text = 'Address'
      DataBinding.ValueType = 'String'
      Width = 190
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
      OnValidateDrawValue = cxTreeList1ColumnAddressValidateDrawValue
    end
    object cxTreeList1ColumnPhoneNumber: TcxTreeListColumn
      PropertiesClassName = 'TcxTextEditProperties'
      Properties.OnValidate = cxTreeList1ColumnPhoneNumberPropertiesValidate
      Caption.Text = 'Phone Number'
      DataBinding.ValueType = 'String'
      Width = 100
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
      OnValidateDrawValue = cxTreeList1ColumnPhoneNumberValidateDrawValue
    end
    object cxTreeList1ColumnEmail: TcxTreeListColumn
      PropertiesClassName = 'TcxTextEditProperties'
      Properties.OnValidate = cxTreeList1ColumnEmailPropertiesValidate
      Caption.Text = 'Email'
      DataBinding.ValueType = 'String'
      Width = 100
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
      OnValidateDrawValue = cxTreeList1ColumnEmailValidateDrawValue
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 5
    DesignSize = (
      385
      48)
    Height = 48
    Width = 385
    object cxGroupBox4: TcxGroupBox
      Left = 7
      Top = 6
      Anchors = [akLeft, akTop, akRight, akBottom]
      PanelStyle.Active = True
      TabOrder = 0
      DesignSize = (
        371
        41)
      Height = 41
      Width = 371
      object cbValidationRaiseException: TcxCheckBox
        Left = 123
        Top = 11
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Raise Exception'
        Properties.OnChange = InitializeEditors
        TabOrder = 0
        Transparent = True
        Width = 112
      end
      object cbValidationShowErrorIcons: TcxCheckBox
        Left = 241
        Top = 11
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Show Error Icons'
        Properties.OnChange = InitializeEditors
        State = cbsChecked
        TabOrder = 1
        Transparent = True
        Width = 112
      end
      object cbValidationAllowLoseFocus: TcxCheckBox
        Left = 365
        Top = 11
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Allow Lose Focus'
        Properties.OnChange = InitializeEditors
        State = cbsChecked
        TabOrder = 2
        Transparent = True
        Width = 112
      end
      object cxLabel1: TcxLabel
        Left = 11
        Top = 12
        Caption = 'Validation Options:'
        Transparent = True
      end
    end
  end
  object icCustomIconList: TcxImageCollection
    Left = 64
    Top = 152
    object icCustomIcon1: TcxImageCollectionItem
      Picture.Data = {
        07544269746D617076020000424D760200000000000036000000280000000C00
        00000C0000000100200000000000400200000000000000000000000000000000
        00002DABC7FE1195B3FF1095B4FF0F94B4FF0F94B4FF0F94B4FF0F94B4FF0F94
        B4FF1095B4FF1095B4FF1195B3FF36B3CEFF37BDD9FE1DC1E5FF18C5F0FF14C2
        F0FF14C2F0FF0A6F8BFF0B6F8AFF16C3F0FF18C5F0FF1AC6F1FF1BBFE4FF44BD
        D8FF2771819A29BCDAFF24CDEFFF1ECAF1FF1CC8F1FF042128FF052127FF21CC
        F2FF24CFF2FF26CFF1FF29BCDAFF1539414D234249533DADC4E92ECFEAFF31DA
        F5FF2ED8F4FF29C6E0FF2BC7E1FF31DAF5FF32DBF5FF2DCFE9FF3DACC3EA0F1C
        1E22000000002C616C7E29B9D5FF43E8F6FF43E9F8FF165158FF155057FF40E6
        F8FF3EE4F5FF29BAD6FF2D626D7F00000000000000000A1112142999B3DB32CE
        E3FF4DF1F9FF0C2829FF0B2728FF49EEF9FF32D0E5FF2A9AB3DC0A1112140000
        0000000000000000000060969FB020B3D1FF4AEAF4FF0D282AFF0C2729FF49EA
        F5FF20B3D2FF6097A2B1000000000000000000000000000000000000000059C6
        DBFF36D0E3FF2F8E92FF2F8E92FF37D3E5FF5AC6DCFF00000000000000000000
        00000000000000000000000000001C3B414C2BB9D4FF4BECF5FF4CEEF6FF2FBF
        D8FF1C3B424C000000000000000000000000000000000000000000000000161F
        202251B4C8E937D4E6FF3DDBEAFF51B4C9E91720212300000000000000000000
        000000000000000000000000000000000000335F68762DB5D1FC31BAD3FC3360
        6977000000000000000000000000000000000000000000000000000000000000
        0000242F313312424D5D1E454D5A151C1D1F0000000000000000000000000000
        0000}
    end
  end
  object cxHintStyleController: TcxHintStyleController
    HintStyleClassName = 'TdxScreenTipStyle'
    HintStyle.ScreenTipLinks = <
      item
        ScreenTip = stGrid
        Control = cxTreeList1
      end>
    HintStyle.ScreenTipActionLinks = <>
    HintHidePause = 10000
    OnShowHintEx = cxHintStyleControllerShowHintEx
    Left = 144
    Top = 120
  end
  object dxScreenTipRepository: TdxScreenTipRepository
    AssignedFonts = [stbHeader]
    HeaderFont.Charset = RUSSIAN_CHARSET
    HeaderFont.Color = 5000268
    HeaderFont.Height = -12
    HeaderFont.Name = 'Segoe UI Semibold'
    HeaderFont.Style = [fsBold]
    Left = 144
    Top = 176
    object stGrid: TdxScreenTip
      Description.GlyphFixedWidth = False
      UseHintAsHeader = True
      Width = 1
    end
  end
end
