unit ncafbPesqCli;
{
    ResourceString: Dario 10/03/13
    Jo„o: TODO List!
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
  cxContainer, cxLabel, Buttons,  StdCtrls, cxRadioGroup, Menus,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, cxNavigator,
  dxPScxPivotGridLnk, uParentedPanel;

type
  TDadosCliente = record
    dcCodigo: Integer;
    dcNome  : String;
  end;
  PDadosCliente = ^TDadosCliente;  

  TfbPesqCli = class(TFrmBase)
    Tab: TnxTable;
    TabNome: TStringField;
    TabEndereco: TStringField;
    TabBairro: TStringField;
    TabCidade: TStringField;
    TabUF: TStringField;
    TabCEP: TStringField;
    TabSexo: TStringField;
    TabObs: TMemoField;
    TabCpf: TStringField;
    TabRg: TStringField;
    Tabemail: TMemoField;
    TabUltVisita: TDateTimeField;
    TabIsento: TBooleanField;
    TabUsername: TStringField;
    TabSenha: TStringField;
    TabTelefone: TStringField;
    TabDebito: TCurrencyField;
    TabEscola: TStringField;
    TabNickName: TStringField;
    TabDataNasc: TDateTimeField;
    TabCelular: TStringField;
    TabTemDebito: TBooleanField;
    dsCli: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVNome: TcxGridDBColumn;
    TVDebito: TcxGridDBColumn;
    TVIsento: TcxGridDBColumn;
    TVUsername: TcxGridDBColumn;
    TVTelefone: TcxGridDBColumn;
    TVCodigo: TcxGridDBColumn;
    TVEscola: TcxGridDBColumn;
    TVDataNasc: TcxGridDBColumn;
    TVCelular: TcxGridDBColumn;
    GL: TcxGridLevel;
    pmTempo: TdxBarPopupMenu;
    TabAlteradoEm: TDateTimeField;
    TabIncluidoPor: TStringField;
    TabAlteradoPor: TStringField;
    TabTipoAcessoPref: TIntegerField;
    TabIncluidoEm: TDateTimeField;
    pmSenha: TdxBarPopupMenu;
    TabPai: TStringField;
    TabMae: TStringField;
    TabEscolaHI: TDateTimeField;
    TabEscolaHF: TDateTimeField;
    TabLimiteDebito: TCurrencyField;
    TabInativo: TBooleanField;
    TVInativo: TcxGridDBColumn;
    TabFoto: TGraphicField;
    PopupMenu1: TPopupMenu;
    TabID: TAutoIncField;
    TabMinutos: TFloatField;
    TabMinutosUsados: TFloatField;
    TabMinutosIniciais: TFloatField;
    TabValorCred: TCurrencyField;
    TVCredito: TcxGridDBColumn;
    LMDSimplePanel1: TLMDSimplePanel;
    Timer1: TTimer;
    TabHP1: TIntegerField;
    TabHP2: TIntegerField;
    TabHP3: TIntegerField;
    TabHP4: TIntegerField;
    TabHP5: TIntegerField;
    TabHP6: TIntegerField;
    TabHP7: TIntegerField;
    TabNaoGuardarCredito: TBooleanField;
    TabPermiteLoginSemCred: TBooleanField;
    cmOk: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    container_panBusca: TdxBarControlContainerItem;
    panBusca: TPanel;
    edBusca: TcxMaskEdit;
    rgCod: TcxRadioButton;
    rgUsername: TcxRadioButton;
    rgNome: TcxRadioButton;
    cxLabel1: TcxLabel;
    TabPassaportes: TFloatField;
    TabTitEleitor: TStringField;
    TabFidPontos: TFloatField;
    TabFidTotal: TFloatField;
    TabFidResg: TFloatField;
    TabAniversario: TStringField;
    TVValorCred: TcxGridDBColumn;
    TVCredPromo: TcxGridDBColumn;
    Timer2: TTimer;
    TabSemFidelidade: TBooleanField;
    TabTemCredito: TBooleanField;
    TabCHorario: TIntegerField;
    TabOpCHorario: TWordField;
    TabFornecedor: TBooleanField;
    procedure TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVIsentoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVInativoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cmVenderCredClick(Sender: TObject);
    procedure cmDebTempoClick(Sender: TObject);
    procedure cmMostrarChange(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmOrdemChange(Sender: TObject);
    procedure cmMostrarPropertiesChange(Sender: TObject);
    procedure rgNomeClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure TVKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FrmBasePaiDestroy(Sender: TObject);
    procedure TVCreditoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVColumnPosChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure edBuscaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edBuscaPropertiesChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TVCredPromoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure Timer2Timer(Sender: TObject);
    procedure edBuscaEnter(Sender: TObject);
    procedure edBuscaExit(Sender: TObject);
    procedure FrmBasePaiKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FDadosCli : PDadosCliente;
    FEditControl : TcxCustomDropDownEdit;
    FStuffKey : String;
    FDigitando : Boolean;

    procedure Biometria(var Msg: TMessage);
      message wm_biometria;
    procedure SetStuffKey(const Value: String);
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;
    procedure ParentChanged; override;

    procedure PreparaBusca(aDC: PDadosCliente; aEditControl: TcxCustomDropDownEdit);

    property Digitando: Boolean
      read FDigitando;

    property StuffKey: String
      read FStuffKey write SetStuffKey;
    { Public declarations }
  end;

var
  fbPesqCli: TfbPesqCli;
  PesqFrmH : HWND = 0;
  RealActiveFrmH : HWND =0;

implementation

uses ncaDM, ufmImagens, ncaFrmPri, 
  ncaFrmPass, ncIDRecursos, ncaFrmZerarTempo,
  ncaFrmSenha, ncaFrmCadCli, ncaFrmFornecedor;

// START resource string wizard section
resourcestring
  SCaixaEst·Fechado = 'Caixa est· fechado';
  SClientes = 'Clientes';

// END resource string wizard section


{$R *.dfm}

procedure TfbPesqCli.FiltraDados;
begin
  if not Tab.Active then Tab.Active := True;

  if rgNome.Checked then begin
    Tab.IndexName := 'INome'; // do not localize
    TVNome.Index := 0;
    TVUsername.Index := 1;
    TVCodigo.Index := 2;
    TV.OptionsBehavior.IncSearchItem := TVNome;
    edBusca.Properties.EditMask := '';
  end else
  if rgUsername.Checked then begin
    Tab.IndexName := 'IUsername'; // do not localize
    TVUsername.Index := 0;
    TVNome.Index := 1;
    TVCodigo.Index := 2;
    TV.OptionsBehavior.IncSearchItem := TVUsername;
    edBusca.Properties.EditMask := '';
  end else begin
    Tab.IndexName := 'IID'; // do not localize
    TVCodigo.Index := 0;
    TVNome.Index := 1;
    TVUsername.Index := 2;
    edBusca.Properties.EditMask := '\d+';
    TV.OptionsBehavior.IncSearchItem := TVCodigo;
  end;  

//  Tab.Filtered := False;
  if not Tab.Active then
    Tab.Open else
    Tab.Refresh;
end;

procedure TfbPesqCli.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  LeLayout(Grid, 'especial'); // do not localize
  FStuffKey := '';
  Fdigitando := False;
end;

procedure TfbPesqCli.FrmBasePaiDestroy(Sender: TObject);
begin
  inherited;
  fbPesqCli := nil;
end;

procedure TfbPesqCli.FrmBasePaiKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not FDigitando then 
    StuffKey := StuffKey + Char(Key);
end;

procedure TfbPesqCli.cmVenderCredClick(Sender: TObject);
begin
  inherited;
  if NumAberto<1 then begin
    Beep;
    ShowMessage(SCaixaEst·Fechado);
    Exit;
  end;
  
  with Dados do begin
//    TFrmCredito.Create(Self).Novo(tbAcesso, TabCodigo.Value, True);
    Tab.Refresh;
  end;    
end;

procedure TfbPesqCli.Biometria(var Msg: TMessage);
begin

end;

procedure TfbPesqCli.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FDadosCli := nil;
  if FEditControl<>nil then begin
    FEditControl.DroppedDown := False;
    FEditControl := nil;
  end;
end;

procedure TfbPesqCli.btnOKClick(Sender: TObject);
begin
  inherited;
  if FDadosCli<>nil then begin
    FDadosCli.dcCodigo := TabID.Value;
    FDadosCli.dcNome   := TabNome.Value;
    FDadosCli := nil;
  end;

  if FEditControl<>nil then begin
    FEditControl.DroppedDown := False;
    FEditControl := nil;
  end;

end;

procedure TfbPesqCli.cmDebTempoClick(Sender: TObject);
begin
  inherited;
  if Tab.RecordCount>0 then
//    TFrmCredito.Create(Self).Novo(Dados.tbAcesso, TabCodigo.Value, False);
  Tab.Refresh;  
end;

class function TfbPesqCli.Descricao: String;
begin
  Result := SClientes;
end;

procedure TfbPesqCli.edBuscaEnter(Sender: TObject);
begin
  inherited;
  FDigitando := True;
  Timer2Timer(nil);
end;

procedure TfbPesqCli.edBuscaExit(Sender: TObject);
begin
  inherited;
  FDigitando := False;
end;

procedure TfbPesqCli.edBuscaKeyUp(Sender: TObject; var Key: Word;
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

procedure TfbPesqCli.edBuscaPropertiesChange(Sender: TObject);
begin
  inherited;
  if rgCod.Checked then begin
    Tab.CancelRange;
    if Trim(edBusca.Text) > '' then
      Tab.FindNearest([Trim(edBusca.Text)]) else
      Tab.First;
  end else
    Tab.SetRange([edBusca.text], [edBusca.Text + 'zzzzzzzzzzzzzzzzzzzzzz']); // do not localize
end;

procedure TfbPesqCli.cmMostrarChange(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbPesqCli.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  try
    PesqFrmH := Handle;
    edBusca.SetFocus;
  except
  end;
end;

procedure TfbPesqCli.Timer2Timer(Sender: TObject);
begin
  inherited;
  if (Sender<>nil) and (not edBusca.Focused) then Exit;
  while FStuffKey>'' do begin
    keybd_event(Ord(FStuffKey[1]), Mapvirtualkey(Ord(FStuffKey[1]), 0), 0, 0);
    keybd_event(Ord(FStuffKey[1]), Mapvirtualkey(Ord(FStuffKey[1]), 0), KEYEVENTF_KEYUP, 0);
    Delete(FStuffKey, 1, 1);
  end;
  
  Timer2.Enabled := False;  
end;

procedure TfbPesqCli.TVColumnPosChanged(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
begin
  inherited;
  SalvaLayout(Grid, 'especial'); // do not localize
end;

procedure TfbPesqCli.TVCreditoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  V := ARecord.Values[TVCredito.Index];
  if V <> null then
    AText := MinutosToHMSStr(V);
end;

procedure TfbPesqCli.TVCredPromoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;
begin
  inherited;
  V := ARecord.Values[TVCredPromo.Index];
  if (V<>null) and (V>0) then
    AText := MinutosToHMSAbrev(V) else
    AText := '';
end;

procedure TfbPesqCli.TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  with aviewinfo do 
  if (Value<>Null) and (Value>0.009) then begin
    ACanvas.Canvas.Brush.Color := clRed;
    ACanvas.Canvas.Font.Color := clWhite;
  end;
end;

procedure TfbPesqCli.TVInativoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  with aviewinfo do 
  if (Value<>Null) and (Value=True) then begin
    ACanvas.Canvas.Brush.Color := clGray;
    ACanvas.Canvas.Font.Color := clWhite;
  end;
end;

procedure TfbPesqCli.TVIsentoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  with aviewinfo do 
  if (Value<>Null) and (Value=True) then begin
    ACanvas.Canvas.Brush.Color := clGreen;
    ACanvas.Canvas.Font.Color := clWhite;
  end;
end;

procedure TfbPesqCli.TVKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    13 : btnOkClick(nil);
    27 : btnCancelarClick(nil);
  end;
end;

procedure TfbPesqCli.cmNovoClick(Sender: TObject);
begin
  TFrmCadCli.Create(Self).Novo(Tab, nil);
  Dados.tbCli.Refresh;
  Dados.tbCli.Locate('ID', TabID.Value, []); // do not localize
end;

procedure TfbPesqCli.cmEditarClick(Sender: TObject);
begin
  inherited;
  TFrmCadCli.Create(Self).Editar(Tab, nil);
  Dados.tbCli.Refresh;
  Dados.tbCli.Locate('ID', TabID.Value, []); // do not localize
end;

procedure TfbPesqCli.AtualizaDireitos;
begin
  inherited;
  cmNovo.Enabled := Permitido(daCliCadastrar);
  if Tab.Active then Tab.Refresh;
end;

procedure TfbPesqCli.cmOrdemChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TfbPesqCli.cmMostrarPropertiesChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TfbPesqCli.ParentChanged;
begin
end;

procedure TfbPesqCli.PreparaBusca(aDC: PDadosCliente;
  aEditControl: TcxCustomDropDownEdit);
begin
  Timer1.Enabled := True;
//  if FEditControl = aEditControl then Exit;
  
  RealActiveFrmH := Application.ActiveFormHandle;
  FDadosCli := aDC;
  FEditControl := aEditControl;
  if TV.DataController.Search.Searching then
    TV.DataController.Search.Cancel;

  case gConfig.CampoLocalizaCli of
    0 : rgNome.Checked := True;
    1 : rgUsername.Checked := True;
    2 : rgCod.Checked := True;  
  end;

  Tab.CancelRange;
  Tab.Refresh;
  
  if (aDC<>nil) and (aDC.dcCodigo>0) then 
    Tab.Locate('ID', aDC.dcCodigo, []); // do not localize

end;

procedure TfbPesqCli.rgNomeClick(Sender: TObject);
begin
  inherited;
  FiltraDados;
  if TRadioButton(Sender).Focused then
    edBusca.SetFocus;
end;


procedure TfbPesqCli.SetStuffKey(const Value: String);
begin
  FStuffKey := Value;
  Timer2.Enabled := (Value>'');
end;

end.

