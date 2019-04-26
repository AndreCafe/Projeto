unit ncafbPesqFor;

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
  cxContainer, cxLabel, Buttons, PngSpeedButton, StdCtrls, cxRadioGroup, Menus,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TfbPesqFor = class(TFrmBase)
    Tab: TnxTable;
    TabNome: TStringField;
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
    TabFornecedor: TBooleanField;
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
  ncIDRecursos, ncaFrmFornecedor;

{$R *.dfm}

procedure TfbPesqFor.FiltraDados;
begin
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
  Result := 'Fornecedores';
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
  Tab.SetRange([True, edBusca.text], [True, edBusca.Text + 'zzzzzzzzzzzzzzzzzzzzzz']);
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
  if TFrmFornecedor.Create(nil).Editar(aNome) then begin
    Tab.Insert;
    TabNome.Value := aNome;
    TabFornecedor.Value := True;
    Tab.Post;
  end;
end;

procedure TfbPesqFor.cmEditarClick(Sender: TObject);
var aNome: String;
begin
  inherited;
  if Tab.IsEmpty then Exit;
  aNome := TabNome.Value;
  if TFrmFornecedor.Create(nil).Editar(aNome) then begin
    Tab.Edit;
    TabNome.Value := aNome;
    Tab.Post;
  end;
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
    Tab.Locate('ID', FDadosFor^.dcCodigo, []);

  Timer1.Enabled := True;
end;

end.
