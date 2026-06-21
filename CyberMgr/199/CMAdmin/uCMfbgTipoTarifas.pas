unit uCMfbgTipoTarifas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  dxDBTLCl, dxGrClms, Db, nxdb, ExtCtrls, dxExEdtr, Menus, am2000menuitem,
  am2000utils, am2000popupmenu, am2000, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  am2000mainmenu;

type
  TfbgTarifas = class(TFrmBaseGrid)
    GridNome: TdxDBGridMaskColumn;
    GridCodigo: TdxDBGridMaskColumn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FiltraDados; override;
    procedure Editar; override;
    procedure Novo; override;
    procedure Apagar; override;
    { Public declarations }
  end;

var
  fbgTarifas: TfbgTarifas;

implementation

uses uCMFrmHoraCor, uCMDados;

{$R *.DFM}

{ TfbgPacotes }

procedure TfbgTarifas.Apagar;
begin
  inherited;
  with Dados do
  if MessageDlg('Confirma a exclusão de '+tbTipoAcessoNome.Value, mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then
    tbTipoAcesso.Delete;
end;

procedure TfbgTarifas.Editar;
begin
  inherited;
  if Dados.tbTipoAcesso.RecordCount>0 then
    TFrmHoraCor.Create(Self).Editar(False);
end;

procedure TfbgTarifas.FiltraDados;
begin
  inherited;
  Dados.tbTipoAcesso.Refresh;
end;

procedure TfbgTarifas.Novo;
begin
  inherited;
  TFrmHoraCor.Create(Self).Editar(True);
end;

procedure TfbgTarifas.FormShow(Sender: TObject);
begin
  inherited;
  if Dados.tbTipoAcesso.RecordCount=0 then
    TFrmHoraCor.Create(Self).Editar(True);
end;

end.
