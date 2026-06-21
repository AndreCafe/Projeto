object dm_conn: Tdm_conn
  OldCreateOrder = False
  Height = 163
  Width = 236
  object nxRSE: TnxRemoteServerEngine
    Transport = nxShMem
    Left = 40
    Top = 24
  end
  object nxShMem: TnxSharedMemoryTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = 'registro'
    ServerNameDesigntime = 'registro'
    Port = 16300
    Left = 96
    Top = 24
  end
end
