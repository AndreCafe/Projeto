unit uSimulaProtheus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Db, Dbf;

type
  TForm1 = class(TForm)
    Button1: TButton;
    edPath: TEdit;
    Button2: TButton;
    Label1: TLabel;
    Timer1: TTimer;
    TF: TDbf;
    TD: TDbf;
    Button3: TButton;
    Label2: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Transfere;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;

function ArqN(S: String): String;
begin
  Result := Form1.edPath.Text + S;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  try
    if not FileExists(ArqN('UPPEND.SEM')) then
      Label1.Font.Color := clBlack
    else  
    if RenameFile(ArqN('UPPEND.SEM'), ArqN('PROTHEUS.SEM')) then
    try
      Label1.Font.Color := clGreen;
      Label1.Caption := 'PROTHEUS.SEM';
      TF.Active := False;
      TD.Active := False;
      TF.FilePath := edPath.Text;
      TD.FilePath := edPath.Text;

      TF.TableName := 'UOS.DBF';
      TD.TableName := 'OS.DBF';
      Transfere;

      TF.TableName := 'UOSFase.DBF';
      TD.TableName := 'OSFase.DBF';
      Transfere;

      TF.TableName := 'UOSFaseDesc.DBF';
      TD.TableName := 'OSFaseDesc.DBF';
      Transfere;


      RenameFile(ArqN('PROTHEUS.SEM'), ArqN('DOWNPEND.SEM'));
    except
      RenameFile(ArqN('PROTHEUS.SEM'), ArqN('UPPEND.SEM'));
    end;
  finally
    Timer1.Enabled := True;
    Label1.Caption := 'Aguardando UPPEND.SEM';
  end;
end;

procedure TForm1.Transfere;
var
  I : Integer;
  F : TField;
begin
  TF.Active := True;
  TD.Active := True;
  TF.First;
  while (not Application.Terminated) and (not TF.Eof) do begin
    TD.Insert;
    for I := 0 to TD.FieldCount-1 do with TD.Fields[I] do begin
      F := TF.FindField(FieldName);
      if F <> nil then 
        Value := F.Value;
    end;
    TD.Post;
    TF.Next;
    Application.ProcessMessages;
  end;

  TF.EmptyTable;
  TF.Active := False;
  TD.Active := False;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TForm1.Button3Click(Sender: TObject);
var I : Integer;
begin
{  TF.Open;
  for I := 1 to 150000 do begin
    TF.Insert;
    TFID.Value := IntToStr(I);
    TFNome.Value := 'NOME '+IntToStr(I);
    TFNoturno.Value := 'S';
    TFFimSem.Value := 'S';
    TFAbono.Value := '30/12/1899 00:00:00';
    TFTranslado.Value := '30/12/1899 00:00:00';
    TF.Post;
    Label2.Caption := IntToStr(I);
    if I mod 20 = 0 then
      Application.ProcessMessages;
  end;}
end;

end.
