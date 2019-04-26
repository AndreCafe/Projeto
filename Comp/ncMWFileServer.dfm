object mwFileServer: TmwFileServer
  OldCreateOrder = True
  GatherStatistics = False
  OnAuthenticate = kbmMWFileServiceAuthenticate
  OnFileAccess = kbmMWFileServiceFileAccess
  FilePool = dmMWServer.mwFilePool
  Height = 183
  Width = 209
end
