unit ncaAutoUpdateFrm;
// Formulario de progresso para download do setup de atualizacao.
// Criado dinamicamente (sem DFM) — puro ASCII, seguro para Edit/Write.

interface

uses
  Windows, SysUtils, Classes, Forms, Controls, StdCtrls, ComCtrls,
  ExtCtrls, WinInet, ncDebug, Graphics;

type
  // Thread que faz o download em background via WinInet
  TncaDownloadThread = class(TThread)
  private
    FUrl       : String;
    FDestFile  : String;
    FBytesRead : Int64;
    FTotalBytes: Int64;
    FSuccess   : Boolean;
    FError     : String;
    FStatusMsg : String;
    FCancelFlag: PBoolean;
    FOnProgress: TNotifyEvent;  // disparado via Synchronize
    FLastSync  : DWORD;         // tick da ultima sync (evita flood)
    procedure DoProgress;
  protected
    procedure Execute; override;
  public
    constructor Create(const aUrl, aDestFile: String; aCancelFlag: PBoolean);
    property Success   : Boolean read FSuccess;
    property Error     : String  read FError;
    property BytesRead : Int64   read FBytesRead;
    property TotalBytes: Int64   read FTotalBytes;
    property StatusMsg : String  read FStatusMsg;
    property OnProgress: TNotifyEvent read FOnProgress write FOnProgress;
  end;

  // Dialogo modal com barra de progresso
  TncaUpdateDlg = class(TForm)
  private
    FThread   : TncaDownloadThread;
    FCancelled: Boolean;
    FSuccess  : Boolean;
    FDone     : Boolean;  // True quando thread terminou (erro ou ok)
    FUrl      : String;
    FDestFile : String;
    // controles criados dinamicamente
    FLblTitulo : TLabel;
    FLblStatus : TLabel;
    FProgress  : TProgressBar;
    FBtnCancel : TButton;
    procedure BuildUI;
    procedure ThreadProgress(Sender: TObject);
    procedure ThreadDone(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  public
    constructor CreateDlg(AOwner: TComponent; const aUrl, aDestFile: String);
    destructor Destroy; override;
    property Success  : Boolean read FSuccess;
    property Cancelled: Boolean read FCancelled;
  end;

// Ponto de entrada: exibe dialogo e faz download. True = sucesso.
function DownloadWithProgress(const aUrl, aDestFile: String): Boolean;

implementation

{ ------------------------------------------------------------------ }
{ TncaDownloadThread                                                  }
{ ------------------------------------------------------------------ }

constructor TncaDownloadThread.Create(const aUrl, aDestFile: String;
  aCancelFlag: PBoolean);
begin
  inherited Create(True);
  FUrl        := aUrl;
  FDestFile   := aDestFile;
  FCancelFlag := aCancelFlag;
  FSuccess    := False;
  FBytesRead  := 0;
  FTotalBytes := 0;
  FLastSync   := 0;
  FreeOnTerminate := False;
end;

procedure TncaDownloadThread.DoProgress;
begin
  if Assigned(FOnProgress) then FOnProgress(Self);
end;

procedure TncaDownloadThread.Execute;
const
  cBufSize = 32768; // 32 KB por leitura
  cSyncMs  = 150;   // intervalo minimo entre sincronizacoes (ms)
var
  hSess, hUrl: HINTERNET;
  Buf: array[0..cBufSize - 1] of Byte;
  BytesThis: DWORD;
  F: TFileStream;
  sLen: array[0..63] of Char;
  dwLen, dwIdx: DWORD;
begin
  DebugMsg('DownloadThread - inicio url=' + FUrl); // do not localize

  hSess := InternetOpen('NexCafe-Updater/1.0', // do not localize
    INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  if hSess = nil then begin
    FError := 'InternetOpen falhou err=' + IntToStr(GetLastError); // do not localize
    DebugMsg('DownloadThread - ' + FError); // do not localize
    Exit;
  end;
  try
    hUrl := InternetOpenUrl(hSess, PChar(FUrl), nil, 0,
      INTERNET_FLAG_RELOAD or INTERNET_FLAG_NO_CACHE_WRITE or INTERNET_FLAG_SECURE, 0);
    if hUrl = nil then begin
      FError := 'InternetOpenUrl falhou err=' + IntToStr(GetLastError); // do not localize
      DebugMsg('DownloadThread - ' + FError); // do not localize
      Exit;
    end;
    try
      // Tenta obter tamanho total (Content-Length)
      FillChar(sLen, SizeOf(sLen), 0);
      dwLen := SizeOf(sLen); dwIdx := 0;
      if HttpQueryInfo(hUrl, HTTP_QUERY_CONTENT_LENGTH, @sLen, dwLen, dwIdx) then
        FTotalBytes := StrToInt64Def(Trim(sLen), 0);
      DebugMsg('DownloadThread - Content-Length=' + IntToStr(FTotalBytes)); // do not localize

      F := TFileStream.Create(FDestFile, fmCreate);
      try
        FLastSync := GetTickCount;
        repeat
          BytesThis := 0;
          if not InternetReadFile(hUrl, @Buf, cBufSize, BytesThis) then begin
            FError := 'InternetReadFile falhou err=' + IntToStr(GetLastError); // do not localize
            DebugMsg('DownloadThread - ' + FError); // do not localize
            Exit;
          end;
          if BytesThis = 0 then Break; // EOF

          F.WriteBuffer(Buf, BytesThis);
          Inc(FBytesRead, BytesThis);

          // Sincroniza a cada ~150ms ou a cada 256 KB
          if (GetTickCount - FLastSync >= cSyncMs) or
             (FBytesRead mod (256 * 1024) < cBufSize) then begin
            FLastSync := GetTickCount;
            Synchronize(DoProgress);
          end;

          if FCancelFlag^ then begin
            FError := 'Cancelado pelo usuario'; // do not localize
            DebugMsg('DownloadThread - cancelado'); // do not localize
            Exit;
          end;
        until False;

        FSuccess := True;
        FStatusMsg := 'Download concluido'; // do not localize
        DebugMsg('DownloadThread - concluido ' + IntToStr(FBytesRead) + ' bytes'); // do not localize
        Synchronize(DoProgress); // progresso final
      finally
        F.Free;
        if not FSuccess then
          DeleteFile(PChar(FDestFile)); // remove arquivo incompleto
      end;
    finally
      InternetCloseHandle(hUrl);
    end;
  finally
    InternetCloseHandle(hSess);
  end;
end;

{ ------------------------------------------------------------------ }
{ TncaUpdateDlg                                                       }
{ ------------------------------------------------------------------ }

constructor TncaUpdateDlg.CreateDlg(AOwner: TComponent;
  const aUrl, aDestFile: String);
begin
  inherited CreateNew(AOwner);
  FUrl      := aUrl;
  FDestFile := aDestFile;
  FCancelled := False;
  FSuccess   := False;
  FDone      := False;
  BuildUI;
end;

destructor TncaUpdateDlg.Destroy;
begin
  if Assigned(FThread) then begin
    FThread.OnTerminate := nil;
    FThread.Free;
  end;
  inherited;
end;

procedure TncaUpdateDlg.BuildUI;
begin
  Caption      := 'Atualizando NexCafe';
  BorderStyle  := bsDialog;
  Position     := poScreenCenter;
  Width        := 420;
  Height       := 150;
  OnCloseQuery := FormCloseQuery;

  FLblTitulo := TLabel.Create(Self);
  FLblTitulo.Parent  := Self;
  FLblTitulo.SetBounds(16, 14, 388, 18);
  FLblTitulo.Caption := 'Baixando atualizacao...';
  FLblTitulo.Font.Style := [fsBold];

  FLblStatus := TLabel.Create(Self);
  FLblStatus.Parent  := Self;
  FLblStatus.SetBounds(16, 36, 388, 16);
  FLblStatus.Caption := 'Conectando ao servidor...';

  FProgress := TProgressBar.Create(Self);
  FProgress.Parent := Self;
  FProgress.SetBounds(16, 58, 388, 20);
  FProgress.Min   := 0;
  FProgress.Max   := 100;
  FProgress.Step  := 1;

  FBtnCancel := TButton.Create(Self);
  FBtnCancel.Parent   := Self;
  FBtnCancel.Caption  := 'Cancelar';
  FBtnCancel.SetBounds(163, 90, 90, 26);
  FBtnCancel.OnClick  := BtnCancelClick;
end;

procedure TncaUpdateDlg.BtnCancelClick(Sender: TObject);
begin
  if FDone then begin
    // Thread ja terminou (com erro): este botao agora e "Fechar"
    ModalResult := mrCancel;
    Exit;
  end;
  FCancelled := True;
  FBtnCancel.Enabled := False;
  FLblStatus.Caption := 'Cancelando...';
end;

procedure TncaUpdateDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  // So permite fechar quando o thread terminou (FDone setado em ThreadDone/OnTerminate)
  CanClose := FDone or (FThread = nil);
end;

procedure TncaUpdateDlg.ThreadProgress(Sender: TObject);
var
  sStatus: String;
  nPct: Integer;
begin
  if not Assigned(FThread) then Exit;

  if FThread.TotalBytes > 0 then begin
    nPct := Trunc((FThread.BytesRead / FThread.TotalBytes) * 100.0);
    FProgress.Position := nPct;
    sStatus := Format('%.1f MB de %.1f MB  (%d%%)',
      [FThread.BytesRead / 1048576.0, FThread.TotalBytes / 1048576.0, nPct]);
  end else begin
    // Tamanho desconhecido: barra fica pulsando entre 0 e 50
    nPct := (FProgress.Position + 5) mod 50;
    FProgress.Position := nPct;
    sStatus := Format('%.1f MB baixados...', [FThread.BytesRead / 1048576.0]);
  end;

  FLblStatus.Caption := sStatus;
  DebugMsg('DownloadProgress - ' + sStatus); // do not localize
end;

procedure TncaUpdateDlg.ThreadDone(Sender: TObject);
begin
  FDone    := True;
  FSuccess := FThread.Success;
  if FThread.Success then begin
    FLblStatus.Caption := 'Download concluido!';
    FProgress.Position := 100;
    DebugMsg('DownloadThread - OnTerminate: sucesso'); // do not localize
    ModalResult := mrOk; // fecha o dialogo automaticamente
  end else if FCancelled then begin
    DebugMsg('DownloadThread - OnTerminate: cancelado pelo usuario'); // do not localize
    ModalResult := mrCancel;
  end else begin
    // Erro: exibe mensagem e troca botao para "Fechar"
    FLblStatus.Caption := 'Erro: ' + FThread.Error;
    FProgress.Position := 0;
    FBtnCancel.Caption  := 'Fechar';
    FBtnCancel.Enabled  := True;
    DebugMsg('DownloadThread - OnTerminate: erro=' + FThread.Error); // do not localize
    // Nao seta ModalResult — usuario fecha manualmente apos ler o erro
  end;
end;

{ ------------------------------------------------------------------ }
{ DownloadWithProgress                                                }
{ ------------------------------------------------------------------ }

function DownloadWithProgress(const aUrl, aDestFile: String): Boolean;
var
  dlg: TncaUpdateDlg;
begin
  Result := False;
  dlg := TncaUpdateDlg.CreateDlg(nil, aUrl, aDestFile);
  try
    // Cria e inicia thread antes de ShowModal
    dlg.FThread := TncaDownloadThread.Create(aUrl, aDestFile, @dlg.FCancelled);
    dlg.FThread.OnProgress  := dlg.ThreadProgress;
    dlg.FThread.OnTerminate := dlg.ThreadDone;
    dlg.FThread.Resume;

    dlg.ShowModal;
    Result := dlg.Success and (not dlg.Cancelled);
  finally
    dlg.Free;
  end;
end;

end.
