object dxWizardControlDemoSetupForm: TdxWizardControlDemoSetupForm
  Left = 317
  Top = 126
  AutoSize = True
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Demo settings'
  ClientHeight = 362
  ClientWidth = 351
  Color = clBtnFace
  Constraints.MinHeight = 271
  Constraints.MinWidth = 297
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dxSetupFormLayoutControl: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 351
    Height = 362
    ParentBackground = True
    TabOrder = 0
    AutoSize = True
    LayoutLookAndFeel = dxLayoutStandardLookAndFeel
    DesignSize = (
      351
      362)
    object lbChooseSkin: TcxLabel
      Left = 10
      Top = 10
      Caption = 'Select look && feel:'
      Style.HotTrack = False
      Transparent = True
    end
    object tvSkins: TcxTreeView
      Left = 10
      Top = 33
      Width = 193
      Height = 289
      Anchors = [akLeft, akTop, akRight, akBottom]
      ParentFont = False
      TabOrder = 1
      HideSelection = False
      ReadOnly = True
      ShowRoot = False
      OnChange = tvSkinsChange
      OnCustomDrawItem = tvSkinsCustomDrawItem
    end
    object rgTransitionEffect: TcxRadioGroup
      Left = 209
      Top = 33
      Anchors = [akTop, akRight]
      Caption = ' Page animation effect '
      Properties.Items = <
        item
          Caption = 'None'
        end
        item
          Caption = 'Fade'
        end
        item
          Caption = 'Slide'
        end>
      ItemIndex = 1
      TabOrder = 2
      Transparent = True
      Height = 97
      Width = 131
    end
    object rgViewStyle: TcxRadioGroup
      Left = 209
      Top = 136
      Anchors = [akTop, akRight]
      Caption = ' View style '
      Properties.Items = <
        item
          Caption = 'Aero'
        end
        item
          Caption = 'Wizard 97'
        end>
      ItemIndex = 0
      TabOrder = 3
      Transparent = True
      Height = 76
      Width = 131
    end
    object cbSkinForm: TcxCheckBox
      Left = 10
      Top = 328
      Anchors = [akLeft, akBottom]
      Caption = 'Skinned forms'
      Properties.Alignment = taLeftJustify
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 4
      Transparent = True
      OnClick = cbSkinFormClick
      Width = 194
    end
    object btnStartDemo: TcxButton
      Left = 210
      Top = 328
      Width = 131
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = 'Start demo'
      Default = True
      ModalResult = 1
      TabOrder = 5
    end
    object dxSetupFormLayoutControlGroup_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      LayoutLookAndFeel = dxLayoutCxLookAndFeel
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxSetupFormLayoutControlItem1: TdxLayoutItem
      CaptionOptions.Text = 'lbChooseSkin'
      CaptionOptions.Visible = False
      Parent = dxSetupFormLayoutControlGroup_Root
      Control = lbChooseSkin
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxSetupFormLayoutControlItem2: TdxLayoutItem
      CaptionOptions.Text = 'tvSkins'
      CaptionOptions.Visible = False
      Parent = dxSetupFormLayoutControlGroup4
      Control = tvSkins
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxSetupFormLayoutControlItem3: TdxLayoutItem
      CaptionOptions.Text = 'rgTransitionEffect'
      CaptionOptions.Visible = False
      Parent = dxSetupFormLayoutControlGroup5
      Control = rgTransitionEffect
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxSetupFormLayoutControlItem4: TdxLayoutItem
      CaptionOptions.Text = 'rgViewStyle'
      CaptionOptions.Visible = False
      Parent = dxSetupFormLayoutControlGroup5
      Control = rgViewStyle
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxSetupFormLayoutControlItem5: TdxLayoutItem
      CaptionOptions.Text = 'cbSkinForm'
      CaptionOptions.Visible = False
      Parent = dxSetupFormLayoutControlGroup3
      Control = cbSkinForm
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxSetupFormLayoutControlItem6: TdxLayoutItem
      CaptionOptions.Text = 'btnStartDemo'
      CaptionOptions.Visible = False
      Parent = dxSetupFormLayoutControlGroup3
      Control = btnStartDemo
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxSetupFormLayoutControlGroup2: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxSetupFormLayoutControlGroup_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxSetupFormLayoutControlGroup4: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxSetupFormLayoutControlGroup2
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = 0
    end
    object dxSetupFormLayoutControlGroup5: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxSetupFormLayoutControlGroup2
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = 1
    end
    object dxSetupFormLayoutControlGroup3: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxSetupFormLayoutControlGroup_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
  end
  object dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 320
    Top = 4
    object dxLayoutStandardLookAndFeel: TdxLayoutStandardLookAndFeel
    end
    object dxLayoutCxLookAndFeel: TdxLayoutCxLookAndFeel
    end
  end
end
