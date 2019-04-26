program extimgs;

uses
  ncPRExtractImgs in 'ncPRExtractImgs.pas';

begin

  with TncPDFExtractImgs.Create(ParamStr(1), 0) do 
  try
    Processar;
  finally
    Free;
  end;
  
end.
