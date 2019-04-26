unit uContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, nxdb, nxseAutoComponent, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxsdServerEngine, nxreRemoteServerEngine, nxllComponent,
  StdCtrls, ExtCtrls, Grids, DBGrids, Spin, ComCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, 
  cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxMaskEdit, cxTextEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxGridChartView, cxGridDBChartView,
  kbmMemTable;

type
  TfrmPri = class(TForm)
    nxSession: TnxSession;
    nxRSE: TnxRemoteServerEngine;
    nxTCP: TnxWinsockTransport;
    nxseAllEngines1: TnxseAllEngines;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    tAut: TnxTable;
    tCliCodigo: TAutoIncField;
    tCliLicMaq: TWordField;
    tCliLicTipo: TWordField;
    tCliLicVenc: TDateField;
    tCliUObtemLic: TDateTimeField;
    tCliUVersao: TStringField;
    tCliAtivado: TBooleanField;
    tCliEmailConta: TStringField;
    tCliAtivadoEm: TDateTimeField;
    Timer1: TTimer;
    Q: TnxQuery;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbCriadas: TLabel;
    lbAtivadas: TLabel;
    lbAtivas: TLabel;
    lbPremium: TLabel;
    lbFree: TLabel;
    DS: TDataSource;
    PB: TProgressBar;
    lbDef: TLabel;
    Label7: TLabel;
    lbTotal: TLabel;
    Label9: TLabel;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    TVData: TcxGridDBColumn;
    TVLojas: TcxGridDBColumn;
    TVClientes: TcxGridDBColumn;
    TVDS: TcxGridDBColumn;
    tvG: TcxGridDBChartView;
    tvGSeries1: TcxGridDBChartSeries;
    MT: TkbmMemTable;
    MTData: TDateField;
    MTLojas: TLargeintField;
    MTClientes: TLargeintField;
    MTDS: TStringField;
    tEstL: TnxTable;
    QAno: TWordField;
    QMes: TWordField;
    QDia: TWordField;
    QClientes: TLargeintField;
    tCliInativo: TBooleanField;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure Processa;
  public
    { Public declarations }
  end;

var
  frmPri: TfrmPri;

implementation

{$R *.dfm}

function PercStr(Parte, Total: Extended): String;
begin
  Str(((Parte/Total)*100):0:1, Result);
  Result := Result + '%';
end;

procedure TfrmPri.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPri.Button2Click(Sender: TObject);
begin
  lbCriadas.Caption := 'calculando ...';
  lbAtivadas.Caption := 'calculando ...';
  lbAtivas.Caption := 'calculando ...';
  lbPremium.Caption := 'calculando ...';
  lbFree.Caption := 'calculando ...';
  Timer1.Enabled := True;
end;

procedure TfrmPri.Processa;
var 
  C1, C2, C3, c4, c5: integer;
  A1, A2, M1, M2 : Byte;
  Ano, Mes, Dia : Word;
begin
  nxTCP.Open;
  nxSession.Open;
  nxDB.Open;

  DecodeDate(Date, Ano, Mes, Dia);

  A1 := Ano - 2000;
  M1 := Mes;

  if M1>1 then begin
    M2 := M1-1;
    A2 := A1;
  end else begin
    A2 := A1-1;
    M2 := 12;
  end;
  MT.Active := False;
  Q.Active := False;
  Q.ParamByName('ano1').Value := A1;
  Q.ParamByName('ano2').Value := A2;
  Q.ParamByName('mes1').Value := M1;
  Q.ParamByName('mes2').Value := M2;
  Q.Active := True;
  Q.First;
  tEstL.Open;
  DS.Dataset := nil;
  MT.Open;
  while not Q.Eof do begin
    tEstL.SetRange([QAno.Value, QMes.Value, QDia.Value], [QAno.value, QMes.Value, QDia.Value]);
    MT.Append;
    MTLojas.Value := tEstL.RecordCount;
    MTData.Value := EncodeDate(QAno.Value+2000, QMes.Value, QDia.Value);

    case DayOfWeek(MTData.Value) of
      1 : MTDS.Value := 'DOM';
      2 : MTDS.Value := 'SEG';
      3 : MTDS.Value := 'TER';
      4 : MTDS.Value := 'QUA';
      5 : MTDS.Value := 'QUI';
      6 : MTDS.Value := 'SEX';
      7 : MTDS.Value := 'SAB';
    end;
    
    MTClientes.Value := QClientes.Value;
    MT.Post;
    Q.Next;
  end;
  MT.Last;
  DS.DataSet := MT;

  tAut.Open;
  tAut.SetRange([True, 5, Date-10], [True, 5, Date+5000]);
  C3 := tAut.recordcount;
  c4 := 0;
  c5 := 0;

  tCli.IndexName := 'ILicTipoUObtemLic';
  tCli.Open;
  tCli.SetRange([5], [5]);
  C1 := tCli.RecordCount;
  tCli.First;

  PB.Position := 0;
  PB.Max := C1;

  PB.Visible := True;
  Application.ProcessMessages;
  
  C2:=0;

  tCli.IndexName := 'IAtivado';
  tCli.SetRange([True], [True]);
  C4 := tCli.RecordCount;

  tCli.IndexName := 'IInativoLicTipoVenc';
  tCli.SetRange([False, 5, null], [False, 5, null]);
  C2 := tCli.RecordCount;

  tCli.SetRange([False, 5, EncodeDate(1980, 1, 1)], [False, 5, Date-10]);
  C2 := C2 + tCli.RecordCount;
  
  tCli.SetRange([False, 2], [False, 2]);
  C5 := tCli.RecordCount;

  lbCriadas.Caption := IntToStr(C1);
  lbAtivadas.Caption := IntToStr(C4) + '  ' + PercStr(C4, C1);
  lbAtivas.Caption := IntToStr(C2+C3) + '  ' + PercStr(C2+C3, C4);
  lbPremium.Caption := IntToStr(C3) + '  ' + PercStr(C3, C2+C3);
  lbFree.Caption := IntToStr(C2) + '  ' + PercStr(C2, C2+C3);
  lbDef.Caption := IntToStr(C5);
  lbTotal.Caption := IntToStr(C2+C3+C5);
end;

procedure TfrmPri.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Processa;
end;

end.
