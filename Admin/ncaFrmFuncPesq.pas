unit ncaFrmFuncPesq;
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
  cxImage, cxDBEdit;

type
  TFrmFuncPesq = class(TForm)
    Tab: TnxTable;
    dsCli: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    panBusca: TLMDSimplePanel;
    edBusca: TcxTextEdit;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    panDigite: TLMDSimplePanel;
    PopupMenu2: TPopupMenu;
    aaaa1: TMenuItem;
    bbbb1: TMenuItem;
    lbDigiteProduto: TcxLabel;
    lbUsername: TcxLabel;
    lbNome: TcxLabel;
    cxImageList1: TcxImageList;
    Label1: TLabel;
    lbSize: TcxLabel;
    Timer1: TTimer;
    TabUsername: TStringField;
    TabNome: TStringField;
    TabUsernameNome: TStringField;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    TVUsername: TcxGridDBColumn;
    TVNome: TcxGridDBColumn;
    procedure cmMostrarChange(Sender: TObject);
    procedure cmOrdemChange(Sender: TObject);
    procedure cmMostrarPropertiesChange(Sender: TObject);
    procedure rgNomeClick(Sender: TObject);
    procedure GridEnter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure TVDblClick(Sender: TObject);
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
    procedure TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure edBuscaEnter(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure TVCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);

  private
    { Private declarations }
    FAchou  : Boolean;
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

    function Pesquisar(var aUsername, aNome: String): Boolean;

    procedure Reset;

    function procurar: Boolean;

    procedure processKey(Key: Word; aIgnoreUpDown: Boolean);

    { Public declarations }
  end;

  TFuncPesqList = class
  private
    FList : TList;
  public
    constructor Create;
    destructor Destroy; override;

    function GetFrm: TFrmFuncPesq;
    procedure ReleaseFrm(aFrm: TFrmFuncPesq);  
  end;
  

var
  FrmFuncPesq: TFrmFuncPesq;
  gFuncPesqList : TFuncPesqList;

implementation

uses ncaDM, ufmImagens, ncaFrmPri, 
  ncIDRecursos; 

{$R *.dfm}

procedure TFrmFuncPesq.FiltraDados;
begin
  if not Tab.Active then Tab.Active := True;
  case FBuscaPor of
    0 : Tab.IndexName := 'INome';
    1 : Tab.IndexName := 'IUsername';
  end;
end;

procedure TFrmFuncPesq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FShowing := False;
end;

procedure TFrmFuncPesq.FormCreate(Sender: TObject);
begin
  FUpdating := False;
  FAchou := False;
  lbSize.SendToBack;
  FShowing := false;
  FEntrou := False;
  Tab.Open;
end;

procedure TFrmFuncPesq.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then Key := #0;
end;

procedure TFrmFuncPesq.FormShow(Sender: TObject);
begin
  FShowing := True;
  edBusca.SetFocus;
end;

procedure TFrmFuncPesq.GridEnter(Sender: TObject);
begin
  inherited;
  FEntrou := True;
  if (edBusca.Text='') and not Tab.IsEmpty then
    SetTextFromDB;
  Timer1.Enabled := True;
end;

procedure TFrmFuncPesq.GridExit(Sender: TObject);
begin
  inherited;
  FEntrou := False;
end;

procedure TFrmFuncPesq.lbDigiteProdutoClick(Sender: TObject);
begin
  edBusca.SetFocus;
end;

procedure TFrmFuncPesq.lbNomeClick(Sender: TObject);
begin
  BuscaPor := TcxLabel(Sender).Tag;
  edBusca.SetFocus;
end;

function TFrmFuncPesq.Pesquisar(var aUsername, aNome: String): Boolean;
begin
  FUpdating := True;
  try
    edBusca.Text := '';
    Tab.CancelRange;
    if (aUsername>'') and Tab.Locate('Username', aUsername, []) then begin
      edBusca.Text := TabNome.Value;
      FAchou := True;
    end;
    Atualiza;
  finally
    FUpdating := False;
  end;
  ShowModal;
  if ModalResult=mrOk then begin
    if (edBusca.Text>'') and (not Tab.IsEmpty) then begin
      aUsername := TabUsername.Value;
      aNome := TabNome.Value;
    end else begin
      aUsername := '';
      aNome := '';
    end;
    Result := True;
  end else
    Result := False;
end;

procedure TFrmFuncPesq.processKey(Key: Word; aIgnoreUpdown: Boolean);
var 
  FSaveUsername: String;
  FStart: Integer;
begin
  FSaveUsername := TabUsername.Value;
  case Key of
    VK_UP : if not aIgnoreUpdown then Tab.Prior;
    VK_Down : if not aIgnoreUpdown then Tab.Next;
    VK_F2, 
    VK_Return : ModalResult := mrOk;
    VK_Escape : ModalResult := mrCancel;
  end;
  if TabUsername.Value <> FSaveUsername then
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

function TFrmFuncPesq.procurar: Boolean;
var S: String;
begin
  if edBusca.SelLength>0 then
    S := Copy(edBusca.Text, 1, edBusca.SelStart-1) else
    S := edBusca.Text;
  Tab.SetRange([S], [S + 'zzzzzzzzzzzzzzzzzzzzzz']); // do not localize
  Result := not Tab.IsEmpty;
end;

procedure TFrmFuncPesq.Reset;
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

procedure TFrmFuncPesq.Atualiza;
begin
  FAchou := (not Tab.IsEmpty) and (edBusca.Text>'');
  TV.OptionsSelection.HideFocusRect := not FAchou;
  TV.OptionsSelection.HideSelection := not FAchou;
  lbSize.Caption := edBusca.Text;
end;

procedure TFrmFuncPesq.Biometria(var Msg: TMessage);
begin

end;

procedure TFrmFuncPesq.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFrmFuncPesq.btnOkClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TFrmFuncPesq.edBuscaEnter(Sender: TObject);
begin
  PostMessage(Handle, wm_user, 0, 0);
end;

procedure TFrmFuncPesq.edBuscaKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmFuncPesq.edBuscaPropertiesChange(Sender: TObject);
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

procedure TFrmFuncPesq.edBuscaPropertiesEditValueChanged(Sender: TObject);
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

procedure TFrmFuncPesq.cmMostrarChange(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TFrmFuncPesq.TabCalcFields(DataSet: TDataSet);
begin
  TabUsernameNome.Value := '['+TabUsername.Value+'] '+TabNome.Value;
end;

procedure TFrmFuncPesq.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if FShowing then
    edBusca.SetFocus;
end;

procedure TFrmFuncPesq.TVCustomDrawColumnHeader(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
begin
  FrmPri.CustomDrawGridHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TFrmFuncPesq.TVDblClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TFrmFuncPesq.TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if FEntrou then SetTextFromDB;
end;

procedure TFrmFuncPesq.TVKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_Return : ModalResult := mrOk;
    VK_Escape : ModalResult := mrCancel;
  end;
end;

procedure TFrmFuncPesq.cmOrdemChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TFrmFuncPesq.cxButton3Click(Sender: TObject);
begin
  inherited;
  edBusca.SetFocus;
end;

procedure TFrmFuncPesq.cmMostrarPropertiesChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TFrmFuncPesq.rgNomeClick(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TFrmFuncPesq.SelecionaTudo(var Msg: Tmessage);
begin
  edBusca.SelectAll;
end;

procedure TFrmFuncPesq.SetBuscaPor(const Value: Byte);
var aUsername: String;

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

  FUpdating := True;
  try
    if FAchou then begin
      aUsername := TabUsername.Value;
      SetTextFromDB;
    end else aUsername := '';
    FiltraDados;
    edBusca.SetFocus;
    edBusca.SelectAll;
    if aUsername>'' then Tab.Locate('Username', aUsername, []);
  finally
    FUpdating := False;
  end;
end;

procedure TFrmFuncPesq.SetTextFromDB;
begin
  case FBuscaPor of
    0 : edBusca.Text := TabNome.Value;
    1 : edBusca.Text := TabUsername.Value;
  end;
end;

{ TFrmCliPesq2List }

constructor TFuncPesqList.Create;
begin
  FList := TList.Create;
end;

destructor TFuncPesqList.Destroy;
begin
  while FList.Count>0 do begin
    TObject(FList[0]).Free;
    FList.Delete(0);
  end;
  FList.Free;

  inherited;
end;

function TFuncPesqList.GetFrm: TFrmFuncPesq;
begin
  if FList.Count>0 then begin
    Result := FList[0];
    FList.Delete(0);
  end else
    Result := TFrmFuncPesq.Create(nil);
end;

procedure TFuncPesqList.ReleaseFrm(aFrm: TFrmFuncPesq);
begin
  FList.Add(aFrm);
end;

initialization
  gFuncPesqList := TFuncPesqList.Create;

finalization
  gFuncPesqList.Free;  

end.

