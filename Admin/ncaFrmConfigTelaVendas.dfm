inherited FrmConfigTelaVendas: TFrmConfigTelaVendas
  Caption = 'Op'#231#245'es'
  ClientHeight = 270
  ClientWidth = 439
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Segoe UI'
  ExplicitWidth = 445
  ExplicitHeight = 298
  PixelsPerInch = 96
  TextHeight = 17
  inherited panPri: TLMDSimplePanel
    Width = 419
    Height = 172
    ExplicitWidth = 419
    ExplicitHeight = 172
    inherited panTopo: TLMDSimplePanel
      Width = 419
      Height = 141
      ExplicitWidth = 419
      ExplicitHeight = 141
      inherited img: TImage
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000003000
          00003008060000005702F987000000097048597300000EC400000EC401952B0E
          1B0000035B4944415478DAED985F4853511CC7BFF77AF747CD29E14BF910680F
          4226A25962FFCCB056895A8108414110F4501051DADC86B0B5D63FFBF312043D
          04F6205664A2A1684A26099926F9600F2568483E8829D36D6E7777DDB3E56A95
          ED8FBB77DED817C63D3BEC77F7FD9C737EF7FCCEA5DC6E37A42C2A0610038801
          7801766B5A67F94B72B40D0529CB2B73A9EA7700494D050F40C5006200910228
          D13C9139A07444DB54D800C7EB1E32E38E5467B44D850D70D6789FF9604D932E
          408DF136C3D8A73D00269329DADE9615C771D06AB59EB6D96CFE09A0D3E918FE
          2A5D008D46C3D034FD57800B0D23E87A3F019AFFB91C0E94672CE04061167272
          72A401B0E9DC0BA4C673BEEFD3361A47D74FC0507D5A1A00B58DA3E8E91F46B2
          9C838DF1964A2E87150F4E6523333373F503FCAA2DE75B90A8A03163A3A02DB0
          A0AAAA4A5A00EDEDED30F4B09EB68A9B43A3F610525252A403303B3B8B3D863E
          A81480934F0B1717D9EA83F78733DB1371E248B130009EC07B8FD0FE45B8519F
          B17218B95B261CC0F0F0304E364C2249EE1DFD053E2A8E8ACC4C385D6E5CD927
          875AAD160E80A8E0E273289838581C14AAF3C54BE688019064D677B9208B7323
          9E9BC753AD5A94648E18C0D4D4144A6FBE43A20C6039F259D912224BE756990A
          454545E20090A751B1A11749FC9E102991CDB1AFBE521C00A2969616187BE390
          205B79328B3E034476BB1D45FA0E4F3213F3BA1D2C2A2A2A563C13A201103537
          37C3D427F325739BB1024AA5523A002499CBEB07A06428D8580A0EA72B244372
          8AC5F5F2B501978E6000447B6B1E83A5E3C31A51528E3817173170E768F40048
          2E1CAC6BC302270F1D20C8E41514404CFDD7000A8661ECA4C368348674535DD3
          47B40E4E7ADAA57969B85C19F894164E4C2000150F30172A0031F2ECCD98EFCC
          FC759E46E5CEF47F1A22314DAFC7B06E8D37869CB10F17A60705117180DC9A4E
          24D18B7E7DDF5C09E8ADCD5DB6B8CBA9798964DAE6D767E114E8D6E4072C0823
          0EB0ED52079494FF0B3D6266E85A4948D00E3783FEAB6A0492204BA87BF01364
          3F6A3AAB93C2FEAD19019750C7DBCFBE1A8AEC05C5791BA3B384960C750E8D7B
          DA25B91B824EE2A5985D9BD370E3585650FF2508809812E431BA2A0088F47ABD
          9B65D9687B0C5A7F00F0B330CA5FC47D5718BE4678806C3F00A92A06106D7D07
          AA1FF2BF41645BB80000000049454E44AE426082}
      end
      object rbComecarPorProduto: TcxRadioButton
        Left = 59
        Top = 16
        Width = 347
        Height = 17
        Cursor = crHandPoint
        Caption = 'Come'#231'ar pelo produto'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = rbComecarPorQtdClick
        LookAndFeel.Kind = lfFlat
      end
      object rbComecarPorQtd: TcxRadioButton
        Left = 59
        Top = 39
        Width = 352
        Height = 17
        Cursor = crHandPoint
        Caption = 'Come'#231'ar pela quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = rbComecarPorQtdClick
        LookAndFeel.Kind = lfFlat
      end
      object cbNaoPassarQtd: TcxCheckBox
        Left = 91
        Top = 62
        Cursor = crHandPoint
        Caption = 'N'#227'o passar pela quantidade.'
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 2
        Width = 335
      end
      object cbDesligaBuscaAuto: TcxCheckBox
        Left = 58
        Top = 97
        Cursor = crHandPoint
        Caption = 'Desativar busca autom'#225'tica de produtos'
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 3
        Width = 335
      end
    end
    inherited lbDescr: TcxLabel
      Top = 141
      Caption = '.'
      Visible = False
      ExplicitTop = 113
      ExplicitWidth = 361
      ExplicitHeight = 21
      Width = 361
    end
  end
  inherited LMDSimplePanel1: TLMDSimplePanel
    Top = 228
    Width = 419
    ExplicitTop = 190
    ExplicitWidth = 419
  end
end
