unit ncSalvaTranPlus;

interface

uses
  SysUtils,
  DB,
  MD5,
  Dialogs,
  Classes,
  Windows,
  ClasseCS,
  ncClassesBase;

type
  TncSalvaTranPlus = class ( TncClasse )
  protected
    function GetChave: Variant;
  end;  

implementation

end.
