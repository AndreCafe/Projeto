unit uTesteImp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, nxdb, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxllComponent, nxsdServerEngine, nxreRemoteServerEngine,
  ComCtrls;

type
  TFrmPri = class(TForm)
    RSE: TnxRemoteServerEngine;
    nxSession1: TnxSession;
    nxDatabase1: TnxDatabase;
    nxWinsockTransport1: TnxWinsockTransport;
    Tab: TnxTable;
    Button1: TButton;
    PB: TProgressBar;
    tAut: TnxTable;
    tAutID: TAutoIncField;
    tAutPrograma: TWordField;
    tAutLoja: TIntegerField;
    tAutAutorizacao: TStringField;
    tAutVencimento: TDateField;
    tAutCodigoEquip: TStringField;
    tAutMaquinas: TWordField;
    tAutTipo: TWordField;
    tAutCriadaEm: TDateTimeField;
    tAutCriadaPor: TStringField;
    tAutInativadaEm: TDateTimeField;
    tAutInativadaPor: TStringField;
    tAutAtiva: TBooleanField;
    tAutObs: TMemoField;
    tAutGerar: TBooleanField;
    tAutEnviouCli: TBooleanField;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Andamento(T, I: Integer);
    { Public declarations }
  end;

  TCriaDM = function: Integer;
  TDestroiDM = procedure(I: integer);

var
  FrmPri: TFrmPri;

implementation

uses uDMBaseImpNX2, nrAutorizacao;

{$R *.dfm}

procedure TFrmPri.Andamento(T, I: Integer);
begin
  PB.Max := T;
  PB.Position := I;
  Application.ProcessMessages;
end;

procedure TFrmPri.Button1Click(Sender: TObject);
var 
  dm: TdmBaseImpNX2;
  h: Thandle;
  CriaDM: TCriaDM;
  DestroiDM: TDestroiDM;
  I : Integer;
begin
  H := LoadLibrary(PChar('c:\meus programas\nexcafe\ImpNX.dll'));
  if H <> 0 then
  try
    @CriaDM := GetProcAddress(H, PChar('CriaDM'));
    @DestroiDM := GetProcAddress(H, PChar('DestroiDM'));
    dm := TdmBaseImpNX2(CriaDM);
    try
      dm.Inicializa('c:\copiareg');
      Tab.TableName := 'cliente';
      dm.Importa('Cliente', Tab, Andamento);
      Tab.Active := False;
      Tab.TableName := 'receber';
      Tab.Active := True;
      dm.Importa('receber', Tab, Andamento);
      Tab.Active := False;
{      Tab.TableName := 'log';
      Tab.Active := True;
      dm.Importa('log', Tab, Andamento); 
      Tab.Active := False;}
      
      Tab.TableName := 'Usuario';
      Tab.Active := True;
      dm.Importa('Usuario', Tab, Andamento);
      Tab.Active := False;
      Tab.TableName := 'Status';
      Tab.Active := True;
      dm.Importa('Status', Tab, Andamento);
      Tab.Active := False;
      Tab.TableName := 'Tarefas';
      Tab.Active := True;
      dm.Importa('Tarefas', Tab, Andamento);
      Tab.Active := False;
      Tab.TableName := 'HistCon';
      Tab.Active := True;
      dm.Importa('HistCon', Tab, Andamento);
      Tab.Active := False;
      Tab.TableName := 'PlanoContas';
      Tab.Active := True;
      dm.Importa('PlanoContas', Tab, Andamento);  

      Tab.Active := False;
      Tab.TableName := 'EmailCorpo';
      Tab.Active := True;
      dm.Importa('EmailCorpo', Tab, Andamento);

      Tab.Active := False;
      Tab.TableName := 'EmailEnvio';
      Tab.Active := True;
      dm.Importa('EmailEnvio', Tab, Andamento);

{      Tab.Active := False;
      Tab.TableName := 'Log';
      Tab.Open;
      Tab.IndexName := '';
      Tab.First; I := 0;
      while not Tab.Eof do begin
        Inc(I);
        Tab.Edit;
        Tab.FieldByName('Num').AsInteger := I;
        Tab.Post;
        Tab.Next;
      end;}
      ShowMessage('Fim');

      
    finally
//      DestroiDM(Integer(dm));
    end;
  finally
//    FreeLibrary (H);
  end;
end;

procedure TFrmPri.Button2Click(Sender: TObject);
var 
  A, B: TCabAutorizacao;
  CodAnt: Integer;
begin
  Tab.Active := False;
  Tab.IndexName := 'ICodigo';
  Tab.TableName := 'Cliente';
  Tab.Active := True;
  A := TCabAutorizacao.Create;
  B := TCabAutorizacao.Create;
  CodAnt := 0;
  try
    Tab.First;
    PB.Max := Tab.RecordCount;
    while not Tab.Eof do begin
      if not tAut.FindKey([Tab.FieldByName('Codigo').AsInteger]) then begin
        A.Load(Tab.FieldByName('Codigo').AsInteger, Tab, tAut);
        if not (Tab.FieldByName('LicTipo').AsInteger in [1..3]) then begin
          Tab.Edit;
          Tab.FieldByName('Bloqueado').AsBoolean := True;
          Tab.Post;
        end else begin
          B.AssignFrom(A);
          with A.NewItem do begin
            case Tab.FieldByName('LicTipo').AsInteger of
              1 : auTipo := taTemporaria;
              2 : auTipo := taDefinitiva;
              3 : auTipo := taTesteGratuito;
            end;
            auVencimento := Tab.FieldByName('LicVenc').AsDateTime;
            auMaquinas := Tab.FieldByName('LicMaq').AsInteger;
          end;
          A.Save('importacao', B, Tab, tAut);
          tAut.Edit;
          tAut.FieldByName('EnviouCli').AsBoolean := True;
          tAut.Post;
        end;
      end;
      Tab.Edit;
      Tab.FieldByName('Cliente').AsBoolean := (Tab.FieldByName('LicTipo').AsInteger in [1..2]);
      Tab.FieldByName('Programa').AsInteger := 0;
      Tab.Post;
      PB.Position := PB.Position + 1;
      Application.ProcessMessages;
      Tab.Next;
    end;
  finally
    A.Free;
    B.Free;
  end;
end;

end.
