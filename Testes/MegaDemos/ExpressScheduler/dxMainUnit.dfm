object frmMain: TfrmMain
  Left = 320
  Top = 70
  Width = 960
  Height = 775
  ActiveControl = Scheduler
  Caption = 'ExpressScheduler Features Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlNavBar: TPanel
    Left = 0
    Top = 51
    Width = 212
    Height = 686
    Align = alLeft
    TabOrder = 1
    object dxNavBar: TdxNavBar
      Left = 1
      Top = 1
      Width = 210
      Height = 684
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Outlook'
      Font.Style = []
      OnMouseDown = dxNavBarMouseDown
      OnMouseUp = dxNavBarMouseUp
      ActiveGroupIndex = 0
      TabOrder = 0
      View = 13
      OptionsBehavior.Common.AllowSelectLinks = True
      OptionsBehavior.Common.DragDropFlags = []
      OptionsBehavior.Common.EachGroupHasSelectedLink = True
      OptionsImage.LargeImages = imgLargeMain
      OptionsImage.SmallImages = imgMain
      OnActiveGroupChanged = dxNavBarActiveGroupChanged
      OnGroupClick = dxNavBarGroupClick
      OnLinkPress = dxNavBarLinkPress
      object nbgNew: TdxNavBarGroup
        Caption = 'New && Updated Demos'
        LargeImageIndex = 0
        SelectedLinkIndex = -1
        SmallImageIndex = 37
        TopVisibleLinkIndex = 0
        UseSmallImages = False
        OptionsGroupControl.UseControl = True
        Links = <
          item
            Item = nbiAggregate
          end
          item
            Item = nbiHolidays
          end
          item
            Item = nbiGanttView
          end
          item
            Item = nbiGridConnection
          end
          item
            Item = nbiDay
          end
          item
            Item = nbiWeek
          end
          item
            Item = nbiMonth
          end
          item
            Item = nbiTimeGrid
          end
          item
            Item = nbiYear
          end
          item
            Item = nbiReminders
          end
          item
            Item = nbiDifferentTimeZones
          end>
      end
      object nbgLayoutFeatures: TdxNavBarGroup
        Caption = 'Layout Features'
        LargeImageIndex = 1
        SelectedLinkIndex = -1
        SmallImageIndex = 38
        TopVisibleLinkIndex = 0
        UseSmallImages = False
        Links = <
          item
            Item = nbiDay
          end
          item
            Item = nbiWorkWeek
          end
          item
            Item = nbiWeek
          end
          item
            Item = nbiMonth
          end
          item
            Item = nbiTimeGrid
          end
          item
            Item = nbiYear
          end
          item
            Item = nbiGanttView
          end>
      end
      object nbgOtherFeatures: TdxNavBarGroup
        Caption = 'Additional Features'
        LargeImageIndex = 2
        SelectedLinkIndex = -1
        SmallImageIndex = 39
        TopVisibleLinkIndex = 0
        UseSmallImages = False
        Links = <
          item
            Item = nbiReminders
          end
          item
            Item = nbiDifferentTimeZones
          end
          item
            Item = nbiStyles
          end
          item
            Item = nbiCustomDraw
          end
          item
            Item = nbiCustomEditors
          end
          item
            Item = nbiCustomPopupMenus
          end
          item
            Item = nbiHolidays
          end
          item
            Item = nbiGridConnection
          end>
      end
      object nbgDataBinding: TdxNavBarGroup
        Caption = 'Data Binding'
        LargeImageIndex = 3
        SelectedLinkIndex = -1
        SmallImageIndex = 40
        TopVisibleLinkIndex = 0
        UseSmallImages = False
        Links = <
          item
            Item = nbiUnbound
          end
          item
            Item = mbiBound
          end
          item
            Item = nbiAggregate
          end>
      end
      object nbgStandaloneDateNavigator: TdxNavBarGroup
        Caption = 'External Date Navigator'
        LargeImageIndex = 4
        SelectedLinkIndex = -1
        SmallImageIndex = 41
        TopVisibleLinkIndex = 0
        UseSmallImages = False
        OptionsGroupControl.ShowControl = True
        OptionsGroupControl.UseControl = True
        Links = <>
      end
      object nbgOutlookSync: TdxNavBarGroup
        Caption = 'Synchronization'
        LargeImageIndex = 5
        SelectedLinkIndex = -1
        SmallImageIndex = 42
        TopVisibleLinkIndex = 0
        UseSmallImages = False
        Links = <
          item
            Item = nbiWithOutlook
          end
          item
            Item = nbiWithScheduler
          end>
      end
      object nbgExport: TdxNavBarGroup
        Caption = 'Export'
        LargeImageIndex = 6
        SelectedLinkIndex = -1
        SmallImageIndex = 43
        TopVisibleLinkIndex = 0
        UseSmallImages = False
        Links = <
          item
            Item = nbiHTML
          end
          item
            Item = nbiXML
          end
          item
            Item = nbiExcel
          end
          item
            Item = nbiText
          end>
      end
      object nbiDay: TdxNavBarItem
        Action = acDayView
        Caption = 'Day View (Updated)'
      end
      object nbiWorkWeek: TdxNavBarItem
        Action = acWorkWeekView
      end
      object nbiWeek: TdxNavBarItem
        Action = acWeekView
        Caption = 'Week View (Updated)'
      end
      object nbiMonth: TdxNavBarItem
        Action = acMonthView
        Caption = 'Month View (Updated)'
      end
      object nbiTimeGrid: TdxNavBarItem
        Action = acTimeGridView
        Caption = 'TimeGrid View (Updated)'
      end
      object nbiYear: TdxNavBarItem
        Action = acYearView
        Caption = 'Year View (Updated)'
      end
      object nbiReminders: TdxNavBarItem
        Caption = 'Reminders (Updated)'
        SmallImageIndex = 6
      end
      object mbiBound: TdxNavBarItem
        Tag = 1
        Action = acBound
      end
      object nbiUnbound: TdxNavBarItem
        Action = acUnbound
      end
      object nbiCustomDraw: TdxNavBarItem
        Action = acCustomDraw
        LargeImageIndex = 9
        SmallImageIndex = 19
      end
      object nbiDifferentTimeZones: TdxNavBarItem
        Caption = 'Different Time Zones (Updated)'
        SmallImageIndex = 14
      end
      object nbiStyles: TdxNavBarItem
        Action = acVisualStyles
      end
      object nbiWithOutlook: TdxNavBarItem
        Action = acSchedulerWithOutlook
        SmallImageIndex = 21
      end
      object nbiWithScheduler: TdxNavBarItem
        Action = acOutlookWithScheduler
        SmallImageIndex = 20
      end
      object nbiExcel: TdxNavBarItem
        Action = acExcel
      end
      object nbiHTML: TdxNavBarItem
        Action = acHTML
      end
      object nbiXML: TdxNavBarItem
        Action = acXML
      end
      object nbiText: TdxNavBarItem
        Action = acText
      end
      object nbiCustomEditors: TdxNavBarItem
        Action = acCustomDialogs
        Caption = 'Custom Editors'
      end
      object nbiCustomPopupMenus: TdxNavBarItem
        Caption = 'Custom Pop-up Menu'
        LargeImageIndex = 32
        SmallImageIndex = 32
      end
      object nbiAggregate: TdxNavBarItem
        Tag = 2
        Action = acAggregate
        Caption = 'Aggregate storage (Updated)'
        SmallImageIndex = 33
      end
      object nbiGanttView: TdxNavBarItem
        Action = acGanttView
      end
      object nbiHolidays: TdxNavBarItem
        Action = acHolidays
        Caption = 'Holidays (Updated)'
        LargeImageIndex = 34
        SmallImageIndex = 34
      end
      object nbiGridConnection: TdxNavBarItem
        Action = acGridConnection
        Caption = 'Grid connection (Updated)'
        LargeImageIndex = 36
        SmallImageIndex = 36
      end
      object nbgNewControl: TdxNavBarGroupControl
        Left = 1
        Top = 26
        Width = 181
        Height = 358
        Caption = 'nbgNewControl'
        TabOrder = 1
        GroupIndex = 0
        OriginalHeight = 41
      end
      object nbgStandaloneDateNavigatorControl: TdxNavBarGroupControl
        Left = 1
        Top = 551
        Width = 181
        Height = 0
        Caption = 'nbgStandaloneDateNavigatorControl'
        TabOrder = 0
        GroupIndex = 4
        OriginalHeight = 150
        object cxDateNavigator1: TcxDateNavigator
          Left = 0
          Top = 0
          Width = 181
          Height = 0
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ShowDatesContainingHolidaysInColor = True
          TabOrder = 0
        end
      end
    end
  end
  object cxSplitterWorkAreaSplitter: TcxSplitter
    Left = 212
    Top = 51
    Width = 4
    Height = 686
    HotZoneClassName = 'TcxSimpleStyle'
    HotZone.SizePercent = 82
    Control = pnlNavBar
  end
  object Panel1: TPanel
    Left = 216
    Top = 51
    Width = 728
    Height = 686
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 6
    object pbHintPanel: TPaintBox
      Left = 0
      Top = 0
      Width = 728
      Height = 27
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      OnPaint = pbHintPanelPaint
    end
    object cxGridEventsTable: TcxGrid
      Left = 0
      Top = 555
      Width = 728
      Height = 131
      Align = alBottom
      TabOrder = 0
      object cxGridEventsTableTableView: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataModeController.GridMode = True
        DataController.DataSource = EventsDataSource
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.ImmediateEditor = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        object cxGridEventsTableTableViewID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
        end
        object cxGridEventsTableTableViewParentID: TcxGridDBColumn
          DataBinding.FieldName = 'ParentID'
          Visible = False
        end
        object cxGridEventsTableTableViewType: TcxGridDBColumn
          DataBinding.FieldName = 'Type'
        end
        object cxGridEventsTableTableViewStart: TcxGridDBColumn
          DataBinding.FieldName = 'Start'
        end
        object cxGridEventsTableTableViewFinish: TcxGridDBColumn
          DataBinding.FieldName = 'Finish'
        end
        object cxGridEventsTableTableViewOptions: TcxGridDBColumn
          DataBinding.FieldName = 'Options'
        end
        object cxGridEventsTableTableViewCaption: TcxGridDBColumn
          DataBinding.FieldName = 'Caption'
        end
        object cxGridEventsTableTableViewRecurrenceIndex: TcxGridDBColumn
          DataBinding.FieldName = 'RecurrenceIndex'
          Visible = False
        end
        object cxGridEventsTableTableViewLocation: TcxGridDBColumn
          DataBinding.FieldName = 'Location'
        end
        object cxGridEventsTableTableViewMessage: TcxGridDBColumn
          DataBinding.FieldName = 'Message'
        end
        object cxGridEventsTableTableViewReminderDate: TcxGridDBColumn
          DataBinding.FieldName = 'ReminderDate'
        end
        object cxGridEventsTableTableViewReminderMinutes: TcxGridDBColumn
          DataBinding.FieldName = 'ReminderMinutes'
        end
        object cxGridEventsTableTableViewState: TcxGridDBColumn
          DataBinding.FieldName = 'State'
        end
        object cxGridEventsTableTableViewLabelColor: TcxGridDBColumn
          DataBinding.FieldName = 'LabelColor'
        end
        object cxGridEventsTableTableViewActualStart: TcxGridDBColumn
          DataBinding.FieldName = 'ActualStart'
          Visible = False
        end
        object cxGridEventsTableTableViewActualFinish: TcxGridDBColumn
          DataBinding.FieldName = 'ActualFinish'
          Visible = False
        end
      end
      object cxGridEventsTableTableViewConnection: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.ImmediateEditor = False
        OptionsView.GroupByBox = False
      end
      object cxGridEventsTableLevel1: TcxGridLevel
        GridView = cxGridEventsTableTableView
      end
      object cxGridEventsTableLevel2: TcxGridLevel
        GridView = cxGridEventsTableTableViewConnection
      end
    end
    object Scheduler: TcxScheduler
      Left = 0
      Top = 27
      Width = 728
      Height = 524
      DateNavigator.RowCount = 2
      DateNavigator.ShowDatesContainingHolidaysInColor = True
      ViewDay.Active = True
      ViewDay.TimeRulerMinutes = True
      ViewGantt.Scales.MajorUnit = suMonth
      ViewGantt.Scales.MinorUnit = suDay
      ViewGantt.TreeBrowser.Visible = True
      ViewGantt.TreeBrowser.Width = 270
      ViewGantt.EventsStyle = esProgress
      ViewGantt.ShowExpandButtons = True
      ViewGantt.ShowTotalProgressLine = True
      ViewWeek.ShowTimeAsClock = True
      ViewWeeks.ShowTimeAsClock = True
      OnInitEventImages = SchedulerInitEventImages
      Align = alClient
      ControlBox.Control = pcControlBox
      EventImages = imgSports
      EventOperations.SharingBetweenResources = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      OptionsView.AdditionalTimeZone = 35
      OptionsView.AdditionalTimeZoneLabel = 'GMT'
      OptionsView.CurrentTimeZoneLabel = 'Local'
      OptionsView.GroupingKind = gkByResource
      OptionsView.ResourceHeaders.MultilineCaptions = True
      OptionsView.ResourceHeaders.ImagePosition = ipTop
      OptionsView.ResourceHeaders.RotateCaptions = False
      OptionsView.ResourcesPerPage = 3
      OptionsView.RotateResourceCaptions = False
      OptionsView.ShowEventsWithoutResource = True
      ResourceNavigator.OnCustomDrawButton = SchedulerResourceNavigatorCustomDrawButton
      Storage = UnboundStorage
      TabOrder = 1
      OnGetEventEditProperties = SchedulerGetEventEditProperties
      OnLayoutChanged = SchedulerLayoutChanged
      OnShowDateHint = SchedulerShowDateHint
      OnViewTypeChanged = SchedulerViewTypeChanged
      Splitters = {
        48020000FB000000D7020000000100004302000001000000480200000B020000}
      StoredClientBounds = {0100000001000000D70200000B020000}
      object pcControlBox: TcxPageControl
        Left = 0
        Top = 0
        Width = 143
        Height = 267
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = tbsGantt
        Properties.CustomButtons.Buttons = <>
        LookAndFeel.Kind = lfUltraFlat
        ClientRectBottom = 265
        ClientRectLeft = 2
        ClientRectRight = 141
        ClientRectTop = 22
        object tbsTemplate: TcxTabSheet
          Caption = 'tbsTemplate'
          ImageIndex = 1
          object Memo1: TMemo
            Left = 0
            Top = 0
            Width = 139
            Height = 243
            Align = alClient
            BevelKind = bkFlat
            BevelOuter = bvNone
            BorderStyle = bsNone
            Lines.Strings = (
              'Your controls can be '
              'placed '
              'here')
            ReadOnly = True
            TabOrder = 0
          end
        end
        object tbsBound: TcxTabSheet
          Caption = 'tbsBound'
          ImageIndex = 1
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 139
            Height = 243
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object btnGenerateMoreEvents: TcxButton
              Left = 11
              Top = 61
              Width = 121
              Height = 36
              Caption = 'Generate 10000 events'
              Enabled = False
              TabOrder = 0
              WordWrap = True
              OnClick = btnGenerateMoreEventsClick
            end
            object cbxSmartRefresh: TcxCheckBox
              Left = 11
              Top = 139
              Caption = 'Smart refresh'
              Enabled = False
              TabOrder = 1
              Transparent = True
              OnClick = cbxDBModeClick
              Width = 121
            end
            object cxLabel1: TcxLabel
              Left = 10
              Top = 8
              Caption = 'Database:'
              Transparent = True
            end
            object cbxDataBase: TcxComboBox
              Left = 11
              Top = 28
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                'Standard'
                'Temporary')
              Properties.ReadOnly = False
              TabOrder = 3
              Text = 'Standard'
              OnClick = cbxDataBaseClick
              Width = 120
            end
            object btnDeleteAll: TcxButton
              Left = 11
              Top = 109
              Width = 121
              Height = 22
              Caption = 'Delete all events'
              Enabled = False
              TabOrder = 4
              WordWrap = True
              OnClick = btnDeleteAllClick
            end
          end
        end
        object tbsHolidays: TcxTabSheet
          Caption = 'tbsHolidays'
          ImageIndex = 2
          DesignSize = (
            139
            243)
          object btnHolidaysEditor: TcxButton
            Left = 8
            Top = 8
            Width = 123
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Holidays editor'
            TabOrder = 0
            OnClick = ShowHolidaysEditorClick
          end
          object btnGenerateHolidaysEvents: TcxButton
            Left = 8
            Top = 38
            Width = 123
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Generate Holiday Events'
            TabOrder = 1
            OnClick = btnGenerateHolidaysEventsClick
          end
          object cbHolidaysHints: TcxCheckBox
            Left = 8
            Top = 69
            Caption = 'Holiday Dates Hints'
            State = cbsChecked
            TabOrder = 2
            Transparent = True
            Width = 121
          end
          object cxLabel2: TcxLabel
            Left = 8
            Top = 101
            Caption = 'Highlight Color:'
            Transparent = True
          end
          object ccbHolidayColor: TcxColorComboBox
            Left = 85
            Top = 98
            Anchors = [akLeft, akTop, akRight]
            Properties.CustomColors = <>
            Properties.DefaultColor = clRed
            Properties.ShowDescriptions = False
            Properties.OnChange = OptionsClick
            TabOrder = 4
            Width = 46
          end
        end
        object tbsGantt: TcxTabSheet
          Caption = 'tbsGantt'
          ImageIndex = 3
          DesignSize = (
            139
            243)
          object btnGanttExpandAll: TcxButton
            Tag = 1
            Left = 8
            Top = 38
            Width = 123
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Expand All'
            TabOrder = 0
            OnClick = GanttCollapseEvents
          end
          object btnGanttCollapseAll: TcxButton
            Left = 8
            Top = 8
            Width = 123
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Collapse All'
            TabOrder = 1
            OnClick = GanttCollapseEvents
          end
          object cbxEventsStyle: TcxComboBox
            Left = 8
            Top = 86
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              'Default'
              'Progress')
            Properties.OnChange = cbxEventsStylePropertiesChange
            Properties.OnCloseUp = cbxEventsStylePropertiesChange
            TabOrder = 2
            OnClick = cbxEventsStylePropertiesChange
            Width = 127
          end
          object cxLabel5: TcxLabel
            Left = 8
            Top = 68
            Caption = 'Events Style:'
            Transparent = True
          end
          object cbxExpandButton: TcxCheckBox
            Left = 8
            Top = 113
            Caption = 'Expand Buttons'
            State = cbsChecked
            TabOrder = 4
            Transparent = True
            OnClick = cbxExpandButtonClick
            Width = 121
          end
          object cbxProgress: TcxCheckBox
            Left = 8
            Top = 139
            Caption = 'Progress Line'
            Properties.OnChange = cbxProgressClick
            State = cbsChecked
            TabOrder = 5
            Transparent = True
            OnClick = cbxProgressClick
            Width = 121
          end
          object cbxSnapGanttEvents: TcxCheckBox
            Left = 8
            Top = 160
            Caption = 'Snap Events to TimeSlots'
            Properties.MultiLine = True
            State = cbsChecked
            TabOrder = 6
            Transparent = True
            OnClick = cbxSnapGanttEventsClick
            Width = 121
          end
          object cbxTreeBrowser: TcxCheckBox
            Left = 8
            Top = 192
            Caption = 'Tree Browser'
            Properties.MultiLine = True
            State = cbsChecked
            TabOrder = 7
            Transparent = True
            OnClick = cbxTreeBrowserClick
            Width = 121
          end
        end
        object tbsTimeZones: TcxTabSheet
          Caption = 'TimeZones'
          ImageIndex = 3
          object cxLabel4: TcxLabel
            Left = 8
            Top = 72
          end
          object cxGroupBox1: TcxGroupBox
            Left = 0
            Top = 95
            Align = alTop
            Caption = 'Additional Time Zone '
            TabOrder = 1
            Height = 95
            Width = 139
            object cbAdditionalDST: TcxCheckBox
              Tag = 1
              Left = 8
              Top = 55
              Caption = 'Adjust For Daylight Saving Time'
              Properties.MultiLine = True
              TabOrder = 0
              Transparent = True
              OnClick = cbAdditionalDSTClick
              Width = 126
            end
            object cbxAdditionalZone: TcxComboBox
              Tag = 1
              Left = 8
              Top = 27
              Properties.DropDownListStyle = lsFixedList
              Properties.OnChange = cbxZonePropertiesChange
              Properties.OnEditValueChanged = cbxZonePropertiesChange
              TabOrder = 1
              Width = 127
            end
          end
          object cxGroupBox2: TcxGroupBox
            Left = 0
            Top = 0
            Align = alTop
            Caption = 'Current Time Zone '
            TabOrder = 2
            Height = 95
            Width = 139
            object cbCurrentDST: TcxCheckBox
              Left = 8
              Top = 52
              Caption = 'Adjust For Daylight Saving Time'
              Properties.MultiLine = True
              TabOrder = 0
              Transparent = True
              Width = 121
            end
            object cbxCurrentZone: TcxComboBox
              Left = 8
              Top = 24
              Properties.DropDownListStyle = lsFixedList
              Properties.OnChange = cbxZonePropertiesChange
              Properties.OnEditValueChanged = cbxZonePropertiesChange
              TabOrder = 1
              Width = 127
            end
          end
        end
        object tbsAggregated: TcxTabSheet
          Caption = 'tbsAggregated'
          ImageIndex = 4
          object cxGroupBox3: TcxGroupBox
            Left = 0
            Top = 0
            Align = alTop
            Caption = 'Aggregated Storages'
            TabOrder = 0
            Height = 81
            Width = 139
            object cbUnbound: TcxCheckBox
              Tag = 1
              Left = 8
              Top = 48
              Caption = 'Unbound'
              State = cbsChecked
              TabOrder = 1
              Transparent = True
              OnClick = AggregateLinkClick
              Width = 121
            end
            object cbBound: TcxCheckBox
              Left = 8
              Top = 24
              Caption = 'Bound'
              State = cbsChecked
              TabOrder = 0
              Transparent = True
              OnClick = AggregateLinkClick
              Width = 121
            end
          end
        end
        object tbsYear: TcxTabSheet
          Caption = 'tbsYearView'
          ImageIndex = 5
          object cbAllDayOnly: TcxCheckBox
            Left = 8
            Top = 51
            Caption = 'All Day Events Only'
            TabOrder = 0
            Transparent = True
            OnClick = AllDayEventsOnlyClick
            Width = 121
          end
          object cbxYearScale: TcxComboBox
            Left = 8
            Top = 26
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              'Full Year'
              'Half Year'
              'Quarter ')
            Properties.OnChange = YearScaleChanged
            Properties.OnEditValueChanged = YearScaleChanged
            TabOrder = 1
            Width = 127
          end
          object cxLabel3: TcxLabel
            Left = 8
            Top = 8
            Caption = 'Scale:'
            FocusControl = cbxYearScale
            Transparent = True
          end
        end
        object tbsTimeGridView: TcxTabSheet
          Caption = 'tbsTimeGridView'
          ImageIndex = 6
          object cbShowDetailInfo: TcxCheckBox
            Tag = 1
            Left = 8
            Top = 40
            Caption = 'Show Details Info'
            TabOrder = 1
            Transparent = True
            OnClick = cbTimeLineOptionsClick
            Width = 121
          end
          object cbxSnapEvents: TcxCheckBox
            Left = 8
            Top = 8
            Caption = 'Snap Events to TimeSlots'
            Properties.MultiLine = True
            State = cbsChecked
            TabOrder = 0
            Transparent = True
            OnClick = cbTimeLineOptionsClick
            Width = 121
          end
        end
        object tbsMonth: TcxTabSheet
          Caption = 'tbsMonth'
          ImageIndex = 8
          object cxCheckBox1: TcxCheckBox
            Left = 8
            Top = 8
            Caption = 'Hide Weekends'
            TabOrder = 0
            Transparent = True
            OnClick = cxCheckBox1Click
            Width = 121
          end
        end
        object tbsReminders: TcxTabSheet
          Caption = 'tbsReminders'
          ImageIndex = 9
          object cbxReminderByResource: TcxCheckBox
            Left = 8
            Top = 8
            Caption = 'Reminder By Resource'
            Properties.MultiLine = True
            State = cbsChecked
            TabOrder = 0
            Transparent = True
            OnClick = cbxReminderByResourceClick
            Width = 121
          end
        end
      end
    end
    object cxGridSplitter: TcxSplitter
      Left = 0
      Top = 551
      Width = 728
      Height = 4
      HotZoneClassName = 'TcxSimpleStyle'
      HotZone.SizePercent = 74
      AlignSplitter = salBottom
      Control = cxGridEventsTable
    end
  end
  object dxBarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default'
      'File'
      'Views'
      'Events'
      'Resources'
      'Options'
      'Help'
      'LookAndFeel'
      'Other')
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True
      True
      True
      True
      True)
    ImageOptions.Images = imgMain
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 408
    Top = 496
    DockControlHeights = (
      0
      0
      51
      0)
    object dxBarManagerBar1: TdxBar
      Caption = 'Main menu'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 404
      FloatTop = 341
      FloatClientWidth = 23
      FloatClientHeight = 22
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnFile'
        end
        item
          Visible = True
          ItemName = 'dxbtnView'
        end
        item
          Visible = True
          ItemName = 'dxbtnEvents'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem1'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem2'
        end
        item
          Visible = True
          ItemName = 'dxbtnHelp'
        end>
      MultiLine = True
      OldName = 'Custom 1'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBarManagerBar2: TdxBar
      Caption = 'Tool bar'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 26
      DockingStyle = dsTop
      FloatLeft = 404
      FloatTop = 341
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnPrintPreview'
        end
        item
          Visible = True
          ItemName = 'dxbtnPrint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxbtnStyle'
        end
        item
          Visible = True
          ItemName = 'dxbtnInspector'
        end>
      OldName = 'Custom 2'
      OneOnRow = False
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManagerBar3: TdxBar
      Caption = 'Views'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 239
      DockedTop = 26
      DockingStyle = dsTop
      FloatLeft = 404
      FloatTop = 341
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnDayView'
        end
        item
          Visible = True
          ItemName = 'dxbtnWorkWeek'
        end
        item
          Visible = True
          ItemName = 'dxbtnWeekView'
        end
        item
          Visible = True
          ItemName = 'dxbtnMonthView'
        end
        item
          Visible = True
          ItemName = 'dxbtnTimeGridView'
        end
        item
          Visible = True
          ItemName = 'dxbtnYearView'
        end
        item
          Visible = True
          ItemName = 'dxbtnGanttView'
        end>
      OldName = 'Views'
      OneOnRow = False
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbtnFile: TdxBarSubItem
      Caption = '&File'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnSync'
        end
        item
          Visible = True
          ItemName = 'dxbtnExportTo'
        end
        item
          Visible = True
          ItemName = 'dxbtnPrintPreview'
        end
        item
          Visible = True
          ItemName = 'dxbtnPrint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxbtnExit'
        end>
    end
    object dxbtnStyle: TdxBarSubItem
      Caption = '&Style'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxbtnHelp: TdxBarSubItem
      Caption = '&Help'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxbtnView: TdxBarSubItem
      Caption = '&View'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnCurrentView'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxbtnControlBox'
        end
        item
          Visible = True
          ItemName = 'dxbtnNavigator'
        end>
    end
    object dxbtnEvents: TdxBarSubItem
      Caption = '&Events'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnCreating'
        end
        item
          Visible = True
          ItemName = 'dxbtnDeleting'
        end
        item
          Visible = True
          ItemName = 'dxbtnRecurrence'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxbtnDialogEditing'
        end
        item
          Visible = True
          ItemName = 'dxbtnInplaceEditing'
        end
        item
          Visible = True
          ItemName = 'dxbtnReadOnly'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxbtnSizing'
        end
        item
          Visible = True
          ItemName = 'dxbtnMoving'
        end
        item
          Visible = True
          ItemName = 'dxbtnMovingBetweenResource'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxbtnIntersection'
        end
        item
          Visible = True
          ItemName = 'dxbtnSharing'
        end>
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = '&Resources'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnGroupBy'
        end
        item
          Visible = True
          ItemName = 'dxbtnLayoutEditor'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxbtnResourcePerPage'
        end>
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'Options'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnDayViewOptions'
        end
        item
          Visible = True
          ItemName = 'dxbtnWeekViewOptions'
        end
        item
          Visible = True
          ItemName = 'dxbtnMonthViewOptions'
        end
        item
          Visible = True
          ItemName = 'dxbtnTimeGridViewOptions'
        end
        item
          Visible = True
          ItemName = 'dxbtnYearViewOptions'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem6'
        end>
    end
    object dxbci: TdxBarContainerItem
      Caption = 'Show all day container'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSeparator1: TdxBarSeparator
      Caption = '-'
      Category = 0
      Hint = '-'
      Visible = ivAlways
      ShowCaption = False
    end
    object dxbtnGanttViewSnapEventsToTimeSlots: TdxBarButton
      Caption = 'Snap events to time slots'
      Category = 0
      Hint = 'Snap events to time slots'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OptionsClick
    end
    object dxbtnTimeGridSnapEventsToTimeSlots: TdxBarButton
      Caption = 'Snap events to time slots'
      Category = 0
      Hint = 'Snap events to time slots'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OptionsClick
    end
    object dxbtnSync: TdxBarSubItem
      Caption = 'Synchronization'
      Category = 1
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnOutlookWithScheduler'
        end
        item
          Visible = True
          ItemName = 'dxbtnSchedulerWithOutlook'
        end>
    end
    object dxbtnExportTo: TdxBarSubItem
      Caption = 'Export To..'
      Category = 1
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnHTML'
        end
        item
          Visible = True
          ItemName = 'dxbtnXML'
        end
        item
          Visible = True
          ItemName = 'dxbtnExcel'
        end
        item
          Visible = True
          ItemName = 'dxbtnText'
        end>
    end
    object dxbtnPrintPreview: TdxBarButton
      Action = acPrintPreview
      Category = 1
      Hint = 'Print preview'
    end
    object dxbtnPrint: TdxBarButton
      Action = acPrint
      Caption = 'Print'
      Category = 1
    end
    object dxbtnHTML: TdxBarButton
      Action = acHTML
      Category = 1
    end
    object dxbtnXML: TdxBarButton
      Action = acXML
      Category = 1
    end
    object dxbtnExcel: TdxBarButton
      Action = acExcel
      Category = 1
    end
    object dxbtnText: TdxBarButton
      Action = acText
      Category = 1
    end
    object dxbtnExit: TdxBarButton
      Caption = 'E&xit'
      Category = 1
      Hint = 'Exit'
      Visible = ivAlways
      ShortCut = 16499
      OnClick = dxbtnExitClick
    end
    object dxbtnSchedulerWithOutlook: TdxBarButton
      Action = acSchedulerWithOutlook
      Category = 1
    end
    object dxbtnOutlookWithScheduler: TdxBarButton
      Action = acOutlookWithScheduler
      Category = 1
    end
    object dxbtnCurrentView: TdxBarSubItem
      Caption = 'Current view'
      Category = 2
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnDayView'
        end
        item
          Visible = True
          ItemName = 'dxbtnWorkWeek'
        end
        item
          Visible = True
          ItemName = 'dxbtnWeekView'
        end
        item
          Visible = True
          ItemName = 'dxbtnMonthView'
        end
        item
          Visible = True
          ItemName = 'dxbtnTimeGridView'
        end
        item
          Visible = True
          ItemName = 'dxbtnYearView'
        end
        item
          Visible = True
          ItemName = 'dxbtnGanttView'
        end>
    end
    object dxbtnDayView: TdxBarButton
      Action = acDayView
      Caption = 'Day'
      Category = 2
      ButtonStyle = bsChecked
      GroupIndex = 2
      Down = True
      PaintStyle = psCaptionGlyph
    end
    object dxbtnWeekView: TdxBarButton
      Tag = 1
      Action = acWeekView
      Caption = 'Week'
      Category = 2
      ButtonStyle = bsChecked
      GroupIndex = 2
      PaintStyle = psCaptionGlyph
    end
    object dxbtnWorkWeek: TdxBarButton
      Tag = 2
      Action = acWorkWeekView
      Caption = 'Work Week'
      Category = 2
      ButtonStyle = bsChecked
      GroupIndex = 2
      PaintStyle = psCaptionGlyph
    end
    object dxbtnMonthView: TdxBarButton
      Tag = 3
      Action = acMonthView
      Caption = 'Month'
      Category = 2
      ButtonStyle = bsChecked
      GroupIndex = 2
      PaintStyle = psCaptionGlyph
    end
    object dxbtnTimeGridView: TdxBarButton
      Tag = 4
      Action = acTimeGridView
      Caption = 'TimeGrid'
      Category = 2
      ButtonStyle = bsChecked
      GroupIndex = 2
      PaintStyle = psCaptionGlyph
    end
    object dxbtnYearView: TdxBarButton
      Tag = 5
      Action = acYearView
      Caption = 'Year'
      Category = 2
      ButtonStyle = bsChecked
      GroupIndex = 2
      PaintStyle = psCaptionGlyph
    end
    object dxbtnControlBox: TdxBarButton
      Caption = 'Control box'
      Category = 2
      Hint = 'Control box'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = dxbtnViewItemClick
    end
    object dxbtnNavigator: TdxBarButton
      Caption = 'Date navigator'
      Category = 2
      Hint = 'Date navigator'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = dxbtnViewItemClick
    end
    object dxbtnGanttView: TdxBarButton
      Tag = 6
      Action = acGanttView
      Caption = 'Gantt view'
      Category = 2
      ButtonStyle = bsChecked
      GroupIndex = 2
      PaintStyle = psCaptionGlyph
    end
    object dxbtnCreating: TdxBarButton
      Caption = 'Creating'
      Category = 3
      Hint = 'Creating'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = EventsClick
    end
    object dxbtnDeleting: TdxBarButton
      Caption = 'Deleting'
      Category = 3
      Hint = 'Deleting'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = EventsClick
    end
    object dxbtnRecurrence: TdxBarButton
      Caption = 'Recurrence'
      Category = 3
      Hint = 'Recurrence'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      ImageIndex = 8
      OnClick = EventsClick
    end
    object dxbtnDialogEditing: TdxBarButton
      Caption = 'Dialog Editing'
      Category = 3
      Hint = 'Dialog Editing'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = EventsClick
    end
    object dxbtnInplaceEditing: TdxBarButton
      Caption = 'Inplace Editing'
      Category = 3
      Hint = 'Inplace Editing'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = EventsClick
    end
    object dxbtnReadOnly: TdxBarButton
      Caption = 'ReadOnly'
      Category = 3
      Hint = 'ReadOnly'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = EventsClick
    end
    object dxbtnSizing: TdxBarButton
      Caption = 'Sizing'
      Category = 3
      Hint = 'Sizing'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = EventsClick
    end
    object dxbtnMoving: TdxBarButton
      Caption = 'Moving'
      Category = 3
      Hint = 'Moving'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = EventsClick
    end
    object dxbtnMovingBetweenResource: TdxBarButton
      Caption = 'Moving Between Resources'
      Category = 3
      Hint = 'Moving Between Resources'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = EventsClick
    end
    object dxbtnIntersection: TdxBarButton
      Caption = 'Intersection'
      Category = 3
      Hint = 'Intersection'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      ImageIndex = 13
      OnClick = EventsClick
    end
    object dxbtnSharing: TdxBarButton
      Caption = 'Sharing Between Resources'
      Category = 3
      Hint = 'Sharing Between Resources'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      ImageIndex = 12
      OnClick = EventsClick
    end
    object dxbtnGroupBy: TdxBarSubItem
      Caption = 'Group By'
      Category = 4
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnByNone'
        end
        item
          Visible = True
          ItemName = 'dxbtnByDate'
        end
        item
          Visible = True
          ItemName = 'dxbtnByResource'
        end>
    end
    object dxbtnResourcePerPage: TdxBarSubItem
      Caption = 'Resources Per Page'
      Category = 4
      Visible = ivAlways
      ImageIndex = 10
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxptnAllPerPage'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxbtnOnePerPage'
        end
        item
          Visible = True
          ItemName = 'dxbtnTwoPerPage'
        end
        item
          Visible = True
          ItemName = 'dxbtnThreePerPage'
        end>
    end
    object dxbtnLayoutEditor: TdxBarButton
      Caption = 'Layout editior'
      Category = 4
      Hint = 'Layout editior'
      Visible = ivAlways
      ImageIndex = 7
      OnClick = dxbtnLayoutEditorClick
    end
    object dxbtnByNone: TdxBarButton
      Caption = 'None'
      Category = 4
      Hint = 'None'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 6
      OnClick = GroupByClick
    end
    object dxbtnByDate: TdxBarButton
      Tag = 1
      Caption = 'Date'
      Category = 4
      Hint = 'Date'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 6
      OnClick = GroupByClick
    end
    object dxbtnByResource: TdxBarButton
      Tag = 2
      Caption = 'Resource'
      Category = 4
      Hint = 'Resource'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 6
      Down = True
      OnClick = GroupByClick
    end
    object dxptnAllPerPage: TdxBarButton
      Caption = 'All'
      Category = 4
      Hint = 'All'
      Visible = ivAlways
      OnClick = ResPerPageClick
    end
    object dxbtnOnePerPage: TdxBarButton
      Tag = 1
      Caption = '1'
      Category = 4
      Hint = '1'
      Visible = ivAlways
      OnClick = ResPerPageClick
    end
    object dxbtnTwoPerPage: TdxBarButton
      Tag = 2
      Caption = '2'
      Category = 4
      Hint = '2'
      Visible = ivAlways
      OnClick = ResPerPageClick
    end
    object dxbtnThreePerPage: TdxBarButton
      Tag = 3
      Caption = '3'
      Category = 4
      Hint = '3'
      Visible = ivAlways
      OnClick = ResPerPageClick
    end
    object dxbtnDayViewOptions: TdxBarSubItem
      Caption = 'Day View'
      Category = 5
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItem3'
        end
        item
          Visible = True
          ItemName = 'dxbtnAllDayEventsContainer'
        end
        item
          Visible = True
          ItemName = 'dxbtnTimeRulerMinutes'
        end
        item
          Visible = True
          ItemName = 'dxbtnWorkTimeOnly'
        end
        item
          Visible = True
          ItemName = 'dxbtnDayHeader'
        end>
    end
    object dxbtnWeekViewOptions: TdxBarSubItem
      Caption = 'Week View'
      Category = 5
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnSingleColumn'
        end
        item
          Visible = True
          ItemName = 'dxbtnWeekCompressWeekends'
        end
        item
          Visible = True
          ItemName = 'dxbtnWeekTimeAsClock'
        end>
    end
    object dxbtnMonthViewOptions: TdxBarSubItem
      Caption = 'Month View'
      Category = 5
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnMonthCompressWeekends'
        end
        item
          Visible = True
          ItemName = 'dxbtnMonthTimeAsClock'
        end>
    end
    object dxbtnTimeGridViewOptions: TdxBarSubItem
      Caption = 'TimeGrid View'
      Category = 5
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnMajorUnit'
        end
        item
          Visible = True
          ItemName = 'dxbtnMinorUnit'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxbtnDetailInfo'
        end
        item
          Visible = True
          ItemName = 'dxbtnWorkDaysOnly'
        end
        item
          Visible = True
          ItemName = 'dxbtnTimeGridWorkTimeOnly'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxbtnTimeGridSnapEventsToTimeSlots'
        end>
    end
    object dxbtnYearViewOptions: TdxBarSubItem
      Caption = 'Year View'
      Category = 5
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnAllDayEventsOnly'
        end>
    end
    object dxbtnAllDayEventsContainer: TdxBarButton
      Caption = 'Show all day container'
      Category = 5
      Hint = 'Show all day container'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = OptionsClick
    end
    object dxbtnTimeRulerMinutes: TdxBarButton
      Tag = 1
      Caption = 'Time ruler minutes'
      Category = 5
      Hint = 'Time ruler minutes'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = OptionsClick
    end
    object dxbtnWorkTimeOnly: TdxBarButton
      Tag = 2
      Caption = 'Work time only'
      Category = 5
      Hint = 'Work time only'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OptionsClick
    end
    object dxbtnSingleColumn: TdxBarButton
      Caption = 'Single Column'
      Category = 5
      Hint = 'Single Column'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OptionsClick
    end
    object dxbtnWeekTimeAsClock: TdxBarButton
      Tag = 2
      Caption = 'Time As Clock'
      Category = 5
      Hint = 'Time As Clock'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = OptionsClick
    end
    object dxbtnWeekCompressWeekends: TdxBarButton
      Tag = 1
      Caption = 'Compress Weekends'
      Category = 5
      Hint = 'Compress Weekends'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = OptionsClick
    end
    object dxbtnMonthTimeAsClock: TdxBarButton
      Tag = 1
      Caption = 'Time As Clock'
      Category = 5
      Hint = 'Time As Clock'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = OptionsClick
    end
    object dxbtnMonthCompressWeekends: TdxBarButton
      Caption = 'Compress Weekends'
      Category = 5
      Hint = 'Compress Weekends'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = OptionsClick
    end
    object dxbtnDetailInfo: TdxBarButton
      Caption = 'Event Detail Information'
      Category = 5
      Hint = 'Event Detail Information'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OptionsClick
    end
    object dxbtnTimeGridWorkTimeOnly: TdxBarButton
      Tag = 2
      Caption = 'Work Time Only'
      Category = 5
      Hint = 'Work Time Only'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OptionsClick
    end
    object dxbtnWorkDaysOnly: TdxBarButton
      Tag = 1
      Caption = 'Work Days Only'
      Category = 5
      Hint = 'Work Days Only'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OptionsClick
    end
    object dxbtnAllDayEventsOnly: TdxBarButton
      Caption = 'All Day Events Only'
      Category = 5
      Hint = 'All Day Events Only'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OptionsClick
    end
    object dxbtnMajorUnit: TdxBarCombo
      Caption = 'Major Unit'
      Category = 5
      Hint = 'Major Unit'
      Visible = ivAlways
      OnChange = dxbtnMajorUnitChange
      Text = 'Day'
      ShowEditor = False
      Items.Strings = (
        'Day'
        'Week'
        'Month'
        'Quarter'
        'Year')
      ItemIndex = 0
    end
    object dxbtnMinorUnit: TdxBarCombo
      Caption = 'Minor Unit'
      Category = 5
      Hint = 'Minor Unit'
      Visible = ivAlways
      OnChange = dxbtnMinorUnitChange
      Text = 'Hour'
      ShowEditor = False
      Items.Strings = (
        'Hour'
        'Day'
        'Month'
        'Quarter')
      ItemIndex = 0
    end
    object dxbtnDayHeader: TdxBarButton
      Caption = 'Day header'
      Category = 5
      Hint = 'Day header'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = OptionsClick
    end
    object dxBarButton4: TdxBarButton
      Caption = 'New Button'
      Category = 5
      Hint = 'New Button'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object dxbtnShowEvents: TdxBarButton
      Caption = 'Show events'
      Category = 5
      Hint = 'Show events'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = OptionsClick
    end
    object dxBarSubItem3: TdxBarSubItem
      Caption = 'Add day area'
      Category = 5
      Hint = 'Add day area'
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItem4'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem5'
        end
        item
          Visible = True
          ItemName = 'dxbtnShowEvents'
        end>
    end
    object dxbtnAllDayAreaHeightDefault: TdxBarButton
      Caption = 'Default'
      Category = 5
      Hint = 'Default'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 99
      Down = True
      OnClick = AllDayAreaHeightClick
    end
    object dxBarSubItem4: TdxBarSubItem
      Caption = 'Height'
      Category = 5
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnAllDayAreaHeightDefault'
        end
        item
          Visible = True
          ItemName = 'dxbtnAllDayAreaHeight3'
        end
        item
          Visible = True
          ItemName = 'dxbtnAllDayAreaHeight5'
        end>
    end
    object dxbtnAllDayAreaHeight3: TdxBarButton
      Tag = 3
      Caption = '3 events'
      Category = 5
      Hint = '3 events'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 99
      OnClick = AllDayAreaHeightClick
    end
    object dxbtnAllDayAreaHeight5: TdxBarButton
      Tag = 5
      Caption = '5 events'
      Category = 5
      Hint = '5 events'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 99
      OnClick = AllDayAreaHeightClick
    end
    object dxBarSubItem5: TdxBarSubItem
      Caption = 'Scroll bar'
      Category = 5
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnAllDayAreaScrollBarDefault'
        end
        item
          Visible = True
          ItemName = 'dxbtnAllDayAreaScrollBarNever'
        end
        item
          Visible = True
          ItemName = 'dxbtnAllDayAreaScrollBarAlways'
        end>
    end
    object dxbtnAllDayAreaScrollBarDefault: TdxBarButton
      Caption = 'Default'
      Category = 5
      Hint = 'Default'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 98
      Down = True
      OnClick = OptionsClick
    end
    object dxbtnAllDayAreaScrollBarNever: TdxBarButton
      Tag = 1
      Caption = 'Never'
      Category = 5
      Hint = 'Never'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 98
      OnClick = OptionsClick
    end
    object dxbtnAllDayAreaScrollBarAlways: TdxBarButton
      Tag = 2
      Caption = 'Always'
      Category = 5
      Hint = 'Always'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 98
      OnClick = OptionsClick
    end
    object dxbtnSelectOnRightClick: TdxBarButton
      Caption = 'Select on right click'
      Category = 5
      Hint = 'Select on right click'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OptionsClick
    end
    object dxBarSubItem6: TdxBarSubItem
      Caption = 'Gantt View'
      Category = 5
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbtnGanttHotTrack'
        end
        item
          Visible = True
          ItemName = 'dxbtnGanttShowAsProgress'
        end
        item
          Visible = True
          ItemName = 'dxbtnGanttViewShowExpandButton'
        end
        item
          Visible = True
          ItemName = 'dxbtnGanttViewSnapEventsToTimeSlots'
        end>
    end
    object dxbtnGanttHotTrack: TdxBarButton
      Caption = 'Hot track'
      Category = 5
      Hint = 'Hot track'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = OptionsClick
    end
    object dxbtnGanttShowAsProgress: TdxBarButton
      Caption = 'Show as progress'
      Category = 5
      Hint = 'Show as progress'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OptionsClick
    end
    object dxbtnGanttViewShowExpandButton: TdxBarButton
      Caption = 'Show expand button'
      Category = 5
      Hint = 'Show expand button'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = OptionsClick
    end
    object dxbtnProducts: TdxBarButton
      Caption = 'Products'
      Category = 6
      Hint = 'Products'
      Visible = ivNever
      ImageIndex = 23
    end
    object dxbtnDownloads: TdxBarButton
      Tag = 1
      Caption = 'Downloads'
      Category = 6
      Hint = 'Downloads'
      Visible = ivNever
      ImageIndex = 23
    end
    object dxbtnForum: TdxBarButton
      Tag = 2
      Caption = 'Forum'
      Category = 6
      Hint = 'Forum'
      Visible = ivNever
      ImageIndex = 23
    end
    object dxbtnDevExOnTheWeb: TdxBarButton
      Tag = 3
      Caption = '&Developer Express on the Web'
      Category = 6
      Hint = 'Developer Express on the Web'
      Visible = ivAlways
      ImageIndex = 24
    end
    object dxBarButton1: TdxBarButton
      Tag = 4
      Caption = 'Features and Benefits'
      Category = 6
      Hint = 'Features and Benefits'
      Visible = ivAlways
      ImageIndex = 23
    end
    object dxBarButton2: TdxBarButton
      Tag = 5
      Caption = 'What'#39's New in V3 '
      Category = 6
      Hint = 'What'#39's New in V3 '
      Visible = ivAlways
      ImageIndex = 23
    end
    object dxBarButton3: TdxBarButton
      Tag = 6
      Caption = 'Order Your Copy Today'
      Category = 6
      Hint = 'Order Your Copy Today'
      Visible = ivAlways
      ImageIndex = 23
    end
    object dxbtnFlat: TdxBarButton
      Caption = 'Flat'
      Category = 7
      Hint = 'Flat'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
    end
    object dxbtnStandard: TdxBarButton
      Tag = 1
      Caption = 'Standard'
      Category = 7
      Hint = 'Standard'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
    end
    object dxbtnUltraFlat: TdxBarButton
      Tag = 2
      Caption = 'Ultra flat'
      Category = 7
      Hint = 'Ultra flat'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
    end
    object dxbtnNative: TdxBarButton
      Tag = 3
      Caption = 'Native'
      Category = 7
      Hint = 'Native'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
    end
    object dxbtnOffice11: TdxBarButton
      Tag = 4
      Caption = 'Office 11'
      Category = 7
      Hint = 'Office 11'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      Down = True
    end
    object dxsiSkins: TdxBarSubItem
      Caption = 'Skins'
      Category = 7
      Visible = ivNever
      ItemLinks = <>
    end
    object dxbtnInspector: TdxBarButton
      Caption = 'Modify properties...'
      Category = 8
      Hint = 'Modify properties'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = dxbtnInspectorClick
    end
    object dxbarEventsGroup: TdxBarGroup
      Items = (
        'dxbtnCreating'
        'dxbtnDeleting'
        'dxbtnRecurrence'
        'dxbtnDialogEditing'
        'dxbtnInplaceEditing'
        'dxbtnSizing'
        'dxbtnMoving'
        'dxbtnMovingBetweenResource'
        'dxbtnIntersection'
        'dxbtnSharing')
    end
    object dxbarResourcesGroup: TdxBarGroup
      Items = (
        'dxbtnMovingBetweenResource'
        'dxbtnSharing')
    end
  end
  object lstSchedulerActions: TActionList
    Images = imgMain
    OnExecute = lstSchedulerActionsExecute
    Left = 344
    Top = 496
    object acHTML: TAction
      Category = 'Export'
      Caption = 'HTML'
      ImageIndex = 25
      OnExecute = ExportToExecute
    end
    object acDayView: TAction
      Category = 'Layout Features'
      Caption = 'Day View'
      ImageIndex = 0
      OnExecute = acViewTypeExecute
    end
    object acWorkWeekView: TAction
      Tag = 1
      Category = 'Layout Features'
      Caption = 'Work Week View'
      ImageIndex = 1
      OnExecute = acViewTypeExecute
    end
    object acWeekView: TAction
      Tag = 2
      Category = 'Layout Features'
      Caption = 'Week View'
      ImageIndex = 2
      OnExecute = acViewTypeExecute
    end
    object acMonthView: TAction
      Tag = 3
      Category = 'Layout Features'
      Caption = 'Month View'
      ImageIndex = 3
      OnExecute = acViewTypeExecute
    end
    object acTimeGridView: TAction
      Tag = 4
      Category = 'Layout Features'
      Caption = 'TimeGrid View'
      ImageIndex = 4
      OnExecute = acViewTypeExecute
    end
    object acYearView: TAction
      Tag = 5
      Category = 'Layout Features'
      Caption = 'Year View'
      ImageIndex = 5
      OnExecute = acViewTypeExecute
    end
    object acUnbound: TAction
      Category = 'Data Binding'
      Caption = 'Unbound'
      ImageIndex = 15
      OnExecute = OnDataBindingClick
    end
    object acBound: TAction
      Tag = 1
      Category = 'Data Binding'
      Caption = 'Bound'
      ImageIndex = 16
      OnExecute = OnDataBindingClick
    end
    object acCustomDialogs: TAction
      Category = 'Customization'
      Caption = 'Custom Dialogs'
      ImageIndex = 18
      OnExecute = acCustomDialogsExecute
    end
    object acCustomDraw: TAction
      Category = 'Customization'
      Caption = 'Custom Draw'
      ImageIndex = 19
      OnExecute = ActionsExecute
    end
    object acVisualStyles: TAction
      Category = 'Customization'
      Caption = 'Visual Styles'
      ImageIndex = 19
      OnExecute = ActionsExecute
    end
    object acXML: TAction
      Tag = 1
      Category = 'Export'
      Caption = 'XML'
      ImageIndex = 26
      OnExecute = ExportToExecute
    end
    object acExcel: TAction
      Tag = 2
      Category = 'Export'
      Caption = 'Excel'
      ImageIndex = 27
      OnExecute = ExportToExecute
    end
    object acText: TAction
      Tag = 3
      Category = 'Export'
      Caption = 'Text'
      ImageIndex = 28
      OnExecute = ExportToExecute
    end
    object acOutlookWithScheduler: TAction
      Category = 'Synchronization'
      Caption = 'Outlook With Scheduler'
      OnExecute = SynchronizeWithExecute
    end
    object acSchedulerWithOutlook: TAction
      Tag = 1
      Category = 'Synchronization'
      Caption = 'Scheduler With Outlook'
      OnExecute = SynchronizeWithExecute
    end
    object acPrintPreview: TAction
      Category = 'Printing'
      Caption = 'Print Preview'
      HelpKeyword = 'Print Preview'
      ImageIndex = 29
      OnExecute = PrintingExecute
    end
    object acPrint: TAction
      Tag = 1
      Category = 'Printing'
      Caption = 'acPrint'
      Hint = 'Print'
      ImageIndex = 30
      OnExecute = PrintingExecute
    end
    object acHolidays: TAction
      Caption = 'Holidays'
      ImageIndex = 33
      OnExecute = acHolidaysExecute
    end
    object acAggregate: TAction
      Tag = 2
      Category = 'Data Binding'
      Caption = 'Aggregate storage'
      OnExecute = OnDataBindingClick
    end
    object acGanttView: TAction
      Tag = 6
      Category = 'Layout Features'
      Caption = 'Gantt view (Updated)'
      GroupIndex = 2
      ImageIndex = 35
      OnExecute = acViewTypeExecute
    end
    object acGridConnection: TAction
      Caption = 'Grid connection (new)'
      OnExecute = acGridConnectionExecute
    end
  end
  object UnboundStorage: TcxSchedulerStorage
    CustomFields = <
      item
        Name = 'SyncID'
      end
      item
        Name = 'SportID'
        ValueType = 'Integer'
      end>
    Reminders.Active = False
    Reminders.ReminderByResource = True
    Reminders.OnOpenEvent = RemindersOpenEvent
    Resources.Images = imgResources
    Resources.Items = <
      item
        ImageIndex = 0
        Name = 'ESPN'
        ResourceID = 0
      end
      item
        ImageIndex = 1
        Name = 'EUROSPORT NEWS'
        ResourceID = 1
      end
      item
        ImageIndex = 2
        Name = 'FOX FOOTY'
        ResourceID = 2
      end
      item
        ImageIndex = 7
        Name = 'FOX SPORTS 1'
        ResourceID = 3
      end
      item
        ImageIndex = 3
        Name = 'FOX SPORTS 2'
        ResourceID = 4
      end
      item
        ImageIndex = 4
        Name = 'FUEL'
        ResourceID = 5
      end
      item
        ImageIndex = 5
        Name = 'MAIN EVENT'
        ResourceID = 6
      end
      item
        ImageIndex = 6
        Name = 'SKY RACING'
        ResourceID = 7
      end>
    Left = 288
    Top = 528
  end
  object DBStorage: TcxSchedulerDBStorage
    Tag = 1
    UseActualTimeRange = True
    Reminders.Active = False
    Reminders.OnOpenEvent = RemindersOpenEvent
    Resources.Images = imgResources
    Resources.Items = <
      item
        ImageIndex = 0
        Name = 'ESPN'
        ResourceID = 0
      end
      item
        ImageIndex = 1
        Name = 'EUROSPORT NEWS'
        ResourceID = 1
      end
      item
        ImageIndex = 2
        Name = 'FOX FOOTY'
        ResourceID = 2
      end
      item
        ImageIndex = 7
        Name = 'FOX SPORTS 1'
        ResourceID = 3
      end
      item
        ImageIndex = 3
        Name = 'FOX SPORTS 2'
        ResourceID = 4
      end
      item
        ImageIndex = 4
        Name = 'FUEL'
        ResourceID = 5
      end
      item
        ImageIndex = 5
        Name = 'MAIN EVENT'
        ResourceID = 6
      end
      item
        ImageIndex = 6
        Name = 'SKY RACING'
        ResourceID = 7
      end>
    CustomFields = <
      item
        FieldName = 'SyncID'
      end
      item
        FieldName = 'SportID'
      end>
    DataSource = EventsDataSource
    FieldNames.ActualFinish = 'ActualFinish'
    FieldNames.ActualStart = 'ActualStart'
    FieldNames.Caption = 'Caption'
    FieldNames.EventType = 'Type'
    FieldNames.Finish = 'Finish'
    FieldNames.ID = 'ID'
    FieldNames.LabelColor = 'LabelColor'
    FieldNames.Location = 'Location'
    FieldNames.Message = 'Message'
    FieldNames.Options = 'Options'
    FieldNames.ParentID = 'ParentID'
    FieldNames.RecurrenceIndex = 'RecurrenceIndex'
    FieldNames.RecurrenceInfo = 'RecurrenceInfo'
    FieldNames.ReminderDate = 'ReminderDate'
    FieldNames.ReminderMinutesBeforeStart = 'ReminderMinutes'
    FieldNames.ReminderResourcesData = 'ReminderResources'
    FieldNames.ResourceID = 'ResourceID'
    FieldNames.Start = 'Start'
    FieldNames.State = 'State'
    Left = 320
    Top = 528
  end
  object EventsDataSource: TDataSource
    DataSet = EventsTable
    Left = 352
    Top = 528
  end
  object EventsTable: TADOTable
    Connection = DBConnection
    CursorType = ctStatic
    TableName = 'Events'
    Left = 384
    Top = 528
  end
  object DBConnection: TADOConnection
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 224
    Top = 528
  end
  object EventsCommand: TADOCommand
    Connection = DBConnection
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    ParamCheck = False
    Left = 256
    Top = 528
  end
  object dlgExportTo: TSaveDialog
    Filter = 
      'HTML File|*.html|XML File|*.xml|Excel File|*.xls|Text File|*.txt' +
      '|All Files|*.*'
    Title = 'Export Scheduler to ...'
    Left = 320
    Top = 496
  end
  object dxpsPrinter: TdxComponentPrinter
    CurrentLink = pslnkScheduler
    Version = 0
    Left = 440
    Top = 496
    object pslnkScheduler: TcxSchedulerReportLink
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 200
      PrinterPage.GrayShading = True
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.PageSize.X = 8300
      PrinterPage.PageSize.Y = 11700
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      BuiltInReportLink = True
    end
  end
  object imgSports: TImageList
    Left = 256
    Top = 496
    Bitmap = {
      494C010116001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
      000000000000000000000000000000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      190018181800151515001212120000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      1900181818001515150012121200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B00171717001515150047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B0017171700151515000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000059595900565656004F4F4F004C4C
      4C004848480045454500404040003B3B3B003939390036363600303030002D2D
      2D002A2A2A00282828002222220021212100EBEBEB00929292004F4F4F004C4C
      4C004848480045454500404040003B3B3B003939390036363600464646005757
      570055555500535353004E4E4E007C7C7C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000626262005F5F5F00585858005555
      5500525252004E4E4E004747470044444400414141003E3E3E00383838003535
      3500323232002F2F2F002929290026262600F6F6F600FFFFFF007B7B7B005555
      5500525252004E4E4E004747470044444400414141003E3E3E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6C6C00686868005F5F5F005E5E
      5E005A5A5A0057575700505050004D4D4D004949490046464600404040003D3D
      3D003939390036363600303030002D2D2D0078787800C4C4C400FFFFFF00C2C2
      C2006A6A6A0057575700505050004D4D4D004949490046464600FBFBFB00B1B1
      B100B0B0B000AFAFAF00ACACAC00ABABAB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007575750083838300ABABAB00A5A5
      A500989898006F6F6F005959590055555500525252004F4F4F005E5E5E009191
      9100B3B3B300A8A8A800707070004D4D4D00757575006F6F6F00DADADA00FFFF
      FF00F8F8F800ACACAC005959590055555500525252004F4F4F00F4F4F4004444
      4400414141003D3D3D0038383800353535000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008A8A8A00828282007A7A7A007777
      7700757575007272720090909000E2E2E200FFFFFF00FFFFFF00F7F7F7006868
      6800535353004E4E4E0048484800444444008A8A8A00828282007A7A7A007777
      77007A7A7A00B6B6B600FFFFFF00D9D9D9009E9E9E00C2C2C200EBEBEB005656
      5600535353004E4E4E0048484800444444000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000939393008E8E8E00808080007F7F
      7F007B7B7B00787878007373730070707000C9C9C900FFFFFF00ABABAB005F5F
      5F005C5C5C0057575700505050004D4D4D00939393008E8E8E00808080007F7F
      7F007B7B7B0078787800CECECE00FFFFFF00FFFFFF00FFFFFF00ECECEC005F5F
      5F005C5C5C0057575700505050004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B0095959500898989008282
      820081818100808080007A7A7A00797979009C9C9C00FFFFFF006E6E6E006868
      680065656500616161005A5A5A00555555009B9B9B00B5B5B500DFDFDF009797
      970081818100808080007A7A7A0095959500EDEDED00FFFFFF00ECECEC006868
      680065656500616161005A5A5A00555555000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1A1A1009B9B9B008D8D8D009B9B
      9B00E2E2E200AFAFAF00818181007E7E7E00CBCBCB00FFFFFF00747474007070
      70006D6D6D006A6A6A00636363005E5E5E00A1A1A100A0A0A000FFFFFF00FEFE
      FE00CCCCCC008C8C8C00818181008D8D8D00F9F9F900FFFFFF00ADADAD007070
      70006D6D6D006A6A6A00636363005E5E5E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1B1B100A9A9A900E2E2E200FFFF
      FF00FFFFFF00D0D0D000FFFFFF00FEFEFE00FEFEFE009A9A9A00838383008080
      80007D7D7D007A7A7A007373730070707000B1B1B100D8D8D800FFFFFF00C2C2
      C200B7B7B700F3F3F300F4F4F400FFFFFF00FFFFFF00FEFEFE00838383008080
      80007D7D7D007A7A7A0073737300707070000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BBBBBB00B1B1B100D3D3D300FFFF
      FF00F8F8F8009A9A9A00C7C7C700E7E7E700B4B4B40085858500858585008383
      8300818181007F7F7F007B7B7B0078787800BBBBBB00C1C1C100F3F3F300AAAA
      AA009595950094949400FBFBFB00FFFFFF00FFFFFF00C6C6C600858585008383
      8300818181007F7F7F007B7B7B00787878000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C1C1C100B9B9B900ABABAB00B1B1
      B100A0A0A000959595008B8B8B00898989008989890087878700878787008585
      850085858500858585007F7F7F007F7F7F00C1C1C100B9B9B900ABABAB00A3A3
      A3009B9B9B0095959500A8A8A800CDCDCD00D0D0D0008B8B8B00878787008585
      850085858500858585007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCB00C1C1C100B1B1B100A9A9
      A900A3A3A3009D9D9D00919191008B8B8B008989890089898900898989008787
      870087878700878787008383830081818100CBCBCB00C1C1C100B1B1B100A9A9
      A900A3A3A300A6A6A600FFFFFF00C3C3C3008989890089898900898989008787
      8700878787008787870083838300818181000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DBDBDB00D3D3D300C1C1C100B9B9
      B900B1B1B100ABABAB009B9B9B0097979700919191008D8D8D008B8B8B008B8B
      8B0089898900898989008989890089898900DBDBDB00D3D3D300C1C1C100B9B9
      B900B1B1B100ABABAB00D8D8D800A6A6A600919191008D8D8D008B8B8B008B8B
      8B00898989008989890089898900898989000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B00898989000000000000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B0089898900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      190018181800151515001212120000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      190018181800151515001212120000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      190018181800151515001212120000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      19001818180015151500121212000000000047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B00171717001515150047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B00171717001515150047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B00171717001515150047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B001717170015151500D2D2D200767676004F4F4F004C4C
      4C004848480045454500404040003B3B3B003939390036363600303030002D2D
      2D002A2A2A00282828002222220021212100E4E4E400585858004F4F4F004C4C
      4C0048484800454545007A7A7A00FFFFFF00D3D3D30036363600303030002D2D
      2D002A2A2A00282828002222220021212100C4C4C400565656004F4F4F004C4C
      4C00484848004545450040404000BABABA00FFFFFF006A6A6A00303030002D2D
      2D002A2A2A0028282800222222002121210059595900565656004F4F4F004C4C
      4C004848480045454500404040003B3B3B003939390036363600FFFFFF004646
      46002A2A2A00282828002222220021212100FFFFFF00FFFFFF006C6C6C005555
      55007F7F7F007C7C7C004747470044444400414141003E3E3E00383838003535
      3500323232002F2F2F002929290026262600FFFFFF00A1A1A100585858005555
      5500525252004E4E4E00E5E5E500FFFFFF006E6E6E003E3E3E00383838003535
      3500323232002F2F2F002929290026262600FFFFFF0085858500585858005555
      5500525252004E4E4E0079797900FFFFFF00D2D2D20047474700383838003535
      3500323232002F2F2F002929290026262600898989005F5F5F00585858005555
      5500525252004E4E4E004747470044444400414141003E3E3E00FFFFFF005D5D
      5D00323232002F2F2F00292929002626260094949400E3E3E300F9F9F900C0C0
      C000FFFFFF00FFFFFF00717171004D4D4D004949490046464600404040003D3D
      3D003939390036363600303030002D2D2D00FDFDFD00F4F4F4005F5F5F005E5E
      5E005A5A5A0057575700FFFFFF00C2C2C2004949490046464600404040003D3D
      3D003939390036363600303030002D2D2D00FCFCFC00EAEAEA005F5F5F005E5E
      5E005A5A5A0057575700E6E6E600FBFBFB006969690053535300444444003D3D
      3D003939390036363600303030002D2D2D00CFCFCF00686868005F5F5F005E5E
      5E005A5A5A0057575700505050004D4D4D004949490046464600FFFFFF00A8A8
      A8003939390036363600303030002D2D2D00757575006F6F6F00F1F1F100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C1C1C100666666004F4F4F00484848004444
      4400414141003D3D3D003838380035353500C6C6C600FFFFFF006A6A6A006666
      66006363630069696900FBFBFB006D6D6D00525252004F4F4F00484848004444
      4400414141003D3D3D003838380035353500BEBEBE00FFFFFF006A6A6A006666
      6600636363005E5E5E00FFFFFF00AFAFAF00525252004F4F4F009A9A9A004444
      4400414141003D3D3D003838380035353500A1A1A100AAAAAA006A6A6A006666
      660065656500C8C8C8005959590055555500525252009C9C9C00FFFFFF00FDFD
      FD006B6B6B003D3D3D0038383800353535008A8A8A00828282007A7A7A007777
      7700A9A9A900FFFFFF00FFFFFF00FFFFFF00FFFFFF008E8E8E00585858005656
      5600535353004E4E4E0048484800444444008A8A8A00BDBDBD00D3D3D3007777
      77008F8F8F00FDFDFD0074747400676767006464640061616100585858005656
      5600535353004E4E4E0048484800444444008A8A8A00A7A7A700D8D8D8007777
      770075757500D7D7D70097979700676767006464640061616100585858009C9C
      9C00535353004E4E4E0048484800444444008A8A8A0082828200D6D6D600C2C2
      C200ACACAC00AFAFAF00D2D2D20067676700A7A7A700FFFFFF00FFFFFF00C7C7
      C70053535300939393008989890069696900939393008E8E8E00808080007F7F
      7F007B7B7B00DFDFDF00FFFFFF00FFFFFF00E1E1E1006969690061616100A7A7
      A700D7D7D700DDDDDD00DCDCDC00DBDBDB009393930091919100FFFFFF00B1B1
      B100E0E0E000FFFFFF0073737300707070006B6B6B0069696900616161005F5F
      5F005C5C5C0057575700505050004D4D4D00939393008E8E8E00FFFFFF00AFAF
      AF00AEAEAE00FFFFFF0073737300707070006B6B6B0069696900616161007B7B
      7B008080800057575700505050004D4D4D00939393008E8E8E00808080009191
      91009C9C9C00AEAEAE00FFFFFF009393930074747400BFBFBF00FFFFFF00FBFB
      FB00797979005757570079797900949494009B9B9B0095959500898989008282
      82008181810092929200FFFFFF00FFFFFF00CFCFCF00797979008E8E8E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B0095959500FFFFFF00FFFF
      FF00FFFFFF00ECECEC007A7A7A007979790073737300727272006B6B6B006868
      680065656500616161005A5A5A00555555009B9B9B0095959500F9F9F900FFFF
      FF00FFFFFF00F9F9F9007A7A7A007979790073737300727272006B6B6B006868
      6800A4A4A400616161005A5A5A00555555009B9B9B0095959500898989008282
      82008181810080808000FFFFFF00A0A0A0007373730072727200FFFFFF00FFFF
      FF00E0E0E000656565005A5A5A0055555500A1A1A1009B9B9B008D8D8D008989
      89008383830083838300FFFFFF00FFFFFF00FFFFFF00F4F4F400A0A0A000FFFF
      FF00A9A9A9006A6A6A00636363005E5E5E00A1A1A100A7A7A700FFFFFF00FFFF
      FF00FFFFFF00B0B0B000818181007E7E7E007D7D7D007A7A7A00747474007070
      70006D6D6D006A6A6A00636363005E5E5E00A1A1A1009B9B9B00C7C7C700FFFF
      FF00FFFFFF00CFCFCF00818181007E7E7E007D7D7D007A7A7A00747474007070
      7000A9A9A9006A6A6A00636363005E5E5E00A1A1A1009B9B9B008D8D8D008989
      89008383830083838300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B5B5B500636363005E5E5E00B1B1B100A9A9A9009D9D9D009595
      95008F8F8F00898989008585850099999900DDDDDD00FFFFFF00FFFFFF00FFFF
      FF00B3B3B300CDCDCD00B3B3B30070707000B1B1B100BFBFBF00FFFFFF00FFFF
      FF00FFFFFF00C3C3C3009D9D9D009D9D9D009D9D9D009C9C9C009C9C9C008484
      84007D7D7D007A7A7A007373730070707000B1B1B100A9A9A900CBCBCB00FFFF
      FF00FFFFFF00DBDBDB0085858500858585008585850083838300838383008080
      8000B9B9B9007F7F7F007373730070707000B1B1B100A9A9A9009D9D9D00A0A0
      A000F1F1F100F8F8F800D4D4D400E7E7E700E7E7E700E6E6E600E6E6E600E6E6
      E600E0E0E000A7A7A7007373730070707000BBBBBB00B1B1B100A3A3A3009D9D
      9D009B9B9B00E1E1E1008B8B8B008787870087878700B7B7B700FFFFFF00FFFF
      FF00B6B6B600FFFFFF00EFEFEF0078787800BBBBBB00B1B1B100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CDCD
      CD00818181007F7F7F007B7B7B0078787800BBBBBB00B1B1B100FAFAFA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00888888007B7B7B0078787800BBBBBB00B1B1B100A3A3A300C3C3
      C300FFFFFF00FFFFFF0087878700878787008787870085858500858585008383
      8300818181007F7F7F007B7B7B0078787800C1C1C100B9B9B900ABABAB00A3A3
      A3009F9F9F00ECECEC00F3F3F300B7B7B700CECECE00FEFEFE00E6E6E6009F9F
      9F0085858500D1D1D100BBBBBB007F7F7F00C1C1C100B9B9B900CDCDCD00C8C8
      C800C3C3C300BFBFBF00B9B9B900B8B8B800B8B8B800B7B7B700BDBDBD00FBFB
      FB00D3D3D300BABABA009999990099999900C1C1C100DDDDDD00F6F6F600CACA
      CA00C3C3C300BFBFBF00B9B9B900B8B8B800B8B8B800B7B7B700B7B7B700B6B6
      B600DDDDDD00BCBCBC00B2B2B200B2B2B200C1C1C100B9B9B900ABABAB00ACAC
      AC00EFEFEF00F5F5F5008B8B8B00898989008989890087878700878787008585
      850085858500858585007F7F7F007F7F7F00CBCBCB00C1C1C100B1B1B100A9A9
      A900A3A3A3009E9E9E00F7F7F700FFFFFF00FFFFFF00F1F1F100898989008787
      870087878700878787008383830081818100CBCBCB00C1C1C100D3D3D300F5F5
      F500CBCBCB009D9D9D00919191008B8B8B008989890089898900898989009595
      95009F9F9F009F9F9F009C9C9C009A9A9A00CBCBCB00E9E9E900C0C0C000F4F4
      F400FAFAFA00B1B1B100919191008B8B8B008989890089898900898989008787
      8700C2C2C200888888008383830081818100CBCBCB00C1C1C100B1B1B100A9A9
      A900A3A3A3009D9D9D00919191008B8B8B008989890089898900898989008787
      870087878700878787008383830081818100DBDBDB00D3D3D300C1C1C100B9B9
      B900B1B1B100ABABAB009B9B9B0097979700919191008D8D8D008B8B8B008B8B
      8B0089898900898989008989890089898900DBDBDB00D3D3D300DCDCDC00F6F6
      F600D3D3D300ABABAB009B9B9B0097979700919191008D8D8D008B8B8B008B8B
      8B0089898900898989008989890089898900DBDBDB00D3D3D300C8C8C800F6F6
      F600FAFAFA00BCBCBC009B9B9B0097979700919191008D8D8D008B8B8B008B8B
      8B00AAAAAA00898989008989890089898900DBDBDB00D3D3D300C1C1C100B9B9
      B900B1B1B100ABABAB009B9B9B0097979700919191008D8D8D008B8B8B008B8B
      8B008989890089898900898989008989890000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B00898989000000000000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B00898989000000000000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B00898989000000000000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B008989890000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      190018181800151515001212120000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      190018181800151515001212120000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      190018181800151515001212120000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      19001818180015151500121212000000000047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B00171717001515150047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B00171717001515150047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B00171717001515150047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B00171717001515150059595900565656004F4F4F004C4C
      4C004848480045454500404040003B3B3B003939390036363600303030002D2D
      2D002A2A2A0028282800222222002121210059595900565656004F4F4F004C4C
      4C004848480045454500404040003B3B3B003939390036363600303030002D2D
      2D002A2A2A0028282800222222002121210059595900565656004F4F4F004C4C
      4C004848480045454500404040003B3B3B003939390044444400FFFFFF00FFFF
      FF00C3C3C3004949490022222200212121007A7A7A0078787800727272007070
      70006F6F6F00DEDEDE006666660062626200616161005E5E5E00595959005757
      570055555500535353004E4E4E004D4D4D00626262005F5F5F00585858005555
      5500525252004E4E4E004747470044444400414141003E3E3E00383838003535
      3500323232002F2F2F002929290026262600626262005F5F5F00585858005555
      5500525252004E4E4E004747470044444400414141003E3E3E00383838003535
      3500323232002F2F2F002929290026262600626262005F5F5F00585858005555
      5500525252004E4E4E00474747004444440041414100B2B2B2009F9F9F00AEAE
      AE00FFFFFF00FAFAFA002929290026262600A1A1A1009F9F9F009B9B9B009999
      9900E0E0E000FFFFFF00919191008F8F8F008D8D8D008B8B8B00888888008686
      860084848400828282007F7F7F007D7D7D006C6C6C00686868005F5F5F005E5E
      5E005A5A5A0057575700505050004D4D4D004949490046464600404040003D3D
      3D003939390036363600303030002D2D2D006C6C6C0068686800909090008F8F
      8F007373730057575700505050004D4D4D004949490046464600404040003D3D
      3D00555555007D7D7D00303030002D2D2D006C6C6C00686868005F5F5F005E5E
      5E005A5A5A0057575700505050004D4D4D0074747400FFFFFF00404040003D3D
      3D0063636300D9D9D900414141002D2D2D006C6C6C00686868005F5F5F008484
      8400FFFFFF00DDDDDD00505050004D4D4D004949490046464600404040003D3D
      3D003939390036363600303030002D2D2D007575750083838300ABABAB00A5A5
      A500989898006F6F6F005959590055555500525252004F4F4F005E5E5E009191
      9100B3B3B300A8A8A800707070004D4D4D008C8C8C00A2A2A200717171006868
      68008484840097979700868686005F5F5F0052525200626262008B8B8B007272
      72005A5A5A003D3D3D007070700048484800757575006F6F6F006A6A6A006666
      6600636363005E5E5E005959590059595900E3E3E300FFFFFF00484848004444
      4400414141003D3D3D003838380035353500757575006F6F6F006E6E6E00E6E6
      E600FDFDFD007C7C7C005959590055555500525252004F4F4F00484848004444
      4400414141003D3D3D0038383800353535008A8A8A00828282007A7A7A007777
      7700757575007272720090909000E2E2E200FFFFFF00FFFFFF00F7F7F7008686
      8600FFFFFF00FFFFFF0048484800444444008A8A8A00828282007A7A7A007777
      770075757500727272006B6B6B00676767006464640061616100585858005656
      56008E8E8E00B6B6B60048484800444444008A8A8A00828282007A7A7A007777
      7700757575007272720080808000FAFAFA00FFFFFF00FFFFFF00EBEBEB00C1C1
      C100BABABA00B8B8B800B6B6B600B4B4B4008A8A8A0082828200FCFCFC00FFFF
      FF00F9F9F900E3E3E300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00ECECEC0044444400939393008E8E8E00808080007F7F
      7F007B7B7B00787878007373730070707000C9C9C900FFFFFF00ABABAB007272
      7200FBFBFB00FFFFFF00505050004D4D4D00939393008E8E8E00808080007F7F
      7F007B7B7B007878780073737300707070006B6B6B0069696900616161007474
      7400FDFDFD00FFFFFF00505050004D4D4D00939393008E8E8E00808080007F7F
      7F007B7B7B0078787800D6D6D600FFFFFF00FFFFFF00F4F4F400616161005F5F
      5F005C5C5C0057575700505050004D4D4D00939393008E8E8E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD0087878700818181007F7F
      7F007D7D7D0079797900585858004D4D4D009B9B9B0095959500898989008282
      820081818100808080007A7A7A00797979009C9C9C00FFFFFF006E6E6E006868
      6800848484009C9C9C005A5A5A00555555009B9B9B0095959500898989008282
      820081818100808080007A7A7A00797979007373730072727200979797008A8A
      8A00F8F8F800FFFFFF005A5A5A00555555009B9B9B0095959500898989008282
      82008181810080808000FFFFFF00FFFFFF00FFFFFF008D8D8D006B6B6B006868
      680065656500616161005A5A5A00555555009B9B9B0095959500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FCFCFC0075757500727272006B6B6B006868
      680065656500616161005A5A5A0055555500A1A1A1009B9B9B008D8D8D009A9A
      9A00E0E0E000AFAFAF00818181007E7E7E00CBCBCB00FFFFFF00747474007070
      70006D6D6D006A6A6A00636363005E5E5E00A1A1A100A2A2A2008D8D8D008989
      89008383830083838300818181007E7E7E007D7D7D007A7A7A00FFFFFF00F2F2
      F20091919100A4A4A400636363005E5E5E00D9D9D900D7D7D700D1D1D100D0D0
      D000CDCDCD00CDCDCD00FFFFFF00FFFFFF00F4F4F4007A7A7A00747474007070
      70006D6D6D006A6A6A00636363005E5E5E00A1A1A1009B9B9B00EAEAEA00FFFF
      FF00F8F8F800B8B8B800CBCBCB00FFFFFF00ABABAB007A7A7A00747474007070
      70006D6D6D006A6A6A00636363005E5E5E00B1B1B100A9A9A9009D9D9D009595
      950090909000BABABA00FFFFFF00FEFEFE00FEFEFE009A9A9A00838383008080
      80007D7D7D007A7A7A007373730070707000B1B1B100AAAAAA00F8F8F800FDFD
      FD00D1D1D10091919100858585008585850085858500D3D3D300FFFFFF00FFFF
      FF00FFFFFF00999999007373730070707000C1C1C100BABABA00B1B1B100AAAA
      AA00A5A5A500A1A1A100ADADAD00A0A0A000D7D7D700FFFFFF00B6B6B6008080
      80007D7D7D007A7A7A007373730070707000CDCDCD00FFFFFF00D8D8D800DADA
      DA00FFFFFF00A5A5A50085858500BDBDBD00FFFFFF00BDBDBD00838383008080
      80007D7D7D007A7A7A007373730070707000BBBBBB00B1B1B100A3A3A3009D9D
      9D00959595008F8F8F00C7C7C700E7E7E700B4B4B40085858500858585008383
      8300818181007F7F7F007B7B7B0078787800BBBBBB00B1B1B100A8A8A800D2D2
      D200FBFBFB00FAFAFA008D8D8D0087878700A9A9A900FFFFFF00E9E9E900B0B0
      B000F9F9F900EBEBEB007B7B7B0078787800BBBBBB00B1B1B100A3A3A3009D9D
      9D00959595009A9A9A00FFFFFF00B7B7B70087878700A5A5A500FFFFFF009797
      9700818181007F7F7F007B7B7B0078787800C4C4C400F6F6F600C1C1C100A7A7
      A700FAFAFA00E9E9E900878787008A8A8A00EEEEEE00F9F9F900858585008383
      8300818181007F7F7F007B7B7B0078787800C1C1C100B9B9B900ABABAB00A3A3
      A3009B9B9B00959595008B8B8B00898989008989890087878700878787008585
      850085858500858585007F7F7F007F7F7F00C1C1C100B9B9B900ABABAB00A3A3
      A300A7A7A700D6D6D600F4F4F400D0D0D000F5F5F500FFFFFF00A3A3A3008585
      8500BCBCBC00FFFFFF007F7F7F007F7F7F00C1C1C100B9B9B900ABABAB00A3A3
      A3009B9B9B00B4B4B400FFFFFF00D7D7D7008989890087878700FFFFFF00A2A2
      A20085858500858585007F7F7F007F7F7F00C1C1C100B9B9B900ABABAB00A3A3
      A300CACACA00FFFFFF008B8B8B0089898900ACACAC00FFFFFF00878787008585
      850085858500858585007F7F7F007F7F7F00CBCBCB00C1C1C100B1B1B100A9A9
      A900A3A3A3009D9D9D00919191008B8B8B008989890089898900898989008787
      870087878700878787008383830081818100CBCBCB00C1C1C100B1B1B100A9A9
      A900A3A3A3009D9D9D00E0E0E000FFFFFF00FFFFFF00FFFFFF00898989008787
      870088888800E7E7E7009393930081818100CBCBCB00C1C1C100B1B1B100A9A9
      A900A3A3A3009F9F9F00E0E0E0009F9F9F0089898900ADADAD00FFFFFF00A3A3
      A30087878700878787008383830081818100CBCBCB00C1C1C100B1B1B100A9A9
      A900A7A7A700F5F5F500969696008B8B8B0089898900DCDCDC00A5A5A5008787
      870087878700878787008383830081818100DBDBDB00D3D3D300C1C1C100B9B9
      B900B1B1B100ABABAB009B9B9B0097979700919191008D8D8D008B8B8B008B8B
      8B0089898900898989008989890089898900DBDBDB00D3D3D300C1C1C100B9B9
      B900B1B1B100ABABAB009B9B9B0097979700919191008D8D8D008B8B8B008B8B
      8B0089898900898989008989890089898900DBDBDB00D3D3D300C1C1C100B9B9
      B900B1B1B100ABABAB009B9B9B009797970091919100C4C4C400E8E8E8008F8F
      8F0089898900898989008989890089898900DBDBDB00D3D3D300C1C1C100B9B9
      B900B1B1B100ABABAB00A0A0A00097979700919191008D8D8D009B9B9B008B8B
      8B008989890089898900898989008989890000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B00898989000000000000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B00898989000000000000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B00898989000000000000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B008989890000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      190018181800151515001212120000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      190018181800151515001212120000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      190018181800151515001212120000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      19001818180015151500121212000000000047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B00171717001515150047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B00171717001515150047474700454545003D3D3D003A3A
      3A00383838003434340076767600858585002929290027272700222222001F1F
      1F001D1D1D001B1B1B00171717001515150047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B00171717001515150059595900565656004F4F4F004C4C
      4C004848480045454500404040003B3B3B003939390036363600303030002D2D
      2D002A2A2A00282828002222220021212100A3A3A3005A5A5A004F4F4F004C4C
      4C004848480045454500FDFDFD00C8C8C8003939390036363600F3F3F3002D2D
      2D002A2A2A002828280037373700A9A9A90059595900565656004F4F4F004C4C
      4C004848480045454500D2D2D200DCDCDC003939390036363600303030002D2D
      2D002A2A2A0028282800222222002121210059595900565656004F4F4F004C4C
      4C004848480045454500404040003B3B3B003939390036363600303030002D2D
      2D002A2A2A00282828002222220021212100626262005F5F5F00585858005555
      5500525252004E4E4E004747470044444400414141003E3E3E00383838003535
      3500323232002F2F2F002929290026262600FFFFFF00E8E8E800585858005555
      5500525252004E4E4E00FDFDFD0067676700414141003E3E3E00F3F3F3003535
      3500323232002F2F2F00F5F5F500FFFFFF00626262005F5F5F00585858005555
      5500525252004E4E4E00D4D4D400DEDEDE00414141003E3E3E00383838003535
      3500323232002F2F2F002929290026262600626262005F5F5F00585858005555
      5500525252004E4E4E004747470044444400414141003E3E3E00383838003535
      3500323232002F2F2F0029292900262626006C6C6C00686868005F5F5F005E5E
      5E005A5A5A0057575700505050004D4D4D004949490046464600404040003D3D
      3D003939390036363600303030002D2D2D00BDBDBD00FBFBFB005F5F5F005E5E
      5E005A5A5A0088888800BBBBBB004D4D4D004949490046464600F4F4F4003D3D
      3D003939390049494900E7E7E700727272006C6C6C00686868005F5F5F005E5E
      5E005A5A5A0057575700D6D6D600E0E0E0004949490046464600404040003D3D
      3D003939390036363600303030002D2D2D006C6C6C00686868005F5F5F005E5E
      5E005A5A5A0057575700505050004D4D4D004949490046464600404040003D3D
      3D003939390036363600303030002D2D2D00757575007D7D7D00ABABAB00A3A3
      A3008F8F8F00646464005959590055555500525252004F4F4F00484848005656
      56007474740081818100383838003535350075757500CCCCCC006A6A6A006666
      660065656500E8E8E8006B6B6B0055555500525252004F4F4F00F6F6F6004646
      460041414100646464008A8A8A0035353500757575006F6F6F006A6A6A006666
      6600636363005E5E5E00C6C6C600F9F9F900ACACAC0055555500484848004444
      4400414141003D3D3D00383838004D4D4D007575750071717100B9B9B900A9A9
      A900848484005E5E5E005959590055555500525252004F4F4F00484848005E5E
      5E0086868600ADADAD006969690035353500A1A1A1009B9B9B00959595009292
      920091919100A9A9A900FFFFFF00FFFFFF00FFFFFF00D4D4D400FFFFFF00FFFF
      FF00FFFFFF00BABABA006D6D6D00696969008A8A8A00D3D3D300DEDEDE00FFFF
      FF00FAFAFA00B1B1B1006B6B6B00676767006464640061616100EFEFEF00FFFF
      FF00E5E5E500B6B6B60093939300444444008B8B8B00828282007A7A7A007777
      770075757500F3F3F3008A8A8A0067676700A4A4A400FFFFFF00E3E3E300C5C5
      C500BABABA00ACACAC0048484800444444009090900082828200AFAFAF00B5B5
      B500F2F2F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCDCDC009A9A
      9A009898980095959500919191008F8F8F00939393008E8E8E00808080007F7F
      7F007B7B7B0078787800B7B7B700F8F8F800EEEEEE0075757500FFFFFF00FFFF
      FF00EAEAEA005F5F5F00505050004D4D4D0093939300D6D6D600FFFFFF00FFFF
      FF00ABABAB00787878008F8F8F00A9A9A900A6A6A600959595006A6A6A00B7B7
      B700FBFBFB00FFFFFF00989898004D4D4D00BFBFBF008E8E8E00808080007F7F
      7F007B7B7B00A6A6A600FFFFFF00C6C6C60090909000F8F8F800F2F2F2006767
      67005C5C5C0057575700505050004D4D4D00939393008E8E8E00B9B9B900F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00919191005F5F
      5F005C5C5C0057575700505050004D4D4D009B9B9B0095959500898989008282
      820084848400CFCFCF009B9B9B007B7B7B007373730086868600FFFFFF00FFFF
      FF008F8F8F00616161005A5A5A00555555009B9B9B00D2D2D200FFFFFF00FFFF
      FF00F0F0F000A5A5A500FDFDFD00FFFFFF00FFFFFF00FFFFFF006B6B6B006868
      6800D2D2D200FFFFFF009E9E9E0055555500C4C4C400A4A4A400898989008282
      82008181810080808000FAFAFA00FFFFFF00FFFFFF00FFFFFF00AAAAAA006868
      680065656500616161005A5A5A00555555009B9B9B0095959500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00AFAFAF00949494008F8F8F008E8E8E006B6B6B006868
      680065656500616161005A5A5A0055555500A1A1A1009B9B9B008D8D8D008989
      8900CACACA00FFFFFF00FFFFFF00D9D9D900A2A2A200E3E3E300FFFFFF00C9C9
      C9006D6D6D006A6A6A00636363005E5E5E00A1A1A100AAAAAA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A5A5A5007D7D7D00C2C2C200A5A5A5009595
      9500FDFDFD00FFFFFF008D8D8D005E5E5E00A2A2A200D0D0D0008D8D8D008989
      890084848400BABABA00E6E6E600FFFFFF00FFFFFF00FFFFFF00777777007070
      70006D6D6D006A6A6A00636363005E5E5E00A1A1A1009B9B9B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B3B3B300B2B2B200B1B1B100A4A4A400ACACAC00A9A9
      A900A7A7A700A6A6A600A1A1A1009E9E9E00B1B1B100A9A9A9009D9D9D00E9E9
      E900FAFAFA009898980089898900A9A9A900D8D8D800FFFFFF00A7A7A7008080
      80007D7D7D007A7A7A007373730070707000B1B1B100A9A9A9009D9D9D009797
      9700C1C1C100F3F3F300A2A2A200FFFFFF00FFFFFF00CDCDCD00FFFFFF00FFFF
      FF00FFFFFF00F9F9F9007373730070707000B1B1B100C1C1C1009D9D9D009595
      95008F8F8F0089898900E2E2E200FFFFFF00FFFFFF00E8E8E800838383008D8D
      8D0097979700888888007373730070707000B1B1B100A9A9A900BBBBBB00CDCD
      CD00BCBCBC00B8B8B800B6B6B600B6B6B600B6B6B600ADADAD00838383008080
      8000ABABAB00F9F9F900FFFFFF00FFFFFF00BBBBBB00B1B1B100A5A5A500DCDC
      DC00AFAFAF008F8F8F00F5F5F500FFFFFF00C1C1C1009D9D9D00858585008383
      8300818181007F7F7F007B7B7B0078787800BBBBBB00B1B1B100A3A3A3009D9D
      9D00959595008F8F8F0099999900FEFEFE00FFFFFF00C8C8C800E9E9E900FFFF
      FF00FFFFFF00B2B2B2007B7B7B0078787800BBBBBB00B1B1B100A3A3A3009D9D
      9D00959595008F8F8F00DADADA00FFFFFF00FFFFFF00A6A6A60085858500CFCF
      CF00EAEAEA00C9C9C9007B7B7B0078787800BBBBBB00B1B1B100F6F6F600FFFF
      FF00C2C2C2008F8F8F0087878700878787008787870085858500858585008383
      83008181810097979700FFFFFF00FFFFFF00C1C1C100B9B9B900EDEDED00BABA
      BA009B9B9B0095959500FFFFFF00FFFFFF00DADADA0087878700878787008585
      850085858500858585007F7F7F007F7F7F00C1C1C100B9B9B900ABABAB00A3A3
      A3009B9B9B00959595008B8B8B009F9F9F00AEAEAE0088888800A6A6A600D7D7
      D700C1C1C100858585007F7F7F007F7F7F00C1C1C100B9B9B900ABABAB00A3A3
      A3009B9B9B00959595009A9A9A00DBDBDB00C5C5C500878787008A8A8A00B1B1
      B100959595008C8C8C008A8A8A007F7F7F00C1C1C100B9B9B900FFFFFF00FFFF
      FF00E2E2E200959595008B8B8B00898989008989890087878700878787008585
      85008585850085858500F7F7F700FFFFFF00CBCBCB00C2C2C200FDFDFD00B0B0
      B000A3A3A3009D9D9D00C1C1C100D2D2D2009B9B9B0089898900898989008787
      870087878700878787008383830081818100CBCBCB00C1C1C100B1B1B100A9A9
      A900A3A3A3009D9D9D00919191008B8B8B0089898900A8A8A800FFFFFF00A9A9
      A90087878700878787008383830081818100CBCBCB00C1C1C100B1B1B100A9A9
      A900A3A3A3009D9D9D00FFFFFF00CACACA008989890089898900A3A3A300FFFF
      FF00AAAAAA0097979700BDBDBD0081818100CBCBCB00C1C1C100DCDCDC00E8E8
      E800B5B5B5009D9D9D00919191008B8B8B008989890089898900898989008787
      87008787870087878700A7A7A700FFFFFF00DBDBDB00D7D7D700C2C2C200B9B9
      B900B1B1B100ABABAB009B9B9B0097979700919191008D8D8D008B8B8B008B8B
      8B0089898900898989008989890089898900DBDBDB00D3D3D300C1C1C100B9B9
      B900B1B1B100ABABAB009B9B9B00979797009191910092929200CACACA009292
      920089898900898989008989890089898900DBDBDB00D3D3D300C1C1C100B9B9
      B900B1B1B100ABABAB00FFFFFF00CECECE00919191008D8D8D008B8B8B008B8B
      8B0097979700A6A6A6008989890089898900DBDBDB00D3D3D300C1C1C100B9B9
      B900B1B1B100ABABAB009B9B9B0097979700919191008D8D8D008B8B8B008B8B
      8B00898989008989890089898900C5C5C50000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B00898989000000000000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B00898989000000000000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B00898989000000000000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B00A2A2A20000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      190018181800151515001212120000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      190018181800151515001212120000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      190018181800151515001212120000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      19001818180015151500121212000000000047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B00171717001515150047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C0029292900272727002C2C2C001F1F
      1F001D1D1D001B1B1B00171717001515150047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B00171717001515150047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D00535353001717170015151500EBEBEB008C8C8C004F4F4F004C4C
      4C004848480045454500404040003B3B3B003939390036363600303030002D2D
      2D002A2A2A0028282800222222002121210059595900565656004F4F4F004C4C
      4C0048484800454545004040400057575700FAFAFA00F8F8F800FFFFFF00ABAB
      AB002A2A2A0028282800222222002121210059595900565656004F4F4F004C4C
      4C004848480045454500404040003B3B3B003939390036363600FDFDFD00ADAD
      AD002A2A2A0028282800222222002121210059595900565656004F4F4F004C4C
      4C004848480045454500404040003B3B3B0039393900363636003F3F3F00A1A1
      A100B6B6B600B6B6B6002222220021212100F9F9F900FFFFFF00727272005555
      5500525252004E4E4E004747470044444400414141003E3E3E00383838003535
      3500323232002F2F2F002929290026262600626262005F5F5F00585858005555
      5500525252004E4E4E0047474700CFCFCF00FBFBFB0069696900C9C9C9005959
      5900323232002F2F2F002929290026262600626262005F5F5F00585858005555
      5500525252004E4E4E004747470044444400414141003E3E3E00F6F6F6004A4A
      4A00323232002F2F2F002929290026262600626262005F5F5F00585858005555
      5500525252004E4E4E0047474700444444004141410049494900ADADAD005252
      5200323232002F2F2F0029292900262626007D7D7D00CDCDCD00FBFBFB00B5B5
      B5006262620057575700505050004D4D4D004949490046464600404040003D3D
      3D003939390036363600303030002D2D2D006C6C6C00686868005F5F5F005E5E
      5E005A5A5A00575757008E8E8E00FFFFFF00A5A5A50046464600404040003D3D
      3D003939390036363600303030002D2D2D006C6C6C00686868005F5F5F005E5E
      5E005A5A5A0057575700505050004D4D4D00494949007C7C7C009A9A9A003D3D
      3D003939390036363600303030002D2D2D006C6C6C00686868005F5F5F005E5E
      5E005A5A5A005757570050505000535353009D9D9D00BCBCBC00404040003D3D
      3D003939390036363600303030002D2D2D00757575006F6F6F00E6E6E600FFFF
      FF00EEEEEE00959595005959590055555500525252004F4F4F00484848004444
      4400414141003D3D3D003838380035353500757575006F6F6F006A6A6A006666
      6600636363005E5E5E00E8E8E800EFEFEF00565656004F4F4F00515151006969
      69006767670064646400606060005D5D5D00757575006F6F6F006A6A6A006666
      6600636363005E5E5E00DADADA00EBEBEB0054545400E2E2E2004C4C4C004444
      4400414141003D3D3D003838380035353500C5C5C500BABABA00FDFDFD00E2E2
      E200B9B9B900828282009D9D9D00C9C9C90087878700727272009E9E9E00C4C4
      C400D9D9D900D8D8D800AFAFAF00BFBFBF008A8A8A008282820091919100FFFF
      FF00FFFFFF00FFFFFF00CECECE00676767006464640061616100585858005656
      5600535353005F5F5F0048484800444444008A8A8A00828282007A7A7A007777
      770075757500727272007C7C7C00F8F8F800E9E9E90068686800FFFFFF00BDBD
      BD009898980095959500919191008F8F8F00A7A7A700868686007A7A7A009191
      9100F4F4F400FFFFFF007E7E7E0072727200F4F4F400DADADA00585858005656
      5600535353004E4E4E0048484800444444008A8A8A00828282007A7A7A009797
      9700ABABAB0077777700F5F5F500FFFFFF00FFFFFF008C8C8C00FFFFFF00FFFF
      FF00FDFDFD006F6F6F004848480044444400939393008E8E8E0096969600FFFF
      FF00FFFFFF00FFFFFF00A6A6A600707070006B6B6B0069696900C0C0C000BFBF
      BF00BEBEBE00DBDBDB007373730071717100939393008E8E8E00808080007F7F
      7F007B7B7B007878780073737300AEAEAE00FFFFFF00E6E6E600E3E3E3006363
      63005C5C5C0059595900505050004D4D4D0097979700AFAFAF0087878700BDBD
      BD00FFFFFF00EEEEEE00C7C7C700DADADA00FFFFFF00A9A9A900616161005F5F
      5F005C5C5C0057575700505050004D4D4D00939393008E8E8E0080808000D9D9
      D900FFFFFF00ECECEC007B7B7B00B7B7B700A6A6A6006D6D6D00FFFFFF00FFFF
      FF00B4B4B40057575700505050004D4D4D009B9B9B00959595009E9E9E00FFFF
      FF00FFFFFF00FFFFFF007D7D7D00797979007373730081818100EFEFEF00E1E1
      E100E0E0E000EEEEEE009C9C9C00999999009B9B9B0095959500898989008282
      820081818100808080007A7A7A009F9F9F00FFFFFF00FFFFFF008C8C8C006868
      6800A6A6A600FBFBFB005A5A5A00555555009B9B9B0095959500BBBBBB00A1A1
      A100DEDEDE00E6E6E600EEEEEE00FFFFFF00FFFFFF00F0F0F0006B6B6B006868
      680065656500616161005A5A5A00555555009B9B9B0095959500898989008989
      8900CBCBCB00FEFEFE00DEDEDE009292920073737300BBBBBB00FFFFFF00EDED
      ED006C6C6C00616161005A5A5A0055555500A1A1A1009B9B9B009D9D9D00FFFF
      FF00FFFFFF00FFFFFF00DADADA00909090007D7D7D00D0D0D000888888007070
      70006D6D6D0078787800636363005E5E5E00A1A1A1009B9B9B008D8D8D008989
      8900838383008383830087878700EDEDED00FFFFFF00FFFFFF00747474008484
      8400FCFCFC00EAEAEA00636363005E5E5E00A1A1A1009B9B9B008D8D8D00BFBF
      BF0083838300838383008A8A8A00F1F1F100FFFFFF00FFFFFF00747474007070
      70006D6D6D006A6A6A00636363005E5E5E00A1A1A1009B9B9B008D8D8D008989
      89008383830097979700FFFFFF00FFFFFF00D9D9D900FCFCFC00FFFFFF009A9A
      9A006D6D6D006A6A6A00636363005E5E5E00B1B1B100A9A9A9009D9D9D009595
      95008F8F8F00B7B7B700FFFFFF00FFFFFF00FFFFFF00F6F6F600838383008080
      80007D7D7D007A7A7A007373730070707000D0D0D000CBCBCB00C4C4C400BFBF
      BF00BCBCBC00B8B8B800FEFEFE00FFFFFF00FFFFFF00FEFEFE00FBFBFB00FFFF
      FF00C6C6C6007A7A7A007373730070707000B1B1B100A9A9A9009D9D9D009A9A
      9A00D1D1D100B8B8B800B6B6B600B6B6B600F1F1F100FFFFFF00E2E2E2008080
      80007D7D7D007A7A7A007373730070707000B1B1B100A9A9A9009D9D9D009595
      95008F8F8F0089898900B3B3B300C8C8C800C0C0C000F0F0F0008D8D8D008080
      80007D7D7D007A7A7A007373730070707000BBBBBB00B1B1B100A3A3A3009D9D
      9D00959595008F8F8F00FFFFFF00FFFFFF00FBFBFB00B4B4B400858585008383
      8300818181007F7F7F007B7B7B0078787800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E5E5E5009F9F
      9F00818181007F7F7F007B7B7B0078787800BBBBBB00B1B1B100A3A3A300C7C7
      C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AFAF
      AF00818181007F7F7F007B7B7B0078787800BBBBBB00B1B1B100A3A3A3009D9D
      9D00959595008F8F8F00FFFFFF00FFFFFF00CFCFCF0085858500858585008383
      8300818181007F7F7F007B7B7B0078787800C1C1C100BBBBBB00CDCDCD00C8C8
      C800C3C3C300D1D1D100FEFEFE00D0D0D0009F9F9F00F2F2F200C1C1C1008585
      850085858500858585007F7F7F007F7F7F00DADADA00D5D5D500CDCDCD00C8C8
      C800C3C3C300BFBFBF00CECECE00B8B8B800B8B8B800B7B7B700878787008585
      850085858500858585007F7F7F007F7F7F00C1C1C100B9B9B900ABABAB00A4A4
      A400CBCBCB00AAAAAA00A2A2A200A1A1A100A1A1A100C5C5C500E3E3E300F2F2
      F2008B8B8B00858585007F7F7F007F7F7F00C1C1C100B9B9B900ABABAB00A3A3
      A3009B9B9B0095959500FEFEFE00FFFFFF00CACACA0087878700878787008585
      850085858500858585007F7F7F007F7F7F00CBCBCB00CDCDCD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A1A1A1008B8B8B00A2A2A200FFFFFF00DFDFDF008787
      870087878700878787008383830081818100CBCBCB00C1C1C100B1B1B100A9A9
      A900A3A3A3009D9D9D00FFFFFF00E4E4E4008989890089898900898989008787
      870087878700878787008383830081818100CBCBCB00C1C1C100B1B1B100BCBC
      BC00AEAEAE009D9D9D00919191008B8B8B00C6C6C600FFFFFF00B1B1B100FEFE
      FE00C7C7C700878787008383830081818100CBCBCB00C1C1C100B1B1B100A9A9
      A900A3A3A3009D9D9D00A2A2A200AEAEAE008A8A8A0089898900898989008787
      870087878700878787008383830081818100DBDBDB00D3D3D300C1C1C100B9B9
      B900B1B1B100ABABAB009B9B9B0097979700919191008D8D8D008B8B8B008B8B
      8B0089898900898989008989890089898900DBDBDB00D3D3D300C1C1C100B9B9
      B900B1B1B100ABABAB00EBEBEB00C4C4C400919191008D8D8D008B8B8B008B8B
      8B0089898900898989008989890089898900DBDBDB00D3D3D300DBDBDB00BCBC
      BC00B1B1B100ABABAB009B9B9B00979797009A9A9A00C8C8C8008B8B8B009393
      9300F7F7F700DCDCDC008989890089898900DBDBDB00D3D3D300C1C1C100B9B9
      B900B1B1B100ABABAB009B9B9B0097979700919191008D8D8D008B8B8B008B8B
      8B008989890089898900898989008989890000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B00898989000000000000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B00898989000000000000000000EAEAEA00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B00BBBBBB00FFFFFF00898989000000000000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B008989890000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      190018181800151515001212120000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      190018181800151515001212120000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      190018181800151515001212120000000000000000003B3B3B00353535003333
      3300303030002C2C2C00272727002525250022222200202020001C1C1C001919
      19001818180015151500121212000000000047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B00171717001515150047474700454545003D3D3D003A3A
      3A0038383800404040002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B00171717001515150047474700454545003D3D3D003A3A
      3A0038383800343434002F2F2F002C2C2C002929290027272700222222001F1F
      1F001D1D1D001B1B1B00171717001515150047474700454545006F6F6F00C0C0
      C0004B4B4B00343434002F2F2F002C2C2C002929290027272700222222003C3C
      3C00BFBFBF00494949001717170015151500CACACA006E6E6E004F4F4F005B5B
      5B00ADADAD005F5F5F00404040003B3B3B003939390036363600303030002D2D
      2D002A2A2A0028282800222222002121210059595900565656004F4F4F004C4C
      4C0068686800FDFDFD00494949003B3B3B003939390036363600303030002D2D
      2D002A2A2A00B3B3B3006D6D6D002121210059595900565656004F4F4F004C4C
      4C004848480087878700565656003B3B3B003939390036363600303030002D2D
      2D002A2A2A002828280075757500EDEDED0059595900565656004F4F4F00D5D5
      D500FFFFFF0075757500404040003B3B3B0039393900363636006D6D6D00FFFF
      FF00D7D7D7002B2B2B002222220021212100FFFFFF00FDFDFD00646464007B7B
      7B00FBFBFB00FBFBFB005454540044444400414141003E3E3E00383838005252
      5200909090004C4C4C002929290026262600626262005F5F5F00585858005555
      550052525200AEAEAE00AFAFAF0044444400414141003E3E3E00383838003535
      350067676700FFFFFF002929290026262600626262005F5F5F00585858005555
      55005252520056565600C9C9C90044444400414141003E3E3E00383838003535
      35003232320056565600FFFFFF00D4D4D400626262005F5F5F00585858007575
      7500FDFDFD00E6E6E6004747470044444400414141003E3E3E00E3E3E300FFFF
      FF00626262002F2F2F00292929002626260088888800DADADA00F6F6F600A6A6
      A60079797900D0D0D000F5F5F50098989800494949004646460040404000EDED
      ED00FFFFFF00ECECEC00303030002D2D2D006C6C6C00686868005F5F5F005E5E
      5E005A5A5A005F5F5F00FDFDFD00717171004949490046464600404040004242
      4200E3E3E300FAFAFA00303030002D2D2D006C6C6C00686868005F5F5F005E5E
      5E005A5A5A0057575700FFFFFF00838383004949490046464600404040004646
      4600ABABAB00FDFDFD00838383002D2D2D006C6C6C00686868005F5F5F005E5E
      5E00B1B1B100FFFFFF00505050004D4D4D004949490046464600FFFFFF00B1B1
      B1003939390036363600303030002D2D2D00757575006F6F6F00EAEAEA00FFFF
      FF00EDEDED0082828200E0E0E000FFFFFF00959595004F4F4F0048484800E9E9
      E900FFFFFF00E6E6E6003838380035353500757575006F6F6F006A6A6A006666
      6600636363005E5E5E00FFFFFF00DFDFDF00565656004F4F4F00484848009C9C
      9C00FFFFFF00A4A4A4003838380035353500757575006F6F6F006A6A6A006666
      6600636363005E5E5E00E0E0E000EDEDED005A5A5A004F4F4F004A4A4A00E5E5
      E500FFFFFF00B6B6B6003838380035353500757575006F6F6F006A6A6A006666
      66006A6A6A00EEEEEE0070707000555555005252520062626200F2F2F2005151
      5100414141003D3D3D0038383800353535008A8A8A00828282007A7A7A007777
      7700EFEFEF00EEEEEE00FDFDFD00EDEDED006B6B6B006A6A6A00F9F9F900FFFF
      FF00A8A8A8004E4E4E0048484800444444008A8A8A00828282007A7A7A007777
      770075757500727272006B6B6B00A4A4A400F4F4F400FFFFFF0072727200D3D3
      D300FFFFFF007878780048484800444444008A8A8A00828282007A7A7A007777
      770075757500727272006B6B6B00D2D2D200FDFDFD00B3B3B3006C6C6C00FFFF
      FF00909090004E4E4E0048484800444444008A8A8A00828282007A7A7A007777
      77007575750072727200FFFFFF00A7A7A70099999900FFFFFF00585858005656
      5600535353004E4E4E004848480044444400939393008E8E8E00808080007F7F
      7F00EFEFEF00FFFFFF00FFFFFF009A9A9A006B6B6B00E1E1E100D2D2D2007D7D
      7D005C5C5C005757570067676700BEBEBE00D4D4D400D2D2D200CCCCCC00CCCC
      CC00CACACA00C9C9C900C7C7C700C6C6C600CDCDCD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CCCCCC00B9B9B900B8B8B800939393008E8E8E00808080007F7F
      7F007B7B7B00787878007373730078787800D5D5D500FFFFFF00A9A9A900FFFF
      FF009696960057575700505050004D4D4D00939393008E8E8E00808080007F7F
      7F007B7B7B0078787800F8F8F800FFFFFF00FFFFFF00FBFBFB00616161005F5F
      5F005C5C5C0057575700505050004D4D4D009B9B9B0095959500898989008282
      8200F0F0F000FFFFFF00FFFFFF00E3E3E30094949400F0F0F0006B6B6B006868
      6800656565006E6E6E00FBFBFB00FFFFFF009B9B9B0095959500898989008282
      82008181810080808000B5B5B5008D8D8D007373730072727200FFFFFF00FFFF
      FF00FDFDFD00777777005A5A5A00555555009B9B9B0095959500898989008282
      820081818100808080007A7A7A007979790075757500BDBDBD00FFFFFF00FFFF
      FF009B9B9B00616161005A5A5A00555555009B9B9B0095959500898989008282
      82008181810080808000BFBFBF00FFFFFF00FFFFFF00CCCCCC006B6B6B006868
      680065656500616161005A5A5A0055555500A1A1A1009B9B9B008D8D8D008989
      8900AAAAAA00EDEDED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00747474007878
      7800BABABA00F8F8F800E3E3E3008D8D8D00A1A1A1009B9B9B008D8D8D008989
      89008383830083838300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C3C3C3006A6A6A00636363005E5E5E00A1A1A1009B9B9B008D8D8D008989
      89008383830083838300818181007E7E7E007D7D7D007A7A7A00FFFFFF00FFFF
      FF00969696006A6A6A00939393005E5E5E00A1A1A1009B9B9B008D8D8D008989
      890090909000F2F2F200B5B5B500FFFFFF00FFFFFF00C8C8C800E2E2E2008E8E
      8E006D6D6D006A6A6A00636363005E5E5E00B1B1B100A9A9A9009D9D9D009595
      95008F8F8F00898989008E8E8E00CBCBCB00FCFCFC00FFFFFF00FFFFFF00F6F6
      F600B6B6B6007D7D7D007373730070707000B1B1B100A9A9A900D8D8D800CECE
      CE00A5A5A500A1A1A1009D9D9D009D9D9D00A0A0A000FEFEFE00FFFFFF00ADAD
      AD007D7D7D007A7A7A007373730070707000B1B1B100A9A9A900ADADAD00CECE
      CE00BCBCBC00B8B8B800F8F8F800FBFBFB00D3D3D300DFDFDF00FFFFFF00AEAE
      AE0086868600F2F2F2007373730070707000B1B1B100A9A9A900FFFFFF00D3D3
      D3008F8F8F00C7C7C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0E0E0008080
      8000B3B3B300FFFFFF008383830070707000BBBBBB00B1B1B100A3A3A3009D9D
      9D00959595008F8F8F00878787008787870098989800CBCBCB00C8C8C8009F9F
      9F00818181007F7F7F007B7B7B0078787800BBBBBB00B1B1B100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DBDBDB008383
      8300818181007F7F7F007B7B7B0078787800BBBBBB00B1B1B100A3A3A300B4B4
      B400959595008F8F8F008F8F8F00CECECE00FEFEFE00FFFFFF00F4F4F4009595
      9500DDDDDD00F6F6F6007B7B7B0078787800C9C9C900C1C1C100FFFFFF00DFDF
      DF00AAAAAA00ABABAB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B1B1B1009C9C
      9C00C4C4C400FFFFFF00A2A2A20093939300C1C1C100B9B9B900ABABAB00A3A3
      A3009B9B9B00959595008B8B8B00898989008989890087878700F4F4F400FFFF
      FF00BCBCBC00858585007F7F7F007F7F7F00C1C1C100B9B9B900D0D0D000DADA
      DA00D7D7D700D5D5D500D1D1D100D0D0D000D0D0D000CFCFCF00989898008585
      850085858500858585007F7F7F007F7F7F00C1C1C100B9B9B900D8D8D800EDED
      ED00AAAAAA00959595008B8B8B00898989009C9C9C00E1E1E100FFFFFF00FFFF
      FF00F6F6F600AAAAAA007F7F7F007F7F7F00E6E6E600E3E3E300FFFFFF00F0F0
      F000D7D7D700D5D5D500D6D6D600D8D8D800DADADA00CFCFCF00CFCFCF00CECE
      CE00E2E2E200FFFFFF00D2D2D200CCCCCC00CBCBCB00C1C1C100B1B1B100A9A9
      A900A3A3A3009D9D9D00919191008B8B8B008989890089898900FFFFFF00FFFF
      FF00DADADA00878787008383830081818100CBCBCB00C1C1C100B1B1B100A9A9
      A900A3A3A3009D9D9D0091919100C6C6C600FFFFFF00C7C7C700898989008787
      870087878700878787008383830081818100CBCBCB00C9C9C900FFFFFF00FFFF
      FF00D6D6D6009D9D9D0091919100C6C6C600FFFFFF00CCCCCC00D1D1D100C2C2
      C2008F8F8F00878787008383830081818100CBCBCB00C1C1C100FFFFFF00DCDC
      DC00A3A3A3009D9D9D00AAAAAA00FBFBFB00FCFCFC00AAAAAA00898989008787
      8700B8B8B800FFFFFF009292920081818100DBDBDB00D3D3D300C1C1C100B9B9
      B900B1B1B100ABABAB009B9B9B0097979700919191008D8D8D008B8B8B008B8B
      8B0089898900898989008989890089898900DBDBDB00D3D3D300C1C1C100B9B9
      B900B1B1B100ABABAB009B9B9B00CECECE00F9F9F900CBCBCB008B8B8B008B8B
      8B0089898900898989008989890089898900DBDBDB00D3D3D300ECECEC00F8F8
      F800C2C2C200ABABAB009B9B9B00CECECE00F9F9F900CFCFCF008B8B8B008B8B
      8B0089898900898989008989890089898900DBDBDB00D3D3D300C1C1C100B9B9
      B900B1B1B100ABABAB00A0A0A000DADADA00DBDBDB00969696008B8B8B008B8B
      8B008989890089898900898989008989890000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B00898989000000000000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B00898989000000000000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B00898989000000000000000000DBDBDB00C9C9C900C1C1
      C100B9B9B900B1B1B100A3A3A3009D9D9D0097979700919191008B8B8B008B8B
      8B008B8B8B008B8B8B008989890000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF0080018001000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800180010000000080018001800180010000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800180018001800180018001800180010000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800180018001800180018001800180010000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800180018001800180018001800180010000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800180018001800180018001800180010000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800180018001800100000000000000000000000000000000
      000000000000}
  end
  object SaveDialog1: TSaveDialog
    Left = 577
    Top = 417
  end
  object imgEventImages: TImageList
    Left = 544
    Top = 496
    Bitmap = {
      494C01012D003100040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000C0000000010020000000000000C0
      000000000000000000000000000000000000E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B2A36500B2A36500B2A36500B2A3
      6500B2A36500B2A36500B2A36500B2A36500B2A36500B2A36500B2A36500B2A3
      6500B2A36500B2A36500B2A36500B2A36500B2A36500B2A36500B2A36500B2A3
      6500B2A36500B2A36500B2A36500B2A36500B2A36500B2A36500B2A36500B2A3
      6500B2A36500B2A36500B2A36500B2A36500B2A36500B2A36500B2A36500B2A3
      6500B2A36500B2A36500B2A36500B2A36500B2A36500B2A36500B2A36500B2A3
      6500B2A36500B2A36500B2A36500B2A36500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500F2EBD000F2EBD000F2EBD000F2EB
      D000F2EBD000F2EBD000F2EBD000F2EBD000F2EBD000F2EBD000F2EBD000F2EB
      D000F2EBD000F2EBD000F2EBD000F2EBD000F2EBD000F2EBD000F2EBD000F2EB
      D000F2EBD000F2EBD000F2EBD000F2EBD000F2EBD000F2EBD000F2EBD000F2EB
      D000F2EBD000F2EBD000F2EBD000F2EBD000F2EBD000F2EBD000F2EBD000F2EB
      D000F2EBD000F2EBD000F2EBD000F2EBD000F2EBD000F2EBD000F2EBD000F2EB
      D000F2EBD000F2EBD000F2EBD000F2EBD000FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500CEBE8C00CEBE8C00CEBE8C00CEBE
      8C00CEBE8C00CEBE8C00CEBE8C00CEBE8C00CEBE8C00CEBE8C00CEBE8C00CEBE
      8C00CEBE8C00CEBE8C00CEBE8C00F9F2D900CEBE8C00CEBE8C00CEBE8C00CEBE
      8C00CEBE8C00CEBE8C00CEBE8C00CEBE8C00CEBE8C00CEBE8C00CEBE8C00CEBE
      8C00CEBE8C00CEBE8C00CEBE8C00CEBE8C00F9F2D900CEBE8C00CEBE8C00CEBE
      8C00CEBE8C00CEBE8C00CEBE8C00CEBE8C00CEBE8C00CEBE8C00CEBE8C00CEBE
      8C00CEBE8C00CEBE8C00CEBE8C00CEBE8C00FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500D4C49200D4C49200D4C49200D4C4
      9200D4C49200D4C49200D4C49200D4C49200D4C49200D4C49200D4C49200D4C4
      9200D4C49200D4C49200D4C49200FBF5DB00D4C49200D4C49200D4C49200D4C4
      9200D4C49200D4C49200D4C49200D4C49200D4C49200D4C49200D4C49200D4C4
      9200D4C49200D4C49200D4C49200D4C49200FBF5DB00D4C49200D4C49200D4C4
      9200D4C49200D4C49200D4C49200D4C49200D4C49200D4C49200D4C49200D4C4
      9200D4C49200D4C49200D4C49200D4C49200FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500DACD9900DACD9900DACD9900DACD
      9900DACD9900DACD9900DACD9900DACD9900DACD9900DACD9900DACD9900DACD
      9900DACD9900DACD9900DACD9900FFF9DE00DACD9900DACD9900DACD9900DACD
      9900DACD9900DACD9900DACD9900DACD9900DACD9900DACD9900DACD9900DACD
      9900DACD9900DACD9900DACD9900DACD9900FFF9DE00DACD9900DACD9900DACD
      9900DACD9900DACD9900DACD9900DACD9900DACD9900DACD9900DACD9900DACD
      9900DACD9900DACD9900DACD9900DACD9900FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500DFD29E00DFD29E00DFD29E00DFD2
      9E00DFD29E00DFD29E00DFD29E00DFD29E00DFD29E00DFD29E00DFD29E00DFD2
      9E00DFD29E00DFD29E00DFD29E00FFFBE000DFD29E00DFD29E00DFD29E00DFD2
      9E00DFD29E00DFD29E00DFD29E00DFD29E00DFD29E00DFD29E00DFD29E00DFD2
      9E00DFD29E00DFD29E00DFD29E00DFD29E00FFFBE000DFD29E00DFD29E00DFD2
      9E00DFD29E00DFD29E00DFD29E00DFD29E00DFD29E00DFD29E00DFD29E00DFD2
      9E00DFD29E00DFD29E00DFD29E00DFD29E00FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E3D6A400E3D6A400E3D6A400E3D6
      A400E3D6A400E3D6A400E3D6A400E3D6A400E3D6A400E3D6A400E3D6A400E3D6
      A400E3D6A400E3D6A400E3D6A400FFFAE300E3D6A400E3D6A400E3D6A400E3D6
      A400E3D6A400E3D6A400E3D6A400E3D6A400E3D6A400E3D6A400E3D6A400E3D6
      A400E3D6A400E3D6A400E3D6A400E3D6A400FFFAE300E3D6A400E3D6A400E3D6
      A400E3D6A400E3D6A400E3D6A400E3D6A400E3D6A400E3D6A400E3D6A400E3D6
      A400E3D6A400E3D6A400E3D6A400E3D6A400FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600FFFFE600E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600FFFFE400E7D9A400E7D9A400E7D9
      A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9
      A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9
      A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9
      A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9
      A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9A400E7D9
      A400E7D9A400E7D9A400E7D9A400FFFFE400E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600FFFFE900EEDFAD00EEDFAD00EEDF
      AD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDF
      AD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDF
      AD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDF
      AD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDF
      AD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDFAD00EEDF
      AD00EEDFAD00EEDFAD00EEDFAD00FFFFE900E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600FFFFEE00F2E4B900F2E4B900F2E4
      B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4
      B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4
      B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4
      B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4
      B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4B900F2E4
      B900F2E4B900F2E4B900F2E4B900FFFFEE00E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600FFFFF500FBEDC500FBEDC500FBED
      C500FBEDC500FBEDC500FBEDC500FBEDC500FBEDC500FBEDC500FBEDC500FBED
      C500FBEDC500FBEDC500FBEDC500FBEDC500FBEDC500FBEDC500FBEDC500FBED
      C500FBEDC500FBEDC500FBEDC500FBEDC500FBEDC500FBEDC500FBEDC500FBED
      C500FBEDC500FBEDC500FBEDC500FBEDC500FBEDC500FBEDC500FBEDC500FBED
      C500FBEDC500FBEDC500FBEDC500FBEDC500FBEDC500FBEDC500FBEDC500FBED
      C500FBEDC500FBEDC500FBEDC500FFFFF500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600FFFFFD00FFFAD500FFFAD500FFFA
      D500FFFAD500FFFAD500FFFAD500FFFAD500FFFAD500FFFAD500FFFAD500FFFA
      D500FFFAD500FFFAD500FFFAD500FFFAD500FFFAD500FFFAD500FFFAD500FFFA
      D500FFFAD500FFFAD500FFFAD500FFFAD500FFFAD500FFFAD500FFFAD500FFFA
      D500FFFAD500FFFAD500FFFAD500FFFAD500FFFAD500FFFAD500FFFAD500FFFA
      D500FFFAD500FFFAD500FFFAD500FFFAD500FFFAD500FFFAD500FFFAD500FFFA
      D500FFFAD500FFFAD500FFFAD500FFFFFD00E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7A500E7D7
      A500E7D7A500E7D7A500E7D7A500FFFFE6006C6CF7006C6CF7006C6CF7006C6C
      F7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6C
      F7006C6CF7006C6CF7006C6CF7006C6CF7000000000000000000000000006C6C
      F7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6C
      F7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00E1E1FF00E1E1FF00E1E1FF00E1E1
      FF00E1E1FF00E1E1FF00E1E1FF00E1E1FF00E1E1FF00E1E1FF00E1E1FF00E1E1
      FF00E1E1FF00E1E1FF00E1E1FF00E1E1FF00000000006C6CF7006D6DF700AEAE
      FF00CBCBFF00DDDDFF00E3E3FF00E3E3FF00E1E1FF00E1E1FF00E1E1FF00E1E1
      FF00E1E1FF00E1E1FF00E1E1FF00E1E1FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF007F7FFF007F7FFF007F7FFF007F7F
      FF007F7FFF007F7FFF007F7FFF007F7FFF007F7FFF007F7FFF007F7FFF007F7F
      FF007F7FFF007F7FFF007F7FFF007F7FFF00000000006D6DF700C5C5FF00D3D3
      FF00AAAAFF008E8EFF008080FF008080FF007F7FFF007F7FFF007F7FFF007F7F
      FF007F7FFF007F7FFF007F7FFF007F7FFF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009292FF009292FF009292FF009292
      FF009292FF009292FF009292FF009292FF009292FF009292FF009292FF009292
      FF009292FF009292FF009292FF009292FF006C6CF700B7B7FF00E7E7FF00A1A1
      FF009494FF009494FF009292FF009292FF009292FF009292FF009292FF009292
      FF009292FF009292FF009292FF009292FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9FFF009F9FFF009F9FFF009F9F
      FF009F9FFF009F9FFF009F9FFF009F9FFF009F9FFF009F9FFF009F9FFF009F9F
      FF009F9FFF009F9FFF009F9FFF009F9FFF006C6CF700EAEAFF00D3D3FF00AAAA
      FF00A1A1FF00A1A1FF009F9FFF009F9FFF009F9FFF009F9FFF009F9FFF009F9F
      FF009F9FFF009F9FFF009F9FFF009F9FFF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00C5C5FF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF7006C6CF7006C6CF7006C6CF7006C6C
      F7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6C
      F7006C6CF700000000000000000000000000A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700E1E1FF00E1E1FF00E1E1FF00E1E1
      FF00E1E1FF00E1E1FF00E1E1FF00E1E1FF00E1E1FF00E1E1FF00D7D7FF00C1C1
      FF00A1A1FF006C6CF7006C6CF70000000000A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF7007F7FFF007F7FFF007F7FFF007F7F
      FF007F7FFF007F7FFF007F7FFF007F7FFF007C7CFD007B7BFD008080FF009696
      FF00B8B8FF00AFAFFF006C6CF70000000000A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF7009292FF009292FF009292FF009292
      FF009292FF009292FF009494FF008F8FFF008E8EFF008C8CFF008585FF007B7B
      FD007272FA00B8B8FF00A1A1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF7009F9FFF009F9FFF009F9FFF009F9F
      FF009F9FFF009F9FFF00A1A1FF009F9FFF009F9FFF009898FF009292FF008989
      FF007B7BFD009696FF00C1C1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A4A4FF00A4A4FF00A4A4FF009C9CFF009494
      FF008585FF008080FF00D7D7FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A4A4FF009898
      FF008C8CFF007B7BFD00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E3E3FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A4A4FF009F9F
      FF008E8EFF007C7CFD00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF008080FF00E3E3FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A4A4FF009F9F
      FF008F8FFF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF008080FF00E3E3FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF008E8EFF00DDDDFF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A1A1
      FF009494FF00AAAAFF00CBCBFF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700ABABFF00ABABFF00ABABFF00ABAB
      FF00ABABFF00ABABFF00ABABFF00ABABFF00ABABFF00ABABFF00ABABFF00ABAB
      FF00ABABFF00ABABFF00ABABFF00ABABFF00ABABFF00ABABFF00ABABFF00ABAB
      FF00ABABFF00ABABFF00ABABFF00ABABFF00ABABFF00ABABFF00ABABFF00AAAA
      FF00A1A1FF00D3D3FF00AEAEFF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700BFBFFF00BFBFFF00BFBFFF00BFBF
      FF00BFBFFF00BFBFFF00BFBFFF00BFBFFF00BFBFFF00BFBFFF00BFBFFF00BFBF
      FF00BFBFFF00BFBFFF00BFBFFF00BFBFFF00BFBFFF00BFBFFF00BFBFFF00BFBF
      FF00BFBFFF00BFBFFF00BFBFFF00BFBFFF00BFBFFF00BFBFFF00C5C5FF00D3D3
      FF00E7E7FF00C5C5FF006D6DF70000000000A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEA
      FF00B7B7FF006D6DF7006C6CF70000000000A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF7006C6CF7006C6CF7006C6CF7006C6C
      F7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6C
      F7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6C
      F7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6C
      F7006C6CF700000000000000000000000000A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF700A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF009F9F
      FF009292FF007F7FFF00E1E1FF006C6CF70000000000000000000000000049A4
      710049A4710049A4710049A4710049A4710049A4710049A4710049A4710049A4
      710049A4710049A4710049A4710049A4710049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF000000000049A471004AA572009CE3
      BA00BEF5D600CDFDE200D2FFE600CFFFE400CEFDE300CEFDE300CEFDE300CEFD
      E300CEFDE300CEFDE300CEFDE300CEFDE30049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00000000004AA57200BDF4D400CFFF
      E400A5E8C20087D8AA007ED3A2007BD2A0007BD2A0007BD2A0007BD2A0007BD2
      A0007BD2A0007BD2A0007BD2A0007BD2A00049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF0049A47100ACECC700E8FFF800A2E7
      BF008FDCB0008BDAAD008ADAAC008ADAAC008ADAAC008ADAAC008ADAAC008ADA
      AC008ADAAC008ADAAC008ADAAC008ADAAC0049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF0049A47100E4FFF400D3FFE700A5E8
      C20097E0B60095E0B60094DFB50094DFB50094DFB50094DFB50094DFB50094DF
      B50094DFB50094DFB50094DFB50094DFB50049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF0049A47100FFFFFF00C7FBDE00A5E8
      C20099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF0049A47100FFFFFF00C3F8DA00A5E8
      C20099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF0049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9006C6CF700FFFFFF00BFBFFF00ABAB
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF0049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9006C6CF700FFFFFF00C1C1FF00AEAE
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF0049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9006C6CF700FFFFFF00C2C2FF00AFAF
      FF00A7A7FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF0049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9006C6CF700FFFFFF00D3D3FF00B2B2
      FF00AAAAFF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF0049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9006C6CF700F4F4FF00EAEAFF00BFBF
      FF00AFAFFF00AAAAFF00A7A7FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00A5A5FF0049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9006C6CF700C1C1FF00FFFFFF00D3D3
      FF00BFBFFF00B2B2FF00AFAFFF00AEAEFF00ABABFF00ABABFF00ABABFF00ABAB
      FF00ABABFF00ABABFF00ABABFF00ABABFF0049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B900000000006D6DF700D8D8FF00FFFF
      FF00EAEAFF00D3D3FF00C2C2FF00C1C1FF00BFBFFF00BFBFFF00BFBFFF00BFBF
      FF00BFBFFF00BFBFFF00BFBFFF00BFBFFF0049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B900000000006C6CF7006D6DF700C1C1
      FF00F4F4FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9000000000000000000000000006C6C
      F7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6CF7006C6C
      F7006C6CF7006C6CF7006C6CF7006C6CF70099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710049A4710049A4710049A4710049A4
      710049A4710049A4710049A4710049A4710049A4710049A4710049A4710049A4
      710049A4710000000000000000000000000049A4710049A4710049A4710049A4
      710049A4710049A4710049A4710049A4710049A4710049A4710049A4710049A4
      710049A4710049A4710049A4710049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A47100CEFDE300CEFDE300CEFDE300CEFD
      E300CEFDE300CEFDE300CEFDE300CDFDE200CDFDE200CDFDE200C6F9DC00ADEC
      C90086D7A9004AA5720049A4710000000000CEFDE300CEFDE300CEFDE300CEFD
      E300CEFDE300CEFDE300CEFDE300CEFDE300CEFDE300CEFDE300CEFDE300CEFD
      E300CEFDE300CEFDE300CEFDE300CEFDE30099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A471007BD2A0007BD2A0007BD2A0007BD2
      A0007BD2A0007BD2A0007BD2A0007AD2A0007AD2A00078D09F007BD2A0008FDC
      B000AAEBC60099E2B9004AA57200000000007BD2A0007BD2A0007BD2A0007BD2
      A0007BD2A0007BD2A0007BD2A0007BD2A0007BD2A0007BD2A0007BD2A0007BD2
      A0007BD2A0007BD2A0007BD2A0007BD2A00099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A471008ADAAC008ADAAC008ADAAC008ADA
      AC008ADAAC008ADAAC008BDAAD0087D8AA0086D7A90082D6A6007FD4A40076CF
      9C0071CD9800AAEBC60086D7A90049A471008ADAAC008ADAAC008ADAAC008ADA
      AC008ADAAC008ADAAC008ADAAC008ADAAC008ADAAC008ADAAC008ADAAC008ADA
      AC008ADAAC008ADAAC008ADAAC008ADAAC0099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710094DFB50094DFB50094DFB50094DF
      B50094DFB50094DFB50095E0B60094DFB50094DFB5008FDCB0008ADAAC0082D6
      A60076CF9C008FDCB000ADECC90049A4710094DFB50094DFB50094DFB50094DF
      B50094DFB50094DFB50094DFB50094DFB50094DFB50094DFB50094DFB50094DF
      B50094DFB50094DFB50094DFB50094DFB50099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90097E0B60097E0B60097E0B60091DEB2008BDA
      AD007FD4A4007BD2A000C6F9DC0049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90097E0B6008FDC
      B00082D6A60076CF9C00CDFDE20049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90097E0B60094DF
      B50086D7A9007AD2A000CDFDE20049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CFFFE40049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90097E0B60094DF
      B50087D8AA007AD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007ED3A200D2FFE60049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC0087D8AA00CDFDE20049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90097E0
      B6008FDCB000A5E8C200BEF5D60049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B900A2E7BF00A2E7BF00A2E7BF00A2E7
      BF00A2E7BF00A2E7BF00A2E7BF00A2E7BF00A2E7BF00A2E7BF00A5E8C200A5E8
      C200A2E7BF00CFFFE4009CE3BA0049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B900C2F8DA00C2F8DA00C2F8DA00C2F8
      DA00C2F8DA00C2F8DA00C2F8DA00C2F8DA00C2F8DA00C2F8DA00C7FBDE00D3FF
      E700E8FFF800BDF4D4004AA572000000000099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4FF
      F400AAEBC6004AA5720049A471000000000099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90049A4710049A4710049A4710049A4
      710049A4710049A4710049A4710049A4710049A4710049A4710049A4710049A4
      710049A4710000000000000000000000000099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90094DF
      B5008ADAAC007BD2A000CEFDE30049A4710099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30049A47100FFFFFF00C2F8DA00A2E7
      BF0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30049A47100FFFFFF00C3F8DA00A5E8
      C20099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30049A47100FFFFFF00C6F9DC00A5E8
      C2009BE3BA0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30049A47100FFFFFF00CBFCE000A6E9
      C3009BE3BA0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30049A47100FFFFFF00DAFFEC00B1EF
      CB00A0E6BE0099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30049A47100EFFFFC00F0FFFD00C2F8
      DA00A8E9C500A0E6BE009BE3BA009BE3BA0099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2B90099E2
      B90099E2B90099E2B90099E2B90099E2B9002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30049A47100B6F1CF00FFFFFF00DFFF
      F000C2F8DA00B1EFCB00A6E9C300A5E8C200A2E7BF00A2E7BF00A2E7BF00A2E7
      BF00A2E7BF00A2E7BF00A2E7BF00A2E7BF00A2E7BF00A2E7BF00A2E7BF00A2E7
      BF00A2E7BF00A2E7BF00A2E7BF00A2E7BF00A2E7BF00A2E7BF00A2E7BF00A2E7
      BF00A2E7BF00A2E7BF00A2E7BF00A2E7BF002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F300000000004AA57200D4FFE800FFFF
      FF00F0FFFD00DAFFEC00CBFCE000C6F9DC00C2F8DA00C2F8DA00C2F8DA00C2F8
      DA00C2F8DA00C2F8DA00C2F8DA00C2F8DA00C2F8DA00C2F8DA00C2F8DA00C2F8
      DA00C2F8DA00C2F8DA00C2F8DA00C2F8DA00C2F8DA00C2F8DA00C2F8DA00C2F8
      DA00C2F8DA00C2F8DA00C2F8DA00C2F8DA002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F3000000000049A471004AA57200B6F1
      CF00EFFFFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30000000000000000000000000049A4
      710049A4710049A4710049A4710049A4710049A4710049A4710049A4710049A4
      710049A4710049A4710049A4710049A4710049A4710049A4710049A4710049A4
      710049A4710049A4710049A4710049A4710049A4710049A4710049A4710049A4
      710049A4710049A4710049A4710049A4710089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE002F99CE002F99CE002F99CE002F99
      CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99
      CE002F99CE000000000000000000000000002F99CE002F99CE002F99CE002F99
      CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99
      CE002F99CE002F99CE002F99CE002F99CE000000000000000000000000002F99
      CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99
      CE002F99CE002F99CE002F99CE002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE00C3EDFF00C3EDFF00C3EDFF00C3ED
      FF00C3EDFF00C3EDFF00C3EDFF00C2EDFF00C2EDFF00C2EDFF00B9E8FF009FDB
      F90076C6ED002F9ACF002F99CE0000000000C3EDFF00C3EDFF00C3EDFF00C3ED
      FF00C3EDFF00C3EDFF00C3EDFF00C3EDFF00C3EDFF00C3EDFF00C3EDFF00C3ED
      FF00C3EDFF00C3EDFF00C3EDFF00C3EDFF00000000002F99CE002F9ACF008DD1
      F400B1E4FD00C2EDFF00C7EFFF00C6EEFF00C3EDFF00C3EDFF00C3EDFF00C3ED
      FF00C3EDFF00C3EDFF00C3EDFF00C3EDFF0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0069BFEA0069BFEA0069BFEA0069BF
      EA0069BFEA0069BFEA0069BFEA0067BEEA0067BEEA0064BCE80069BFEA007EC9
      EF009CD9F80089D0F3002F9ACF000000000069BFEA0069BFEA0069BFEA0069BF
      EA0069BFEA0069BFEA0069BFEA0069BFEA0069BFEA0069BFEA0069BFEA0069BF
      EA0069BFEA0069BFEA0069BFEA0069BFEA00000000002F9ACF00B0E4FD00C6EE
      FF0096D6F60077C6ED006ABFEA0069BFEA0069BFEA0069BFEA0069BFEA0069BF
      EA0069BFEA0069BFEA0069BFEA0069BFEA0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0079C7EE0079C7EE0079C7EE0079C7
      EE0079C7EE0079C7EE007AC8EE0077C6ED0076C6ED0071C3EC006CC1EB0063BC
      E8005DB9E6009CD9F80076C6ED002F99CE0079C7EE0079C7EE0079C7EE0079C7
      EE0079C7EE0079C7EE0079C7EE0079C7EE0079C7EE0079C7EE0079C7EE0079C7
      EE0079C7EE0079C7EE0079C7EE0079C7EE002F99CE009DD9F800DFFCFF0093D5
      F5007EC9EF007AC8EE0079C7EE0079C7EE0079C7EE0079C7EE0079C7EE0079C7
      EE0079C7EE0079C7EE0079C7EE0079C7EE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0084CDF10084CDF10084CDF10084CD
      F10084CDF10084CDF10086CEF20084CDF10084CDF1007EC9EF0079C7EE0070C2
      EC0063BCE8007EC9EF009FDBF9002F99CE0084CDF10084CDF10084CDF10084CD
      F10084CDF10084CDF10084CDF10084CDF10084CDF10084CDF10084CDF10084CD
      F10084CDF10084CDF10084CDF10084CDF1002F99CE00DCFAFF00C9F1FF0094D5
      F50087CEF20086CEF20084CDF10084CDF10084CDF10084CDF10084CDF10084CD
      F10084CDF10084CDF10084CDF10084CDF10089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30087CEF20087CEF20087CEF20082CCF1007AC8
      EE006CC1EB0069BFEA00B9E8FF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F3002F99CE00F9FFFF00BCEAFF0094D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30087CEF2007EC9
      EF0071C3EC0063BCE800C2EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F3002F99CE00FFFFFF00B7E6FF0094D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30087CEF20084CD
      F10076C6ED0067BEEA00C2EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F3002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30087CEF20084CD
      F10077C6ED0067BEEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F3002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F3002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F3002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F3002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F3002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F3002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F3002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE0089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F3002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F300FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B002F99CE00FFFFFF00B5E6FF0093D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B002F99CE00FFFFFF00B7E6FF0094D5
      F50089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C3EDFF002F99CE00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B002F99CE00FFFFFF00B9E8FF0094D5
      F5008BD0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0069BFEA00C6EEFF002F99CE00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B002F99CE00FFFFFF00C0ECFF0097D7
      F6008BD0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE006ABFEA00C7EFFF002F99CE00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B002F99CE00FFFFFF00D0F4FF00A3DD
      FA0090D2F40089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30084CD
      F10079C7EE0077C6ED00C2EDFF002F99CE00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B002F99CE00E8FFFF00EAFFFF00B5E6
      FF009AD8F80090D2F4008BD0F3008BD0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0
      F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30089D0F30087CE
      F2007EC9EF0096D6F600B1E4FD002F99CE00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B002F99CE00A9DFFB00FFFFFF00D6F8
      FF00B5E6FF00A3DDFA0097D7F60094D5F50093D5F50093D5F50093D5F50093D5
      F50093D5F50093D5F50093D5F50093D5F50093D5F50093D5F50093D5F50093D5
      F50093D5F50093D5F50093D5F50093D5F50093D5F50093D5F50093D5F50093D5
      F50093D5F50093D5F50093D5F50093D5F50093D5F50093D5F50093D5F50093D5
      F50093D5F50093D5F50093D5F50093D5F50093D5F50093D5F50094D5F50094D5
      F50093D5F500C6EEFF008DD1F4002F99CE00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00000000002F9ACF00CAF1FF00FFFF
      FF00EAFFFF00D0F4FF00C0ECFF00B9E8FF00B5E6FF00B5E6FF00B5E6FF00B5E6
      FF00B5E6FF00B5E6FF00B5E6FF00B5E6FF00B5E6FF00B5E6FF00B5E6FF00B5E6
      FF00B5E6FF00B5E6FF00B5E6FF00B5E6FF00B5E6FF00B5E6FF00B5E6FF00B5E6
      FF00B5E6FF00B5E6FF00B5E6FF00B5E6FF00B5E6FF00B5E6FF00B5E6FF00B5E6
      FF00B5E6FF00B5E6FF00B5E6FF00B5E6FF00B5E6FF00B5E6FF00BCEAFF00C9F1
      FF00DFFCFF00B0E4FD002F9ACF0000000000FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00000000002F99CE002F9ACF00A9DF
      FB00E8FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9FFFF00DCFA
      FF009CD9F8002F9ACF002F99CE0000000000FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B000000000000000000000000002F99
      CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99
      CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99
      CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99
      CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99
      CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99CE002F99
      CE002F99CE00000000000000000000000000E47F0700E47F0700E47F0700E47F
      0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F
      0700E47F0700000000000000000000000000E47F0700E47F0700E47F0700E47F
      0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F
      0700E47F0700E47F0700E47F0700E47F0700000000000000000000000000E47F
      0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F
      0700E47F0700E47F0700E47F0700E47F0700E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FCCEA000FCCEA000FCCEA000FCCE
      A000FCCEA000FCCEA000FCCEA000FBCEA000FBCEA000FBCDA000FAC99600F8BD
      7D00F2A95300E4800800E47F070000000000FCCEA000FCCEA000FCCEA000FCCE
      A000FCCEA000FCCEA000FCCEA000FCCEA000FCCEA000FCCEA000FCCEA000FCCE
      A000FCCEA000FCCEA000FCCEA000FCCEA00000000000E47F0700E4800900F4B4
      6B00F9C79000FBCFA000FCD0A400FCCFA200FCCEA000FCCEA000FCCEA000FCCE
      A000FCCEA000FCCEA000FCCEA000FCCEA000E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00F8A33E00F8A33E00F8A33E00F8A3
      3E00F8A33E00F8A33E00F8A23E00F8A23D00F8A13C00F89E3A00F79E4000F8A8
      5600F9B87800F5B16600E480080000000000F8A33E00F8A33E00F8A33E00F8A3
      3E00F8A33E00F8A33E00F8A33E00F8A33E00F8A33E00F8A33E00F8A33E00F8A3
      3E00F8A33E00F8A33E00F8A33E00F8A33E0000000000E4800900F8C88E00FCD3
      A300FABB7000F8AA4E00F8A44000F8A33E00F8A33E00F8A33E00F8A33E00F8A3
      3E00F8A33E00F8A33E00F8A33E00F8A33E00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FCB54D00FCB54D00FCB54D00FCB5
      4D00FCB54D00FCB54D00FDB64D00FBB54C00FBB24A00FBAE4600FAA64000F89D
      3800F6963400F9B87800F2A95300E47F0700FCB54D00FCB54D00FCB54D00FCB5
      4D00FCB54D00FCB54D00FCB54D00FCB54D00FCB54D00FCB54D00FCB54D00FCB5
      4D00FCB54D00FCB54D00FCB54D00FCB54D00E47F0700F5BF7D00FEE1BC00FCC0
      6B00FBB85400FDB74E00FCB54D00FCB54D00FCB54D00FCB54D00FCB54D00FCB5
      4D00FCB54D00FCB54D00FCB54D00FCB54D00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FEC35700FEC35700FEC35700FEC3
      5700FEC35700FEC35700FFC35700FEC25700FEC15600FDBD5200FCB64D00FBAA
      4300F89D3800F8A85600F8BD7D00E47F0700FEC35700FEC35700FEC35700FEC3
      5700FEC35700FEC35700FEC35700FEC35700FEC35700FEC35700FEC35700FEC3
      5700FEC35700FEC35700FEC35700FEC35700E47F0700FCE1BB00FEDDA500FEC8
      6A00FEC35A00FFC35700FEC35700FEC35700FEC35700FEC35700FEC35700FEC3
      5700FEC35700FEC35700FEC35700FEC35700E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC65A00FFC55A00FFC55900FEC05500FDB6
      4D00FAA64000F79E4000FAC99600E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FEF1DB00FFDA9600FFCA
      6900FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC55900FDBD
      5200FBAE4600F89D3900FBCEA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98F00FFCC
      6900FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC65A00FEC1
      5600FBB24A00F8A03C00FBCEA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E500FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC65A00FEC2
      5700FBB54C00F8A23D00FCCEA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E500FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC2
      5700FCB54C00F8A23E00FCCEA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700E47F0700FFF6E600FFD98E00FFCB
      6800FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700E47F0700FFF7E600FFD98F00FFCC
      6900FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCFA100E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700E47F0700FFF7E600FFDA9200FFCC
      6A00FFC85D00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCFA200E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700E47F0700FFF8E900FFDC9900FFCE
      6E00FFC85E00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A44000FCD0A400E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700E47F0700FEF5E300FFE3AB00FFD1
      7900FFCA6300FFC75C00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC2
      5700FCB64D00F8AA4E00FBCFA000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700E47F0700FCE8C900FFEDC800FFD9
      8E00FFCE7000FFCA6300FFC85E00FFC85D00FFC75C00FFC75C00FFC75C00FFC7
      5C00FFC75C00FFC75C00FFC75C00FFC75C00FFC75C00FFC75C00FFC75C00FFC7
      5C00FFC75C00FFC75C00FFC75C00FFC75C00FFC75C00FFC75C00FFC75C00FFC7
      5C00FFC75C00FFC75C00FFC75C00FFC75C00FFC75C00FFC75C00FFC75C00FFC7
      5C00FFC75C00FFC75C00FFC75C00FFC75C00FFC75C00FFC75C00FFC75C00FEC3
      5A00FBB85400FABB7000F9C79000E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700E47F0700F6C78800FFF6E500FFE5
      B200FFD98E00FFD17900FFCE6E00FFCC6A00FFCB6800FFCB6800FFCB6800FFCB
      6800FFCB6800FFCB6800FFCB6800FFCB6800FFCB6800FFCB6800FFCB6800FFCB
      6800FFCB6800FFCB6800FFCB6800FFCB6800FFCB6800FFCB6800FFCB6800FFCB
      6800FFCB6800FFCB6800FFCB6800FFCB6800FFCB6800FFCB6800FFCB6800FFCB
      6800FFCB6800FFCB6800FFCB6800FFCB6800FFCB6800FFCB6800FFCB6900FEC8
      6A00FCC06B00FCD2A300F4B46B00E47F0700FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F070000000000E4800900FADAAB00FFF6
      E500FFEDC800FFE3AB00FFDC9900FFDA9200FFD98E00FFD98E00FFD98E00FFD9
      8E00FFD98E00FFD98E00FFD98E00FFD98E00FFD98E00FFD98E00FFD98E00FFD9
      8E00FFD98E00FFD98E00FFD98E00FFD98E00FFD98E00FFD98E00FFD98E00FFD9
      8E00FFD98E00FFD98E00FFD98E00FFD98E00FFD98E00FFD98E00FFD98E00FFD9
      8E00FFD98E00FFD98E00FFD98E00FFD98E00FFD98E00FFD98E00FFDA9600FEDD
      A500FEE1BC00F8C88E00E480090000000000FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F070000000000E47F0700E4800900F6C7
      8800FCE8C900FEF5E300FFF8E900FFF7E600FFF7E600FFF6E600FFF6E600FFF6
      E600FFF6E600FFF6E600FFF6E600FFF6E600FFF6E600FFF6E600FFF6E600FFF6
      E600FFF6E600FFF6E600FFF6E600FFF6E600FFF6E600FFF6E600FFF6E600FFF6
      E600FFF6E600FFF6E600FFF6E600FFF6E600FFF6E600FFF6E600FFF6E600FFF6
      E600FFF6E600FFF6E600FFF6E600FFF6E500FFF6E500FFF6E600FEF1DB00FCE1
      BB00F5BE7C00E4800900E47F070000000000FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700000000000000000000000000E47F
      0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F
      0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F
      0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F
      0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F
      0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F0700E47F
      0700E47F0700000000000000000000000000FFC75B00FFC75B00FFC75B00FFC7
      5B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FFC75B00FEC3
      5700FCB54D00F8A33E00FCCEA000E47F0700424D3E000000000000003E000000
      2800000040000000C00000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E000000000000000800000000000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000070000000000000001
      0000000000000001000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000100000000
      00000001000000000000000700000000E0000000000000008000000000000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000000000008000000000000000E00000000000000700000000000000010000
      0000000000010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000000000
      0001000000000000000700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      000000008000000000000000E0000000000000070000E0000000000100008000
      0000000100008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000001
      00008000000000010000E0000000000700070000E00000000001000080000000
      0001000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000000000010000
      8000000000010000E00000000007000000000000000000000000000000000000
      000000000000}
  end
  object srEventStyles: TcxStyleRepository
    Left = 576
    Top = 496
    PixelsPerInch = 96
    object stEventStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 16762715
    end
    object stEventStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 9031923
    end
    object stEventStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = 10085049
    end
    object stEventStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = 10855935
    end
    object stRed: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object stCustomDrawContainer: TcxStyle
      AssignedValues = [svColor]
      Color = 14411476
    end
    object stCustomDrawSelectedContainer: TcxStyle
      AssignedValues = [svColor]
      Color = 15659248
    end
    object stCustomDrawVSeparator: TcxStyle
      AssignedValues = [svBitmap]
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000008000000200000000100
        1800000000000003000000000000000000000000000000000000E4B088DCA375
        FFECB3FFC380CB7B52CB7851B77148E4B088E4B088DCA375FFECB3FFE1C0FFD7
        B8FFA96FB77148E4B088E4B088DCA375FFECB3FFC380FFAF70FFA96FB77148E4
        B088E4B088DCA375FFECB3FFC380FFAF70FFA96FB77148E4B088E4B088DCA375
        FFECB3FFC380CB7B52CB7851B77148E4B088E4B088DCA375FFECB3FFE1C0FFD7
        B8FFA96FB77148E4B088E4B088DCA375FFECB3FFC380FFAF70FFA96FB77148E4
        B088E4B088DCA375FFECB3FFC380FFAF70FFA96FB77148E4B088E4B088DCA375
        FFECB3FFC380CB7B52CB7851B77148E4B088E4B088DCA375FFECB3FFE1C0FFD7
        B8FFA96FB77148E4B088E4B088DCA375FFECB3FFC380FFAF70FFA96FB77148E4
        B088E4B088DCA375FFECB3FFC380FFAF70FFA96FB77148E4B088E4B088DCA375
        FFECB3FFC380CB7B52CB7851B77148E4B088E4B088DCA375FFECB3FFE1C0FFD7
        B8FFA96FB77148E4B088E4B088DCA375FFECB3FFC380FFAF70FFA96FB77148E4
        B088E4B088DCA375FFECB3FFC380FFAF70FFA96FB77148E4B088E4B088DCA375
        FFECB3FFC380CB7B52CB7851B77148E4B088E4B088DCA375FFECB3FFE1C0FFD7
        B8FFA96FB77148E4B088E4B088DCA375FFECB3FFC380FFAF70FFA96FB77148E4
        B088E4B088DCA375FFECB3FFC380FFAF70FFA96FB77148E4B088E4B088DCA375
        FFECB3FFC380CB7B52CB7851B77148E4B088E4B088DCA375FFECB3FFE1C0FFD7
        B8FFA96FB77148E4B088E4B088DCA375FFECB3FFC380FFAF70FFA96FB77148E4
        B088E4B088DCA375FFECB3FFC380FFAF70FFA96FB77148E4B088E4B088DCA375
        FFECB3FFC380CB7B52CB7851B77148E4B088E4B088DCA375FFECB3FFE1C0FFD7
        B8FFA96FB77148E4B088E4B088DCA375FFECB3FFC380FFAF70FFA96FB77148E4
        B088E4B088DCA375FFECB3FFC380FFAF70FFA96FB77148E4B088E4B088DCA375
        FFECB3FFC380CB7B52CB7851B77148E4B088E4B088DCA375FFECB3FFE1C0FFD7
        B8FFA96FB77148E4B088E4B088DCA375FFECB3FFC380FFAF70FFA96FB77148E4
        B088E4B088DCA375FFECB3FFC380FFAF70FFA96FB77148E4B088}
    end
    object stCustomDrawHSeparator: TcxStyle
      AssignedValues = [svColor]
      Color = 12022088
    end
  end
  object imgParts: TImageList
    Height = 8
    Width = 8
    Left = 545
    Top = 457
    Bitmap = {
      494C01011B001D00040008000800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000020000000380000000100200000000000001C
      0000000000000000000000000000000000002182FF002182FF002182FF002182
      FF002182FF002182FF002182FF002182FF008AE2FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF000000000000000000000000000000
      0000000000000000000000000000000000006EC9FF006EC9FF006EC9FF006EC9
      FF006EC9FF006EC9FF006EC9FF006EC9FF008DE4FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF000000000000000000000000000000
      00000000000000000000000000000000000079D2FF003FBFFF003FBFFF003FBF
      FF003FBFFF003FBFFF003FBFFF003FBFFF008DE4FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF000000000000000000000000000000
      0000000000000000000000000000000000007ED7FF0046C6FF0046C6FF0046C6
      FF0046C6FF0046C6FF0046C6FF0046C6FF008DE4FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF000000000000000000000000000000
      00000000000000000000000000000000000082DBFF004CCCFF004CCCFF004CCC
      FF004CCCFF004CCCFF004CCCFF004CCCFF008DE4FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF000000000000000000000000000000
      00000000000000000000000000000000000086DFFF0052D1FF0052D1FF0052D1
      FF0052D1FF0052D1FF0052D1FF0052D1FF008DE4FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF000000000000000000000000000000
      0000000000000000000000000000000000008AE2FF0057D6FF0057D6FF0057D6
      FF0057D6FF0057D6FF0057D6FF0057D6FF0094E7FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF000000000000000000000000000000
      0000000000000000000000000000000000008DE4FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF009DEAFF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF000000000000000000000000000000
      0000000000000000000000000000000000005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF008DE4FF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF008AE2FF002182FF002182FF002182FF002182
      FF002182FF002182FF002182FF002182FF002182FF002182FF002182FF002182
      FF002182FF002182FF002182FF002182FF0066DCFF0066DCFF0066DCFF0066DC
      FF0066DCFF0066DCFF0066DCFF0094E7FF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF008DE4FF006EC9FF006EC9FF006EC9FF006EC9
      FF006EC9FF006EC9FF006EC9FF006EC9FF006EC9FF006EC9FF006EC9FF006EC9
      FF006EC9FF006EC9FF006EC9FF006EC9FF0073E1FF0073E1FF0073E1FF0073E1
      FF0073E1FF0073E1FF0073E1FF009DEAFF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF008DE4FF003FBFFF003FBFFF003FBFFF003FBF
      FF003FBFFF003FBFFF003FBFFF0079D2FF003FBFFF003FBFFF003FBFFF003FBF
      FF003FBFFF003FBFFF003FBFFF003FBFFF0085E6FF0085E6FF0085E6FF0085E6
      FF0085E6FF0085E6FF0085E6FF00AAEEFF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF008DE4FF0046C6FF0046C6FF0046C6FF0046C6
      FF0046C6FF0046C6FF0046C6FF007ED7FF0046C6FF0046C6FF0046C6FF0046C6
      FF0046C6FF0046C6FF0046C6FF0046C6FF00A3F0FF00A3F0FF00A3F0FF00A3F0
      FF00A3F0FF00A3F0FF00A3F0FF00BFF5FF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF008DE4FF004CCCFF004CCCFF004CCCFF004CCC
      FF004CCCFF004CCCFF004CCCFF0082DBFF004CCCFF004CCCFF004CCCFF004CCC
      FF004CCCFF004CCCFF004CCCFF004CCCFF00C2F9FF00C2F9FF00C2F9FF00C2F9
      FF00C2F9FF00C2F9FF00C2F9FF00D4FBFF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF008DE4FF0052D1FF0052D1FF0052D1FF0052D1
      FF0052D1FF0052D1FF0052D1FF0086DFFF0052D1FF0052D1FF0052D1FF0052D1
      FF0052D1FF0052D1FF0052D1FF0052D1FF00DFFFFF00DFFFFF00DFFFFF00DFFF
      FF00DFFFFF00DFFFFF00DFFFFF00E9FFFF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF0094E7FF0057D6FF0057D6FF0057D6FF0057D6
      FF0057D6FF0057D6FF0057D6FF008AE2FF0057D6FF0057D6FF0057D6FF0057D6
      FF0057D6FF0057D6FF0057D6FF0057D6FF00F8FFFF00F8FFFF00F8FFFF00F8FF
      FF00F8FFFF00F8FFFF00F8FFFF00F8FFFF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF009DEAFF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF008DE4FF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF00FFFFE000FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC3008DE4FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9FF005BD9
      FF005BD9FF005BD9FF005BD9FF005BD9FF00FFFFE000FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC30094E7FF0066DCFF0066DCFF0066DC
      FF0066DCFF0066DCFF0066DCFF0066DCFF0066DCFF0066DCFF0066DCFF0066DC
      FF0066DCFF0066DCFF0066DCFF0066DCFF00FFFFE000FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC3009DEAFF0073E1FF0073E1FF0073E1
      FF0073E1FF0073E1FF0073E1FF0073E1FF0073E1FF0073E1FF0073E1FF0073E1
      FF0073E1FF0073E1FF0073E1FF0073E1FF00FFFFE000FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300AAEEFF0085E6FF0085E6FF0085E6
      FF0085E6FF0085E6FF0085E6FF0085E6FF0085E6FF0085E6FF0085E6FF0085E6
      FF0085E6FF0085E6FF0085E6FF0085E6FF00FFFFE000FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300BFF5FF00A3F0FF00A3F0FF00A3F0
      FF00A3F0FF00A3F0FF00A3F0FF00A3F0FF00A3F0FF00A3F0FF00A3F0FF00A3F0
      FF00A3F0FF00A3F0FF00A3F0FF00A3F0FF00FFFFE000FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300D4FBFF00C2F9FF00C2F9FF00C2F9
      FF00C2F9FF00C2F9FF00C2F9FF00C2F9FF00C2F9FF00C2F9FF00C2F9FF00C2F9
      FF00C2F9FF00C2F9FF00C2F9FF00C2F9FF00FFFFE000FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300E9FFFF00DFFFFF00DFFFFF00DFFF
      FF00DFFFFF00DFFFFF00DFFFFF00DFFFFF00DFFFFF00DFFFFF00DFFFFF00DFFF
      FF00DFFFFF00DFFFFF00DFFFFF00DFFFFF00FFFFE000FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300F8FFFF00F8FFFF00F8FFFF00F8FF
      FF00F8FFFF00F8FFFF00F8FFFF00F8FFFF00F8FFFF00F8FFFF00F8FFFF00F8FF
      FF00F8FFFF00F8FFFF00F8FFFF00F8FFFF00FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FFFFE000CDBD8800CDBD8800CDBD8800CDBD
      8800CDBD8800CDBD8800CDBD8800CDBD8800CDBD8800CDBD8800CDBD8800CDBD
      8800CDBD8800CDBD8800CDBD8800CDBD8800CDBD8800CDBD8800CDBD8800CDBD
      8800CDBD8800CDBD8800CDBD8800CDBD8800FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FFFFE000FAF2D100FAF2D100FAF2D100FAF2
      D100FAF2D100FAF2D100FAF2D100FAF2D100FAF2D100FAF2D100FAF2D100FAF2
      D100FAF2D100FAF2D100FAF2D100FAF2D100FAF2D100FAF2D100FAF2D100FAF2
      D100FAF2D100FAF2D100FAF2D100FAF2D100FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FFFFE000ECDDAD00ECDDAD00ECDDAD00ECDD
      AD00ECDDAD00ECDDAD00ECDDAD00FBF2D200ECDDAD00ECDDAD00ECDDAD00ECDD
      AD00ECDDAD00ECDDAD00ECDDAD00ECDDAD00FBF2D200ECDDAD00ECDDAD00ECDD
      AD00ECDDAD00ECDDAD00ECDDAD00ECDDAD00FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FFFFE000F0E2B600F0E2B600F0E2B600F0E2
      B600F0E2B600F0E2B600F0E2B600FFF7D700F0E2B600F0E2B600F0E2B600F0E2
      B600F0E2B600F0E2B600F0E2B600F0E2B600FFF7D700F0E2B600F0E2B600F0E2
      B600F0E2B600F0E2B600F0E2B600F0E2B600FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FFFFE000F6E8BF00F6E8BF00F6E8BF00F6E8
      BF00F6E8BF00F6E8BF00F6E8BF00FFFDDD00F6E8BF00F6E8BF00F6E8BF00F6E8
      BF00F6E8BF00F6E8BF00F6E8BF00F6E8BF00FFFDDD00F6E8BF00F6E8BF00F6E8
      BF00F6E8BF00F6E8BF00F6E8BF00F6E8BF00FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FFFFE000FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FFFFE000FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FFFFE000FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FFFFE000FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FFFFE000FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FFFFE000FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FFFFE000FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FFFFE000FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FFFFE000FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FFFFE000FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FFFFE000FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FFFFE000FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FFFFE000FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FFFFE000FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FFFFE000FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FFFFE000FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FFFFE000FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FFFFE000FDF1C300FDF1C300FDF1
      C300FDF1C300FDF1C300FDF1C300FDF1C300FDF1C300FDF1C300FDF1C300FDF1
      C300FDF1C300FDF1C300FDF1C300FDF1C300FDF1C300FDF1C300FDF1C300FDF1
      C300FDF1C300FDF1C300FDF1C300FFFFE000FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FFFFE600FFF6CB00FFF6CB00FFF6
      CB00FFF6CB00FFF6CB00FFF6CB00FFF6CB00FFF6CB00FFF6CB00FFF6CB00FFF6
      CB00FFF6CB00FFF6CB00FFF6CB00FFF6CB00FFF6CB00FFF6CB00FFF6CB00FFF6
      CB00FFF6CB00FFF6CB00FFF6CB00FFFFE600FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FFFFEB00FFFED200FFFED200FFFE
      D200FFFED200FFFED200FFFED200FFFED200FFFED200FFFED200FFFED200FFFE
      D200FFFED200FFFED200FFFED200FFFED200FFFED200FFFED200FFFED200FFFE
      D200FFFED200FFFED200FFFED200FFFFEB00FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FFFFF400FFFFF400FFFFF400FFFF
      F400FFFFF400FFFFF400FFFFF400FFFFF400FFFFF400FFFFF400FFFFF400FFFF
      F400FFFFF400FFFFF400FFFFF400FFFFF400FFFFF400FFFFF400FFFFF400FFFF
      F400FFFFF400FFFFF400FFFFF400FFFFF400CDBD8800CDBD8800CDBD8800CDBD
      880000000000000000000000000000000000CDBD8800CDBD8800CDBD8800CDBD
      8800CDBD8800CDBD8800CDBD8800CDBD88000000000000000000000000000000
      0000CDBD8800CDBD8800CDBD8800CDBD8800CDBD8800FFFFE000FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FAF2D100FAF2D100FAF2D100FAF2
      D100CDBD8800CDBD88000000000000000000FAF2D100FAF2D100FAF2D100FAF2
      D100FAF2D100FAF2D100FAF2D100FAF2D1000000000000000000CDBD8800CDBD
      8800FAF2D100FAF2D100FAF2D100FAF2D100CDBD8800FFFFE000FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300ECDDAD00ECDDAD00ECDDAD00ECDD
      AD00FBF2D200FBF2D200CDBD880000000000ECDDAD00ECDDAD00ECDDAD00ECDD
      AD00ECDDAD00ECDDAD00ECDDAD00ECDDAD0000000000CDBD8800FBF2D200FBF2
      D200ECDDAD00ECDDAD00ECDDAD00ECDDAD00CDBD8800FFFFE000FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300F0E2B600F0E2B600F0E2B600F0E2
      B600F0E2B600FFF7D700CDBD880000000000F0E2B600F0E2B600F0E2B600F0E2
      B600F0E2B600F0E2B600F0E2B600F0E2B60000000000CDBD8800FFF7D700F0E2
      B600F0E2B600F0E2B600F0E2B600F0E2B600CDBD8800FFFFE000FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300F6E8BF00F6E8BF00F6E8BF00F6E8
      BF00F6E8BF00F6E8BF00FFFDDD00CDBD8800F6E8BF00F6E8BF00F6E8BF00F6E8
      BF00F6E8BF00F6E8BF00F6E8BF00F6E8BF00CDBD8800FFFDDD00F6E8BF00F6E8
      BF00F6E8BF00F6E8BF00F6E8BF00F6E8BF00CDBD8800FFFFE000FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FFFFE000CDBD8800FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300CDBD8800FFFFE000FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300CDBD8800FFFFE000FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FFFFE000CDBD8800FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300CDBD8800FFFFE000FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300CDBD8800FFFFE000FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FFFFE000CDBD8800FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300CDBD8800FFFFE000FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300CDBD8800FFFFE000FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300CDBD8800FFFFE000FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FFFFE000CDBD8800FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FFFFE000CDBD8800CDBD8800FFFFE000FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FFFFE000CDBD8800FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FFFFE000CDBD8800CDBD8800FFFFE000FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FFFFE000CDBD8800FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FFFFE000CDBD8800CDBD8800FFFFE000FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FFFFE000CDBD8800FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FFFFE000CDBD880000000000CDBD8800FFFFE000FDF1
      C300FDF1C300FDF1C300FDF1C300FDF1C300FDF1C300FDF1C300FDF1C300FDF1
      C300FDF1C300FDF1C300FDF1C300FDF1C300FDF1C300FDF1C300FDF1C300FDF1
      C300FDF1C300FFFFE000CDBD880000000000FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FFFFE000CDBD880000000000CDBD8800FFFFE600FFFF
      E600FFF6CB00FFF6CB00FFF6CB00FFF6CB00FFF6CB00FFF6CB00FFF6CB00FFF6
      CB00FFF6CB00FFF6CB00FFF6CB00FFF6CB00FFF6CB00FFF6CB00FFF6CB00FFF6
      CB00FFFFE600FFFFE600CDBD880000000000FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FFFFE000CDBD88000000000000000000CDBD8800CDBD
      8800FFFFEB00FFFFEB00FFFFEB00FFFFEB00FFFFEB00FFFFEB00FFFFEB00FFFF
      EB00FFFFEB00FFFFEB00FFFFEB00FFFFEB00FFFFEB00FFFFEB00FFFFEB00FFFF
      EB00CDBD8800CDBD88000000000000000000FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FFFFE000CDBD88000000000000000000000000000000
      0000CDBD8800CDBD8800CDBD8800CDBD8800CDBD8800CDBD8800CDBD8800CDBD
      8800CDBD8800CDBD8800CDBD8800CDBD8800CDBD8800CDBD8800CDBD8800CDBD
      880000000000000000000000000000000000FDEEC300FDEEC300FDEEC300FDEE
      C300FDEEC300FDEEC300FFFFE000CDBD8800424D3E000000000000003E000000
      2800000020000000380000000100010000000000E00000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000F00F0000300C0000100800001008000
      0000000000000000000000000000000000000000000000000000000000000000
      8000010080000100C0000300F0000F0000000000000000000000000000000000
      000000000000}
  end
  object cxStylesRepository: TcxStyleRepository
    Left = 416
    Top = 528
    PixelsPerInch = 96
    object stEvents: TcxStyle
      AssignedValues = [svBitmap, svColor, svFont, svTextColor]
      Color = 13236983
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      TextColor = clPurple
    end
    object stHeaders: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15655131
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      TextColor = 2894934
    end
    object stContent: TcxStyle
      AssignedValues = [svBitmap]
      Bitmap.Data = {
        76200000424D7620000000000000760000002800000080000000800000000100
        0400000000000020000000000000000000001000000010000000E3E3E300E5E5
        E500F9F9F900F6F6F600E7E7E700F8F8F800F7F7F700EBEBEB00F1F1F100ECF3
        F300000000000000000000000000000000000000000000000000531756666817
        5666665401556660060033855555533005000700777777871043555555555555
        5555301035666663040555555913566006003355317563300100011866666818
        5666662418566600600330111111330010030010011111111111111111111111
        1111107038566663050426666691856600600334118666330010004566666811
        3566666541356006003301788883300800333008008888888888888888888888
        8888805031856663060412555399185660060033117566633004200666665810
        1356666654130060033541856633006003363300600666666666666666666666
        6666606034185663060544255239918566006003317666663300060066666311
        4135666665400500336654135330060033666330060066666666666666666666
        6666606035418563060654125523991856600600338566663330006006666813
        5913566666001003366665413300600336666633006006666666666666666666
        6666606036811853060665412552399185660060033566668133300600666845
        5591356550030033666666533006603366666663300600666666666666666666
        6666606035144183060666541255239918566066003366663183330060066815
        5559185500500333566666330035600336666666330060066666666666666666
        6666606033333333060666654125523991856066800336668175533005005715
        5555911001003301356663300400070033777777733007000000000000000000
        0000007000000000050000000000000000000055710033658175113300100112
        9555590040033994135633006000004003344444443300410011111111100044
        4444444473955559185666666544255238911110007003363101999330090093
        4955500500335556913330060054000500335555555330000000000000000000
        0000000000000000000000000000000000000000300500338119222233005003
        6635505003355563393300600665440050033633335933333333333333333333
        3333333333333333333333333333333333333333330060033452333333300900
        6653505033993333333005006666544005003399999325554455666666347363
        6659325555388895869185666666541255237699533006003333555555330030
        0596905035594959330010066666654400500336658555344366666655475536
        3396732555534469866918566666654125523356543300600335555555533005
        0066405035559933300900356666665440050033563555445666666634733363
        3366443255559969866544566666658185552395217330060033333333333300
        3005709035555653003009135666666544005003399557456666666547539633
        3336448325555669863713566666534755555239517633008003335555555330
        0300809035555563055055913566666654400500334544566666655445555533
        3336993832555569559135666665317596555523248663300400033999999933
        0090005035555553033000000000666665440050033475666666634733333853
        3336955383255556581356666663173666655559407566330010003344444443
        3001455039555553055555559130066666544005003333333333333333333333
        3333333333333333333333333333333333333333333333330114200332222222
        3300005034955553050000000003006666654400500000000000000000000000
        0000000000000000000000000000000000000000000000000172060033666666
        6333304039965553050333333300300666665440075666666531755555555963
        3336955556993371356666653475633333337135818666658100006003366666
        6666304036553653050355555330030066666311000000000000000000000000
        0000005000000000060000000000000000000000000000000005600600336666
        6666305035335653050355555633003006665814566666653185555655555969
        6336905033333333060666317353333335715565817566668175660060033666
        6666306034533333060333699933300300653145666666531933333365555963
        9636905035371363060653175936333337136666318666663186333003003333
        5566306034453333050366888888330030031455666665819333336955555966
        3966905035813563060631788888633571356666817566668173111100100331
        1856306035473333050399366663933008004566666653183333369335555963
        6396905037136663060317566663963713666665818666668111999990090033
        4135306035143333060389666666393300100666666531753333633635555969
        3636905031356663050173366665337135666665817566663119936653005003
        3333306032483333030333339936639330050066665311336336335335555966
        9366903033566663030039889993371356666653107566658186666353500300
        0000006035143333090000033663663533006066653141459999356935555966
        9959609035666663007003996563713666666531018666663459656953550059
        4584566032499993049656003356365443306066531453445555555555555555
        5555201035333333300200555527135666665314407566668139656353555000
        0000006035443333030000600335654456306065314566541444444444444444
        4444100031111111330040044414366666653185548666668139965653555399
        3384506035495553060990060033544556306053145666654444444444444444
        4444404033444444433004004443566666531755217566663138496653555347
        3294506032485553050555005003445666306031136666655555555555555555
        5555505003355555553300500556666665317355218666665412599653555973
        2541506035147333030333300303456666305044185666666666666666666666
        6666600600336666666330060066666653173555548666666544426353556832
        5594506032493553050555550503566666303082813566666666666666666666
        6666660060033666666633006006666531835559517566666654445653668325
        5571506035143553050555550403666666301039591356666666666666666666
        6666666006003366666663300600665317555593591856666665544257883255
        5584506032493553050555550403666665309095529135666666666666666666
        6666666600600336666666330060053195555935559185666666654124732555
        5691506032483553050555540303666653303065529918555555555555555555
        5555555550050033555555533005004755559965555918566666665419999999
        9914506035117993090999440603666531309055529691111111111111111111
        1111111111001003311111113300100355569965555591856666666540111111
        1114506032401113010111450603665318306055529669999999999994001444
        4444100199900900339999999330090055656632555569185666666658888888
        8711506035117883080888560603653193305055529666663363335653413666
        6665317533360050033566666533005006583632555566918566666666666666
        6274506032442663060666660603581995306055529699935330006559135666
        6663473333369005003366635653300500786632555599991856666666666666
        6241506032415663060666660603319359306055529655696500500571366666
        6551753333369200500336356555330050076632555555699185566666666666
        6244506035445663060666660603199539306055529633396005650013566666
        5317396555569250050033565555533009006632555533396918856666666666
        6574506032445663060666660503895366306055529633390050007005666665
        3473389999969255004003355553713300900632555533393691182555555555
        5511506035113553050555550303953633306055529633300500300700666653
        1753663333369255503300335537184330080032555533393599000000000000
        0000006032417773070777770103536333303055529633005003330050066631
        7369336600000000005560033574552433006000000000000000594444444444
        4401566035104443040444440903563333309055529630050033533006006544
        5336988008869255599995003343666543300632555533359325000000000000
        0000000032472663060666660403666666306055529900600335523300600318
        3333690090000000000000900335666654330032500000000000333333333333
        3333333332473553090999990903999999309055529009003355554330060013
        3333300300333333333330070033666665433002503333333333635563555563
        3371566665173553050555550503555555306055520060033555654733006003
        3333003003369255555533003003366666573300500335555555336653555266
        3394566662483553050555550503555555305055500500335555531753300800
        3330030033669255555553300600336666654330050033555556399963255556
        6371566665143553050555550503555555305005004003344444411756330040
        0300300339669255555374330060033666665733005003355563533339325555
        6984566662493553040444440403555555300600010033444444410756633008
        0006003366649655555745533006003366666543300300335693333335932555
        5991566662443653040444440403255555330055200336666666631756663300
        5940033999999666637436663300300336666654330060033569336999593255
        5584566665495573050555550503456636333055003366666666631756666330
        5500335222555555574556666330040033666665433003003369333333333333
        3333333333333333060666660603342663330050033666666633333756663300
        1003395555553333333333333333059003366666543300300333000000000000
        0000000000000000060666660600334563300500338666666330003356633001
        0033949555533000000000000000066900336666657330090000983366599993
        2594566666541756660666660060033433006003318566663300500336330010
        0335594955330074556666663175335660033666665433008663000000000000
        0000000000000000000666666006003330060033248666633005580033300300
        3341559493300400000000000000000009003366666543300656038959325559
        7361856666665413565533355600600300200335517566330010000003006003
        3627155933007005666665319333333300900336666654330065008593255559
        9939185666666541323111118560060004003355518663300100900700060033
        5662715330070066666653183533333350090033666665433003300932555266
        6696918566666654141799941856006660033555548533008003650056600337
        5666273300700666666531934966666698009003366666573300030055555596
        6399591856666665418936538185606600334255518330057059321056003317
        5666633007005666666319638896633333300600336666657330006005555586
        6396524135666666314593653713006003331455243300658009930060033318
        6666330000056666665442363893366666660090033666665433300900999999
        9999977113566666531733335370050033653149433006000000900700336317
        5663300700266666627004999999999999999001003344444113330080088888
        8888835541356666653173555600100336665344330060030010004003366811
        8533006501356666665401788888888888888800800338888888633006006666
        6666666531135666665317355003003366666553300600333002550033666310
        1330066604135666666541856666666666666660060033666666663300600000
        0000000000000000000000030050033356666633008003353300600336666811
        3300666605413566666654135666666666666666006003366666666330066666
        6666666665811356666653000500337135666330010033668330003366666543
        3003000606541356666665413566666666666666600600336666666633000000
        0000000000000000000000317003363713563300800336657133333666666333
        0090030606654135666666541356666666666666660060033666666663333333
        3333333333333333333330530033556371333005803366657186666666665330
        0500330202228113566666654136666666666666666006003366777777777777
        7777778777365371353300600333555637330052800336668182555555553300
        5003330404441001356666665417777777777777777700700337444444441009
        9999999995655537133006003317355563300400000033657014444444433009
        0033530909999994135666666540049999999999999990090033366666658198
        4955552379655523330060033531735533004004008003368114444444330070
        0335530509655555913566666654425553736393333366005003336666651459
        9965555238355233300300336653173330090033300500337135555553300500
        3365530506355556591356666665473555349933333665500700033665544595
        9966555523836333007003366665313300500599240060033425555533006003
        3636530505336665869135666666544555534699995655550030003363443569
        6596655552389330060033566666633005006566517006003355555330055033
        5395630505539959836913566666654455553956666555391006600333333333
        3333333333333300300337266666330030055665518600600335553300556035
        3366930505559939866991356666665445555395555555813500060000000000
        0000000000000009003313666663300730555566248660060033633006663033
        3356930505555659866969135666666544555539566539135660003475999633
        3335888355552390033135666633007580055556818566007003330090009033
        3336930305555565866483913566666654455553999381356666500000000000
        0000000000055200331366666330070009005539118666600100300400404034
        4447530605555556555555591356666665445555699913566666347355555953
        3335322383055003313566663300700300900571117566650010004004404034
        4441430503555555555555559135666666544555538135666666475555555353
        3335355280050033135666633007003330090048718666657002220022202032
        2225330509955555555555555913566666554455591356666655435555555353
        3335355200900331356666330070033333007005318566668100600666606036
        6666300500000000000000000000000000000000000000000004555555555356
        3335355003003313566663300700333333300300818666657180006666606036
        6666304455556625555555555539135666666510135666666507333935555359
        6335350030033135666633007003333333330060018666668136666666606036
        6666305000000000000000000000000000000000000000000405555693555353
        9635300200331356666330073033333357133006008566657185666666606036
        6666306033333333333333333333333333333333333333330705335663555355
        3965305003313666663300758003333371363300800666658182222222202032
        2566306034453339866966988889639135654135666665530503356353555353
        5335305033135666633007000300335715566330010066668114444444404033
        4356306035143339836999663363963913341356666663430303563653555359
        3535305031356666330070060060033135666633008006657149999999909003
        3185306035743339736399666666396391113566666654730303636653555356
        9366303033566663300700388006003356666653300600668426966635500900
        3318306032115336836639338836639654135666666541530305366353555356
        9833507035666663007008749900700336666531330060057159666335550060
        0334306035793336993663849393666381356666663411430606656953555359
        4336201035522523010053896330030033665314133006008423656935555009
        0033306032415999749366396356366913566666554135430909999999999999
        9999400034444443000999999941006003353193313300600159656935555900
        8003306035748883333333333333333333333333341356530909444444444444
        4444404034444443040444444443500600331835518330050059365335555940
        0900306035746663000000000000000000000000313566630404555555555555
        5555505035555553050555555525660060033355548533005003936535555904
        0080006032446663063999366363913566666630385666630505666666666666
        6666606036666663060666666666666003003355518563300304293635556943
        2004566035796553055550000000000000000040385666630606666666666666
        6666606036666663060666666666666500700339548566330501126335559735
        5500366032415653055550555591356666655040313566630606666666666666
        6666606036666663060666666666665310050033671356630603412635597355
        5530066035749553055550053813566666634030391356630606666666666666
        6666606036666663060666666666653173005003337135630606541259973555
        5591006035446253050005009135666665547090359135630606222222222222
        2222202032222223020222222222281755500900323713530606654424735555
        5681506032745253050300300356666663443030355913230202444444444444
        4444404034444443040444444444417555590050329371330606665413555555
        5374506035718553050330010066666654754030355591430404444491001444
        4114100034444443040444444444493555666050329637130606666541111111
        1101306032101113010333005006666544566030355569430404333368113555
        5555707033353553060563665995555556536050329663730506666658888888
        8714506035717883080383300600663443676030355566630303333637136666
        6653105033353553050936666655555565986050329688330306666665555555
        6241306032418553050355330060054456776030355588830306336371356666
        6634703033353553050366366555555653486050329633930105666666666666
        6574506035745663060366633006004363776030355533330609365713566666
        5547503033353553050339665555395539430050329633330703566666666666
        6541506035713663060366663300400639476030355533330603639135666665
        3473309039953553050096655553714396900500329633330301856666666666
        6241506032415663060366666330050093886030355533330603521756666663
        4733506036653553006006555557781455006003329633330507135666666666
        6574506035745663060366666333003005386030355533330306554866666554
        7599305035553553300600555374353440090033529633330903914444444444
        4401306032404443040344444143300600693030355533330305521756666314
        6336903033353552330030055745565300500335529633330305591111111111
        1101506035711113010331111439330030069030355533330605524866665813
        3333609033953552333003004136666004003355529953300205555555555555
        5311306035448553050033555549533003005030355659530505224756666845
        3333303003353555593300500356660050033355529933002005563665555963
        3381506032746253069003333996653300500030355965630505351756665815
        3333300300333555555330040066600600334555529330050055693355552963
        3394506035749253055500335555555330056930355365530502354866666342
        3333330030033555555533005006006003334455523300500556966632555695
        3341306032115253055550033555555533005330355655530503940756666815
        5333333009003355555573300600060033653445533005005563999956555239
        6334506035799553060006003355555553300330339999930909411866666815
        3633333300500335553743330066500336665544330060055639533356555523
        8681306032416653040400400332555555330030033444430404281756666815
        5999655550090033357455633065003366666533300400666639333336655552
        6984506035747933040440040033566666633002003322230202581756665814
        5599955555003003374366330050033356666633005005555639356666665555
        5594506035793393020222002003325555553300500336630606631856666310
        4559355555500500333563300500337135666330040033396639668888899555
        5571506032109413060666600600335663633330040033630606681756665801
        1455995555550050033633005003363913563300500453396634993666394355
        5534506035800133060666660060033266365633007003330606531866666817
        5445599655555004003330050033336391333006003443393569736666598835
        5571306036541853060666666006003326636633300600330606571756666818
        5544559996665700500300600333333699330060066344569353993885935383
        5534506036654133060666666600600335663632330060030505110756665818
        6654455949537430060005003333333593300500666554459835388859325239
        9691806036665413060555525660060033233632233006000401911756666818
        5665445596574556006650033355555633001006666653445833538593255569
        4839105036666543050411148566006003358632243300663109351756665817
        6665544553743566606500337833333330089035666665544593355932555566
        6696908036666653070199941856600600335632517330068109864866666318
        6666654194435666005003338836663300665003555555581458939955555696
        6399301036666663000596569185660060033532548633003408}
    end
    object stContentSelection: TcxStyle
      AssignedValues = [svColor]
      Color = 8562287
    end
    object stResources: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11075583
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = 8388672
    end
    object stGroupSeparator: TcxStyle
      AssignedValues = [svColor]
      Color = 15521725
    end
    object stContainer: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12154266
      TextColor = clMaroon
    end
    object stBackground: TcxStyle
      AssignedValues = [svColor]
      Color = clBackground
    end
    object stDateContent: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14545359
      TextColor = clBlue
    end
    object stVertSplitter: TcxStyle
      AssignedValues = [svBitmap]
      Bitmap.Data = {
        0E0F0000424D0E0F000000000000360000002800000032000000190000000100
        180000000000D80E0000120B0000120B00000000000000000000B0DCE8B0DCE8
        B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DC
        E8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE87B9AA21F32383B
        6069446F7A4876814A7883406A7499C0CAB0DCE8B0DCE8B0DCE8B0DCE8B0DCE8
        B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DC
        E8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE80000B0DCE8B0DCE8B0DCE8B0DCE8B0DC
        E8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0
        DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE87B9AA21F32383B5F68436E7947747F
        4874803E666F99C0CAB0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DC
        E8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0
        DCE8B0DCE8B0DCE80000B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0
        DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8
        B0DCE8B0DCE8B0DCE87B9AA21F3238395D66416A74436E79436D78395E6798BF
        C9B0DCE8AFDBE7AFDBE7AFDBE7AFDBE7AFDBE7AFDBE7B0DCE8B0DCE8B0DCE8B0
        DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8
        0000B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8
        B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DC
        E87B9AA21F323835575F3B616B3D646F3D636D35575F97BDC7ADD8E3ADD8E3AD
        D8E3ADD9E4ADD9E4AED9E5AFDAE6AFDBE7AFDBE7B0DCE8B0DCE8B0DCE8B0DCE8
        B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE80000B0DCE8B0DCE8
        B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DC
        E8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE87A99A11F313731
        5058375A633A5F693C616B35586090B5BEA4CDD9A4CDD9A4CDD9A5CED9A6D0DB
        A8D2DDAAD4E0ADD8E3AFDAE6AFDBE7B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DC
        E8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE80000B0DCE8B0DCE8B0DCE8B0DCE8B0DC
        E8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0
        DCE8B0DCE8B0DCE8B0DCE8B0DCE8AFDBE777959D1D2F35304E55385B643C636D
        4068723A5F6884A6AE96BBC596BCC697BDC798BEC899C0CA9DC4CFA2CAD5A8D2
        DDACD7E3AED9E5AFDBE7B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0
        DCE8B0DCE8B0DCE80000B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0
        DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8
        B0DCE8AFDBE7ADD9E4708C931B2B3133525A3D636D426C7746717D3E67707C9B
        A38EB2BB8EB2BB8FB3BC8FB3BC90B3BD92B7C199BFC99FC7D2A6D0DBABD6E2AE
        D9E5AFDBE7B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8
        0000B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8
        B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8AFDBE7AED9E5ACD7E3A7D1
        DC67818819292E375A62416B7546737F497782406A747FA0A894B9C393B8C292
        B7C191B5BF8EB2BB8DB1BB90B4BE96BBC59DC5CFA6CFDAACD7E3AFDAE6B0DCE8
        B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE80000B0DCE8B0DCE8
        B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DC
        E8B0DCE8B0DCE8B0DCE8AFDAE6ADD8E3A8D3DEA3CCD79BC1CC647D841A2A2F3A
        5E67436E794876814A7884416B758BAFB8A2CAD5A1C9D49FC6D19BC1CC94B9C4
        90B3BD8DB1BB90B3BD96BCC6A0C8D3A9D3DFAED9E5AFDBE7B0DCE8B0DCE8B0DC
        E8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE80000B0DCE8B0DCE8B0DCE8B0DCE8B0DC
        E8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8AFDBE7AF
        DAE6ABD6E2A6CFDA9EC6D096BBC590B4BE6A848B1C2D323B6069446F7A487682
        4A7884416B7595BBC4ACD7E3ABD6E2A9D3DFA5CED99FC7D298BEC892B6C08FB3
        BC91B5BF9AC0CBA4CDD9ACD7E3AFDBE7B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0
        DCE8B0DCE8B0DCE80000B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0
        DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8AFDBE7AED9E5AAD4E0A4CCD89BC1CC
        93B8C28FB3BC91B5BF728F971E30363B6069446F7A4876824A7884416B7598BF
        C9AFDBE7AFDAE6AED9E5ACD7E3A8D2DDA2CAD59AC0CB92B6C090B3BD95BAC5A0
        C8D3AAD5E1AFDAE6B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8
        0000B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8
        B0DCE8B0DCE8AFDBE7AED9E5A9D3DFA2CAD599BFC990B4BE8EB2BB92B7C19BC1
        CC78969E1F32383B6069446F7A4876824A7884416B7599C0CAB0DCE8B0DCE8AF
        DBE7AFDAE6ADD8E3A8D3DEA0C8D396BBC58FB3BC91B5BF9DC4CFA8D3DEAFDAE6
        B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE80000B0DCE8B0DCE8
        B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8AFDBE7AED9
        E5A9D3DFA2CAD598BEC890B4BE8EB2BB93B8C29CC3CEA5CED97B9AA21F32383B
        6069446F7A4876824A7884416B7599C0CAB0DCE8B0DCE8B0DCE8B0DCE8AFDAE6
        ACD7E3A4CDD999BFC98FB3BC90B4BE9BC2CDA8D2DDAED9E5B0DCE8B0DCE8B0DC
        E8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE80000B0DCE8B0DCE8B0DCE8B0DCE8B0DC
        E8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE84C6A71547982537B85A1C9D497BDC790
        B3BD8EB2BB94B9C39DC5CFA7D1DCADD8E37B9AA21F32383B6069446F7A487682
        4A7884416B7599C0CAB0DCE8B0DCE8B0DCE8B0DCE8AFDBE7ADD9E4A6CFDA99C0
        CA8FB3BC2C484E395E67426D77AED9E5B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0
        DCE8B0DCE8B0DCE80000B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0
        DCE837454A4F6A7160858F638A945E8791557B85476A738EB2BB94B9C39DC5CF
        A6D0DBADD8E3AFDBE77B9AA21F32383B6069446F7A4876824A7884416B7599C0
        CAB0DCE8B0DCE8B0DCE8B0DCE8AFDBE7ADD9E4A6D0DB18262A284148375B6441
        697447758249778244707BB0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8
        0000B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE845565B62838B
        6A8E975E80894646464646464646464646464646464646464646464646464646
        4646464646464646464646464646464646464646464646464646464646464646
        46464646464646464646464646464646464646464646464646464979844B7B87
        46737EB0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE80000B0DCE8B0DCE8
        B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8323A3B5A757C67858D6380870000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000002B464E4A788344707B3D636DB0DC
        E8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE80000B0DCE8B0DCE8B0DCE8B0DCE8B0DC
        E8B0DCE8B0DCE8323A3B59727868838A5461643131313939394242423E3E3E3A
        3A3A3D3D3D404040434343454545474847474747464647454645444445434444
        4243434242424141423D3E3E3A3B3A3737373333332E2E2F2A2A2B2525262020
        200E0E0F0101000000000C131544707B406872385C65B0DCE8B0DCE8B0DCE8B0
        DCE8B0DCE8B0DCE80000B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE82E
        3434546A70607A807580847474748E8E8E9E9E9EA3A3A3A5A5A5AEAFAFB9B9B9
        C2C2C3C9CACAD0D0D1D0D0D0CFCFD0CDCFCFCDCDCDCCCCCDCBCCCCCACBCBC8C8
        C8C0C0C0B7B7B8ACACADA0A1A19394948485857777776667684646462222220B
        0B0B090F103D636D395D66304F56B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8
        0000B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8363E40546A70
        61777C898D8E949494A5A5A5B6B6B6C4C4C4D2D2D2DFDFDFEBEBEBF5F5F5FDFD
        FDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFEFCFCFDF8F9F9EEEEEFE2E3E3D5
        D6D7C5C6C7B5B6B6A4A5A59395958282836B6B6C4B4B4C27272725383E34555E
        2C474EB0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE80000B0DCE8B0DCE8
        B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8272A2C333B3E495F654A6167465E
        6436484C29383DB0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE87B9AA21F32383B
        6069446F7A4876824A7884416B7599C0CAB0DCE8B0DCE8B0DCE8B0DCE8B0DCE8
        B0DCE8B0DCE8080C0E101A1D2842492B464D2C474E2034391A2A2FB0DCE8B0DC
        E8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE80000B0DCE8B0DCE8B0DCE8B0DCE8B0DC
        E8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8262C2E273031252E30B0DCE8B0DCE8B0
        DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE87B9AA21F32383B6069446F7A487682
        4A7884416B7599C0CAB0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DC
        E8B0DCE80B12140E181A101A1DB0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0
        DCE8B0DCE8B0DCE80000B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0
        DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8
        B0DCE8B0DCE8B0DCE87B9AA21F32383B6069446F7A4876824A7884416B7599C0
        CAB0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0
        DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8
        0000B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8
        B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DC
        E87B9AA21F32383B6069446F7A4876824A7884416B7599C0CAB0DCE8B0DCE8B0
        DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8
        B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE80000B0DCE8B0DCE8
        B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DC
        E8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE87B9AA21F32383B
        6069446F7A4876824A7884416B7599C0CAB0DCE8B0DCE8B0DCE8B0DCE8B0DCE8
        B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE8B0DC
        E8B0DCE8B0DCE8B0DCE8B0DCE8B0DCE80000}
    end
    object stTimeRuler: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15262941
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = 4210816
    end
  end
  object UnboundStorageTwo: TcxSchedulerStorage
    CustomFields = <
      item
        Name = 'SyncID'
      end>
    Reminders.Active = False
    Resources.Items = <>
    Left = 473
    Top = 497
  end
  object cxEditRepository1: TcxEditRepository
    Left = 497
    Top = 409
    object ComboBoxItem: TcxEditRepositoryComboBoxItem
      Properties.Items.Strings = (
        'John Hillsborough'
        'Jane Carmichael'
        'Sam Frankfurt'
        'Karen Holmes'
        'Bobbie Valentine'
        'Jennie Smithers'
        'Ricardo Menendez'
        'Frank Frankson'
        'Christa Christie'
        'Jimmie Jones'
        'Alfred Newman'
        'James Johnson'
        'Robert James'
        'June Alessandro'
        'Mildred Johansson'
        'Henry McAllister'
        'Michae Jeffers'
        'Scott Mathewson'
        'Mickey Alcorn'
        'Roger Michelson'
        'Leticia Ford')
    end
    object RichItem: TcxEditRepositoryRichItem
    end
  end
  object dxBarPopupMenu: TdxBarPopupMenu
    BarManager = dxBarManager
    ItemLinks = <>
    UseOwnFont = False
    Left = 409
    Top = 457
  end
  object AggregateStorage: TcxSchedulerAggregateStorage
    Tag = 2
    CustomFields = <
      item
        Name = 'SyncID'
      end
      item
        Name = 'SportID'
        ValueType = 'Integer'
      end>
    Resources.Images = imgResources
    Resources.Items = <
      item
        ImageIndex = 0
        Name = 'ESPN'
        ResourceID = 0
      end
      item
        ImageIndex = 1
        Name = 'EUROSPORT NEWS'
        ResourceID = 1
      end
      item
        ImageIndex = 2
        Name = 'FOX FOOTY'
        ResourceID = 2
      end
      item
        ImageIndex = 7
        Name = 'FOX SPORTS 1'
        ResourceID = 3
      end
      item
        ImageIndex = 3
        Name = 'FOX SPORTS 2'
        ResourceID = 4
      end
      item
        ImageIndex = 4
        Name = 'FUEL'
        ResourceID = 5
      end
      item
        ImageIndex = 5
        Name = 'MAIN EVENT'
        ResourceID = 6
      end
      item
        ImageIndex = 6
        Name = 'SKY RACING'
        ResourceID = 7
      end>
    Links = <>
    OnEventInserting = AggregateStorageEventInserting
    Left = 449
    Top = 529
  end
  object SchedulerHolidays: TcxSchedulerHolidays
    Locations = <
      item
        Name = 'France'
        Visible = True
        Holidays = <
          item
            Date = 39022.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 39387.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 39753.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 40118.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 40483.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 40848.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 41214.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 39032.000000000000000000
            Name = 'Armistice Day 1918'
          end
          item
            Date = 39397.000000000000000000
            Name = 'Armistice Day 1918'
          end
          item
            Date = 39763.000000000000000000
            Name = 'Armistice Day 1918'
          end
          item
            Date = 40128.000000000000000000
            Name = 'Armistice Day 1918'
          end
          item
            Date = 40493.000000000000000000
            Name = 'Armistice Day 1918'
          end
          item
            Date = 40858.000000000000000000
            Name = 'Armistice Day 1918'
          end
          item
            Date = 41224.000000000000000000
            Name = 'Armistice Day 1918'
          end
          item
            Date = 38862.000000000000000000
            Name = 'Ascension Day'
          end
          item
            Date = 39219.000000000000000000
            Name = 'Ascension Day'
          end
          item
            Date = 39569.000000000000000000
            Name = 'Ascension Day'
          end
          item
            Date = 39954.000000000000000000
            Name = 'Ascension Day'
          end
          item
            Date = 40311.000000000000000000
            Name = 'Ascension Day'
          end
          item
            Date = 40696.000000000000000000
            Name = 'Ascension Day'
          end
          item
            Date = 41046.000000000000000000
            Name = 'Ascension Day'
          end
          item
            Date = 38944.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 39309.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 39675.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 40040.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 40405.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 40770.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 41136.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 39076.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 39441.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 39807.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 40172.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 40537.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 40902.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 41268.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 38824.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 39181.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 39531.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 39916.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 40273.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 40658.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 41008.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 38718.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39083.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39448.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39814.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40179.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40544.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40909.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 38845.000000000000000000
            Name = 'Victory Day'
          end
          item
            Date = 39210.000000000000000000
            Name = 'Victory Day'
          end
          item
            Date = 39576.000000000000000000
            Name = 'Victory Day'
          end
          item
            Date = 39941.000000000000000000
            Name = 'Victory Day'
          end
          item
            Date = 40306.000000000000000000
            Name = 'Victory Day'
          end
          item
            Date = 40671.000000000000000000
            Name = 'Victory Day'
          end
          item
            Date = 41037.000000000000000000
            Name = 'Victory Day'
          end
          item
            Date = 38873.000000000000000000
            Name = 'Whit Monday'
          end
          item
            Date = 39230.000000000000000000
            Name = 'Whit Monday'
          end
          item
            Date = 39580.000000000000000000
            Name = 'Whit Monday'
          end
          item
            Date = 39965.000000000000000000
            Name = 'Whit Monday'
          end
          item
            Date = 40322.000000000000000000
            Name = 'Whit Monday'
          end
          item
            Date = 40707.000000000000000000
            Name = 'Whit Monday'
          end
          item
            Date = 41057.000000000000000000
            Name = 'Whit Monday'
          end
          item
            Date = 38838.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 39203.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 39569.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 39934.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 40299.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 40664.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 41030.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 38912.000000000000000000
            Name = 'Bastille Day'
          end
          item
            Date = 39277.000000000000000000
            Name = 'Bastille Day'
          end
          item
            Date = 39643.000000000000000000
            Name = 'Bastille Day'
          end
          item
            Date = 40008.000000000000000000
            Name = 'Bastille Day'
          end
          item
            Date = 40373.000000000000000000
            Name = 'Bastille Day'
          end
          item
            Date = 40738.000000000000000000
            Name = 'Bastille Day'
          end
          item
            Date = 41104.000000000000000000
            Name = 'Bastille Day'
          end>
      end
      item
        Name = 'Germany'
        Visible = True
        Holidays = <
          item
            Date = 39022.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 39387.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 39753.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 40118.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 40483.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 40848.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 41214.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 38862.000000000000000000
            Name = 'Ascension Day'
          end
          item
            Date = 39219.000000000000000000
            Name = 'Ascension Day'
          end
          item
            Date = 39569.000000000000000000
            Name = 'Ascension Day'
          end
          item
            Date = 39954.000000000000000000
            Name = 'Ascension Day'
          end
          item
            Date = 40311.000000000000000000
            Name = 'Ascension Day'
          end
          item
            Date = 40696.000000000000000000
            Name = 'Ascension Day'
          end
          item
            Date = 41046.000000000000000000
            Name = 'Ascension Day'
          end
          item
            Date = 38944.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 39309.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 39675.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 40040.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 40405.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 40770.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 41136.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 39077.000000000000000000
            Name = 'Boxing Day - St. Stephen'#39's Day'
          end
          item
            Date = 39442.000000000000000000
            Name = 'Boxing Day - St. Stephen'#39's Day'
          end
          item
            Date = 39808.000000000000000000
            Name = 'Boxing Day - St. Stephen'#39's Day'
          end
          item
            Date = 40173.000000000000000000
            Name = 'Boxing Day - St. Stephen'#39's Day'
          end
          item
            Date = 40538.000000000000000000
            Name = 'Boxing Day - St. Stephen'#39's Day'
          end
          item
            Date = 40903.000000000000000000
            Name = 'Boxing Day - St. Stephen'#39's Day'
          end
          item
            Date = 41269.000000000000000000
            Name = 'Boxing Day - St. Stephen'#39's Day'
          end
          item
            Date = 39076.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 39441.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 39807.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 40172.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 40537.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 40902.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 41268.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 38883.000000000000000000
            Name = 'Corpus Christi Day'
          end
          item
            Date = 39240.000000000000000000
            Name = 'Corpus Christi Day'
          end
          item
            Date = 39590.000000000000000000
            Name = 'Corpus Christi Day'
          end
          item
            Date = 39975.000000000000000000
            Name = 'Corpus Christi Day'
          end
          item
            Date = 40332.000000000000000000
            Name = 'Corpus Christi Day'
          end
          item
            Date = 40717.000000000000000000
            Name = 'Corpus Christi Day'
          end
          item
            Date = 41067.000000000000000000
            Name = 'Corpus Christi Day'
          end
          item
            Date = 38993.000000000000000000
            Name = 'Day of German Unity'
          end
          item
            Date = 39358.000000000000000000
            Name = 'Day of German Unity'
          end
          item
            Date = 39724.000000000000000000
            Name = 'Day of German Unity'
          end
          item
            Date = 40089.000000000000000000
            Name = 'Day of German Unity'
          end
          item
            Date = 40454.000000000000000000
            Name = 'Day of German Unity'
          end
          item
            Date = 40819.000000000000000000
            Name = 'Day of German Unity'
          end
          item
            Date = 41185.000000000000000000
            Name = 'Day of German Unity'
          end
          item
            Date = 39043.000000000000000000
            Name = 'Day of Prayer and Repentance'
          end
          item
            Date = 39407.000000000000000000
            Name = 'Day of Prayer and Repentance'
          end
          item
            Date = 39771.000000000000000000
            Name = 'Day of Prayer and Repentance'
          end
          item
            Date = 40135.000000000000000000
            Name = 'Day of Prayer and Repentance'
          end
          item
            Date = 40499.000000000000000000
            Name = 'Day of Prayer and Repentance'
          end
          item
            Date = 40863.000000000000000000
            Name = 'Day of Prayer and Repentance'
          end
          item
            Date = 41234.000000000000000000
            Name = 'Day of Prayer and Repentance'
          end
          item
            Date = 38823.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 39180.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 39530.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 39915.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 40272.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 40657.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 41007.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 38824.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 39181.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 39531.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 39916.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 40273.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 40658.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 41008.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 38723.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 39088.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 39453.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 39819.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 40184.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 40549.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 40914.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 38821.000000000000000000
            Name = 'Good Friday'
          end
          item
            Date = 39178.000000000000000000
            Name = 'Good Friday'
          end
          item
            Date = 39528.000000000000000000
            Name = 'Good Friday'
          end
          item
            Date = 39913.000000000000000000
            Name = 'Good Friday'
          end
          item
            Date = 40270.000000000000000000
            Name = 'Good Friday'
          end
          item
            Date = 40655.000000000000000000
            Name = 'Good Friday'
          end
          item
            Date = 41005.000000000000000000
            Name = 'Good Friday'
          end
          item
            Date = 38718.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39083.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39448.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39814.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40179.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40544.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40909.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39021.000000000000000000
            Name = 'Reformation Day'
          end
          item
            Date = 39386.000000000000000000
            Name = 'Reformation Day'
          end
          item
            Date = 39752.000000000000000000
            Name = 'Reformation Day'
          end
          item
            Date = 40117.000000000000000000
            Name = 'Reformation Day'
          end
          item
            Date = 40482.000000000000000000
            Name = 'Reformation Day'
          end
          item
            Date = 40847.000000000000000000
            Name = 'Reformation Day'
          end
          item
            Date = 41213.000000000000000000
            Name = 'Reformation Day'
          end
          item
            Date = 38873.000000000000000000
            Name = 'Whit Monday'
          end
          item
            Date = 39230.000000000000000000
            Name = 'Whit Monday'
          end
          item
            Date = 39580.000000000000000000
            Name = 'Whit Monday'
          end
          item
            Date = 39965.000000000000000000
            Name = 'Whit Monday'
          end
          item
            Date = 40322.000000000000000000
            Name = 'Whit Monday'
          end
          item
            Date = 40707.000000000000000000
            Name = 'Whit Monday'
          end
          item
            Date = 41057.000000000000000000
            Name = 'Whit Monday'
          end
          item
            Date = 38872.000000000000000000
            Name = 'Whit Sunday'
          end
          item
            Date = 39229.000000000000000000
            Name = 'Whit Sunday'
          end
          item
            Date = 39579.000000000000000000
            Name = 'Whit Sunday'
          end
          item
            Date = 39964.000000000000000000
            Name = 'Whit Sunday'
          end
          item
            Date = 40321.000000000000000000
            Name = 'Whit Sunday'
          end
          item
            Date = 40706.000000000000000000
            Name = 'Whit Sunday'
          end
          item
            Date = 41056.000000000000000000
            Name = 'Whit Sunday'
          end
          item
            Date = 38838.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 39203.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 39569.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 39934.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 40299.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 40664.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 41030.000000000000000000
            Name = 'Labor Day'
          end>
      end
      item
        Name = 'Italy'
        Visible = True
        Holidays = <
          item
            Date = 39022.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 39387.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 39753.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 40118.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 40483.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 40848.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 41214.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 38944.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 39309.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 39675.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 40040.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 40405.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 40770.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 41136.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 39077.000000000000000000
            Name = 'Boxing Day - St. Stephen'#39's Day'
          end
          item
            Date = 39442.000000000000000000
            Name = 'Boxing Day - St. Stephen'#39's Day'
          end
          item
            Date = 39808.000000000000000000
            Name = 'Boxing Day - St. Stephen'#39's Day'
          end
          item
            Date = 40173.000000000000000000
            Name = 'Boxing Day - St. Stephen'#39's Day'
          end
          item
            Date = 40538.000000000000000000
            Name = 'Boxing Day - St. Stephen'#39's Day'
          end
          item
            Date = 40903.000000000000000000
            Name = 'Boxing Day - St. Stephen'#39's Day'
          end
          item
            Date = 41269.000000000000000000
            Name = 'Boxing Day - St. Stephen'#39's Day'
          end
          item
            Date = 39076.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 39441.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 39807.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 40172.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 40537.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 40902.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 41268.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 38823.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 39180.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 39530.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 39915.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 40272.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 40657.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 41007.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 38824.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 39181.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 39531.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 39916.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 40273.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 40658.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 41008.000000000000000000
            Name = 'Easter Monday'
          end
          item
            Date = 38723.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 39088.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 39453.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 39819.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 40184.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 40549.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 40914.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 39059.000000000000000000
            Name = 'Immaculate Conception'
          end
          item
            Date = 39424.000000000000000000
            Name = 'Immaculate Conception'
          end
          item
            Date = 39790.000000000000000000
            Name = 'Immaculate Conception'
          end
          item
            Date = 40155.000000000000000000
            Name = 'Immaculate Conception'
          end
          item
            Date = 40520.000000000000000000
            Name = 'Immaculate Conception'
          end
          item
            Date = 40885.000000000000000000
            Name = 'Immaculate Conception'
          end
          item
            Date = 41251.000000000000000000
            Name = 'Immaculate Conception'
          end
          item
            Date = 38832.000000000000000000
            Name = 'Liberation Day'
          end
          item
            Date = 39197.000000000000000000
            Name = 'Liberation Day'
          end
          item
            Date = 39563.000000000000000000
            Name = 'Liberation Day'
          end
          item
            Date = 39928.000000000000000000
            Name = 'Liberation Day'
          end
          item
            Date = 40293.000000000000000000
            Name = 'Liberation Day'
          end
          item
            Date = 40658.000000000000000000
            Name = 'Liberation Day'
          end
          item
            Date = 41024.000000000000000000
            Name = 'Liberation Day'
          end
          item
            Date = 38718.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39083.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39448.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39814.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40179.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40544.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40909.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 38838.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 39203.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 39569.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 39934.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 40299.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 40664.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 41030.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 38870.000000000000000000
            Name = 'Republic Day Italy'
          end
          item
            Date = 39235.000000000000000000
            Name = 'Republic Day Italy'
          end
          item
            Date = 39601.000000000000000000
            Name = 'Republic Day Italy'
          end
          item
            Date = 39966.000000000000000000
            Name = 'Republic Day Italy'
          end
          item
            Date = 40331.000000000000000000
            Name = 'Republic Day Italy'
          end
          item
            Date = 40696.000000000000000000
            Name = 'Republic Day Italy'
          end
          item
            Date = 41062.000000000000000000
            Name = 'Republic Day Italy'
          end>
      end
      item
        Name = 'Spain'
        Visible = True
        Holidays = <
          item
            Date = 39022.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 39387.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 39753.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 40118.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 40483.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 40848.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 41214.000000000000000000
            Name = 'All Saints'#39' Day'
          end
          item
            Date = 38944.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 39309.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 39675.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 40040.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 40405.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 40770.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 41136.000000000000000000
            Name = 'Assumption Day'
          end
          item
            Date = 39076.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 39441.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 39807.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 40172.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 40537.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 40902.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 41268.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 39002.000000000000000000
            Name = 'Columbus Day'
          end
          item
            Date = 39367.000000000000000000
            Name = 'Columbus Day'
          end
          item
            Date = 39733.000000000000000000
            Name = 'Columbus Day'
          end
          item
            Date = 40098.000000000000000000
            Name = 'Columbus Day'
          end
          item
            Date = 40463.000000000000000000
            Name = 'Columbus Day'
          end
          item
            Date = 40828.000000000000000000
            Name = 'Columbus Day'
          end
          item
            Date = 41194.000000000000000000
            Name = 'Columbus Day'
          end
          item
            Date = 38723.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 39088.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 39453.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 39819.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 40184.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 40549.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 40914.000000000000000000
            Name = 'Epiphany'
          end
          item
            Date = 38821.000000000000000000
            Name = 'Good Friday'
          end
          item
            Date = 39178.000000000000000000
            Name = 'Good Friday'
          end
          item
            Date = 39528.000000000000000000
            Name = 'Good Friday'
          end
          item
            Date = 39913.000000000000000000
            Name = 'Good Friday'
          end
          item
            Date = 40270.000000000000000000
            Name = 'Good Friday'
          end
          item
            Date = 40655.000000000000000000
            Name = 'Good Friday'
          end
          item
            Date = 41005.000000000000000000
            Name = 'Good Friday'
          end
          item
            Date = 39059.000000000000000000
            Name = 'Immaculate Conception'
          end
          item
            Date = 39424.000000000000000000
            Name = 'Immaculate Conception'
          end
          item
            Date = 39790.000000000000000000
            Name = 'Immaculate Conception'
          end
          item
            Date = 40155.000000000000000000
            Name = 'Immaculate Conception'
          end
          item
            Date = 40520.000000000000000000
            Name = 'Immaculate Conception'
          end
          item
            Date = 40885.000000000000000000
            Name = 'Immaculate Conception'
          end
          item
            Date = 41251.000000000000000000
            Name = 'Immaculate Conception'
          end
          item
            Date = 38718.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39083.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39448.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39814.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40179.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40544.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40909.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39057.000000000000000000
            Name = 'Spanish Constitution Day'
          end
          item
            Date = 39422.000000000000000000
            Name = 'Spanish Constitution Day'
          end
          item
            Date = 39788.000000000000000000
            Name = 'Spanish Constitution Day'
          end
          item
            Date = 40153.000000000000000000
            Name = 'Spanish Constitution Day'
          end
          item
            Date = 40518.000000000000000000
            Name = 'Spanish Constitution Day'
          end
          item
            Date = 40883.000000000000000000
            Name = 'Spanish Constitution Day'
          end
          item
            Date = 41249.000000000000000000
            Name = 'Spanish Constitution Day'
          end
          item
            Date = 38838.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 39203.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 39569.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 39934.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 40299.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 40664.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 41030.000000000000000000
            Name = 'Labor Day'
          end>
      end
      item
        Name = 'United States'
        Visible = True
        Holidays = <
          item
            Date = 39076.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 39441.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 39807.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 40172.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 40537.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 40902.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 41268.000000000000000000
            Name = 'Christmas Day'
          end
          item
            Date = 39075.000000000000000000
            Name = 'Christmas Eve'
          end
          item
            Date = 39440.000000000000000000
            Name = 'Christmas Eve'
          end
          item
            Date = 39806.000000000000000000
            Name = 'Christmas Eve'
          end
          item
            Date = 40171.000000000000000000
            Name = 'Christmas Eve'
          end
          item
            Date = 40536.000000000000000000
            Name = 'Christmas Eve'
          end
          item
            Date = 40901.000000000000000000
            Name = 'Christmas Eve'
          end
          item
            Date = 41267.000000000000000000
            Name = 'Christmas Eve'
          end
          item
            Date = 38999.000000000000000000
            Name = 'Columbus Day'
          end
          item
            Date = 39363.000000000000000000
            Name = 'Columbus Day'
          end
          item
            Date = 39734.000000000000000000
            Name = 'Columbus Day'
          end
          item
            Date = 40098.000000000000000000
            Name = 'Columbus Day'
          end
          item
            Date = 40462.000000000000000000
            Name = 'Columbus Day'
          end
          item
            Date = 40826.000000000000000000
            Name = 'Columbus Day'
          end
          item
            Date = 41190.000000000000000000
            Name = 'Columbus Day'
          end
          item
            Date = 38823.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 39180.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 39530.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 39915.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 40272.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 40657.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 41007.000000000000000000
            Name = 'Easter Day'
          end
          item
            Date = 39028.000000000000000000
            Name = 'Election Day'
          end
          item
            Date = 39392.000000000000000000
            Name = 'Election Day'
          end
          item
            Date = 39756.000000000000000000
            Name = 'Election Day'
          end
          item
            Date = 40120.000000000000000000
            Name = 'Election Day'
          end
          item
            Date = 40484.000000000000000000
            Name = 'Election Day'
          end
          item
            Date = 40855.000000000000000000
            Name = 'Election Day'
          end
          item
            Date = 41219.000000000000000000
            Name = 'Election Day'
          end
          item
            Date = 38886.000000000000000000
            Name = 'Father'#39's Day'
          end
          item
            Date = 39250.000000000000000000
            Name = 'Father'#39's Day'
          end
          item
            Date = 39614.000000000000000000
            Name = 'Father'#39's Day'
          end
          item
            Date = 39985.000000000000000000
            Name = 'Father'#39's Day'
          end
          item
            Date = 40349.000000000000000000
            Name = 'Father'#39's Day'
          end
          item
            Date = 40713.000000000000000000
            Name = 'Father'#39's Day'
          end
          item
            Date = 41077.000000000000000000
            Name = 'Father'#39's Day'
          end
          item
            Date = 38882.000000000000000000
            Name = 'Flag Day'
          end
          item
            Date = 39247.000000000000000000
            Name = 'Flag Day'
          end
          item
            Date = 39613.000000000000000000
            Name = 'Flag Day'
          end
          item
            Date = 39978.000000000000000000
            Name = 'Flag Day'
          end
          item
            Date = 40343.000000000000000000
            Name = 'Flag Day'
          end
          item
            Date = 40708.000000000000000000
            Name = 'Flag Day'
          end
          item
            Date = 41074.000000000000000000
            Name = 'Flag Day'
          end
          item
            Date = 38750.000000000000000000
            Name = 'Groundhog Day'
          end
          item
            Date = 39115.000000000000000000
            Name = 'Groundhog Day'
          end
          item
            Date = 39480.000000000000000000
            Name = 'Groundhog Day'
          end
          item
            Date = 39846.000000000000000000
            Name = 'Groundhog Day'
          end
          item
            Date = 40211.000000000000000000
            Name = 'Groundhog Day'
          end
          item
            Date = 40576.000000000000000000
            Name = 'Groundhog Day'
          end
          item
            Date = 40941.000000000000000000
            Name = 'Groundhog Day'
          end
          item
            Date = 39021.000000000000000000
            Name = 'Halloween'
          end
          item
            Date = 39386.000000000000000000
            Name = 'Halloween'
          end
          item
            Date = 39752.000000000000000000
            Name = 'Halloween'
          end
          item
            Date = 40117.000000000000000000
            Name = 'Halloween'
          end
          item
            Date = 40482.000000000000000000
            Name = 'Halloween'
          end
          item
            Date = 40847.000000000000000000
            Name = 'Halloween'
          end
          item
            Date = 41213.000000000000000000
            Name = 'Halloween'
          end
          item
            Date = 38902.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 39267.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 39633.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 39998.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 40363.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 40728.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 41094.000000000000000000
            Name = 'Independence Day'
          end
          item
            Date = 38964.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 39328.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 39692.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 40063.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 40427.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 40791.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 41155.000000000000000000
            Name = 'Labor Day'
          end
          item
            Date = 38760.000000000000000000
            Name = 'Lincoln'#39's Birthday'
          end
          item
            Date = 39125.000000000000000000
            Name = 'Lincoln'#39's Birthday'
          end
          item
            Date = 39490.000000000000000000
            Name = 'Lincoln'#39's Birthday'
          end
          item
            Date = 39856.000000000000000000
            Name = 'Lincoln'#39's Birthday'
          end
          item
            Date = 40221.000000000000000000
            Name = 'Lincoln'#39's Birthday'
          end
          item
            Date = 40586.000000000000000000
            Name = 'Lincoln'#39's Birthday'
          end
          item
            Date = 40951.000000000000000000
            Name = 'Lincoln'#39's Birthday'
          end
          item
            Date = 38733.000000000000000000
            Name = 'Martin Luther King Day'
          end
          item
            Date = 39097.000000000000000000
            Name = 'Martin Luther King Day'
          end
          item
            Date = 39468.000000000000000000
            Name = 'Martin Luther King Day'
          end
          item
            Date = 39832.000000000000000000
            Name = 'Martin Luther King Day'
          end
          item
            Date = 40196.000000000000000000
            Name = 'Martin Luther King Day'
          end
          item
            Date = 40560.000000000000000000
            Name = 'Martin Luther King Day'
          end
          item
            Date = 40924.000000000000000000
            Name = 'Martin Luther King Day'
          end
          item
            Date = 38866.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 39230.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 39594.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 39958.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 40329.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 40693.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 41057.000000000000000000
            Name = 'Memorial Day'
          end
          item
            Date = 38851.000000000000000000
            Name = 'Mother'#39's Day'
          end
          item
            Date = 39215.000000000000000000
            Name = 'Mother'#39's Day'
          end
          item
            Date = 39579.000000000000000000
            Name = 'Mother'#39's Day'
          end
          item
            Date = 39943.000000000000000000
            Name = 'Mother'#39's Day'
          end
          item
            Date = 40307.000000000000000000
            Name = 'Mother'#39's Day'
          end
          item
            Date = 40671.000000000000000000
            Name = 'Mother'#39's Day'
          end
          item
            Date = 41042.000000000000000000
            Name = 'Mother'#39's Day'
          end
          item
            Date = 38718.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39083.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39448.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39814.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40179.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40544.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 40909.000000000000000000
            Name = 'New Year'#39's Day'
          end
          item
            Date = 39082.000000000000000000
            Name = 'New Year'#39's Eve'
          end
          item
            Date = 39447.000000000000000000
            Name = 'New Year'#39's Eve'
          end
          item
            Date = 39813.000000000000000000
            Name = 'New Year'#39's Eve'
          end
          item
            Date = 40178.000000000000000000
            Name = 'New Year'#39's Eve'
          end
          item
            Date = 40543.000000000000000000
            Name = 'New Year'#39's Eve'
          end
          item
            Date = 40908.000000000000000000
            Name = 'New Year'#39's Eve'
          end
          item
            Date = 41274.000000000000000000
            Name = 'New Year'#39's Eve'
          end
          item
            Date = 38793.000000000000000000
            Name = 'Saint Patrick'#39's Day'
          end
          item
            Date = 39158.000000000000000000
            Name = 'Saint Patrick'#39's Day'
          end
          item
            Date = 39524.000000000000000000
            Name = 'Saint Patrick'#39's Day'
          end
          item
            Date = 39889.000000000000000000
            Name = 'Saint Patrick'#39's Day'
          end
          item
            Date = 40254.000000000000000000
            Name = 'Saint Patrick'#39's Day'
          end
          item
            Date = 40619.000000000000000000
            Name = 'Saint Patrick'#39's Day'
          end
          item
            Date = 40985.000000000000000000
            Name = 'Saint Patrick'#39's Day'
          end
          item
            Date = 38824.000000000000000000
            Name = 'Tax Day'
          end
          item
            Date = 39188.000000000000000000
            Name = 'Tax Day'
          end
          item
            Date = 39553.000000000000000000
            Name = 'Tax Day'
          end
          item
            Date = 39918.000000000000000000
            Name = 'Tax Day'
          end
          item
            Date = 40283.000000000000000000
            Name = 'Tax Day'
          end
          item
            Date = 40648.000000000000000000
            Name = 'Tax Day'
          end
          item
            Date = 41015.000000000000000000
            Name = 'Tax Day'
          end
          item
            Date = 39044.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 39408.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 39779.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 40143.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 40507.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 40871.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 41235.000000000000000000
            Name = 'Thanksgiving Day'
          end
          item
            Date = 38762.000000000000000000
            Name = 'Valentine'#39's Day'
          end
          item
            Date = 39127.000000000000000000
            Name = 'Valentine'#39's Day'
          end
          item
            Date = 39492.000000000000000000
            Name = 'Valentine'#39's Day'
          end
          item
            Date = 39858.000000000000000000
            Name = 'Valentine'#39's Day'
          end
          item
            Date = 40223.000000000000000000
            Name = 'Valentine'#39's Day'
          end
          item
            Date = 40588.000000000000000000
            Name = 'Valentine'#39's Day'
          end
          item
            Date = 40953.000000000000000000
            Name = 'Valentine'#39's Day'
          end
          item
            Date = 39032.000000000000000000
            Name = 'Veteran'#39's Day'
          end
          item
            Date = 39397.000000000000000000
            Name = 'Veteran'#39's Day'
          end
          item
            Date = 39763.000000000000000000
            Name = 'Veteran'#39's Day'
          end
          item
            Date = 40128.000000000000000000
            Name = 'Veteran'#39's Day'
          end
          item
            Date = 40493.000000000000000000
            Name = 'Veteran'#39's Day'
          end
          item
            Date = 40858.000000000000000000
            Name = 'Veteran'#39's Day'
          end
          item
            Date = 41224.000000000000000000
            Name = 'Veteran'#39's Day'
          end
          item
            Date = 38833.000000000000000000
            Name = 'Administrative Professionals Day'
          end
          item
            Date = 39197.000000000000000000
            Name = 'Administrative Professionals Day'
          end
          item
            Date = 39561.000000000000000000
            Name = 'Administrative Professionals Day'
          end
          item
            Date = 39925.000000000000000000
            Name = 'Administrative Professionals Day'
          end
          item
            Date = 40289.000000000000000000
            Name = 'Administrative Professionals Day'
          end
          item
            Date = 40660.000000000000000000
            Name = 'Administrative Professionals Day'
          end
          item
            Date = 41024.000000000000000000
            Name = 'Administrative Professionals Day'
          end
          item
            Date = 38768.000000000000000000
            Name = 'Presidents'#39' Day'
          end
          item
            Date = 39132.000000000000000000
            Name = 'Presidents'#39' Day'
          end
          item
            Date = 39496.000000000000000000
            Name = 'Presidents'#39' Day'
          end
          item
            Date = 39860.000000000000000000
            Name = 'Presidents'#39' Day'
          end
          item
            Date = 40224.000000000000000000
            Name = 'Presidents'#39' Day'
          end
          item
            Date = 40595.000000000000000000
            Name = 'Presidents'#39' Day'
          end
          item
            Date = 40959.000000000000000000
            Name = 'Presidents'#39' Day'
          end>
      end>
    Left = 481
    Top = 529
  end
  object pmGenerageHolidaysEvents: TPopupMenu
    Left = 697
    Top = 393
    object miGenerateHolidaysEventsForAllResources: TMenuItem
      Caption = 'For all resources'
      OnClick = GenerateHolidaysEventsClick
    end
    object miGenerateHolidaysEventsOnlyESPN: TMenuItem
      Tag = 1
      Caption = 'Only '#39'ESPN'#39
      OnClick = GenerateHolidaysEventsClick
    end
    object miGenerateHolidaysEventsForEUROSPORTNEWSandFOXFOOTY: TMenuItem
      Tag = 2
      Caption = 'For '#39'EUROSPORT NEWS'#39' and '#39'FOX FOOTY'#39
      OnClick = GenerateHolidaysEventsClick
    end
  end
  object SchedulerGanttStorage: TcxSchedulerStorage
    CustomFields = <
      item
        Name = 'IconIndex'
        ValueType = 'Integer'
      end
      item
        Name = 'SyncIDField'
      end>
    Resources.Items = <>
    Left = 545
    Top = 529
  end
  object SchedulerHolidaysStorage: TcxSchedulerStorage
    CustomFields = <
      item
        Name = 'SyncID'
      end
      item
        Name = 'SportID'
        ValueType = 'Integer'
      end>
    Holidays = SchedulerHolidays
    Reminders.Active = False
    Reminders.OnOpenEvent = RemindersOpenEvent
    Resources.Images = imgResources
    Resources.Items = <
      item
        ImageIndex = 0
        Name = 'ESPN'
        ResourceID = 0
      end
      item
        ImageIndex = 1
        Name = 'EUROSPORT NEWS'
        ResourceID = 1
      end
      item
        ImageIndex = 2
        Name = 'FOX FOOTY'
        ResourceID = 2
      end
      item
        ImageIndex = 7
        Name = 'FOX SPORTS 1'
        ResourceID = 3
      end
      item
        ImageIndex = 3
        Name = 'FOX SPORTS 2'
        ResourceID = 4
      end
      item
        ImageIndex = 4
        Name = 'FUEL'
        ResourceID = 5
      end
      item
        ImageIndex = 5
        Name = 'MAIN EVENT'
        ResourceID = 6
      end
      item
        ImageIndex = 6
        Name = 'SKY RACING'
        ResourceID = 7
      end>
    Left = 512
    Top = 528
  end
  object GridConnection: TcxSchedulerGridConnection
    GridView = cxGridEventsTableTableViewConnection
    Storage = UnboundStorage
    Left = 577
    Top = 529
  end
  object cxLFController: TdxSkinController
    Kind = lfOffice11
    SkinName = 'Office2007Black'
    OnSkinControl = cxLFControllerSkinControl
    OnSkinForm = cxLFControllerSkinForm
    Left = 345
    Top = 409
  end
  object imgMain: TcxImageList
    Height = 18
    FormatVersion = 1
    DesignInfo = 29425921
    ImageInfo = <
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000CC520B00CC52
          0B00CC520B00CC520B00C6510A00C6510A00C6510A00C24E0700C24E0700C24E
          0700C24E0700BC4B0500BC4B0500BC4B0500BC4B0500BC4B0500D2560E00FFEF
          C800FFEFC800FBD59A00FFEFC800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFF2D500FBD59A00FFEFC800FFEFC800BC4B0500D85B1300FFF1
          CE00FFF1CE00FAD6A300FFF1CE00FFFFFF000000000000000000000000000000
          0000BCBBBA00FFF3DC00FAD6A300FFF1CE00FFF1CE00C24E0700D85B1300FAD6
          A300FAD6A300FAD6A300FAD6A300FFFFFF00FFFFFF007E7D7D0000000000FFFF
          FF00FFFFFF00FADEBA00FAD6A300FAD6A300FAD6A300C6510A00DA661900FFF8
          DD00FFF8DD00FBD9AB00FFF8DD00FFF8DD00FBEBD6007E7D7D0000000000FFF5
          EB00FFF8DD00FFF8DD00FBD9AB00FFF8DD00FFF8DD00C6510A00E3691C00FFFA
          E400FFFAE400FADBAF00FFFAE400FFFAE400FBEBD6007E7D7D0000000000FFF5
          EB00FFFAE400FFFAE400FADBAF00FFFAE400FFFAE400CB580F00E3691C00FADD
          B400FADDB400FADDB400FADDB400FADDB400FDEEDC007E7D7D0000000000FFF5
          EB00FADDB400FADDB400FADDB400FADDB400FADDB400D15F1400E6752300FFFE
          F100FFFEF100FADEBA00FFFEF100FFFFF500FEF2E4007E7D7D0000000000FEF7
          EF00FFFEF100FFFEF100FADEBA00FFFEF100FFFEF100D15F1400E6752300FFFF
          F500FFFFF500FADEBA00FFFFF500FFFFFB00BCBBBA005F5E5E0000000000FEF7
          EF00FFFFF500FFFFF500FADEBA00FFFFF500FFFFF500DA661900ED7E2A00FADE
          C000FADEC000FADEC000FADEC000FDEEDC007E7D7D002020200000000000FEF7
          EF00FADEC000FADEC000FADEC000FADEC000FADEC000DA661900ED7E2A00FFFF
          FF00FFFFFF00FADEC000FFFFFF00FFFFFF00FFFCF700BCBBBA0000000000FEF7
          EF00FFFFFF00FFFFFF00FADEC000FFFFFF00FFFFFF00DA782200EE862E00FFFF
          FF00FFFFFF00FADEC000FFFFFF00FFFFFF00FCE8CD00FFFFFF00FFFFFF00FEF2
          E400FFFFFF00FFFFFF00FADEC000FFFFFF00FFFFFF00E6752300EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00F1963C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00F1963C00F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000CC520B00CC52
          0B00CC520B00CC520B00C6510A00C6510A00C6510A00C24E0700C24E0700C24E
          0700C24E0700BC4B0500BC4B0500BC4B0500BC4B0500BC4B0500D2560E00FFEF
          C800FFEFC800FBD59A00FFEFC800FFFAEA00FDEEDC00FFFEF800FFFEF800FFF9
          F200FFF8E800FFEFC800FBD59A00FFEFC800FFEFC800BC4B0500D85B1300FFF1
          CE00FFF1CE00FAD6A300FFFAF500E3E3E1005F5E5E005F5E5E00202020007272
          7200FFFFFF00FFF8E800FAD6A300FFF1CE00FFF1CE00C24E0700D85B1300FAD6
          A300FAD6A300FAD6A300FFF4E7003F3E3E003F3E3E00FFFAF500CFCFCF000000
          000072727200FFFDFA00FAD6A300FAD6A300FAD6A300C6510A00DA661900FFF8
          DD00FFF8DD00FBD9AB00FFFCF7003F3E3E0097989700FFFCF700FFFFFF000000
          00000D0D0D00FFFFFF00FBD9AB00FFF8DD00FFF8DD00C6510A00E3691C00FFFA
          E400FFFAE400FADBAF00FFFEF800FFFEF800FFF5EB00FFFEF100FFFFFF000000
          000000000000FFFFFF00FADBAF00FFFAE400FFFAE400CB580F00E3691C00FADD
          B400FADDB400FADDB400FEE3BD00CFCFCF0097989700BCBBBA00727272000000
          000072727200FFFFFF00FADDB400FADDB400FADDB400D15F1400E6752300FFFE
          F100FFFEF100FADEBA00FFFEF100FFFFFB003F3E3E00515151003F3E3E007E7D
          7D00FFFFFF00FFFEF800FADEBA00FFFEF100FFFEF100D15F1400E6752300FFFF
          F500FFFFF500FADEBA00FFFFF500FFFFFB005F5E5E00FFFFFB00FFFFFB00FEF7
          EF00FFFFFB00FFFEF800FADEBA00FFFFF500FFFFF500DA661900ED7E2A00FADE
          C000FADEC000FADEC000FADEC000FFF4E7007E7D7D003F3E3E003F3E3E003F3E
          3E00BCBBBA00FBEBD600FADEC000FADEC000FADEC000DA661900ED7E2A00FFFF
          FF00FFFFFF00FADEC000FFFFFF00FFFFFF00BCBBBA003F3E3E003F3E3E003F3E
          3E0097989700FFFFFF00FADEC000FFFFFF00FFFFFF00DA782200EE862E00FFFF
          FF00FFFFFF00FADEC000FFFFFF00FFFFFF00FEF7EF00FFFFFF00FFFFFF00FEF7
          EF00FFFFFF00FFFFFF00FADEC000FFFFFF00FFFFFF00E6752300EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00F1963C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00F1963C00F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000CC520B00CC52
          0B00CC520B00CC520B00C6510A00C6510A00C6510A00C24E0700C24E0700C24E
          0700C24E0700BC4B0500BC4B0500BC4B0500BC4B0500BC4B0500D2560E00FFEF
          C800FFEFC800FBD59A00FFF1CE00FFFFFF00FFFFFF00FFFFFF00FFFEF800FBD5
          9A00FFEFC800FFEFC800FBD59A00FFEFC800FFEFC800BC4B0500D85B1300FFF1
          CE00FFF1CE00FAD6A300FFF2D500E3E3E1000000000020202000FFFFFF00FBDD
          B200FFF1CE00FFF1CE00FAD6A300FFF1CE00FFF1CE00C24E0700D85B1300FAD6
          A300FAD6A300FAD6A300FADBAF00FFFFFF005F5E5E0000000000CFCFCF00FBEB
          D600FAD6A300FAD6A300FAD6A300FAD6A300FAD6A300C6510A00DA661900FFF8
          DD00FFF8DD00FBD9AB00FFF8DD00FFFEF100CFCFCF000000000072727200FFFA
          F500FFF8DD00FFF8DD00FBD9AB00FFF8DD00FFF8DD00C6510A00E3691C00FFFA
          E400FFFAE400FADBAF00FFFAE400FFFEF100FFFFFF003F3E3E0020202000FFFF
          FF00FFFDFA00FFFAE400FADBAF00FFFAE400FFFAE400CB580F00E3691C00FADD
          B400FADDB400FADDB400FADDB400FBEBD6008A8A8A0033333300000000003333
          3300FFF9F200FADDB400FADDB400FADDB400FADDB400D15F1400E6752300FFFE
          F100FFFEF100FADEBA00FFFFFB00FFFFFB00FFF9F200FFFFFF00202020007272
          7200FFFFFE00FFFEF100FADEBA00FFFEF100FFFEF100D15F1400E6752300FFFF
          F500FFFFF500FADEBA00FFFFFE003F3E3E00FFFDFB00FFFFFE00979897002020
          2000FFFFFF00FFFEF800FADEBA00FFFFF500FFFFF500DA661900ED7E2A00FADE
          C000FADEC000FADEC000FFFDFB000D0D0D003F3E3E003F3E3E003F3E3E000000
          0000CFCFCF00FDEEDC00FADEC000FADEC000FADEC000DA661900ED7E2A00FFFF
          FF00FFFFFF00FADEC000FFFFFF003F3E3E003F3E3E003F3E3E003F3E3E003F3E
          3E008A8A8A00FFFFFF00FADEC000FFFFFF00FFFFFF00DA782200EE862E00FFFF
          FF00FFFFFF00FADEC000FFFFFF00FFFFFF00FEF7EF00FFFFFF00FFFFFF00FEF7
          EF00FFFFFF00FFFFFF00FADEC000FFFFFF00FFFFFF00E6752300EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00F1963C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00F1963C00F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000CC520B00CC52
          0B00CC520B00CC520B00C6510A00C6510A00C6510A00C24E0700C24E0700C24E
          0700C24E0700BC4B0500BC4B0500BC4B0500BC4B0500BC4B0500D2560E00FFEF
          C800FFF2D500FCE8CD00FFFAE400FFFAE400FCE8CD00FFF2D500FFEFC800FBD5
          9A00FFEFC800FFEFC800FBD59A00FFEFC800FFEFC800BC4B0500D85B1300FFF1
          CE00FFFFFF00CFCFCF007E7D7D007E7D7D00BCBBBA00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF3DC00C24E0700D85B1300FAD6
          A300FFFFFF00000000002020200033333300000000007E7D7D00FFFFFF000000
          0000000000000000000000000000BCBBBA00FADEBA00C6510A00DA661900FFF8
          DD00FFFFFF0097989700FFFFFF00FFFFFF007E7D7D000D0D0D00FFFFFF00FFFF
          FF007E7D7D003F3E3E00FFFFFF00FFFFFF00FFFAE400C6510A00E3691C00FFFA
          E400FFFEF100FCE8CD00FFFEF100FFFDFB00A7A9A90000000000FFFFFF00FBEB
          D6007E7D7D003F3E3E00FFF5EB00FFFAE400FFFAE400CB580F00E3691C00FADD
          B400FADDB400FCE8CD00BCBBBA007E7D7D00202020003F3E3E00FFFFFF00FDEE
          DC007E7D7D003F3E3E00FFF5EB00FADDB400FADDB400D15F1400E6752300FFFE
          F100FFFEF100FBEBD60097989700333333000D0D0D00CFCFCF00FFFFFB00FDEE
          DC007E7D7D003F3E3E00FEF7EF00FFFEF100FFFEF100D15F1400E6752300FFFF
          F500FFFFFB00FDEEDC00FFFFFE00FFFFFE004E4E4E0051515100FFFFFE00FEF2
          E4007E7D7D003F3E3E00FEF7EF00FFFFF500FFFFF500DA661900ED7E2A00FADE
          C000FFF5EB007E7D7D00CFCFCF00FFFFFF00515151003F3E3E00FFFCF700BCBB
          BA005F5E5E003F3E3E00FEF7EF00FADEC000FADEC000DA661900ED7E2A00FFFF
          FF00FFFFFF0051515100000000000000000000000000A7A9A900FFFFFF007E7D
          7D00202020003F3E3E00FEF7EF00FFFFFF00FFFFFF00DA782200EE862E00FFFF
          FF00FFFFFF00FFFFFF00CFCFCF00BCBBBA00E3E3E100FFFFFF00FFFFFF00FFFC
          F700BCBBBA0072727200FEF7EF00FFFFFF00FFFFFF00E6752300EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00F1963C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00F1963C00F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000CC520B00CC52
          0B00CC520B00CC520B00C6510A00C6510A00C6510A00C24E0700C24E0700C24E
          0700C24E0700BC4B0500BC4B0500BC4B0500BC4B0500BC4B0500D2560E00FFEC
          BF00FFECBF00FBD59A00FFECBF00FFECBF00FBD59A00FFECBF00FFECBF00FBD5
          9A00FFECBF00FFECBF00FBD59A00FFECBF00FFECBF00BC4B0500D85B1300FFEF
          C800FFEFC800FBD59A00FFEFC800FFF2D500FCE4C100FFF8DD00FFF8DD00FCE4
          C100FFF2D500FFEFC800FBD59A00FFEFC800FFEFC800C24E0700D85B1300FAD6
          A300FAD6A300FBD9AB00FCE4C10067A4B100285967000C3140000C3140002859
          67006B938A00FCE4C100FBD9AB00FAD6A300FAD6A300C6510A00DA661900FFF2
          D500FFF2D500FCE4C10067A4B1003D93B60042C3E3005CDEFE005CDEFE0042C3
          E3001777920041738000FCE4C100FFF2D500FFF2D500C6510A00E3691C00FFF8
          DD00FFFAE4007BB0BC003D93B6006BDCFF0049D9FF002CCEFB002CCEFB0038D4
          FE005CDEFE00177792006B938A00FFFAE400FFF8DD00CB580F00E3691C00FADB
          AF00FCE8CD0067A4B10073CFF0005CDEFE0038D4FE0038D4FE002CCEFB002CCE
          FB0049D9FF0042C3E30028596700FCE8CD00FADBAF00D15F1400E6752300FFFA
          EA00FFFFF5003D93B60099E7FD005CDEFE0000000000000000000000000038D4
          FE0038D4FE006BDCFF000C314000FFFFF500FFFAEA00D15F1400E6752300FFFE
          F100FFFEF80067A4B10099E7FD0076E5FF006BDCFF005CDEFE000000000049D9
          FF0049D9FF0076E5FF000C314000FFFEF800FFFEF100DA661900ED7E2A00FADE
          BA00FBEBD60095CDDF0099E7FD0099E7FD0076E5FF0076E5FF00000000005CDE
          FE006BDCFF0064CBEA0041738000FBEBD600FADEBA00DA661900ED7E2A00FFFF
          FB00FFFFFB00ACDBE60095CDDF00B2ECFF0099E7FD008EDCFF00000000008EDC
          FF0099E7FD003D93B6007BB0BC00FFFFFB00FFFFFB00DA782200EE862E00FFFF
          FF00FFFFFF00FBEBD600ACDBE600ACDBE600B2ECFF00B2ECFF00B2ECFF0099E7
          FD007BB0BC007BB0BC00FBEBD600FFFFFF00FFFFFF00E6752300EE862E00FADE
          C000FADEC000FCE8CD00FBEBD600ACDBE60095CDDF007BB0BC007BB0BC007BB0
          BC0095CDDF00FBEBD600FCE8CD00FADEC000FADEC000E1802800EF8B3200FFFF
          FF00FFFFFF00FADEC000FFFFFF00FFFFFF00FBEBD600FFFFFF00FFFFFF00FBEB
          D600FFFFFF00FFFFFF00FADEC000FFFFFF00FFFFFF00E1802800EF8B3200FFFF
          FF00FFFFFF00FADEC000FFFFFF00FFFFFF00FADEC000FFFFFF00FFFFFF00FADE
          C000FFFFFF00FFFFFF00FADEC000FFFFFF00FFFFFF00E1802800EF8B3200EF8B
          3200EF8B3200EF8B3200EF8B3200EF8B3200EF8B3200EF8B3200EF8B3200EF8B
          3200EE862E00EE862E00EE862E00E8842900E8842900E8842900000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF00000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000CC520B00CC52
          0B00CC520B00CC520B00C6510A00C6510A00C6510A00C24E0700C24E0700C24E
          0700BC4B0500BC4B050000000000000000000000000000000000DA661900FFF8
          DD00FFF8DD00FBD9AB00FFF8DD00FFF8DD00FBD9AB00FFF8DD00FFF8DD00FBD9
          AB00FFF8DD00C6510A0000000000000000000000000000000000E3691C00FFFA
          E400FFFAE400FADBAF00FFFAE400FFFAE400FADBAF00FFFAE400FFFAE400FADB
          AF00FFFAE400CB580F00C24E0700BC4B05000000000000000000E3691C00FADD
          B400FADDB400FADDB400FADDB400FADDB400FADDB400FADDB400FADDB400FADD
          B400FADDB400D15F1400FFF8DD00C6510A000000000000000000E6752300FFFE
          F100FFFEF100FADEBA00FFFEF100FFFEF100FADEBA00FFFEF100FFFEF100FADE
          BA00FFFEF100D15F1400FFFAE400CB580F00C24E0700BC4B0500E6752300FFFF
          F500FFFFF500FADEBA00FFFFF500FFFFF500FADEBA00FFFFF500FFFFF500FADE
          BA00FFFFF500DA661900FADDB400D15F1400FFF8DD00C6510A00ED7E2A00FADE
          C000FADEC000FADEC000FADEC000FADEC000FADEC000FADEC000FADEC000FADE
          C000FADEC000DA661900FFFEF100D15F1400FFFAE400CB580F00ED7E2A00FFFF
          FF00FFFFFF00FADEC000FFFFFF00FFFFFF00FADEC000FFFFFF00FFFFFF00FADE
          C000FFFFFF00DA782200FFFFF500DA661900FADDB400D15F1400EE862E00FFFF
          FF00FFFFFF00FADEC000FFFFFF00FFFFFF00FADEC000FFFFFF00FFFFFF00FADE
          C000FFFFFF00E6752300FADEC000DA661900FFFEF100D15F1400EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00FFFFFF00DA782200FFFFF500DA661900F1963C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC6
          7C00FFC67C00F1963C00FFFFFF00E6752300FADEC000DA661900F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A3
          5100F3A35100F3A35100EF8C2A00EF8C2A00FFFFFF00DA782200000000000000
          0000F1963C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC6
          7C00FFC67C00FFC67C00FFC67C00F1963C00FFFFFF00E6752300000000000000
          0000F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100EF8C2A00EF8C2A00000000000000
          00000000000000000000F1963C00FFC67C00FFC67C00FFC67C00FFC67C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00F1963C00000000000000
          00000000000000000000F3A35100F3A35100F3A35100F3A35100F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000000F0000000F0000000300000003000000000000000000000000
          00000000000000000000000000000000000000000000C0000000C0000000F000
          0000F0000000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000144B700000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000265D1000265D1000265D1000350CB000350CB000144B7000144
          B7000144B7000144B70000000000000000000000000000000000000000000000
          0000000000000887DD0012A5F20016C6F30016C6F3000CA4E6000887DD000350
          CB000350CB000144B70000000000000000000000000000000000000000000000
          000000000000000000000887DD0018DAFD0018DAFD0018DAFD0013B7F6000494
          F1000144B7000000000000000000000000000000000000000000000000001563
          C50000000000000000000887DD0018DAFD0018DAFD0018DAFD0013B7F6000494
          F1000144B70000000000000000000144B7000000000000000000000000000000
          00002372D100000000000CA4E60018DAFD0018DAFD0018DAFD0013B7F6000494
          F1000350CB00000000000144B700000000000000000000000000000000000000
          000000000000000000000CA4E60018DAFD0018DAFD0018DAFD0013B7F6000494
          F1000350CB0000000000000000000000000000000000000000004D90E5004D90
          E5003E81E2000000000011AFEA0018DAFD0018DAFD0018DAFD0013B7F6000494
          F1000265D100000000000350CB000350CB000350CB0000000000000000000000
          000000000000000000000000000011AFEA0018DAFD0018DAFD0013B7F6000887
          DD00000000000000000000000000000000000000000000000000000000000000
          000000000000529FD500000000000000000011AFEA000CA4E6000887DD000000
          0000000000002372D10000000000000000000000000000000000000000000000
          00005DB4E6000000000000000000000000000000000011AFEA00000000000000
          000000000000000000002372D1000000000000000000000000000000000073CF
          F00000000000000000000000000000000000000000000EB4F100000000000000
          00000000000000000000000000003E81E2000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF0000FFFF0000FEFF0000E00F0000E00F0000F01F0000B01B
          0000D0170000F01F000010110000F83F0000EC6F0000DEF70000BEFB0000FFFF
          0000FFFF0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000E9AB5800DD97
          3F00C2752000BA681E00BE762C00AA560500AA5605009F4E0500268AF300006C
          E9000350CB000350CB000350CB000027A2000027A2000027A200E9AB5800DD97
          3F00BA681E00D5AE9300E9D6C000AA560500AA5605009F4E0500268AF300006C
          E9000144B70078A8F400C8F3FF000027A2000027A2000027A200E9AB5800CC84
          3400BE762C00FFFDFA00FFFFFF00BE762C00AA5605009F4E0500268AF3000055
          ED000350CB00FFFFFF00FFFFFF000350CB000027A2000027A200E9AB5800C275
          2000E8C09500FFFFFF00FFFFFF00E7CBAD009F4E05009F4E0500268AF3000350
          CB008EDCFF00FFFFFF00FFFFFF00B2ECFF000027A2000027A20000000000CC84
          3400FFFFFF000000000000000000FFFFFF00BA681E000000000000000000006C
          E900FFFFFF000000000000000000FFFFFF000144B70000000000000000000000
          00001563C5000550B900043EA700043EA7000000000000000000000000000000
          00001563C5000550B900043EA700043EA7000000000000000000000000002372
          D10044CEFB0013B7F6000EB4F1000CA4E600043EA70000000000000000002372
          D10044CEFB0013B7F6000EB4F1000CA4E600043EA70000000000000000002372
          D10044CEFB0014BCFE000EB4F1000CA4E600043EA70000000000000000002372
          D10044CEFB0014BCFE000EB4F1000CA4E600043EA70000000000000000005F5E
          5E0044CEFB0014BCFE000EB4F1000CA4E6000000000000000000000000005F5E
          5E0044CEFB0014BCFE000EB4F1000CA4E6000000000000000000000000007E7D
          7D0044CEFB003F3E3E00202020000D0D0D000000000000000000000000007E7D
          7D0044CEFB003F3E3E00202020000D0D0D000000000000000000000000009798
          9700FFFFFF005555550033333300202020000D0D0D0000000000000000009798
          9700FFFFFF005555550033333300202020000D0D0D0000000000000000000000
          00008A8A8A00686969004E4E4E00333333000000000000000000000000000000
          00008A8A8A00686969004E4E4E00333333000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF0000FFFF0000000000000000000000000000000000008181
          0000C3C300008181000081810000818100008181000081810000C3C30000FFFF
          0000FFFF0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000BA681E00BA681E00BA681E00BA681E00BA68
          1E00BA681E000000000000000000000000000000000000000000CD7323000000
          00000000000000000000A65D1B0090480700904807000000000000000000BA68
          1E00BA681E00BA681E0000000000000000000000000000000000DA782200DA78
          220000000000BA681E00A65D1B00A65D1B000000000000000000000000000000
          0000BA681E00BA681E00BA681E00000000000000000000000000E1802800E180
          2800CD732300C56E2000BA681E00000000000000000000000000000000000000
          000000000000BA681E00BA681E00BA681E000000000000000000EE862E00E884
          2900E1802800E180280000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000EF8B3200EE86
          2E00EE862E00E8842900E1802800000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000F1963C00EF8B
          3200EF8B3200EE862E00E8842900E8842900000000000000000000000000CD73
          2300C56E2000C56E2000C56E2000C56E2000C56E200000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000CD732300CD732300C56E2000C56E2000C56E200000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000CD732300CD732300C56E2000C56E20000000000000000000DA78
          2200CD732300C56E200000000000000000000000000000000000000000000000
          0000DA782200CD732300CD732300CD732300CD73230000000000000000000000
          0000CD732300C56E2000BA681E0000000000000000000000000000000000DA78
          2200DA782200DA78220000000000CD732300CD73230000000000000000000000
          000000000000BA681E00BA681E00A65D1B000000000000000000E1802800E180
          2800DA782200000000000000000000000000CD73230000000000000000000000
          00000000000000000000E8842900E8842900E8842900E8842900E1802800E180
          2800000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF0000FFFF0000F81F0000718F000023C7000007E300000FFF
          000007FF000003810000FFC10000FFE100008FC10000C7890000E31D0000F03F
          0000FFFF0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000272727002727
          270020202000202020001515150015151500151515000D0D0D000D0D0D000D0D
          0D0007070700050505000101010001010100000000000000000033333300FFFF
          FF00272727008EDCFF008EDCFF008EDCFF008EDCFF008EDCFF008EDCFF008EDC
          FF008EDCFF008EDCFF008EDCFF008EDCFF008EDCFF00010101003F3E3E00FFFF
          FF00333333008EDCFF0021C5FE0014BCFE0014BCFE0014BCFE0014BCFE0014BC
          FE0014BCFE0014BCFE0014BCFE0014BCFE008EDCFF000707070047474700FFFF
          FF003F3E3E0099E7FD0021C5FE0021C5FE0021C5FE0021C5FE0014BCFE0014BC
          FE0014BCFE0014BCFE0014BCFE0014BCFE008EDCFF000D0D0D004E4E4E00FFFF
          FF004747470099E7FD002CCEFB002CCEFB0021C5FE0021C5FE0021C5FE0021C5
          FE0014BCFE0014BCFE0014BCFE0014BCFE008EDCFF001515150055555500FFFF
          FF005151510099E7FD0038D4FE0038D4FE002CCEFB002CCEFB002CCEFB0021C5
          FE0021C5FE0021C5FE0021C5FE0014BCFE008EDCFF00202020005F5E5E00FFFF
          FF005F5E5E00B2ECFF007BDBFF0099E7FD0076E5FF0049D9FF002CCEFB002CCE
          FB002CCEFB0021C5FE0021C5FE0021C5FE008EDCFF002020200068696900FFFF
          FF0068696900C8F3FF00BD929100BC483B00B381620076E5FF0038D4FE0038D4
          FE0038D4FE002CCEFB002CCEFB002CCEFB0099E7FD002727270072727200FFFF
          FF0068696900E1FAFF00D0514300C83F2F00C0493D0099E7FD0049D9FF0049D9
          FF0044CEFB0038D4FE0038D4FE0038D4FE0099E7FD00333333007E7D7D00FFFF
          FF0072727200C8F3FF00D5AE9300D0514300BD92910099E7FD005CDEFE0049D9
          FF0049D9FF0049D9FF0049D9FF0038D4FE0099E7FD003F3E3E008A8A8A00FFFF
          FF007E7D7D00C8F3FF00C8F3FF00E1FAFF00C8F3FF0099E7FD0099E7FD00B2EC
          FF0099E7FD006BDCFF0049D9FF0049D9FF0099E7FD00474747008A8A8A00FFFF
          FF008A8A8A00E1FAFF0057B66E000387220057B66E00C8F3FF00788FCB004654
          B200788FCB0099E7FD005CDEFE005CDEFE00B2ECFF005555550097989700FFFF
          FF008A8A8A00E1FAFF0015A754000387220003872200E1FAFF004A6FC2004654
          B2004654B200B2ECFF0076E5FF006BDCFF00B2ECFF005F5E5E0097989700FFFF
          FF0097989700E1FAFF0061D59E0015A7540061D59E00C8F3FF008C96F0004A6F
          C2008C96F000B2ECFF0076E5FF0076E5FF00B2ECFF006869690097989700FFFF
          FF0097989700E1FAFF00E1FAFF00E1FAFF00E1FAFF00E1FAFF00E1FAFF00E1FA
          FF00E1FAFF00C8F3FF00C8F3FF00C8F3FF00C8F3FF0072727200979897009798
          97009798970097989700979897009798970097989700979897008A8A8A008A8A
          8A008A8A8A008A8A8A007E7D7D007E7D7D007E7D7D007E7D7D00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF00000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000CC843400C164
          0600B55D0500AA560500AA560500FBD59A00FBD59A00FBD59A00FBD59A00FBD5
          9A00FBD59A00CC843400C1640600B55D0500AA560500AA560500EFB05500E589
          0C00E5890C00E5890C00AA560500FFEBC500FFEBC500FFEBC500FFEBC500FFEB
          C500FFEBC500EFB05500E5890C00E5890C00E5890C00AA560500FBBB5800F3A1
          1200FFFFFF00E5890C00B55D0500FEE3BD00FEE3BD00FEE3BD00FEE3BD00FEE3
          BD00FEE3BD00FBBB5800F3A11200FFFFFF00E5890C00B55D0500FAC35A00F3A1
          1200F3A11200F3A11200C1640600FEE3B100FEE3B100FEE3B100FEE3B100FEE3
          B100FEE3B100FAC35A00F3A11200F3A11200F3A11200C1640600FEE3AB00FCD4
          8C00FCD48C00FCD48C00FBCB8500FEDDA500FEDDA500FEDDA500FEDDA500FEDD
          A500FEDDA500FEE3AB00FCD48C00FCD48C00FCD48C00FBCB8500E9AB5800DD97
          3F00BA681E00D5AE9300E9D6C000AA560500AA5605009F4E0500268AF300006C
          E9000144B70078A8F400C8F3FF000027A2000027A2000027A200E9AB5800CC84
          3400BE762C00FFFDFA00FFFFFF00BE762C00AA5605009F4E0500268AF3000055
          ED000350CB00FFFFFF00FFFFFF000350CB000027A2000027A200E9AB5800C275
          2000E8C09500FFFFFF00FFFFFF00E7CBAD009F4E05009F4E0500268AF3000350
          CB008EDCFF00FFFFFF00FFFFFF00B2ECFF000027A2000027A20000000000CC84
          3400FFFFFF000000000000000000FFFFFF00BA681E000000000000000000006C
          E900FFFFFF000000000000000000FFFFFF000144B70000000000000000000000
          00001563C5000550B900043EA700043EA7000000000000000000000000000000
          00001563C5000550B900043EA700043EA7000000000000000000000000002372
          D10044CEFB0013B7F6000EB4F1000CA4E600043EA70000000000000000002372
          D10044CEFB0013B7F6000EB4F1000CA4E600043EA70000000000000000002372
          D10044CEFB0014BCFE000EB4F1000CA4E600043EA70000000000000000002372
          D10044CEFB0014BCFE000EB4F1000CA4E600043EA70000000000000000005F5E
          5E0044CEFB0014BCFE000EB4F1000CA4E6000000000000000000000000005F5E
          5E0044CEFB0014BCFE000EB4F1000CA4E6000000000000000000000000007E7D
          7D0044CEFB003F3E3E00202020000D0D0D000000000000000000000000007E7D
          7D0044CEFB003F3E3E00202020000D0D0D000000000000000000000000009798
          9700FFFFFF005555550033333300202020000D0D0D0000000000000000009798
          9700FFFFFF005555550033333300202020000D0D0D0000000000000000000000
          00008A8A8A00686969004E4E4E00333333000000000000000000000000000000
          00008A8A8A00686969004E4E4E00333333000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF00000000000000000000000000000000000000000000000000000000
          00000000000081810000C3C30000818100008181000081810000818100008181
          0000C3C30000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000004E4E4E003F3E3E00333333002727
          270020202000151515000D0D0D00070707000000000000000000000000000000
          0000000000000000000000000000000000005555550057B66E0057B66E0057B6
          6E0057B66E0057B66E0057B66E0057B66E0057B66E0000000000000000000000
          000000000000202020000D0D0D000000000068696900FFFCF700FFF9F200FFF9
          F2000387220003872200038722000387220057B66E0007070700000000000000
          00003F3E3E0000000000000000000000000072727200FFF8E800FFF3DC00FFF3
          DC00FFF3DC00FFF3DC00FFF3DC000387220057B66E000D0D0D00000000000000
          0000474747000000000000000000000000008A8A8A00FFF3DC00FFEBC500FFEB
          C500FFEBC500FFEBC500FFEBC500FFEBC500FFF3DC00151515007E7D7D006869
          6900555555003F3E3E00333333000000000097989700FFEFC80014BCFE00FEE3
          AB00FEE3AB00FEE3AB00FEE3AB00FEE3AB00FFEFC80020202000000000007E7D
          7D005F5E5E004E4E4E000000000000000000A7A9A900FEE7B700FEE7B700FEE7
          B700FEE7B700FEE7B700FEE7B700FEE7B700FEE7B70033333300000000000000
          000072727200000000000000000000000000A7A9A900A7A9A900979897008A8A
          8A007E7D7D00686969005F5E5E0055555500474747003F3E3E00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000E0660300E066
          0300E0660300E0660300E0660300E0660300E0660300E0660300E0660300E066
          0300E0660300E0660300E0660300E0660300E0660300E0660300E0660300F5AB
          5F00F5AB5F00F5AB5F00F5AB5F00F5AB5F00F5AB5F00F5AB5F00F5AB5F00F5AB
          5F00F5AB5F00F5AB5F00F5AB5F00F5AB5F00F5AB5F00E0660300EE730900FCBC
          68005F5E5E005555550047474700FAC08000F5952E00F5952E00F5952E00F595
          2E00F5952E00F5952E00F5952E00F5952E00FCBC6800EE730900EE730900FAC0
          80007E7D7D00FEE3BD005F5E5E00F6C79700F8A64700F8A64700F8A64700F8A6
          4700F8A64700F8A64700F8A64700F8A64700FAC08000EE730900EE730900FBD5
          9A00979897008A8A8A007E7D7D00FBD9AB00FCC07300FCC07300FCC07300FCC0
          7300FCC07300FCC07300FCC07300FCC07300FBD59A00EE730900FA7D0E00FEE3
          BD00FEE3BD00FEE3BD00FEE3BD00FEE3BD00FEE3BD00FEE3BD00FEE3BD00FEE3
          BD00FEE3BD00FEE3BD00FEE3BD00FEE3BD00FEE3BD00FA7D0E00FA7D0E00FA7D
          0E00FA7D0E00FA7D0E00FA7D0E00FA7D0E00FA7D0E00FA7D0E00FA7D0E00FA7D
          0E00FA7D0E00FA7D0E00FA7D0E00FA7D0E00FA7D0E00FA7D0E00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FC000000FC000000E4000000DC000000DC000000040000008C00
          0000DC000000FFFF000000000000000000000000000000000000000000000000
          000000000000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000FDD482000027A200043EA7001048B8001048B8001563C5002372D1002372
          D100000000000000000000000000000000000000000000000000000000000000
          0000FEDDA5001048B8001563C5002372D1002372D1003E81E2003E81E2003E81
          E2004D90E5004D90E50000000000000000000000000000000000000000000000
          0000FFEFC8002372D1003E81E2003E81E2004D90E5006B89ED006B89ED006B89
          ED0078A8F40078A8F40078A8F400272727002727270027272700000000000000
          0000FFF8E8002372D1004D90E5006B89ED0078A8F40078A8F4006B89ED00FFE0
          B40078A8F4008C96F00095CDDF00FEDDA500FAD6A30033333300000000000000
          000000000000000000004A6FC2004A6FC2004D7ECA00788FCB00FEE3BD00FEC6
          7800FCBC6800FCBC6800FBBB5800FBBB5800FEDDA5003F3E3E00000000000000
          000000000000000000000000000072727200FFFFFF005F5E5E00FFEBC500FBCB
          8500FEC67800FCC07300FCBC6800FBBB5800FBD9AB0047474700000000000000
          000000000000000000000000000072727200FFFFFF0068696900FCE8CD00FCD4
          8C00FBCB8500FEC67800FCC07300FCBC6800FADBAF0051515100000000000000
          00000000000000000000000000007E7D7D00FFFFFF0072727200FFF1CE00FBD5
          9A00FCD48C00FBCB8500FEC67800FCC07300FFE0B4005F5E5E00000000000000
          00000000000000000000000000007E7D7D00FFFFFF0072727200FFF2D500FEDD
          A500FBD59A00FCD48C00FBCB8500FFC67C00FEE3BD0068696900000000000000
          00000000000000000000000000008A8A8A00FFFFFF007E7D7D00FFF3DC00FFF2
          D500FBEBD600FCE8CD00FFEBC500FCE4C100FEE3BD0072727200000000000000
          00000000000000000000000000008A8A8A008A8A8A007E7D7D007E7D7D007E7D
          7D007E7D7D007E7D7D0072727200727272007272720072727200000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF0000FFFF0000FFFF0000003F0000000F0000000000000000
          0000F0000000F8000000F8000000F8000000F8000000F8000000F8000000FFFF
          0000FFFF0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000072727200686969005F5E5E00555555004E4E4E004747
          47003F3E3E003333330033333300272727002727270020202000000000000000
          000000000000000000007E7D7D00A6EED000A6EED000A6EED000A6EED00088EE
          C20088EEC20088EEC20088EEC20088EEC20088EEC20027272700000000000000
          000000000000000000007E7D7D00C5F4E10061D59E0061D59E0037DA920037DA
          920037DA920037DA920025C4770025C4770088EEC20027272700000000000000
          000000000000000000008A8A8A00C5F4E10077E7B50077E7B50061D59E0061D5
          9E0037DA920037DA920037DA920037DA920088EEC20033333300727272006869
          69005F5E5E005555550072727200979897006B938A0048866C0048866C004886
          6C0048866C0048866C0037DA920037DA920088EEC200333333007E7D7D00FEE7
          B700FEE7B700FEE3B100979897005353F0005353F0005353F0005353F0005353
          F0005353F00048866C0061D59E0037DA9200A6EED0003F3E3E007E7D7D00FCE4
          C100FCCF7A00FBCC7100A7A9A9005353F0001C1CE6001C1CE6001C1CE6001C1C
          E6005353F00048866C0061D59E0061D59E00A6EED000474747008A8A8A00FFEB
          C500FDD48200FCCF7A00A7A9A9006B89ED001C1CE6001C1CE6001C1CE6001C1C
          E6005353F00048866C0077E7B50061D59E00A6EED0005151510097989700FFEF
          C800FCD48C00FDD48200BCBBBA006B89ED005353F0001C1CE6001C1CE6001C1C
          E6005353F0006B938A0088EEC20077E7B500A6EED0005F5E5E0097989700FFF1
          CE00FBD59A00FCD48C00BCBBBA008C96F0005353F0005353F0005353F0005353
          F0006B89ED006B938A0088EEC20088EEC200C5F4E10068696900A7A9A900FFF2
          D500FEDDA500FBD59A00BCBBBA008C96F0008C96F0008C96F0008C96F0008C96
          F0008C96F00097989700C5F4E100C5F4E100C5F4E10072727200A7A9A900FFF3
          DC00FEE3AB00FEDDA500BCBBBA00BCBBBA00BCBBBA00BCBBBA00A7A9A900A7A9
          A900A7A9A90072727200979897008A8A8A007E7D7D007E7D7D00BCBBBA00FFF3
          DC00FEE7B700FEE3B100FEDDA500FEDDA500FBD59A00FCD48C00FCD48C00FDD4
          8200FEE3BD005F5E5E0000000000000000000000000000000000BCBBBA00FFF4
          E700FFECBF00FEE7B700FEE3B100FEE3AB00FEDDA500FBD59A00FBD59A00FCD4
          8C00FFECBF006869690000000000000000000000000000000000BCBBBA00FFF8
          E800FFF4E700FEF2E400FFF3DC00FFF3DC00FFF2D500FFF2D500FFF1CE00FFEF
          C800FFEBC5007272720000000000000000000000000000000000BCBBBA00BCBB
          BA00BCBBBA00BCBBBA00A7A9A900A7A9A900A7A9A90097989700979897008A8A
          8A007E7D7D007E7D7D0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000F0000000F0000000F0000000F000000000000000000000000000
          00000000000000000000000000000000000000000000000F0000000F0000000F
          0000000F0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000550B9000550
          B9000550B9000144B7000144B7000144B700043EA700043EA700043EA700043E
          A700043EA700043EA700000000000000000000000000000000000350CB00B2EC
          FF00B2ECFF0099E7FD0099E7FD008EDCFF007BDBFF007BDBFF0069CFFF0069CF
          FF0069CFFF00043EA700000000000000000000000000000000000265D100B2EC
          FF007BDBFF006BDCFF005AD2FF0044CEFB0036C2FE0036C2FE002AB4FD000144
          B7000144B700043EA700000000000000000000000000000000000265D100B2EC
          FF007BDBFF006BDCFF005AD2FF0044CEFB0036C2FE0036C2FE002AB4FD0014BC
          FE0069CFFF00043EA7004A6FC2004A6FC2004A6FC2004A6FC2000265D100B2EC
          FF007BDBFF006BDCFF005AD2FF0044CEFB000144B7000144B7000144B7000144
          B7000144B700043EA70099E7FD008EDCFF008EDCFF004A6FC2000265D100B2EC
          FF007BDBFF006BDCFF005AD2FF0044CEFB0036C2FE0036C2FE002AB4FD0014BC
          FE0069CFFF000144B70069CFFF004D7ECA004D7ECA004D7ECA000265D100B2EC
          FF007BDBFF006BDCFF005AD2FF0044CEFB0036C2FE0036C2FE002AB4FD000144
          B7000144B7000144B70069CFFF005FCCFF008EDCFF004D7ECA000265D100B2EC
          FF007BDBFF006BDCFF005AD2FF0044CEFB0036C2FE0036C2FE002AB4FD0014BC
          FE0069CFFF000144B7004D7ECA004D7ECA004D7ECA004D7ECA00006CE900B2EC
          FF007BDBFF006BDCFF005AD2FF0044CEFB000144B7000144B7000144B7000144
          B7000144B7000550B90069CFFF005FCCFF008EDCFF004D7ECA00006CE900B2EC
          FF007BDBFF006BDCFF005AD2FF0044CEFB0036C2FE0036C2FE002AB4FD0014BC
          FE0069CFFF000550B90069CFFF004D7ECA004D7ECA004D7ECA00006CE900B2EC
          FF007BDBFF006BDCFF005AD2FF0044CEFB0036C2FE0036C2FE002AB4FD000144
          B7000144B7000550B90069CFFF005FCCFF008EDCFF004D7ECA00006CE900B2EC
          FF00B2ECFF0099E7FD0099E7FD008EDCFF007BDBFF007BDBFF0069CFFF0069CF
          FF0069CFFF000550B9004D7ECA004D7ECA004D7ECA004D7ECA00006CE900006C
          E900006CE900006CE9000265D1000265D1000265D1000265D1000265D1000350
          CB000350CB000350CB0069CFFF005FCCFF008EDCFF004D7ECA00000000000000
          000000000000000000004D90E500C8F3FF0099E7FD0099E7FD008EDCFF007BDB
          FF007BDBFF0069CFFF0069CFFF004D7ECA004D7ECA004D7ECA00000000000000
          000000000000000000004D90E500C8F3FF00C8F3FF00B2ECFF00B2ECFF00B2EC
          FF00B2ECFF0099E7FD0099E7FD008EDCFF008EDCFF004D7ECA00000000000000
          000000000000000000004D90E5004D90E5004D90E5004D90E5004D90E5004D90
          E5004D90E5004D90E5004D90E5004D90E5004D90E5004D7ECA00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000000F0000000F0000000F00000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000F0000000F000
          0000F0000000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000AD531100AD531100AD53
          11009F4E05009F4E0500904807008F3402008F3402008F340200000000000000
          00000000000000000000000000000000000000000000BA681E00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008F340200000000000000
          00000000000000000000000000000000000000000000C56E2000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0090480700000000000000
          00000000000000000000000000000000000000000000CD732300FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009F4E0500CC520B00CC52
          0B00CC520B00CC520B00C6510A00C6510A00C6510A00DA782200FFFFFF008F34
          02008F3402008F340200FFFFFF00FFFFFF00FFFFFF00AD531100DA661900FFF8
          DD00FFF8DD00FFFAE400FFF8DD00FFF8DD00FFFAE400E1802800FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD531100E3691C00FFFA
          E400FFFAE400FFFAE400FFFAE400FFFAE400FFFAE400E68C3400FFFFFF008F34
          02008F3402008F3402008F3402008F340200FFFFFF00BA681E00E3691C00FADD
          B400FADDB400FADDB400FADDB400FADDB400FADDB400EF963400FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C56E2000E6752300FFFE
          F100FFFEF100FFFFF500FFFEF100FFFEF100FFFFF500FAA13900FFFFFF008F34
          02008F3402008F3402008F3402008F340200FFFFFF00CD732300E6752300FFFF
          F500FFFFF500FFFFF500FFFFF500FFFFF500FFFFF500FAA13900FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DA782200ED7E2A00FADE
          C000FADEC000FADEC000FADEC000FADEC000FADEC000FAA13900FAA13900FAA1
          3900FAA13900EF963400EF963400E68C3400E48A2E00E1802800ED7E2A00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00DA78220000000000000000000000000000000000EE862E00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00E675230000000000000000000000000000000000EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C
          2A00EF8C2A00EF8C2A0000000000000000000000000000000000F1963C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC6
          7C00FFC67C00F1963C0000000000000000000000000000000000F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A3
          5100F3A35100F3A3510000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FE000000FE000000FE000000FE00000000000000000000000000
          000000000000000000000000000000000000000F0000000F0000000F0000000F
          0000000F0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000074190000741
          9000062C7700062C7700062C7700062C7700062C770000000000000000000000
          00000000000000000000000000000000000000000000105AA30076E5FF00C8F3
          FF0076E5FF0036C2FE0001ACF4000494F1000494F100062C7700000000000000
          000000000000000000000000000000000000000000001863AD0076E5FF00C8F3
          FF0076E5FF0038D4FE0001ACF4000494F1000494F100062C7700000000000000
          000000000000000000000000000000000000000000001E79BD0076E5FF00C8F3
          FF0076E5FF0038D4FE0014BCFE0001ACF4000494F100062C7700CC520B00CC52
          0B00CC520B00CC520B00C6510A00C6510A00C6510A002593D00076E5FF00E1FA
          FF0076E5FF0038D4FE0014BCFE0001ACF4000494F100062C7700DA661900FFF8
          DD00FFF8DD00FFFAE400FFF8DD00FFF8DD00FFFAE4002593D00076E5FF00E1FA
          FF0076E5FF0038D4FE0014BCFE0001ACF40001ACF400062C7700E3691C00FFFA
          E400FFFAE400FFFAE400FFFAE400FFFAE400FFFAE40032BBE9005DB4E600529F
          D5003D93B6001863AD000741900007419000062C770007419000E3691C00FADD
          B400FADDB400FADDB400FADDB400FADDB400FADDB40032BBE90076E5FF00E1FA
          FF0076E5FF0038D4FE0014BCFE0001ACF40001ACF40007419000E6752300FFFE
          F100FFFEF100FFFFF500FFFEF100FFFEF100FFFFF5002CCEFB0064CBEA0079BB
          E500529FD5001E79BD000755AB00074190000741900007419000E6752300FFFF
          F500FFFFF500FFFFF500FFFFF500FFFFF500FFFFF50038D4FE00F7FEFF00FFFF
          FF00F7FEFF00E1FAFF00C8F3FF00B2ECFF008EDCFF00043EA700ED7E2A00FADE
          C000FADEC000FADEC000FADEC000FADEC000FADEC000FADEC00064CBEA0095CD
          DF0064CBEA0032BBE9000CA4E6000887DD000887DD0000000000ED7E2A00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00DA78220000000000000000000000000000000000EE862E00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00E675230000000000000000000000000000000000EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C
          2A00EF8C2A00EF8C2A0000000000000000000000000000000000F1963C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC6
          7C00FFC67C00F1963C0000000000000000000000000000000000F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A3
          5100F3A35100F3A3510000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FF010000FE000000FE000000FE00000000000000000000000000
          000000000000000000000000000000010000000F0000000F0000000F0000000F
          0000000F0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000AA5605009F4E
          05009F4E05009F4E05009F4E05009F4E05009F4E050090480700904807009048
          0700904807009048070090480700904807009048070090480700AA560500FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0090480700AA560500FFFF
          FF00FFF5EB00FFF5EB00FFF5EB00FFF4E700FFF4E700FEF2E400FEF2E400FEF2
          E400FDEEDC00FDEEDC00FDEEDC00FDEEDC00FFFFFF0090480700AA560500FFFF
          FF00FFF9F200FEF7EF00FEF7EF00FFF5EB00FFF5EB00FFF5EB00FFF4E700FFF4
          E700FEF2E400FEF2E400FEF2E400FEF2E400FFFFFF0090480700AA560500FFFF
          FF00FFFAF500FFFAF500FFF9F200FFF9F200FEF7EF00FEF7EF00FFF5EB00FFF5
          EB00FFF5EB00FFF4E700FFF4E700FEF2E400FFFFFF0090480700B55D0500FFFF
          FF00FFFDFA00FFFCF700FFFCF700FFFAF500FFFAF500FFF9F200FFF9F200FEF7
          EF00FEF7EF00FEF7EF00FFF5EB00FFF5EB00FFFFFF0090480700B55D0500FFFF
          FF00FFFDFB00FFFDFB00FFFDFA00FFFDFA00FFFCF700FFFCF700FFFAF500FFFA
          F500FFF9F200FFF9F200FEF7EF00FEF7EF00FFFFFF009F4E0500B55D0500FFFF
          FF00FFFFFF00FFFFFE00FFFFFE00FFFDFB00FFFDFB00FFFDFA00FFFDFA00FFFC
          F700FFFCF700FFFAF500FFFAF500FFFAF500FFFFFF009F4E0500C1640600FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009F4E0500C1640600EDB7
          8300EDB78300EDB78300EDB78300EDB78300EDB78300EDB78300EDB78300EDB7
          8300EDB78300EDB78300EDB78300EDB78300EDB78300AA560500C1640600EA9E
          5400EA9E5400EA9E5400EA9E5400EA9E5400EA9E5400EA9E5400EA9E5400EA9E
          5400EA9E5400F5CFAA00F5CFAA00F5CFAA00F5CFAA00AA560500C1640600E68C
          3400E68C3400E68C3400E68C3400E68C3400E68C3400E68C3400E68C3400E68C
          3400E68C3400F6C797001C1CE6001C1CE600F6C79700AA560500C1640600DA78
          2200DA782200DA782200DA782200DA782200DA782200DA782200DA782200DA78
          2200DA782200E8C095001C1CE6001C1CE600E8C09500B55D0500C1640600CB6D
          1100CB6D1100CB6D1100CB6D1100CB6D1100CB6D1100CB6D1100CB6D1100CB6D
          1100CB6D1100EDB78300EDB78300EDB78300EDB78300B55D050000000000E9A9
          6B00E9A96B00E9A96B00E9A96B00E9A96B00E9A96B00E9A96B00E9A96B00E9A9
          6B00E9A96B00E9A96B00E9A96B00E9A96B00E9A96B0000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000080010000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000050505004747470000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00003F3E3E004E4E4E0055555500979897000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFFFF00F7F7F700BCBBBA0097989700CFCFCF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFFFF00FFFFFF00F7F7F700C4D8E7002372D1000755AB000000
          0000000000000000000000000000000000000000000000000000CC520B00CC52
          0B00CC520B00D0652700FFFAF500E1FAFF0036C2FE00268AF3001563C5000755
          AB00000000000000000000000000000000000000000000000000DA661900FFF8
          DD00FFF8DD00FFFAE400F0F9F20049D9FF0036C2FE002AB4FD00268AF3001563
          C5000755AB000000000000000000000000000000000000000000E3691C00FFFA
          E400FFFAE400FFFAE400FFFAE40099E7FD0038D4FE0036C2FE002AB4FD00268A
          F3001563C5000755AB0000000000000000000000000000000000E3691C00FADD
          B400FADDB400FADDB400FADDB400FADDB40095CDDF0038D4FE0036C2FE002AB4
          FD00268AF3001563C5000755AB00000000000000000000000000E6752300FFFE
          F100FFFEF100FFFFF500FFFEF100FFFEF100FFFFF50099E7FD0038D4FE0036C2
          FE002AB4FD00268AF3001563C5000755AB000000000000000000E6752300FFFF
          F500FFFFF500FFFFF500FFFFF500FFFFF500FFFFF500FFFFF50099E7FD0038D4
          FE0036C2FE002AB4FD00268AF3002372D100A7A9A90000000000ED7E2A00FADE
          C000FADEC000FADEC000FADEC000FADEC000FADEC000FADEC000FADEC00095CD
          DF0038D4FE0036C2FE002AB4FD006869690033333300A7A9A900ED7E2A00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0099E7FD0044CEFB009D8EA6008A8A8A007272720051515100EE862E00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00C0937400CFCFCF00CFCFCF00BCBBBA0000000000EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00E3E3E100E3E3E1000000000000000000F1963C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC6
          7C00FFC67C00F1963C0000000000000000000000000000000000F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A3
          5100F3A35100F3A3510000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000CFFF0000C3FF0000E0FF0000E07F0000003F0000001F0000000F
          000000070000000300000001000000000000000000000001000000030000000F
          0000000F0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000887DD000CA4E6000887DD001563C5004A6FC200788FCB000000
          0000000000000000000000000000788FCB0079BBE500000000000000000032BB
          E90001BFF30001ACF40001ACF40001ACF40001ACF4000494F1000265D1004654
          B2000000000000000000788FCB005DB4E60000000000000000000000000021C5
          FE0001BFF30001ACF40001ACF40001ACF40001ACF4000494F1000494F100006C
          E900043EA7003D93B6005DB4E60000000000000000000000000065D4F0002CCE
          FB0001BFF30001ACF40001ACF40001ACF40001ACF4000494F100006CE9000055
          ED000265D100161993000000000000000000000000000000000065D4F00021C5
          FE0001BFF30001ACF40001ACF40001BFF30001BFF3000494F1000055ED000055
          ED000055ED000265D1003939A00000000000000000000000000065D4F00013B7
          F60001ACF40001ACF40001BFF30001BFF30016C6F30001ACF400006CE9000055
          ED00006CE9000494F1000144B70000000000000000000000000073CFF00013B7
          F60001ACF40001ACF40001BFF30011AFEA005DB4E60059D1F20013B7F6000494
          F1000494F1000494F1000265D1001863AD0000000000000000000000000032BB
          E9000EB4F1000EB4F10016C6F3000265D1000027A2002593D00059D1F20001AC
          F4000494F1000494F1000494F100043EA70000000000000000000000000065D4
          F00044CEFB002CCEFB002CCEFB00595234001863AD000027A20044CEFB0001BF
          F3000494F1000494F10001ACF4000550B9000000000000000000000000000000
          000059D1F20044CEFB00C164060097A883000265D1000265D10001BFF30001BF
          F30001ACF40001ACF40001ACF4000550B9000000000000000000000000000000
          000000000000B55D0500B2BA8B002CCEFB0016C6F30001BFF30001BFF30001BF
          F30001BFF30001BFF30001BFF3001048B8000000000000000000000000002727
          270000000000151515002CCEFB002CCEFB0016C6F3000CA4E60016C6F30001BF
          F30001BFF30001BFF30001ACF4001E79BD000000000000000000555555000707
          070015151500A7A9A9000000000044CEFB0044CEFB00000000000000000038D4
          FE0001BFF30001BFF30032BBE900000000000000000000000000000000009798
          97004E4E4E000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF0000E07900008033000080070000000F0000000700000007
          0000000300008003000080030000C0030000E003000080030000098700001FFF
          0000FFFF0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000007018000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000007018000070180000000000000000000000000000000000000000000000
          0000000000000000000000000000007018000070180000701800007018000070
          18000070180057B66E0000701800000000000000000000000000000000000000
          00000000000000000000000000000387220061D59E0061D59E0061D59E0061D5
          9E0057B66E0057B66E0057B66E00007018000000000000000000C0937400C093
          7400B3816200B3816200B38162000387220077E7B50025C4770025C4770025C4
          770015A7540015A7540015A7540057B66E000070180000000000D5AE9300EFE5
          D000EFE5D000E9D6C000D5AE93000387220077E7B50037DA920037DA920025C4
          770025C4770025C4770015A7540015A7540057B66E0000701800D5AE9300EFE5
          D000E2CAB300C0937400B38162000387220088EEC20037DA920037DA920037DA
          920037DA920025C4770025C4770061D59E000070180000000000DABBA100E9D6
          C000CDA18500DABBA100EFE5D0000387220088EEC20088EEC20088EEC20077E7
          B50077E7B50077E7B50061D59E00007018000000000000000000DABBA100DEC1
          A800D5AE9300EFE5D000EFE5D000038722000387220003872200038722000387
          22000387220077E7B50003872200000000000000000000000000DEC1A800D5AE
          9300DEC1A800E9D6C000CDA18500C0937400CDA18500EFE5D000EFE5D000C093
          7400038722000387220000000000000000000000000000000000DEC1A800D5AE
          9300DEC1A800EFE5D000E9D6C000DABBA100C0937400EFE5D000EFE5D000C093
          740003872200B381620000000000000000000000000000000000DEC1A800DEC1
          A800D5AE9300EFE5D000EFE5D000E9D6C000CDA18500EFE5D000EFE5D000B381
          6200D5AE9300B381620000000000000000000000000000000000DABBA100E9D6
          C000D5AE9300E2CAB300EFE5D000EFE5D000E9D6C000EFE5D000DABBA100C093
          7400E9D6C000B381620000000000000000000000000000000000DABBA100EFE5
          D000E2CAB300D5AE9300D5AE9300DEC1A800DEC1A800D5AE9300CDA18500E2CA
          B300EFE5D000B381620000000000000000000000000000000000DABBA100EFE5
          D000EFE5D000E9D6C000DEC1A800D5AE9300D5AE9300DEC1A800EFE5D000FBEB
          D600FBEBD600B381620000000000000000000000000000000000D5AE9300DABB
          A100D5AE9300D5AE9300CDA18500CDA18500CDA18500CDA18500C0937400C093
          7400C0937400B076520000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFDF0000FFCF0000F8070000F803000000010000000000000001
          00000003000000070000000F0000000F0000000F0000000F0000000F0000000F
          0000000F0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000007018000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000007018000070180000000000000000000000000000000000000000000000
          0000000000000000000000000000007018000070180000701800007018000070
          18000070180057B66E0000701800000000000000000000000000000000000000
          00000000000000000000000000000387220061D59E0061D59E0061D59E0061D5
          9E0057B66E0057B66E0057B66E00007018000000000000000000CC520B00CC52
          0B00CC520B00CC520B00C6510A000387220077E7B50025C4770025C4770025C4
          770015A7540015A7540015A7540057B66E000070180000000000DA661900FFF8
          DD00FFF8DD00FFFAE400FFF8DD000387220077E7B50037DA920037DA920025C4
          770025C4770025C4770015A7540015A7540057B66E0000701800E3691C00FFFA
          E400FFFAE400FFFAE400FFFAE4000387220088EEC20037DA920037DA920037DA
          920037DA920025C4770025C4770061D59E000070180000000000E3691C00FADD
          B400FADDB400FADDB400FADDB4000387220088EEC20088EEC20088EEC20077E7
          B50077E7B50077E7B50061D59E00007018000000000000000000E6752300FFFE
          F100FFFEF100FFFFF500FFFEF100038722000387220003872200038722000387
          22000387220077E7B50003872200000000000000000000000000E6752300FFFF
          F500FFFFF500FFFFF500FFFFF500FFFFF500FFFFF500FFFFF500FFFFF500FFFF
          F500038722000387220000000000000000000000000000000000ED7E2A00FADE
          C000FADEC000FADEC000FADEC000FADEC000FADEC000FADEC000FADEC000FADE
          C00003872200DA66190000000000000000000000000000000000ED7E2A00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00DA78220000000000000000000000000000000000EE862E00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00E675230000000000000000000000000000000000EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C
          2A00EF8C2A00EF8C2A0000000000000000000000000000000000F1963C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC6
          7C00FFC67C00F1963C0000000000000000000000000000000000F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A3
          5100F3A35100F3A3510000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFDF0000FFCF0000F8070000F803000000010000000000000001
          00000003000000070000000F0000000F0000000F0000000F0000000F0000000F
          0000000F0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000008484840084848400848484008484
          8400848484008484840084848400848484008484840084848400000000000000
          000000000000000000000000000084848400C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400000000000000
          0000000000008484840084848400FF000000C6C6C600FFFFFF0000FFFF00FFFF
          FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00C6C6C60084848400000000000000
          000084848400FF000000FF000000FF000000C6C6C600FFFFFF00FFFFFF00FFFF
          FF0000FFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60084848400000000008484
          8400FF000000FF000000FF000000FF000000C6C6C600FFFFFF0000FFFF008484
          84008484840084848400C6C6C600FFFFFF00C6C6C60084848400000000008484
          8400FF000000FF000000FF000000FF000000C6C6C600FFFFFF0084848400FF00
          0000FF000000FF00000084848400FFFFFF00C6C6C6008484840084848400FF00
          0000FF000000FF000000FF000000FF000000C6C6C600FFFFFF0084848400C6C6
          C60084848400FF00000084848400FFFFFF00C6C6C6008484840084848400FF00
          0000FF000000FF0000008484840084848400C6C6C600FFFFFF0084848400FFFF
          FF00C6C6C6008484840084848400FFFFFF00C6C6C6008484840084848400FF00
          0000FF000000848484008484840084848400C6C6C600FFFFFF0000FFFF008484
          84008484840084848400C6C6C600FFFFFF00C6C6C6008484840084848400FF00
          0000FF000000848484008484840084848400C6C6C600FFFFFF00FFFFFF00FFFF
          FF0000FFFF00FFFFFF008484840084848400848484008484840084848400FF00
          0000FF000000C6C6C6008484840084848400C6C6C600FFFFFF0000FFFF00FFFF
          FF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000C6C6
          C600FF000000FF000000FFFFFF00C6C6C600C6C6C600FFFFFF00FFFFFF00FFFF
          FF0000FFFF00FFFFFF00C6C6C600C6C6C600000000000000000000000000C6C6
          C600FF000000FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
          0000C6C6C600FF000000FF000000C6C6C600FFFFFF00C6C6C600848484008484
          8400848484008484840084848400000000000000000000000000000000000000
          000000000000C6C6C600C6C6C600FF000000FF000000FFFFFF00C6C6C6008484
          8400848484008484840000000000000000000000000000000000000000000000
          0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FC000000F8000000E0000000C000000080000000800000000000
          0000000000000000000000000000000100008003000080030000C0070000E00F
          0000F83F0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
          00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000000000000000
          0000FF00000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF00
          00008400000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000848400FF00
          00000000000084000000FF000000FF000000FF000000FF00000084000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000008484000084
          840084000000FF000000FF000000C6C6C600C6C6C60084000000FF0000008400
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000848400C6C6
          C60084000000FF00000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000000000000084
          840000FFFF00FF000000FF000000FF000000FF000000FF000000FF0000008400
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000000000000000
          00000084840000FFFF00FF000000FFFFFF00FFFFFF0084000000FF0000008400
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000000000000000
          0000000000000084840000FFFF00FF000000FF000000FF00000084000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000000000000000
          00000000000084848400FF000000FF000000FF00000084000000FFFFFF00FF00
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000000000000000
          00000000000084848400FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFF
          FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
          00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00C6C6C600FFFFFF008484840000000000000000000000
          00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00C6C6C600848484000000000000000000000000000000
          0000000000008484840084848400848484008484840084848400848484008484
          8400848484008484840084848400000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000E0000000E0000000E0000000C000000080000000000000000000
          00000000000080000000C0000000E0000000E0000000E0000000E0010000E003
          0000E0070000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000008484840084848400848484008484
          8400848484008484840084848400848484008484840000000000000000000000
          0000000000000000000000000000FF00000084848400FFFFFF0000FFFF00FFFF
          FF00FFFFFF00FFFFFF0000FFFF00FFFFFF008484840000000000000000000000
          000000000000FF000000FF000000FF00000084848400FFFFFF00FFFFFF00FFFF
          FF0000FFFF00FFFFFF00FFFFFF00FFFFFF008484840000000000000000000000
          0000FF000000FF000000FF000000FF00000084848400FFFFFF0000FFFF008400
          0000840000008400000084848400FFFFFF008484840000000000000000000000
          0000FF000000FF000000FF000000FF00000084848400FFFFFF0084840000FF00
          0000FF000000FF00000084000000FFFFFF00848484000000000000000000FF00
          0000FF000000FF000000FF000000FF00000084848400FFFFFF00848400008484
          840000840000FF00000084000000FFFFFF00848484000000000000000000FF00
          0000FF000000FF000000008400000084000084848400FFFFFF0084840000FFFF
          FF00848484000084000084000000FFFFFF00848484000000000000000000FF00
          0000FF00000000840000008400000084000084848400FFFFFF0000FFFF008484
          0000848400008484000084848400FFFFFF00848484000000000000000000FF00
          0000FF00000000840000008400000084000084848400FFFFFF00FFFFFF00FFFF
          FF0000FFFF00FFFFFF000000000000000000000000000000000000000000FF00
          0000FF00000000000000008400000084000084848400FFFFFF0000FFFF00FFFF
          FF00FFFFFF00FFFFFF0084848400FFFFFF008484840000000000000000008484
          8400FF000000FF000000FFFFFF000000000084848400FFFFFF00FFFFFF00FFFF
          FF0000FFFF00FFFFFF0084848400848484000000000000000000000000008484
          8400FF000000FFFFFF0000000000FFFFFF008484840084848400848484008484
          8400848484008484840084848400000000000000000000000000000000000000
          000084848400FF000000FF00000000000000FFFFFF0000000000008400000084
          0000008400000084000000000000000000000000000000000000000000000000
          0000000000008484840084848400FF000000FF000000FFFFFF00000000000084
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000848484008484840084848400848484008484
          8400000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FC000000F8000000E0000000C000000080000000800000000000
          0000000000000000000000000000100100008403000088030000C5070000E08F
          0000F83F0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000008484840084848400848484008484840084848400848484008484
          8400848484008484840084848400848484008484840000000000000000000000
          00000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C6008484840000000000000000000000
          0000FF00000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600848484000000000000000000FF00
          0000000000000000000000000000848400008484000084840000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600848484000000000000848400FF00
          000084000000FF000000FF000000FF000000FF000000FF00000084840000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6008484840000000000848484008484
          840084000000FF000000FF000000C6C6C600C6C6C600FF000000FF0000008484
          0000FFFFFF00FFFFFF00FFFFFF00C6C6C6008484840000000000848484008484
          840084840000FF00000084840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6008484840000000000000000008484
          8400C6C6C600FF00000084840000848400008484000084840000848400008484
          0000FFFFFF00FFFFFF00FFFFFF00C6C6C6008484840000000000000000008400
          000084848400C6C6C60084840000FFFFFF00FFFFFF00FF000000FFFF00008484
          0000FFFFFF00FFFFFF00FFFFFF00C6C6C6008484840000000000000000000000
          00008400000084848400C6C6C600FF000000FF000000FFFF000084840000FFFF
          FF00FFFFFF00FFFFFF00C6C6C600848484008484840000000000000000000000
          0000000000008400000084840000848400008484000084840000FFFFFF00FF00
          0000FFFFFF00C6C6C60084848400848484008484840000000000000000000000
          00000000000084848400FFFFFF00FFFFFF00FFFFFF008484000084840000FFFF
          FF00FFFFFF008484840000000000000000000000000000000000000000000000
          00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0084848400FFFFFF00848484000000000000000000000000000000
          00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF008484840084848400000000000000000000000000000000000000
          0000000000008484840084848400848484008484840084848400848484008484
          8400848484008484840000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF0000E0010000E0010000C0010000A0010000000100000001
          0000000100008001000080010000C0010000E0010000E0010000E0030000E007
          0000E00F0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008484
          8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008484
          8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008484
          8400FFFFFF00FFFFFF0084840000848400008484000084840000848400008484
          0000848400008484000084840000FFFFFF00FFFFFF0000000000000000008484
          8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008484
          8400FFFFFF00FFFFFF0084840000848400008484000084840000848400008484
          0000848400008484000084840000FFFFFF00FFFFFF0000000000000000008484
          8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008484
          8400FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF0084000000840000008400
          0000FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF0000000000000000008484
          8400FFFFFF00FFFF000084000000FFFFFF00848400008484000000840000FF00
          000084000000FFFFFF0084000000FFFF0000FFFFFF0000000000000000008484
          8400C6C6C60084000000FFFFFF00FFFFFF0084840000FFFF0000848400000084
          000084000000FFFFFF00FFFFFF0084000000C6C6C60000000000000000008484
          8400FFFFFF00FFFF000084000000FFFFFF0084840000FFFFFF00FFFF00008484
          000084000000FFFFFF0084000000FFFF0000FFFFFF0000000000000000008484
          8400FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF0084840000848400008484
          0000FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF0000000000000000008484
          8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
          8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00C6C6C600FFFFFF008484840000000000000000008484
          8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00C6C6C600848484000000000000000000000000008484
          8400848484008484840084848400848484008484840084848400848484008484
          8400848484008484840084848400000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF00008000000080000000800000008000000080000000800000008000
          0000800000008000000080000000800000008000000080000000800100008003
          000080070000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000008484840000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
          00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000000000000000
          00000000000084848400FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600FFFF
          FF00C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C60000000000000000000000
          00000000000084848400FFFFFF00FFFFFF00FFFFFF0000840000848484000084
          000084848400FFFFFF00C6C6C600FFFFFF00C6C6C60000000000008400008484
          84000084000084848400008400008484840000840000FFFFFF00008400008484
          840000840000FFFFFF00C6C6C600FFFFFF00C6C6C60000000000848484000084
          000084848400008400008484840000840000FFFFFF0000840000848484000084
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000008400008484
          8400008400008484840000840000FFFFFF000084000084848400008400008484
          8400C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C60000000000000000000084
          00008484840000840000FFFFFF00008400008484840000840000848484000084
          0000FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C60000000000000000000000
          000000840000FFFFFF0000840000848484000084000084848400C6C6C600C6C6
          C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C60000000000000000000084
          0000FFFFFF00008400008484840000840000848484000084000084848400C6C6
          C600FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000840000FFFF
          FF00008400008484840000840000848484000084000084848400008400008484
          8400C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C60000000000848484000084
          0000848484000084000084848400FFFFFF008484840000840000848484000084
          0000FFFFFF00FFFFFF0000000000000000000000000000000000008400008484
          84000084000084848400FFFFFF00FFFFFF00FFFFFF0084848400008400008484
          8400FFFFFF00FFFFFF0084848400FFFFFF000000000000000000000000000000
          00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
          0000000000008484840084848400848484008484840084848400848484008484
          8400848484008484840084848400000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000E0000000E0000000E0000000E0000000E0000000000000000000
          00000000000080000000C000000080000000000000000000000000010000E003
          0000E0070000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
          000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
          000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
          000084848400FFFFFF00FFFFFF00000000000000000000000000000000000000
          000000000000FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
          000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
          000084848400FFFFFF00FFFFFF00000000000000000000000000000000000000
          000000000000FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
          000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
          000084848400FFFFFF00FFFFFF00000000000000000000000000000000000000
          000000000000FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
          000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
          000084848400FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
          000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
          000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
          000084848400FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
          00000000000000000000FFFFFF0084848400FFFFFF0084848400FFFFFF008484
          8400FFFFFF0084848400FFFFFF00000000000000000000000000000000000000
          0000000000000000000000000000C0DCC00000000000C0DCC00000000000C0DC
          C00000000000C0DCC00000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000E0030000C0010000C0010000C0010000C0010000C0010000C001
          0000C0010000C0010000C0010000C0010000C0010000C0010000C0010000E003
          0000F0070000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
          000000000000000000008484840000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6
          C600C6C6C600848484000000000084848400000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6
          C600FFFF0000848484008484840000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6C600C6C6C600C6C6
          C600C6C6C60084848400C6C6C60000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6C600FFFF0000C6C6
          C600C6C6C60084848400C6C6C60000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400FFFF0000FFFF
          0000C6C6C600848484008484840000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6
          C600C6C6C600848484000000000000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6
          C60000000000000000000000000000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF0000000C0000000800000001000000030000000300000003
          0000000300000003000000070000000F0000000F0000000F0000001F0000003F
          0000007F0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C60000000000C6C6C600000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000C6C6C600000000000000000000000000C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000FFFF0000FFFF0000FF
          FF00C6C6C600C6C6C6000000000000000000000000000000000000000000C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400848484008484
          8400C6C6C600C6C6C60000000000C6C6C6000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000C6C6C600C6C6C6000000000000000000C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C60000000000C6C6C60000000000C6C6C60000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000C6C6C60000000000C6C6C6000000000000000000000000000000
          000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000C6C6C60000000000C6C6C60000000000000000000000
          00000000000000000000FFFFFF00000000000000000000000000000000000000
          0000FFFFFF000000000000000000000000000000000000000000000000000000
          00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000FFFFFF000000000000000000000000000000
          000000000000FFFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF0000C0070000800300000001000000010000000100000000
          00000000000080000000C0000000E0010000E0070000F0070000F0030000F803
          0000FFFF0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C60000000000C6C6C600000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000C6C6C600000000000000000000000000C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000FFFF0000FFFF0000FF
          FF00C6C6C600C6C6C6000000000000000000000000000000000000000000C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400848484008484
          8400C6C6C600C6C6C60000000000C6C6C6000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000C6C6C600C6C6C6000000000000000000C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C60000000000C6C6C60000000000C6C6C60000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000C6C6C60000000000C6C6C6000000000000000000000000000000
          000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000C6C6C60000000000C6C6C60084848400000000000000
          00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0084840000FFFF0000FFFF0000FFFF000000000000000000008484
          8400000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF000084840000000000000000000084848400000000000000
          0000FFFF000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
          0000FFFF0000FFFF000000000000000000000000000000000000000000008484
          8400000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF000084840000000000000000000084848400000000000000
          0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF008484840084840000FFFF0000FFFF0000FFFF000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000008484840000000000000000000000000084848400000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF0000C0070000800300000001000000010000000100000000
          00000000000080000000C0000000E0000000800000008007000080000000F000
          0000F8000000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000331
          5F00022D58000229520002274D00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000335
          6400FFFFFF000CA4FF0002285000000000000000000000000000EBAF5900E7A6
          4800E49D3800E0962B00DD8E2000DA8A1A00D8891900D6871800D48517000439
          6A00FFFFFF000DA6FF00032B5400000000000000000000000000ECB25B00FAE0
          A100F7D99600F4D18A00FBFBFB00FAFAFA00F9F9F900F8F8F80005457A0013B1
          FF0011ADFF000FA9FF000CA5FF00022A52000000000000000000EEB55F00FAE0
          A100F7D99600F4D18A00FDFDFD00FCFCFC00FBFBFB0007538C0017B8FF0015B4
          FF0012B0FF0010ACFF000EA8FF000CA4FF000229500000000000F0B76200FAE0
          A100F7D99600F4D18A00FEFEFE00FDFDFD000A629F00FFFFFF0018BAFF0016B6
          FF0005427500043B6B00FFFFFF000DA7FF000BA3FF0002284E00F2B96600FAE0
          A100F7D99600F4D18A00FFFFFF00FFFFFF000B6AA800FFFFFF001ABDFF00074F
          8700FAFAFA00F9F9F900043A6900FFFFFF000DA6FF00032B5300F4BC6800FAE0
          A100F7D99600F4D18A00FFFFFF00FFFFFF000D72B000FFFFFF001BBFFF000956
          8F00FCFCFC00FBFBFB00053F7000FFFFFF000EA8FF00032E5700F5BE6B00FAE0
          A100F7D99600F4D18A00FFFFFF00FFFFFF000F7BB900FFFFFF001CC2FF000A5D
          9700FDFDFD00FDFDFD0006447700FFFFFF0010ABFF0003315C00F6C16F00FAE0
          A100F7D99600F4D18A00FFFFFF00C7C7C700C7C7C7000E78B700FFFFFF000B65
          A000C7C7C700FEFEFE00074A7E00FFFFFF00053C6B0000000000F8C37200FAE0
          A100F7D99600F4D18A00FFFFFF00FFFFFF00FFFFFF00FFFFFF000E77B4000C6E
          A900FFFFFF00FFFFFF000851860006497C000000000000000000F9C57500FAE0
          A100F7D99600F4D18A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00E0911E00000000000000000000000000FAC77800FAE0
          A100F7D99600F4D18A00FFFFFF00C7C7C700C7C7C700C7C7C700C7C7C700C7C7
          C700C7C7C700FFFFFF00E2932000000000000000000000000000FBC97A00FAE0
          A100F7D99600F4D18A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00E4952100000000000000000000000000FCCB7D00FAE0
          A100F7D99600F4D18A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00E7972300000000000000000000000000FDCD8000FCC5
          6F00FBBE5F00F9B75000F8B14300F5AA3600F3A52D00F2A32A00F0A12900EE9F
          2800ED9D2700EB9B2600E99A2400000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FF870000FF870000000700000003000000010000000000000000
          0000000000000000000000010000000300000007000000070000000700000007
          000000070000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000009C4D12009A4C1100994A
          1000974A0F0096490F0000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000009E4E1400FFDCBE00FFD9
          B900FED5B300D4793A0097490F00000000000000000000000000000000000000
          00000000000000000000000000000000000000000000A1501500FFE1C700FFDE
          C200FEDBBD00D37A3A00D57B3C00984A10000000000000000000000000000000
          000010448F000F3C88000A358100062E7B00052B7600A4531600FFE5CE00FFE3
          CB00FFE1C600D27A3B00D47B3D00D77D3E00994B11000000000000000000105A
          A30076E7FF00C7F5FF0076E2FE0036C7FC0006A5F700A8551800FFE8D500FFE8
          D200FFE5CD00D27A3C00D47C3E005B2C09005A2B0900592B080000000000156A
          AF0076E7FF00CEF6FF0076E7FF0037D0FD0007B0FB00AB581A00FFECDA00FFEA
          D700FFE8D400D17A3C00D37C3E00D57F40009E4E13000000000000000000197A
          BC0076E7FF00D4F7FF0076E7FF0038D5FF0008B9FD00AF5B1C00FFEEDD00FFEC
          DC00FFEBD900D07A3C00D37D3F00D57F4100A151150000000000000000001F8B
          C90076E7FF00DAF9FF0076E7FF0038D5FF0009BFFF00B25E1E00FED4A700FED1
          A400FECE9F00FECB9B00D27D3F0065310A0063310A00622F0A0000000000259D
          D60076E7FF00E0FAFF0076E7FF0038D5FF0009BFFF0006B1FE00B45F1F00FED4
          A800FED1A400FECFA000FECB9B00D3804300A856190000000000000000002AAE
          E20056B6DF0061A1CD003783BA001665A800064C9700053D890005317C00B55F
          2000FED4A9006F370B00FECEA100FECB9C00AB581B0000000000000000002FBF
          ED0076E7FF00EBFCFF0076E7FF0038D5FF0009BFFF0006B1FE0004A4FE00043C
          9000B761210073390C00B35E1F00B15C1E00AF5B1C00000000000000000033C9
          F3005FC6EC0072B8DF00449BCE001B7BBD00065FAB00044C9B00053D8D000441
          980000000000773A0C00000000000000000000000000000000000000000036D1
          F800F7FEFF00FFFFFF00F7FEFF00E6FAFF00CBF1FF00B2E7FF0097D9FF000448
          A000000000000000000000000000000000000000000000000000000000000000
          000068CFED008DD3EB0065C9E80030B7E60008A2E4000695E0000488DE000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF0000FE0F0000FE070000FE030000C0010000800000008001
          00008001000080000000800100008001000080010000802F0000803F0000C07F
          0000FFFF0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000CE530C00CD52
          0B00CB520B00CA510A00C8500A00C7500900C54F0900C44F0800C34E0700C24E
          0700C04D0600BF4C0600BE4C0500BC4B0500BB4B0400BA4A0400D2560E00FFEF
          C800FFEFC800FAD39C00FFEFC800FFEFC800FAD39C00FFEFC800FFEFC800FAD3
          9C00FFEFC800FFEFC800FAD39C00FFEFC800FFEFC800BD4C0500D6591100FFF2
          CE00FFF2CE00FAD5A000FFF2CE00FFF2CE00FAD5A000FFF2CE00FFF2CE00FAD5
          A000FFF2CE00FFF2CE00FAD5A000FFF2CE00FFF2CE00C04E0700DA5D1400FAD6
          A500FAD6A5000909BF000909BF00FAD6A500FAD6A500FAD6A500FAD6A500FAD6
          A500FAD6A500FAD6A500FAD6A500FAD6A500FAD6A500C4510900DD611700FFF8
          DD00FFF8DD000909BF000909BF00FFF8DD00FAD9AB00FFF8DD00FFF8DD00FAD9
          AB00FFF8DD00FFF8DD00FAD9AB00FFF8DD00FFF8DD00C7540C00E1661A00FFFA
          E400FFFAE400FADBAF00FFFAE400FFFAE400FADBAF00FFFAE400FFFAE400FADB
          AF00FFFAE4000909BF000909BF00FFFAE400FFFAE400CB580F00E46B1E00FADD
          B400FADDB400FADDB400FADDB400FADDB400FADDB400FADDB400FADDB400FADD
          B400FADDB4000909BF000909BF00FADDB400FADDB400CF5C1200E7712100FFFE
          F100FFFEF100FADDB900FFFEF100FFFEF100FADDB900FFFEF100FFFEF100FADD
          B900FFFEF100FFFEF100FADDB900FFFEF100FFFEF100D3611500EA762500FFFF
          F500FFFFF500FADEBB00FFFFF5000909BF000909BF00FFFFF500FFFFF500FADE
          BB00FFFFF500FFFFF500FADEBB00FFFFF500FFFFF500D7661800EC7B2800FADE
          BF00FADEBF00FADEBF00FADEBF000909BF000909BF00FADEBF00FADEBF00FADE
          BF00FADEBF00FADEBF00FADEBF00FADEBF00FADEBF00DA6C1C00EE812B00FFFF
          FF00FFFFFF00FADEC200FFFFFF00FFFFFF00FADEC200FFFFFF00FFFFFF00FADE
          C200FFFFFF00FFFFFF00FADEC200FFFFFF00FFFFFF00DE722000EF852E00FFFF
          FF00FFFFFF00FADEC200FFFFFF00FFFFFF00FADEC200FFFFFF00FFFFFF00FADE
          C200FFFFFF00FFFFFF00FADEC200FFFFFF00FFFFFF00E1772400EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00F1963C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00F1963C00F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000CE530C00CD52
          0B00CB520B00CA510A00C8500A00C7500900C54F0900C54F0900C54F0900C54F
          0900C54F0900C44F0800C34E0700C24E0700BC4B0500BA4A0400DD611700FDF3
          E000FDF3DF00FDF2DF00FDF2DF00FDF2DE00FDF2DE00FDF2DE00FDF1DD00FDF1
          DD00FDF1DD00FDF1DC00FDF0DC00FDF0DC00FDF0DB00C7540C00E1661A00FDF4
          E200FDF4E100FDF4E100FDF3E100FDF3E000FDF3E000FDF3E000FDF3DF00FDF2
          DF00FDF2DF000B04A1000C04A1000C05A100FDF1DD00CB580F00E46B1E00FEF5
          E300FEF5E300FEF5E300FEF5E200FEF4E200FDF4E200FDF4E200FDF4E100FDF4
          E100FDF3E1000C05A2000C04A2000B05A100FDF3DF00CF5C1200E7712100FEF6
          E500FEF6E500FEF7E800FEF6E400FEF6E4000C04A6000C04A5000C04A5000B04
          A500AAA2D500AAA1D300FDF4E200FDF5E400FDF4E100D3611500EA762500FEF8
          EA00FEF8EA00FEF8EA00FEF8E900FEF8E9000C05A8000D04A8000D04A8000D05
          A700FEF7E700AAA2D600FEF6E700FEF6E600FEF6E600D7661800EC7B2800FEF9
          F400FEF9F400FEF9F300FEF9F300FEF9F300AAA4DD00FEF8F200FEF8F200FEF8
          F100FEF8F100AAA4DD00FEF7F000FEF7F000FEF7EF00DA6C1C00EE812B00FEFA
          F600FEFAF600FEFAF600FEFAF500FEFAF5000D05AE000D05AE000D05AD000D05
          AD00AAA4DE00AAA4DE00FEF9F200FEF8F200FEF8F200DE722000EF852E00FEFC
          F800FEFBF800FEFBF700FEFBF700FEFBF7000D06B2000D06B1000D05B1000D05
          B000FEFAF500FEFAF500FEFAF500FEF9F400FEF9F400E1772400EF852E00FFFC
          FA000E05B8000E06B7000E05B700ABA6E200AAA6E100FEFCF800FEFBF800FEFB
          F700FEFBF700FEFBF700FEFBF700FEFAF600FEFAF600E1772400EF852E00FFFD
          FB000E06BB000E06BB000E06BA00FFFDFA00FFFDFA00FFFCFA00FFFCFA00FFFC
          F900FFFCF900FFFCF900FEFCF800FEFCF800FEFBF800E1772400EF8C2A00FFFE
          FD00FFFEFD00FFFEFC00FFFEFC00FFFDFC00FFFDFC00FFFDFB00FFFDFB00FFFD
          FB00FFFDFB00FFFDFA00FFFDFA00FFFCFA00FFFCFA00EF8C2A00EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00F1963C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00F1963C00F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000005151510050505000505050004F4F4F004E4E4E004D4D
          4D004D4D4D004C4C4C004B4B4B004B4B4B004949490048484800000000000000
          000000000000000000005A5A5A00F3F3F300F3F3F300F3F3F300CFCFCF00F3F3
          F300F3F3F300CFCFCF00F3F3F300F3F3F300F3F3F3004E4E4E00000000000000
          000000000000000000005D5D5D00F4F4F400F4F4F400F4F4F400D0D0D000F4F4
          F400F3F3F300CFCFCF00F3F3F300F3F3F300F3F3F30052525200000000000000
          0000000000000000000061616100D0D0D000D0D0D000D0D0D000D0D0D000D0D0
          D000D0D0D000D0D0D000D0D0D000D0D0D000D0D0D00055555500CE530C00CD52
          0B00CB520B00CA510A0065656500F5F5F500F5F5F500F5F5F500D0D0D000F5F5
          F500F4F4F400D0D0D000F4F4F400F4F4F400F4F4F40059595900DD611700FFF8
          DD00FFF8DD00FFFAE40069696900F5F5F500F5F5F500F5F5F500D0D0D000F5F5
          F500F5F5F500D0D0D000F5F5F500F5F5F500F5F5F5005C5C5C00E1661A00FFFA
          E400FFFAE400FFFAE4006E6E6E00D1D1D100D1D1D100D1D1D100D1D1D100D1D1
          D100D1D1D100D0D0D000D0D0D000D0D0D000D0D0D00061616100E46B1E00FADD
          B400000000000000000000000000000000000000000000000000000000000000
          00000000000000000000F6F6F600F6F6F600F6F6F60065656500E7712100FFFE
          F10000000000FFFFFF00FFFFFF00A6A6A6000000000000000000A6A6A600FFFF
          FF00FFFFFF0000000000F6F6F600F6F6F600F6F6F60069696900EA762500FFFF
          F500000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
          000000000000000000008C8C8C008C8C8C008C8C8C0072727200EC7B2800FADE
          BF0000000000FFFFFF00FFFFFF00A6A6A6000000000000000000A6A6A600FFFF
          FF00FFFFFF0000000000BDBDBD00BDBDBD00BDBDBD007C7C7C00EE812B00FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000089898900888888008888880087878700EF852E00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00E177240000000000000000000000000000000000EF8C2A00EF8C
          2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C2A00EF8C
          2A00EF8C2A00EF8C2A0000000000000000000000000000000000F1963C00FFC6
          7C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC67C00FFC6
          7C00FFC67C00F1963C0000000000000000000000000000000000F3A35100F3A3
          5100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A35100F3A3
          5100F3A35100F3A3510000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          86000000424D86000000000000003E0000002800000010000000120000000100
          010000000000480000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000F0000000F0000000F0000000F000000000000000000000000000
          00000000000000000000000000000000000000000000000F0000000F0000000F
          0000000F0000FFFF0000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000F0000
          001B00000025000000250000001B0000000F0000000000000000000000000000
          00000000000000000000000000000000000000000001002C056900530AB90070
          0EEA00700EEA00530AB9002D06760000002A0000001500000000000000000505
          0511101010351111113B1111113B1111113C07460FA300992CFF10C067FF1FE0
          95FF1FE095FF14C068FF03992EFF003E08940000002A0000000F2A130148893E
          05EC934104FF914003FF8F3F03FF555007FF00992CFF1BD888FF25EEA9FF25EE
          A9FF31EEAEFF42F0B4FF42DA96FF0F9A32FF002D06760000001B2A130148893E
          05EC934104FF914003FF8F3F03FF555007FF00992CFF1BD888FF25EEA9FF25EE
          A9FF31EEAEFF42F0B4FF42DA96FF0F9A32FF002D06760000001B893F04E4E2CA
          B8FFFFFFFFFFFFFFFFFFFFFFFFFF54A75EFF10C067FF25EEA9FF14C872FF0099
          2DFF04992EFF37CA7FFF73F3C7FF4CC47EFF00530AB9000000269C4904FFFFFF
          FFFFEFEFEFFFEFEFEFFFEFEFEFFF178725FF1FE095FF2BEEACFF01992EFFFFFF
          FFFF823302FF0A891BFF068518FF068518FF00740EEA00000000A04C05FFFFFF
          FFFFF0F0F0FFF0F0F0FFF0F0F0FF188725FF26E097FF3EF0B3FF07992FFFFFFF
          FFFF0A891BFF0A891BFF00000029000000000000000000000000A24E05FFFFFF
          FFFFF2F2F2FFF2F2F2FFF2F2F2FF50A35AFF21C16DFF56F1BDFF43CC84FF149A
          33FF1A9A36FF3EF0B3FF0A891BFF000000290000000000000000B66208FFFFFF
          FFFFF3F3F3FFF3F3F3FFF3F3F3FF9BC8A1FF0B9A30FF59DCA0FF3EF0B3FF3EF0
          B3FF3EF0B3FF3EF0B3FF3EF0B3FF0A891BFF0000002900000000B96509FFD4D4
          D4FFD4D4D4FFD4D4D4FFD4D4D4FFD3D4D3FF6AA871FF179B36FF5EC686FF3EF0
          B3FF3EF0B3FF3EF0B3FF3EF0B3FF3EF0B3FF0A891BFF00000000C06B0AFFC26D
          0BFFC26D0BFFC26D0BFFC88033FFC38846FFD3D4D3FF9ECBA3FF51A55BFF1989
          27FF10780EFF3EF0B3FF3EF0B3FF0A891BFF04310A5C000000002A170238C06B
          0AFFF8F8F8FFF8F8F8FFFFFFFFFFC0792AFFD4D4D4FFF8F8F8FFF8F8F8FFFFFF
          FFFF0A891BFF3EF0B3FF0A891BFF04310A5C00000000000000002A170238C06B
          0AFFF8F8F8FFF8F8F8FFFFFFFFFFC0792AFFD4D4D4FFF8F8F8FFF8F8F8FFFFFF
          FFFF0A891BFF3EF0B3FF0A891BFF04310A5C0000000000000000000000002A17
          0238C06B0AFFFEFEFEFFFFFFFFFFBC6709FFD4D4D4FFFAFAFAFFFAFAFAFFFFFF
          FFFF0A891BFF0A891BFF04310A5C000000000000000000000000000000000000
          000052433261C06B0AFFFFFFFFFFBC6709FFD4D4D4FFFBFBFBFFFBFBFBFFFFFF
          FFFFAB5707FF1515153B00000000000000000000000000000000000000000000
          00002121212445352354C06B0AFFBC6709FFD4D4D4FFFCFCFCFFFCFCFCFFEBD5
          BFFFA05309ED1313133500000000000000000000000000000000000000000000
          000014141416141414163B2A1649BE701DFFBB6D1CFFBA6B1CFFB96B1CFF914F
          0BD538240F620505050F00000000000000000000000000000000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000090000001C0000001F0000001F0000001F0000001F0000
          001F0000001F0000001F0000001F0000001C0000000900000000000000000000
          000028120148803803EA8B3C03FF893B02FF883A02FF863902FF853702FF8436
          01FF823602FF813401FF742E01EA240E005E0000001C00000000000000000000
          0000843D04E4E0CAB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFDCC6B8FF742F01E70000001F00000000000000000000
          0000843D04E4E0CAB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFDCC6B8FF742F01E70000001F00000000000000000000
          0000994805FFFFFFFFFF3388F3FF2C81EBFFFFFFFFFFD76519FFD05E12FFFFFF
          FFFF009F11FF009F11FFFFFFFFFF863802FF0000001F00000000000000000000
          00009F4C05FFFFFFFFFF378CF6FF3185F0FFFFFFFFFFDC6A1EFFD46216FFFFFF
          FFFF009F11FF009F11FFFFFFFFFF8A3B03FF0000001F00000000000000000000
          0000A45107FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF8F4003FF0000001F00000000000000000000
          0000A95507FFFFFFFFFF3A8FFAFF388DF7FFFFFFFFFFE57326FFDE6C1FFFFFFF
          FFFF04A315FF00A011FFFFFFFFFF944404FF0000001F00000000000000000000
          0000AE5A08FFFFFFFFFF3A8FFAFF3A8FFAFFFFFFFFFFEA782BFFE27024FFFFFF
          FFFF07A618FF02A213FFFFFFFFFF9A4805FF0000001F00000000000000000000
          0000B15C08FFEBD5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE7D1BFFF9F4D06FF0000001F00000000000000000000
          0000B45F09FFB45F09FFB35D09FFB15D09FFB05B08FFAF5908FFAD5807FFAB58
          07FFAA5607FFA85407FFA65306FFA55107FF0000001F00000000000000000000
          0000B66009FFD19C66FFD19C66FFD09B66FFCF9A65FFCF9965FFCE9965FFCE98
          65FFCC9764FFCC9765FFCB9664FFA95507FF0000001C00000000000000000000
          0000B66009FFD19C66FFD19C66FFD09B66FFCF9A65FFCF9965FFCE9965FFCE98
          65FFCC9764FFCC9765FFCB9664FFA95507FF0000001C00000000000000000000
          0000A55708E7B66009FFC1782FFFC1782EFFC1782FFFC1782EFFC0772FFFBE76
          2DFFBE752EFFBD752EFFAF5A08FF9D5106E90000000800000000000000000000
          00002D18023F8F4C07C9B66009FFB66009FFB66009FFB66009FFB66009FFB660
          09FFB55F08FFB45E09FF8D4A07C92C17023F0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000003600000013CE03
          64FFCE0364FF0000003600000024000000130000003600000000000000000000
          000000000000000000000000000000000000CE0364FF4A01247F8B0243BDCE03
          64FFCE0364FF8B0243BD4A01247FCE0364FF0000003600000036000000000000
          0000000000000000000000000000CE0364FFCE0364FFCE0364FFCE0364FFCE03
          64FFCE0364FFCE0364FFCE0364FFCE0364FFCE0364FF00000013000000000000
          00000000000000000000000000004A01245CCE0364FFCE0364FFCE0364FFCE03
          64FFCE0364FFCE0364FFCE0364FFCE0364FF4A01247F00000024000000000000
          00000000000000000000000000004A01245CCE0364FFCE0364FFCE0364FFCE03
          64FFCE0364FFCE0364FFCE0364FFCE0364FF4A01247F00000024000000000000
          00000000000000000000000000008B0243BDCE0364FFCE0364FFAC0353DD4D01
          256C4D01255FAB0253D4CE0364FFCE0364FF8B0243BD00000036000000000000
          00000000000000000000CE0364FFCE0364FFCE0364FFCE0364FF4D0125810000
          0014000000004D01255FCE0364FFCE0364FFCE0364FFCE0364FF000000000000
          000C0000002500000029CE0364FFF89BC6FFF89BC6FFD51C74FF55213A950000
          004B0000001F55213A6CD51C74FFF89BC6FFF89BC6FFCE0364FF2B140248873E
          06EA924305FF8F4104FF8D3E04FFB71544FFF288BAFFE0458FFFC73470FC6625
          37B3551D3793B72F70DDE0458FFFF288BAFF8B0243BD000000138E4708E4DCC0
          A8FFFFFFFFFFFFFFFFFFFFFFFFFFEDA4C7FFED73ACFFEA68A5FFDD3B88FFD316
          70FFD31570FFDD3B88FFEA68A6FFCE0364FF56293E7F00000036A7550BFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFCE0364FFE65D9EFFCE0364FFE65D9EFFE65D
          9EFFE65D9EFFE75D9EFFCE0364FFE75D9EFFCE0364FF00000000A7550BFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCE0364FFEDA4C7FFDE5697FFE047
          90FFE04790FF8B0243BD4A01245CCE0364FF0000000000000000AD5B0EFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCE03
          64FFCE0364FF0000000000000000000000000000000000000000AD5B0EFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCE03
          64FFCE0364FF0000000000000000000000000000000000000000B3610FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9949
          07FF000000290000000000000000000000000000000000000000B86510FFB664
          10FFB46210FFB2610FFFB05E0EFFAB5A0DFFA9580CFFA6560CFFA4530BFFA151
          0AFF000000250000000000000000000000000000000000000000A85D0FE7B967
          11FFB96611FFB76511FFB66310FFB2600FFFB05E0EFFAD5C0DFFAA5A0DFF974F
          0BEA0000000A00000000000000000000000000000000000000002E19043F9251
          0DC9B96711FFB96711FFB96711FFB66510FFB56410FFB3620FFF8C4B0CC92B17
          033F000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          00000000000C0000002100000021000000210000002100000021000000210000
          002100000021000000210000001E000000100000000000000000000000003819
          005EAB5F15FFB26623FFB5743DFFB98150FFBD8C5FFFBE8D61FFBD8C60FFBD8B
          5CFFB87D45FFAD6F2DF65228008D00000019000000000000000000000000A747
          00FDC66200FFD0732AFFD89462FFE5C0A5FFF4E3DAFFFDFCFBFFFEFEFEFFFBEA
          D6FFEAB986FFD78327FF964900CC00000020000000000000000000000000AD49
          00FFC66200FFD1742AFFD99461FFE5BDA6FFF4E4DCFFFEFDFCFFF0F0F0FFE2D2
          C0FFC99F73FFBA7220FFA95300F800000029000000000000000000000000AD49
          00FFC66200FFD1742AFFD99461FFE5BDA6FFF4E4DCFFFEFDFCFFF0F0F0FFE2D2
          C0FFC99F73FFBA7220FFA95300F800000029000000000000000000000000AC51
          00EBD47623FFDA894EFFE9BD9EFFF1D9CAFFF9F1EBFF96C29BFF469A51FF1584
          21FF14811BFF3E7D1DFF5A5A06EC000000370000001500000000000000003819
          005EAE5807FFC16F31FFD4AC92FFDBC7B7FF6BA56CFF00992CFF10C067FF1FE0
          95FF1FE095FF14C068FF03992EFF003E08A00000002A0000000F00000000A747
          00FDC66200FFD0732AFFE1AC86FF96B07CFF00992CFF1BD888FF25EEA9FF25EE
          A9FF31EEAEFF42F0B4FF42DA96FF0F9A32FF002D06760000001B00000000AD49
          00FFC66200FFD1742AFFE2AC85FF4D9647FF10C067FF25EEA9FF14C872FF0099
          2DFF04992EFF37CA7FFF73F3C7FF4CC47EFF00530AB90000002600000000AC51
          00EBD47623FFDA894EFFE9BD9EFF188521FF1FE095FF2BEEACFF01992EFFFFF7
          EBFFF3CB9EFF0A891BFF068518FF068518FF00740EEA00000000000000003819
          005EAE5807FFC16F31FFD4AC92FF168320FF26E097FF3EF0B3FF07992FFFE3DA
          D0FF0A891BFF0A891BFF4522009F0000001C000000000000000000000000A747
          00FDC66200FFD0732AFFE1AC86FF4D9747FF21C16DFF56F1BDFF43CC84FF149A
          33FF1A9A36FFB9F9E4FF0A891BFF00000044000000000000000000000000AD49
          00FFC66200FFD1742AFFE2AC85FF96AF7CFF0B9A30FF59DCA0FF8BF5D1FFB9F9
          E4FFB9F9E4FFB9F9E4FFB9F9E4FF0A891BFF000000290000000000000000AD49
          00FFC66200FFD1742AFFE2AC85FF96AF7CFF0B9A30FF59DCA0FF8BF5D1FFB9F9
          E4FFB9F9E4FFB9F9E4FFB9F9E4FF0A891BFF000000290000000000000000AC51
          00EBD47623FFDA894EFFE9BD9EFFF0D9C9FF7DB67DFF179B36FF5EC686FFA4EA
          CAFFB9F9E4FFB9F9E4FFB9F9E4FFB9F9E4FF0A891BFF00000000000000003819
          005E582D0581844D23AFC59576F4CAAA92F3DAC8B9FE8FB07FFF499648FF1683
          1FFF137F18FEB9F9E4FFB9F9E4FF0A891BFF04310A5C00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000A891BFFB9F9E4FF0A891BFF04310A5C0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000A891BFF0A891BFF04310A5C000000000000000000000000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          000C000000250000002900000029000000290000002900000029000000290000
          00250000000C00000000000000000000000000000000000000002B140248873E
          06EA924305FF8F4104FF8D3E04FF893A03FF873902FF853702FF783001EB250F
          00650000002500000000000000000000000000000000000000008E4708E4DCC0
          A8FFFFFFFFFFBCBCBCFFFFFFFFFFFFFFFFFFBCBCBCFFFFFFFFFFD5B9A6FF7932
          02E8000000290000000000000000000000000000000000000000A7550BFFFFFF
          FFFFFFFFFFFFBCBCBCFFFFFFFFFFFFFFFFFFBCBCBCFFFFFFFFFFFFFFFFFF8B3D
          04FF000000290000000000000000000000000000000000000000A7550BFFFFFF
          FFFFFFFFFFFFBCBCBCFFFFFFFFFFFFFFFFFFBCBCBCFFFFFFFFFFFFFFFFFF8B3D
          04FF000000290000000000000000000000000000000000000000A7550BFFBCBC
          BCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFF8B3D
          04FF000000290000000000000000000000000000000000000000AD5B0EFFFFFF
          FFFFFFFFFFFFBCBCBCFFFFFFFFFFFFFFFFFFBCBCBCFFFFFFFFFFF3F3F3FF853D
          05FF000000420000001E000000160000000C0000000000000000B3610FFFFFFF
          FFFFFFFFFFFFBCBCBCFFFFFFFFFFFFFFFFFFBBBCBCFF98C5E8FF499CDDFF0D75
          C8FF006FC7ED005394B6002C5071000101220000001100000000B86510FFB664
          10FFB46210FFB2610FFFB05E0EFFAA5A0EFF506874FF409CE6FF99CAF1FFE0EF
          FBFFE0EFFBFF99CAF1FF409CE6FF003E6F90000101220000000CA85D0FE7B967
          11FFB96611FFB76511FFB66310FF726A59FF409CE6FFCCE5F8FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFCCE5F8FF409CE6FF002C5071000000162E19043F9251
          0DC9B96711FFB96711FFB96711FF3C7499FF99CAF1FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF99CAF1FF005394B60000001E000000000000
          0000000000000000000000000000006FC7E6E0EFFBFFFFFFFFFFFFFFFFFF0055
          A2FF0055A2FF0055A2FFFFFFFFFFE0EFFBFF006FC7E90000001E000000000000
          0000000000000000000000000000006FC7E6E0EFFBFFFFFFFFFFFFFFFFFF0055
          A2FFFFFFFFFFFFFFFFFFFFFFFFFFE0EFFBFF006FC7E900000016000000000000
          0000000000000000000000000000006FC7E6E0EFFBFFFFFFFFFFFFFFFFFF0055
          A2FFFFFFFFFFFFFFFFFFFFFFFFFFE0EFFBFF006FC7E900000016000000000000
          0000000000000000000000000000005294AB99CAF1FFFFFFFFFFFFFFFFFF0055
          A2FFFFFFFFFFFFFFFFFFFFFFFFFF99CAF1FF005394B60000000C000000000000
          0000000000000000000000000000002C505C409CE6FFCCE5F8FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFCCE5F8FF409CE6FF002C506700000000000000000000
          000000000000000000000000000000000101003E6F80409CE6FF99CAF1FFE0EF
          FBFFE0EFFBFF99CAF1FF409CE6FF003E6F860000010100000000000000000000
          00000000000000000000000000000000000000000101002C505C005294AB006F
          C7E6006FC7E6005294AB002C505C000001010000000000000000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          000C000000250000002900000029000000290000002900000029000000290000
          00250000000C00000000000000000000000000000000000000002B140248873E
          06EA924305FF8F4104FF8D3E04FF893A03FF873902FF853702FF783001EB250F
          00650000002500000000000000000000000000000000000000008E4708E4DCC0
          A8FFFFFFFFFFBCBCBCFFFFFFFFFFFFFFFFFFBCBCBCFFFFFFFFFFD5B9A6FF7932
          02E8000000290000000000000000000000000000000000000000A7550BFFFFFF
          FFFFFFFFFFFFBCBCBCFFFFFFFFFFFFFFFFFFBCBCBCFFFFFFFFFFFFFFFFFF8B3D
          04FF000000290000000000000000000000000000000000000000A7550BFFFFFF
          FFFFFFFFFFFFBCBCBCFFFFFFFFFFFFFFFFFFBCBCBCFFFFFFFFFFFFFFFFFF8B3D
          04FF000000290000000000000000000000000000000000000000A7550BFFBCBC
          BCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFF843A
          04FF000000430000002D0000002D0000001F0000000D00000000AD5B0EFFFFFF
          FFFFFFFFFFFFBCBCBCFFFFFFFFFFCCCCCCFF969696FFCCCCCCFF99B0CAFF2F4C
          79FF0050ADEA0050AEE6003777AD001732660000002F0000000EB3610FFFFFFF
          FFFFFFFFFFFFBCBCBCFF0085F0FF0085F0FF0085F0FF007BE5FF1485D5FF6BB2
          E6FFD4EAFDFFD4EAFDFF6BB2E6FF006CBBEE001C366C00000026B86510FFB664
          10FFB46210FFB2610FFF0085F0FFFFFFFFFF6DAAF2FF268ED9FF6BB2E6FFDAEE
          F9FF0055A2FFDAEEF9FFFFFFFFFF6BB2E6FF005192CC00000031A85D0FE7B967
          11FFB96611FFB76511FF0085F0FFFFFFFFFF6DAAF2FF006ECDFFD4EAFDFF0055
          A2FFDAEEF9FF0055A2FFDAEEF9FFD4EAFDFF0060C0F7000000322E19043F9251
          0DC9B96711FFB96711FF0085F0FFFFFFFFFF6DAAF2FF006ECDFFD4EAFDFFFFFF
          FFFFFFFFFFFFDAEEF9FF0055A2FFD4EAFDFF0066C6FA0000002C000000000000
          000000000000000000000085F0FFFFFFFFFF6DAAF2FF3291D9FF6BB2E6FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF6BB2E6FF0470B8E20000000D000000000000
          000000000000000000000085F0FFFFFFFFFF6DAAF2FF73AEE3FF218AD7FF6BB2
          E6FFD4EAFDFFD4EAFDFF6BB2E6FF0074D4FF0017326600000000000000000000
          000000000000000000000085F0FFFFFFFFFF6DAAF2FF73AEE3FF218AD7FF6BB2
          E6FFD4EAFDFFD4EAFDFF6BB2E6FF0074D4FF0017326600000000000000000000
          000000000000000000000085F0FFFFFFFFFFA8DBFFFF62A7E9FF86BEEAFF3C9A
          DEFF006ECDFF006ECDFF3197DFFF007BE5FF0000003300000000000000000000
          00000000000000000000000000000085F0FFFFFFFFFFA8DBFFFF6DAAF2FF6DAA
          F2FF6DAAF2FF6DAAF2FF6DAAF2FF0085F0FF0000003300000000000000000000
          00000000000000000000000000002E3D48580085F0FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF0085F0FF0000003300000000000000000000
          000000000000000000000000000004050506476173840085F0FF0085F0FF0085
          F0FF0085F0FF0085F0FF0085F0FF0085F0FF0000000000000000}
      end
      item
        Image.Data = {
          B6040000424DB604000000000000360000002800000010000000120000000100
          2000000000008004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000400080101
          0103000000000000000000000000000000000000000000000000050505111010
          10351111113B1111113B1111113B1010103B0F0F0F3B0F0F0F3B0F0F0F3B0D0D
          0D35040404110000000000000000000000000000000000000000361F0D6E893E
          06ED934104FF914003FF8F3F03FF833501FF1D700BFF6A481AFF733107EE2E18
          0B720D0D0D3500000000000000000000000000000000000000008B4106EAE2CA
          B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C881AFF9CBCA0FFD1BDB0FF722E
          03EA0F0F0F3B090D0C32000000000000000000000000000000009C4904FFFFFF
          FFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFF008310FF499A53FFDFDFDFFF8233
          02FF1010103B008400FF23232357000000000000000000000000A04C05FFFFFF
          FFFFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF20922FFF0C952DFF60A76AFF7644
          14FF12121240008400FF008400FF232423580000000000000000A24E05FFFFFF
          FFFFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FF68B473FF14A243FF1BAD57FF1B8D
          31FF106521CB008400FF38D699FF008400FF2323235700000000B66208FFFFFF
          FFFFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFD5E5D7FF219534FF22B767FF2AC2
          7AFF31CD8BFF37D597FF3DDCA5FF40E1AEFF008400FF23232357B96509FFFFFF
          FFFFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFC4DFC9FF2F9E43FF13A4
          47FF36D499FF3CDBA3FF40E1AEFF40E1AEFF008400FF23232357C06B0AFFD4D4
          D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFF7F7F7FFF7F7F7FFF0F8F2FF5F67
          11FF0B6720C5008400FF40E1AEFF008400FF2228226002020204C26D0BFFC26D
          0BFFC26D0BFFC88033FFC38846FFD4D4D4FFF8F8F8FFF8F8F8FFFFFFFFFFA551
          06FF1414143B008400FF008400FF212921610202020500000000C06B0AFFFFFF
          FFFFFFFFFFFFFFFFFFFFC0792AFFD4D4D4FFFAFAFAFFFAFAFAFFFFFFFFFFA854
          07FF1515153B008400FF0000000000000000000000000000000000000000C06B
          0AFFFEFEFEFFFFFFFFFFBC6709FFD4D4D4FFFBFBFBFFFBFBFBFFFFFFFFFFAB57
          07FF131313350000000000000000000000000000000000000000000000000000
          0000C06B0AFFFFFFFFFFBC6709FFD4D4D4FFFCFCFCFFFCFCFCFFEBD5BFFF9F52
          08EB0505050F0000000000000000000000000000000000000000000000000000
          000014141416C06B0AFFBC6709FFBB6D1CFFBA6B1CFFB96B1CFF8D4A06C92C17
          023F000000000000000000000000000000000000000000000000000000000000
          00000909090A080808090909090A080808090808080908080809000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object imgLargeMain: TcxImageList
    Height = 24
    Width = 24
    FormatVersion = 1
    DesignInfo = 29425953
    ImageInfo = <
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001000000060000000F0000001D000000290000003100000036000000360000
          0031000000290000001D0000000F000000060000000100000000000000000000
          0002000000040000000500000005000000050000000500000005000000060000
          000C0000001A041B0B67093818A90D4E23D70F5F29F40F6029F50D5023D80939
          19AE051C0D770000003A00000029000000150000000700000001000000000000
          000B0000001400000018000000190000001A0000001A0000001B0000001F020D
          0547083717AA147F3FF81DAF64FF2DD381FF39E08FFF3FE193FF40D78BFF35B4
          71FF29864FF80E3A1DAD030E07580000002D0000001500000006000000000000
          001F000000320000003B0000003D0000003D0000003D0000003F020D055F0940
          1CC419A157FF2FDE88FF39E092FF3FE195FF41E195FF4CE39CFF50E49FFF56E4
          A3FF54E49BFF3FAA6DFF164727BE040E0858000000290000000F000000002A13
          016C873D04EE934104FF914003FF8F3F03FF8D3D03FF883A03FF404E19FF19A1
          56FF33DF8EFF39E091FF40E195FF49E29AFF4DE39DFF52E4A0FF5BE5A3FF5DE6
          A6FF65E7ABFF68E7AAFF47AD74FF163E25AD0000003A0000001D00000000893F
          05EAE2CAB8FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFB4CCBCFF1D8848FF32DE
          87FF3DE195FF41E196FF3FD68AFF30A665FF207E45FF247F47FF3BA96DFF57DA
          98FF6DE8AEFF74E9B3FF6EE8ABFF3F8E5FF80D20147700000029000000009C49
          04FFFFFFFFFFEDEDEDFFEDEDEDFFEDEDEDFFEBEBEBFF6C9B7CFF26B066FF3FE1
          94FF41E197FF42D68AFF319059FF6F987DFFCAD7CEFF6F3B0BFF11381EA13285
          56ED66DEA2FF7AEAB7FF7EEBB9FF5EBE8AFF1C4229AD0000003100000000A04C
          05FFFFFFFFFFEEEEEEFFEEEEEEFFEEEEEEFFECECECFF3D8053FF37D586FF45E2
          9CFF4DE39DFF33A668FF669074FFD1D1D1FFF7F7F7FF833602FF0000003F1439
          21904FAF7BFF7FEBBCFF84ECBEFF77E1ACFF2C5F3ED70000003500000000A24E
          05FFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFFFEDEDEDFF1C6E36FF88ECBCFF94EE
          C4FF9FF0C8FF31814EFF9AA89FFFD2D2D2FFF7F7F7FF873802FF000000420813
          0B4B44895EFFADF2D4FFADF2D4FFA2F0CDFF37744DF30000002A00000000A552
          06FFFFFFFFFFF0F0F0FFF0F0F0FFF0F0F0FFEEEEEEFF1E6F39FF97EFC2FFA4F1
          CDFFAAF2D1FF358352FF99A59DFFC8C8C8FFECECECFF863802FF0000004B0813
          0C5A44895EFF44895EFF44895EFF44895EFF44895EFF0000000F00000000A854
          07FFFFFFFFFFF2F2F2FFF2F2F2FFF2F2F2FFF1F1F1FF44855AFF8EE3B5FFB1F3
          D4FFB7F4D8FF6AB188FF698E76FFB8B8B8FFD4D4D4FF7B3403FF538868FF0000
          004E000000380000001C0000000A00000003000000020000000200000000AB57
          07FFFFFFFFFFF3F3F3FFF3F3F3FFF3F3F3FFF2F2F2FF78A688FF74C094FFBDF5
          DDFFC2F5DFFFA7E8C5FF5B9874FF6D9179FFA4AFA8FF633A0DFF538868FF5388
          68FF0000004B000000350000001A00000007000000010000000000000000AE59
          08FFFFFFFFFFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFB9CEC0FF55976EFFB4F3
          D3FFCDF7E6FFD3F8E9FFB4EACDFF7DB694FF4E8C64FF508D67FF508D67FFEDFC
          F7FF538868FF000000480000003400000018000000060000000100000000B15C
          08FFFFFFFFFFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF6F6F6FF82AB90FF76B5
          91FFCFF7E5FFDCF9EDFFDFFAF0FFE2FAF1FFE7FBF4FFEAFCF7FFEDFCF7FFEDFC
          F7FFEDFCF7FF538868FF00000041000000250000000B0000000100000000B45F
          08FFFFFFFFFFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFDDE6E1FF75A2
          84FF80B897FFCCF7E1FFE7FBF4FFECFCF8FFEDFCF9FFF2FDFBFFEDFCF7FFEDFC
          F7FFEDFCF7FFEDFCF7FF538868FF00000018000000060000000100000000B662
          08FFFFFFFFFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFE0E9
          E3FF8AAF99FF6A9F7EFF9DCAB0FFCCEEDCFFEBFCF6FFEDFCF7FFEDFCF7FFEDFC
          F7FFEDFCF7FF538868FF0000001A00000007000000010000000000000000B965
          09FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFFBFBFBFFFBFB
          FBFFFAFAFAFFC5D6CBFF8FB29DFF689879FF4E8763FF4B7D59FF538868FFEDFC
          F7FF538868FF0000001A0000000700000001000000000000000000000000C06B
          0AFFC26D0BFFC26D0BFFC26D0BFFC88033FFC38846FFD4D4D4FFFCFCFCFFFCFC
          FCFFFCFCFCFFFCFCFCFFFBFBFBFFFBFBFBFFFDFDFDFFA04E06FF538868FF5388
          68FF0000001D0000000700000001000000000000000000000000000000002A17
          0238C06B0AFFFDFDFDFFFDFDFDFFFFFFFFFFC0792AFFD4D4D4FFFDFDFDFFFDFD
          FDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFFFFFFFFA45106FF538868FF0000
          00230000000B0000000100000000000000000000000000000000000000000000
          00002A170238C06B0AFFFEFEFEFFFFFFFFFFBC6709FFD4D4D4FFFEFEFEFFFEFE
          FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFFA85407FF0000003C0000
          0019000000060000000000000000000000000000000000000000000000000000
          0000000000002A170238C06B0AFFFFFFFFFFBC6709FFD4D4D4FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB5707FF000000310000
          0013000000040000000000000000000000000000000000000000000000000000
          000000000000000000002A170238C06B0AFFBC6709FFD4D4D4FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBD5BFFF9E5107EC0000001E0000
          000B000000020000000000000000000000000000000000000000000000000000
          00000000000000000000000000002A170238C06B0AFFC06B0AFFBF6A0AFFBA65
          0AFFB96409FFB76209FFB66009FFB45F08FF8D4A06CE2C17024D0000000B0000
          0003000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000030303050707070C0B0B0B140D0D0D180D0D0D1A0D0D0D1A0D0D0D1A0D0D
          0D1A0D0D0D1A0D0D0D1A0D0D0D1A0D0D0D1A0D0D0D1A0D0D0D1A0D0D0D1A0D0D
          0D1A0C0C0C1A0C0C0C1A0B0B0B180A0A0A140606060C03030305000000000000
          00000E0E0E182424243D3B3B3B60474747714B4B4B764C4C4C774C4C4C774C4C
          4C774C4C4C774B4B4B774B4B4B774A4A4A774A4A4A774A4A4A774A4A4A774A4A
          4A77494949774848487644444471383838602121213D0606060C000000000000
          00003C24116591480AF0984805FF964604FF954304FF924204FF904104FF8F3F
          03FF8C3E03FF8B3C03FF8A3B02FF873902FF863702FF853602FF833502FF8235
          01FF813401FF7F3201FF7E390DF6675143AA3737375F0A0A0A14000000000000
          0000904607E9E3CCB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFDBC5B7FF7C370CF4414141710B0B0B18000000000000
          0000A14E06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF803301FF414141760C0C0C1A000000000000
          0000A35006FFFFFFFFFF2A77E8FF2672E4FF236DE0FF1F68DCFFEDEDEDFFEDED
          EDFFD05315FFCC4E12FFC8490EFFC5450BFFEDEDEDFFEDEDEDFF039E05FF029C
          02FF009A00FF009A00FFFFFFFFFF823401FF3F3F3F770C0C0C1A000000000000
          0000A55206FFFFFFFFFF2D7CECFF2A77E8FF2773E4FF236DE0FFEEEEEEFFEEEE
          EEFFD45819FFD05315FFCC4E12FFC94A0FFFEEEEEEFFEEEEEEFF06A109FF039E
          05FF029C03FF009A00FFFFFFFFFF823401FF3F3F3F770C0C0C1A000000000000
          0000A65407FFFFFFFFFF3181F0FF2D7DECFF2A78E8FF2773E5FFEFEFEFFFEFEF
          EFFFD95E1CFFD45919FFD15415FFCD4F12FFEFEFEFFFEFEFEFFF08A40DFF06A1
          09FF049F06FF029C03FFFFFFFFFF843502FF424242770C0C0C1A000000000000
          0000A85407FFFFFFFFFF3486F3FF3182F0FF2E7DECFF2B78E9FFF0F0F0FFF0F0
          F0FFDD6420FFD95F1DFFD55A19FFD15416FFF0F0F0FFF0F0F0FF0BA811FF08A5
          0DFF06A20AFF049F06FFFFFFFFFF8D3C03FF464646770D0D0D1A000000000000
          0000A95508FFFFFFFFFFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
          F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
          F2FFF2F2F2FFF2F2F2FFFFFFFFFF853702FF464646770D0D0D1A000000000000
          0000AA5707FFFFFFFFFFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3
          F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3
          F3FFF3F3F3FFF3F3F3FFFFFFFFFF873802FF424242770C0C0C1A000000000000
          0000AC5807FFFFFFFFFF3C91FCFF3A8FFAFF378BF7FF3587F4FFF5F5F5FFF5F5
          F5FFEA752CFFE67028FFE26B25FFDE6521FFF5F5F5FFF5F5F5FF14B420FF11B0
          1BFF0EAD17FF0CA912FFFFFFFFFF883A02FF404040770C0C0C1A000000000000
          0000AE5907FFFFFFFFFF3E94FEFF3C92FCFF3A8FFAFF388CF8FFF7F7F7FFF7F7
          F7FFEE7A2FFFEA752CFFE67029FFE36B25FFF7F7F7FFF7F7F7FF18B825FF14B4
          20FF11B11CFF0FAD17FFFFFFFFFF8B3B02FF414141770C0C0C1A000000000000
          0000B05B08FFFFFFFFFF3E95FFFF3E94FEFF3C92FDFF3A8FFAFFF8F8F8FFF8F8
          F8FFF27F33FFEE7A2FFFEB762CFFE77129FFF8F8F8FFF8F8F8FF1BBD2BFF18B9
          26FF15B521FF12B11CFFFFFFFFFF8C3D03FF434343770C0C0C1A000000000000
          0000B15C08FFFFFFFFFF3E95FFFF3E95FFFF3E95FFFF3C92FDFFFAFAFAFFFAFA
          FAFFF58335FFF27F33FFEF7B30FFEB762CFFFAFAFAFFFAFAFAFF1EC130FF1BBD
          2BFF18B927FF15B521FFFFFFFFFF8E3F03FF444444770C0C0C1A000000000000
          0000B35D08FFFFFFFFFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
          FBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
          FBFFFBFBFBFFFBFBFBFFFFFFFFFF904103FF3E3E3E770B0B0B1A000000000000
          0000B45E09FFEBD5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE3CFBEFF924203FF333333770A0A0A1A000000000000
          0000B55F09FFB45F09FFB35E08FFB15D08FFB05B09FFAF5A08FFAD5907FFAC57
          08FFA95607FFA85407FFA65307FFA45106FFA25006FFA14E06FF9F4C05FF9D4A
          05FF9A4905FF984705FF964505FF944405FF2F2F2F760A0A0A1A000000000000
          0000B66009FFB55F09FFB45F09FFB35D09FFB15D08FFB05B08FFAF5A08FFAE58
          08FFAC5708FFAA5607FFA85407FFA65206FFA45106FFA24F06FFA04E06FF9F4C
          05FF9C4A05FF9A4905FF984705FF974604FF2F2F2F7109090918000000000000
          0000B66009FFC98A4AFFC88849FFC78849FFC7884AFFC68748FFC58649FFC485
          49FFC38449FFC18248FFC08248FFBF8147FFBD8048FFBD7F47FFBA7E47FFB97C
          46FFB87A46FFB67A46FFB57947FF994705FF2B2B2B5E09090914000000000000
          0000A65809E9C47F39FFC47F39FFC47F39FFC37E39FFC27E38FFC17D38FFBF7B
          38FFBF7B38FFBE7938FFBC7838FFBB7738FFB97638FFB77537FFB77338FFB472
          38FFB37137FFB26F36FFAF6E37FF904709F01D1D1D3B0606060C000000000000
          0000311C0746924E0ACEB66009FFB66009FFB56009FFB45F09FFB35D08FFB25C
          09FFB05B08FFAF5A08FFAD5908FFAB5808FFAA5607FFA95407FFA65307FFA451
          06FFA35006FFA14E06FF834209D435200F5C0C0C0C1702020204000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000300000009000000080000001A000000350000
          00350000001A0000000800000009000000030000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000003000000140000002ACE0364FFCE0364FFCE0364FFCE03
          64FF000000270000001B0000002A000000140000000300000000000000000000
          0000000000010000000200000002000000020000000200000002000000020000
          00020000000500000016CE0364FF01000146CE0364FFE63084FFE63084FFCE03
          64FF0100003FCE0364FF00000044000000360000001400000003000000000000
          0002000000080000000F00000012000000130000001300000013000000130000
          00130000001BCE0364FFE12A7CFFCE0364FFCE0364FFE12A7CFFE12A7CFFCE03
          64FFCE0364FFE12A7CFFCE0364FF000000440000002A00000009000000010000
          0008000000190000002900000030000000320000003200000032000000320000
          0033CE0364FFDE2178FFDE2178FFDE2178FFDE2178FFDE2178FFDE2178FFDE21
          78FFDE2178FFDE2178FFDE2178FFCE0364FF0000001B00000007000000022D15
          01538F4405EB9A4905FF984705FF974604FF954404FF924304FF904003FF8C3E
          03FF7F3803FFCE0364FFDA1873FFD81672FFD10D69FFD00866FFD00869FFD20D
          69FFD81672FFD91873FFCE0364FF0000003F000000270000001A000000029045
          05E6E4CCB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE697
          BCFFCD7EA3FFCE0364FFD20D69FFD10967FFCB4684FFDDACC3FFEEBDD4FFD246
          80FFD10967FFD20D69FFCE0364FF54052A9154052A8E0000003500000002A350
          06FFFFFFFFFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFCE03
          64FFCE0364FFCE0364FFCE0364FFCE0364FFB9879FFFD1D1D1FFE6E6E6FFEDBB
          D3FFCE0364FFCE0364FFCE0364FFCE0364FFCE0364FF0000003500000002A552
          06FFFFFFFFFFEEEEEEFFEEEEEEFFEEEEEEFFEEEEEEFFEEEEEEFFEEEEEEFFE737
          86FFFFB6D5FFFFB7D8FFFC97C6FFD31873FFBC91A4FFC0C0C0FFD2D2D2FFE2B5
          CAFFD2106AFFF15FA0FFF576AEFFFC97C6FFE73786FF0000001A00000002A654
          07FFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEBA5
          C4FFE8A1C1FFE45696FFFFA5CEFFE75396FFD06698FFBC94A6FFC098AAFFD76C
          9EFFE75396FFFFA5CEFFB92C6BDE5C16368C5C1636760000000700000002A955
          08FFFFFFFFFFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFE8E8E8FFE73786FFFC97C6FFF789BCFFE54E96FFD51E75FFD51E75FFE54E
          96FFF789BCFFFB96C2FFE73786FF000000450000002A0000000900000002AA57
          07FFFFFFFFFFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
          F2FFE73786FFF88ABBFFF88ABBFFF88ABBFFF88ABBFFF88ABBFFF88ABBFFF88A
          BBFFF88ABBFFF888BBFFF88ABBFFE73786FF000000140000000300000002AC58
          07FFFFFFFFFFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3
          F3FFF3F3F3FFE73786FFF57CB5FFE73786FFE45796FFF67BB3FFF67BB3FFDF51
          91FFE73786FFF67BB3FFE73786FF00000016000000030000000000000002AE59
          07FFFFFFFFFFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5
          F5FFF5F5F5FFF5F5F5FFE73786FFECE8EAFFEBA4C4FFF56FAAFFF56FAAFFD68F
          AFFF803706FFE73786FF0000001B00000005000000000000000000000002B05B
          08FFFFFFFFFFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7
          F7FFF7F7F7FFF7F7F7FFF7F3F5FFF7F7F7FFF0AAC9FFE73786FFE73786FFEEA8
          C7FF8B3D03FF050103370000001300000002000000000000000000000002B15C
          08FFFFFFFFFFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8
          F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F7F8FFF8F8F8FFF8F8F8FFF8F8F8FFFFFF
          FFFF904003FF000000320000001300000002000000000000000000000002B35D
          08FFFFFFFFFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFA
          FAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFFFF
          FFFF924204FF000000320000001300000002000000000000000000000002B45E
          09FFEBD5BFFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
          FBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFE4CF
          BEFF944404FF000000320000001300000002000000000000000000000002B55F
          09FFB45F09FFB35E08FFB15D08FFB05B09FFAF5A08FFAD5907FFAC5708FFA956
          07FFA85407FFA65307FFA45106FFA14E06FF9F4C05FF9D4A05FF9A4905FF9847
          05FF964505FF000000320000001300000002000000000000000000000002B660
          09FFB55F09FFB45F09FFB35D09FFB15D08FFB05B08FFAF5A08FFAE5808FFAC57
          08FFAA5607FFA85407FFA65206FFA24F06FFA04E06FF9F4C05FF9C4A05FF9A49
          05FF984705FF000000300000001200000002000000000000000000000002B660
          09FFC98A4AFFC88849FFC78849FFC7884AFFC68748FFC58649FFC48549FFC384
          49FFC18248FFC08248FFBF8147FFBD7F47FFBA7E47FFB97D47FFB87A46FFB67A
          46FFB47846FF000000290000000E00000002000000000000000000000001A557
          08E8C47F39FFC47F39FFC47F39FFC37E39FFC27E38FFC17D38FFBF7B38FFBF7B
          38FFBE7938FFBC7838FFBB7738FFB77537FFB77338FFB47238FFB37137FFB26F
          36FF9F6432EB0000001800000008000000010000000000000000000000002D18
          02418F4C07CAB66009FFB66009FFB56009FFB45F09FFB35D08FFB25C09FFB05B
          08FFAF5A08FFAD5908FFAB5808FFA95407FFA65307FFA45106FFA35006FF7F3D
          05CD2713014A0000000700000002000000000000000000000000000000000000
          0000000000010000000200000002000000020000000200000002000000020000
          0002000000020000000200000002000000020000000200000002000000020000
          0002000000020000000100000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000010000
          0003000000080000001000000015000000180000001800000018000000180000
          0018000000180000001800000018000000180000001800000018000000180000
          0015000000100000000800000003000000010000000000000000000000020000
          0008000000160303032907070637050505380A09093D0C0C0C3F0A0A0A3D0303
          0337000000350000003500000035000000350000003500000035000000340000
          0031000000260000001600000008000000020000000000000000000000040404
          0414975714EE9B5A14EE9C5B1AE89B6029E6996635E3A07243E8AB7E54EEB890
          67F8C09A77FEC3A07DFFC09D79FFBE9870FFBC8E60FFB7824CFFB27635FF995F
          1EEA0000003B0000002600000010000000030000000000000000030303088544
          00C69A4F00DFCF7317FFD38032FFB47037E8BB855DE9C8A185F0DCC1AFF7EEDC
          D7FEF9F2F1FFFAFAFAFFF8F8F8FFF6EEE3FFEED4B8FFE3B687FFDA9851FFD17E
          1FFF935000D300000032000000160000000400000001000000000E0D0B15CE6B
          08FFAA5700E9CF7317FFD38032FFD98851FFD19768F8DCB191FBE7C9B7FDEEE2
          DAFFF1ECEAFFEBEAE9FFE0DFDEFFD9D0C6FFCFB79DFFC59D74FFBF8647FFBD71
          1BFFB76300FF0000003A0000001B0000000500000001000000000F0D0B15CE6B
          08FFB85D00F0CF7317FFD38032FFD98851FFDC9E70FEE2B696FEE7CBBAFFE4D6
          D0FFD9D3CDFFC4BFBCFFB1AAA5FFA49689FF9A826BFF93704FFF926232FF9759
          15FF9A5300FF0000004A000000230000000900000003000000000908070DCE6B
          08FFC76602F8CF7317FFD38032FFD98851FFDDA377FFE2B897FFDCC0AEFFC6B8
          B0FFACA19BFF6C7A62FF3B633BFF1B5A25FF07561AFF075719FF195419FF344E
          13FF574607FF000000630000003700000015000000060000000101010105CE6B
          08FFD47E40FCD78B51FFDE9C66FFE3AE8BFFE4C0A7FFDEC5B3FFC5B4A9FF8F8D
          7CFF3D643CFF057831FF08A755FF19CF75FF26DD84FF2DDE89FF2ED380FF22AD
          64FF197E40FE023312C4010C05690000002A0000000F00000004000000042111
          004A9E5100FF9C5200FFAA672FFFB17B53FFB18970FFA68B7AFF7A735EFF2A59
          2CFF039847FF1BDB7DFF26DD88FF2DDE8BFF2FDE8BFF3BE093FF3FE196FF46E1
          9AFF44E192FF2DA25FFF083E1CCB020C065C0000001F0000000900000005A453
          00F1B45E00FFCF7317FFC6874EFFCA8F65FFC29676FFA88973FF3C5F35FF0398
          46FF20DC83FF26DD87FF2EDE8BFF38DF90FF3CE094FF42E197FF4CE39AFF4EE4
          9EFF56E5A3FF5AE5A2FF36A567FF0B381BB6000000330000001200000006B45E
          00FFB45E00FFCF7317FFC6874EFFC78D64FFB68C6CFF6B6D4BFF057831FF1FDB
          7CFF2BDE8BFF2FDE8CFF2DD27FFF1C9E56FF0B7233FF0F7336FF28A15FFF47D7
          8EFF5FE6A6FF67E7ACFF60E6A3FF2E8551F9071C0F770000001B00000005B85D
          00FFB45E00FFCF7317FFC6874EFFC58A62FFAE8465FF3D5E31FF12A958FF2DDE
          8AFF2FDE8DFF30D27FFF1C8144FF577851FF9F926FFF998153FF54622DFF2B81
          49FF58DB99FF6DE8B0FF72E9B2FF4FB87FFF113B20B00000002100000004B45E
          00FFB45E00FFCF7317FFC6874EFFC38960FFA87F5FFF1D5A23FF24D17BFF33DF
          93FF3CE094FF209E5AFF527751FFCCBCACFFDEC2A5FFD3A779FFB5793DFF515A
          20FF3EA76FFF73E9B6FF78EAB8FF6ADEA4FF1D5531D80000002200000004994C
          00E3D8864CFFDA9056FFD5A47FFFD0AA90FFB29581FF085A1BFF7DEAB6FF8AEC
          BEFF96EFC3FF1E753DFF8E907CFFD7CEC6FFEDDDCBFFE1C3A5FFC0956AFF8766
          32FF327E4FFFA5F1D0FFA5F1D0FF99EFC8FF25683EF40000001B000000052C16
          005B9E5100FF9C5200FFA9672FFFA9754EFF956E55FF075A1CFF8DEDBCFF9BF0
          C8FFA2F1CDFF227742FF747563FFA89B8EFFB09C87FFA17E5DFF895D30FF6F4D
          16FF327E4FFF327E4FFF327E4FFF327E4FFF327E4FFF0000000D00000005A453
          00F1B45E00FFCF7317FFC6874EFFC58B62FFAF8463FF1F5E29FF83E0AEFFAAF2
          D0FFB0F3D4FF5CAA7DFF4C6C4AFFA29385FFAE967DFF9D7854FF437D5AFF844B
          10FF703A00E40000004A000000260000000F000000080000000300000006B45E
          00FFB45E00FFCF7317FFC6874EFFC88D63FFB98D6CFF476A3DFF67BA8AFFB7F4
          DAFFBCF4DCFF9FE6C0FF48895FFF4D6946FF72684CFF6D5A37FF437D5AFF437D
          5AFF7B4000FF0000005C0000002B0000000B000000030000000100000005B85D
          00FFB45E00FFCF7317FFC7884EFFCA8F65FFC49775FF807F5EFF41895BFFADF2
          CFFFC8F6E4FFCFF7E7FFADE8C8FF71AF8AFF3D8155FF3F8259FF3F8259FFEBFC
          F6FF437D5AFF000000720000003D00000013000000040000000000000004B45E
          00FFB95E00FECF7317FFC7884EFFCC9067FFCD9F7CFFC2A087FF54754EFF69AE
          87FFCAF6E3FFD9F8EBFFDCFAEFFFDFFAF0FFE5FBF3FFE8FCF6FFEBFCF6FFEBFC
          F6FFEBFCF6FF437D5AFF0000004500000018000000050000000100000002984C
          00E2D8864CFFDA9056FFD6A581FFDDB59BFFE2C5B3FFDDC8B9FFB4AC9BFF4F79
          53FF74B18DFFC7F6DEFFE5FBF3FFEAFCF7FFEBFCF8FFF1FDFBFFEBFCF6FFEBFC
          F6FFEBFCF6FFEBFCF6FF437D5AFF000000110000000300000000000000012814
          00493B1E006B4625007CB77B4AFFB77D4EFFB88155FFB9845AFFB8865EFFA186
          62FF688F77FF5A9470FF94C5A9FFC7ECD9FFE9FCF5FFEBFCF6FFEBFCF6FFEBFC
          F6FFEBFCF6FF437D5AFF00000019000000070000000100000000000000000000
          0001000000020000000400000005000000060000000600000006000000070000
          000A0000000F0B1E1257183F289B265A38D02F6E46F3326D4BF4437D5AFFEBFC
          F6FF437D5AFF0000001700000007000000020000000000000000000000000000
          0000000000000000000000000001000000010000000100000001000000010000
          0002000000030000000500000007000000090000001000000020437D5AFF437D
          5AFF000000140000000600000002000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000010000000100000001000000040000000B437D5AFF0000
          000E000000060000000200000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          000000000001000000050000000C0000000F0000000F0000000F0000000F0000
          000F0000000F0000000F0000000F0000000F0000000F0000000F0000000F0000
          000F0000000C0000000500000001000000000000000000000000000000000000
          000000000005000000190000002E000000350000003600000036000000360000
          0036000000360000003600000036000000360000003600000036000000360000
          00350000002E0000001900000005000000000000000000000000000000000000
          0000250F0051763001EB823401FF823402FF813501FF813402FF823401FF8234
          02FF813502FF823402FF823502FF823401FF823402FF813401FF823402FF752F
          02ED240F00770000002D0000000C000000000000000000000000000000000000
          0000783302E6DDC7B8FFF3F3F3FFEEEEEEFFADADADFFEEEEEEFFEEEEEEFFEEEE
          EEFFADADADFFEEEEEEFFEEEEEEFFEEEEEEFFADADADFFF3F3F3FFFFFFFFFFDDC7
          B8FF773101EB000000350000000F000000000000000000000000000000000000
          0000893B02FFFFFFFFFFF0F0F0FFF0F0F0FFADADADFFF0F0F0FFF0F0F0FFF0F0
          F0FFADADADFFF0F0F0FFF0F0F0FFF0F0F0FFADADADFFF0F0F0FFFFFFFFFFFFFF
          FFFF893B02FF000000360000000F000000000000000000000000000000000000
          00008F3F03FFFFFFFFFFF2F2F2FFF2F2F2FFADADADFFF2F2F2FFF2F2F2FFF2F2
          F2FFADADADFFF2F2F2FFF2F2F2FFF2F2F2FFADADADFFF2F2F2FFFFFFFFFFFFFF
          FFFF8F3F03FF000000360000000F000000000000000000000000000000000000
          0000944403FFADADADFFADADADFFADADADFFADADADFFADADADFFADADADFFADAD
          ADFFADADADFFADADADFFADADADFFADADADFFADADADFFADADADFFADADADFFADAD
          ADFF944504FF000000360000000F000000000000000000000000000000000000
          0000994A05FFFFFFFFFFF6F6F6FFF6F6F6FFADADADFFF6F6F6FFF6F6F6FFF6F6
          F6FFADADADFFF5F5F5FFF2F2F2FFEDEDEDFFA4A4A4FFE7E7E7FFEFEFEFFFF2F2
          F2FF954604FF0000003900000010000000000000000000000000000000000000
          0000AB5907FFFFFFFFFFF8F8F8FFF8F8F8FFADADADFFF8F8F8FFF8F8F8FFF8F8
          F8FFACACACFFEEEEEEFFE0E0E0FFD0D0D0FF898989FFBDBDBDFFC2C2C2FFCACA
          CAFF904A06FF0000004A00000018000000020000000000000000000000000000
          0000B15D08FFFFFFFFFFFAFAFAFFFAFAFAFFADADADFFFAFAFAFFFAFAFAFFF8F8
          F8FFA5A5A5FFB5CBDBFF78ADD7FF50A1DEFF3598E5FF399CE8FF4F9FDDFF70A5
          CFFF6E5435FF00000065000000310000000C0000000200000000000000000000
          0000AB5907FFAB5907FFAB5907FFAB5907FFAB5907FFAB5907FFAA5907FFA456
          07FF6B6C63FF5399CDFF8BC7F5FFC5E3FAFFEEF7FEFFEEF7FEFFC5E3FAFF8BC7
          F5FF5198CDFF143F60AC0000004C000000240000000A00000001000000000000
          0000AB5907FFAB5907FFAB5907FFAB5907FFAB5907FFAB5907FFA85807FF6F6E
          63FF62ADE7FFBFE0F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFBFE0F9FF5CACE7FA143E5F9C0000003B0000001900000004000000000000
          0000CB9966FFCB9966FFCB9966FFCB9966FFCC9A68FFCB9966FFA6957EFF59A3
          D9FFBFE0F9FFFFFFFFFFF8F8F8FFEDEDEDFFE4E4E4FFE3E3E3FFEBEBEBFFF7F7
          F7FFFFFFFFFFBFE0F9FF4090CCE70A20306E0000002900000009000000000000
          0000B27E4AE7C48A50FFC48A50FFC48B52FFC48A50FFC48A50FF75909EFF8BC7
          F5FFFFFFFFFFF9F9F9FFEAEAEAFFE4E4E4FFE3E3E3FFE2E2E2FFE1E1E1FFE6E6
          E6FFF7F7F7FFFFFFFFFF8BC7F5FF184E77A7000000350000000D000000000000
          00002E1F0F40956330CABD7D3CFFBD7D3CFFBC7C3BFFBD7D3CFF5091C0FFC5E3
          FAFFFFFFFFFFF1F1F1FFE7E7E7FFE6E6E6FFE5E5E5FFE5E5E5FFE3E3E3FFE2E2
          E2FFEDEDEDFFFFFFFFFFC5E3FAFF2474B3D40000003D00000010000000000000
          00000000000000000000000000000000000000000000000000002D90DCEEEEF7
          FEFFFFFFFFFFEEEEEEFFEAEAEAFFE9E9E9FF2182CEFF2182CEFF2182CEFF2182
          CEFF2182CEFF2182CEFFEEF7FEFF2D90DCF30000003D00000010000000000000
          00000000000000000000000000000000000000000000000000002D90DCEEEEF7
          FEFFFFFFFFFFF0F0F0FFEDEDEDFFECECECFF2182CEFFB6D6F0FFE9E9E9FFE8E8
          E8FFEAEAEAFFFFFFFFFFEEF7FEFF2D90DCF3000000350000000D000000000000
          00000000000000000000000000000000000000000000000000002474B2C2C5E3
          FAFFFFFFFFFFF6F6F6FFF0F0F0FFEFEFEFFF2182CEFFB6D6F0FFECECECFFEBEB
          EBFFF2F2F2FFFFFFFFFFC5E3FAFF2475B3D20000002900000009000000000000
          0000000000000000000000000000000000000000000000000000184E77828BC7
          F5FFFFFFFFFFFCFCFCFFF5F5F5FFF1F1F1FF2182CEFFB6D6F0FFEFEFEFFFF1F1
          F1FFFAFAFAFFFFFFFFFF8BC7F5FF184E779D0000001900000004000000000000
          00000000000000000000000000000000000000000000000000000A2030354290
          CDDCBFE0F9FFFFFFFFFFFCFCFCFFF9F9F9FFF5F5F5FFF4F4F4FFF7F7F7FFFBFB
          FBFFFFFFFFFFBFE0F9FF4090CDE40A2030510000000A00000001000000000000
          000000000000000000000000000000000000000000000000000000000000143F
          60685CAAE7F5BFE0F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFBFE0F9FF5CABE7F6133F607C0000000C0000000200000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000143F60684290CDDC8BC7F5FFC5E3FAFFEEF7FEFFEEF7FEFFC5E3FAFF8BC7
          F5FF4090CDE0133F60760000000A000000020000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000A203035184E77822474B2C22D90DCEE2D90DCEE2475B2C4184E
          77860A20303B0000000400000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000010000
          00050000000C0000000F0000000F0000000F0000000F0000000F0000000F0000
          000F0000000F0000000F0000000F0000000F0000000F0000000F0000000C0000
          0005000000010000000000000000000000000000000000000000000000050000
          00190000002E0000003500000036000000360000003600000036000000360000
          00360000003600000036000000360000003600000036000000350000002E0000
          0019000000050000000000000000000000000000000000000000250F00517630
          01EB823401FF823402FF813501FF813402FF823401FF823402FF813502FF8234
          02FF823502FF823401FF823402FF813401FF823402FF752F02ED240F00770000
          002D0000000C0000000000000000000000000000000000000000783302E6DDC7
          B8FFF3F3F3FFEEEEEEFFADADADFFEEEEEEFFEEEEEEFFEEEEEEFFADADADFFEEEE
          EEFFEEEEEEFFEEEEEEFFADADADFFF3F3F3FFFFFFFFFFDDC7B8FF773101EB0000
          00350000000F0000000000000000000000000000000000000000893B02FFFFFF
          FFFFF0F0F0FFF0F0F0FFADADADFFF0F0F0FFF0F0F0FFF0F0F0FFADADADFFF0F0
          F0FFF0F0F0FFF0F0F0FFADADADFFF0F0F0FFFFFFFFFFFFFFFFFF893B02FF0000
          00360000000F00000000000000000000000000000000000000008F3F03FFFFFF
          FFFFF2F2F2FFF2F2F2FFADADADFFF2F2F2FFF2F2F2FFF2F2F2FFADADADFFF2F2
          F2FFF2F2F2FFF2F2F2FFADADADFFF2F2F2FFFFFFFFFFFFFFFFFF8F3F03FF0000
          00360000000F0000000000000000000000000000000000000000944403FFADAD
          ADFFADADADFFADADADFFADADADFFADADADFFADADADFFADADADFFADADADFFADAD
          ADFFADADADFFADADADFFADADADFFADADADFFADADADFFADADADFF944504FF0000
          00360000000F0000000000000000000000000000000000000000994A05FFFFFF
          FFFFF6F6F6FFF6F6F6FFADADADFFF6F6F6FFF6F6F6FFF6F6F6FFADADADFFF6F6
          F6FFF6F6F6FFF6F6F6FFADADADFFF2F2F2FFF5F5F5FFEEEEEEFF8D4304FF0000
          00470000001F0000000A00000004000000000000000000000000AB5907FFFFFF
          FFFFF8F8F8FFF8F8F8FFADADADFFF8F8F8FFF8F8F8FFF3F3F3FFA0A0A0FFE0E0
          E0FFE0E0E0FFE0E0E0FF9B9B9BFFD6D6D6FFCACACAFFB8B8B8FF743C05FF0000
          007700000052000000350000001F0000000A0000000100000000B15D08FFFFFF
          FFFFFAFAFAFFFAFAFAFFADADADFFFAFAFAFFFAFAFAFFE7E7E7FF7D7D7DFFA2A2
          A2FFA2A2A2FFA2A2A2FF687680FF5996C0FF2C8BCFFF0E7BCDFF0D7ACCFF1C7B
          BFF6246089D4101E2886000000530000002B0000000A00000000AB5907FFAB59
          07FFAB5907FFAB5907FFAB5907FFAB5907FFAB5907FF3E8DDAFF3E8DDAFF3E8D
          DAFF4A80B6FF5894BFFF3896D9FF4BA5E0FF71C3EDFF86D6F7FF7ED3F7FF5CBC
          ECFF379FDFFF2589CFFF18354BA8000000530000001F00000004AB5907FFAB59
          07FFAB5907FFAB5907FFAB5907FFAB5907FFAB5907FF3E8DDAFFF2F7FCFFDCE1
          E5FF678FC6FF3E98D9FF81C5EDFFB0E7FCFFA6E5FCFF9CE2FBFF92DFFBFF89DC
          FBFF7FD9FAFF55B8EBFF258ACFFF121F2886000000350000000ACB9966FFCB99
          66FFCB9966FFCB9966FFCC9A68FFCB9966FFCB9966FF3D8FDCFFEEF3F8FF89B8
          EEFF61A4D6FF5BAAE0FFC3EDFDFFB9EAFCFFB0E7FCFF81CDEDFF96DEF9FF92DF
          FBFF89DCFBFF7FD9FAFF379FDFFF26618BD10000004700000011B27E4AE7C48A
          50FFC48A50FFC48B52FFC48A50FFC48A50FFC48B52FF3D91DEFFECF1F6FF89B8
          EEFF3E95D7FF99CEEFFFCCF0FDFFC3EDFDFF7EC5E4FF047AB6FF1D8CC3FF8BD7
          F4FF92DFFBFF89DCFBFF5CBCECFF1D7ABDF400000052000000162E1F0F409563
          30CABD7D3CFFBD7D3CFFBC7C3BFFBD7D3CFFBC7C3BFF3D92DFFFEDF2F7FF89B8
          EEFF167ECEFFCBEAFAFFD4F2FDFF89C6E2FF0576B1FF3496C7FF3498C9FF1486
          BFFF82D1F0FF92DFFBFF7ED3F7FF0D7ACBFE0000005200000016000000000000
          000000000000000000000000000000000000000000003D94E1FFF0F5FAFF89B8
          EEFF127BCDFFD1ECFAFF94C9E1FF0573ACFF3E98C5FFBEEAFBFFB7E9FBFF44A2
          D0FF0C81BCFF77CAECFF86D6F7FF0D7BCCFE0000004700000011000000000000
          000000000000000000000000000000000000000000003D96E3FFF3F8FDFF89B8
          EEFF348AD1FFA9D3EFFF0872A8FF4699C3FFCFEFFBFFCCF0FDFFC3EDFDFFB9EA
          FCFF55ADD7FF5CB5DDFF71C3EDFF2080C2F3000000350000000A000000000000
          000000000000000000000000000000000000000000003D97E5FFF3F9FDFF89B8
          EEFF4B90D1FF6CAFE1FFB6D9EAFFDFF4FCFFDDF5FEFFD4F2FDFFCCF0FDFFC3ED
          FDFFB9EAFCFFB0E7FCFF4BA5E0FF2B6891CD0000002300000004000000000000
          000000000000000000000000000000000000000000003D99E7FFF3F9FDFF89B8
          EEFF649FDFFF3C90D3FFA8D1EFFFEBF9FEFFE4F7FEFFDDF5FEFFD4F2FDFFCCF0
          FDFFC3EDFDFF81C5EDFF3997D9FF16232B7E0000001A00000000000000000000
          0000000000000000000000000000000000000000000047A0EAFFE9F4FCFFA2CA
          F3FF84B9EEFF65A5E0FF3D91D4FF6CAFE1FFA9D3EFFFD1ECFAFFCBEAFAFF99CE
          EFFF5BAAE0FF3E98D9FF54A4E0FF0000005A0000001900000000000000000000
          0000000000000000000000000000000000000000000077B0DEFFADD5F6FFFFFF
          FFFF92C7F3FF92C7F3FF7DB9E9FF58A2DCFF318BD3FF137CCDFF157DCEFF3C94
          D7FF6EB2E2FF89BDE8FF309BEDFF0000005A0000001900000000000000000000
          00000000000000000000000000000000000000000000353434443399E9FFD3E9
          FBFFFFFFFFFFB6DDF9FF9FD3F7FF9FD3F7FF9FD3F7FF97CFF6FF97CFF6FF96CE
          F4FF9CCDF1FFA3CEF0FF309BEDFF0000005A0000001900000000000000000000
          00000000000000000000000000000000000000000000000000004650576B379C
          EAFFA0D1F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF309BEDFF000000470000001300000000000000000000
          0000000000000000000000000000000000000000000000000000000000004746
          46546EA8D4EC44A2EAFF309BEDFF309BEDFF309BEDFF309BEDFF309BEDFF309B
          EDFF309BEDFF309BEDFF309BEDFF000000130000000500000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000020000
          0004000000050000000500000005000000050000000500000005000000050000
          0005000000050000000500000005000000050000000400000003000000010000
          00000000000000000000000000000000000000000000000000000000000B0000
          001400000018000000190000001A0000001A0000001A0000001A0000001A0000
          001A0000001B0000001A0000001900000018000000140000000B000000040000
          00010000000000000000000000000000000000000000000000000000001F0000
          00320000003B0000003D0000003D0000003D0000003D0000003D0000003D0000
          003D0000003D0000003D0000003D0000003B000000320000001F0000000B0000
          00020000000000000000000000000000000000000000000000002A13016C873D
          04EE934104FF914003FF8F3F03FF8E3D03FF8C3C03FF8B3B03FF853702FF8435
          02FF6D4103FF803301FF7F3201FF712C02EF230E007C00000032000000130000
          0004000000000000000000000000000000000000000000000000893F05EAE2CA
          B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9ACD9EFF80C0
          85FFFFFFFFFFFFFFFFFFFFFFFFFFDBC5B7FF712C01EC0000003B000000180000
          00050000000000000000000000000000000000000000000000009C4904FFFFFF
          FFFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFD3E1D4FF369941FFB2D2
          B5FFEDEDEDFFEDEDEDFFEDEDEDFFFFFFFFFF823302FF0000003D000000190000
          0005000000000000000000000000000000000000000000000000A04C05FFFFFF
          FFFFEEEEEEFFEEEEEEFFEEEEEEFFEEEEEEFFEEEEEEFF92C496FF008311FFDDE6
          DEFFEEEEEEFFEEEEEEFFEEEEEEFFFFFFFFFF843602FF0000003D0000001A0000
          0005000000000000000000000000000000000000000000000000A24E05FFFFFF
          FFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFF59AA62FF008413FFDEE7
          DFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFFF883802FF0000003D0000001A0000
          0005000000000000000000000000000000000000000000000000A55206FFFFFF
          FFFFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF2B9538FF009125FFB5D5
          B8FFF0F0F0FFF0F0F0FFF0F0F0FFFFFFFFFF8B3A02FF0000003D0000001A0000
          0005000000000000000000000000000000000000000000000000A85407FFFFFF
          FFFFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FF0B8719FF00A647FF79BB
          81FFF2F2F2FFF2F2F2FFF2F2F2FFFFFFFFFF8D3C03FF0000003D0000001A0000
          0008010101080000000300000000000000000000000000000000AB5707FFFFFF
          FFFFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FF0B881BFF00BD6AFF309D
          42FFCBE1CEFFF3F3F3FFF3F3F3FFFFFFFFFF903F03FF0000003D0000001A0101
          0110020202210101011300000003000000000000000000000000AE5908FFFFFF
          FFFFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FF2C9839FF00C779FF00A9
          4CFF63B26EFFE8EFE9FFF5F5F5FFFFFFFFFF934103FF0000003F0000001B0084
          02FF030303310303032F01010113000000030000000000000000B15C08FFFFFF
          FFFFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FF5CAE67FF00B55EFF00CD
          83FF00A341FF64B46EFFCEE4D2FFFFFFFFFF964404FF0102014E010101280084
          02FF008402FF0404043F0303032F010101130000000300000000B45F08FFFFFF
          FFFFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FF98CB9FFF00A03FFF00D7
          93FF00CD83FF03AC50FF32A049FF80C38BFF7D5308FF0307036B0304034B0084
          02FF7DEBC8FF008402FF0404043F0303032F0101011300000003B66208FFFFFF
          FFFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFDFEDE1FF37A24AFF00BC
          69FF02D794FF0DD999FF13C67BFF12B15BFF0D9E3CFF058F24FF069125FF1AA1
          39FF8BEDCEFF9FF0D6FF008402FF0404043F0303032F01010113B96509FFD4D4
          D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFFBFBFBFF98CDA0FF009C
          38FF08CC82FF15DA9CFF24DDA2FF35DFA9FF47E2B1FF5AE5B9FF6FE8C2FF83EC
          CAFF97EFD3FFACF2DCFFBEF5E3FF008402FF0404043F0303032CC06B0AFFC26D
          0BFFC26D0BFFC26D0BFFC88033FFC38846FFD4D4D4FFFCFCFCFFFBFCFBFF75BD
          80FF06A546FF19CF8CFF2EDEA6FF40E1AEFF53E4B6FF67E7BFFF7CEAC8FF90EE
          D0FFA4F1D8FFB8F4E1FFCBF7E9FFDBF9F0FF008402FF0303032C2A170238C06B
          0AFFFDFDFDFFFDFDFDFFFFFFFFFFC0792AFFD4D4D4FFFDFDFDFFFDFDFDFFEBF5
          EDFF75BF83FF0BA242FF27C782FF4CE3B3FF60E6BCFF74E9C4FF88ECCDFF9DF0
          D5FFB1F3DEFFC4F6E6FFD5F8EDFFE4FBF4FF008402FF01010113000000002A17
          0238C06B0AFFFEFEFEFFFFFFFFFFBC6709FFD4D4D4FFFEFEFEFFFEFEFEFFFEFE
          FEFFFDFEFDFF99D0A4FF3AA753FF1EAF59FF41CA8BFF68DEB1FF8EECCCFFA1EE
          D4FFBDF5E3FFCFF7EBFFDFFAF1FF008402FF0101011300000003000000000000
          00002A170238C06B0AFFFFFFFFFFBC6709FFD4D4D4FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE3F2E6FF9CD2A8FF407815FF007318DB00861CF40084
          02FFC9F7E8FFDAF9EFFF008402FF010101130000000300000000000000000000
          0000000000002A170238C06B0AFFBC6709FFD4D4D4FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEBD5BFFF9E5107EC0000001E0000000B0084
          02FFD3F8ECFF008402FF01010113000000030000000000000000000000000000
          000000000000000000002A170238C06B0AFFC06B0AFFBF6A0AFFBA650AFFB964
          09FFB76209FFB66009FFB45F08FF8D4A06CE2C17024D0000000B000000030084
          02FF008402FF0101011300000003000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000084
          02FF010101080000000300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object imgResources: TcxImageList
    Height = 40
    Width = 60
    FormatVersion = 1
    DesignInfo = 29425989
    ImageInfo = <
      item
        Image.Data = {
          B6250000424DB62500000000000036000000280000003C000000280000000100
          2000000000008025000000000000000000000000000000000000000000000000
          0000000000000000000000000000010100031F180D5140301BA54F3B21CC6249
          29FC634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A
          29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A
          29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A
          29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A
          29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A
          29FF624929FC4F3B21CC40301BA51F180D510101000300000000000000000000
          00000000000000000000000000000000000000000000000000000F0B0627513E
          27D17F613DFFA97C44FFD49649FFD49649FFD49649FFD49649FFD49649FFD496
          49FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD496
          49FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD496
          49FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD496
          49FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD496
          49FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFA97C44FF7F61
          3DFF513E27D10F0B062700000000000000000000000000000000000000000000
          0000000000002C211272715839FACA9148FFD29449FFBE813EFFA56A30FF8D51
          22FF8E5322FF8D5222FF8E5322FF8E5323FF8D5122FF8D5122FF8E5223FF8F53
          23FF8E5323FF8F5323FF8E5223FF8E5223FF8F5323FF8E5223FF8F5324FF9153
          25FF915325FF915325FF915325FF915325FF915325FF915325FF915325FF9153
          25FF915325FF915325FF915325FF915325FF925525FF915524FF915425FF9154
          25FF925525FF915425FF915425FF915425FF925525FF925525FF935525FF9355
          25FF935525FFA96C31FFC0833FFFD29449FFCA9148FF715839FA2C2112720000
          0000000000000000000000000000000000003628178D977141FFD49649FFC689
          42FF935826FF8E5123FF8E5322FF8E5322FF8E5323FF8E5323FF8F5323FF8E52
          23FF8F5322FF8E5323FF8F5324FF8E5223FF8F5324FF8F5323FF8F5323FF8F54
          24FF905324FF8F5424FF905424FF925525FF925525FF925525FF925525FF9255
          25FF925525FF925525FF925525FF925525FF925525FF925525FF925525FF9255
          25FF925426FF935526FF925526FF925525FF935525FF925525FF925525FF9255
          26FF935525FF935527FF935626FF935525FF935626FF935527FF935527FF975A
          28FFC78942FFD49649FF977141FF3628178D0000000000000000000000002219
          0E5782633EFFD49649FFB17436FF8F5424FF905424FF8F5324FF905424FF9054
          24FF8F5424FF905424FF905424FF905524FF905524FF905424FF905424FF9154
          25FF905524FF905424FF905525FF905424FF915524FF915525FF915524FF9356
          26FF935626FF935626FF935626FF935626FF935626FF935626FF935626FF9356
          26FF935626FF935626FF935626FF935626FF935626FF935627FF935726FF9357
          27FF935727FF935626FF945627FF935626FF935527FF935627FF935627FF9457
          27FF935627FF935627FF945727FF935627FF945728FFB37638FFD49649FF8062
          3DFF22190E5700000000020201065A462CE9D19449FFBD803DFF8F5424FF8F54
          24FF915424FF915424FF905524FF905424FF915425FF915525FF915524FF9155
          24FF915525FF915424FF915425FF905425FF915524FF915525FF915525FF9154
          25FF915425FF925524FF925525FF935627FF935627FF935627FF935627FF9356
          27FF935627FF935627FF935627FF935627FF935627FF935627FF935627FF9356
          27FF935626FF935727FF945626FF945627FF945627FF935627FF945727FF9457
          27FF945727FF945727FF945827FF945728FF955728FF955827FF955728FF9557
          28FF945828FF955728FFC0833FFFD19449FF57442BE102020106231A0E5AB284
          4CFFD19449FF935726FF915524FF925625FF925525FF925524FF915524FF9256
          25FF925625FF925625FF925625FFD3985DFFEBB172FFEBB172FFEBB172FF9256
          25FF935625FF925625FF935625FF935625FF935625FF935625FF935625FF995E
          2BFFEBB172FFEBB172FFEBB172FFEBB172FF995E2BFF945827FF945827FF9458
          27FF945827FF945827FF945827FF945827FF955827FFA06331FFEBB172FFEBB1
          72FFEBB172FFEBB172FFEBB172FFEBB172FFEBB172FFEBB172FFEBB172FFBD81
          4AFF965827FF965828FF965928FF965928FF965928FF965928FF985A29FFD294
          49FFB2844CFF231A0E5A40301BA5C38E4BFFBE813EFF925625FF925726FF9356
          25FF935726FF935726FF935726FF935726FF935726FF935726FF935726FFD89A
          4AFFDA9B42FFDA9B42FFDA9B42FF935727FF935726FF935726FF935726FF9357
          26FF935726FF935727FF935827FFBE8349FFDA9B42FFDA9B42FFDA9B42FFDA9B
          42FFBA7E45FF965928FF965928FF965928FF965928FF965928FF965928FF9659
          28FF965929FFA76B34FFCD8F3FFFCD8F3FFFCD8F3FFFCD8F3FFFCD8F3FFFCD8F
          3FFFCD8F3FFFCD8F3FFFCD8F3FFFC58846FF965929FF975929FF975929FF9759
          29FF975929FF975A29FF975A29FFC0833FFFC18C4AFF40301BA5543F23D8D194
          4AFFA3672EFF935626FF935726FF935626FF935726FF945726FF935726FF9358
          27FF935726FF945726FF945726FFD49749FFDA9B42FFDA9B42FFDA9B42FF9458
          27FF945827FF955827FF945827FF935827FF955827FF955827FF945827FFD699
          51FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFD29550FF975929FF975929FF9759
          29FF975929FF975929FF975929FF975929FF975929FFA16633FFCD8F3FFFCD8F
          3FFFCD8F3FFFCD8F3FFFCD8F3FFFCD8F3FFFCD8F3FFFCD8F3FFFCD8F3FFFBC82
          44FF975A29FF985A29FF985A29FF985A29FF985A29FF985A29FF985A29FFAB6C
          33FFCD934AFF564024DE5D4627F0D49649FF965A28FF945726FF935726FF9457
          26FF935726FF945726FF935726FF945827FF955827FF955827FF945726FFD497
          49FFDA9B42FFDA9B42FFDA9B42FF955827FF945826FF955827FF955827FF9558
          27FF955928FF955827FF9B5E2BFFDEA04FFFDA9B42FFDA9B42FFDA9B42FFDA9B
          42FFE0A253FF9D5F2DFF975A29FF975A29FF975A29FF975A29FF975A29FF975A
          29FF975A29FF965C2BFFCD8F3FFFCD8F3FFFCD8F3FFFCD8F3FFFCD8F3FFFCD8F
          3FFFCD8F3FFFCD8F3FFFCD8F3FFF9F6731FF985B29FF995A29FF995B29FF995B
          2AFF995B29FF9A5B29FF9A5B29FFA0622EFFD49649FF614828F9634A29FFD496
          49FF955928FF955827FF955827FF955927FF955827FF965928FF965928FF9559
          28FF965928FF955927FF955927FFD49749FFDA9B42FFDA9B42FFDA9B42FF9659
          28FF965928FF965928FF965A28FF965928FF965A29FF975A29FFBF8449FFDA9B
          42FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFBC7F46FF995B29FF995B
          29FF995B29FF995B29FF995B29FF995B29FF985B29FF905428FF4F2920FF4F29
          20FF4F2920FFCD8F3FFFCD8F3FFFCD8F3FFFB17A44FF4F2920FF4F2920FF7845
          26FF9B5C2AFF9A5B2AFF9B5D2AFF9B5C2AFF9B5C2AFF9B5D2AFF9B5C2AFF9B5D
          2AFFD49649FF634A29FF634A29FFD49649FF965928FF965928FF965A28FF965A
          28FF965928FF965A28FF965A28FF965A28FF965A28FF975A28FF965A28FFD497
          49FFDA9B42FFDA9B42FFDA9B42FF975A28FF975A29FF975A29FF975A28FF975B
          28FF975B28FF975A29FFD69951FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B
          42FFDA9B42FFD39651FF9A5D2AFF9A5D2AFF9A5D2AFF9A5D2AFF9A5D2AFF9A5D
          2AFF9A5C2AFF9A5C2AFF9A5D2AFF9A5D2AFF9B5D2AFFCD8F3FFFCD8F3FFFCD8F
          3FFFBC8245FF9B5D2AFF9B5D2BFF9B5C2BFF9B5D2BFF9B5D2AFF9C5D2BFF9C5D
          2BFF9C5D2BFF9C5D2BFF9C5D2BFF9C5D2BFFD49649FF634A29FF634A29FFD496
          49FF975B29FF975A28FF975A28FF975A28FF975A28FF975A28FF975A29FF975A
          28FF975A28FF975A29FF975A29FFD5984AFFDA9B42FFDA9B42FFDA9B42FF975A
          29FF995B29FF975B29FF985B29FF995B29FF985B29FF9E602DFFDEA04FFFDA9B
          42FFDA9B42FFCF9244FFC88D43FFDA9B42FFDA9B42FFE0A253FFA0622FFF9B5D
          2AFF9B5D2AFF9B5D2AFF9B5D2AFF9B5D2AFF9B5D2AFF9B5D2BFF9C5E2BFF9B5D
          2BFF9C5D2BFFCD8F3FFFCD8F3FFFCD8F3FFFBC8245FF9D5E2CFF9D5E2CFF9D5F
          2CFF9D5F2CFF9D5E2CFF9D5E2CFF9D5F2CFF9D5E2CFF9E5F2CFF9D5F2CFF9E5F
          2DFFD49649FF634A29FF634A29FFD49649FF985B29FF985B29FF985B29FF985C
          29FF985C29FF985B29FF985B29FF985C29FF985C29FF985C29FF995C29FFD598
          4AFFDA9B42FFDA9B42FFDA9B42FF995C29FF995C29FF9A5D2AFF9A5C2AFF995D
          29FF995C29FFC1864BFFDA9B42FFDA9B42FFDA9B42FFAE773BFFA56E37FFDA9B
          42FFDA9B42FFDA9B42FFBE8047FF9D5F2CFF9D5F2CFF9D5F2CFF9D5F2CFF9D5F
          2CFF9D5F2CFF9D5F2CFF9E5F2CFF9D5F2CFF9E602CFFCD8F3FFFCD8F3FFFCD8F
          3FFFBD8345FF9E602DFF9E602DFF9E602CFF9E602CFF9F602CFF9E602DFF9F60
          2DFF9F602CFF9F602DFFA0602DFF9F602DFFD49649FF634A29FF634A29FFD496
          49FF9A5D29FF995C29FF9A5D29FF995C29FF9A5D29FF9A5C29FF995D29FF9A5C
          29FF9A5D29FF995D29FF9A5D29FFD5984AFFDA9B42FFDA9B42FFDA9B42FF9A5D
          29FF9A5E2AFF9B5E2AFF9B5D2AFF9B5E2AFF9B5E2AFFD79B52FFDA9B42FFDA9B
          42FFDA9B42FF88542CFF86522AFFDA9B42FFDA9B42FFDA9B42FFD49751FF9F60
          2DFF9F602DFF9F602DFF9F602DFF9F602DFF9E602DFF9F602DFF9F602DFF9F60
          2DFF9F602EFFCD8F3FFFCD8F3FFFCD8F3FFFBD8345FFA0612DFF9F602EFF9F60
          2EFF9F612EFFA0612EFF9F612EFFA0612EFFA0612EFFA0612EFFA0612EFFA061
          2EFFD49649FF634A29FF634A29FFD49649FF9A5E2AFF9B5E2AFF9B5E2AFF9B5E
          2AFF9B5E2AFF9B5E2AFF9B5E2AFF9B5F2AFF9B5E2AFF9B5F2BFF9C5E2BFFD598
          4AFFDA9B42FFDA9B42FFDA9B42FF9C5E2BFF9C5F2BFF9C5E2BFF9C5F2BFF9C5F
          2BFFA16430FFDEA04FFFDA9B42FFDA9B42FFD69943FF8F552AFF93592BFFCD91
          43FFDA9B42FFDA9B42FFE0A253FFA46632FF9F612DFF9F612DFF9F612DFF9F61
          2DFFA0622DFFA0612DFF9F612DFFA0612EFFA0612EFFCD8F3FFFCD8F3FFFCD8F
          3FFFBD8345FFA0612EFFA0622EFFA0622EFFA0612EFFA0622EFFA1612EFFA161
          2FFFA0622EFFA1632FFFA1622FFFA1612FFFD49649FF634A29FF634A29FFD496
          49FF9C5F2BFF9C5F2BFF9D5F2BFF9C5F2BFF9D5F2CFF9C5F2BFF9D5F2CFF9D5F
          2CFF9D5F2CFF9D5F2CFF9D5F2BFFD5984AFFDA9B42FFDA9B42FFDA9B42FF9E60
          2CFF9E602CFF9E602DFF9E602DFF9E602CFFC3874CFFDA9B42FFDA9B42FFDA9B
          42FFB37C40FFA0622EFFA0622EFFA8713AFFDA9B42FFDA9B42FFDA9B42FFBF83
          48FFA0622EFFA0622EFFA0622EFFA0622EFFA0622EFFAB6D38FFEBB172FFEBB1
          72FFEBB172FFCD8F3FFFCD8F3FFFCD8F3FFFBD8345FFA1632FFFA2622EFFA263
          2EFFA1632FFFA2632EFFA2632EFFA2632FFFA2632FFFA3622FFFA36330FFA363
          30FFD49649FF634A29FF634A29FFD49649FF9E602CFF9E602BFF9E602CFF9F60
          2BFF9E602CFF9E602CFF9E602CFF9F612CFF9F612CFF9E602CFF9F612CFFD598
          4AFFDA9B42FFDA9B42FFDA9B42FF9F612CFF9F612DFFA0612CFFA0612DFFA061
          2DFFD79A52FFDA9B42FFDA9B42FFDA9B42FF986131FFA2632FFFA2632FFF8E58
          2DFFDA9B42FFDA9B42FFDA9B42FFD49751FFA2632FFFA2632FFFA2632FFFA263
          2FFFA26330FFB07138FFCD8F3FFFCD8F3FFFCD8F3FFFCD8F3FFFCD8F3FFFCD8F
          3FFFBD8346FFA36330FFA36430FFA36430FFA46430FFA46430FFA36430FFA464
          31FFA46430FFA46531FFA46430FFA46530FFD49649FF634A29FF634A29FFD496
          49FF9F612DFF9F612DFFA0622DFFA0622DFF9F612DFFA0622EFFA0622EFFEBB1
          72FFEBB172FFEBB172FFEBB172FFDEA04FFFDA9B42FFDA9B42FFDA9B42FFEBB1
          72FFEBB172FFEBB172FFEBB172FFB97C45FFDEA04FFFDA9B42FFDA9B42FFD89A
          44FF87502AFFA3642FFFA3642FFF93582CFFD39544FFDA9B42FFDA9B42FFE0A2
          53FFA86934FFA3642FFFA3642FFFA3642FFFA36530FFA96D38FFCD8F3FFFCD8F
          3FFFCD8F3FFFCD8F3FFFCD8F3FFFCD8F3FFFBD8346FFA46530FFA46531FFA465
          30FFA46531FFA46530FFA46531FFA46631FFA56531FFA56531FFA56531FFA566
          31FFD49649FF634A29FF634A29FFD49649FFA0622DFFA0622DFFA0622DFFA163
          2EFFA0622DFFA0632EFFA0622EFFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B
          42FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFCB8F
          4AFFDA9B42FFDA9B42FFDA9B42FFBE8540FFA46530FFA46530FFA46530FFA465
          30FFB1793EFFDA9B42FFDA9B42FFDA9B42FFC2854AFFA46530FFA46530FFA465
          30FFA56530FFA06330FFCD8F3FFFCD8F3FFFCD8F3FFFCD8F3FFFCD8F3FFFCD8F
          3FFFBE8446FFA56530FFA66631FFA56631FFA66631FFA66631FFA66631FFA666
          31FFA66631FFA66631FFA76732FFA76732FFD49649FF634A29FF634A29FFD496
          49FFA1642EFFA1642EFFA1642EFFA1642EFFA1632EFFA1642EFFA1642EFFDA9B
          42FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B
          42FFDA9B42FFDA9B42FFDA9B42FFE3A65CFFDA9B42FFDA9B42FFDA9B42FF9661
          33FFA66631FFA66631FFA66631FFA66631FF925D2FFFDA9B42FFDA9B42FFDA9B
          42FFD59852FFA66631FFA66631FFA66631FFA66732FF9B5F30FF4F2920FF4F29
          20FF9B6733FFCD8F3FFFCD8F3FFFCD8F3FFFBE8446FFA76732FFA76732FFA767
          32FFA76732FFA76732FFA76732FFA76732FFA76732FFA86732FFA76832FFA768
          32FFD49649FF634A29FF634A29FFD49649FFA3652FFFA26430FFA3652FFFA365
          2FFFA3642FFFA36530FFA3652FFFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B
          42FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B
          42FFDA9B42FFDA9B42FFDA9B42FF8F582EFFA76732FFA76732FFA76732FFA767
          32FF8F562DFFD19340FFDA9B42FFDA9B42FFBD813AFFA76732FFA76732FFA767
          32FFA76832FFA76732FFA76832FFA76732FF724227FFB47A39FFCD8F3FFFCD8F
          3FFFA36B34FFA86833FFA86832FFA86833FFA96833FFA96833FFA86833FFA968
          33FFA96934FFA96833FFA86833FFA96934FFD49649FF634A29FF634A29FFD496
          49FFA4662FFFA4662FFFA46630FFA46630FFA56630FFA56630FFA46630FF4F29
          20FF4F2920FF4F2920FF4F2920FF4F2920FF4F2920FF4F2920FF4F2920FF4F29
          20FF4F2920FF4F2920FF4F2920FF4F2920FF4F2920FF4F2920FF4F2920FFA365
          32FFA96932FFA96932FFA96932FFA96932FFA96932FF562D21FF4F2920FF4F29
          20FF6E3E26FFA96932FFA96932FFA96932FFA86933FFA96933FFA96933FFA969
          32FFA96933FF623524FF4F2920FF4F2920FF7F4B2AFFA96933FFA96934FFA969
          33FFA96933FFA96933FFAA6933FFAA6933FFAA6934FFAA6A34FFAA6934FFAB6A
          34FFD49649FF634A29FF634A29FFD49649FFA66731FFA56731FFA66831FFA667
          31FFA66731FFA66731FFA66731FFA56630FFA66731FFA66731FFA66731FFA667
          31FFA66731FFA66731FFA66731FFA66731FFA76731FFA76832FFA76731FFA768
          32FFA76731FFA76832FFA76832FFAA6A33FFAA6A33FFAA6A33FFAA6A33FFAA6A
          33FFAA6A33FFAA6A33FFAA6A33FFAA6A33FFAA6A33FFAA6A33FFAA6A33FFAA6A
          33FFAA6A33FFAA6A33FFAA6A34FFAA6A34FFAA6A34FFAA6A34FFAA6A34FFAA6A
          34FFAA6A34FFAB6B34FFAB6B34FFAB6B34FFAB6B34FFAB6B34FFAB6B34FFAB6B
          35FFAC6A34FFAC6B34FFAC6B35FFAC6B34FFD49649FF634A29FF634A29FFD496
          49FFA66831FFA76832FFA76731FFA76832FFA76832FFA76831FFA76831FFA768
          32FFA76832FFA76832FFA76832FFA86832FFA86832FFA76832FFA76832FFA768
          32FFA76832FFA86933FFA86932FFA86832FFA86832FFA86932FFA86932FFAB6B
          34FFAB6B34FFAB6B34FFAB6B34FFAB6B34FFAB6B34FFAB6B34FFAB6B34FFAB6B
          34FFAB6B34FFAB6B34FFAB6B34FFAB6B34FFAB6B34FFAB6B35FFAB6B35FFAC6B
          34FFAC6B35FFAB6B35FFAC6C35FFAC6C35FFAC6B35FFAC6C35FFAD6C35FFAD6C
          35FFAD6C35FFAD6C35FFAD6C35FFAD6C35FFAD6C35FFAD6D35FFAD6C35FFAD6D
          35FFD49649FF634A29FF634A29FFD49649FFA86832FFA86932FFA86832FFA869
          32FFA86832FFA86832FFA86832FFA96932FFA86932FFA86932FFA86932FFA869
          32FFA96933FFA96932FFA96933FFA86A33FFA96A33FFA96A33FFAA6A33FFAA6A
          33FFAA6A33FFAA6A33FFAA6A34FFAD6D35FFAD6D35FFAD6D35FFAD6D35FFAD6D
          35FFAD6D35FFAD6D35FFAD6D35FFAD6D35FFAD6D35FFAD6D35FFAD6D35FFAD6D
          35FFAD6C35FFAD6D35FFAD6C35FFAD6D35FFAD6D35FFAD6D35FFAD6D35FFAD6D
          36FFAD6D35FFAD6D35FFAD6D35FFAD6D36FFAD6D36FFAD6D36FFAD6D36FFAD6D
          36FFAD6D36FFAD6D36FFAE6D36FFAD6D36FFD49649FF634A29FF634A29FFD496
          49FFA96A33FFA96A33FFA96A33FFA96A33FFA96A33FFA96A33FFA96A33FFA96A
          33FFAA6A33FFAA6A33FFAA6B33FFAA6B33FFB7793FFFEBB172FFD69A5EFFAA6A
          33FFAB6B34FFAB6B33FFAB6B33FFAC6D34FFAB6B33FFAB6C33FFAC6D34FFAD6D
          35FFAD6D35FFAD6D35FFAD6D35FFAD6D35FFAD6D35FFAD6D35FFAD6D35FFAD6D
          35FFAD6D35FFAD6D35FFAD6D35FFAD6D35FFAD6D36FFAD6D35FFAD6D36FFAD6D
          35FFAD6D36FFAE6D36FFAD6D36FFAD6D36FFAD6D36FFAE6E36FFAE6D36FFAF6D
          37FFAF6E37FFAF6E37FFAE6E36FFAE6E37FFAF6E37FFAF6E37FFAF6E37FFB06E
          38FFD49649FF634A29FF634A29FFD49649FFAB6C34FFAB6B34FFAB6B34FFAB6B
          34FFAB6B34FFAB6B34FFAB6C34FFAC6C34FFAC6C34FFAC6C34FFAC6C34FFAC6C
          34FFAA6F3EFFEBB172FFC18A59FFAC6C34FFAD6D35FFAC6C34FFAC6C34FFAC6C
          34FFAD6D35FFAD6D35FFAC6C34FFAE6E37FFAE6E37FFAE6E37FFAE6E37FFAE6E
          37FFAE6E37FFAE6E37FFAE6E37FFAE6E37FFAE6E37FFAE6E37FFAE6E37FFAE6E
          37FFAF6E37FFAF6E37FFAE6E37FFAE6E37FFAF6F37FFAF6F37FFB06F38FFAF6F
          37FFB06F38FFB06F38FFB06F38FFB06F38FFB06F38FFB06F37FFB17038FFB16F
          38FFB16F38FFB17039FFB17038FFB16F39FFD49649FF634A29FF634A29FFD496
          49FFAC6C34FFAC6C35FFAC6C34FFAC6C34FFAC6C34FFAC6C34FFAD6D35FFDFA3
          66FFEBB172FFEBB172FFE7AC6FFFC6884EFFAB703EFFEBB172FFE3A96DFFEBB1
          72FFEBB172FFC6884EFFAD6D35FFC6884EFFE7AC6FFFEBB172FFEBB172FFCB8E
          53FFB06F38FFE7AC6FFFE7AC6FFFB06F38FFB06F38FFB4743BFFDFA366FFEBB1
          72FFEBB172FFBC7C44FFB06F38FFB06F38FFB07038FFB07038FFB17038FFB170
          39FFB17038FFB17039FFB17039FFB17039FFB17039FFB17039FFB17039FFB170
          39FFB17039FFB17139FFB27139FFB27139FFB17139FFB27039FFB27139FFB271
          39FFD49649FF634A29FF634A29FFD49649FFAD6D35FFAD6D35FFAD6D35FFAD6E
          35FFAD6D35FFAE6F36FFAE6E36FF623724FF4F2920FF5A3226FFE2A76DFFE5AA
          6DFFAC713EFFEBB172FFB98557FF4F2920FFCB9661FFEBB172FFB8793FFFEBB1
          72FFCD9662FF4F2920FFAC7B51FFEBB172FFC5864CFFE2A76DFFE2A76DFFB271
          39FFB27139FFC0834AFFEBB172FFAC7B51FF4F2920FF9E6233FFB27139FFB271
          39FFB17139FFB17139FFB27139FFB27139FFB27139FFB27139FFB27139FFB272
          39FFB27239FFB37239FFB37239FFB27239FFB37139FFB37239FFB37239FFB372
          39FFB47239FFB37139FFB37139FFB47239FFD49649FF634A29FF5D4627F0D496
          49FFB07137FFAE6F36FFAE6F36FFAF6F37FFAF7037FFAF7037FFAF7037FFAF6F
          37FFDB9F63FFEBB172FFE2A76DFF6A3E2DFFAC713FFFEBB172FFC18B59FFAF71
          37FFAB784EFFEBB172FFBC7F49FFEBB172FFAB784EFFB07137FFAD784CFFEBB1
          72FFBC8350FFE2A76DFFE2A76DFFB37339FFB37339FFAF7646FFEBB172FFB57F
          51FFB37339FFB37339FFB37339FFB37339FFB37339FFB37339FFB37239FFB373
          39FFB47339FFB37339FFB47239FFB37339FFB47339FFB47239FFB47339FFB473
          39FFB47339FFB4733AFFB47339FFB47339FFB5733AFFB5733AFFB4733AFFB675
          3AFFD49649FF614828F9543F23D8D19449FFB57739FFAF7137FFB07137FFB071
          38FFB07138FFB07137FFB07137FFDB9F63FFEBB172FF84563CFF562D22FFA367
          34FFAE7340FFEBB172FFC18B59FFB17238FFD59C64FFEBB172FFB57B4AFFEBB1
          72FFD59C64FFB17238FFC28956FFEBB172FFA77044FFE2A76DFFEBB172FFEBB1
          72FFE7AD6FFFB07746FFEBB172FFB98252FFB47339FFB47339FFB47339FFB473
          39FFB47339FFB47439FFB47339FFB47339FFB47339FFB47339FFB5743AFFB573
          3AFFB47339FFB5743AFFB47339FFB5743AFFB57339FFB47339FFB5743AFFB574
          3AFFB5743AFFB5743AFFB6743AFFBA7A3DFFCD9248FF564024DE40301BA5C38A
          45FFC0823FFFB17238FFB27238FFB27238FFB17238FFB17238FFB27338FF8353
          35FFCB9661FFEBB172FFEBB172FFE0A367FFAE7340FFEBB172FFD29A63FFE4A8
          6BFFEBB172FFAC7B51FF8A552FFF8E5F41FFE2A86DFFEBB172FFEBB172FF9868
          46FF935C32FFE2A76DFFE1A76DFFC18C5CFFE2A76DFFE5AB6EFFEBB172FFEBB1
          72FFEBB172FFC08146FFB5743AFFB5743AFFB5743AFFB5743AFFB5743AFFB574
          3AFFB5743AFFB6743AFFB5743AFFB5743AFFB6743AFFB6743AFFB6753AFFB675
          3AFFB6753BFFB6753BFFB6753AFFB6743AFFB7753BFFB7753BFFB6753BFFC485
          42FFC18944FF40301BA5231A0E5AA3753BFFCE9147FFB37439FFB37439FFB374
          39FFB47439FFB47439FFB47439FF9F6434FF633725FF4F2920FF4F2920FF6337
          25FFA06535FF4F2920FF633725FF5D3324FF4F2920FF78472BFFB47439FF8C56
          2FFF562E22FF4F2920FF4F2920FF87522FFFB6753BFF562E22FF562E22FF6B3D
          27FF562E22FF88593DFFEBB172FFA2714CFF4F2920FFA16636FFB6753BFFB675
          3BFFB6753AFFB6753BFFB7753BFFB6753BFFB7753BFFB7753BFFB7753BFFB776
          3BFFB7763BFFB7763BFFB7763BFFB7763BFFB7763BFFB7763BFFB7763BFFB776
          3BFFB8763BFFB8763BFFB8763BFFD09248FFA2743BFF231A0E5A020201066F50
          2BE9D29549FFC18340FFB47439FFB47439FFB47439FFB47539FFB47439FFB475
          39FFB47439FFB47439FFB47539FFB47539FFB47539FFB47539FFB57539FFB575
          39FFB57539FFB57539FFB57539FFB57539FFB47539FFB5753AFFB5753AFFB777
          3BFFB7773BFFB7773BFFB7773BFFB7773BFFB7773BFFB17947FFEBB172FFBA83
          52FFB7773BFFB7773BFFB7773BFFB7773BFFB8773BFFB8763BFFB8773BFFB877
          3CFFB8773CFFB8773BFFB8773CFFB8773BFFB9773CFFB8773CFFB9773CFFB977
          3CFFB9773CFFB9773CFFB9783CFFB9773CFFB9783CFFB9783CFFC58642FFD295
          49FF6A4E29E1020201060000000022190E57A3753BFFD39549FFBE7E3EFFB575
          3AFFB5763AFFB5763AFFB5763AFFB6763AFFB6763AFFB6763AFFB5763AFFB676
          3AFFB6763AFFB6763AFFB6763AFFB6763AFFB6763AFFB6763AFFB6763AFFB676
          3AFFB6763AFFB7763AFFB7763AFFB9783BFFB9783BFFB9783BFFB9783BFFB978
          3BFFB9783BFF955D33FF4F2920FF814E2DFFB9783BFFB9783BFFB9783BFFB978
          3BFFB9783CFFB9783BFFBA793CFFB9783CFFB9783CFFBA793DFFBA783CFFBA78
          3CFFBA783DFFBA783CFFBA793CFFBA793CFFBA783CFFBA793DFFBA793DFFBA79
          3DFFBA793DFFC28141FFD39549FFA2743BFF22190E5700000000000000000000
          00003A2B178DB48141FFD49649FFC78843FFB8793BFFB7773AFFB7773BFFB777
          3AFFB7773AFFB7773BFFB7773BFFB7773BFFB7773AFFB7773AFFB8773BFFB777
          3BFFB7773BFFB7783BFFB8783BFFB8783BFFB8783BFFB8783BFFB8783BFFBA79
          3CFFBA793CFFBA793CFFBA793CFFBA793CFFBA793CFFBA793CFFBA793CFFBA79
          3CFFBA793CFFBA793CFFBA793CFFBA793CFFBA793CFFBA793CFFBA793CFFBA79
          3CFFBA793CFFBA793CFFBA793CFFBA793CFFBA7A3CFFBA793DFFBA793DFFBB7A
          3DFFBB793DFFBA793DFFBB7A3DFFBC7B3EFFC88944FFD49649FFB48141FF3A2B
          178D00000000000000000000000000000000000000002C211272936A37FAD093
          49FFD09248FFC48642FFBE7E3FFFB9793BFFB8783BFFB9783BFFB8783BFFB878
          3BFFB9783BFFB9793BFFB9783BFFB9793BFFB9793CFFB9793BFFB9793CFFB979
          3BFFB9793CFFB9793CFFB9793CFFBA7A3DFFBA7A3DFFBA7A3DFFBA7A3DFFBA7A
          3DFFBA7A3DFFBA7A3DFFBA7A3DFFBA7A3DFFBA7A3DFFBA7A3DFFBA7A3DFFBA7A
          3DFFBB7A3DFFBB7A3DFFBB7A3DFFBB7A3DFFBB7A3DFFBB7A3EFFBB7A3EFFBB7A
          3DFFBB7A3EFFBB7A3DFFBB7A3DFFBB7A3EFFBC7A3EFFC18141FFC78743FFD092
          48FFD09349FF936A37FA2C211272000000000000000000000000000000000000
          000000000000000000000F0B0627624827D1A2743BFFBD8744FFD29549FFD496
          49FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD496
          49FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD496
          49FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD496
          49FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD496
          49FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD49649FFD496
          49FFD49649FFD29549FFBD8744FFA2743BFF624827D10F0B0627000000000000
          0000000000000000000000000000000000000000000000000000000000000101
          00031F180D5140301BA54F3B21CC624929FC634A29FF634A29FF634A29FF634A
          29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A
          29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A
          29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A
          29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A29FF634A
          29FF634A29FF634A29FF634A29FF634A29FF624929FC4F3B21CC40301BA51F18
          0D51010100030000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          B6250000424DB62500000000000036000000280000003C000000280000000100
          2000000000008025000000000000000000000000000000000000000000000000
          00000000000000000000000000000101010324221151494524A55A552CCC7069
          36FC716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A
          37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A
          37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A
          37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A
          37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A
          37FF706936FC5A552CCC494524A5242211510101010300000000000000000000
          0000000000000000000000000000000000000000000000000000111008275C56
          33D18B8349FFB2A650FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB
          53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB
          53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB
          53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB
          53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB
          53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFB2A650FF8B83
          49FF5C5633D11110082700000000000000000000000000000000000000000000
          000000000000332F19727D7645FAD3C453FFD9C952FFC7B548FFAF9A3CFF9982
          30FF99822FFF99812FFF99822FFF9A8330FF998230FF998230FF9A8230FF9A82
          30FF9A8330FF9A8230FF9A8230FF9A8230FF9A8230FF9A8230FF9B8331FF9C83
          32FF9C8332FF9C8332FF9C8332FF9C8332FF9C8332FF9C8332FF9C8332FF9C83
          32FF9C8332FF9C8332FF9C8332FF9C8332FF9D8432FF9C8431FF9C8432FF9C84
          32FF9D8432FF9C8432FF9C8432FF9C8432FF9D8432FF9D8432FF9D8432FF9D84
          32FF9D8432FFB39D3DFFC8B649FFD9C952FFD3C453FF7D7645FA332F19720000
          0000000000000000000000000000000000003D3A208DA2984EFFDBCB53FFCEBD
          4DFF9E8832FF9A8131FF99822FFF99822FFF9A8330FF9A8330FF9A8230FF9A83
          31FF9A832FFF9A8330FF9B8331FF9A8331FF9B8331FF9A8230FF9A8230FF9B84
          31FF9B8331FF9B8431FF9B8331FF9D8432FF9D8432FF9D8432FF9D8432FF9D84
          32FF9D8432FF9D8432FF9D8432FF9D8432FF9D8432FF9D8432FF9D8432FF9D84
          32FF9D8432FF9D8432FF9D8432FF9D8432FF9D8432FF9D8432FF9D8432FF9D84
          32FF9D8432FF9D8433FF9D8432FF9D8432FF9E8532FF9E8533FF9E8533FFA38B
          35FFCFBE4DFFDBCB53FFA2984EFF3D3A208D0000000000000000000000002724
          13578E864BFFDBCB53FFBBA741FF9B8431FF9B8331FF9B8331FF9B8331FF9B83
          31FF9B8431FF9B8331FF9B8331FF9B8331FF9B8331FF9B8331FF9B8331FF9C84
          32FF9B8331FF9B8331FF9C8432FF9B8331FF9C8431FF9C8432FF9C8431FF9D84
          32FF9D8432FF9D8432FF9D8432FF9D8432FF9D8432FF9D8432FF9D8432FF9D84
          32FF9D8432FF9D8432FF9D8432FF9D8432FF9E8532FF9D8533FF9E8632FF9E85
          33FF9E8533FF9E8532FF9F8633FF9E8532FF9E8533FF9D8533FF9D8533FF9F86
          33FF9E8533FF9E8533FF9F8633FF9E8533FF9F8634FFBCA843FFDBCB53FF8C84
          49FF272413570000000003020106666239E9D8C853FFC6B447FF9B8431FF9B84
          31FF9C8331FF9C8331FF9B8331FF9B8331FF9C8432FF9C8432FF9C8431FF9C84
          31FF9C8432FF9C8331FF9C8432FF9C8432FF9C8431FF9C8432FF9C8432FF9C84
          32FF9C8432FF9D8431FF9D8432FF9E8533FF9E8533FF9E8533FF9E8533FF9E85
          33FF9E8533FF9E8533FF9E8533FF9E8533FF9E8533FF9E8533FF9E8533FF9E85
          33FF9E8532FF9E8533FF9F8532FF9F8633FF9F8633FF9E8533FF9F8633FF9F86
          33FF9F8633FF9F8633FF9F8733FF9F8634FFA08734FFA08733FFA08734FFA087
          34FF9F8634FFA08734FFC8B649FFD8C853FF635E37E1030201062825135ABBAE
          56FFD9C952FF9D8632FF9C8531FF9D8532FF9D8432FF9D8531FF9C8531FF9D85
          32FF9D8532FF9D8532FF9D8532FFDAC665FFF0DE79FFF0DE79FFF0DE79FF9D85
          32FF9D8532FF9D8532FF9D8532FF9D8532FF9D8532FF9D8632FF9D8532FFA48D
          38FFF0DE79FFF0DE79FFF0DE79FFF0DE79FFA48D38FF9F8733FF9F8733FF9F87
          33FF9F8733FF9F8733FF9F8733FF9F8733FFA08733FFC6B154FFF0DE79FFF0DE
          79FFF0DE79FFF0DE79FFF0DE79FFF0DE79FFF0DE79FFF0DE79FFF0DE79FFF0DE
          79FFAC943EFFA18734FFA18834FFA18834FFA18834FFA18834FFA38A35FFD9C9
          52FFBBAE56FF2825135A494524A5CBBE54FFC7B348FF9D8632FF9D8532FF9D85
          32FF9D8632FF9D8632FF9D8632FF9D8632FF9D8632FF9D8632FF9D8632FFE0D2
          53FFE1D44CFFE1D44CFFE1D44CFF9E8533FF9E8732FF9E8632FF9E8732FF9E87
          32FF9E8632FF9E8533FF9E8733FFC7B253FFE1D44CFFE1D44CFFE1D44CFFE1D4
          4CFFC2AD4FFFA18834FFA18834FFA18834FFA18834FFA18834FFA18834FFA188
          34FFA18835FFCDBA4FFFD6C749FFD6C749FFD6C749FFD6C749FFD6C749FFD6C7
          49FFD6C749FFD6C749FFD6C749FFD6C749FFB19A40FFA28835FFA28835FFA288
          35FFA28835FFA28936FFA28936FFC9B649FFC9BB54FF494524A5605A2FD8D8C9
          54FFAE993AFF9D8432FF9D8632FF9D8432FF9E8732FF9F8732FF9E8632FF9E87
          33FF9E8732FF9F8732FF9F8732FFDCCD54FFE1D44CFFE1D44CFFE1D44CFF9F87
          33FF9F8733FFA08733FF9F8733FF9E8733FFA08733FFA08733FF9F8733FFDECD
          5BFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFDAC85AFFA28835FFA28835FFA288
          35FFA28835FFA28835FFA28835FFA28835FFA28835FFC4B24EFFD6C749FFD6C7
          49FFD6C749FFD6C749FFD6C749FFD6C749FFD6C749FFD6C749FFD6C749FFD6C7
          49FFAB953FFFA38936FFA38936FFA38936FFA38936FFA38A36FFA38A36FFB59E
          3FFFD5C555FF625C30DE6A6434F0DBCB53FFA28934FF9F8732FF9E8732FF9F87
          32FF9E8732FF9F8732FF9E8732FF9F8733FFA08833FFA08733FF9F8732FFDCCD
          54FFE1D44CFFE1D44CFFE1D44CFFA08733FFA08832FFA08833FFA08833FFA088
          33FFA08834FFA18833FFA68E38FFE5D658FFE1D44CFFE1D44CFFE1D44CFFE1D4
          4CFFE6D75CFFA8903AFFA38935FFA38935FFA38935FFA38935FFA38935FFA389
          35FFA38935FFAA953DFFD6C749FFD6C749FFD6C749FFD6C749FFD6C749FFD6C7
          49FFD6C749FFD6C749FFD6C749FFD6C749FFA28A38FFA48A36FFA48B36FFA48B
          37FFA48B36FFA58C37FFA58C37FFAA923AFFDBCB53FF6E6836F9716A37FFDBCB
          53FFA08834FFA08833FFA08833FFA08933FFA08833FFA18834FFA18934FFA089
          34FFA18834FFA18933FFA08933FFDCCD54FFE1D44CFFE1D44CFFE1D44CFFA189
          34FFA28934FFA28934FFA28934FFA28934FFA18935FFA28935FFC8B353FFE1D4
          4CFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFC5AF50FFA48B36FFA48B
          36FFA48B36FFA48B36FFA48B36FFA48B36FFA38B35FF846C33FF95823CFFD6C7
          49FFD6C749FFD6C749FFE2D160FFC9B565FF685135FF5E4730FF5E4730FF5E47
          30FF9D8337FFA58B37FFA68E38FFA68D38FFA68D38FFA68E38FFA68D38FFA68E
          38FFDBCB53FF716A37FF716A37FFDBCB53FFA18934FFA28934FFA18934FFA289
          34FFA28934FFA28934FFA18934FFA28934FFA28934FFA38B35FFA28934FFDCCD
          54FFE1D44CFFE1D44CFFE1D44CFFA38B35FFA38935FFA38935FFA38B35FFA38B
          35FFA38B35FFA38935FFDECD5BFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFE1D4
          4CFFE1D44CFFDAC95AFFA58D37FFA58D37FFA58D37FFA58D37FFA58D37FFA58D
          37FFA58C37FFA58C37FF846C34FF7E6937FFCFBF48FFD6C749FFD6C749FFDCCC
          55FFE1CD6AFFAB923CFFA68D38FFA68C38FFA68D38FFA68E38FFA78E39FFA78E
          39FFA78E39FFA78E39FFA78E39FFA78E39FFDBCB53FF716A37FF716A37FFDBCB
          53FFA38A35FFA38B35FFA38B35FFA38B35FFA38B35FFA38B35FFA38935FFA38B
          35FFA38B35FFA38935FFA38935FFDDCE54FFE1D44CFFE1D44CFFE1D44CFFA389
          35FFA48C36FFA38A35FFA38B35FFA48C36FFA38B35FFA9903AFFE5D658FFE1D4
          4CFFE1D44CFFD7C94FFFD1C24EFFE1D44CFFE1D44CFFE6D75CFFAB923CFFA68E
          38FFA68E38FFA68E38FFA68E38FFA68E38FFA68E38FFA68D38FFA78E38FF937A
          36FF7A6635FFC8B848FFD6C749FFD6C749FFDBCB53FFE1CD6AFFA88E39FFA88F
          39FFA88F39FFA88E39FFA88E39FFA88F39FFA88E39FFA99039FFA88F39FFA98F
          39FFDBCB53FF716A37FF716A37FFDBCB53FFA38B35FFA38B35FFA38A36FFA38C
          35FFA38B36FFA38A36FFA38B35FFA38B36FFA38C35FFA38B36FFA48C36FFDDCE
          54FFE1D44CFFE1D44CFFE1D44CFFA48C36FFA48C36FFA58D37FFA58C37FFA48D
          36FFA48C36FFC9B455FFE1D44CFFE1D44CFFE1D44CFFB7A646FFAF9D43FFE1D4
          4CFFE1D44CFFE1D44CFFC7B052FFA88F39FFA88F39FFA88F39FFA88F39FFA88F
          39FFA88F39FFA88F39FFA99039FFA88F39FF998137FF766133FFCFBF48FFD6C7
          49FFD6C749FFDBCB53FFCEB95BFFA99039FFA99039FFAA9039FFA99039FFAA90
          39FFAA9039FFAA9039FFAA9039FFAA9039FFDBCB53FF716A37FF716A37FFDBCB
          53FFA58D36FFA48C36FFA58D36FFA48C36FFA58D36FFA58C36FFA48D36FFA58D
          37FFA58D37FFA48D36FFA58D37FFDDCE54FFE1D44CFFE1D44CFFE1D44CFFA58D
          37FFA58E37FFA68E38FFA68E38FFA68E38FFA68E38FFDFCE5BFFE1D44CFFE1D4
          4CFFE1D44CFF947F39FF927C37FFE1D44CFFE1D44CFFE1D44CFFDBCA5BFFAA90
          39FFAA9039FFAA9039FFAA9039FFAA9039FFA99039FFAA9039FFAA9039FFAA90
          39FFAA913AFF9F8738FF7A6635FFD6C749FFD6C749FFD6C749FFE2D160FFAF96
          3FFFAA913AFFAA913AFFAA913AFFAA913AFFAA913AFFAB913AFFAA913AFFAA91
          3AFFDBCB53FF716A37FF716A37FFDBCB53FFA58E37FFA68E38FFA68E38FFA68E
          38FFA68E38FFA68E38FFA68E38FFA68F38FFA68E38FFA68F38FFA78F39FFDDCE
          54FFE1D44CFFE1D44CFFE1D44CFFA78F39FFA78F38FFA78F39FFA78F38FFA78F
          39FFAC943DFFE5D658FFE1D44CFFE1D44CFFDED04DFF9A8237FF9F8838FFD5C7
          4DFFE1D44CFFE1D44CFFE6D75CFFAF963EFFAA9139FFAA9139FFAA9139FFAA91
          39FFAA9239FFAA9139FFAA9139FFAA913AFFAA913AFFAA913AFF9B8237FFA592
          44FFD6C749FFD6C749FFD6C749FFCCB757FFAB913AFFAB923AFFAC923AFFAC92
          3BFFAB923AFFAC933BFFAC923BFFAC923BFFDBCB53FF716A37FF716A37FFDBCB
          53FFA78F39FFA78F38FFA88F38FFA78F39FFA88F39FFA78F39FFA88F39FFA88F
          39FFA88F39FFA88F39FFA89038FFDDCE54FFE1D44CFFE1D44CFFE1D44CFFA990
          39FFA99039FFA99039FFA99039FFA99039FFCBB656FFE1D44CFFE1D44CFFE1D4
          4CFFBDAD4BFFAB923AFFAB923AFFB1A045FFE1D44CFFE1D44CFFE1D44CFFC8B3
          53FFAB923AFFAB923AFFAB923AFFAB923AFFAB933AFFAB913AFFAC923AFFAC93
          3AFFAC923AFFAC933AFFAC933AFFA89344FFD6C749FFD6C749FFD6C749FFCEBC
          51FFAC933BFFAD943AFFAD943AFFAD943BFFAD943BFFAE933BFFAE943CFFAE94
          3CFFDBCB53FF716A37FF716A37FFDBCB53FFA99139FFA99038FFA99139FFAA91
          38FFA99039FFA99139FFA99039FFAA9139FFAA9139FFA99139FFAA9139FFDDCE
          54FFE1D44CFFE1D44CFFE1D44CFFAA9139FFAA9139FFAA9239FFAA9139FFAA91
          39FFDFCE5BFFE1D44CFFE1D44CFFE1D44CFFA38E3DFFAD943BFFAD943BFF9A85
          3AFFE1D44CFFE1D44CFFE1D44CFFDBCA5BFFAD943BFFAD943BFFAD943BFFAD94
          3BFFAD933CFFB69D44FFE2CE6CFFCCB658FFAD933CFFAE943BFFB69D43FFDAC6
          62FFD6C749FFD6C749FFD6C749FFC6B350FFAF953CFFAF953CFFAE953CFFAF95
          3DFFAF953CFFAF963DFFAF953CFFAF963CFFDBCB53FF716A37FF716A37FFDBCB
          53FFAA9239FFAA9239FFAA9239FFAA9239FFAA9239FFAA923AFFAA923AFFF0DE
          79FFF0DE79FFF0DE79FFF0DE79FFE5D658FFE1D44CFFE1D44CFFE1D44CFFF0DE
          79FFF0DE79FFF0DE79FFF0DE79FFC2AC4FFFE5D658FFE1D44CFFE1D44CFFDFD1
          4EFF937A37FFAE953BFFAE953BFF9E8538FFDBCD4EFFE1D44CFFE1D44CFFE6D7
          5CFFB29A40FFAE953BFFAE953BFFAE953BFFAE953CFFBBA344FFDBCB53FFE4D3
          63FFF0DE79FFF0DE79FFEDDB73FFDCCC55FFD6C749FFD6C749FFD6C749FFB4A1
          45FFAF963DFFAF963CFFAF963DFFAF963DFFB0963DFFB0963DFFB0963DFFB096
          3DFFDBCB53FF716A37FF716A37FFDBCB53FFAA9339FFAB9339FFAA9339FFAC93
          3AFFAA9339FFAB943AFFAA933AFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFE1D4
          4CFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFD3C1
          54FFE1D44CFFE1D44CFFE1D44CFFC7B74BFFAF963CFFAF963CFFAF963CFFAF96
          3CFFBBA949FFE1D44CFFE1D44CFFE1D44CFFCAB553FFAF963CFFAF963CFFAF96
          3CFFAF953CFFB49C44FFD6C749FFD6C749FFD6C749FFD6C749FFD6C749FFD6C7
          49FFD6C749FFD6C749FFD6C749FF937E39FFB0973DFFB0973DFFB0973DFFB097
          3DFFB0973DFFB0973DFFB1973EFFB1973EFFDBCB53FF716A37FF716A37FFDBCB
          53FFAC963AFFAC963AFFAC963AFFAC963AFFAC943AFFAC963AFFAC963AFFE1D4
          4CFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFE1D4
          4CFFE1D44CFFE1D44CFFE1D44CFFE9D964FFE1D44CFFE1D44CFFE1D44CFFA18D
          3FFFB0973DFFB0973DFFB0973DFFB0973DFF9D893CFFE1D44CFFE1D44CFFE1D4
          4CFFDDCB5BFFB0973DFFB0973DFFB0973DFFB0973EFFAC953EFFD6C749FFD6C7
          49FFD6C749FFD6C749FFD6C749FFD6C749FFD6C749FFD6C749FF95823CFFA68E
          3CFFB1983EFFB1983EFFB1983EFFB1983EFFB1983EFFB2993EFFB1983EFFB198
          3EFFDBCB53FF716A37FF716A37FFDBCB53FFAE963BFFAD953CFFAE963BFFAE96
          3BFFAE963BFFAE953CFFAE963BFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFE1D4
          4CFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFE1D44CFFE1D4
          4CFFE1D44CFFE1D44CFFE1D44CFF9A843BFFB1983EFFB1983EFFB1983EFFB198
          3EFF9B823AFFD8CB4AFFE1D44CFFE1D44CFFC7B646FFB1983EFFB1983EFFB198
          3EFFB1983EFFA68E3CFF95823CFF95823CFFD6C749FFD6C749FFD6C749FFD6C7
          49FFAE9C40FF867239FF8B7337FFB2993FFFB39A3FFFB39A3FFFB2993FFFB39A
          3FFFB39A40FFB39A3FFFB2993FFFB39A40FFDBCB53FF716A37FF716A37FFDBCB
          53FFAE963BFFAE963BFFAF973CFFAF973CFFAF963CFFAF963CFFAF973CFF5E47
          30FF5E4730FF5E4730FF5E4730FF5E4730FF5E4730FF5E4730FF5E4730FF5E47
          30FF5E4730FF5E4730FF5E4730FF5E4730FF5E4730FF5E4730FF5E4730FFAE95
          3EFFB39A3EFFB39A3EFFB39A3EFFB39A3EFFB39A3EFF644D31FF5E4730FF5E47
          30FF7B6334FFB39A3EFFB39A3EFFB39A3EFFB2993FFFB39B3FFF8C7338FF8C73
          38FF5E4730FF5E4730FF5E4730FF5E4730FF7B6335FF977E3AFFB39A40FFB39B
          3FFFB39B3FFFB39B3FFFB49A3FFFB49A3FFFB49B40FFB49C40FFB49B40FFB59B
          40FFDBCB53FF716A37FF716A37FFDBCB53FFB0983DFFB0983DFFB0993DFFB098
          3DFFB0983DFFB0983DFFB0983DFFAF973CFFB0983DFFB0973DFFB0983DFFB098
          3DFFB0973DFFB0973DFFB0983DFFB0983DFFB1993DFFB1983EFFB1993DFFB199
          3EFFB1993DFFB1983EFFB1983EFFB49B3FFFB49B3FFFB49B3FFFB49B3FFFB49B
          3FFFB49B3FFFB49B3FFFB49B3FFFB49B3FFFB49B3FFFB49B3FFFB49B3FFFB49B
          3FFFB49B3FFFB49B3FFFB49C40FFB49C40FFB49C40FFB49C40FFB49C40FFB49C
          40FFB49C40FFB59B40FFB59B40FFB59B40FFB59B40FFB59B40FFB59B40FFB59B
          40FFB59B40FFB59C40FFB59B40FFB59C40FFDBCB53FF716A37FF716A37FFDBCB
          53FFB09A3DFFB1993EFFB1993DFFB1983EFFB1993EFFB19A3DFFB19A3DFFB199
          3EFFB1993EFFB1993EFFB1983EFFB29A3EFFB29A3EFFB1993EFFB1993EFFB199
          3EFFB1993EFFB2993FFFB29B3EFFB29A3EFFB29A3EFFB29B3EFFB29B3EFFB59B
          40FFB59B40FFB59B40FFB59B40FFB59B40FFB59B40FFB59B40FFB59B40FFB59B
          40FFB59B40FFB59B40FFB59B40FFB59B40FFB59B40FFB59B40FFB59B40FFB59C
          40FFB59B40FFB59B40FFB59C40FFB59C40FFB59B40FFB59C40FFB69D40FFB69D
          40FFB69D40FFB69D40FFB69D40FFB69D40FFB79D40FFB69D40FFB69D40FFB79E
          40FFDBCB53FF716A37FF716A37FFDBCB53FFB29A3EFFB29B3EFFB29A3EFFB29B
          3EFFB29A3EFFB29A3EFFB29A3EFFB39B3EFFB29B3EFFB29B3EFFB29B3EFFB29B
          3EFFB39B3FFFB39B3EFFB39B3FFFB29B3FFFB39B3FFFB39B3FFFB49B3FFFB49B
          3FFFB49B3FFFB49B3FFFB49C40FFB69E40FFB69E40FFB69E40FFB69E40FFB69E
          40FFB69E40FFB69E40FFB69E40FFB69E40FFB69E40FFB69E40FFB69E40FFB69E
          40FFB69D40FFB69D40FFB69D40FFB79E40FFB69D40FFB79E40FFB79E40FFB79E
          41FFB79E40FFB79E40FFB79E40FFB79E41FFB79E41FFB79E41FFB79E41FFB79E
          41FFB79E41FFB79E41FFB89F41FFB79E41FFDBCB53FF716A37FF716A37FFDBCB
          53FFB39B3FFFB39B3FFFB39B3FFFB39B3FFFB39B3FFFB39B3FFFB39B3FFFB39B
          3FFFB49B3FFFB49B3FFFB49C3FFFB49C3FFFC0A94AFFF0DE79FFDCC865FFB49B
          3FFFB59C40FFB59D3FFFB59D3FFFB59E3FFFB59D3FFFB59D3FFFB59E3FFFB79E
          40FFB79E40FFB79E40FFB79E40FFB79E40FFB79E40FFB79E40FFB79E40FFB79E
          40FFB79E40FFB79E40FFB79E40FFB79E40FFB79E41FFB79F40FFB79E41FFB79F
          40FFB79E41FFB89F41FFB79E41FFB7A041FFB79E41FFB8A041FFB89F41FFB99F
          42FFB9A042FFB9A042FFB8A041FFB89F42FFB9A042FFB9A042FFB9A042FFBAA0
          43FFDBCB53FF716A37FF716A37FFDBCB53FFB59D40FFB59C40FFB59C40FFB59C
          40FFB59C40FFB59C40FFB59D40FFB59E40FFB59E40FFB59C40FFB59E40FFB59E
          40FFB39C49FFF0DE79FFCAB563FFB59E40FFB69F40FFB59E40FFB59E40FFB59E
          40FFB69F40FFB69F40FFB59E40FFB89F42FFB89F42FFB89F42FFB89F42FFB89F
          42FFB89F42FFB89F42FFB89F42FFB89F42FFB89F42FFB89F42FFB89F42FFB89F
          42FFB9A042FFB9A042FFB8A142FFB89F42FFB9A142FFB9A142FFBAA143FFB9A1
          42FFBAA143FFBAA143FFBAA143FFBAA143FFBAA143FFBAA142FFBBA243FFBBA2
          43FFBBA243FFBBA144FFBBA243FFBBA144FFDBCB53FF716A37FF716A37FFDBCB
          53FFB59E40FFB59E40FFB59E40FFB59E40FFB59E40FFB59E40FFB69F40FFE5D1
          6EFFF0DE79FFF0DE79FFEDD976FFCEB957FFB49D49FFF0DE79FFE8D674FFF0DE
          79FFF0DE79FFCEB957FFB7A040FFCEB957FFEDD976FFF0DE79FFF0DE79FFD3BE
          5CFFBAA143FFEDD976FFEDD976FFBAA143FFBAA143FFBDA546FFE5D26EFFF0DE
          79FFF0DE79FFC5AD4EFFBAA143FFBAA143FFBAA143FFBAA143FFBBA243FFBBA1
          44FFBBA243FFBBA144FFBBA144FFBBA144FFBBA144FFBBA144FFBBA144FFBBA1
          44FFBBA144FFBBA244FFBCA344FFBCA344FFBBA244FFBCA344FFBCA344FFBCA3
          44FFDBCB53FF716A37FF716A37FFDBCB53FFB7A040FFB7A040FFB7A040FFB7A1
          40FFB7A040FFB8A141FFB8A041FF715A33FF5E4730FF685135FFE7D374FFEAD8
          74FFB59F49FFF0DE79FFC2AD61FF5E4730FFD3C06BFFF0DE79FFC1A94AFFF0DE
          79FFD5C26BFF5E4730FFB5A15CFFF0DE79FFCDB656FFE7D374FFE7D374FFBCA3
          44FFBCA344FFC8B354FFF0DE79FFB5A15CFF5E4730FFA9913FFFBCA344FFBCA3
          44FFBBA244FFBBA244FFBCA344FFBCA344FFBCA344FFBCA344FFBCA344FFBCA4
          44FFBCA444FFBCA345FFBCA444FFBCA345FFBCA345FFBCA345FFBCA345FFBCA3
          45FFBDA445FFBCA345FFBCA345FFBDA445FFDBCB53FF716A37FF6A6434F0DBCB
          53FFBAA242FFB8A141FFB8A141FFB9A142FFB9A142FFB9A142FFB9A142FFB9A1
          42FFE1CD6AFFF0DE79FFE7D374FF77603BFFB59E4AFFF0DE79FFCAB563FFB9A2
          42FFB4A058FFF0DE79FFC4AD53FFF0DE79FFB4A058FFBAA242FFB6A257FFF0DE
          79FFC3AE59FFE7D374FFE7D374FFBCA545FFBCA545FFB8A252FFF0DE79FFBEA9
          5BFFBCA545FFBCA545FFBCA545FFBCA545FFBCA544FFBCA545FFBCA444FFBCA5
          44FFBDA544FFBCA545FFBDA445FFBCA545FFBDA545FFBDA445FFBDA545FFBDA5
          45FFBEA545FFBDA446FFBEA545FFBEA545FFBEA546FFBEA546FFBDA446FFC0A8
          46FFDBCB53FF6E6836F9605A2FD8D9C952FFBFA945FFB9A242FFBAA242FFBAA2
          43FFBAA243FFBAA342FFBAA242FFE1CD6AFFF0DE79FF8F7A48FF654D32FFAE96
          40FFB6A14BFFF0DE79FFCAB563FFBBA343FFDCC86CFFF0DE79FFBEA955FFF0DE
          79FFDCC86CFFBBA343FFC9B45FFFF0DE79FFB19B50FFE7D374FFF0DE79FFF0DE
          79FFEDDA76FFBAA452FFF0DE79FFC1AC5BFFBEA645FFBEA645FFBEA645FFBEA6
          45FFBEA545FFBDA645FFBEA645FFBEA645FFBEA645FFBEA645FFBEA646FFBEA5
          46FFBEA645FFBEA646FFBEA645FFBEA646FFBFA645FFBEA645FFBFA646FFBFA6
          46FFBFA646FFBFA646FFC0A746FFC3AC48FFD5C652FF625C30DE494524A5CBBC
          4FFFC8B449FFBBA343FFBCA443FFBCA443FFBBA443FFBBA443FFBCA543FF8F7A
          42FFD3C06BFFF0DE79FFF0DE79FFE6D26FFFB7A14BFFF0DE79FFD9C66BFFE9D6
          72FFF0DE79FFB5A15CFF967F3CFF99844DFFE8D574FFF0DE79FFF0DE79FFA28D
          52FF9F873EFFE7D374FFE7D474FFC9B565FFE7D374FFEAD875FFF0DE79FFF0DE
          79FFF0DE79FFC8B150FFBFA746FFBFA746FFBFA746FFBFA746FFBFA746FFBFA7
          46FFBFA746FFC0A746FFBFA746FFBFA746FFC0A746FFC0A746FFC0A846FFC0A8
          46FFC0A747FFC0A747FFC0A846FFC0A746FFC1A747FFC1A747FFC0A747FFCDB8
          4DFFC9BB4EFF494524A52825135AADA147FFD5C450FFBCA544FFBCA544FFBCA5
          44FFBDA644FFBDA644FFBDA644FFA9923FFF715B34FF5E4730FF5E4730FF715B
          34FFAA9340FF5E4730FF715B34FF6B5332FF5E4730FF846E38FFBEA745FF9880
          3CFF654E32FF5E4730FF5E4730FF937B3DFFC0A747FF654E32FF654E32FF7861
          35FF654E32FF937E49FFF0DE79FFAC9857FF5E4730FFAC9542FFC0A747FFC0A7
          47FFC0A846FFC0A747FFC1A747FFC0A747FFC1A747FFC1A747FFC1A747FFC1A9
          47FFC1A947FFC1A947FFC1A947FFC1A947FFC1A947FFC1A947FFC1A947FFC1A9
          47FFC2A947FFC2A947FFC2A947FFD7C651FFABA046FF2825135A030201067A72
          37E9D9C953FFCAB64AFFBEA745FFBEA745FFBEA745FFBEA745FFBEA745FFBEA7
          45FFBEA745FFBEA745FFBEA745FFBEA745FFBEA745FFBEA745FFBFA745FFBFA7
          45FFBFA745FFBFA745FFBFA745FFBFA745FFBEA745FFBFA746FFBEA746FFC1A9
          47FFC1A947FFC1A947FFC1A947FFC1A947FFC1A947FFBBA652FFF0DE79FFC2AD
          5CFFC1A947FFC1A947FFC1A947FFC1A947FFC2AA47FFC2A947FFC2AA47FFC2AA
          47FFC2AA47FFC2AA47FFC2AA47FFC2AA47FFC2AA47FFC2AA47FFC2AA47FFC2AA
          47FFC2AA47FFC2AA47FFC2AB47FFC2AA47FFC2AB47FFC2AB47FFCDB94DFFD9C9
          53FF746D35E1030201060000000027241357ADA147FFDAC953FFC7B248FFBFA7
          46FFBFA846FFBFA846FFBFA846FFC0A846FFC0A846FFC0A846FFBFA846FFC0A8
          46FFC0A846FFC0A846FFC0A846FFC0A846FFC0A846FFC0A846FFC0A846FFC0A8
          46FFC0A846FFC1A946FFC1A946FFC2AB47FFC2AB47FFC2AB47FFC2AB47FFC2AB
          47FFC2AB47FFA0893FFF5E4730FF8D763AFFC2AB47FFC2AB47FFC2AB47FFC2AB
          47FFC2AB47FFC2AB47FFC2AA47FFC2AB47FFC2AB47FFC3AC48FFC2AA47FFC2AA
          47FFC3AB48FFC2AA47FFC2AB47FFC2AB47FFC2AA47FFC3AC48FFC3AC48FFC3AC
          48FFC3AC48FFCAB44BFFDAC953FFABA046FF2724135700000000000000000000
          0000413D208DBDB04CFFDBCB53FFCFBC4EFFC2AB47FFC1AA46FFC1A947FFC1AA
          46FFC1AA46FFC1A947FFC1A947FFC1A947FFC1AA46FFC1AA46FFC2AA47FFC1A9
          47FFC1A947FFC1AB47FFC2AB47FFC2AB47FFC2AB47FFC2AB47FFC2AB47FFC2AB
          47FFC2AB47FFC2AB47FFC2AB47FFC2AB47FFC2AB47FFC2AB47FFC2AB47FFC2AB
          47FFC2AB47FFC2AB47FFC2AB47FFC2AB47FFC2AB47FFC2AB47FFC3AB47FFC2AB
          47FFC2AB47FFC3AB47FFC2AB47FFC3AB47FFC3AD47FFC3AB48FFC3AB48FFC4AC
          48FFC4AB48FFC3AB48FFC4AC48FFC5AD48FFD1BE4EFFDBCB53FFBDB04CFF413D
          208D0000000000000000000000000000000000000000332F19729E9343FAD7C7
          52FFD7C651FFCDB84DFFC7B149FFC2AB47FFC2AB47FFC2AB47FFC2AB47FFC2AB
          47FFC2AB47FFC2AB47FFC2AB47FFC2AB47FFC2AB47FFC2AB47FFC2AB47FFC2AB
          47FFC2AB47FFC2AB47FFC2AB47FFC3AC48FFC3AC48FFC3AC48FFC3AC48FFC3AC
          48FFC3AC48FFC3AC48FFC3AC48FFC3AC48FFC3AC48FFC3AC48FFC3AC48FFC3AC
          48FFC4AC48FFC4AC48FFC4AC48FFC4AC48FFC4AC48FFC4AD49FFC4AC49FFC4AC
          48FFC4AD49FFC4AD48FFC4AD48FFC4AC49FFC5AD49FFC9B34BFFCFBB4EFFD8C7
          51FFD7C752FF9E9343FA332F1972000000000000000000000000000000000000
          00000000000000000000111008276C6631D1ABA046FFC6B84EFFD9C953FFDBCB
          53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB
          53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB
          53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB
          53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB
          53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB53FFDBCB
          53FFDBCB53FFD9C953FFC6B84EFFABA046FF6C6631D111100827000000000000
          0000000000000000000000000000000000000000000000000000000000000101
          010324221151494524A55A552CCC706936FC716A37FF716A37FF716A37FF716A
          37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A
          37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A
          37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A
          37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A37FF716A
          37FF716A37FF716A37FF716A37FF716A37FF706936FC5A552CCC494524A52422
          1151010101030000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          B6250000424DB62500000000000036000000280000003C000000280000000100
          2000000000008025000000000000000000000000000000000000000000000000
          00000000000000000000000000000101010314252051294B41A5325D51CC3E73
          64FC3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F74
          65FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F74
          65FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F74
          65FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F74
          65FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F74
          65FF3E7364FC325D51CC294B41A5142520510101010300000000000000000000
          00000000000000000000000000000000000000000000000000000A120F27395F
          54D1528E7BFF58B397FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDA
          B4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDA
          B4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDA
          B4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDA
          B4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDA
          B4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF58B397FF528E
          7BFF395F54D10A120F2700000000000000000000000000000000000000000000
          0000000000001C342D724C8071FA5CD2AFFF5CD8B2FF52C6A0FF46B089FF3A9B
          74FF399A73FF399A72FF399A73FF3A9B74FF3A9B74FF3A9B74FF3A9B74FF3A9B
          73FF3A9B74FF3A9B73FF3A9B74FF3A9B74FF3A9B73FF3A9B74FF3B9C74FF3B9D
          74FF3B9D74FF3B9D74FF3B9D74FF3B9D74FF3B9D74FF3B9D74FF3B9D74FF3B9D
          74FF3B9D74FF3B9D74FF3B9D74FF3B9D74FF3B9E76FF3B9D75FF3B9D74FF3B9D
          74FF3B9E76FF3B9D74FF3B9D74FF3B9D74FF3B9E76FF3B9E76FF3B9F76FF3B9F
          76FF3B9F76FF47B38BFF53C8A1FF5CD8B2FF5CD2AFFF4C8071FA1C342D720000
          0000000000000000000000000000000000002440388D56A38CFF5DDAB4FF56CD
          A7FF3C9F78FF3B9B74FF399A73FF399A73FF3A9B74FF3A9B74FF3A9B73FF3B9B
          74FF399B73FF3A9B74FF3B9C74FF3B9B74FF3B9C74FF3A9B73FF3A9B73FF3B9C
          75FF3B9C73FF3B9C75FF3B9C74FF3B9E76FF3B9E76FF3B9E76FF3B9E76FF3B9E
          76FF3B9E76FF3B9E76FF3B9E76FF3B9E76FF3B9E76FF3B9E76FF3B9E76FF3B9E
          76FF3C9E75FF3C9F76FF3C9E75FF3B9E76FF3B9F76FF3B9E76FF3B9E76FF3C9E
          75FF3B9F76FF3D9F76FF3C9F77FF3B9F76FF3C9F77FF3D9F76FF3D9F76FF3FA4
          7BFF56CDA7FF5DDAB4FF56A38CFF2440388D0000000000000000000000001528
          225753917EFF5DDAB4FF4BBA93FF3B9C75FF3B9C74FF3B9C74FF3B9C74FF3B9C
          74FF3B9C75FF3B9C74FF3B9C74FF3B9C75FF3B9C75FF3B9C74FF3B9C74FF3B9D
          74FF3B9C75FF3B9C74FF3B9C75FF3B9C74FF3B9D75FF3B9D75FF3B9D75FF3C9F
          77FF3C9F77FF3C9F77FF3C9F77FF3C9F77FF3C9F77FF3C9F77FF3C9F77FF3C9F
          77FF3C9F77FF3C9F77FF3C9F77FF3C9F77FF3C9F77FF3D9F76FF3C9F78FF3D9F
          77FF3D9F77FF3C9F77FF3DA077FF3C9F77FF3D9F76FF3D9F76FF3D9F76FF3DA0
          78FF3D9F76FF3D9F76FF3DA078FF3D9F76FF3EA077FF4CBB95FF5DDAB4FF528F
          7DFF152822570000000001030206406A5EE95DD7B2FF52C5A0FF3B9C75FF3B9C
          75FF3B9D74FF3B9D74FF3B9C75FF3B9C74FF3B9D74FF3B9D75FF3B9D75FF3B9D
          75FF3B9D75FF3B9D74FF3B9D74FF3B9C74FF3B9D75FF3B9D75FF3B9D75FF3B9D
          74FF3B9D74FF3B9E76FF3B9E76FF3D9F76FF3D9F76FF3D9F76FF3D9F76FF3D9F
          76FF3D9F76FF3D9F76FF3D9F76FF3D9F76FF3D9F76FF3D9F76FF3D9F76FF3D9F
          76FF3C9F77FF3D9F77FF3CA077FF3DA077FF3DA077FF3D9F76FF3DA078FF3DA0
          78FF3DA078FF3DA078FF3DA079FF3EA077FF3EA178FF3DA179FF3EA178FF3EA1
          78FF3EA078FF3EA178FF53C8A1FF5DD7B2FF3F665AE1010302061629245A5EBB
          9FFF5CD7B2FF3C9F78FF3B9D76FF3B9E77FF3B9E76FF3B9E77FF3B9D76FF3B9E
          77FF3B9E77FF3B9E77FF3B9E77FF6ED9B3FF81EEC9FF81EEC9FF81EEC9FF3B9E
          77FF3B9F77FF3B9E77FF3B9F77FF3B9F77FF3B9F77FF3B9F78FF3B9F77FF41A5
          7EFF81EEC9FF81EEC9FF81EEC9FF81EEC9FF41A57EFF3DA079FF3DA079FF3DA0
          79FF3DA079FF3DA079FF3DA079FF3DA079FF3DA179FF54BB94FF5DC59EFF7DE9
          C3FF81EEC9FF81EEC9FF81EEC9FF81EEC9FF65CFA9FF50B78EFF3EA179FF3EA2
          79FF3EA37AFF3EA279FF3EA279FF3EA279FF3EA279FF3EA279FF3FA47BFF5CD8
          B2FF5EBB9FFF1629245A294B41A55ECAAAFF52C6A0FF3B9E77FF3C9E77FF3B9F
          77FF3C9F78FF3C9F78FF3C9F78FF3C9F78FF3C9F78FF3C9F78FF3C9F78FF5DDE
          B9FF56DFBBFF56DFBBFF56DFBBFF3D9F77FF3C9F78FF3C9F78FF3C9F78FF3C9F
          78FF3C9F78FF3D9F77FF3D9F78FF5CC69FFF56DFBBFF56DFBBFF56DFBBFF56DF
          BBFF58C29BFF3EA279FF3EA279FF3EA279FF3EA279FF3EA279FF3EA279FF3EA2
          79FF3FA279FF72E6C1FF6BE1BDFF56D6B0FF54D4AEFF54D4AEFF54D4AEFF54D4
          AEFF65DEB9FF75E7C2FF62CAA4FF3FA279FF3FA279FF3FA379FF3FA379FF3FA3
          79FF3FA379FF40A37AFF40A37AFF53C9A2FF5DC9A8FF294B41A5356256D85DD7
          B3FF44AE87FF3C9F77FF3C9F78FF3C9F77FF3C9F78FF3CA079FF3C9F78FF3D9F
          78FF3C9F78FF3CA079FF3CA079FF5DDAB5FF56DFBBFF56DFBBFF56DFBBFF3DA0
          79FF3DA079FF3DA179FF3DA079FF3D9F78FF3DA179FF3DA179FF3DA079FF63DC
          B7FF56DFBBFF56DFBBFF56DFBBFF56DFBBFF62D8B3FF3FA379FF3FA379FF3FA3
          79FF3FA379FF3FA379FF3FA379FF3FA379FF3FA379FF54D4AEFF54D4AEFF54D4
          AEFF54D4AEFF54D4AEFF54D4AEFF54D4AEFF54D4AEFF54D4AEFF68E0BAFF5AC1
          9BFF3FA47AFF40A47AFF40A47AFF40A47AFF40A47AFF40A47BFF40A47BFF49B5
          8CFF5DD3AFFF376558DE3B6D5FF05DDAB4FF3EA37BFF3CA079FF3C9F78FF3CA0
          79FF3C9F78FF3CA079FF3C9F78FF3DA079FF3DA179FF3DA179FF3CA079FF5DDA
          B5FF56DFBBFF56DFBBFF56DFBBFF3DA179FF3CA179FF3DA179FF3DA179FF3DA1
          79FF3EA179FF3DA279FF42A77EFF62E3BEFF56DFBBFF56DFBBFF56DFBBFF56DF
          BBFF64E4BEFF44A980FF3FA47AFF3FA47AFF3FA47AFF3FA47AFF3FA47AFF3FA4
          7AFF3FA47AFF54D4AEFF54D4AEFF54D4AEFF54D4AEFF54D4AEFF54D4AEFF54D4
          AEFF54D4AEFF54D4AEFF54D4AEFF62D5AFFF40A47BFF40A57BFF40A57CFF40A5
          7CFF40A57CFF41A67DFF41A67DFF44AB82FF5DDAB4FF3E7163F93F7465FF5DDA
          B4FF3EA179FF3DA179FF3DA179FF3DA17AFF3DA179FF3EA279FF3EA27AFF3EA1
          7AFF3EA279FF3DA27AFF3DA17AFF5DDAB5FF56DFBBFF56DFBBFF56DFBBFF3EA2
          7AFF3EA379FF3EA379FF3EA37BFF3EA379FF3FA27AFF3FA37AFF5CC7A1FF56DF
          BBFF56DFBBFF56DFBBFF56DFBBFF56DFBBFF56DFBBFF59C59DFF40A57CFF40A5
          7CFF40A57CFF40A57CFF40A57CFF40A57CFF3FA47CFF52CDA8FF459877FF3D79
          5BFF386346FF386346FF386346FF459877FF54D4AEFF54D4AEFF54D4AEFF5CD3
          AEFF41A77EFF41A67DFF41A77EFF41A77EFF41A77EFF41A77EFF41A77EFF41A7
          7EFF5DDAB4FF3F7465FF3F7465FF5DDAB4FF3EA27AFF3EA379FF3EA27BFF3EA3
          7BFF3EA379FF3EA37BFF3EA27BFF3EA37BFF3EA37BFF3FA47BFF3EA37BFF5DDA
          B5FF56DFBBFF56DFBBFF56DFBBFF3FA47BFF3FA47AFF3FA47AFF3FA47BFF3FA4
          7CFF3FA47CFF3FA47AFF63DCB7FF56DFBBFF56DFBBFF56DFBBFF56DFBBFF56DF
          BBFF56DFBBFF63D9B4FF41A67EFF41A67EFF41A67EFF41A67EFF41A67EFF41A6
          7EFF41A67DFF39674BFF3D8764FF3F9973FF41A77EFF41A67DFF41A67EFF53A9
          85FF59D7B2FF54D4AEFF54D4AEFF57CEA9FF42A77EFF41A77EFF42A87FFF42A8
          7FFF42A87FFF42A87FFF42A87FFF42A87FFF5DDAB4FF3F7465FF3F7465FF5DDA
          B4FF3FA47CFF3FA47BFF3FA47BFF3FA47BFF3FA47BFF3FA47BFF3FA47AFF3FA4
          7BFF3FA47BFF3FA47AFF3FA47AFF5DDBB5FF56DFBBFF56DFBBFF56DFBBFF3FA4
          7AFF40A57CFF3FA47CFF3FA47CFF40A57CFF3FA47CFF44A981FF62E3BEFF56DF
          BBFF56DFBBFF58D5B0FF57CFABFF56DFBBFF56DFBBFF64E4BEFF46AC83FF41A7
          7EFF41A77EFF41A77EFF41A77EFF41A77EFF41A77EFF42A77EFF41A87FFF42A7
          7EFF79E5BFFF81EEC9FF81EEC9FF72E6C1FF54D4AEFF54D4AEFF54D4AEFF4DB5
          91FF42A97FFF43A97FFF43A97FFF42A97FFF43A97FFF42A97FFF42A97FFF43A9
          7FFF5DDAB4FF3F7465FF3F7465FF5DDAB4FF3FA47CFF3FA47CFF40A47BFF3FA4
          7DFF40A47DFF40A47BFF3FA47CFF40A47DFF3FA47DFF40A47DFF40A57DFF5DDB
          B5FF56DFBBFF56DFBBFF56DFBBFF40A57DFF40A57DFF41A67EFF41A67DFF40A5
          7EFF40A57DFF5EC9A3FF56DFBBFF56DFBBFF56DFBBFF50B794FF4CAF8DFF56DF
          BBFF56DFBBFF56DFBBFF5AC69EFF42A97FFF42A97FFF42A97FFF42A97FFF42A9
          7FFF42A97FFF42A97FFF42A97FFF42A97FFF58D6B0FF54D4AEFF54D4AEFF54D4
          AEFF54D4AEFF54D4AEFF50C5A0FF3F8A68FF42A980FF42AA80FF43A980FF43AA
          80FF42AA80FF43AA81FF43AB7FFF43AA81FF5DDAB4FF3F7465FF3F7465FF5DDA
          B4FF40A67EFF40A57DFF40A67EFF40A57DFF40A67EFF40A67DFF40A57EFF41A6
          7DFF41A67EFF40A57EFF41A67EFF5DDBB5FF56DFBBFF56DFBBFF56DFBBFF41A6
          7EFF41A67EFF41A77EFF41A77EFF41A77EFF41A77EFF63DCB8FF56DFBBFF56DF
          BBFF56DFBBFF439774FF419471FF56DFBBFF56DFBBFF56DFBBFF63D9B4FF43AA
          81FF43AA81FF43AA81FF43AA81FF43AA81FF43A980FF43AA81FF43AA81FF43AA
          80FF58D5B0FF54D4AEFF54D4AEFF54D4AEFF59D7B2FF6BE1BDFF4C8F6FFF42A0
          78FF44AA81FF44AB82FF44AA81FF44AB82FF44AB82FF44AC82FF44AB82FF44AB
          82FF5DDAB4FF3F7465FF3F7465FF5DDAB4FF41A67EFF41A77EFF41A77EFF41A7
          7EFF41A77EFF41A77EFF41A77EFF41A77FFF41A77EFF42A77FFF42A87FFF5DDB
          B5FF56DFBBFF56DFBBFF56DFBBFF42A87FFF41A87FFF42A87FFF41A87FFF42A8
          7FFF46AD84FF62E3BEFF56DFBBFF56DFBBFF56DBB7FF419B75FF42A079FF57D4
          B0FF56DFBBFF56DFBBFF64E4BEFF47AF86FF43AA81FF43AA81FF43AA81FF43AA
          81FF43AB82FF43AB82FF43AA81FF44AB82FF50C6A1FF54D4AEFF54D4AEFF54D4
          AEFF54D4AEFF54D4AEFF72E4BFFF48B087FF44AC82FF44AC83FF44AC81FF45AD
          81FF44AC83FF45AD83FF45AD83FF45AD81FF5DDAB4FF3F7465FF3F7465FF5DDA
          B4FF42A87FFF41A87FFF41A97FFF42A880FF42A980FF42A880FF42A980FF42A9
          80FF42A980FF42A980FF41A980FF5DDBB5FF56DFBBFF56DFBBFF56DFBBFF42A9
          80FF42A980FF43A980FF43A980FF42A980FF5FCAA4FF56DFBBFF56DFBBFF56DF
          BBFF54BC99FF44AC83FF44AC83FF4FB28FFF56DFBBFF56DFBBFF56DFBBFF5BC7
          A0FF44AC83FF44AC83FF44AC83FF44AC83FF44AC83FF44AC82FF44AC81FF44AC
          82FF396C4EFF386346FF3A6B4EFF51C09CFF54D4AEFF54D4AEFF56D6B0FF58C4
          9BFF45AD83FF44AC82FF44AC82FF45AD83FF45AD83FF45AD82FF46AE83FF46AE
          83FF5DDAB4FF3F7465FF3F7465FF5DDAB4FF42A981FF41A980FF42A981FF41A9
          81FF42A980FF42A981FF42A980FF42AA81FF42AA81FF42A981FF42AA81FF5DDB
          B5FF56DFBBFF56DFBBFF56DFBBFF42AA81FF43AA81FF42AA82FF43AB82FF43AB
          82FF64DCB7FF56DFBBFF56DFBBFF56DFBBFF46A480FF45AD83FF45AD83FF449C
          78FF56DFBBFF56DFBBFF56DFBBFF63D9B4FF45AD83FF45AD83FF45AD83FF45AD
          83FF46AD83FF69D4AEFF69D4AEFF59C29BFF46AD83FF45AD82FF44A97FFF64CA
          A5FF54D4AEFF54D4AEFF54D4AEFF5AC9A2FF46AE83FF46AE83FF46AE84FF46AE
          83FF46AE83FF46AE84FF46AE83FF46AE84FF5DDAB4FF3F7465FF3F7465FF5DDA
          B4FF43AA82FF43AA82FF43AB82FF43AB82FF43AA82FF44AB82FF44AB82FF81EE
          C9FF81EEC9FF81EEC9FF81EEC9FF62E3BEFF56DFBBFF56DFBBFF56DFBBFF81EE
          C9FF81EEC9FF81EEC9FF81EEC9FF58C09AFF62E3BEFF56DFBBFF56DFBBFF57DD
          B8FF419570FF45AD83FF45AD83FF429F78FF58D9B4FF56DFBBFF56DFBBFF64E4
          BEFF49B187FF45AD83FF45AD83FF45AD83FF46AE84FF5CD4AEFF65DEB9FF72E6
          C1FF81EEC9FF81EEC9FF81EEC9FF62DCB8FF54D4AEFF54D4AEFF54D4AEFF50B8
          93FF46AE84FF46AE84FF46AE84FF46AE84FF46AF84FF46AF84FF46AF84FF46AF
          85FF5DDAB4FF3F7465FF3F7465FF5DDAB4FF43AB82FF43AB82FF43AB82FF44AC
          82FF43AB82FF44AC83FF44AB82FF56DFBBFF56DFBBFF56DFBBFF56DFBBFF56DF
          BBFF56DFBBFF56DFBBFF56DFBBFF56DFBBFF56DFBBFF56DFBBFF56DFBBFF5DD2
          ABFF56DFBBFF56DFBBFF56DFBBFF54C6A4FF46AE84FF46AE84FF46AE84FF46AE
          84FF52BA97FF56DFBBFF56DFBBFF56DFBBFF5DCAA2FF46AE84FF46AE84FF46AE
          84FF46AF85FF5BCDA8FF54D4AEFF54D4AEFF54D4AEFF54D4AEFF54D4AEFF54D4
          AEFF54D4AEFF54D4AEFF54D4AEFF459F7AFF46B086FF46B086FF46B186FF46B0
          86FF46B186FF46B086FF47B186FF47B186FF5DDAB4FF3F7465FF3F7465FF5DDA
          B4FF44AC84FF44AC84FF44AC84FF44AC84FF44AC83FF44AC84FF44AC84FF56DF
          BBFF56DFBBFF56DFBBFF56DFBBFF56DFBBFF56DFBBFF56DFBBFF56DFBBFF56DF
          BBFF56DFBBFF56DFBBFF56DFBBFF6DE7C3FF56DFBBFF56DFBBFF56DFBBFF49A3
          80FF46B086FF46B086FF46B086FF46B086FF459F7CFF56DFBBFF56DFBBFF56DF
          BBFF64DBB4FF46B086FF46B086FF46B086FF47B086FF4CB692FF54D4AEFF54D4
          AEFF54D4AEFF54D4AEFF54D4AEFF54D4AEFF54D4AEFF54D4AEFF49A785FF44A2
          7AFF47B187FF47B187FF47B187FF47B187FF47B187FF47B287FF47B187FF47B1
          87FF5DDAB4FF3F7465FF3F7465FF5DDAB4FF45AD85FF46AD84FF45AD85FF45AD
          85FF45AD83FF46AE84FF45AD85FF56DFBBFF56DFBBFF56DFBBFF56DFBBFF56DF
          BBFF56DFBBFF56DFBBFF56DFBBFF56DFBBFF56DFBBFF56DFBBFF56DFBBFF56DF
          BBFF56DFBBFF56DFBBFF56DFBBFF449C78FF47B187FF47B187FF47B187FF47B1
          87FF449C76FF54D7B3FF56DFBBFF56DFBBFF4FC5A0FF47B187FF47B187FF47B1
          87FF47B187FF408765FF459877FF4AAE8CFF54D4AEFF54D4AEFF54D4AEFF54D4
          AEFF4AAE8CFF418869FF3F8361FF48B287FF48B388FF48B388FF48B287FF48B3
          88FF49B388FF48B388FF48B287FF49B388FF5DDAB4FF3F7465FF3F7465FF5DDA
          B4FF45AE86FF45AE86FF46AE86FF46AE86FF46AF86FF46AF86FF46AE86FF3863
          46FF386346FF386346FF386346FF386346FF386346FF386346FF386346FF3863
          46FF386346FF386346FF386346FF386346FF386346FF386346FF386346FF47AE
          85FF47B388FF47B388FF47B388FF47B388FF47B388FF39684CFF386346FF3863
          46FF3D7D5CFF47B388FF47B388FF47B388FF48B287FF47AE85FF418E6AFF3D7D
          5CFF386346FF386346FF386346FF386346FF3E7D5CFF439872FF49B388FF48B3
          88FF48B388FF48B388FF48B489FF48B489FF49B489FF49B489FF49B489FF49B5
          8AFF5DDAB4FF3F7465FF3F7465FF5DDAB4FF46B087FF46AF87FF46B087FF46B0
          87FF46B087FF46B187FF46B187FF46B087FF46B187FF46B186FF46B187FF46B1
          87FF46B186FF46B186FF46B187FF46B187FF46B187FF47B187FF46B187FF47B1
          87FF46B187FF47B187FF47B187FF48B489FF48B489FF48B489FF48B489FF48B4
          89FF48B489FF48B489FF48B489FF48B489FF48B489FF48B489FF48B489FF48B4
          89FF48B489FF48B489FF49B48AFF49B489FF49B48AFF49B48AFF49B489FF49B4
          89FF49B48AFF49B58AFF49B58AFF49B58AFF49B58AFF49B58AFF49B58AFF4AB5
          8AFF4AB68AFF4AB68BFF4AB68BFF4AB68BFF5DDAB4FF3F7465FF3F7465FF5DDA
          B4FF46B188FF47B187FF46B187FF47B187FF47B187FF46B188FF46B188FF47B1
          88FF47B188FF47B188FF47B187FF47B288FF47B288FF47B188FF47B188FF47B1
          88FF47B188FF48B287FF47B289FF47B288FF47B288FF47B289FF47B289FF49B5
          8AFF49B58AFF49B58AFF49B58AFF49B58AFF49B58AFF49B58AFF49B58AFF49B5
          8AFF49B58AFF49B58AFF49B58AFF49B58AFF49B58AFF4AB58AFF4AB58AFF4AB6
          8BFF4AB68BFF4AB58AFF4AB68BFF4AB68BFF4AB68BFF4AB68BFF4AB68BFF4AB6
          8BFF4AB68BFF4AB68BFF4AB68BFF4AB68BFF4BB78CFF4AB68BFF4AB68BFF4BB7
          8DFF5DDAB4FF3F7465FF3F7465FF5DDAB4FF47B288FF47B289FF47B288FF47B2
          89FF47B288FF47B288FF47B288FF47B389FF47B289FF47B289FF47B289FF47B2
          89FF48B389FF47B389FF48B389FF48B28AFF48B38AFF48B38AFF48B48AFF48B4
          8AFF48B48AFF48B48AFF49B48AFF4AB68DFF4AB68DFF4AB68DFF4AB68DFF4AB6
          8DFF4AB68DFF4AB68DFF4AB68DFF4AB68DFF4AB68DFF4AB68DFF4AB68DFF4AB6
          8DFF4AB68BFF4AB68BFF4AB68BFF4BB78DFF4AB68BFF4BB78DFF4BB78DFF4BB7
          8CFF4BB78DFF4BB78DFF4BB78DFF4BB78CFF4BB78CFF4BB78CFF4BB78CFF4BB7
          8CFF4BB78CFF4BB78CFF4CB88DFF4BB78CFF5DDAB4FF3F7465FF3F7465FF5DDA
          B4FF48B38AFF48B38AFF48B38AFF48B38AFF48B38AFF48B38AFF48B38AFF48B3
          8AFF48B48AFF48B48AFF48B48BFF48B48BFF54C097FF81EEC9FF6FDBB4FF48B4
          8AFF49B58BFF49B58CFF49B58CFF49B68DFF49B58CFF49B58CFF49B68DFF4BB7
          8DFF4BB78DFF4BB78DFF4BB78DFF4BB78DFF4BB78DFF4BB78DFF4BB78DFF4BB7
          8DFF4BB78DFF4BB78DFF4BB78DFF4BB78DFF4BB78CFF4BB78DFF4BB78CFF4BB7
          8DFF4BB78CFF4CB88DFF4BB78CFF4BB78DFF4BB78CFF4CB88EFF4CB88DFF4CB9
          8EFF4CB98EFF4CB98EFF4CB88EFF4CB88DFF4CB98EFF4CB98EFF4CB98EFF4CBA
          8FFF5DDAB4FF3F7465FF3F7465FF5DDAB4FF49B58CFF49B58BFF49B58BFF49B5
          8BFF49B58BFF49B58BFF49B58CFF4AB68DFF4AB68DFF4AB68BFF4AB68DFF4AB6
          8DFF52B38CFF81EEC9FF6BC9A5FF4AB68DFF4AB68DFF4AB68DFF4AB68DFF4AB6
          8DFF4AB68DFF4AB68DFF4AB68DFF4CB88DFF4CB88DFF4CB88DFF4CB88DFF4CB8
          8DFF4CB88DFF4CB88DFF4CB88DFF4CB88DFF4CB88DFF4CB88DFF4CB88DFF4CB8
          8DFF4CB98EFF4CB98EFF4CB88FFF4CB88DFF4CB98FFF4CB98FFF4CBA8FFF4CB9
          8FFF4CBA8FFF4CBA8FFF4CBA8FFF4CBA8FFF4CBA8FFF4CBA8FFF4CBB90FF4CBB
          90FF4CBB90FF4DBB90FF4CBB90FF4DBB90FF5DDAB4FF3F7465FF3F7465FF5DDA
          B4FF4AB68DFF4AB68CFF4AB68DFF4AB68DFF4AB68DFF4AB68DFF4AB68DFF76E3
          BEFF81EEC9FF81EEC9FF7EEBC6FF60CDA5FF52B48EFF81EEC9FF7CE7C2FF81EE
          C9FF81EEC9FF60CDA5FF4BB78EFF60CDA5FF7EEBC6FF81EEC9FF81EEC9FF65D2
          AAFF4CBA8FFF7EEBC6FF7EEBC6FF4CBA8FFF4CBA8FFF50BD93FF76E3BEFF81EE
          C9FF81EEC9FF57C59BFF4CBA8FFF4CBA8FFF4CBA90FF4DBA90FF4CBB90FF4DBB
          90FF4CBB90FF4DBB90FF4DBB90FF4DBB90FF4DBB90FF4DBB90FF4DBB90FF4DBB
          90FF4DBB90FF4DBB91FF4DBB90FF4DBB90FF4DBB91FF4DBB90FF4DBB90FF4DBB
          90FF5DDAB4FF3F7465FF3F7465FF5DDAB4FF4BB78EFF4BB78EFF4BB78EFF4BB7
          8EFF4BB78EFF4BB88FFF4BB88EFF3C7455FF386346FF3E6C50FF7CE5C0FF7CE8
          C3FF52B58FFF81EEC9FF69C29FFF386346FF72D2AFFF81EEC9FF53C097FF81EE
          C9FF72D3B0FF386346FF64B695FF81EEC9FF5FCCA4FF7CE5C0FF7CE5C0FF4DBB
          90FF4DBB90FF5DC8A0FF81EEC9FF64B695FF386346FF49AA82FF4DBB90FF4DBB
          90FF4DBB91FF4DBB91FF4DBB90FF4DBB90FF4DBB90FF4DBB90FF4DBB90FF4DBB
          92FF4DBB92FF4EBC91FF4DBC92FF4EBB92FF4EBC91FF4EBC91FF4EBC91FF4EBC
          91FF4EBD92FF4EBC91FF4EBC91FF4EBD92FF5DDAB4FF3F7465FF3B6D5FF05DDA
          B4FF4CBA90FF4CB88FFF4CB88FFF4CB98FFF4CB990FF4CB990FF4CB990FF4CB9
          8FFF73E0BAFF81EEC9FF7CE5C0FF447B5CFF53B58FFF81EEC9FF6BC9A6FF4CB9
          91FF61B594FF81EEC9FF5CC49BFF81EEC9FF61B594FF4CBA90FF5FB694FF81EE
          C9FF62C39EFF7CE5C0FF7CE5C0FF4EBC92FF4EBC92FF5AB894FF81EEC9FF63BD
          9AFF4EBC92FF4EBC92FF4EBC92FF4EBC92FF4DBC92FF4EBC92FF4DBC92FF4DBC
          92FF4DBC92FF4EBC92FF4EBD92FF4EBC92FF4EBD92FF4EBD92FF4EBD92FF4EBD
          92FF4EBD92FF4FBD92FF4EBD92FF4EBD92FF4FBE93FF4FBE93FF4FBD92FF4FBF
          95FF5DDAB4FF3E7163F9356256D85CD7B2FF4EBE96FF4CB991FF4CBA90FF4CBA
          91FF4CBA91FF4CBA92FF4CBA90FF73E0BAFF81EEC9FF509172FF3A694CFF49AE
          87FF54B790FF81EEC9FF6BC9A6FF4CBB91FF74DAB6FF81EEC9FF5EBE99FF81EE
          C9FF74DAB6FF4CBB91FF68C9A3FF81EEC9FF58B28DFF7CE5C0FF81EEC9FF81EE
          C9FF7EEBC6FF5ABA95FF81EEC9FF63C19DFF4EBD93FF4EBD93FF4EBD93FF4EBD
          93FF4EBD92FF4EBD93FF4EBD93FF4EBD93FF4EBD93FF4EBD93FF4FBE93FF4FBE
          93FF4EBD93FF4FBE93FF4EBD93FF4FBE93FF4EBE93FF4EBD93FF4FBE92FF4FBE
          92FF4FBE92FF4FBE92FF4FBF93FF51C399FF5BD3AFFF376558DE294B41A558CA
          A8FF53C8A1FF4CBB91FF4CBB92FF4CBB92FF4CBB92FF4CBB92FF4CBB92FF4B91
          70FF72D2AFFF81EEC9FF81EEC9FF77E4BEFF54B790FF81EEC9FF73D8B4FF7AE8
          C3FF81EEC9FF64B695FF459874FF559B7AFF7CE6C2FF81EEC9FF81EEC9FF5BA4
          84FF48A07BFF7CE5C0FF7CE4C0FF6DC8A6FF7CE5C0FF7DE8C3FF81EEC9FF81EE
          C9FF81EEC9FF59C89FFF4FBE94FF4FBE94FF4FBE94FF4FBE94FF4FBE94FF4FBE
          94FF4FBE94FF4FBF94FF4FBE94FF4FBE94FF4FBF94FF4FBF94FF4FBF95FF4FBF
          95FF50BF95FF50BF95FF4FBF95FF4FBF94FF50BF95FF50BF95FF50BF95FF56CC
          A4FF57C9A7FF294B41A51629245A50AE91FF5AD4AFFF4DBC93FF4DBC93FF4DBC
          93FF4DBC92FF4DBC92FF4DBC92FF49AA83FF3D7556FF386346FF386346FF3D75
          56FF4AAB84FF386346FF3D7556FF3B6F51FF386346FF418766FF4EBD93FF4599
          75FF3A694CFF386346FF386346FF459471FF50BF95FF3A694CFF3A694CFF3F7C
          5CFF3A694CFF529575FF81EEC9FF5FAC8CFF386346FF4BAC85FF50BF95FF50BF
          95FF4FBF95FF50BF95FF50BF95FF50BF95FF50BF95FF50BF95FF50BF95FF50BF
          95FF50BF95FF50BF95FF50BF95FF50BF95FF50BF95FF50BF95FF50BF95FF50BF
          95FF50C096FF50C096FF50C096FF5BD6B0FF4FAC90FF1629245A010302063F7C
          6AE95DD8B3FF54C9A2FF4EBD93FF4EBD93FF4EBD93FF4EBD94FF4EBD93FF4EBD
          94FF4EBD93FF4EBD93FF4EBD94FF4EBD94FF4EBD94FF4EBD94FF4EBE94FF4EBE
          94FF4EBE94FF4EBE94FF4EBE94FF4EBE94FF4EBD94FF4FBE94FF4FBE94FF50BF
          96FF50BF96FF50BF96FF50BF96FF50BF96FF50BF96FF5BBB96FF81EEC9FF64C2
          9EFF50BF96FF50BF96FF50BF96FF50BF96FF50C096FF50C096FF50C096FF51C0
          96FF51C096FF50C096FF51C096FF50C096FF51C197FF51C096FF51C197FF51C1
          97FF51C197FF51C197FF51C197FF51C197FF51C197FF51C197FF56CCA4FF5DD8
          B3FF3D7766E101030206000000001528225750AE91FF5DD9B3FF52C69EFF4FBE
          94FF4FBE95FF4FBE95FF4FBE95FF4FBF95FF4FBF95FF4FBF95FF4FBE95FF4FBF
          95FF4FBF95FF4FBF95FF4FBF95FF4FBF95FF4FBF95FF4FBF95FF4FBF95FF4FBF
          95FF4FBF95FF4FBF95FF4FBF95FF50C197FF50C197FF50C197FF50C197FF50C1
          97FF50C197FF49A27DFF386346FF438F6CFF50C197FF50C197FF50C197FF50C1
          97FF51C197FF50C197FF50C297FF51C197FF51C197FF51C297FF51C297FF51C2
          97FF51C297FF51C297FF51C298FF51C298FF51C297FF51C297FF51C297FF51C2
          97FF51C297FF55C9A0FF5DD9B3FF4FAC90FF1528225700000000000000000000
          000024433A8D55BD9EFF5DDAB4FF57CDA6FF50C096FF4FBF96FF50BF96FF4FBF
          96FF4FBF96FF50BF96FF50BF96FF50BF96FF4FBF96FF4FBF96FF50C096FF50BF
          96FF50BF96FF50BF96FF50C096FF50C096FF50C096FF50C096FF50C096FF51C2
          98FF51C298FF51C298FF51C298FF51C298FF51C298FF51C298FF51C298FF51C2
          98FF51C298FF51C298FF51C298FF51C298FF51C298FF51C298FF51C397FF51C2
          98FF51C298FF51C397FF51C298FF51C397FF51C399FF51C398FF51C398FF52C4
          99FF52C499FF51C398FF52C499FF52C49AFF57CFA7FF5DDAB4FF55BD9EFF2443
          3A8D00000000000000000000000000000000000000001C342D724B9F85FA5CD6
          B1FF5BD6B0FF56CCA4FF53C69DFF50C198FF50C096FF50C197FF50C096FF50C0
          96FF50C197FF50C198FF50C197FF50C198FF51C197FF50C198FF51C197FF50C1
          98FF51C197FF51C197FF51C197FF51C399FF51C399FF51C399FF51C399FF51C3
          99FF51C399FF51C399FF51C399FF51C399FF51C399FF51C399FF51C399FF51C3
          99FF52C499FF52C499FF52C499FF52C499FF52C499FF52C49AFF52C499FF52C4
          99FF52C49AFF52C49AFF52C49AFF52C499FF52C499FF55C9A0FF57CDA5FF5BD7
          B0FF5CD6B1FF4B9F85FA1C342D72000000000000000000000000000000000000
          000000000000000000000A120F27396F5FD14FAC90FF57C5A4FF5DD8B3FF5DDA
          B4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDA
          B4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDA
          B4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDA
          B4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDA
          B4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDAB4FF5DDA
          B4FF5DDAB4FF5DD8B3FF57C5A4FF4FAC90FF396F5FD10A120F27000000000000
          0000000000000000000000000000000000000000000000000000000000000101
          010314252051294B41A5325D51CC3E7364FC3F7465FF3F7465FF3F7465FF3F74
          65FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F74
          65FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F74
          65FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F74
          65FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F7465FF3F74
          65FF3F7465FF3F7465FF3F7465FF3F7465FF3E7364FC325D51CC294B41A51425
          2051010101030000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          B6250000424DB62500000000000036000000280000003C000000280000000100
          2000000000008025000000000000000000000000000000000000000000000000
          0000000000000000000000000000010102031E1729513E2E54A54D3968CC5F46
          80FC604782FF604782FF604782FF604782FF604782FF604782FF604782FF6047
          82FF604782FF604782FF604782FF604782FF604782FF604782FF604782FF6047
          82FF604782FF604782FF604782FF604782FF604782FF604782FF604782FF6047
          82FF604782FF604782FF604782FF604782FF604782FF604782FF604782FF6047
          82FF604782FF604782FF604782FF604782FF604782FF604782FF604782FF6047
          82FF5F4680FC4D3968CC3E2E54A51E1729510101020300000000000000000000
          00000000000000000000000000000000000000000000000000000F0B14275140
          6AD174599CFF895FC4FF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62
          EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62
          EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62
          EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62
          EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62
          EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF895FC4FF7459
          9CFF51406AD10F0B142700000000000000000000000000000000000000000000
          0000000000002B203A726C558DFA9861E4FF9B61ECFF8A57D9FF754BC1FF603F
          AAFF613EABFF5F3EAAFF613EABFF613FABFF603FAAFF603FAAFF603FABFF613F
          ACFF613FABFF613FACFF603FABFF603FABFF613FACFF603FABFF6140ACFF6140
          AEFF6140AEFF6140AEFF6140AEFF6140AEFF6140AEFF6140AEFF6140AEFF6140
          AEFF6140AEFF6140AEFF6140AEFF6140AEFF6340AFFF6340AEFF6140AEFF6140
          AEFF6340AFFF6140AEFF6140AEFF6140AEFF6340AFFF6340AFFF6340AFFF6340
          AFFF6340AFFF764CC5FF8C58DBFF9B61ECFF9861E4FF6C558DFA2B203A720000
          0000000000000000000000000000000000003527478D805DB4FF9D62EEFF915A
          DFFF6541B0FF6040ABFF613EABFF613EABFF613FABFF613FABFF613FACFF6140
          ABFF613EACFF613FABFF6140ACFF6140ABFF6140ACFF613FACFF613FACFF6240
          ACFF6040ADFF6240ACFF6240ADFF6340AFFF6340AFFF6340AFFF6340AFFF6340
          AFFF6340AFFF6340AFFF6340AFFF6340AFFF6340AFFF6340AFFF6340AFFF6340
          AFFF6241AFFF6341B0FF6241AFFF6340AFFF6340AFFF6340AFFF6340AFFF6241
          AFFF6340AFFF6342B0FF6441B0FF6340AFFF6441B0FF6342B1FF6342B1FF6743
          B4FF915AE0FF9D62EEFF805DB4FF3527478D0000000000000000000000002118
          2C57765A9FFF9D62EEFF7E50CCFF6240ACFF6240ADFF6140ACFF6240ADFF6240
          ADFF6240ACFF6240ADFF6240ADFF6340ADFF6340ADFF6240ADFF6240ADFF6140
          AEFF6340ADFF6240ADFF6340ADFF6240ADFF6340AEFF6340AEFF6340AEFF6441
          B0FF6441B0FF6441B0FF6441B0FF6441B0FF6441B0FF6441B0FF6441B0FF6441
          B0FF6441B0FF6441B0FF6441B0FF6441B0FF6441B0FF6342B0FF6541B0FF6542
          B1FF6542B1FF6441B0FF6342B1FF6441B0FF6342B1FF6342B0FF6342B0FF6542
          B1FF6442B1FF6442B1FF6542B1FF6442B1FF6543B2FF7F51CEFF9D62EEFF7659
          9EFF21182C5700000000020203065A4776E99B62EAFF8956D8FF6240ACFF6240
          ACFF6240AEFF6240AEFF6340ADFF6240ADFF6140AEFF6340AEFF6340AEFF6340
          AEFF6340AEFF6240AEFF6140AEFF6240ADFF6340AEFF6340AEFF6340AEFF6140
          AEFF6140AEFF6340AFFF6340AFFF6442B1FF6442B1FF6442B1FF6442B1FF6442
          B1FF6442B1FF6442B1FF6442B1FF6442B1FF6442B1FF6442B1FF6442B1FF6442
          B1FF6441B0FF6542B1FF6341B1FF6342B1FF6342B1FF6442B1FF6542B1FF6542
          B1FF6542B1FF6542B1FF6542B1FF6543B2FF6443B2FF6542B1FF6443B2FF6443
          B2FF6543B2FF6443B2FF8C58DBFF9B62EAFF584572E10202030622192E5A8F65
          CCFF9B61EBFF6541B0FF6340AEFF6440AFFF6340AFFF6340AFFF6340AEFF6440
          AFFF6440AFFF6440AFFF6440AFFFA075ECFFB787F4FFB787F4FFB787F4FF6440
          AFFF6440AFFF6440AFFF6440AFFF6440AFFF6440AFFF6440AFFF6440AFFF6B47
          B6FFB787F4FFB787F4FFB787F4FFB787F4FF6B47B6FF6542B1FF6542B1FF6542
          B1FF6542B1FF6542B1FF6542B1FF6542B1FF6542B1FF6542B1FF6542B1FF6542
          B1FF6543B2FF6542B2FF704CBDFFB787F4FFB787F4FFB787F4FF865ED2FF6543
          B2FF6542B3FF6543B2FF6543B2FF6543B2FF6543B2FF6543B2FF6744B5FF9B61
          ECFF8F65CCFF22192E5A3E2E54A59663DCFF8957D9FF6440AFFF6541AFFF6440
          AFFF6541B0FF6541B0FF6541B0FF6541B0FF6541B0FF6541B0FF6541B0FF9F61
          F0FFA05AF0FFA05AF0FFA05AF0FF6542B1FF6541B0FF6541B0FF6541B0FF6541
          B0FF6541B0FF6542B1FF6542B1FF8C62D9FFA05AF0FFA05AF0FFA05AF0FFA05A
          F0FF885ED5FF6543B2FF6543B2FF6543B2FF6543B2FF6543B2FF6543B2FF6543
          B2FF6644B3FF6644B3FF6644B3FF6644B3FF6644B3FF6644B3FF754EC2FF9457
          E7FF9457E7FF9457E7FF8C5DDCFF6644B3FF6644B3FF6544B3FF6544B3FF6544
          B3FF6544B3FF6745B4FF6745B4FF8B58DBFF9463DCFF3E2E54A5513C6ED89B62
          EAFF7249C0FF6441B0FF6541B0FF6441B0FF6541B0FF6441B1FF6541B0FF6542
          B1FF6541B0FF6441B1FF6441B1FF9F62EFFFA05AF0FFA05AF0FFA05AF0FF6542
          B1FF6542B1FF6542B1FF6542B1FF6542B1FF6542B1FF6542B1FF6542B1FFA069
          EFFFA05AF0FFA05AF0FFA05AF0FFA05AF0FF9C68EBFF6544B3FF6544B3FF6544
          B3FF6544B3FF6544B3FF6544B3FF6544B3FF6544B3FF6744B3FF6543B3FF6744
          B3FF6644B4FF6744B3FF714DBCFF9457E7FF9457E7FF9457E7FF875CD1FF6644
          B4FF6644B4FF6745B5FF6745B5FF6745B5FF6745B5FF6745B5FF6745B5FF774D
          C6FF9962E7FF543E71DE5A437AF09D62EEFF6643B3FF6441B1FF6541B0FF6441
          B1FF6541B0FF6441B1FF6541B0FF6542B1FF6542B1FF6542B1FF6441B1FF9F62
          EFFFA05AF0FFA05AF0FFA05AF0FF6542B1FF6441B1FF6542B1FF6542B1FF6542
          B1FF6643B2FF6542B2FF6A47B7FFA666F1FFA05AF0FFA05AF0FFA05AF0FFA05A
          F0FFA669F1FF6D48B9FF6644B4FF6644B4FF6644B4FF6644B4FF6644B4FF6644
          B4FF6644B4FF6644B4FF6744B5FF6744B5FF6744B5FF6745B5FF724DBDFF9457
          E7FF9457E7FF9457E7FF885CD2FF6845B5FF6745B5FF6745B5FF6845B5FF6846
          B5FF6845B5FF6845B6FF6845B6FF6D48BCFF9D62EEFF5E457FF9604782FF9D62
          EEFF6643B2FF6542B1FF6542B1FF6642B1FF6542B1FF6543B2FF6643B2FF6643
          B2FF6543B2FF6542B2FF6642B1FF9F62EFFFA05AF0FFA05AF0FFA05AF0FF6643
          B2FF6543B3FF6543B3FF6643B3FF6543B3FF6744B3FF6744B3FF8D62DAFFA05A
          F0FFA05AF0FFA05AF0FFA05AF0FFA05AF0FFA05AF0FF895FD7FF6845B5FF6845
          B5FF6845B5FF6845B5FF6845B5FF6845B5FF976DE4FFB787F4FFB787F4FFB787
          F4FFB787F4FFB787F4FFB280F3FF9457E7FF9457E7FF9457E7FFA974F2FFB787
          F4FF8761D5FF6846B6FF6946B7FF6946B7FF6946B7FF6946B7FF6946B7FF6946
          B7FF9D62EEFF604782FF604782FF9D62EEFF6643B2FF6543B3FF6743B2FF6643
          B3FF6543B3FF6643B3FF6743B2FF6643B3FF6643B3FF6743B4FF6643B3FF9F62
          EFFFA05AF0FFA05AF0FFA05AF0FF6743B4FF6644B4FF6644B4FF6743B4FF6843
          B4FF6843B4FF6644B4FFA069EFFFA05AF0FFA05AF0FFA05AF0FFA05AF0FFA05A
          F0FFA05AF0FF9E69ECFF6946B6FF6946B6FF6946B6FF6946B6FF6946B6FF6946
          B6FF9660E6FF9457E7FF9457E7FF9457E7FF9457E7FF9457E7FF9457E7FF9457
          E7FF9457E7FF9457E7FF9457E7FF9457E7FF8E5EDDFF6946B7FF6947B9FF6947
          B9FF6947B9FF6947B9FF6947B9FF6947B9FF9D62EEFF604782FF604782FF9D62
          EEFF6744B4FF6743B4FF6743B4FF6743B4FF6743B4FF6743B4FF6644B4FF6743
          B4FF6743B4FF6644B4FF6644B4FF9D62EFFFA05AF0FFA05AF0FFA05AF0FF6644
          B4FF6844B5FF6744B4FF6844B5FF6844B5FF6844B5FF6D48BAFFA666F1FFA05A
          F0FFA05AF0FF985DE9FF935CE3FFA05AF0FFA05AF0FFA669F1FF6D4ABDFF6946
          B7FF6946B7FF6946B7FF6946B7FF6946B7FF9360DFFF9457E7FF9457E7FF9457
          E7FF9457E7FF9457E7FF9457E7FF9457E7FF9457E7FF9457E7FF9457E7FF9457
          E7FF885DD2FF6B48B9FF6B48B9FF6B47B9FF6B48B9FF6A47BAFF6B47B9FF6B48
          BAFF9D62EEFF604782FF604782FF9D62EEFF6844B5FF6844B5FF6745B5FF6944
          B5FF6845B5FF6745B5FF6844B5FF6845B5FF6944B5FF6845B5FF6845B5FF9D62
          EFFFA05AF0FFA05AF0FFA05AF0FF6845B5FF6845B5FF6946B6FF6946B6FF6845
          B5FF6845B5FF8F64DCFFA05AF0FFA05AF0FFA05AF0FF8155C9FF7C52C1FFA05A
          F0FFA05AF0FFA05AF0FF8B61D9FF6B47B9FF6B47B9FF6B47B9FF6B47B9FF6B47
          B9FF8758D3FF9457E7FF9457E7FF9457E7FF9457E7FF9457E7FF9457E7FF9457
          E7FF9457E7FF9457E7FF9457E7FF9457E7FF714CBBFF6B47BBFF6C48BAFF6B48
          BBFF6B47BBFF6C48BBFF6A48BCFF6C48BBFF9D62EEFF604782FF604782FF9D62
          EEFF6944B6FF6845B5FF6944B6FF6845B5FF6944B6FF6844B6FF6845B5FF6945
          B6FF6945B6FF6845B5FF6945B6FF9D62EFFFA05AF0FFA05AF0FFA05AF0FF6945
          B6FF6A46B6FF6B46B7FF6946B7FF6B46B7FF6B46B7FFA069F0FFA05AF0FFA05A
          F0FFA05AF0FF6448A6FF6146A3FFA05AF0FFA05AF0FFA05AF0FF9D69EDFF6C48
          BBFF6C48BBFF6C48BBFF6C48BBFF6C48BBFF694AABFF9457E7FF9457E7FFA36E
          F1FF7761B4FF42406FFF5A4C90FF9457E7FF9457E7FF9457E7FF7E5BC2FF4240
          6FFF5C469DFF6D48BCFF6C48BBFF6D48BCFF6D48BCFF6D49BDFF6D48BCFF6D48
          BCFF9D62EEFF604782FF604782FF9D62EEFF6A46B6FF6B46B7FF6B46B7FF6B46
          B7FF6B46B7FF6B46B7FF6B46B7FF6B46B7FF6B46B7FF6B47B7FF6B47B9FF9D62
          EFFFA05AF0FFA05AF0FFA05AF0FF6B47B9FF6B46B9FF6B47B9FF6B46B9FF6C47
          B9FF704BBDFFA666F1FFA05AF0FFA05AF0FF9D5BF0FF6547ACFF6647B1FF985B
          E7FFA05AF0FFA05AF0FFA669F1FF714CC0FF6C48BBFF6C48BBFF6C48BBFF6C48
          BBFF5F45A2FF684AA7FF9457E7FF9457E7FFA872F2FF7C55C9FF7752C1FF9457
          E7FF9457E7FF9457E7FF895DD4FF6E49BDFF6D49BDFF6E49BDFF6D49BDFF6C49
          BDFF6E49BDFF6F49BDFF6D49BDFF6C49BDFF9D62EEFF604782FF604782FF9D62
          EEFF6C47B9FF6B46B9FF6A46B9FF6C47B9FF6C47B9FF6C47B9FF6C47B9FF6C47
          B9FF6C47B9FF6C47B9FF6C46B9FF9D62EFFFA05AF0FFA05AF0FFA05AF0FF6B47
          BAFF6B47BAFF6C48BAFF6C48BAFF6B47BAFF9065DDFFA05AF0FFA05AF0FFA05A
          F0FF8659CEFF6E49BDFF6E49BDFF7E54C3FFA05AF0FFA05AF0FFA05AF0FF8C61
          DAFF6E49BDFF6E49BDFF6E49BDFF6E49BDFF6E49BDFF594598FF7B51C2FF9457
          E7FF9457E7FFA776F2FF8058CCFF9457E7FF9457E7FF9457E7FF895DD4FF6E49
          BEFF6F49BDFF6E49BEFF6E49BEFF6E4ABEFF6E4ABEFF6E4ABFFF6F4BBFFF6F4B
          BFFF9D62EEFF604782FF604782FF9D62EEFF6C47BAFF6C46BAFF6C47BAFF6D47
          BBFF6B47BAFF6C47BAFF6B47BAFF6D47BBFF6D47BBFF6C47BAFF6D47BBFF9D62
          EFFFA05AF0FFA05AF0FFA05AF0FF6D47BBFF6C48BBFF6D48BCFF6D48BCFF6D48
          BCFFA16AF0FFA05AF0FFA05AF0FFA05AF0FF6F4BB4FF6E4ABEFF6E4ABEFF6849
          ABFFA05AF0FFA05AF0FFA05AF0FF9D69EDFF6E4ABEFF6E4ABEFF6E4ABEFF6E4A
          BEFF6E4ABEFF6E4ABEFF55448FFF8856D4FF9457E7FF9A5FECFFA674F2FF9457
          E7FF9457E7FF9457E7FF8A5DD4FF6F4BBFFF704BC0FF704BC0FF6F4BBFFF704C
          C0FF704BC0FF704CC0FF704BC0FF704BC0FF9D62EEFF604782FF604782FF9D62
          EEFF6D48BBFF6D48BBFF6D48BCFF6D48BCFF6D48BBFF6D48BCFF6D48BCFFB787
          F4FFB787F4FFB787F4FFB787F4FFA666F1FFA05AF0FFA05AF0FFA05AF0FFB787
          F4FFB787F4FFB787F4FFB787F4FF875ED3FFA666F1FFA05AF0FFA05AF0FF9E5C
          F0FF6046A3FF6F4ABFFF6F4ABFFF6547AFFF9A5BEDFFA05AF0FFA05AF0FFA669
          F1FF734EC4FF6F4ABFFF6F4ABFFF6F4ABFFF6F4BBFFF704BC0FF6D4ABAFF5544
          8CFF9258E3FF9457E7FF9A5FECFF9457E7FF9457E7FF9457E7FF8A5DD4FF704B
          C0FF704CC0FF704BC0FF704CC0FF704CC0FF714CC1FF714CC1FF714CC1FF714C
          C1FF9D62EEFF604782FF604782FF9D62EEFF6E48BCFF6E49BDFF6E48BCFF6D49
          BDFF6E48BCFF7049BDFF6E48BCFFA05AF0FFA05AF0FFA05AF0FFA05AF0FFA05A
          F0FFA05AF0FFA05AF0FFA05AF0FFA05AF0FFA05AF0FFA05AF0FFA05AF0FF9662
          E5FFA05AF0FFA05AF0FFA05AF0FF8E5AD9FF704BC0FF704BC0FF704BC0FF704B
          C0FF8458CCFFA05AF0FFA05AF0FFA05AF0FF8D62DCFF704BC0FF704BC0FF704B
          C0FF714BC1FF704BC1FF714BC1FF6A49B6FF60489AFF9457E7FF9457E7FF9457
          E7FF9457E7FF9457E7FF8A5DD5FF714CC1FF714CC1FF714CC1FF714CC2FF714C
          C1FF714CC2FF714CC1FF724DC2FF724DC2FF9D62EEFF604782FF604782FF9D62
          EEFF7049BDFF7049BDFF7049BDFF7049BDFF6F49BDFF7049BDFF7049BDFFA05A
          F0FFA05AF0FFA05AF0FFA05AF0FFA05AF0FFA05AF0FFA05AF0FFA05AF0FFA05A
          F0FFA05AF0FFA05AF0FFA05AF0FFAC72F2FFA05AF0FFA05AF0FFA05AF0FF704F
          B3FF714CC1FF714CC1FF714CC1FF714CC1FF6B4BAFFFA05AF0FFA05AF0FFA05A
          F0FF9E6AEFFF714CC1FF714CC1FF714CC1FF714DC1FF724DC2FF714DC1FF714D
          C1FF6247A6FF684AA7FF9457E7FF9457E7FF9457E7FF9457E7FF8A5DD5FF724D
          C4FF724DC4FF724DC4FF724DC4FF724DC4FF724DC4FF724DC5FF724DC4FF724D
          C4FF9D62EEFF604782FF604782FF9D62EEFF714ABFFF704ABEFF714ABFFF714A
          BFFF6F4ABFFF6F4BBFFF714ABFFFA05AF0FFA05AF0FFA05AF0FFA05AF0FFA05A
          F0FFA05AF0FFA05AF0FFA05AF0FFA05AF0FFA05AF0FFA05AF0FFA05AF0FFA05A
          F0FFA05AF0FFA05AF0FFA05AF0FF674AABFF724DC2FF724DC2FF724DC2FF724D
          C2FF6549ACFF9959EBFFA05AF0FFA05AF0FF8A54D8FF724DC2FF724DC2FF724D
          C2FF724DC4FF724DC4FF724DC4FF724DC4FF724DC4FF5D469CFF7A50BFFF9457
          E7FF9457E7FF9457E7FF754DBDFF734DC5FF734DC5FF734DC5FF734DC5FF734D
          C5FF744EC5FF734DC5FF734DC5FF744EC5FF9D62EEFF604782FF604782FF9D62
          EEFF714AC0FF714AC0FF714BC0FF714BC0FF714BC1FF714BC1FF714BC0FF4240
          6FFF42406FFF42406FFF42406FFF42406FFF42406FFF42406FFF42406FFF4240
          6FFF42406FFF42406FFF42406FFF42406FFF42406FFF42406FFF42406FFF704C
          BFFF744DC5FF744DC5FF744DC5FF744DC5FF744DC5FF454074FF42406FFF4240
          6FFF52448CFF744DC5FF744DC5FF744DC5FF734DC5FF744DC5FF744DC5FF744D
          C5FF744DC5FF744DC5FF53448CFF42406FFF42406FFF42406FFF6048A3FF744D
          C5FF744DC5FF744DC5FF744DC6FF744DC6FF744EC6FF754EC6FF744EC6FF754E
          C7FF9D62EEFF604782FF604782FF9D62EEFF724CC1FF724CC1FF734CC1FF724C
          C1FF724CC1FF734CC2FF734CC2FF724BC1FF734CC2FF714CC2FF734CC2FF734C
          C2FF714CC2FF714CC2FF734CC2FF734CC2FF734CC4FF724DC4FF734CC4FF734D
          C2FF734CC4FF724DC4FF724DC4FF754DC6FF754DC6FF754DC6FF754DC6FF754D
          C6FF754DC6FF754DC6FF754DC6FF754DC6FF754DC6FF754DC6FF754DC6FF754D
          C6FF754DC6FF754DC6FF764EC6FF754EC6FF764EC6FF764EC6FF754EC6FF754E
          C6FF764EC6FF754EC7FF754EC7FF754EC7FF754EC7FF754EC7FF754EC7FF7650
          C7FF734EC7FF764EC7FF7650C8FF764EC7FF9D62EEFF604782FF604782FF9D62
          EEFF744CC2FF734DC2FF734CC4FF724DC4FF734DC2FF744CC4FF744CC4FF744D
          C4FF744DC4FF744DC4FF724DC4FF744DC5FF744DC5FF744DC4FF744DC4FF744D
          C4FF744DC4FF734DC5FF754DC5FF744DC5FF744DC5FF754DC5FF754DC5FF754E
          C7FF754EC7FF754EC7FF754EC7FF754EC7FF754EC7FF754EC7FF754EC7FF754E
          C7FF754EC7FF754EC7FF754EC7FF754EC7FF754EC7FF7650C7FF7650C7FF764E
          C7FF7650C8FF7650C7FF7750C8FF7750C8FF7650C8FF7750C8FF7750C9FF7750
          C9FF7750C9FF7750C9FF7750C9FF7750C9FF7650C9FF7750C9FF7750C9FF7850
          C9FF9D62EEFF604782FF604782FF9D62EEFF744DC5FF754DC5FF744DC5FF754D
          C5FF744DC5FF744DC5FF744DC5FF754DC5FF754DC5FF754DC5FF754DC5FF754D
          C5FF754DC5FF754DC5FF754DC5FF764DC5FF754DC5FF754DC5FF764DC6FF764D
          C6FF764DC6FF764DC6FF764EC6FF774EC8FF774EC8FF774EC8FF774EC8FF774E
          C8FF774EC8FF774EC8FF774EC8FF774EC8FF774EC8FF774EC8FF774EC8FF774E
          C8FF7750C9FF7750C9FF7750C9FF7850C9FF7750C9FF7850C9FF7850C9FF7851
          C9FF7850C9FF7850C9FF7850C9FF7851C9FF7851C9FF7851C9FF7851C9FF7851
          C9FF7851C9FF7851C9FF7951CAFF7851C9FF9D62EEFF604782FF604782FF9D62
          EEFF754DC5FF754DC5FF754DC5FF754DC5FF754DC5FF754DC5FF754DC5FF754D
          C5FF764DC6FF764DC6FF774DC6FF774DC6FF8359D2FFB787F4FFA075EEFF764D
          C6FF774EC7FF764DC6FF764DC6FF764DC7FF764DC6FF764DC6FF764DC7FF7850
          C9FF7850C9FF7850C9FF7850C9FF7850C9FF7850C9FF7850C9FF7850C9FF7850
          C9FF7850C9FF7850C9FF7850C9FF7850C9FF7851C9FF7850C9FF7851C9FF7850
          C9FF7851C9FF7951CAFF7851C9FF7951C9FF7851C9FF7951CAFF7951CAFF7851
          CAFF7951CAFF7951CAFF7951CAFF7951CAFF7951CAFF7951CAFF7951CAFF7951
          CBFF9D62EEFF604782FF604782FF9D62EEFF784EC7FF774EC7FF774EC7FF774E
          C7FF774EC7FF774EC7FF784EC7FF774EC7FF774EC7FF764EC7FF774EC7FF774E
          C7FF7B58C6FFB787F4FF9471DBFF774EC7FF774EC8FF774EC7FF774EC7FF774E
          C7FF774EC8FF774EC8FF774EC7FF7951CAFF7951CAFF7951CAFF7951CAFF7951
          CAFF7951CAFF7951CAFF7951CAFF7951CAFF7951CAFF7951CAFF7951CAFF7951
          CAFF7951CAFF7951CAFF7A51CAFF7951CAFF7951CAFF7951CAFF7951CBFF7951
          CAFF7951CBFF7951CBFF7951CBFF7951CBFF7951CBFF7951CBFF7951CCFF7951
          CCFF7951CCFF7A52CCFF7951CCFF7952CCFF9D62EEFF604782FF604782FF9D62
          EEFF774EC7FF7850C8FF774EC7FF774EC7FF774EC7FF774EC7FF774EC8FFAB7D
          F3FFB787F4FFB787F4FFB283F3FF9166DFFF7C58C6FFB787F4FFAF82F3FFB787
          F4FFB787F4FF9166DFFF7950C9FF9166DFFFB283F3FFB787F4FFB787F4FF966A
          E4FF7951CBFFB283F3FFB283F3FF7951CBFF7951CBFF7D55CFFFAC7DF3FFB787
          F4FFB787F4FF855DD6FF7951CBFF7951CBFF7A51CBFF7A52CBFF7951CCFF7A52
          CCFF7951CCFF7A52CCFF7A52CCFF7A52CCFF7A52CCFF7A52CCFF7A52CCFF7A52
          CCFF7A52CCFF7B52CCFF7A52CDFF7A52CDFF7B52CCFF7A52CDFF7A52CDFF7A52
          CDFF9D62EEFF604782FF604782FF9D62EEFF7950C9FF7950C9FF7950C9FF7A50
          C9FF7950C9FF7950C9FF7950C9FF4D4381FF42406FFF494478FFAF82F3FFB082
          F3FF7C58C7FFB787F4FF9070D3FF42406FFFA07AE5FFB787F4FF8158D2FFB787
          F4FFA07AE6FF42406FFF886AC7FFB787F4FF8E64DEFFAF82F3FFAF82F3FF7A52
          CDFF7A52CDFF8D63DBFFB787F4FF886AC7FF42406FFF704FBAFF7A52CDFF7A52
          CDFF7B52CCFF7B52CCFF7A52CDFF7A52CDFF7A52CDFF7A52CDFF7A52CDFF7B52
          CDFF7B52CDFF7B53CEFF7C52CEFF7C53CDFF7B53CEFF7B53CEFF7B53CEFF7B53
          CEFF7C53CFFF7B53CEFF7B53CEFF7C53CFFF9D62EEFF604782FF5A437AF09D62
          EEFF7A51CBFF7B51CAFF7B51CAFF7951CAFF7A51CAFF7A51CAFF7A51CAFF7951
          CAFFA679F2FFB787F4FFAF82F3FF554B89FF7C58C7FFB787F4FF9571DBFF7B51
          CAFF8567C6FFB787F4FF8861D5FFB787F4FF8567C6FF7A51CBFF8566C7FFB787
          F4FF8D68D6FFAF82F3FFAF82F3FF7C53CEFF7C53CEFF8460CAFFB787F4FF8B6A
          D0FF7C53CEFF7C53CEFF7C53CEFF7C53CEFF7C52CEFF7C53CEFF7C52CEFF7C52
          CEFF7C52CFFF7C53CEFF7C53CFFF7C53CEFF7D53CFFF7C53CFFF7D53CFFF7D53
          CFFF7C53D0FF7C54CFFF7C53D0FF7C53D0FF7D54D0FF7D54D0FF7C54CFFF7F54
          D1FF9D62EEFF5E457FF9513C6ED89B61EBFF8053D0FF7B51CAFF7A51CBFF7A51
          CBFF7A51CBFF7B51CBFF7A51CBFFA679F2FFB787F4FF6958A0FF454175FF724F
          BFFF7E5AC9FFB787F4FF9571DBFF7B51CCFFA47BEDFFB787F4FF8764D0FFB787
          F4FFA47BEDFF7B51CCFF946FDCFFB787F4FF7E5FC3FFAF82F3FFB787F4FFB787
          F4FFB383F3FF8460CBFFB787F4FF8D6AD2FF7D53D0FF7D53D0FF7D53D0FF7D53
          D0FF7C53D0FF7D53CFFF7D53D0FF7D53D0FF7D53D0FF7D53D0FF7D54D0FF7D54
          D0FF7D53D0FF7D54D0FF7D53D0FF7D54D0FF7D53D0FF7D53D0FF7D54D0FF7D54
          D0FF7D54D0FF7D54D0FF7D54D1FF8357D5FF9760E7FF543E71DE3E2E54A5935E
          DDFF8958DBFF7B51CCFF7B51CDFF7B51CDFF7C51CCFF7C51CCFF7C51CDFF6651
          A1FFA07AE5FFB787F4FFB787F4FFAC7DF3FF7D5AC9FFB787F4FFA27BEAFFAE80
          F3FFB787F4FF886AC7FF654AA7FF715DAAFFAF82F3FFB787F4FFB787F4FF7761
          B4FF6A4EB0FFAF82F3FFAF82F3FF9774DAFFAF82F3FFB083F3FFB787F4FFB787
          F4FFB787F4FF895EDAFF7E54D0FF7E54D0FF7E54D0FF7E54D0FF7E54D0FF7E54
          D0FF7E54D0FF7E54D1FF7E54D0FF7E54D0FF7E54D1FF7E54D1FF7F54D1FF7F54
          D1FF7F55D1FF7F55D1FF7F54D1FF7E54D1FF7F55D2FF7F55D2FF7F55D1FF8B5A
          DEFF935EDCFF3E2E54A522192E5A8055BEFF975FE7FF7C52CEFF7C52CEFF7C52
          CEFF7C52CFFF7C52CFFF7C52CFFF714FBBFF4D4382FF42406FFF42406FFF4D43
          82FF7250BCFF42406FFF4D4382FF49427BFF42406FFF594895FF7D53D0FF654A
          A9FF454175FF42406FFF42406FFF624BA4FF7F55D1FF454175FF454175FF5245
          8AFF454175FF6B58A4FFB787F4FF8166BDFF42406FFF7351BEFF7F55D1FF7F55
          D1FF7F54D1FF7F55D1FF7F55D2FF7F55D1FF7F55D2FF7F55D2FF7F55D2FF8055
          D2FF8055D2FF8055D2FF8055D2FF8055D2FF8055D2FF8055D2FF8055D2FF8055
          D2FF7F55D3FF7F55D3FF7F55D3FF9860E9FF8155BDFF22192E5A020203066245
          89E99B62ECFF8B59DCFF7D53D0FF7D53D0FF7D53D0FF7F53D0FF7D53D0FF7F53
          D0FF7D53D0FF7D53D0FF7F53D0FF7F53D0FF7F53D0FF7F53D0FF7E53D0FF7E53
          D0FF7E53D0FF7E53D0FF7E53D0FF7E53D0FF7F53D0FF7E54D0FF7E54D0FF8055
          D2FF8055D2FF8055D2FF8055D2FF8055D2FF8055D2FF8561CCFFB787F4FF8E6A
          D3FF8055D2FF8055D2FF8055D2FF8055D2FF7F55D3FF7F55D3FF7F55D3FF8055
          D3FF8055D3FF7F55D3FF8055D3FF7F55D3FF8156D4FF8055D3FF8156D4FF8156
          D4FF8156D4FF8156D4FF8156D4FF8156D4FF8156D4FF8156D4FF8C5ADFFF9B62
          ECFF5E4383E1020203060000000021182C578055BEFF9B62EDFF8757D9FF7E54
          D0FF8054D0FF8054D0FF8054D0FF7F54D1FF7F54D1FF7F54D1FF8054D0FF7F54
          D1FF7F54D1FF7F54D1FF7F54D1FF7F54D1FF7F54D1FF7F54D1FF7F54D1FF7F54
          D1FF7F54D1FF7E54D2FF7E54D2FF8156D4FF8156D4FF8156D4FF8156D4FF8156
          D4FF8156D4FF6C4FB3FF42406FFF60499EFF8156D4FF8156D4FF8156D4FF8156
          D4FF8156D4FF8156D4FF8156D4FF8156D4FF8156D4FF8056D4FF8156D4FF8156
          D4FF8056D4FF8156D4FF8256D4FF8256D4FF8156D4FF8056D4FF8056D4FF8056
          D4FF8056D4FF895ADCFF9B62EDFF8155BDFF21182C5700000000000000000000
          000036274A8D8B5BCFFF9D62EEFF8F5CE0FF8055D3FF8054D2FF8055D2FF8054
          D2FF8054D2FF8055D2FF8055D2FF8055D2FF8054D2FF8054D2FF7F55D3FF8055
          D2FF8055D2FF8155D2FF8055D3FF8055D3FF8055D3FF8055D3FF8055D3FF8256
          D4FF8256D4FF8256D4FF8256D4FF8256D4FF8256D4FF8256D4FF8256D4FF8256
          D4FF8256D4FF8256D4FF8256D4FF8256D4FF8256D4FF8256D4FF8156D5FF8256
          D4FF8256D4FF8156D5FF8256D4FF8156D5FF8356D5FF8257D5FF8257D5FF8257
          D6FF8257D6FF8257D5FF8257D6FF8457D8FF905DE3FF9D62EEFF8B5BCFFF3627
          4A8D00000000000000000000000000000000000000002B203A727950AFFA9A61
          E9FF9860E9FF8B5ADEFF8658D9FF8356D4FF8055D3FF8156D4FF8055D3FF8055
          D3FF8156D4FF8356D4FF8156D4FF8356D4FF8256D4FF8356D4FF8256D4FF8356
          D4FF8256D4FF8256D4FF8256D4FF8357D5FF8357D5FF8357D5FF8357D5FF8357
          D5FF8357D5FF8357D5FF8357D5FF8357D5FF8357D5FF8357D5FF8357D5FF8357
          D5FF8257D6FF8257D6FF8257D6FF8257D6FF8257D6FF8458D6FF8358D6FF8257
          D6FF8458D6FF8457D6FF8457D6FF8358D6FF8358D8FF895ADCFF8D5CE0FF9860
          EAFF9A61E9FF7950AFFA2B203A72000000000000000000000000000000000000
          000000000000000000000F0B1427583E7AD18155BDFF8F5DD8FF9B62ECFF9D62
          EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62
          EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62
          EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62
          EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62
          EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62EEFF9D62
          EEFF9D62EEFF9B62ECFF8F5DD8FF8155BDFF583E7AD10F0B1427000000000000
          0000000000000000000000000000000000000000000000000000000000000101
          02031E1729513E2E54A54D3968CC5F4680FC604782FF604782FF604782FF6047
          82FF604782FF604782FF604782FF604782FF604782FF604782FF604782FF6047
          82FF604782FF604782FF604782FF604782FF604782FF604782FF604782FF6047
          82FF604782FF604782FF604782FF604782FF604782FF604782FF604782FF6047
          82FF604782FF604782FF604782FF604782FF604782FF604782FF604782FF6047
          82FF604782FF604782FF604782FF604782FF5F4680FC4D3968CC3E2E54A51E17
          2951010102030000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          B6250000424DB62500000000000036000000280000003C000000280000000100
          2000000000008025000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000502020F160C09482614
          0F7B341B15A73F2119CB48251DE74D281FF94D281FF948251DE73F2119CB341B
          15A726140F7B160C09480502020F000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000001209
          07392915118543231BCE70452BFF8C5B34FFA36F3BFFB87F41FFC78C46FFD193
          49FFD19349FFC78C46FFB87F41FFA36F3BFF8C5B34FF70452BFF43231BCE2915
          1185120907390000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000100806332C17128E5D3624EB8D5C34FFB37B40FFC58741FFB679
          39FFA96D31FF9F632CFF965B28FF915524FF925625FF965A27FF9F622CFFAA6D
          32FFB67939FFC58741FFB37B40FF8D5C34FF5D3624EB2C17128E100806330000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000121110D694F2D1FD48D5C34FFB980
          40FFBA7C3AFFA4692FFF925625FF915524FF905424FF915524FF915524FF9155
          24FF915524FF915424FF915524FF905524FF915423FF935625FFA4692FFFBA7C
          3BFFB98040FF8D5C34FF4F2D1FD421110D690000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000804031B2C17
          128E74472CFFAB753DFFBC7F3CFFA3672EFF925524FF925524FF925524FF9255
          24FF925625FF925625FF925625FF925524FF925625FF925524FF925625FF9255
          24FF925524FF925625FF925625FF935625FFA3672EFFBC7F3CFFAB753DFF7447
          2CFF2C17128E0804031B00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000B060524321A14A0845431FFBA8040FFB07235FF935726FF9356
          25FF935725FF935625FF935625FF935625FF935625FF935625FF935725FF9357
          26FF935625FF935625FF935625FF935625FF935625FF935625FF935625FF9356
          25FF935625FF935726FFB07235FFBA8040FF845431FF321A14A00B0605240000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000804031B321A14A0885732FFBE82
          40FFA86C31FF945826FF945826FF945726FF945826FF935725FF935725FF9457
          26FF945726FF945726FF935826FF935725FF945726FF945726FF945826FF9458
          26FF945826FF935725FF945826FF945826FF935825FF945826FF935726FFA86C
          31FFBE8240FF885732FF321A14A00804031B0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00012C17128E845431FFBE8340FFA66A30FF955927FF955927FF945926FF9459
          26FF955926FF955927FF955927FF955927FF955927FF955926FF955927FF9559
          26FF955927FF945926FF955926FF955927FF955927FF955927FF945926FF9459
          26FF955927FF955927FF955927FF955927FFA76A30FFBE8340FF845431FF2C17
          128E000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000021110D6974472CFFBB8040FFAA6E32FF965A
          28FF965B28FF965B27FF965A27FF965B28FF965B27FF965B27FF965B27FF965A
          27FF965B28FF965B27FF975A28FF965A28FF965B27FF975A28FF965A28FF965A
          27FF965B27FF965B27FF975A27FF965A27FF965A28FF965A27FF965A28FF965A
          27FF965B27FFAA6D32FFBB8040FF74472CFF21110D6900000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000100806334F2D
          1FD4AB753DFFB27537FF985C28FF985C28FF985C28FF985C28FF985C28FF985C
          28FF985C28FF985C28FF985C28FF985C28FF985C29FF975C28FF985C28FF985C
          28FF985C29FF985C28FF985C29FF985C28FF985C28FF985C28FF985C28FF985C
          28FF985C28FF985C29FF985C29FF985C28FF985C28FF985C29FFB37538FFAB75
          3DFF4F2D1FD41008063300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000002C17128E8D5C34FFBF833EFF9A5E29FF9A5E29FF9A5E
          29FF9A5E29FF9A5E29FF9A5E29FF9A5E29FF9A5D29FF9A5E29FF995D29FF9A5E
          29FF995D29FF9A5E29FF9A5E29FF995D29FF9A5E29FF9A5D29FF9A5D29FF9A5D
          29FF9A5D29FF9A5E29FF9A5E29FF9A5E29FF995D29FF9A5E29FF9A5E29FF9A5E
          29FF9A5E29FF9A5E29FF9B5F2AFFBF833EFF8D5C34FF2C17128E000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000120907395D3624EBBA81
          41FFAB6D33FF9B5F2AFF9C5F2AFF9B5F2AFF9C5F2AFF9C5F2AFF9C5F2AFF9B5F
          2AFF9C5F2BFF9C5F2AFF9B5F2AFF9B5F2AFF9C5F2AFF9C5F2AFF9C5F2AFF9C5F
          2AFF9C5F2AFF9B5F2AFF9C5F2AFF9C5F2AFF9C5F2AFF9B5F2AFF9C5F2AFF9C5F
          2AFF9B5F2AFF9B5F2AFF9B5F2AFF9C5F2BFF9C5F2AFF9C5F2BFF9C5F2AFFAB6E
          33FFBA8141FF5D3624EB12090739000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000291511858D5C34FFBE813EFF9E602BFF9E602BFF9E602BFF9E61
          2BFF9E612BFF9E602BFF9D602BFF9E602BFF9E602BFF9E602BFF9E612BFF9D61
          2BFF9E612BFF9E612BFF9E612BFF9E602BFF9E612BFF9E612BFF9E612BFF9E61
          2BFF9E602BFF9D612BFF9E602BFF9E612BFF9E602BFF9E602BFF9E602BFF9E61
          2BFF9E612BFF9E612BFF9D602BFF9D612BFFBE813EFF8D5C34FF291511850000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000502020F43231BCEB37B40FFAF72
          35FF9F622CFFA0632CFFA0622CFFA0622CFFCC9155FFEBB172FFEBB172FFBD81
          48FFA0622CFFA0632CFFA0622CFFA0632CFFA0622CFFA0622CFFC88C51FFEBB1
          72FFEBB172FFDCA164FF9F632CFF9F622CFFA0622CFFA0622CFFA0622CFFA062
          2CFFA0632CFF9F622CFFA0622CFFA0632CFFA0622CFFA0622CFFA0632CFF9F63
          2CFFAF7235FFB37B40FF43231BCE0502020F0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000160C094870452BFFC88B43FFA2652EFFA1642DFFA1642DFFA1642DFFA064
          2DFFD4974AFFDA9B42FFDA9B42FFC98C46FFA0642DFFA1642DFFA1642DFFA164
          2DFFA1642DFFA1642DFFDDA154FFDA9B42FFDA9B42FFDEA04CFFB0733BFFA164
          2DFFA0642DFFA0642DFFA0642DFFA1642DFFA1642DFFA1642DFFA1642DFFA064
          2DFFA1642DFFA1642DFFA1642DFFA1642DFFA2652EFFC88B43FF70452BFF160C
          0948000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000026140F7B8C5B34FFBF823EFFA366
          2EFFA3662EFFA3662EFFA3662EFFA3662EFFCD9248FFDA9B42FFDA9B42FFBE85
          45FFA3662EFFA3662EFFA3662EFFA3662EFFA3662EFFB1743BFFDD9F49FFDA9B
          42FFDA9B42FFDA9B42FFC88B4BFFA3662EFFA3662EFFA3662EFFAD7038FFC488
          4EFFD79C60FFEBB172FFEBB172FFE6AC6EFFC4894EFFA3662EFFA3662EFFA366
          2EFFA3662EFFBF823EFF8C5B34FF26140F7B0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000341B15A7A36F3BFFB77939FFA4682FFFA5682FFFA4682FFFA5682FFFA468
          2FFFCD9249FFDA9B42FFDA9B42FFBF8545FFA4672FFFA4682FFFA4682FFFA468
          2FFFA5672FFFCD914FFFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9E55FFA467
          2FFFA4672FFFA4672FFFBB7D41FFDDA15AFFCB8D43FFCD8F3FFFCD8F3FFFCF91
          42FFDDA15AFFCA8E53FFA4672FFFA4672FFFA4682FFFB77939FFA36F3BFF341B
          15A7000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003F2119CBB87F41FFB17336FFA66A
          30FFA76A30FFA66A30FFA66931FFA66930FFCD9249FFDA9B42FFDA9B42FFBF86
          46FFA76930FFA66A30FFA76A31FFA76930FFA66A30FFDDA055FFDA9B42FFDA9B
          42FFDA9B42FFDA9B42FFDEA04CFFB5783DFFA66930FFA76930FFB87C40FFCD8F
          3FFF966231FF4F2920FF603724FFC78A40FFCD8F3FFFDB9E56FFAB6D35FFA669
          30FFA66A30FFB17437FFB87F41FF3F2119CB0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000048251DE7C78C46FFAD6F34FFA86C31FFA96C31FFA96B31FFA96B31FFA96C
          31FFCE9249FFDA9B42FFDA9B42FFC08646FFA96B31FFA96B31FFA96C31FFA96B
          31FFB67A3EFFDD9F49FFDA9B42FFD89A44FFC38841FFDA9B42FFDA9B42FFCB8E
          4DFFA96C31FFA86B32FFA06831FF8A592FFF7F4C2AFFA96B31FF9E6230FFAF78
          41FFCD8F3FFFCD8F3FFFBB7F43FFA96C31FFA96B32FFAD7034FFC78C46FF4825
          1DE7000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000004D281FF9D19349FFAC6E34FFAB6C
          33FFAB6D33FFAB6D33FFAB6D33FFAB6D33FFCE9249FFDA9B42FFDA9B42FFC086
          46FFAB6D33FFAB6D33FFAB6D33FFAB6D33FFD09452FFDA9B42FFDA9B42FFC288
          43FF946033FFDA9B42FFDA9B42FFDA9E55FFAB6C33FFAB6D33FF935B2EFF804E
          2AFFAB6D33FFAB6D33FFAB6D33FFBC8346FFCD8F3FFFCD8F3FFFBA7E3FFFAB6D
          33FFAB6D33FFAC6D34FFD19349FF4D281FF90000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00004D281FF9D19349FFAD7035FFAD6F34FFAD6F35FFAD6F35FFAD6E34FFAD6F
          34FFCE9249FFDA9B42FFDA9B42FFC18746FFAD6F34FFAD6F35FFAD6F34FFAD6F
          35FFDDA055FFDA9B42FFDA9B42FF9E6935FF935C2EFFDA9B42FFDA9B42FFDEA0
          4CFFB97B41FFAD6F35FFAD6E34FFAD6F34FFAD6F35FFAD6F34FFB5783CFFD69A
          56FFCD8F3FFFCD8F3FFFA06632FFAD6E34FFAD6F34FFAD6F35FFD19349FF4D28
          1FF9000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000048251DE7C78C46FFB27437FFAE71
          36FFAF7136FFAF7036FFAE7035FFAF7135FFCE9349FFDA9B42FFDA9B42FFC187
          46FFAF7135FFAF7136FFAE7036FFBB7D41FFDD9F49FFDA9B42FFDA9B42FF8E59
          2EFFA96C34FFC58A44FFDA9B42FFDA9B42FFCE914FFFAE7135FFAE7136FFDB9F
          62FFEBB172FFEBB172FFE6AC6BFFD29447FFCD8F3FFFBF843CFF9B6231FFAE71
          35FFAF7136FFB27437FFC78C46FF48251DE70000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00003F2119CBB87F41FFB87A3AFFB07337FFB07336FFB17336FFB17336FFB173
          36FFCE9349FFDA9B42FFDA9B42FFC28747FFB17336FFB17337FFB17337FFD295
          53FFDA9B42FFDA9B42FFC88D43FFAA6D35FFB17337FFA56F37FFDA9B42FFDA9B
          42FFDB9F56FFB17336FFB17336FFD19349FFCD8F3FFFCD8F3FFFCD8F3FFFCD8F
          3FFF9B6733FF6B3F26FFB17337FFB17336FFB17336FFB97A3BFFB87F41FF3F21
          19CB000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000341B15A7A36F3BFFBF823EFFB375
          38FFB37538FFB37538FFB37538FFB37538FFCE9349FFDA9B42FFDA9B42FFC288
          47FFB27437FFB27437FFB37538FFDDA055FFDA9B42FFDA9B42FFA77139FFB375
          38FFB37538FF8A562EFFDA9B42FFDA9B42FFDEA04CFFBE8144FFB37538FFCC90
          47FFCD8F3FFFCA8E47FF4F2920FF4F2920FF774729FFA56B34FFB27437FFB274
          37FFB27437FFBF823EFFA36F3BFF341B15A70000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000026140F7B8C5B34FFC78842FFB47639FFB47739FFEBB172FFEBB172FFEBB1
          72FFE1A456FFDA9B42FFDA9B42FFE4A75FFFEBB172FFEBB172FFDDA163FFDD9F
          49FFDA9B42FFDA9B42FF915C31FFB57739FFB47639FFAD7136FFCD9143FFDA9B
          42FFDA9B42FFD19550FFB47638FFCC9047FFCD8F3FFFD4974CFFEBB172FFEBB1
          72FFEBB172FFEBB172FFB47639FFB57739FFB57739FFC68842FF8C5B34FF2614
          0F7B000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000160C094870452BFFCE9046FFB879
          3AFFB67839FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B42FFDA9B
          42FFDA9B42FFDA9B42FFD19240FFDA9B42FFDA9B42FFBE853BFFA96D37FFB778
          39FFB77839FFB67939FF9B6733FFDA9B42FFDA9B42FFBC803BFFB77939FFB47A
          39FFCD8F3FFFCD8F3FFFCD8F3FFFCD8F3FFFCD8F3FFFCD8F3FFFB77939FFB678
          39FFB77939FFCE9046FF70452BFF160C09480000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000502020F43231BCEB37B40FFC0833FFFB8793AFF4F2920FF4F2920FF4F29
          20FF4F2920FF4F2920FF4F2920FF4F2920FF4F2920FF4F2920FF6B3F27FF4F29
          20FF4F2920FF643926FFB97A3BFFB97A3BFFB8793AFFB8793AFF88552FFF4F29
          20FF4F2920FF88542FFFB97A3BFF6B3F27FF4F2920FF4F2920FF4F2920FF4F29
          20FF4F2920FF4F2920FFB97A3BFFB87A3AFFC0833FFFB37B40FF43231BCE0502
          020F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000291511858D5C34FFCA8C
          44FFBA7B3CFFBA7B3CFFBA7B3CFFBA7B3CFFBA7B3CFFBA7B3CFFBA7C3CFFBA7B
          3CFFBA7B3CFFBA7B3CFFBA7B3BFFBA7B3CFFBA7B3CFFBA7B3CFFBA7B3CFFBA7B
          3CFFBA7B3CFFBA7B3CFFBA7C3CFFBA7C3CFFBA7B3CFFBA7B3CFFBA7B3CFFBA7B
          3CFFBA7B3CFFBA7B3CFFBA7B3CFFBA7B3BFFBA7B3CFFBA7B3CFFBA7B3CFFBA7B
          3CFFCA8C45FF8D5C34FF29151185000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000120907395D3624EBBC8242FFC28440FFBC7D3CFFBC7E3DFFBC7D
          3DFFBC7D3DFFBC7D3DFFBC7D3CFFBC7D3DFFBC7D3DFFBC7D3DFFBC7D3DFFBC7D
          3DFFBC7E3DFFBC7D3DFFBC7D3DFFBB7D3DFFBC7D3DFFBC7D3DFFBC7D3DFFBC7E
          3DFFBB7D3DFFBC7D3DFFBC7D3DFFBB7D3DFFBC7D3DFFBC7D3DFFBC7D3CFFBC7D
          3CFFBB7D3DFFBC7D3DFFBC7D3DFFC28440FFBC8242FF5D3624EB120907390000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000002C17128E8D5C
          34FFCC8E46FFBE803EFFBE7F3EFFBE7F3EFFBE7F3EFFBE7F3EFFBE7F3EFFBE7F
          3EFFBE7F3EFFBE7F3EFFBD7F3EFFBD7F3EFFBE7F3EFFBE7F3EFFBD7F3EFFBE7F
          3EFFBE7F3EFFBE7F3DFFBE7F3EFFBE7F3EFFBE7F3EFFBD7F3EFFBE7F3DFFBE7F
          3EFFBE7F3EFFBE7F3EFFBE7F3EFFBE7F3EFFBE7F3EFFBE7F3EFFBE803EFFCC8E
          46FF8D5C34FF2C17128E00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000100806334F2D1FD4AB753DFFC88943FFC0813FFFBF81
          3FFFC0813FFFC0813FFFC0813FFFC0813FFFC0813FFFBF803FFFBF813FFFC081
          3FFFC0813FFFC0813FFFBF813EFFC0813FFFBF813EFFC0813FFFBF813EFFBF80
          3FFFBF813EFFC0813FFFC0813FFFBF813EFFBF813EFFBF813FFFC0813FFFBF81
          3EFFBF813EFFC0813FFFC88A43FFAB753DFF4F2D1FD410080633000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000002111
          0D6974472CFFBF8543FFC78843FFC18340FFC18240FFC18340FFC18240FFC183
          40FFC18340FFC18240FFC18340FFC18240FFC0823FFFC0833FFFC0833FFFC182
          40FFC1833FFFC18240FFC18340FFC18340FFC1823FFFC0833FFFC18340FFC082
          3FFFC18240FFC18240FFC1823FFFC18340FFC1823FFFC78843FFBF8543FF7447
          2CFF21110D690000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000012C17128E845431FFC78C46FFC788
          43FFC28541FFC28440FFC28440FFC28440FFC38440FFC28440FFC38441FFC384
          40FFC28441FFC38440FFC28441FFC28441FFC28440FFC38440FFC28440FFC285
          41FFC28541FFC28440FFC28541FFC38441FFC38441FFC38541FFC28440FFC384
          40FFC78843FFC78C46FF845431FF2C17128E0000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000804031B321A14A0885732FFC88D46FFC98A44FFC58641FFC48642FFC485
          42FFC48642FFC48541FFC48642FFC48541FFC48642FFC48541FFC48541FFC485
          41FFC48541FFC48541FFC48541FFC48642FFC48541FFC48541FFC48541FFC485
          41FFC48541FFC48541FFC48541FFC98A44FFC88D46FF885732FF321A14A00804
          031B000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000B060524321A14A08454
          31FFC08644FFCB8D46FFC58642FFC68742FFC68742FFC58642FFC58642FFC586
          42FFC68742FFC68742FFC68742FFC68742FFC58642FFC68742FFC58642FFC687
          42FFC68742FFC68742FFC58642FFC68742FFC68742FFC68743FFCC8D46FFC086
          44FF845431FF321A14A00B060524000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000804031B2C17128E74472CFFAB753DFFD09248FFCA8C
          45FFC78843FFC78843FFC78742FFC78743FFC78743FFC78743FFC78743FFC787
          43FFC78743FFC78743FFC78742FFC78843FFC78742FFC78843FFC78743FFC787
          42FFCA8B45FFD09248FFAB753DFF74472CFF2C17128E0804031B000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000121110D694F2D1FD48D5C34FFBD8343FFD09248FFCC8D46FFC88944FFC889
          44FFC88944FFC78844FFC88944FFC78843FFC78844FFC88843FFC88843FFC788
          43FFC88843FFC88843FFCC8D46FFD09248FFBD8343FF8D5C34FF4F2D1FD42111
          0D69000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000100806332C17128E5D36
          24EB8D5C34FFB37B40FFD19349FFD09148FFCE8F47FFCC8D46FFCA8B45FFC989
          44FFC98944FFCA8B45FFCC8D46FFCE8F47FFD09148FFD19349FFB37B40FF8D5C
          34FF5D3624EB2C17128E10080633000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000120907392915118543231BCE70452BFF8C5B
          34FFA36F3BFFB87F41FFC78C46FFD19349FFD19349FFC78C46FFB87F41FFA36F
          3BFF8C5B34FF70452BFF43231BCE291511851209073900000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000502020F160C094826140F7B341B15A73F2119CB48251DE74D28
          1FF94D281FF948251DE73F2119CB341B15A726140F7B160C09480502020F0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          B6250000424DB62500000000000036000000280000003C000000280000000100
          2000000000008025000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000604030F1B140E482D23
          177B3E2F1FA74B3926CB55412BE75C462FF95C462FF955412BE74B3926CB3E2F
          1FA72D23177B1B140E480604030F000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000001510
          0B39312619854E3D28CE7D6939FF988540FFAE9E47FFC1B14CFFCFC04FFFD8CA
          52FFD8CA52FFCFC04FFFC1B14CFFAE9E47FF988540FF7D6939FF4E3D28CE3126
          198515100B390000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000130E0A3334281B8E6A5832EB998640FFBDAD4BFFCDBE4CFFBFAE
          44FFB3A03DFFAA9539FFA18C34FF9C8731FF9D8732FFA28C34FFAA9439FFB4A1
          3DFFBFAE44FFCDBE4CFFBDAD4BFF998640FF6A5832EB34281B8E130E0A330000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000001271E14695A482AD4998640FFC2B2
          4BFFC2B145FFAF9B3BFF9D8732FF9C8631FF9B8531FF9C8631FF9C8631FF9C86
          31FF9C8631FF9C8531FF9C8631FF9B8531FF9C8630FF9D8732FFAF9B3BFFC2B2
          46FFC2B24BFF998640FF5A482AD4271E14690000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000A08051B3428
          1B8E816D3AFFB5A548FFC5B347FFAE9A3AFF9D8731FF9D8731FF9D8731FF9D87
          31FF9D8732FF9D8732FF9D8732FF9D8631FF9D8732FF9D8731FF9D8732FF9D87
          31FF9D8731FF9D8732FF9D8732FF9D8732FFAE9A3AFFC5B347FFB5A548FF816D
          3AFF34281B8E0A08051B00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000D0A07243B2D1EA08F7C3DFFC2B24BFFBAA741FF9E8832FF9D88
          32FF9D8932FF9D8832FF9E8832FF9D8832FF9D8832FF9D8832FF9D8932FF9E88
          32FF9D8832FF9D8832FF9D8832FF9D8832FF9D8832FF9D8832FF9D8832FF9D88
          32FF9E8832FF9E8832FFBAA741FFC2B24BFF8F7C3DFF3B2D1EA00D0A07240000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000A08051B3B2D1EA094813FFFC7B7
          4AFFB29F3DFF9F8A32FF9F8A32FF9F8932FF9F8A32FF9F8932FF9F8932FF9F89
          32FF9F8932FF9F8932FF9E8932FF9F8932FF9F8932FF9F8932FF9F8A32FF9F8A
          32FF9F8A32FF9F8932FF9F8A32FF9F8A32FF9E8832FF9F8A32FF9E8832FFB29F
          3DFFC7B74AFF94813FFF3B2D1EA00A08051B0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000134281B8E8F7C3DFFC7B74AFFB09C3CFFA18B33FFA18B33FFA08B32FFA08B
          32FFA18B33FFA18B33FFA08B33FFA08B33FFA18B33FFA18B33FFA08B33FFA18B
          33FFA18B33FFA08B32FFA18B33FFA18B33FFA08B33FFA08B33FFA08B32FFA08B
          32FFA18B33FFA08B33FFA18B33FFA18B33FFB19D3CFFC7B74AFF8F7C3DFF3428
          1B8E000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000271E1469816D3AFFC3B34BFFB4A13DFFA28C
          34FFA28D34FFA28D34FFA28C34FFA28D34FFA28D34FFA28D34FFA28D34FFA28C
          34FFA28D34FFA28D34FFA38C35FFA28C34FFA28D34FFA38C35FFA28C34FFA28C
          34FFA28D34FFA28D34FFA38D34FFA28C34FFA28C34FFA28C34FFA28C34FFA28C
          34FFA28D34FFB4A13DFFC3B34BFF816D3AFF271E146900000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000130E0A335A48
          2AD4B5A548FFBCAA42FFA38E35FFA38E35FFA38E35FFA38E35FFA38E35FFA38E
          35FFA38E35FFA38E35FFA38E35FFA38E35FFA38E35FFA38E35FFA38E35FFA38E
          35FFA38E35FFA38E35FFA38E35FFA38E35FFA38E35FFA38E35FFA38E35FFA38E
          35FFA38E35FFA38E35FFA38E35FFA38E35FFA38E35FFA38E35FFBCAA43FFB5A5
          48FF5A482AD4130E0A3300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000034281B8E998640FFC7B748FFA59037FFA59036FFA590
          36FFA59036FFA59036FFA59036FFA59036FFA58F36FFA59036FFA48F36FFA590
          36FFA48F36FFA59036FFA59036FFA48F36FFA59036FFA58F36FFA58F36FFA58F
          37FFA58F36FFA59036FFA59036FFA59036FFA48F36FFA59036FFA59036FFA590
          36FFA59036FFA59036FFA69137FFC7B748FF998640FF34281B8E000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000015100B396A5832EBC2B3
          4BFFB5A03EFFA69137FFA79237FFA69137FFA79137FFA79237FFA79237FFA691
          37FFA79238FFA79137FFA69137FFA69137FFA79237FFA79237FFA79137FFA792
          37FFA79237FFA69137FFA79237FFA79237FFA79237FFA69137FFA79237FFA791
          37FFA69137FFA69137FFA69137FFA79238FFA79237FFA79238FFA79237FFB5A2
          3EFFC2B34BFF6A5832EB15100B39000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000031261985998640FFC7B648FFA99338FFA99338FFA99338FFA993
          38FFA99338FFA99338FFA89338FFA99338FFA99338FFA99338FFA99338FFA893
          38FFA99338FFA99338FFA99338FFA99338FFA99338FFA99338FFA99338FFA993
          38FFA99338FFA89338FFA99338FFA99338FFA99338FFA99338FFA99338FFA993
          38FFA99338FFA99338FFA89338FFA89338FFC7B648FF998640FF312619850000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000604030F4E3D28CEBDAD4BFFB9A6
          41FFAA9439FFAA9539FFAA9539FFAA9539FFD4C25FFFF0DF79FFF0DF79FFC6B2
          53FFAA9539FFAA9539FFAA9539FFAA9539FFAA9539FFAA9539FFCFBD5AFFF0DF
          79FFF0DF79FFE2D16CFFAA9539FFAA9439FFAA9539FFAA9539FFAA9539FFAA95
          39FFAA9539FFAA9439FFAA9539FFAA9539FFAA9539FFAA9539FFAA9539FFAA95
          39FFB9A641FFBDAD4BFF4E3D28CE0604030F0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00001B140E487D6939FFD1C24EFFAD973AFFAC9739FFAC9639FFAC9639FFAB96
          39FFDCCF54FFE1D74CFFE1D74CFFD2C250FFAB9639FFAC9639FFAC9639FFAC97
          39FFAC9739FFAC9739FFE4D75CFFE1D74CFFE1D74CFFE5D955FFB9A546FFAC96
          39FFAB9639FFAB9639FFAB9739FFAC9639FFAC9739FFAC9739FFAC9639FFAB97
          39FFAC9639FFAC9639FFAC9739FFAC9739FFAD983AFFD1C24EFF7D6939FF1B14
          0E48000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002D23177B988540FFC7B748FFAD98
          3AFFAD983AFFAD983AFFAD993AFFAD983AFFD5C853FFE1D74CFFE1D74CFFC7B7
          4FFFAD993AFFAD983AFFAD993AFFAD993AFFAD983AFFBBA646FFE4D952FFE1D7
          4CFFE1D74CFFE1D74CFFD0BF55FFAD993AFFAD993AFFAD993AFFAD983AFFAD98
          3AFFCCB958FFF0DF79FFF0DF79FFF0DF79FFD5C35FFFB29E3FFFAD983AFFAD98
          3AFFAD993AFFC7B748FF988540FF2D23177B0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00003E2F1FA7AE9E47FFC0AE45FFAF9A3BFFAF9A3BFFAF9A3BFFAF9A3BFFAF9A
          3BFFD5C754FFE1D74CFFE1D74CFFC8B74FFFAF9A3BFFAF9A3BFFAF9A3BFFAF9A
          3BFFAF9A3BFFD4C459FFE1D74CFFE1D74CFFE1D74CFFE1D74CFFE1D35DFFAF9A
          3BFFAF9A3BFFAF9A3BFFAF9A3BFFD2C05CFFE4D663FFD6C849FFD6C849FFD6C8
          49FFE0D25CFFE2D16BFFAF9A3BFFAF9A3BFFAF9A3BFFC0AE45FFAE9E47FF3E2F
          1FA7000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000004B3926CBC1B14CFFBBA841FFB09C
          3CFFB19D3CFFB09C3CFFB09B3DFFB09B3CFFD5C754FFE1D74CFFE1D74CFFC8B8
          50FFB19C3CFFB09C3CFFB19C3DFFB19C3CFFB09C3CFFE3D55DFFE1D74CFFE1D7
          4CFFE1D74CFFE1D74CFFE5D955FFBEAA48FFB09B3CFFB19C3CFFB5A040FFE2D3
          60FFD6C849FFCCBD4CFF5E4830FFB1A145FFD6C849FFDBCE53FFC6B350FFB09B
          3CFFB09C3CFFBBA842FFC1B14CFF4B3926CB0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000055412BE7CFC04FFFB7A340FFB29F3DFFB39F3DFFB39E3DFFB39E3DFFB39F
          3DFFD6C854FFE1D74CFFE1D74CFFC8B850FFB39E3DFFB39E3DFFB39F3DFFB39E
          3DFFBFAC49FFE4D952FFE1D74CFFDFD44EFFCCBE4CFFE1D74CFFE1D74CFFD3C2
          57FFB39F3DFFB29D3EFFC8B651FFD6C849FFD6C849FFB1A047FFB39E3EFF9D8A
          40FFD6C849FFD6C849FFD1C054FFB39F3DFFB39E3EFFB7A440FFCFC04FFF5541
          2BE7000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000005C462FF9D8CA52FFB5A13FFFB5A0
          3FFFB5A03EFFB5A03EFFB5A03EFFB5A03EFFD6C854FFE1D74CFFE1D74CFFC8B8
          50FFB5A03EFFB5A03EFFB5A03EFFB5A03EFFD7C55AFFE1D74CFFE1D74CFFCABD
          4DFF9F8E3FFFE1D74CFFE1D74CFFE1D45DFFB5A03FFFB5A03EFFCDBD51FFD6C8
          49FFD6C849FFB3A249FFB5A03EFFB7A449FFD6C849FFD6C849FFC8B74FFFB5A0
          3EFFB5A03FFFB5A040FFD8CA52FF5C462FF90000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00005C462FF9D8CA52FFB7A440FFB6A33FFFB6A240FFB7A240FFB6A23FFFB6A3
          3FFFD6C854FFE1D74CFFE1D74CFFC9B950FFB6A33FFFB6A240FFB6A33FFFB6A2
          40FFE3D55DFFE1D74CFFE1D74CFFA99841FF9E8A3BFFE1D74CFFE1D74CFFE5D9
          55FFC2AD4BFFB6A240FFC2B24CFFD6C849FFD6C849FFC1AF4EFFB6A33FFFD5C4
          5DFFD6C849FFD6C849FFB2A044FFB6A23FFFB6A33FFFB7A340FFD8CA52FF5C46
          2FF9000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000055412BE7CFC04FFFBCA942FFB8A5
          41FFB9A541FFB9A441FFB8A441FFB9A541FFD6C954FFE1D74CFFE1D74CFFC9BA
          50FFB9A541FFB9A541FFB8A441FFC4B04CFFE4D952FFE1D74CFFE1D74CFF9986
          3BFFB39F40FFCDBE4DFFE1D74CFFE1D74CFFD5C458FFB8A541FFB6A448FFD6C8
          49FFD6C849FFD5C55BFFEDDC76FFE0D25CFFD6C849FFD0C348FF9D8A3CFFB8A5
          41FFB9A541FFBCA942FFCFC04FFF55412BE70000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00004B3926CBC1B14CFFC1AF46FFBAA642FFBAA741FFBBA741FFBBA741FFBBA7
          41FFD6C954FFE1D74CFFE1D74CFFCABA51FFBBA741FFBBA642FFBBA642FFD9C8
          5BFFE1D74CFFE1D74CFFD1C44EFFB4A040FFBBA642FFB0A043FFE1D74CFFE1D7
          4CFFE2D45EFFBBA741FFA8953FFFD6C849FFD6C849FFD2C350FFD4C649FFD6C8
          49FFC6B746FF826F37FFAE9A40FFBBA741FFBBA741FFC1AF46FFC1B14CFF4B39
          26CB000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003E2F1FA7AE9E47FFC7B748FFBCA9
          43FFBCA943FFBCA943FFBCA943FFBCA943FFD6C954FFE1D74CFFE1D74CFFCABB
          51FFBCA942FFBCA942FFBCA943FFE4D65DFFE1D74CFFE1D74CFFB1A145FFBCA9
          43FFBCA943FF96823BFFE1D74CFFE1D74CFFE5D955FFC7B44EFFA9953FFFBBAC
          45FFD6C849FFE2D360FF937E49FF5E4830FF6B5532FFA38F3DFFBCA942FFBCA9
          42FFBCA942FFC7B748FFAE9E47FF3E2F1FA70000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00002D23177B988540FFCFBE4DFFBEAB44FFBEAC44FFF0DF79FFF0DF79FFF0DF
          79FFE7DA5EFFE1D74CFFE1D74CFFEBDD67FFF0DF79FFF0DF79FFE3D26BFFE4D9
          52FFE1D74CFFE1D74CFF9C893EFFBFAC44FFBEAB44FFB7A541FFD5C84DFFE1D7
          4CFFE1D74CFFD8C759FFBEAB43FF857138FFCFC148FFD6C849FFE7D769FFF0DF
          79FFF0DF79FFDCCB64FFBEAB44FFBFAC44FFBFAC44FFCEBE4DFF988540FF2D23
          177B000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000001B140E487D6939FFD5C64FFFC1AE
          44FFC0AD45FFE1D74CFFE1D74CFFE1D74CFFE1D74CFFE1D74CFFE1D74CFFE1D7
          4CFFE1D74CFFE1D74CFFD8CB4AFFE1D74CFFE1D74CFFC7BB47FFB3A042FFC0AC
          44FFC0AC45FFC0AE45FFA6963FFFE1D74CFFE1D74CFFC5B646FFC0AD45FFB3A0
          42FF735F34FF95843CFFD6C849FFD6C849FFD6C849FFCCBD48FFC0AD45FFC0AD
          45FFC0AD45FFD5C64FFF7D6939FF1B140E480000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000604030F4E3D28CEBDAD4BFFC9B849FFC1AE45FF5E4830FF5E4830FF5E48
          30FF5E4830FF5E4830FF5E4830FF5E4830FF5E4830FF5E4830FF786335FF5E48
          30FF5E4830FF725D34FFC1AE46FFC1AE46FFC1AE46FFC1AE45FF947F3CFF5E48
          30FF5E4830FF947F3CFFC1AE46FFC1AE46FFB5A143FF947F3CFF5E4830FF5E48
          30FF5E4830FF867239FFC1AE46FFC1AF46FFC9B749FFBDAD4BFF4E3D28CE0604
          030F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000031261985998640FFD2C3
          4EFFC3B147FFC3B147FFC3B147FFC3B147FFC3B147FFC3B147FFC3B147FFC3B1
          47FFC3B147FFC2B047FFC3B146FFC3B147FFC3B147FFC3B147FFC2B047FFC3B1
          47FFC3B147FFC3B147FFC3B147FFC3B147FFC2B047FFC2B047FFC2B047FFC3B1
          47FFC3B147FFC3B147FFC3B147FFC3B146FFC3B147FFC2B047FFC3B147FFC3B1
          47FFD2C24EFF998640FF31261985000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000015100B396A5832EBC5B54DFFCBB94BFFC5B247FFC5B347FFC5B2
          47FFC5B247FFC5B247FFC5B247FFC5B247FFC5B247FFC5B247FFC5B247FFC5B2
          47FFC5B347FFC5B247FFC5B247FFC4B247FFC5B247FFC5B247FFC5B247FFC5B3
          47FFC4B247FFC5B247FFC5B247FFC4B247FFC5B247FFC5B247FFC5B247FFC5B2
          47FFC4B247FFC5B247FFC5B247FFCBB94BFFC5B54DFF6A5832EB15100B390000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000034281B8E9986
          40FFD3C44FFFC7B548FFC7B448FFC7B448FFC7B448FFC7B448FFC7B448FFC7B4
          48FFC7B448FFC7B448FFC6B448FFC6B448FFC7B448FFC7B448FFC6B448FFC7B4
          48FFC7B448FFC7B447FFC7B448FFC7B448FFC7B448FFC6B448FFC7B447FFC7B4
          48FFC7B448FFC7B448FFC7B448FFC7B448FFC7B448FFC7B448FFC7B548FFD3C4
          4FFF998640FF34281B8E00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000130E0A335A482AD4B5A548FFD1C04EFFC8B749FFC7B5
          49FFC8B749FFC8B749FFC8B749FFC8B649FFC8B649FFC7B549FFC7B549FFC8B6
          49FFC8B649FFC8B749FFC8B648FFC8B649FFC8B648FFC8B749FFC8B648FFC7B5
          49FFC8B648FFC8B749FFC8B749FFC8B648FFC8B648FFC7B549FFC8B749FFC7B6
          48FFC8B648FFC8B649FFD1C04EFFB5A548FF5A482AD4130E0A33000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000271E
          1469816D3AFFC8B94DFFD0BF4EFFCAB74AFFC9B84AFFCAB74AFFCAB74AFFC9B8
          4AFFCAB74AFFC9B84AFFCAB74AFFC9B84AFFC9B749FFC9B749FFC9B749FFCAB7
          4AFFCAB74AFFCAB74AFFC9B84AFFCAB74AFFCAB74AFFC9B749FFCAB74AFFC9B7
          49FFCAB74AFFC9B84AFFCAB74AFFCAB74AFFCAB74AFFD0BF4EFFC8B94DFF816D
          3AFF271E14690000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000134281B8E8F7C3DFFD0C150FFD0BF
          4EFFCBB94BFFCBB84BFFCBB84BFFCBB84BFFCCBA4BFFCBB84BFFCCB94CFFCCBA
          4BFFCBB84BFFCCBA4BFFCBB84BFFCBB84BFFCBB84BFFCCBA4BFFCBB84BFFCBB9
          4BFFCBB94BFFCBB84BFFCBB94BFFCCB94CFFCCB94CFFCCB94CFFCBB84BFFCCBA
          4BFFD0BF4EFFD0C150FF8F7C3DFF34281B8E0000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000A08051B3B2D1EA094813FFFD1C350FFD2C14EFFCDBB4CFFCDBA4DFFCDBA
          4DFFCDBA4DFFCDBB4CFFCDBA4DFFCDBB4CFFCDBA4DFFCDBB4CFFCDBB4CFFCDBB
          4CFFCDBB4CFFCDBB4CFFCDBB4CFFCDBA4DFFCDBB4CFFCDBB4CFFCDBB4CFFCDBB
          4CFFCDBB4CFFCDBB4CFFCDBB4CFFD2C14EFFD1C350FF94813FFF3B2D1EA00A08
          051B000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000D0A07243B2D1EA08F7C
          3DFFC9BA4EFFD3C34FFFCDBC4DFFCEBC4DFFCEBC4DFFCDBC4DFFCDBC4DFFCDBC
          4DFFCEBC4DFFCEBC4DFFCEBC4DFFCEBC4DFFCDBC4DFFCEBC4DFFCDBC4DFFCEBC
          4DFFCEBC4DFFCEBC4DFFCDBC4DFFCEBD4DFFCEBC4DFFCEBC4EFFD3C34FFFC9BA
          4EFF8F7C3DFF3B2D1EA00D0A0724000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000A08051B34281B8E816D3AFFB5A548FFD7C851FFD3C2
          4FFFD0BF4EFFCFBE4EFFCFBE4DFFCFBD4EFFCFBD4EFFD0BF4EFFCFBD4EFFD0BF
          4EFFD0BF4EFFCFBD4EFFCFBE4DFFCFBE4EFFCFBE4DFFCFBE4EFFCFBD4EFFD0BE
          4DFFD3C24FFFD7C851FFB5A548FF816D3AFF34281B8E0A08051B000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001271E14695A482AD4998640FFC6B64DFFD7C851FFD3C24FFFD1BF4EFFD1BF
          4EFFD1BF4EFFD0BF4EFFD1BF4EFFD0BF4EFFD0BF4EFFD1C04EFFD1C04EFFD0BF
          4EFFD1C04EFFD1BF4EFFD3C34FFFD7C851FFC6B64DFF998640FF5A482AD4271E
          1469000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000130E0A3334281B8E6A58
          32EB998640FFBDAD4BFFD9CA52FFD7C751FFD5C550FFD3C24FFFD3C24FFFD2C0
          4EFFD2C04EFFD3C24FFFD3C24FFFD5C550FFD7C751FFD9CA52FFBDAD4BFF9986
          40FF6A5832EB34281B8E130E0A33000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000015100B39312619854E3D28CE7D6939FF9885
          40FFAE9E47FFC1B14CFFCFC04FFFD8CA52FFD8CA52FFCFC04FFFC1B14CFFAE9E
          47FF988540FF7D6939FF4E3D28CE3126198515100B3900000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000604030F1B140E482D23177B3E2F1FA74B3926CB55412BE75C46
          2FF95C462FF955412BE74B3926CB3E2F1FA72D23177B1B140E480604030F0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          B6250000424DB62500000000000036000000280000003C000000280000000100
          2000000000008025000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000306040F101C13481B30
          207B25412CA72D4F35CB335A3DE7376141F9376141F9335A3DE72D4F35CB2541
          2CA71B30207B101C13480306040F000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000D16
          0F391D3423852E5239CE41805DFF499973FF50AE87FF55C095FF59CEA2FF5CD7
          A9FF5CD7A9FF59CEA2FF55C095FF50AE87FF499973FF41805DFF2E5239CE1D34
          23850D160F390000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000B140D331F37258E3A6E4EEB499A74FF54BC92FF55CC9EFF4DBF
          91FF47B386FF42AA7CFF3EA274FF3B9D70FF3B9E70FF3EA374FF42AA7BFF47B4
          86FF4DBF91FF55CC9EFF54BC92FF499A74FF3A6E4EEB1F37258E0B140D330000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000117291C69325D41D4499A74FF54C1
          96FF4FC294FF45AF81FF3B9E70FF3B9D6FFF3B9C6EFF3B9D6FFF3B9D6FFF3B9D
          6FFF3B9D6FFF3B9D6EFF3B9D6FFF3B9C6FFF3A9D6FFF3B9F70FF45AF81FF50C2
          94FF54C196FF499A74FF325D41D417291C690000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000060A071B1F37
          258E428461FF51B58CFF51C496FF44AE80FF3B9E70FF3B9E70FF3B9E70FF3B9E
          70FF3B9E70FF3B9E70FF3B9E70FF3B9E6FFF3B9E70FF3B9E70FF3B9E70FF3B9E
          70FF3B9E70FF3B9E70FF3B9E70FF3B9F70FF44AE80FF51C496FF51B58CFF4284
          61FF1F37258E060A071B00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000080E0924233E2AA047926DFF54C297FF4AB98AFF3C9F71FF3B9F
          71FF3B9F71FF3B9F71FF3B9F71FF3B9F71FF3B9F71FF3B9F71FF3B9F71FF3C9F
          71FF3B9F71FF3B9F71FF3B9F71FF3B9F71FF3B9F71FF3B9F71FF3B9F71FF3B9F
          71FF3B9F71FF3C9F71FF4AB98AFF54C297FF47926DFF233E2AA0080E09240000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000060A071B233E2AA0479570FF54C6
          99FF46B284FF3CA072FF3CA072FF3CA071FF3CA072FF3BA071FF3BA071FF3CA0
          71FF3CA071FF3CA071FF3C9F72FF3BA071FF3CA071FF3CA071FF3CA072FF3CA0
          72FF3CA072FF3BA071FF3CA072FF3CA072FF3B9F71FF3CA072FF3C9F71FF46B2
          84FF54C699FF479570FF233E2AA0060A071B0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00011F37258E47926DFF54C69AFF46B182FF3DA273FF3DA273FF3CA173FF3CA1
          73FF3DA273FF3DA273FF3DA173FF3DA173FF3DA273FF3DA273FF3DA173FF3DA2
          73FF3DA273FF3CA173FF3DA273FF3DA273FF3DA173FF3DA173FF3CA173FF3CA1
          73FF3DA273FF3DA173FF3DA273FF3DA273FF46B183FF54C69AFF47926DFF1F37
          258E000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000017291C69428461FF54C397FF47B486FF3EA3
          74FF3EA375FF3EA376FF3EA374FF3EA375FF3EA376FF3EA376FF3EA376FF3EA3
          74FF3EA375FF3EA376FF3FA474FF3EA374FF3EA376FF3FA474FF3EA374FF3EA3
          74FF3EA376FF3EA376FF3EA475FF3EA374FF3EA374FF3EA374FF3EA374FF3EA3
          74FF3EA376FF47B486FF54C397FF428461FF17291C6900000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000B140D33325D
          41D451B58CFF4CBB8DFF3FA476FF3FA476FF3FA476FF3FA476FF3FA476FF3FA4
          76FF3FA476FF3FA476FF3FA476FF3FA476FF3FA475FF3FA476FF3FA476FF3FA4
          76FF3FA475FF3FA476FF3FA475FF3FA476FF3FA476FF3FA476FF3FA476FF3FA4
          76FF3FA476FF3FA475FF3FA475FF3FA476FF3FA476FF3FA475FF4CBB8DFF51B5
          8CFF325D41D40B140D3300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000001F37258E499A74FF52C799FF41A678FF40A677FF40A6
          77FF40A677FF40A677FF40A677FF40A677FF40A677FF40A677FF40A577FF40A6
          77FF40A577FF40A677FF40A677FF40A576FF40A677FF40A677FF40A677FF41A6
          76FF40A677FF40A677FF40A677FF40A677FF40A577FF40A677FF40A677FF40A6
          77FF40A677FF40A677FF41A778FF52C799FF499A74FF1F37258E000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000D160F393A6E4EEB55C2
          97FF48B586FF41A779FF41A879FF41A779FF41A879FF41A879FF41A879FF41A7
          79FF41A879FF41A879FF41A778FF41A778FF41A879FF41A879FF41A879FF41A8
          79FF41A879FF41A778FF41A879FF41A879FF41A879FF41A778FF41A879FF41A8
          79FF41A779FF41A778FF41A779FF41A879FF41A879FF41A879FF41A879FF48B5
          87FF55C297FF3A6E4EEB0D160F39000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000001D342385499A74FF52C698FF41A97AFF41A97AFF41A97AFF41A9
          7BFF41A97BFF41A97AFF41A97AFF41A97AFF41A97AFF41A97AFF41A97BFF41A9
          7BFF41A97BFF41A97BFF41A97BFF41A97AFF41A97BFF41A97BFF41A97BFF41A9
          7BFF41A97AFF41A97BFF41A97AFF41A97BFF41A97AFF41A97AFF41A97AFF41A9
          7BFF41A97BFF41A97BFF41A97AFF41A97BFF52C698FF499A74FF1D3423850000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000306040F2E5239CE54BC92FF4AB9
          8BFF42AA7BFF42AA7CFF42AA7BFF42AA7BFF67D3A5FF81EEC2FF81EEC2FF5BC5
          97FF42AA7BFF42AA7CFF42AA7BFF42AA7CFF42AA7BFF42AA7BFF63CFA1FF81EE
          C2FF81EEC2FF74E1B5FF42AA7CFF42AA7BFF42AA7BFF42AA7BFF42AA7BFF42AA
          7BFF42AA7CFF42AA7BFF42AA7BFF42AA7CFF42AA7BFF42AA7BFF42AA7CFF42AA
          7CFF4AB98BFF54BC92FF2E5239CE0306040F0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000101C134841805DFF57CFA1FF44AC7EFF43AC7EFF43AC7DFF43AC7DFF43AB
          7DFF5DDAACFF56DFB2FF56DFB2FF59D0A2FF43AB7DFF43AC7DFF43AC7DFF43AC
          7EFF43AC7EFF43AC7EFF66E2B5FF56DFB2FF56DFB2FF5EE2B5FF50B98BFF43AC
          7DFF43AB7DFF43AB7DFF43AB7DFF43AC7DFF43AC7EFF43AC7EFF43AC7DFF43AB
          7DFF43AC7DFF43AC7DFF43AC7EFF43AC7EFF44AC7EFF57CFA1FF41805DFF101C
          1348000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000001B30207B499973FF52C799FF44AD
          7FFF44AD7FFF44AD7FFF44AD7FFF44AD7FFF5CD3A7FF56DFB2FF56DFB2FF58C6
          9BFF44AD7FFF44AD7FFF44AD7FFF44AD7FFF44AD7FFF50BB8CFF5BE1B3FF56DF
          B2FF56DFB2FF56DFB2FF5ECFA2FF44AD7FFF44AD7FFF44AD7FFF44AD7FFF68D4
          A6FF81EEC2FF81EEC2FF4CB688FF44AD7FFF44AD7FFF44AD7FFF44AD7FFF44AD
          7FFF44AD7FFF52C799FF499973FF1B30207B0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000025412CA750AE87FF4EBF91FF45AF81FF45B081FF45AF81FF45B081FF45AF
          81FF5CD3A7FF56DFB2FF56DFB2FF58C79BFF45AF80FF45AF81FF45AF81FF45AF
          81FF45B080FF61D3A6FF56DFB2FF56DFB2FF56DFB2FF56DFB2FF66DFB1FF45AF
          80FF45AF80FF45AF80FF45AF80FF50C89AFF54D4A6FF54D4A6FF66D5A7FF45AF
          80FF45AF80FF45AF81FF45AF80FF45AF80FF45AF81FF4EBF91FF50AE87FF2541
          2CA7000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002D4F35CB55C095FF4BBA8BFF46B1
          82FF46B183FF46B182FF46B182FF46B182FF5CD3A7FF56DFB2FF56DFB2FF59C7
          9CFF46B181FF46B182FF46B183FF46B181FF46B182FF67E1B4FF56DFB2FF56DF
          B2FF56DFB2FF56DFB2FF5EE2B5FF52BE8FFF46B182FF46B181FF46B182FF418E
          67FF54D4A6FF54D4A6FF65DEB1FF4DB98AFF46B182FF46B182FF46B182FF46B1
          82FF46B182FF4CBB8DFF55C095FF2D4F35CB0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000335A3DE759CEA2FF49B788FF46B284FF47B384FF47B384FF47B384FF47B3
          84FF5CD4A7FF56DFB2FF56DFB2FF59C89CFF47B384FF47B384FF47B384FF47B3
          84FF53BF91FF5BE1B3FF56DFB2FF57DDAFFF55CBA0FF56DFB2FF56DFB2FF60D2
          A4FF47B384FF47B284FF47B384FF45A97BFF4CAD84FF54D4A6FF54D4A6FF66D6
          A8FF47B384FF47B383FF46B284FF47B384FF47B383FF49B789FF59CEA2FF335A
          3DE7000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000376141F95CD7A9FF49B687FF49B5
          86FF48B586FF48B586FF48B586FF48B586FF5CD4A7FF56DFB2FF56DFB2FF59C8
          9DFF48B586FF48B586FF48B586FF48B586FF64D6A8FF56DFB2FF56DFB2FF57C9
          9EFF49A079FF56DFB2FF56DFB2FF66DFB2FF49B586FF48B586FF48B586FF49B5
          86FF428F68FF54D4A6FF54D4A6FF65DEB1FF50BC8EFF48B586FF48B586FF48B5
          86FF49B586FF4AB687FF5CD7A9FF376141F90000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000376141F95CD7A9FF4AB789FF49B688FF4AB687FF4AB787FF49B688FF49B6
          88FF5CD4A7FF56DFB2FF56DFB2FF59C89CFF49B688FF4AB687FF49B688FF4AB6
          87FF67E1B4FF56DFB2FF56DFB2FF4AAA82FF449F75FF56DFB2FF56DFB2FF5EE2
          B5FF55C192FF4AB687FF49B787FF49B788FF47AC7EFF4CAD84FF54D4A6FF54D4
          A6FF67D8AAFF49B688FF49B688FF49B688FF49B688FF4AB789FF5CD7A9FF3761
          41F9000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000335A3DE759CEA2FF4CBB8CFF4BB8
          8AFF4BB98AFF4BB989FF4AB889FF4AB98AFF5CD4A7FF56DFB2FF56DFB2FF59C8
          9CFF4AB98AFF4BB98AFF4BB88AFF55C494FF5BE1B3FF56DFB2FF56DFB2FF449B
          73FF49B284FF57CCA0FF56DFB2FF56DFB2FF61D4A7FF4AB88AFF4BB88AFF4AB9
          8AFF4BB98AFF428F68FF54D4A6FF54D4A6FF65DEB1FF52C091FF4BB88AFF4AB8
          8AFF4BB98AFF4CBB8CFF59CEA2FF335A3DE70000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00002D4F35CB55C095FF4FC092FF4CBA8BFF4BBA8CFF4BBA8AFF4BBA8AFF4BBA
          8AFF5CD4A7FF56DFB2FF56DFB2FF5AC99CFF4BBA8AFF4CBB8BFF4CBB8BFF65D8
          AAFF56DFB2FF56DFB2FF57CFA2FF4AB486FF4CBB8BFF4CB087FF56DFB2FF56DF
          B2FF67E0B3FF4BBA8AFF4BBA8AFF4CBA8BFF4CBB8BFF49AE81FF4CAD84FF54D4
          A6FF54D4A6FF68D8AAFF4CBB8BFF4BBA8AFF4BBA8AFF4FC192FF55C095FF2D4F
          35CB000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000025412CA750AE87FF52C799FF4CBB
          8CFF4CBB8CFF4CBB8CFF4CBB8CFF4CBB8CFF5CD4A7FF56DFB2FF56DFB2FF5AC9
          9DFF4CBB8CFF4CBB8CFF4CBB8CFF67E2B5FF56DFB2FF56DFB2FF4EB288FF4CBB
          8CFF4CBB8CFF44986FFF56DFB2FF56DFB2FF5EE2B5FF57C698FF4CBB8CFF4CBB
          8CFF4CBB8CFF4CBB8CFF439169FF54D4A6FF54D4A6FF65DEB1FF53C293FF4CBB
          8CFF4CBB8CFF52C799FF50AE87FF25412CA70000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00001B30207B499973FF56CD9FFF4DBD8EFF4DBD8EFF81EEC2FF81EEC2FF81EE
          C2FF67E5B7FF56DFB2FF56DFB2FF70E8BBFF81EEC2FF81EEC2FF73E2B4FF5BE1
          B3FF56DFB2FF56DFB2FF469D74FF4DBE8EFF4DBD8EFF4BB789FF57D4A8FF56DF
          B2FF56DFB2FF62D7A9FF5BCA9CFF81EEC2FF81EEC2FF81EEC2FF81EEC2FF65DE
          B1FF54D4A6FF54D4A6FF5ACB9DFF4DBE8EFF4DBE8EFF56CD9FFF499973FF1B30
          207B000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000101C134841805DFF59D4A6FF4EC0
          91FF4EBF8FFF56DFB2FF56DFB2FF56DFB2FF56DFB2FF56DFB2FF56DFB2FF56DF
          B2FF56DFB2FF56DFB2FF54D7A8FF56DFB2FF56DFB2FF50C69CFF4BB386FF4DBF
          8FFF4EBF8FFF4EBF90FF49A77FFF56DFB2FF56DFB2FF50C498FF50C596FF54D4
          A6FF54D4A6FF54D4A6FF54D4A6FF54D4A6FF54D4A6FF54D4A6FF4DBC8EFF4EBF
          8FFF4EBF90FF59D4A6FF41805DFF101C13480000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000306040F2E5239CE54BC92FF53C99AFF4EC091FF386343FF386343FF3863
          43FF386343FF386343FF386343FF386343FF386343FF386343FF3F7C59FF3863
          43FF386343FF3D7552FF4FC191FF4FC191FF4FC091FF4EC091FF45956EFF3863
          43FF386343FF45956DFF4AA87DFF386343FF386343FF386343FF386343FF3863
          43FF386343FF386343FF4AA87DFF4FC092FF53C999FF54BC92FF2E5239CE0306
          040F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000001D342385499A74FF58D1
          A3FF51C394FF51C394FF51C394FF51C394FF51C394FF51C394FF51C394FF51C3
          94FF51C394FF50C293FF50C394FF51C394FF51C394FF51C394FF50C293FF51C3
          94FF51C394FF51C394FF51C394FF51C394FF50C293FF50C293FF50C293FF51C3
          94FF51C394FF51C394FF51C394FF50C394FF51C394FF50C293FF51C394FF51C3
          94FF58D1A3FF499A74FF1D342385000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000D160F393A6E4EEB56C599FF54CA9BFF51C494FF52C496FF52C4
          95FF52C495FF52C495FF51C494FF52C495FF52C495FF52C495FF52C495FF52C4
          95FF52C496FF52C495FF52C495FF52C495FF52C495FF52C495FF52C495FF52C4
          96FF52C495FF52C495FF52C495FF52C495FF52C495FF52C495FF51C494FF51C4
          94FF52C495FF52C495FF52C495FF54CA9BFF56C599FF3A6E4EEB0D160F390000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001F37258E499A
          74FF59D2A4FF52C698FF52C696FF52C696FF52C696FF52C696FF52C696FF52C6
          96FF52C696FF52C696FF52C597FF52C597FF52C696FF52C696FF52C597FF52C6
          96FF52C696FF52C697FF52C696FF52C696FF52C696FF52C597FF52C697FF52C6
          96FF52C696FF52C696FF52C696FF52C696FF52C696FF52C696FF52C698FF59D2
          A4FF499A74FF1F37258E00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000B140D33325D41D451B58CFF57CFA0FF53C899FF53C7
          99FF53C899FF53C899FF53C899FF53C898FF53C898FF53C797FF53C799FF53C8
          98FF53C898FF53C899FF52C899FF53C898FF52C899FF53C899FF52C899FF53C7
          97FF52C899FF53C899FF53C899FF52C899FF52C899FF53C799FF53C899FF52C7
          98FF52C899FF53C898FF57CFA0FF51B58CFF325D41D40B140D33000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000001729
          1C69428461FF56C79BFF57CE9FFF54C99AFF54C999FF54C99AFF54C999FF54C9
          99FF54C99AFF54C999FF54C99AFF54C999FF53C999FF53C999FF53C999FF54C9
          99FF53C999FF54C999FF54C999FF54C99AFF53C999FF53C999FF54C99AFF53C9
          99FF54C999FF54C999FF53C999FF54C99AFF53C999FF57CE9FFF56C79BFF4284
          61FF17291C690000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000011F37258E47926DFF59CFA2FF57CE
          9FFF55CA9BFF54CA9AFF54CA9AFF54CA9AFF54CA9BFF54CA9AFF55CB9AFF54CA
          9BFF55CA9BFF54CA9BFF55CA9BFF55CA9BFF54CA9AFF54CA9BFF54CA9AFF55CA
          9BFF55CA9BFF54CA9AFF55CA9BFF55CB9AFF55CB9AFF55CB9BFF54CA9AFF54CA
          9BFF57CE9FFF59CFA2FF47926DFF1F37258E0000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000060A071B233E2AA0479570FF59CFA3FF57D0A1FF55CC9CFF56CC9CFF56CC
          9BFF56CC9CFF55CB9CFF56CC9CFF55CB9CFF56CC9CFF55CB9CFF55CB9CFF55CB
          9CFF55CB9CFF55CB9CFF55CB9CFF56CC9CFF55CB9CFF55CB9CFF55CB9CFF55CB
          9CFF55CB9CFF55CB9CFF55CB9CFF57D0A1FF59CFA3FF479570FF233E2AA0060A
          071B000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000080E0924233E2AA04792
          6DFF57C89CFF59D2A3FF56CC9DFF56CD9DFF56CD9DFF56CC9DFF56CC9DFF56CC
          9DFF56CD9DFF56CD9DFF56CD9DFF56CD9DFF56CC9DFF56CD9DFF56CC9DFF56CD
          9DFF56CD9DFF56CD9DFF56CC9DFF56CD9EFF56CD9DFF57CD9EFF59D2A3FF57C8
          9CFF47926DFF233E2AA0080E0924000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000060A071B1F37258E428461FF51B58CFF5BD6A8FF58D1
          A2FF57CE9EFF57CD9EFF56CD9EFF57CD9EFF57CD9EFF57CE9EFF57CD9EFF57CE
          9EFF57CE9EFF57CD9EFF56CD9EFF57CD9EFF56CD9EFF57CD9EFF57CD9EFF56CE
          9EFF58D1A2FF5BD6A8FF51B58CFF428461FF1F37258E060A071B000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000117291C69325D41D4499A74FF56C59AFF5BD6A8FF59D2A3FF57CF9FFF57CF
          9FFF57CF9FFF57CEA0FF57CF9FFF57CE9FFF57CEA0FF57CF9FFF57CF9FFF57CE
          9FFF57CF9FFF57CF9EFF59D2A3FF5BD6A8FF56C59AFF499A74FF325D41D41729
          1C69000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000B140D331F37258E3A6E
          4EEB499A74FF54BC92FF5CD7A9FF5BD6A7FF5AD4A5FF59D2A3FF58D1A2FF57D0
          A0FF57D0A0FF58D1A2FF59D2A3FF5AD4A5FF5BD6A7FF5CD7A9FF54BC92FF499A
          74FF3A6E4EEB1F37258E0B140D33000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000D160F391D3423852E5239CE41805DFF4999
          73FF50AE87FF55C095FF59CEA2FF5CD7A9FF5CD7A9FF59CEA2FF55C095FF50AE
          87FF499973FF41805DFF2E5239CE1D3423850D160F3900000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000306040F101C13481B30207B25412CA72D4F35CB335A3DE73761
          41F9376141F9335A3DE72D4F35CB25412CA71B30207B101C13480306040F0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          B6250000424DB62500000000000036000000280000003C000000280000000100
          2000000000008025000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000303060F10101C481B1B
          307B242541A72C2D4FCB32345AE7363861F9363861F932345AE72C2D4FCB2425
          41A71B1B307B10101C480303060F000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000C0D
          16391D1E34852E2F53CE4A4082FF5A479AFF694EB0FF7553C2FF7F57D0FF855A
          D9FF855AD9FF7F57D0FF7553C2FF694EB0FF5A479AFF4A4082FF2E2F53CE1D1E
          34850C0D16390000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000B0B14331F20378E3F396FEB5B479BFF7352BDFF7A53CEFF6E4B
          C1FF6545B5FF5C40ABFF563DA4FF51399FFF523AA0FF553CA5FF5B40ABFF6545
          B6FF6E4BC1FF7A53CEFF7352BDFF5B479BFF3F396FEB1F20378E0B0B14330000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000011717296934315ED45B479BFF7552
          C3FF714DC4FF6143B1FF523AA0FF51399FFF50399EFF51399FFF51399FFF5139
          9FFF51399FFF50399FFF51399FFF51399EFF52399FFF523AA1FF6143B1FF714D
          C4FF7552C3FF5B479BFF34315ED4171729690000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000006060A1B1F20
          378E4C4185FF6E50B7FF744FC6FF6042B0FF523AA0FF523AA0FF523AA0FF523A
          A0FF523AA0FF523AA0FF523AA0FF513AA0FF523AA0FF523AA0FF523AA0FF523A
          A0FF523AA0FF523AA0FF523AA0FF523AA1FF6042B0FF744FC6FF6E50B7FF4C41
          85FF1F20378E06060A1B00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000008080E2423243EA0554593FF7552C4FF6948BBFF543BA1FF533A
          A1FF533AA1FF533AA1FF523AA1FF533AA1FF533AA1FF533AA1FF533AA1FF523B
          A1FF533AA1FF533AA1FF533AA1FF533AA1FF533AA1FF533AA1FF533AA1FF533A
          A1FF523AA1FF543BA1FF6948BBFF7552C4FF554593FF23243EA008080E240000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000006060A1B23243EA0584697FF7751
          C8FF6445B4FF543BA2FF543BA2FF533BA2FF543BA2FF533AA2FF533AA2FF533B
          A2FF533BA2FF533BA2FF543BA1FF533AA2FF533BA2FF533BA2FF543BA2FF543B
          A2FF543BA2FF533AA2FF543BA2FF543BA2FF533AA1FF543BA2FF543BA1FF6445
          B4FF7751C8FF584697FF23243EA006060A1B0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00011F20378E554593FF7751C8FF6144B3FF553CA4FF553CA4FF553BA3FF553B
          A3FF543BA4FF553CA4FF553CA3FF553CA3FF553CA4FF543BA4FF553CA3FF543B
          A4FF553CA4FF553BA3FF543BA4FF553CA4FF553CA3FF553CA3FF553BA3FF553B
          A3FF553CA4FF553CA3FF553CA4FF553CA4FF6144B3FF7751C8FF554593FF1F20
          378E000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000171729694C4185FF7552C5FF6545B6FF563D
          A5FF573DA5FF563CA5FF553CA5FF573DA5FF563CA5FF563CA5FF563CA5FF553C
          A5FF573DA5FF563CA5FF563DA6FF563DA5FF563CA5FF563DA6FF563DA5FF553C
          A5FF563CA5FF563CA5FF563CA6FF553CA5FF563DA5FF553CA5FF563DA5FF553C
          A5FF563CA5FF6545B6FF7552C5FF4C4185FF1717296900000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000B0B14333431
          5ED46E50B7FF6B4ABDFF563DA6FF563DA6FF563DA6FF563DA6FF563DA6FF563D
          A6FF563DA6FF563DA6FF563DA6FF563DA6FF573EA6FF563DA6FF563DA6FF563D
          A6FF573EA6FF563DA6FF573EA6FF563DA6FF563DA6FF563DA6FF563DA6FF563D
          A6FF563DA6FF573EA6FF573EA6FF563DA6FF563DA6FF573EA6FF6B4ABDFF6E50
          B7FF34315ED40B0B143300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000001F20378E5B479BFF7650C9FF583FA8FF583EA8FF583E
          A8FF583EA8FF583EA8FF583EA8FF583EA8FF583EA8FF583EA8FF573EA7FF583E
          A8FF573EA7FF583EA8FF583EA8FF573EA7FF583EA8FF583EA8FF583EA8FF583F
          A8FF583EA8FF583EA8FF583EA8FF583EA8FF573EA7FF583EA8FF583EA8FF583E
          A8FF583EA8FF583EA8FF593FA9FF7650C9FF5B479BFF1F20378E000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000C0D16393F396FEB7653
          C4FF6546B7FF593FA9FF5A3FAAFF593FA9FF583FAAFF5A3FAAFF5A3FAAFF593F
          A9FF5A3FAAFF583FAAFF593FA9FF593FA9FF5A3FAAFF5A3FAAFF583FAAFF5A3F
          AAFF5A3FAAFF593FA9FF5A3FAAFF5A3FAAFF5A3FAAFF593FA9FF5A3FAAFF583F
          AAFF593FA9FF593FA9FF593FA9FF5A3FAAFF5A3FAAFF5A3FAAFF5A3FAAFF6646
          B7FF7653C4FF3F396FEB0C0D1639000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000001D1E34855B479BFF7550C8FF5A3FAAFF5A3FAAFF5A3FAAFF5B3F
          AAFF5B3FAAFF5A3FAAFF5B3FAAFF5A3FAAFF5A3FAAFF5A3FAAFF5B3FAAFF5B3F
          AAFF5B3FAAFF5B3FAAFF5B3FAAFF5A3FAAFF5B3FAAFF5B3FAAFF5B3FAAFF5B3F
          AAFF5A3FAAFF5B3FAAFF5A3FAAFF5B3FAAFF5A3FAAFF5A3FAAFF5A3FAAFF5B3F
          AAFF5B3FAAFF5B3FAAFF5B3FAAFF5B3FAAFF7550C8FF5B479BFF1D1E34850000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000303060F2E2F53CE7352BDFF6A48
          BBFF5B40ABFF5C40ACFF5B40ACFF5B40ACFF8666D5FFA17FF0FFA17FF0FF7759
          C7FF5B40ACFF5C40ACFF5B40ACFF5C40ACFF5B40ACFF5B40ACFF8162D1FFA17F
          F0FFA17FF0FF9472E3FF5C40ABFF5B40ABFF5B40ACFF5B40ACFF5B40ACFF5B40
          ACFF5C40ACFF5B40ABFF5B40ACFF5C40ACFF5B40ACFF5B40ACFF5C40ACFF5C40
          ABFF6948BBFF7352BDFF2E2F53CE0303060F0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000010101C484A4082FF7D55D1FF5D42AEFF5E41AEFF5C41AEFF5C41AEFF5D41
          ADFF875BDDFF8853E1FF8853E1FF7E57D2FF5D41ADFF5C41AEFF5C41AEFF5E41
          AEFF5E41AEFF5E41AEFF9064E4FF8853E1FF8853E1FF8D5CE5FF6B4EBBFF5C41
          AEFF5D41ADFF5D41ADFF5E41ADFF5C41AEFF5E41AEFF5E41AEFF5C41AEFF5E41
          ADFF5C41AEFF5C41AEFF5E41AEFF5E41AEFF5F42AEFF7D55D1FF4A4082FF1010
          1C48000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000001B1B307B5A479AFF7550C9FF5E42
          AFFF5E42AFFF5E42AFFF5F42AFFF5E42AFFF825AD5FF8853E1FF8853E1FF7956
          C8FF5F42AFFF5E42AFFF5F42AFFF5F42AFFF5E42AFFF6B4EBDFF8B59E4FF8853
          E1FF8853E1FF8853E1FF7F5CD1FF5F42AFFF5F42AFFF5F42AFFF5E42AFFF6F52
          C1FF906FDFFFA17FF0FFA17FF0FFA17FF0FF8767D6FF6B4EBDFF5E42AFFF5E42
          AFFF5F42AFFF7550C9FF5A479AFF1B1B307B0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000242541A7694EB0FF6E4CC1FF6043B1FF6043B2FF6043B1FF6043B2FF6043
          B1FF835AD5FF8853E1FF8853E1FF7956C9FF6043B1FF6043B1FF6043B1FF6043
          B1FF6043B2FF845FD5FF8853E1FF8853E1FF8853E1FF8853E1FF8D64E1FF6043
          B1FF6043B1FF6043B1FF6C4EBDFF9872E9FF885DDDFF7F51D6FF7F51D6FF7F51
          D6FF8C63E0FF9672E7FF684AB9FF6043B1FF6043B1FF6E4CC1FF694EB0FF2425
          41A7000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002C2D4FCB7553C2FF6A49BCFF6144
          B3FF6144B3FF6144B3FF6144B3FF6144B3FF835AD5FF8853E1FF8853E1FF7A57
          C9FF6144B3FF6144B3FF6144B3FF6144B3FF6144B3FF8F64E3FF8853E1FF8853
          E1FF8853E1FF8853E1FF8D5CE5FF6E50C0FF6144B3FF6144B3FF825FD3FF7F51
          D6FF7F51D6FF544291FF373963FF6147A5FF7F51D6FF8154D8FF7F5ED1FF6144
          B3FF6144B3FF6A4ABDFF7553C2FF2C2D4FCB0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000032345AE77F57D0FF6647B9FF6445B4FF6345B5FF6345B5FF6345B5FF6345
          B5FF845AD6FF8853E1FF8853E1FF7A57CAFF6345B5FF6345B5FF6345B5FF6345
          B5FF7051C1FF8B59E4FF8853E1FF8755E0FF7C53CDFF8853E1FF8853E1FF815E
          D4FF6345B5FF6245B4FF7D58D0FF7F51D6FF7F51D6FF514094FF6346B5FF5544
          95FF7F51D6FF7F51D6FF7E59D0FF6345B5FF6346B5FF6747B9FF7F57D0FF3234
          5AE7000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000363861F9855AD9FF6547B8FF6547
          B7FF6546B7FF6546B7FF6546B7FF6546B7FF845AD6FF8853E1FF8853E1FF7B57
          CAFF6546B7FF6546B7FF6546B7FF6546B7FF8561D8FF8853E1FF8853E1FF7B54
          CBFF5F47A1FF8853E1FF8853E1FF8E64E1FF6547B7FF6546B7FF6A4CB5FF7F51
          D6FF7F51D6FF8161D1FF8161D1FF8867D7FF7F51D6FF7F51D6FF684AB4FF6546
          B7FF6547B7FF6548B8FF855AD9FF363861F90000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000363861F9855AD9FF6748B9FF6647B8FF6648B8FF6648B9FF6547B8FF6647
          B8FF845AD6FF8853E1FF8853E1FF7A57CAFF6647B8FF6648B8FF6647B8FF6648
          B8FF8F64E3FF8853E1FF8853E1FF6448ABFF5A43A1FF8853E1FF8853E1FF8D5C
          E5FF7153C3FF6648B8FF56429AFF7F51D6FF7F51D6FF9169E4FF9169E4FF8C63
          E0FF7F51D6FF724DC1FF524195FF6547B8FF6647B8FF6648B9FF855AD9FF3638
          61F9000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000032345AE77F57D0FF6B4ABDFF6849
          BAFF6849BBFF6749BBFF6748BAFF6848BBFF845AD6FF8853E1FF8853E1FF7B57
          CAFF6848BBFF6849BBFF6749BAFF7353C6FF8B59E4FF8853E1FF8853E1FF5742
          9CFF6447B4FF7C55CEFF8853E1FF8853E1FF845FD6FF6848BAFF6A4EB8FF8C63
          E0FF7F51D6FF7F51D6FF7F51D6FF7F51D6FF8154D8FF9273DFFF6547B3FF6848
          BAFF6849BBFF6B4ABDFF7F57D0FF32345AE70000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00002C2D4FCB7553C2FF6F4DC2FF6A4ABCFF6A49BCFF6A49BCFF6A49BCFF6A49
          BCFF845AD6FF8853E1FF8853E1FF7B58CBFF6A49BCFF6A4ABDFF6A4ABDFF8763
          DAFF8853E1FF8853E1FF7F55D1FF6548B6FF6A4ABDFF694BB2FF8853E1FF8853
          E1FF8D64E2FF6A49BCFF7C59CFFF7F51D6FF7F51D6FF7751C9FF493F82FF6B50
          B2FF7F51D6FF8457DAFF7858CBFF6A49BCFF6A49BCFF704DC3FF7553C2FF2C2D
          4FCB000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000242541A7694EB0FF7550C9FF6B4A
          BDFF6B4ABDFF6B4ABDFF6B4ABDFF6B4ABDFF845AD6FF8853E1FF8853E1FF7C58
          CBFF6B4ABDFF6B4ABDFF6B4ABDFF9065E4FF8853E1FF8853E1FF6A4DB4FF6B4A
          BDFF6B4ABDFF564399FF8853E1FF8853E1FF8D5CE5FF7655C8FF704DC0FF7F51
          D6FF7F51D6FF785BC2FF5D46A6FF7C5CCBFF7F51D6FF7F51D6FF734FC6FF6B4A
          BDFF6B4ABDFF7550C9FF694EB0FF242541A70000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00001B1B307B5A479AFF7B54CFFF6D4BBFFF6D4BBFFFA17FF0FFA17FF0FFA17F
          F0FF9265E8FF8853E1FF8853E1FF966EEAFFA17FF0FFA17FF0FF9271E4FF8B59
          E4FF8853E1FF8853E1FF5A459FFF6C4BC0FF6D4BBFFF6A4AB9FF8255D6FF8853
          E1FF8853E1FF8660D9FF5D46A5FF7B51D0FF7F51D6FF8E66E2FFA17FF0FF8E66
          E2FF7F51D6FF7C51D0FF6147AAFF6C4BC0FF6C4BC0FF7B54CFFF5A479AFF1B1B
          307B000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000010101C484A4082FF8157D6FF6D4B
          C2FF6D4CC1FF8853E1FF8853E1FF8853E1FF8853E1FF8853E1FF8853E1FF8853
          E1FF8853E1FF8853E1FF8152D9FF8853E1FF8853E1FF784EC9FF6649B4FF6D4B
          C1FF6D4CC1FF6E4CC1FF6247A9FF8853E1FF8853E1FF744EC6FF6B4BBCFF433C
          78FF6247A9FF7F51D6FF7F51D6FF7F51D6FF6749B0FF483E80FF6B4BBCFF6D4C
          C1FF6E4CC1FF8157D6FF4A4082FF10101C480000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000303060F2E2F53CE7352BDFF7851CBFF6F4CC2FF373963FF373963FF3739
          63FF373963FF373963FF373963FF373963FF373963FF373963FF473E7DFF3739
          63FF373963FF413C76FF6F4DC3FF6F4DC3FF6E4DC2FF6F4CC2FF554396FF3739
          63FF373963FF554396FF6F4DC3FF674AB5FF4D408AFF373963FF373963FF3739
          63FF493F83FF6549B0FF6F4DC3FF6F4DC2FF7651CBFF7352BDFF2E2F53CE0303
          060F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000001D1E34855B479BFF7D55
          D3FF6F4EC5FF6F4EC5FF6F4EC5FF6F4EC5FF6F4EC5FF6F4EC5FF704EC5FF6F4E
          C5FF6F4EC5FF714EC4FF704EC5FF6F4EC5FF6F4EC5FF6F4EC5FF714EC4FF6F4E
          C5FF6F4EC5FF6F4EC5FF704EC5FF704EC5FF714EC4FF714EC4FF714EC4FF6F4E
          C5FF6F4EC5FF6F4EC5FF6F4EC5FF704EC5FF6F4EC5FF714EC4FF6F4EC5FF6F4E
          C5FF7D55D3FF5B479BFF1D1E3485000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000C0D16393F396FEB7754C7FF7852CCFF724FC6FF724FC6FF714F
          C6FF714FC6FF714FC6FF724FC6FF714FC6FF714FC6FF714FC6FF714FC6FF714F
          C6FF724FC6FF714FC6FF714FC6FF714FC6FF714FC6FF714FC6FF714FC6FF724F
          C6FF714FC6FF714FC6FF714FC6FF714FC6FF714FC6FF714FC6FF724FC6FF724F
          C6FF714FC6FF714FC6FF714FC6FF7852CCFF7754C7FF3F396FEB0C0D16390000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001F20378E5B47
          9BFF7F56D4FF7450C8FF7450C8FF7450C8FF7450C8FF7450C8FF7450C8FF7450
          C8FF7450C8FF7450C8FF7450C7FF7450C7FF7450C8FF7450C8FF7450C7FF7450
          C8FF7450C8FF7450C8FF7450C8FF7450C8FF7450C8FF7450C7FF7450C8FF7450
          C8FF7450C8FF7450C8FF7450C8FF7450C8FF7450C8FF7450C8FF7450C8FF7F56
          D4FF5B479BFF1F20378E00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000B0B143334315ED46E50B7FF7B55D1FF7551CAFF7551
          C9FF7551CAFF7551CAFF7551CAFF7451CAFF7451CAFF7451C9FF7551C9FF7451
          CAFF7451CAFF7551CAFF7550CAFF7451CAFF7550CAFF7551CAFF7550CAFF7451
          C9FF7550CAFF7551CAFF7551CAFF7550CAFF7550CAFF7551C9FF7551CAFF7450
          C9FF7550CAFF7451CAFF7C55D1FF6E50B7FF34315ED40B0B1433000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000001717
          29694C4185FF7954C9FF7A55D0FF7752CBFF7652CBFF7752CBFF7552CBFF7652
          CBFF7752CBFF7652CBFF7752CBFF7652CBFF7651CBFF7651CBFF7651CBFF7552
          CBFF7651CBFF7552CBFF7652CBFF7752CBFF7551CBFF7651CBFF7752CBFF7651
          CBFF7552CBFF7652CBFF7551CBFF7752CBFF7551CBFF7A55D0FF7954C9FF4C41
          85FF171729690000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000011F20378E554593FF7E57D1FF7A55
          D0FF7853CCFF7752CCFF7752CCFF7752CCFF7752CDFF7752CCFF7753CDFF7752
          CDFF7853CCFF7752CDFF7853CCFF7853CCFF7752CCFF7752CDFF7752CCFF7853
          CCFF7853CCFF7752CCFF7853CCFF7753CDFF7753CDFF7853CDFF7752CCFF7752
          CDFF7A55D0FF7E57D1FF554593FF1F20378E0000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000006060A1B23243EA0584697FF7F57D2FF7C55D2FF7853CEFF7854CEFF7854
          CEFF7854CEFF7853CEFF7854CEFF7853CEFF7854CEFF7853CEFF7853CEFF7853
          CEFF7853CEFF7853CEFF7853CEFF7854CEFF7853CEFF7853CEFF7853CEFF7853
          CEFF7853CEFF7853CEFF7853CEFF7C55D2FF7F57D2FF584697FF23243EA00606
          0A1B000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000008080E2423243EA05545
          93FF7A55CAFF7E56D4FF7954CFFF7954CFFF7954CFFF7954CFFF7954CFFF7954
          CFFF7954CFFF7954CFFF7954CFFF7954CFFF7954CFFF7954CFFF7954CFFF7954
          CFFF7954CFFF7954CFFF7954CFFF7954CFFF7954CFFF7955D0FF7E56D4FF7A55
          CAFF554593FF23243EA008080E24000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000006060A1B1F20378E4C4185FF6E50B7FF8259D8FF7D56
          D3FF7A55D0FF7A55D0FF7954CFFF7A55D0FF7A55D0FF7A55D0FF7A55D0FF7A55
          D0FF7A55D0FF7A55D0FF7954CFFF7A55D0FF7954CFFF7A55D0FF7A55D0FF7954
          D0FF7C56D3FF8259D8FF6E50B7FF4C4185FF1F20378E06060A1B000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00011717296934315ED45B479BFF7854C7FF8259D8FF7D56D4FF7B55D1FF7B55
          D1FF7B55D1FF7B55D0FF7B55D1FF7A55D0FF7B55D0FF7B55D1FF7B55D1FF7A55
          D0FF7B55D1FF7A55D1FF7E56D4FF8259D8FF7854C7FF5B479BFF34315ED41717
          2969000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000B0B14331F20378E3F39
          6FEB5B479BFF7352BDFF845AD9FF8259D8FF8057D6FF7D56D4FF7C56D3FF7C55
          D2FF7C55D2FF7C56D3FF7D56D4FF8057D6FF8259D8FF845AD9FF7352BDFF5B47
          9BFF3F396FEB1F20378E0B0B1433000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000C0D16391D1E34852E2F53CE4A4082FF5A47
          9AFF694EB0FF7553C2FF7F57D0FF855AD9FF855AD9FF7F57D0FF7553C2FF694E
          B0FF5A479AFF4A4082FF2E2F53CE1D1E34850C0D163900000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000303060F10101C481B1B307B242541A72C2D4FCB32345AE73638
          61F9363861F932345AE72C2D4FCB242541A71B1B307B10101C480303060F0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
end
