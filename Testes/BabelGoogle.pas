unit BabelGoogle;

interface

uses
  Classes, idHttp, Controls, Forms;
type
  TBabelGoogleRest = class (TComponent) // non visual...
  protected
    Http1: TIdHttp;
    FFromLang: string;
    FToLang: string;
    FActiveInForm: Boolean;
    procedure SetFromLang(const Value: string);
    procedure SetToLang(const Value: string);
  public
    function DoTranslate (strIn: string): string; virtual;
    constructor Create(AOwner: TComponent); override;

    class function Translate (strIn, langIn, langOut: string): string;
  published
    property FromLang: string read FFromLang write SetFromLang;
    property ToLang: string read FToLang write SetToLang;
  end;

implementation

uses
  SysUtils, idUri, StrUtils;

{ TBabelGoogle }

constructor TBabelGoogleRest.Create(AOwner: TComponent);
begin
  inherited;
  Http1 := TIdHTTP.Create(self);
//  Http1.ProxyParams.BasicAuthentication := True;
//  Http1.ProxyParams.ProxyPort := 8080;
//  Http1.ProxyParams.ProxyServer := '10.1.0.232';
//  Http1.ProxyParams.ProxyUsername := 'mgaspar';
//  Http1.ProxyParams.ProxyPassword := 'russo30';

end;

procedure TBabelGoogleRest.SetFromLang(const Value: string);
begin
  FFromLang := Value;
end;

procedure TBabelGoogleRest.SetToLang(const Value: string);
begin
  FToLang := Value;
end;

class function TBabelGoogleRest.Translate(strIn, langIn, langOut: string): string;
var
  bg: TBabelGoogleRest;
begin
  bg := self.Create(nil);
  try
    bg.FromLang := langin;
    bg.ToLang := langout;
    Result := bg.DoTranslate(strIn);
  finally
    bg.Free;
  end;
end;

function TBabelGoogleRest.DoTranslate(strIn: string): string;
var
  strUrl, strResult: string;
  nPosA, nPosB: Integer;
begin
  Http1.Request.Referer := ''; // not enforced for now
  strUrl := Format (
    'http://ajax.googleapis.com/ajax/services/language/translate?' +
    'v=1.0&q=%s&langpair=%s',
    [TIdUri.ParamsEncode (strIn),
    FFromLang + '%7C' + FToLang]); // format hates the %7 !!!
  strResult := Http1.Get(strUrl);
  nPosA := Pos ('"translatedText":', strResult); // begin of JSON data
  if nPosA = 0 then
  begin
    nPosA := Pos ('"responseDetails":', strResult); // begin of JSON data
    nPosA := nPosA + Length ('"responseDetails":');
  end
  else
    nPosA := nPosA + Length ('"translatedText":');

  // shared code
  nPosA := PosEx ('"', strResult, nPosA) + 1; // opening quotes
  nPosB := PosEx ('"', strResult, nPosA) - 1; // end quotes
  Result := Copy (strResult, nPosA, nPosB - nPosA + 1);
end;

end.
