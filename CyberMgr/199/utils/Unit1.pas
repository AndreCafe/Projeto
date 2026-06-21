unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DBXpress, StdCtrls, Buttons, DB, nxdb, nxllTransport,
  nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  nxsdServerEngine, nxreRemoteServerEngine, SqlExpr;

type
  TForm1 = class(TForm)
    F: TSQLTable;
    SQLConnection1: TSQLConnection;
    FCODIGO: TIntegerField;
    FLOGIN: TStringField;
    FSENHA: TStringField;
    FNOME: TStringField;
    FDATANASC: TSQLTimeStampField;
    FENDERECO: TStringField;
    FNUM: TStringField;
    FCOMPL: TStringField;
    FBAIRRO: TStringField;
    FCEP: TStringField;
    FCIDADE: TStringField;
    FUF: TStringField;
    FDATACAD: TSQLTimeStampField;
    FNIVEL: TStringField;
    FEMAIL: TStringField;
    FSTATUS: TStringField;
    FEDITAR: TStringField;
    FTIPO: TStringField;
    FDESCONTO: TStringField;
    FTEMPODESCONTO: TIntegerField;
    FOBS: TMemoField;
    FFOTO: TBlobField;
    FTEMPOJOGO: TIntegerField;
    FMONETARIO: TFMTBCDField;
    FTEMPOCOMPRADO: TIntegerField;
    FCODBARRA: TStringField;
    FFONE: TStringField;
    FCELULAR: TStringField;
    FTIPOCLIENTE: TStringField;
    FATIVO: TStringField;
    FBILHETE: TStringField;
    FRG: TStringField;
    FCPF: TStringField;
    FICQ: TStringField;
    FEMAIL2: TStringField;
    FESTUDANTE: TStringField;
    FSERIE: TStringField;
    FPERIODO: TStringField;
    FESCOLA: TStringField;
    nxRemoteServerEngine1: TnxRemoteServerEngine;
    nxWinsockTransport1: TnxWinsockTransport;
    nxSession1: TnxSession;
    nxDatabase1: TnxDatabase;
    D: TnxTable;
    DCodigo: TAutoIncField;
    DNome: TStringField;
    DEndereco: TStringField;
    DBairro: TStringField;
    DCidade: TStringField;
    DUF: TStringField;
    DCEP: TStringField;
    DNasc: TDateTimeField;
    DSexo: TStringField;
    DObs: TMemoField;
    DCpf: TStringField;
    DRg: TStringField;
    DTelefone: TStringField;
    DEmail: TMemoField;
    DCreditoM: TIntegerField;
    DTempoTotal: TIntegerField;
    DTempoInicial: TIntegerField;
    DIsento: TBooleanField;
    DUsername: TStringField;
    DSenha: TStringField;
    DUltVisita: TDateTimeField;
    DDebito: TCurrencyField;
    DEscola: TStringField;
    DNickName: TStringField;
    DDataNasc: TDateTimeField;
    DCelular: TStringField;
    DTemDebito: TBooleanField;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    tTran: TnxTable;
    tTranNumero: TAutoIncField;
    tTranCaixaI: TIntegerField;
    tTranCaixaF: TIntegerField;
    tTranCaixaP: TIntegerField;
    tTranTipoAcesso: TWordField;
    tTranInicio: TDateTimeField;
    tTranFim: TDateTimeField;
    tTranDataPagto: TDateTimeField;
    tTranContato: TIntegerField;
    tTranNome: TStringField;
    tTranMaquina: TWordField;
    tTranTipo: TWordField;
    tTranFuncI: TStringField;
    tTranFuncF: TStringField;
    tTranTempo: TDateTimeField;
    tTranTempoCobrado: TDateTimeField;
    tTranCredUsado: TIntegerField;
    tTranCredAnterior: TIntegerField;
    tTranDesconto: TCurrencyField;
    tTranProdutos: TCurrencyField;
    tTranValor: TCurrencyField;
    tTranObs: TMemoField;
    tTranIsento: TBooleanField;
    tTranNaoUsarPacote: TBooleanField;
    tTranCodPacote: TWordField;
    tTranSinal: TCurrencyField;
    tTranTransacaoVinculada: TIntegerField;
    tTranValorFinalAcesso: TCurrencyField;
    tTranDescontoProduto: TCurrencyField;
    tTranNumDoc: TStringField;
    tTranStatusPagto: TWordField;
    tTranT0: TFloatField;
    tTranT1: TFloatField;
    tTranT2: TFloatField;
    tTranT3: TFloatField;
    tTranT4: TFloatField;
    tTranT5: TFloatField;
    tTranT6: TFloatField;
    tTranT7: TFloatField;
    tTranT8: TFloatField;
    tTranT9: TFloatField;
    tTranT10: TFloatField;
    tTranT11: TFloatField;
    tTranT12: TFloatField;
    tTranT13: TFloatField;
    tTranT14: TFloatField;
    tTranT15: TFloatField;
    tTranT16: TFloatField;
    tTranT17: TFloatField;
    tTranT18: TFloatField;
    tTranT19: TFloatField;
    tTranT20: TFloatField;
    tTranT21: TFloatField;
    tTranT22: TFloatField;
    tTranT23: TFloatField;
    tME: TnxTable;
    tMENumSeq: TAutoIncField;
    tMETransacao: TIntegerField;
    tMEProduto: TStringField;
    tMEQuant: TFloatField;
    tMEUnitario: TCurrencyField;
    tMETotal: TCurrencyField;
    tMEItem: TWordField;
    tMEDesconto: TCurrencyField;
    tMEDataMov: TDateTimeField;
    tMEDataPag: TDateTimeField;
    tMEEntrada: TBooleanField;
    tMECancelado: TBooleanField;
    tMEEstoqueAnt: TFloatField;
    tMETipoTran: TWordField;
    tMEContato: TIntegerField;
    tMECaixaMov: TIntegerField;
    tMECaixaPag: TIntegerField;
    tMECategoria: TStringField;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var I : Integer;
begin
  I := 0;
  while not F.Eof do begin
    Inc(I);
    D.Insert;
    DCodigo.Value := FCodigo.Value;
    DNome.Value := FNome.Value;
    DUsername.Value := FLogin.Value;
    DCreditoM.Value := FTempoComprado.Value * 60 * 1000;
    DSenha.Value := FSenha.Value;
    DDataNasc.Value := FDataNasc.AsDateTime;
    DNasc.Value := DDataNasc.Value;
    DEndereco.Value := FEndereco.Value;
    if FNum.Value > '' then 
      DEndereco.Value := DEndereco.Value + ', ' + FNum.Value;
    if FCompl.Value > '' then
      DEndereco.Value := DEndereco.Value + ' ' + FCompl.Value;
    DBairro.Value := FBairro.Value;
    DCEP.Value := FCEP.Value;
    DCidade.Value := FCIdade.Value;
    DUF.Value := FUF.Value;
    DTelefone.Value := FFone.Value;
    DCelular.Value := FCelular.Value;
    DEmail.Value := FEmail.Value;
    DObs.Value := FObs.Value;
    DCPF.Value := FCPF.Value;
    DRG.Value := FRG.Value;
    DEscola.Value := FEscola.Value;
    if FMonetario.AsFloat < 0 then begin
      DTemDebito.Value := True;
      DDebito.Value := FMonetario.AsFloat * -1;
      tTran.Insert;
      tTranTipo.Value := 7;
      tTranCaixaI.Value := 1;
      tTranCaixaF.Value := 1;
      tTranCaixaP.Value := 0;
      tTranInicio.Value := EncodeDate(2004, 1, 1);
      tTranFim.Value := EncodeDate(2004, 1, 1);
      tTranContato.Value := DCodigo.Value;
      tTranNome.Value := DNome.Value;
      tTranProdutos.Value := DDebito.Value;
      tTranObs.Value := 'Débitos anteriores conversão programa';
      tTranStatusPagto.Value := 3;
      tTran.Post;
      tME.Insert;
      tMETransacao.Value := tTranNumero.Value;
      tMEProduto.Value := 'DEBANT';
      tMEItem.Value := 1;
      tMEQuant.Value := 1;
      tMEUnitario.Value := DDebito.Value;
      tMETotal.Value := DDebito.Value;
      tMEDataMov.Value := tTranInicio.Value;
      tMEEntrada.Value := False;
      tMETipoTran.Value := 7;
      tMEContato.Value := DCodigo.Value;
      tMECaixaMov.Value := 1;
      tMECaixaPag.Value := 0;
      tME.Post;
    end;  
    F.Next;
    Label1.Caption := IntToStr(I);
    Application.ProcessMessages;
  end;  
  ShowMEssage('Converteu');
end;

end.
