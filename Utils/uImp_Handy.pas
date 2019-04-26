unit uImp_Handy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, BDE, DBTables, StdCtrls, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, nxdb, nxsdServerEngine,
  nxsrServerEngine, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxllComponent, ComCtrls, LMDControl, DBCtrls;

type
  TForm5 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    LMDSimplePanel1: TLMDSimplePanel;
    Button1: TButton;
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    nxTCP: TnxWinsockTransport;
    nxSE: TnxServerEngine;
    tCli: TnxTable;
    tCliID: TAutoIncField;
    tCliNome: TStringField;
    tCliEndereco: TStringField;
    tCliBairro: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliCEP: TStringField;
    tCliSexo: TStringField;
    tCliCpf: TStringField;
    tCliRg: TStringField;
    tCliTelefone: TStringField;
    tCliMinutos: TFloatField;
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
    tCliInativo: TBooleanField;
    tCliTipoAcessoPref: TIntegerField;
    tCliValorCred: TCurrencyField;
    tCliObs: TMemoField;
    tCliEmail: TMemoField;
    PB: TProgressBar;
    Button2: TButton;
    Database1: TDatabase;
    Session1: TSession;
    tCliPassaportes: TFloatField;
    tCliTitEleitor: TStringField;
    tCliFidPontos: TFloatField;
    tCliFidTotal: TFloatField;
    tCliFidResg: TFloatField;
    tCliAniversario: TStringField;
    tCliNaoGuardarCredito: TBooleanField;
    tCliPermiteLoginSemCred: TBooleanField;
    tCliHP1: TIntegerField;
    tCliHP2: TIntegerField;
    tCliHP3: TIntegerField;
    tCliHP4: TIntegerField;
    tCliHP5: TIntegerField;
    tCliHP6: TIntegerField;
    tCliHP7: TIntegerField;
    Tab: TTable;
    TabDUserName: TStringField;
    TabDPassword: TStringField;
    TabDFirstName: TStringField;
    TabDLastName: TStringField;
    TabDPhone: TStringField;
    TabDAddress: TMemoField;
    TabDEmail: TStringField;
    TabDUsedTime: TIntegerField;
    TabDRemainTime: TIntegerField;
    TabDPicture: TGraphicField;
    TabDCreateDate: TDateField;
    TabDActive: TBooleanField;
    TabDBytesReceived: TFloatField;
    TabDBytesSent: TFloatField;
    TabDWeb: TStringField;
    TabDMemo: TMemoField;
    TabDExpireDate: TDateField;
    TabDDebt: TCurrencyField;
    TabDLastUsed: TIntegerField;
    TabDLastRecv: TFloatField;
    TabDLastSent: TFloatField;
    TabDDiscount: TFloatField;
    TabDMemberPrice: TCurrencyField;
    TabDPriceType: TSmallintField;
    TabDAccountType: TSmallintField;
    TabDMemberType: TIntegerField;
    TabDTicketId: TFloatField;
    DBMemo1: TDBMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
var S : TStream;
begin
  S := TMemoryStream.Create;
  tCli.Open;
  tCli.EmptyTable;
  Tab.Open;
  Tab.First;
  PB.Max := Tab.RecordCount;
  PB.Position := 1;
  while not Tab.Eof do begin
    PB.Position := PB.Position + 1;
    tCli.Insert;
    tCliNome.Value := Trim(TabDFirstName.Value + ' ' + TabDLastname.Value);
    tCliUsername.Value := TabDUsername.Value;
    tCliSenha.Value := TabDPassword.Value;
    tCliEndereco.Value := TabDAddress.Value;
    tCliTelefone.Value := TabDPhone.Value;
    tCliEmail.Value := TabDEmail.Value;
    tCliMinutos.Value := TabDRemainTime.Value;
    tCliIncluidoEm.Value := TabDCreateDate.Value;
    tCliObs.Value := TabDMemo.Value;
    tCliIncluidoPor.Value := 'admin';
    tCliIsento.Value := False;
    tCliInativo.Value := False;
    tCli.Post;
    Tab.Next;
  end;
  ShowMessage(IntToStr(PB.Position) + ' registros importados');
  S.Free;
end;

end.
