unit uTesteDBF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Db, DBTables, ExtCtrls, Dbf, ovcbase, StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dsTab: TDataSource;
    OvcController1: TOvcController;
    Label2: TLabel;
    Button1: TButton;
    tabDBF: TDbf;
    CheckBox1: TCheckBox;
    tSoc: TDbf;
    tSocCOD_SOCIO: TFloatField;
    tSocAPELLIDO1: TStringField;
    tSocAPELLIDO2: TStringField;
    tSocNOMBRE1: TStringField;
    tSocNOMBRE2: TStringField;
    Dbf1: TDbf;
    Dbf1COD_MOTIVO: TSmallintField;
    Dbf1DES_MOTIVO: TStringField;
    edTab: TComboBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1NRO_LLAM: TcxGridDBColumn;
    cxGrid1DBTableView1TIPO: TcxGridDBColumn;
    cxGrid1DBTableView1HORA: TcxGridDBColumn;
    cxGrid1DBTableView1FLAG: TcxGridDBColumn;
    procedure Button1Click(Sender: TObject);
    procedure tabDBFFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edTabCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMessage(tabDBF.GetFileNames);
{  tabDBF.Close;
  tabDBF.TableName := edTab.Text;
  tabDBF.Open;}
end;

procedure TForm1.edTabCloseUp(Sender: TObject);
begin
  tabDBF.Active := False;
  tabDBF.TableName := edTab.Items[edTab.ItemIndex];
  tabDBF.Active := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
var SR: TSearchRec;
begin
  edTab.Clear;

  if FindFirst(tabDBF.FilePath+'*.dbf', faAnyFile, SR)=0 then
  try
    repeat
      edTab.Items.Add(SR.Name);
    until FindNext(SR)<>0;
  finally
    FindClose(SR);
  end;
end;

procedure TForm1.tabDBFFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := (not CheckBox1.Checked) or SameText(tabDBF.FieldByName('CLIENTE').AsString, '17080');
end;

end.

procedure Validar; override;
begin
  if senha<>confirmacao then begin
    faz o que vc quiser;
    e no fim 
    Raise Exception....
  end;
end;
