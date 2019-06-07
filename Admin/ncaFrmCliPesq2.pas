unit ncaFrmCliPesq2;
{
    ResourceString: Dario 11/03/13
}

{$I NEX.INC}

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
  cxContainer, cxLabel, Buttons, StdCtrls, cxRadioGroup, 
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, cxNavigator,
  dxPScxPivotGridLnk, uNexTransResourceStrings_PT, cxBarEditItem, cxButtons,
  dxGDIPlusClasses, LMDPNGImage, Menus, ncMyImage, ImgList, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxPCdxBarPopupMenu, DBCtrls, cxPC,
  cxImage, cxDBEdit, dxBarBuiltInMenu;

type
  TFrmCliPesq2 = class(TForm)
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
    TabAlteradoEm: TDateTimeField;
    TabIncluidoPor: TStringField;
    TabAlteradoPor: TStringField;
    TabTipoAcessoPref: TIntegerField;
    TabIncluidoEm: TDateTimeField;
    TabPai: TStringField;
    TabMae: TStringField;
    TabEscolaHI: TDateTimeField;
    TabEscolaHF: TDateTimeField;
    TabLimiteDebito: TCurrencyField;
    TabInativo: TBooleanField;
    TabFoto: TGraphicField;
    TabID: TAutoIncField;
    TabMinutos: TFloatField;
    TabMinutosUsados: TFloatField;
    TabMinutosIniciais: TFloatField;
    TabValorCred: TCurrencyField;
    TabHP1: TIntegerField;
    TabHP2: TIntegerField;
    TabHP3: TIntegerField;
    TabHP4: TIntegerField;
    TabHP5: TIntegerField;
    TabHP6: TIntegerField;
    TabHP7: TIntegerField;
    TabNaoGuardarCredito: TBooleanField;
    TabPermiteLoginSemCred: TBooleanField;
    TabPassaportes: TFloatField;
    TabTitEleitor: TStringField;
    TabFidPontos: TFloatField;
    TabFidTotal: TFloatField;
    TabFidResg: TFloatField;
    TabAniversario: TStringField;
    TabCotaImpEspecial: TBooleanField;
    TabCotaImpDia: TIntegerField;
    TabCotaImpMes: TIntegerField;
    TabSemFidelidade: TBooleanField;
    TabCHorario: TIntegerField;
    TabOpCHorario: TWordField;
    TabFornecedor: TBooleanField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    panBusca: TLMDSimplePanel;
    btnCancel: TcxButton;
    edBusca: TcxTextEdit;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVNome: TcxGridDBColumn;
    TVUsername: TcxGridDBColumn;
    TVCodigo: TcxGridDBColumn;
    TVCredito: TcxGridDBColumn;
    TVValorCred: TcxGridDBColumn;
    TVCredPromo: TcxGridDBColumn;
    TVIsento: TcxGridDBColumn;
    TVDebito: TcxGridDBColumn;
    TVDataNasc: TcxGridDBColumn;
    TVFor: TcxGridDBTableView;
    TVForNome: TcxGridDBColumn;
    GL: TcxGridLevel;
    panDigite: TLMDSimplePanel;
    PopupMenu2: TPopupMenu;
    aaaa1: TMenuItem;
    bbbb1: TMenuItem;
    lbDigiteProduto: TcxLabel;
    lbUsername: TcxLabel;
    lbCodigo: TcxLabel;
    lbNome: TcxLabel;
    IMgs: TcxImageList;
    cxImageList1: TcxImageList;
    Label1: TLabel;
    lbSize: TcxLabel;
    lbNovo: TcxLabel;
    Timer1: TTimer;
    pgFoto: TcxPageControl;
    tsSemFoto: TcxTabSheet;
    tsComFoto: TcxTabSheet;
    edFoto: TcxDBImage;
    lbEditar: TcxLabel;
    btnOk: TcxButton;
    imgSemFoto: TMyImage;
    procedure TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVIsentoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVInativoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cmMostrarChange(Sender: TObject);
    procedure cmOrdemChange(Sender: TObject);
    procedure cmMostrarPropertiesChange(Sender: TObject);
    procedure rgNomeClick(Sender: TObject);
    procedure TVCreditoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVColumnPosChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure TVCredPromoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure GridEnter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure TVDblClick(Sender: TObject);
    procedure edBuscaFocusChanged(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure edBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edBuscaPropertiesChange(Sender: TObject);
    procedure edBuscaPropertiesEditValueChanged(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure TVKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbDigiteProdutoClick(Sender: TObject);
    procedure lbNomeClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure lbNovoClick(Sender: TObject);
    procedure TVCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure edBuscaEnter(Sender: TObject);
    procedure imgEditClick(Sender: TObject);
    procedure imgSemFotoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TVCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);

  private
    { Private declarations }
    FEntrou : Boolean;
    FShowing : Boolean;
    FUpdating : Boolean;
    FSave: String;
    FBuscaPor: Byte;

    procedure Atualiza;

    procedure Biometria(var Msg: TMessage);
      message wm_biometria;
    procedure SelecionaTudo(var Msg: Tmessage);
      message wm_user;  
    procedure SetBuscaPor(const Value: Byte);

    procedure SetTextFromDB;
  public
    procedure FiltraDados; 

    property BuscaPor: Byte
      read FBuscaPor write SetBuscaPor;

    function Pesquisar(var aID: Integer; var aNome: String; var aFidPontos: Double; var aCredito, aDebito: Currency): Boolean;

    procedure Reset;

    function procurar: Boolean;

    procedure processKey(Key: Word; aIgnoreUpDown: Boolean);

    { Public declarations }
  end;

  TFrmCliPesq2List = class
  private
    FList : TList;
  public
    constructor Create;
    destructor Destroy; override;

    function GetFrm: TFrmCliPesq2;
    procedure ReleaseFrm(aFrm: TFrmCliPesq2);  
  end;
  

var
  FrmCliPesq2: TFrmCliPesq2;
  gCliPesq2List : TFrmCliPesq2List;

implementation

uses ncaDM, ufmImagens, ncaFrmPri, 
  ncIDRecursos, 
  ncaFrmCadCli;

// START resource string wizard section
// MMX resource string wizard section REMOVIDA - 08/04/13 12:30


{$R *.dfm}

procedure TFrmCliPesq2.FiltraDados;
begin
  if not Tab.Active then Tab.Active := True;

  {$IFDEF Loja}
  TVUsername.Visible := False;
  {$ENDIF}

{  TV.DataController.DataSource := dsCli;
  TVFor.DataController.DataSource := nil;}
  Tab.Filter := 'Fornecedor<>True'; // do not localize
  Tab.Filtered := True;

  case FBuscaPor of
    0 : begin
      Tab.IndexName := 'IFornecedorNome'; // do not localize
      GL.GridView := TV;
      TVNome.Index := 0;
      TVUsername.Index := 1;
      TVCodigo.Index := 2;
    end;
    1 : begin
      Tab.IndexName := 'IFornecedorUsername'; // do not localize
      GL.GridView := TV;
      TVUsername.Index := 0;
      TVNome.Index := 1;
      TVCodigo.Index := 2;
    end;
  else 
    Tab.IndexName := 'IFornecedorID'; // do not localize
    GL.GridView := TV;
    TVNome.Index := 0;
    TVCodigo.Index := 1;
    TVUsername.Index := 2;
  end;
end;

procedure TFrmCliPesq2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FShowing := False;
end;

procedure TFrmCliPesq2.FormCreate(Sender: TObject);
begin
  imgSemFoto.Enabled := False;
  FUpdating := False;
  lbEditar.Visible := False;
  lbSize.SendToBack;
{$IFDEF LOJA}
  lbUsername.Visible := False;
  TVUsername.Visible := False;
  TVCredito.Visible := False;
  TVCredPromo.Visible := False;
  TVIsento.Visible := False;

  TVUsername.VisibleForCustomization := False;
  TVCredito.VisibleForCustomization := False;
  TVCredPromo.VisibleForCustomization := False;
  TVIsento.VisibleForCustomization := False;
{$ENDIF}  
  FShowing := false;
  FEntrou := False;
//  LeLayout(Grid, 'especial'); // do not localize
  Tab.Open;
end;

procedure TFrmCliPesq2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Key_F5 then lbNovoClick(nil);
end;

procedure TFrmCliPesq2.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then Key := #0;
end;

procedure TFrmCliPesq2.FormShow(Sender: TObject);
begin
  FShowing := True;
  edBusca.SetFocus;
end;

procedure TFrmCliPesq2.GridEnter(Sender: TObject);
begin
  inherited;
  FEntrou := True;
  if (edBusca.Text='') and not Tab.IsEmpty then
    SetTextFromDB;
  Timer1.Enabled := True;
end;

procedure TFrmCliPesq2.GridExit(Sender: TObject);
begin
  inherited;
  FEntrou := False;
end;

procedure TFrmCliPesq2.imgEditClick(Sender: TObject);
begin
  TFrmCadCli.Create(Self).Editar(Tab, nil);
  Dados.tbCli.Refresh;
  Dados.tbCli.Locate('ID', TabID.Value, []); // do not localize
  edBusca.SetFocus;
end;

procedure TFrmCliPesq2.lbDigiteProdutoClick(Sender: TObject);
begin
  edBusca.SetFocus;
end;

procedure TFrmCliPesq2.lbNomeClick(Sender: TObject);
begin
  BuscaPor := TcxLabel(Sender).Tag;
  edBusca.SetFocus;
end;

procedure TFrmCliPesq2.lbNovoClick(Sender: TObject);
var aID: Integer;
begin
  aID := TFrmCadCli.Create(Self).Novo(Tab, nil);
  if aID>0 then begin
    Tab.SetRange([False], [False]);
    Tab.Locate('ID', aID, []);
    FUpdating := True;
    try
      SetTextFromDB;
      Atualiza;
    finally
      FUpdating := False;
    end;
    ModalResult := mrOk;
    Dados.tbCli.Refresh;
    Dados.tbCli.Locate('ID', TabID.Value, []); // do not localize
  end;  
end;

procedure TFrmCliPesq2.imgSemFotoClick(Sender: TObject);
begin
  if lbEditar.Visible then 
    imgEditClick(nil);
end;

function TFrmCliPesq2.Pesquisar(var aID: Integer; var aNome: String;
  var aFidPontos: Double; var aCredito, aDebito: Currency): Boolean;
begin
  FUpdating := True;
  try
    edBusca.Text := '';
    Tab.SetRange([False], [False]);
    if (aID>0) and Tab.Locate('ID', aID, []) then edBusca.Text := TabNome.Value;
    Atualiza;
  finally
    FUpdating := False;
  end;
  ShowModal;
  if ModalResult=mrOk then begin
    if (edBusca.Text>'') and (not Tab.IsEmpty) then begin
      aID := TabID.Value;
      aNome := TabNome.Value;
      aFidPontos := TabFidPontos.Value;
      aCredito := TabValorCred.Value;
      aDebito := TabDebito.Value;
    end else begin
      aID := 0;
      aNome := '';
      aFidPontos := 0;
      aCredito := 0;
      aDebito := 0;
    end;
    Result := True;
  end else
    Result := False;
end;

procedure TFrmCliPesq2.processKey(Key: Word; aIgnoreUpdown: Boolean);
var FSaveID, FStart: Integer;
begin
  FSaveID := TabID.Value;
  case Key of
    VK_UP : if not aIgnoreUpdown then Tab.Prior;
    VK_Down : if not aIgnoreUpdown then Tab.Next;
    VK_F2, 
    VK_Return : ModalResult := mrOk;
    VK_Escape : ModalResult := mrCancel;
  end;
  if TabID.Value <> FSaveID then
  try
    FUpdating := True;
    if (edBusca.Text='') then
      FStart := 0
    else
    if edBusca.SelLength>0 then
      FStart := edBusca.SelStart else
      FStart := -1;
    
    SetTextFromDB;
    if FStart>-1 then
      edBusca.SetSelection(FStart, Length(edBusca.Text));
  finally
    FUpdating := False;
  end;
end;

function SoDig(S: String): String;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I] in ['0'..'9'] then
      Result := Result + S[I];
end;

function TFrmCliPesq2.procurar: Boolean;
var S: String;
begin
  if FBuscaPor=lbCodigo.Tag then begin
    S := SoDig(edBusca.Text);
    if S>'' then
      Tab.SetRange([False, S], [False, S]) else
      Tab.CancelRange;
  end else begin
    if edBusca.SelLength>0 then
      S := Copy(edBusca.Text, 1, edBusca.SelStart-1) else
      S := edBusca.Text;
    Tab.SetRange([False, S], [False, S + 'zzzzzzzzzzzzzzzzzzzzzz']); // do not localize
  end;  
  Result := not Tab.IsEmpty;
end;

procedure TFrmCliPesq2.Reset;
begin
  if Tab.active then begin
      Tab.DisableControls;
      try
        Tab.SetRange([False], [False]);
        Tab.First;
      finally
        Tab.EnableControls;
      end;
  end;
end;

procedure TFrmCliPesq2.Atualiza;
begin
  lbEditar.Visible := (not Tab.IsEmpty) and (edBusca.Text>'');
  TV.OptionsSelection.HideFocusRect := not lbEditar.Visible;
  TV.OptionsSelection.HideSelection := not lbEditar.Visible;
  lbSize.Caption := edBusca.Text;

  pgFoto.Visible := lbEditar.Visible and (not TabFoto.IsNull);
    
  if lbEditar.Visible and (not TabFoto.IsNull) then 
    pgFoto.ActivePage := tsComFoto 
  else begin
    pgFoto.ActivePage := tsSemFoto;
    imgSemFoto.Enabled := lbEditar.Visible;
  end;
end;

procedure TFrmCliPesq2.Biometria(var Msg: TMessage);
begin

end;

procedure TFrmCliPesq2.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFrmCliPesq2.btnOkClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TFrmCliPesq2.edBuscaEnter(Sender: TObject);
begin
  PostMessage(Handle, wm_user, 0, 0);
end;

procedure TFrmCliPesq2.edBuscaFocusChanged(Sender: TObject);
begin
  inherited;
{  if edBusca.Focused then
    panBusca.Color := FrmPri.cxEditStyleController1.StyleFocused.Color else
    panBusca.Color := clBtnFace;}
end;

procedure TFrmCliPesq2.edBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  FSave := edBusca.Text;
  if Key = 8 then begin
    if (edBusca.SelLength>0) then begin
      if edBusca.SelLength = Length(edBusca.EditingText) then
        edBusca.Text := ''
      else
      if (edBusca.SelStart>0) then edBusca.SetSelection(edBusca.SelStart-1, edBusca.SelLength+1);
    end;
  end;

  if Key = 46 then
    if edBusca.SelLength>0 then
      edBusca.Text := '';

  ProcessKey(Key, False);
end;

procedure TFrmCliPesq2.edBuscaPropertiesChange(Sender: TObject);
begin
  inherited;
  edBusca.PostEditValue;
  Atualiza;
end;

function SemAcento(S: String): String;
const
  Acentos =  'éêèýýúùûîiíìõôòóãáàñç';
  SAcentos = 'eeeyyuuuiiiiooooaaanc';
var
  I, P : Integer;  
begin
  S := lowercase(S);
  Result := '';
  for I := 1 to Length(S) do begin
    P := Pos(S[i], Acentos);
    if P>0 then
      Result := Result + SAcentos[P] else
      Result := Result + S[i];
  end;
end;

procedure TFrmCliPesq2.edBuscaPropertiesEditValueChanged(Sender: TObject);
var P: Integer;
begin
  inherited;
  if FUpdating then Exit;

  FUpdating := True;
  try
  //  panDigite.Visible := (Trim(edBusca.Text)='');
    if FShowing and (edBusca.Focused) and (edBusca.Text<>FSave) then begin
      if Procurar and (FBuscaPor<>2) and (edBusca.Text>'') then begin
        P := edBusca.CursorPos;
        SetTextFromDB;
        edBusca.SetSelection(P, Length(edBusca.Text));
      end;
    end;
  finally
    FUpdating := False;
  end;
end;

procedure TFrmCliPesq2.cmMostrarChange(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TFrmCliPesq2.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if FShowing then
    edBusca.SetFocus;
end;

procedure TFrmCliPesq2.TVColumnPosChanged(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
begin
  inherited;
  SalvaLayout(Grid, 'especial'); // do not localize
end;

procedure TFrmCliPesq2.TVCreditoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  V := ARecord.Values[TVCredito.Index];
  if V <> null then
    AText := MinutosToHMSStr(V);
end;

procedure TFrmCliPesq2.TVCredPromoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;
begin
  inherited;
  V := ARecord.Values[TVCredPromo.Index];
  if (V<>null) and (V>0) then
    AText := MinutosToHMSAbrev(V) else
    AText := '';
end;

procedure TFrmCliPesq2.TVCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Selected then begin
    ACanvas.Brush.Color := clHighlight;
    ACanvas.Font.Color := clHighlightText;
  end;
end;

procedure TFrmCliPesq2.TVCustomDrawColumnHeader(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
begin
  ACanvas.FillRect(AViewInfo.Bounds, clWhite);
  ACanvas.FrameRect(AViewInfo.Bounds, TV.OptionsView.GridLineColor, 1, [bBottom]);

  case AViewInfo.AlignmentHorz of
    taLeftJustify : ACanvas.DrawTexT(AViewInfo.Text, AViewInfo.TextAreaBounds, cxAlignLeft or cxAlignVCenter);
    taRightJustify : ACanvas.DrawTexT(AViewInfo.Text, AViewInfo.TextAreaBounds, cxAlignRight or cxAlignVCenter);
    taCenter : ACanvas.DrawTexT(AViewInfo.Text, AViewInfo.TextAreaBounds, cxAlignHCenter or cxAlignVCenter);
  end;

  ADone := True;
end;

procedure TFrmCliPesq2.TVDblClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TFrmCliPesq2.TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  with aviewinfo do 
  if (Value<>Null) and (Value>0.009) then begin
    ACanvas.Canvas.Brush.Color := clRed;
    ACanvas.Canvas.Font.Color := clWhite;
  end else 
    ACanvas.Font.Color := ACanvas.Brush.Color;
end;

procedure TFrmCliPesq2.TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if FEntrou then SetTextFromDB;
end;

procedure TFrmCliPesq2.TVInativoCustomDrawCell(Sender: TcxCustomGridTableView;
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

procedure TFrmCliPesq2.TVIsentoCustomDrawCell(Sender: TcxCustomGridTableView;
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

procedure TFrmCliPesq2.TVKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_Return : ModalResult := mrOk;
    VK_Escape : ModalResult := mrCancel;
  end;
end;

procedure TFrmCliPesq2.cmOrdemChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TFrmCliPesq2.cxButton3Click(Sender: TObject);
begin
  inherited;
  edBusca.SetFocus;
end;

procedure TFrmCliPesq2.cmMostrarPropertiesChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TFrmCliPesq2.rgNomeClick(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TFrmCliPesq2.SelecionaTudo(var Msg: Tmessage);
begin
  edBusca.SelectAll;
end;

procedure TFrmCliPesq2.SetBuscaPor(const Value: Byte);
var aID: Integer;

procedure AjustaLabel(L: TcxLabel);
begin
  if L.Tag=FBuscaPor then begin
    L.Style.TextColor := clBlack;
    L.Style.TextStyle := [fsUnderline];
  end else begin
    L.Style.TextColor := clGray;
    L.Style.TextStyle := [];
  end;
end;

begin
  if FBuscaPor = Value then Exit;
  
  FBuscaPor := Value;
  AjustaLabel(lbNome);
  AjustaLabel(lbUsername);
  AjustaLabel(lbCodigo);

  FUpdating := True;
  try
    if lbEditar.Visible then begin
      aID := TabID.Value;
      SetTextFromDB;
    end else aID := 0;
    FiltraDados;
    edBusca.SetFocus;
    edBusca.SelectAll;
    if aID>0 then Tab.Locate('ID', aID, []);
  finally
    FUpdating := False;
  end;
end;

procedure TFrmCliPesq2.SetTextFromDB;
begin
  case FBuscaPor of
    0 : edBusca.Text := TabNome.Value;
    1 : edBusca.Text := TabUsername.Value;
    2 : edBusca.Text := TabID.AsString;
  end;
end;

{ TFrmCliPesq2List }

constructor TFrmCliPesq2List.Create;
begin
  FList := TList.Create;
end;

destructor TFrmCliPesq2List.Destroy;
begin
  while FList.Count>0 do begin
    TObject(FList[0]).Free;
    FList.Delete(0);
  end;
  FList.Free;

  inherited;
end;

function TFrmCliPesq2List.GetFrm: TFrmCliPesq2;
begin
  if FList.Count>0 then begin
    Result := FList[0];
    Result.Tab.Refresh;
    FList.Delete(0);
  end else
    Result := TFrmCliPesq2.Create(nil);
end;

procedure TFrmCliPesq2List.ReleaseFrm(aFrm: TFrmCliPesq2);
begin
  FList.Add(aFrm);
end;

initialization
  gCliPesq2List := TFrmCliPesq2List.Create;

finalization
  gCliPesq2List.Free;  

end.

