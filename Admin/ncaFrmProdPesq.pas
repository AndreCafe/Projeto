unit ncaFrmProdPesq;
{
    ResourceString: Dario 11/03/13
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
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, cxNavigator,
  dxPScxPivotGridLnk, uNexTransResourceStrings_PT, cxButtons, ImgList, cxImage,
  cxDBEdit, LMDPNGImage, cxPCdxBarPopupMenu, cxPC;

type
  TFrmProdPesq = class(TForm)
    Tab: TnxTable;
    dsTab: TDataSource;
    PopupMenu1: TPopupMenu;
    TimerSync: TTimer;
    TabID: TAutoIncField;
    TabCodigo: TStringField;
    TabDescricao: TStringField;
    TabUnid: TStringField;
    TabPreco: TCurrencyField;
    TabObs: TnxMemoField;
    TabImagem: TGraphicField;
    TabCategoria: TStringField;
    TabFornecedor: TIntegerField;
    TabSubCateg: TStringField;
    TabEstoqueAtual: TFloatField;
    TabCustoUnitario: TCurrencyField;
    TabEstoqueACE: TFloatField;
    TabEstoqueACS: TFloatField;
    TabPodeAlterarPreco: TBooleanField;
    TabPermiteVendaFracionada: TBooleanField;
    TabNaoControlaEstoque: TBooleanField;
    TabEstoqueMin: TFloatField;
    TabEstoqueMax: TFloatField;
    TabAbaixoMin: TBooleanField;
    TabAbaixoMinDesde: TDateTimeField;
    TabEstoqueRepor: TFloatField;
    Tabplus: TBooleanField;
    TabplusURL: TnxMemoField;
    TabplusCodParceiro: TStringField;
    TabplusCodProduto: TStringField;
    TabAtivo: TBooleanField;
    TabFidelidade: TBooleanField;
    TabFidPontos: TIntegerField;
    Tabmd5Imagem: TStringField;
    TablastProdModif: TDateTimeField;
    TabuploadR: TWordField;
    TabuploadS: TWordField;
    Tabfk_produ: TIntegerField;
    TabbatchUID: TGuidField;
    TabCadastroRapido: TBooleanField;
    TabIncluidoEm: TDateTimeField;
    panPri: TLMDSimplePanel;
    edBusca: TcxMaskEdit;
    BarMgr: TdxBarManager;
    cmCadRapido: TdxBarLargeButton;
    styleRep: TcxStyleRepository;
    cxsVermelho: TcxStyle;
    cxsVerde: TcxStyle;
    cmBuscando: TdxBarLargeButton;
    cxImageList1: TcxImageList;
    cxsNegrito: TcxStyle;
    dsProdD: TDataSource;
    tAux: TnxTable;
    tAuxCodigo: TStringField;
    Paginas: TcxPageControl;
    tsBusca: TcxTabSheet;
    LMDSimplePanel1: TLMDSimplePanel;
    cxDBImage1: TcxDBImage;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVCodigo: TcxGridDBColumn;
    TVDescricao: TcxGridDBColumn;
    TVUnid: TcxGridDBColumn;
    TVPreco: TcxGridDBColumn;
    TVImagem: TcxGridDBColumn;
    TVCategoria: TcxGridDBColumn;
    TVFornecedor: TcxGridDBColumn;
    TVEstoqueAtual: TcxGridDBColumn;
    TVCustoUnitario: TcxGridDBColumn;
    TVFor: TcxGridDBTableView;
    TVForNome: TcxGridDBColumn;
    GL: TcxGridLevel;
    tsCadRapido: TcxTabSheet;
    panCadRapido: TLMDSimplePanel;
    btnSalvar: TcxButton;
    LMDSimplePanel2: TLMDSimplePanel;
    cxLabel4: TcxLabel;
    edCod: TcxTextEdit;
    LMDSimplePanel3: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    edDescr: TcxTextEdit;
    LMDSimplePanel4: TLMDSimplePanel;
    cxLabel2: TcxLabel;
    edPreco: TcxCurrencyEdit;
    cxLabel3: TcxLabel;
    panImagem: TLMDSimplePanel;
    cxDBImage2: TcxDBImage;
    cbUsarImagem: TcxCheckBox;
    cxLabel5: TcxLabel;
    procedure edBuscaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edBuscaPropertiesChange(Sender: TObject);
    procedure TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridEnter(Sender: TObject);
    procedure GridExit(Sender: TObject);

    procedure TimerSyncTimer(Sender: TObject);
    procedure TVDblClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmCadRapidoClick(Sender: TObject);
    procedure TVCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cmConfigClick(Sender: TObject);
    procedure TVCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btnSalvarClick(Sender: TObject);
    procedure edCodPropertiesChange(Sender: TObject);
    procedure edCodPropertiesEditValueChanged(Sender: TObject);
    procedure TVCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure edCodKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edDescrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSalvarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    
  private
    { Private declarations }
    FEntrou : Boolean;
    FIgnoreChange : Boolean;
    FNewCod : String;
    FQuickCadStatus : Byte; //  0 - nao achou produto, 1 - achou, 2 - achou mas usuário alterou
    FRecCount : Integer;
    FAchouPorDescr: Boolean;
    FAchouParcial: Boolean;

    function ECodigo(S: String): Boolean;
   
    procedure MostrarCadRapido(aMostrar: Boolean);
    procedure ClearCadRapido;

    procedure TryQuickCad;

    procedure wmAtualizaDireitosConfig(var Msg: TMessage);
      message wm_atualizadireitosconfig;
  public
    procedure Reset;

    function InCadRapido: Boolean;

    procedure AtualizaDireitos;

    property RecCount: Integer read FRecCount;

    property AchouPorDescr: Boolean
      read FAchouPorDescr;

    property AchouParcial: Boolean
      read FAchouParcial;  

    property IgnoreChange: Boolean
      read FIgnoreChange write FIgnoreChange;

  end;

resourcestring
  SOpcoesCadRapido = 'Opções para cadastro rápido de produtos';

var
  FrmProdPesq: TFrmProdPesq;

implementation

uses ncaDM, 
  ufmImagens, 
  ncaFrmPri, 
  ncIDRecursos, 
  ncaPanVendaProd2,
  ncaFrmProduto, ncaFrmOpcoes, ncaFrmConfigQuickCad, ncaFrmConfigAutoCad;

// START resource string wizard section
// MMX resource string wizard section REMOVIDA - 08/04/13 12:30


{$R *.dfm}

procedure TFrmProdPesq.GridEnter(Sender: TObject);
begin
  FEntrou := True;
//  TFrmPanVendaProd2(Owner).TimerFocusProd.Enabled := True;
end;

procedure TFrmProdPesq.GridExit(Sender: TObject);
begin
  FEntrou := False;
end;

function TFrmProdPesq.InCadRapido: Boolean;
begin
  Result := (Paginas.ActivePageIndex=1);
end;

procedure TFrmProdPesq.MostrarCadRapido(aMostrar: Boolean);
begin
  if (cmCadRapido.Visible=ivNever) then aMostrar := False;

  Paginas.ActivePageIndex := Integer(aMostrar);  
end;

procedure TFrmProdPesq.Reset;
begin
  if Tab.active then begin
    FAchouPorDescr := False;
    FAchouParcial := False;
    Tab.DisableControls;
    try
      edBusca.Clear;
      Tab.IndexName := 'IDescricao';
      Tab.CancelRange;
      Tab.First;
    finally
      Tab.EnableControls;
    end;
  end;
end;

procedure TFrmProdPesq.btnSalvarClick(Sender: TObject);
begin
  Tab.CancelRange;
  
  Tab.Insert;
  TabCodigo.Value := edCod.Text;
  TabDescricao.Value := edDescr.Text;
  TabPreco.Value := edPreco.Value;
  TabCadastroRapido.Value := True;
  if panImagem.Visible and cbUsarImagem.Checked then
    TabImagem.Value := Dados.tbProdDImagem.Value;
  Tab.Post;

  {$ifdef LOJA}
  FrmPri.refreshRevisarCadProduto;
  {$endif} 

  MostrarCadRapido(False);

  TFrmPanVendaProd2(Owner).IDProd := TabID.Value;
  TFrmPanVendaProd2(Owner).Popped := False;
  TimerSync.Enabled := True;
end;

procedure TFrmProdPesq.btnSalvarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_UP then edPreco.SetFocus;
end;

procedure TFrmProdPesq.ClearCadRapido;
begin
  edCod.Text := '';
  edDescr.Text := '';
  edPreco.Clear;
  FQuickCadStatus := 0;
end;

procedure TFrmProdPesq.cmCadRapidoClick(Sender: TObject);
begin
  MostrarCadRapido(cmCadRapido.Down);
  if panCadRapido.Visible  then
    edCod.SetFocus;
end;

procedure TFrmProdPesq.cmConfigClick(Sender: TObject);
begin
  TFrmOpcoes.Create(Self).Editar(SOpcoesCadRapido, [TFrmConfigQuickCad, TFrmConfigAutocad], True);
end;

procedure TFrmProdPesq.cmEditarClick(Sender: TObject);
begin
  if Tab.IsEmpty then Exit;
  TFrmProduto.Create(Self).Editar(Tab);  
end;

function TFrmProdPesq.ECodigo(S: String): Boolean;
begin
  tAux.FindNearest([S]);
  Result := (not tAux.IsEmpty) and SameTextSemAcento(Copy(tAuxCodigo.Value, 1, Length(S)), S);
end;

procedure TFrmProdPesq.edBuscaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_UP : begin
      Tab.Prior;
      with TFrmPanVendaProd2(Owner) do begin
        Popped := True;
        IDProd := TabID.Value;
        UpdateProdEdit(True);
      end;
    end;
    VK_Down : begin
      Tab.Next;
      with TFrmPanVendaProd2(Owner) do begin
        Popped := True;
        IDProd := TabID.Value;     
        UpdateProdEdit(True);
      end;
    end;
    VK_Return : begin
      TFrmPanVendaProd2(Owner).Popped := False;
      TimerSync.Enabled := True;
    end;
    VK_Escape : begin
//      TFrmCli(Owner).pmCli.ClosePopup(True);
    end;
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

function SoTemDig(S: String): Boolean;
var I : Integer;
begin
  Result := False;
  for I := 1 to Length(S) do
    if not (S[I] in ['0'..'9']) then Exit;
  Result := True;
end;

procedure TFrmProdPesq.edBuscaPropertiesChange(Sender: TObject);
var I : Integer;
begin
  if TFrmPanVendaProd2(Owner).IgnoreChange then Exit;

  if ECodigo(edBusca.Text) then 
    Tab.IndexName := 'ICodigo' else
    Tab.IndexName := 'IDescricao';

  Tab.SetRange([edBusca.text], [edBusca.Text + 'zzzzzzzzzzzzzzzzzzzzzz']); // do not localize
  I := Tab.RecordCount;
  FRecCount := I;
  if edBusca.Text>'' then begin
    MostrarCadRapido((I=0));
    ClearCadRapido;
    if I=0 then begin
//      cmBuscando.Style := cxsNegrito;
      if SoTemDig(edBusca.Text) then
        edCod.Text := Trim(edBusca.Text) else
        edDescr.Text := Trim(edBusca.Text);
      cmBuscando.LargeImageIndex := 1;
      cmBuscando.Caption := 'Nenhum produto encontrado com ' + cmBuscando.Caption;
    end else begin
      if SameText('ICodigo', Tab.IndexName) then begin
        FAchouPorDescr := False;
        FAchouParcial := (FRecCount>0) and (not SameText(edBusca.Text, TabCodigo.Value));
      end else begin
        FQuickCadStatus := 0;
        FAchouPorDescr := True;
        FAchouParcial := (FRecCount>0) and (not SameText(edBusca.Text, TabDescricao.Value));
      end;
      cmBuscando.LargeImageIndex := 0;
//      cmBuscando.Style := cxsNegrito;
      if I>1 then
        cmBuscando.Caption := IntToStr(I) + ' produtos encontrados com ' + cmBuscando.Caption else
        cmBuscando.Caption := IntToStr(I) + ' produto encontrado com ' + cmBuscando.Caption;
    end;
  end else begin
    FRecCount := 0;
    FAchouParcial := False;
    FAchouPorDescr := False;
    ClearCadRapido;
    MostrarCadRapido(False);
    cmBuscando.LargeImageIndex := 2;
    cmBuscando.Style := nil;
    cmBuscando.Caption := IntToStr(I) + ' produtos';
  end;
end;

procedure TFrmProdPesq.edCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_DOWN, KEY_Enter : edDescr.SetFocus;
    VK_UP : TFrmPanVendaProd2(Owner).TimerFocusProd.Enabled := True;
  end;
end;

procedure TFrmProdPesq.edCodPropertiesChange(Sender: TObject);
begin
  edCod.PostEditValue;
end;

procedure TFrmProdPesq.edCodPropertiesEditValueChanged(Sender: TObject);
begin
  TryQuickCad;
end;

procedure TFrmProdPesq.edDescrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_DOWN, KEY_Enter : edPreco.SetFocus;
    VK_UP : edCod.SetFocus;
  end;
end;

procedure TFrmProdPesq.edPrecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_DOWN, KEY_Enter : btnSalvar.SetFocus;
    VK_UP : edDescr.SetFocus;
  end;
end;

procedure TFrmProdPesq.FormCreate(Sender: TObject);
begin
  FIgnoreChange := False;
  FRecCount := 0;
  FAchouPorDescr := False;
  FAchouParcial := False;
  FEntrou := False;
  TV.OptionsView.Indicator := False;
  AtualizaDireitos;
end;

procedure TFrmProdPesq.TimerSyncTimer(Sender: TObject);
begin
  TimerSync.Enabled := False;
  with TFrmPanVendaProd2(Owner) do 
  if (edProd.Text='') and edProd.Focused then
    IDProd := 0 
  else begin
    IDProd := TabID.Value;
    UpdateProdEdit(True);
  end;
end;

procedure TFrmProdPesq.TryQuickCad;
begin
  if (not gConfig.QuickCad) or (FQuickCadStatus>1) then Exit;
  with Dados do begin
    tbProdD.Active := True;
    if tbProdD.FindKey([edCod.Text]) then begin
      edDescr.Text := tbProdDDescricao.Value;
      FQuickCadStatus := 1;
      panImagem.Visible := not tbProdDImagem.IsNull;
      cbUsarImagem.Enabled := True;
    end;
  end;
end;

procedure TFrmProdPesq.TVCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
      with TFrmPanVendaProd2(Owner) do begin
        IDProd := TabID.Value;     
        UpdateProdEdit(True);
      end;

end;

procedure TFrmProdPesq.TVCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Selected then begin
    ACanvas.Brush.Color := clHighlight;
    ACanvas.Font.Color := clHighlightText;
  end;
end;

procedure TFrmProdPesq.TVCustomDrawColumnHeader(Sender: TcxGridTableView;
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

procedure TFrmProdPesq.TVDblClick(Sender: TObject);
begin
  with TFrmPanVendaProd2(Owner) do begin
    IDProd := Self.TabID.Value;
    Popped := False;
    FIgnoreChange := True;
    try
      edProd.Text := tProDescricao.Value;
      _Lancar;
    finally
      FIgnoreChange := False;
    end;
  end;
end;

procedure TFrmProdPesq.TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  with TFrmPanVendaProd2(Owner) do 
  if FEntrou or (edProd.Text>'') then begin
    IDProd := TabID.Value;
    if FEntrou and (not edProd.Focused) then TimerSync.Enabled := True;
  end else
  if edProd.Focused and (edProd.Text='') then 
    IDProd := 0;

  with TFrmPanVendaProd2(Owner) do
    if not edProd.Focused then 
      TimerFocusProd.Enabled := True;

end;
                                     
procedure TFrmProdPesq.wmAtualizaDireitosConfig(var Msg: TMessage);
begin
  AtualizaDireitos;
end;

procedure TFrmProdPesq.AtualizaDireitos;
begin
  if Tab.Active then Tab.Refresh;
  if gConfig.QuickCad then
    cmCadRapido.Visible := ivAlways else
    cmCadRapido.Visible := ivNever;
    
//  cmConfig.Enabled := Dados.CM.UA.Admin;
end;

end.

