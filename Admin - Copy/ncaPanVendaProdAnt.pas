unit ncaPanVendaProdAnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaPanVendaProdBase, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxPCdxBarPopupMenu, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Menus,
  DB, nxdb, StdCtrls, cxButtons, cxLabel, cxCurrencyEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit,
  cxPC, cxRadioGroup, LMDPNGImage, ExtCtrls, cxButtonEdit, LMDBaseControl,
  LMDBaseGraphicControl, SpTBXFormPopupMenu, LMDBaseLabel, LMDCustomLabel, 
  ncaFrmProdPesq,
  LMDLabel, cxSpinEdit, ComCtrls, LMDCustomComponent, LMDGlobalHotKey, ncClassesBase;

type
  TFrmPanVendaProd2 = class(TFrmPanVendaProdBase)
    panInner: TLMDSimplePanel;
    panBuscaTop: TLMDSimplePanel;
    panProd: TLMDSimplePanel;
    tPro: TnxTable;
    tProID: TAutoIncField;
    tProCodigo: TStringField;
    tProDescricao: TStringField;
    tProUnid: TStringField;
    tProPreco: TCurrencyField;
    tProPodeAlterarPreco: TBooleanField;
    tProPermiteVendaFracionada: TBooleanField;
    tProEstoqueAtual: TFloatField;
    tProplus: TBooleanField;
    tProFidPontos: TIntegerField;
    tProCustoUnitario: TCurrencyField;
    tProCadastroRapido: TBooleanField;
    tProCategoria: TStringField;
    tProObs: TnxMemoField;
    tProImagem: TGraphicField;
    tProFornecedor: TIntegerField;
    tProSubCateg: TStringField;
    tProEstoqueACE: TFloatField;
    tProEstoqueACS: TFloatField;
    tProNaoControlaEstoque: TBooleanField;
    tProEstoqueMin: TFloatField;
    tProEstoqueMax: TFloatField;
    tProAbaixoMin: TBooleanField;
    tProAbaixoMinDesde: TDateTimeField;
    tProEstoqueRepor: TFloatField;
    tProplusURL: TnxMemoField;
    tProplusCodParceiro: TStringField;
    tProplusCodProduto: TStringField;
    tProAtivo: TBooleanField;
    tProFidelidade: TBooleanField;
    tPromd5Imagem: TStringField;
    tProlastProdModif: TDateTimeField;
    tProuploadR: TWordField;
    tProuploadS: TWordField;
    tProfk_produ: TIntegerField;
    tProbatchUID: TGuidField;
    tProIncluidoEm: TDateTimeField;
    DataSource1: TDataSource;
    tCodR: TnxTable;
    panQtdAbaixo: TLMDSimplePanel;
    panQtdDir: TLMDSimplePanel;
    panQtdLancar: TLMDSimplePanel;
    panQtd: TLMDSimplePanel;
    edQtd: TcxCurrencyEdit;
    lbUnidade: TcxLabel;
    panUnit: TLMDSimplePanel;
    panTotal: TLMDSimplePanel;
    btnLancar: TcxButton;
    lbSize: TcxLabel;
    popFrm: TSpTBXFormPopupMenu;
    TimerPop: TTimer;
    TimerSelectAllProd: TTimer;
    panMesa: TLMDSimplePanel;
    edMesa: TcxSpinEdit;
    lbMesa: TcxLabel;
    TimerSelectAllMesa: TTimer;
    TimerFocusProd: TTimer;
    cxLabel3: TcxLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    lbPreco: TcxLabel;
    edUnit: TcxCurrencyEdit;
    LMDSimplePanel2: TLMDSimplePanel;
    edTotal: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    edProd: TcxButtonEdit;
    imgBarcodeScan: TImage;
    panDigite: TLMDSimplePanel;
    imgSeta: TImage;
    lbDigiteProduto: TcxLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    procedure FormCreate(Sender: TObject);
    procedure btnLancarClick(Sender: TObject);
    procedure edQtdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edQtdPropertiesChange(Sender: TObject);
    procedure edQtdPropertiesEditValueChanged(Sender: TObject);
    procedure cxLabel1Click(Sender: TObject);
    procedure edUnitKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCodKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCodEnter(Sender: TObject);
    procedure edCodExit(Sender: TObject);
    procedure lbPromptProdClick(Sender: TObject);
    procedure edQtdEnter(Sender: TObject);
    procedure panQtdEnter(Sender: TObject);
    procedure panQtdExit(Sender: TObject);
    procedure panQtdDirExit(Sender: TObject);
    procedure edQtdExit(Sender: TObject);
    procedure panBuscaTopResize(Sender: TObject);
    procedure panQtdLancarResize(Sender: TObject);
    procedure edUnitEnter(Sender: TObject);
    procedure edUnitExit(Sender: TObject);
    procedure TimerPopTimer(Sender: TObject);
    procedure TimerSelectAllProdTimer(Sender: TObject);
    procedure edProdPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edProdPropertiesChange(Sender: TObject);
    procedure edProdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edProdKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure popFrmPopup(Sender: TObject);
    procedure popFrmClosePopup(Sender: TObject; Selected: Boolean);
    procedure lbCifraoUnitClick(Sender: TObject);
    procedure lbCifraoTotalClick(Sender: TObject);
    procedure edTotalEnter(Sender: TObject);
    procedure edTotalExit(Sender: TObject);
    procedure lbUnidadeClick(Sender: TObject);
    procedure edMesaPropertiesChange(Sender: TObject);
    procedure edMesaPropertiesEditValueChanged(Sender: TObject);
    procedure edMesaEnter(Sender: TObject);
    procedure edMesaExit(Sender: TObject);
    procedure TimerSelectAllMesaTimer(Sender: TObject);
    procedure lbMesaClick(Sender: TObject);
    procedure edMesaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure popFrmBeforePopup(Sender: TObject; var FormWidth,
      FormHeight: Integer);
    procedure edUnitPropertiesEditValueChanged(Sender: TObject);
    procedure edUnitPropertiesChange(Sender: TObject);
    procedure TimerFocusProdTimer(Sender: TObject);
    procedure edQtdKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lbDigiteProdutoClick(Sender: TObject);
    procedure panVendaProdResize(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    FIDProd : Integer;
    FCodStr : String;
    FLastCod  : Integer;
    FPopped : Boolean;
    FCodRepetido : Boolean;
    FPesqProd : TFrmProdPesq;
    FSaveSt : String;
    FIgnoreChange : Boolean;
    FQuant : Double;
    FUnitario : Currency;

    function CorFocus: TColor;
    
    procedure _Lancar;
    procedure SetIDProd(const Value: Integer);
    procedure SetCodStr(const Value: String);
    procedure SetPopped(const Value: Boolean);
    procedure SetQuant(const Value: Double);
    procedure SetUnitario(const Value: Currency);
  protected
    procedure SetTipoTran(const Value: Byte); override;
  
    function GetMesa: Integer; override;
    procedure SetMesa(const Value: Integer); override;
    function GetMostrarMesa: Boolean; override;
    procedure SetMostrarMesa(const Value: Boolean); override;
    procedure SetQuantCustom(const aValue: Double; aUpdateEdit: Boolean = False);
    procedure SetUnitarioCustom(const Value: Currency; UpdateEdit: Boolean);
    procedure CalcTotal;
    procedure OnRollUpFocusChange(Sender: TObject; var RollUp: Boolean);
  public
    procedure AtualizaDetalhes; 

    procedure AjustaPanQtd;

    procedure UpdateProdEdit(aSelectAll: Boolean);

    function AjustaQuantFromText(S: String): Boolean;

    procedure SetGap(aPixels: Integer); override;

    procedure Clear; override;
    procedure FocusProd; override;
    procedure FocusMesa; override;
    function CanCloseForm: Boolean; override;

    property Quant: Double
      read FQuant write SetQuant;

    property Unitario: Currency
      read FUnitario write SetUnitario;  

    property IgnoreChange: Boolean
      read FIgnoreChange;

    property Popped: Boolean
      read FPopped write SetPopped;

    property IDProd: Integer
      read FIDProd write SetIDProd;
    
    property CodStr: String
      read FCodStr write SetCodStr;
  
    { Public declarations }
  end;

var
  FrmPanVendaProd2: TFrmPanVendaProd2;

implementation

uses ncaDM, ncaFrmPri, ncErros, ncaFrmEscolhaProdDup, ncaFrmQuickCadProduto;

{$R *.dfm}

resourcestring
  SEsteProdutoNãoPermiteASuaVendaFr = 'Este produto não permite a sua venda fracionada!';
  SCustoUnitario = 'Custo Unitário';
  SPreco = 'Preço Unitário';

procedure TFrmPanVendaProd2.AjustaPanQtd;
var H: Integer;
begin
  panQtdDir.Visible := (panVendaProd.Parent.Width >= 800);
  panQtdAbaixo.Visible := not panQtdDir.Visible;
  if panQtdDir.Visible then
    panQtdLancar.Parent := panQtdDir else
    panQtdLancar.Parent := panQtdAbaixo;

  H := panBuscaTop.Height;
  if panQtdAbaixo.Visible then
    H := H + panQtdAbaixo.Height + panQtdAbaixo.Margins.Top;

  panVendaProd.Parent.Height := H;
end;

function TFrmPanVendaProd2.AjustaQuantFromText(S: String): Boolean;
var 
  I: Integer;
  D: Double;
begin
  Result := False;
  S := Trim(S);
  if Pos('*', S)<1 then Exit;
  Delete(S, Pos('*', S), 255);
  if S='' then begin
    Result := True;
    edQtd.SetFocus;
    Exit;
  end;

  if Pos(',', S)>0 then
    S[Pos(',', S)] := '.';
    
  Val(S, D, I);
  if I=0 then begin
    edQtd.Value := D;
    Result := True;
  end;
end;

procedure TFrmPanVendaProd2.AtualizaDetalhes;
begin
  btnLancar.Enabled := (FIDProd>0) and(edQtd.EditValue>0);

  if IDProd>0 then begin
    edUnit.Visible := True;
    edTotal.Visible := True;
    if TipoTran=trEstEntrada then 
      edUnit.Value := tProCustoUnitario.Value;
    lbUnidade.caption := tProUnid.value;
    lbUnidade.Visible := True;
  end else begin
    edUnit.Visible := False;

    edTotal.Visible := False;
    edUnit.Visible := False;

    edUnit.Value := 0;
    lbUnidade.Caption := '';
    lbUnidade.Visible := False;
    btnLancar.Enabled := False;
  end;
end;

procedure TFrmPanVendaProd2.btnLancarClick(Sender: TObject);
begin
  inherited;
  if not(tProPermiteVendaFracionada.value) and (frac(edQtd.Value)>0) then begin
      edQtd.Value := trunc(edQtd.Value);
      edQtd.SelectAll;
      edQtd.SetFocus;
      Raise ENexCafe.Create(SEsteProdutoNãoPermiteASuaVendaFr);
  end;

  AddProd(tProID.Value, edUnit.Value, edQtd.Value, tProDescricao.Value);

  Clear;

  edProd.SetFocus;
end;

procedure TFrmPanVendaProd2.CalcTotal;
begin
  edTotal.Value := FUnitario * FQuant;
end;

function TFrmPanVendaProd2.CanCloseForm: Boolean;
begin
  Result := not FPopped;
end;

procedure TFrmPanVendaProd2.Clear;
begin
  FIgnoreChange := True;
  try
    IDProd := 0;
    edProd.Clear;
    Quant := 1;
    Unitario := 0;
    edUnit.Clear;
    edTotal.Clear;
  finally
    FIgnoreChange := False;
  end;
end;

function TFrmPanVendaProd2.CorFocus: TColor;
begin
  Result := FrmPri.cxEditStyleController1.StyleFocused.Color;
end;

procedure TFrmPanVendaProd2.cxLabel1Click(Sender: TObject);
begin
  inherited;
  edQtd.SetFocus;
end;

procedure TFrmPanVendaProd2.edCodEnter(Sender: TObject);
begin
  inherited;
  TimerSelectAllProd.Enabled := True;
//  imgBarcodeScan.Visible := False;
  panProd.Color := CorFocus;
end;

procedure TFrmPanVendaProd2.edCodExit(Sender: TObject);
begin
  inherited;
  panProd.Color := clWhite;
//  imgBarcodeScan.Visible := (Trim(edProd.Text)='');
end;

procedure TFrmPanVendaProd2.edCodKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   i : integer;
begin
  if (Key = Key_ENTER) then begin
      if IDProd>0 then begin
          if not FCodRepetido then
            _Lancar
          else begin
             // Achou mais de um produto para este código
//             i := TFrmEscolhaProdDup.Create(self).Mostrar(edCod.EditingText);
             if (i>-1) and (tPro.Locate('ID', i, [])) then begin // do not localize
               IDProd := tProID.Value;
               _Lancar;
             end;
          end;
      end else begin
          // NAO achou prod para este código
          {$ifdef LAN}
          Exit;
          {$endif}
          Dados.tbProdD.Open;
{          if (trim(edCod.Text)<>'') and (GConfig.QuickCad) then begin
            beep;
            IDProd := TFrmQuickCadProduto.Create(Self.Handle, Self).Incluir(edCod.Text, tPro);
            if (IDProd>0) then _Lancar;
          end;}
      end;
  end;
end;

procedure TFrmPanVendaProd2.edMesaEnter(Sender: TObject);
begin
  inherited;
  panMesa.Color := CorFocus;  
  TimerSelectAllMesa.Enabled := True;
end;

procedure TFrmPanVendaProd2.edMesaExit(Sender: TObject);
begin
  inherited;
  panMesa.Color := clWhite;
end;

procedure TFrmPanVendaProd2.edMesaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = Key_ENTER) then 
    edProd.SetFocus;
end;

procedure TFrmPanVendaProd2.edMesaPropertiesChange(Sender: TObject);
begin
  inherited;
  edMesa.PostEditValue;
end;

procedure TFrmPanVendaProd2.edMesaPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if edMesa.Focused and Assigned(OnAlterouMesa) then
    OnAlterouMesa(Self);
end;

procedure TFrmPanVendaProd2.edProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  FSaveSt := edProd.EditingText;
end;

procedure TFrmPanVendaProd2.edProdKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if AjustaQuantFromText(edProd.EditingText) then begin
    edProd.Text := '';
    Exit;
  end;
  
  if (edProd.EditingText <> FSaveSt) then 
    Popped := True;
    
  if Popped and FPesqProd.cmCadRapido.Down then begin
    if (Key = Key_Enter) or (Key = Vk_Down) or (Key = Vk_Tab) then 
      FPesqProd.edCod.SetFocus;
  end else begin
    if (IDProd>0) and (Key=Key_Enter) then begin
      Popped := False;
      edProd.Text := tProDescricao.Value;
      FIgnoreChange := True;
      try
        _Lancar;
      finally
        FIgnoreChange := False;
      end;
    end else
    if Popped then
      FPesqProd.edBuscaKeyUp(Sender, Key, Shift);
  end;
end;

procedure TFrmPanVendaProd2.edProdPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  Popped := True;
end;

procedure TFrmPanVendaProd2.edProdPropertiesChange(Sender: TObject);
begin
  inherited;
  panDigite.Visible := (edProd.EditingText='');
  if edProd.Focused and (not FIgnoreChange) then
    FPesqProd.edBusca.EditValue := edProd.EditingText;
end;

procedure TFrmPanVendaProd2.edQtdEnter(Sender: TObject);
begin
  inherited;
  panQtd.Color := CorFocus;
end;

procedure TFrmPanVendaProd2.edQtdExit(Sender: TObject);
begin
  inherited;
  panQtd.Color := clWhite;
end;

procedure TFrmPanVendaProd2.edQtdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = Key_ENTER) then
  if TipoTran=trEstCompra then
    edUnit.SetFocus
  else
  if btnLancar.Enabled then
    btnLancarClick(nil);
end;

procedure TFrmPanVendaProd2.edQtdKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = Key_Enter) then begin
    if btnLancar.Enabled then
      _Lancar else
      edProd.SetFocus;
  end;
end;

procedure TFrmPanVendaProd2.edQtdPropertiesChange(Sender: TObject);
begin
  inherited;
  edQtd.PostEditValue;
end;

procedure TFrmPanVendaProd2.edQtdPropertiesEditValueChanged(Sender: TObject);
var W: Integer;
begin
  lbSize.Caption := edQtd.EditingText;
  W := lbSize.Width+25+lbUnidade.Width;
  if W>120 then
    panQtd.Width := W else
    panQtd.Width := 120;
  if edQtd.EditValue<>null then
    SetQuantCustom(edQtd.EditValue, False) else
    SetQuantCustom(0, False);

  btnLancar.Enabled := (IDProd>0) and (edQtd.EditValue>0);
end;

procedure TFrmPanVendaProd2.edTotalEnter(Sender: TObject);
begin
  inherited;
  panTotal.Color := CorFocus;
end;

procedure TFrmPanVendaProd2.edTotalExit(Sender: TObject);
begin
  inherited;
  panTotal.Color := clWhite;
end;

procedure TFrmPanVendaProd2.edUnitEnter(Sender: TObject);
begin
  inherited;
  panUnit.Color := CorFocus;
end;

procedure TFrmPanVendaProd2.edUnitExit(Sender: TObject);
begin
  inherited;
  panUnit.Color := clWhite;
end;

procedure TFrmPanVendaProd2.edUnitKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = Key_ENTER) and btnLancar.Enabled then 
    btnLancarClick(nil);
end;

procedure TFrmPanVendaProd2.edUnitPropertiesChange(Sender: TObject);
begin
  inherited;
  edUnit.PostEditValue;
end;

procedure TFrmPanVendaProd2.edUnitPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if edUnit.EditValue=null then
    SetUnitarioCustom(0, False) else
    SetUnitarioCustom(edUnit.EditValue, False);
end;

procedure TFrmPanVendaProd2.FocusMesa;
begin
  inherited;
  if MostrarMesa then
    edMesa.SetFocus;
end;

procedure TFrmPanVendaProd2.FocusProd;
begin
  inherited;
  edProd.SetFocus;
end;

procedure TFrmPanVendaProd2.FormCreate(Sender: TObject);
begin
  inherited;
  FIgnoreChange := False;
  FSaveSt := '';
  FPesqProd := TFrmProdPesq.Create(Self);
  popFrm.PopupForm := FPesqProd;
  popFrm.OnRollUpFocusChange := OnRollUpFocusChange;
  FIDProd := 0;
  FQuant := 1;
  FPopped := False;
  FCodStr := '';
  FLastCod := -1;
  FCodRepetido := False;
  FCodStr := '';
end;

procedure TFrmPanVendaProd2.FormResize(Sender: TObject);
begin
  inherited;
  AjustaPanQtd;
end;

function TFrmPanVendaProd2.GetMesa: Integer;
begin
  Result := edMesa.Value;
end;

function TFrmPanVendaProd2.GetMostrarMesa: Boolean;
begin
  Result := panMesa.Visible;
end;

procedure TFrmPanVendaProd2.lbCifraoTotalClick(Sender: TObject);
begin
  inherited;
  edTotal.Setfocus;
end;

procedure TFrmPanVendaProd2.lbCifraoUnitClick(Sender: TObject);
begin
  inherited;
  edUnit.SetFocus;
end;

procedure TFrmPanVendaProd2.lbDigiteProdutoClick(Sender: TObject);
begin
  inherited;
  edProd.SetFocus;
end;

procedure TFrmPanVendaProd2.lbPromptProdClick(Sender: TObject);
begin
  inherited;
  edProd.SetFocus;
end;

procedure TFrmPanVendaProd2.lbMesaClick(Sender: TObject);
begin
  inherited;
  edMesa.SetFocus;
end;

procedure TFrmPanVendaProd2.lbUnidadeClick(Sender: TObject);
begin
  inherited;
  edQtd.SetFocus
end;

procedure TFrmPanVendaProd2.OnRollUpFocusChange(Sender: TObject;
  var RollUp: Boolean);
begin
  RollUp := not edProd.Focused;
end;

procedure TFrmPanVendaProd2.panQtdEnter(Sender: TObject);
begin
  inherited;
  panQtd.Color := $00B3FFFF;
end;

procedure TFrmPanVendaProd2.panQtdExit(Sender: TObject);
begin
  inherited;
  panQtd.Color := clWhite;
end;

procedure TFrmPanVendaProd2.panQtdLancarResize(Sender: TObject);
begin
  inherited;
  btnLancar.Left := panQtdLancar.Width-btnLancar.Width-1;
end;

procedure TFrmPanVendaProd2.panVendaProdResize(Sender: TObject);
begin
  inherited;
  AjustaPanQtd;
end;

procedure TFrmPanVendaProd2.popFrmBeforePopup(Sender: TObject; var FormWidth,
  FormHeight: Integer);
begin
  inherited;
  FPesqProd.edBusca.EditValue := edProd.Text;
  FPesqProd.edBuscaPropertiesChange(nil);
end;

procedure TFrmPanVendaProd2.popFrmClosePopup(Sender: TObject;
  Selected: Boolean);
begin
  inherited;
  FPopped := False;
  edProd.Style.Color := clWhite;
end;

procedure TFrmPanVendaProd2.popFrmPopup(Sender: TObject);
begin
  inherited;
  FPopped := True;
  edProd.Style.Color := edProd.StyleFocused.Color;
end;

procedure TFrmPanVendaProd2.panBuscaTopResize(Sender: TObject);
begin
  inherited;
  AjustaPanQtd;
end;

procedure TFrmPanVendaProd2.panQtdDirExit(Sender: TObject);
begin
  inherited;
  panUnit.Color := clWhite;
end;

procedure TFrmPanVendaProd2.SetCodStr(const Value: String);
begin
  if FCodStr = Value then Exit;
  FCodStr := Value;
  if FCodStr>'' then begin
    tCodR.SetRange([FCodStr], [FCodStr]);
    FCodRepetido := (tCodR.RecordCount>1);
  end;
end;

procedure TFrmPanVendaProd2.SetGap(aPixels: Integer);
begin
  panQtdAbaixo.Margins.Top := aPixels;
  panQtdDir.Margins.Left := aPixels;
  AjustaPanQtd;
end;

procedure TFrmPanVendaProd2.SetIDProd(const Value: Integer);
begin
  if Value=FIDProd then Exit;
  FIDProd := Value;
  if FIDProd>0 then begin
    tPro.Locate('ID', FIDProd, []);
    CodStr := tProCodigo.Value;
    //MostrarUnit := ((FME.Tipo=trEstVenda) and tProPodeAlterarPreco.Value) or (FME.Tipo=trEstCompra);
    case TipoTran of
      trEstVenda : begin
        Unitario := tProPreco.Value;
        edUnit.Properties.ReadOnly := not tProPodeAlterarPreco.Value;
      end;
      trEstCompra : begin
        Unitario := tProCustoUnitario.Value;
        edUnit.Properties.ReadOnly := False;
      end
    else
      edUnit.Value := 0;
    end;
  end else
    CodStr := '';
  AtualizaDetalhes;  
end;

procedure TFrmPanVendaProd2.SetMesa(const Value: Integer);
begin
  edMesa.Value := Value;
end;

procedure TFrmPanVendaProd2.SetMostrarMesa(const Value: Boolean);
begin
  panMesa.Visible := Value;
end;

procedure TFrmPanVendaProd2.SetPopped(const Value: Boolean);
begin
  if Value = FPopped then Exit;
  if Value then 
    TimerPop.Enabled := True else
    popFrm.ClosePopup(False);
end;

procedure TFrmPanVendaProd2.SetQuant(const Value: Double);
begin
  SetQuantCustom(Value, True);
end;

procedure TFrmPanVendaProd2.SetQuantCustom(const aValue: Double; aUpdateEdit: Boolean);
begin
  if FQuant=aValue then Exit;
  FQuant := aValue;
  if aUpdateEdit then
    edQtd.Value := FQuant;
  CalcTotal;
end;

procedure TFrmPanVendaProd2.SetTipoTran(const Value: Byte);
begin
  inherited;
  case Value of
    trEstVenda: begin
      panUnit.Visible := True;
      panTotal.Visible := True;
      lbPreco.Caption := SPreco;
    end;
    
    trEstCompra: begin
      panUnit.Visible := True;
      panTotal.Visible := True;
      lbPreco.Caption := SCustoUnitario;
    end;
    trEstEntrada,
    trEstSaida: begin
      panUnit.Visible := False;
      panTotal.Visible := False;
    end;
  end;
end;

procedure TFrmPanVendaProd2.SetUnitario(const Value: Currency);
begin
  SetUnitarioCustom(Value, True);
end;

procedure TFrmPanVendaProd2.SetUnitarioCustom(const Value: Currency;
  UpdateEdit: Boolean);
begin
  if FUnitario=Value then Exit;
  FUnitario := Value;
  if UpdateEdit then
    edUnit.Value := FUnitario;
  CalcTotal;
end;

procedure TFrmPanVendaProd2.TimerFocusProdTimer(Sender: TObject);
begin
  inherited;
  TimerFocusProd.Enabled := False;
  edProd.SetFocus;
end;

procedure TFrmPanVendaProd2.TimerPopTimer(Sender: TObject);
var P : TPoint;
begin
  TimerPop.Enabled := False;
  P.X := 0;
  P.Y := panProd.Height;
  P := imgBarCodeScan.ClientToScreen(P);
  popFrm.Popup(P.X-1, P.Y-2);
end;

procedure TFrmPanVendaProd2.TimerSelectAllMesaTimer(Sender: TObject);
begin
  inherited;
  TimerSelectAllMesa.Enabled := False;
  if edMesa.Focused then
    edMesa.SelectAll;
end;

procedure TFrmPanVendaProd2.TimerSelectAllProdTimer(Sender: TObject);
begin
  inherited;
  TimerSelectAllProd.Enabled := False;
  edProd.SelectAll;
end;

procedure TFrmPanVendaProd2.UpdateProdEdit(aSelectAll: Boolean);
begin
  FIgnoreChange := True;
  try
    edProd.Text := FPesqProd.TabDescricao.Value;
  
    if aSelectAll then TimerSelectAllProd.Enabled := True;
  finally
    FIgnoreChange := False;
  end;
end;

procedure TFrmPanVendaProd2._Lancar;
begin
  if btnLancar.Enabled then begin
    if (TipoTran in [trEstCompra, trEstEntrada]) and (not edQtd.Focused) then
      edQtd.SetFocus
    else  
    if (TipoTran=trEstVenda) and tProPodeAlterarPreco.Value then 
      edUnit.SetFocus 
    else
      btnLancarClick(nil);
  end else begin
    if IDProd=0 then
      edProd.SetFocus
    else
    if edQtd.EditValue<0.001 then
      edQtd.SetFocus;
  end;
end;

initialization
  DefPanVendaProdClass := TFrmPanVendaProd2;

end.
