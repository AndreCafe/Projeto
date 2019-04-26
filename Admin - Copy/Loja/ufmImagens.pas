unit ufmImagens;
{
    ResourceString: Dario 13/03/13
    Nada para fazer
}

interface

uses
  SysUtils, Classes, ImgList, Controls, cxGraphics;

type
  TdmImagens = class(TDataModule)
    im16: TcxImageList;
    im32: TcxImageList;
    im24: TcxImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmImagens: TdmImagens = nil;

implementation

{initialization
   dmImagens := TdmImagens.Create(nil);}

{finalization
  if dmImagens <> nil then
    FreeAndNil(dmImagens);}

{$R *.dfm}

end.
