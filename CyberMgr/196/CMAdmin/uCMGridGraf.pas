unit uTMGridGraf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, dxBar, dxBarExtItems, TeeComma, ExtCtrls, TeeProcs, TeEngine,
  Chart, Db, kbmMemTable, Series;

type
  TFrmGridGraf = class(TForm)
    BarMgr: TdxBarManager;
    Chart1: TChart;
    TeeCommander1: TTeeCommander;
    cmTipoGraf: TdxBarImageCombo;
    Imagens: TImageList;
    mtGraf: TkbmMemTable;
    mtGrafLabel: TStringField;
    mtGrafValor: TFloatField;
    mtGrafX: TFloatField;
    mtGrafBar: TFloatField;
    mtGrafPie: TFloatField;
    mtGrafY: TFloatField;
    mtGrafColor: TIntegerField;
    Series1: TPieSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGridGraf: TFrmGridGraf;

implementation

{$R *.DFM}

end.
