unit uEstRedirs;

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
  ComCtrls, dxSkinscxPCPainter, cxPCdxBarPopupMenu;

type
  TForm13 = class(TForm)
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    nxRSE: TnxRemoteServerEngine;
    nxTCP: TnxWinsockTransport;
    LMDSimplePanel1: TLMDSimplePanel;
    btnAtualiza: TButton;
    Button2: TButton;
    lbCalc: TLabel;
    Timer1: TTimer;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cmExp: TButton;
    dlgExp: TSaveDialog;
    tR: TnxTable;
    tRL: TnxTable;
    tRG: TnxTable;
    tRData: TDateField;
    tRIP: TStringField;
    tRH: TWordField;
    tRLoja: TIntegerField;
    tRW: TWordField;
    tRQtd: TIntegerField;
    tRAno: TWordField;
    tRMes: TWordField;
    tRDia: TWordField;
    tRGAno: TWordField;
    tRGMes: TWordField;
    tRGDia: TWordField;
    tRGDS: TWordField;
    tRGLojas: TIntegerField;
    tRGQtd: TIntegerField;
    tRGMedia: TFloatField;
    tRLLoja: TIntegerField;
    tRLAno: TWordField;
    tRLMes: TWordField;
    tRLDias: TIntegerField;
    tRLQtd: TIntegerField;
    tRLMedia: TFloatField;
    Paginas: TcxPageControl;
    tsGeral: TcxTabSheet;
    tsLoja: TcxTabSheet;
    tvL: TcxGridDBTableView;
    glL: TcxGridLevel;
    gridL: TcxGrid;
    gridG: TcxGrid;
    tvG: TcxGridDBTableView;
    glG: TcxGridLevel;
    dsRG: TDataSource;
    dsRL: TDataSource;
    PB: TProgressBar;
    tvLLoja: TcxGridDBColumn;
    tvLAno: TcxGridDBColumn;
    tvLMes: TcxGridDBColumn;
    tvLDias: TcxGridDBColumn;
    tvLQtd: TcxGridDBColumn;
    tvLMedia: TcxGridDBColumn;
    tvGAno: TcxGridDBColumn;
    tvGMes: TcxGridDBColumn;
    tvGDia: TcxGridDBColumn;
    tvGDS: TcxGridDBColumn;
    tvGLojas: TcxGridDBColumn;
    tvGQtd: TcxGridDBColumn;
    tvGMedia: TcxGridDBColumn;
    edE: TcxSpinEdit;
    edD: TcxSpinEdit;
    edC: TcxSpinEdit;
    edB: TcxSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    tRLCateg: TStringField;
    tvLCateg: TcxGridDBColumn;
    mt: TkbmMemTable;
    mtRedirs: TIntegerField;
    mtLojas: TIntegerField;
    mtRD: TFloatField;
    mtAno: TWordField;
    mtMes: TWordField;
    mtRedirB: TIntegerField;
    mtRedirC: TIntegerField;
    mtRedirD: TIntegerField;
    mtRedirE: TIntegerField;
    mtRedirA: TIntegerField;
    mtLojasA: TIntegerField;
    mtLojasB: TIntegerField;
    mtLojasC: TIntegerField;
    mtLojasD: TIntegerField;
    mtLojasE: TIntegerField;
    cxTabSheet1: TcxTabSheet;
    glC: TcxGridLevel;
    gridC: TcxGrid;
    Panel1: TPanel;
    Button3: TButton;
    mtRedirAp: TFloatField;
    mtRedirBp: TFloatField;
    mtRedirCp: TFloatField;
    mtRedirDp: TFloatField;
    mtRedirEp: TFloatField;
    mtRedirOp: TFloatField;
    mtRedirO: TIntegerField;
    mtLojasO: TIntegerField;
    mtLojasAp: TFloatField;
    mtLojasBp: TFloatField;
    mtLojasCp: TFloatField;
    mtLojasOp: TFloatField;
    mtLojasDp: TFloatField;
    mtLojasEp: TFloatField;
    tvC: TcxGridDBBandedTableView;
    dsMT: TDataSource;
    tvCRedirs: TcxGridDBBandedColumn;
    tvCLojas: TcxGridDBBandedColumn;
    tvCRD: TcxGridDBBandedColumn;
    tvCAno: TcxGridDBBandedColumn;
    tvCMes: TcxGridDBBandedColumn;
    tvCRedirA: TcxGridDBBandedColumn;
    tvCRedirB: TcxGridDBBandedColumn;
    tvCRedirC: TcxGridDBBandedColumn;
    tvCRedirD: TcxGridDBBandedColumn;
    tvCRedirE: TcxGridDBBandedColumn;
    tvCLojasA: TcxGridDBBandedColumn;
    tvCLojasB: TcxGridDBBandedColumn;
    tvCLojasC: TcxGridDBBandedColumn;
    tvCLojasD: TcxGridDBBandedColumn;
    tvCLojasE: TcxGridDBBandedColumn;
    tvCRedirAp: TcxGridDBBandedColumn;
    tvCRedirBp: TcxGridDBBandedColumn;
    tvCRedirCp: TcxGridDBBandedColumn;
    tvCRedirDp: TcxGridDBBandedColumn;
    tvCRedirEp: TcxGridDBBandedColumn;
    tvCRedirOp: TcxGridDBBandedColumn;
    tvCRedirO: TcxGridDBBandedColumn;
    tvCLojasO: TcxGridDBBandedColumn;
    tvCLojasAp: TcxGridDBBandedColumn;
    tvCLojasBp: TcxGridDBBandedColumn;
    tvCLojasCp: TcxGridDBBandedColumn;
    tvCLojasOp: TcxGridDBBandedColumn;
    tvCLojasDp: TcxGridDBBandedColumn;
    tvCLojasEp: TcxGridDBBandedColumn;
    tRLA: TnxTable;
    mtVLojas: TIntegerField;
    mtVPerc: TFloatField;
    mtVMed: TFloatField;
    mtVLojasNeg: TIntegerField;
    mtVLojasPos: TIntegerField;
    cxTabSheet2: TcxTabSheet;
    Panel2: TPanel;
    Button1: TButton;
    mtM: TkbmMemTable;
    mtMAno: TWordField;
    mtMMes: TWordField;
    mtMVLojas: TIntegerField;
    mtMVPerc: TFloatField;
    mtMVMed: TFloatField;
    mtMVLojasNeg: TIntegerField;
    mtMVLojasPos: TIntegerField;
    mtMVLojasA: TIntegerField;
    mtMVLojasB: TIntegerField;
    mtMVLojasC: TIntegerField;
    mtMVLojasD: TIntegerField;
    mtMVLojasE: TIntegerField;
    mtMVPercA: TFloatField;
    mtMVPercB: TFloatField;
    mtMVPercC: TFloatField;
    mtMVPercD: TFloatField;
    mtMVPercE: TFloatField;
    mtMVMedA: TFloatField;
    mtMVMedB: TFloatField;
    mtMVMedC: TFloatField;
    mtMVMedD: TFloatField;
    mtMVMedE: TFloatField;
    dsMTM: TDataSource;
    glM: TcxGridLevel;
    gridM: TcxGrid;
    tvM: TcxGridDBBandedTableView;
    tvMAno: TcxGridDBBandedColumn;
    tvMMes: TcxGridDBBandedColumn;
    tvMVLojas: TcxGridDBBandedColumn;
    tvMVMed: TcxGridDBBandedColumn;
    tvMVLojasNeg: TcxGridDBBandedColumn;
    tvMVLojasPos: TcxGridDBBandedColumn;
    tvMVLojasA: TcxGridDBBandedColumn;
    tvMVLojasB: TcxGridDBBandedColumn;
    tvMVLojasC: TcxGridDBBandedColumn;
    tvMVLojasD: TcxGridDBBandedColumn;
    tvMVLojasE: TcxGridDBBandedColumn;
    tvMVMedA: TcxGridDBBandedColumn;
    tvMVMedB: TcxGridDBBandedColumn;
    tvMVMedC: TcxGridDBBandedColumn;
    tvMVMedD: TcxGridDBBandedColumn;
    tvMVMedE: TcxGridDBBandedColumn;
    tRLALoja: TIntegerField;
    tRLAAno: TWordField;
    tRLAMes: TWordField;
    tRLADias: TIntegerField;
    tRLAQtd: TIntegerField;
    tRLAMedia: TFloatField;
    tCli: TnxTable;
    tCliCodigo: TAutoIncField;
    tCliTipo: TWordField;
    tCliSenha: TStringField;
    tCliCadastroEm: TDateTimeField;
    tCliCadastroPor: TStringField;
    tCliAtualizadoEm: TDateTimeField;
    tCliAtualizadoPor: TStringField;
    tCliLoja: TStringField;
    tCliRazaoSocial: TStringField;
    tCliPais: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliEndereco: TnxMemoField;
    tCliCEP: TStringField;
    tCliBairro: TStringField;
    tCliSerieHD: TStringField;
    tCliCodEquip: TStringField;
    tCliNumMaq: TWordField;
    tCliCNPJ: TStringField;
    tCliIE: TStringField;
    tCliObs: TnxMemoField;
    tCliTelefones: TnxMemoField;
    tCliEmailReg: TnxMemoField;
    tCliFormaPagto: TnxMemoField;
    tCliLicMaq: TWordField;
    tCliLicTipo: TWordField;
    tCliLicVenc: TDateField;
    tCliManInicio: TDateField;
    tCliManVenc: TDateField;
    tCliProprietarios: TnxMemoField;
    tCliGerente: TStringField;
    tCliTipoLoja: TWordField;
    tCliEmailTec: TnxMemoField;
    tCliValor: TCurrencyField;
    tCliValorRec: TCurrencyField;
    tCliEmitirNF: TBooleanField;
    tCliMessenger: TnxMemoField;
    tCliICQ: TnxMemoField;
    tCliUObtemLic: TDateTimeField;
    tCliUVersao: TStringField;
    tCliCAno: TWordField;
    tCliCMes: TWordField;
    tCliCDia: TWordField;
    tCliAAno: TWordField;
    tCliAMes: TWordField;
    tCliADia: TWordField;
    tCliUAno: TWordField;
    tCliUMes: TWordField;
    tCliUDia: TWordField;
    tCliUDias: TWordField;
    tCliMotivoDesist: TStringField;
    tCliLastAdminPopup: TDateTimeField;
    tCliutmccn: TIntegerField;
    tCliutmctr: TIntegerField;
    tCliutmcct: TIntegerField;
    tCliutmcsr: TIntegerField;
    tCliutmcmd: TIntegerField;
    tCliNegociacao: TWordField;
    tCliStatus: TIntegerField;
    tCliContatarEm: TDateTimeField;
    tCliPrograma: TWordField;
    tCliBloqueado: TBooleanField;
    tCliCliente: TBooleanField;
    tCliAtivado: TBooleanField;
    tCliCodAtivacao: TStringField;
    tCliEmailConta: TStringField;
    tCliAtivadoEm: TDateTimeField;
    tCliTipoConta: TWordField;
    tCliPremiumAte: TDateTimeField;
    tCliCodDesc: TStringField;
    tCliRedirT: TIntegerField;
    tCliRedirI: TDateTimeField;
    Button4: TButton;
    tCliCampanha: TStringField;
    procedure btnAtualizaClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cmExpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tRLCalcFields(DataSet: TDataSet);
    procedure Button3Click(Sender: TObject);
    procedure mtCalcFields(DataSet: TDataSet);
    procedure mtMCalcFields(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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

procedure TForm13.btnAtualizaClick(Sender: TObject);
begin
  Paginas.Visible := False;
  lbCalc.Visible := True;
  Timer1.Enabled := True;
end;

procedure TForm13.Button1Click(Sender: TObject);
var V : Double;

function prevMes: Integer;
begin
  Result := tRLMes.Value;
  if Result=1 then 
    Result := 12 else
    Result := Result - 1;
end;

function prevAno: Integer;
begin
  Result := tRLAno.Value;
  if tRLMes.Value=1 then Dec(Result);
end;

begin
  PB.Visible := True;
  try
    dsMTM.Dataset := nil;
    dsRL.Dataset := nil;
    dsMT.DataSet := nil;

    tRL.DisableControls;
    mtM.DisableControls;
    mt.DisableControls;
    
    
    PB.Max := tRL.RecordCount;
    PB.Position := 1;
    mtM.Active := False;
    mtM.Active := True;
    tRLA.Active := True;
    
    tRL.First;
    while not tRL.Eof do begin
      PB.Position := PB.Position + 1;
//      PB.Repaint;
      lbCalc.Caption := IntToStr(PB.Position);
      Application.ProcessMessages;
      
      if tRLLoja.Value > 0 then 
      if (tRLAno.Value<>2010) or (tRLMes.Value<>6) then 
      if (tRLDias.Value>=10) and 
         tRLA.FindKey([tRLLoja.Value, prevAno, prevMes]) and 
         (tRLADias.Value>=10) and 
         (tRLAMedia.Value>0) and
         ((tRLMedia.Value/tRLAMedia.Value)<4) then 
      begin
        if not mtM.FindKey([tRLAno.Value, tRLMes.Value]) then begin
          mtM.Insert;
          mtMAno.Value := tRLAno.Value;
          mtMMes.Value := tRLMes.Value;
        end else 
          mtM.Edit;
                                  
        mtMVLojas.Value := mtMVLojas.Value + 1;
        V := ((tRLMedia.Value / tRLAMedia.Value) - 1) * 100;

        if V>=0 then
          mtMVLojasPos.Value := mtMVLojasPos.Value + 1 else
          mtMVLojasNeg.Value := mtMVLojasNeg.Value + 1;
                                                                          
        mtMVPerc.Value := mtMVPerc.Value + V;
        case tRLCateg.Value[1] of
          'A' : begin
            mtMVLojasA.Value := mtMVLojasA.Value  + 1;
            mtMVPercA.Value := mtMVPercA.Value + V;
          end;
          'B' : begin
            mtMVLojasB.Value := mtMVLojasB.Value  + 1;
            mtMVPercB.Value := mtMVPercB.Value + V;
          end;
          'C' : begin
            mtMVLojasC.Value := mtMVLojasC.Value  + 1;
            mtMVPercC.Value := mtMVPercC.Value + V;
          end;
          'D' : begin
            mtMVLojasD.Value := mtMVLojasD.Value  + 1;
            mtMVPercD.Value := mtMVPercD.Value + V;
          end;
          'E' : begin
            mtMVLojasE.Value := mtMVLojasE.Value  + 1;
            mtMVPercE.Value := mtMVPercE.Value + V;
          end;
        end;
        mtM.Post;
      end;
      
      tRL.Next;
    end;
  
  finally
    dsMTM.Dataset := mtM;
    dsRL.Dataset := tRL;
    dsMT.Dataset := mt;

    tRL.EnableControls;
    mtM.EnableControls;
    mt.EnableControls;
    
    PB.Visible := False;
  end;
end;

procedure TForm13.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm13.Button3Click(Sender: TObject);
begin
  PB.Visible := True;
  try
    dsMT.Dataset := nil;
    dsRL.Dataset := nil;
    PB.Max := tRL.RecordCount;
    PB.Position := 1;
    mt.Active := False;
    mt.Active := True;
    tRL.First;
    while not tRL.Eof do begin
      PB.Position := PB.Position + 1;
      PB.Repaint;
      if not mt.FindKey([tRLAno.Value, tRLMes.Value]) then begin
        mt.Insert;
        mtAno.Value := tRLAno.Value;
        mtMes.Value := tRLMes.Value;
      end else 
        mt.Edit;
      mtLojas.Value := mtLojas.Value + 1;
      mtRedirs.Value := mtRedirs.Value + tRLQtd.Value;
      mtRD.Value := mtRD.Value + tRLMedia.Value;
      case tRLCateg.Value[1] of
        'A' : begin
          mtRedirA.Value := mtRedirA.Value + tRLQtd.Value;
          mtLojasA.Value := mtLojasA.Value + 1;
        end;
        'B' : begin
          mtRedirB.Value := mtRedirB.Value + tRLQtd.Value;
          mtLojasB.Value := mtLojasB.Value + 1;
        end;
        'C' : begin
          mtRedirC.Value := mtRedirC.Value + tRLQtd.Value;
          mtLojasC.Value := mtLojasC.Value + 1;
        end;
        'D' : begin
          mtRedirD.Value := mtRedirD.Value + tRLQtd.Value;
          mtLojasD.Value := mtLojasD.Value + 1;
        end;
        'E' : begin
          mtRedirE.Value := mtRedirE.Value + tRLQtd.Value;
          mtLojasE.Value := mtLojasE.Value + 1;
        end;
        'O' : begin
          mtRedirO.Value := mtRedirO.Value + tRLQtd.Value;
          mtLojasO.Value := mtLojasO.Value + 1;
        end;
      end;
      mt.Post;
      
      tRL.Next;
    end;
  
  finally
    dsMT.Dataset := mt;
    dsRL.Dataset := tRL;
    PB.Visible := False;
  end;
end;

procedure TForm13.Button4Click(Sender: TObject);
var T, I: Integer;
begin
  lbCalc.Visible := True;
  tR.Active := True;
  tCli.Active := True;
  tRL.Active := True;
  tRL.IndexName := 'ILojaAnoMes';
  tR.IndexName := 'ILojaDataH';
  PB.Visible := True;
  tCli.First;
  PB.Max := tCli.RecordCount;
  PB.Position := 0;
  dsRL.Dataset := nil;
  while not tCli.Eof do begin
    if tR.FindKey([tCliCodigo.Value]) then begin
      T := 0;
      if tRL.FindKey([tCliCodigo.Value]) then
      while (not tRL.Eof) and (tRLLoja.Value=tCliCodigo.Value) do begin
        T := T + tRLQtd.Value;
        tRL.Next;
      end;
      tCli.Edit;
      tCliRedirI.Value := tRData.Value;
      tCliRedirT.Value := T;
      tCli.Post;
    end;
    PB.Position := PB.Position + 1;       
    lbCalc.Caption := 'Processando ' + IntToStr(PB.Position) + ' / ' + IntToStr(PB.Max);
    Application.ProcessMessages;
    tCli.Next;
  end;
  dsRL.Dataset := tRL;
  PB.Visible := False;
end;

procedure TForm13.cmExpClick(Sender: TObject);
const
  Exts: Array[1..3] of String = ('xls', 'htm', 'txt');

var G: TcxGrid;  
begin
  case Paginas.ActivePageIndex of
    0 : G := gridG;
    1 : G := gridL;
    2 : G := gridC;
    3 : G := gridM;
  end;
                                                                                                                  
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

procedure TForm13.FormShow(Sender: TObject);
begin
  Button4.Visible := SameText('imp', ParamStr(1));
  tRL.Active := True;
  tRG.Active := True;
end;

procedure TForm13.mtCalcFields(DataSet: TDataSet);
begin
  if mtLojas.Value > 0 then begin 
    mtLojasAp.Value := Trunc((mtLojasA.Value / mtLojas.Value) * 1000) / 10;
    mtLojasBp.Value := Trunc((mtLojasB.Value / mtLojas.Value) * 1000) / 10;
    mtLojasCp.Value := Trunc((mtLojasC.Value / mtLojas.Value) * 1000) / 10;
    mtLojasDp.Value := Trunc((mtLojasD.Value / mtLojas.Value) * 1000) / 10;
    mtLojasEp.Value := Trunc((mtLojasE.Value / mtLojas.Value) * 1000) / 10;
    mtLojasOp.Value := Trunc((mtLojasO.Value / mtLojas.Value) * 1000) / 10;
  end;

  if mtRedirs.Value > 0 then begin
    mtRedirAp.Value := Trunc((mtRedirA.Value / mtRedirs.Value) * 1000) / 10;
    mtRedirBp.Value := Trunc((mtRedirB.Value / mtRedirs.Value) * 1000) / 10;
    mtRedirCp.Value := Trunc((mtRedirC.Value / mtRedirs.Value) * 1000) / 10;
    mtRedirDp.Value := Trunc((mtRedirD.Value / mtRedirs.Value) * 1000) / 10;
    mtRedirEp.Value := Trunc((mtRedirE.Value / mtRedirs.Value) * 1000) / 10;
    mtRedirOp.Value := Trunc((mtRedirO.Value / mtRedirs.Value) * 1000) / 10;
  end;
end;

procedure TForm13.mtMCalcFields(DataSet: TDataSet);
begin
  if mtMVLojas.Value > 0 then 
    mtMVMed.Value := Trunc((mtMVPerc.Value / mtMVLojas.Value) * 10) / 10;

  if mtMVLojasA.Value > 0 then
    mtMVMedA.Value := Trunc((mtMVPercA.Value / mtMVLojasA.Value) * 10) / 10; 

  if mtMVLojasB.Value > 0 then
    mtMVMedB.Value := Trunc((mtMVPercB.Value / mtMVLojasB.Value) * 10) / 10;  
    
  if mtMVLojasC.Value > 0 then
    mtMVMedC.Value := Trunc((mtMVPercC.Value / mtMVLojasC.Value) * 10) / 10;  
    
  if mtMVLojasD.Value > 0 then
    mtMVMedD.Value := Trunc((mtMVPercD.Value / mtMVLojasD.Value) * 10) / 10;  
    
  if mtMVLojasE.Value > 0 then
    mtMVMedE.Value := Trunc((mtMVPercE.Value / mtMVLojasE.Value) * 10) / 10;  
end;

procedure TForm13.Processa;
var 
  D: TDateTime;
  Loja : Integer;
  Ano, Mes, Dia, AnoF, MesF, DiaF, DiaA : Word;
begin
  nxTCP.Active := True;
  nxDB.Active := True;

  tR.Active := True;
  tCli.Active := True;
  tRL.Active := True;
  tRG.Active := True;
  dsRL.Dataset := nil;
  dsRG.Dataset := nil;
  tRl.DisableControls;
  tRG.DisableControls;
  Loja := -1;
  DiaA := 0;
  PB.Visible := True;
  try
    if tRG.IsEmpty then 
      D := EncodeDate(2010, 1, 1)
    else begin
      tRG.Last;
      D := EncodeDate(tRGAno.Value, tRGMes.Value, tRGDia.Value)+1;
    end;
    tR.SetRange([D], [Date-1]);
    tR.First;
    PB.Max := tR.RecordCount;
    while not tR.Eof do begin
      if not tRG.FindKey([tRAno.Value, tRMes.Value, tRDia.Value]) then 
      begin
        tRG.Insert;
        tRGAno.Value := tRAno.Value;
        tRGMes.Value := tRMes.Value;
        tRGDia.Value := tRDia.Value;
        tRGDS.Value := DayOfWeek(EncodeDate(tRAno.Value, tRMes.Value, tRDia.Value));
      end else
        tRG.Edit;

      if tRLoja.Value<>0 then begin  
        if tCli.FindKey([tRLoja.Value]) then begin
          tCli.Edit;
          tCliRedirT.Value := tCliRedirT.Value + tRQtd.Value;
          if tCliRedirI.IsNull then
            tCliRedirI.Value := tRData.Value;
          tCli.Post;
        end;
        if Loja <> tRLoja.Value then
          tRGLojas.Value := tRGLojas.Value + 1;  
          
        tRGQtd.Value := tRGQtd.Value + tRQtd.Value;
  
        if tRGLojas.Value=0 then
          tRGMedia.Value := 0 else
          tRGMedia.Value := tRGQtd.Value / tRGLojas.Value;

        if not tRL.FindKey([tRLoja.Value, tRAno.Value, tRMes.Value]) then begin
          tRL.Insert;
          tRLLoja.Value := tRLoja.Value;
          tRLAno.Value := tRAno.Value;
          tRLMes.Value := tRMes.Value;
        end else
          tRL.Edit;

        if (DiaA <> tRDia.Value) or (Loja <> tRLoja.Value) then 
          tRLDias.Value := tRLDias.Value + 1;

        tRLQtd.Value := tRLQtd.Value + tRQtd.Value;

        if tRLDias.Value > 0 then
          tRLMedia.Value := tRLQtd.Value / tRLDias.Value else
          tRLMedia.Value := 0;
        tRL.Post;  
      end;
      tRG.Post;

      Loja := tRLoja.Value;
      DiaA := tRDia.Value;
      
      tR.Next;
      PB.Position := PB.Position + 1;
      
      if (PB.Position div 10) = 0 then begin 
        lbCalc.Caption := IntToStr(PB.Position) + '/' + IntTostr(PB.Max);
        Application.ProcessMessages;
      end;
    end;
    
  
  finally
    PB.Visible := False;
    dsRL.Dataset := tRL;
    dsRG.Dataset := tRG;
    tRL.EnableControls;
    tRG.EnableControls;
    Paginas.Visible := True;
  end;

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

procedure TForm13.tRLCalcFields(DataSet: TDataSet);
begin
  if tRLDias.Value<10 then
    tRLCateg.Value := 'O'
  else
  if tRLMedia.Value < (edE.Value+1) then
    tRLCateg.Value := 'E'
  else
  if tRLMedia.Value < (edD.Value+1) then
    tRLCateg.Value := 'D'
  else
  if tRLMedia.Value < (edC.Value+1) then
    tRLCateg.Value := 'C'
  else
  if tRLMedia.Value < (edB.Value+1) then
    tRLCateg.Value := 'B' else
    tRLCateg.Value := 'A'
end;

end.



