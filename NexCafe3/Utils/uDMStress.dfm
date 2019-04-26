object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object Cli: TClienteNexCafe
    Servidor = ServCom
    Ativo = False
    Username = 'proxy'
    Senha = 'proxypass'
    Maquina = 0
    FuncAtual = False
    AutoAtualizar = False
    CacheConexao = False
    Left = 24
    Top = 40
  end
  object ServCom: TncServidorRemoto
    Ativo = False
    Host = '127.0.0.1'
    Left = 88
    Top = 40
  end
end
