program nexopenhp;

uses 
  Windows,
  ShellApi;
  
begin
  ShellExecute(0, 'Open', PChar(ParamStr(1)), nil, nil, SW_Maximize);
end.
