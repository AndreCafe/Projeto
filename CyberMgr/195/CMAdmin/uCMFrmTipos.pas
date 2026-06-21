unit uCMFrmTipos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cmClassesBase, StdCtrls, CheckLst, cxLookAndFeelPainters, cxButtons;

type
  TFrmTipos = class(TForm)
    cgTipo: TCheckListBox;
    btnTodos: TcxButton;
    btnNenhum: TcxButton;
    btnOk: TcxButton;
    btnCancelar: TcxButton;
    procedure btnTodosClick(Sender: TObject);
    procedure btnNenhumClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
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

procedure TFrmTipos.btnTodosClick(Sender: TObject);
var I : Integer;
begin
  for I := 0 to cgTipo.Count-1 do
    cgTipo.Checked[I] := True;
end;

procedure TFrmTipos.btnNenhumClick(Sender: TObject);
var I : Integer;
begin
  for I := 0 to cgTipo.Count-1 do
    cgTipo.Checked[I] := False;
end;

procedure TFrmTipos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTipos.btnOkClick(Sender: TObject);
var I : Integer;
begin
  for I := 0 to cgTipo.Count-1 do
    PTipos^[I] := cgTipo.Checked[I];
  Close;  
end;

procedure TFrmTipos.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
