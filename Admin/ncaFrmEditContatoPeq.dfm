inherited FrmEditContatoPeq: TFrmEditContatoPeq
  AlignWithMargins = True
  ClientHeight = 162
  ClientWidth = 547
  Position = poScreenCenter
  ExplicitWidth = 583
  ExplicitHeight = 220
  PixelsPerInch = 96
  TextHeight = 19
  inherited panPri: TLMDSimplePanel
    Width = 547
    Height = 34
    ParentColor = True
    ExplicitWidth = 592
    ExplicitHeight = 34
    inherited lbNome: TcxLabel
      Left = 38
      Style.Font.Height = -16
      Style.IsFontAssigned = True
      ExplicitLeft = 38
      ExplicitWidth = 210
      ExplicitHeight = 34
      AnchorY = 17
    end
    inherited Img: TMyImage
      AlignWithMargins = True
      Left = 3
      Width = 32
      Height = 34
      Margins.Top = 0
      Margins.Bottom = 0
      ImageList = dmImagens.im32
      ImageIndex = 1
      ExplicitLeft = 3
      ExplicitWidth = 32
      ExplicitHeight = 34
    end
    inherited lbRemove: TcxLabel
      Left = 248
      Style.Font.Height = -16
      Style.IsFontAssigned = True
      ExplicitLeft = 211
      ExplicitWidth = 24
      ExplicitHeight = 34
      AnchorY = 17
    end
    inherited panDeb: TLMDSimplePanel
      Left = 475
      Top = 5
      Height = 24
      Margins.Top = 5
      Margins.Bottom = 5
      ExplicitLeft = 438
      ExplicitTop = 5
      ExplicitHeight = 24
      inherited lbDebito: TcxLabel
        Style.IsFontAssigned = True
        ExplicitHeight = 24
        AnchorX = 25
        AnchorY = 12
      end
      inherited lbValorDebito: TcxLabel
        Style.IsFontAssigned = True
        ExplicitHeight = 24
        AnchorX = 72
        AnchorY = 12
      end
    end
    inherited panFid: TLMDSimplePanel
      Left = 389
      Top = 5
      Height = 24
      Margins.Top = 5
      Margins.Bottom = 5
      ExplicitLeft = 352
      ExplicitTop = 5
      ExplicitHeight = 24
      inherited lbPontos: TcxLabel
        Style.IsFontAssigned = True
        ExplicitHeight = 24
        AnchorX = 26
        AnchorY = 12
      end
      inherited lbQuantPontos: TcxLabel
        Style.IsFontAssigned = True
        ExplicitHeight = 24
        AnchorX = 61
        AnchorY = 12
      end
    end
    inherited panCred: TLMDSimplePanel
      Left = 275
      Top = 5
      Height = 24
      Margins.Top = 5
      Margins.Bottom = 5
      ExplicitLeft = 238
      ExplicitTop = 5
      ExplicitHeight = 24
      inherited lbCredito: TcxLabel
        Style.IsFontAssigned = True
        ExplicitHeight = 24
        AnchorX = 28
        AnchorY = 12
      end
      inherited lbValorCredito: TcxLabel
        Style.IsFontAssigned = True
        ExplicitHeight = 24
        AnchorX = 77
        AnchorY = 12
      end
    end
  end
  inherited imgs: TcxImageList
    Height = 24
    Width = 24
    FormatVersion = 1
    DesignInfo = 3145848
    ImageInfo = <>
  end
  inherited cxImageList1: TcxImageList
    FormatVersion = 1
    DesignInfo = 3145888
  end
end
