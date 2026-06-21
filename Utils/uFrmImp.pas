unit uFrmImp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Db, ExtCtrls;

type
  TFrmImp = class(TForm)
    PB: TProgressBar;
    Label1: TLabel;
    lbNomeTab: TLabel;
    lbImp: TLabel;
    lbPosicao: TLabel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    TF, TD : TDataset;

    procedure Transfere;
  public
    procedure TransfDados(aTF, aTD: TDataset; NomeTab: String);
    { Public declarations }
  end;

var
  FrmImp: TFrmImp;

implementation

{$R *.DFM}

procedure TFrmImp.Transfere;
var 
  F : TField;
  I : Integer;
begin
  TF.First;
  PB.Max := TF.RecordCount;
  PB.Position := 0;
  while not TF.Eof do begin
    TD.Insert;
    for I := 0 to pred(TD.Fields.Count) do with TD.Fields[I] do begin
      F := TF.FindField(FieldName);
      if F <> nil then
      try
        Value := F.Value;
      except
        Clear;
      end;  
    end;  
    TD.Post;  
    TF.Next;
    PB.Position := PB.Position + 1;
    lbPosicao.Caption := IntToStr(PB.Position)+'/'+IntToStr(PB.Max);
    Application.ProcessMessages;
  end;
  Close;
end;

procedure TFrmImp.TransfDados(aTF, aTD: TDataset; NomeTab: String);
begin
  try
    TF := aTF;
    TD := aTD;
    lbNomeTab.Caption := NomeTab;
    ShowModal;
  except
    Free;
    Raise;
  end;  
end;

procedure TFrmImp.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Transfere;
end;

procedure TFrmImp.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TFrmImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
