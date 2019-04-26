unit uImpFDB_odin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nx1xAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, Dbf, IBDatabase, IBCustomDataSet, IBTable, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TForm16 = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    nxTCP: TnxWinsockTransport;
    nxSE: TnxServerEngine;
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
    PB: TProgressBar;
    tCliObs: TMemoField;
    tCliEmail: TMemoField;
    DataSource1: TDataSource;
    IBDB: TIBDatabase;
    tOdin: TIBTable;
    IBTransaction1: TIBTransaction;
    Dbf1: TDbf;
    Dbf1NRO_LLAM: TFloatField;
    Dbf1LINHA1: TStringField;
    Dbf1LINHA2: TStringField;
    Dbf1LINHA3: TStringField;
    Dbf1LINHA4: TStringField;
    Dbf1LINHA5: TStringField;
    Dbf1LINHA6: TStringField;
    Dbf1LINHA7: TStringField;
    Dbf1LINHA8: TStringField;
    Dbf1COD_MOVIL: TSmallintField;
    Dbf1COD_ESCALA: TSmallintField;
    Dbf1ENDERECO: TStringField;
    Dbf1BAIRRO: TStringField;
    Dbf1CIDADE: TStringField;
    Dbf1HORA_LLAM: TStringField;
    Dbf1HORA_ATRI: TStringField;
    Dbf1FLAG_ATRI: TStringField;
    Dbf1HORA_AVISO: TStringField;
    Dbf1FLAG_AVISO: TStringField;
    Dbf1HORA_SAL: TStringField;
    Dbf1FLAG_SAL: TStringField;
    Dbf1HORA_CHE: TStringField;
    Dbf1FLAG_CHE: TStringField;
    Dbf1HORA_ATE: TStringField;
    Dbf1FLAG_ATE: TStringField;
    Dbf1HORA_SIN: TStringField;
    Dbf1FLAG_SIN: TStringField;
    Dbf1HORA_LIN: TStringField;
    Dbf1FLAG_LIN: TStringField;
    Dbf1HORA_FIN: TStringField;
    Dbf1FLAG_FIN: TStringField;
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

end.
