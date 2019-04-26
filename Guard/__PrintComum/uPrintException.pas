unit uPrintException;

interface

uses
    sysutils;

type
   eNexPrinterNotFound = class(exception)
      PrinterName: string;
      constructor Create(const aPrinterName: string);
   end;

   eNexTipoImpressaoNotFound = class(exception)
      TipoImpressao: string;
      constructor Create(const aTipoImpressao: string);
   end;

   eNexIDTipoImpressaoNotFound = class(exception)
      idTipoImpressao: integer;
      constructor Create(const aIdTipoImpressao: integer);
   end;

   eNexUnzipError = class(exception)
      fileName: string;
      constructor Create(const afileName: string);
   end;

   eNexDownloadError = class(exception)
      fileName, aMessage: string;
      constructor Create(const afileName, eMsg: string);
   end;

   eNexDownloadMd5Error = class(exception)
      fileName, aMessage: string;
      constructor Create(const afileName: string);
   end;

implementation

{ eNexPrinterNotFound }

constructor eNexPrinterNotFound.Create(const aPrinterName: string);
begin
  inherited create('Erro abrindo impressora '+aPrinterName);
  PrinterName := APrinterName;
end;

{ eInfo8ImpressionTypeNotFound }

constructor eNexTipoImpressaoNotFound.Create(const aTipoImpressao: string);
begin
  inherited create('Tipo de impressão não localizado '+aTipoImpressao);
  TipoImpressao := aTipoImpressao;
end;

{ eNexIDTipoImpressaoNotFound }

constructor eNexIDTipoImpressaoNotFound.Create(const aIdTipoImpressao: integer);
begin
  inherited create('Tipo de impressão não localizado id: '+inttostr(aIdTipoImpressao));
  idTipoImpressao := aIdTipoImpressao;
end;


{ eNexUnzipError }

constructor eNexUnzipError.Create(const afileName: string);
begin
  inherited create('Erro descompactando arquivo '+afileName);
  fileName := afileName;
end;

{ eNexDownloadError }

constructor eNexDownloadError.Create(const afileName, eMsg: string);
begin
  inherited create('Erro descarregando arquivo '+afileName + ': ' +eMsg);
  fileName := afileName;
  aMessage := eMsg;
end;

{ eNexDownloadMd5Error }

constructor eNexDownloadMd5Error.Create(const afileName: string);
begin
  inherited create('Erro de MD5 do arquivo descarregado: '+afileName);
  fileName := afileName;
end;

end.
