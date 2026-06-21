inherited frmFullVirtual: TfrmFullVirtual
  Caption = 'Virtual Mode'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxVirtualTreeList: TcxVirtualTreeList
    OptionsData.SmartLoad = True
    OnGetChildCount = cxVirtualTreeListGetChildCount
    OnGetNodeValue = cxVirtualTreeListGetNodeValue
    OnSetNodeValue = cxVirtualTreeListGetNodeValue
  end
end
