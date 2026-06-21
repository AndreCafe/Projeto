unit cmConverteArq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, nxdb, Db, nxllComponent, nxsdServerEngine,
  nxsrServerEngine, FileCtrl, ExtCtrls, cmServBD;

type
  TFrmConv = class(TForm)
    PB: TProgressBar;
    lbConv: TLabel;                         
    lbArq: TLabel;
    Timer1: TTimer;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    S: String;
    FDB : TnxDatabase;
    FSession : TnxSession;
    { Public declarations }
    procedure Importa15;
    procedure Importar;
    procedure OnAndamentoConv(Arquivo: String; Total, Atual : Integer);
  end;

var
  FrmConv: TFrmConv;

implementation

uses CMChecaBD, cmDMConv15;

{$R *.DFM}

procedure TFrmConv.FormCreate(Sender: TObject);
begin
  S :=  ExtractFileDir(ParamStr(0))+'\Dados';
  if not DirectoryExists(S) then
    MkDir(S);

  FSession := CreateSession;
  FDB := TnxDatabase.Create(Self);
  FDB.Session := FSession;
  FDB.AliasPath := S;
  FDB.Open;
end;

procedure TFrmConv.Importar;
begin
  Importa15;
  Close;
end;

procedure TFrmConv.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Importar;
end;

procedure TFrmConv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDB.Close;
  FDB.Free;
  FSession.Free;
  Action := caFree;
end;

procedure TFrmConv.Importa15;
begin
  if FileExists(S+'\Transacao.nx1') or
     (not FileExists(S+'\Acesso.nx1')) then Exit;
     
  lbConv.Caption := 'Importando arquivos da versão 1.5 ...';
  
  with TdmConv15.Create(Self) do begin
    OnAndamento := OnAndamentoConv;
    Importa(FDB);
    Free;
  end;  
end;

procedure TFrmConv.OnAndamentoConv(Arquivo: String; Total, Atual: Integer);
begin
  lbArq.Caption := Arquivo;
  PB.Max := Total;
  PB.Position := Atual;
  Application.ProcessMessages;
end;

end.
