unit uCMfbgPassaportes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  dxDBTLCl, dxGrClms, Db, nxdb, ExtCtrls, dxExEdtr, Menus, am2000menuitem,
  am2000utils, am2000popupmenu, am2000, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  am2000mainmenu, dxEditor, dxEdLib;

type
  TfbgPassaportes = class(TFrmBaseGrid)
    Tab: TnxTable;
    dsTab: TDataSource;
    TabNumero: TAutoIncField;
    TabTipoPass: TIntegerField;
    TabCliente: TIntegerField;
    TabExpirou: TBooleanField;
    TabSenha: TStringField;
    TabPrimeiroUso: TDateTimeField;
    TabTipoAcesso: TIntegerField;
    TabTipoExp: TWordField;
    TabExpirarEm: TDateTimeField;
    TabMaxSegundos: TIntegerField;
    TabSegundos: TIntegerField;
    TabAcessos: TIntegerField;
    TabDia1: TIntegerField;
    TabDia2: TIntegerField;
    TabDia3: TIntegerField;
    TabDia4: TIntegerField;
    TabDia5: TIntegerField;
    TabDia6: TIntegerField;
    TabDia7: TIntegerField;
    TabTransacao: TIntegerField;
    TabDataCompra: TDateTimeField;
    TabNomePass: TStringField;
    GridNumero: TdxDBGridMaskColumn;
    GridExpirou: TdxDBGridCheckColumn;
    GridPrimeiroUso: TdxDBGridDateColumn;
    GridAcessos: TdxDBGridMaskColumn;
    GridDataCompra: TdxDBGridDateColumn;
    GridNomePass: TdxDBGridLookupColumn;
    panMostrar: TLMDSimplePanel;
    cmMostrar: TdxPickEdit;
    procedure GridPrimeiroUsoGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure cmMostrarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FiltraDados; override;
    procedure Editar; override;
    { Public declarations }
  end;

var
  fbgPassaportes: TfbgPassaportes;

implementation

uses uCMDados, cmClassesBase, uCMFrmPri, uCMFrmPassaporte;

{$R *.DFM}

{ TfbgPacotes }

procedure TfbgPassaportes.Editar;
var P : TPassaporte;
begin
  if Tab.RecordCount > 0 then begin
    P.LoadFromDataset(Tab);
    P.pcNome := TabNomePass.Value;
    TFrmPassaporte.Create(Self).Editar(False, @P);
  end;  
end;

procedure TfbgPassaportes.FiltraDados;
begin
  inherited;
  if not Tab.Active then Tab.Open;
  case cmMostrar.ItemIndex of
    0 : begin
      Tab.IndexName := 'ICliExpNumero';
      Tab.SetRange([Filtro, False], [Filtro, False]);
      btnPeriodo.Visible := False;
    end;

    1 : begin
      Tab.IndexName := 'ICliExpNumero';
      Tab.SetRange([Filtro, True], [Filtro, True]);
      btnPeriodo.Visible := False;
    end;

    2 : begin
      Tab.IndexName := 'ICliNumero';
      Tab.SetRange([Filtro, Inicio], [Filtro, Fim+0.99999999]);
      btnPeriodo.Visible := True;
      Tab.Last;
    end;
  end;
  if Grid.DataSource=nil then
    Grid.DataSource := dsTab;
end;


procedure TfbgPassaportes.GridPrimeiroUsoGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
  inherited;
  if AText='30/12/1899' then
    AText := 'Sem Uso';
end;

procedure TfbgPassaportes.cmMostrarChange(Sender: TObject);
begin
  FiltraDados;
end;

procedure TfbgPassaportes.FormCreate(Sender: TObject);
begin
  inherited;
  cmMostrar.ItemIndex := 0;
end;

end.
