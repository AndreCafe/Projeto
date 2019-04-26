unit uImpFDB_odin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, IBDatabase, IBCustomDataSet, IBTable, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, 
  cxNavigator, nxreRemoteServerEngine, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxLabel;

type
  TForm16 = class(TForm)
    nxSe: TnxSession;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    nxTCP: TnxWinsockTransport;
    PB: TProgressBar;
    IBDB: TIBDatabase;
    tOdin: TIBTable;
    IBTransaction1: TIBTransaction;
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
    tDeb: TnxTable;
    tMovEst: TnxTable;
    nxRSE: TnxRemoteServerEngine;
    Button3: TButton;
    cbLoginCod: TCheckBox;
    cxLabel1: TcxLabel;
    tDebData: TDateTimeField;
    tDebCliente: TLongWordField;
    tDebValor: TCurrencyField;
    tDebTipo: TByteField;
    tDebID: TLongWordField;
    tDebRecVer: TLongWordField;
    tCliID: TUnsignedAutoIncField;
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
    tCliCotaImpDia: TLongWordField;
    tCliCotaImpMes: TLongWordField;
    tCliSemFidelidade: TBooleanField;
    tCliTemCredito: TBooleanField;
    tCliNaoGuardarCredito: TBooleanField;
    tCliPermiteLoginSemCred: TBooleanField;
    tCliCHorario: TLongWordField;
    tCliOpCHorario: TByteField;
    tCliHP1: TLongWordField;
    tCliHP2: TLongWordField;
    tCliHP3: TLongWordField;
    tCliHP4: TLongWordField;
    tCliHP5: TLongWordField;
    tCliHP6: TLongWordField;
    tCliHP7: TLongWordField;
    tCliInativo: TBooleanField;
    tCliTipoAcessoPref: TIntegerField;
    tCliFornecedor: TBooleanField;
    tCliValorCred: TCurrencyField;
    tCliRecVer: TLongWordField;
    tMovEstID: TUnsignedAutoIncField;
    tMovEstTran: TLongWordField;
    tMovEstProduto: TLongWordField;
    tMovEstQuant: TFloatField;
    tMovEstUnitario: TCurrencyField;
    tMovEstTotal: TCurrencyField;
    tMovEstCustoU: TCurrencyField;
    tMovEstItem: TByteField;
    tMovEstDesconto: TCurrencyField;
    tMovEstPago: TCurrencyField;
    tMovEstPagoPost: TCurrencyField;
    tMovEstDescPost: TCurrencyField;
    tMovEstDataHora: TDateTimeField;
    tMovEstEntrada: TBooleanField;
    tMovEstCancelado: TBooleanField;
    tMovEstEstoqueAnt: TFloatField;
    tMovEstCliente: TLongWordField;
    tMovEstCaixa: TIntegerField;
    tMovEstCategoria: TStringField;
    tMovEstNaoControlaEstoque: TBooleanField;
    tMovEstITran: TIntegerField;
    tMovEstTipoTran: TByteField;
    tMovEstSessao: TIntegerField;
    tMovEstplusID: TGuidField;
    tMovEstComissao: TCurrencyField;
    tMovEstComissaoPerc: TFloatField;
    tMovEstComissaoLucro: TBooleanField;
    tMovEstplusTran: TBooleanField;
    tMovEstPermSemEstoque: TBooleanField;
    tMovEstFidResgate: TBooleanField;
    tMovEstFidPontos: TFloatField;
    tMovEstRecVer: TLongWordField;
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

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

procedure TForm16.Button3Click(Sender: TObject);
var I: Integer;
begin
  tDeb.Open;
  tMovEst.Open;
  tCli.Active := True;
  tCli.DeleteRecords;
  tOdin.Active := True;
  PB.Max := tOdin.RecordCount;
  PB.Position := 0;
  I := 0;
  tCli.IndexName := 'IID';
  while not tOdin.Eof do begin
    Inc(I);
    PB.Position := PB.Position + 1;
    tCli.Insert;
    if cbLoginCod.Checked then begin
      tCliID.Value := tOdinEntidadeID.Value;
      tCliUsername.Value := tCliID.AsString;
    end else
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
      tCliValorCred.Value := tOdinSaldo.Value else
      tCliDebito.Value := -1 * tOdinSaldo.Value;
    tCliMinutos.Value := tOdinBancoHora.Value / 60;  
    tCliPai.Value := tOdinNomePai.Value;
    tCliMae.Value := tOdinNomeMae.Value;
    tCliEscola.Value := tOdinEscola.Value;
    tCliIsento.Value := False;
    tCliInativo.Value := False;
    tCli.Post;

    if tOdinSaldo.Value < -0.009 then begin
      tMovEst.Insert;
      tMovEstDataHora.Value := tDebData.Value;
      tMovEstTotal.Value := tDebValor.Value;
      tMovEstDesconto.Value := 0;
      tMovEstPago.Value := 0;
      tMovEstCaixa.Value := -1;
      tMovEstTran.Value := 0;
      tMovEstQuant.Value := 1;
      tMovEstUnitario.Value := -1 * tOdinSaldo.Value;
      tMovEstNaoControlaEstoque.Value := True;
      tMovEstTipoTran.Value := 4;
      tMovEstEntrada.Value := False;
      tMovEstCancelado.Value := False;
      tMovEstCliente.Value := tDebCliente.Value;
      tMovEst.Post;
      
      tDeb.Insert;
      tDebCliente.Value := tCliID.Value;
      tDebData.Value := Date;
      tDebValor.Value := -1 * tOdinSaldo.Value;
      tDebTipo.Value := 1;
      tDebID.Value := tMovEstID.Value;
      tDeb.Post;
    end;
    tOdin.Next;
    Application.ProcessMessages;
  end;
  ShowMessage('Fim de Importação '+IntToStr(I)+ ' registros importados');
  tCli.Last;
  tCli.SetAutoIncValue(tCLIID.Value);
end;

end.
