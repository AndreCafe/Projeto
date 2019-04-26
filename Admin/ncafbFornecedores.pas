unit ncafbFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, 
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, 
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxBar, dxPSCore, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxClasses, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Menus, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridCustomView, cxGrid, StdCtrls, cxButtons, cxCheckBox, cxTextEdit,
  cxMaskEdit, cxLabel, cxRadioGroup, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, nxdb, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxPSPrVwRibbon, cxNavigator, ncaFrmCadFornecedor,
  dxPScxPivotGridLnk, dxBarExtItems, dxGDIPlusClasses;

type
  TfbFornecedores = class(TFrmBase)
    cmNovoFornecedor: TdxBarLargeButton;
    cmEditarFornecedor: TdxBarLargeButton;
    cmApagarFornecedor: TdxBarLargeButton;
    Tab: TnxTable;
    dsTab: TDataSource;
    TabID: TAutoIncField;
    TabNome: TStringField;
    TabEndereco: TStringField;
    TabBairro: TStringField;
    TabCidade: TStringField;
    TabUF: TStringField;
    TabCEP: TStringField;
    TabSexo: TStringField;
    TabObs: TnxMemoField;
    TabCpf: TStringField;
    TabRg: TStringField;
    TabTelefone: TStringField;
    TabEmail: TnxMemoField;
    TabMinutos: TFloatField;
    TabPassaportes: TFloatField;
    TabMinutosUsados: TFloatField;
    TabMinutosIniciais: TFloatField;
    TabIsento: TBooleanField;
    TabUsername: TStringField;
    TabPai: TStringField;
    TabMae: TStringField;
    TabSenha: TStringField;
    TabUltVisita: TDateTimeField;
    TabDebito: TCurrencyField;
    TabEscola: TStringField;
    TabEscolaHI: TDateTimeField;
    TabEscolaHF: TDateTimeField;
    TabNickName: TStringField;
    TabDataNasc: TDateTimeField;
    TabCelular: TStringField;
    TabTemDebito: TBooleanField;
    TabLimiteDebito: TCurrencyField;
    TabFoto: TGraphicField;
    TabIncluidoEm: TDateTimeField;
    TabAlteradoEm: TDateTimeField;
    TabIncluidoPor: TStringField;
    TabAlteradoPor: TStringField;
    TabTitEleitor: TStringField;
    TabFidPontos: TFloatField;
    TabFidTotal: TFloatField;
    TabFidResg: TFloatField;
    TabAniversario: TStringField;
    TabCotaImpEspecial: TBooleanField;
    TabCotaImpDia: TIntegerField;
    TabCotaImpMes: TIntegerField;
    TabSemFidelidade: TBooleanField;
    TabTemCredito: TBooleanField;
    TabNaoGuardarCredito: TBooleanField;
    TabPermiteLoginSemCred: TBooleanField;
    TabCHorario: TIntegerField;
    TabOpCHorario: TWordField;
    TabHP1: TIntegerField;
    TabHP2: TIntegerField;
    TabHP3: TIntegerField;
    TabHP4: TIntegerField;
    TabHP5: TIntegerField;
    TabHP6: TIntegerField;
    TabHP7: TIntegerField;
    TabInativo: TBooleanField;
    TabTipoAcessoPref: TIntegerField;
    TabFornecedor: TBooleanField;
    TabValorCred: TCurrencyField;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    TVID: TcxGridDBColumn;
    TVNome: TcxGridDBColumn;
    TVEndereco: TcxGridDBColumn;
    TVBairro: TcxGridDBColumn;
    TVCidade: TcxGridDBColumn;
    TVUF: TcxGridDBColumn;
    TVCEP: TcxGridDBColumn;
    TVObs: TcxGridDBColumn;
    TVCpf: TcxGridDBColumn;
    TVTelefone: TcxGridDBColumn;
    TVEmail: TcxGridDBColumn;
    TVCelular: TcxGridDBColumn;
    TVIncluidoEm: TcxGridDBColumn;
    TVAlteradoEm: TcxGridDBColumn;
    TVIncluidoPor: TcxGridDBColumn;
    TVAlteradoPor: TcxGridDBColumn;
    TVRg: TcxGridDBColumn;
    BarMgrBar2: TdxBar;
    panBusca2: TLMDSimplePanel;
    Image1: TImage;
    edBusca: TcxMaskEdit;
    lbLocalizar: TcxLabel;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    Timer2: TTimer;
    cmObs: TdxBarButton;
    procedure cmNovoFornecedorClick(Sender: TObject);
    procedure cmEditarFornecedorClick(Sender: TObject);
    procedure edBuscaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edBuscaPropertiesChange(Sender: TObject);
    procedure cmApagarFornecedorClick(Sender: TObject);
    procedure lbLocalizarClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure cmObsClick(Sender: TObject);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure TVCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure TVCustomDrawIndicatorCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxCustomGridIndicatorItemViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
    function TextoBusca: String;
  public
    class function Descricao: String; override;
    procedure RefreshBotoes;
    procedure FiltraDados; override;
    { Public declarations }
  end;


var
  fbFornecedores: TfbFornecedores;

implementation

uses ncaFrmPri, ufmImagens, ncaDM;

{$R *.dfm}


{ TfbFornecedores }

procedure TfbFornecedores.cmApagarFornecedorClick(Sender: TObject);
begin
  inherited;
  if SimNao('Confirma a exclusão de '+TabNome.Value+' ?') then Tab.Delete;

end;

procedure TfbFornecedores.cmEditarFornecedorClick(Sender: TObject);
var
  aNome:string;
begin
  if Tab.IsEmpty then Exit;

  TFrmCadFornecedor.Create(Self).Editar(Tab, nil);
end;

procedure TfbFornecedores.cmNovoFornecedorClick(Sender: TObject);
var
  aNome:string;
begin
  inherited;
  edBusca.Text := '';
  TFrmCadFornecedor.Create(Self).Novo(Tab, nil);
  RefreshBotoes;
end;

procedure TfbFornecedores.cmObsClick(Sender: TObject);
begin
  inherited;
  slConfig.Values['fbFornecedores.cmObs.Down'] := IntToStr(Integer(cmObs.Down));
  SaveConfig;
  TV.Preview.Visible := cmObs.Down;
end;

class function TfbFornecedores.Descricao: String;
begin
  Result := 'Fornecedores';
end;

procedure TfbFornecedores.edBuscaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP : Tab.Prior;
    VK_Down : Tab.Next;
    VK_Return : cmEditarFornecedorClick(nil);
  end;
end;

procedure TfbFornecedores.edBuscaPropertiesChange(Sender: TObject);
begin
  inherited;
  lbLocalizar.Visible := (edBusca.Text='');

  FiltraDados;
end;

procedure TfbFornecedores.FiltraDados;
begin
  inherited;

  if not Tab.Active then
    Tab.Open;

  //Tab.Filter := 'Fornecedor=True';
  //Tab.Filtered := True;
  Tab.Filtered := false;
  Tab.IndexName := 'IFornecedorNome';

  if TextoBusca>'' then
    Tab.SetRange([True, TextoBusca], [True, TextoBusca+'zzzzzzzzzzzzzzzzzzzzzzzzzzz']) else
    Tab.SetRange([True], [True]);
  RefreshBotoes;
end;

procedure TfbFornecedores.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  cmObs.Down := Boolean(StrToIntDef(slCOnfig.Values['fbFornecedores.cmObs.Down'], 1));
  TV.Preview.Visible := cmObs.Down;
end;

procedure TfbFornecedores.lbLocalizarClick(Sender: TObject);
begin
  inherited;
  edBusca.SetFocus;
end;

procedure TfbFornecedores.RefreshBotoes;
var TemDados: Boolean;
begin
  TemDados := not Tab.IsEmpty;
  cmEditar.Enabled := TemDados;
  //cmNovo.Enabled := Permitido(daProCadastrar);
  //cmApagar.Enabled := Permitido(daProApagar) and TemDados;
end;

function TfbFornecedores.TextoBusca: String;
begin
  Result := Trim(edBusca.Text);
end;

procedure TfbFornecedores.Timer2Timer(Sender: TObject);
begin
  inherited;
  Timer2.Enabled := False;
  if FrmPri.FM.FormAtivo is TfbFornecedores then
    edBusca.SetFocus;
end;

procedure TfbFornecedores.TVCustomDrawColumnHeader(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
begin
  inherited;
  FrmPri.CustomDrawGridHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TfbFornecedores.TVCustomDrawIndicatorCell(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxCustomGridIndicatorItemViewInfo;
  var ADone: Boolean);
begin
  inherited;
  ACanvas.Brush.Color := clWhite;
  ACanvas.FillRect(AViewInfo.Bounds);
  ADone := True;
end;

end.
