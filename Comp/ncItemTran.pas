unit ncItemTran;

interface

uses
  SysUtils,
  DB,
  MD5,
  Classes,
  Windows,
  ClasseCS,
  ncClassesBase;

type

  TncItemTran = class
  public
    itID       : Integer;
    itTran     : Integer;
    itCaixa    : Integer;
    itCliente  : Integer;
    itDataHora : TDateTime;
    itTipoTran : Byte;
    itTipoItem : Byte;
    itSubTipo  : Byte;
    itItemID   : Integer;
    itSubItemID: Integer;
    itItemPos  : Word;
    itTotal    : Currency;
    itDesconto : Currency;
    itPago     : Currency;
    itGeraDeb  : Boolean;
    itPendente : Boolean;
  end;  

implementation

end.
