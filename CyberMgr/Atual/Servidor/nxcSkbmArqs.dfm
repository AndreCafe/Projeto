object mwServArq: TmwServArq
  OldCreateOrder = True
  GatherStatistics = False
  OnAuthenticate = kbmMWFileServiceAuthenticate
  OnFileAccess = kbmMWFileServiceFileAccess
  FilePool = dmKBMserv.FilePool
  Height = 294
  Width = 425
end
