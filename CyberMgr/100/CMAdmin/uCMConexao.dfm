object dmConexao: TdmConexao
  OldCreateOrder = False
  Left = 133
  Top = 144
  Height = 375
  Width = 544
  object ServInt: TTMServidorBina
    Ativo = False
    Left = 32
    Top = 24
  end
  object ServRem: TTMServidorRemoto
    Ativo = False
    Left = 32
    Top = 80
  end
  object TM: TClienteTelemanagerFF
    Ativo = False
    Username = 'proxy'
    Senha = 'proxypass'
    Left = 96
    Top = 24
  end
  object LMDOneInstance1: TLMDOneInstance
    Mode = oiCustom
    OnCustom = LMDOneInstance1Custom
    Left = 120
    Top = 88
  end
end
