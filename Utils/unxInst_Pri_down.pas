unit unxInst_Pri_down;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDPNGImage, ExtCtrls, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxPC, Registry, LMDCustomComponent,
  LMDBaseController, LMDCustomContainer, LMDGenericList, cxPCdxBarPopupMenu;

type
  TFrmPri = class(TForm)
    Paginas: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    Label1: TLabel;
    Label5: TLabel;
    rbServ: TRadioButton;
    rbCli: TRadioButton;
    pagServ: TcxPageControl;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    Label7: TLabel;
    Label6: TLabel;
    Image2: TImage;
    LMDSimplePanel3: TLMDSimplePanel;
    Label9: TLabel;
    Label10: TLabel;
    Image3: TImage;
    Image4: TImage;
    edPasta: TEdit;
    btnPasta: TButton;
    tsInstalar: TcxTabSheet;
    LMDSimplePanel4: TLMDSimplePanel;
    Label11: TLabel;
    Label12: TLabel;
    Image5: TImage;
    Label13: TLabel;
    Memo1: TMemo;
    LMDSimplePanel5: TLMDSimplePanel;
    btnCancelar: TButton;
    btnAvancar: TButton;
    btnVoltar: TButton;
    Timer1: TTimer;
    tsFim: TcxTabSheet;
    Image6: TImage;
    Label15: TLabel;
    Label16: TLabel;
    cbExec1: TCheckBox;
    cbServAdmin: TComboBox;
    genList: TLMDGenericList;
    Label8: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure rbCliClick(Sender: TObject);
    procedure rbServClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnPastaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

    function fullexe(prog: byte): String;
  private
    { Private declarations }
    procedure LeDadosReg;
    procedure SalvaReg;
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;
  FechouAdmin : Boolean = False;
  FechouServ : Boolean = False;

const
  Caminho = '\Software\Microsoft\Windows\CurrentVersion\Uninstall\';  
  

implementation

uses unxInst_Folder, madKernel, ncFirewall;

{$R *.dfm}

procedure FecharProg(aProg: String);
var 
  P : IProcesses;
  H : HWND;
begin
  if SameText(aProg, 'nexserv.exe') then begin
    H := FindWindow('TncServBaseClassName', nil);
    if H<>0 then begin
      PostMessage(H, wm_user+3, 10, 0);
      FechouServ := True;
      Sleep(2000);
    end;
    P := Processes(aProg);
    if P.ItemCount>0 then begin
      P[0].Exit_;
      FechouServ := True;
    end;
  end else  begin
    P := Processes(aProg);
    if P.ItemCount>0 then begin
      P[0].Close;
      FechouAdmin := True;
    end;
  end;
end;

function GetTempDirectory: String;
var
  tempFolder: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;

function WinExecAndWait32(FileName: string; Visibility: Integer; aWait: Boolean): Longword;
var { by Pat Ritchey }
  zAppName: array[0..512] of Char;
  zCurDir: array[0..255] of Char;
  WorkDir: string;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  StrPCopy(zAppName, FileName);
  GetDir(0, WorkDir);
  StrPCopy(zCurDir, WorkDir);
  FillChar(StartupInfo, SizeOf(StartupInfo), #0);
  StartupInfo.cb          := SizeOf(StartupInfo);
  StartupInfo.dwFlags     := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  if not CreateProcess(nil,
    zAppName, // pointer to command line string
    nil, // pointer to process security attributes
    nil, // pointer to thread security attributes
    False, // handle inheritance flag
    CREATE_NEW_CONSOLE or // creation flags
    NORMAL_PRIORITY_CLASS,
    nil, //pointer to new environment block
    nil, // pointer to current directory name
    StartupInfo, // pointer to STARTUPINFO
    ProcessInfo) // pointer to PROCESS_INF
    then Result := WAIT_FAILED
  else
  begin
    if aWait then begin
      WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
      GetExitCodeProcess(ProcessInfo.hProcess, Result);
    end;
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end;
end; 

procedure TFrmPri.btnAvancarClick(Sender: TObject);
var S, sExe: String;

procedure ExecSW(I: Integer);
begin
  S := fullexe(i);
  if I=1 then 
    S := S + ' afterinst';

  if I=1 then
    I := SW_SHOW else
    I := SW_SHOWNORMAL;
    
  WinExecAndWait32(S, I, False);
end;

begin
  case Paginas.ActivePageIndex of
    1 : begin
      if (not rbServ.Checked) and (not rbCli.Checked) then
        Raise Exception.Create('É necessário selecionar se está instalando no SERVIDOR ou em uma máquina CLIENTE.');
    end;
  end;
  Memo1.Clear;
  Memo1.Lines.Add('Tipo de instalação:');
  if rbServ.Checked then begin
    if cbServAdmin.ItemIndex=0 then 
       Memo1.Lines.Add('     - Servidor NexCafé');
     Memo1.Lines.Add('     - Administrador NexCafé');
  end else
    Memo1.Lines.Add('     - Máquina Cliente');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('Instalar em:');
  Memo1.Lines.Add('     ' + edPasta.Text);
    
  case Paginas.ActivePageIndex of
    3 : begin
      Paginas.ActivePageIndex := Paginas.ActivePageIndex + 1;
      try SalvaReg except end;
      if rbCli.Checked then
        S := '/type=Cliente' 
      else
      if cbServAdmin.ItemIndex=0 then
        S := '/type=Servidor' else
        S := '/type=Admin';
      sExe := IncludeTrailingBackslash(GetTempDirectory)+'setup_nexcafe_.exe';
      genList.Items[0].SaveToFile(sExe);
      btnCancelar.Enabled := False;
      if rbServ.Checked then begin
        FecharProg('NexAdmin.exe');
        if cbServAdmin.ItemIndex=0 then 
          FecharProg('NexServ.exe');

        if FechouAdmin or FechouServ then
          cbExec1.Visible := False;  
      end;
      if WinExecAndWait32(sExe + ' /dir="'+edPasta.Text+'" /silent '+S, SW_SHOWNORMAL, True)<>0 then
        Close;
      try  
        try allowexceptionsonFirewall except end;
        if rbCli.Checked then
          addApplicationToFirewall('NexCafé Guard', fullexe(3))
        else begin
          addApplicationToFirewall('NexCafé Admin', fullexe(2));
          if cbServAdmin.ItemIndex=0 then
            addApplicationToFirewall('NexCafé Servidor', fullexe(1));
        end;
      except
      end;
    end;
    4 : begin
      if cbExec1.Checked or (rbServ.Checked and (cbServAdmin.ItemIndex=0)) then 
        if rbServ.Checked then begin
          if cbServAdmin.ItemIndex=0 then begin
            WinExecAndWait32(fullexe(4), SW_SHOWNORMAL, True);
            ExecSW(1);
          end else
            ExecSW(2);
        end else
          ExecSW(3);
      Close;
    end
  else
    Paginas.ActivePageIndex := Paginas.ActivePageIndex + 1;
  end;
end;

procedure TFrmPri.btnVoltarClick(Sender: TObject);
begin
  Paginas.ActivePageIndex := Paginas.ActivePageIndex - 1;
end;

procedure TFrmPri.btnPastaClick(Sender: TObject);
begin
  edPasta.Text := TFrmFolder.Create(Self).ObtemFolder(edPasta.Text);
{  if OpenDlg.Execute then
    edPasta.Text := OpenDlg.FileName;}
end;

procedure TFrmPri.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  Paginas.ActivePageIndex := 0;
  pagServ.ActivePageIndex := 0;
  try LeDadosReg; except end;
end;

function TFrmPri.fullexe(prog: byte): String;
begin
  result := edPasta.Text;
  if Copy(result, Length(result), 1) <> '\' then
    result := result + '\';
    
  case prog of
    1 : result := result + 'NexServ.exe';
    2 : result := result + 'NexAdmin.exe';
    3 : result := result + 'NexGuard.exe';
    4 : result := result + 'impv5.exe';
  end;
end;

procedure TFrmPri.LeDadosReg;
var 
  R: TRegistry;

procedure Le(aChave: String);
var S: String;
begin
  R.OpenKey(Caminho+aChave, False);
  S := ExtractFileDir(R.ReadString('InstallLocation'));
  edPasta.Text := S;
  R.CloseKey;  
end;  

begin
  R := TRegistry.Create;
  try
    R.Access := KEY_ALL_ACCESS;
    R.RootKey := HKEY_LOCAL_MACHINE;
    
    if R.KeyExists(Caminho+'NexCafé_is1') then begin
      Le('NexCafé_is1');
      if R.KeyExists(caminho+'NexCafe_Unico') then begin
        R.OpenKey(Caminho+'NexCafe_Unico', False);
        rbCli.Checked := R.ReadBool('rbCli');
        rbServ.Checked := not rbCli.Checked;
        if rbCli.Checked then begin
          rbCli.Checked := true;
          rbCliClick(nil);
        end else begin
          rbServ.Checked := True;
          rbServClick(nil);
        end;
        cbServAdmin.ItemIndex := R.ReadInteger('cbServAdmin');
        R.CloseKey;
      end else begin
        rbServ.Checked := True;
        rbServClick(nil);
      end;
    end else
    if R.KeyExists(Caminho+'NexCafé NexServ_is1') then begin
      rbServ.Checked := True;
      rbServClick(nil);
      Le('NexCafé NexServ_is1');
    end else
    if R.KeyExists(Caminho+'NexCafé NexAdmin_is1') then begin
      rbServ.Checked := True;
      rbServClick(nil);
      
      Le('NexCafé Admin_is1');
      cbServAdmin.ItemIndex := 1;
    end else
    if R.KeyExists(Caminho+'NexCafé NexGuard_is1') then begin
      Le('NexCafé NexGuard_is1');
      rbCli.Checked := true;
      rbCliClick(nil);
    end;
  finally
    R.Free;
  end;
end;

procedure TFrmPri.PaginasChange(Sender: TObject);
begin
  case Paginas.ActivePageIndex of
    3 : btnAvancar.Caption := 'Instalar!';
    4 : btnAvancar.Caption := 'Concluir';
  else
    btnAvancar.Caption := 'Avançar >';
  end;
  
  btnVoltar.Visible := not (Paginas.ActivePageIndex in [0, 4]);
  btnCancelar.Visible := (Paginas.ActivePageIndex <> 4);
end;

procedure TFrmPri.rbCliClick(Sender: TObject);
begin
  rbCli.Font.Color := clBlack;
  rbServ.Font.Color := $00585858;

  pagServ.ActivePageIndex := 0;
end;

procedure TFrmPri.rbServClick(Sender: TObject);
begin
  rbServ.Font.Color := clBlack;
  rbCli.Font.Color := $00585858;
  
  pagServ.ActivePageIndex := 1;
end;

procedure TFrmPri.SalvaReg;
var R: TRegistry;
begin
  R := TRegistry.Create;
  try
    R.Access := KEY_ALL_ACCESS;
    R.RootKey := HKEY_LOCAL_MACHINE;

    if not R.KeyExists(caminho+'NexCafe_Unico') then
      if not R.CreateKey(caminho+'NexCafe_Unico') then Exit;

    try R.CloseKey except end;
      
    R.OpenKey(Caminho+'NexCafe_Unico', False);
    R.WriteBool('rbCli', rbCli.Checked);
    R.WriteInteger('cbServAdmin', cbServAdmin.ItemIndex);
    R.CloseKey;
    
  finally
    R.Free;
  end;
end;

procedure TFrmPri.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Top := Top - 24;
end;

end.
