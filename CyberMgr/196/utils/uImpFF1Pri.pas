unit uImpFF1Pri;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, nxdb, Db, nxllComponent, nxsdServerEngine,
  nxsrServerEngine, FileCtrl, ExtCtrls, ffdb, nx1xAutoComponent;

type
  TFrmPri = class(TForm)
    PB: TProgressBar;
    lbConv: TLabel;
    lbArq: TLabel;
    nxServer: TnxServerEngine;
    nxTab: TnxTable;
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    Timer1: TTimer;
    ffTab: TffTable;
    nx1xAllEngines1: Tnx1xAllEngines;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    S: String;
    { Public declarations }
    procedure Importa10;
    procedure Importa15;
    procedure Importar;
    procedure CorrigeAutoInc;
  end;

const
  NumArqFF = 23;
  
  ArquivosFF : Array[1..NumArqFF] of String = (
    'Acesso',
    'Caixa',
    'Categoria',
    'Config',
    'Contato',
    'Cor',
    'CorPrecos',
    'FormPagto',
    'Grupo',
    'HoraCor',
    'Impressao',
    'ItensME',
    'LancExtra',
    'Layout',
    'Log',
    'Maquina',
    'ME',
    'Motivo',
    'Pacote',
    'Produto',
    'TipoAcesso',
    'TipoMov',
    'Usuario');

var
  FrmPri: TFrmPri;

implementation

uses CMChecaBD, CMChecaBD10;

{$R *.DFM}

procedure TransfDados(F, D: TDataset);
var 
  I : Integer;
  AF : TField;
begin
  D.Append;
  for I := 0 to pred(F.FieldCount) do 
  with F.Fields[I] do
  if (FieldKind = fkData) then begin
    AF := D.FindField(FieldName);
    if AF <> nil then 
      AF.Value := Value;
  end;  
  D.Post;
end;

procedure TFrmPri.CorrigeAutoInc;
var 
  F : TField;
  I : Integer;
begin
  try
    with nxTab do
    for I := 0 to FieldCount-1 do 
    if Fields[I].DataType = ftAutoInc then begin
      try
        nxTab.IndexFieldNames := Fields[I].FieldName;
      except
      end;  
      nxTab.Last;
      nxTab.SetAutoIncValue(Fields[I].AsInteger);
    end;  
  except
  end;  
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  S :=  ExtractFileDir(ParamStr(0))+'\Dados';
  if not DirectoryExists(S) then
    MkDir(S);
  nxDB.AliasPath := S;
  nxDB.Connected := True;
end;

procedure TFrmPri.Importa10;
var I : Integer;
begin
  if (not FileExists(S+'\Acesso.ff2')) or
     FileExists(S+'\Acesso.nx1') or
     FileExists(S+'\Transacao.nx1') then
    Exit; 

  lbConv.Caption := 'Importando arquivos da versão 1.00 ...';
  Application.ProcessMessages;
  CMChecaBD10.RestructureCybermgrDatabase(nxDB);
  for I := 1 to NumArqFF do
  if FileExists(S+'\'+ArquivosFF[I]+'.FF2') then begin
    lbArq.Caption := ArquivosFF[I];

    ffTab.Active := False;
    ffTab.TableName := ArquivosFF[I];
    ffTab.IndexName := '';

    nxTab.Active := False;
    nxTab.TableName := ArquivosFF[I];
    nxTab.IndexName := '';

    ffTab.Open;
    PB.Max := ffTab.RecordCount;
    PB.Position := 0;

    nxTab.Open;
    try
      while not ffTab.Eof do begin
        PB.Position := PB.Position + 1;
        TransfDados(ffTab, nxTab);
        ffTab.Next;
        Application.ProcessMessages;
      end;
    except
    end;
    CorrigeAutoInc;
  end;
  nxSession.Active := False;
end;

procedure TFrmPri.Importar;
begin
  Importa10;
  Importa15;
end;

procedure TFrmPri.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Importar;
end;

end.
