unit uCMFrmTipos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  xpButton,
  cmClassesBase, StdCtrls, CheckLst;

type
  TFrmTipos = class(TForm)
    xpButton1: TxpButton;
    xpButton2: TxpButton;
    xpButton3: TxpButton;
    xpButton4: TxpButton;
    cgTipo: TCheckListBox;
    procedure xpButton1Click(Sender: TObject);
    procedure xpButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure xpButton2Click(Sender: TObject);
    procedure xpButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    PTipos : PArrayTipoTran;
    { Public declarations }
    procedure Selecionar(aTipos: PArrayTipoTran);
  end;

var
  FrmTipos: TFrmTipos;

implementation

{$R *.DFM}

procedure TFrmTipos.Selecionar(aTipos: PArrayTipoTran);
var I : Integer;
begin
  PTipos := aTipos;
  for I := 0 to cgTipo.Count-1 do
    cgTipo.Checked[I] := PTipos^[I];
  ShowModal;
end;

procedure TFrmTipos.xpButton1Click(Sender: TObject);
var I : Integer;
begin
  for I := 0 to cgTipo.Count-1 do
    cgTipo.Checked[I] := True;
end;

procedure TFrmTipos.xpButton4Click(Sender: TObject);
var I : Integer;
begin
  for I := 0 to cgTipo.Count-1 do
    cgTipo.Checked[I] := False;
end;

procedure TFrmTipos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTipos.xpButton2Click(Sender: TObject);
var I : Integer;
begin
  for I := 0 to cgTipo.Count-1 do
    PTipos^[I] := cgTipo.Checked[I];
  Close;  
end;

procedure TFrmTipos.xpButton3Click(Sender: TObject);
begin
  Close;
end;

end.
