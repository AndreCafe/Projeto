unit ncaFrmPesqFor;
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
  TFrmPesqFor = class(TForm)
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
    btnOk: TcxButton;
    edBusca: TcxTextEdit;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVNome: TcxGridDBColumn;
    TVCodigo: TcxGridDBColumn;
    TVFor: TcxGridDBTableView;
    TVForNome: TcxGridDBColumn;
    GL: TcxGridLevel;
    panDigite: TLMDSimplePanel;
    PopupMenu2: TPopupMenu;
    aaaa1: TMenuItem;
    bbbb1: TMenuItem;
    IMgs: TcxImageList;
    cxImageList1: TcxImageList;
    Label1: TLabel;
    lbSize: TcxLabel;
    imgEdit: TMyImage;
    lbNovo: TcxLabel;
    pgFoto: TcxPageControl;
    tsSemFoto: TcxTabSheet;
    imgSemFoto: TMyImage;
    tsComFoto: TcxTabSheet;
    edFoto: TcxDBImage;
    Timer1: TTimer;
    procedure cmMostrarChange(Sender: TObject);
    procedure cmOrdemChange(Sender: TObject);
    procedure cmMostrarPropertiesChange(Sender: TObject);
    procedure rgNomeClick(Sender: TObject);
    procedure TVColumnPosChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
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

    function Pesquisar(var aID: Integer; var aNome: String; var aFidPontos: Double): Boolean;

    procedure Reset;

    function procurar: Boolean;

    procedure processKey(Key: Word; aIgnoreUpDown: Boolean);

    { Public declarations }
  end;

  TFrmPesqForList = class
  private
    FList : TList;
  public
    constructor Create;
    destructor Destroy; override;

    function GetFrm: TFrmPesqFor;
    procedure ReleaseFrm(aFrm: TFrmPesqFor);  
  end;
  

var
  FrmPesqFor: TFrmPesqFor;
  gPesqForList : TFrmPesqForList;

implementation

uses ncaDM, ufmImagens, ncaFrmPri, 
  ncIDRecursos, 
  ncaFrmCadFornecedor;

// START resource string wizard section
// MMX resource string wizard section REMOVIDA - 08/04/13 12:30


{$R *.dfm}

procedure TFrmPesqFor.FiltraDados;
begin
  if not Tab.Active then Tab.Active := True;
//  imgAdd.Enabled := Permitido(daCliCadastrar);
  imgEdit.Enabled := Permitido(daCliCadastrar);

  case FBuscaPor of
    0 : Tab.IndexName := 'IFornecedorNome'; // do not localize
  end;
end;

procedure TFrmPesqFor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FShowing := False;
end;

procedure TFrmPesqFor.FormCreate(Sender: TObject);
begin
  imgSemFoto.Enabled := False;
  FUpdating := False;
  imgEdit.Visible := False;
  lbSize.SendToBack;
  FShowing := false;
  FEntrou := False;
//  LeLayout(Grid, 'especial'); // do not localize
  Tab.Open;
end;

procedure TFrmPesqFor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Key_F5 then lbNovoClick(nil);
end;

procedure TFrmPesqFor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then Key := #0;
end;

procedure TFrmPesqFor.FormShow(Sender: TObject);
begin
  FShowing := True;
  edBusca.SetFocus;
end;

procedure TFrmPesqFor.GridEnter(Sender: TObject);
begin
  inherited;
  FEntrou := True;
  if (edBusca.Text='') and not Tab.IsEmpty then
    SetTextFromDB;
  Timer1.Enabled := True;
end;

procedure TFrmPesqFor.GridExit(Sender: TObject);
begin
  inherited;
  FEntrou := False;
end;

procedure TFrmPesqFor.imgEditClick(Sender: TObject);
begin
  TFrmCadFornecedor.Create(Self).Editar(Tab, nil);
  Dados.tbCli.Refresh;
  Dados.tbCli.Locate('ID', TabID.Value, []); // do not localize
  edBusca.SetFocus;
end;

procedure TFrmPesqFor.lbDigiteProdutoClick(Sender: TObject);
begin
  edBusca.SetFocus;
end;

procedure TFrmPesqFor.lbNomeClick(Sender: TObject);
begin
  BuscaPor := TcxLabel(Sender).Tag;
  edBusca.SetFocus;
end;

procedure TFrmPesqFor.lbNovoClick(Sender: TObject);
var aID: Integer;
begin
  Tab.SetRange([True], [True]);
  aID := TFrmCadFornecedor.Create(Self).Novo(Tab, nil);
  if aID>0 then begin
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
    Dados.tbCli.Locate('ID', aID, []); // do not localize
  end;  
end;

procedure TFrmPesqFor.imgSemFotoClick(Sender: TObject);
begin
  if imgEdit.Visible then 
    imgEditClick(nil);
end;

function TFrmPesqFor.Pesquisar(var aID: Integer; var aNome: String;
  var aFidPontos: Double): Boolean;
begin
  FUpdating := True;
  try
    edBusca.Text := '';
    Tab.SetRange([True], [True]);
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
    end else begin
      aID := 0;
      aNome := '';
      aFidPontos := 0;
    end;
    Result := True;
  end else
    Result := False;
end;

procedure TFrmPesqFor.processKey(Key: Word; aIgnoreUpdown: Boolean);
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

function TFrmPesqFor.procurar: Boolean;
var S: String;
begin
  if edBusca.SelLength>0 then
    S := Copy(edBusca.Text, 1, edBusca.SelStart-1) else
    S := edBusca.Text;
  Tab.SetRange([True, S], [True, S + 'zzzzzzzzzzzzzzzzzzzzzz']); // do not localize
  Result := not Tab.IsEmpty;
end;

procedure TFrmPesqFor.Reset;
begin
  if Tab.active then begin
      Tab.DisableControls;
      try
        Tab.SetRange([True], [True]);
        Tab.First;
      finally
        Tab.EnableControls;
      end;
  end;
end;

procedure TFrmPesqFor.Atualiza;
begin
  imgEdit.Visible := (not Tab.IsEmpty) and (edBusca.Text>'');
  TV.OptionsSelection.HideFocusRect := not imgEdit.Visible;
  TV.OptionsSelection.HideSelection := not imgEdit.Visible;
  lbSize.Caption := edBusca.Text;
  imgEdit.Left := edBusca.Left + lbSize.Width + 10;
  if imgEdit.Visible then
    imgSemFoto.MouseOffDrawMode := idmNormal else
    imgSemFoto.MouseOffDrawMode := idmFaded;
  if imgEdit.Visible and (not TabFoto.IsNull) then 
    pgFoto.ActivePage := tsComFoto 
  else begin
    pgFoto.ActivePage := tsSemFoto;
    imgSemFoto.Enabled := imgEdit.Visible;
  end;
end;

procedure TFrmPesqFor.Biometria(var Msg: TMessage);
begin

end;

procedure TFrmPesqFor.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFrmPesqFor.btnOkClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TFrmPesqFor.edBuscaEnter(Sender: TObject);
begin
  PostMessage(Handle, wm_user, 0, 0);
end;

procedure TFrmPesqFor.edBuscaFocusChanged(Sender: TObject);
begin
  inherited;
  if edBusca.Focused then
    panBusca.Color := FrmPri.cxEditStyleController1.StyleFocused.Color else
    panBusca.Color := clBtnFace;
end;

procedure TFrmPesqFor.edBuscaKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmPesqFor.edBuscaPropertiesChange(Sender: TObject);
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

procedure TFrmPesqFor.edBuscaPropertiesEditValueChanged(Sender: TObject);
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

procedure TFrmPesqFor.cmMostrarChange(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TFrmPesqFor.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if FShowing then
    edBusca.SetFocus;
end;

procedure TFrmPesqFor.TVColumnPosChanged(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
begin
  inherited;
  SalvaLayout(Grid, 'especial'); // do not localize
end;

procedure TFrmPesqFor.TVCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Selected then begin
    ACanvas.Brush.Color := clHighlight;
    ACanvas.Font.Color := clHighlightText;
  end;
end;

procedure TFrmPesqFor.TVCustomDrawColumnHeader(Sender: TcxGridTableView;
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

procedure TFrmPesqFor.TVDblClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TFrmPesqFor.TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if FEntrou then SetTextFromDB;
end;

procedure TFrmPesqFor.TVKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_Return : ModalResult := mrOk;
    VK_Escape : ModalResult := mrCancel;
  end;
end;

procedure TFrmPesqFor.cmOrdemChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TFrmPesqFor.cxButton3Click(Sender: TObject);
begin
  inherited;
  edBusca.SetFocus;
end;

procedure TFrmPesqFor.cmMostrarPropertiesChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TFrmPesqFor.rgNomeClick(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TFrmPesqFor.SelecionaTudo(var Msg: Tmessage);
begin
  edBusca.SelectAll;
end;

procedure TFrmPesqFor.SetBuscaPor(const Value: Byte);
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

  FUpdating := True;
  try
    if imgEdit.Visible then begin
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

procedure TFrmPesqFor.SetTextFromDB;
begin
  edBusca.Text := TabNome.Value;
end;

{ TFrmPesqForList }

constructor TFrmPesqForList.Create;
begin
  FList := TList.Create;
end;

destructor TFrmPesqForList.Destroy;
begin
  while FList.Count>0 do begin
    TObject(FList[0]).Free;
    FList.Delete(0);
  end;
  FList.Free;

  inherited;
end;

function TFrmPesqForList.GetFrm: TFrmPesqFor;
begin
  if FList.Count>0 then begin
    Result := FList[0];
    FList.Delete(0);
  end else
    Result := TFrmPesqFor.Create(nil);
end;

procedure TFrmPesqForList.ReleaseFrm(aFrm: TFrmPesqFor);
begin
  FList.Add(aFrm);
end;

initialization
  gPesqForList := TFrmPesqForList.Create;

finalization
  gPesqForList.Free;  

end.

