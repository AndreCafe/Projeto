unit uApagaDup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxdb, nxllComponent, nxsdServerEngine,
  nxreRemoteServerEngine, DB;

type
  TForm45 = class(TForm)
    Tab: TnxTable;
    nxRSE: TnxRemoteServerEngine;
    nxSe: TnxSession;
    nxDB: TnxDatabase;
    nxTCP: TnxWinsockTransport;
    PB: TProgressBar;
    Button1: TButton;
    TabID: TAutoIncField;
    TabNome: TStringField;
    TabEndereco: TStringField;
    TabBairro: TStringField;
    TabCidade: TStringField;
    TabUF: TStringField;
    TabCEP: TStringField;
    TabSexo: TStringField;
    TabObs: TnxMemoField;
    TabCpf: TStringField;
    TabRg: TStringField;
    TabTelefone: TStringField;
    TabEmail: TnxMemoField;
    TabMinutos: TFloatField;
    TabPassaportes: TFloatField;
    TabMinutosUsados: TFloatField;
    TabMinutosIniciais: TFloatField;
    TabIsento: TBooleanField;
    TabUsername: TStringField;
    TabPai: TStringField;
    TabMae: TStringField;
    TabSenha: TStringField;
    TabUltVisita: TDateTimeField;
    TabDebito: TCurrencyField;
    TabEscola: TStringField;
    TabEscolaHI: TDateTimeField;
    TabEscolaHF: TDateTimeField;
    TabNickName: TStringField;
    TabDataNasc: TDateTimeField;
    TabCelular: TStringField;
    TabTemDebito: TBooleanField;
    TabLimiteDebito: TCurrencyField;
    TabFoto: TGraphicField;
    TabIncluidoEm: TDateTimeField;
    TabAlteradoEm: TDateTimeField;
    TabIncluidoPor: TStringField;
    TabAlteradoPor: TStringField;
    TabTitEleitor: TStringField;
    TabFidPontos: TFloatField;
    TabFidTotal: TFloatField;
    TabFidResg: TFloatField;
    TabAniversario: TStringField;
    TabCotaImpEspecial: TBooleanField;
    TabCotaImpDia: TIntegerField;
    TabCotaImpMes: TIntegerField;
    TabSemFidelidade: TBooleanField;
    TabNaoGuardarCredito: TBooleanField;
    TabPermiteLoginSemCred: TBooleanField;
    TabCHorario: TIntegerField;
    TabOpCHorario: TWordField;
    TabHP1: TIntegerField;
    TabHP2: TIntegerField;
    TabHP3: TIntegerField;
    TabHP4: TIntegerField;
    TabHP5: TIntegerField;
    TabHP6: TIntegerField;
    TabHP7: TIntegerField;
    TabInativo: TBooleanField;
    TabTipoAcessoPref: TIntegerField;
    TabFornecedor: TBooleanField;
    TabValorCred: TCurrencyField;
    Label1: TLabel;
    Tab2: TnxTable;
    AutoIncField1: TAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    nxMemoField1: TnxMemoField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    nxMemoField2: TnxMemoField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    BooleanField1: TBooleanField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    DateTimeField1: TDateTimeField;
    CurrencyField1: TCurrencyField;
    StringField15: TStringField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    StringField16: TStringField;
    DateTimeField4: TDateTimeField;
    StringField17: TStringField;
    BooleanField2: TBooleanField;
    CurrencyField2: TCurrencyField;
    GraphicField1: TGraphicField;
    DateTimeField5: TDateTimeField;
    DateTimeField6: TDateTimeField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    StringField21: TStringField;
    BooleanField3: TBooleanField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    BooleanField4: TBooleanField;
    BooleanField5: TBooleanField;
    BooleanField6: TBooleanField;
    IntegerField3: TIntegerField;
    WordField1: TWordField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    BooleanField7: TBooleanField;
    IntegerField11: TIntegerField;
    BooleanField8: TBooleanField;
    CurrencyField3: TCurrencyField;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form45: TForm45;

implementation

{$R *.dfm}


procedure TransfDados(F, D: TDataset);
var 
  I : Integer;
  DF : TField;
begin
  for I := 0 to F.FieldCount - 1 do begin
    DF := D.FindField(F.Fields[I].FieldName);
    if DF<>nil then 
      DF.Value := F.Fields[I].Value;
  end;
end;

procedure TForm45.Button1Click(Sender: TObject);
var T: Cardinal;
begin
  Tab.Active := True;
  Tab.SetRange([' *'], [' *z']);
  PB.Position := 0;
  T := Tab.RecordCount;
  PB.Max := T;
  Label1.Caption := IntToStr(PB.Max);

  Button1.Enabled := False;
  
  Tab.First;
  while not (Tab.Eof and Tab.Bof) do begin
    Tab.Delete;
    PB.Position := PB.Position + 1;
    Label1.Caption := IntToStr(PB.Position) + '/' + IntToStr(T);

    Application.ProcessMessages;
  end;

  ShowMessage('Fim de processo');
end;

procedure TForm45.Button2Click(Sender: TObject);
begin
  Tab.First;
  while (Copy(TabUsername.Value, 1, 2)<>' *') and (not Tab.Eof) do begin
    Label1.Caption := TabID.AsString;
    Tab2.Insert;
    TransfDados(Tab, Tab2);
    Tab2.Post;
    Tab.Next;
    Application.ProcessMessages;
  end;

  Tab.Last;
  while (Copy(TabUsername.Value, 1, 2)<>' *') and (not Tab.Bof) do begin
    Label1.Caption := TabID.AsString;
    Tab2.Insert;
    TransfDados(Tab, Tab2);
    Tab2.Post;
    Tab.Prior;
    Application.ProcessMessages;
  end;
  

end;

end.
