unit cmFFRemoto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ffllcomm, fflllgcy, nxllConst, nxllTypes, ffllcomp, fflleng, ffsrintm, ffclreng;

type
  TdmFFRemoto = class(TDataModule)
    ffRSE: TnxRemoteServerEngine;
    ffLT: TnxLegacyTransport;
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
