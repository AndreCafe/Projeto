unit uEstCadastro;

interface

uses
  Windows, Messages, SysUtils, DateUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
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
  dxSkinValentine, dxSkinXmas2008Blue, kbmMemTable, cxMaskEdit, cxDropDownEdit,
  cxContainer, cxTextEdit, cxGridBandedTableView, cxGridDBBandedTableView,
  dxSkinscxPCPainter, cxPCdxBarPopupMenu;

type
  TForm13 = class(TForm)
    Paginas: TcxPageControl;
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    nxRSE: TnxRemoteServerEngine;
    nxTCP: TnxWinsockTransport;
    cxTabSheet3: TcxTabSheet;
    dsCad: TDataSource;
    gridCad: TcxGrid;
    TVCad: TcxGridDBTableView;
    glCad: TcxGridLevel;
    LMDSimplePanel1: TLMDSimplePanel;
    Button1: TButton;
    Button2: TButton;
    lbCalc: TLabel;
    Timer1: TTimer;
    qDes: TnxQuery;
    qDesLojas: TLargeintField;
    mtCad: TkbmMemTable;
    mtCadAno: TWordField;
    mtCadMes: TWordField;
    mtCadDia: TWordField;
    mtCadCriacao: TWordField;
    mtCadAtivacao: TWordField;
    mtCadChurn: TWordField;
    mtCadFree: TWordField;
    mtCadPremium: TWordField;
    mtCadDefinitivo: TWordField;
    mtCadTotal: TWordField;
    TVCadAno: TcxGridDBColumn;
    TVCadMes: TcxGridDBColumn;
    TVCadDia: TcxGridDBColumn;
    TVCadCriacao: TcxGridDBColumn;
    TVCadAtivacao: TcxGridDBColumn;
    TVCadNaoAtivou: TcxGridDBColumn;
    TVCadChurn: TcxGridDBColumn;
    TVCadFree: TcxGridDBColumn;
    TVCadPremium: TcxGridDBColumn;
    TVCadDefinitivo: TcxGridDBColumn;
    TVCadTotal: TcxGridDBColumn;
    qCad: TnxQuery;
    qCadLojas: TLargeintField;
    qAti: TnxQuery;
    qAtiLojas: TLargeintField;
    qDesAno: TWordField;
    qDesMes: TWordField;
    qDesDia: TWordField;
    qCadAno: TWordField;
    qCadMes: TWordField;
    qCadDia: TWordField;
    qAtiAno: TWordField;
    qAtiMes: TWordField;
    qAtiDia: TWordField;
    mtCadDS: TWordField;
    mtCadNaoAtivou: TIntegerField;
    mtCadpercAtivacao: TFloatField;
    mtCadpercNAtivou: TFloatField;
    mtCadpercAbandono: TFloatField;
    mtCadSaldo: TIntegerField;
    mtCadpercSaldo: TFloatField;
    TVCadpercAtivacao: TcxGridDBColumn;
    TVCadpercNAtivou: TcxGridDBColumn;
    TVCadpercAbandono: TcxGridDBColumn;
    TVCadSaldo: TcxGridDBColumn;
    TVCadpercSaldo: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cmExp: TButton;
    dlgExp: TSaveDialog;
    mtCadDias: TIntegerField;
    mtCadDiasM: TFloatField;
    qDesUDias: TLargeintField;
    TVCadDiasM: TcxGridDBColumn;
    tAbandono: TnxTable;
    TVAbandono: TcxGridDBTableView;
    tAbandonoCodigo: TAutoIncField;
    tAbandonoCadastroEm: TDateTimeField;
    tAbandonoLoja: TStringField;
    tAbandonoCidade: TStringField;
    tAbandonoUF: TStringField;
    tAbandonoBairro: TStringField;
    tAbandonoUDias: TWordField;
    tAbandonoMotivoDesist: TStringField;
    tAbandonoEmailConta: TStringField;
    tAbandonoUAno: TWordField;
    tAbandonoUMes: TWordField;
    tAbandonoUDia: TWordField;
    dsAbandono: TDataSource;
    TVAbandonoUDias: TcxGridDBColumn;
    TVAbandonoEmailConta: TcxGridDBColumn;
    TVAbandonoCodigo: TcxGridDBColumn;
    TVAbandonoCadastroEm: TcxGridDBColumn;
    TVAbandonoLoja: TcxGridDBColumn;
    TVAbandonoCidade: TcxGridDBColumn;
    TVAbandonoUF: TcxGridDBColumn;
    TVAbandonoEndereco: TcxGridDBColumn;
    TVAbandonoBairro: TcxGridDBColumn;
    TVAbandonoTelefones: TcxGridDBColumn;
    TVAbandonoProprietarios: TcxGridDBColumn;
    TVAbandonoMotivoDesist: TcxGridDBColumn;
    glAbandono: TcxGridLevel;
    Label1: TLabel;
    edDias: TcxSpinEdit;
    Label2: TLabel;
    mtCadBounce: TWordField;
    mtCadBounceRate: TFloatField;
    qBou: TnxQuery;
    qBouAno: TWordField;
    qBouMes: TWordField;
    qBouDia: TWordField;
    qBouLojas: TLargeintField;
    TVBounce: TcxGridDBColumn;
    TVBRate: TcxGridDBColumn;
    tAbandonoAtivado: TBooleanField;
    tAbandonoUVersao: TStringField;
    TVVersao: TcxGridDBColumn;
    Label6: TLabel;
    edDiasP: TcxSpinEdit;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure mtCadCalcFields(DataSet: TDataSet);
    procedure cmExpClick(Sender: TObject);
    procedure TVCadDataControllerDetailExpanded(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
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

function ChLPos(C: Char; Str: String): Integer;
var L: Integer;
begin
  L := Length(Str);
  for Result := Length(Str) downto 1 do
    if C=Str[Result] then Exit;
  Result := 0;  
end;

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

procedure TForm13.cmExpClick(Sender: TObject);
const
  Exts: Array[1..3] of String = ('xls', 'htm', 'txt');

var G: TcxGrid;  
begin
  if Paginas.ActivePageIndex=0 then
    G := gridCad;
                                                                                                                  
  if Pos('.', dlgExp.FileName)>0 then
    dlgExp.FileName := Copy(dlgExp.FileName, 1, Pos('.', dlgExp.FileName)-1);

  if not (dlgExp.FilterIndex in [1..3]) then
    dlgExp.FilterIndex := 1;
  
  if dlgExp.Execute and (dlgExp.FileName <> '') then begin
    if Pos('.', dlgExp.FileName)=0 then
      dlgExp.FileName := dlgExp.FileName + '.' + Exts[dlgExp.FilterIndex];
    case dlgExp.FilterIndex of
      1: ExportGridToExcel(dlgExp.FileName, G);
      2: ExportGridToHtml(dlgExp.FileName, G);
      3: ExportGridToText(dlgExp.FileName, G);
    end;
  end;
end;

procedure TForm13.mtCadCalcFields(DataSet: TDataSet);
var
  A, C, D, N, B: Word;
begin
  A := 0;
  C := 0;
  D := 0;
  B := 0;
  if not mtCadAtivacao.IsNull then
    A := mtCadAtivacao.Value;
  if not mtCadCriacao.IsNull then
    C := mtCadCriacao.Value;
  if not mtCadChurn.isNull then
    D := mtCadChurn.Value;
  N := C-A;  
  if not mtCadBounce.IsNull then
    B := mtCadBounce.Value;

  if C>0 then begin
    mtCadpercAtivacao.Value := Trunc(A/C * 1000) / 10;
    mtCadpercNAtivou.Value := Trunc(N/C * 1000) / 10;
  end;

  if A>0 then begin
    mtCadpercAbandono.Value := Trunc(D/A * 1000) / 10;
    mtCadSaldo.Value := A-D;
    mtCadpercSaldo.Value := Trunc((A-D) / A * 1000) / 10;
    mtCadBounceRate.Value := Trunc((B/A) * 1000) / 10;
  end;


  mtCadNaoAtivou.Value := C - A;

  if D>0 then
    mtCadDiasM.Value := Trunc((mtCadDias.Value / D) * 10) / 10;
end;

procedure TForm13.Processa;

procedure TotQ(Q: TnxQuery; fAno, fMes, fDia, fTot: TWordField; fDias, fLojas: TLargeintField);
begin
  Q.First;
  while not Q.Eof do begin
    if not mtCad.FindKey([fAno.Value, fMes.Value, fDia.Value]) then 
    begin
      mtCad.Append;
      mtCadAno.Value := fAno.Value;
      mtCadMes.Value := fMes.Value;
      mtCadDia.Value := fDia.Value;
    end else
      mtCad.Edit;
    fTot.Value := fLojas.Value;
    if fDias<>nil then
      mtCadDias.Value := fDias.Value;
    mtCad.Post; 
    Q.next;  
  end;
end;

begin
  nxTCP.Active := True;
  nxDB.Active := True;

  qCad.Active := False;
  qDes.Active := False;
  qAti.Active := False;
  qBou.Active := False;

  qDes.Params[0].AsDateTime := Date - edDias.EditValue +1;
  qCad.Params[0].AsDateTime := Date - edDias.EditValue +1;
  qAti.Params[0].AsDateTime := Date - edDias.EditValue +1;
  qBou.Params[0].AsDateTime := Date - edDias.EditValue +1;

  qCad.Open;
  qDes.Open;
  qAti.Open;
  qBou.Open;

  mtCad.Active := False;
  mtCad.Open;

  dsCad.DataSet := nil;
  try
    TotQ(qCad, qCadAno, qCadMes, qCadDia, mtCadCriacao, nil, qCadLojas);
    TotQ(qDes, qDesAno, qDesMes, qDesDia, mtCadChurn, qDesUDias, qDesLojas);
    TotQ(qAti, qAtiAno, qAtiMes, qAtiDia, mtCadAtivacao, nil, qAtiLojas); 
    TotQ(qBou, qBouAno, qBouMes, qBouDia, mtCadBounce, nil, qBouLojas); 
  finally
    dsCad.Dataset := mtCad;
  end;
  lbCalc.Visible := False;
  Paginas.Visible := True;
end;

procedure TForm13.RefreshAR2;
begin
end;

procedure TForm13.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Processa;
end;

procedure TForm13.TVCadDataControllerDetailExpanded(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
begin
  tAbandono.SetRange([
    ADataController.Values[ARecordIndex, tvCadAno.Index],
    ADataController.Values[ARecordIndex, tvCadMes.Index],
    ADataController.Values[ARecordIndex, tvCadDia.Index]],
    [ADataController.Values[ARecordIndex, tvCadAno.Index],
     ADataController.Values[ARecordIndex, tvCadMes.Index],
     ADataController.Values[ARecordIndex, tvCadDia.Index]]);
end;

end.


SELECT UAno as Ano, UMes as Mes, UDia as Dia, count(Distinct(Codigo)) as Lojas  FROM "cliente"
where (uobtemlic is not null) and (uobtemlic <= :data)
group by Ano, Mes, Dia
