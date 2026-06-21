object InterfacesExplorerForm: TInterfacesExplorerForm
  Left = 246
  Top = 106
  Width = 640
  Height = 486
  Caption = 'Interfaces Explorer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 24
  object LoggerPanel: TPanel
    Left = 185
    Top = 0
    Width = 447
    Height = 459
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object HintPanel: TPanel
      Left = 1
      Top = 1
      Width = 445
      Height = 56
      Align = alTop
      BevelWidth = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object HintLabel: TLabel
        Left = 5
        Top = 5
        Width = 435
        Height = 46
        Align = alClient
        WordWrap = True
      end
    end
  end
  object ButtonScrollBox: TScrollBox
    Left = 0
    Top = 0
    Width = 185
    Height = 459
    Align = alLeft
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object SimpleTestButton: TButton
      Left = 8
      Top = 8
      Width = 145
      Height = 29
      Hint = 
        'Simple creation|Creating an interface, using it and letting it g' +
        'o out of scope'
      Caption = 'Simple Test'
      TabOrder = 0
      OnClick = SimpleTestButtonClick
    end
    object LeakTestButton: TButton
      Left = 8
      Top = 40
      Width = 145
      Height = 29
      Hint = 
        'Looks like a possible memory leak|What happens when we simply re' +
        'assign an interface pointer; does it leak?'
      Caption = '"Leak" Test'
      TabOrder = 1
      OnClick = LeakTestButtonClick
    end
    object ConflictTest1Button: TButton
      Left = 8
      Top = 72
      Width = 145
      Height = 29
      Hint = 
        'Testing conflicting interfaces|Both IHappy and ISad have a ShowM' +
        'ood; where does it map to?'
      Caption = 'Conflict Test 1'
      TabOrder = 2
      OnClick = ConflictTest1ButtonClick
    end
    object ConflictTest2Button: TButton
      Left = 8
      Top = 104
      Width = 145
      Height = 29
      Hint = 
        'Trying to resolve the conflict|But I don'#39't want IHappy.ShowMood ' +
        'and ISad.ShowMood to do the same thing...'
      Caption = 'Conflict Test 2'
      TabOrder = 3
      OnClick = ConflictTest2ButtonClick
    end
    object AsTypecastButton: TButton
      Left = 8
      Top = 264
      Width = 145
      Height = 29
      Hint = 
        'Use of "as" in typecasting|The standard way of asking for one in' +
        'terface from another (typecasting)'
      Caption = 'Using "as"'
      TabOrder = 8
      OnClick = AsTypecastButtonClick
    end
    object AssigningNilButton: TButton
      Left = 8
      Top = 136
      Width = 145
      Height = 29
      Hint = 
        'Letting go early|Same as Conflict Test 1, but this time, we assi' +
        'gn nil before the end of the method'
      Caption = 'Assigning nil'
      TabOrder = 4
      OnClick = AssigningNilButtonClick
    end
    object NonConstRefCountButton: TButton
      Left = 8
      Top = 168
      Width = 145
      Height = 29
      Hint = 
        'Passing in an interface|Let'#39's see the reference counting when we' +
        ' pass in an interface as a regular parameter'
      Caption = 'Non-Const Ref'
      TabOrder = 5
      OnClick = NonConstRefCountButtonClick
    end
    object ConstRefCountButton: TButton
      Left = 8
      Top = 200
      Width = 145
      Height = 29
      Hint = 
        'Passing in an const interface|Let'#39's see the reference counting w' +
        'hen we pass in an interface as a const parameter'
      Caption = 'Const Ref'
      TabOrder = 6
      OnClick = ConstRefCountButtonClick
    end
    object RefCountExplorerButton: TButton
      Left = 8
      Top = 232
      Width = 145
      Height = 29
      Hint = 'More complex referencing|Playing with reference counting'
      Caption = 'RefCounts'
      TabOrder = 7
      OnClick = FullerRefCountButtonClick
    end
    object OtherTypecastsButton: TButton
      Left = 8
      Top = 296
      Width = 145
      Height = 29
      Hint = 
        'Other typecasts|Other means to do interface typecasting: Support' +
        's and QueryInterface'
      Caption = 'Typecasting'
      TabOrder = 9
      OnClick = OtherTypecastsButtonClick
    end
    object AdjustmentsButton: TButton
      Left = 8
      Top = 328
      Width = 145
      Height = 29
      Hint = 
        'Interface not same as Self|What'#39's the difference between an inte' +
        'rface pointer and a regular object pointer?'
      Caption = 'Adjustments'
      TabOrder = 10
      OnClick = AdjustmentsButtonClick
    end
    object InheritanceButton: TButton
      Left = 8
      Top = 360
      Width = 145
      Height = 29
      Hint = 'Interface inheritance|Inheriting interfaces from one another'
      Caption = 'Inheritance'
      TabOrder = 11
      OnClick = InheritanceButtonClick
    end
    object DelegationButton1: TButton
      Left = 8
      Top = 392
      Width = 145
      Height = 29
      Hint = 
        'Delegate to interface|Using interface delegation to an interface' +
        ' property'
      Caption = 'Delegation 1'
      TabOrder = 12
      OnClick = DelegationButton1Click
    end
    object DelegationButton2: TButton
      Left = 8
      Top = 424
      Width = 145
      Height = 29
      Hint = 
        'Delegate to IWorkalot-implementing object|Using interface delega' +
        'tion to an object property that implements the interface'
      Caption = 'Delegation 2'
      TabOrder = 13
      OnClick = DelegationButton2Click
    end
    object DelegationButton3: TButton
      Left = 8
      Top = 456
      Width = 145
      Height = 29
      Hint = 
        'Delegate to plain object|Using interface delegation to an object' +
        ' property that does not declare interface support'
      Caption = 'Delegation 3'
      TabOrder = 14
      OnClick = DelegationButton3Click
    end
    object OwnershipButton: TButton
      Left = 8
      Top = 552
      Width = 145
      Height = 29
      Hint = 
        'Passing "ownership" around|The objects don'#39't explicitly need to ' +
        'get rid of the interface they are using'
      Caption = '"Ownership"'
      TabOrder = 17
      OnClick = OwnershipButtonClick
    end
    object DeclaringInterfaceAsObjectButton: TButton
      Left = 8
      Top = 584
      Width = 145
      Height = 29
      Hint = 
        'Mixing object declarations and interfaces|What happens when you ' +
        'declare something as an object and assign and use it via an inte' +
        'rface later?'
      Caption = 'Don'#39't Mix'
      TabOrder = 18
      OnClick = DeclaringInterfaceAsObjectButtonClick
    end
    object ContainingObjectsButton: TButton
      Left = 8
      Top = 616
      Width = 145
      Height = 29
      Hint = 
        'Containing objects|Containing an object completely inside an int' +
        'erface'
      Caption = 'Containing'
      TabOrder = 19
      OnClick = ContainingObjectsButtonClick
    end
    object ThreadsButton: TButton
      Left = 8
      Top = 648
      Width = 145
      Height = 29
      Hint = 
        'Using interfaces from threads|Reference-counting means that thre' +
        'ads can hold on to interfaces for as long as they need to'
      Caption = 'Threads'
      TabOrder = 20
      OnClick = ThreadsButtonClick
    end
    object CircularReferenceButton: TButton
      Left = 8
      Top = 680
      Width = 145
      Height = 29
      Hint = 
        'Circular references|When A points to B and B points to A, no one' +
        ' wants to go away'
      Caption = 'Circular Refs'
      TabOrder = 21
      OnClick = CircularReferenceButtonClick
    end
    object DelegationButton4: TButton
      Left = 8
      Top = 488
      Width = 145
      Height = 29
      Hint = 
        'Delegate to plain object missing a bit|Using interface delegatio' +
        'n to an object property that is missing a method'
      Caption = 'Delegation 4'
      TabOrder = 15
      OnClick = DelegationButton4Click
    end
    object FundamentalsCircularRefButton: TButton
      Left = 8
      Top = 712
      Width = 145
      Height = 29
      Hint = 
        'Fundamentals references|The same situation with IFundamental-bas' +
        'ed buddies'
      Caption = 'Fundamental 1'
      TabOrder = 22
      OnClick = FundamentalsCircularRefButtonClick
    end
    object FundamentalsParseButton: TButton
      Left = 8
      Top = 744
      Width = 145
      Height = 29
      Hint = 
        'Small parsing example|Parsing example using IFundamental-based c' +
        'lasses'
      Caption = 'Parsing Fun 1'
      TabOrder = 23
      OnClick = FundamentalsParseButtonClick
    end
    object FundamentalsImpatientParseButton: TButton
      Left = 8
      Top = 776
      Width = 145
      Height = 29
      Hint = 
        'Impatient parsing example|Parsing example using IFundamental-bas' +
        'ed classes that kills file after 3 lines'
      Caption = 'Parsing Fun 2'
      TabOrder = 24
      OnClick = FundamentalsImpatientParseButtonClick
    end
    object FundamentalsSelfDestructParseButton: TButton
      Left = 8
      Top = 808
      Width = 145
      Height = 29
      Hint = 
        'Self-destructive parsing example|Parsing example with file objec' +
        't that self-destructs after 2 lines'
      Caption = 'Parsing Fun 3'
      TabOrder = 25
      OnClick = FundamentalsSelfDestructParseButtonClick
    end
    object DelegationButton5: TButton
      Left = 8
      Top = 520
      Width = 145
      Height = 29
      Hint = 
        'Delegating to interfaces '#39'carefully'#39'|Using interface delegation ' +
        'to an interface property assigning to a different interface firs' +
        't'
      Caption = 'Delegation 5'
      TabOrder = 16
      OnClick = DelegationButton5Click
    end
  end
end
