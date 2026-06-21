unit uCMfbgEntregadores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  Db, ffdb;

type
  TfbgEntregadores = class(TFrmBaseGrid)
    GridCodigo: TdxDBGridMaskColumn;
    GridNome: TdxDBGridMaskColumn;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FiltraDados; override;
    procedure Novo; override;
    procedure Editar; override;
    procedure Apagar; override;
  end;

var
  fbgEntregadores: TfbgEntregadores;

implementation

uses uCMDados, uCMFrmEntregador;

{$R *.DFM}

{ TfbgEntregadores }

procedure TfbgEntregadores.Apagar;
begin
  inherited;
  with Dados do
  if MessageDlg('Confirma a exclusão de '+tbEntreNome.Value, mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then
    tbEntre.Delete;
end;

procedure TfbgEntregadores.Editar;
begin
  inherited;
  TFrmEntregador.Create(Self).Editar;
end;

procedure TfbgEntregadores.FiltraDados;
begin
  inherited;
  Dados.tbEntre.Active := False;
  Dados.tbEntre.Active := True;
end;

procedure TfbgEntregadores.Novo;
begin
  inherited;
  TFrmEntregador.Create(Self).Incluir;
end;

end.
