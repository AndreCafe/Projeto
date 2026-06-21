unit uEstFinanceira;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxsdServerEngine, nxreRemoteServerEngine, nxdb,
  nxllComponent, cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxPC, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxImageComboBox, cxSpinEdit, dxSkinsCore, dxSkinOffice2007Black, dxSkinSeven,
  dxSkinsDefaultPainters, StdCtrls, LMDControl, ExtCtrls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, kbmMemTable, cxMaskEdit, cxDropDownEdit;

type
  TForm13 = class(TForm)
    Paginas: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    tvRec: TcxGridDBTableView;
    glRec: TcxGridLevel;
    gridRec: TcxGrid;
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    qRec: TnxQuery;
    DataSource1: TDataSource;
    nxRSE: TnxRemoteServerEngine;
    nxTCP: TnxWinsockTransport;
    tvRecMes: TcxGridDBColumn;
    tvRecAno: TcxGridDBColumn;
    tvRecTotal: TcxGridDBColumn;
    cxTabSheet2: TcxTabSheet;
    gridVen: TcxGrid;
    TVVen: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    glVen: TcxGridLevel;
    qVen: TnxQuery;
    dsVen: TDataSource;
    cxTabSheet4: TcxTabSheet;
    dsAR: TDataSource;
    qAR: TnxQuery;
    GridAReceber: TcxGrid;
    TVAReceber: TcxGridDBTableView;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    VAReceberColumn1: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    glAReceber: TcxGridLevel;
    TVAR2: TcxGridDBTableView;
    GLAR2: TcxGridLevel;
    GridAR2: TcxGrid;
    qAR2: TnxQuery;
    dsAR2: TDataSource;
    qAR2loja: TStringField;
    qAR2ID: TIntegerField;
    qAR2rLoja: TIntegerField;
    qAR2Vencimento: TDateField;
    qAR2Pagamento: TDateField;
    qAR2Valor: TCurrencyField;
    qAR2ValorPago: TCurrencyField;
    qAR2Obs: TMemoField;
    qAR2Doc: TStringField;
    qAR2Descricao: TStringField;
    qAR2Lancamento: TDateTimeField;
    qAR2Tipo: TStringField;
    qAR2PC: TIntegerField;
    qAR2SituacaoCobr: TWordField;
    TVAR2loja: TcxGridDBColumn;
    TVAR2rLoja: TcxGridDBColumn;
    TVAR2Vencimento: TcxGridDBColumn;
    TVAR2Pagamento: TcxGridDBColumn;
    TVAR2Valor: TcxGridDBColumn;
    TVAR2ValorPago: TcxGridDBColumn;
    TVAR2Obs: TcxGridDBColumn;
    TVAR2Doc: TcxGridDBColumn;
    TVAR2Descricao: TcxGridDBColumn;
    TVAR2Lancamento: TcxGridDBColumn;
    TVAR2Tipo: TcxGridDBColumn;
    TVAR2PC: TcxGridDBColumn;
    TVAR2SituacaoCobr: TcxGridDBColumn;
    qARDia: TIntegerField;
    qARMes: TIntegerField;
    qARAno: TIntegerField;
    qARTotal: TCurrencyField;
    LMDSimplePanel1: TLMDSimplePanel;
    Button1: TButton;
    Button2: TButton;
    lbCalc: TLabel;
    Timer1: TTimer;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    dlgExp: TSaveDialog;
    procedure TVAReceberFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure Processa;
  public
    procedure RefreshAR2;
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses cxGridExportlink;

{$R *.dfm}

{ TForm13 }

procedure TForm13.Button1Click(Sender: TObject);
begin
  Paginas.Visible := False;
  lbCalc.Visible := True;
  Timer1.Enabled := True;
end;

procedure TForm13.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm13.Processa;
begin
  nxTCP.Active := True;
  nxDB.Active := True;

  qRec.Active := False;
  qVen.Active := False;
  qAR2.Active := False;
  qAR.Active  := False;
  

  qRec.Open;
  qVen.Open;
  qAR.Open;

  lbCalc.Visible := False;
  Paginas.Visible := True;
end;

procedure TForm13.RefreshAR2;
var Dia, Mes, Ano: Integer;
begin
  Dia := qARDia.Value;
  Mes := qARMes.Value;
  Ano := qARAno.Value;
  qAR2.Active := False;
  if (Dia>0) and (Mes>0) and (Ano>0) then begin
    qAR2.Params[0].Value := EncodeDate(qARAno.Value, qARMes.Value, qARDia.Value);
    qAR2.Open;
  end;
end;

procedure TForm13.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Processa;
end;

procedure TForm13.TVAReceberFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  RefreshAR2;
end;

end.



