unit uCMfbgTipoPass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  dxDBTLCl, dxGrClms, Db, nxdb, ExtCtrls, dxExEdtr, Menus, am2000menuitem,
  am2000utils, am2000popupmenu, am2000, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  am2000mainmenu, cxStyles;

type
  TfbgTipoPass = class(TFrmBaseGrid)
    Tab: TnxTable;
    dsTab: TDataSource;
    TabCodigo: TAutoIncField;
    TabNome: TStringField;
    TabValor: TCurrencyField;
    GridNome: TdxDBGridMaskColumn;
    GridValor: TdxDBGridCurrencyColumn;
    TabTipoAcesso: TIntegerField;
    TabTipoExp: TWordField;
    TabExpirarEm: TDateTimeField;
    TabMaxSegundos: TIntegerField;
    TabObs: TMemoField;
    TabDia1: TIntegerField;
    TabDia2: TIntegerField;
    TabDia3: TIntegerField;
    TabDia4: TIntegerField;
    TabDia5: TIntegerField;
    TabDia6: TIntegerField;
    TabDia7: TIntegerField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
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
  fbgTipoPass: TfbgTipoPass;

implementation

uses uCMFrmPassaporte, cmClassesBase, uCMDados, uCMFrmPri;

{$R *.DFM}

{ TfbgPacotes }

procedure TfbgTipoPass.Apagar;
begin
  inherited;
  if MessageDlg('Confirma a exclusão do passaporte '+TabNome.AsString+' ?', 
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then Tab.Delete;
end;

procedure TfbgTipoPass.Editar;
var P : TPassaporte;
begin
  if Tab.RecordCount > 0 then begin
    P.LoadFromDataset(Tab);
    if TFrmPassaporte.Create(Self).Editar(False, @P) then begin
      Tab.Edit;
      P.SaveToDataset(Tab);
      Tab.Post;
    end;  
  end;
end;

procedure TfbgTipoPass.FiltraDados;
begin
  inherited;
  Tab.Open;
end;

procedure TfbgTipoPass.Novo;
var P : TPassaporte;
begin
  if TFrmPassaporte.Create(Self).Editar(True, @P) then begin
    Tab.Insert;
    P.SaveToDataset(Tab);
    Tab.Post;
  end;  
end;

end.
