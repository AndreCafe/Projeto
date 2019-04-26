unit ncWBFrameExecScript;
{
    ResourceString: Dario 13/03/13
}

interface

uses
  Windows, Messages, SysUtils, ActiveX, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, MSHTML_EWB;

  function FrameExecScript(WB : TEmbeddedWB; aJS: String; aFrameName: String): Boolean;

implementation

function _GetFrame(H: IHTMLWindow2; FrameNo: Integer): IWebBrowser2;
var
  OleContainer: IOleContainer;
  Enum: ActiveX.IEnumUnknown;
  Unk: IUnknown;
  Fetched: PLongint;
begin
  Result := nil;
  if Assigned(H.Document) then
  begin
    Fetched := nil;
    OleContainer := H.Document as IOleContainer;
    OleContainer.EnumObjects(OLECONTF_EMBEDDINGS, Enum);
    Enum.Skip(FrameNo);
    Enum.Next(1, Unk, Fetched);
    if Supports(Unk, IWebBrowser2, Result) then //perva 2008/12/10
      Result := Unk as IWebbrowser2;
  end;
end;

function _DocumentLoaded(Document: IDispatch): Boolean;
var
  iDoc: IHTMLDocument2;
begin
  Result := False;
  if Assigned(Document) then
  begin
    Document.QueryInterface(IHTMLDocument2, iDoc);
    Result := Assigned(iDoc);
  end;
end;

function _FrameCount(Document: IDispatch): LongInt;
var //fix by Aladin
  OleContainer: IOleContainer;
  enum: ActiveX.IEnumUnknown;
  FetchedContrs: LongInt;
  Unknown: IUnknown;
  IWeb: IWebBrowser2;
begin
  Result := 0; //bsalsa
  if not _DocumentLoaded(Document) then Exit;
  OleContainer := Document as IOleContainer;
  if OleContainer.EnumObjects(OLECONTF_EMBEDDINGS, Enum) = S_OK then
  begin
    while Enum.Next(1, Unknown, @FetchedContrs) = S_OK do
    begin
      if Unknown.QueryInterface(IID_IWebBrowser2, IWeb) = S_OK then //check if it is frame
        Inc(Result);
    end;
  end;
end;

function _ExecFrame(H: IHTMLWindow2; aJS: String; aFrameName: String): Boolean;
var 
  I, T : Integer;
  O : OleVariant;
  V : Variant;
  HD : IHTMLDocument2;
  HW : IHTMLWindow2;
begin
  Result := False;
  T := _frameCount(H.document);
  for I := 0 to T-1 do begin
    if Supports(_GetFrame(H, I).Document, IHTMLDocument2, HD) then begin
      HW := HD.parentWindow;
      if SameText(HW.Name, aFrameName) then begin
        try HW.execScript(aJS, 'JavaScript') except end; // do not localize
        Result := True;
      end else
        Result := _ExecFrame(HW, aJS, aFrameName);
    end;
    if Result then Exit;
  end;
end;

function FrameExecScript(WB : TEmbeddedWB; aJS: String; aFrameName: String): Boolean;
var 
  H : IHTMLDocument2;
  HW : IHTMLWindow2;
  I : Integer;
begin
  for I := 0 to WB.FrameCount-1 do 
    if Supports(WB.GetFrame(0).Document, IHTMLDocument2, H) then begin
      HW := H.parentWindow;
      if SameText(HW.Name, aFrameName) then
        try HW.execScript(aJS, 'JavaScript') except end  // do not localize
      else
        _ExecFrame(HW, aJS, aFrameName);
    end;
end;

end.

