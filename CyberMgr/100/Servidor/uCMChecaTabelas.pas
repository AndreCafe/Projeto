unit uCMChecaTabelas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, lmdcctrl, lmdctrl, 
  FileCtrl,
  ffxJFNutils,
  ffdb,
  fflleng,
  ffsrintm,
  ffclreng,
  ffdbbase,
  ffllbase,
  ffllcomp,
  ffllcomm,
  fflllgcy,
  fflldict,
  ComCtrls, AsgFFCG1, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel;

type

  TFuncDict = function: TffDataDictionary;

  TFrmChecaBD = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    Label4: TLabel;
    FFTblMgr: TAsgFFTableManager;
    lbProgresso: TLabel;
    Timer1: TTimer;
    lbOk: TLabel;
    panProgresso: TPanel;
    Progresso: TProgressBar;
    Timer2: TTimer;
    ffCli: TffClient;
    ffSession: TffSession;
    ffDB: TffDatabase;
    procedure FFTblMgrPause;
    procedure FFTblMgrStartProgressDisplay(const Task: String);
    procedure FFTblMgrUpdateProgressDisplay(PercentDone: Integer);
    function FFTblMgrWantedDictionary: TffDataDictionary;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Checar;
  end;

const
  NumTabs = 24; 
  
  NomeTabs : Array[1..NumTabs] of String =
    ('Categoria',
     'Maquina',
     'Contato',
     'Entregador',
     'FormPagto',
     'ItensME',
     'ME',
     'Produto',
     'Usuario',
     'Acesso',
     'Pacote',
     'Config',
     'TipoMov',
     'Grupo',
     'Motivo',
     'Layout',
     'Caixa',
     'Cor',
     'CorPrecos',
     'HoraCor',
     'LancExtra',
     'TipoAcesso',
     'Impressao',
     'Log');
  
var
  FrmChecaBD: TFrmChecaBD;

implementation

uses
  CMServBD;

{$R *.DFM}

{$I C:\Projetos\CyberMgr\Servidor\tabledefs.inc}

const
  TableProcs : Array[1..NumTabs] of TFuncDict =
    (ffTblCategoriaDict, 
     ffTblMaquinaDict,
     ffTblContatoDict,
     ffTblEntregadorDict,
     ffTblFormPagtoDict,
     ffTblItensMEDict,
     ffTblMEDict,
     ffTblProdutoDict,
     ffTblUsuarioDict,
     ffTblAcessoDict,
     ffTblPacoteDict,
     ffTblConfigDict,
     ffTblTipoMovDict,
     ffTblGrupoDict,
     ffTblMotivoDict,
     ffTblLayoutDict,
     ffTblCaixaDict,
     ffTblCorDict,
     ffTblCorPrecosDict,
     ffTblHoraCorDict,
     ffTblLancExtraDict,
     ffTblTipoAcessoDict,
     ffTblImpressaoDict,
     ffTblLogDict);

function TableIndex(Nome: String): Integer;
var I : Integer;
begin
  for I := 1 to NumTabs do
  if Nome = NomeTabs[I] then
  begin
    Result := I;
    Exit;
  end;
  Result := -1;
end;
     
function GetDict(Nome: String): TffDataDictionary;
begin
  Result := TableProcs[TableIndex(Nome)];
end;
     
procedure TFrmChecaBD.FFTblMgrPause;
begin
  Application.ProcessMessages;
end;

procedure TFrmChecaBD.FFTblMgrStartProgressDisplay(const Task: String);
begin
  panProgresso.Visible := True;
  lbProgresso.Caption := Task;
  lbProgresso.Refresh;
end;

procedure TFrmChecaBD.FFTblMgrUpdateProgressDisplay(PercentDone: Integer);
begin
  panProgresso.Visible := True;
  Progresso.Position := PercentDone;
end;

function TFrmChecaBD.FFTblMgrWantedDictionary: TffDataDictionary;
begin
  Result := GetDict(FFTblMgr.WantedTableName);
end;

procedure TFrmChecaBD.Checar;
var 
  I : Integer;
  SL : TStringList;
  Origem, Destino : String;
begin
  SL := TStringList.Create;
  try
    Origem := ExtractFilePath(ParamStr(0))+'cmservidor.ini';
    if FileExists(Origem) then
      SL.LoadFromFile(Origem);

    Destino := SL.Values['BACKUPDIR'];  
    if Destino = '' then begin
      Destino := ExtractFilePath(ParamStr(0))+'Backup';
      Sl.Values['BACKUPDIR']  := Destino;
      SL.SaveToFile(Origem);
    end;  

    if Copy(Destino, Length(Destino), 1)='\' then Delete(Destino, Length(Destino), 1);
    
    {$I-}
    MkDir(Destino);
    {$I+}

    ffCli.ServerEngine := FFServerEng;
    ffCli.Active := True;
    ffSession.Active := True;

    ffDB.AliasName := 'CyberMgr';
    ffDB.AutoDatabaseName := True;
    ffDB.Connected := True;

    Destino := Destino + '\';
    
    Application.ProcessMessages;
    FFTblMgr.OnStartProgressDisplay := FFTblMgrStartProgressDisplay;
    FFTblMgr.OnUpdateProgressDisplay := FFTblMgrUpdateProgressDisplay;
    for I := 1 to NumTabs do 
    begin
      Origem := ExtractFileDir(ParamStr(0))+'\Dados\'+NomeTabs[I]+'.ff2';
      CopyFile(PChar(Origem), PChar(Destino+NomeTabs[I]+'.ff2'), False);
      lbProgresso.Caption := 'Checando tabela: ' + NomeTabs[I];
      if I > 1 then SL.Add(' ');
      SL.Add(NomeTabs[I]+':');  
      SL.Add('-------------------------------');
      FFTblMgr.CheckForTableUpdate(ffDB, NomeTabs[I]);
      SL.AddStrings(FFTblMgr.UpdateDocumentation);
      Application.ProcessMessages;
      Sleep(3);
    end;  
    lbProgresso.Caption := '...';
    
    SL.SaveToFile(ExtractFileDir(ParamStr(0))+'\Tabelas.txt');
  
    lbOk.Visible := True;
  
  
    Timer1.Enabled := True;
  finally
    SL.Free;
  end;  
end;

procedure TFrmChecaBD.FormShow(Sender: TObject);
begin
  Timer2.Enabled := True;
end;

procedure TFrmChecaBD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmChecaBD.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Close;
end;

procedure TFrmChecaBD.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  Checar;
end;

end.
