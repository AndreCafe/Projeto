unit ufmRegister;

interface

uses
  Forms,
  Classes,
  DesignEditors,
  DesignIntF,
  ufmFrmBasePai,
  ufmFormBase;

  procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Form Manager', [TFormManager]);
  RegisterCustomModule(TFrmBasePai, TCustomModule);
  RegisterPropertiesInCategory('Form Manager', ['Modal', 'CacheInstance', 'Operacao']);
end;  




end.
