unit Countries;


interface


uses
  Windows, Classes, SysUtils;


procedure GetCountries(Strings: TStrings);


implementation


var
  CountriesList: TStringList;


procedure GetCountries(Strings: TStrings);
begin
  Strings.Assign(CountriesList);
end;


function EnumLocalesProc(Name: PChar): Cardinal; stdcall;
var
  Locale: Integer;
  Country: string;
begin
  Result := 1;
  Locale := StrToIntDef('$' + Copy(Name, 5, 4), 0) and $3FF;


  Country := GetLocaleStr(Locale, LOCALE_SCOUNTRY, '');
  if Country <> '' then
    CountriesList.Add(Country);
end;




initialization
  CountriesList := TStringList.Create;
  CountriesList.Duplicates := dupIgnore;
  CountriesList.Sorted := True;
  EnumSystemLocales(@EnumLocalesProc, LCID_SUPPORTED);


finalization
  CountriesList.Free;


end.unit Unit3;

interface

implementation

end.
