unit uImp_Tina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, StdCtrls, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, nxdb, nxsdServerEngine,
  nxsrServerEngine, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxllComponent, ComCtrls;

type
  TForm5 = class(TForm)
    Tab: TTable;
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
    tCliNasc: TDateTimeField;
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
    TabKULLANICIKODU: TStringField;
    TabSIFRE: TStringField;
    TabADI: TStringField;
    TabSOYADI: TStringField;
    TabADRES1: TMemoField;
    TabSEMT: TStringField;
    TabPOSTAKODU: TStringField;
    TabSEHIR: TStringField;
    TabTEL: TStringField;
    TabACILISTARIHI: TDateField;
    TabBITISTARIHI: TDateField;
    TabEMAIL: TStringField;
    TabWEB: TStringField;
    TabFOTO: TGraphicField;
    TabDESCRIPTION: TMemoField;
    TabEXT1: TStringField;
    TabEXT2: TCurrencyField;
    TabSAATUCRETI: TCurrencyField;
    TabDAKIKAHAKKI: TFloatField;
    TabKULLANILANSURE: TFloatField;
    TabAKTIF: TBooleanField;
    TabKREDI: TCurrencyField;
    TabICQ: TFloatField;
    TabUCRETTIPI: TStringField;
    TabISKONTO: TFloatField;
    TabRESERVED1STR: TStringField;
    TabRESERVED2STR: TStringField;
    TabRESERVED3STR: TStringField;
    TabRESERVED1NUM: TFloatField;
    TabRESERVED2NUM: TFloatField;
    TabRESERVED3NUM: TFloatField;
    TabRESERVED1CUR: TCurrencyField;
    TabRESERVED2CUR: TCurrencyField;
    TabRESERVED3CUR: TCurrencyField;
    TabRESERVED1DATE: TDateField;
    TabRESERVED2DATE: TDateField;
    TabRESERVED1TIME: TDateField;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
    tCliNome.Value := TabADI.Value + ' ' + TabSoyAdi.Value;
    tCliUsername.Value := TabKullanicikodu.Value;
    tCliSenha.Value := TabSifre.Value;
    tCliEndereco.Value := TabAdres1.Value;
    tCliCidade.Value := TabSemt.Value;
    tCliCEP.Value := TabPostakodu.Value;
    tCliBairro.Value := TabSehir.Value;
    tCliTelefone.Value := TabTel.Value;
    tCliDataNasc.Value := TabAcilistarihi.Value;
    tCliEmail.Value := TabEmail.Value;
    if not TabFoto.IsNull then begin
      S.Position := 0;
      TabFoto.SaveToStream(S);
      S.Position := 0;
      tCliFoto.LoadFromStream(S);
    end;
    tCliIncluidoEm.Value := Now;
    tCliIncluidoPor.Value := 'admin';
    tCliUF.Value := 'SP';
    if Trim(tCliCidade.Value)='' then
      tCliCidade.Value := 'Osasco';
    tCliIsento.Value := False;
    tCliInativo.Value := False;
    tCli.Post;
    Tab.Next;
  end;
  S.Free;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  Tab.Open;
  Button2.Caption := IntToStr(Tab.RecordCount);
end;

end.
