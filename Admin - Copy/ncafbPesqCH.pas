unit ncafbPesqCH;
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
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, 
  cxContainer, cxLabel, Buttons, StdCtrls, cxRadioGroup, Menus,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxNavigator,
  dxPScxPivotGridLnk;

type
  TfbPesqCH = class(TFrmBase)
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
    TabID: TAutoIncField;
    LMDSimplePanel2: TLMDSimplePanel;
    BarMgrBar2: TdxBar;
    dxBarDockControl2: TdxBarDockControl;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVNome: TcxGridDBColumn;
    GL: TcxGridLevel;
    TabNome: TStringField;
    TabHP1: TIntegerField;
    TabHP2: TIntegerField;
    TabHP3: TIntegerField;
    TabHP4: TIntegerField;
    TabHP5: TIntegerField;
    TabHP6: TIntegerField;
    TabHP7: TIntegerField;
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
  private
    { Private declarations }
    FCod : ^Cardinal;
    FEditControl : TcxCustomDropDownEdit;

  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;
    procedure ParentChanged; override;

    procedure PreparaBusca(var aCodigo: Cardinal; aEditControl: TcxCustomDropDownEdit);
    
    
    { Public declarations }
  end;

var
  fbPesqCH: TfbPesqCH;
  PesqFrmH : HWND = 0;
  RealActiveFrmH : HWND =0;

implementation

uses ncaDM, ufmImagens, ncaFrmPri, 
  ncIDRecursos, ncaFrmCHorario;

// START resource string wizard section
const
  SFornecedores = 'Fornecedores';

// END resource string wizard section


{$R *.dfm}

procedure TfbPesqCH.FiltraDados;
begin
  Tab.Filtered := False;
  if not Tab.Active then
    Tab.Open else
    Tab.Refresh;
end;

procedure TfbPesqCH.FrmBasePaiDestroy(Sender: TObject);
begin
  inherited;
  fbPesqCH := nil;
end;

procedure TfbPesqCH.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FCod := nil;
  if FEditControl<>nil then begin
    FEditControl.DroppedDown := False;
    FEditControl := nil;
  end;
end;

procedure TfbPesqCH.btnOKClick(Sender: TObject);
begin
  inherited;
  if FCod<>nil then begin
    FCod^ := TabID.Value;
    FCod := nil;
  end;

  if FEditControl<>nil then begin
    FEditControl.DroppedDown := False;
    FEditControl := nil;
  end;
end;

class function TfbPesqCH.Descricao: String;
begin
  Result := SFornecedores;
end;

procedure TfbPesqCH.edBuscaKeyUp(Sender: TObject; var Key: Word;
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

procedure TfbPesqCH.edBuscaPropertiesChange(Sender: TObject);
begin
  inherited;
  Tab.SetRange([edBusca.text], [edBusca.Text + 'zzzzzzzzzzzzzzzzzzzzzz']); // do not localize
end;

procedure TfbPesqCH.cmMostrarChange(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbPesqCH.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  try
    PesqFrmH := Handle;
    edBusca.SetFocus;
  except
  end;
end;

procedure TfbPesqCH.TVKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    13 : btnOkClick(nil);
    27 : btnCancelarClick(nil);
  end;
end;

procedure TfbPesqCH.cmNovoClick(Sender: TObject);
var 
  aNome: String;
  h1, h2, h3, h4, h5, h6, h7 : Integer;
begin
  aNome := '';
  h1 := 0;
  h2 := 0;
  h3 := 0;
  h4 := 0;
  h5 := 0;
  h6 := 0;
  h7 := 0;
  
  if TFrmCHorario.Create(nil).Editar(aNome, h1, h2, h3, h4, h5, h6, h7) then begin
    Tab.Insert;
    TabNome.Value := aNome;
    TabHP1.Value := h1;
    TabHP2.Value := h2;
    TabHP3.Value := h3;
    TabHP4.Value := h4;
    TabHP5.Value := h5;
    TabHP6.Value := h6;
    TabHP7.Value := h7;
    Tab.Post;
  end;
end;

procedure TfbPesqCH.cmEditarClick(Sender: TObject);
var aNome: String;
  h1, h2, h3, h4, h5, h6, h7 : Integer;
begin
  if Tab.IsEmpty then Exit;
  aNome := TabNome.Value;
  h1 := TabHP1.Value;
  h2 := TabHP2.Value;
  h3 := TabHP3.Value;
  h4 := TabHP4.Value;
  h5 := TabHP5.Value;
  h6 := TabHP6.Value;
  h7 := TabHP7.Value;
  
  if TFrmCHorario.Create(nil).Editar(aNome, h1, h2, h3, h4, h5, h6, h7) then begin
    Tab.Edit;
    TabNome.Value := aNome;
    TabHP1.Value := h1;
    TabHP2.Value := h2;
    TabHP3.Value := h3;
    TabHP4.Value := h4;
    TabHP5.Value := h5;
    TabHP6.Value := h6;
    TabHP7.Value := h7;
    Tab.Post;
  end;
end;

procedure TfbPesqCH.AtualizaDireitos;
begin
  inherited;
  cmNovo.Enabled := Permitido(daCliCadastrar);
  cmEditar.Enabled := Permitido(daCliCadastrar);
  if Tab.Active then Tab.Refresh;
end;

procedure TfbPesqCH.ParentChanged;
begin
end;

procedure TfbPesqCH.PreparaBusca(var aCodigo: Cardinal;
  aEditControl: TcxCustomDropDownEdit);
begin
  RealActiveFrmH := Application.ActiveFormHandle;
  FCod := @aCodigo;
  FEditControl := aEditControl;
  if TV.DataController.Search.Searching then
    TV.DataController.Search.Cancel;

  edBusca.Text := '';

  Tab.CancelRange;
  Tab.Refresh;
  
  if (aCodigo>0) then 
    Tab.Locate('ID', aCodigo, []); // do not localize

  Timer1.Enabled := True;
end;

end.

