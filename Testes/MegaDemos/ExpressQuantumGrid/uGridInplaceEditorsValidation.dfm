inherited frmInplaceEditorsValidationGrid: TfrmInplaceEditorsValidationGrid
  inherited plTop: TPanel
  end
  inherited plGrid: TPanel
    Top = 98
    Height = 161
    inherited Grid: TcxGrid
      Width = 451
      Height = 161
      object cxGridTableView: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        DataController.Data = {
          2D0300000F00000044617461436F6E74726F6C6C657231050000001200000054
          6378537472696E6756616C75655479706512000000546378537472696E675661
          6C75655479706512000000546378537472696E6756616C756554797065120000
          00546378537472696E6756616C75655479706512000000546378537472696E67
          56616C75655479706506000000445855464D540000040000004A006F0068006E
          00010019000000310032003300200048006F006D00650020004C0061006E0065
          002C00200048006F006D0065007300760069006C006C0065000101445855464D
          54000005000000480065006E0072007900010016000000340033003600200031
          007300740020004100760065002C00200043006C006500760065006C0061006E
          006400000E0000002800380030003000290020003200340034002D0031003000
          36003900000F00000069006E0066006F00400068006F00740062006F0078002E
          0063006F006D00445855464D540000050000004600720061006E006B00000600
          000048006F006C006D0065007300001C00000033003400390020004700720061
          0070006800690063002000440065007300690067006E0020004C002C0020004E
          00650077006D0061006E000101445855464D540000070000004C006500740069
          00630069006100000400000046006F007200640001000E000000280035003500
          3500290020003700370036002D003100350036003600000B00000066006F0072
          006400400068006F00740062006F007800445855464D540000050000004B0061
          00720065006E00000600000048006F006C006D006500730001000E0000002800
          350035003500290020003300340032002D00320035003700340001445855464D
          5400000500000052006F0067006500720000090000004D006900630068006500
          6C0073006F006E00001E000000330039003200300020004D0069006300680065
          006C0073006F006E002000440072002E002C0020004200720069006400670065
          0066006F0072006400000E000000280035003500350029002000390035003400
          2D003500310038003800001100000072006F006700650072006D0040006D0079
          006D00610069006C002E0062006F007800}
        OptionsBehavior.CellHints = True
        OptionsCustomize.ColumnsQuickCustomization = True
        object cxGridTableViewColumnFirstName: TcxGridColumn
          Caption = 'First Name'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ValidateOnEnter = True
          Properties.OnValidate = cxGridTableViewColumnFirstNamePropertiesValidate
          OnValidateDrawValue = cxGridTableViewColumnFirstNameValidateDrawValue
        end
        object cxGridTableViewColumnLastName: TcxGridColumn
          Caption = 'Last Name'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ValidateOnEnter = True
          Properties.OnValidate = cxGridTableViewColumnLastNamePropertiesValidate
          OnValidateDrawValue = cxGridTableViewColumnLastNameValidateDrawValue
          Width = 99
        end
        object cxGridTableViewColumnAddress: TcxGridColumn
          Caption = 'Address'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            '123 Home Lane, Homesville'
            '436 1st Ave, Cleveland'
            '349 Graphic Design L, Newman'
            '3920 Michelson Dr., Bridgeford')
          Properties.OnValidate = cxGridTableViewColumnAddressPropertiesValidate
          OnValidateDrawValue = cxGridTableViewColumnAddressValidateDrawValue
          Width = 175
        end
        object cxGridTableViewColumnPhoneNumber: TcxGridColumn
          Caption = 'Phone Number'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ValidateOnEnter = True
          Properties.OnValidate = cxGridTableViewColumnPhoneNumberPropertiesValidate
          OnValidateDrawValue = cxGridTableViewColumnPhoneNumberValidateDrawValue
          Width = 102
        end
        object cxGridTableViewColumnEmail: TcxGridColumn
          Caption = 'Email'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ValidateOnEnter = True
          Properties.OnValidate = cxGridTableViewColumnEmailPropertiesValidate
          OnValidateDrawValue = cxGridTableViewColumnEmailValidateDrawValue
          Width = 120
        end
      end
      object GridLevel: TcxGridLevel
        GridView = cxGridTableView
      end
    end
  end
  inherited pnlSeparator: TPanel
    Top = 98
  end
  object cxGroupBox4: TcxGroupBox
    Left = 0
    Top = 57
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    Style.Shadow = False
    TabOrder = 4
    DesignSize = (
      451
      41)
    Height = 41
    Width = 451
    object cbValidationRaiseException: TcxCheckBox
      Left = 123
      Top = 11
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Raise Exception'
      Properties.OnChange = InitializeEditors
      TabOrder = 0
      Transparent = True
      Width = 110
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
      Width = 110
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
      Width = 110
    end
    object cxLabel1: TcxLabel
      Left = 11
      Top = 12
      Caption = 'Validation Options:'
      Transparent = True
    end
  end
  object cxHintStyleController: TcxHintStyleController
    HintStyleClassName = 'TdxScreenTipStyle'
    HintStyle.ScreenTipLinks = <
      item
        ScreenTip = stGrid
        Control = Grid
      end>
    HintStyle.ScreenTipActionLinks = <>
    HintHidePause = 10000
    OnShowHintEx = cxHintStyleControllerShowHintEx
    Left = 136
    Top = 120
  end
  object dxScreenTipRepository: TdxScreenTipRepository
    AssignedFonts = [stbHeader]
    HeaderFont.Charset = RUSSIAN_CHARSET
    HeaderFont.Color = 5000268
    HeaderFont.Height = -12
    HeaderFont.Name = 'Segoe UI Semibold'
    HeaderFont.Style = [fsBold]
    Left = 136
    Top = 176
    object stGrid: TdxScreenTip
      Description.GlyphFixedWidth = False
      UseHintAsHeader = True
      Width = 1
    end
  end
  object icCustomIconList: TcxImageCollection
    Left = 56
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
end
