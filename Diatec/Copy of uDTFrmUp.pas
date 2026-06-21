unit uDTFrmUp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, lmdctrl, lmdstdcS, lmdcctrl, lmdbtn, DB, nxdb, nxdbBase, uDTDMSync,
  ComCtrls;

type
  TFrmUp = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    lbTabela: TLMDSimpleLabel;
    lbAndamento: TLMDSimpleLabel;
    LMDSimpleLabel3: TLMDSimpleLabel;
    edServidor: TEdit;
    btnUpload: TLMDSpeedButton;
    lbStatus: TLMDLabel;
    Progresso: TProgressBar;
    procedure edServidorChange(Sender: TObject);
    procedure btnUploadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ITOS : PInfoTabela;
    ITOSFase : PInfoTabela;
    ITFase   : PInfoTabela;
    procedure SalvaInfoTabelas;
    procedure RestauraInfoTabelas;
    procedure PreparaTabelas;
    procedure UploadTable(F, D: TnxTable);
  public
    { Public declarations }
  end;

var
  FrmUp: TFrmUp;

implementation

uses uDTDM, uDTSyncDef;

{$R *.DFM}

procedure TFrmUp.edServidorChange(Sender: TObject);
begin
  Servidor := edServidor.Text;
end;

procedure TFrmUp.UploadTable(F, D: TnxTable);
begin
  lbTabela.Caption := 'Tabela: ' + F.TableName;
  Progresso.Max := F.RecordCount;
  Progresso.Position := 0;
  F.First;
  with DM, DMSync do
  while not F.Eof do begin
    Progresso.Position := Progresso.Position + 1;
    lbAndamento.Caption := IntToStr(Progresso.Position) + ' / ' +
                           IntToStr(Progresso.Max);
    Application.ProcessMessages;
    TransfDados(F, D);
    Sincronizou(F);
    F.Next;
  end;
end;

procedure TFrmUp.btnUploadClick(Sender: TObject);
var Erro: Integer;
begin
  lbStatus.Font.Color := clBlack;
  if btnUpload.Caption <> 'Upload' then
  begin
    Close;
    Exit;
  end;
  lbStatus.Caption := 'Estabelecendo conexão com o servidor ... aguarde';
  lbStatus.Refresh;
  Sleep(50);
  Erro := DMSync.AbreUp;
  if Erro <> 0 then begin
    Beep;
    lbStatus.Caption := GetSyncErrorMsg(Erro);
    ShowMessage(lbStatus.Caption);
    Exit;
  end;
  btnUpload.Enabled := False;
  btnUpload.Caption := 'Fechar';
  Sincronizando := True;
  with DM, DMSync do
  try
    nxdb.StartTransaction;
    ffDBSync.StartTransaction;
    try
      lbStatus.Caption := 'Enviando dados para o servidor ...';
      tControle.Edit;
      tControleStatus.Value := errCtrlUpload;
      tControle.Post;
      
      UploadTable(tOS, tUOS);
      UploadTable(tOSItens, tUOSFase);
      UploadTable(tFase, tUFase);

      tControle.Edit;
      tControleStatus.Value := errCtrlUploadPend;
      tControle.Post;
      nxdb.Commit;
      ffDBSync.Commit;
      lbStatus.Caption := 'Dados enviados com sucesso!';
      lbStatus.Font.Color := clgreen;
    except;
      lbStatus.Font.Color := clRed;
      lbStatus.Caption := 'Falha no enviou de dados!';
      try
        tOS.Cancel;
        tOSItens.Cancel;
        tFase.Cancel;
        tUOS.Cancel;
        tUOSFase.Cancel;
        tUFase.Cancel;
      except
      end;  
      nxdb.Rollback;
      ffDBSync.Rollback;
      Raise;
    end;
  finally;
    Sincronizando := False;
    FechaUp;
    btnUpload.Enabled := True;  
  end;
end;

procedure TFrmUp.FormCreate(Sender: TObject);
begin
  edServidor.Text := Servidor;
  ITOS := nil;
  ITOSFase := nil;
  ITFase := nil;
  SalvaInfoTabelas;
end;

procedure TFrmUp.FormDestroy(Sender: TObject);
begin
  try
    RestauraInfoTabelas;
  except
  end; 
  DM.FiltraOS; 
end;

procedure TFrmUp.SalvaInfoTabelas;
begin
  with DM, DMSync do begin
    ITOS := SalvaInfoTabela(tOS);
    ITOSFase := SalvaInfoTabela(tOSItens);
    ITFase := SalvaInfoTabela(tFase);
  end;  
end;

procedure TFrmUp.RestauraInfoTabelas;
begin
  with DM, DMSync do begin
    RestauraInfoTabela(tOS, ITOS);
    RestauraInfoTabela(tOSItens, ITOSFase);
    RestauraInfoTabela(tFase, ITFase);
  end;  
end;

procedure TFrmUp.PreparaTabelas;
begin
  with DM do
  try
    SalvaInfoTabelas;
    tOS.IndexName := 'ISync';
    tOSItens.IndexName := 'ISync';
    tFase.IndexName := 'ISync';
    
    tOS.SetRange([True], [True]);
    tOSItens.SetRange([True], [True]);
    tFase.SetRange([True], [True]);
    
    if tOS.RecordCount > 0 then Exit;
    if tOSItens.RecordCount > 0 then Exit;
    if tFase.RecordCount > 0 then Exit;
    
    lbStatus.Caption := 'Não há items a serem sincronizados';
    btnUpload.Caption := 'Fechar';
  except
    btnUpload.Caption := 'Fechar';
    lbStatus.Caption := 'Falha preparando tabelas para upload';
  end;
end;

procedure TFrmUp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMSync.FechaUp;
  Action := caFree;
end;

end.
