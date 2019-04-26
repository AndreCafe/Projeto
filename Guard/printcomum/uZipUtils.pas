unit uZipUtils;

interface

uses
  Windows, Classes, Messages, SysUtils, JclCompression;

    function  ExtractZip(aZip, aDir:string; const progressEvt: TJclCompressionProgressEvent=nil):boolean;
    function  ExtractZipPath (aZip:string):string;

implementation

uses
    uCommonProc, uPrintException;

function ExtractZip(aZip, aDir:string; const progressEvt: TJclCompressionProgressEvent=nil):boolean;
var
  AFormat: TJclDecompressArchiveClass;
  FArchive: TJclCompressionArchive;
begin
    result := false;
    try
        AFormat := GetArchiveFormats.FindDecompressFormat(aZip);

        if AFormat <> nil then begin

            FArchive := AFormat.Create(aZip, 0);
            FArchive.OnProgress := progressEvt;

            if FArchive is TJclDecompressArchive then begin
               TJclDecompressArchive(FArchive).ListFiles;
               ForceDirectories(aDir);
               TJclDecompressArchive(FArchive).ExtractAll(aDir, True);
               result := true;
            end;

            FArchive.free;
        end;
    except
        raise eNexUnzipError.create(aZip);
    end;
end;

function  ExtractZipPath (aZip:string):string;
var
  AFormat: TJclDecompressArchiveClass;
  FArchive: TJclCompressionArchive;
begin
    result := '';
    try
        AFormat := GetArchiveFormats.FindDecompressFormat(aZip);

        if AFormat <> nil then begin

            FArchive := AFormat.Create(aZip, 0);
            if FArchive is TJclDecompressArchive then
               with TJclDecompressArchive(FArchive) do begin
                  ListFiles;
                  if ItemCount>0 then
                      result := NormalizarFilePath(TJclDecompressArchive(FArchive).Items[0].PackedName);
               end;
            FArchive.free;
        end;
    except
        raise eNexUnzipError.create(aZip);
    end;
end;



end.
