unit uAFrmExp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit, LMDCustomBrowseEdit,
  LMDBrowseEdit, ComCtrls;

type
  TFrmExp = class(TForm)
    Label1: TLabel;
    edPath: TLMDBrowseEdit;
    cbCli: TCheckBox;
    cbTec: TCheckBox;
    Memo1: TMemo;
    btnExp: TBitBtn;
    btnCancelar: TBitBtn;
    PB: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbTecClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    SL: TStrings;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExp: TFrmExp;

implementation

uses uDMA;

{$R *.dfm}

function ConfigFName: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'path.ini';
end;

procedure TFrmExp.btnExpClick(Sender: TObject);
begin
  if not (cbCli.Checked or cbTec.Checked) then Exit;

  if not DirectoryExists(edPath.Path) then
    Raise Exception.Create('O caminho informado não existe');

  SL.Values['path'] := edPath.Path;
  SL.SaveToFile(ConfigFName);  

  PB.Visible := True;
  try
    if cbCli.Checked then begin
      DM.tExp.Active := False;
      DM.tExp.FilePath := edPath.Path;
      DM.tExp.TableName := 'CONSCLI_'+DM.tRAFID.AsString+'.DBF';
      DM.Exporta('Cliente', PB);
    end;
    
    if cbTec.Checked then begin
      DM.tExp.Active := False;
      DM.tExp.FilePath := edPath.Path;
      DM.tExp.TableName := 'CONSTEC_'+DM.tRAFID.AsString+'.DBF';
      DM.Exporta('Tecnico', PB);
    end;
    ShowMessage('Exportação realizada com sucesso!');
    Close;
  finally
    PB.Visible := False;
  end;
end;

procedure TFrmExp.cbTecClick(Sender: TObject);
begin
  btnExp.Enabled := cbTec.Checked or cbCli.Checked;
end;

procedure TFrmExp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmExp.FormCreate(Sender: TObject);
begin
  SL := TStrings.Create;
  if FileExists(ConfigFName) then begin
    SL.LoadFromFile(ConfigFName);
    edPath.Text := SL.Values['path'];
  end;
end;

procedure TFrmExp.FormDestroy(Sender: TObject);
begin
  SL.Free;
end;

procedure TFrmExp.FormShow(Sender: TObject);
begin
  if DM.tRAF.IsEmpty then begin
    cbCli.Enabled := False;
    cbTec.Enabled := False;
    btnExp.Enabled := False;
  end else begin
    cbCli.Enabled := not DM.tRAFDHFechaCli.IsNull;
    cbCli.Checked := cbCli.Enabled;
    cbTec.Enabled := not DM.tRAFDHFechaTec.IsNull;
    cbTec.Checked := cbTec.Enabled;
  end;
  btnExp.Enabled := cbTec.Checked or cbCli.Checked;
  edPath.Path := 'c:\';
end;

end.
