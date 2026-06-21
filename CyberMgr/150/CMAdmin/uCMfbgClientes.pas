unit uCMfbgClientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  lmdcctrl, lmdctrl, Db, nxdb, dxDBTLCl, dxGrClms, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, ExtCtrls;

type
  TfbgClientes = class(TFrmBaseGrid)
    dsCli: TDataSource;
    Tab: TnxTable;
    TabCodigo: TAutoIncField;
    TabNome: TStringField;
    TabEndereco: TStringField;
    TabBairro: TStringField;
    TabCidade: TStringField;
    TabUF: TStringField;
    TabCEP: TStringField;
    TabNasc: TDateTimeField;
    TabSexo: TStringField;
    TabObs: TMemoField;
    TabCpf: TStringField;
    TabRg: TStringField;
    Tabemail: TMemoField;
    TabCreditoM: TIntegerField;
    TabIsento: TBooleanField;
    TabUsername: TStringField;
    TabSenha: TStringField;
    TabTelefone: TStringField;
    TabTempoTotal: TIntegerField;
    TabCreditoHMS: TStringField;
    TabTempoTotalHMS: TStringField;
    GridCodigo: TdxDBGridMaskColumn;
    GridNome: TdxDBGridMaskColumn;
    GridEndereco: TdxDBGridMaskColumn;
    GridBairro: TdxDBGridMaskColumn;
    GridCidade: TdxDBGridMaskColumn;
    GridUF: TdxDBGridMaskColumn;
    GridCEP: TdxDBGridMaskColumn;
    GridNasc: TdxDBGridDateColumn;
    GridSexo: TdxDBGridMaskColumn;
    GridObs: TdxDBGridMemoColumn;
    GridRg: TdxDBGridMaskColumn;
    Gridemail: TdxDBGridMemoColumn;
    GridIsento: TdxDBGridCheckColumn;
    GridUsername: TdxDBGridMaskColumn;
    GridSenha: TdxDBGridMaskColumn;
    GridTelefone: TdxDBGridMaskColumn;
    GridCreditoHMS: TdxDBGridColumn;
    GridTempoTotalHMS: TdxDBGridColumn;
    GridUltVisita: TdxDBGridDateColumn;
    TabUltVisita: TDateTimeField;
    cmTempo: TdxBarSubItem;
    cmCredTempo: TdxBarButton;
    cmDebTempo: TdxBarButton;
    GridDebito: TdxDBGridCurrencyColumn;
    TabTempoInicial: TIntegerField;
    TabDebito: TCurrencyField;
    TabEscola: TStringField;
    TabNickName: TStringField;
    GridEscola: TdxDBGridColumn;
    GridNickname: TdxDBGridColumn;
    TabDataNasc: TDateTimeField;
    TabCelular: TStringField;
    GridDataNasc: TdxDBGridDateColumn;
    GridCelular: TdxDBGridColumn;
    procedure GridDblClick(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure cmCredTempoClick(Sender: TObject);
    procedure cmDebTempoClick(Sender: TObject);
    procedure GridFilterChanged(Sender: TObject; ADataSet: TDataSet;
      const AFilterText: String);
  private
    { Private declarations }
  public
    procedure FiltraDados; override;
    procedure Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant); override;
    { Public declarations }

    procedure Novo; override;
    procedure Apagar; override;
    procedure Editar; override;
    procedure AplicaDireitosUsuario; override;
  end;

var
  fbgClientes: TfbgClientes;

implementation

uses cmClassesBase, uCMDados, uCMFrmPri, uCMFrmCliente, uCMFrmCredito, cmIDRecursos;

{$R *.DFM}

procedure TfbgClientes.FiltraDados;
var FiltroBas : String;
begin
  if not Tab.Active then
    Tab.Active := True;
    
  if TipoFiltro=1 then begin
    FiltroBas := '(CreditoM > 999)';
    Caption := 'Clientes que possuem crédito de tempo (pacote)';
  end else
    FiltroBas := '';

  if Grid.Filter.FilterText > '' then begin
    if FiltroBas > '' then
      FiltroBas := '(' + Grid.Filter.FilterText + ') AND '+ FiltroBas
    else
      FiltroBas := Grid.Filter.FilterText;  
  end;
  Tab.Filter := FiltroBas;
  Tab.Filtered := (FiltroBas>'');
  Tab.Refresh;
  Grid.Refresh;
end;

procedure TfbgClientes.Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant);
begin
  cmSubPeriodo.Visible := ivNever;
  inherited;
end;

procedure TfbgClientes.GridDblClick(Sender: TObject);
begin
  Editar;
end;

procedure TfbgClientes.Apagar;
begin
  inherited;
  if Dados.CM.Maquinas.PorContato[TabCodigo.Value] <> nil then 
  begin
    Beep;
    ShowMessage('Não é possível apagar um cliente que está com acesso em andamento!');
    Exit;
  end;
  
  if MessageDlg('Confirma a exclusão de '+TabNome.Value, mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then
    Tab.Delete;
end;

procedure TfbgClientes.Editar;
begin
  inherited;
  TFrmCliente.Create(Self).Editar(TabCodigo.Value);
  Tab.Refresh;
end;

procedure TfbgClientes.Novo;
begin
  inherited;
  TFrmCliente.Create(Self).Novo;
  Tab.Refresh;
end;

procedure TfbgClientes.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  if TabCreditoM.Value > 0 then
    TabCreditoHMS.Value := TicksToHMSSt(TabCreditoM.Value)
  else
    TabCreditoHMS.Clear; 

  if TabTempoTotal.Value > 0 then
    TabTempoTotalHMS.Value := SegundosToHMSSt(TabTempoTotal.Value);
end;

procedure TfbgClientes.cmCredTempoClick(Sender: TObject);
begin
  if Tab.RecordCount>0 then
    TFrmCredito.Create(Self).Novo(Dados.tbAcesso, TabCodigo.Value, True);
  Tab.Refresh;  
end;

procedure TfbgClientes.cmDebTempoClick(Sender: TObject);
begin
  if Tab.RecordCount>0 then
    TFrmCredito.Create(Self).Novo(Dados.tbAcesso, TabCodigo.Value, False);
  Tab.Refresh;  
end;

procedure TfbgClientes.GridFilterChanged(Sender: TObject;
  ADataSet: TDataSet; const AFilterText: String);
begin
  FiltraDados;
end;

procedure TfbgClientes.AplicaDireitosUsuario;
begin
  inherited;
  cmNovo.Enabled := Permitido(reClientes, taCliCadastrar);
  cmApagar.Enabled := Permitido(reClientes, taCliApagar);
  cmCredTempo.Enabled := Permitido(reClientes, taCliCreditarTempo);
  cmDebTempo.Enabled := Permitido(reClientes, taCliDebitarTempo);
end;

end.

