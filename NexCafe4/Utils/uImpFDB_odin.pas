unit uImpFDB_odin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, Dbf, IBDatabase, IBCustomDataSet, IBTable, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxSkinsCore,
  dxSkinOffice2007Black, dxSkinSeven, dxSkinsDefaultPainters, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TForm16 = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    nxTCP: TnxWinsockTransport;
    nxSE: TnxServerEngine;
    PB: TProgressBar;
    DataSource1: TDataSource;
    IBDB: TIBDatabase;
    tOdin: TIBTable;
    IBTransaction1: TIBTransaction;
    Panel1: TPanel;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    tOdinENTIDADEID: TIntegerField;
    tOdinENTIDADEGRUPOID: TIntegerField;
    tOdinUSUARIOID: TIntegerField;
    tOdinCODIGOBARRA: TIBStringField;
    tOdinNOME: TIBStringField;
    tOdinAPELIDO: TIBStringField;
    tOdinSEXO: TSmallintField;
    tOdinDOCUMENTO: TIBStringField;
    tOdinTELEFONE: TIBStringField;
    tOdinCELULAR: TIBStringField;
    tOdinENDERECO: TIBStringField;
    tOdinBAIRRO: TIBStringField;
    tOdinESTADO: TIBStringField;
    tOdinCIDADE: TIBStringField;
    tOdinCEP: TIBStringField;
    tOdinPAIS: TIBStringField;
    tOdinEMAIL: TIBStringField;
    tOdinNASCIMENTO: TDateTimeField;
    tOdinCADASTRO: TDateTimeField;
    tOdinULTIMAVISITA: TDateTimeField;
    tOdinENTIDADETIPO: TSmallintField;
    tOdinFUNCIONARIOLIMITE: TIBBCDField;
    tOdinCOBRARTIPO: TSmallintField;
    tOdinCOBRARVALORHORA: TIBBCDField;
    tOdinCOBRARCORTESIA: TIntegerField;
    tOdinSENHA: TIBStringField;
    tOdinPROFISSAO: TIBStringField;
    tOdinBLOQUEADO: TIntegerField;
    tOdinMOTIVO: TIBStringField;
    tOdinSALDO: TIBBCDField;
    tOdinBANCOHORA: TIntegerField;
    tOdinMILHAGEM: TIBBCDField;
    tOdinNOMEPAI: TIBStringField;
    tOdinNOMEMAE: TIBStringField;
    tOdinICQ: TIBStringField;
    tOdinMSN: TIBStringField;
    tOdinESCOLA: TIBStringField;
    tOdinESCOLAREGISTRO: TIBStringField;
    tOdinAULAINICIO: TDateTimeField;
    tOdinAULAFINAL: TDateTimeField;
    tOdinAUTORIZACAOMENOR: TSmallintField;
    tOdinPERMISSOES: TBlobField;
    tOdinDIGITAL: TBlobField;
    TVENTIDADEID: TcxGridDBColumn;
    TVENTIDADEGRUPOID: TcxGridDBColumn;
    TVUSUARIOID: TcxGridDBColumn;
    TVCODIGOBARRA: TcxGridDBColumn;
    TVNOME: TcxGridDBColumn;
    TVAPELIDO: TcxGridDBColumn;
    TVSEXO: TcxGridDBColumn;
    TVDOCUMENTO: TcxGridDBColumn;
    TVTELEFONE: TcxGridDBColumn;
    TVCELULAR: TcxGridDBColumn;
    TVENDERECO: TcxGridDBColumn;
    TVBAIRRO: TcxGridDBColumn;
    TVESTADO: TcxGridDBColumn;
    TVCIDADE: TcxGridDBColumn;
    TVCEP: TcxGridDBColumn;
    TVPAIS: TcxGridDBColumn;
    TVEMAIL: TcxGridDBColumn;
    TVNASCIMENTO: TcxGridDBColumn;
    TVCADASTRO: TcxGridDBColumn;
    TVULTIMAVISITA: TcxGridDBColumn;
    TVENTIDADETIPO: TcxGridDBColumn;
    TVFUNCIONARIOLIMITE: TcxGridDBColumn;
    TVCOBRARTIPO: TcxGridDBColumn;
    TVCOBRARVALORHORA: TcxGridDBColumn;
    TVCOBRARCORTESIA: TcxGridDBColumn;
    TVSENHA: TcxGridDBColumn;
    TVPROFISSAO: TcxGridDBColumn;
    TVBLOQUEADO: TcxGridDBColumn;
    TVMOTIVO: TcxGridDBColumn;
    TVSALDO: TcxGridDBColumn;
    TVBANCOHORA: TcxGridDBColumn;
    TVMILHAGEM: TcxGridDBColumn;
    TVNOMEPAI: TcxGridDBColumn;
    TVNOMEMAE: TcxGridDBColumn;
    TVICQ: TcxGridDBColumn;
    TVMSN: TcxGridDBColumn;
    TVESCOLA: TcxGridDBColumn;
    TVESCOLAREGISTRO: TcxGridDBColumn;
    TVAULAINICIO: TcxGridDBColumn;
    TVAULAFINAL: TcxGridDBColumn;
    TVAUTORIZACAOMENOR: TcxGridDBColumn;
    TVPERMISSOES: TcxGridDBColumn;
    TVDIGITAL: TcxGridDBColumn;
    Button3: TButton;
    tCliID: TAutoIncField;
    tCliNome: TStringField;
    tCliEndereco: TStringField;
    tCliBairro: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliCEP: TStringField;
    tCliSexo: TStringField;
    tCliObs: TnxMemoField;
    tCliCpf: TStringField;
    tCliRg: TStringField;
    tCliTelefone: TStringField;
    tCliEmail: TnxMemoField;
    tCliMinutos: TFloatField;
    tCliPassaportes: TFloatField;
    tCliMinutosUsados: TFloatField;
    tCliMinutosIniciais: TFloatField;
    tCliIsento: TBooleanField;
    tCliUsername: TStringField;
    tCliPai: TStringField;
    tCliMae: TStringField;
    tCliSenha: TStringField;
    tCliUltVisita: TDateTimeField;
    tCliDebito: TCurrencyField;
    tCliEscola: TStringField;
    tCliEscolaHI: TDateTimeField;
    tCliEscolaHF: TDateTimeField;
    tCliNickName: TStringField;
    tCliDataNasc: TDateTimeField;
    tCliCelular: TStringField;
    tCliTemDebito: TBooleanField;
    tCliLimiteDebito: TCurrencyField;
    tCliFoto: TGraphicField;
    tCliIncluidoEm: TDateTimeField;
    tCliAlteradoEm: TDateTimeField;
    tCliIncluidoPor: TStringField;
    tCliAlteradoPor: TStringField;
    tCliTitEleitor: TStringField;
    tCliFidPontos: TFloatField;
    tCliFidTotal: TFloatField;
    tCliFidResg: TFloatField;
    tCliAniversario: TStringField;
    tCliCotaImpEspecial: TBooleanField;
    tCliCotaImpDia: TIntegerField;
    tCliCotaImpMes: TIntegerField;
    tCliSemFidelidade: TBooleanField;
    tCliNaoGuardarCredito: TBooleanField;
    tCliPermiteLoginSemCred: TBooleanField;
    tCliCHorario: TIntegerField;
    tCliOpCHorario: TWordField;
    tCliHP1: TIntegerField;
    tCliHP2: TIntegerField;
    tCliHP3: TIntegerField;
    tCliHP4: TIntegerField;
    tCliHP5: TIntegerField;
    tCliHP6: TIntegerField;
    tCliHP7: TIntegerField;
    tCliInativo: TBooleanField;
    tCliTipoAcessoPref: TIntegerField;
    tCliFornecedor: TBooleanField;
    tCliValorCred: TCurrencyField;
    tDeb: TnxTable;
    tDebData: TDateTimeField;
    tDebCliente: TIntegerField;
    tDebValor: TCurrencyField;
    tDebTipo: TWordField;
    tDebID: TIntegerField;
    tMovEst: TnxTable;
    tMovEstID: TAutoIncField;
    tMovEstTran: TIntegerField;
    tMovEstProduto: TIntegerField;
    tMovEstQuant: TFloatField;
    tMovEstUnitario: TCurrencyField;
    tMovEstTotal: TCurrencyField;
    tMovEstCustoU: TCurrencyField;
    tMovEstItem: TWordField;
    tMovEstDesconto: TCurrencyField;
    tMovEstPago: TCurrencyField;
    tMovEstPagoPost: TCurrencyField;
    tMovEstDescPost: TCurrencyField;
    tMovEstDataHora: TDateTimeField;
    tMovEstEntrada: TBooleanField;
    tMovEstCancelado: TBooleanField;
    tMovEstEstoqueAnt: TFloatField;
    tMovEstCliente: TIntegerField;
    tMovEstCaixa: TIntegerField;
    tMovEstCategoria: TStringField;
    tMovEstNaoControlaEstoque: TBooleanField;
    tMovEstITran: TIntegerField;
    tMovEstTipoTran: TWordField;
    tMovEstSessao: TIntegerField;
    tMovEstFidResgate: TBooleanField;
    tMovEstFidPontos: TFloatField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

uses ncClassesBase;

{$R *.dfm}


function CodStr(I: Integer): String;
begin
  Result := IntToStr(I);
  while length(result)<3 do
    result := '0'+result;
end;

function SoDig(S: String): String;
var i: integer;
begin
  result := '';
  for i := 1 to length(S) do
    if s[i] in ['0'..'9', '-'] then
      result := result + s[i];
end;

function StrToCurrency(S: String): Currency;
var 
  Code : Integer;
  Res: Real;
begin
  Result := 0;
  S := SoDig(S);
  if (Length(S)>=3) then begin
    S := Copy(S, 1, Length(S)-2) + '.' + Copy(S, Length(S)-1, 2);
    Val(S, Res, Code);
    if Code=0 then
      REsult := Res;
  end;
end;

procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I, Min, Cod: Integer;
  S, s2: String;
  Mon : Currency;
  DT: TDateTime;

function ProxCampo: String;
var P: Integer;
begin
  P := Pos(';', S);
  if P>0 then begin
    Result := Trim(Copy(S, 1, P-1));
    Delete(S, 1, P);
  end else begin
    Result := Trim(S);
    S := '';
  end;  
  if Copy(Result, 1, 1)='"' then
    Delete(Result, 1, 1);
  if Copy(Result, Length(Result), 1)='"' then
    Delete(Result, Length(Result), 1);
end;  

begin
  SL := TStringList.Create;
  SL.LoadFromFile('c:\meus programas\nexcafe\odin.csv');
  PB.Max := SL.Count;
  PB.Position := 0;
  tCli.Open;
  tCli.EmptyTable;
//  ShortDateFormat := 'DD-MM-yyyy';
  for I := 0 to SL.Count-1 do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    S := SL[I];
    tCli.Insert;
    tCliUsername.Value := ProxCampo;
    tCliNome.Value := ProxCampo;
    try tCliDataNasc.Value := StrToDate(ProxCampo); except end;
    ProxCampo;
    try tCliUltVisita.Value := StrToDateTime(ProxCampo); except end;
    try tCliIncluidoEm.Value := StrToDate(ProxCampo); except end;
    tCliNickName.Value := ProxCampo;
    Mon := StrToCurrency(ProxCampo);
    tCliMinutos.Value := (Mon / 1.5) * 60;
    ProxCampo; ProxCampo;
    tCliEndereco.Value := ProxCampo;
    tCliTelefone.Value := ProxCampo;
    tCliCelular.Value := ProxCampo;
    tCliBairro.Value := ProxCampo;
    tCliCidade.Value := ProxCampo;
    tCliCEP.Value := ProxCampo;
    tCliUF.Value := ProxCampo;
    ProxCampo;
    tCliRG.Value := ProxCampo;
    ProxCampo;
    tCliSexo.Value := ProxCampo;
    ProxCampo;
    ProxCampo;
    tCliEmail.Value := ProxCampo;
    ProxCampo;
    tCliEscola.Value := ProxCampo;
    ProxCampo; ProxCampo; ProxCampo;
    tCliInativo.Value := SameText('Sim', ProxCampo);
    ProxCampo;
    tCliPai.Value := ProxCampo;
    tCliMae.Value := ProxCampo;
    tCli.Post;
  end;
end;

procedure TForm16.Button2Click(Sender: TObject);
begin
  ibDB.DatabaseName := ExtractFilePath(ParamStr(0))+'odin.fdb';
  ibDB.Connected := True;
  tOdin.Open;
  TV.DataController.CreateAllItems(True);
end;

procedure TForm16.Button3Click(Sender: TObject);
begin
  tDeb.Open;
  tMovEst.Open;
  tCli.Active := True;
  tCli.EmptyTable;
  tOdin.Active := True;
  while not tOdin.Eof do begin
    tCli.Insert;
    tCliUsername.Value := tOdinApelido.Value;
    if tOdinSexo.Value=1 then
      tCliSexo.Value := 'F' else
      tCliSexo.Value := 'M';
    tCliNome.Value := tOdinNome.value;
    tCliRG.Value := tOdinDocumento.Value;
    tCliTelefone.Value := tOdinTelefone.Value;
    tCliCelular.Value := tOdinCelular.Value;
    tCliEndereco.Value := tOdinEndereco.Value;
    tCliBairro.Value := tOdinBairro.Value;
    tCliUF.Value := tOdinEstado.Value;   
    tCliCidade.Value := tOdinCidade.Value;
    tCliCEP.Value := tOdinCEP.Value;
    tCliEmail.Value := tOdinEmail.Value;
    tCliDataNasc.Value := tOdinNascimento.Value;
    tCliIncluidoEm.Value := tOdinCadastro.Value;
    tCliUltVisita.Value := tOdinUltimaVisita.Value;
    if tOdinSaldo.Value > 0.009 then
      tCliValorCred.Value := tOdinSaldo.Value
    else
    if tOdinSaldo.Value < -0.009 then begin
      tMovEst.Insert;
      tMovEstDataHora.Value := tDebData.Value;
      tMovEstTotal.Value := tDebValor.Value;
      tMovEstDesconto.Value := 0;
      tMovEstPago.Value := 0;
      tMovEstCaixa.Value := -1;
      tMovEstTran.Value := -1;
      tMovEstQuant.Value := 1;
      tMovEstUnitario.Value := -1 * tOdinSaldo.Value;
      tMovEstNaoControlaEstoque.Value := True;
      tMovEstTipoTran.Value := trEstVenda;
      tMovEstEntrada.Value := False;
      tMovEstCancelado.Value := False;
      tMovEstCliente.Value := tDebCliente.Value;
      tMovEst.Post;
      
      tDeb.Insert;
      tDebCliente.Value := tCliID.Value;
      tDebData.Value := Date;
      tDebValor.Value := -1 * tOdinSaldo.Value;
      tDebTipo.Value := itMovEst;
      tDebID.Value := tMovEstID.Value;
      tDeb.Post;

      
      tCliDebito.Value := -1 * tOdinSaldo.Value;
    end;
    tCliMinutos.Value := tOdinBancoHora.Value / 60;  
    tCliPai.Value := tOdinNomePai.Value;
    tCliMae.Value := tOdinNomeMae.Value;
    tCliEscola.Value := tOdinEscola.Value;
    tCliIsento.Value := False;
    tCliInativo.Value := False;
    tCli.Post;
    tOdin.Next;
  end;
  ShowMessage('Fim de Importação');
end;

end.
