unit ncImgImp;
{
    ResourceString: Dario 13/03/13
    Nada para fazer
}

interface

uses
  SysUtils, Classes, ImgList, Controls, cxGraphics;

type
  TdmImgImp = class(TDataModule)
    ilImp: TcxImageList;
    ilImp24: TcxImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmImgImp: TdmImgImp;

implementation

{$R *.dfm}

end.
