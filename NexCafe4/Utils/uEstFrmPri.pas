unit uEstFrmPri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, nxdb, nxseAutoComponent, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxsdServerEngine, nxreRemoteServerEngine, nxllComponent,
  StdCtrls, ExtCtrls;

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
    Button1: TButton;
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
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
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

procedure TfrmPri.Processa;
var 
  C1, C2, C3, c4: integer;
begin
  nxTCP.Open;
  nxSession.Open;
  nxDB.Open;
  
  tAut.Open;
  tAut.SetRange([True, 5, Date], [True, 5, Date+5000]);
  C3 := tAut.recordcount;
  c4 := 0;
  
  tCli.Open;
  tCli.SetRange([5], [5]);
  C1 := tCli.RecordCount;
  tCli.First;
  
  C2:=0;
  while not tCli.Eof do begin
    if (tCliLicVenc.IsNull) or (tCliLicVenc.Value<Date) then begin
      if tCliUObtemLic.Value>=Date then
        Inc(C2);
    end;
    if tCliAtivado.Value then Inc(c4);

    tCli.Next;
  end;

  lbCriadas.Caption := IntToStr(C1);
  lbAtivadas.Caption := IntToStr(C4) + '  ' + PercStr(C4, C1);
  lbAtivas.Caption := IntToStr(C2+C3) + '  ' + PercStr(C2+C3, C4);
  lbPremium.Caption := IntToStr(C3) + '  ' + PercStr(C3, C2+C3);
  lbFree.Caption := IntToStr(C2) + '  ' + PercStr(C2, C2+C3);
end;

procedure TfrmPri.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Processa;
end;

end.
