unit uCadastros;

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
  cxCalendar, dxSkinscxPCPainter, cxPCdxBarPopupMenu;

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
    Label1: TLabel;
    edDias: TcxSpinEdit;
    Label2: TLabel;
    tL: TnxTable;
    dsLojas: TDataSource;
    tLCodigo: TAutoIncField;
    tLTipo: TWordField;
    tLSenha: TStringField;
    tLLoja: TStringField;
    tLRazaoSocial: TStringField;
    tLCidade: TStringField;
    tLUF: TStringField;
    tLCEP: TStringField;
    tLBairro: TStringField;
    tLSerieHD: TStringField;
    tLCodEquip: TStringField;
    tLNumMaq: TWordField;
    tLObs: TnxMemoField;
    tLEmailReg: TnxMemoField;
    tLLicMaq: TWordField;
    tLLicTipo: TWordField;
    tLLicVenc: TDateField;
    tLEmailTec: TnxMemoField;
    tLValor: TCurrencyField;
    tLValorRec: TCurrencyField;
    tLEmitirNF: TBooleanField;
    tLUObtemLic: TDateTimeField;
    tLUVersao: TStringField;
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
    tLAtivado: TBooleanField;
    tLEmailConta: TStringField;
    tLAtivadoEm: TDateTimeField;
    tLPremiumAte: TDateTimeField;
    tLCodDesc: TStringField;
    tLIDias: TIntegerField;
    tLVersao: TIntegerField;
    tLServEmail: TStringField;
    Label6: TLabel;
    edDiasP: TcxSpinEdit;
    Label7: TLabel;
    tLFree: TWordField;
    tLPremium: TWordField;
    tLDefinitivo: TWordField;
    tLJaFoiPremium: TWordField;
    tLAtivo: TSmallintField;
    tLBounce: TSmallintField;
    tLTeste: TSmallintField;
    tLImplantou: TSmallintField;
    tLCadastroEm: TDateTimeField;
    tLCadastroPor: TStringField;
    tLAtualizadoEm: TDateTimeField;
    tLAtualizadoPor: TStringField;
    tLPais: TStringField;
    tLCNPJ: TStringField;
    tLIE: TStringField;
    tLFormaPagto: TnxMemoField;
    tLManInicio: TDateField;
    tLManVenc: TDateField;
    tLGerente: TStringField;
    tLTipoLoja: TWordField;
    tLMessenger: TnxMemoField;
    tLICQ: TnxMemoField;
    tLLastAdminPopup: TDateTimeField;
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
    tLCodAtivacao: TStringField;
    tLTipoConta: TWordField;
    tLRedirT: TIntegerField;
    tLRedirI: TDateTimeField;
    tLCampanha: TStringField;
    cmExp: TButton;
    Q: TnxQuery;
    tLCidade_geoip: TStringField;
    tLUF_geoip: TStringField;
    tLConfirmouLocal: TBooleanField;
    tLCid: TStringField;
    tLuf2: TStringField;
    tLContaTrocada: TBooleanField;
    tLTrocouConta: TSmallintField;
    tLContatoCC: TBooleanField;
    tLContatoCC2: TSmallintField;
    tLOrigem: TStringField;
    tLEndereco: TStringField;
    tLProprietario: TStringField;
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
    tLInativo: TBooleanField;
    tLPreRegistro: TBooleanField;
    tLPreRegistroIP: TStringField;
    tLPreRegistroEm: TDateTimeField;
    tLCadastroCompleto: TBooleanField;
    tLCadastroCompletoEm: TDateTimeField;
    tLRegistroEm: TDateTimeField;
    tLTels: TnxMemoField;
    tLProp: TnxMemoField;
    tLInstalouEm: TDateTimeField;
    tLStatus: TWordField;
    tLStatusDesde: TDateTimeField;
    tLRecente: TBooleanField;
    tLParouRedir: TBooleanField;
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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cmCidadeClick(Sender: TObject);
    procedure tLCalcFields(DataSet: TDataSet);
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
  nxTCP.Active := True;
  nxDB.Active := True;

  tL.Active := False;
  tL.BlockReadSize := 3 * 1024 * 1024;
  dsLojas.Dataset := nil;
  tL.Active := True;
//  dsLojas.Dataset := tL;
  lbCalc.Visible := False;
end;

procedure TForm13.RefreshAR2;
begin
end;

procedure TForm13.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Processa;
end;

procedure TForm13.tLCalcFields(DataSet: TDataSet);
var 
  P: Integer;
  S: String;
begin
  if tLContatoCC.Value then
    TLContatoCC2.Value := 1 else
    TLContatoCC2.Value := 0;
    
  if tLContaTrocada.Value then
    tLTrocouConta.Value := 1 else
    TLTrocouConta.Value := 0;
    
  if not tLUObtemLic.IsNull then begin 
    if (tLUObtemLic.Value > (Date-edDias.Value)) then
      tLAtivo.Value := 1 else
      tLAtivo.Value := 0;
    
    if (tLAtivo.Value=0) then
      tLIDias.Value := Trunc(Date - DateOf(tLUObtemLic.Value));
  end else
    tLAtivo.Value := 0;

  if tLCidade.Value='' then
    tLCid.Value := AnsiUpperCase(tLCidade_geoip.Value) else
    tLCid.Value := tLCidade.Value;

  if tLUF.Value='' then
    tLUF2.Value := tLUF_geoip.Value else
    tLUF2.Value := tLUF.Value;    

  tLImplantou.Value := 0;
  tLTeste.Value := 0;
  tLBounce.Value := 0;  

  if tLUDias.Value>30 then
    tLImplantou.Value := 1 
  else
  if tLUDias.Value>1 then
    tLTeste.Value := 1
  else
    tLBounce.Value := 1;

  if Trim(tLUVersao.Value)>'' then 
    TLVersao.Value := StrToIntDef(Copy(tLUVersao.Value, CHLPos('.', tLUVersao.Value)+1, 6), 0);

  tLPremium.Value := 0;   
  tLFree.Value := 0;
  tLDefinitivo.Value := 0;
  tLJaFoiPremium.Value := 0;

  if (tLLicTipo.Value=5) then begin
    if not tLLicVenc.IsNull then
      tLJaFoiPremium.Value := 1;

    if (not tLLicVenc.IsNull) and ((DateOf(tLLicVenc.Value)>=Date) or ((Date - DateOf(tLLicVenc.Value)) <= edDiasP.Value)) then
      tLPremium.Value := 1 else
      tLFree.Value := 1;
  end else
  if tLLicTipo.Value=2 then
    tLDefinitivo.Value := 1;

  S := Trim(tLEmailConta.Value);
  Delete(S, 1, Pos('@', S));
  Delete(S, Pos('.', S), 999);
{  P := ChLPos('.', S);
  if P>0 then
    Delete(S, P, 999);

  if Copy(S, ChLPos('.', S), 3)  }
    
  if Length(S)>0 then begin
    if SameText('msn', S) or
       SameText('WindowsLive', S) or
       SameText('live', S) then
      S := 'Hotmail';

    if SameText('globomail', S) then
      S := 'Globo';  
    

    if not SameText(S, 'hotmail') and
       not SameText(S, 'gmail') and
       not SameText(S, 'uol') and
       not SameText(S, 'globo') and
       not SameText(S, 'terra') and
       not SameText(S, 'ig') and
       not SameText(S, 'bol') and
       not SameText(S, 'yahoo') and
       not SameText(S, 'oi') and
       not SameText(S, 'r7') and
       not SameText(S, 'ibest') and
       not SameText(S, 'pop') and
       not SameText(S, 'itelefonica') and
       not SameText(S, 'gmail') then
      S := 'Outros';
      
    S := LowerCase(S);
    S[1] := Upcase(S[1]);
  end;  
  tLServEmail.Value := S;
end;

end.


SELECT UAno as Ano, UMes as Mes, UDia as Dia, count(Distinct(Codigo)) as Lojas  FROM "cliente"
where (uobtemlic is not null) and (uobtemlic <= :data)
group by Ano, Mes, Dia
