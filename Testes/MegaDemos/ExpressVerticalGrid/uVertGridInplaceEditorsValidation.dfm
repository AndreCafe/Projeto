inherited frmVertGridInplaceEditorsValidation: TfrmVertGridInplaceEditorsValidation
  inherited plTop: TPanel
    Width = 451
  end
  inherited pnlSeparator: TPanel
    Top = 66
    Width = 451
  end
  inherited pnlDescription: TPanel
    Top = 259
    Width = 451
    inherited lblRight1: TLabel
      Left = 446
    end
    inherited lblTop1: TLabel
      Width = 451
    end
    inherited lblBottom1: TLabel
      Width = 451
    end
    inherited pnlHintInternal: TPanel
      Width = 441
      inherited lblRight2: TLabel
        Left = 436
      end
      inherited lblTop2: TLabel
        Width = 441
      end
      inherited lblBottom2: TLabel
        Width = 441
      end
      inherited lblDescription: TLabel
        Width = 431
      end
    end
  end
  object VerticalGrid: TcxDBVerticalGrid
    Left = 0
    Top = 66
    Width = 451
    Height = 193
    Align = alClient
    LayoutStyle = lsMultiRecordView
    OptionsView.RowHeaderWidth = 144
    Navigator.Buttons.CustomButtons = <>
    TabOrder = 3
    DataController.DataSource = DataSource
    Version = 1
    object VerticalGridFirstName: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.EditProperties.OnValidate = VerticalGridFirstNameEditPropertiesValidate
      Properties.DataBinding.FieldName = 'FirstName'
      Properties.OnValidateDrawValue = VerticalGridFirstNamePropertiesValidateDrawValue
      ID = 0
      ParentID = -1
      Index = 0
      Version = 1
    end
    object VerticalGridLastName: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.EditProperties.OnValidate = VerticalGridLastNameEditPropertiesValidate
      Properties.DataBinding.FieldName = 'LastName'
      Properties.OnValidateDrawValue = VerticalGridLastNamePropertiesValidateDrawValue
      ID = 1
      ParentID = -1
      Index = 1
      Version = 1
    end
    object VerticalGridAddress: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.DropDownListStyle = lsFixedList
      Properties.EditProperties.Items.Strings = (
        '123 Home Lane, Homesville'
        '436 1st Ave, Cleveland'
        '349 Graphic Design L, Newman'
        '3920 Michelson Dr., Bridgeford')
      Properties.EditProperties.OnValidate = VerticalGridAddressEditPropertiesValidate
      Properties.DataBinding.FieldName = 'Address'
      Properties.OnValidateDrawValue = VerticalGridAddressPropertiesValidateDrawValue
      ID = 2
      ParentID = -1
      Index = 2
      Version = 1
    end
    object VerticalGridPhoneNumber: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.EditProperties.OnValidate = VerticalGridPhoneNumberEditPropertiesValidate
      Properties.DataBinding.FieldName = 'PhoneNumber'
      Properties.OnValidateDrawValue = VerticalGridPhoneNumberPropertiesValidateDrawValue
      ID = 3
      ParentID = -1
      Index = 3
      Version = 1
    end
    object VerticalGridEmail: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.EditProperties.OnValidate = VerticalGridEmailEditPropertiesValidate
      Properties.DataBinding.FieldName = 'Email'
      Properties.OnValidateDrawValue = VerticalGridEmailPropertiesValidateDrawValue
      ID = 4
      ParentID = -1
      Index = 4
      Version = 1
    end
  end
  object cxGroupBox4: TcxGroupBox
    Left = 0
    Top = 25
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
      Width = 156
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
      Width = 156
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
      Width = 156
    end
    object cxLabel1: TcxLabel
      Left = 11
      Top = 12
      Caption = 'Validation Options:'
      Transparent = True
    end
  end
  object dxScreenTipRepository: TdxScreenTipRepository
    AssignedFonts = [stbHeader]
    HeaderFont.Charset = RUSSIAN_CHARSET
    HeaderFont.Color = 5000268
    HeaderFont.Height = -12
    HeaderFont.Name = 'Segoe UI Semibold'
    HeaderFont.Style = [fsBold]
    Left = 168
    Top = 272
    object stGrid: TdxScreenTip
      Description.GlyphFixedWidth = False
      UseHintAsHeader = True
      Width = 1
    end
  end
  object cxHintStyleController: TcxHintStyleController
    HintStyleClassName = 'TdxScreenTipStyle'
    HintStyle.ScreenTipLinks = <
      item
        ScreenTip = stGrid
        Control = VerticalGrid
      end>
    HintStyle.ScreenTipActionLinks = <>
    HintHidePause = 10000
    OnShowHintEx = cxHintStyleControllerShowHintEx
    Left = 168
    Top = 216
  end
  object icCustomIconList: TcxImageCollection
    Left = 88
    Top = 248
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
  object dxMemData1: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F050000001400000001000A0046697273744E616D65
      0014000000010009004C6173744E616D65002800000001000800416464726573
      73001400000001000C0050686F6E654E756D626572001400000001000600456D
      61696C0001040000004A6F686E00011900000031323320486F6D65204C616E65
      2C20486F6D657376696C6C650000010500000048656E72790001160000003433
      3620317374204176652C20436C6576656C616E64010E00000028383030292032
      34342D31303639010F000000696E666F40686F74626F782E636F6D0105000000
      4672616E6B0106000000486F6C6D6573011C0000003334392047726170686963
      2044657369676E204C2C204E65776D616E000001070000004C65746963696101
      04000000466F72640100000000010E0000002835353529203737362D31353636
      010B000000666F726440686F74626F7801050000004B6172656E010600000048
      6F6C6D65730100000000010E0000002835353529203334322D32353734000105
      000000526F67657201090000004D696368656C736F6E011E0000003339323020
      4D696368656C736F6E2044722E2C20427269646765666F7264010E0000002835
      353529203935342D353138380111000000726F6765726D406D796D61696C2E62
      6F78}
    SortOptions = []
    Left = 56
    Top = 24
    object dxMemData1FirstName: TStringField
      FieldName = 'FirstName'
    end
    object dxMemData1LastName: TStringField
      FieldName = 'LastName'
    end
    object dxMemData1Address: TStringField
      FieldName = 'Address'
      Size = 40
    end
    object dxMemData1PhoneNumber: TStringField
      FieldName = 'PhoneNumber'
    end
    object dxMemData1Email: TStringField
      FieldName = 'Email'
    end
  end
  object DataSource: TDataSource
    DataSet = dxMemData1
    Left = 56
    Top = 80
  end
end
