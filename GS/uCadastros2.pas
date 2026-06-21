unit uCadastros2;

interface

uses
  Windows, Messages, SysUtils, DateUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxsdServerEngine, nxreRemoteServerEngine, nxdb,
  nxllComponent, cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxPC, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxImageComboBox, cxSpinEdit, 
  StdCtrls, LMDControl, ExtCtrls, cxLookAndFeels,
  cxLookAndFeelPainters, 
  kbmMemTable, cxMaskEdit, cxDropDownEdit,
  cxContainer, cxTextEdit, cxGridBandedTableView, cxGridDBBandedTableView,
  cxCalendar, dxSkinscxPCPainter, Spin;

type
  TForm13 = class(TForm)
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    nxRSE: TnxRemoteServerEngine;
    nxTCP: TnxWinsockTransport;
    LMDSimplePanel1: TLMDSimplePanel;
    Button1: TButton;
    Button2: TButton;
    lbCalc: TLabel;
    Timer1: TTimer;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cmCidade: TButton;
    dlgExp: TSaveDialog;
    tL: TnxTable;
    dsLojas: TDataSource;
    cmExp: TButton;
    Q: TnxQuery;
    tLCodigo: TAutoIncField;
    tLTipo: TWordField;
    tLSenha: TStringField;
    tLCadastroEm: TDateTimeField;
    tLCadastroCompleto: TBooleanField;
    tLCadastroCompletoEm: TDateTimeField;
    tLCadastroPor: TStringField;
    tLRegistroEm: TDateTimeField;
    tLAtualizadoEm: TDateTimeField;
    tLAtualizadoPor: TStringField;
    tLLoja: TStringField;
    tLRazaoSocial: TStringField;
    tLPais: TStringField;
    tLCidade: TStringField;
    tLCidade_geoip: TStringField;
    tLUF_geoip: TStringField;
    tLUF: TStringField;
    tLEndereco: TStringField;
    tLCEP: TStringField;
    tLBairro: TStringField;
    tLSerieHD: TStringField;
    tLCodEquip: TStringField;
    tLNumMaq: TWordField;
    tLCNPJ: TStringField;
    tLIE: TStringField;
    tLObs: TnxMemoField;
    tLTels: TnxMemoField;
    tLEmailReg: TnxMemoField;
    tLFormaPagto: TnxMemoField;
    tLLicMaq: TWordField;
    tLLicTipo: TWordField;
    tLLicVenc: TDateField;
    tLManInicio: TDateField;
    tLManVenc: TDateField;
    tLProp: TnxMemoField;
    tLProprietario: TStringField;
    tLGerente: TStringField;
    tLTipoLoja: TWordField;
    tLEmailTec: TnxMemoField;
    tLValor: TCurrencyField;
    tLValorRec: TCurrencyField;
    tLEmitirNF: TBooleanField;
    tLMessenger: TnxMemoField;
    tLICQ: TnxMemoField;
    tLUObtemLic: TDateTimeField;
    tLUVersao: TStringField;
    tLXVersao: TWordField;
    tLContaTrocada: TBooleanField;
    tLCAno: TWordField;
    tLCMes: TWordField;
    tLCDia: TWordField;
    tLAAno: TWordField;
    tLAMes: TWordField;
    tLADia: TWordField;
    tLUAno: TWordField;
    tLUMes: TWordField;
    tLUDia: TWordField;
    tLUDias: TWordField;
    tLMotivoDesist: TStringField;
    tLLastAdminPopup: TDateTimeField;
    tLCampanha: TStringField;
    tLutmccn: TIntegerField;
    tLutmctr: TIntegerField;
    tLutmcct: TIntegerField;
    tLutmcsr: TIntegerField;
    tLutmcmd: TIntegerField;
    tLNegociacao: TWordField;
    tLContatarEm: TDateTimeField;
    tLPrograma: TWordField;
    tLBloqueado: TBooleanField;
    tLCliente: TBooleanField;
    tLAtivado: TBooleanField;
    tLCodAtivacao: TStringField;
    tLEmailConta: TStringField;
    tLAtivadoEm: TDateTimeField;
    tLTipoConta: TWordField;
    tLPremiumAte: TDateTimeField;
    tLCodDesc: TStringField;
    tLOrigem: TStringField;
    tLRedirT: TIntegerField;
    tLRedirI: TDateTimeField;
    tLTel1: TStringField;
    tLTel2: TStringField;
    tLTel3: TStringField;
    tLTel4: TStringField;
    tLTipoTel1: TWordField;
    tLTipoTel2: TWordField;
    tLTipoTel3: TWordField;
    tLTipoTel4: TWordField;
    tLUpdateCad: TIntegerField;
    tLUpdateMkt: TIntegerField;
    tLUpdateContato: TIntegerField;
    tLDBounce: TDateTimeField;
    tLDInativo: TDateTimeField;
    tLInstalouEm: TDateTimeField;
    tLBounce: TBooleanField;
    tLInativo: TBooleanField;
    tLConfirmouLocal: TBooleanField;
    tLPreRegistro: TBooleanField;
    tLPreRegistroIP: TStringField;
    tLPreRegistroEm: TDateTimeField;
    tLContatoCC: TBooleanField;
    tLStatus: TWordField;
    tLStatusDesde: TDateTimeField;
    tLRecente: TBooleanField;
    tLParouRedir: TBooleanField;
    tLPremium: TBooleanField;
    tLFezRedir: TBooleanField;
    tLRedirU: TDateTimeField;
    tLRedirD: TWordField;
    tLUsou: TBooleanField;
    tLSaiu: TBooleanField;
    tLVaiVoltar: TBooleanField;
    tLVaiVoltarAte: TDateTimeField;
    tLCCContatoOk: TBooleanField;
    tLCCContatoFail: TBooleanField;
    tLCCPContatoOk: TDateTimeField;
    tLCCPContatoFail: TDateTimeField;
    tLCCUContatoOk: TDateTimeField;
    tLCCUContatoFail: TDateTimeField;
    tLCCQContatoOK: TIntegerField;
    tLCCQContatoFail: TIntegerField;
    tLCCAgente: TIntegerField;
    tvGrid: TcxGridDBTableView;
    glGrid: TcxGridLevel;
    Grid: TcxGrid;
    tvGridCodigo: TcxGridDBColumn;
    tvGridTipo: TcxGridDBColumn;
    tvGridSenha: TcxGridDBColumn;
    tvGridCadastroEm: TcxGridDBColumn;
    tvGridCadastroCompleto: TcxGridDBColumn;
    tvGridCadastroCompletoEm: TcxGridDBColumn;
    tvGridCadastroPor: TcxGridDBColumn;
    tvGridRegistroEm: TcxGridDBColumn;
    tvGridAtualizadoEm: TcxGridDBColumn;
    tvGridAtualizadoPor: TcxGridDBColumn;
    tvGridLoja: TcxGridDBColumn;
    tvGridRazaoSocial: TcxGridDBColumn;
    tvGridPais: TcxGridDBColumn;
    tvGridCidade: TcxGridDBColumn;
    tvGridCidade_geoip: TcxGridDBColumn;
    tvGridUF_geoip: TcxGridDBColumn;
    tvGridUF: TcxGridDBColumn;
    tvGridEndereco: TcxGridDBColumn;
    tvGridCEP: TcxGridDBColumn;
    tvGridBairro: TcxGridDBColumn;
    tvGridSerieHD: TcxGridDBColumn;
    tvGridCodEquip: TcxGridDBColumn;
    tvGridNumMaq: TcxGridDBColumn;
    tvGridCNPJ: TcxGridDBColumn;
    tvGridIE: TcxGridDBColumn;
    tvGridObs: TcxGridDBColumn;
    tvGridTels: TcxGridDBColumn;
    tvGridEmailReg: TcxGridDBColumn;
    tvGridFormaPagto: TcxGridDBColumn;
    tvGridLicMaq: TcxGridDBColumn;
    tvGridLicTipo: TcxGridDBColumn;
    tvGridLicVenc: TcxGridDBColumn;
    tvGridManInicio: TcxGridDBColumn;
    tvGridManVenc: TcxGridDBColumn;
    tvGridProp: TcxGridDBColumn;
    tvGridProprietario: TcxGridDBColumn;
    tvGridGerente: TcxGridDBColumn;
    tvGridTipoLoja: TcxGridDBColumn;
    tvGridEmailTec: TcxGridDBColumn;
    tvGridValor: TcxGridDBColumn;
    tvGridValorRec: TcxGridDBColumn;
    tvGridEmitirNF: TcxGridDBColumn;
    tvGridMessenger: TcxGridDBColumn;
    tvGridICQ: TcxGridDBColumn;
    tvGridUObtemLic: TcxGridDBColumn;
    tvGridUVersao: TcxGridDBColumn;
    tvGridXVersao: TcxGridDBColumn;
    tvGridContaTrocada: TcxGridDBColumn;
    tvGridCAno: TcxGridDBColumn;
    tvGridCMes: TcxGridDBColumn;
    tvGridCDia: TcxGridDBColumn;
    tvGridAAno: TcxGridDBColumn;
    tvGridAMes: TcxGridDBColumn;
    tvGridADia: TcxGridDBColumn;
    tvGridUAno: TcxGridDBColumn;
    tvGridUMes: TcxGridDBColumn;
    tvGridUDia: TcxGridDBColumn;
    tvGridUDias: TcxGridDBColumn;
    tvGridMotivoDesist: TcxGridDBColumn;
    tvGridLastAdminPopup: TcxGridDBColumn;
    tvGridCampanha: TcxGridDBColumn;
    tvGridutmccn: TcxGridDBColumn;
    tvGridutmctr: TcxGridDBColumn;
    tvGridutmcct: TcxGridDBColumn;
    tvGridutmcsr: TcxGridDBColumn;
    tvGridutmcmd: TcxGridDBColumn;
    tvGridNegociacao: TcxGridDBColumn;
    tvGridContatarEm: TcxGridDBColumn;
    tvGridPrograma: TcxGridDBColumn;
    tvGridBloqueado: TcxGridDBColumn;
    tvGridCliente: TcxGridDBColumn;
    tvGridAtivado: TcxGridDBColumn;
    tvGridCodAtivacao: TcxGridDBColumn;
    tvGridEmailConta: TcxGridDBColumn;
    tvGridAtivadoEm: TcxGridDBColumn;
    tvGridTipoConta: TcxGridDBColumn;
    tvGridPremiumAte: TcxGridDBColumn;
    tvGridCodDesc: TcxGridDBColumn;
    tvGridOrigem: TcxGridDBColumn;
    tvGridRedirT: TcxGridDBColumn;
    tvGridRedirI: TcxGridDBColumn;
    tvGridTel1: TcxGridDBColumn;
    tvGridTel2: TcxGridDBColumn;
    tvGridTel3: TcxGridDBColumn;
    tvGridTel4: TcxGridDBColumn;
    tvGridTipoTel1: TcxGridDBColumn;
    tvGridTipoTel2: TcxGridDBColumn;
    tvGridTipoTel3: TcxGridDBColumn;
    tvGridTipoTel4: TcxGridDBColumn;
    tvGridUpdateCad: TcxGridDBColumn;
    tvGridUpdateMkt: TcxGridDBColumn;
    tvGridUpdateContato: TcxGridDBColumn;
    tvGridDBounce: TcxGridDBColumn;
    tvGridDInativo: TcxGridDBColumn;
    tvGridInstalouEm: TcxGridDBColumn;
    tvGridBounce: TcxGridDBColumn;
    tvGridInativo: TcxGridDBColumn;
    tvGridConfirmouLocal: TcxGridDBColumn;
    tvGridPreRegistro: TcxGridDBColumn;
    tvGridPreRegistroIP: TcxGridDBColumn;
    tvGridPreRegistroEm: TcxGridDBColumn;
    tvGridContatoCC: TcxGridDBColumn;
    tvGridStatus: TcxGridDBColumn;
    tvGridStatusDesde: TcxGridDBColumn;
    tvGridRecente: TcxGridDBColumn;
    tvGridParouRedir: TcxGridDBColumn;
    tvGridPremium: TcxGridDBColumn;
    tvGridFezRedir: TcxGridDBColumn;
    tvGridRedirU: TcxGridDBColumn;
    tvGridRedirD: TcxGridDBColumn;
    tvGridUsou: TcxGridDBColumn;
    tvGridSaiu: TcxGridDBColumn;
    tvGridVaiVoltar: TcxGridDBColumn;
    tvGridVaiVoltarAte: TcxGridDBColumn;
    tvGridCCContatoOk: TcxGridDBColumn;
    tvGridCCContatoFail: TcxGridDBColumn;
    tvGridCCPContatoOk: TcxGridDBColumn;
    tvGridCCPContatoFail: TcxGridDBColumn;
    tvGridCCUContatoOk: TcxGridDBColumn;
    tvGridCCUContatoFail: TcxGridDBColumn;
    tvGridCCQContatoOK: TcxGridDBColumn;
    tvGridCCQContatoFail: TcxGridDBColumn;
    tvGridCCAgente: TcxGridDBColumn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cmCidadeClick(Sender: TObject);
    procedure cmExpClick(Sender: TObject);
  private
    { Private declarations }
    procedure Processa;  
    procedure ExportaCallCenter;
  public
    procedure RefreshAR2;
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses cxGridExportlink, uLicEXECryptor, rtcInfo, uCadastros_FrmCidade;

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
  lbCalc.Visible := True;
  Timer1.Enabled := True;
end;

procedure TForm13.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm13.cmCidadeClick(Sender: TObject);
var aCidade, aUF : String;
begin
  aCidade := TLCidade.Value;
  aUF := TLUF.Value;

  if TFrmCidade.Create(Self).LeCidadeUF(aCidade, aUF) then begin
    Q.Active := False;
    Q.SQL.Text := 'update cliente set cidade = ' + QuotedStr(aCidade) + ', uf = ' + QuotedStr(aUF) + 
                  ' where cidade = ' + QuotedStr(tLCidade.Value) + ' and uf = ' + QuotedStr(TLUF.Value);
    Q.ExecSQL;
    ShowMessage(IntToStr(Q.RowsAffected)+' Lojas atualizadas');
    Q.Active := False;                 

    TL.Refresh; 
  end;
end;

procedure TForm13.cmExpClick(Sender: TObject);
const
  Exts: Array[1..4] of String = ('xls', 'htm', 'txt', 'csv');
  
var
  G: TcxGrid;  
begin
{  G := gridLojas;
                                                                                                                  
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
      4: ExportaCallCenter;
    end;
  end; }
end;

function SoDig(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
    if S[I] in ['0'..'9']  then 
      Result := Result + S[I];
end;

function extracttel(s: String): string;
var sl : TStrings;
begin
  sl := TStringList.Create;
  try
    sl.text := s;
    result := SoDig(sl[0]);
    if Copy(Result, 1, 1)='0' then Delete(Result, 1, 1);
  finally
    sl.Free;
  end;

end;

procedure TForm13.ExportaCallCenter;
var 
  i, ix, erros: Integer;
  sArq : String;
  sl : TStrings;
//  T: TextFile;
  D, DConv: TDateTime;
  W: Word;
  vUUID, vNome, vEmail, vNome_loja, vCodigo, vOrigem, vTel, vTipoTel, vCidade, vUF, vObs, vDataInc, vCampanha: Variant;

function aspas(v: variant): string;
begin
  if v=null then
    Result := '""' else
    Result := '"'+v+'"';
end;  

begin
  DConv := EncodeDate(2012, 1, 24);
{  AssignFile(T, dlgExp.FileName);
  Rewrite(T);}
{  sArq := '';
  Erros := 0;
  try
    sArq := 'UUID;nome;email;nome_loja;codigo_sistema;origem;telefone;tipo_telefone;cidade;estado;campo_memo;data_inclusao_no_sistema;agendamento;campanha'+#10;
    with tvLojas.DataController do 
    for i := 0 to FilteredRecordCount-1 do 
    try
      ix := FilteredRecordIndex[i];
      vUUID := Values[ix, tvLojasCodigo.Index];
      vNome := Values[ix, tvLojasProprietario.Index];
      vEmail := Values[ix, tvLojasEmailConta.Index];
      vCampanha := Values[ix, tvCampanha.Index];
     try
       D := Values[ix, tvCadastroEm.Index];
     except
       raise exception.Create('falha convertendo variant em date-time');
     end;      
     vNome_Loja := Values[ix, tvLojasLoja.Index];
     if D<DConv then
       vNome_Loja := rtcInfo.UTF8ToAnsi(vNome_Loja); 
       
     if (vEmail=null) or (vEmail='') then
       vCodigo := CodLojaToStr(vUUID) else
       vCodigo := vEmail;
        
     vOrigem := 'Base Interna';
     try
       vTel := Trim(extracttel(Values[ix, tvLojasTel1.Index]));
     except
       vTel := '';
     end;
     try
       W := Values[ix, tvLojasTipoTel1.Index];
       vTipoTel := IntToStr(W);
     except
       vTipoTel := null;
     end;
     vCidade := Values[ix, tvLojasCidade.Index];
     vUF := Values[ix, tvLojasUF.Index];
     vObs := '';

     vDataInc := FormatDateTime('yyyy-mm-dd hh:mm:ss', D);
     sArq := sArq + 
       aspas(IntToStr(vUUID))+','+            
       aspas(vNome)+','+
       aspas(vEmail)+','+
       aspas(vNome_Loja)+','+
       aspas(vCodigo)+','+
       aspas(vOrigem)+','+
       aspas(vTel)+','+
       aspas(vTipoTel)+','+
       aspas(vCidade)+','+
       aspas(vUF)+','+
       aspas(vObs)+','+
       aspas(vDataInc)+','+
       aspas('')+','+
       aspas(vCampanha)+','+#10;
    except   
      Inc(Erros);
    end;
    
    sl := TStringList.Create;
    try
      sl.Text := sArq;
      sl.SaveToFile(dlgExp.FileName);
    finally
      sl.Free;
    end;
    
    ShowMessage('Dados exportados com sucesso... thanks man!');
    
  finally
//    CloseFile(T);
  end;    }
end;

procedure TForm13.Processa;
begin
  nxTCP.Active := False;
  nxTCP.Active := True;
  nxDB.Active := True;

  tL.Active := False;
  tL.BlockReadSize := 5 * 1024 * 1024;
  dsLojas.Dataset := nil;
  tL.Active := True;
  dsLojas.Dataset := tL;
  lbCalc.Visible := False;
end;

procedure TForm13.RefreshAR2;
begin
end;

procedure TForm13.Timer1Timer(Sender: TObject);
var C: Cardinal;
begin
  Timer1.Enabled := False;
  C := GetTickCount;
  Processa;
  lbCalc.Visible := True;
  lbCalc.Caption := IntToStr(GetTickCount - C);
end;

end.


SELECT UAno as Ano, UMes as Mes, UDia as Dia, count(Distinct(Codigo)) as Lojas  FROM "cliente"
where (uobtemlic is not null) and (uobtemlic <= :data)
group by Ano, Mes, Dia
