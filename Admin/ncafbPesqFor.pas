unit ncafbPesqFor;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxBar, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxMaskEdit, cxCurrencyEdit, cxTextEdit, cxCalendar, cxMemo, cxCheckBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid,  cxDropDownEdit,
  nxdb, ncClassesBase, 
  dxBarExtItems, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel,
  LMDLabel, cxGridCustomPopupMenu, cxGridPopupMenu, cxInplaceContainer,
  cxVGrid, cxDBVGrid, cxImageComboBox, cxTimeEdit, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, ncafbPesqCli,
  cxContainer, cxLabel, Buttons, StdCtrls, cxRadioGroup, Menus,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, cxNavigator,
  dxPScxPivotGridLnk, uParentedPanel;

type
  TfbPesqFor = class(TFrmBase)
    Tab: TnxTable;
    dsCli: TDataSource;
    pmTempo: TdxBarPopupMenu;
    pmSenha: TdxBarPopupMenu;
    PopupMenu1: TPopupMenu;
    LMDSimplePanel1: TLMDSimplePanel;
    Timer1: TTimer;
    cmOk: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    panMostrar: TPanel;
    edBusca: TcxMaskEdit;
    cxLabel1: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    BarMgrBar2: TdxBar;
    dxBarDockControl2: TdxBarDockControl;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVNome: TcxGridDBColumn;
    GL: TcxGridLevel;
    TabNome: TStringField;
    TabEndereco: TStringField;
    TabBairro: TStringField;
    TabCidade: TStringField;
    TabUF: TStringField;
    TabInativo: TBooleanField;
    TabCEP: TStringField;
    TabObs: TMemoField;
    TabCpf: TStringField;
    TabTelefone: TStringField;
    TabEmail: TMemoField;
    TabUltVisita: TDateTimeField;
    TabCelular: TStringField;
    TabTemDebito: TBooleanField;
    TabTipoAcessoPref: TIntegerField;
    TabAlteradoEm: TDateTimeField;
    TabIncluidoPor: TStringField;
    TabAlteradoPor: TStringField;
    TabFornecedor: TBooleanField;
    TabIncluidoEm: TDateTimeField;
    TabID: TAutoIncField;
    TabRg: TStringField;
    TabSexo: TStringField;
    TabMinutos: TFloatField;
    TabPassaportes: TFloatField;
    TabMinutosUsados: TFloatField;
    TabMinutosIniciais: TFloatField;
    TabIsento: TBooleanField;
    TabUsername: TStringField;
    TabPai: TStringField;
    TabMae: TStringField;
    TabSenha: TStringField;
    TabDebito: TCurrencyField;
    TabEscola: TStringField;
    TabEscolaHI: TDateTimeField;
    TabEscolaHF: TDateTimeField;
    TabNickName: TStringField;
    TabDataNasc: TDateTimeField;
    TabLimiteDebito: TCurrencyField;
    TabFoto: TGraphicField;
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
    TabValorCred: TCurrencyField;
    procedure cmMostrarChange(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure TVKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FrmBasePaiDestroy(Sender: TObject);
    procedure edBuscaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edBuscaPropertiesChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TabBeforePost(DataSet: TDataSet);
    procedure TabAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FDadosFor : PDadosCliente;
    FEditControl : TcxCustomDropDownEdit;

  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;
    procedure ParentChanged; override;

    procedure PreparaBusca(aDadosFor: PDadosCliente; aEditControl: TcxCustomDropDownEdit);
    
    
    { Public declarations }
  end;

var
  fbPesqFor: TfbPesqFor;
  PesqFrmH : HWND = 0;
  RealActiveFrmH : HWND =0;

implementation

uses ncaDM, ufmImagens, ncaFrmPri, 
  ncIDRecursos, ncaFrmCadFornecedor;

// START resource string wizard section
resourcestring
  SFornecedores = 'Fornecedores';

// END resource string wizard section


{$R *.dfm}

procedure TfbPesqFor.FiltraDados;
begin
  //Tab.Filter := 'Fornecedor=True';
  //Tab.Filtered := True;
  Tab.Filtered := False;
  Tab.DisableControls;
  try
    if not Tab.Active then
      Tab.Open else
      Tab.Refresh;
  finally
    Tab.EnableControls;
  end;
end;

procedure TfbPesqFor.FrmBasePaiDestroy(Sender: TObject);
begin
  inherited;
  fbPesqFor := nil;
end;

procedure TfbPesqFor.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FDadosFor := nil;
  if FEditControl<>nil then begin
    FEditControl.DroppedDown := False;
    FEditControl := nil;
  end;
end;

procedure TfbPesqFor.btnOKClick(Sender: TObject);
begin
  inherited;
  if FDadosFor<>nil then begin
    FDadosFor^.dcCodigo := TabID.Value;
    FDadosFor^.dcNome := TabNome.Value;
  end;

  if FEditControl<>nil then begin
    FEditControl.DroppedDown := False;
    FEditControl := nil;
  end;
end;

class function TfbPesqFor.Descricao: String;
begin
  Result := SFornecedores;
end;

procedure TfbPesqFor.edBuscaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP : Tab.Prior;
    VK_Down : Tab.Next;
    VK_Return : btnOkClick(nil);
    VK_Escape : btnCancelarClick(nil);
  end;
end;

procedure TfbPesqFor.edBuscaPropertiesChange(Sender: TObject);
begin
  inherited;
  Tab.SetRange([True, edBusca.text], [True, edBusca.Text + 'zzzzzzzzzzzzzzzzzzzzzz']); // do not localize
end;

procedure TfbPesqFor.cmMostrarChange(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbPesqFor.TabAfterOpen(DataSet: TDataSet);
begin
  inherited;
  Tab.SetRange([True], [True]);
end;

procedure TfbPesqFor.TabBeforePost(DataSet: TDataSet);
begin
  inherited;
  TabFornecedor.Value := True;
end;

procedure TfbPesqFor.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  try
    PesqFrmH := Handle;
    edBusca.SetFocus;
  except
  end;
end;

procedure TfbPesqFor.TVKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    13 : btnOkClick(nil);
    27 : btnCancelarClick(nil);
  end;
end;

procedure TfbPesqFor.cmNovoClick(Sender: TObject);
var aNome: String;
begin
  aNome := '';
  TFrmCadFornecedor.Create(nil).Novo(Tab, nil);
end;

procedure TfbPesqFor.cmEditarClick(Sender: TObject);
var aNome: String;
begin
  inherited;
  if Tab.IsEmpty then Exit;
  aNome := TabNome.Value;
  TFrmCadFornecedor.Create(nil).Editar(Tab, nil);
end;

procedure TfbPesqFor.AtualizaDireitos;
begin
  inherited;
  cmNovo.Enabled := Permitido(daCliCadastrar);
  cmEditar.Enabled := Permitido(daCliCadastrar);
  if Tab.Active then Tab.Refresh;
end;

procedure TfbPesqFor.ParentChanged;
begin
end;

procedure TfbPesqFor.PreparaBusca(aDadosFor: PDadosCliente;
  aEditControl: TcxCustomDropDownEdit);
begin
  RealActiveFrmH := Application.ActiveFormHandle;
  FDadosFor := aDadosFor;
  FEditControl := aEditControl;
  if TV.DataController.Search.Searching then
    TV.DataController.Search.Cancel;

  edBusca.Text := '';

  Tab.SetRange([True], [True]);
  Tab.Refresh;
  
  if (FDadosFor<>nil) and (FDadosFor^.dcCodigo>0) then
    Tab.Locate('ID', FDadosFor^.dcCodigo, []); // do not localize

  Timer1.Enabled := True;
end;

end.

