unit uImpFDB_Ferus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, IBDatabase, IBCustomDataSet, IBTable, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, 
  cxNavigator, nxreRemoteServerEngine;

type
  TForm16 = class(TForm)
    nxSe: TnxSession;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    nxTCP: TnxWinsockTransport;
    IBDB: TIBDatabase;
    tOdin: TIBTable;
    IBTransaction1: TIBTransaction;
    tDeb: TnxTable;
    tMovEst: TnxTable;
    nxRSE: TnxRemoteServerEngine;
    Button3: TButton;
    OpenDlg: TOpenDialog;
    Label1: TLabel;
    Label2: TLabel;
    tDebData: TDateTimeField;
    tDebCliente: TLongWordField;
    tDebValor: TCurrencyField;
    tDebTipo: TByteField;
    tDebID: TLongWordField;
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
  
  repeat
    if not OpenDlg.Execute(Handle) then Exit;
  until SameText(ExtractFileName(OpenDlg.FileName), 'Férus.FDB');

  IBDB.DatabaseName := 'localhost:' + OpenDlg.FileName;
  
  tDeb.Open;
  tMovEst.Open;
  tCli.Active := True;
  tCli.DeleteRecords;
  tOdin.Active := True;
  I := 0;
  label2.visible := True;
  while not tOdin.Eof do begin
    Inc(I);
    label2.Caption := 'Aguarde ... '+ IntToStr(I) + ' cadastros importados.';
    tCli.Insert;
    tCliUsername.Value := tOdin.FieldByName('Apelido').AsString;
    if tOdin.FieldByName('Sexo').Value=1 then
      tCliSexo.Value := 'F' else
      tCliSexo.Value := 'M';
    tCliNome.Value := tOdin.FieldByName('Nome').AsString;
    tCliRG.Value := tOdin.FieldByName('Documento').AsString;
    tCliTelefone.Value := tOdin.FieldByName('Telefone').AsString;
    tCliCelular.Value := tOdin.FieldByName('Celular').AsString;
    tCliEndereco.Value := tOdin.FieldByName('Endereco').AsString;
    tCliBairro.Value := tOdin.FieldByName('Bairro').AsString;
    tCliUF.Value := tOdin.FieldByName('Estado').AsString;   
    tCliCidade.Value := tOdin.FieldByName('Cidade').AsString;
    tCliCEP.Value := tOdin.FieldByName('CEP').AsString;
    tCliEmail.Value := tOdin.FieldByName('Email').AsString;
    tCliDataNasc.Value := tOdin.FieldByName('Nascimento').AsDateTime;
    tCliIncluidoEm.Value := tOdin.FieldByName('Cadastro').AsDateTime;
    tCliUltVisita.Value := tOdin.FieldByName('UltimaVisita').AsDateTime;
    if tOdin.FieldByName('Saldo').AsFloat > 0.009 then
      tCliValorCred.Value := tOdin.FieldByName('Saldo').AsFloat
    else
    if tOdin.FieldByName('Saldo').AsFloat < -0.009 then begin
      tCli.Post;
      tCli.Edit;
      tMovEst.Insert;
      tMovEstDataHora.Value := Date;
      tMovEstTotal.Value := tOdin.FieldByName('Saldo').AsFloat * -1;
      tMovEstDesconto.Value := 0;
      tMovEstPago.Value := 0;
      tMovEstCaixa.Value := -1;
      tMovEstQuant.Value := 1;
      tMovEstUnitario.Value := -1 * tOdin.FieldByName('Saldo').AsFloat;
      tMovEstNaoControlaEstoque.Value := True;
      tMovEstTipoTran.Value := 4;
      tMovEstEntrada.Value := False;
      tMovEstCancelado.Value := False;
      tMovEstCliente.Value := tCliID.Value;
      tMovEst.Post;
      
      tDeb.Insert;
      tDebCliente.Value := tCliID.Value;
      tDebData.Value := Date;
      tDebValor.Value := -1 * tOdin.FieldByName('Saldo').AsFloat;
      tDebTipo.Value := 1;
      tDebID.Value := tMovEstID.Value;
      tDeb.Post;
      
      tCliDebito.Value := -1 * tOdin.FieldByName('Saldo').AsFloat;
    end;
    tCliMinutos.Value := tOdin.FieldByName('BancoHora').AsFloat / 60;  
    tCliPai.Value := tOdin.FieldByName('NomePai').AsString;
    tCliMae.Value := tOdin.FieldByName('NomeMae').AsString;
    tCliEscola.Value := tOdin.FieldByName('Escola').AsString;
    tCliIsento.Value := False;
    tCliInativo.Value := False;
    tCli.Post;
    tOdin.Next;
    Application.ProcessMessages;
  end;
  ShowMessage('Fim de Importação '+IntToStr(I)+ ' registros importados');
  Close;
end;

end.
