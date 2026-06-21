unit uCMfbgUsuarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  dxDBTLCl, dxGrClms, ExtCtrls;

type
  TfbgUsuarios = class(TFrmBaseGrid)
    GridUsername: TdxDBGridMaskColumn;
    GridNome: TdxDBGridMaskColumn;
    GridAdmin: TdxDBGridCheckColumn;
    GridNumClientes: TdxDBGridColumn;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Editar; override;
    procedure Novo; override;
    procedure Apagar; override;
  end;

var
  fbgUsuarios: TfbgUsuarios;

implementation

uses uCMDados, uCMFrmUsuario, cmClassesBase, cmCompCliente;

{$R *.DFM}

{ TfbgUsuarios }

procedure TfbgUsuarios.Apagar;
var U : TCMUsuario;
begin
  inherited;
  with Dados do
  if MessageDlg('Confirma a exclusão de '+mtUsuarioNome.Value, mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then begin
    U := CM.Usuarios.PorUsername[mtUsuarioUsername.Value];
    if U <> nil then CM.ApagaObj(U);
  end;  
end;

procedure TfbgUsuarios.Editar;
begin
  inherited;
  if Dados.mtUsuario.RecordCount > 0 then
    TFrmUsuario.Create(Self).Editar;
end;

procedure TfbgUsuarios.Novo;
begin
  inherited;
  TFrmUsuario.Create(Self).Incluir;
end;

end.
