unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StShlCtl, ImgList, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, kbmMemTable,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ShellControls;

type
  TForm1 = class(TForm)
    ListView1: TListView;
    imState: TImageList;
    Icones: TImageList;
    dsMT: TDataSource;
    MT: TkbmMemTable;
    MTNome: TStringField;
    MTTelefone: TStringField;
    JSL: TJamShellList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
