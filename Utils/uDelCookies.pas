unit uDelCookies;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, WinINet, ExtCtrls;

type
  TForm27 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form27: TForm27;

implementation

uses SsBase;

{$R *.dfm}

procedure DelCookies(aAll, aPub: Boolean);
var 
  SR: TSearchRec;
  SL: TStrings;
  S: String;

procedure DelFolder(sFolder: String);
var I: Integer; s: String;
begin
  sFolder := sFolder + '\*.txt';
  if FindFirst(sFolder, faAnyFile, SR)=0 then
  try
    repeat
      if (Pos('@', SR.Name)>0) and (aAll and aPub) or (aPub and (Pos('yieldmanager', SR.Name)>0)) then
      begin
        ShowMessage(IntToStr(SR.Attr));
        s := SR.Name;
        sl.Add(S);
      end; 
    until FindNext(SR)<>0;
  finally
    FindClose(SR);
  end;

  for I := 0 to SL.Count-1 do begin
    DeleteFile(sFolder+'\'+SL[I]);
  end;

   SL.Clear;
end;  

begin
  if (not aPub) and (not aAll) then Exit;
  
  SL := TStringList.Create;
  try       
    DelFolder(GetSpecialFolderPath(0, sfCookies));
    DelFolder(GetSpecialFolderPath(0, sfInternetCache));
  finally
    SL.Free;
  end;
end;

procedure TForm27.Button1Click(Sender: TObject);
begin
  DelCookies(True,True);
end;

procedure TForm27.Button2Click(Sender: TObject);
var
  lpEntryInfo: PInternetCacheEntryInfo;
  hCacheDir: LongWord (*Handle*);
  dwEntrySize, dwLastError: LongWord;
  I : Integer;
  S: String;
begin
  //Get size of first entry in dwEntrySize
  dwEntrySize := 0;
  FindFirstUrlCacheEntry(nil, TInternetCacheEntryInfo(nil^), 
dwEntrySize);
  //Create structure that can hold entry
  GetMem(lpEntryInfo, dwEntrySize);
  //Get first cache entry and handle to retrieve next entry, output url
  hCacheDir := FindFirstUrlCacheEntry(nil, lpEntryInfo^, dwEntrySize);
  Memo1.Lines.Clear;
  if hCacheDir <> 0 then
    // use the DeleteUrlCacheEntry line here
    Memo1.Lines.Add(string(lpEntryInfo^.lpszSourceUrlName));
  //free structure
  FreeMem(lpEntryInfo);

  //retrieve all subsequent entries
  repeat
    dwEntrySize := 0;
    FindNextUrlCacheEntry(hCacheDir, TInternetCacheEntryInfo(nil^),
      dwEntrySize);
    dwLastError := GetLastError();
    if GetLastError = ERROR_INSUFFICIENT_BUFFER then begin
      GetMem(lpEntryInfo, dwEntrySize);
      if FindNextUrlCacheEntry(hCacheDir, lpEntryInfo^, dwEntrySize) 
then
        // use the DeleteUrlCacheEntry line here!
        Memo1.Lines.Add(string(lpEntryInfo^.lpszSourceUrlName));
      FreeMem(lpEntryInfo);
    end;
  until dwLastError = ERROR_NO_MORE_ITEMS;

  for i := 0 to Memo1.Lines.Count-1 do begin
{    S := Copy(Memo1.Lines[i], 1, 6);
    if SameText(S, 'cookie') then         }
      DeleteUrlCacheEntry(PAnsiChar(Memo1.Lines[i]));
  end;
end;

end.
