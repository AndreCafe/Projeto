unit uCMfbgClientes;

interface

uses
  Windows, Messages, Variants, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  lmdcctrl, lmdctrl, Db, nxdb, dxDBTLCl, dxGrClms, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, ExtCtrls,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, dxExEdtr, Menus, am2000menuitem, am2000utils,
  am2000popupmenu, am2000, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, dxEditor, dxEdLib, am2000mainmenu, FR_Rich, FR_BarC,
  FR_Shape, FR_DSet, FR_DBSet, FR_Desgn, FR_ChBox, FR_Cross, FR_Class,
  fr2_NexusDB1DB, FR_DCtrl;

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
    GridTemDebito: TdxDBGridCheckColumn;
    TabTemDebito: TBooleanField;
    cmEmDeb: TdxBarButton;
    cmPagarDebito: TdxBarLargeButton;
    cmDebTempo: TdxBarLargeButton;
    pmTempo: TdxBarPopupMenu;
    cmVenderCred: TdxBarButton;
    cmTempo: TdxBarSubItem;
    frDialogControls1: TfrDialogControls;
    frnxComponents1: TfrnxComponents;
    RP: TfrReport;
    frCrossObject1: TfrCrossObject;
    frCheckBoxObject1: TfrCheckBoxObject;
    Designer: TfrDesigner;
    dbCli: TfrDBDataSet;
    frShapeObject1: TfrShapeObject;
    frBarCodeObject1: TfrBarCodeObject;
    frRichObject1: TfrRichObject;
    dxBarButton1: TdxBarButton;
    procedure GridDblClick(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure cmDebTempoClick(Sender: TObject);
    procedure GridFilterChanged(Sender: TObject; ADataSet: TDataSet;
      const AFilterText: String);
    procedure cmPagarDebitoClick(Sender: TObject);
    procedure GridCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure cmMostrarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmVenderCredClick(Sender: TObject);
    procedure ArquivoImprimiretiquetasparamaladireta1Click(
      Sender: TObject);
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

uses cmClassesBase, uCMDados, uCMFrmPri, uCMFrmCliente, uCMFrmCredito, cmIDRecursos,
  uCMFrmDeb;

{$R *.DFM}

procedure TfbgClientes.FiltraDados;
var 
  FiltroBas : String;
  M, H : Integer;
begin
  if not Tab.Active then Tab.Active := True;
    
  FiltroBas := '';
  lbTotDeb.Visible := False;

  case cmMostrar.ItemIndex of
    1 : begin
      Tab.IndexName := 'IDebito';
      Tab.SetRange([True], [True]);
      lbTotDeb.Caption := 'Débitos = '+FloatToStrF(Dados.TotalDebitos, ffCurrency, 10, 2);
      lbTotDeb.Visible := True;
    end;
    2 : begin
      Tab.IndexName := 'INome';
      Tab.CancelRange;
      FiltroBas := '(CreditoM > 1)';
      M := Dados.TotalCreditos;
      H := M div 60;
      M := M mod 60;
      lbTotDeb.Caption := 'Créditos = '+IntToStr(H)+'h '+IntToStr(M)+'m';
      lbTotDeb.Visible := True;
    end;  
  else
    Tab.CancelRange;
    case Dados.tbConfigCampoLocalizaCli.Value of
      1 : begin
        Tab.IndexName := 'IUsername';
        GridUsername.Index := 0;
      end;
      2 : begin
        Tab.IndexName := 'ICodigo';
        GridCodigo.Index := 0;
      end;
    else
      Tab.IndexName := 'INome';
      GridNome.Index := 0;
    end;
  end;
  
  if Grid.Filter.FilterText > '' then begin
    if FiltroBas > '' then
      FiltroBas := '(' + Grid.Filter.FilterText + ') AND '+ FiltroBas
    else
      FiltroBas := Grid.Filter.FilterText;
  end;
  Tab.Filter := FiltroBas;
  Tab.Filtered := (FiltroBas>'');

  Tab.Refresh;
  lbQuant.Caption := IntToStr(Tab.RecordCount) + ' Clientes';
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
  cmNovo.Enabled := Permitido(daCliCadastrar);
  cmApagar.Enabled := Permitido(daCliApagar);
  cmDebTempo.Enabled := Permitido(daCliDebitarTempo);
end;

procedure TfbgClientes.cmPagarDebitoClick(Sender: TObject);
begin
  if TabDebito.Value > 0.00009 then begin
    TFrmDeb.Create(Self).Criar(TabCodigo.Value);
    FiltraDados;
  end;  
end;

procedure TfbgClientes.GridCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var V: Variant;  
begin
  V := ANode.Values[gridTemDebito.Index];
  if (not ASelected) and (not VarIsNull(V)) and (VarType(V)=varBoolean) and (V=True) then
    AFont.Color := clRed;
end;

procedure TfbgClientes.cmMostrarChange(Sender: TObject);
begin
  FiltraDados;
end;

procedure TfbgClientes.FormCreate(Sender: TObject);
begin
  inherited;
  cmMostrar.ItemIndex := 0;
end;

procedure TfbgClientes.FormShow(Sender: TObject);
begin
  inherited;
  Grid.ShowSummaryFooter := True;
end;

procedure TfbgClientes.cmVenderCredClick(Sender: TObject);
begin
  inherited;
  if NumAberto<1 then begin
    Beep;
    ShowMessage('Caixa está fechado');
    Exit;
  end;
  
  with Dados do begin
    tbAcesso.Refresh;
    TFrmCredito.Create(Self).Novo(tbAcesso, TabCodigo.Value, True);
  end;    
end;

procedure TfbgClientes.ArquivoImprimiretiquetasparamaladireta1Click(
  Sender: TObject);
begin
  RP.ShowReport;
end;

end.

