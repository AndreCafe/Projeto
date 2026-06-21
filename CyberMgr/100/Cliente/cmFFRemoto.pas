unit cmFFRemoto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ffllcomm, fflllgcy, ffllbase, ffllcomp, fflleng, ffsrintm, ffclreng;

type
  TdmFFRemoto = class(TDataModule)
    ffRSE: TFFRemoteServerEngine;
    ffLT: TffLegacyTransport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFFRemoto: TdmFFRemoto;

implementation

{$R *.DFM}

end.
