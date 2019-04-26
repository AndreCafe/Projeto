unit ncafbUsuarios;

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems,
  ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxMaskEdit, cxCheckBox,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxContainer, cxLabel, LMDPNGImage,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel;

type
  TfbUsuarios = class(TFrmBase)
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVUsername1: TcxGridDBColumn;
    TVNome1: TcxGridDBColumn;
    TVAdmin1: TcxGridDBColumn;
    GL: TcxGridLevel;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    procedure cmApagarClick(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  fbUsuarios: TfbUsuarios;

implementation

uses 
  ncaDM, 
  ncaFrmPri, 
  ncaFrmUsuario, 
  ncClassesBase;

{$R *.dfm}

{ TfbUsuarios }

class function TfbUsuarios.Descricao: String;
begin
  Result := 'Usuários';
end;

procedure TfbUsuarios.FiltraDados;
begin
end;

procedure TfbUsuarios.cmApagarClick(Sender: TObject);
var 
  U : TncUsuario;
  I, C: Integer;
begin
  with Dados do begin
    C := 0;
    for I := 0 to CM.Usuarios.Count-1 do
      if CM.Usuarios[I].Admin then Inc(C);

    if mtUsuarioAdmin.Value and (C<2) then
      Raise ENexCafe.Create('Não é possível apagar o único usuário administrador do sistema');
        
    if SimNaoH('Confirma a exclusão de '+mtUsuarioNome.Value+'?', Handle) then begin
      U := CM.Usuarios.PorUsername[mtUsuarioUsername.Value];
      if U <> nil then CM.ApagaObj(U);
    end;  
  end;  
end;

procedure TfbUsuarios.cmNovoClick(Sender: TObject);
begin
  TFrmUsuario.Create(Self).Incluir;
end;

procedure TfbUsuarios.cmEditarClick(Sender: TObject);
begin
  if Dados.mtUsuario.RecordCount > 0 then
    TFrmUsuario.Create(Self).Editar;
end;

end.
