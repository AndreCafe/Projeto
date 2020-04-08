unit uUTC;

interface

uses
    SysUtils, Windows;

  function LocaleToGMT(const Value: TDateTime): TDateTime;
  function GMTToLocale(const Value: TDateTime): TDateTime;
  function formatDateTimeISO8601(const Value: TDateTime): string;
  function formatDateTimeISO8601_z(const Value: TDateTime): string;
  function DateTimeToUnixMilliSecs(const AValue: TDateTime): Int64;

implementation

function GetGMTBias: Integer;
var
  info: TTimeZoneInformation;
  Mode: DWord;
begin
  Mode := GetTimeZoneInformation(info);
  Result := info.Bias;
  case Mode of
    TIME_ZONE_ID_INVALID:
      RaiseLastOSError;
    TIME_ZONE_ID_STANDARD:
      Result := Result + info.StandardBias;
    TIME_ZONE_ID_DAYLIGHT:
      Result := Result + info.DaylightBias;
  end;
end;

function LocaleToGMT(const Value: TDateTime): TDateTime;
begin
  Result := Value + (GetGMTBias / MinsPerDay);
end;

function GMTToLocale(const Value: TDateTime): TDateTime;
begin
  Result := Value - (GetGMTBias / MinsPerDay);
end;

function formatDateTimeISO8601(const Value: TDateTime): string;
var
      TZ, TZh, TZm : string;
      BIAS: integer;
begin
        BIAS := GetGMTBias;
        TZh := inttostr(abs(BIAS) div 60);
        TZh := copy('0'+TZh, length(TZh)-1, 2);
        TZm := inttostr(abs(BIAS) mod 60);
        TZm := copy(TZm+'0', 0, 2);
        TZ := TZh + ':' + TZm;
        if BIAS<0 then TZ := '+' + TZ else TZ := '-' + TZ ;
        result := formatdatetime('YYYY-MM-DD"T"HH:NN:SS', Value)+ TZ;
end;

function DateTimeToUnixMilliSecs(const AValue: TDateTime): Int64;
begin
  Result := Round((AValue - UnixDateDelta) * SecsPerDay * 1000);
end;


function formatDateTimeISO8601_z(const Value: TDateTime): string;
begin
    result := formatdatetime('YYYY-MM-DD"T"HH:NN:SS.ZZZ', Value) + '+00:00';
end;


end.
