object dmForm: TdmForm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 299
  Top = 210
  Height = 162
  Width = 217
  object mtForm: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Class'
        DataType = ftInteger
      end
      item
        Name = 'ClassName'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'Modulo'
        DataType = ftWord
      end>
    IndexFieldNames = 'Class'
    IndexName = 'mtFormIClass'
    IndexDefs = <
      item
        Name = 'mtFormIClass'
        Fields = 'Class'
      end
      item
        Name = 'mtFormIClassName'
        Fields = 'ClassName'
      end
      item
        Name = 'mtFormIDescricao'
        Fields = 'Descricao'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.08b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 24
    Top = 16
    object mtFormClass: TIntegerField
      FieldName = 'Class'
    end
    object mtFormClassName: TStringField
      DisplayLabel = 'Class Name'
      FieldName = 'ClassName'
      Size = 40
    end
    object mtFormDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 80
    end
    object mtFormModulo: TWordField
      DisplayLabel = 'M'#243'dulo'
      FieldName = 'Modulo'
    end
  end
  object mtOper: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'Form'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'OperID'
        DataType = ftWord
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 80
      end>
    IndexFieldNames = 'ID'
    IndexName = 'mtOperIID'
    IndexDefs = <
      item
        Name = 'mtOperIID'
        Fields = 'ID'
      end
      item
        Name = 'mtOperIFormOper'
        Fields = 'Form; OperID'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.08b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 80
    Top = 16
    object mtOperID: TAutoIncField
      FieldName = 'ID'
    end
    object mtOperForm: TStringField
      FieldName = 'Form'
      Size = 40
    end
    object mtOperOperID: TWordField
      FieldName = 'OperID'
    end
    object mtOperDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
  end
  object mtInstance: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexName = 'mtInstanceIInstance'
    IndexDefs = <
      item
        Name = 'mtInstanceIInstance'
        Fields = 'Instance'
      end
      item
        Name = 'mtInstanceIForm'
        Fields = 'Form'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.08b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 144
    Top = 16
    object mtInstanceInstance: TIntegerField
      FieldName = 'Instance'
    end
    object mtInstanceForm: TIntegerField
      FieldName = 'Form'
    end
  end
  object dsForm: TDataSource
    DataSet = mtForm
    Left = 24
    Top = 72
  end
  object dsOper: TDataSource
    DataSet = mtOper
    Left = 80
    Top = 72
  end
  object dsInstance: TDataSource
    DataSet = mtInstance
    Left = 144
    Top = 72
  end
end
