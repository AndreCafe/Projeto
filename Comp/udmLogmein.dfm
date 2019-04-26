object dmLogmein: TdmLogmein
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 138
  Width = 158
  object Timer1: TTimer
    Interval = 4000
    OnTimer = Timer1Timer
    Left = 72
    Top = 16
  end
  object WL: TWinList
    Left = 24
    Top = 16
  end
end
