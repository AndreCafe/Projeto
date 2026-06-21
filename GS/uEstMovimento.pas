unit uEstMovimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, nxdb, nxllComponent,
  nxsdServerEngine, nxsrServerEngine, nxseAutoComponent, StdCtrls, ExtCtrls;

type
  TForm42 = class(TForm)
    nx1xAllEngines1: Tnx1xAllEngines;
    nxseAllEngines1: TnxseAllEngines;
    nxServerEngine1: TnxServerEngine;
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    Tab: TnxTable;
    TabData: TDateField;
    TabIP: TStringField;
    TabH: TWordField;
    TabLoja: TIntegerField;
    TabW: TWordField;
    TabQtd: TIntegerField;
    DS: TDataSource;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    TabAno: TWordField;
    TabMes: TWordField;
    TabDia: TWordField;
    TVH: TcxGridDBColumn;
    TVLoja: TcxGridDBColumn;
    TVW: TcxGridDBColumn;
    TVQtd: TcxGridDBColumn;
    TVAno: TcxGridDBColumn;
    TVMes: TcxGridDBColumn;
    TVDia: TcxGridDBColumn;
    Panel1: TPanel;
    Button1: TButton;
    procedure TabCalcFields(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form42: TForm42;

implementation

{$R *.dfm}

procedure TForm42.Button1Click(Sender: TObject);
begin
  Tab.Open;
end;

procedure TForm42.TabCalcFields(DataSet: TDataSet);
var D, M, Y: Word;
begin
  DecodeDate(TabData.Value, Y, M, D);
  TabAno.Value := Y;
  TabMes.Value := M;
  TabDia.Value := D;
end;

end.
