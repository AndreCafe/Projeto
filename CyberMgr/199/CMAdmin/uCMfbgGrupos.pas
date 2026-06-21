unit uCMfbgGrupos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  ExtCtrls, dxExEdtr, Menus, am2000menuitem, am2000utils, am2000popupmenu,
  am2000, LMDControl, LMDBaseControl, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton, am2000mainmenu;
  

type
  TfbgGrupos = class(TFrmBaseGrid)
    GridNome: TdxDBGridMaskColumn;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Novo; override;
    procedure Editar; override;
    procedure Apagar; override;
  end;

var
  fbgGrupos: TfbgGrupos;

implementation

uses uCMDados, uCMFrmGrupo, cmClassesBase, cmCompCliente, uCMFrmPri;

{$R *.DFM}

{ TfbgGrupos }

procedure TfbgGrupos.Apagar;
var G : TCMGrupo;
begin
  inherited;
  with Dados do
  if MessageDlg('Confirma a exclusão de '+mtGrupoNome.Value, mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then begin
    G := CM.Grupos.PorNome[mtGrupoNome.Value];
    if G <> nil then CM.ApagaObj(G);
  end;  
end;

procedure TfbgGrupos.Editar;
begin
  inherited;
  TFrmGrupo.Create(Self).Editar;
end;

procedure TfbgGrupos.Novo;
begin
  inherited;
  TFrmGrupo.Create(Self).Incluir;
end;

end.
