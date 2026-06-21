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
    TabValido: TBooleanField;
    TabValor: TCurrencyField;
    GridSenha: TdxDBGridColumn;
    TabTempoTotal: TTimeField;
    TabTempoUsado: TTimeField;
    GridColumn8: TdxDBGridTimeColumn;
    GridColumn9: TdxDBGridTimeColumn;
    TabNomeCliente: TStringField;
    GridColumn10: TdxDBGridLookupColumn;
    procedure GridPrimeiroUsoGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure cmMostrarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
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

uses uCMDados, cmClassesBase, cmIDRecursos, uCMFrmPri, uCMFrmPassaporte,
  cmAuxPassaporte;

{$R *.DFM}

{ TfbgPacotes }

procedure TfbgPassaportes.Editar;
var 
  P : TPassaporte;
  Exp: Boolean;
  M : TCMMaquina;
begin
  if Tab.RecordCount > 0 then begin
    P.LoadFromDataset(Tab);
    P.pcNome := TabNomePass.Value;
    Exp := P.pcExpirou;
    TFrmPassaporte.Create(Self).Editar(False, @P);
    with Dados do
    if not Exp and P.pcExpirou then begin
      Tab.Edit;
      TabExpirou.Value := True;
      Tab.Post;
      M := Dados.CM.Maquinas.PorPassaporte[P.pcNumero];
      if M <> nil then begin
        M.AtualizaCache;
        LePassaportesCliTran(tbPass, tbHistPass, M.TipoAcesso, M.Contato, 0, M.Passaportes);
        CM.SalvaAlteracoesObj(M, False);
      end;  
    end;  
  end;  
end;

procedure TfbgPassaportes.FiltraDados;
begin
  inherited;
  if not Tab.Active then Tab.Open;
  btnPeriodo.Visible := False;
  case cmMostrar.ItemIndex of
    0 : 
    if TipoFiltro=1 then begin
      Tab.IndexName := 'ICliExpNumero';
      Tab.SetRange([Filtro, False], [Filtro, False]);
    end else begin
      Tab.IndexName := 'IExpNumero';
      Tab.SetRange([False], [False]);
    end;  

    1 : 
    if TipoFiltro=1 then begin
      Tab.IndexName := 'ICliExpNumero';
      Tab.SetRange([Filtro, True], [Filtro, True]);
    end else begin
      Tab.IndexName := 'IExpNumero';
      Tab.SetRange([True], [True]);
    end;

    2 : begin
      Tab.IndexName := 'ISenha';
      Tab.CancelRange;
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
  Filtro := 0;
  cmMostrar.ItemIndex := 0;
  GridSenha.DisableCustomizing := not Permitido(daVerSenhaPassaporte);
  GridSenha.Visible := not GridSenha.DisableCustomizing;
end;

procedure TfbgPassaportes.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  TabTempoTotal.Value := TabMaxSegundos.Value / SegundosPorDia;
  TabTempoUsado.Value := TabSegundos.Value / SegundosPorDia;
end;

procedure TfbgPassaportes.FormShow(Sender: TObject);
begin
  PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
end;

end.
