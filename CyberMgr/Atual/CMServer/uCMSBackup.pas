unit uCMSBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, Menus, cxLookAndFeelPainters, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit,
  LMDCustomBrowseEdit, LMDBrowseEdit, StdCtrls, cxButtons, cxProgressBar, nxdb,
  nxllComponent, nxdbBackupController, Buttons, PngSpeedButton, cxGroupBox,
  cxRadioGroup, ExtCtrls, DB;

type
  TFrmCopia = class(TForm)
    nxBackup: TnxBackupController;
    nxDBO: TnxDatabase;
    nxDBD: TnxDatabase;
    nxSession: TnxSession;
    panPri: TPanel;
    lbProgresso: TcxLabel;
    PB: TcxProgressBar;
    btnBackup: TPngSpeedButton;
    T: TnxTable;
    edBackupDir: TLMDBrowseEdit;
    cxLabel1: TcxLabel;
    PngSpeedButton1: TPngSpeedButton;
    procedure nxBackupTableProgress(aSender: TnxBackupController;
      aPercentDone: Integer);
    procedure nxBackupOverwriteTable(aSender: TnxBackupController;
      const aTableName: string; var aUseTable: Boolean);
    procedure nxBackupIncludeTable(aSender: TnxBackupController;
      const aTableName: string; var aUseTable: Boolean);
    procedure nxBackupAfterTableOpen(aSender: TnxBackupController;
      aTable: TnxTable; aIsSource: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure FazBackup;
  public
    { Public declarations }
  end;

var
  FrmCopia: TFrmCopia;

implementation

uses cmServBD;

const
  NomeTabs1 = 
'|Aviso.nx1|Caixa.nx1|Categoria.nx1|CC.nx1|Config.nx1|Contato.nx1|Cor.nx1|CorPrecos.nx1|FormPagto.nx1' +
'|Grupo.nx1|HistPass.nx1|HoraCor.nx1|Impressao.nx1|Layout.nx1|Log.nx1|Maquina.nx1|Motivo.nx1|MovEst.nx1' +
'|Pacote.nx1|Passaporte.nx1|Produto.nx1|TipoAcesso.nx1|TipoMov.nx1|TipoPass.nx1|Transacao.nx1|Usuario.nx1|';

  NomeTabs2 = 
'|Aviso|Caixa|Categoria|CC|Config|Contato|Cor|CorPrecos|FormPagto|Grupo|HistPass|HoraCor|Impressao|Layout'+
'|Log|Maquina|Motivo|MovEst|Pacote|Passaporte|Produto|TipoAcesso|TipoMov|TipoPass|Transacao|Usuario|';

{$R *.dfm}

procedure TFrmCopia.btnBackupClick(Sender: TObject);
var S: String;
begin
  if Trim(edBackupDir.Text)='' then
    Raise Exception.Create('A pasta destino tem que ser informada');

  S := edBackupDir.Text;
  if Copy(S, Length(S), 1)<>'\' then
    S := S + '\';

  nxDBD.AliasPath := S + FormatDateTime('yyyymmdd_hhmm', Now);
  FazBackup;
end;

procedure TFrmCopia.FazBackup;
begin
  btnBackup.Visible := False;
  PB.Visible := True;
  lbProgresso.Visible := True;
  edBackupDir.Enabled := False;
  try
    nxSession.ServerEngine := dmServidorBD.ServerEngine;
    nxSession.Active := True;
    if not DirectoryExists(nxDBD.AliasPath) then
      MkDir(nxDBD.AliasPath);
    nxDBO.Active := True;
    nxDBD.Active := True;
    nxBackup.Backup;
    ShowMessage('Backup realizado com sucesso!');
  finally
    edBackupDir.Enabled := True;
    PB.Visible := False;
    lbProgresso.Visible := False;
    nxSession.Active := False;
    btnBackup.Visible := True;
  end;
end;

procedure TFrmCopia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCopia.FormCreate(Sender: TObject);
begin
  edBackupDir.Path := ExtractFilePath(ParamStr(0)) + 'Copia';
end;

procedure TFrmCopia.nxBackupAfterTableOpen(aSender: TnxBackupController;
  aTable: TnxTable; aIsSource: Boolean);
begin
  Application.ProcessMessages;
  lbProgresso.Caption := aTable.TableName;
  PB.Position := 0;
end;

procedure TFrmCopia.nxBackupIncludeTable(aSender: TnxBackupController;
  const aTableName: string; var aUseTable: Boolean);
begin
  aUseTable := 
    (Pos(UpperCase('|'+aTableName+'|'), UpperCase(NomeTabs1))>0) or
    (Pos(UpperCase('|'+aTableName+'|'), UpperCase(NomeTabs2))>0);
end;

procedure TFrmCopia.nxBackupOverwriteTable(aSender: TnxBackupController;
  const aTableName: string; var aUseTable: Boolean);
begin
  aUseTable := True;
end;

procedure TFrmCopia.nxBackupTableProgress(aSender: TnxBackupController;
  aPercentDone: Integer);
begin
  Application.ProcessMessages;
  PB.Position := aPercentDone;
end;

procedure TFrmCopia.PngSpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
