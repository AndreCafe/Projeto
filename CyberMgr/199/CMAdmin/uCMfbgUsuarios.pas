unit uCMfbgUsuarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  dxDBTLCl, dxGrClms, ExtCtrls, dxExEdtr, Menus, am2000menuitem,
  am2000utils, am2000popupmenu, am2000, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  am2000mainmenu, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxMaskEdit, cxCheckBox,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGridLevel, cxGrid;

type
  TfbgUsuarios = class(TFrmBaseGrid)
    GridUsername: TdxDBGridMaskColumn;
    GridNome: TdxDBGridMaskColumn;
    GridAdmin: TdxDBGridCheckColumn;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Username1: TcxGridDBColumn;
    cxGrid1DBTableView1Nome1: TcxGridDBColumn;
    cxGrid1DBTableView1Admin1: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
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

uses uCMDados, uCMFrmUsuario, cmClassesBase, cmCompCliente, uCMFrmPri;

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
