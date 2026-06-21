object dmTreeList: TdmTreeList
  OldCreateOrder = False
  Left = 64494
  Top = 181
  Height = 345
  Width = 456
  object acBiolife: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=Data\' +
      'biolife.mdb;Mode=ReadWrite;Extended Properties="";Persist Securi' +
      'ty Info=False;Jet OLEDB:System database="";Jet OLEDB:Registry Pa' +
      'th="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=5;Jet' +
      ' OLEDB:Database Locking Mode=0;Jet OLEDB:Global Partial Bulk Ops' +
      '=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database P' +
      'assword="";Jet OLEDB:Create System Database=False;Jet OLEDB:Encr' +
      'ypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Compact=False;' +
      'Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=Fal' +
      'se'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 16
  end
  object atBiolife: TADOTable
    Connection = acBiolife
    CursorType = ctStatic
    TableName = 'BioLife'
    Left = 104
    Top = 16
    object atBiolifeID: TIntegerField
      FieldName = 'ID'
    end
    object atBiolifeSpeciesName: TWideStringField
      FieldName = 'Species Name'
      Size = 255
    end
    object atBiolifeParentID: TIntegerField
      FieldName = 'ParentID'
    end
    object atBiolifeSpeciesNo: TIntegerField
      FieldName = 'Species No'
    end
    object atBiolifeLengthcm: TFloatField
      FieldName = 'Length(cm)'
    end
    object atBiolifeCategory: TWideStringField
      FieldName = 'Category'
      Size = 255
    end
    object atBiolifeCommonName: TWideStringField
      FieldName = 'Common Name'
      Size = 255
    end
    object atBiolifeNotes: TWideStringField
      FieldName = 'Notes'
      Size = 255
    end
    object atBiolifeMark: TBooleanField
      FieldName = 'Mark'
    end
    object atBiolifeRecordDate: TDateTimeField
      FieldName = 'RecordDate'
    end
  end
  object dsBiolife: TDataSource
    DataSet = atBiolife
    Left = 168
    Top = 16
  end
  object acIssuesList: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=Data\' +
      'IssueListDB.mdb;Mode=Read;Extended Properties="";Persist Securit' +
      'y Info=False;Jet OLEDB:System database="";Jet OLEDB:Registry Pat' +
      'h="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=5;Jet ' +
      'OLEDB:Database Locking Mode=0;Jet OLEDB:Global Partial Bulk Ops=' +
      '2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Pa' +
      'ssword="";Jet OLEDB:Create System Database=False;Jet OLEDB:Encry' +
      'pt Database=False;Jet OLEDB:Don'#39't Copy Locale on Compact=False;J' +
      'et OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=Fals' +
      'e'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 88
  end
  object dsTasksAndUsers: TDataSource
    DataSet = aqTasksAndUsers
    Left = 168
    Top = 88
  end
  object aqTasksAndUsers: TADOQuery
    Connection = acIssuesList
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT T.*, U.* FROM Tasks T, Users U WHERE T.UserID = U.ID')
    Left = 104
    Top = 88
  end
  object acCars: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Data\Cars.mdb;Mode=' +
      'ReadWrite;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 160
  end
  object atCars: TADOTable
    Connection = acCars
    CursorType = ctStatic
    TableName = 'CARS'
    Left = 104
    Top = 160
    object atCarsPicture: TBlobField
      FieldName = 'Picture'
    end
    object atCarsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object atCarsParentID: TIntegerField
      FieldName = 'ParentID'
    end
    object atCarsModel: TWideStringField
      FieldName = 'Model'
      Size = 50
    end
    object atCarsHP: TSmallintField
      FieldName = 'HP'
    end
    object atCarsLiter: TFloatField
      FieldName = 'Liter'
    end
    object atCarsCyl: TWordField
      FieldName = 'Cyl'
    end
    object atCarsTransmissSpeedCount: TWordField
      FieldName = 'TransmissSpeedCount'
    end
    object atCarsTransmissAutomatic: TBooleanField
      FieldName = 'TransmissAutomatic'
    end
    object atCarsMPG_City: TWordField
      FieldName = 'MPG_City'
    end
    object atCarsMPG_Highway: TWordField
      FieldName = 'MPG_Highway'
    end
    object atCarsHyperlink: TWideStringField
      FieldName = 'Hyperlink'
      Size = 50
    end
    object atCarsPrice: TBCDField
      FieldName = 'Price'
      Precision = 19
    end
    object atCarsSmallPicture: TBlobField
      FieldName = 'SmallPicture'
    end
    object atCarsDescription: TMemoField
      FieldName = 'Description'
      BlobType = ftMemo
    end
  end
  object dsCars: TDataSource
    DataSet = atCars
    Left = 168
    Top = 160
  end
end
